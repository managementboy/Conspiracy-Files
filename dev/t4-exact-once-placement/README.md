# T4 exact-once placement probe

Disposable Project Zomboid Build 42 code for GitHub Issue #5. This is an auditable spike, not production Conspiracy-Files code.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T4_`. It locates ordinary loaded world containers near the copied-save player, binds probe-only targets, and runs a deterministic placement/reconciliation matrix. Every placed `Base.Note` is instantiated and stamped in item ModData before it is exposed to a container.

The matrix covers clean placement, intent-only and post-stamp/post-add/post-verify/post-ledger interruption points, committed-item loss, unavailable and physically removed targets, a simulated burned-target classification, and an injected pre-existing duplicate conflict. Runs 1–3 save and reload the same disposable save so both pre-placement and post-placement recovery are checked. A teleport-away/back phase attempts a real streaming unload/reload and records whether the target square actually became unavailable and whether `LoadGridsquare` fired again.

Safety rules:

- copy an already disposable save; never point this probe at a user save;
- enable only `ConspiracyFiles_T4_Probe`;
- never copy files into the game install or replace vanilla Lua;
- archive the finished save and raw console output rather than deleting them;
- restore `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` byte-for-byte;
- remove the local probe from the active mod path and leave Project Zomboid closed.

Structured output uses `[CF-T4]`. A process exit or a successful `saveGame()` call is not a result; the third-load `MATRIX_RESULT` and per-scenario counts are the result.

For unattended direct launches, the same launch-only loading-gate helper used by T1–T3 can be supplied with `JAVA_TOOL_OPTIONS=-agentpath:<dll>`. Its only intervention is setting `GameLoadingState.forceDone` after the exact engine reports `GameLoadingState.done=true`; it does not touch Lua, saves, containers, items, or ModData.
