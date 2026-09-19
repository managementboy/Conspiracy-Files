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

Three failures, not one. The earlier version only handled the first, which left
the commonest real case — a clue that was placed and then destroyed — undefined.

| Failure | What it means | |
|---|---|---|
| **1 · Placement failure** | The clue never found a container. It was never in the world | Detected before the player could have met it |
| **2 · Loss while undiscovered** | It was placed, then destroyed or its carrier went away, and the survivor never saw it | The player lost something they never knew existed |
| **3 · Loss after recording** | The survivor found it, it is in the record, and the object is now gone | **The finding survives. This is not a loss of evidence** (`P4-R80`, `P4-R104`) |

**Failure 3 never breaks a link.** A recorded, sourced reading is the evidence
from that moment on; the paper is a souvenir. Any rule that re-broke a link when
an object disappeared would mean a house fire retroactively unsolves a case.

| Link | Failure 1 | Failure 2 | Failure 3 |
|---|---|---|---|
| **A** (the slip) | The case does not open. Nothing placed, no promise made — a refusal with a stated reason | The case is **incomplete** and keeps recovery open. The slip is re-placed, because without it nothing ties any record to this survivor. Never on a carrier, so this is rare by construction | Nothing. The reading stands and the case proceeds |
| **B** (the comparison) | Cannot occur: both addresses resolved before siting | Cannot occur: an address is not an object | Cannot occur |
| **C** (the record) | The other source is used | The other source is used. If both are lost, **incomplete** and recovery open | Nothing |

### Recovery, precisely

A case missing an essential link through failure 1 or 2 is **incomplete**. It
records itself as such, states that a record it needed was never found, does
**not** retire, does **not** present a conclusion, and does **not** ask its
closing questions. Its missing link is re-placed for a later opportunity
(`DR-20260919-Q23`).

Re-placement for an essential clue is **unproven** — see the open risks.

---

## Case two — "Still filing"

### The conclusion, and exactly what it needs

> Paperwork on the collection list carried on after the rounds these records
> cover had been discontinued. Entries were still being closed on dates later
> than the termination those same records state.

| Link | Statement | Required evidence | Alternative sources |
|---|---|---|---|
| **D** | Cancellation reports were routed to a named point | Case one's **recorded, sourced reading** of the routing stamp on its own record, carrying its reference | **None** — but the *object* is not required, only the reading of it (see below) |
| **E** | Entries were closed there on stated dates | A batch of closures at that point, dated | **None** identified. See the open risk below |
| **F** | Closures are dated after the last round **documented in these records** | A record whose own scope states when rounds ended: a dispatch termination notice, a round sheet closed out, a schedule marked discontinued | Only records that state a **termination**, each on its own |

**Link D has no alternative on purpose** — but it does **not** require the
physical original. What it requires is case one's *sourced reading* of the
routing stamp: the record the survivor made, with its source. Once that reading
exists, the paper may be lost without breaking continuity. Requiring the object
itself would mean losing a slip retroactively destroys the pair, which
contradicts the rule that losing a thing must never cost you the case
(`P4-R80`). **Recorded evidence stays usable.**

**Link F was overclaimed and is now narrowed.** The earlier version treated a
round sheet, a gate log and a fuel book as interchangeable sources for "the last
round ran before those dates". They are not: a gate log's last entry does not
exclude a later round through another gate, and a fuel book's last transaction
does not exclude another vehicle. Neither establishes when *collections* ended —
only when that book stopped recording.

There were two ways out and they are not alternatives — **this design takes
both, because each fixes a different half of the overclaim**:

1. **The source must be explicitly scoped.** Link F accepts only a record that
   states a **termination of the rounds it covers** — a dispatch notice ending
   them, a schedule marked discontinued. A log that merely stops is not
   evidence that anything ended. This is what makes the source trustworthy.
2. **The conclusion is narrowed to match.** Even a termination notice speaks
   only for the rounds it covers, so the conclusion says closures are dated
   after the last round *documented in these records* — never "the last round".
   This is what keeps the claim inside the source.

An earlier version of this section said the narrowed conclusion "survives a
world that happens not to contain a termination notice" while simultaneously
requiring one. That was incoherent: narrowing the wording does not lower the
evidence bar. **If no termination record exists, link F is unavailable and the
case is incomplete** — which is why F's scarcity is recorded as an open risk
rather than waved away.

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

**Corrected: the entries H identifies ARE named.** The earlier rule said "still
not which entries" while H specifically identifies entries carrying the
instruction's reference — a contradiction, and the wrong kind: it forbade a
conclusion the evidence supported. Where H names entries, the survivor may
conclude about **those** entries. That is what the evidence says.

**The survivor's own entry stays uncertain because the evidence genuinely does
not name it** — not because a rule forbids the conclusion. That has to be true
by construction: H's closure batch must not contain the survivor's reference.
If it ever did, the honest outcome is that the survivor *learns* their entry was
closed without an attempt, and the design must then decide whether that is the
story it wants — but it may not be prevented by a rule while the paper says
otherwise.

The extension is **not** part of the essential chain. Its absence is not a gap
and triggers no recovery; the case completes on D, E and F.

### Recovery

| Link | Failure 1 · never placed | Failure 2 · lost unseen | Failure 3 · lost after recording |
|---|---|---|---|
| **D** (case one's routing stamp) | Case two does not open. It *is* the continuity, so there is no follow-up to offer; case one stays answerable on its own | Case two does not open. Its opening waits until case one's reading exists | **Nothing.** The sourced reading carries the continuity. Losing the slip after recording it must not destroy the pair (`P4-R80`) |
| **E** (the closure batch) | **Incomplete**, recovery open | **Incomplete**, recovery open | Nothing |
| **F** (the termination record) | **Incomplete**, recovery open | **Incomplete**, recovery open | Nothing |
| **G**/**H** (the extension) | Nothing. It simply does not appear — no gap, no recovery, no mention | Nothing | Nothing |

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
- **Link F now needs a termination record, which is scarcer than a log.**
  Narrowing F to records that state their own termination made it honest and
  made it rarer: a round sheet or fuel book no longer qualifies. Whether such a
  record can plausibly sit within a short trip
  (`DR-20260919-SITING` 3) is the risk most likely to force a redesign, and is
  worth checking in the real world early.
- **Recovery by re-placement is unproven for an essential clue.** Relocating a
  never-found clue exists as a direction (`DR-20260919-Q23`) but has not been
  built or measured.
- **Failure 3 depends on a sourced reading actually being retained**, which is
  the retention work (`DR-20260919-RETENTION-BOUND`) — itself bounded and
  unproven across many cases. If a reading does not survive, links A and D lose
  their protection against object loss.
- **The extension must be constructed so H cannot name the survivor's entry.**
  That is a generation constraint, not a rule about conclusions, and nothing
  enforces it yet.
