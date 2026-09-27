# SPOILERS — writer and engineers only. The owner does not read this folder.

No Help, task 3 plan step 5 (vanilla scenes, directive NH-D7). The first
hand-checked unique scene's citation record, the verified scene signatures,
and the visible live check still owed. Built 2026-09-27; **the live check has
not been run.**

## 1. The citation record — `RBJackieJaye` (Jackie Jaye's news studio)

Data: `mod-nohelp/.../Generated/VanillaScenes.lua`, `M.CITATIONS[1]`
(key `cite:RBJackieJaye`). Test: `test/nohelp_scenes.lua` checks every field
below against the shipped data.

| Field | Value | Checked against |
|---|---|---|
| Always built | `setAlwaysDo(true)` in the constructor | `javap -c` RBJackieJaye, build 42.20 |
| Story name | `JackieJaye` (`getName()`) | constructor's `name` field |
| Building | `4222330809090050`, footprint 12480,3908 – 12484,3921 | `Generated/AddressBook.lua` row |
| Room | `jackiejayestudio` (also `jackiejayeoffice`, `bathroom` in the building) | `BuildingDef.getRoom("jackiejayestudio")` |
| Studio containers | desks 12481,3915 / 12481,3918 (`location_business_office_generic_01_47`), 12481,3920 (`…_45`); filing cabinets 12483,3917 / 12483,3920 (`…_25`); all z 0 | `FixedContainerIndexData` (Muldraugh, KY, 42.20), base-36 rows of that building whose room is the studio — decoded with `FixedContainerIndex.open(...).candidates` |
| Bounds used | x 12481–12483, y 3915–3920, z 0 (x2/y2 exclusive: 12484, 3921) | every container inside |
| What vanilla leaves | curtains closed (`IsoCurtain.ToggleDoor`); office clutter on desk surfaces (`RBBasic.doOfficeStuff` → `trySpawnStoryItem`); `Microphone`, `Notepad`, `Pen` by `addItemOnGround` on one `RoomDef.getFreeSquare()`; a sleeping bag (`addSleepingBagWestEast`); her named zombie, outfit `Jackie_Jaye`, carrying `Base.PressID` | `javap -c` RBJackieJaye |

**Placement.** The place is decided like a map place once the survivor is
within 100 tiles (`VanillaScenes.NEAR_TILES`; no observation needed, since
vanilla always builds it). The lean is random per world (fit 2:2,
`VanillaScenes.lean`); the clue is the version of that lean — anchor
`{scene="RBJackieJaye", version="A"}` (containment) or `version="B"`
(agricultural). It is created only when the survivor is within 40 tiles, in
a studio desk or filing cabinet (the site row lists only `desk` and
`filingcabinet`), never one whose square holds `Base.Microphone`,
`Base.Notepad` or `Base.Pen` (`avoidProps`, read live by the filler), never on
her body or press ID (anchor is room-container; `Carriers` refuses the
`Jackie_Jaye` outfit and any body with an ID).

**Content still owed:** ticket `T0018` (UNIQUE, now open): exactly two clues,
`{scene="RBJackieJaye", version="A"}` and `version="B"`, spot `furniture`.

## 2. Verified signatures (SceneMatch)

Read with `javap -c -p -constants` on `zombie.randomizedWorld.*`,
projectzomboid.jar build 42.20. Two traces of different sorts each; the
anchoring trace is marked *.

| Family | Kind | Story name | Traces (sort: value) |
|---|---|---|---|
| RB | RBJackieJaye | JackieJaye | *room: jackiejayestudio; item: Base.Microphone / Base.Notepad / Base.Pen (citation — decided by place, never by a match) |
| RDS | RDSPoliceAtHouse | Police at House | *vehicle: CarLightsPolice (`spawnCarOnNearestNav`); zombie: Police (`addZombies`); room: livingroom / kitchen (`getLivingRoomOrKitchen`) — all three required |
| RDS | RDSRatKing | Rat King | *item: Base.RatKing (`addItemOnGround`); room: bedroom / kitchen / livingroom |
| RVS | RVSPlonkies | Plonkies | *vehicle: StepVan_Plonkies (`addVehicle`); item: Base.Plonkies |
| RVS | RVSRichJerk | Rich Jerk | *vehicle: CarLuxury; item: Base.Briefcase_Money |
| RVS | RVSAmbulanceCrash | Ambulance Crash | *vehicle: VanAmbulance; zombie: AmbulanceDriver / HospitalPatient (`addZombiesOnVehicle`) |
| RZS | RZSMurderScene | Murder Scene | *item: Base.EmptyPetrolCan; sprite: location_community_cemetary_01_32 / _33 (checked before the burying camp) |
| RZS | RZSBuryingCamp | Burying Camp | *sprite: location_community_cemetary_01_22/23/34/35/40–43; item: Base.Shovel / Base.WhiskeyEmpty / Base.WineEmpty |

