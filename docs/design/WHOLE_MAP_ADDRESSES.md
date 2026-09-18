# House numbers for the whole map (AD-10)

- **Status:** Built, 2026-09-16 (owner go-ahead P4-R129). Section 9 records what
  shipped and how it differs from this draft; sections 1-8 are the design as
  drafted.
- **Request:** AD-10, queued 2026-09-15 (`docs/management/PM_HANDOFF.md`, "house
  numbers for the whole map").
- **Game:** Build 42.20 (Linux test machine reports `42.20.4 b0bbce05d5`).
- **Related decisions:** P4-R17 (500 KB save), P4-R34 (map-wide scans),
  P4-R58 (town baselines), P4-R59 (labels follow map knowledge), P4-R63 and
  P4-R77 (no old-save compatibility), P4-R120 (see section 5).

Note: the 2026-09-14 handoff says this design is in `docs/design/KNOX_OS.md`.
It is not. That file mentions only the organiser's Address Book *program*.
This document is the first design for AD-10.

---

## 1. The problem, and what the player sees today

In the Windows playtest of DEV-0.36.0, the owner read a Riverside paper map
he had found. The map revealed Riverside, but no house numbers appeared on it.

That is how the mod works today. House numbers exist only for a rectangle of
Muldraugh. Anywhere else, including Riverside, West Point, Rosewood and
Louisville, the world map shows no numbers. Organiser and case text fall back
to street names and directions.

The owner wants this instead:

- Work out addresses for the **whole** Build 42.20 map **once**, on the
  development machine.
- Ship them with the mod as a data file.
- Show the right number wherever the survivor's map knowledge covers a
  building, whether from walking there or from reading a found paper map.
- No scan in each save, no address book saved in the game, and no cost to
  the save budget.

## 2. How it works today, and why it cannot simply be stretched

### 2.1 Where the numbers come from

| Step | What happens | Where |
|---|---|---|
| Start | The address service starts when a case starts (`Trial.start`), and again on every load of a save that already has a book. Only in debug single-player, like the rest of the current development build. | `Trial.lua:10-11`, `AddressMap.lua:15`, `AddressMap.lua:257`, `AutomaticInvestigations.lua:8-10` |
| Gates | Refuses unless the game is 42.20 or 42.20.4 and the map is "Muldraugh, KY". | `AddressMap.lua:199-200` |
| Reuse | If the save already holds a finished book, it is loaded and nothing is recomputed. | `AddressMap.lua:202-207` |
| Scan | Walks every building on the map in the background (256 steps or 1 ms per tick). It keeps only buildings that are **not basements**, lie **fully inside x 10000-11500, y 9000-11000**, and have at least one room. | `AddressMap.lua:237-239`, `AddressMap.lua:242-253` |
| Filter | A building counts only if at least one room is something other than `garage`, `garagestorage`, `shed` or unnamed. Garage-only and shed-only buildings get no number. | `AddressMap.lua:216-221` |
| Road match | Each building is matched to the nearest named street section within 60 tiles of its centre, and put on the odd or even side. | `Generated/AddressIndex.lua:46-80`, cap at line 50 (60² = 3600) |
| Numbering | Within each street block and side, buildings are ordered by distance from **one fixed point, x=10600, y=9750** (Muldraugh's Main St / 1st St corridor). Number = block × 100 + slot × 2, minus 1 on the odd side. Each block side has at most 49 slots; any overflow gets no number. | `Generated/AddressIndex.lua:79`, `:86-99` |
| Roads | 61 street blocks, cut from the installed `streets.xml` and limited to the trial area, are shipped as `AddressRoads.lua`. | `Generated/AddressRoads.lua:1-2` |
| Save | The finished book (building id, footprint, label) is checked against a 400 KB cap and the combined 500 KB save budget, then written to ModData under `ConspiracyFiles.AddressBook.Muldraugh`, with `revision="muldraugh-address-1"`, map, build and `coverage=3`. | `AddressMap.lua:7`, `:19`, `:228-232`; `SaveBudget.lua:3`; `Validator.lua:7` |
| Later scans | An older book is extended, never renumbered. Existing labels stay frozen, and a building whose footprint changed stops the commit. | `AddressIndex.lua:20-23`, `:40-42`; `AddressMap.lua:208-209` |

The live trial produced 341 numbered buildings with 43 left unnumbered
(`docs/research/MULDRAUGH_ADDRESS_TRIAL.md`).

### 2.2 Who reads the numbers

- **World map labels:** `AddressMap.draw` (`AddressMap.lua:99-137`), hooked
  onto the vanilla map renderer (`:179-193`). A label is drawn only at zoom 18
  or closer. The building's centre **and** all four corners must be known to
  `WorldMapVisited:isKnown` (`:118-119`). At most 80 labels are drawn and 512
  buildings checked per frame (`:114`). Only the number is drawn, not the
  street.
- **Text:** `labelForBuilding` (`:76-81`), `nearest` (`:51-70`) and `describe`
  (`:83-98`). These are used by GeneratedRuntime, EvidenceRows, CasePerson,
  KeyObserver, IdentityObserver, LocalPersonIntegration, KnoxApps and
  DiscoveryLog.
- **No second copy any more:** the old evidence window held a hot-load copy of
  all three address files, and its help said house numbers "are not available
  yet". The window, its copy and the sync tool were removed (P4-R128).

The map-knowledge part already does what AD-10 needs: a read paper map marks
its area as known, so labels would appear there once data exists (P4-R59).
**Only the data is missing.**

### 2.3 Why stretching the rectangle is not enough

1. **One centre for the whole world.** Numbering counts outward from one
   Muldraugh point (`AddressIndex.lua:79`). A Riverside house 6,000 tiles away
   would be numbered by its distance from Muldraugh. P4-R58 requires each
   town to have its own starting street.
2. **Labels must be unique across the whole book** (`AddressMap.lua:23`).
   Across the map, 32 street names appear in more than one area. For example,
   "2nd St" and "3rd St" exist in Muldraugh, Louisville and West Point. So
   "102 2nd St" could legitimately occur twice.
3. **The road file only covers Muldraugh:** 61 blocks, against 1,098 street
   polylines on the whole map. The script that cut `AddressRoads.lua` from
   `streets.xml` is not in the repository (checked `tools/` and `dev/`), so
   the road data has to be regenerated by a new tool.
4. **The book lives in the save.** 341 records already sit under a 400 KB
   cap. A whole-map book in ModData would conflict with P4-R17 and P4-R34.
5. **The scan runs in each save.** Every new save repeats a background sweep
   of about 10,000 buildings. Cases cannot place documents until it finishes,
   which is why `tools/autotest/warm_world.sh` exists.

## 3. Proposed pipeline

The work moves off the player's machine and onto the Linux development
machine, and it runs once per game build.

### 3.1 Step A: one-off scan in the real game (Linux)

- Start a fresh world with `tools/autotest/pz.sh start`. Run a scan script
  through the existing eval channel, the same way every other check does.
- The script walks `getWorld():getMetaGrid():getBuildings()` in bounded
  batches: at most 100 buildings per tick with a time deadline (P4-R34). For
  every building it records the id, footprint (x, y, x2, y2), basement flag,
  level count and room names.
- It writes the **unfiltered** list to a file with `getFileWriter`. The mod
  already uses this call (`DiscoveryLog.lua:194`), and files land under
  `~/Zomboid/Lua/`. Keeping everything in the export means a filter change
  needs no rescan.
- The export header records the game version, the map string and the
  SHA-256 of `streets.xml`.
- Expected size: T2 counted **9,978 buildings and 86,436 rooms** on 42.20.4
  (`docs/research/T2_MAP_ENUMERATION_COST.md`). At the tested 100 per tick,
  the scan takes a few minutes of game time.
- The export is a development file in `dev/`, not shipped.

Why the real game rather than reading map files offline: T2 proved the game's
own building list is complete and callable. The building ids the game hands
out at runtime (keys, case sites) are exactly the ids this list contains. An
offline reader of `.lotheader` files would have to reproduce those ids, which
is unverified.

### 3.2 Step B: number the buildings offline, per town

A plain Lua 5.1 tool runs outside the game (the domain core already works
that way, P4-R20). It reuses the existing matching and parity rules from
`AddressIndex.lua` and changes where numbering starts.

1. **Roads.** Read all 1,098 polylines from the installed `streets.xml` and
   split them into blocks at intersections, as the trial did. Railway
   polylines are excluded as before.
2. **Towns.** Assign each building to a named area from the installed
   `regions.lua` (Muldraugh, Riverside, Rosewood, WestPoint, MarchRidge,
   Louisville, Jefferson, ValleyStation, LAA) by its centre. Where boxes
   overlap (Muldraugh/Rosewood near x 9200-9300, y 11000-12000, and
   Jefferson/LAA), a fixed documented tie-break applies: the smaller area wins.
3. **Filter.** Unchanged: no basements, and no buildings whose rooms are
   only garage, garage storage, shed or unnamed.
4. **Baseline street per town, chosen automatically.** Rules, in order:
   - a street named Main St (including N/S/E/W and North/South variants);
   - otherwise 1st St / First St;
   - otherwise the longest named non-highway, non-railway street in the town.

   The baseline is that street's line. Numbers grow away from it, as P4-R58
   already describes in Help.
5. **Numbering.** The existing rules apply unchanged: block × 100, odd north
   or east, even south or west, up to 49 slots per side. Distance is measured
   from the town's own baseline instead of x=10600, y=9750.
6. **Uniqueness per town.** Labels must be unique within a town, not across
   the map. Text that names a place outside the player's current town adds
   the town name ("102 2nd St, West Point").
7. **Report for the owner.** The tool writes a short table: each town, its
   chosen baseline street, why it was chosen, how many buildings got numbers
   and how many did not.

A first pass over the installed files gives these candidates. The owner
should check them.

| Area | Automatic baseline candidate | Basis |
|---|---|---|
| Muldraugh | N Main St / S Main St (1st St also present) | Main St rule |
| Riverside | W Main St / E Main St | Main St rule |
| Rosewood | North Main St / South Main St | Main St rule |
| WestPoint | Main St | Main St rule |
| Louisville | W Main St / E Main St | Main St rule |
| MarchRidge | none; longest named streets are Fiddler's Trail, then MacArthur St | fallback: to confirm |
| Jefferson | none; longest are highways (Dixie Highway, KY-841), then South Park Road | fallback: to confirm |
| ValleyStation | none; longest is Bearcamp Road, then Flower Road | fallback: to confirm |
| LAA (airport) | Terminal Dr is the only street inside | airport; may not need house numbers |

Found by a quick script over the installed files. Not verified in game.
Street midpoints decided membership, which is approximate for long roads.

### 3.3 Step C: ship the result

- **New generated file:** `Generated/AddressBook.lua`, next to
  `AddressRoads.lua`. Each row holds the building id, footprint, town number,
  street number and house number. Street and town names are stored once in
  small lookup tables, not repeated on every row.
- **Ids are strings.** Real building ids are 16-digit numbers, for example
  `9007319513825330` in T3's evidence, and some exceed what a Lua number holds
  exactly (2^53 ≈ 9007199254740992).
- The file header records the game version, the `streets.xml` hash, the
  export hash and the numbering revision, for example `whole-map-1`.
- `AddressRoads.lua` keeps its job for road matching in the tool. Whether the
  game still needs it at runtime is decided in step 4 of section 8. If not,
  it stops shipping.

### 3.4 Step D: in the game

- On load, `AddressMap` reads the shipped file instead of scanning. It builds
  the same 64-tile buckets it builds today (`AddressMap.lua:31-43`) and
  answers `labelForBuilding`, `nearest` and `describe` from them. The address
  book is ready at once. There is no "Address book .... reading" wait on the
  organiser and no waiting before case placement.
- **Map labels are unchanged:** same zoom, same five `isKnown` points, same 80
  and 512 limits. Reading a Riverside paper map marks Riverside as known, so
  its numbers draw.
- **A safety check before use:** if the running game version or map does not
  match the file header, numbers are switched off with one log line. The mod
  then behaves as it does outside Muldraugh today, falling back to street
  names and directions. It never shows wrong numbers.
- **Nothing is written to ModData** for a save that uses shipped numbers.

### 3.5 Outside the nine named areas

`regions.lua` does not cover the whole map. The game's map string also names
Brandenburg, Echo Creek, Ekron, Fallas Lake and Irvington (T2). About 325 of
the 1,098 street polylines have their midpoint outside every named box.

Proposal:

- Buildings outside the named areas are grouped by connected named streets
  into **unnamed areas**. Each group gets a baseline chosen by the same rules
  (longest named street when there is no Main or 1st St).
- They get numbers, but text never shows a town name for them. At most it
  says "near" the nearest named area.
- A building with no named street within 60 tiles gets no number, as today.
  Text falls back to directions.
- The owner can later give a group a proper town name through a small
  override list in the tool. That needs a rerun, not a game change.

Owner check: whether rural buildings should get numbers at all, or only
buildings inside towns. The default above numbers them.

## 4. Size and cost

| Item | Estimate | Verified? |
|---|---|---|
| Buildings on the map | 9,978 (all, including basements and sheds) | Yes: T2, Windows, 42.20.4 |
| Buildings that will get a number | Fewer than 9,978. Basements, sheds, garages and roadless buildings drop out. The Muldraugh trial numbered 341 of 384 eligible in its box, but that ratio is not representative of rural land. | No: known after step A |
| Bytes per row in the shipped file | About 55-65 (quoted 16-digit id, four coordinates, three small numbers, punctuation) | Estimate |
| Name tables | About 959 street names × about 15 bytes ≈ 15 KB | Estimate from `streets.xml` |
| Shipped file size | About 0.5-0.7 MB at most (9,978 rows). For scale, `Generated/ObjectCatalogue.lua` already ships at 593 KB. | Estimate |
| Workshop download | Plus roughly the same; text compresses well | Estimate |
| Load time | One file read and parsed at game start, plus bucket building over up to about 10,000 rows. Not measured. Must be measured on Linux with the real renderer, not `--hidden`. | **No** |
| Memory while playing | T2's generic index cost 90-102 MiB for 96,414 rich building **and room** records, about 1 KB each. A building-only book of up to 10,000 slim rows should be a few MB at most, and less if each row is kept as one packed string until used. | **No**: measure in step 7 |
| Save cost, new saves | **Zero.** Nothing is written to ModData; the numbers come from the mod files every load. The 500 KB budget (P4-R17) is untouched and the `addresses` entry in `SaveBudget.lua:3` stays empty. | By design; test in step 8 |
| Save cost, old saves | Unchanged under option (a): their existing book stays where it is. | By design |
| Frame cost | Same drawing work as today (80 labels, 512 checks). No background scan during play at all. | Drawing: same code; the scan is removed |

## 5. Existing saves

A save that has already frozen a Muldraugh address book may have evidence
entries, case text and organiser records quoting those numbers, such as
"109 Walker Road". The new per-town numbering almost certainly gives many of
those buildings different numbers, because the baseline and rules change.

**Option (a), recommended in the handoff:** new saves use the shipped numbers;
existing saves keep their frozen Muldraugh book.

- Nothing a player has already written or been shown changes.
- Old saves still get no numbers outside the old Muldraugh rectangle.
- The game keeps two ways to get numbers for a while: the saved book when one
  exists, the shipped file otherwise. P4-R63 discourages keeping old-save
  readers; this would be a deliberate exception.

**Option (b):** every save switches to the shipped numbers.

- One code path, which matches P4-R63 and P4-R77 (a rules change means a new
  game).
- In an existing save, evidence entries that quote a number can **stop
  matching the map**: the entry says 109, the map says 113. Case text built
  from the old book would change on the next load.
- The old book in ModData would be ignored or removed.

**Decided (P4-R120, owner 2026-09-15): option (a).** New saves use the shipped
numbers; existing saves keep the address book they already froze, so nothing
already written in the case record changes.

## 6. Tests

**Offline unit tests** (`test/`, run by `tools/autotest/unit.sh`):

- Parity on horizontal, vertical, curved and reversed roads. The existing
  `test/address_map.lua` cases are kept.
- The same street name in two towns gives two valid, distinct labels.
- Baseline choice is deterministic: Main St over 1st St over the longest
  street, and highways and railways are never chosen.
- Overlapping area boxes follow the documented tie-break.
- Filters: a basement, a shed-only and a garage-only building get no number.
- Overflow past 49 slots is reported, never duplicated.
- The generated file validates: ids are strings, footprints are sane, labels
  are unique per town, and the header is present.
- Runtime lookup from the shipped file gives the same answers as the old
  book for `labelForBuilding`, `nearest` and `describe`.
- Known and forgotten map masking still hides labels (existing test, kept).
- A new save writes nothing to the address ModData tag.
- Header mismatch (wrong build or map) switches numbers off.

**Linux autotest check** (new `tools/autotest/checks/addresses.sh`):

- Fresh world. Every shipped building id exists in the live game with the
  same footprint. This catches map drift between game builds and proves ids
  are stable across worlds.
- The address book reports ready before the first case is placed, without a
  scan.
- Reveal a Riverside area with the game's own map-knowledge call (as a paper
  map does), open the world map at zoom 18 over Riverside, and confirm
  `draw` reports labels drawn there. With nothing revealed, confirm none.
- Measure load time and memory with the real GPU renderer (not `--hidden`),
  and write them to the evidence file.
- Confirm the save's combined budget is unchanged after save and reload.
- Add a `prove.py` mutation (for example, drop the `isKnown` check or ship a
  wrong footprint) and show the check fails.

**Attended Windows check** (owner, after a Workshop publish):

1. Start a new game. Find or spawn a Riverside paper map and read it.
2. Open the world map and zoom in over Riverside: numbers appear on houses in
   the revealed area and not beyond it.
3. Walk to one numbered house and confirm the organiser shows the
   same address.
4. Spot-check one Muldraugh street and one West Point street.
5. Under option (a), load an existing save and confirm its old numbers are
   unchanged.

## 7. Risks and unknowns

| Risk | Why it matters | Status |
|---|---|---|
| **Building ids differ between worlds or machines** | The shipped file is keyed by id. If ids change per world, lookups fail. | **Not verified.** Ids look coordinate-derived (16-digit numbers), but no two-world comparison exists. The Linux check tests this first; fallback is lookup by footprint. |
| Later game builds change the map (42.21+) | Buildings move or appear and numbers point at the wrong house. | Not verified for future builds. Mitigated by the header check (numbers switch off) and a rerun of steps A-C per build. The current code already refuses builds other than 42.20/42.20.4 (`AddressMap.lua:199`). |
| Ids exceed exact Lua number range | Ids stored as numbers would be corrupted. | **Verified**: `9007319513825330` in T3 evidence exceeds 2^53. Store them as strings. |
| One lot, several buildings (house plus detached garage, duplexes, strip malls) | One property may get two numbers, or sheds none. P4-R58 wants outbuildings to share their main address "where established". | Not verified. Out of scope for the first cut; garage- and shed-only buildings stay unnumbered as today. |
| Streets without names, or buildings far from any named street | Those buildings get no number. | Verified that `streets.xml` has no unnamed entries (all 1,098 have names). Whether every town house is within 60 tiles of a named street is **not verified**; the step B report counts the gaps. |
| Same street name in several towns | Global uniqueness would reject valid labels. | **Verified**: 32 names occur in more than one area. Uniqueness becomes per town. |
| `regions.lua` boxes are coarse and overlap | Wrong town for border buildings; some towns unnamed. | **Verified**: Muldraugh/Rosewood and Jefferson/LAA overlap; Brandenburg, Echo Creek, Ekron, Fallas Lake and Irvington have no entry. |
| Automatic baseline is a poor fit (highway towns, MarchRidge, ValleyStation) | Numbers look odd. | Not verified; the owner checks the baseline table. |
| Load time or memory higher than estimated | Stutter at game start, or memory pressure. | Not verified; measured in the Linux check before publishing. |
| The game's building list is complete at world start without exploring | A partial scan would miss towns. | Verified on Windows 42.20.4 by T2 (the same 9,978 in five scans). Not yet repeated on Linux. |
| A hot-load copy drifts from `AddressMap.lua` | The copy shows the old behaviour. | Gone: the old evidence window held the only copy and was removed (P4-R128). |
| Help text is wrong | The old window's help said numbers were "not available yet". | Gone with the window (P4-R128). |
| Scenario or mod maps other than "Muldraugh, KY" | No shipped data for them. | By design: numbers switch off, same as today (`AddressMap.lua:200`). |

## 8. Work breakdown

Sizes: **S** is under half a day, **M** about a day, **L** two or more days.

| # | Step | Size |
|---|---|---|
| 1 | Linux scan script, plus one run exporting every building. Also run it in a second fresh world and compare ids (risk 1). | M |
| 2 | Offline road tool: all of `streets.xml` into blocks (the generator for `AddressRoads.lua` is not in the repo). | M |
| 3 | Offline numbering tool: towns from `regions.lua`, baseline choice, per-town numbering, unnamed-area grouping, owner report. Reuses `AddressIndex.lua` rules. | L |
| 4 | Owner checks the baseline table and the rural-numbering default. Answer section 5. | S (owner) |
| 5 | Generate and commit `Generated/AddressBook.lua` with its header. | S |
| 6 | `AddressMap` reads the shipped file; header check; save nothing; implement the section 5 answer. | M |
| 7 | Unit tests (section 6). | M |
| 8 | Linux check `addresses.sh`, including load time, memory and budget, plus a `prove.py` mutation. | M |
| 9 | Full suite, boot check, Workshop publish, attended Windows check on a Riverside paper map. | S (plus owner time) |

Order: 1 → 2 → 3 → 4 → 5 → 6 → 7/8 → 9. Nothing here should start during a
playtest.

## 9. What was built (2026-09-16)

**Pipeline, as shipped.**

1. `tools/autotest/checks/address_export.sh NAME` exports every building from
   a fresh world into `dev/addresses/NAME.tsv` (9,978 buildings in about 90
   seconds). It is driven in steps from the shell; a per-tick handler never ran
   from a file loaded through the eval channel. Two fresh worlds gave
   **byte-identical exports**, so building ids and footprints are stable across
   worlds (risk 1 in section 7 is retired). `dev/addresses/world1.tsv` is the
   committed source.
2. `lua5.1 tools/addresses/build.lua --export dev/addresses/world1.tsv
   --streets <streets.xml> --regions <regions.lua> --annotations
   <worldmap-annotations.lua> --out
   mod/common/media/lua/shared/ConspiracyFiles/Generated/AddressBook.lua
   --report <report.md>` numbers the map in under a second and writes the
   shipped book (370 KB, 6,796 houses, revision `whole-map-1`).
3. `AddressMap` reads the shipped book at game start: ready before any case,
   nothing scanned, nothing written to the save. A save that already froze a
   Muldraugh book keeps it (P4-R120). Another map, or a missing book, gets no
   numbers and no scan.

**Differences from the draft.**

- **Towns regions.lua does not name** (Brandenburg, Echo Creek, Ekron, Fallas
  Lake, Irvington) come from the game's own world-map town labels
  (`worldmap-annotations.lua`, style `text-town`): a building outside every
  regions.lua box belongs to the nearest such label within 800 tiles, with its
  own starting street and numbering. regions.lua still wins where it covers.
- **Street blocks** are cut where a differently named street crosses or ends
  within half its width plus 3 tiles (2,738 blocks). The trial's road file could
  not be reproduced exactly.
- **Railways** (names with "Railroad", plus the Old Muldraugh Station Branch
  Line) are never streets; **highways** (KY-*, Dixie Highway, Brandenburg
  Bypass, Lakeshore Pkwy) are never a starting street.
- `AddressMap.townForBuilding(id)` gives a house's town, or nil for an unnamed
  area. Text does not add the town name yet (section 3.2 item 6 is open).

**Result on the real map (report of 2026-09-16).**

| Town | Starting street | Numbered | No street within 60 |
|---|---|---|---|
| Brandenburg (map label) | Main St | 322 | 13 |
| Echo Creek (map label) | Main St | 70 | 3 |
| Ekron (map label) | Haysville Road (longest) | 163 | 17 |
| Fallas Lake (map label) | Main St | 132 | 16 |
| Irvington (map label) | Main St | 370 | 12 |
| Jefferson | South Park Road (longest) | 254 | 35 |
| LAA | Terminal Dr (partly inside) | 7 | 18 |
| Louisville | E Main St / W Main St | 3,122 | 113 |
| MarchRidge | Fiddler's Trail (longest) | 241 | 0 |
| Muldraugh | N Main St / S Main St | 436 | 77 |
| Riverside | E Main St / W Main St | 451 | 36 |
| Rosewood | North Main St / South Main St | 245 | 42 |
| ValleyStation | Bearcamp Road (longest) | 142 | 20 |
| WestPoint | Main St | 360 | 30 |
| 23 unnamed rural areas | longest street, or along a highway | 488 | 0 |

Totals: 7,604 homes and businesses considered, 6,796 numbered, no street block
over its 49 slots. 376 rural buildings have no named street within 60 tiles.

**Checks.** `test/address_numbering.lua` (the rules), `test/address_shipped.lua`
(the runtime), and the Linux in-game check `tools/autotest/checks/addresses.sh`
(ready at game start with no case, nothing saved, every shipped building live
with the same footprint, sample addresses per town, load time).

**Attended Windows check, 2026-09-16 (owner).** A new game on DEV-0.41.0:
"confirmed, houses have numbers". An existing save kept its frozen Muldraugh
book and showed none outside it, as P4-R120/P4-R131 intend.

**Town names in text, built 2026-09-17 (section 3.2 item 6).** When the mod's
text names a place outside the town the survivor is in, the town is added -
"102 Main St, West Point". Inside their own town the address reads exactly as
before: nobody names the town they are standing in. The survivor's town is the
town of the nearest numbered building (`AddressMap.currentTown`), worked out at
most every five seconds and only after they have moved 32 tiles, so a label
costs one field read and one compare - a reading surface pays nothing per row.
It is **sticky**: out in the country, with nothing numbered nearby, the
survivor stays of the town they last stood in. While it is not known at all -
no player yet, no book, or a save that has never been near a numbered house -
the label reads as it does today rather than guessing at a town. A building in
an unnamed rural area still gets no town, as before. `WestPoint`, `MarchRidge`
and `ValleyStation` are written out as said ("West Point"); any other area name
is used exactly as `regions.lua` spells it, so `LAA` stays `LAA`. Applied
inside `AddressMap.labelForBuilding`, `nearest` and `describe`, so every reader
gets it at once; map labels are untouched, because the map already shows where
a town is. The longest qualified label in the shipped book is 43 characters
("102 Chapelmount Downs Back Road, Louisville"), well inside every store's
limit. Checked by `test/address_shipped.lua`.

**The town was frozen per session; fixed 2026-09-18.** The first real-game
measurement of the item above failed: standing in West Point, **0 of 16 records
about Muldraugh named Muldraugh** (campaign `20260918T005315`). Nothing was
wrong with `labelForBuilding` - the fault was a caller that REMEMBERED what it
returned. `GeneratedRuntime`'s `addressCache` (and a second copy of it inside
the dev diagnostic) held the finished, town-qualified address, so whichever town
the survivor happened to be in when a building was first read became that
building's address for the rest of the session.

