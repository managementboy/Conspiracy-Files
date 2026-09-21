# Which document gets marked "updated"? — open decision

**Status:** open, for the owner. Not shipped code. One test fails on it
deliberately (`test/investigation_flow.lua`, the only failure in a suite of
171 as of `c774e03`).

## The disagreement

`dev/next-phase/InvestigationFlow.lua` is a prototype outside the shipped mod.
When a newly found document recontextualises one already in the organiser:

- **the test expects** the OLDER document to be marked updated
- **the implementation** attaches the mark to the document that MAKES the
  comparison — the new one

Both are defensible as code. Only one is defensible as an experience, which is
why this is a design decision rather than a defect.

## Why there is no precedent to follow

The shipped organiser has no "updated" concept at all. This is not a case of a
prototype drifting from shipped behaviour; it is a feature that exists only
here, and whichever way it is settled will become the behaviour.

## The case for marking the older document

The player has already read the old one. Its meaning has just changed under
them, and nothing on screen would otherwise say so — they would have to
re-read everything after every find to notice. A mark on the old document is
the organiser saying *this means something different now*.

A mark on the new document tells them nothing they do not already know.
Everything about a document they just picked up is new; flagging part of it as
"updated" is noise.

There is a second reason, specific to this mod. Since 2026-09-21 the writing
carries real disagreement — "does not match" is 31% of connections, where it
used to be zero. The moment a contradiction becomes visible is the moment the
earlier document stops meaning what the player thought. That is precisely the
experience the mark should serve, and it lives on the older record.

## The case against, such as it is

Marking the older document means writing to a record the player is not looking
at, which is slightly more state to keep and to expire correctly. The
implementation's version is simpler. The prototype may also have intended the
mark as "this document has something new to say", in which case the naming is
the problem rather than the behaviour.

## What I did not do

I did not change it. It is unshipped prototype work, the reasoning above is an
opinion about someone else's design, and the handoff asks for creative
direction to come to the owner with concrete examples rather than be decided
in passing. The test stays failing so the question stays visible.

## To settle it

Either change `dev/next-phase/InvestigationFlow.lua` so the comparison marks
the document it refers TO, and the test goes green; or change the test's
expectation and say in it why the new document is the right one to flag.
