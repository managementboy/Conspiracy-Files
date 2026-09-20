# Plan: vanilla printed media as the travel mechanism

**Status: planning only. No development. Revision 2, after external review.**

Revision 1 was reviewed (`MAP_MECHANISM_REVIEW_2026-09-20.md`). The verdict:
*"proceed with a bounded diagnostic spike, but revise the capacity model and
pilot before production implementation. The current plan recognises several
problems without making their resolution an effective gate."*

That last clause is the accurate criticism and the main structural change here:
revision 1 **listed** risks and then planned past them. Gates are now gates.

## 0. What this revision corrects

Three factual errors, all verified against the current revision rather than
conceded on argument.

**0.1 The capacity model was wrong by 177 kB, and the ceiling is a quarter of
what I claimed.** Revision 1 compared an event *count* against the ledger's
512-entry cap while ignoring that those events cost bytes in the *same* 500 kB
budget as the campaign store. Measured constants, recomputed:

| | |
|---|---|
| 16-case campaign (measured, `test/case_archive.lua`) | 338,540 bytes |
| reserved for every other stored root | 73,000 bytes |
| budget (P4-R17) | 500,000 bytes |
| **bytes available to the discovery ledger** | **88,460** |
| **events that affords at ~545 bytes each** | **162** |
| already consumed by 16 ordinary cases at 7 documents | 112 |
| **events left for trails, identity and connections** | **50** |

So the 512-entry cap never binds — **bytes bind at 162** — and revision 1's
"~487 events, it fits, barely" was over budget by 176,955 bytes. The reviewer's
independent arithmetic reached the same conclusion from the same documented
baseline.

The reviewer also correctly notes two omissions: revision 1 counted no
**destination payoff** (125 destinations at one recorded piece each is +125), and
no **identity or connection discoveries**, which share the same ledger
(`DiscoveryLedger` `KINDS`).

**Consequence, and it is a product consequence rather than a technical one:**
"no maximum of concurrent maps" (`DR-20260920-Q33`) is affordable only if a
trail fragment is *cheap*. At 50 events a save, three-fragment trails allow
about **sixteen trails in an entire playthrough**. Four levers exist and none is
chosen here:

1. trail fragments are **not** discovery-ledger entries but a lighter record;
2. fewer ordinary cases while trails are live;
3. shorter trails (one or two fragments);
4. a smaller campaign store.

Lever 1 is the obvious candidate and the one to cost first. **I do not know what
a trail fragment costs, because one does not exist** — 545 bytes is the measured
cost of a *ledger* entry, not of a trail.

**0.2 The pilot pairing was asserted, not sourced.** Revision 1 called
**Circuital Healing** "the obvious first choice" for a destination with both a
map and a flyer. The research establishes it only as a **flyer** destination
(radio/electronics repair, 8B Hutchin's Drive, Ekron, rectangle
424,9776–471,9807) and separately *proposes* the relay-fault map as a later
technical destination. **No annotated map is bound to Circuital Healing by any
source.** I turned a proposed fictional connection into an existing vanilla
binding, which is the error the research warns about in its own text.

The reviewer's alternative **is** source-supported: `LouisvilleStashMap15`'s
Target mark at **12546,1393** falls inside the gallery brochure rectangle
**12510,1360–12579,1429** — a genuine same-place map-and-brochure pair. Its
warning travels with it: the annotation target differs from the stash building
anchor at **12619,1406**, and using `buildingX/buildingY` blindly would
misidentify the gallery. Travel distance may still make another verified pair
preferable; a short repeatable route is a fixture convenience, not evidence that
a binding exists.

**Also corrected:** revision 1 implied every supported map needs a matching
flyer. It does not. The flyer is an **optional identification aid**.

**0.3 Ruling 4 cannot reuse the visited-buildings store unchanged.**
`VisitedBuildings` is `MAX=256`, and at capacity `V.record` returns
`changed=false` with the reason `"visited-buildings capacity exceeded"` — which
`VisitedBuildingLog.record` **discards**, returning a bare `false`. So after 256
entered buildings, visits stop being recorded, nothing says why, and every
destination reads as unvisited for the rest of the save.

