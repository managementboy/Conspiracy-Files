# Completion rules for the opening pair

Design document. Nothing here is built. The premise is in
[OPENING_PREMISE.md](OPENING_PREMISE.md); this fixes, for each conclusion, the
**exact evidence required**, the **acceptable alternative sources**, and the
**recovery** when an essential clue becomes unavailable.

Three rules govern everything below.

**No conclusion without its evidence.** Each conclusion names the findings it
rests on. If they are not all present, the conclusion is not stated — not
hedged, not softened, not stated (`DR-20260919-SUPPORT`).

**An alternative must carry its own link.** Where a link has two sources, each
must support *that link* alone. A source that supports something adjacent is
corroboration and is never a route (`DR-20260919-OPENING-CHAIN`).

**Honest reporting is not progression.** Saying "some of this never turned up"
does not deliver a payoff. A case missing an essential link is **incomplete**,
records itself as such, and keeps a recovery opportunity open
(`DR-20260919-GAP-NOT-PROGRESSION`).

---

## Case one — "No contact at premises"

### The conclusion, and exactly what it needs

> A collection was scheduled in my name. The record puts it at a different
> address from the one I am at. The record reports that visit as unsuccessful,
> and the entry cancelled.

| Link | Statement | Required evidence | Alternative sources |
|---|---|---|---|
| **A** | A collection was scheduled for me | The retained slip: my name, a date, a reference, an address | **None.** The slip is the case's only personal anchor; without it nothing connects any record to this survivor |
| **B** | Its destination is not where I am | Link A's slip **and** a verified address for where I am | The address book's number, **or** its verified building description where no number exists (`DR-20260919-SITING` 1) |
| **C** | A record reports that visit unsuccessful and cancelled | A record carrying link A's reference, annotated | **Either** the desk copy in a suitable office **or** a returned undelivered notice near the destination |

**Link A has no alternative and that is deliberate.** It is the one finding the
case cannot route around, so it is placed where the survivor begins, among their
own things, and never on a carrier that can walk away.

**Link B is a comparison, not a find.** It needs no second clue — only that both
addresses resolve. Where neither can be named, the case is not sited there at
all; this is checked before placement, never discovered afterwards.

**Link C is the one with two real sources**, and each states the same thing on
its own: a record, carrying this reference, reporting the visit unsuccessful.

### Not part of the conclusion

The counterfoil at the other address (corroborates only that a round ran on that
street); the disconnected supply; the unforced door. None is required, none is
an alternative, and none may appear in the conclusion's evidence list.

### Recovery

| What is unavailable | What happens |
|---|---|
| **Link A** | The case does not open. Nothing is placed and no promise is made. This is a refusal with a stated reason, not a failure |
| **Link B** | Cannot occur after siting: both addresses resolved before placement, and an address does not stop resolving |
| **Link C, one source** | The other source is used. No recovery needed — this is why there are two |
| **Link C, both sources** | The case is **incomplete**. It records itself as such, states that the record it needed was never found, and **keeps its recovery open**: link C may be re-placed for a later opportunity (`DR-20260919-Q23`, clues never found placed in new locations). It does not close, and it does not ask its closing questions |

The distinction that matters: a case missing link C has **not** delivered its
payoff, so it must not retire, must not present a conclusion, and must not read
as finished with a rueful line. It stays open with a reachable route.

---

## Case two — "Still filing"

### The conclusion, and exactly what it needs

> Paperwork on the collection list carried on after the collection rounds had
> stopped running. Entries were still being closed on dates when no round was
> out.

| Link | Statement | Required evidence | Alternative sources |
|---|---|---|---|
| **D** | Cancellation reports were routed to a named point | A routing stamp or forwarding slip on case one's own record | **None.** This link *is* the continuity: it must physically be case one's record, carrying its reference |
| **E** | Entries were closed there on stated dates | A batch of closures at that point, dated | **None** identified. See the open risk below |
| **F** | The last round ran before some of those dates | A field record naming the last round's date — a round sheet, a gate log, a fuel book | Any one of those three, each carrying a date for the last round |

**Link D has no alternative on purpose.** An alternative would let case two
stand alone, and a case that can stand alone proves nothing about continuity.
Requiring case one's physical record is what makes this a pair rather than two
cases sharing a subject.

**Link F's three sources are genuinely interchangeable** — each names a date for
the last round, which is the whole of what link F needs.

### What the conclusion may not say

Not that any entry lacked a visit. Not which entries. **Never** the survivor's
own, which stays uncertain however much is found
(`DR-20260919-STILL-FILING-NARROW`). Late processing of genuine earlier visits
fits this evidence exactly as well, and the case says so rather than choosing.

### The extension, and its own rules

A separate, stronger conclusion, available only with its own evidence
(`DR-20260919-NO-ATTEMPT-EVIDENCE`):

> Some entries were closed without further attempts being made.

| Requires | Both of |
|---|---|
| **G** | An instruction to close outstanding entries without further attempts |
| **H** | Records showing it applied — entries closed carrying that instruction's reference |

Neither alone establishes it: an instruction that was never applied is a
proposal, and closures without the instruction are the narrow finding again.
**Still not which entries, and never the survivor's own.**

The extension is **not** part of the essential chain. Its absence is not a gap
and triggers no recovery; the case completes on D, E and F.

### Recovery

| What is unavailable | What happens |
|---|---|
| **Link D** | Case two does not open. It is the continuity, so without it there is no follow-up to offer — and case one stays answerable on its own |
| **Link E** | The case is **incomplete** and keeps recovery open, as case one does for link C |
| **Link F** | Same. The three sources make this the least likely failure, and the most likely to be recoverable at a different site |
| **G or H** | Nothing. The extension simply does not appear. No gap, no recovery, no mention |

---

## What must be true before either case is built

- **`Session.completion` distinguishes four states** — unfinished, complete,
  complete-with-gaps, unknown — and a retiring case carries its completion
  forward, so a finished case can still answer whether it delivered its chain.
  Drafted as `dev/pending-tests/case_completion_state.lua`.
- **Essentiality exists at all.** Today every clue in a case is equal, so
  "missing an essential link" cannot be detected. The chains above are the first
  thing to need it.
- **The carrier timer is fixed**, or an essential clue on a carrier can be
  dropped while its carrier stands in front of the survivor. Link A is never on
  a carrier for this reason, but links C, E and F could be.

## Open risks

- **Link E has no alternative source identified.** A single point of failure in
  case two's chain. Either a second source is found, or E's recovery must be
  especially reliable.
- **Link F's field record may not exist within a short trip** — the same
  neighbourhood constraint (`DR-20260919-SITING` 3) may not contain a round
  sheet, gate log or fuel book. This is the risk most likely to force a redesign
  and is worth checking in the real world early.
- **Recovery by re-placement is unproven for an essential clue.** Relocating a
  never-found clue exists as a direction (`DR-20260919-Q23`) but has not been
  built or measured.
