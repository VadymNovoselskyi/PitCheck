#!/usr/bin/env python3
"""One-time importer for the FSG26 Electric inspection check points.

Only numbered points marked with the ordinary `○` symbol are imported.
Source item numbers are used in stable IDs and to preserve source order; they
are not stored in the imported point name or description.

Dry run:
    python3 scripts/import_fsg26_check_points.py

Write to Firestore:
    firebase login --reauth
    python3 scripts/import_fsg26_check_points.py --execute
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import sys
import subprocess
import urllib.error
import urllib.request
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


PROJECT_ID = "scrutineering-app"
DATABASE_ID = "(default)"
SHEET_ID = "O3SjwZ2QW7Ab9RIEdsG8"
SOURCE_PATH = Path(__file__).resolve().parents[1] / "docs/inspection-sheets/FSG26_InspectionSheet_EV_v20260713.md"

PART_TO_CATEGORY = {
    "II": "preInspection",
    "III": "egress",
    "IV": "accumulator",
    "V": "electrical",
    "VI": "mech",
    "VII": "rain",
    "VIII": "brake",
}

PART_RE = re.compile(r"^## PART ([IVX]+): (.+)$")
SUBCATEGORY_RE = re.compile(r"^### □ (.+)$")
POINT_RE = re.compile(r"^- \[ \] \*\*(\d+) ○\*\* (.+)$")


@dataclass(frozen=True)
class ImportedPoint:
    source_number: int
    name: str
    description: str


@dataclass(frozen=True)
class ImportedSubcategory:
    name: str
    points: tuple[ImportedPoint, ...]


@dataclass(frozen=True)
class ImportedCategory:
    type_name: str
    source_part: str
    name: str
    subcategories: tuple[ImportedSubcategory, ...]


def parse_source(path: Path) -> tuple[ImportedCategory, ...]:
    current_part: str | None = None
    current_category: ImportedCategory | None = None
    current_subcategory_name: str | None = None
    current_points: list[ImportedPoint] = []
    categories: list[ImportedCategory] = []

    def finish_subcategory() -> None:
        nonlocal current_subcategory_name, current_points, current_category
        if (
            current_subcategory_name is None
            or current_category is None
            or not current_points
        ):
            current_subcategory_name = None
            current_points = []
            return
        current_category = ImportedCategory(
            type_name=current_category.type_name,
            source_part=current_category.source_part,
            name=current_category.name,
            subcategories=current_category.subcategories
            + (ImportedSubcategory(current_subcategory_name, tuple(current_points)),),
        )
        current_subcategory_name = None
        current_points = []

    def finish_category() -> None:
        nonlocal current_category
        finish_subcategory()
        if current_category is not None:
            categories.append(current_category)
        current_category = None

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        part_match = PART_RE.match(raw_line)
        if part_match:
            finish_category()
            roman_part, category_title = part_match.groups()
            category_type = PART_TO_CATEGORY.get(roman_part)
            if category_type is None:
                current_part = None
                continue
            current_part = roman_part
            current_category = ImportedCategory(
                type_name=category_type,
                source_part=roman_part,
                name=category_title,
                subcategories=(),
            )
            continue

        if current_category is None or current_part is None:
            continue

        subcategory_match = SUBCATEGORY_RE.match(raw_line)
        if subcategory_match:
            finish_subcategory()
            current_subcategory_name = subcategory_match.group(1).strip()
            continue

        point_match = POINT_RE.match(raw_line)
        if point_match and current_subcategory_name is not None:
            source_number = int(point_match.group(1))
            source_text = point_match.group(2).strip()
            if " - " in source_text:
                name, description = source_text.split(" - ", 1)
                name = name.strip()
                description = description.strip()
            else:
                name = source_text
                description = ""
            current_points.append(ImportedPoint(source_number, name, description))

    finish_category()
    return tuple(categories)


def timestamp_value(timestamp: str) -> dict[str, str]:
    return {"timestampValue": timestamp}


def string_value(value: str | None) -> dict[str, str | None]:
    if value is None:
        return {"nullValue": None}
    return {"stringValue": value}


def integer_value(value: int) -> dict[str, str]:
    return {"integerValue": str(value)}


def document_name(path: str) -> str:
    return f"projects/{PROJECT_ID}/databases/{DATABASE_ID}/documents/{path}"


def audit_fields(actor_id: str, actor_name: str, timestamp: str) -> dict[str, Any]:
    return {
        "createdById": string_value(actor_id),
        "createdByName": string_value(actor_name),
        "createdAt": timestamp_value(timestamp),
        "updatedById": string_value(actor_id),
        "updatedByName": string_value(actor_name),
        "updatedAt": timestamp_value(timestamp),
    }


def update(path: str, fields: dict[str, Any]) -> dict[str, Any]:
    return {"update": {"name": document_name(path), "fields": fields}}


def subcategory_document_id(category_id: str, name: str) -> str:
    """Build a stable subcategory ID that is unique across categories."""
    name_slug = re.sub(r"[^a-z0-9]+", "_", name.lower()).strip("_")
    if not name_slug:
        raise RuntimeError(f"Cannot create a stable ID for subcategory {name!r}.")
    return f"{category_id}_{name_slug}"


def point_document_id(subcategory_id: str, source_number: int) -> str:
    """Build a stable point ID from its stable subcategory and source number."""
    return f"{subcategory_id}_p{source_number:03d}"


def build_writes(
    categories: tuple[ImportedCategory, ...],
    actor_id: str,
    actor_name: str,
    timestamp: str,
) -> list[dict[str, Any]]:
    writes: list[dict[str, Any]] = []
    audit = audit_fields(actor_id, actor_name, timestamp)

    for category_order, category in enumerate(categories):
        category_id = category.type_name
        category_fields = {
            "inspectionSheetId": string_value(SHEET_ID),
            "type": string_value(category.type_name),
            "order": integer_value(category_order),
            "archivedAt": string_value(None),
            "audit": {"mapValue": {"fields": audit}},
        }
        writes.append(update(f"inspectionSheets/{SHEET_ID}/categories/{category_id}", category_fields))

        for subcategory_order, subcategory in enumerate(category.subcategories):
            subcategory_id = subcategory_document_id(category_id, subcategory.name)
            subcategory_fields = {
                "inspectionCategoryId": string_value(category_id),
                "name": string_value(subcategory.name),
                "description": string_value(""),
                "order": integer_value(subcategory_order),
                "archivedAt": string_value(None),
                "audit": {"mapValue": {"fields": audit}},
            }
            subcategory_path = (
                f"inspectionSheets/{SHEET_ID}/categories/{category_id}/"
                f"subcategories/{subcategory_id}"
            )
            writes.append(update(subcategory_path, subcategory_fields))

            for point_order, point in enumerate(subcategory.points):
                point_id = point_document_id(subcategory_id, point.source_number)
                point_fields = {
                    "subcategoryId": string_value(subcategory_id),
                    "name": string_value(point.name),
                    "description": string_value(point.description),
                    "order": integer_value(point_order),
                    "archivedAt": string_value(None),
                    "audit": {"mapValue": {"fields": audit}},
                }
                point_path = f"{subcategory_path}/points/{point_id}"
                writes.append(update(point_path, point_fields))

    return writes


def firestore_request(method: str, url: str, access_token: str, body: Any = None) -> Any:
    payload = None if body is None else json.dumps(body).encode("utf-8")
    request = urllib.request.Request(
        url,
        data=payload,
        method=method,
        headers={
            "Authorization": f"Bearer {access_token}",
            "Content-Type": "application/json",
        },
    )
    try:
        with urllib.request.urlopen(request) as response:
            response_body = response.read().decode("utf-8")
            return json.loads(response_body) if response_body else None
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"Firestore request failed ({error.code}): {detail}") from error


def firebase_cli_access_token() -> str:
    """Get a short-lived Google access token from the Firebase CLI login."""
    firebase_executable = shutil.which("firebase")
    node_executable = shutil.which("node")
    if not firebase_executable or not node_executable:
        raise RuntimeError(
            "Firebase CLI and Node.js are required for --execute. "
            "Run 'firebase login --reauth' and try again."
        )

    firebase_entrypoint = Path(firebase_executable).resolve()
    package_root = next(
        (
            parent
            for parent in firebase_entrypoint.parents
            if (parent / "package.json").is_file()
            and json.loads((parent / "package.json").read_text()).get("name") == "firebase-tools"
        ),
        None,
    )
    if package_root is None:
        raise RuntimeError("Could not locate the installed Firebase CLI package.")

    auth_module = package_root / "lib" / "auth.js"
    scopes_module = package_root / "lib" / "scopes.js"
    node_script = """