Revision 1 said "no new tracking is needed" for the entered-buildings ruling.
That was wrong. The ruling stands; its **storage does not**. Destination-entry
state needs its own durable representation, and the capacity failure needs to be
surfaced rather than swallowed.

## 1. The mechanism, in short

The player finds a vanilla **annotated map** and reads it. From then on, clues
**about that distant place** begin appearing **near where the player currently
is**, sporadically, tied to the central question. Whenever they eventually reach
the marked destination — on their own schedule, no timer, no failure state —
authored evidence is waiting.

Separately, **flyers and brochures identify places** that our own paperwork
names. Our clue mentions somewhere; a vanilla advert tells the player where it
is. Not every flyer launches anything.

Four decisions converge on one mechanism, which is why they are planned
together rather than sequentially:

| part | decision | what it contributes |
|---|---|---|
| the pull | `DR-20260920-Q33` | an annotated map gives a reason to travel |
| the identification | `DR-20260920-Q33`, `DR-20260919-Q15` | a flyer or brochure names the place |
| the payoff | `DR-20260919-Q15` | designed evidence placed at the destination |
| the reading | `DR-20260919-Q03`, `Q16` | a skill-specific observation of that evidence |

## 2. What is already decided — please do not relitigate

Settled by the owner. A reviewer may of course say a decision is wrong, but
these are not open questions in this plan.

- **`DR-20260920-NO-CONCLUSION`** — mysteries may contradict each other; there is
  **no final conclusion**, by design, not withheld; every playthrough must
  differ. Contradiction is the product.
  - Reconciliation with the event record: **records contradict, events are never
    arbitrated.** Two cases' paperwork may disagree and the mod never says which
    is right.
  - Consequence: **nothing may imply a total** — no progress counter, no "3 of
    12", no completion percentage. A denominator would imply an answer exists.
- **`DR-20260920-Q33` rulings:**
  1. **Trigger: reading** the map (not acquiring, not marks appearing).
  2. **The trail follows the player** as they move — not one placement.
  3. **Duplicates: no rule.** Leave it to luck; let the player wonder why there
     is a second copy.
  4. **A destination counts as visited only if the player actually ENTERED the
     buildings** — passing nearby does not count.
- **Constraints:** every annotated map ties in (no rationing); each trail
  fragment is **independently ambiguous, never a piece of a larger shape**; no
  maximum number of concurrent maps; **an unfunded destination stays inert
  vanilla** and the mod says nothing about it.
- **`DR-20260920-BULK-PREMISES`** — the 20-premise count is an authoring
  artefact, not a ceiling. Bulk authoring is the strategy `NO-CONCLUSION`
  requires.
- **`DR-20260919-COVERAGE-HONESTY`** — incomplete coverage is reported in
  release notes, never in the survivor's voice.

## 3. The substrate: what already exists and works

Relevant because the plan builds on it rather than beside it. All verified in a
real game unless noted.

- **Case generation** — 22 premises, each with two honest readings, placeholder
  substitution, a case calendar. Cases rebuild deterministically from their own
  record, which is what lets them survive a reload.
- **Clue placement and search** — clues hidden in containers, cars, mailboxes
  and on corpses; found through the game's own search mode; noted via timed
  actions.
- **The organiser** — a 1993 pocket device holding files, names, dates, places.
- **Whole-map addresses** — 6,796 shipped house numbers, built in ~130 ms, no
  save cost. An address names its town when elsewhere.
- **The opening pair** (built 2026-09-19/20, published) — a personal opening in
  the survivor's own name, and a connected follow-up that inherits a **sourced
  thread** (the document recorded, its reference, a routing point, the open
  question), surviving retirement and the deep archive.
- **The consistency harness** — `test/premise_consistency.lua` renders every
  premise across 305 calendars in both readings (40,260 renders, 8 s) and checks
  for impossible dates, relative phrases contradicting their own calendar,
  branch leakage, unsubstituted placeholders and any document asserting a
  conclusion. It exists because an audit found six defect classes twenty times
  over.
- **Travel works mechanically** — a run from Irvington to Muldraugh produced four
  cases across three towns with no errors. What it lacked was a *reason* to
  travel, which is the gap this plan fills.

