# Native acceptance — tasks 4 to 7

**Superseded 2026-09-22.** The 2026-09-21 edition of this document is kept
below the line; everything above it is the current position.

Machine: Linux development box. Project Zomboid **42.20.4 (`b0bbce05d5`)**.
Renderer **Intel Iris Xe on display `:0`** — hardware, for every run recorded
here.

## Where each gate stands

| # | Gate | Result | Revision | Evidence |
|---|---|---|---|---|
| 0 | Boot | **PASS** | `53dbc61` | `20260921T151608-boot.txt` |
| 1 | **Full multi-case campaign** | **PASS** — 0 product, 0 harness failures | `de22790` | `20260922T093946-campaign.txt` |
| 2 | Personal opening + linked continuation | **NOT EXERCISED** | — | `opening_in_play.sh`, `pair_in_play.sh` exist and are unrun |
| 3 | Real map journey to a payoff | **NOT EXERCISED** | — | — |
| 4 | Organiser scrolling and rocker | **NOT EXERCISED** | — | `organiser.sh`, `knox.sh`, fieldnote `boot_test.sh` |
| 5 | Shared restaurant in game | **NOT EXERCISED** | — | offline only (`test/shared_destination.lua`) |
| 6 | Placement interruption/recovery | **NOT EXERCISED** at this line | — | `map_placement.sh` |
| 6b | Investigate Area markers | **NOT EXERCISED** — gate newly written | — | `checks/marker_lifecycle.{sh,lua}` |
| 7 | All 125 destinations | **FAIL** — 125/125 reached, 123 pass every column, 56 mod errors | `038eee9` | `*-map-coverage.txt` |
| 8 | Combined native save state | **PARTIAL** | `de22790` | campaign report's per-root sizes |

## Gate 1 — the campaign passes

```
Linux campaign check 20260922T093946: PASS
outcome: 0 product failure(s), 0 harness failure(s), 2 stage(s) not exercised
```

Three cases played and answered, three save/quit/continue rounds, the
four-unfinished-case limit, and the full archive: **18 records**, order
`111122233344445555`, 18 Old / 0 wrong, five finished cases, 191,506 bytes.

**The eleven consequences of 2026-09-21 are gone**, and none of them were a
product defect. They were three stale expectations in the gate itself:

1. It demanded that case 2 be steered by case 1's answers. Under
   `DR-20260919-CONTINUITY` a followed **finding** outranks the closing
   questions, so case 2 carries a `follows` and the answers wait one case. The
   run logged `next case follows the finding recorded in
   generated:1247366911:case` — case 1 — for the very case the gate called
   unsteered.
2. It demanded case 3 be unsteered, when case 3 is exactly where the deferred
   answers land.
3. The same two demands again after reload 2.

The two `NOT EXERCISED` lines are honest: the answer-steered shape and
answer-locking were exercised **on case 3**, not case 2.

### What the gate could not see before

Four harness defects had to be fixed before it could reach a verdict at all,
three of them spotted by the owner watching the screen:

- the survivor was **stepped back into the street** by `goToWaitingSite`,
  where the filler answered `no-containers` — `docs/TESTING.md` records why:
  *"a house catalogued from the street yields one or two candidates and eight
  once the survivor walks in"*;
- the stall detector **fired before the fresh-neighbourhood remedy began**, so
  the design's own answer for a clue with nowhere to go was never once tried;
- the detector's fingerprint contained **scheduler step counts**, which rise
  whatever happens, so it could never fire — the exact trap the previous
  report had warned about in its own words;
- a clue parked at `unknown` after an interrupted placement made the case
  permanently unfinishable, which under
  `DR-20260922-UNKNOWN-CLUE-KEEPS-THE-CASE-OPEN` is intended, so the gate now
  reports `COULD NOT RUN` rather than 27 product failures.

## Gate 7 — all 125 reached, and still failing

```
designs reached: 125 of 125
geometry                                 125 of 125
payoff inserted, exactly one token       123 of 125
container identified and NOT a floor     123 of 125
target resolves AND a standable square   123 of 125
errors inside the mod                     56   <- the failure
```

