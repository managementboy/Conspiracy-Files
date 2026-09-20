# Plan: vanilla printed media as the travel mechanism

**Revision 2 — planning only, nothing built. Written for a recheck.**

**Superseded in part by `MAP_MECHANISM_ANSWERS_2026-09-20.md`**, which carries
the identity mapping, the finite lifecycle, the rebuilt placement gate and the
pilot acceptance outcomes. Sections 6, 7, 8 and 10 below are the earlier, looser
versions of those; where they disagree, the answers document wins.

Reviewer: this is a complete plan, not a reply to the last review. Attack it on
its merits. §A lists what changed since revision 1 so the corrections can be
verified quickly; everything after stands on its own. The questions I most want
challenged are in §12.

Every number cited as measured names the command or log behind it. Anything
unverified is marked so.

---

## A. What changed since revision 1

Revision 1 was reviewed
(`docs/management/reviews/MAP_MECHANISM_REVIEW_2026-09-20.md`). Its verdict —
*"recognises several problems without making their resolution an effective
gate"* — was the accurate structural criticism. The main change: two stages are
now gates that block everything downstream.

| # | revision 1 said | corrected |
|---|---|---|
| 1 | ~487 ledger events, "it fits, barely" | **wrong twice over.** Revision 2's own "162 events, 50 spare" was also wrong. Measured: **7,826 bytes spendable, 9-15 destinations fundable** (§5) |
| 2 | Circuital Healing is "the obvious" pilot pair | **not sourced.** A flyer destination with no map bound to it. Replaced with `LouisvilleStashMap15` + gallery brochure (§8) |
| 3 | every supported map needs a matching flyer | **no.** The flyer is optional identification (§1) |
| 4 | "no new tracking is needed" for entered buildings | **wrong.** `VisitedBuildings` is `MAX=256` and swallows its capacity failure (§7) |
| 5 | "the trail follows the player" (four words) | a full lifecycle contract, using **lazy placement** rather than moving placed objects (§6) |
| 6 | the placement fault, second on a risk list | **Gate A**, with an exit that is not "enough clean runs" (§8) |
| 7 | Phase 0 verifies carriers for all destinations | **pilot and representative candidates only** — the original quietly contained most of the project (§8) |
| 8 | bulk blocked on an automated distinctness measure | **blocker withdrawn.** Editorial inventory plus human judgement (§8) |
| 9 | one destination proves the shape | it proves the *loop*; coexistence and contradiction need a **two-trail gate** (§8) |
| 10 | "this is the survival connection" | the label must be **earned** by naming the interaction; unresolved (§11) |

---

## 1. The mechanism

The player finds a vanilla **annotated map** and reads it. From then on, clues
**about that distant place** appear **near where the player currently is**,
sporadically, tied to the central question. Whenever they reach the marked
destination — their own schedule, no timer, no failure state — authored evidence
is waiting.

Separately, **flyers and brochures identify places our own paperwork names**. A
clue of ours mentions somewhere; a vanilla advert tells the player where it is.
This is an **optional aid**: not every flyer fires, and a map that already
identifies its destination does not need one.

Four decisions converge here, which is why they are planned as one mechanism:

| part | decision | contribution |
|---|---|---|
| the pull | `DR-20260920-Q33` | a map gives a reason to travel |
| the identification | `Q33`, `DR-20260919-Q15` | a flyer or brochure names the place |
| the payoff | `DR-20260919-Q15` | designed evidence placed at the destination |
| the reading | `DR-20260919-Q03`, `Q16` | a skill-specific observation of it |

## 2. Decided — please do not relitigate

A reviewer may argue a decision is wrong, but these are not open in this plan.

- **`DR-20260920-NO-CONCLUSION`** — mysteries may contradict each other; there is
  **no final conclusion**, by design, not withheld; every playthrough must
  differ. **Contradiction is the product.**
  - **Records contradict; events are never arbitrated.** Two cases' paperwork may
    disagree and the mod never says which is right.
  - **Nothing may imply a total** — no progress counter, no "3 of 12", no
    completion percentage. A denominator would imply an answer exists.
