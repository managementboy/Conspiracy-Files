# Plan: vanilla printed media as the travel mechanism

**Revision 4 — ACCEPTED 2026-09-20** as the final plan for feasibility work and
a gated pilot (`DR-20260920-MAP-PLAN`). No further broad rewrite; a few targeted
corrections remain outstanding. **Full rollout still depends on a storage model
that meets the coverage requirement and on engine verification** — either can
send this back. Nothing is built except the budget fixture in §5.

This is the whole plan in one document; there is no second file to read
alongside it.

**Revision 4 is revision 3 corrected in place, not rewritten.** The revision-3
review asked for four targeted corrections and explicitly not another complete
plan, so the structure and wording of revision 3 are untouched except where a
correction required it. The version number moves because the content moved on
twelve points, and a recheck needs to know which document it is holding.

Reviewer: §A has two tables — what changed since revision 2, then the
revision-3 review's corrections, rows 13-24 — so either round can be checked in
one pass. Everything after them stands on its own. The questions I want
challenged are in §15.

**Also now available**, which the last review could not find: the fixture is on
`main` as `test/map_feature_budget.lua` (`lua5.1 test/map_feature_budget.lua`),
and the measurement is recorded as `P4-R144` in `DECISIONS.md`.

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

**Revision 4** — corrections from the revision-3 review, applied in place rather
than by a fourth rewrite:

| # | revision 3 said | corrected |
|---|---|---|
| 13 | rationing is "`NO-CONCLUSION`-shaped rather than a restriction", and "costs no engineering" | **both withdrawn.** It is rationing; full coverage stays the requirement; a per-save subset needs real machinery (§5, §14.1) |
| 14 | spending the reserve is an alternative route to coverage | **it is not.** Even the whole 25,393 spare leaves a 36,880 shortfall (§5) |
| 15 | earlier revisions "double-counted the ordinary ledger" | **my diagnosis was wrong.** The old formula counted it once; the faults were omitted feature costs, an assumed event size, and the ignored reserve (§5) |
| 16 | identity/connection history "can only reduce the 7,826" | it is **inside** the 73,000 already reserved; reconciled once, not twice (§5) |
| 17 | ledger events are "the binding cost" | trail and entry state are over half of representation D (§5) |
| 18 | the one-outstanding cap prevents the trail draining unseen | **it only delays it.** Unseen exhaustion is now accepted and the promise narrowed; the name is "one *blocking* fragment" (§7) |
| 19 | "arrival does not yet count as arrival" if the payoff is late | **violates the owner's ruling.** Entry is recorded truthfully; preparation is tracked separately; the ordering is a Phase 0 finding (§8, §12) |
| 20 | interrupted placement "returns to its prior state" | insufficient — three recovery points, because insertion may have succeeded before commit (§8, §12) |
| 21 | a destroyed carrier moves the payoff | **only before placement.** All-unavailable holds it unplaced; destruction after placement spawns nothing (§8, §12) |
| 22 | §12 chose a recovery policy while §14 still asked whether recovery exists | mismatch resolved: the pilot has one policy; what stays open is narrower (§14.2) |
| 23 | the authored example | **rewritten** around a flat conflict about one referent, with provenance, a central question, and fixture values (§13) |
| 24 | no bounded storage change costed | costed: about **10.9 kB**, roughly twenty destinations (§5) |

**Revision 4 corrections** from the final review, applied without a revision 5:

| # | revision 4 said | corrected |
|---|---|---|
| 25 | §7's table still said "one outstanding unfound fragment" and that the cap "stops a moving player draining it" | contradicted the prose above it. Replaced; `PAID` duplicate row merged (§7) |
| 26 | §5 still called ledger events "the binding cost" before correcting itself | superseded sentence deleted (§5) |
| 27 | §1 promised evidence waiting on arrival with no failure state | **an unconditional guarantee §8 and §12 do not keep.** The pilot contract is stated at its real strength, and the finite following is labelled a pilot proposal (§1) |
| 28 | the example's gate log | **did not contradict anything** — a vehicle inside can leave later. Replaced with two explicit incompatible claims about inventory G-14 (§13) |
| 29 | the specialist reading was "the same number is on both" | that is available to any reader and is not expertise. Now a restrained judgement about the *form* of the two records (§13) |
| 30 | gallery cargo moving implied evacuation was still operating | overclaimed. Narrowed to which services ran, and in what priority (§13) |
| 31 | the fixture asserted the shortfall persists | **a future optimisation would have failed the test.** It now reports the shortfall and asserts required pilot capacity instead |

