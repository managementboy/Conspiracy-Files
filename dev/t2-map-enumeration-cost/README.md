# Spike T2 — map/meta-grid enumeration probe

This is disposable Project Zomboid Build 42 test code for GitHub Issue #3. It is not production Conspiracy-Files code.

## Safety

The probe is read-only with respect to map data. It enumerates the already-loaded `IsoMetaGrid` definitions, creates temporary in-memory Lua indexes, releases them between cases, and exits normally. It never replaces vanilla Lua, edits the installed game, writes Global ModData, places items, or mutates building/room definitions.

It only runs in a single-player save whose folder name begins `T2_`. Use a disposable copy and enable only `ConspiracyFiles_T2_Probe`.

## What it measures

- five complete synchronous enumeration passes;
- buildings, rooms, and total useful records touched;
- callback wall time and next-tick gap for synchronous passes;
- one synchronous useful-index build and its Lua heap delta;
- equivalent useful-index builds with budgets of 100, 500, and 1,000 building/room records per `OnTick` callback;
- active wall time, frame count, peak callback time, callbacks over 2 ms, and Lua heap delta for each bounded build.

The useful rebuildable index stores compact building and room records, direct lookup by building/room ID, and room-name buckets. It retains no engine objects and is never persisted. In this exact Kahlua build, `collectgarbage("count")` returns JVM `Runtime.totalMemory() - Runtime.freeMemory()` in KiB. The reported delta is therefore a retained JVM used-heap observation while the Lua index is held, not an object-size calculation or total process memory.

## Install and run

Copy this directory as a local mod named `ConspiracyFiles_T2_Probe`, enable it alone in a disposable `T2_*` Sandbox save, and launch the 64-bit client. Structured output uses the prefix `[CF-T2]`. The probe auto-continues the latest `T2_*` save, runs once, and requests a normal quit to desktop.

For an unattended direct-executable run, compile `tools/ConspiracyFilesT2GateAgent.cpp` as a launch-only JNI agent and set `JAVA_TOOL_OPTIONS=-agentpath:<absolute-dll-path>`. The helper waits for the engine's own completed-loading flag and releases only the final raw-input gate. It does not touch map data, Lua, saves, or measurements.

Preserve filtered `[CF-T2]` and `[CF-T2-AGENT]` lines as repository evidence. Keep raw console output local because it can contain machine paths and unrelated environment details.
