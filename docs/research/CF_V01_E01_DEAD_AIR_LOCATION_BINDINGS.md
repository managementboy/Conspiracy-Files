# CF-V01-E01 — Dead Air live location bindings

**Status:** Passed and binding-selected on 2026-09-01.
**Runtime:** Project Zomboid `42.20.4`, revision `b0bbce05d5`, `pzBullet 1.0.0.28`.
**Scope:** vanilla P2 police station and R2 communications/news facility, each in its own disposable-save boot.
**Authority:** the checked-in structured excerpts below and `ConspiracyFiles.LocationBindings`; transient full console logs and screenshots are diagnostic support, not repository inputs.

## Result

Both candidates pass. They are the final v0.1 Dead Air bindings.

| Location ID | Site | Exact arrival binding | Exact document containers | Access facts |
|---|---|---|---|---|
| `dead-air:location:relay-office` | R2 | whole building identified from reference square `(13564,1596,0)` in `newsroom`; bounds `(13549,1572)`–`(13581,1604)`, z `0..3`, 26 rooms | D1 shelf `(13555,1576,1)`; D3 shelf `(13556,1576,1)`; D4 desk `(13562,1579,1)`, all in `communications` rooms | exterior door `(13557,1572,0)`; ground-floor stair object `(13566,1602,0)`; service garage present |
| `dead-air:location:police-property` | P2 | whole building identified from reference square `(13208,3088,0)` in `policeoffice`; bounds `(13206,3073)`–`(13238,3101)`, z `0..1`, 24 rooms | D2/D5/D6 filing cabinets `(13207,3087,0)`, `(13208,3087,0)`, `(13209,3087,0)` in one 12-square `policeoffice` | exterior door `(13206,3087,0)` opens directly beside the selected cabinets |

The reference-square delta is `dx=356`, `dy=-1492`, or `1533.884` straight-line tiles. This satisfies P4-R41's regional `1,000–1,600`-tile target.

R2 is a convincing ordinary relay-side location: it has a 120-square newsroom, four named z=1 communications rooms, a 308-square service garage, communications-room shelves/desks, exterior doors and internal stairs. P2 is a convincing administrative/property-side location: the scan found multiple police offices, two police-locker rooms, gun storage, cells, garage space and 83 containers; the chosen small office has three adjacent filing cabinets and a direct exterior door. The large police headquarters fallback is therefore rejected as unnecessary.

## Selected structured evidence

The following records are reproduced verbatim from the filtered `[CF-LOC]` event payloads, without console prefixes or local filesystem paths.

### Shared geography

```text
[CF-LOC]|EVENT|kind=DISTANCE|from=P2|to=R2|dx=356|dy=-1492|straightTiles=1533.884
```

### P2 police property/records binding

```text
[CF-LOC]|EVENT|kind=ROOM|site=P2|roomId=3.377918763860251E15|name=policeoffice|z=0|area=12|rects=13206,3087,4,3
[CF-LOC]|EVENT|kind=SITE_START|site=P2|point=13208,3088,0|room=policeoffice:3.377918763860251E15
[CF-LOC]|EVENT|kind=ACCESS_OBJECT|site=P2|x=13206|y=3087|z=0|room=policeoffice|roomId=3.377918763860251E15|objectIndex=3|objectName=Door|sprite=fixtures_doors_01_33|exteriorAdjacent=true
[CF-LOC]|EVENT|kind=CONTAINER|site=P2|x=13207|y=3087|z=0|room=policeoffice|roomId=3.377918763860251E15|objectIndex=2|containerIndex=0|containerType=filingcabinet|capacity=15|itemCount=11|objectName=IsoObject|sprite=location_business_office_generic_01_32
[CF-LOC]|EVENT|kind=CONTAINER|site=P2|x=13208|y=3087|z=0|room=policeoffice|roomId=3.377918763860251E15|objectIndex=2|containerIndex=0|containerType=filingcabinet|capacity=15|itemCount=12|objectName=IsoObject|sprite=location_business_office_generic_01_32
[CF-LOC]|EVENT|kind=CONTAINER|site=P2|x=13209|y=3087|z=0|room=policeoffice|roomId=3.377918763860251E15|objectIndex=2|containerIndex=0|containerType=filingcabinet|capacity=15|itemCount=11|objectName=IsoObject|sprite=location_business_office_generic_01_32
[CF-LOC]|EVENT|kind=SITE_SCAN_RESULT|site=P2|buildingId=3.377918763860009E15|bounds=13206,3073,13238,3101|levels=0,1|loadedSquares=2135|definedRoomSquares=829|buildingSquares=829|distinctRoomsSeen=24|expectedRooms=24|containers=83|accessObjects=82
[CF-LOC]|EVENT|kind=MATRIX_RESULT|failures=0|status=PASS
```

