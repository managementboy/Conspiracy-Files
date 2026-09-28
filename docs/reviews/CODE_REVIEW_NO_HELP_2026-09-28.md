# Static Code Review — Conspiracy Files: No Help

**Re-reviewed:** 2026-09-28  
**Repository:** `managementboy/Conspiracy-Files`  
**Branch / revision:** `nohelp-content` at `4c9c640854bbe2b175ab87ebcad3bdbf6f850be7`  
**Changes reviewed:** Claude's `nohelp-task3-plan` branch, merged through PR #38, plus the earlier static review.  
**Scope:** `mod-nohelp/` runtime/package metadata and the tests/checklist added with this merge. Focused review, not a line-by-line audit of all 3,425 tracked files.

## Findings

### F-01 — Package compatibility range was broader than verified — RESOLVED

Claude changed both `mod-nohelp/42/mod.info` and `mod/42/mod.info` to `versionMin=42.20.4`. `test/nohelp_mod_info.lua` ties both values to the verified build recorded in `PROJECT_STATE.md`. The earlier package-metadata finding is closed in this revision.

### F-02 — Vehicle-scan errors were swallowed — RESOLVED

`Storage.lua` now logs a failed optional vehicle scan and passes a failure flag to its caller. `test/nohelp_storage_vehicles.lua` covers both failure and success. The earlier silent-failure finding is closed in this revision.

### F-03 — The state-dump menu is exposed in ordinary single-player

**Severity: P2 — development-tool exposure / acceptance mismatch**

`mod-nohelp/common/media/lua/client/NHShared/StateDumpTrigger.lua` gates the trigger only on single-player and the T11/T12 modes. Its `OnFillWorldObjectContextMenu` handler adds **Dump State** whenever that gate passes. There is no debug/development check, so the entry appears in ordinary single-player play.

The development checklist describes C6 as a **debug-gated** menu or key entry. `test/nohelp_dump_trigger.lua` verifies only multiplayer/mode gating and explicitly expects the menu option to appear in an otherwise ordinary single-player stub. The test therefore locks in behavior that contradicts the checklist.

The dump is content-blind, which limits the impact, but it is still a development diagnostic in the player's normal world-object menu.

**Claude action:** Gate both the menu option and direct trigger behind a Build-42-verified development/debug condition, or keep this tool out of the shipped package. Add tests for debug-off and debug-on behavior. Verify the engine predicate in project research before relying on it.

**Evidence:** `StateDumpTrigger.lua` (`allowed`, `fillContextMenu`); `test/nohelp_dump_trigger.lua` (“GATE OPEN in single-player” and context-menu test); `docs/management/NO_HELP_DEV_CHECKLIST_2026-09-28.md`, C6.

## Open acceptance checks — not confirmed defects

1. **Cold-load cost:** `Storage.lua` still eagerly requires the 3.8 MB generated fixed-container payload. The new index code defers per-building validation, not loading/parsing the Lua table. The checklist still calls for measuring first-load time and memory in the real game.
2. **Crash recovery and a full playthrough:** the checklist says the retry rule for a crash during `placing` is provisional and still open for the owner. D1's force-kill/save-window test and D2's visible playtest are unchecked. The 2026-09-26 handoff also said the extracted mod had not yet been played through. Do not treat fake-world reload tests as native save-order proof.
3. **Late-game cost:** the checklist reports a synthetic 10x-record write at 53 ms after the completed optimization work. The append-only/keyed commit work (A3-A7) is paused, and the real-game late-save stutter check remains open. This is a measured risk, not a confirmed in-game defect.

## Verification

The `nohelp-content` GitHub workflow passed on merge commit `4c9c640`. It runs the converter check and the `test/nohelp_*.lua` suite. No full offline workflow or Project Zomboid playtest is evidenced by that result.

This review was static. I did not execute Lua tests or launch the game myself.