- **`DR-20260920-Q33` rulings:** trigger is **reading**; the trail **follows the
  player**; duplicates have **no rule** (leave it to luck, let the player
  wonder); a destination counts as visited **only if the player entered the
  buildings**.
- **Constraints:** every annotated map ties in, no rationing; each trail fragment
  is **independently ambiguous, never a piece of a larger shape**; no maximum
  concurrent maps; **an unfunded destination stays inert vanilla** and the mod
  says nothing about it.
- **`DR-20260920-BULK-PREMISES`** — the 20-premise count is an authoring
  artefact, not a ceiling.
- **`DR-20260919-COVERAGE-HONESTY`** — incomplete coverage is reported in release
  notes, never in the survivor's voice.

## 3. Substrate: what exists and works

The plan builds on this rather than beside it. Verified in a real game unless
noted.

- **Case generation** — 22 premises, two honest readings each, a case calendar,
  and cases that rebuild deterministically from their own record, which is what
  lets them survive a reload.
- **Clue placement and search** — clues in containers, cars, mailboxes and on
  corpses; found through the game's own search mode; noted via timed actions.
- **The organiser** — a 1993 pocket device holding files, names, dates, places.
- **Whole-map addresses** — 6,796 shipped house numbers, built in ~130 ms, no
  save cost.
- **The opening pair** (built and published 2026-09-19/20) — a personal opening
  in the survivor's own name, and a follow-up inheriting a **sourced thread**
  (document recorded, its reference, a routing point, the open question) that
  survives retirement and the deep archive.
- **The consistency harness** — `test/premise_consistency.lua`: every premise
  across 305 calendars in both readings, 40,260 renders in 8 s, checking
  impossible dates, relative phrases contradicting their own calendar, branch
  leakage, unsubstituted placeholders, and a list of banned assertion patterns.
  What that list covers is a finite set of checked phrasings and contracts, not a
  general detector of asserted conclusions.
- **Travel works mechanically** — Irvington to Muldraugh produced four cases
  across three towns with no errors. What it lacked was a *reason*, which is the
  gap this plan fills.

## 4. The asset

`docs/research/vanilla-print-2026-09-19/` — completed inspection.

- **125 annotated maps, 111 flyers, 22 brochures** (258 designs).
- **594 map marks resolved to coordinates.**
- All 133 flyers/brochures have a plain-text reading and **at least one vanilla
  destination rectangle**.
- Caveats from the research itself: 11 maps are symbols only; 9 have
  placeholder-like building anchors near zero; one hostile graffiti map has no
  meaningful destination; **8 entries are title-only with no matching artwork —
  excluded candidates, not playable designs.**
- **Registration-source evidence, not an in-game spawn test.**

## 5. Capacity — measured, not derived

This constrains the whole design, so it precedes the plan. Revision 2's figures
here were subtractions from a budget the campaign store had already been
measured against, and they ignored the reserve `test/case_archive.lua` asserts.
They are replaced by a fixture: **`test/map_feature_budget.lua`**, which builds
the worst-case 16-case save from a thousand real seeds and prices the map
feature against what is actually left.

| | measured |
|---|---|
| save budget (`P4-R17`) | 500,000 bytes |
| worst-case 16-case campaign store | 339,764 |
| the ledger ordinary play already writes (112 events) | 61,843 |
| reserved for every other stored root | 73,000 |
| committed | 474,607 |
| reserve the archive must preserve (`case_archive.lua:336`) | 17,567 |
| **spendable by the map feature** | **7,826** |

Per-event cost is a property of the **reference text**, not of the ledger
(`DiscoveryLedger.MAX_REF` is 700): measured at **903** bytes for a prose ref,
**553** for an ordinary case document, **411** for a short ref, **225** for a
coded ref with no place string. Trail state measures 206 bytes a trail; entry
state 68 bytes a destination.

| representation at all 125 destinations | cost | verdict |
|---|---|---|
| A every fragment and payoff a ledger event | 310,648 | over by 302,822 |
| B payoff in the ledger, fragments compact | 103,273 | over by 95,447 |
| C payoff with a short ref, fragments compact | 85,523 | over by 77,697 |
| D payoff coded, no place, fragments compact | 62,273 | over by 54,447 |

