# T7 runtime item text probe

Disposable Project Zomboid Build 42 code for GitHub Issue #8. This is an auditable spike, not production Conspiracy-Files code.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T7_runtime_text`.

The fixed matrix creates only stamped disposable items in the copied character inventory:

| Case | Vanilla type | Mutation/body path |
|---|---|---|
| notebook-pages | `Base.Notebook` | name, description, ModData, locked `Literature.customPages` |
| note-pages | `Base.Note` | name, description, ModData, runtime-enabled locked custom pages |
| letter-pages | `Base.LetterHandwritten` | name, description, ModData, runtime-enabled locked custom pages |
| photo-pages | `Base.Photo` | name, description, ModData, runtime-enabled locked custom pages |
| static-print | `Base.LetterHandwritten` | name, description, ModData `printMedia` using shipped translation keys |
| dynamic-print | `Base.Photo` | name, description, raw world-specific strings used as `printMedia` lookup keys |
| generic | `Base.Paperclip` | name, description, ModData only |
| key | `Base.Key1` | name, description, ModData only |
| map | `Base.MuldraughMap` | name, description, ModData plus native map open |

Phase 0 creates and logs the matrix, saves normally, and exits. Phase 1 validates the reconstructed items and waits for genuine inventory context-menu/read/open inspection. `[CF-T7]` context-menu observations are emitted whenever a stamped item is right-clicked.

Safety rules:

- copy an already disposable save; never point this probe at a user save or character;
- enable only `ConspiracyFiles_T7_Probe`;
- never copy files into the game installation or replace vanilla Lua;
- hash and back up `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before setup;
- archive every disposable save, installed probe copy, helper, log, and screenshot rather than deleting it;
- restore control files byte-for-byte, remove active probe artifacts, and leave Project Zomboid closed.

The launch-only JNI gate helper is the same narrow helper used by T1-T5. It releases only the final raw-input loading gate after the engine has already set `GameLoadingState.done=true`; it does not inspect or modify items, UI, saves, ModData, or assertions.
