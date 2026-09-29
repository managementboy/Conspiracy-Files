# NoHelpScenes.jar - the scene listener (E4)

DR-20260929-NOHELP-GAP-PLAN: ZombieBuddy is a required dependency of No Help
(owner, 2026-09-29). This small Java mod patches every vanilla story class's
story method (`randomizeBuilding`, `randomizeDeadSurvivor`,
`randomizeZoneStory`, `randomizeVehicleStory`) with a ZombieBuddy advice and
queues one line per generated scene; `VanillaSceneRuntime.lua` drains it with
the global `NHSceneDrain(max)` and confirms the scene. `NHSceneListener()`
returns `version|seen|dropped|failed|queued` for playtests.

- `gen_patches.py` - reads `projectzomboid.jar` (class files parsed directly)
  and writes `src/conspiracyfiles/nohelp/ScenePatches.java`: one patch per
  class that declares a story method (143 on Build 42.20.4). Exact names,
  because ZombieBuddy retransforms already loaded classes by exact name only.
- `src/conspiracyfiles/nohelp/SceneListener.java` - the queue, the Lua
  functions; outermost call per thread only; never throws into the game.
- `stubs/` - a compile-time copy of Kahlua's `@LuaMethod` (the game jar is a
  newer class format than javac 17 reads); never packed.
- `build.sh` - regenerates, compiles (`--release 17`), packs
  `mod-nohelp/42/media/java/NoHelpScenes.jar` and runs
  `test/SceneListenerTest.java`.

Rebuild after a game update that adds or renames story classes. The jar is
unsigned: ZombieBuddy asks the player to approve it once.