**Fundable destinations within the measured budget: 9 at an ordinary-cost
payoff, 15 at a coded payoff.**

**Making fragments free does not rescue this.** Even representation D — fragments
costing nothing, the payoff coded to five characters with no place — is over by
54,447. The binding cost is one ledger event per destination times the
catalogue, not the fragments. So lever 1 is necessary and nowhere near
sufficient.

**Product consequence.** "Every annotated map ties in" cannot mean every
annotated map *in one save*. It can mean every map is **eligible**, with the
funded dozen varying per playthrough — which is `NO-CONCLUSION`-shaped rather
than a restriction, but it is a product change, so it is the owner's (§11).

Identity and connection history sits inside the 73,000 reserved for other roots
and is not separately measured — the one remaining gap in the fixture, and it
can only reduce the 7,826.

Both new stores must be registered in the `tags` table at
`SaveBudget.lua:3`; an unregistered root is invisible to `B.check`. Test
alternating ordinary-case and trail writes near capacity, not a trail store
alone.

Also fixed: offline only, no runtime AI, reuse the game's own mechanics rather
than inventing systems, Build 42.20 single-player vanilla map. And a trail must
not consume one of the four active case slots — though bypassing the slots solves
neither ledger capacity nor total bytes.

## 6. The trail lifecycle contract

Revision 1 left every mechanical question inside the words "follows the player".

**What "follows" means: lazy placement of the next unplaced fragment near the
player.** Not moving an already-placed, undiscovered object. This needs no
relocation machinery, cannot orphan a physical item, and still satisfies the
intent — the player leaves the reading place immediately and meets relevant
material during ordinary survival.

| question | contract |
|---|---|
| next fragment, or move an existing one? | **place the next unplaced fragment**; never move a placed one |
| old fragments | **stay where they are** — a clue that vanishes was never findable |
| eligible carriers | unsearched, reachable containers only; never one already searched |
| trail vs destination | trail fragments are placed lazily; **destination evidence is anchored to its authored place and never moves** |
| pacing | a **global** work and discovery budget, not one rate per map; trails take turns; none may starve |
| arrival vs payoff | **entering the building is arrival; finding and noting the evidence is the payoff** — two separate events |

**Duplicate semantics.** The owner's ruling governs the player's experience —
leave it to luck, let them wonder. These are the engineering cases it does not
settle, and all resolve the same way:

- rereading the same copy — **no new trail**
- reading a second copy — **no new trail** (one trail per destination)
- a repeated engine callback — **idempotent**; the hook may fire more than once
- a reload — **no new trail**

The owner's tolerance for *physical* duplicate paper is preserved exactly: two
copies may exist and nothing explains why.

**"No maximum" does not mean unlimited work.** No designed cap on concurrent
maps; it does not license one spawn rate per map, unbounded work per tick, or
unbounded storage (§5).

## 7. Arrival and payoff contracts

- **Multi-building and multi-mark destinations** — which building counts is an
  **authored choice per destination**, recorded with it, never derived at
  runtime.
- **Outdoor and no-building destinations** break the entered-buildings ruling
  outright. Each needs an **explicit authored disposition**. Never invent a
  nearby building to satisfy the rule.
- **A map read inside its own target** — defined per destination alongside the
  above.
- **Destination-entry state needs its own durable store.** Not
  `VisitedBuildings`: it is `MAX=256`, and at capacity `V.record` returns the
  reason `"visited-buildings capacity exceeded"`, which
  `VisitedBuildingLog.record` **discards**, returning a bare `false`. Buildings already
  stored stay visited (`VisitedBuildings.has`), so this is not a total loss —
  but after 256 entered buildings every **subsequent** visit goes unrecorded and
  nothing says why, which for a destination reached late in a save is
  indistinguishable from never having gone. The new store must **surface**
  capacity rather than silently stopping.
- **The destination may not be in the state we assume** — previously looted or
  destroyed carriers, an unloaded area, arrival before the vanilla stash has
  prepared. Each needs defined behaviour, and **vanilla contents and effects are
  preserved** in all of them.
