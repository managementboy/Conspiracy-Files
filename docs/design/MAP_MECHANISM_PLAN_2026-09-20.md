# Plan: vanilla printed media as the travel mechanism

**Revision 3 — planning only, nothing built except the budget fixture in §5.**

This is the whole plan in one document. It replaces revision 2 and absorbs the
five answers the revision-2 review asked for, so there is no second file to read
alongside it.

Reviewer: §A lists what changed and why, so corrections can be checked in one
pass. Everything after it stands on its own. The questions I want challenged are
in §15.

Every number cited as measured names the command or file behind it. Anything
unverified is marked so.

---

## A. What changed since revision 2

The revision-2 review's verdict was that sections labelled "contract", "gate"
and "acceptance" still described questions rather than decisions. Those are now
decisions. Two of them change the shape of the feature.

| # | revision 2 said | revision 3 |
|---|---|---|
| 1 | 162 ledger events affordable, 50 spare | **wrong the same way revision 1 was.** Measured: **7,826 bytes spendable, 9-15 destinations fundable** (§5) |
| 2 | make fragments cheap and capacity is solved | **it isn't.** Free fragments plus the cheapest payoff is still over by 54,447 (§5) |
| 3 | "one trail per destination", called idempotency | **duplicate suppression in disguise** — it would have swallowed a second map's testimony. Four identities now separated (§6) |
| 4 | "place the next unplaced fragment" | a **finite state machine** with a one-outstanding cap, release on a missed fragment, deferral without starvation (§7) |
| 5 | Gate A requires avoiding an "identified mechanism" | incoherent while the mechanism is unidentified. The old fault is **labelled unresolved**; the gate verifies **six clauses of a new contract** (§10) |
| 6 | "defined behaviour", "an honest state" as acceptance | **not criteria.** Exact outcomes per situation (§12) |
| 7 | no authored example yet | **one complete example**, written: fragment, payoff, specialist and default readings (§13) |
| 8 | "cannot orphan a physical item" | **withdrawn.** Avoiding relocation removes one failure path, not the class |
| 9 | "every destination reads as unvisited" past the cap | **inaccurate.** Stored ids stay visited; only later visits go unrecorded (§8) |
| 10 | "two gates", three labelled | **three gates**, each naming the work it blocks (§9) |
| 11 | harness detects "any document asserting a conclusion" | overstated. It checks a **finite list** of phrasings and contracts (§3) |
| 12 | reviewer reported stray shell text in the document | **not a defect** — it came from the terminal transcript around the file, not the file. Paste the document, not the session |

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
  that survives retirement and the deep archive.
- **The consistency harness** — `test/premise_consistency.lua`: every premise
  across 305 calendars in both readings, 40,260 renders in 8 s, checking
  impossible dates, relative phrases contradicting their own calendar, branch
  leakage, unsubstituted placeholders, and a **finite list of banned assertion
  phrasings**. That list is what it checks; it is not a general detector of
  asserted conclusions, and editorial review is not optional because it exists.
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

This constrains the whole design, so it precedes the plan. **Both earlier
revisions got it wrong the same way**: they subtracted from a budget the campaign
store had already been measured against, double-counting the ordinary ledger, and
neither honoured the reserve `test/case_archive.lua` asserts. Revision 1 said 487
events "fit, barely"; revision 2 said 162 affordable with 50 spare.

Replaced by a fixture — **`test/map_feature_budget.lua`** — which builds the
worst-case 16-case save from a thousand real seeds and prices the feature against
what is actually left. Recorded as `P4-R144`.

| | measured |
|---|---|
| save budget (`P4-R17`) | 500,000 bytes |
| worst-case 16-case campaign store | 339,764 |
| the ledger ordinary play already writes (112 events) | 61,843 |
| reserved for every other stored root | 73,000 |
| committed | 474,607 |
| reserve the archive must preserve (`case_archive.lua:336`) | 17,567 |
| **spendable by the map feature** | **7,826** |

