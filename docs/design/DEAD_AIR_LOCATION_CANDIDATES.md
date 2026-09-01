# Dead Air curated-location candidate dossier

**Status:** Offline shortlist for user review; no location is selected or bound.

**Evidence target:** Installed stable Project Zomboid Build `42.20.4 b0bbce05d5`, Steam build ID `24909800`, plus the repository's archived T2/T3 evidence. This dossier does not claim a live visit, container inventory, reachability proof, or production-adapter result.

## Reading this dossier

- **Observed** means recorded by the archived T2/T3 live probes or read from the exact installed vanilla files without launching the game.
- **Decoded installed fact** means a room record was read from a hashed installed `.lotheader` and cross-checked against T3's independently archived building bounds, floor range, room count/composition, and area. The runtime-facing room identifier proposed here is the exact tuple of building ID, room name, floor, and rectangle geometry; the inspected `RoomDef` API exposes no stable numeric room ID.
- **Inference / proposal** means a story-fit, accessibility, furniture, container, or placement suggestion that the offline evidence cannot prove.
- Coordinates are vanilla world-tile coordinates. Room rectangles are `x,y,width,height`; bounds are half-open in the proposed predicate/verification work.
- Candidate labels `R1`–`R3` and `P1`–`P3` exist only in this dossier. They are not authored IDs and must not enter implementation or save state.

## Authoritative requirements preserved

The stable authored Location IDs remain:

- `dead-air:location:relay-office` — pre-arrival `Relay Site 31`; confirmed label `Relay Site 31 service office`; a hand-curated transmission/utility communications service location.
- `dead-air:location:police-property` — pre-arrival `police property desk`; confirmed label `police property / records area`; a hand-curated vanilla police station with plausible property/records context.

The authored placement split is unchanged:

| Location role | Authored content | Narrative/placement requirement |
|---|---|---|
| Relay / D1 primary | D1 service ticket, D3 invoice/stock transfer, D4 Rourke notebook page | D1 should read as mundane maintenance paperwork in a service office clipboard/file drawer. D3 belongs with parts/billing paperwork. D4 belongs in a technician's tool drawer or clipboard. The location must make Relay Site 31 and the B-37 cabinet plausible. |
| Police / D2 fallback | D2 property record, D5 access memo, D6 Pike shift note; optional ordinary B-37 key context | D2 needs a property desk/records context. D5 belongs in a supervisor file. D6 belongs at the property desk/files near D2. The site must plausibly hold a receiver and key without inventing another organisation or quest objective. |

D1 is the preferred introduction; D2 is the independently authored fallback opportunity. D3–D6 are ordinary supporting placements and are never suppressed by entry selection. Mere unloading of D1 is not failure. Terminal pre-placement invalidity may permit D2. Once an item has reached `placed`, absence from its original container starts T5 identity reconciliation and is not, by itself, loss.

This dossier does **not** resolve the existing product decision about whether a durably placed, undiscovered D1 that is later conclusively `lost` may activate D2. It also does not alter the T10 ruling: live Inspect/context-menu behavior remains blocked pending a security-approved manual-GUI route that neither restores the flagged binary nor bypasses protection.

## Evidence and provenance

### Independent path A — archived engine observations

T2 recorded the exact installed environment and a stable full-map checksum over 9,978 buildings and 86,436 rooms. T3 then recorded building IDs, bounds, floor ranges, complete room-name compositions, category outcomes, and intersecting zone geometry for all six candidates below. The relevant committed source is:

- `docs/research/T2_MAP_ENUMERATION_COST.md`
- `docs/research/T3_LOCATION_CATEGORISATION.md`
- `dev/t3-location-categorisation/evidence/live-run.txt`
- `dev/t3-location-categorisation/evidence/raw-map-data.txt`

T3's categorisation is advisory only. Its useful evidence here is the underlying observed metadata and manually curated ground truth, not an automatic selection.

### Independent path B — exact installed vanilla files

