# Spike T8 — Building, room and non-building arrival detection

- **Status:** Proven with explicit reload/reference limitations
- **Project Zomboid build tested:** Stable 42.20.4 b0bbce05d5; Steam build 24909800
- **Platform:** Windows 11 build 26200, single-player `-nosteam`
- **Probe path/commit:** `dev/t8-location-arrival/`; commit recorded by the enclosing T8 branch
- **API/event/classes used:** `Events.OnPlayerMove`, `Events.OnTick`, `IsoPlayer:teleportTo`, `IsoGridSquare`, `IsoBuilding`, `IsoRoom`, `RoomDef`, `IsoMetaGrid.Zone`, Global ModData

## Question

Which Build 42 signal and predicates can confirm arrival once at curated room, whole-building, floor-specific, basement and outdoor locations without confirming adjacent or wrong-floor positions?

## Method

An isolated probe ran against disposable copied Sandbox saves with only `ConspiracyFiles_T8_Probe` enabled. Fixed vanilla police-office and coroner fixtures supplied exact building, room and floor identities; outdoor bindings used an explicit radius, an axis-aligned rectangle and an installed `Police` zone. Scripted waypoints exercised adjacent negatives, entry, room transitions, floor changes, leave/re-entry, radius and rectangle boundaries, zone leave/re-entry, and a separate wrong-floor/basement entry pair.

The first event-only attempt counted `OnPlayerMove`. Because scripted teleports delivered no movement callbacks, the final mechanism also sampled current-square state every 15 `OnTick` callbacks (approximately 4 Hz in the measured 60-tick/s runs). A candidate needed two consecutive samples with the same logical square before confirmation. Confirmation state was sticky so later matching samples and leave/re-entry could not append a second event.

## Observed behaviour

- Scripted `IsoPlayer:teleportTo` transitions delivered zero `OnPlayerMove` callbacks in every completed run. `OnPlayerMove` alone therefore cannot be the arrival authority for this exercised transition path.
- The clean main-run prefix through waypoint 17 correctly handled adjacent exterior, exact room, whole building, another room in the same building, floor 1, return to floor 0, building leave/re-entry, radius adjacent/boundary negatives, rectangle adjacent negative, and a real installed `Police:ZombiesType` zone with leave/re-entry. No negative waypoint in that prefix confirmed a location.
- Room, building, floor, radius, rectangle and installed-zone bindings each confirmed exactly once. Re-entry produced match edges but no duplicate confirmation; the final counters recorded one confirmation per binding with later matches suppressed.
- A separate two-waypoint basement run rejected the same coordinates on floor 0 and confirmed the exact morgue room on floor -1 once, with zero failures and zero false confirmations.
- Exact predicates were shape-specific: building plus room identity for a room; building identity for the whole building; building plus `z` for a floor; building, room and `z` for a basement; squared distance plus exact `z` for a radius; half-open coordinate bounds plus exact `z` for a rectangle; and installed-zone `contains(x,y,z)` plus exact `z` for a real zone.
- Later long scripted-teleport sequences stopped moving reliably. The clean main prefix then remained at the zone waypoint instead of reaching the delayed-reference and basement waypoints; earlier long runs failed at different late points. Those are harness/teleport-exhaustion failures, not observed arrival-detector failures.

## Measurements

- Main clean prefix: 17 waypoints, 6 bindings confirmed once, 0 false confirmations and 0 `OnPlayerMove` callbacks.
- Confirmation latency from waypoint start was 248–344 ms in that prefix: room 344 ms, whole building 344 ms, floor 337 ms, radius 251 ms, rectangle 275 ms and installed zone 248 ms.
- First-match-to-confirmation latency in that prefix was 124–158 ms, corresponding to the second stable 15-tick sample.
- Basement phase 0: 2 waypoints, 1 confirmation, 0 failures, 0 false confirmations and 0 `OnPlayerMove` callbacks; confirmation was 258 ms from waypoint start and 126 ms from first match.
- The completed main run recorded 480 bounded poll callbacks; the completed basement run recorded 80. Confirmed locations suppressed 18–111 later matching samples in the main run and 58 in the basement run without duplicating the domain event.

## Limitations

- This was single-player `-nosteam` on one exact stable build, using controlled scripted teleports and fixed vanilla fixtures rather than ordinary walking, final Dead Air bindings, multiplayer or mod-map geometry.
- The main probe's overall matrix status was `FAIL` because movement became unreliable after the valid 17-waypoint core prefix. The report treats only reached/asserted waypoints as evidence and does not reinterpret failed late movement as an arrival result.
- The delayed-reference case was not established in the clean run. A production adapter should arm only referenced bindings, but this ordering still requires an adapter test.
- The separate basement phase proved wrong-floor rejection and first entry only. Its optional reload/inside pass never reached the world because the launch remained at a startup input gate; it proves no reload or re-entry behavior.
- A reload-while-inside/idempotency production-adapter matrix remains required. Sticky confirmation was observed within completed sessions, not after a completed reload.
- The probe measured detection latency, not the full production adapter/domain/persistence cost. The production queue must still stay within P4-R16 and place every event boundary behind `pcall`.

## Verdict

Use bounded, debounced state sampling as the authoritative arrival mechanism; do not depend on `OnPlayerMove` alone. At approximately 4 Hz, sample only the small set of currently referenced curated bindings, require two consecutive matching samples for the same logical square, and persist a sticky confirmed location ID before emitting the one domain event. Keep predicates exact and binding-specific for room/building/floor/basement/radius/rectangle/zone shapes. `OnPlayerMove` may be an opportunistic wake-up for ordinary movement, but correctness must come from bounded state sampling and idempotent domain state.

## Decision links

- Resolves T8 / GitHub Issue #9 and adds **P4-R39**.
- Converts `CF-V01-E07` from spike-blocked to an executable production-adapter matrix, while leaving exact Dead Air target selection and implementation outstanding.
- T10 remains the only required open Gate B probe; T6 remains conditional on future retrofit work.
