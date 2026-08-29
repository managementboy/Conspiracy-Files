# Data Model

**Status:** v0.1 scope only; expand from real content, not speculative schemas.

Core v0.1 records:
- `Asset` — authored content definition;
- `Evidence` — player's encounter with an asset/object in context;
- `Identity` — one encountered name/role/cover identity;
- `Organisation` — organisation whose label may refine;
- `Location` — one of the curated story locations;
- `Relationship` — ID-to-ID link with type/provenance/status;
- `JournalEntry` — chronological projection record.

Invariants:
- evidence facts are immutable; interpretation is mutable;
- authored IDs are deterministic; player/runtime IDs are generated;
- relationships are canonical records; adjacency/lookups are rebuildable indexes;
- PZ objects never live directly in the domain core.

Use `test/fixtures/THREAD-001-DEAD-AIR.md` to expose missing fields before adding generic entities or content-pack schemas.
