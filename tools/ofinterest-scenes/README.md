# OfInterestScenes.jar - the scene listener (E4)

DR-20260929-NOHELP-GAP-PLAN: ZombieBuddy is a required dependency of Of Interest (copied from No Help)
(owner, 2026-09-29). This small Java mod patches every vanilla story class's
story method (`randomizeBuilding`, `randomizeDeadSurvivor`,
`randomizeZoneStory`, `randomizeVehicleStory`) with a ZombieBuddy advice and
queues one line per generated scene; `VanillaSceneRuntime.lua` drains it with
the global `OISceneDrain(max)` and confirms the scene. `OISceneListener()`
returns `version|seen|dropped|failed|queued` for playtests.

- `gen_patches.py` - reads `projectzomboid.jar` (class files parsed directly)
  and writes `src/conspiracyfiles/ofinterest/ScenePatches.java`: one patch per
  class that declares a story method (143 on Build 42.20.4). Exact names,
  because ZombieBuddy retransforms already loaded classes by exact name only.
- `src/conspiracyfiles/ofinterest/SceneListener.java` - the queue, the Lua
  functions; outermost call per thread only; never throws into the game.
- `stubs/` - a compile-time copy of Kahlua's `@LuaMethod` (the game jar is a
  newer class format than javac 17 reads); never packed.
- `build.sh` - regenerates, compiles (`--release 17`), packs
  `mod-ofinterest/42/media/java/OfInterestScenes.jar` and runs
  `test/SceneListenerTest.java`.

Rebuild after a game update that adds or renames story classes.

## Signing (owner, 2026-09-29: it must open without an approval click)

`sign.sh` writes `OfInterestScenes.jar.zbs` (ZombieBuddy ZBS: Ed25519 over
`ZBS:<SteamID64>:<jar sha256>`); `build.sh` calls it when the key exists.
The private key lives outside the repo (`~/.signing/nohelp-ed25519.pem`, never
committed). The author's Steam profile summary must carry
`JavaModZBS:4a74ae101677a6e8e4e4cbdbd9b5640b4a5d43b0e58af910b0737fbef2c60b4c`
(SteamID64 76561198083988095), or ZombieBuddy cannot find the key. A player
approves the author once ("trust this author"); later signed builds load
without asking. Every rebuild must be re-signed: the signature covers the
jar's exact bytes.
