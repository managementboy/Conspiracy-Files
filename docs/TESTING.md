# How this project is tested

Four tiers, and the line that matters most is between the two halves: the
first two tiers prove logic without a game, the last two prove the mod works
inside Project Zomboid. Both halves are necessary and neither substitutes for
the other — most of the bugs found on 2026-09-13 were found because a mock
disagreed with the real thing.

## The tiers

| Tier | Where | Needs the game? | Run it with |
|---|---|---|---|
| Unit | `test/*.lua` | no | `tools/autotest/unit.sh` |
| Integration (offline) | `test/*.lua` | no | `tools/autotest/unit.sh` |
| In-game checks | `tools/autotest/checks/*.sh` | **yes** | `tools/autotest/suite.sh` |
| Real-gameplay / end-to-end | `checks/pdagame.sh`, `checks/pdalife.sh`, `../fieldnote-test/boot_test.sh` | **yes** | `tools/autotest/suite.sh` |

`unit.sh` also compiles every shipped Lua file through kahlua
(`run.sh --parse`), which is the only thing that catches a syntax error in a
client file that the game would otherwise swallow at load.

## Running the offline tests

```bash
tools/autotest/unit.sh
```

Seconds, no game, no display. Every test is a plain Lua 5.1 script that asserts
and prints one `PASS` line. A test file is run from the repository root and
finds the mod through `package.path`.

## Running the real-gameplay tests

These boot an actual Project Zomboid, drive it through the eval channel and
read the console log back.

```bash
tools/autotest/suite.sh                  # everything, ~45 minutes
tools/autotest/checks/pdagame.sh         # one check
tools/autotest/checks/pdagame.sh --hidden
```

**`--hidden` costs you the GPU.** It runs the game inside `Xvfb`, which has no
DRI device, so OpenGL falls back to `llvmpipe` — a software rasteriser. Every
measurement this project took before 2026-09-13 was taken that way without
anybody noticing, which made `knox.sh` look flaky and made every performance
number meaningless. Without `--hidden` the game opens on `:0` and uses the real
card. Every evidence file records which one it was:

```
renderer: Intel Mesa Intel(R) Iris(R) Xe Graphics (RPL-U) on display :0
renderer: Mesa llvmpipe (LLVM 20.1.2, 256 bits) (SOFTWARE) on display :99
```

Use `--hidden` when you need the machine for something else and are testing
logic. Never use it for `pdaperf.sh`, `perf.sh`, or anything whose result is a
number.

Each check claims the machine with a lock (`claim_game`), so they serialise;
running two at once is safe, the second waits.

## Which tests are genuinely in-game

| Check | What is real |
|---|---|
| `boot_check.sh` | a world loads, all mod files load, zero mod errors |
| `pdagame.sh` | the organiser is issued at spawn; the device opens by being put in the MAIN HAND; every program opened by TAPPING ITS ICON; a real save, quit and `--continue` reload; the item removed from the inventory with the screen up |
| `pdalife.sh` | hundreds of open/close cycles, screen churn, every size combination, deliberate abuse — all against the game's own UI manager and Events tables |
| `pdaperf.sh` | draw-call counts and frame times from the real renderer |
| `hardware.sh` | the battery, the lamp, auto-off, the dead-cell restore, the journal replay |
| `knox.sh` | Knox.OS driven by taps and key presses |
| `../fieldnote-test/boot_test.sh` | the device's hardware contract: every hitbox, press colours, label clearance |

Anything in `test/` is **simulated**: it stubs the engine. That is the right
tool for logic and the wrong tool for "does this work in the game", and the
project has the scars to prove it.

## Multiplayer

There are no multiplayer tests because there is no multiplayer code. This mod
sends no commands and transmits no table anywhere; every feature refuses to run
as a client or a server, and `test/multiplayer_guards.lua` holds twenty of them
to that rule and fails if anything starts sending traffic. Ownership sync,
dedicated-server behaviour and simultaneous players are **not applicable**
rather than untested.

## Shared test utilities

