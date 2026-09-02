# Data Model

**Status:** Superseded by `V0_1_DATA_MODEL.md`. Retained only as a historical pre-content sketch; do not implement from this file.

Core v0.1 records:
- `Asset` — authored content definition;
- `Evidence` — player's encounter with an asset/object in context;
- `Identity` — one encountered name/role/cover identity;
- `Organisation` — organisation whose label may refine;
- `Location` — one of the curated story locations;
- `JournalEntry` — chronological projection record.

Invariants:
- evidence facts are immutable; interpretation is mutable;
- authored IDs are deterministic; player/runtime IDs are generated;
- v0.1 authored links are static stable-ID references; there are no standalone Relationship records;
- PZ objects never live directly in the domain core.

Use `test/fixtures/THREAD-001-DEAD-AIR.md` to expose missing fields before adding generic entities or content-pack schemas.