**This is the first run to reach every design.** The nine area overlays and
nine previously ambiguous bindings mostly pass with real non-floor containers
— something the geometry-only evidence could never have shown.

It fails on 56 mod errors, all `offerContainer` indexing `getParent` on an
`ItemPickerJava$ItemPickerContainer`. **My earlier repair was wrong**: I
wrapped the call in a `pcall` and reported that it "stops it erroring". A
`pcall` stops an exception propagating, not Kahlua logging it — the original
call was already inside one and still wrote 24 errors. The class is now asked
with `instanceof` before the method is touched; a re-run measures it.

`WorldStashMap9` and `WorldStashMap20` resolved no payoff. Whether that is an
impossible placement or one never reached is **NOT ESTABLISHED**: the
diagnostic written to answer it called `Catalogue.get` when the local is named
`C`, so it threw and printed nothing.

## Gate 8 — the save, and what it is not

192,899 bytes at 7 of 16 cases with `MapMedia=349`. **Not a maximum**: the map
media root is nearly empty because the campaign gate reads no maps. The
offline estimator puts a combined fixture at 959,031 estimated bytes; an
estimate is not a native measurement and the two are not quoted as one.

---

# (superseded) # Native acceptance — task 7

**Every gate below is labelled PASS, FAIL or NOT EXERCISED, and nothing is
labelled from an earlier run.** Where a gate was reached at a different
revision than the others, the revision is named on its own row; there is no
single-SHA claim covering gates that were not run together.

Machine: Linux development box. Project Zomboid **42.20.4 (`b0bbce05d5`)**.
Renderer **Intel Mesa Intel(R) Iris(R) Xe Graphics (RPL-U) on display `:0`** —
hardware, not `llvmpipe`, for every run recorded here.

## The gates

| # | Gate | Result | Revision | Evidence |
|---|---|---|---|---|
| 0 | Boot: a world loads, all mod files load, zero mod errors | **PASS** | `53dbc61` | `20260921T151608-boot.txt` |
| 1 | Full multi-case campaign to a terminal campaign state | **FAIL** | `e6b9397` | `20260921T154959-campaign.txt` |
| 2 | Personal opening, then the linked enquiry continuation | **NOT EXERCISED** | — | — |
| 3 | Acquire and read a real map, travel to its destination, payoff | **NOT EXERCISED** | — | — |
| 4 | Organiser popup scrolling and rocker input | **NOT EXERCISED** | — | — |
| 5 | Shared-restaurant behaviour in game | **NOT EXERCISED** | — | — |
| 6 | Placement interruption/recovery and save/reload | **NOT EXERCISED** at this revision | — | `20260921T061655`, `20260920T224635` are older revisions |
| 7 | All 125 destinations, played | **FAIL** — 125 of 125 reached; 123 pass all four columns, 2 no payoff, and **24 mod errors** | `5845cf2` + `d87bc99` | `20260921T163248`, `20260921T171400-map-coverage.txt` |
| 8 | Combined native save-state measurement | **PARTIAL** | `e6b9397` | campaign report's per-root sizes |

Gates 2, 3, 4 and 5 need long attended play sessions and were not run. They are
**absent evidence, not passing evidence**.

## Gate 1 — the campaign, in full

The gate ran **every stage** for the first time: `11 product failure(s),
0 harness failure(s), 0 stage(s) not exercised`. Previous attempts stopped
part-way.

**All eleven failures are one defect with ten consequences.**

> **The survivor's answers steer the case after next, not the next case.**

Established, not inferred — the gate printed the case id:

```
FAIL: case 2 was not built from case 1's answers (steer from: unsteered)
FAIL: case 3 should be unsteered (case 1's answers used, case 2's empty)
FAIL: reload 2: case 3 gained a steer (generated:1357886097:case)
```

`generated:1357886097:case` **is case 1**. Case 1's answers did apply; they
applied one case late. The other eight failures follow from it: no records
contribution, the person did not return, the answers were not marked used by
case 2, the answers stayed changeable.

