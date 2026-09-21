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

## Audit: the remaining three-document assumption (2026-09-21)

The review asked for the prototype's leftover three-document assumptions to be
audited while adapting it. One is load-bearing and still there:

- `InvestigationFlow.lua:27` validates the known list with `dense(list,3)`
- `InvestigationFlow.lua:99` refuses a fourth with `if #known>=3 then return
  nil,"known-document limit reached"`

Measured against the current generator, 300 seeds on the synthetic fixture:

    3 documents: 191 cases
    4 documents: 109 cases
    MAX_EVIDENCE = 7

So more than a third of cases already carry a document the prototype would
refuse to let the player know about, and the generator's own ceiling is more
than double the prototype's.

**Not changed here, deliberately.** Raising a limit requires proving its
boundary test still reaches the new limit, and the prototype has no such test
at four, let alone seven. Writing one to justify a change I had just made would
be the wrong order. The repair is:

1. take the bound from `Generator.MAX_EVIDENCE` rather than a literal 3
2. give the known-list validation a boundary case at exactly that many, and one
   past it that must be refused
3. re-check the aggregate budget assertions, which were sized against three
4. re-check `EvidenceArchive.relevant`, which is called with the same list

Until then the prototype cannot be exercised against a four-document case,
which is most of what the generator now produces. The three-source coverage
added today happens to work because it needs exactly three.