The installed `projectzomboid.jar` still hashes to `80E405A4BFC42F6072E75B3735F458A6514143DA011D3226007DED305A442F44`, matching the archived T2/T3/T4 evidence. `media/maps/Muldraugh, KY/objects.lua` still hashes to `BB2AF79F1814265F9AD65BC9B55B0C723CC5A372D92CCC65AAE3FFC9ACF29572`, matching T3's raw-map evidence.

Target-cell lotheaders inspected read-only:

| Cell file | SHA-256 | Bytes | Candidates |
|---|---|---:|---|
| `59_10.lotheader` | `8D6F7D8DEEC7AD927AC754094443BD31A3286666F80F878782F0EBFA4F2534BF` | 15,678 | R1 |
| `52_6.lotheader` | `E5A746D4F5891321B80389BC7532F418387B34A3FD3EE278B5E22371281A2CCE` | 192,132 | R2 |
| `48_6.lotheader` | `32A7929C9846D73C589F7A0B7F36E7E8CB3A1A0DF795E45CCBBA18968F2D235D` | 130,239 | R3 |
| `48_5.lotheader` | `046705F7799CABE98CA5F819FFCDD91699A57A3595E77908894ADA2DFD0006C0` | 205,529 | P1 |
| `51_12.lotheader` | `C813E0CDE3B8A7B37663A4CF66952BC4C6105DE4037DF6735D2309F1C6DA0A4F` | 96,609 | P2 |
| `53_9.lotheader` | `CF6BC73E9CBA64C6B7D350EBDC1E198F24033EE1CC1FDF924E6E9297DF45DB26` | 82,537 | P3 |

The room records below were decoded from those files and agree with T3's building compositions. T3 also independently observed the relevant `Office`/`Offices` or `Police` `ZombiesType` rectangles; exact matching source records remain present in `objects.lua`. Those rectangles are spawn-theme metadata, not authoritative POIs or suitable story truth.

### Offline evidence gap

Neither evidence path enumerates loaded `IsoObject` furniture, `ItemContainer` types, doors/stairs/elevators, obstruction, keys, alarm state, spawn condition, or ordinary-walking access. Exact T4 container coordinates and sprites therefore remain deliberately unset. The proposed container descriptions below are verification targets, not observed facts.

## Compact comparison

| Candidate | Role | Building ID / bounds / floors | Strongest exact room evidence | T3 category evidence | Main advantage | Main unresolved risk | Offline confidence |
|---|---|---|---|---|---|---|---|
| R1 | Relay | `2815003170177024`; `(15356,2661)-(15382,2689)`; `0..10` | `communications`, z=8, eight rects, observed area 128 | Human-positive transmission; conservative rule FN | Only sampled candidate explicitly identified as a communications-tower building | Floor-8 access and ground-floor service-office furniture unverified | High identity/geometry; medium usability |
| R2 | Relay | `1689073198563470`; `(13549,1572)-(13581,1604)`; `0..3` | four `communications` rooms on z=1; garage and ground offices | Transmission TP: 4 communications + newsroom | Compact communications facility with a large service garage | Reads as news/communications rather than a remote relay; containers unverified | High geometry; medium narrative fit |
| R3 | Relay | `1689056018694155`; `(12462,1742)-(12498,1790)`; `0..3` | four `communications` rooms on z=1; two newsrooms | Transmission TP: 4 communications + 2 newsrooms | Strong technical metadata and several separate office/storage rooms | Explicit newsroom character; only 156 straight-line tiles from P1 | High geometry; medium narrative/geography fit |
| P1 | Police | `1407581041983534`; `(12404,1528)-(12561,1692)`; `0..7` | `evidenceroom`, z=3, `(12460,1595,9,14)` | Human-positive police HQ; conservative rule FN because 62 prison-cell rooms | Only shortlist candidate with an exact `evidenceroom` label | Huge mixed complex, floor-3 access, false building-level confirmation | High property fit; medium accessibility |
| P2 | Police | `3377918763860009`; `(13206,3073)-(13238,3101)`; `0..1` | eight police offices, two locker rooms, gun storage, garage on z=0 | Police TP; 3 intersecting Police rectangles | Manageable station with separated offices/lockers and garage | No explicit property/evidence room; furniture and public access unknown | High station fit; medium property fit |
| P3 | Police | `2533502423662731`; `(13778,2552)-(13786,2567)`; z=0 | two police offices, gun storage, two cell rooms | Police TP; 1 Police rectangle | Small, bounded station; geographically closest to R1/R2 | No locker/property/evidence room and little space for three documents | High station identity; low-medium property fit |

