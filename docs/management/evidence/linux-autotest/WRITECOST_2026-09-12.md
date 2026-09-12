# What the discovery stall is made of — 2026-09-12

Answers WP5 in `docs/design/READING_SURFACES.md` and the owner's fourth
weekend question: is a one-off stall per discovery acceptable, or must writes
be spread over several frames?

Measured with `tools/autotest/checks/writecost.sh` on the Linux test laptop
(slower than the owner's machine), three runs, 3 / 5 / 7 documents found and
inspected the way a player finds them. Raw numbers in the timestamped
`-writecost.txt` files beside this note.

## The answer

**No architecture change. The per-frame budget is met; what is left is a
one-off per discovery.**

| Part | Worst single call | Notes |
|---|---|---|
| `DiscoveryLog.record` | 7 ms | the write the player's click waits for |
| `PlayerVoice.onDiscovery` | 2 ms | the line, halo and UI sound |
| `SaveBudget.check` | 3 ms | the save-size estimate |
| `DiscoveryLedger.record` | 0 ms | — |
| `DiscoveryLedger.validate` | 1 ms | 52 calls, 0.1 ms average |
| `ClueMarkers.after` | 5 ms | the mark recorded at the pickup |
| `ClueMarkers.update` | 21 ms | see below |

The weekend note's assumption was that re-validating the whole case dominates.
It does not: the ledger costs nothing measurable. Two-thirds of the write is
the save-size estimate plus the spoken line.

`ClueMarkers.update` looks alarming at 21 ms, but it is not a per-frame cost.
Across 78 calls it exceeded 2 ms exactly 7 times — once per discovery, when it
writes. Arithmetic on the totals puts the other 71 ticks at roughly 0.04 ms
each. The worker is cheap; writing a mark is not.

So the shape is: **about 20 ms once, at the moment a clue is found, and
effectively nothing in between.** That is a single dropped frame at a moment
the player has just clicked, not a stutter.

## What was tried and reverted

Caching the marker store's validation by table identity (both in the worker and
in `SaveBudget`, which covered every root except that one) was implemented,
measured, and **reverted in the same session**: per-discovery cost moved 19.4 ms
to 17.4 ms, inside the noise of three runs, and the per-tick cost it targeted
was already near zero. It was a plausible fix for a cost that turned out not to
exist. Commits `15e313b` and its revert `c1f80d0` are both in the branch on
purpose, as the record of a measurement that said no.

## If the 20 ms is ever judged unacceptable

In order of size, smallest first:

1. The store is measured twice per write — once by the worker's own validity
   check and again by `SaveBudget.check`. One of the two could carry the other's
   result.
2. `update()` walks every discovery of every case on the tick it writes,
   resolving each one's session. A pending mark knows its own id.
3. Only then anything resembling a deferred write queue, which brings the risk
   of a notebook showing what the save cannot reconstruct.

Do not start at 3.
