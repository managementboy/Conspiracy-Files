# Case retirement — the path to genuinely unlimited mysteries

**Status (updated 2026-09-17):** built, including the archive of P4-R111. A
finished case now leaves the live budget in two steps, and a save holds three
tiers of case:

| tier | how many | what it holds |
|---|---:|---|
| live (`Session`, schema 1) | `MAX_ACTIVE` = 4 | everything: assignments, targets, the case envelope |
| archived (`RetiredCase`, schema 2) | `MAX_FULL_ARCHIVED` = 4 | every row FILES renders - title, text, leads, connections, the site, where it was last seen (P4-R104) - plus the questions and answers (P4-R113) |
| archived, bulk dropped (schema 3) | the rest, to `MAX_CASES` = 16 | the case id, its documents' ids in the order they were found, the questions and the answers |

`RetiredCase.shrink` makes the third tier and `SuccessiveCases` applies it
inside the same validate-then-swap as the retirement or the staged case that
caused it: the OLDEST archived case is always the one that loses its bulk, it is
replaced in place, so no index, no schedule entry and no discovery order ever
moves.

**What a stubbed case still does:** its clues in the world are still marked
Evidence / Old and still say "already in the organiser" (P4-R118 - the runtime
marks from the ids, not the rows); the discovery ledger's references all still
belong to a case, so its numbering is untouched; its answers can still be
changed and can still steer a later case (P4-R113, P4-R122).

**What is lost:** its rows leave the organiser's FILES list - the document's
title and text, its leads and connections, the site it came from, and where it
was last seen. FILES numbering is derived from the rows it has, so later records
move up as those rows go. Nothing ever says a document is lost. Its sites also
stop being excluded from later placement, so a new case may use a building an
archived case once used.

**Measured (test/case_archive.lua, 1,000 seeds, worst case per root):** live
42,024 bytes, archived 33,135, stubbed 3,130; the discovery ledger costs about
545 bytes for every document ever found, whatever tier its case is in. Whole
save, worst case: ten cases as the old cap allowed = campaign 371,264 + ledger
38,169 + 73,000 reserved for every other root = 482,433 of 500,000; sixteen
cases with this archive = 338,540 + 60,975 + 73,000 = 472,515, **26,617 spare**.
Sixteen cases therefore leave more headroom than ten did. The one number to
move is `MAX_FULL_ARCHIVED`: each full-size archived case costs about eight
stubbed ones. **The real ceiling on a longer campaign is the discovery ledger**
(545 bytes an event, and its own `MAX=512` events), not the case store.

An unbounded archive does not fit: four live cases alone cost 168 kB of the
500 kB, and each archived case that keeps its documents costs 33 kB, so about
fifteen cases' worth of read documents is all the budget can ever hold.

The note below is the original design, kept as written.

**Original status:** Design note, not implemented. Raising `MAX_CASES` to 8 buys time;
retirement is what removes the ceiling.

## Measurement

Measured 2026-09-06 against `Generator.generate` + `Session.create` over 60
seeds on the synthetic catalog:

| | bytes |
|---|---:|
| smallest validated session root | 22,528 |
| median | 22,768 |
| largest (7 documents) | 44,808 |
| mean | 29,029 |

The canonical budget is 500,000 bytes **shared** across every root: the
generated campaign, identity observations, key connections, local people, clue
markers, the address book, the discovery ledger and visited buildings.

`MAX_CASES` was 3, which used under a tenth of the budget and then silently
ended automatic case progression for the rest of the save. It is now 8:
8 x 44,808 = 358,464, reserving 120,000 for the other roots.
`test/case_budget_headroom.lua` re-derives this and fails if cases grow.

## Why 8 is still a ceiling

The owner's requirement is that mysteries keep appearing automatically. Any
fixed cap eventually stops them. At the mean case size the hard budget ceiling
is roughly 13 cases even if nothing else existed, so no cap value makes the
campaign genuinely open-ended.

## Proposed mechanism

Retire a **completed** case — every document discovered and read — by replacing
its full session root with a much smaller record:

- **Keep:** case id, title, the discovered evidence rows the organiser renders,
  and the discovery ledger events (ordering is derived from real events and
  must never be rewritten).
- **Drop:** assignments, physical targets, container coordinates, sprites,
  placement status and per-document body text already surfaced to the player.

Assignments and targets are the bulk of a root and are worthless once every
document is found: nothing needs to place, reconcile or relocate a clue the
player already has.

## Constraints

- Retirement must never alter the discovery ledger, the case record's order or
  its numbering.
- Immutable evidence facts: retirement drops *placement bookkeeping*, never a
  fact the player learned.
- Never retire a case with an undiscovered document. Interaction with stale
  clue relocation matters: a clue still eligible to move is by definition not
  discovered, so its case is not retirable.
- Same validate-then-swap discipline as every other canonical mutation.
- Schema change; fresh save under P4-R63.

## Sequencing

Not now. It lands after the current stack is verified in play, because it
changes the shape of saved state and would be hard to attribute if something
else broke at the same time.