## Relay candidates

### R1 — communications-tower building at `(15356,2661)`

**Observed installed-data facts**

- Building ID `2815003170177024`; bounds `(15356,2661)-(15382,2689)`; floors `0..10`; area 1,407; 47 rooms.
- T3 composition: `communications:1:128`, `office:7:256`, `breakroom:1:82`, `elevator:12:100`, `hall:11:455`, plus bathrooms/empty rooms.
- T3 manually classified it as a transmission positive. The conservative transmission heuristic missed it because there is one `communications` room and no newsroom/studio. That false negative is evidence against automated selection, not against this curated candidate.
- Decoded `communications` room: z=8; rectangles `(15357,2661,10,1)`, `(15356,2662,12,2)`, `(15356,2664,7,2)`, `(15364,2664,4,6)`, `(15356,2666,4,2)`, `(15356,2670,12,2)`, `(15356,2668,7,2)`, `(15357,2672,10,1)`; lotheader offset 13,999.
- Exact rooms inside the building suitable for a later placement inspection include:
  - ground office A: z=0, `(15373,2670,4,4)` + `(15373,2674,3,3)`;
  - ground office B: z=0, `(15377,2680,5,5)`;
  - ground office C: z=0, `(15372,2680,5,5)`;
  - ground office D: z=0, `(15364,2685,5,4)`;
  - breakroom: z=0, `(15356,2677,4,3)` + `(15356,2680,7,2)` + `(15356,2682,8,7)`;
  - three further offices on z=1.
- An `Offices:ZombiesType` rectangle `(15355,2661,z=8,width=14,height=13)` contains the communications floor, and other Office rectangles touch the building on represented floors. There is no semantic transmission zone.

**Proposed T8 predicate**

Use exact whole-building identity for location confirmation: building ID `2815003170177024`, with the selected binding also checking that the current building's archived bounds match. This matches the authored moment—physically reaching Relay Site 31—without forcing the survivor to climb to z=8 before the place can be recognised. Do not use the generic Office zone.

Live negatives must include every adjacent exterior square, a neighboring structure if present, and any bridge/overhang/elevator geometry that reports an unexpected building. If whole-building identity proves unstable, fall back to an exact ground-office room tuple, not a radius guessed from the tower centre.

**Proposed T4 target inspection**

- D1: first live-verified stable furniture container identified as a filing cabinet, desk drawer, or clipboard-like office container in ground office A.
- D3: a separate filing/storage container in ground office B or C.
- D4: a tool cabinet/drawer in ground office D or the breakroom.
- Never bind by “first container in building” or generic sprite class alone. Record exact square, object index/sprite identity, container type, room tuple, and a clean-world screenshot during the later live pass.

These are inferred target types. No furniture/container is proven offline.

**Narrative fit and risks**

The tower identity, dedicated communications floor, offices, breakroom, and elevators make the strongest literal Relay Site 31 fit. The separation between a mundane ground service office and upper communications equipment suits D1/D3/D4 particularly well. The cost is verification risk: z=8 access, elevator/stair behavior, locked areas, and the survival difficulty of entry are all unknown. Disqualify if the ground offices contain no stable ordinary container, if the building cannot be entered through normal play, or if whole-building arrival fires from unrelated geometry.