The rule this leaves behind, and the reason the fix is shaped this way:

> **A cache may hold the two halves of an address, never the finished one.**
> `AddressMap.labelParts(id)` returns the raw label and its town;
> `AddressMap.qualify(label,town)` finishes it against where the survivor is
> standing now. A cache that must hold a finished address has to carry the
> survivor's town in its key instead - which is what `IdentityObserver`'s place
> cache now does, since it caches sentences ("right outside 109 Walker Road")
> rather than labels.

Qualifying on the way out is not a hot path: it is one compare over
`currentTown`, which is itself re-measured at most every five seconds and only
after 32 tiles of movement. Pinned by `test/address_shipped.lua` (the two halves
read correctly from both towns; the finished form does not; and neither cache
may key a finished address without the town).

*Not covered by that fix, and still frozen by design:* the **FOUND** line on a
record row comes from the discovery ledger, which stores the address as words at
the moment of the find (`DiscoveryLedger.places`), and a key lead stores the
address it was written with. Those are history - what the survivor noted at the
time - not a live lookup. If the real-game assertion still reports "0 of N"
after this fix, that is what it is reading: the ledger also keeps `placeIds`, so
re-deriving the label live for rows that have a building id would be the next
step, and needs an owner call on whether a remembered note should change its
wording after the fact.

**Still open.** A small override list for naming rural areas; the rest of the
attended check in section 6 (a found paper map of another town, and one house's
address in the organiser matching its map number). Owner check wanted: read a
case file about another town and confirm the town reads well in the record.
