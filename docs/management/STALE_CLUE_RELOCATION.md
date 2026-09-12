# Stale clue relocation — development handoff

Owner decision, 2026-09-06: *"if a player can't find a clue for a few days,
switch it to another building we have not visited."*

A self-healing safety net so a case can never dead-end, whether the clue is
walled off, in a room with no path, or simply missed.

## Why this is needed

Live session, 2026-09-06: three of four clues were placed in a basement office
at `10876,10078,-1` with no walkable path from the only basement staircase.
The case was impossible to complete. Root cause of the *level* choice is fixed
in `1e287ba`, but **nothing in the pipeline verifies a clue can be walked to**:
`Reach.lua` is pure distance policy, and `World.candidateScan` sweeps a square
box for containers of the right type. This mechanic covers that gap without
requiring perfect connectivity analysis.

## Scope

Relocate a placed, undiscovered clue after it has gone unfound for a
configurable period, to a location the player has not visited.

### Staleness

A document is stale when all hold:

- `assignments[id].status == "placed"`
- its id is not in that session's `known`
- `worldHours - assignments[id].placedHours >= RELOCATE_AFTER_HOURS`
  (default **72**, i.e. three in-game days; single named constant)

`placedHours` is new; record it when placement succeeds. Schema change is
acceptable under **P4-R63** (no old-save compatibility before 1.0). Announce
the fresh-save requirement; never rewrite or reset an existing save.

### Destination

- A catalog location the player has **not visited**, and which holds no other
  placed clue.
- Visited-building tracking is new: record the building id when the player is
  inside one, bounded set in ModData, same validation discipline as the other
  canonical roots (`Validator.validateStructure`, `SaveBudget.check`).
- If no unvisited candidate exists, do nothing and log it. Never fail loudly,
  never relocate into a visited building as a fallback.

### Move safety

- Verify the old item is still in the original container with a matching
  `cfPhysicalToken` and has not been moved by the player. If it is gone or
  altered, **do not relocate** — the player may be carrying it.
- Remove the old item and place the new one atomically with respect to
  canonical state: no window in which zero or two copies exist.
- Skip while the player is within ~20 tiles of either the old or new target,
  or while the container is open, so nothing changes under the player's eyes.
- Cap relocations per document (suggest 3) so a clue cannot churn forever.
- Reset `placedHours` on the new placement.

## Files

- `mod/common/media/lua/shared/ConspiracyFiles/Generated/Session.lua` —
  `assignments[id]` gains `placedHours` and a relocation counter; extend the
  `fields(a,{...})` allow-list and validation. `api.status` deliberately
  refuses to reset placement (`"cannot reset placement"`), so add a dedicated
  `api.relocate(id,target,hours)` that keeps status `placed` and revalidates
  the whole root through the existing `commit` path.
- `mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua` — drive
  it from the existing `Scheduler` (`scheduler.enqueue`), never an unbounded
  loop. Respect the <=2 ms/frame budget.
- New client module for visited-building tracking.
- `mod/common/media/lua/client/ConspiracyFiles/ClueHints.lua` — its `visits`
  and `reported` tables are keyed by target; invalidate on relocation.

## Invariants

- Domain core stays free of PZ runtime dependencies and testable in plain
  Lua 5.1. All engine contact behind adapters.
- Immutable evidence facts; only interpretation is mutable. Relocation moves a
  *physical object*; it must not alter the document's text, identity or any
  recorded discovery.
- Never touch a discovered clue, and never alter the discovery ledger
  (`DiscoveryLedger` / `DiscoveryLog`) — ordering is derived from real
  discovery events only.
- Bounded work, no unbounded scans, no per-frame full-case revalidation (see
  `e8aa60f` for exactly that mistake).
- Single-player debug only, consistent with `allowed()` in GeneratedRuntime.
- Log under a `[CF-G2-RELOCATE]` tag: every relocation, and every refusal with
  its reason. Silent behaviour is undiagnosable — see `a5cedd3`.

## Tests

`lua5.1 test/run.lua` must stay green (currently 53 tests, 0 failures), plus a
new focused test in the standalone style of `test/discovery_ledger.lua`:
staleness boundary, untouched-item guard, player-carrying guard, no-candidate
case, relocation cap, and ledger left untouched.

Interpreter on this machine:
`C:/Users/elkin.fricke/AppData/Local/Temp/codex-lua51/lua5.1.exe`

## Stopping point

Implement and test only. **Do not deploy** to
`C:\Users\elkin.fricke\Zomboid\mods\ConspiracyFiles`. The PM task reviews,
integrates, deploys and guides the live test.