**The reserve is justified, not chosen.** `test/case_archive.lua` asserts the
16-case archive must leave at least the 17,567 bytes the ten-case cap it replaced
left spare. Spending it makes the archive tighter than the thing it replaced —
a decision to record, not an accounting adjustment.

**Per-event cost is a property of the reference text, not of the ledger.**
`DiscoveryLedger.MAX_REF` is 700, and an event's cost is dominated by its
strings. Measured: **903** bytes for a prose reference, **553** for an ordinary
case document, **411** for a short reference, **225** for a coded reference with
no place string. Trail state measures **206** bytes a trail; entry state **68**
bytes a destination.

| representation at all 125 destinations | cost | verdict |
|---|---|---|
| A every fragment and payoff a ledger event | 310,648 | over by 302,822 |
| B payoff in the ledger, fragments compact | 103,273 | over by 95,447 |
| C payoff with a short ref, fragments compact | 85,523 | over by 77,697 |
| D payoff coded, no place, fragments compact | 62,273 | over by 54,447 |

**Fundable destinations within the measured budget: 9 at an ordinary-cost
payoff, 15 at a coded payoff.**

**Making fragments free does not rescue this.** Even representation D — fragments
costing nothing, payoff coded to five characters with no place — is over by
54,447. The binding cost is one ledger event per destination times the
catalogue, not the fragments. A cheaper fragment record is necessary and nowhere
near sufficient.

**What is not yet measured:** identity and connection history sits inside the
73,000 reserved for other roots and is not priced separately. It can only reduce
the 7,826.

**Evidence must not get cheaper by disappearing.** A fragment stored outside the
ledger still has to participate in the organiser's chronology, searching, source
attribution, save/reload and retirement. The candidate to measure is a compact
reference into **immutable authored content** plus saved variant data, and reload
must reproduce the same wording and the same source facts. A fragment the player
noted and then cannot find in their own record is a regression, not a saving.

**Both new stores must be registered** in the `tags` table at `SaveBudget.lua:3`.
An unregistered root is invisible to `B.check`, so writes to other roots would
not account for it. Test alternating ordinary-case and trail writes near
capacity, not a trail store in isolation.

**Product consequence, and it is the owner's (§14).** "Every annotated map ties
in" cannot mean every annotated map *in one save*. It can mean every map stays
**eligible**, with which handful actually pays off varying per playthrough — that
is `NO-CONCLUSION`-shaped rather than a restriction. The alternatives are buying
room by shrinking the campaign store, or spending the reserve.

Also fixed: offline only, no runtime AI, reuse the game's own mechanics rather
than inventing systems, Build 42.20 single-player vanilla map. And a trail must
not consume one of the four active case slots — though bypassing the slots solves
neither ledger capacity nor total bytes.

## 6. Identity: four things, previously one

Revision 2's "one trail per destination" was duplicate suppression dressed as
idempotency. Two different authored maps pointing at the same place are **not**
duplicates, and a destination-keyed trail would have swallowed the second map's
testimony — contradicting "every annotated map ties in".

| identity | what it is | what it keys | what it dedupes |
|---|---|---|---|
| **design id** | the authored vanilla item (`LouisvilleStashMap15`) | the authored binding: fragments, payoff, readings | nothing |
| **copy identity** | one physical item instance in the world | nothing persistent | reread, reload, repeated callback |
| **trail binding** | one activation of one design in one save | trail state, progress, scheduling position | a second copy of the **same design** reuses it |
| **destination id** | the place the marks resolve to | entry state, payoff anchoring | nothing — several trails may share a place |

Rules that follow:

- A repeated copy of the **same design** reuses its existing trail binding.
- **Distinct designs keep their own bindings and their own contributions**,
  whether or not they share a destination.
- Replay — callback, reload, reread — is deduplicated against the **trail
  binding**, never against the destination.
- If several designs deliberately share one payoff, the grouping is **declared in
  the authored binding**, and each source keeps its own fragments.