**Live walk-through:** Mandatory.

### R2 — compact communications/news facility at `(13549,1572)`

**Observed installed-data facts**

- Building ID `1689073198563470`; bounds `(13549,1572)-(13581,1604)`; floors `0..3`; area 1,583; 26 rooms.
- T3 composition: `communications:4:132`, `newsroom:1:120`, `garage:1:308`, `office:6:192`, `breakroom:1:56`, `storage:1:4`, plus hall/bathroom/empty/janitor.
- T3 transmission TP under the exact `communications >= 2` plus `newsroom` rule.
- Exact z=1 communications rooms: `(13555,1576,7,6)`, `(13562,1576,4,6)`, `(13566,1576,4,6)`, `(13570,1576,7,6)`.
- Exact service-context rooms include the z=0 garage `(13559,1572,22,14)`, offices `(13552,1572,3,5)`, `(13549,1572,3,7)`, and `(13555,1594,5,10)`, and a small z=1 storage room `(13577,1576,2,2)`.
- `Offices:ZombiesType` rectangles cover `(13549,1572,z=0,32,32)` and `(13550,1573,z=1,29,31)`. There is no semantic transmission zone.

**Proposed T8 predicate**

Use exact whole-building identity `1689073198563470` with archived-bounds cross-check. The building is compact and T3 shows a coherent communications/news composition. Do not treat the Office zone as authoritative. If the building shares interior geometry with adjacent uses in live play, bind one specific ground office or the garage instead.

**Proposed T4 target inspection**

- D1: filing cabinet/desk drawer in office `(13552,1572,3,5)` or `(13549,1572,3,7)`.
- D3: a different office file container or the exact z=1 storage room.
- D4: tool cabinet/workbench container in the large ground garage.

All container classes and squares require live observation. The garage is a particularly useful falsifier: if it has repair equipment but no paper-safe container, D4 should stay in an office rather than force an implausible placement.

**Narrative fit and risks**

Four communications rooms and a service garage give credible contractor activity and equipment access. The `newsroom` label makes the facility feel more like a media operation than a county relay. That is not a technical disqualifier, but it materially changes the story's geography and ordinary-maintenance tone. Disqualify if visible signage/room dressing overwhelms the relay interpretation or if the office/garage lacks a stable target.

**Live walk-through:** Mandatory.

### R3 — communications/news facility at `(12462,1742)`

**Observed installed-data facts**

- Building ID `1689056018694155`; bounds `(12462,1742)-(12498,1790)`; floors `0..3`; area 2,634; 30 rooms.
- T3 composition: `communications:4:244`, `newsroom:2:346`, `office:8:413`, `officestorage:1:8`, `breakroom:1:64`, plus hall/bathroom/empty/janitor.
- T3 transmission TP under the communications/newsroom rule.
- Exact z=1 communications rooms: `(12472,1754,5,10)`, `(12477,1754,8,9)+(12477,1763,6,1)`, `(12485,1754,7,9)+(12487,1763,5,1)`, `(12492,1754,6,8)`.
- Exact ground placement rooms inside the building include offices `(12472,1754,5,5)`, `(12491,1754,7,5)`, `(12483,1763,6,5)`, and `(12462,1777,12,8)+(12462,1785,7,3)`, plus `officestorage` `(12494,1762,4,2)`.
- `Offices:ZombiesType` rectangles cover `(12462,1742,z=0,9,9)`, `(12462,1751,z=0,32,37)`, and `(12462,1742,z=1,32,46)`. There is no semantic transmission zone.

**Proposed T8 predicate**

Use exact whole-building identity `1689056018694155`, cross-checked to bounds. As with R2, the exact room alternative should select one observed ground office tuple if live geometry shows mixed-building false triggers. Never bind to the Office zone as story truth.

**Proposed T4 target inspection**

