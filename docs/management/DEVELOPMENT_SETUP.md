# Setting up development on another machine

Written for the move to Linux Mint, 2026-09-08. Nothing here is Windows-only
any more; `tools/env.sh` finds each path on either OS and every one of them can
be overridden by environment variable.

**The Linux Mint machine is the development machine from 2026-09-08.** The
toolchain was verified end to end there on that date: all five paths resolve
from a clean environment, the suite reports 53 tests / 0 failures, and the
Kahlua runner reports 72 ok / 0 failed. The Windows machine keeps only the
retained fixture save described below.

## What you actually need

| For | Needed | Notes |
|---|---|---|
| Running the test suite | Lua 5.1 | `sudo apt install lua5.1` |
| Parsing with the game's own compiler | JDK **25 or newer** | The jar is class-file major 69; older JDKs cannot read it |
| Parsing / packaging | Project Zomboid installed | Only for the Kahlua runner; the Lua suite runs without the game |
| Packaging | `zip` or Python | The script uses whichever exists |

Mint: `sudo apt install lua5.1 zip` and a JDK 25 (Azul Zulu or Temurin). The
game's own bundled runtime is a JRE with no compiler, so it cannot be used to
build the Kahlua runner.

`install-jdk25-for-pz.sh` puts Oracle JDK 25 in `/opt/jdk-25` without touching
the system default Java, and `tools/env.sh` looks there. If `javac -version`
still reports 17 on the `PATH`, that is fine and expected - only `JAVA_HOME`
matters, and the Kahlua runner now refuses a JDK older than 25 by name instead
of failing with a wall of "cannot find symbol".

## Check the machine is ready

    . tools/env.sh
    echo "$PZ_HOME"; echo "$ZOMBOID_HOME"; echo "$JAVA_HOME"; echo "$LUA51"

Anything blank, set it explicitly:

    export PZ_HOME="$HOME/.steam/steam/steamapps/common/ProjectZomboid"
    export ZOMBOID_HOME="$HOME/Zomboid"

`ZOMBOID_HOME` is where saves, `mods/` and `console.txt` live. On Linux that is
usually `~/Zomboid`.

`PZ_HOME` must be the directory that actually holds `projectzomboid.jar` and
`stdlib.lua`. The Linux Steam layout nests both one level below the app
directory, in `.../ProjectZomboid/projectzomboid/`, where Windows puts them at
the root; `env.sh` descends automatically, including into a `PZ_HOME` you set
yourself.

## The three commands that matter

    "$LUA51" test/run.lua          # the suite; must be 53 tests, 0 failures
    tools/kahlua/run.sh --parse-all # every shipped file, the ENGINE's compiler
    tools/verify_install.sh         # requires resolve; repo matches deployed

The second is not a luxury. PUC Lua 5.1 is not what the game runs - Kahlua is,
and it is an incomplete Lua 5.1. See docs/research/KAHLUA_CLI.md.

## Deploying to your own game

    tools/package.sh --install

Wipes and rewrites `$CF_INSTALL`, so no stale file survives. Then check
`tools/verify_install.sh` reports "identical".

## Things that will differ on the new machine

- **Saves and backups do not travel.** `docs/testing/FIXTURE_SAVE_2026-09-07.md`
  describes a retained fixture that exists only on the Windows machine. Copy
  `Zomboid/Saves/Sandbox/wallet key and corpse` across if you want it; the
  master is the untouched one. As of 2026-09-08 the Linux machine has one
  unrelated Sandbox save from 2026-09-04 and the fixture has not been copied.
- **The mod is not deployed on the Linux machine yet.** `tools/package.sh
  --install` has never been run there, so `$CF_INSTALL` does not exist and
  `verify_install.sh` skips its repo-vs-install comparison. The first deploy
  there is current code, not the stale `DEV-0.8.12-selfcheck` build the Windows
  machine was running - bump `UI.VERSION` as part of it.
- **`console.txt` lives under `$ZOMBOID_HOME`.** Every diagnostic tag this
  project logs - `[CF-LEDGER]`, `[CF-VOICE]`, `[CF-PERSON]`, `[CF-SELFCHECK]` -
  is read from there.
- **graphify** lives one directory up, in `ProjectZomboidConspiracyFiles/`, not
  in this repo. On the Windows machine its launcher is not executable from git
  bash (`Permission denied`); reinstall it on the new machine rather than
  copying the shim.
- **Line endings are frozen** by `.gitattributes` (`* -text`). The tree mixes
  CRLF and LF deliberately and `verify_install.sh` compares bytes. Do not
  "normalise" it.

## Fresh save required

The deployed build predates the generator revision bump and the case-retirement
schema change. Any save made before those will be refused with "unsupported
generated case revision", which is correct and expected under P4-R63.