**Consequence for Phase 0:** the read hook must identify the **actual annotated
design**. Detecting that a map item or a map window was used cannot select a
binding. If the hook can only report the generic item, the feature does not work
as designed, and that returns to the owner rather than being patched with a
guess.

**Withdrawn:** revision 2's §12.2 suggestion that an identical duplicate copy
might spawn a second contradictory trail. Contradiction is the product, but it is
authored **between designs**, not manufactured out of a replayed callback. The
owner's tolerance for unexplained duplicate paper is untouched: two copies may
exist and nothing explains why.

## 7. The trail lifecycle — a finite state machine

Revision 2 said "place the next unplaced fragment" and left progression,
exhaustion and retries undefined. Both obvious rules fail: advancing on
**placement** lets a player outrun the whole trail without seeing a fragment;
advancing on **discovery** lets one missed clue stall it forever.

**What "follows" means: lazy placement of the next unplaced fragment near the
player.** Never moving an already-placed, undiscovered object. Destination
evidence is anchored to its authored place and never moves.

**States:** `INERT` → `ACTIVE` → `EXHAUSTED`, with `ARRIVED` and `PAID` recorded
independently of all three.

| transition | rule |
|---|---|
| `INERT` → `ACTIVE` | the design is read **and** funded. An unfunded design stays `INERT` **and the read is recorded** — not silently forgotten |
| next fragment eligible | when the previous one is **placed**, but at most **one outstanding unfound fragment**. Placement advances the trail; the outstanding cap stops a moving player draining it |
| a missed fragment | does **not** stall the trail. After a bounded interval the outstanding fragment is **released**: it stays in the world, findable, but no longer blocks the next placement |
| no eligible carrier | the trail **defers** — it does not consume its turn and does not block others |
| `ACTIVE` → `EXHAUSTED` | all authored fragments placed. The trail stops placing and stays open for arrival |
| `ARRIVED` | the player entered the authored building of the destination |
| `PAID` | the destination evidence was found **and** noted |
| arrival before payoff | arrival does **not** stop local placement. Stopping it on arrival is an accidental dead end |

**Scheduling, replacing "none may starve" with something testable:** every
`ACTIVE` trail with an eligible carrier receives a turn within a bounded number
of scheduler passes; a trail without a carrier defers; scheduling position
survives reload. Tests: a stationary player, a fully searched neighbourhood,
several trails at once, repeated reloads.

**Carrier eligibility needs its own definition**, established against the mod's
own discovery mechanics and tested separately from ordinary inventory
inspection — a convenient engine flag must not be assumed to mean "the player
searched this". And the honest limitation, stated rather than worked around:
**a fully searched base cannot receive a new container fragment.** The trail
defers there. It does not add items to searched containers.

**"No maximum" does not mean unlimited work.** No designed cap on concurrent
maps; it does not license one spawn rate per map, unbounded work per tick, or
unbounded storage (§5).

## 8. Arrival and payoff contracts

- **Multi-building and multi-mark destinations** — which building counts is an
  **authored choice per destination**, recorded with it, never derived at runtime.
- **Outdoor and no-building destinations** break the entered-buildings ruling
  outright. Each needs an **explicit authored disposition**. Never invent a nearby
  building to satisfy the rule.
- **A map read inside its own target** — defined per destination alongside the
  above.
- **Entry and preparation are different events.** Evidence must be available when
  the player can inspect its carrier, and detecting entry may be too late to
  start preparing. The order is verified in a running game, not assumed.
- **Destination-entry state needs its own durable store.** Not
  `VisitedBuildings`: it is `MAX=256`, and at capacity `V.record` returns the
  reason `"visited-buildings capacity exceeded"`, which
  `VisitedBuildingLog.record` **discards**, returning a bare `false`. Ids already
  stored stay visited (`VisitedBuildings.has`), so this is not a total loss — but
  every **subsequent** visit goes unrecorded and nothing says why, which for a
  destination reached late in a save is indistinguishable from never having gone.
  The new store must **surface** capacity rather than silently stopping.
