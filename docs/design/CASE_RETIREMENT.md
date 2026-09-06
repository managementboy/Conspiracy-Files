# Case retirement — the path to genuinely unlimited mysteries

**Status:** Design note, not implemented. Raising `MAX_CASES` to 8 buys time;
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

- **Keep:** case id, title, the discovered evidence rows the notebook renders,
  and the discovery ledger events (ordering is derived from real events and
  must never be rewritten).
- **Drop:** assignments, physical targets, container coordinates, sprites,
  placement status and per-document body text already surfaced to the player.

Assignments and targets are the bulk of a root and are worthless once every
document is found: nothing needs to place, reconcile or relocate a clue the
player already has.

## Constraints

- Retirement must never alter the discovery ledger, the notebook's order or
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
