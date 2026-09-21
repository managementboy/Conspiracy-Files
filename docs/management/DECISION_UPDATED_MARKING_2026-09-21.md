# Which document gets marked "updated" — RETRACTED, it was never in dispute

**Status:** this document previously framed `test/investigation_flow.lua` as an
open design decision for the owner. **That was wrong.** The review of
2026-09-21 (`WRITING_REBUILD_REPORT_REVIEW_2026-09-21.md`, §2) is correct and
this note is rewritten to say so. The original claim is preserved below so the
mistake is legible rather than quietly deleted.

## What I claimed

That the test expected the OLDER document to be flagged, the implementation
flagged the one that MAKES the comparison, and someone had to choose between
them.

## What is actually true

The prototype already implements older-record marking. It was never the other
way round.

- `dev/next-phase/InvestigationFlow.lua`, in `F.discover`, takes the OTHER
  endpoint of a newly revealed relation and records it only if `prior[affected]`
  — that is, only if it was known *before* this discovery.
- `dev/next-phase/InterpretationUpdates.lua`, in `U.validate`, independently
  requires the affected endpoint to be the earlier one in discovery order.
- The forward and reverse assertions in the test agree with both.

There is no disagreement to settle. Every layer wants the same thing.

## The real fault, which is an integration gap

`InterpretationUpdates.derive` (line 9) reads `doc.links`. `Generated/Story.lua`
builds every document with `links={}` — correctly, because a comparison only
exists once both its sources are known, so it is a property of the projection
and not of the stored case. The authored connections are produced by
`Generator.project` through `Story.project`, with their source requirements.

Measured 2026-09-21 over generated cases:

    seed 1: doc.links=0  derive events=0  projected connections=4
    seed 2: doc.links=0  derive events=0  projected connections=3
    seed 3: doc.links=0  derive events=0  projected connections=4

So `derive` returns nothing for any current case, no update event is ever
recorded, and the test fails because nothing is marked — not because the wrong
thing is marked.

## Why I got it wrong, since it is a repeating mistake

This is the third time in one session that reading `links` on the stored case
has misled me. The first two are recorded in
`WRITING_REBUILD_LINUX_RESULTS_2026-09-20.md` (reporting inter-document links
as dead) and in `test/discovery_order.lua` (asserting the knowledge gate
against a full projection). I inferred the implementation's intent from a
failing assertion instead of reading `F.discover`, which says plainly what it
does. The instrument was there; I did not look at it.

## What the repair is

Not a one-line swap of source id for target id. Per the review, and because
discovery order can be reversed and a third source can enable a comparison
between two already-known documents:

- derive relations from the *supported story comparisons*, comparing which
  findings are supported before and after a discovery
- notify the previously-known records a newly supported finding affects
- keep event identity stable across that
- preserve expiry, reload validation and idempotence
- cover both discovery orders, the three-source gate, and rereading without
  extending the timer
- audit the prototype's remaining three-document assumptions while adapting it

This is unshipped integration work on `dev/next-phase/`. It is **not** evidence
of a defect in the shipped organiser, which has no "updated" concept at all,
and it needs no product decision from the owner.