const auth = require(process.argv[1]);
const scopes = require(process.argv[2]);
(async () => {
  const account = auth.getGlobalDefaultAccount();
  const refreshToken = account && account.tokens && account.tokens.refresh_token;
  if (!refreshToken) throw new Error('No Firebase CLI login found.');
  const token = await auth.getAccessToken(refreshToken, [scopes.CLOUD_PLATFORM]);
  if (!token || !token.access_token) throw new Error('Firebase CLI did not return an access token.');
  process.stdout.write(token.access_token);
})().catch((error) => {
  process.stderr.write(error.message || String(error));
  process.exitCode = 1;
});
"""
    result = subprocess.run(
        [node_executable, "-e", node_script, str(auth_module), str(scopes_module)],
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode != 0 or not result.stdout.strip():
        detail = result.stderr.strip() or "Firebase CLI authentication failed."
        raise RuntimeError(
            f"{detail} Run 'firebase login --reauth' and try again."
        )
    return result.stdout.strip()


def ensure_target_is_ready(access_token: str) -> None:
    url = (
        f"https://firestore.googleapis.com/v1/projects/{PROJECT_ID}/databases/"
        f"{DATABASE_ID}/documents/inspectionSheets/{SHEET_ID}"
    )
    request = urllib.request.Request(
        url,
        method="GET",
        headers={"Authorization": f"Bearer {access_token}"},
    )
    try:
        with urllib.request.urlopen(request) as response:
            sheet = json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        if error.code == 404:
            raise RuntimeError(f"Target sheet {SHEET_ID!r} does not exist.") from error
        raise RuntimeError(f"Could not check import target ({error.code}): {detail}") from error

    fields = sheet.get("fields", {})
    competition_name = fields.get("competitionName", {}).get("stringValue")
    year = fields.get("year", {}).get("integerValue")
    if competition_name not in {"FSG", "Formula Student Germany"} or year != "2026":
        raise RuntimeError(
            f"Target sheet metadata does not match FSG 2026: "
            f"competitionName={competition_name!r}, year={year!r}."
        )

    categories_url = (
        f"https://firestore.googleapis.com/v1/projects/{PROJECT_ID}/databases/"
        f"{DATABASE_ID}/documents/inspectionSheets/{SHEET_ID}/categories?pageSize=100"
    )
    categories_request = urllib.request.Request(
        categories_url,
        method="GET",
        headers={"Authorization": f"Bearer {access_token}"},
    )
    try:
        with urllib.request.urlopen(categories_request) as response:
            categories = json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"Could not check existing categories ({error.code}): {detail}") from error

    existing_categories = categories.get("documents", [])
    if existing_categories:
        names = [document["name"].rsplit("/", 1)[-1] for document in existing_categories]
        raise RuntimeError(
            f"Target sheet already has categories ({', '.join(names)}); refusing to duplicate the import."
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--execute", action="store_true", help="write the import to Firestore")
    args = parser.parse_args()

    categories = parse_source(SOURCE_PATH)
    point_count = sum(
        len(subcategory.points)
        for category in categories
        for subcategory in category.subcategories
    )
    subcategory_count = sum(len(category.subcategories) for category in categories)
    subcategory_ids = [
        subcategory_document_id(category.type_name, subcategory.name)
        for category in categories
        for subcategory in category.subcategories
    ]
    point_ids = [
        point_document_id(
            subcategory_document_id(category.type_name, subcategory.name),
            point.source_number,
        )
        for category in categories
        for subcategory in category.subcategories
        for point in subcategory.points
    ]
    category_ids = [category.type_name for category in categories]
    if len(category_ids) != len(set(category_ids)):
        raise RuntimeError("Category IDs are not unique within the sheet.")
    if len(subcategory_ids) != len(set(subcategory_ids)):
        raise RuntimeError("Subcategory IDs are not unique within the sheet.")
    if len(point_ids) != len(set(point_ids)):
        raise RuntimeError("Point IDs are not unique within the sheet.")
    category_point_counts = {
        category.type_name: sum(len(subcategory.points) for subcategory in category.subcategories)
        for category in categories
    }

    print(f"Source: {SOURCE_PATH}")
    print(f"Target: {PROJECT_ID}/{DATABASE_ID}/inspectionSheets/{SHEET_ID}")
    print(f"Categories: {len(categories)}")
    print(f"Subcategories: {subcategory_count}")
    print(f"Ordinary ○ points: {point_count}")
    print(f"Unique category IDs: {len(set(category_ids))}/{len(category_ids)}")
    print(f"Unique subcategory IDs: {len(set(subcategory_ids))}/{len(subcategory_ids)}")
    print(f"Unique point IDs: {len(set(point_ids))}/{len(point_ids)}")
    for category in categories:
        print(f"  {category.type_name}: {category_point_counts[category.type_name]}")

    if point_count != 263 or len(categories) != 7 or subcategory_count != 52:
        raise RuntimeError(
            "Unexpected source shape; refusing to continue. "
            f"Expected 7 categories, 52 subcategories, 263 points; got "
            f"{len(categories)}, {subcategory_count}, {point_count}."
        )

    if not args.execute:
        print("Dry run only. Re-run with --execute to write using the Firebase CLI login.")
        return 0

    access_token = os.environ.get("FIREBASE_ACCESS_TOKEN") or firebase_cli_access_token()

    actor_id = os.environ.get("IMPORT_ACTOR_ID", "123456789")
    actor_name = os.environ.get("IMPORT_ACTOR_NAME", "Test User")
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    writes = build_writes(categories, actor_id, actor_name, timestamp)
    if len(writes) > 500:
        raise RuntimeError(f"Import contains {len(writes)} writes, exceeding Firestore's 500-write limit.")

    ensure_target_is_ready(access_token)
    commit_url = (
        f"https://firestore.googleapis.com/v1/projects/{PROJECT_ID}/databases/"
        f"{DATABASE_ID}/documents:commit"
    )
    result = firestore_request("POST", commit_url, access_token, {"writes": writes})
    print(f"Imported {len(writes)} documents.")
    print(json.dumps(result, indent=2))
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (RuntimeError, OSError) as error:
        print(f"Import failed: {error}", file=sys.stderr)
        raise SystemExit(1)