All other 116 allowed kinds are **unverified** and never match until a
signature is added. Not used: a story's `isValid(...)` — for a building story
it can call `customizeStartingHouse` on the player's own house (side effect).
The prefilter uses only the four story lists' `getName()`.

Also verified in the jar for the refusals: the animal-only kinds build no
vehicle (`RVSAnimalOnRoad`, `RVSHerdOnRoad`, `RVSRoadKillSmall`,
`RZSAttachedAnimal`, `RZSEscapedAnimal`, `RZSEscapedHerd`, `RZSHogWild`,
`RZSOrphanedFawn` — the last leaves a hunter zombie and a gun on the ground);
the named-zombie kinds build only their zombie (`RZJackieJaye`, `RZSDuke`,
`RZSFrankHemingway`, `RZSKirstyKormick`). `RVSDeadEnd` ("carried") drops the
evacuee's bags on the road with `addItemOnGround`, so its clue lies on the
ground beside them. Named outfits (never a carrier): Jackie_Jaye, Joan,
Judge_Matt_Hass, Mayor_West_point, Nolan, Rev_Peter_Watts, Sir_Twiggy,
Woodcut, Kate, Bob, Dean, Duke, FrankHemingway, KirstyKormick.

## 3. The visible live check (owed; do not run without the go-ahead)

Rules: **visible** only (never `--hidden`; software rendering is not
evidence); on the Linux autotest machine with its own `~/Zomboid`
(`PZ_ZOMBOID`), **never the owner's save** and never `--continue` on any world
but the check's own; **two fresh worlds** (two world seeds), so the lean is
seen to differ or at least be drawn per world.

Separate test setup: a throwaway git worktree whose only extra file is a
placeholder `mod-nohelp/.../NHShared/Mystery/Content/Clues.lua` (never
committed) holding placeholder object sets — two anchored
`{scene="RBJackieJaye", version="A"/"B"}` on `furniture`, and one per lean
for each other verified kind on its spot (`RDSPoliceAtHouse` corpse,
`RDSRatKing` furniture, `RVSPlonkies`/`RVSRichJerk`/`RVSAmbulanceCrash`
vehicle, `RZSMurderScene` corpse, `RZSBuryingCamp` ground). Run the game from
that worktree's mod link.

Per world:
1. `tools/autotest/pz.sh start --at 12470,3900,0` (just outside the studio;
   within 100 tiles so the citation is noted and decided).
2. `pz.sh log 200`: expect `ev=case case=cite:RBJackieJaye why=scene-confirmed`
   then `why=area-decided-scene` with `n=1`. Read the world record with
   `pz.sh eval` (`ModData.getOrCreate("NHShared.Generated.G2")`): one area
   `scene:cite:RBJackieJaye`, one document, anchor version A or B matching the
   document's lean.
3. Walk (not teleport) into the studio. Expect `ev=placed … why=instalment`
   for that document, at one of the five container squares above, and the
   square holding the microphone/notepad/pen is not the one chosen (`eval`
   the target's square `getWorldObjects()`). Screenshot the loot window
   (`pz.sh shot`) and Search Mode spotting it.
4. Her body: `eval` that no clue's target has `outfit=Jackie_Jaye`.
5. Reload (`pz.sh stop --save`, `start --continue <this world>`): nothing
   changes (same document, same target).
6. Road scenes: drive along a highway with the debug map until a
   `scene-wait-start` / `scene-wait-end` pair appears; record `hours`,
   `distance` and `mode=driving`; then the same on foot (`mode=walking`). The
   question for the plan: is a scene confirmed before the survivor is within
   40 tiles of it? Record the share.
7. Second world: repeat 1–3; note the lean. Across two worlds the lean may
   match by chance (fit 2:2); `test/nohelp_scene_area.lua` proves both leans
   occur across seeds.

Evidence to keep: the log lines, the eval outputs and the screenshots under
`dev/eval/linux/`, and a line in the plan's section 8 in neutral words (no
scene, character, coordinate or evidence named).
