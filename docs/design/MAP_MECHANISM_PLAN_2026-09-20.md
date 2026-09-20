# Plan: vanilla printed media as the travel mechanism

**Status: planning only. No development. Written for a second opinion.**

Reviewer: this is a plan to attack, not to approve. The questions I most want
challenged are at the end. Everything cited as measured has a command or an
archived log behind it; everything unverified is marked as such.

---

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

**Two storage consequences, unresolved:**
- A map trail must **not** consume one of the four active case slots, or reading
  a second map would block every later case.
- Trail length is a **storage** decision as much as a pacing one. Illustrative
  arithmetic only: 125 destinations at ~3 trail clues plus 16 ordinary cases at
  7 documents is ~487 of the ledger's 512. It fits, barely, and the **ledger is
  what bites first** — not any case cap.

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

## 7. The plan

Five phases. Each ends with something verified, and each is separately
abandonable if it fails.

### Phase 0 — engine verification (no content, no writing)

Answer, in a running Build 42.20 game on Linux:

1. **Read detection.** Is there an existing event or UI path that tells us a
   specific printed item was read? If not, what is the narrowest cooperative
   wrapper that preserves return values and callback order for other mods?
2. **Stash lifecycle.** What is the real order of map creation, reading,
   reveal-on-map, first building load, first container opening? Where is it safe
   to insert our evidence? Existing tickets S1/S2 cover this.
3. **Destination carriers.** Do the marked destinations actually contain
   containers we can reach, per destination, verified rather than assumed?
4. **Read/seen/recorded distinction.** Can we tell these apart at all?

**Output:** a verified hook or a documented fallback, per `P4-R78` (a settled
fact cites a re-runnable command or an archived log).
**If it fails:** ruling 1 returns to the owner. Do not proceed on a guess.

### Phase 1 — one destination, end to end

The smallest complete instance, to prove the shape before it scales.

Pick **one** destination that has all of: an annotated map pointing at it, a
flyer or brochure identifying it, verified reachable containers, and a short
enough trip to test repeatedly. The research's **Circuital Healing** candidate
(electronics repair, 8B Hutchin's Drive, Ekron, rectangle 424,9776–471,9807) is
the obvious first choice because it also exercises the skill layer — with the
research's own caveat that Ekron-to-Muldraugh is a substantial journey.

Build: read detection → a small trail placed near the player → authored evidence
at the destination → **one** skill-specific observation of it, with the
non-specialist reading as the default.

**Verified by:** a real save, played — find the map, read it, find trail clues,
travel, find the destination evidence, save and reload. Not a mocked runtime.

### Phase 2 — the trail follows the player

The one genuinely new mechanism. Placement currently anchors to where the
survivor was when a case was created; a rolling trail must re-target as they
move.

Also settles the two storage consequences in §5: the trail must not occupy an
active case slot, and its length must be chosen against the ledger.

**Verified by:** a controlled-clock run — read a map, relocate several hundred
tiles, confirm the trail follows and that no case slot was consumed.

### Phase 3 — one town funded

Every annotated map **whose marks point into the pilot town** gets authored
evidence at its destination, wherever the map itself was found
(`DR-20260919-MAP-DESTINATION`). Every other destination stays inert vanilla and
the mod says nothing about it. Coverage stated in release notes.

**Output:** the real cost of funding one town, so the remaining towns can be
priced instead of guessed.

### Phase 4 — bulk

Fragment and premise authoring at volume, which is where `NO-CONCLUSION`'s
variety requirement is actually met.

**Blocked on a tool that does not exist:** the consistency harness makes bulk
*safe* — it catches impossible dates, branch leakage, asserted conclusions — but
it **cannot measure whether a premise is interesting or whether it rhymes with
three others.** Nothing in the project measures distinctness. At premise 150
that is expensive to discover; at premise 25 it is cheap to build.

## 8. Risks, in the order I would worry about them

1. **Read detection may not exist cleanly** (§6). Blocks everything; Phase 0 is
   entirely about this.
2. **Clue placement has an unexplained fault.** A clue the record calls `placed`
   that is not in its container, seen in three of nine overnight runs, **never
   reproduced**. Two controlled-clock runs this week could not trigger it because
   relocation turned out to be near-unreachable. A trail laid over a week of play
   is the worst case for a clue that goes missing.
3. **No distinctness measure** (§7 Phase 4).
4. **The discovery ledger is the real ceiling**, and "no maximum of maps" pushes
   against it.
5. **A rolling trail is new mechanism**, not a parameter.
6. **Unfunded destinations must stay silent.** A trail ending in nothing is
   worse than no trail — the player walked on a promise. This makes
   `COVERAGE-HONESTY` load-bearing rather than a footnote.

## 9. Still open for the owner

1. **Sequencing.** `DR-20260919-Q31` orders the work personal opening → survival
   connection → loop improvements, and this mechanism was not in that list. My
   view: it **is** the survival connection. Not reordered without a ruling.
2. **Essential-evidence recovery.** When a clue a conclusion rests on cannot be
   placed, the case currently retires marked incomplete (slot freed, no payoff
   claimed). The alternative is bounded re-deferral first. Recorded at the top of
   `DECISIONS.md`.

## 10. What I want the reviewer to attack

1. **Is Phase 0 the right gate, or is it over-cautious?** Could Phases 1–3 be
   designed against a *documented assumption* about read detection and adapted
   later, rather than blocking on it?
2. **Is "the trail follows the player" worth the mechanism cost?** A single
   placement near where the map was read is far cheaper. What does following
   actually buy that justifies re-anchoring machinery?
3. **Is one destination the right first increment**, or does proving the shape
   need two so that contradiction between destinations is exercised from the
   start — given contradiction is the stated product?
4. **Does the flyer role hold up?** "Our clue names a place, a vanilla advert
   identifies it" sounds elegant. Is it actually legible to a player, or will
   they never connect the two pieces of paper?
5. **Is the ledger arithmetic in §5 sound**, and is ~3 trail clues per
   destination a sane assumption to plan against?
6. **What is missing from the risk list**, particularly anything about the
   vanilla stash system that this plan treats as stable.
