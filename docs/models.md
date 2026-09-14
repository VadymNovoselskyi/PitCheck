# MVP Data Models

- [Model hierarchy](#model-hierarchy)
- [Checklist entities](#checklist-entities)
- [Inspection and result entities](#inspection-and-result-entities)

## Model hierarchy

The checklist hierarchy defines what can be inspected:

```text
InspectionSheet
└── InspectionCategory
    └── InspectionSubcategory
        └── ScrutPoint
```

The inspection hierarchy records one use of that checklist:

```text
Inspection
├── InspectionMember
└── InspectionPointResult
    └── InspectionPointEvent
```

An `Inspection` selects one sheet, one category, and the subcategories included in the run. Each included `ScrutPoint` has one current `InspectionPointResult`. Changes to that result are preserved as immutable `InspectionPointEvent` records.

`User` represents a person in the application. `InspectionMember` connects that user to a particular inspection and assigns their role for that inspection.

## Checklist entities

### InspectionSheet

Represents a checklist imported for a competition and year. A new sheet is created for each annual ruleset instead of replacing the previous year's sheet.

It is the root of the checklist hierarchy and contains competition metadata. Archiving hides it from normal browsing and new inspection setup while preserving its historical inspections.

### InspectionCategory

Represents a major inspection area such as Mechanical, Accumulator, Egress, Pre-inspection, or Post-inspection. It belongs to one inspection sheet.

An inspection currently covers one category. Categories can be ordered and archived without affecting historical results.

### InspectionSubcategory

Groups related points within a category. It contains a name, description, and order within its parent category.

Users choose which subcategories are included when creating an inspection. An empty selection means that all active subcategories in the selected category are included.

### ScrutPoint

Represents one requirement that a judge can pass, fail, skip, or mark as not applicable. It belongs to one subcategory and contains its display name, description, and order.

Inspection results hold a live reference to this entity rather than copying a snapshot. A referenced point should therefore be archived instead of permanently deleted. Permanent deletion is only safe when no inspection result references it.

### AuditMetadata

Stores who created and last updated an entity, together with Firestore server timestamps. It is shared by editable models and is separate from inspection decision history.

## Inspection and result entities

### Inspection

Represents one category-level scrutineering run. It identifies the selected sheet, category, and included subcategories.

Its timestamps describe its lifecycle:

- Lobby: `startedAt` and `endedAt` are null.
- Running: `startedAt` is set and `endedAt` is null.
- Completed: both timestamps are set.

The timestamps also provide the overall duration and the reference point for relative event times. Cancelled lobbies are deleted rather than stored as archived inspections.

### InspectionMember

Connects a user to one inspection. It stores the user's display name, inspection-specific role, and join time.

The supported roles are:

- Judge: can make decisions and attach judge notes and photos.
- Participant: can observe a running inspection and mark points addressed after completion.

The inspection role is different from the user's application-wide role. A user may have a different inspection role in another run.

### InspectionPointResult

Stores the current state of one scrut point in one inspection. There should be exactly one result for each inspection and point pair.

It contains:

- A live reference to the checklist point.
- The current status.
- The latest judge and decision time.
- Whether the point has been addressed after the inspection.
- The current addressed note.

This is the model used for result lists, progress counts, and filters. It is updated when a new event changes the point's current state.

### InspectionPointStatus

Describes the current verdict for a point:

- Pending
- Passed
- Failed
- Skipped
- Not applicable

The same status is stored on decision events so historical changes remain understandable without inspecting the current result.

### InspectionPointEvent

Represents one immutable action in a point's history. Event types are decision, marked addressed, and marked unaddressed.

An event records:

- The inspection and scrut point.
- The event type and resulting point status.
- The actor who performed it.
- An optional comment and photo attachments.
- When it occurred.

Decision events are created by judges during the inspection. Addressed and unaddressed events are created after completion, normally by participants. Event actor fields are therefore generic rather than judge-specific.

The event time can be compared with the inspection's `startedAt` to show when a decision occurred relative to the start. Existing events are never edited; correcting or changing state creates another event.

### User

Represents the application's stored user identity, including name, email, image, and global application role. Inspection participation and judge permissions belong to `InspectionMember`, not directly to `User`.