### R2 relay/communications binding

```text
[CF-LOC]|EVENT|kind=ROOM|site=R2|roomId=1.689073198563926E15|name=newsroom|z=0|area=120|rects=13560,1590,9,12;13560,1602,6,2
[CF-LOC]|EVENT|kind=ROOM|site=R2|roomId=1.689073198565035E15|name=communications|z=1|area=42|rects=13555,1576,7,6
[CF-LOC]|EVENT|kind=ROOM|site=R2|roomId=1.689073198565037E15|name=communications|z=1|area=24|rects=13562,1576,4,6
[CF-LOC]|EVENT|kind=SITE_START|site=R2|point=13564,1596,0|room=newsroom:1.689073198563926E15
[CF-LOC]|EVENT|kind=ACCESS_OBJECT|site=R2|x=13557|y=1572|z=0|room=hall|roomId=1.689073198563921E15|objectIndex=3|objectName=Door|sprite=fixtures_doors_01_53|exteriorAdjacent=true
[CF-LOC]|EVENT|kind=ACCESS_OBJECT|site=R2|x=13566|y=1602|z=0|room=hall|roomId=1.689073198563921E15|objectIndex=2|objectName=IsoObject|sprite=fixtures_stairs_01_50|exteriorAdjacent=false
[CF-LOC]|EVENT|kind=CONTAINER|site=R2|x=13555|y=1576|z=1|room=communications|roomId=1.689073198565035E15|objectIndex=2|containerIndex=0|containerType=metal_shelves|capacity=50|itemCount=4|objectName=IsoObject|sprite=furniture_shelving_01_26
[CF-LOC]|EVENT|kind=CONTAINER|site=R2|x=13556|y=1576|z=1|room=communications|roomId=1.689073198565035E15|objectIndex=2|containerIndex=0|containerType=metal_shelves|capacity=50|itemCount=2|objectName=IsoObject|sprite=furniture_shelving_01_27
[CF-LOC]|EVENT|kind=CONTAINER|site=R2|x=13562|y=1579|z=1|room=communications|roomId=1.689073198565037E15|objectIndex=2|containerIndex=0|containerType=desk|capacity=20|itemCount=8|objectName=IsoObject|sprite=location_community_medical_01_106
[CF-LOC]|EVENT|kind=SITE_SCAN_RESULT|site=R2|buildingId=1.68907319856347E15|bounds=13549,1572,13581,1604|levels=0,3|loadedSquares=3216|definedRoomSquares=1516|buildingSquares=1516|distinctRoomsSeen=26|expectedRooms=26|containers=72|accessObjects=122
[CF-LOC]|EVENT|kind=MATRIX_RESULT|failures=0|status=PASS
```

Java `BuildingDef`/`RoomDef` IDs are recorded only as observed diagnostics because Lua renders them as floating-point scientific notation. Runtime binding resolution must use the exact reference squares, expected names/bounds and object/container signatures in `ConspiracyFiles.LocationBindings`, then fail closed if the live target no longer matches.

## Reproduction and safety

Run each phase from the repository root:

```text
dev/location-binding/tools/run-live-inspection.sh P2
dev/location-binding/tools/run-live-inspection.sh R2
lua5.1 test/run.lua
```

The audited runner clones only the named disposable Sandbox save, installs the probe as the sole enabled mod, prepositions only the clone before launch, captures the ready screenshot before the full scan, waits for `MATRIX_RESULT`, closes PZ, archives the disposable artifacts and restores `latestSave.ini`, `mods/default.txt`, `options.ini` and `debuglog.ini` byte-for-byte. The source save and installed game files are not changed.

Diagnostic artifact hashes for the accepted runs:

```text
P2 filtered transcript  cedf95d72d8ee4abca941affacadbf0a4237a8c49e9671261b5c764b60fb2e4e
P2 ready screenshot     71faf7c59b0614b62c073773b0284285c84b17f60075a7ed8fc781673dbf9452
R2 filtered transcript  df68102da658bb972ae603a5392465ce00f3e293a690a5dfa7f12abb44b71980
R2 ready screenshot     66ac830a3b55ac441a348c398228cfa273122c1e7aaaac0bf4e39376028d5c28
```

The accepted claim is physical/static suitability and exact target selection. It does not claim that the future production placement or arrival adapters have passed E02–E07; those criteria remain implementation work.
