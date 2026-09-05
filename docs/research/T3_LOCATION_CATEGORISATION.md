# Spike T3 — location categorisation reliability

**Policy update P4-R53:** the observations and limitations below remain authoritative. The later owner clarification supersedes the curated-only v1 product recommendation: use capability-based catalog records and automatic selection without per-site owner approval. Unknown labels still cannot become authoritative story facts. This is a product-policy correction, not new engine evidence.

- **Status:** Complete — live isolated single-player probe executed on the development PC
- **Project Zomboid build tested:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 Pro `10.0.26200` build 26200; Intel Core i9-13900H; 34,070,192,128 bytes RAM; direct 64-bit client; single-player; `-nosteam`
- **Probe path/branch:** `dev/t3-location-categorisation/` on `spike/t3-location-categorisation`; final live-tested Lua SHA-256 `DA180B0C3C86A388482F985BEDE2362C8CCEEF034E624D96A5F39A287CA588E0`
- **API/event/classes used:** `Events.OnGameStart`, `Events.OnTick`, `IsoWorld.getMetaGrid`, `IsoMetaGrid.getBuildings/getZones`, `BuildingDef`, `RoomDef`, `zombie.iso.zones.Zone`, `getTimeInMillis`
- **Execution date:** 2026-08-31

## Question

Can Build 42 map, building, room, and zone metadata reliably categorise police stations, bookstores, hospitals/clinics, offices, and transmission sites across several concrete vanilla examples, including non-building landmarks?

## Sources and evidence boundary

This report keeps four evidence classes separate:

1. **Official documentation context:** Build 42 Javadocs document the getter families on `IsoMetaGrid`, `BuildingDef`, `RoomDef`, and `Zone`. Documentation establishes intended signatures, not live Lua callability.
2. **Exact installed-code inspection:** JDK 25 `javap -private` against the installed `projectzomboid.jar` (SHA-256 `80E405...2F44`) confirmed the signatures recorded in [`../../dev/t3-location-categorisation/evidence/installed-api.txt`](../../dev/t3-location-categorisation/evidence/installed-api.txt).
3. **Raw installed map-data inspection:** the installed map consists primarily of compiled `.lotheader`, `.lotpack`, and `.bin` data. The readable `Muldraugh, KY/objects.lua` (SHA-256 `BB2AF7...9572`) exposes `Police`, `Office`, and `Offices` rectangles as `type="ZombiesType"`, not as a general POI schema. Details are in [`../../dev/t3-location-categorisation/evidence/raw-map-data.txt`](../../dev/t3-location-categorisation/evidence/raw-map-data.txt).
4. **Live behavior:** only the final isolated run proves that these APIs returned the recorded values to ordinary Lua on this build. Filtered structured output is in [`../../dev/t3-location-categorisation/evidence/live-run.txt`](../../dev/t3-location-categorisation/evidence/live-run.txt); the complete filtered/raw transcripts remain in the git-ignored local audit directory.

Official documentation links:

- <https://projectzomboid.com/modding/zombie/iso/IsoMetaGrid.html>
- <https://projectzomboid.com/modding/zombie/iso/BuildingDef.html>
- <https://projectzomboid.com/modding/zombie/iso/RoomDef.html>
- <https://projectzomboid.com/modding/zombie/iso/zones/Zone.html>

## Method

The probe ran as the only active mod in a copied disposable `T3_location_categorisation` Sandbox save. It read the same complete vanilla meta-grid established by T2: Brandenburg, Echo Creek, Ekron, Fallas Lake, Irvington, March Ridge, Riverside, Rosewood, Valley Station, West Point, and Muldraugh.

T3 honored P4-R34 throughout. Zone, building, room, and evidence-output work used both a **48-record cap** and a **1 ms elapsed-time deadline** per `OnTick` callback. This is below T2's tested 100-record/2 ms edge. The probe retained aggregate name counts, filtered candidate summaries, and compact Police/Office zone facts only; it retained no engine object in its result and persisted nothing.

