# Dead Air placement and discovery decision

Status: accepted development direction (2026-09-04)

The current gated-spawn behavior is development scaffolding only. The intended gameplay model is order-independent and diegetic:

- All authored evidence and the optional B-37 key exist in the world independently of player progress.
- The player may find and inspect objects in any order.
- Inspection always records an object for future reference, even when its meaning is not yet understood.
- The journal records discovered facts; interpretation emerges only when the relevant evidence set is assembled.
- Visiting a location or arriving out of order must not create or delete ordinary physical evidence.

To avoid repetitive police-station searches, each item may have a bounded pool of valid candidate containers. A candidate is chosen once per save and persisted in ModData, so the arrangement varies between new saves but remains stable across reloads. Candidate pools must contain only reachable, story-appropriate containers.

The development harness may continue to use fixed coordinates or a fixed seed for reproducible validation. Randomized placement belongs to normal gameplay and must not make automated tests nondeterministic.

Implementation priority: first refactor placement/discovery to this model with small, explicit candidate pools; defer broader procedural complexity.

## Implemented foundation (2026-09-05)

- `ConspiracyFiles/Placement.lua` is the PZ-free planner. It owns the seven-Asset inventory and the bounded relay-shelf, police-property, and Rourke-dresser candidate pools.
- `ConspiracyFiles.DeadAir.Placement` stores schema version, per-save seed, candidate ID, physical token, and monotonic placement status separately from survivor knowledge in `ConspiracyFiles.DeadAir`.
- Normal new saves draw one seed and persist the resulting plan before placement. Debug saves use seed `3700714`; the plain-Lua suite can inject any seed directly.
- `LoadGridsquare` and 15-tick location sampling enqueue only a visited/loaded curated location. Every pending Asset at that location is reconciled without consulting Evidence, JournalEntry, or another Asset's state.
- Candidate resolution is limited to a one- or two-tile story-specific container filter. A detached item receives its physical token and resolved text before `AddItem`; a pending retry first checks the exact selected container for that token.
- The debug harness retains its relay → police → relay → motel → police coordinate route and D1–D6 inspection sequence, but physical placement is now asserted independently. It logs the persisted seed and candidate IDs.

This implementation still requires a live Build 42 pass to confirm every candidate ordinal/type against the validated furniture. Broader moved-item reconciliation remains governed by T5 and is outside this bounded placement-planner change.