---

## 1. The mechanism

The player finds a vanilla **annotated map** and reads it. From then on, clues
**about that distant place** appear **near where the player currently is**,
sporadically, tied to the central question. They travel on their own schedule —
no timer, no countdown, nothing lost by going late.

**The pilot contract, stated at the strength it is actually delivered:**

> Reading a supported map offers a **finite set** of local clue opportunities.
> Destination evidence has **no time-based expiry**. Placement uses the
> destination's **authored carriers**; if none is available, placement remains
> **pending**. Successfully placed evidence remains subject to **ordinary world
> destruction**.

Revision 3's "whenever they arrive, evidence is waiting, no failure state" was an
unconditional guarantee that §8 and §12 do not keep. This is a **narrower product
promise**, not a technical clarification of the same one.

And the finite following — three opportunities that may all be missed — is a
**pilot proposal**, not a demonstration that the owner's original following
requirement survived. Neither reading is owner-approved; the decision record says
so.

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
revisions were wrong, and my account of why was also wrong.** The old formula
counted the ordinary ledger once, not twice; "double-counting" was my own loose
diagnosis and is withdrawn. The actual faults were three: feature costs omitted
entirely (destination payoffs, trail state, entry state), an event size assumed
rather than measured, and the reserve ignored. Revision 1 said 487 events "fit,
barely"; revision 2 said 162 affordable with 50 spare.

Replaced by a fixture — **`test/map_feature_budget.lua`** — which builds the
worst-case 16-case save from a thousand real seeds and prices the feature against
what is actually left. Recorded as `P4-R144`.

| | measured |
|---|---|
| save budget (`P4-R17`) — **a chosen ceiling, not a format limit** | 500,000 bytes |
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

**And spending it does not fund coverage.** Representation D costs 62,273 bytes;
the entire spare before the reserve is 25,393. **Even spending every reserved
byte leaves a 36,880-byte shortfall.** Spending the reserve is a way to buy a few
more destinations, never an alternative route to all 125.

**The 339,764 figure is the largest of a thousand sampled seeds, not a proven
upper bound.** A worse case may exist outside the sample. That is why a safety
allowance is retained rather than treated as slack.

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
54,447. A cheaper fragment record is necessary and nowhere near sufficient.

**What is not yet measured:** identity and connection history sits **inside** the
73,000 already reserved for other roots, so it is provided for and must not be
subtracted from the 7,826 a second time. What is genuinely unpriced is any part
of the feature that would grow *beyond* that reservation — and that is the figure
to reconcile once, not twice.

**The binding cost is the whole per-destination record**, not the ledger event
alone: at representation D, trail state (25,699) and entry state (8,449) are over
half the total.

**A cheaper number is not automatically admissible.** Representation D reaches
225 bytes partly by dropping the place string. Losing where the player found
something is a loss of evidence, not a saving; it is only admissible via a
compact reference that can reproduce the place, or as a disclosed loss.

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

**One bounded storage change, costed.** Interning the place strings every event
repeats saves **10,881** bytes; also interning the `generated:<caseid>:` prefix
saves 10,642 — slightly worse, because the extra table costs more than the
prefixes it removes. So the honest prize from compressing what exists is about
**10.9 kB: roughly twenty more destinations, not a hundred and ten.** The fixture
asserts this stays below the shortfall, so if a future change does close the gap,
the test fails and the coverage question reopens.

**Product consequence — stated plainly, without dressing it up.** **Full
coverage remains the requirement** (§2: every annotated map ties in, no
rationing). What the measurement establishes is that the current representation
cannot deliver it under the retained campaign load — not that universal support
is impossible.

The alternative, if the owner chooses it, is **rationing**, and it should be
called that: many maps the player reads would offer no mod contribution *even
though authored content exists for them*. My revision-3 framing of this as
"`NO-CONCLUSION`-shaped rather than a restriction" is **withdrawn** — it renamed
a reduction in scope as fulfilment of the decision. "Costs no engineering" is
also withdrawn: a per-save subset needs persistent selection, capacity
allocation, activation rules, and tests that an earlier promise survives later
ordinary-case writes.

