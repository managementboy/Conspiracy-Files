# Gradual testing plan — v0.1 acceptance, then v1

Written 2026-09-08, after the first two-machine playtest. The goal is to close
`CF-V01-E02`–`E13` and the T11/T12 gates in sessions that each fit an evening,
in an order where every session's result is worth having even if the next one
never happens.

`CF-V01-E01` (static map bindings) is accepted. Of the remaining twelve, **E11
(the multiplayer gate) was dropped on 2026-09-08** at the owner's direction -
see S8 for what that accepts. Eleven remain in scope, across seven sessions.

## A scoping question that comes first

**E02–E13 are written for the authored Dead Air thread** - D1–D6 placed at two
curated Muldraugh targets. What actually runs when a player starts a save today
is the **generated** G2 path: a case assembled per save, bound to a person the
generator picked, with documents in containers it chose.

The criteria therefore describe a build the owner is no longer playing. Three
ways forward, and this is a decision, not a detail:

1. **Accept against generated.** Re-read each criterion as being about the
   mechanism rather than about D1–D6 specifically. E04's "all six documents
   materialise at most once" becomes "every document in the case materialises
   at most once". Cheapest, and tests what players will actually meet.
2. **Accept against authored.** Run the Dead Air thread specifically, as
   written. Truest to the recorded criteria; tests a path that may not be what
   ships.
3. **Both**, authored for acceptance and generated for confidence. Most
   rigorous, roughly twice the sessions.

**Recommended: option 1**, with each criterion's wording updated to name the
mechanism rather than the fixture. The mechanisms are identical - the same
placement, identity, persistence and arrival adapters serve both paths - and
testing what ships is worth more than testing what the criteria were written
against. This plan assumes option 1; say otherwise and the order barely
changes, only the setup.

## How a session runs

Unchanged from `PLAYTEST_PROCEDURE.md`: pull the build, `-debug`, stream the
log, play, report. Every session below assumes diagnostics on:

    ConspiracyFiles.IdentityObserver.verbose=true
    ConspiracyFiles.LocalPersonIntegration.verboseDoors=true

**A session that finds nothing is still a pass.** Record it as such. The
failure mode to avoid is a criterion marked green because nobody looked.

## Session ladder

Each session states what must be true to call it passed. Anything else is a
finding, and a finding is a good outcome.

### S1 — Ride-along baseline (no setup, ~20 min)

Closes the three open audit questions while playing normally, and gathers the
first real evidence for two criteria.

| Target | What to do | Pass looks like |
|---|---|---|
| **O2** | Loot corpses until one wears something distinctive | A notebook entry reads "The body itself wore a security guard" or similar, in plain words |
| **O3** | Take a **vanilla** house key off any corpse, try nearby doors | `[CF-PERSON] observedKeyDoor` plus a named voice line. A case key will not work: `observedCorpseKey` excludes it |
| **O4** | Open a wallet holding a watched card, do not click | Contents recorded, or `[CF-IDENTITY] bailed: <reason>` names the check |
| **E12** | Nothing; the log records it | `[CF-T3-NEARBY] callbacksOver2Ms=0` and `peakMs<=2` under a real scan |
| **E08** | Use Inspect and Mark Interesting from both player and loot panes | Vanilla options still present; Inspect appears once; Mark disabled after use |

E12 and E08 need more than one session's evidence, but this starts both at zero
cost.

### S2 — Physical identity (E05) — PASSED 2026-09-09

Carry one discovered document through every state a player can put it in:
inventory, a container, the floor, a vehicle, back to inventory. Save and
reload between at least two of those. Then let it be destroyed or lost.

**Pass:** the notebook's account of the item stays truthful at each step, and
never claims an item exists after it is genuinely gone. T5 proved the mechanism;
this proves the mod's use of it.

**Watch:** duplicates are a sticky `conflict` by design. A conflict appearing is
correct behaviour, not a failure - report it, do not "fix" it in play.

### S3 — Readability (E06, ~20 min)

Read every document type the case produced, through the custom Inspect reader.
Confirm ordinary container behaviour is untouched: items still stack, move and
drop normally.

**Pass:** every body is readable in full, nothing is truncated mid-sentence, and
no inventory behaviour changed.

### S4 — Exactly once (E02, E03, E04, ~45 min, fresh save)

The heaviest session, and the one most worth doing carefully.

