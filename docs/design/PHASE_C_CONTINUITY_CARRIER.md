# Phase C's continuity carrier — what "Still filing" must inherit

Design note, 2026-09-19 (overnight). Written because inspecting the existing
machinery showed it cannot carry what Phase C needs, and starting the build on
it would have produced exactly the continuity the audit already rejected.

## The existing steer cannot do this

`Generator.steerFrom` accepts five fields and no others:

| field | what it carries |
|---|---|
| `fromCase` | the case id it came from |
| `reading` | which of the two readings the survivor picked |
| `way` | corroborating or conflicting |
| `person` | a returning name |
| `organisation` | a returning organisation name |

So the whole of today's continuity is **a name and a chosen reading**. And its
source is `SuccessiveCases.pendingSteer`, which reads the **three closing
questions' answers**.

Both halves are ruled out for Phase C:

- `DR-20260919-CONTINUITY` — continuity must carry the **discovered source and
  the open question**; repeating a person's name, or picking a counterargument,
  is **not enough**.
- The same decision, and the overnight goal, state plainly that the three
  closing questions must **not** be restored as the steering mechanism.

The steer is not broken and is not being removed — it does what it was built to
do. It simply is not a continuity carrier, and Phase C needs one.

## What link D actually requires

From [OPENING_PAIR_COMPLETION.md](OPENING_PAIR_COMPLETION.md): case two's link D
is case one's **recorded, sourced reading of the routing stamp**, carrying its
reference. It has **no alternative** — an alternative would let case two stand
alone, and a case that can stand alone proves nothing about continuity.

Note what it is *not*: it is not the physical slip. `DR-20260919-NO-RESIDENCE`
and `P4-R80` between them mean losing an object must never cost the case, so the
**reading** is the carrier and the paper is a souvenir.

## The carrier this needs

A new option beside `steer`, not an extension of it, because the two answer
different questions — the steer asks "what did the survivor conclude?", this
asks "what did the survivor find, and where?":

```
follows = {
    fromCase   = <case id>,            -- provenance
    document   = <document id>,        -- the specific finding, not a name
    reference  = <the case's own code>,-- what makes it the SAME paperwork
    point      = <the routing point named on it>,
    question   = <the open question it left>,
}
```

Four properties it must have, each from a decision already taken:

1. **Sourced.** `document` names the actual finding the survivor recorded, so
   the follow-up cites evidence rather than a recurring word
   (`DR-20260919-CONTINUITY`).
2. **Evidence-driven, not opinion-driven.** It is populated from what was
   discovered and recorded — never from the closing answers.
3. **Survives the opening's retirement.** A retired case keeps its rows and now
   its completion state; `follows` must be readable from a retired or even
   deep-archived record, or case two becomes unofferable the moment case one is
   archived.
4. **Refuses rather than substitutes.** No link D, no case two — and case one
   stays answerable on its own.

## Why this was not built tonight

It needs the register to carry a routing point in its text, a recorded-reading
accessor that works against a retired record, a new generator option with its
own validation and its own place in the case's rebuild (the lesson from
`case.opening`: anything that shapes generation must be recorded on the case or
the case is refused on reload), and a case-two premise. That is more than can be
built and verified in what is left of the night, and a half-built continuity
carrier is worse than none: it would look like continuity in the record while
carrying a name.

**The next concrete action** is the recorded-reading accessor, because
everything else depends on what it can actually return from a retired case.

## Open question for the owner

`follows.question` — the open question case one leaves — has no source today.
Case one's two open questions ("was the number wrong or made wrong", "did the
visit happen at all") are written in the premise's `meaning` text, not held as
data. Either the premise declares them as fields, or case two infers them from
the premise id. The first is explicit and costs a little save space; the second
is free and couples case two to case one's identity rather than to its content.
Recorded rather than chosen.