## 4. The asset

`docs/research/vanilla-print-2026-09-19/` — completed inspection, not a
proposal:

- **125 annotated maps**, **111 flyers**, **22 brochures** (258 designs).
- **594 map marks resolved to coordinates.**
- All 133 flyers/brochures have a plain-text reading and **at least one vanilla
  destination rectangle**.
- Caveats from the research itself: 11 annotated maps are symbols only; 9 have
  placeholder-like building anchors near zero; one hostile graffiti map has no
  meaningful destination; **8 entries are title-only with no matching artwork and
  are excluded candidates, not playable designs.**
- Registration-source evidence, **not an in-game spawn test**.

## 5. Hard constraints

Measured, with the command that measures them.

| constraint | value | source |
|---|---|---|
| save budget | 500 kB total | P4-R17 |
| discovery ledger | ~545 bytes per document ever found, **capped at 512 entries** | `test/case_archive.lua` |
| live cases | `MAX_ACTIVE` = 4 | `Session` |
| cases per save | 16 (4 live, 4 full archive, 8 stubs) | `test/case_archive.lua` |
| mod size today | 4.3 MB; largest file 579 kB | `du`, `find` |
| full test suite | 67 s | `tools/autotest/unit.sh` |

Also fixed: offline only, no runtime AI, reuse the game's own mechanics rather
than inventing systems, Build 42.20 single-player vanilla map.

**Storage consequences — see §0.1 for the corrected model.** In short: bytes
bind at **162 ledger events**, of which 16 ordinary cases already take 112,
leaving **50**. A map trail must also not consume one of the four active case
slots, or reading a second map would block every later case — but bypassing the
slots solves neither ledger capacity nor total bytes.

## 6. The foundational unknown, before anything else

**We do not know that we can detect a map being read.**

The prior planning work says so explicitly and should be taken at its word:

> *"Read completion notification: no suitable cooperative event has been proven
> in this plan. Locate the actual completion/UI path in the Linux build. Prefer
> an existing event; otherwise document a narrowly cooperative wrapper that
> preserves return values, callback order and other mods. **Do not guess an
> `OnReadMedia` event.**"*

> *"Do not assume map creation, reading, reveal-on-map, first building load and
> first container opening are equivalent triggers."*

The whole mechanism hangs on ruling 1 (trigger = reading). If reading cannot be
detected cleanly, that ruling needs revisiting, and the fallbacks are worse:
acquiring is a lucky drop, and first-proximity-to-destination arrives too late
to lay a trail *before* the journey.

**Therefore no content work begins until this is settled in a real game.**

## 7. The trail lifecycle contract

Revision 1 said "the trail follows the player" and left every mechanical
question inside those four words. Resolved here, because the plan cannot be
costed without it.

**What "follows" means: lazy placement of the NEXT unplaced fragment near the
player.** Not moving an already-placed, undiscovered object. This is the
reviewer's suggestion and it is better than what revision 1 implied: it needs no
relocation machinery, it cannot orphan a physical item, and it satisfies the
owner's intent — the player leaves the reading place immediately and still meets
relevant material during ordinary survival.

The remaining distinctions, each settled:

| question | contract |
|---|---|
| next fragment, or move an existing one? | **place the next unplaced fragment** near the player; never move a placed one |
| old fragments | **stay where they are.** Never withdrawn — a clue that vanishes is a clue that was never findable |
| eligible carriers | unsearched, reachable containers only; never a container the player has already searched |
| trail vs destination | trail fragments are placed lazily; **destination evidence is anchored to its authored place and never moves** |
| pacing | a **global** work and discovery budget, not one rate per map. Trails take turns; no trail may starve |
| arrival vs payoff | **entering the building is arrival; finding and noting the evidence is the payoff.** Two separate events |

**Duplicates need technical semantics, which the owner's ruling deliberately does
not supply.** The ruling is about the player's experience — leave it to luck, let
them wonder. These four are engineering questions and all resolve the same way:

- **rereading the same copy** — no new trail
- **reading a second copy** — no new trail (one trail per destination)
- **a repeated engine callback** — idempotent; the hook may fire more than once
- **a reload** — no new trail

