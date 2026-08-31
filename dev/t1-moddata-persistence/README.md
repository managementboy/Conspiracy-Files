# Spike T1 — ModData persistence probe

This is disposable Project Zomboid Build 42 test code for GitHub Issue #1. It is not production Conspiracy-Files code.

## Install

Copy this directory as a local mod so Project Zomboid sees:

```text
ConspiracyFiles_T1_Probe/
├── common/media/lua/shared/ConspiracyFilesT1Probe.lua
└── 42/mod.info
```

Enable **Conspiracy-Files T1 Persistence Probe** only in a disposable single-player save.

The probe writes two namespaced Global ModData tables:

- `ConspiracyFiles.T1.Control`
- `ConspiracyFiles.T1.Payload`

## Manual controls

- **F8** — select the next scenario.
- **F9** — construct and arm it.
- **F10** — call `saveGame()` inside `pcall` and log its synchronous interval.

F11 is intentionally not bound because the tested development setup uses it for fast teleport/debugging. Clear through `ConspiracyFiles.T1Probe.clear()` in the Lua debugger instead. The debugger can also call `.select(index)`, `.prepare()`, `.save()`, and `.validate()`.

The console emits structured `[CF-T1]` records. A successful assignment or returned save call is not success; only the same-save reload and deterministic `VERIFY` result classify a scenario.

## Automated disposable-save mode

The live T1 matrix used save folder names to avoid editing probe code between cases:

- `T1_clean` clears the two probe tags and saves.
- `T1_<scenario>` selects, constructs and saves that scenario on its first load.
- A reload with armed control metadata validates and exits without reconstructing.

Set `latestSave.ini` to the desired T1 save. The probe continues only saves whose name begins `T1_`, and requests a normal quit-to-desktop after the save/validation pass.

If a malformed payload removes the control tag itself, put a file named `ConspiracyFiles_T1_ExpectedReload.txt` in the PZ `Lua` cache directory. Its first line must be the exact save folder name, for example `T1_cycle`. This lets the reload validator report whole-tag loss without mistaking the reload for a first run. Remove the marker after that reload.

Project Zomboid's final loading screen polls raw physical mouse/controller state and suppresses Lua callbacks. The unattended run therefore used the launch-only native helper in `tools/ConspiracyFilesT1GateAgent.cpp`. It waits for the exact engine's `GameLoadingState.done == true`, then sets only `forceDone`, the flag the physical click path sets. It does not modify serializer code, ModData, saves or the installed game. Build it as a DLL against matching official OpenJDK JNI headers and launch the game with:

```text
JAVA_TOOL_OPTIONS=-agentpath:<absolute-path-to-dll>
```

Every release logs `[CF-T1-AGENT]|GATE_RELEASED|reason=engine-done-true`.

## Scenario order

Run `baseline`, then `nil_seed` and `nil_removal` consecutively in one disposable save. Use a fresh clone for every later suspicious scenario:

1. `function_value`
2. `userdata_value`
3. `metatable`
4. `cycle`
5. `shared_reference`
6. `boolean_key`
7. `table_key`
8. `function_key`
9. `userdata_key`
10. `depth_16`, `depth_32`, `depth_64`, `depth_128`, `depth_256`, `depth_512`
11. `scale_1000`, `scale_10000`, `scale_100000`

Record `PREPARE.constructMs`, `SAVE_CALL_RETURN.elapsedMs`, reload `VERIFY`, file size/hash, process responsiveness, console exceptions, and normal-exit `OnPostSave` timing.

## Scale model

Every representative record contains a stable ID, entity type, display name, discovery timestamp, x/y/z location, five metadata fields, three related entity IDs, and three flags/state values. Reload verification walks all records and compares count plus a deterministic aggregate checksum.

Do not interpret the engine's internal 524,288-byte block constant as a 512 KiB persistence limit. The T1 report derives project guardrails from measured live behavior.
