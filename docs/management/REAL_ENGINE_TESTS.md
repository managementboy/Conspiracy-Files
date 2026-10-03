# Testing the mod against the real game engine

## Why this exists, in plain words

Our automatic tests used to run the mod against *pretend* game objects written by hand.
A pretend object does whatever its author told it to. So when the real game removed a
function the mod relied on (a door check), every test still passed, and the mod quietly
stopped noticing doors.

This work adds checks that use the game's own engine instead of pretend objects, and makes
sure those checks cannot pass by accident or fall silent.

## How to run them

- `tools/realengine/run.sh` — the real-engine checks (add `--shuffle` for the order test, `--relock` after a clean run on a new game build)
- `python3 tools/enginecalls/enginecalls.py` — scan every engine call in the mod
- `python3 tools/realengine/fake_parity.py` — check the remaining pretend objects against the real ones
- `tools/realmap/check.sh` — real-map check described below (needs the game, ~2 minutes, no window)
- `tools/realengine/leak_gate.sh` — make sure nothing from the game is tracked by git

Exit codes of the real-engine run: **0** all good, **1** something failed, **20** no game here (never a pass),
**21** the game is a different build than the one we verified, **22** fewer real tests ran than required.

## The real-map check (no window, no player) — `tools/realmap/check.sh`

The game's own background server loads the real map. The check asks it for every building (about a minute per world),
does that in two separate new worlds, and compares with `dev/addresses/world1.tsv`, the export our shipped data was built
from. It reports which shipped data files refer to buildings that changed. It also has an always-on part in the normal
tests: `test/address_book_matches_export.lua` (every shipped house number names a building in the reference export).

**Result on 2026-10-02, installed game 42.21 (reference made on 42.20):**
- The game update changed **46** buildings (same in both new worlds). About **350** buildings (3.5% of the map) come out
  *differently in each new world* (shape and room kinds), which did not happen in the two 42.20 reference worlds.
- Shipped **house numbers: 0 affected. Map sites: 0 affected.**
- The shipped **fixed-container index** (which furniture/containers sit in which building) refers to 26 updated and 215
  world-varying buildings. Whether that matters depends on whether placement re-checks containers at run time; open question for the owner/PM.
- Not yet confirmed: that a normal single-player new world varies the same way as the background server's worlds. The
  in-game export (`tools/autotest/checks/address_export.sh`) run twice on 42.21 would settle it.

## The ground-truth walk-through (real game window) — `tools/autotest/checks/ground_truth.sh`

**Run on 2026-10-02 on game 42.21: 65 answers compared, 0 wrong** (7 real door squares read as doors, 14 indoor floors
read as indoor floor with no door, 8 open-ground spots read as outside). Proof it can fail: with the old removed door call
put back, the same run reports **7 wrong** (every real door read as "no door"). It opens the game on the real display (never hidden). In a fresh world the survivor is teleported to eight real buildings near Muldraugh. At each one the
mod's own readers are asked about squares whose truth is read independently from the world (a door object is there or it
is not; a square is outside or it is not), and every answer is compared. It writes the comparison to
`dev/answers/ground_truth_<game>.tsv` (only a clean run is saved as the reference; a failing run is kept beside it as `.FAILED.tsv`), so a later game update can be compared with it. This is the only check that proves
the readers' ANSWERS (door / indoor floor / open ground), not just that their calls are valid.

## Does the mod cope with a stale container index? (answered by reading the code, 2026-10-02)

Yes. `FixedContainerRuntime.resolve` re-checks the live world before any clue goes into an indexed container: the square
must be loaded, the building id must be exactly the one in the index (otherwise "building-changed"), the furniture sprite
and the container type must match (otherwise "target-changed"), and the container must not be searched or open. A stale row
is therefore refused, never silently wrong; the cost is that some indexed spots are unusable in the roughly 3.5% of buildings
that vary, and the caller then uses its fallback scan of the modified building. Not measured: how often that fallback
fires, or whether it finds as many places as the index would have.

## What is NOT done by these checks

They check that a call is *valid* (the function exists, takes that many things, of that
kind). They do not check that the *answer* is right on a real map, because no map is loaded.
Whether a door is detected on a real door is still the in-game playtest's job.

## Decisions made (owner can overrule)

- **Nothing copied from the game is ever stored in the repo.** The checks read the game from
  its install folder every time. The game's own helper file is copied next to the repo but is
  ignored by git.
- **The list of engine functions the mod calls is regenerated each run, not saved in the repo.**
  The only saved lists are our own: a short list of known false alarms, and a lock recording
  which game build was verified.