The owner's tolerance for *physical* duplicate paper is preserved exactly: two
copies may exist, and nothing explains why.

**"No maximum" does not mean unlimited work.** It means no designed cap on
concurrent maps. It does not license one spawn rate per map, unbounded work per
tick, or unbounded storage (§0.1).

## 8. Arrival and payoff contracts

Also unspecified in revision 1, and each is a real boundary.

- **Multi-building and multi-mark destinations** — which building counts is an
  **authored choice per destination**, recorded with the destination, not derived
  at runtime.
- **Outdoor and no-building destinations** break the entered-buildings ruling
  outright. Each needs an **explicit authored disposition**. Never invent a
  nearby building to satisfy the rule.
- **The map read inside its own target** — defined per destination alongside the
  above.
- **Destination-entry state needs its own durable store** (§0.3). Not
  `VisitedBuildings`, which is `MAX=256` and swallows its capacity failure. The
  new store must surface capacity rather than silently stopping.
- **The destination may not be in the state we assume**: previously looted or
  destroyed carriers, an unloaded area, arrival before the vanilla stash has
  prepared. Each needs a defined behaviour, and **vanilla contents and effects
  are preserved** in all of them.
- **Both orders must work**: read-then-visit, and visit-then-read.
- **An emitted travel invitation must be honoured or narrowed.** The open
  recovery question (§11) is material here, not adjacent: retiring an
  unavailable payoff as "incomplete" frees a case slot but does **not** fulfil an
  invitation the player already acted on by walking. Either recovery exists, or
  the invitation is narrowed before those trails are ever activated.

## 9. The plan

Six stages. **Two are gates**: nothing downstream of them begins until they
pass. Revision 1's failure was having no gate at all.

### Phase 0 — read-hook spike (gate)

**Define "read" operationally first:** something the engine can report — an
action completing, a UI transition — never whether a human understood the text.
Then establish, in a running Build 42.20 game:

1. an observable, cooperative read path, or the narrowest wrapper that preserves
   return values and callback order for other mods. **No guessed
   `OnReadMedia`.**
2. behaviour under **acquisition, a cancelled opening, map reveal, rereading and
   reload** against that definition.
3. the real ordering of map creation, reading, reveal-on-map, first building
   load and first container opening — **not assumed equivalent** (tickets
   S1/S2).
4. carrier reachability **for representative candidates and the pilot only**.
   Per-destination verification for all 125 belongs to coverage rollout;
   revision 1's Phase 0 quietly contained most of the project.

**Exit:** a verified hook or a documented fallback, citing a re-runnable command
or archived log (`P4-R78`). **Failure returns ruling 1 to the owner.** An
unverified hook must not be dressed as a documented assumption and built upon.

**Runs in parallel, needing no hook:** the corrected capacity model and trail-cost
measurement (§0.1 lever 1), one sample narrative, source bindings for the pilot,
and the acceptance matrix.

### Gate A — the placement fault

A clue the record calls `placed` that is not in its container: three of nine
overnight runs, **never reproduced**. Two controlled-clock runs could not trigger
it because relocation proved near-unreachable — which is **unresolved evidence,
not evidence of safety**, and does not establish relocation as the cause.

Instrument the transitions so a failure distinguishes: insertion failure, wrong
container or identity lookup, player removal, relocation, world cleanup, and
save/reload divergence. Verify the same logical clue against the same physical
target before and after an actual **successful** relocation and reload. A refused
relocation or unreadable target yields **inconclusive — never a pass**.

**Exit:** a corrected cause, or a demonstrated placement path that avoids the
identified mechanism, with regression evidence. **A number of clean runs is not
an exit.**

**What this gates:** production rolling placement. Read-hook work (Phase 0) is
independent and proceeds regardless.

### Phase 1 — trail-state contract, then one destination

The contract and a **budget fixture** come first, before any persistence work —
deferring them risks building Phase 1 on the case structure the plan already
knows it cannot use.

Then the smallest complete instance: **`LouisvilleStashMap15` + the gallery
brochure** (§0.2), subject to carrier verification, using the annotation target
rather than the building anchor. Read detection → lazily placed trail → authored
evidence at the destination → one skill-specific observation with the
non-specialist reading as default.