- **The destination may not be in the state we assume** — previously looted or
  destroyed carriers, an unloaded area, arrival before the vanilla stash has
  prepared. Each needs defined behaviour, and **vanilla contents and effects are
  preserved** in all of them.
- **Both orders must work:** read-then-visit, and visit-then-read.
- **An emitted travel invitation must be honoured or narrowed.** Retiring an
  unavailable payoff as "incomplete" frees a case slot but does **not** fulfil an
  invitation the player already acted on by walking, and a log line reporting it
  honestly is not fulfilment either. Either recovery exists (§14.2), or the
  invitation is narrowed before such trails activate.

## 9. The plan

Five phases and **three gates**. Each gate names the work it blocks and the work
that proceeds regardless. None of them blocks the others.

### Phase 0 — the read hook (gate: blocks all trail activation)

**Define "read" operationally first:** something the engine can report — an
action completing, a UI transition — never whether a human understood the text.

The prior planning work is explicit that this is unproven: *"no suitable
cooperative event has been proven… **do not guess an `OnReadMedia` event**"*, and
*"do not assume map creation, reading, reveal-on-map, first building load and
first container opening are equivalent triggers"*.

Establish in a running Build 42.20 game:

1. an observable, cooperative read path, or the narrowest wrapper preserving
   return values and callback order for other mods;
2. that it identifies the **actual annotated design** (§6), not a generic map
   item;
3. behaviour under **acquisition, a cancelled opening, map reveal, rereading and
   reload** against that definition;
4. the real ordering of map creation, reading, reveal-on-map, first building load
   and first container opening (tickets S1/S2);
5. **acquisition through ordinary loot** in at least one run — a debug-created
   item does not demonstrate the natural route;
6. carrier reachability **for the pilot and representative candidates only** —
   per-destination checks for all 125 belong to coverage rollout.

**Exit:** a verified hook that names the design, or a documented fallback, citing
a re-runnable command or archived log (`P4-R78`). **Failure returns the trigger
ruling to the owner.** An unverified hook must not be dressed as a documented
assumption.

**Proceeds regardless:** the capacity work of §5, the authored example of §13,
pilot source bindings, and the acceptance matrix.

### Gate A — placement (gate: blocks production rolling placement)

See §10. Phase 0 and the authoring work proceed regardless.

### Phase 1 — trail-state contract, then one destination

The §7 state machine and a **budget fixture extension** come first, before any
persistence work — deferring them risks building on the case structure this plan
already knows it cannot use.

Then the smallest complete instance: **`LouisvilleStashMap15` + the gallery
brochure**, whose Target mark **12546,1393** falls inside the brochure rectangle
**12510,1360-12579,1429**. Use the annotation target, **not** the stash building
anchor at 12619,1406 — the research warns that `buildingX/buildingY` would
misidentify the gallery. Subject to carrier verification; travel distance may
make another verified pair preferable.

Read detection → lazily placed trail → authored evidence at the destination →
one skill-specific observation, with the non-specialist reading as default.

**The funded-binding guard applies from here**, not only at town rollout: read an
unfunded map and verify it creates no trail, no placement work and no implied
payoff, while still recording the read.

**Verified by:** a fresh save, played through, then a current-build reload, with
the exact outcomes of §12.

### Phase 1b — two trails (gate: blocks town rollout and bulk)

One destination proves the physical loop. It **cannot** prove coexistence or
contradictory records — and contradiction is the stated product, so this is not
polish.

A two-trail fixture: both remain eligible, neither consumes a case slot, claims
stay attributable to their own sources, and **the organiser does not arbitrate a
winner**. Include two **distinct designs sharing one destination** (§6), since
that is the case the old rule would have swallowed. A fixture suffices; two
complete production destinations are not needed.

### Phase 2 — pacing and the global budget

The bounded scheduler of §7, measured against §5. Several maps live together
before any town is authored.