- D1: file/desk container in ground office `(12472,1754,5,5)`.
- D3: cabinet/shelf in exact `officestorage` `(12494,1762,4,2)`.
- D4: desk/tool drawer in the larger ground office `(12462,1777,12,8)+(12462,1785,7,3)`.

These are room-exact but container-inferred targets.

**Narrative fit and risks**

The technical-room evidence is strong and the small dedicated office-storage room is promising for D3. Two newsrooms make the media character even harder to ignore than R2. R3 is only about 156 straight-line tiles from P1's bounds centre, which may make the “survive a trip to the other story location” beat too compressed; route distance and barriers are unverified. Disqualify if signage/dressing makes “Relay Site 31” implausible, if containers are absent, or if the user wants more geographic separation from a P1 police choice.

**Live walk-through:** Mandatory.

## Police candidates

### P1 — large police headquarters with evidence room at `(12404,1528)`

**Observed installed-data facts**

- Building ID `1407581041983534`; bounds `(12404,1528)-(12561,1692)`; floors `0..7`; area 28,921; 562 rooms.
- T3 composition includes `evidenceroom:1:126`, `policeoffice:157:6421`, `policelocker:13:274`, `policegunstorage:2:254`, `policeoutfitstorage:1:88`, `policelibrary:4:306`, `darkroom:3:134`, `depositboxes:2:92`, `security:2:75`, and `prisoncells:62:1235`.
- T3 human ground truth is police positive. The conservative small-station rule returned FN solely because its `prisoncells <= 10` guard rejected this HQ.
- Exact `evidenceroom`: z=3, `(12460,1595,9,14)`; lotheader offset 190,460.
- Exact nearby z=3 police offices include `(12460,1584,6,9)`, `(12466,1584,10,9)`, `(12489,1595,6,5)`, and `(12480,1603,6,5)`. The building also has exact locker and gun-storage rooms on z=1.
- Fifteen `Police:ZombiesType` rectangles intersect the building, including `(12460,1584,z=3,37,63)` containing the evidence room. The zones span multiple floors and are not a unique property-room identifier.

**Proposed T8 predicate**

Use exact room identity, not whole building: building ID `1407581041983534` + room name `evidenceroom` + z=3 + rectangle `(12460,1595,9,14)`. The building is too large and mixed for “entered HQ” to mean “confirmed police property desk.” Do not use the Police zone.

**Proposed T4 target inspection**

- D2 and the optional B-37 receiver/key context: one evidence shelf/cabinet or property drawer inside the exact evidence room.
- D5: a distinct file cabinet in a nearby z=3 police office or supervisor office.
- D6: desk drawer/file container either in the evidence room or the immediately adjacent verified property-supervisor room.

The exact evidence-room label strongly supports these targets, but no furniture or adjacency is proven offline. A later binding must record the exact container square/object/sprite/type and confirm that the player can interact with it normally.

**Narrative fit and risks**

P1 is the best metadata match for a property/evidence operation. It is also the highest false-trigger and access risk: the site is enormous, the target is on z=3, and an HQ may turn a modest county-property anomaly into a metropolitan institution. Disqualify if ordinary access to the evidence floor is impossible, if the evidence room contains no stable container, if the arrival predicate confirms through floors/walls, or if the project owner prefers a small local station voice for Pike.

**Live walk-through:** Mandatory and high priority.

### P2 — medium police station at `(13206,3073)`

**Observed installed-data facts**

- Building ID `3377918763860009`; bounds `(13206,3073)-(13238,3101)`; floors `0..1`; area 829; 24 rooms.
- T3 composition: `policeoffice:8:314`, `policelocker:2:48`, `policegunstorage:1:18`, `prisoncells:2:60`, `garage:1:56`, plus hall/bathroom/janitor.
- T3 police TP; three exact `Police:ZombiesType` rectangles intersect the station: `(13203,3086,z=0,35,13)`, `(13211,3083,z=0,24,3)`, `(13212,3074,z=0,23,9)`.
- Exact candidate rooms on z=0 include:
  - office A `(13231,3087,7,6)`;
  - office B `(13206,3090,12,9)+(13212,3099,6,2)`;
  - offices C/D `(13226,3095,6,6)` and `(13231,3081,7,6)`;
  - locker rooms `(13217,3073,4,6)` and `(13221,3073,4,6)`;
  - gun storage `(13206,3084,6,3)`;
  - garage `(13225,3073,7,8)`.