**Verified by:** a fresh save, played through, then a current-build reload.

### Phase 1b — two trails (gate on coexistence)

One destination proves the physical loop. It **cannot** prove coexistence or
contradictory records — and contradiction is the stated product
(`DR-20260920-NO-CONCLUSION`), so this is not optional polish.

A small two-trail fixture: both remain eligible, neither consumes a case slot,
their claims stay attributable to their own sources, and **the organiser does
not arbitrate a winner**. Two *complete production* destinations are not needed —
a fixture is.

### Phase 2 — pacing and the global budget

The global work and discovery budget from §7, measured against §0.1. Several
maps live together before any town is authored.

### Phase 3 — one town funded

Every map whose marks point into the pilot town gets authored evidence, wherever
the map was found. Everything else stays inert vanilla and silent. Coverage in
release notes. **Output:** the real cost of one town, so the rest can be priced.

### Phase 4 — bulk

**The blocker revision 1 invented is removed.** Bulk does not need an automated
measure of interestingness. It needs a **compact editorial inventory** recording,
per premise: document form, central question, the ambiguity, the contradiction
mechanism, and the destination observation. Similarity checks flag repetition;
**human comparison decides whether the differences matter.** Trialled on a small
batch before volume.

The consistency harness stays a necessary mechanical check and is not proof of
quality. What "detects asserted conclusions" actually covers should be written
down rather than trusted, and editorial review is retained.

## 10. Acceptance matrix

Every row demonstrated before the mechanism is considered delivered. Fresh-save
permission (`DR-20260919-Q29`) removes legacy migration, **not** current-build
persistence.

| # | case | passes when |
|---|---|---|
| 1 | fresh save, played, current-build reload | trail and destination state survive |
| 2 | repeated reads of one copy | no second trail |
| 3 | a duplicate physical copy | no second trail; paper unexplained |
| 4 | two simultaneous trails | both eligible, no case slot consumed, claims attributable, no arbitration |
| 5 | destination entered before the map was read | defined behaviour, not an accident |
| 6 | destination carriers looted or destroyed | defined behaviour; vanilla preserved |
| 7 | late arrival, long after reading | evidence still present or an honest state |
| 8 | the trail actually follows | fragments appear near the player after moving |
| 9 | vanilla stash ordering | our insertion respects the observed order |
| 10 | recorded evidence preserved | discoveries survive retirement and archiving |
| 11 | combined storage and work limits | measured against §0.1, not estimated |

## 11. Still open for the owner

1. **Sequencing.** `DR-20260919-Q31` orders the work personal opening → survival
   connection → loop improvements. Revision 1 asserted this **is** the survival
   connection. The reviewer is right that the label needs earning: the plan must
   name the **particular survival interaction** it satisfies, not claim the slot
   because travel is involved. Unresolved, and not claimed here.
2. **Essential-evidence recovery.** Material to §8, not adjacent to it. A trail
   is an invitation the player acts on by walking; retiring its payoff as
   "incomplete" frees a slot without honouring that. Decide recovery, or narrow
   the invitation before such trails activate.
3. **Which capacity lever** (§0.1): cheaper trail records, fewer ordinary cases
   while trails live, shorter trails, or a smaller campaign store. Lever 1 is to
   be *costed* first; choosing is the owner's.

## 12. What I would still like attacked

The review answered revision 1's six questions. These are new.

1. **Is lazy placement genuinely enough** to satisfy "the trail follows me", or
   will a player who reads a map and then sits still for a week notice that
   nothing arrives until they move?
2. **Is one trail per destination right** when duplicates are deliberately
   unexplained? A second copy producing a second, contradictory trail about the
   same place is arguably more in keeping with `NO-CONCLUSION` than suppressing
   it.
3. **Does the 50-event budget (§0.1) make "no maximum" unachievable in
   practice**, and if so is that a reason to revisit the ruling or to spend the
   engineering on a cheaper trail record?
4. **Is Gate A's exit criterion achievable at all?** "A corrected cause" may not
   be reachable for a fault seen three times in nine runs and never since. What
   is the honest alternative that is not simply "enough clean runs"?