- **Both orders must work:** read-then-visit, and visit-then-read.
- **An emitted travel invitation must be honoured or narrowed.** Retiring an
  unavailable payoff as "incomplete" frees a case slot but does **not** fulfil an
  invitation the player already acted on by walking. Either recovery exists
  (§11.2), or the invitation is narrowed before such trails activate.

## 8. The plan

Five phases and **three gates**. Each gate names the work it blocks and the
work that proceeds regardless — Phase 0 blocks all trail activation; Gate A
blocks production rolling placement; Phase 1b blocks town rollout and bulk. None
of them blocks the others.

### Phase 0 — the read hook (gate)

**Define "read" operationally first:** something the engine can report — an
action completing, a UI transition — never whether a human understood the text.

The whole mechanism rests on this, and the prior planning work is explicit that
it is unproven: *"no suitable cooperative event has been proven… **do not guess
an `OnReadMedia` event**"*, and *"do not assume map creation, reading,
reveal-on-map, first building load and first container opening are equivalent
triggers"*.

Establish in a running Build 42.20 game:

1. an observable, cooperative read path, or the narrowest wrapper preserving
   return values and callback order for other mods;
2. behaviour under **acquisition, a cancelled opening, map reveal, rereading and
   reload** against that definition;
3. the real ordering of map creation, reading, reveal-on-map, first building load
   and first container opening (tickets S1/S2);
4. carrier reachability **for the pilot and representative candidates only** —
   per-destination checks for all 125 belong to coverage rollout.

**Exit:** a verified hook or a documented fallback, citing a re-runnable command
or archived log (`P4-R78`). **Failure returns the trigger ruling to the owner.**
An unverified hook must not be dressed as a documented assumption.

**Parallel, needing no hook:** costing lever 1 (§5), one sample narrative, pilot
source bindings, and the acceptance matrix.

### Gate A — the placement fault

A clue the record calls `placed` that is not in its container: three of nine
overnight runs, **never reproduced**. Two controlled-clock runs could not trigger
it because relocation proved near-unreachable — **unresolved evidence, not
evidence of safety**, and no indication that relocation is the cause.

Instrument the transitions so a failure distinguishes **insertion failure, wrong
container or identity lookup, player removal, relocation, world cleanup, and
save/reload divergence**. Verify the same logical clue against the same physical
target before and after an actual **successful** relocation and reload. A refused
relocation or unreadable target is **inconclusive — never a pass**.

**Exit:** a corrected cause, or a demonstrated placement path that avoids the
identified mechanism, with regression evidence. **A number of clean runs is not
an exit.**

**Gates:** production rolling placement. Phase 0 is independent and proceeds
regardless.

### Phase 1 — trail-state contract, then one destination

The contract and a **budget fixture** come first, before any persistence work —
deferring them risks building on the case structure this plan already knows it
cannot use.

Then the smallest complete instance: **`LouisvilleStashMap15` + the gallery
brochure**, whose Target mark **12546,1393** falls inside the brochure rectangle
**12510,1360–12579,1429**. Use the annotation target, **not** the stash building
anchor at 12619,1406 — the research warns that `buildingX/buildingY` would
misidentify the gallery. Subject to carrier verification; travel distance may
make another verified pair preferable.

Read detection → lazily placed trail → authored evidence at the destination →
one skill-specific observation, with the non-specialist reading as default.

**Verified by:** a fresh save, played through, then a current-build reload.

### Phase 1b — two trails (gate on coexistence)

One destination proves the physical loop. It **cannot** prove coexistence or
contradictory records — and contradiction is the stated product, so this is not
polish.

A two-trail fixture: both remain eligible, neither consumes a case slot, claims
stay attributable to their own sources, and **the organiser does not arbitrate a
winner**. A fixture suffices; two complete production destinations are not
needed.

### Phase 2 — pacing and the global budget

The global work and discovery budget from §6, measured against §5. Several maps
live together before any town is authored.

### Phase 3 — one town funded

Every map whose marks point into the pilot town gets authored evidence, wherever
the map was found. Everything else stays inert vanilla and silent. Coverage in
release notes. **Output:** the real cost of one town, so the rest can be priced.

### Phase 4 — bulk

Fragment and premise authoring at volume, where the variety requirement is
actually met.