An exploratory pass established the available metadata vocabulary. Before the final measured pass, a fixed 55-row ground-truth matrix was written into the probe: six positives and five negatives for each category. Labels were manual building-level judgements from the complete installed room composition and zone context, not classifier output. The final pass evaluated this unchanged matrix.

The conservative heuristics were:

| Category | Exact metadata/property rule |
|---|---|
| Police station | `policeoffice >= 1`, at least one of `policegunstorage` or `policelocker`, and `prisoncells <= 10`. The cell limit attempts to exclude prisons. |
| Bookstore | At least one room named exactly `bookstore`. |
| Hospital/clinic | Any `hospitalroom`, `hospitalhallway`, `clinic`, or `medclinic`; or `medicaloffice` together with `medical` or `pharmacy`. |
| Office | Exact `office`/`office_herald`/`office_ranger` area is at least 40% of building area and `isResidential=false`; or the building intersects an `Office`/`Offices` `ZombiesType` rectangle on a represented level. |
| Transmission site | At least two `broadcasting` rooms plus a `studio`, or at least two `communications` rooms plus a `newsroom`. |

Every evaluated row also recorded building ID, bounds, levels, total area, complete `roomName:count:area` composition, `isShop`, `isResidential`, `isRural`, `isBasement`, `isUserDefined`, `BuildingDef.getZone`, `BuildingDef.getTable`, and intersecting Police/Office rectangles.

## Observed metadata shape

- The live map exposed **9,978 buildings, 86,436 rooms, and 8,867 ordinary zones**.
- `BuildingDef:getTable()` was empty and `BuildingDef:getZone()` was nil for every emitted target/candidate. Neither supplied a usable category.
- `isShop`, `isResidential`, `isRural`, `isBasement`, and `isUserDefined` are generic traits, not semantic building types.
- Exact `RoomDef:getName()` values carry the useful semantic vocabulary. Relevant totals included `bookstore` 35 rooms, `clinic` 25, `medclinic` 70, `hospitalroom` 64, `hospitalhallway` 21, `medical` 122, `medicaloffice` 53, `office` 3,978, `policeoffice` 220, `broadcasting` 21, and `communications` 15.
- Generic names are context-sensitive. `medical` occurs in schools, fire stations, bunkers, police facilities, ranger buildings, hospitals, and clinics. `office` occurs in homes, restaurants, retail, factories, hotels, schools, police facilities, and true office space.
- Live zones included 57 `Police` and 394 `Office`/`Offices` name candidates. All were `ZombiesType` rectangles. There were no Bookstore, Hospital/Clinic, Medical, Radio, Broadcast, Transmission, Communications, Antenna, or Tower semantic zones.
- A room label classifies a room or area more defensibly than the enclosing `BuildingDef`. Mixed malls, high-rises, and complexes legitimately contain several categories in one building.

## Ground-truth sample

Coordinates are building bounds `(x,y)-(x2,y2)`. Full compositions and IDs are preserved in the live evidence.