- **`test/fixtures/contract.lua`** — pin a mock to the interface it
  impersonates, from both ends: the real module must still define every name
  the mock models, and the mock must implement every name the caller uses. Use
  it for every stub of a real module. It exists because a stub offering
  `open(section)` satisfied a green test while the code under test called
  `openSurface`, and both states coexisted happily.
- **`test/fixtures/generated_session.lua`** — a real, valid generated session
  built through the shipped generator and validated by the shipped validator at
  require time. A hand-written case can never be valid: `Generator.validate`
  reconstructs it from its seed and demands byte equality, deliberately, so a
  hand-edited save cannot smuggle evidence in. Tests must bind to the ids this
  exposes rather than invent strings.
- **`test/fixtures/synthetic_locations.lua`** — invented coordinates, never
  vanilla map data.

## Profiling

`tools/autotest/checks/pdaperf.lua` is loadable on its own through the eval
channel if you want numbers interactively:

```bash
tools/autotest/pz.sh start
tools/autotest/pz.sh eval -f tools/autotest/checks/pdaperf.lua
tools/autotest/pz.sh eval 'return CFPDA.split(120)'      # where a frame goes
tools/autotest/pz.sh eval 'return CFPDA.ticks(600)'      # per-tick handlers
```

`CFPDA.split` is the one to reach for first: it separates the case, the screen
content and the non-drawing checks, so an optimisation lands on the term that
actually costs something.

## Traps in the harness, and the helpers that exist because of them

These all cost a run before they were understood. Use the helpers.

**`grep -c` returns a zero AND fails.** `grep -c PATTERN file` prints `0` and
exits 1 when it matches nothing, so the common idiom

```bash
n="$(grep -c 'lvl=e' "$CONSOLE" 2>/dev/null || echo 0)"   # WRONG: "0\n0"
```

produces *two* zeros, and the next `$(( ))` dies on it — taking the check down
after its last assertion has already passed, with no message. Use
`mod_error_count` from `lib.sh`. `test/harness_lock.lua` fails if the bad idiom
reappears.

**`console.txt` is truncated when the game starts.** An error count taken
before a save-and-reload cannot be compared with one taken after. Ask only
about the session that is running.

**Anything launched in the background inherits the machine lock.** `claim_game`
holds it as file descriptor 9, so a launch without `9>&-` keeps the lock for as
long as it lives — and a game that outlives its check then blocks every later
check at `flock` for twenty minutes, silently. This happened twice, to `Xvfb`
and then to the game launch. `claim_game` now names the holder when it gives
up; if a check ever hangs, run:

```bash
fuser -v ~/Zomboid/.cf-autotest.lock
```

**Empty strings are not numbers.** `[ "$n" -lt 2000 ]` and `$(( ))` both blow
up on an empty or non-numeric value. `is_number` from `lib.sh`.

**`collectgarbage("count")` is not a Lua heap here.** Between eval calls it
drifts by up to 6 MB with nothing happening; within one call it is stable. But
it cannot force a full JVM collection and every UI panel is a Java object, so
growth cannot distinguish "still referenced" from "not yet swept".
`pdalife.sh` reports it with a control and asserts nothing on it. The leak
assertions are the reachability ones: the UI manager's element count, the
window being nil after close, and the handler counts.

**Some event tables are not introspectable.** `CFLIFE.handlers` tries the known
field names and says "unreadable" rather than reporting a confident zero. When
it says that, the handler-duplication assertion is vacuous — read the note, do
not read a pass.

## Adding a test

- Logic, text, a reducer, a projection → `test/`, offline, assert outcomes.
- "Does the player's hand do the right thing" → a check in
  `tools/autotest/checks/`, and add it to `suite.sh`'s list or nobody will run
  it.
- Every bug gets a regression test in whichever tier can actually catch it.
  If only a running game can catch it, that is where it goes.

## Reading the evidence

Every check writes a file to `docs/management/evidence/linux-autotest/` with
its verdict, the commit, **the renderer**, and its own numbers. Those are
committed: they are the record of what was true at a given commit on a given
machine.
