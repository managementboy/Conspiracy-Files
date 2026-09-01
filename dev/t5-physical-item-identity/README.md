# T5 physical item identity probe

Disposable Project Zomboid Build 42 code for GitHub Issue #6. This is an auditable spike, not production Conspiracy-Files code.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T5_identity` or `T5_death`.

- `T5_identity` stamps a detached `Base.Note`, moves the exact item through player inventory, an ordinary world container, the floor, a vehicle container when available, and back to inventory, saving and reloading after each meaningful stage. It then destroys the item and verifies permanent absence after reload.
- The same run exercises fresh-instance, `createCloneItem`, `copyModData`, `CopyModData`, and a controlled count-split-via-clone path. Duplicate stamps are reported as conflicts and are never silently repaired.
- `T5_death` is a separate copied save/character. It stamps an item, saves/reloads it, kills only that disposable character, scans the resulting corpse, then saves/reloads the corpse when engine flow permits.

Structured output uses `[CF-T5]`. Each transition logs pre-state, action, stamped identity, observable engine ID, location, save/reload result, and duplicate count. A returned `saveGame()` call is not considered persistence proof; the following load is.

Safety rules:

- copy an already disposable save; never point this probe at a user save or character;
- enable only `ConspiracyFiles_T5_Probe`;
- never copy files into the game install or replace vanilla Lua;
- archive completed/failed saves, installed probe copies, helper binaries, and raw output rather than deleting them;
- restore `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` byte-for-byte;
- remove the probe from the active mod path and leave Project Zomboid closed.

The launch-only JNI gate helper is identical in scope to T1-T4: it waits for the engine's own `GameLoadingState.done=true`, then releases only the final raw-input gate. It does not inspect or modify items, containers, saves, ModData, test state, or measurements.