| Category | Positive examples | Challenging negative examples |
|---|---|---|
| Police | Small/station buildings at `(2027,5966)-(2053,5987)`, `(13206,3073)-(13238,3101)`, `(13778,2552)-(13786,2567)`, `(7252,8383)-(7267,8398)`, `(2483,13935)-(2494,13948)`; large HQ `(12404,1528)-(12561,1692)` | Prison `(7512,11701)-(7694,11870)`; coroner basement; police horse stable; laboratory basement; hospital |
| Bookstore | `(12554,1927)-(12572,1941)`, `(13178,1250)-(13195,1260)`, mixed commercial `(10603,10344)-(10618,10385)`, `(7250,8419)-(7266,8440)`, `(2119,5776)-(2128,5794)`, shopping centre `(13300,3042)-(13402,3088)` | Prison/school libraries, hospital, office, broadcast studio |
| Hospital/clinic | Hospital `(12353,3603)-(12458,3722)`; clinics/medical centres at `(13601,1560)-(13617,1582)`, `(2070,5901)-(2088,5915)`, `(5493,9577)-(5507,9589)`, `(6645,5241)-(6673,5265)`, `(10125,12748)-(10173,12761)` | School first-aid room, fire-station medical storage, bunker medical room, police medical room, ranger medical room |
| Office | Dedicated/dominant offices at `(9962,9245)-(9973,9252)`, `(2069,6563)-(2080,6567)`, `(2228,6449)-(2239,6453)`, `(15545,3074)-(15596,3095)`, `(12799,2377)-(12808,2396)`; mixed high-rise `(12696,1511)-(12742,1582)` | Restaurant, retail, grocery and theatre back offices; residential house office |
| Transmission | Broadcast/news/studio buildings at `(12630,1883)-(12673,1944)`, `(12310,2039)-(12374,2085)`, `(13549,1572)-(13581,1604)`, `(12462,1742)-(12498,1790)`, `(13038,1437)-(13089,1488)`; communications-tower building `(15356,2661)-(15382,2689)` | Factory communications rooms, arena/stadium broadcast booths, bunker/laboratory communications rooms |

## Confusion results

| Category | TP | TN | FP | FN | Recall | Notes |
|---|---:|---:|---:|---:|---:|---|
| Police | 5 | 5 | 0 | 1 | 83.3% | The conservative prison exclusion rejected the large HQ because it also contains 62 `prisoncells`. |
| Bookstore | 6 | 5 | 0 | 0 | 100% | Exact `bookstore` worked on this sample, including mixed-use buildings. |
| Hospital/clinic | 6 | 5 | 0 | 0 | 100% | Specific clinic/hospital labels avoided generic `medical` false positives. |
| Office | 6 | 5 | 0 | 0 | 100% | Required area ratio or `ZombiesType` rectangle; exact `office` alone would be unusably broad. |
| Transmission | 5 | 5 | 0 | 1 | 83.3% | The communications-tower building has one `communications` room but no newsroom/studio signature. |
| **Total** | **28** | **25** | **0** | **2** | **93.3%** | 53/55 correct, 96.4% sample accuracy. |

The category rows are authoritative; the total is their sum. This is a deliberately challenging, manually curated sample, not a prevalence-weighted random sample. Zero observed false positives does not establish zero population false-positive rate, and the rules were designed after an exploratory pass on the same vanilla map.

## Non-building landmarks

The tested meta-grid did **not** expose a semantic POI/landmark layer for radio towers, antennae, or transmission landmarks:

- ordinary `Zone` name/type/originalName/bounds/geometry contained no transmission semantics;
- raw `objects.lua` contains several vehicle `ParkingStall` entries named `radio`, which describe vehicle spawning and are not radio-site landmarks;
- one tall communications building was recoverable only from its room composition and geometry;
- freestanding towers/antennae represented as map tiles or objects have no building/room classification record in this surface.

Automatic building/room/zone categorisation therefore cannot cover non-building transmission landmarks. Such targets need curated coordinates/object signatures, and T8 still owns runtime arrival detection.

## Measurements

| Metric | Final result |
|---|---:|
| Useful records processed | 105,281 |
| Frames/callbacks | 3,530 |
| Callback work total | 2,678 ms |
| Peak callback | 2 ms |
| Callbacks over 2 ms | 0 |
| Record cap | 48 |
| Time deadline | 1 ms |
| Candidate buildings: police/bookstore/medical/office/transmission | 18 / 20 / 94 / 1,103 / 14 |

The 1 ms clock is quantized. A reported 2 ms callback can result from crossing two millisecond boundaries, but no callback exceeded P4-R16. T3 does not claim these timings on slower hardware; the dual bound remains mandatory.

## Environment restoration and audit trail