**Storage is therefore costed before rationing is proposed**, and rationing goes
to the owner as a product decision (§14.1), not as an accounting outcome.

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

**Revision 3's cap did not fix the first failure — it delayed it**, and the
review is right. Fragment A is placed and missed, its interval expires, B is
placed and missed, C is placed, the trail is `EXHAUSTED`, and the player has
found none of them. The cap slowed that; it did not prevent it.

**The decision: a trail is a finite series of opportunities that can end
unseen, and the following promise is narrowed to match.** A trail offers three
chances near the player; if all three are walked past, the fragments remain in
the world where they were left, findable, and nothing further is placed. The mod
never says a trail is exhausted, because that would be a denominator (§2).

The alternative — re-offering the same logical fragment at a new place without
relocating the old copy — is a real option, not taken here: it needs its own
physical-placement identity and replay rules, and it is the kind of machinery
that should follow evidence that the narrowed promise is not enough.

**"One outstanding" was the wrong name.** It is **one *blocking* fragment**:
released fragments stay unfound and findable, so several may be outstanding at
once, and whatever state they need is budgeted (§5) rather than assumed free.

**What "follows" means: lazy placement of the next unplaced fragment near the
player.** Never moving an already-placed, undiscovered object. Destination
evidence is anchored to its authored place and never moves.

**States:** `INERT` → `ACTIVE` → `EXHAUSTED`, with `ARRIVED` and `PAID` recorded
independently of all three.

| transition | rule |
|---|---|
| `INERT` → `ACTIVE` | the design is read **and** funded. An unfunded design stays `INERT` **and the read is recorded** — not silently forgotten |
| next fragment eligible | Placement advances the authored fragment index. At most **one** fragment blocks further placement until discovery or expiry of its persisted release interval. Older released fragments remain findable. **This limits pacing; it does not prevent all three opportunities being missed.** |
| a missed fragment | does **not** stall the trail. After a bounded interval the **blocking** fragment is **released**: it stays in the world, findable, but no longer blocks the next placement |
| the release clock | an in-game hour stamp **persisted with the trail**. A long time advance or a reload releases on the same comparison it would have made live — never a session timer, which a reload would reset |
| `PAID` | **stops local placement.** The destination evidence is found and noted; continuing to place fragments about it would be reminders after the fact. `ARRIVED` alone does not stop placement |
| no eligible carrier | the trail **defers** — it does not consume its turn and does not block others |
| `ACTIVE` → `EXHAUSTED` | all authored fragments placed. The trail stops placing and stays open for arrival |
| `ARRIVED` | the player entered the authored building of the destination |
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
- **Entry and preparation are different events, and entry is recorded
  truthfully.** The owner's ruling is that entering the buildings *is* the visit,
  so a readiness flag may never change whether the player entered. Entry is
  recorded when it happens; **preparation is tracked separately**; and "evidence
  available before the carrier can first be inspected" is an **ordering
  requirement the pilot must prove**, not a licence to redefine arrival.
- **Interrupted placement has three recovery points, not one.** "Return to the
  prior state" is insufficient: if insertion succeeded and interruption came
  before the record was committed, reverting the record leaves an object behind
  and a retry creates a second. So: **before insertion** — no record, nothing
  placed; **after insertion, before commit** — the placement identity is
  reconciled against the physical object when the carrier is observable, and held
  as **unknown** when it is not, never retried blind; **after commit** — the
  record stands and the object is not re-created.
- **Carriers are finite, and destruction is not failure.** A payoff whose
  authored carrier is unavailable **before placement** moves to the next authored
  carrier at that destination; when **every** authored carrier is unavailable the
  payoff enters **`PENDING`** — a real state that retries when a valid carrier
  becomes available and survives reload still owing the retry — and the
  destination stays unpaid — it does not
  scatter to unauthored containers, and an unloaded carrier is never permission
  to duplicate its contents elsewhere. A carrier looted or destroyed **after**
  successful placement is the player's world working normally: **no replacement
  evidence is spawned.** The recovery rule exists for failed insertion, not for
  world destruction.
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
| 11 | **vanilla preparation running after our insertion** may remove our item or alter vanilla loot — callback order alone does not prove preservation. Include a prior-visited target and a duplicate read | Phase 0.4, §12 |
| 12 | **funding must hold over the save's lifetime**: a trail affordable today must not consume bytes an earlier promise needs, or lose its own payoff as ordinary cases grow. Authored coverage and runtime capacity reservation are different things, and reads retained for later funding cost bytes too | §5, extended fixture |