### Phase 3 — one town funded

Every **funded** map whose marks point into the pilot town gets authored
evidence, wherever the map was found. Everything else stays inert vanilla and
silent. Coverage in release notes. **Output:** the real cost of one town, so the
rest can be priced against §5.

### Phase 4 — bulk

Fragment and premise authoring at volume, where the variety requirement is
actually met.

**No automated measure of interestingness is required** — that blocker was
invented in revision 1 and is withdrawn. Instead a **compact editorial
inventory** per premise: document form, central question, the ambiguity, the
contradiction mechanism, the destination observation. Similarity checks flag
repetition; **human comparison decides whether the differences matter.**
Trialled on a small batch before volume.

## 10. The placement gate

Revision 2's exit criterion was incoherent: it required avoiding an "identified
mechanism" while the mechanism stayed unidentified. **The historical fault is
labelled unresolved** — a clue the record called `placed` that was not in its
container, three of nine overnight runs, never reproduced; two controlled-clock
runs could not trigger it because relocation proved near-unreachable, which is
unresolved evidence rather than evidence of safety.

The gate instead verifies a specific contract for the **new** path, each clause a
check:

1. every logical placement has a **stable identity** and a **recorded intended
   carrier**;
2. a failed or refused insertion **cannot** advance it to `placed`;
3. repeated callbacks and reload do **not** multiply one logical placement;
4. an unloaded or uninspectable carrier is **unknown** — not absent, and not
   verified present;
5. player collection, movement or destruction of an item does **not** trigger
   false insertion-failure recovery;
6. interrupted transitions have explicit recovery that **preserves recorded
   evidence**.

Exercised as controlled failures in domain and adapter tests **and** through the
real production insertion and persistence path in a running game — simulated
failures do not prove engine behaviour.

**Whether the old fault is in scope is a finding, not an assumption:** establish
whether this path and the old rolling placement share placement or persistence
code. Where they do, verification covers that shared code.

**The release claim is bounded to exactly this:** this feature's specified
placement behaviour passed named checks; the historical mismatch remains
unresolved. Clean-run counts are not part of the claim.

## 11. Risks, ranked

| # | risk | covered by |
|---|---|---|
| 1 | the read hook may not exist cleanly, or may not name the design; both fallbacks are worse — acquiring is a lucky drop, first-proximity arrives too late to lay a trail | Phase 0, gate |
| 2 | capacity: 7,826 bytes funds 9-15 destinations, not 125 (§5) | measured; the lever is the owner's (§14.1) |
| 3 | the placement fault is unexplained, and a trail laid over a week of play is its worst case | Gate A (§10) |
| 4 | evidence could get "cheaper" by leaving the player's record | §5, the compact-reference contract |
| 5 | the vanilla stash system is treated as stable here and has not been observed running | Phase 0.4 |
| 6 | destination state cannot be assumed — looted, destroyed, unprepared; entry may be too late to prepare | §8, §12 |
| 7 | unfunded destinations must stay silent; a trail ending in nothing is worse than no trail | Phase 1 guard |
| 8 | a fully searched base starves a trail of carriers | §7, stated limitation, tested |
| 9 | flyer legibility — the link may not be noticeable without a quest marker | §13 example |
| 10 | bulk may rhyme, and nothing mechanical can detect it | Phase 4 editorial inventory |

## 12. Acceptance — exact outcomes

"Defined behaviour" and "an honest state" are not criteria; they let almost
anything pass once described. Exact outcomes for the pilot. Fresh-save permission
(`DR-20260919-Q29`) removes legacy migration, **not** current-build persistence.

