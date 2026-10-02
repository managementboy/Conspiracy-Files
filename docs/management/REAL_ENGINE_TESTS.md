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

Exit codes of the real-engine run: **0** all good, **1** something failed, **20** no game here (never a pass),
**21** the game is a different build than the one we verified, **22** fewer real tests ran than required.

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
- [ ] Shared start-up script lists every engine set-up step done by hand and why
- [ ] Door check moved to the real engine
- [ ] Ground checks (outside / floor / solid) moved
- [ ] Address map moved
- [ ] Map markers moved
- [ ] Each moved test deletes its pretend version in the same change

### Phase 5 — policing and wiring in
- [ ] A check that every function a remaining pretend object offers really exists on the real one
- [ ] A check that nothing from the game gets staged into git
- [ ] Wired into the normal test run, after three clean runs

## Bugs found along the way
(none yet)
