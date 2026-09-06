# Automatic investigations — DEV-0.8.3-automatic

Owner P4-R66: no console command for the first or later mysteries; the first opening clue belongs in the player's current house. Current build remains debug single-player (T11/T12/MP excluded). Automatic startup selects generated mode before legacy startup, then calls existing marker/address/trial initialization after gameplay begins.

## Behavior

The first attempt waits until indoors. It records the current building definition ID from player square -> getBuilding -> getDef -> getIDString. Installed DebugContextMenu.lua uses the same square/building/definition path; T3 already uses definition ID strings. T3 selection now retains this required building within its12-building cap. Real loaded storage is still required in both sites. Generator.generateSelected fixes the first location to this exact building and selects a distinct eligible partner within survival reach. If the building changes during preparation, abort before commit and retry. Missing storage means waiting, never silently substituting a neighbour's house. Basements/upper rooms remain eligible within that building.

Subsequent attempts use the player's current position and existing survival reach, exclude all retained sites, and run only after24 in-game world-age hours since the last committed case. This is a test pacing default in AutomaticInvestigations.config, not a previously owner-approved numerical rule. Existing cap is3 retained investigations total for this slice; no completion required for the second/third. No archival/rolling fourth case is implemented. Pending placements defer further cases conservatively. Poll startup after30 ticks, then at600-tick retry intervals; metadata/storage processing remains bounded by existing queues. No unexplored clue is added to notebook/map merely because a case was created.

Creation commits schedule={schema=1,createdHours={...}} in the same validated campaign replacement as the new case. Inspection/status replacements preserve that clock; save/reload never resets it. Invalid/failed commits do not advance it. Current-build shared500KB budget applies. Preparation errors release retry state; native T3 errors report to runtime rather than leaving a stale wait. No old-save migration: use a fresh save for automatic acceptance. Existing manual cases are left intact and do not receive an invented retrospective clock.

## Named tickets

Base.ParkingTicket and Base.SpeedingTicket added to the same visible-document allowlist as IDs/credit cards. Exact item declarations verified in installed generated/items/literature.txt (8193/8203). Record only existing displayed labels. No claim yet that every native ticket bears its corpse's name; player-observed names are never substituted with hidden descriptor names.

## Verification

test/automatic_investigations.lua drives actual AutomaticInvestigations, Trial and GeneratedRuntime with native mocks: outside deferral, automatic first-house placement, persisted24h gap, later generation with zero discoveries, current anchor, reload no extra items, failed save/retry, three-case cap, cross-save reset, moving-building cancellation and MP guard. test/automatic_case_clock.lua validates strict clock/count/ordering/finite values and replacement retention. T3 native mock confirms required building survives category selection without exceeding12 sites. Existing successive-case, G2 smoke/fault, aggregate save budget and identity observation regressions pass; Lua5.1 syntax checked. Native game acceptance remains pending.

## Owner test

1. Fully exit/restart PZ with debug still enabled, then create a fresh disposable save and spawn inside a house. Do not run Trial.start or nextCase.
2. Stay inside briefly while metadata/storage loading completes. Search furniture for the opening mixed-evidence clue. Notebook sidebar should initialize automatically. No closer zoom or console command needed.
3. Let24 in-game hours pass, preferably moving through a different neighbourhood with unused loaded buildings. A later investigation can appear even with earlier clues unfinished. If nearby eligible storage is unavailable, retries wait without replacing old clues.
4. Save/quit/reload before a later gap expires; confirm the wait is not restarted and prior evidence remains. Native logs can be read by PM to distinguish timing from unavailable loaded storage.

No cards/tickets planted, professions assigned, saves deleted or old facts changed by this delivery.

Installed2026-09-06: eight source/live Lua hashes matched; backup20260906-172207-automatic-investigations. T3Nearby/Selection live paths confirmed in client/ConspiracyFiles with no duplicate shared copy. Native acceptance pending owner restart/fresh save.

Latest native acceptance2026-09-06: owner passes finding clues after the DEV-0.8.4 separate-container placement update. Automatic first-case startup was previously confirmed in native logs. Owner defers24-hour later-case gameplay testing; keep that native gate pending without changing the timing default or requiring further play now.
