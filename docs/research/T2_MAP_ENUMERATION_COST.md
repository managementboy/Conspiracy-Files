# Spike T2 — full map/meta-grid enumeration cost

- **Status:** Complete — live isolated single-player probe executed on the development PC
- **Project Zomboid build tested:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 Pro `10.0.26200` build 26200; Intel Core i9-13900H; 34,070,192,128 bytes RAM; direct 64-bit client; single-player; `-nosteam`
- **Probe path/branch:** `dev/t2-map-enumeration-cost/` on `spike/t2-map-enumeration-cost`; live-tested Lua SHA-256 `8C79C770AB2C7BBA4C6C9FEEC4127457714CB066CE73477474819557F32F0D76`; committed SHA-256 `0B1281764597CC1B980351ED41BEDA95B63FA832C4E16E7442B8C1205D76ABD2` after removing one trailing blank line (all executable lines unchanged)
- **API/event/classes used:** `Events.OnGameStart`, `Events.OnTick`, `getWorld`, `IsoWorld.getMetaGrid`, `IsoMetaGrid.getBuildings`, `BuildingDef.getRooms`, `BuildingDef`/`RoomDef` ID, bounds, level/name/area getters, `getTimeInMillis`, `collectgarbage`
- **Execution date:** 2026-08-31

## Question

What is the real main-thread and memory cost of enumerating all Build 42 map/meta-grid building and room definitions from ordinary Lua on the current stable vanilla map, and what scheduler and Location Registry constraints follow?

## Method

The probe was the only active mod in a copied disposable `T2_map` single-player save. It called the documented `getWorld():getMetaGrid():getBuildings()` path after `OnGameStart`, traversed each `BuildingDef:getRooms()` list, and used only public getters. The same signatures were checked against the exact installed JAR and the official Build 42 Javadocs. The live run is the evidence that the documented Java path is callable from ordinary Lua on this build.

The current vanilla map string contained Brandenburg, Echo Creek, Ekron, Fallas Lake, Irvington, March Ridge, Riverside, Rosewood, Valley Station, West Point and Muldraugh. The meta-grid reported bounds `-250,-250` through `250,250`, width/height `501`, and `wasLoaded=true`.

The run had four stages:

1. sample 120 ordinary `OnTick` start gaps;
2. execute five full synchronous count/checksum scans on separate frames;
3. synchronously build one useful rebuildable index;
4. build the equivalent index with hard budgets of 100, 500 and 1,000 records per `OnTick` callback.

A useful record means one building or one room. The index stored compact building/room facts, direct lookup by building and room ID, and room-name buckets. It retained no `BuildingDef`, `RoomDef` or other engine object and was never written to ModData.

`collectgarbage("count")` is not a Lua-only counter in this Kahlua build. Installed bytecode shows it returns `(Runtime.totalMemory() - Runtime.freeMemory()) / 1024`; `collectgarbage("collect")` calls `System.gc()`. Memory results are therefore retained JVM used-heap deltas while the index is held, not exact Lua-object sizes or total process working set.

The raw successful console remains in the git-ignored local audit directory because ordinary PZ output contains machine paths. Filtered structured evidence is committed at [`../../dev/t2-map-enumeration-cost/evidence/live-run.txt`](../../dev/t2-map-enumeration-cost/evidence/live-run.txt); installed API evidence is at [`../../dev/t2-map-enumeration-cost/evidence/installed-api.txt`](../../dev/t2-map-enumeration-cost/evidence/installed-api.txt).

## Observed behaviour

- The documented `getWorld` → `IsoWorld.getMetaGrid` → `IsoMetaGrid.getBuildings` → `BuildingDef.getRooms` path was callable from ordinary vanilla Lua.
- The map exposed **9,978 buildings** and **86,436 rooms**, for **96,414 useful records**.
- All five full scans returned the same counts and checksum `465114197`.
- A full non-allocating scan occupied the `OnTick` callback for 227–244 ms. The corresponding callback-start intervals were 237–255 ms.
- The equivalent useful index contained 9,978 building records, 86,436 room records, 588 distinct room-name keys and 86,436 room-name bucket entries.
- The process exited normally with code 0. An external approximately-100 ms sampler collected 498 samples and saw zero `Responding=false` samples; this coarse Windows state does not contradict the directly measured main-thread stalls.

## Measurements

### Synchronous enumeration

| Pass | Buildings | Rooms | Useful records | Callback wall time | Next callback start interval |
|---:|---:|---:|---:|---:|---:|
| 1 | 9,978 | 86,436 | 96,414 | 244 ms | 255 ms |
| 2 | 9,978 | 86,436 | 96,414 | 231 ms | 242 ms |
| 3 | 9,978 | 86,436 | 96,414 | 232 ms | 243 ms |
| 4 | 9,978 | 86,436 | 96,414 | 227 ms | 237 ms |
| 5 | 9,978 | 86,436 | 96,414 | 228 ms | 238 ms |

The 120-tick baseline averaged 16.725 ms between callback starts, with an 8 ms minimum and one 260 ms maximum. Because the baseline itself had a startup/background outlier, T2 does not attribute every long frame interval exclusively to this mod. The timed callback body nevertheless proves that each synchronous scan directly occupied the event thread for at least 227 ms; this alone exceeds P4-R16 by more than two orders of magnitude.

### Bounded useful-index construction