Inspecting the saved world afterwards (`pz.sh start --continue`) found case 1's
persisted answers to be:

```
way=person  reading=nil  matters=nil  usedBy=generated:603969656:case
```

where `603969656` is case 3, while at answer time the organiser reported
`reading=two  matters=person2  way=records` — the gate asserts that and did not
fail on it. **Whether that discrepancy is lossy persistence, a different field
mapping between the two views, or something else is NOT ESTABLISHED.** It is
the next thing to investigate and it needs a focused offline reproduction, not
another ninety-minute run.

### What gate 1 did establish as working

Worth stating, because a FAIL verdict hides it:

- five cases played to completion across seven cases in one save;
- **full evidence history retained**: 18 records, order `111112223333444555`,
  18 Old / 0 wrong, and reload 3 left the save byte-identical at 192,899;
- three save/quit/continue rounds, the record unchanged across each;
- map marks after reload 2: 10 written, 0 pending, 0 missing;
- the four-unfinished-case limit held, and a new case arrived after one
  finished — the preparation flag did not stick.

## Gate 8 — the save, measured properly

This is **PARTIAL**, and the reason matters. `CFReload.bytes()` summed eleven
of `SaveBudget`'s fourteen roots under a comment claiming it summed all of
them, omitting `mapMedia`, `placeVisits` and `casePeople`. Every save size in
the earlier campaign evidence is an undercount, and the gate's 500 kB
assertion was made against the wrong number. Fixed in `8743ed9`; the run above
is the first with a complete measurement:

```
192,899 bytes at 7 cases (5 finished), 18 records
  Generated.G2=167239  DiscoveryLedger=9115  CasePeople=3405
  KeyConnections=2602  VisitedBuildings=1529  PlaceVisits=1498  MapMedia=349
```

**Why it is only PARTIAL:** this is not the maximum legal state. It is 7 of 16
cases and `MapMedia=349` — the map-media root is nearly empty because the
campaign gate reads no maps. A real combined maximum needs 16 cases *and* all
125 map trails in one save. The offline estimator
(`test/map_feature_budget.lua`) puts a combined fixture at **959,031 estimated
bytes, 96% of the limit** — an estimate, not a native measurement, and the two
must not be quoted as if they were the same thing.

## Gate 7 — all 125 destinations

`tools/autotest/checks/map_coverage.{sh,lua}` were written for this task
because no check existed. The 2026-09-20 pass established **geometry only**,
and said so in its own closing section: it does not establish a reachable
non-floor container, an actual payoff insertion, or player access. The report
that followed nevertheless marked the gate PASS.

The new check gives every design a row with four separate columns — geometry,
payoff inserted with exactly one token, container identified and not a floor,
and access as three distinct claims (target resolves / square exists /
standable square). A partial run prints how many designs were **NOT
EXERCISED** and the command to continue, and states that "all 125 destinations
PASS" may not be written until every one is reached.

**Result: all 125 designs reached, across two runs. The gate FAILS, and not
for the reason anyone expected.**

Combined (12 designs at `5845cf2`, 113 at `d87bc99`):

```
geometry: a building or an area          125 of 125
payoff inserted, exactly one token       123 of 125
container identified and NOT a floor     123 of 125
target resolves AND a standable square   122 of 125
errors inside the mod                     24   <- the failure
```

Container kinds seen across the run include `shelves`, `counter`, `bin`,
`crate`, `cardboardbox`, `metal_shelves`, `fridge`, `cashregister`,
`sidetable`, `filingcabinet`, `displaycasebakery`, `clothingdryer` and
`ShotgunBox` — the selection is not collapsing onto one kind.

**The nine area overlays and the nine previously ambiguous bindings mostly
pass**, which the geometry-only evidence could not say: `WorldStashMap3, 6, 10,
11, 16, 17, 18, 21, 23` all inserted a payoff into a real non-floor container
with access.