- **The checks live in the repo** (`tools/realengine/`, `tools/enginecalls/`) and find the
  game through `tools/env.sh`.

## What the real-engine start-up fakes (and why)

The game normally prepares a lot before any mod code runs. Headless, we do only the minimum, by hand,
in `tools/realengine/RealEngine.java`. Each of these is a place where this setup only *approximates* the game:

| Step done by hand | Plain-language reason |
| --- | --- |
| Random-number source started | The game's classes draw random numbers the moment they load |
| The game's file system object started | Several classes read files when they load |
| Link the Lua interpreter, its thread and its converters into the game's "global" slots | Without them the engine's own start-up code fails |
| Number and array converters installed | Lets Lua numbers become the whole numbers Java asks for |
| Mark the Lua thread as owned by this process | A safety check the game normally satisfies |
| Expose every game class to Lua | Same call the game makes |

**Things that cannot exist without a loaded map** (found while writing the tests): the current cell and player
(`getCell()`, `getPlayer()`), the player's map knowledge (`WorldMapVisited.getInstance()` is empty, and marking ground
known has no effect), the live map window, and any square read that needs a world behind it (floor, solid, outside
answer with an error on a hand-built empty square). For these the checks prove the *call is valid* (right name, right
count, right kind, return types line up) but not the *answer*. The in-game playtest still owns the answers.

## Progress

### Phase 0 — decisions
- [x] Decide what may be saved in the repo (see above)
- [x] Decide where the checks live (see above)

### Phase 1 — prove the checks can fail (`tools/realengine/run.sh canary`)
- [x] A deliberately bad door call, a made-up function, a wrong-count call and a wrong-kind call are all rejected, each with its own message
- [x] A set of correct calls works in the same run (so a broken start-up cannot fake a rejection)
- [x] The run fails if a "must fail" check starts passing, a "must pass" check starts failing, or the check folder is empty
- [x] The old pretend-object check of the same door call still passes — shown side by side
- [x] With no game installed it says "NOT EXERCISED" and never says "pass"

### Phase 2 — scan every engine call in the mod (`tools/enginecalls/`)
- [x] Ignores comments and plain text strings
- [x] Reproduces the earlier hand audit (it now checks 664 calls after skipping names the mod or vanilla Lua defines itself; same one real bug, no unexplained findings)
- [x] Catches the old door bug when pointed at the code from before the fix
- [x] Reads the game only at run time, saves nothing from it
- [x] Handles functions with optional/variable arguments
- [x] Known false alarms live in a short list with a reason each; a dead entry fails the run
- [x] Runs in seconds with only the game and Java present
- [x] Prints a summary and saves a dated result in `docs/management/evidence/`

### Phase 3 — a run that can never be silent
- [x] Every run records the game build, the game file's fingerprint, the Java version and how many real/skipped/failed
- [x] Different exit codes for: all good / a failure / no game / wrong game build / too few real tests
- [x] A lock file says which game build and minimum real-test count were verified; only an explicit command can change it
- [x] Each test file runs in its own fresh Java process; start-up time is measured
- [x] Running in shuffled order gives identical results (catches tests that leak into each other)
- [x] A test only counts as "real" if it actually built a real game object

### Phase 4 — real objects and moving tests over
- [x] Shared start-up script lists every engine set-up step done by hand and why (table above; failures are loud)
- [x] Door check moved to the real engine (`ground_readers_real_squares.lua`; putting the old bug back makes it fail)
- [x] Ground checks (outside / floor / solid / sight / zombies) moved — their calls are checked for rejection; their answers need a loaded map
- [x] Address map moved (`address_map_real_visited.lua`)
- [x] Map markers moved (`map_marker_api_contract.lua`: every step of the call chain, with real return types)
- [x] Pretend versions: the old tests of these readers only exercised rule logic over plain facts, not engine calls. The pretend squares that remain (for scenario logic) are policed in Phase 5

### Phase 5 — policing and wiring in
- [x] A check that every function a remaining pretend object offers really exists on the real one, with the same number of arguments (`tools/realengine/fake_parity.py`). It found 8 pretend functions that ignored arguments the game requires; all fixed
- [x] A check that nothing from the game gets staged into git (`tools/realengine/leak_gate.sh`; a local pre-commit hook is installed; a test also checks every tracked file)
- [x] Wired into the normal test run (`tools/autotest/unit.sh`) after three clean shuffled runs. Result: 275 run, 0 failed

## Bugs found along the way
- Nothing wrong with the mod was found by the real-engine tests themselves; the ground readers, address map and map markers are all valid against game build 25485521.
- Earlier in this work (already fixed): the removed door call, the clue-mark lookup that read a field that did not exist, and a script counting trap.
