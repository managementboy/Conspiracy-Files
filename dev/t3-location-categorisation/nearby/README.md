# T3 nearby structured extraction — first live trial

Manual, debug-only, single-player extension of T3. Uses the established meta-grid/building/room getters and T8 rectangle getters; no third-party converter code. Original T3 automation is not loaded.

Version 2 selects up to 12 varied nonempty buildings within 1,500 tiles of the position when `start()` is called. Distance is horizontal distance to building bounds, not a route or accessibility test. Room names are read incrementally for in-radius buildings. Up to 12 nearest candidates per category are retained (10 categories maximum). Seeded round-robin selection picks among the nearest three remaining candidates per category; missing categories cause no fabricated fallback. Labels are hints, not confirmed building identities. The anchor is explicitly **not historical spawn data**. Capturing/persisting the original spawn is later integration work.

Scans at most 24 work records per tick with a 1 ms deadline; retains at most 120 candidate building handles during selection. Extracts every attached room and rectangle incrementally; aborts above 4,096 rooms or 16,384 rectangles. Releases engine handles on completion/cancel/error. Logs plain structured records and keeps a plain result in `ConspiracyFiles.T3Nearby.result`. Timings are measured, not a guaranteed frame ceiling. Storage remains unknown; no story, inventory, save, placement, teleport, menu or quit operation occurs.

## Owner run

With the current ConspiracyFiles mod enabled in a debug single-player session, load the deployed file through the ordinary Lua console:

```lua
reloadLuaFile("media/lua/client/ConspiracyFiles/T3Nearby.lua")
ConspiracyFiles.T3Nearby.start()
```

Unpause briefly so OnTick can finish. Look for `[CF-T3-NEARBY] kind="complete"` (fields appear alphabetically, so the marker may follow other fields). Then tell the project manager the test finished; they can read `Zomboid/console.txt`. No travel or manual place approval needed. Cancel with `ConspiracyFiles.T3Nearby.cancel()`. Optional radius argument is 1–5,000 tiles.

The output begins with game version, map and anchor, followed by building records, room records with scan-local ordinals, and rectangle records referencing those ordinals. Bounds are not substitutes for exact room footprints. Completion says `extracted`, not gameplay acceptance. A smaller result is valid scarcity, not fabricated fallback locations. A missing completion or error means incomplete evidence.

## Verification

Run `lua5.1.exe dev/t3-location-categorisation/nearby/test.lua` from the repository. Mocks cover reverse-order nearest selection, all selected rooms/rectangles including basement levels, yielding, empty radius, cancel/reload, debug/MP guards and engine-error cleanup. Version 1 completed live: 9,978 scanned buildings, 12 selected, 62 rooms, 87 rectangles; 564 callbacks, peak 2 ms, none above 2 ms. Archived in `evidence/2026-09-05-live.log`. Version 2 category-selection performance is pending a new owner run.

`dev/generated-investigation/NearbyCatalog.lua` converts a plain version-2 result to the G1 catalog contract. Every candidate retains unknown storage, so G1 correctly refuses generation until live storage is validated. No automatic spawn capture or playable generated case is installed yet.

Reference detour: [PZReverseMapper reader](https://github.com/Unjammer/PZReverseMapper/blob/main/PZ_Mapper_Converter/LotHeaderReader.cs) confirms compiled building-to-room relationships and geometry; our implementation uses PZ Lua APIs instead.

## Survival-based default radius

`start()` now derives radius from character survival time under P4-R55: 250/500/1000/1500 tiles at 0/4/11/21 days. `start(nil, 2)` changes the seed while keeping automatic radius. `start(1500, 1)` explicitly overrides the policy for debug research. Logs identify the source and survival hours. The probe still anchors at current position and does not create or change cases.