| situation | required outcome |
|---|---|
| read, never travelled | fragments appear near the player; payoff stays at the gallery, untouched |
| destination entered before the read | entry already recorded; the read still activates the trail; payoff placed and findable |
| map read inside the gallery | trail activates, payoff placed; first fragment placed on the player's next arrival elsewhere |
| arrival before the payoff is prepared | payoff placed before the carrier can be inspected, or arrival does not yet count as arrival |
| late arrival, weeks later | payoff present and findable; no expiry |
| carrier looted or destroyed | payoff moves to another authored carrier at the same destination; vanilla contents and effects unchanged |
| interrupted placement | trail returns to its prior state; no `placed` record without an object |
| repeated reads of one copy | no second trail |
| a duplicate physical copy of the same design | no second trail; the paper stays unexplained |
| two distinct designs, one destination | both trails live; both contributions kept; no arbitration |
| an **unfunded** map read | no trail, no placement work, no implied payoff — and the read is recorded |
| reload at every stage above | state, fragment positions and scheduling position identical |
| vanilla stash ordering | our insertion respects the observed order |
| recorded evidence preserved | discoveries survive retirement and archiving with the same wording and source facts |
| combined storage and work limits | measured against §5, not estimated |

## 13. The complete authored example

Supplied because without it nobody can judge whether following a trail offers
anything beyond recurring ominous prose. It needs no hook.

**Local fragment — haulage docket, third carbon.** A Knox Freight consignment
sheet. Fourteen crates, *unglazed*, consigned to "Gallery annex, receiving bay —
**hold for collection**". Signed for with initials only. The collection line is
blank.

- reading one: nothing was ever collected, so fourteen crates may still be there.
- reading two: the third carbon is the driver's copy, where the collection line is
  *always* blank. It means nothing at all.

**Destination evidence — receiving bay tally, week ending.** The same consignment
number appears twice. Upper line: *held*. Lower line: *released*, in a different
hand, **dated three days earlier**.

- **default reading:** the two lines disagree about the date.
- **police-officer reading** (`DR-20260919-Q03`/`Q16`): tally sheets are worked
  top to bottom, so a line sitting above an earlier-dated line was either entered
  afterwards and placed above it, or the sheet was reused from a previous week.
  Which of the two, the sheet cannot say.

Both readings rest on the **same source facts** — the consignment number, the two
hands, the two dates. The specialist reading adds a *procedural* observation, not
a conclusion. Nothing says what was in the crates, who moved them, or whether any
of it connects to anything else — and the tally sheet contradicts the docket
about whether the consignment was ever collected, which is the product.

## 14. Open for the owner

1. **How many destinations get funded.** The measured answer is **nine to
   fifteen**, not 125. Three ways: fund a handful per playthrough with which
   handful varying (costs no engineering, and is `NO-CONCLUSION`-shaped); buy room
   by shrinking the campaign store; or spend the 17,567-byte reserve.
2. **Essential-evidence recovery.** A trail is an invitation the player honours by
   walking, and §12 refuses an honest log as fulfilment of it. Decide recovery, or
   narrow the invitation before such trails activate.
3. **Sequencing.** `DR-20260919-Q31` orders the work personal opening → survival
   connection → loop improvements. The "survival connection" label has to be
   earned by naming the **particular survival interaction** it satisfies, not
   claimed because travel is involved. Unresolved, and not claimed here.

## 15. Questions for the reviewer

1. **Does §5 kill the feature as conceived?** Nine to fifteen funded destinations
   out of 125 is a tenth of the catalogue. Is "every map eligible, a handful
   funded, varying per playthrough" an honest reading of "every annotated map ties
   in", or a restriction wearing its language?
2. **Is the one-outstanding-fragment cap the right progression rule** (§7), or
   does releasing a missed fragment after a bounded interval reintroduce the
   stall it was meant to prevent, just later?
3. **Is lazy placement genuinely enough** to satisfy "the trail follows me" for a
   player who reads a map and then stays put for a week?
4. **Are the six placement clauses** (§10) a sufficient substitute for a root
   cause, or does shipping with the historical fault unresolved remain the real
   risk whatever those checks say?
5. **Is anything missing from §11** — particularly the vanilla stash system,
   which this plan still treats as stable on the strength of source inspection
   alone?
