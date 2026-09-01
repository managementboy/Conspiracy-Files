# T8 location-arrival probe

Disposable Project Zomboid Build 42 code for GitHub Issue #9. This is an auditable spike, not production Conspiracy-Files code. It does not select either final Dead Air location.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T8_location_arrival`. The main matrix runs in `T8_location_arrival`; a separate `T8_location_arrival_basement` copied save runs the basement matrix so late-session teleport exhaustion cannot be mistaken for an arrival result. It resolves fixed vanilla test buildings by exact bounds, derives fixed room/floor/basement waypoints from their installed `RoomDef` rectangles, then uses controlled `IsoPlayer:teleportTo` movement through this matrix:

- adjacent exterior negative, whole-building entry, room-to-room, floor change, leave/re-enter;
- exact room, whole building, floor-specific and basement predicates;
- outdoor radius and explicit rectangle predicates with adjacent/boundary negatives;
- one exact installed `Police` zone, armed only after earlier building traversal;
- an unreferenced room binding that is armed later;
- a second load while already inside, with prior confirmations restored.

The probe logs every structured observation under `[CF-T8]`. It measures raw `OnPlayerMove` callback frequency, repeated callbacks on one square, first-match and confirmation latency, transition counts, idempotent suppression, false confirmations on negative waypoints, and callback-body duration. It also samples current-square state every 15 `OnTick` callbacks (approximately 4 Hz in the measured run) because the initial controlled-teleport pass established that teleport transitions do not emit `OnPlayerMove`. A match requires two consecutive samples with the same logical square. Confirmed IDs are persisted before the reload pass.

Safety rules:

- copy an already disposable save; never point this probe at a user save or character;
- enable only `ConspiracyFiles_T8_Probe`;
- never copy files into the game installation or replace vanilla Lua;
- hash and back up `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before setup;
- archive every disposable save, installed probe copy, helper, log, and screenshot rather than deleting it;
- restore control files byte-for-byte, remove the active probe, and leave Project Zomboid closed.

The launch-only JNI gate helper used by earlier spikes may be used unchanged. It releases only the final raw-input loading gate after the engine has already set `GameLoadingState.done=true`; it does not inspect or modify player location, events, assertions, saves, or probe state.

## Recorded result

The authoritative clean main prefix reached waypoints 1–17 and confirmed room, whole-building, floor, radius, rectangle and installed-zone bindings exactly once with zero false confirmations; a separate phase confirmed the basement binding after rejecting the same coordinates on floor 0. Scripted teleports delivered zero `OnPlayerMove` callbacks, so bounded 15-tick sampling with two stable samples is the required mechanism. Later long-sequence teleports became unreliable, and the optional basement reload never entered the world. Delayed-reference ordering and reload-inside behavior are therefore limitations, not claimed results. See `evidence/live-run.txt` and `docs/research/T8_LOCATION_ARRIVAL.md`.
