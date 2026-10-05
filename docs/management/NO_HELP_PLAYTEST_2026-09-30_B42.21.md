# No Help playtest on Build 42.21 (2026-09-30)

Owner played the Workshop build (item 3810750865, `0.1.0-dev+314b4a51`) on
Windows, Build **42.21.0** (revision 4a0e9546ec), with Claude following
`console.txt`. Branch `nohelp-version-42.20plus`. What was learned, and what
is still open.

## Setup facts

- **ZombieBuddy 2.3.2 (Workshop 3619862853) loads no Java mods on 42.21.**
  The watermark says "No active Java mods"; ZBBetterFPS failed the same way.
  Upstream issue zed-0xff/ZombieBuddy#53: 42.21 changed
  `ZomboidFileSystem.loadMods(ArrayList<String>)` to `loadMods(List<String>)`,
  so ZombieBuddy's hook matches nothing.
- **RESOLVED UPSTREAM 2026-10-03: ZombieBuddy 2.3.4** ("backport fix for
  #56", Workshop updated the same day) takes `List<String>`, and issue #53 is
  closed. The owner's game ran the official 2.3.4 on 42.21.0 on 2026-10-03:
  it loaded the Java mods, verified `NoHelpScenes.jar` and applied all 143
  scene patches. **42.21 players only need ZombieBuddy 2.3.4 or later.**
- *History:* until then the owner ran a local build, ZombieBuddy tag `v2.3.3`
  with PR #56 ported by hand (5 signatures `ArrayList<String>` ->
  `List<String>`), built with Gradle 9.3.1 + Zulu JDK 25. The patch and the
  rebuild recipe were `tools/zombiebuddy-42.21/`, removed once 2.3.4 shipped;
  see commit 7a250fad. On that build, too, all 143 scene patches applied; the
  42.21 story classes did not change.
- **Clue locations need `-debug`.** Steam launch options
  `-agentlib:zbNative -- -debug`: JVM arguments go before `--`, game arguments
  after. Then, in the Lua console:
  `NHShared.BlindLog=false; NHShared.GeneratedRuntime.devLocations()`.
- **Publishing from Windows:** run `tools/publish_workshop.sh` with Git Bash
  (`C:\Program Files\Git\bin\bash.exe`), not PowerShell. A bare `bash` there
  is WSL.

## Verified in play

- The world record is created at game start. Clues are decided and placed
  from 07:00; the 40-tile arrival ring and the scene listener work.
- **Placement in a vehicle works.** The scene clue at 10779,10615 (fire-rescue
  pickup) was in the car and was recognised by search (`how=search`).
- The nearby scan takes about 480 frames and never more than 2 ms per frame.
- Deferred clues (901 Dixie Highway) wait for arrival as designed.

## Defects

1. **FIXED (ab28ee40): "Dump State" threw on every right-click on the world.**
   `StateDumpTrigger.fillContextMenu` took `(context, worldObject)`, but
   `OnFillWorldObjectContextMenu` passes `(playerNum, context, worldObjects,
   test)`, so it called `addOption` on a number. Test:
   `test/nohelp_state_dump_menu.lua`. **Not yet in the Workshop build.**

## Owner findings to decide

2. **"Found a clue by luck; nothing told me I was close."** It worked as
   designed, but feels wrong. The cue (`ClueCueRules`: 3-tile radius,
   `BASE_CHANCE` 0.8 x light x weather) rolls **once per approach**. The roll
   failed at 11:45 (`cue suppressed ... chance 0.78`), and there is no new
   roll until the survivor goes more than 5 tiles away. A cooldown and a
   one-cue-per-case rule can also suppress it. Options: keep it; raise the
   base chance; or re-roll on a timer while the survivor stays near.
3. **Investigate Area does not work while sitting in a car.** This is vanilla:
   `ISSearchManager:doDisableCheck` turns search mode off whenever
   `character:getVehicle()` is set (`ISSearchManager.lua:1178`), and icons are
   hidden while seated (`ISBaseIcon.lua:542`). Today a clue is recognised only
   by search (`ClueSearch`) or by looking it over in hand (`ClueActions`,
   `how=look`). So a clue in the car you are sitting in can only be found by
   taking it into your hands. To decide: accept, or recognise clues in the
   seated car's containers when the survivor opens them.

## Log noise worth trimming

- `ev=person ... "pane skipped: observer unsupported"`: 269 lines in one
  non-debug session.
- `adopted corpse provenance ... for a queued observation`: repeated 5-9 times
  per corpse.
- The clue-marker startup lines are logged twice per load in debug mode.
- The 09:55 `cue not possible at vehicle ... not there` was not followed by a
  loss: the same clue was present at 11:45 and was found. Probably the car's
  interior was not loaded or visible at the time. Worth watching.

Not No Help: missing vehicle templates from car mods,
`FluidContainerScript` name warnings, `UI_MZHB_*` translation formats, and the
vanilla `IsoDoor.ToggleDoorActual` NullPointerException in `ThumpState`.