After the final run, the disposable `T3_location_categorisation` save, installed T3 mod, and loaded gate-helper DLL were moved into the git-ignored local audit archive rather than deleted. The original `mods/default.txt`, `latestSave.ini`, `options.ini`, and `debuglog.ini` were restored byte-for-byte; all four SHA-256 hashes matched the pre-run baseline. No Project Zomboid process remained.

The repository commits the reproducible probe, helper source, installed-API/map-data notes, and filtered non-sensitive final evidence. `tmp/t3-live/` locally retains the exploratory/final raw stdout and stderr, full filtered transcripts, before/after hashes, original control-file copies, compiled helper, installed-probe copy, and archived disposable save. Raw PZ output is excluded from git because it contains local paths and unrelated environment details.

## Map-mod resilience assessment

Likely resilience is **conditional, not guaranteed**:

- The engine-level getter path and generic bounds/room/zone shapes should continue to enumerate map-mod records loaded into `IsoMetaGrid`.
- Exact room names and `ZombiesType` names are author-authored conventions, not a documented stable category schema. A map mod can use different spelling, casing, language, granularity, or no semantic room names at all.
- Mixed-use buildings and freestanding landmarks remain representation problems independent of vanilla vs modded origin.
- Future extensibility should permit optional per-map aliases/overrides and always retain the exact matched property as provenance. Generic mod-map support is not a T3 or v1 requirement.

## Architecture impact

- **v0.1 remains hard-curated.** T3 does not select or replace its two exact authored locations.
- v1 should continue to use a curated location catalog. Automatic categorisation may be an advisory development/runtime candidate source only, never authoritative story truth.
- Candidate records should target rooms/areas when a specific room label exists; automatically promoting the enclosing mixed-use building to one category loses precision.
- A future candidate index may use direct labels plus explicit exclusions/ratios/zone overlap, but every match must preserve rule/property provenance and remain rebuildable, filtered, non-persistent, and dual-bounded under P4-R34.
- Non-building landmarks require curated/object-specific handling; this spike does not justify a general Location Registry or Java/ZombieBuddy dependency.

`DECISIONS.md` records this as P4-R35.

## Limitations

- One PC, one exact stable Build 42.20.4 installation, one vanilla map set, and one isolated save.
- The ground-truth matrix is manually curated and not random or prevalence-weighted. It measures the documented cases, not population accuracy.
- Heuristics were designed after an exploratory pass on the same map, so this is an in-sample engineering test, not an independent validation set.
- Categories are partly subjective at building level. A mall can validly contain a bookstore and a clinic without being globally a bookstore or clinic.
- T3 inspected categorisation metadata, not runtime player-arrival events, loaded object/tile signatures, or safe placement containers. T8 and T4 own those questions.
- No Workshop map was activated. Map-mod resilience is an assessment of metadata conventions, not a live compatibility result.

## Verdict

Build 42 metadata can produce **useful, explainable room-level candidates**, especially for exact `bookstore`, clinic, and hospital room names. It cannot reliably provide one authoritative category for every building or non-building landmark. Generic `office`, `medical`, `communications`, and `broadcasting` names require context; conservative rules still missed a large police HQ and a communications-tower building in the fixed sample.

The correct product ruling is a curated v1 catalog with optional automatic candidate assistance behind P4-R34, explicit provenance, and per-map overrides. Automatic categorisation is not story truth, and v0.1 remains hard-curated.

## Decision links

- P4-R01 — v0.1 remains two curated locations.
- P4-R06 — replay/placement variation may use validated candidates later; automatic labels do not alter core authored truth.
- P4-R16 / P4-R34 — all discovery remains dual-bounded, filtered, rebuildable, and non-persistent.
- P4-R35 — added: categorisation is advisory and room-first; v1 remains curated.
- GitHub Issue #4 — `[Spike T3] Location categorisation reliability` remains externally open by instruction.
