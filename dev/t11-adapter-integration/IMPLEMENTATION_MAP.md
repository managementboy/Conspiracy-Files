# T11 implementation map

**DEV-0.6 implementation update:** the wrapper now delegates directly to mod/common/media/lua: Session.lua owns aggregate commit; Placement.lua owns validated plan/target identity; WorldAccess.lua supplies resumable reads; Scheduler.lua runs capped deadline batches; Runtime.lua binds these to engine events; ContextMenu.lua and Notebook.lua deliver manual actions/UI. T11Mode limits eligible placement to D1 and selects a separate tag. The older map below is design/provenance; live obligations still apply.

This map identifies the proven source mechanisms to adapt into one disposable composition probe. It is not permission to copy isolated probe state machines into production.

| Concern | Proven source | Composition boundary |
|---|---|---|
| Canonical validation and replacement | `ConspiracyFiles.Validator`; T1 | Every candidate root validates completely before the private root or Global ModData wrapper changes |
| Domain intent | `ConspiracyFiles.ThreadState` | Adapter calls only `materialise`, `discover`, `markInteresting`, `confirmLocation` and validated `replace`; engine objects never enter the domain root |
| Placement | T4, P4-R36 | `LoadGridsquare` enqueues only the exact bound target; detached token stamping precedes add; count-one verification precedes `placed` |
| Physical identity | T5, P4-R37 | Save-scoped token is separate from placement; original-container absence starts broader reconciliation rather than loss |
| Item text | T7, P4-R38 | Custom display name and validated ModData are presentation inputs; static authored content remains authoritative |
| Arrival | T8, P4-R39 | Approximately 4 Hz bounded sampling; two stable samples; exact binding predicate; persist confirmation before domain event |
| Inspect/Mark | T10, P4-R45 | `OnFillInventoryObjectContextMenu`; private option identity; activation-time revalidation; no direct-world right-click dependency |
| Error containment | P4-R19 | Each engine boundary has one `pcall`, concise reporting and a bounded subsystem-disable threshold |

## Scheduling contract

The T11 probe should use one FIFO work queue with explicit work kinds: `placement`, `identity`, `arrival`, `inspect-intent` and `persist`. A single scheduler invocation processes a fixed item cap and stops when its elapsed-time deadline is reached. Engine callbacks enqueue immutable primitive snapshots or stable IDs; they do not mutate canonical state directly.

The same-tick case is tested by deliberately enqueueing `arrival` and `identity` beside a placement or Inspect transition before one scheduler pass. Correctness must not depend on which PZ callback happened to fire first. Domain idempotency and full-root staging remain the final guard.

## Probe-owned state

Use a distinct `ConspiracyFiles.T11.*` Global ModData namespace for controls, run progress and evidence counters. The accepted domain root may be serialized inside the probe wrapper, but no production tag may be introduced. Every injected fault is one-shot and records whether it fired.

## Static verification before attendance

- no PZ import or global appears in the accepted domain files;
- every event registration is idempotent and removable by stored callback identity;
- every queue kind has a fixed cap and error path;
- every item exposure path stamps token, asset ID and resolved presentation fields first;
- no canonical value contains userdata, Java objects, functions, threads, aliases or cycles;
- no direct-world right-click event is required;
- probe activation is guarded by exact mod ID and disposable-save prefix.