**No automated measure of interestingness is required** — that blocker was
invented in revision 1 and is withdrawn. Instead a **compact editorial
inventory** per premise: document form, central question, the ambiguity, the
contradiction mechanism, the destination observation. Similarity checks flag
repetition; **human comparison decides whether the differences matter.**
Trialled on a small batch before volume.

The consistency harness remains a necessary mechanical check and is not proof of
quality. It checks a finite list of banned phrasings and contracts; that list,
and what it cannot see, is written down rather than trusted as a capability, and
editorial review is retained.

## 9. Risks, ranked

| # | risk | covered by |
|---|---|---|
| 1 | the read hook may not exist cleanly; both fallbacks are worse — acquiring is a lucky drop, first-proximity arrives too late to lay a trail before the journey | Phase 0, gate |
| 2 | the placement fault is unexplained, and a trail laid over a week of play is its worst case | Gate A |
| 3 | capacity: 50 events leaves ~16 trails a playthrough (§5) | lever 1 costing, parallel to Phase 0 |
| 4 | the vanilla stash system is treated as stable here and has not been observed running | Phase 0.3 |
| 5 | destination state cannot be assumed — looted, destroyed, unprepared | §7 |
| 6 | unfunded destinations must stay silent; a trail ending in nothing is worse than no trail | Phase 3 guard |
| 7 | flyer legibility — the link may not be noticeable without a quest marker | Phase 1 sample |
| 8 | bulk may rhyme, and nothing mechanical can detect it | Phase 4 editorial inventory |

## 10. Acceptance matrix

Every row demonstrated before the mechanism counts as delivered. Fresh-save
permission (`DR-20260919-Q29`) removes legacy migration, **not** current-build
persistence.

| # | case | passes when |
|---|---|---|
| 1 | fresh save, played, current-build reload | trail and destination state survive |
| 2 | repeated reads of one copy | no second trail |
| 3 | a duplicate physical copy | no second trail; the paper stays unexplained |
| 4 | two simultaneous trails | both eligible, no case slot consumed, claims attributable, no arbitration |
| 5 | destination entered before the map was read | defined behaviour, not an accident |
| 6 | destination carriers looted or destroyed | defined behaviour; vanilla preserved |
| 7 | late arrival, long after reading | evidence present, or an honest state |
| 8 | the trail actually follows | fragments appear near the player after moving |
| 9 | vanilla stash ordering | our insertion respects the observed order |
| 10 | recorded evidence preserved | discoveries survive retirement and archiving |
| 11 | combined storage and work limits | measured against §5, not estimated |

## 11. Open for the owner

1. **Which capacity lever** (§5): cheaper trail records, fewer ordinary cases
   while trails live, shorter trails, or a smaller campaign store. Lever 1 to be
   costed first; the choice is the owner's.
2. **Essential-evidence recovery.** Material to §7, not adjacent: a trail is an
   invitation the player acts on by walking, and retiring its payoff as
   "incomplete" frees a slot without honouring that. Decide recovery, or narrow
   the invitation before such trails activate.
3. **Sequencing.** `DR-20260919-Q31` orders the work personal opening → survival
   connection → loop improvements. Revision 1 asserted this **is** the survival
   connection; the label has to be earned by naming the **particular survival
   interaction** it satisfies, not claimed because travel is involved.
   Unresolved, and not claimed here.

## 12. Questions for the reviewer

1. **Is lazy placement genuinely enough** to satisfy "the trail follows me", or
   will a player who reads a map and then stays put for a week notice that
   nothing arrives until they move?
2. **Is one trail per destination right** when duplicates are deliberately
   unexplained? A second copy producing a second, *contradictory* trail about the
   same place is arguably more in keeping with `NO-CONCLUSION` than suppressing
   it.
3. **Does the 50-event budget make "no maximum" unachievable in practice**, and
   if so, is that a reason to revisit the ruling or to spend the engineering on a
   cheaper trail record?
4. **Is Gate A's exit criterion achievable at all?** "A corrected cause" may be
   unreachable for a fault seen three times in nine runs and never since. What is
   the honest alternative that is not simply "enough clean runs"?
5. **Is anything missing from §9**, particularly about the vanilla stash system,
   which this plan treats as stable on the strength of source inspection alone?
