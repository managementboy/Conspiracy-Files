# Step 2 findings: the mystery content bridge, and a real scope correction

docs/design/KNOX_OS_WEB_PDA_PLAN_2026-09-26.md §7 step 2.

## The real finding: `KnoxApps.lua` targets the legacy engine

Reading `KnoxApps.lua` before wiring it up: its FILES program is
`require("ConspiracyFiles/EvidenceRows")` → `Rows.build(section, runtime)`,
where `runtime` is `ConspiracyFiles.GeneratedRuntime` — the **legacy** case
generator's own live session object (`rt.known()`, `rt.metrics()`), further
wired to `Generated/SuccessiveCases` and `Generated/RelayMemo`. None of this
touches `Mystery/Ledger.lua` or `Mystery/Interpreter.lua` — the engine the
three shipped mysteries (electrician, farmer, fitness instructor) are
actually built on. Loading `KnoxApps.lua` verbatim, as the original plan
wording assumed, would compile and run but render nothing for any of them:
`Rows.live()` would simply return nil forever, since no legacy
`GeneratedRuntime` exists for a Vocabulary-shaped mystery.

This is corrected in the plan (§2's table, §7 step 2): the two engines
share no bridge today. Building one — porting `KnoxApps.lua`'s programs to
read `Ledger`/`Interpreter` instead of `EvidenceRows`/`GeneratedRuntime` —
is real, separate future work, not something "load verbatim" was ever going
to get for free.

## What was built instead

`web/knox-os-pda/index.html` (superseding the step 1 fixture) loads, all
byte-for-byte unmodified:

- `Vocabulary.lua`, `Ledger.lua`, `Spoilage.lua`, `Interpreter.lua`,
  `KnoxUI.lua`, `OrganiserFont.lua`
- All three shipped mysteries: `Content/ElectricianUnsignedRepair.lua`,
  `Content/FarmerRecalledDelivery.lua`,
  `Content/FitnessInstructorWelfareVisit.lua`

A small new adapter (explicitly not a "verbatim" claim — it plays the role
`OrganiserScreen.lua` plays in the real game, not `KnoxApps.lua`'s) does
three things:

1. Lists a mystery's findings as `K.row` calls — the real widget-kit
   primitive, unmodified.
2. On a canvas click, converts to native pixel coordinates and calls
   `K.at(ctx, nx, ny)` — the **same real hit-test contract**
   `OrganiserScreen.lua`'s own `onMouseDown` calls — rather than a parallel
   click-handling system built for this harness alone.
3. A hit on a not-yet-known finding calls the real `Ledger.markKnown`, then
   re-renders via the real `Interpreter.close` for the title bar and
   footer.

## Verified live, all three mysteries

- **Electrician** (`electrician-unsigned-repair`): loads with `component`,
  `panel` ("not yet heard" — GATE-produced, correctly never independently
  findable), `stubA`, `stubB`. Tapping `component` calls `Ledger.markKnown`
  and the row updates to the real authored observation text, truncated by
  the real `K.fit` ellipsis exactly as the game would show it: *"A returned
  radio component, its ca…"*. Status starts and remains `carried` (correct
  — its GATE hasn't fired).
- **Farmer** (`farmer-recalled-delivery`): loads with `rumour` and
  `reading` both "not yet heard" (both `where="heard"`) and `slip`
  findable — matching the content file exactly.
- **Fitness instructor** (`fitness-instructor-welfare-visit`): loads with
  all six findings — `appointment`, `claim`, `doorConfirmed` ("not yet
  heard" — the door GATE's own produced finding), `response`, `review`,
  `vehicle`.

## What this step does not yet cover

- REVEAL text (`Interpreter.visibleReveals`) is not rendered on this
  screen yet — only finding-level rows. Real work for a THREADS-equivalent
  view, not attempted here.
- The GATE mechanics themselves (a real door tried, a real skill checked) 
  have no simulated trigger in this harness — findings that are
  GATE-produced simply stay "not yet heard" for the length of this proof.
  §4.2's faithfulness gates (a simulated "find" must be refused unless the
  real preconditions are met) are naturally satisfied here since the
  adapter never even offers a GATE-produced finding as clickable — but the
  GATE-firing action itself (§4's "answer"/"door" mechanics) isn't wired up
  yet.
- `KnoxApps.lua`'s other programs (THREADS, NAMES, DATES, PLACES, NOTES,
  TO DO, SETUP, HELP) are not attempted — each needs the same
  legacy-to-new-engine bridging decision FILES just went through.
