# Native acceptance — task 7

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
| 7 | All 125 destinations, played | see below | `8195828` | `*-map-coverage.txt` |
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

Result: see the run's own report. **The phrase "all 125 destinations PASS" is
not used anywhere in this document.**

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
