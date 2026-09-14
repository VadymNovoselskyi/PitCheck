# MVP Screens and Navigation

- [Navigation](#navigation)
- [Screens](#screens)
- [Shared interactions](#shared-interactions)

## Navigation

Use four regular destinations with a prominent center action:

```text
Home | Sheets | [Start / Join / Open] | Archive | Settings
```

The center action changes with the active inspection:

- **Start** when no inspection is active.
- **Join** when a lobby exists and the user has not joined it.
- **Open lobby** when the user has joined the lobby.
- **Open inspection** while an inspection is running.

Contextual Start actions may also appear on a sheet or category. They open the same setup flow with the relevant values preselected.

## Screens

### Home

Home is intentionally small. It shows:

- The current lobby or live inspection, if one exists.
- The latest completed inspection and a short result summary.
- A Start inspection action when there is no active inspection.

A lobby card shows its sheet, category, included subcategories, creator, and current members. A running card adds the timer and point-result counts. Selecting either opens the appropriate inspection screen.

### Inspection sheets

The sheet list shows all active inspection sheets as expandable cards with their competition name and useful metadata. Selecting a sheet opens its details. Sheet creation and editing use modal bottom sheets.

Archived sheets are hidden by default but can be shown and restored. The card overflow menu contains Edit, Archive, and Delete when permanent deletion is allowed.

### Inspection sheet details

The details page provides the checklist hierarchy:

```text
Inspection sheet
  Category
    Subcategory
      Scrut point
```

Categories and subcategories can be expanded. Large point collections should open as a dedicated searchable list rather than placing hundreds of points in one accordion.

Entity creation and editing use modal bottom sheets. Each card has a separate overflow menu for Edit, Archive, and Delete. Reorder is a section-level action that temporarily enables drag handles for sibling entities; it does not open another screen.

Selecting a scrut point opens its detail page.

### Scrut point details

This page shows the point name, description, category path, and previous results across inspections. Selecting a previous result opens that result's detail page with its verdict, judge, comments, photos, and event history.

Point editing happens on the same page or in a tall modal bottom sheet. It does not require a separate route.

### Start inspection

The setup flow lets the user:

1. Select an inspection sheet.
2. Select one category.
3. Select the included subcategories.
4. Review the configuration and point count.
5. Create the lobby.

Starting from a sheet or category preselects those fields.

### Inspection lobby

The lobby exists before the timer starts. It displays the selected checklist scope and a participant section. Team members join by opening the lobby from Home; QR codes are not needed for the MVP.

Joining opens a role-selection bottom sheet with Judge and Participant options. The inspection creator may start the inspection or cancel the lobby. Cancelling permanently deletes the unused lobby and its membership documents so it does not appear in the archive.

When the creator starts the inspection, `startedAt` is set and all lobby clients reactively move to the live inspection.

### Live inspection — judge view

The default judge view presents one point at a time with:

- Inspection timer and progress.
- Category and subcategory context.
- Full point details.
- Passed, failed, skipped, and not-applicable actions.
- Optional comment and photo attachments.
- Existing event history.
- Previous and next navigation that never changes the point automatically.
- A switch to the point-list overview.

The overview lists every included point with its current status, latest judge, relative decision time, and comment/photo indicators. It supports search and filtering by status, subcategory, judge, and attachment presence.

The participant list is a section or bottom sheet within the inspection, not a separate screen.

### Live inspection — participant view

Participants can open the same point list and select a point to inspect its current result, judge notes, photos, and event history. During a live inspection this view is read-only: participants cannot change verdicts, judge comments, photos, or events.

### Inspection archive

The archive contains completed inspections only. Cancelled lobbies are deleted and never appear here.

Inspection cards show the sheet, category, date, duration, participants, and result counts. The list supports search and filters such as sheet, category, date, judge, and result status.

Selecting an inspection opens its completed result view.

### Completed inspection details

This page shows the overall summary, participant list, subcategories, and point results. Selecting a result opens its detailed verdict, comments, photos, judge, relative time, and immutable event history.

After completion, participants may mark a point as addressed or not addressed and provide a note explaining what changed. This creates an event and updates the result's current addressed state. It does not modify the judge's original verdict or attachments.

### Settings

The MVP only needs a basic Settings destination. Authentication, profiles, and permission-management screens are deferred.

## Shared interactions

- Use modal bottom sheets for role selection and lightweight create/edit forms.
- Use a full-height sheet when a form contains a long point description.
- Warn before dismissing a form with unsaved text or photos.
- Use confirmations for finishing an inspection, cancelling a lobby, archiving, and deleting.
- Open photos in a dedicated viewer.
- Archive checklist entities to hide them while preserving historical references.
- Permit permanent deletion only when the entity and its descendants have never been referenced by an inspection.
