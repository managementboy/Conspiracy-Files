# Identity observation requires a click — observed 2026-09-07

**Status:** Confirmed live by the owner. Not fixed. Investigate before the next
observation-heavy test.

## What happens

`IdentityObserver` is documented as observing "only rows already displayed by
the selected native inventory pane" — looking should be enough. In play it is
not: an ID card inside an opened wallet was **not** recorded while its row was
plainly visible on screen, and recorded immediately once the owner **clicked**
the row.

Evidence: the pane was open with the row visible for an extended period with no
`[CF-LEDGER]` and no `[CF-IDENTITY] pane skipped` line, meaning the gates in
`afterRender` passed and the row loop simply did not accept the item. The click
then produced `#6 identity` at once.

## Why it matters

- A player browsing a corpse reasonably expects looking to be enough, and most
  will never click every card.
- Observation therefore appears unreliable and intermittent, which is the worst
  possible failure mode for a mechanic whose whole job is to notice things.
- It also cost testing time: "let the rows draw for a few seconds" was wrong
  advice, given repeatedly, because the real requirement was unknown.

## Candidate causes, none confirmed

1. The visible-row range in `afterRender` — `first` from `getYScroll` and
   `itemHgt`, `last` from `(height-headerHgt-scroll)/itemHgt` — may not resolve
   to a usable range for a small container pane until an interaction changes
   scroll or height.
2. `pane.items` may not be populated until the pane is interacted with.
3. The pane may not report `isReallyVisible` until it takes focus.

## How to investigate

The gate reporting added in `371cf38` proved the early returns are innocent, so
instrument the row loop next: log the computed `first`, `last`, `#rows`,
`itemHgt`, `headerHgt`, `getYScroll` and `getHeight` once every two seconds,
using the same throttle. That should identify which of the three causes it is
in one pass.

Do **not** widen the scan to compensate without knowing the cause. Reading rows
the pane has not drawn would break the standing rule that this observer only
ever sees what the player was actually shown.
