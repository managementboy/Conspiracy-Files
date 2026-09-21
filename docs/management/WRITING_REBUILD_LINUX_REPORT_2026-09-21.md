# Writing rebuild: Linux build, testing and delivery — report

**Tested revision:** `e431d82` (published). Corrected against the review of
2026-09-21 (`WRITING_REBUILD_REPORT_REVIEW_2026-09-21.md`), which found four
overclaims in the first version of this report. Each is marked below.
**Version:** `DEV-0.46.1-writing-rebuild`.
**Workshop:** published to the unlisted item `3797999299` on 2026-09-21.
Tag `DEV-0.46.1-writing-rebuild`. The earlier `DEV-0.46.0-writing-rebuild`
tag is untouched and still points at the morning's build.
**Not validated.** Published as a development build on the owner's decision so
the writing can be played and judged; the campaign gate does not pass.

Machine: Linux dev box, Build 42.20.4 (`b0bbce05d5`). Hidden runs use software
rendering at about 7 frames a second, and every bounded job in the mod is paced
per frame. **Frame and step counts are the portable numbers here; wall-clock
seconds describe this laptop and nothing else.**

---

## Suite

**27 failing on arrival → 0 of 172. The suite is green.**

Codex had never run it. Twenty-two fixtures were repaired on 20 September
(`WRITING_REBUILD_LINUX_RESULTS_2026-09-20.md`), leaving eight, all of which
traced to two content gaps. Those eight are now closed and five new tests
added. Details and the reasoning for every change:
`evidence/linux-autotest/20260921T104147-suite-and-decisions.txt`.

The last failure, `investigation_flow`, is fixed. **I first reported it as an
open design decision about which document gets flagged. That was wrong** — both
halves of the prototype already implemented the older-record semantics the test
expects; it simply derived nothing to flag, because
`InterpretationUpdates.derive` read `doc.links`, which `Story.lua` correctly
leaves empty. Repairing that exposed a second gap neither half handled: when a
third source completes a comparison between two already-known documents, the
old rule flagged nothing while the validator demanded an event, so the code
produced a state its own validator refused. Both now use one rule — the
affected record is the earlier endpoint in discovery order — and the timestamp
invariant covers every required source rather than the two endpoints. Proven by
mutation in both directions; new coverage asserts the three-source case
directly. Retraction and reasoning in
`docs/management/DECISION_UPDATED_MARKING_2026-09-21.md`.

---

## The eight acceptance gates

| Gate | State | Evidence |
|---|---|---|
| Personal opening and continuation | **Partial** — opening picked up and recognised through Investigate Area; the linked enquiry follow-up is unexercised | `20260921T061556-gate1-personal-opening.txt`, `20260921T062425-gates-1-6-discovery.txt` |
| Knowledge and source voice | **PASS** — discovery orders now covered exhaustively | `test/discovery_order.lua` (120 cases in 1,476 orders), `test/story_family_contract.lua`, `test/case_completion_state.lua` |
| Navigation and UI | **Partial** — chrome, fonts, addresses and closing questions confirmed; scrolling and rocker input unexercised | `20260921T062045-gate6-organiser-ui.txt` |
| Real map journey | **Partial** — acquisition, reading and rereading confirmed; following a trail to its destination unexercised | `20260921T061747-gate2-map-read.txt`, `20260920T162618-map-read-player-path.txt` |
| All 125 destinations | **Geometry PASS; playable coverage incomplete** — 107 single-building and 18 multiple-building intersections, all overlays exercised. The evidence itself says it does not establish reachable non-floor containers, payoff insertion or player access, and the handoff is explicit that metadata counts alone are insufficient | `20260920T231143-map-coverage-125.txt` |
| Shared restaurant | **Content and same-building confirmed; behaviour untested** — both designs resolve to building `10414750231953455`. Still owed: the cross-file finding waiting for all eight records, and map 16's bank stash unchanged | `20260920T231143-map-coverage-125.txt`, `20260921T112427-shared-destination-exists.txt`, `test/shared_destination.lua` |
| Placement and recovery | **PASS** — four interruption points recover, five designs survive save and reload, variety across five container kinds in four rooms | `20260921T061655-gate4-placement-variety.txt`, `20260920T224635-map-placement.txt` |
| History and storage | **FAIL** — see below | `20260921T111236-campaign.txt`, `20260921T103118-campaign-after-scan-fix.txt` |

---

## Defects found and fixed

