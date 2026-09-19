# Development timeline — from the 19 September reconciled direction

Planning document. Nothing here is built. Written in plain language for the
owner; the decisions it implements are in [DECISIONS.md](../../DECISIONS.md)
under *Reconciled development direction — 2026-09-19 (evening)*.

The agreed order of focuses is fixed (`DR-20260919-Q31`): the personal opening
mystery, then a survival connection, then improvements to the current loop.
Everything below either serves that order or protects it. The milestone gate is
unchanged (`DR-20260919-Q30`): passing technical checks.

Estimates are working days and they are estimates. Each stage names the goal it
reaches, how we know it is finished, and what it deliberately does not include.

---

## Stage 0 — Make the ground trustworthy
**2–3 days. Highest priority.**

Fix the fault where a clue the record calls placed is not actually in the
container it names. It appeared in three of nine long runs; four possible causes
remain and the diagnostic to catch it is already in place.

**Why first:** a mystery with a clue that isn't there cannot be solved. Every
stage after this one assumes a clue is where the record says it is.

**Goal reached:** a mystery is always solvable.

**Finished when:** a long run finds no mismatch, and a deliberate test catches
the fault if it is ever reintroduced.

**Not included:** anything new.

---

## Stage 1 — Say only what the evidence supports
**3–4 days.**

Keep three things apart everywhere a finding is recorded: what the survivor
observed, what a document claims, and what those sources actually support. An
unsigned memo's accusation stays an accusation that was found, and never becomes
an established fact by having been written down.

**Why now:** every clue and conclusion written afterwards inherits this shape.
Done after the opening mystery, the opening gets written twice.

**Goal reached:** the mod can state a concrete local conclusion without ever
overclaiming — which is what makes retiring the old never-conclude rule safe
rather than reckless.

**Finished when:** a conclusion that outruns its evidence fails a check, and
every existing case still reads correctly under the distinction.

**Not included:** new mysteries.

---

## Stage 2 — Make a finished case leave something behind
**2–3 days.**

A retired case keeps its sourced findings and the question it ended on,
permanently. The write-up is what is allowed to disappear. This is measured, not
assumed: keeping the findings costs a few hundred bytes a case, comfortably
inside the 26,617 bytes of measured spare, while restoring a full write-up costs
about 30,000 a case and cannot fit.

**Why now:** continuity is the main thing the audit found missing, and the next
stage's cases need something real to follow.

**Goal reached:** older cases stop collapsing into blank stubs, meeting the
retention goal already set (`DR-20260919-Q18`).

**Finished when:** a finding from an old case can be followed by a new one and
shows in the organiser as a standing open thread.

---

## Stage 3 — Write the event record
**2–3 days, mostly writing, then your review.**

One readable document of specific events — a pickup cancelled, a radio desk
logging a message, an official burying a decision — with its sources named and
its uncertainty stated. No explanation of why Knox happened, and none implied.
Several separate clues may illuminate one event; events are not handed out one
per clue.

**Why now:** the opening mystery's clues have to point at real events, or they
are decoration.

**Goal reached:** every mystery draws on one consistent history, while the large
question stays genuinely open instead of secretly answered.

**Finished when:** you have read it and corrected it.

---

## Stage 4 — The personal opening: the electrician
**About a week. This is the first thing you can play.**

The first case of a new save, tied to the survivor's former job. Its payoff is
written before its clues. It depends on no printed item and no lucky drop. It
still pays off for a player who plays it badly. And where a survivor's
background gives it nothing true to work with, the mod says so plainly instead
of substituting a generic story.

**Goal reached:** the first hour of a new save is a mystery about *this*
survivor — the first focus of the agreed order.

**Finished when:** checks pass and it plays through on a fresh save in the real
game.

---

## Stage 5 — The follow-up that proves continuity
**4–5 days.**

A second case that follows a finding from the opening and can challenge how you
read it. Built to keep, not to throw away.

**Goal reached:** the investigation continues instead of resetting. This is the
specific gap the audit identified.

**Finished when:** playing the two in order feels like one investigation rather
than two cases sharing a name.

---

## Stage 6 — The survival connection
**About a week.**

The second focus of the agreed order: a mystery that touches staying alive — a
journey that involves your base, or a skill or tool that opens something up.

**Goal reached:** the investigation earns its place inside a survival game
instead of running alongside it.

---

## Stage 7 — Believable discovery
**4–6 days.**

The loop improvements, third in the agreed order: the ten dust masks found in a
place already searched (`DR-20260919-SEARCH`); places going stale so one
cupboard is not searched forever; and settling the instalment timing, where the
long check assumes about four in-game hours and the rule says three in-game
days.

**Goal reached:** finding things stays plausible across a long save.

---

## Stage 8 — One town of annotated maps
**1–1½ weeks.**

Pick one town. Every annotated map pointing into it gets real evidence at its
marks, with each map's payoff written before its clues. Coverage is stated in
release notes and development feedback, never in the survivor's voice; vanilla
maps elsewhere behave exactly as they do now; universal coverage stays on the
books as unfinished work (`DR-20260919-MAP-PAYOFF`).

**Goal reached:** a map found in that town is a real lead, and we learn what one
town actually costs so the rest of the map can be priced instead of guessed.

---

## Deliberately not in this timeline

- The other 24 professions. One is a pilot; the premises still need approval
  under `DR-20260919-Q27`.
- Universal annotated-map coverage — the target, not the next task.
- A full campaign with a single ending destination. Rejected for this scope; a
  future possibility.
- A separate relationship graph (`DR-20260919-Q21`).
- Computer and CD-ROM discoveries (`DR-20260919-Q19`).

---

## How to prioritise this

**About six to seven weeks of working days** to the end of Stage 8. The first
genuinely new thing you can play is Stage 4, roughly three weeks in.

That wait is the one real weakness of this order, and there is a faster route if
you want it: **0 → 3 → 4** puts a playable opening mystery in your hands in
about two weeks. The cost is that Stages 1 and 2 then land afterwards, and the
opening's texts get rewritten once to fit them.

- **If only one stage happens: Stage 0.** A mystery with a missing clue is worse
  than no mystery.
- **If three: 0, 1, 2.** These are what let the opening be built once rather
  than twice, and together they answer what the audit found.
- **If you want to play something soon: 0, 3, 4**, and accept the rewrite.

Stages 1, 2 and 3 need nothing from you except the Stage 3 review. Stage 4
onwards is where your play feedback starts deciding things again.