**Proposed T8 predicate**

Prefer one exact police-office room confirmed live as the public property/records desk: building ID `3377918763860009` + room name `policeoffice` + z=0 + exact rectangle tuple. Whole-building identity is an acceptable fallback only if the live walk-through proves the station is compact and entry unambiguously represents the property/records location. The Police zones are broad spawn metadata and should not be used.

**Proposed T4 target inspection**

- D2: filing cabinet/desk drawer in office A or B, whichever is visibly the public intake/property room.
- D5: supervisor-file cabinet in a separate office C or D.
- D6: desk drawer in the D2 office.
- B-37 key/receiver context: a property-style drawer or locker only if its room dressing makes custody plausible; do not silently reinterpret gun storage as ordinary property.

**Narrative fit and risks**

P2 is bounded, has multiple offices and lockers, and offers enough separation for three documents. Nothing in offline metadata says `property`, `records`, or `evidence`, so the story fit depends on furniture and room dressing. Disqualify if no office reads as intake/records, if all suitable containers are armory-only, or if the exact room cannot be distinguished reliably at runtime.

**Live walk-through:** Mandatory.

### P3 — small police station at `(13778,2552)`

**Observed installed-data facts**

- Building ID `2533502423662731`; bounds `(13778,2552)-(13786,2567)`; floor z=0 only; area 110; 7 rooms.
- T3 composition: `policeoffice:2:66`, `policegunstorage:1:8`, `prisoncells:2:18`, plus hall/bathroom.
- T3 police TP; one exact `Police:ZombiesType` rectangle `(13779,2554,z=0,12,20)` overlaps the station.
- Exact room geometry:
  - police office A `(13780,2552,5,3)+(13778,2555,7,3)+(13783,2558,3,2)+(13784,2560,2,5)`;
  - police office B `(13780,2558,3,2)+(13780,2560,4,2)`;
  - gun storage `(13778,2558,2,4)`;
  - cell rooms `(13781,2564,3,3)` and `(13778,2564,3,3)`.

**Proposed T8 predicate**

Use exact office A room identity: building ID `2533502423662731` + `policeoffice` + z=0 + its four-rectangle tuple. Whole-building confirmation is low risk geometrically but would still label cells/armory as a property desk; exact room better matches the authored confirmed label. Do not use the oversized Police zone.

**Proposed T4 target inspection**

- D2: the only verified file/desk container in office A.
- D5: a distinct file container in office B if one exists.
- D6: a second drawer in office A, only if exact target identity remains unambiguous.
- Do not use gun storage or a cell container merely to force capacity.

**Narrative fit and risks**

The small local-station scale fits Pike's dry property-desk voice and produces a simple arrival boundary. It is also the weakest offline property candidate: there is no locker, evidence, records, archive, storage, or garage label, and only two offices must carry all three documents. Its proximity to R1 (about 1,591 straight-line tiles) and R2 (about 996) may support a believable county response without collapsing the journey. Disqualify immediately if live inspection finds fewer than three stable, narratively distinct ordinary containers or no credible property drawer.

**Live walk-through:** Mandatory.

## Story-geography comparison

Straight-line centre-to-centre distances are offline arithmetic, not route, travel-time, safety, or accessibility evidence.

| Relay → police | P1 HQ | P2 medium station | P3 small station |
|---|---:|---:|---:|
| R1 tower | 3,077 tiles | 2,186 tiles | 1,591 tiles |
| R2 compact communications/news | 1,083 tiles | 1,538 tiles | 996 tiles |
| R3 communications/news | 156 tiles | 1,515 tiles | 1,525 tiles |

