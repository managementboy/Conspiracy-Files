# Project Zomboid Build 42 API Notes

Status: Research backlog / verification log.

## Current architecture assumptions to verify

- Normal Project Zomboid Lua/events/exposed Java APIs should be the default integration path.
- Map/meta-grid data appears suitable for enumerating buildings, rooms, zones, and exact coordinates ahead of player arrival, but category reliability must be tested against real Build 42 data.
- Building-entry confirmation should be achievable from player square/building state, but the preferred event/state transition must be proven.
- Non-building landmarks such as transmission towers may require object/sprite/zone/radius-based registration rather than BuildingDef-style metadata.
- Deferred story-item placement should occur when the relevant world area/container becomes available; exact-once semantics must be proven.
- Global never-loaded chunk history is required for the agreed >90% retrofit rule and must be verified before that requirement can be implemented safely.
- Persistent physical evidence identity across inventory/container/world transitions is a technical risk requiring proof.
- Readable literature, item names/descriptions, maps, photos, keys, and other viable vanilla assets should use native behavior wherever possible; exact mutation APIs need version-specific verification.
- Runtime AI/provider communication should remain Lua-first unless vanilla networking/data handling proves inadequate.
- ZombieBuddy is conditional, not a default dependency. Introduce it only for missing API access, measured performance bottlenecks, or persistence/data-processing complexity.

## Research recording rule

For every finding record:
- Build 42 version tested;
- API/event/class used;
- minimal reproduction/probe location under `/dev/`;
- observed behavior;
- limitations;
- performance notes if relevant;
- conclusion: vanilla Lua sufficient / Java helpful / ZombieBuddy required.