## 12. Acceptance — exact outcomes

"Defined behaviour" and "an honest state" are not criteria; they let almost
anything pass once described. Exact outcomes for the pilot. Fresh-save permission
(`DR-20260919-Q29`) removes legacy migration, **not** current-build persistence.

| situation | required outcome |
|---|---|
| read, never travelled | fragments appear near the player; payoff stays at the gallery, untouched |
| destination entered before the read | entry already recorded; the read still activates the trail; payoff placed and findable |
| map read inside the gallery | trail activates, payoff placed; first fragment placed on the player's next arrival elsewhere |
| arrival before the payoff is prepared | entry is recorded as entry regardless; the payoff must be placed before the carrier can first be inspected. If the engine cannot guarantee that order, it is a Phase 0 finding, not a redefinition of arrival |
| late arrival, weeks later | payoff present and findable; no expiry |
| authored carrier unavailable before placement | payoff moves to the next authored carrier at that destination; vanilla contents and effects unchanged |
| every authored carrier unavailable | payoff enters **`PENDING`** — its own state, not a quiet failure. Destination unpaid; nothing placed in an unauthored container |
| a valid carrier becomes available later | `PENDING` **retries successfully** and the payoff is placed |
| reload while `PENDING` | still `PENDING`; the retry is still owed |
| `PENDING` vs the arrival test | `PENDING` **must not pass** the ordinary arrival-success row. It is a conservative fallback, not delivery |
| unavailable vs unloaded | distinguished, never conflated: unloaded is **unknown** and retried; unavailable is observed |
| carrier looted or destroyed after placement | no replacement spawned — the world working normally is not an insertion failure |
| interrupted before insertion | no record, nothing placed |
| interrupted after insertion, before commit | reconciled against the object where the carrier is observable; held unknown where it is not; never retried blind |
| interrupted after commit | record stands, object not re-created |
| repeated reads of one copy | no second trail |
| a duplicate physical copy of the same design | no second trail; the paper stays unexplained |
| two distinct designs, one destination | both trails live; both contributions kept; no arbitration |
| an **unfunded** map read | no trail, no placement work, no implied payoff — and the read is recorded |
| reload at every stage above | state, fragment positions and scheduling position identical |
| vanilla stash ordering | our insertion respects the observed order |
| recorded evidence preserved | discoveries survive retirement and archiving with the same wording and source facts |
| combined storage and work limits | measured against §5, not estimated |

## 13. The complete authored example

Corrected again, and the fault was mine to catch: **"no vehicle admitted after
23:00" does not contradict a removal at 04:10.** A vehicle already inside can
leave later, and a sealed gate does not establish that nothing left by any route.
The reader had to supply the missing premise, which is exactly the failure the
previous version was rewritten to fix. The pair below makes two **explicit
incompatible claims about the same identified set of items.**

**The referent:** annex inventory **G-14** — a named, listed set of items.

**Local fragment — District Priority Removals list, third carbon.**
Entry: *"Annex inventory G-14 removed to Shelter 4, 04:10, 12 July."* Signed with
a warden number, **W-114**, no name.

**Destination evidence — annex custody sheet, morning of 12 July.**
Entry: *"05:00, 12 July — every item on annex inventory G-14 remained in the
annex; none removed since 23:00."* Countersigned **W-114**.

**The conflict is flat and needs no interpretation.** One sheet says G-14 left at
04:10; the other says at 05:00 every item of G-14 was still there and nothing had
moved since 23:00. Both cannot be true of the same items. Reliability stays
unresolved in both directions: a removals list may be pre-printed with intended
movements and marked through in advance, and a custody sheet may be a rolling
copy carried forward from the previous shift without being re-walked.

- **available to any reader:** the two sheets make opposite claims about the same
  inventory, and the same warden number is on both.
- **police-officer reading** (`DR-20260919-Q03`/`Q16`): a cautious reading of
  *this* document rather than privileged access to an obvious fact. The custody
  sheet's claim is the stronger of the two, because it asserts a positive
  observation of every listed item at a stated time, where the removals list
  asserts only that a line was completed. That makes the removals line the one
  worth doubting first — which is a judgement about the form of the two records,
  not a finding about what happened. It could still be the custody sheet that was
  never re-walked.