- Reload repeatedly at a placement site before collecting anything.
- Quit mid-placement (alt-F4 is legitimate here) and reload.
- Visit sites in different orders across saves.

**Pass:** every document exists exactly once, ever. Terminal pre-placement
target loss becomes `unavailable`; duplicates become `conflict`. Neither is a
bug; a silently duplicated document is.

### S5 — Persistence and death (E09, E10, ~45 min)

Two criteria, one session, because they share a setup: E09 is about canonical
state surviving a round trip through Global ModData, and E10 is about death and
reload not disturbing it.

**Setup.** A save with at least **three discoveries** already recorded and, if
possible, one document still in the world uncollected - a partially explored
case exercises more than a finished one. Diagnostics on. Note the notebook's
entry order before starting; it is the thing being protected.

**The measurement.** E09 requires the encoded size, not a guess. Before and
after each phase below, run:

    local V=require("ConspiracyFiles/Validator")
    local total=0
    for _,tag in ipairs({"ConspiracyFiles.Generated.G2","ConspiracyFiles.AddressBook.Muldraugh",
        "ConspiracyFiles.DeadAir","ConspiracyFiles.IdentityObservations",
        "ConspiracyFiles.BodyOutfitObservations"}) do
      local r=ModData.get(tag)
      if r then local n=V.estimateEncodedBytes(r); total=total+n
        print("[BUDGET] "..tag.." = "..n) end
    end
    print("[BUDGET] TOTAL = "..total.." of "..V.MAX_ENCODED_BYTES)

It prints to `console.txt`, so the numbers arrive in the stream and the delta
across phases is the "encoded delta" E09 asks for.

**Phase 1 - clean round trip (E09).** Save and quit properly. Reload. Compare
the notebook against the order noted at the start.
*Pass:* every entry present, same order, same text, same ordinals. Derived
views - evidence list, connections - rebuild identically. `[BUDGET] TOTAL`
unchanged or trivially different.

**Phase 2 - repeated reload (E09).** Reload three more times without playing.
*Pass:* nothing accumulates. `[BUDGET] TOTAL` must not creep upward with each
reload; a slow climb across reloads is a leak and is the most likely defect
this phase will find.

**Phase 3 - death after discoveries (E10).** Get killed deliberately, with all
discoveries recorded. Continue as a new character in the same save.
*Pass:* canonical discoveries are intact and in order. The new survivor's
notebook is titled with the **new** forename. Death recap is out of v0.1
(P4-R52), so its absence is correct, not a gap.

**Phase 4 - death mid-discovery (E10).** Start again, find a document, and die
**before** inspecting it - ideally while the pickup voice line is still
playing.
*Pass:* either the discovery is fully recorded or fully absent. A half-written
entry, a ledger number with no entry, or an entry with no ledger number is the
failure this phase exists to catch.

**Phase 5 - corpse transfer (E10).** T5 showed a real death moves stamped items
to the corpse. Recover a case document from your **own** previous corpse.
*Pass:* the item is still recognised as the same evidence, not a duplicate. If
it registers as a second copy, that is a `conflict` - correct behaviour, and
worth reporting rather than treating as a pass.

**Phase 6 - abrupt interruption (E09).** Alt-F4 during play, then reload.
*Pass:* the last known-good root survives. Losing the last few seconds is
acceptable; a corrupted or partially staged root is not.

**Overall pass:** no duplication, no reordering, no erasure, no partially
staged state visible at any point, and `[BUDGET] TOTAL` stays well under
500,000 bytes throughout.

**Never** delete or reset the save to "clean up" between phases. Make new ones.
Phase 3 onward deliberately makes a mess of one save - that is the point, and
it is why the save being messed up must be one you are willing to lose.

### S6 — Arrival (E07, ~30 min) — BLOCKED, needs a prerequisite

**This session cannot run today, and finding that out is itself a result.**

Arrival confirmation lives only in the authored Dead Air runtime:
`Runtime.lua` samples the player every 15 ticks and emits
`[CF-DEAD-AIR]|ARRIVAL|<id>`. The generated path has **no location
confirmation at all** - it has site scanning (`[CF-T3-NEARBY]`) and stale-clue
relocation (`[CF-G2-RELOCATE]`), but nothing that confirms a Location.