**Two designs resolved no payoff at all** — `WorldStashMap9` (the 21-building
area overlay) and `WorldStashMap20`, both `state none, items -1, container
none`. Reported NOT EXERCISED, not FAIL: no payoff was established, and
nothing showed one to be impossible.

### The failure: 24 mod errors, and a feature that has never run

The run logged 24 error blocks, all the same:

```
Lua((MOD:Conspiracy-Files: Dead Air)).offerContainer> Exception thrown
java.lang.RuntimeException: attempted index: getParent of non-table:
    zombie.inventory.ItemPickerJava$ItemPickerContainer@6f40df87
```

`Events.OnFillContainer` passes an `ItemPickerJava$ItemPickerContainer`, not an
`ItemContainer`, and `offerContainer` called `container:getParent()` on its
first line. It is inside a `pcall`, so nothing crashed — **which is why it
survived**. The consequence is not log noise: the native-loot candidate path
bailed on line one for every container the game has ever filled, so the
behaviour its own comment describes, *"native loot completion contributes
candidates to the same diverse scan as ordinary discovery"*, has never
happened.

Fixed so it refuses with a reason and logs once per class instead of throwing
per container. **How to reach the real container from an `ItemPickerContainer`
is still unknown and was not guessed at** — see
`docs/research/OnFillContainer-B42.md`. Regression:
`test/offer_container_guard.lua`.

A Kahlua detail worth keeping: it throws on the **index**, not the call, so
`container.getParent and container:getParent()` throws too. Only a `pcall`
around a colon call can ask.

### Three faults in this check, all mine, all caught

Recorded because the check is new and its early output was wrong in ways that
looked like product failures:

1. `field()` was copied from `campaign.sh` without its one-argument form, so
   the one call that pipes read an empty string and **0 of 125** designs ran.
2. The verdict came from the failure list alone, so that run printed **PASS
   having measured nothing** — green by silence, the exact failure this check
   exists to prevent, inside the check. `test/coverage_verdict.lua` now
   forbids it.
3. The require path was `Generated/Choices`, which does not exist (it is
   `StorageChoices`). **Kahlua's `require` returns nil silently** rather than
   raising, so the fixture loaded cleanly and failed only when called; `ev()`
   swallows the error, so every row came back empty and was misread as "125
   designs resolve to no building and no area". The require is now asserted
   and an empty row is reported as a harness fault, never as a verdict about a
   design.

## Two harness defects found by the owner watching the screen

Recorded because they change how earlier evidence should be read.

1. **The survivor was standing in the street.** `CFCamp.moveOn` teleported to
   the centre of the building's *bounding box* while its comment said "into the
   middle of a building"; for an L-shaped building or a box spanning a garden
   that is outdoors, and nothing checked. Measured at `10855,10101` and
   `10618,9985`, both `getRoom()` nil. `docs/TESTING.md` records why it
   matters: *"a house catalogued from the street yields one or two candidates
   and eight once the survivor walks in."* Every placement observation the gate
   made was taken from outside. Fixed in `8195828`.

   **This was not the cause of the deferred-clue stall**, and the tidy version
   of that story is wrong: in the same run, cases 4, 5 and 6 placed every clue
   from `moveOn` positions, one into a vehicle glovebox.

2. **A failure message that assumed its own expectation.** "case 1's answers
   lost their used mark" was printed while the answers were plainly marked used
   by case 3. An empty field and a field naming the wrong case are different
   facts; reported as one, it reads as a second defect that does not exist.

## Runs preserved, including the interrupted ones

- `20260921T133647-campaign-filler-stall.txt` + its run log — a run **I broke**
  by editing a fixture it reloads mid-flight, and a second stopped deliberately.
  Kept whole, with a correction appended, including one reading tried and
  disproved before it was written down.
- `20260921T154959-campaign.txt` — the complete run above.

One caveat on the second: partway through its limit stage the owner moved the
survivor indoors by hand. From that point it is **no longer an unattended
observation**, and the stages after it are recorded with that qualification
rather than presented as untouched.
