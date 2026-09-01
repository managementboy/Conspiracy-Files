# Dead Air location-binding probe

Disposable Project Zomboid Build 42 inspection code for CF-V01-E01. This is an auditable live research probe, not production Conspiracy-Files code.

The probe activates only when it is the sole enabled mod and the current copied Sandbox save is named `CF_location_binding`. It auto-continues only that exact latest save, then inspects the two decision-prioritized vanilla candidates:

- P2 police station: building bounds `(13206,3073)`–`(13238,3101)`;
- R2 communications/news facility: building bounds `(13549,1572)`–`(13581,1604)`.

The runner executes one site per clean boot (`P2` by default, or pass `R2`). For each site it:

- resolves the exact installed `BuildingDef` and every `RoomDef`/rectangle;
- clones the disposable source save and prepositions only that clone at a representative ground-floor room before launch;
- installs the source probe in the Build 42 client Lua tier, then waits for normal world entry and chunk streaming;
- scans the complete building bounds and levels without changing map objects or containers;
- records exact container square, room, object index, container index/type/capacity, object name and sprite signature;
- records exterior-adjacent doors/windows and stair-like objects as access evidence;
- records loaded-square/room coverage and the straight-line distance between candidates;
- exits normally without calling `saveGame()`.

Structured output uses `[CF-LOC]`. Only filtered structured records belong in repository evidence; ordinary console output may contain local paths and stays local.

Safety rules:

- clone an already-disposable save; never run against a user save or character;
- enable only `ConspiracyFiles_LocationBinding_Probe`;
- never replace vanilla Lua or write to installed game files;
- back up and hash `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before setup;
- archive the copied save and installed probe after the run, restore control files byte-for-byte, and leave Project Zomboid closed;
- this probe does not use or restore the prohibited T10 injected-helper route and does not interact with security controls.

The accepted 2026-09-01 result and exact selected bindings are recorded in `docs/research/CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`. The probe itself establishes live physical facts only; the linked decision record owns the story-suitability judgment.
