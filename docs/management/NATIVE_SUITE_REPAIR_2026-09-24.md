# Native suite, run and repaired — 2026-09-24/25

`/goal fix the errors. Then rerun the tests. Repeat until it works.`

The offline suite was green (200/200) and no mod error existed in any console,
so the errors to fix were the ones only the native suite could show. It had not
been run since the 2026-09-23 opening redesign. First run, source `501f906`:
**9 of 20**. Final run: see the last section.

## What was actually wrong

### Product (fixed, each with a test that fails when the defect is restored)

| Defect | Seen | Fix |
|---|---|---|
| `R.reshuffle` resolved every assignment's target; a waiting clue has none, so `World.resolve(nil)` indexed `x` of nil — three exceptions per waiting clue | `reshuffle 20260924T212659` | `World.resolve` answers `nil,"no target"`; the reshuffle skips assignments with no target. `test/reshuffle_skips_waiting_clues.lua` |
| Second-case preparation refused every indexed (out-of-sight) partner as `busy`; the opening branch tolerated them since 4580e18, the ordinary branch did not | `core_loop 20260924T223914` | one rule in both branches. `test/second_case_tolerates_indexed_partner.lua`; DR-20260924-SECOND-CASE-OPEN-ORDER |
| The filler's "no free container and no carrier" outcome was silent (log at debug only) | `core_loop 20260924T223914`: "no reason recorded" | `declinePlacement` names it |

Earlier the same day, from the fitness audit: "already searched" read from
`isExplored` (DR-20260924-SEARCHED-MEANS-LOOKED) and the filler pinned to
`waiting[1]`. Both in the mutation corpus (006, 007).

### Checks that asserted a design the project had since changed

The first clue is a key delivered to the hand and the rest arrive as
instalments (2026-09-23); a followed finding outranks the closing answers
(DR-20260919-CONTINUITY); only recognised evidence is filed (P4-R132). Nine
checks predated one or more of these:

- `core_loop.lua` — `L.docs` keeps waiting clues; `L.find` looks in the hand; `L.visitSite`/`L.settle`/`L.furniture`/`L.nextWaiting` bring instalments in; nil-safe `showMap`, `openContainer`, `take`, `carried`.
- `lib.sh` — `settle_doc N` (stand at a waiting clue's site until it is written), `wait_furniture_clue SECS COUNT`; `inspect_doc` settles first.
- `core_loop.sh` — in-hand clues counted apart from map marks and the loot panel; the second case must *follow a finding*, the answers stay unused for the case after; a `steer` is asserted only when the finished case left no thread.
- `clue_search.sh`, `clue_actions.sh`, `clue_field.sh`, `drop_note.sh`, `knox.sh`, `death.sh`, `reload.sh`, `perf.sh` — wait for instalments instead of "all placed"; `drop_note` excludes the in-hand clue from "furniture"; `hardware` plants a page as *recognised* evidence and waits for a case first.

### Check defects (the "errors inside the mod" that were not)

Every Kahlua exception the first run attributed to the mod came from a check
fixture indexing a target it never had: `clue_search.recognised`,
`core_loop.showMap`/`openContainer`, `reload.placement` (a waiting clue's nil
square concatenated). All nil-safe now. The suite runner also discarded each
check's stderr, so "could not run (exit 2)" carried no reason; it keeps it now.

### Timing assumptions corrected

- `clue_search`: the forage icon is the game's own chance roll; ten seconds was an assumption (the same clue got its icon 5.7 s into the *next* pass). Sixty seconds, and the time recorded.
- `death`: scanning the death spot 3 s after a teleport read empty squares; it waits for the 5×5 to load, and looks in the album inside the body and in a bag on the floor, reporting what it saw when it finds nothing.
- `clue_actions`: needs two furniture clues so the cue has a clue with an open side to be seen from.

## Runs

| Run | Result |
|---|---|
| suite `20260924T201741…213408` (first, source 501f906) | 9 / 20 |
| reruns of the 11 failures, individually | all PASS by `20260925T012025` |
| suite `20260924T233747…010103` (final product code) | 17 / 20 — `clue_actions` aborted (one furniture clue, no open side), `death` (chunk race), `reshuffle` (no new case; no reason captured — now it names the deferral) |
| reruns after those three check fixes | `clue_actions 20260925T010720` PASS after `clue_search` in the same game; `reshuffle 20260925T010938` PASS; `death 20260925T012025` PASS |
| suite `20260925T012520…024851` (check fixes included) | 18 / 20 — `case_body` aborted (no bound case person within reach; environment, passed alone `20260925T025050`), `reload` (CasePeople root +34 bytes: a re-bind after load fills `outfit`/`female` - bounded, one record per case) |
| `reload` after asserting per-root stability and case-person record count | VisitedBuildings grew between the snapshot and the save (the tracker recorded the house the check had teleported into); the snapshot now waits for two identical byte lines |

## Not done / still open

- The reload budget growth (`20260924T204616`: 53392 → 53509) was CasePeople: a re-bind after a load rewrites the case person's record within its fixed fields. The check now asserts what a reload must actually keep — every other root byte-identical, the case-person record count unchanged — and snapshots only a quiescent store.
- `reshuffle` failed once in a suite with "no new case" and no reason; it now reports the runtime's deferral code, and passed twice since.
- No Workshop publish, release or tag.
