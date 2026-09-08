# Gradual testing plan — v0.1 acceptance, then v1

Written 2026-09-08, after the first two-machine playtest. The goal is to close
`CF-V01-E02`–`E13` and the T11/T12 gates in sessions that each fit an evening,
in an order where every session's result is worth having even if the next one
never happens.

`CF-V01-E01` (static map bindings) is accepted. The other twelve are not.

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

### S2 — Physical identity (E05, ~30 min)

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

### S5 — Persistence and death (E09, E10, ~30 min)

Accumulate several discoveries, then die. Reload. Then die again with a
discovery in progress.

**Pass:** discoveries survive in the same order, nothing is duplicated or
erased, no partially staged state is visible. Death recap is out of v0.1
(P4-R52) - its absence is correct.

**Never** delete or reset the save to "clean up" between attempts. Make new ones.

### S6 — Arrival (E07, ~20 min)

Approach each site on foot, from different directions, including a wrong floor
and an adjacent building.

**Pass:** the matching Location confirms once and only once; adjacent and
wrong-floor approaches confirm nothing. T8 showed scripted teleports emit no
`OnPlayerMove`, so **walk** - do not teleport, or the result is meaningless.

### S7 — Fault containment (E13, ~30 min)

Uses `DebugHarness.fault(point)` to inject deterministic faults at each adapter
boundary.

**Pass:** no crash, no corrupted canonical state, and no per-frame log spam.
The mod degrades and says so once.

### S8 — Multiplayer gate (E11, ~20 min, separate setup)

Start a host/client game and a dedicated server with the mod enabled.

**Pass:** the mod detects multiplayer and disables **before** canonical
initialisation or any world mutation. It should do nothing at all, loudly
enough to see in the log.

This one is fail-closed by design, so a boring result is the right result.

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