| Budget | Frames | Active wall time | Callback total | Mean callback | Peak callback | Callbacks >2 ms | Count/checksum-equivalent records |
|---:|---:|---:|---:|---:|---:|---:|---|
| 100 records/frame | 965 | 8,045 ms | 536 ms | 0.555 ms | 2 ms | 0 | 96,414, exact counts |
| 500 records/frame | 193 | 1,621 ms | 411 ms | 2.130 ms | 4 ms | 54 | 96,414, exact counts |
| 1,000 records/frame | 97 | 982 ms | 395 ms | 4.072 ms | 6 ms | 93 | 96,414, exact counts |

One hundred records per frame was the only tested batch size that stayed within the `≤2 ms` callback ceiling on every measured frame. It reached the ceiling exactly and therefore is a tested upper bound, not comfortable production headroom. A production scheduler should use both a lower record cap and an elapsed-time deadline so unusually expensive records or slower systems cannot violate P4-R16.

### Useful-index memory

| Construction | Retained JVM used-heap delta while held |
|---|---:|
| Synchronous | 92,160 KiB / 94,371,840 bytes (90 MiB) |
| 100 records/frame | 98,304 KiB / 100,663,296 bytes (96 MiB) |
| 500 records/frame | 104,448 KiB / 106,954,752 bytes (102 MiB) |
| 1,000 records/frame | 104,448 KiB / 106,954,752 bytes (102 MiB) |

The practical observed range is **90–102 MiB**. Variation reflects JVM allocation/GC behavior and concurrent engine activity; it is not evidence that logically identical indexes have different exact object sizes. The process working-set peak was 5,972,160,512 bytes, but that includes the entire game/JVM and is not an index-cost measurement.

The forced full-GC calls used only to bracket memory measurements took 316–484 ms. They are probe instrumentation, not an acceptable production memory-measurement technique and were excluded from the bounded callback timings.

## Architecture impact

- **P4-R16 is retained and strengthened.** A full scan must never run synchronously during normal play. Future map-wide work requires queued processing with both record and elapsed-time bounds. The observed 100-record case is only a maximum tested boundary; production should leave headroom.
- **P4-R17 is unchanged.** The useful index is a rebuildable session cache, not canonical state. Persisting it would violate the hard `≤500 KB/save` budget by roughly two orders of magnitude even before serialization overhead.
- A future Location Registry may stream over the complete map, but should retain only filtered candidate facts needed by T3+ behavior. Retaining a rich Lua record for every room costs about 90–102 MiB on this map and should not be the default architecture.
- v0.1 continues to use two curated/hardcoded locations. T2 does not select those locations and does not expand v0.1 into automatic map-wide discovery.
- Vanilla Lua is sufficient to enumerate the map when scheduled. No Java/ZombieBuddy production dependency is justified by T2.

`DECISIONS.md` records this as P4-R34: future map-wide discovery is a rebuildable, non-persistent, filtered session process with dual record/time bounds; normal play may not perform a synchronous full scan.

## Limitations

- One Windows PC, one stable build, one vanilla map set, one isolated single-player run.
- No Workshop map mods were active. T2 does not establish how counts or timings scale with mod maps.
- T2 measured enumeration and generic index construction, not category correctness; T3 still owns location categorisation reliability.
- `getTimeInMillis` has millisecond resolution, so sub-millisecond callback variation is quantized.
- The baseline contained one unrelated/background 260 ms callback-start gap. Direct callback-body timing, not Windows responsiveness or baseline subtraction, is the evidence for synchronous blocking.
- `collectgarbage("count")` measures JVM used heap, not Lua allocations in isolation. The 90–102 MiB range is an observed practical retained-heap delta, not a byte-exact object graph size.
- Full GCs materially stalled the event thread and were test instrumentation only.
- The index shape was intentionally useful but generic. A later category-filtered representation may be much smaller and must be measured rather than inferred.
- The full 501×501 meta-grid includes procedural bounds, but T2 counted the actual `getBuildings()` list rather than iterating empty meta cells.

## Verdict

Full Build 42 building/room enumeration is technically available to ordinary vanilla Lua but **not safe synchronously in normal play**: the tested map has 96,414 records and one complete scan occupied the main thread for 227–244 ms. A 100-record batch completed an equivalent index in 965 frames with 0.555 ms mean and 2 ms peak callback time; 500- and 1,000-record batches violated P4-R16.

Map-wide discovery is therefore viable only as bounded queued work. A future registry must stream and filter, retain only useful candidates, remain rebuildable/non-canonical, and never be saved wholesale. The generic rich full-map index's 90–102 MiB retained JVM heap range makes that shape unsuitable as the default registry. v0.1's curated two-location design remains the correct scope.

## Decision links

- P3-Q1 / ADR-0001 — vanilla Lua first: retained.
- P3-Q4 — persist minimal canonical state and rebuild caches: strengthened.
- P4-R01 — v0.1 remains two curated locations.
- P4-R16 — `≤2 ms/frame`: retained and now has measured batching evidence.
- P4-R17 — `≤500 KB/save`: retained; the full map index is never canonical.
- P4-R34 — added for future map-wide discovery scheduling/filtering.
- `docs/architecture/ARCHITECTURE_V0.2.md` §§4, 10 and 17.
- GitHub Issue #3 — `[Spike T2] Full map/meta-grid enumeration cost`.