And the authored runtime never starts in a normal debug session.
`AutomaticInvestigations.lua:12` sets `ConspiracyFiles.GeneratedMode=true` at
**file load** whenever debug single-player is active, and `Runtime.lua:163`
then logs `DISABLED: generated development session active`. The only existing
escape hatches are `T11Mode`/`T12Mode`, which are read at load time, so setting
them from the debug console is too late.

**This is the exception to accepting against the generated path.** Every other
criterion tests a mechanism both paths share. E07 does not: the mechanism only
exists on one of them, and that one is switched off.

**Prerequisite, one of:**

1. **A load-time mode toggle** so the authored thread can be selected
   deliberately - a sandbox option, or a marker the mod reads before
   `AutomaticInvestigations` decides. Smallest change; makes E07 testable as
   written, and is useful beyond this session.
2. **Give the generated path arrival**, so a generated Location confirms on
   approach the way an authored one does. Larger, and genuinely a v1 feature
   rather than a test fixture - "arrival at a site you have not yet visited"
   is a real part of the experience the generated path currently lacks.
3. **Defer E07** until the generated path gets arrival on its own schedule, and
   accept v0.1 without it.

Option 2 is the honest one if arrival is meant to be part of the experience;
option 1 is the cheap one if E07 is only wanted as a tick. That is a product
decision, not a testing decision.

**Once unblocked**, the session itself is short. Approach each site on foot from
several directions, plus a wrong floor and an adjacent building.

*Pass:* exactly one confirmation is persisted before one domain event for the
matching location. Adjacent travel, wrong floor, repeated samples, leaving and
re-entering, and reloading while inside append nothing further.

**Walk, do not teleport.** T8 found scripted teleports emit no `OnPlayerMove`
at all, so a teleported arrival proves nothing whatever the log says.

### S7 — Fault containment (E13, ~30 min)

Uses `DebugHarness.fault(point)` to inject deterministic faults at each adapter
boundary.

**Pass:** no crash, no corrupted canonical state, and no per-frame log spam.
The mod degrades and says so once.

### S8 — Multiplayer gate (E11) — DROPPED 2026-09-08

Dropped at the owner's direction. Multiplayer is already out of v1 by roadmap,
the mod is solo-first, and `tools/workshop/description.txt` states
"Single-player only".

**What is being accepted by dropping it.** E11 is not a multiplayer feature; it
is the fail-closed gate that makes the mod switch itself off in multiplayer
before canonical initialisation or any world mutation. The gate is implemented
and covered by offline tests. What is now unverified is its behaviour in a real
host/client or dedicated-server session.

The residual risk is small but not zero: the mod is published, and somebody will
eventually load it on a server. If the gate misbehaves there, the failure lands
on a player rather than on us, and we will hear about it as a bug report rather
than as a log line.

**Cheap mitigations, if the risk ever feels worth reducing:**

- keep "Single-player only" prominent in the Workshop description (it is);
- one 10-minute host/client smoke test before any *public* release, as distinct
  from the unlisted dev item;
- treat a multiplayer bug report as a stop-and-fix rather than a wontfix, since
  a mod that damages a server save is a different class of problem from one
  that does nothing.

Recorded rather than deleted so the next person knows this was a decision, not
an oversight.

## After the ladder

- **T11 adapter composition.** Largely evidenced by S1–S6 running on one real
  bound case; write it up rather than re-running it.
- **T12 UI runtime feasibility.** Partly evidenced already by the notebook work
  of 2026-09-08. Finish it by recording which ISUI limitations were hit -
  `ISRichTextPanel` has no font tag, `defaultFont` is settable, tags are limited
  to RGB/SIZE/H1/CENTRE/INDENT/SPACE/LINE.

## Then v1

v1 is scope, not acceptance: a larger capability-based location database with
automatic site selection and no per-place approval, evidence context capture
within the save budget, reinterpretation markers, archiving and resurfacing,
one normal-play keybind.

Much of it already runs. The generated path selects sites and containers
automatically with provenance today, which is most of the first bullet. The
honest gap is **breadth and endurance**, not mechanism: more roles (Phase 3),
more locations, and evidence that a case still reads well after several
in-game weeks rather than one afternoon.

The graph stays out. P4-R05/P4-R25 put it in v2 behind a standalone prototype
with a 250-node cap, on the grounds that it is the largest UI risk in the
project. That prototype may be built at any time - "separately" is the
condition, not "later" - but it is not part of this ladder.