**Provenance, and the eligible local carrier.** Carbons of district removal lists
were distributed to **every warden post, police station and post office in the
district**, which is why a Louisville gallery's paperwork can plausibly turn up in
a filing tray two towns away. That class of building is the trail's eligible
carrier set for this design — not "any container".

**Why it bears on a central question — narrowly.** Gallery cargo moving does not
show that passenger evacuation was still running, and the example does not claim
it. What the pair raises is **which services were still operating, and in what
order of priority**, on a night when civilians were being directed to Shelter 4.
That is relevance enough. The records do not say what the listed items were, who
authorised their priority, or whether anyone was moved at all.

**Fixture values, so consistency can be tested:** inventory `G-14`; removal
recorded `12 July 04:10`; custody observation `12 July 05:00`; "none removed
since" `11 July 23:00`; shared warden number `W-114`; destination `Shelter 4`.
The generated dates must preserve that ordering, and the inventory code and
warden number must each come from **one placeholder** used twice — not two
strings that happen to match.

## 14. Open for the owner

1. **Whether to ration — and there is now a better option than any of these.**
   **The 500 kB is a ceiling we chose, not a limit of the save format**, which
   round-tripped 44 MB intact. The measurement it was set from records **4.4 MB
   saved in 512 ms with no stall at all** — nine times our whole budget — and
   nothing between that and the 44 MB failure was ever measured
   (`WHY_500KB_2026-09-20.md`). The catalogue needs about 555 kB. So the first
   thing to do is **measure our real save at 600 kB, 800 kB and 1 MB and raise
   the ceiling on evidence**; if it behaves like that row, this whole question
   dissolves. Rationing is the last resort, not the second.

   **Full coverage remains the
   objective, and the gap is an implementation constraint to solve — not
   permission to ration maps.** Shrinking the *representation* of the campaign
   store is engineering; retaining fewer cases or dropping evidence is a product
   tradeoff, and only the second is yours. The 10.9 kB result bounds one interning
   scheme, not all possible compression, so the next step is a concrete candidate
   rather than a saving promised from gross size. The measurement says the current
   representation funds **nine to fifteen** destinations, and compressing what
   exists buys about twenty more. The options, in the order I would spend effort
   on them: (a) shrink the campaign store — the largest item at 339,764 bytes, and
   the only one big enough to matter; (b) ration, accepting that many maps the
   player reads offer nothing *although authored content exists for them*, which
   needs persistent selection and its own tests; (c) spend the 17,567-byte
   reserve, which buys a few destinations and is not a route to coverage.
2. **Essential-evidence recovery — narrowed, not left open.** §12 now states one
   concrete policy for the pilot: unavailable-before-placement falls through the
   authored carriers, all-unavailable holds the payoff unplaced, and destruction
   after placement spawns nothing. That is a pilot policy, not a claim that
   arbitrary world destruction is solved. What remains yours is whether an
   *unfulfillable* invitation may be retired at all, or must be prevented from
   being issued.
3. **Sequencing.** `DR-20260919-Q31` orders the work personal opening → survival
   connection → loop improvements. The "survival connection" label has to be
   earned by naming the **particular survival interaction** it satisfies, not
   claimed because travel is involved. Unresolved, and not claimed here.

## 15. Questions for the reviewer

1. **Is the campaign store the right place to attack?** It is 339,764 of the
   474,607 committed, and the only item large enough to fund coverage. Everything
   else measured buys a dozen destinations at a time. Is shrinking retained case
   content the honest next measurement, or does that trade one promise for
   another?
2. **Does the narrowed following promise** (§7 — three chances, then the
   fragments stay where they were left) read as a finite series honestly, or does
   it need the re-offering machinery after all?
3. **Does the rewritten example** (§13) make a real conflict about one referent,
   and is the shared warden number an observable feature rather than another
   invented convention?
4. **Is holding a payoff unplaced** when every authored carrier is unavailable
   (§8) better than the alternatives, given that the player may have walked there
   on the strength of the map?
5. **Is the ordering requirement provable** — that the payoff is placed before
   its carrier can first be inspected — or is it the read hook's problem all over
   again, discovered one phase later?