**A later case's map scan was never called.** Not slow — never called. A job
sat at building 0 of 9,978 with `ticks=0`, no error and no refusal, while the
generator honestly reported itself busy. Its `OnTick` handler had been removed
from inside `OnTick`'s own dispatch when the first scan finished, and
`T.start` could not re-register it because `nextCase` runs inside the
scheduler, which runs inside an `OnTick` handler too — the list was being
edited while it was being walked, in both directions. This is why a campaign
produced two cases and then stopped for good.
`20260921T085727-second-scan-fixed.txt`

**Objects had been deleted, not left unwritten.** The rebuild removed 647
lines from the generator including every call that turned an object rule into
a placed object. The catalogue of 4,546 items and its eight rules survived
with nothing calling them. I first reported this as missing prose; it was
missing code.

**Only one relationship kind was authored.** 1,880 connections across 600
cases, every one "adds context to", so two sources could never be shown to
disagree — the mod's central mechanic with no content behind it.

**Ten thousand buildings asked for their rooms.** The scan called
`getRooms()` on every building on the map and discarded it on the next line
whenever the building was out of reach, which is nearly all of them. Building
corners are now read once per world and kept.

**Two mangled dashes in player text.** I wrote Python-style `\u2014` escapes
into Lua strings; Lua 5.1 drops the backslash, so a parking ticket read
"MULDRAUGH u2014 loading bay". Caught by the graphify update, not by any test.
`test/escape_sequences.lua` now sweeps all 124 shipped files.

---

## Writing

Three commits, all marked for review, plus the objects:

- Two sources can disagree. Measured after: 1,953 connections, 34% adds
  context to / 34% agrees with / 31% does not match.
- Five carriers that had existed since 6 September and never once appeared —
  ID cards, credit cards, business cards, parking tickets, diaries.
- Fourteen objects authored into the events that warrant one.
- Two filed photographs that named no case.

Read in context afterwards rather than measured:
`20260921T111621-writing-read-in-context.txt`.

---

## Unresolved

1. **The campaign gate does not pass.** The hang is fixed and the generator
   now refuses with reasons rather than stalling, and the run in progress has
   produced a second case — the first time in this session that one has
   arrived inside a gate run. A full campaign has still not been observed end
   to end on this machine.

   A caution about how I reported progress: a rising scheduler step count
   proves execution, not useful progress and not eventual completion. Phase,
   cursor, terminal outcome and actual case count are the things worth
   quoting, and are what the table above rests on.

   The acceptance fixture also carries assumptions from the previous design
   and must be aligned before any run of it is treated as acceptance: it
   requires a literal `Duty log / ` title from answer steering where the
   current requirement is any compatible authored contribution; its archive
   checks still describe older evidence becoming rowless stubs where the
   contract now retains full history; and its "only 5 of 3 clues could be
   played" line compares two counters rather than a hard-coded three, so the
   `PLAYED`/`CASE_LEFT` bookkeeping needs inspecting against stable identities
   before that is read as a product failure.
2. **Four gate halves unexercised**, all needing long play sessions: the
   linked enquiry follow-up, trail-following to a destination, popup scrolling
   and rocker input, and the shared restaurant's in-game behaviour.
3. **The acceptance fixture is now aligned** with the current contract, which
   it was not before: it demanded a literal `Duty log / ` title where the
   contract is any compatible authored contribution; it played up to three
   extra cases — roughly forty minutes here — to manufacture a rowless stub
   that the design no longer produces (`test/case_archive` asserts every
   finished case keeps its rows); and its clue counter's loop bound receded as
   it ran, which produced the false "only 5 of 3 clues could be played". A run
   of it now measures the mod rather than its own stale expectations. That does
   not mean the gate passes — it means a future run is worth believing.

## Two assertions narrowed, both flagged

`object_rules`' breadth requirements encoded the rule-driven design the owner
replaced on 21 September; `room_affinity`'s demand that an unrecognised room
place a clue in the first container is superseded by placement variety. Both
were retired in place with the reason written, and neither was deleted to
reach green. **No assertion was weakened to make the suite pass.**

## One claim withdrawn

I reported that save costs around 600 kB, 800 kB and 1 MB **cannot occur**,
because the 16-case cap stops a save at about 37% of the budget. That was
wrong: I measured one root and called it the save. `SaveBudget.checkMany`
budgets fifteen together, and the map designs and discovery ledger are
independent of the case cap.

`test/map_feature_budget.lua`'s combined fixture reaches **959,031 estimated
bytes, 96% of the limit**, with 40,969 headroom — straight through 600 kB and
800 kB. The generated store is 353,537 of that, which is roughly the figure I
computed and then mistook for the whole save.

`20260921T104410-save-budget-CORRECTION.txt` (the original note is marked
withdrawn in place). Still owed: a validated aggregate measured against the
native save in a running game rather than the estimator.