The distance matrix is intentionally not a recommendation. R3+P1 would make the two-location reveal unusually tight; R1+P1 would make it much broader. Whether Dead Air should feel like a local paperwork loop or a substantial survival journey is a user/story decision, and road topology may overturn the straight-line impression.

## Recommended live-verification order

When a security-approved manual Project Zomboid session is later authorised, verify in this order to retire the highest-value uncertainty early:

1. **R1 tower:** prove ordinary entrance, ground-office containers, floor-8 access, and whole-building negatives. A failure here changes the strongest literal relay candidate.
2. **P1 HQ evidence room:** prove normal access to z=3, room identity, furniture containers, and wrong-floor/adjacent negatives. Its exact room label is uniquely valuable but unusable if inaccessible.
3. **R2 compact communications/news:** inspect visible identity/signage, the garage/tool context, office containers, and building boundary.
4. **P2 medium station:** find or falsify a genuine public property/records office and three distinct stable targets.
5. **R3 communications/news:** inspect office storage and determine whether its visible media identity and geography are acceptable.
6. **P3 small station:** use as the bounded local-station fallback only if it actually has enough ordinary property/file containers.

For every visited candidate, capture: exact player square and z; `BuildingDef` ID/ID string and bounds; `RoomDef` name/z/rectangles; all intersecting zones; entrance/access route; every proposed object's square, sprite/name, object index and container type; adjacent/wrong-floor negative squares; and whether the target persists in a clean-world reload. Then run the production T4/T5 and T8 matrices from `V0_1_ACCEPTANCE_CRITERIA.md`; visual plausibility alone is not acceptance.

## Decision required

No final candidate pair should be selected from offline metadata alone. Morning/user review should decide:

1. **Story geography:** should Dead Air connect a local pair, a roughly 1,000–1,600-tile regional pair, or a broader 2,000–3,000-tile survival journey? This materially changes discovery pacing.
2. **Institutional scale:** should Pike work at a small/medium local station, or is a large HQ acceptable in exchange for the uniquely exact evidence-room metadata?
3. **Relay identity:** is the literal tower worth its floor/access risk, or is a compact communications/news facility acceptable despite its visible newsroom character?
4. **Existing D1-loss ruling:** decide whether a durably placed but undiscovered D1 that later becomes conclusively `lost` may activate D2. This dossier supplies no new ruling.
5. **T10 safety/manual-GUI route:** retain the existing security stop. Candidate verification must not be conflated with resuming T10, restoring `runner.exe`, changing protection settings, or bypassing security review.

Only after those decisions and a live walk-through should implementation replace these provisional labels with the two stable authored Location bindings. Until then, `dead-air:location:relay-office` and `dead-air:location:police-property` remain intentionally unbound.

## Limitations

- One exact stable vanilla installation; no Workshop maps, later PZ patch, multiplayer, or alternate map configuration.
- T3's 55-row matrix was curated, not prevalence-weighted. Category labels are advisory.
- Building IDs and room tuples are exact for the inspected build but still require a production compatibility check on the supported minor line.
- `.lotheader` room geometry does not prove furniture, loot containers, player access, visual signage, locks, alarms, stairs/elevators, destruction behavior, or ordinary-walking arrival.
- `BuildingDef:getIDString()` was available in installed API inspection but was not archived by T3; only the observed numeric ID is recorded here.
- No stable `RoomDef` numeric ID was available in the inspected API. Exact room name/floor/rectangle tuples must be verified as sufficient or augmented by a curated coordinate predicate.
- Generic `Police` and `Office`/`Offices` zones are `ZombiesType` rectangles, can exceed building bounds, and are not authoritative POIs.
- No exact T4 target container is claimed. Binding a container before live enumeration would turn inference into false evidence.
- No game, helper, mod, save, live control, or security product was launched or changed during this research pass.
