# Spike T3 — location categorisation probe

This is disposable Project Zomboid Build 42 test code for GitHub Issue #4. It is not production Conspiracy-Files code.

## Safety

The probe reads `IsoMetaGrid` building, room, and zone definitions. It retains only filtered candidate summaries and aggregate room/zone-name counts, never writes ModData, never mutates map definitions, and never replaces vanilla Lua. It only activates in a copied disposable single-player save whose folder starts `T3_` and when `ConspiracyFiles_T3_Probe` is the only active mod.

Every enumeration callback is bounded by both 48 records and a 1 ms elapsed-time deadline, below T2's tested 100-record/2 ms edge. Output is also emitted incrementally behind the same deadline.

## Run

Copy this directory as the local mod `ConspiracyFiles_T3_Probe`, enable it alone in a disposable `T3_*` Sandbox save, and launch the 64-bit client with `-nosteam`. The probe auto-continues the latest matching save and requests a normal quit when complete. For an unattended direct launch, compile the launch-only JNI loading-gate helper in `tools/` and set `JAVA_TOOL_OPTIONS=-agentpath:<absolute-dll-path>`.

Preserve filtered `[CF-T3]` and `[CF-T3-AGENT]` lines. Keep ordinary raw PZ console output local because it can contain machine paths and unrelated environment details.
