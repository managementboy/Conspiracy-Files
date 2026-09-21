# CI

CI exists and runs. `.github/workflows/offline.yml` is the implementation; this
page says what it proves and, more importantly, what it does not.

The previous version of this file described CI as "intentionally not enabled
while the repository contains no Lua implementation". There are 124 shipped Lua
files and about 175 tests. It was written before any of them existed and was
never revisited, which is how a rewrite of the whole writing layer reached the
Workshop without a single automated run.

## The one rule

**A green CI run is not a validated build.** Everything CI can do runs without
Project Zomboid. Everything that needs the game — the engine compile gate and
every native acceptance gate — runs locally, and CI prints a warning saying so
on every run rather than letting a green tick imply otherwise.

## Jobs

| Job | Blocks integration | What it proves |
|---|---|---|
| **shipped offline suite (Lua 5.1)** | **yes** | `tools/autotest/unit.sh`: the specs, every standalone shipped test, the relocation regression and the packaging tests, under PUC Lua 5.1 |
| prototype suite | no | `tools/autotest/prototype.sh`: the nine tests of `dev/next-phase/`, which is not in the Workshop build |
| static checks | no | `tools/ci/lint.sh` — luacheck, failing on parse errors only |
| content, fixtures and shipped text | no | escape sequences across all shipped files, text lint, log format, evidence-file validity, harness idiom lock, suite reachability, campaign-fixture contract, one build string |
| package and source consistency | no | the archive is byte-reproducible from source, verifies, and declares the observed build |
| secret scan | no | `tools/ci/secret_scan.sh` over every tracked file |

**Only `shipped` should be a required check in branch protection.** The
prototype job must be *visible* and must not be *blocking*: `dev/next-phase/`
is unshipped, so a failure there is real but is not a defect in the released
product, and reporting it as one is exactly the confusion this split exists to
prevent.

## What CI cannot run, and where it runs instead

### The engine compile gate

Kahlua is the incomplete Lua 5.1 that Project Zomboid actually executes. It
compiles against `projectzomboid.jar`, which is licensed game content and
cannot be placed on a hosted runner.

**PUC Lua parsing does not prove Kahlua compatibility.** That is not a
theoretical gap; it cost a release (255d992). So `unit.sh` on a machine without
the game prints

```
kahlua parse: NOT EXERCISED - no Project Zomboid on this machine.
kahlua parse: this is not a pass; run tools/autotest/kahlua_gate.sh where the game is installed.
```

and the CI job raises the same warning. The gate itself is:

```bash
tools/autotest/kahlua_gate.sh
```

Exit 0 every shipped file compiles, 1 one did not, **2 the gate could not run**
— which is not a pass either. It is required before a release. A self-hosted
runner with the game installed could carry it; until one exists it is a local
gate, named in the release-candidate report with its own result.

### Native acceptance

```bash
tools/autotest/native.sh --list
```

These boot a real game. They are not CI's to run and never will be on a hosted
runner. See `docs/TESTING.md`.

## Reproducing the offline baseline from a clean checkout

```bash
git clone <remote> Conspiracy-Files && cd Conspiracy-Files
sudo apt-get install -y lua5.1 luacheck python3
CF_SKIP_KAHLUA=1 tools/autotest/unit.sh    # shipped
tools/autotest/prototype.sh                # prototype, separately
tools/ci/lint.sh
tools/ci/secret_scan.sh
tools/autotest/kahlua_gate.sh              # needs the game; NOT part of the above
```

Every job starts by confirming it is in the Conspiracy-Files repository root
(`AGENTS.md`, `mod/42/` and `test/` all present), because this repository is
nested inside a larger workspace and a run that starts one directory up finds
no tests and reports nothing wrong.

## Caching

The jobs install `lua5.1`, `luacheck` and `python3` from the runner image's
package index and run in well under a minute; there is no dependency tree to
cache. `actions/setup-python` caches its own toolchain. Adding a cache here
would trade a few seconds for a class of stale-cache failure that is much
harder to diagnose than a re-install.
