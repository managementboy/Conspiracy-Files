# Linux auto-testing

Set up 2026-09-11. The owner decided that Claude may run the real game
unattended on this Linux machine, and that these runs count as evidence.
The Windows play machine keeps its role: how the game feels, Workshop
delivery, and owner acceptance.

## Use

    tools/autotest/boot_check.sh             # the standard check, ~3.5 minutes
    tools/autotest/checks/wallet_id.sh       # wallet ID observation, ~5 minutes

    tools/autotest/pz.sh start               # fresh world, 102 E Maple St. kitchen, ~2 minutes
    tools/autotest/pz.sh start --at X,Y,Z    # fresh world at another spot
    tools/autotest/pz.sh start --hidden      # on a virtual screen (Xvfb, software OpenGL)
    tools/autotest/pz.sh start --console     # keep the debug Command Console open
    tools/autotest/pz.sh eval 'return getPlayer():getX()'
    tools/autotest/pz.sh eval -f check.lua
    tools/autotest/pz.sh shot out.png        # screenshot of the game window
    tools/autotest/pz.sh log 20              # last mod log lines of this run
    tools/autotest/pz.sh stop

`eval` wraps the code in a function, so use `return` to get values back. It
exits 0 with `ok <values>`, 1 with `error <message>`, 2 on a timeout.

## Boot check

`boot_check.sh` starts a fresh world, lets it run for 60 seconds
(`--soak N` to change), and passes only when:

- every Lua file in `mod/` was loaded by the game,
- no error in the log has the mod in its stack trace, and
- the player is alive.

It writes a short report to `docs/management/evidence/linux-autotest/` and
a screenshot to `dev/eval/linux/runs/`. Exit 0 pass, 1 fail, 2 could not run.
Proven both ways on 2026-09-11: the current build passed, and a temporary file
that errored on game start made it fail with the error message in the report.
Run it before every Workshop publish.

## Wallet ID check

`checks/wallet_id.sh` (about 5 minutes) tests the identity mechanic the owner
named the priority: an ID card inside a body's wallet. It kills zombies beside
the player and uses the wallets and IDs the game itself put on them (it rolls
more bodies until one carries a wallet with an ID), then plays the player's
steps with the game's own UI functions and timed actions: click the body in
the loot panel, carry the wallet off, take it in hand (only a held container
gets an icon), click its icon. PASS needs the ID recorded as a lead from "a
container taken off a corpse", and no errors inside the mod. A loose ID on a
body is checked on the way when the game supplies one.

First result, 2026-09-11 on 7983376: PASS for both paths.

## Start location

Default start is a kitchen at 102 E Maple St., Muldraugh (10837,10147).
Indoors matters: the first case is built around the house the player starts
in and waits while the player is outdoors, so an outdoor start never switches
the identity observer on.

## Game settings for testing

`~/Zomboid/options.ini` was changed on 2026-09-11 (original kept as
`options.ini.before-autotest`): no ragdolls, physics hit reactions, corpse
shadows, blood decals or video effects; voice chat off; inventory, context
menu and tooltip fonts Medium so screenshots are readable. Loading went from
60-66 to 55-57 seconds, which may partly be run-to-run variation.

## What it runs

- **The repo itself.** `~/Zomboid/mods/ConspiracyFiles` is a link to `mod/`, so
  every run uses the working tree. No packaging, no Workshop. The old local copy
  (DEV-0.9.0) was moved to `~/Zomboid/mods-backup/`.
- **Without Steam** (`-nosteam`), so it can run while the owner plays on Windows.
- **A fresh world every start** (P4-R63: no old-save compatibility needed). The
  worlds stay in `~/Zomboid/Saves/Sandbox/` under numeric names, about 11 MB each.

## How it works

1. `start` writes `~/Zomboid/Lua/cf_autotest_session.txt` (expires after 10
   minutes) and launches the game with `-debug -nosteam`.
2. The helper mod `tools/autotest/CFAutoTest` sees the session and starts a new
   world through the game's own debug-scenario launcher. Without a live session
   it does nothing, so a manual launch on this machine behaves normally. It lives
   outside `mod/`, so `package.sh` and Workshop never contain it.
3. After loading, the game waits for a mouse click. This is the only thing Lua
   cannot do, so `pz.sh` holds a click on the game window with `xdotool` and
   then puts the pointer back.
4. From then on everything goes through `ConspiracyFiles.DevEval`:
   `tools/cf_eval.sh` writes `cf_inbox.lua`, the game runs it with
   `reloadLuaFile`, and the answer comes back in `~/Zomboid/console.txt`.

## Things to know

- Debug mode normally opens the Lua debugger on any error and freezes the game,
  even inside `pcall`. The helper switches that off, but only in unattended
  sessions. Manual debug sessions keep "Break On Error".
- The test character has god mode and is invisible to zombies, so a zombie at
  the spawn point cannot end a run. Zombies stay in the world, since corpses
  matter to the mod. `start --mortal` turns this off.
- The debug Command Console is hidden once the world is ready; code arrives
  through DevEval, and screenshots are clearer without it.
- Apart from the one start click, no mouse or keyboard input: checks call Lua,
  including the game's own panel functions (`selectContainer`) and timed
  actions, which is what a click would run. How something looks and feels to
  a player stays with the owner on Windows.
- This PC is dedicated to the mod (owner, 2026-09-11), so using its screen is
  fine. `--hidden` works too, about 5 seconds slower to load.
- Mod Lua has no `loadstring` in this game version, so code always arrives as a file.
