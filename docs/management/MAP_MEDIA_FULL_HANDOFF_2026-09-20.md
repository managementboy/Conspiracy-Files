# Map-media implementation: one Claude build/testing handoff

Branch: `codex/map-media` in `managementboy/Conspiracy-Files`.
Development version: `DEV-0.45.0-map-media`. Fresh saves required.

The owner asked for implementation first, then one build/testing phase. Codex has
not run unit tests, a compiler, a package build or the game. Source inspection and
fixture authoring are not passing results. This supersedes BUILD_01's staged
handoff; its source manifest and observer remain useful diagnostic tools.

## Implemented

- Native paper-map reader attachment plus successful native callback activates a
  design. Acquisition, cancelled transfer and reveal-on-world-map do not. The
  original Lua callback's arguments, returns and errors are preserved.
- All 125 designs have independent bindings; another copy reuses its design's
  trail. Distinct designs retain their own fragments/payoff at shared places.
- Three logical local fragments per binding, paced after reading and between
  offers. Missed fragments can recur on later journeys; existing copies remain.
  There is no expiry, three-miss exhaustion, active-case slot or concurrent-map cap.
- Destination evidence remains anchored. Entry is recorded from the player's
  actual building, including before the map is read. Nearness is not entry.
- Incremental placement/reconciliation, persisted insertion intents, identity
  stamped before insertion, and conservative unknown state after interruption.
  A verified inserted or discovered payoff is never recreated after disappearance.
- Search-mode clues, timed Look/Inspect, and FILES/NAMES/DATES/PLACES integration.
  Evidence facts are deterministic; comparison requires both records to be known.
- 133 print descriptions, optional flyer/brochure place context, 16 varied record
  families plus gallery, profession/skill observations based on the object seen.
- Plain-table ModData, combined staged map/ledger validation and commit, and map
  facts included in discovery journal replay. No compression or migration layer.
- Ledger capacity 2048; provisional combined estimate allowance 1,000,000 bytes.
  The actual engine file size and acceptable performance remain to be measured.

## Start the single verification phase

Use the existing Linux checkout/worktree and machine-lock workflow. Fetch this
branch, preserve unrelated work, and record the exact tested commit. Do not test
an older copy of main or install on the owner's Windows play machine.

```sh
git fetch origin
git switch codex/map-media
# If the local development branch is behind:
git pull --ff-only origin codex/map-media
tools/autotest/unit.sh
```

The suite discovers the new `map_media_state`, `map_media_read`,
`map_media_content`, `map_media_runtime` and updated whole-save budget fixtures.
They were authored but NOT executed by Codex. Compile every shipped file through
Kahlua as the suite does. Fix/report any failures before a game build.

Use `tools/package.sh` and the existing Linux boot procedure only after those
checks. No merge to main or Workshop publication is authorised by this handoff
alone. This is a development candidate, not a validated release.

## Native acceptance

1. Use `tools/research/map_read_source.py --game <game-root> --out <artifact>` to
   capture installed source/version evidence. Start a fresh disposable save via
   `tools/autotest/pz.sh`. Load `tools/autotest/checks/map_media.lua` for the
   observer and read-only world snapshots. Trace normal read, cancelled transfer,
   successful transfer then read, reread, duplicate copy, generic map, world-map
   reveal, native failure and interactions with another cooperative wrapper.
2. Check all bindings after metadata indexing using debug
   `ConspiracyFiles.MapMediaRuntime.coverage(id)`. Zero/multiple matching buildings
   need an explicit location verdict. Check placeholder anchors, symbol-only maps,
   gallery versus its different stash anchor, and the authored Ekron exception.
   A catalogue row is NOT proof a usable building/container exists.
3. Exercise every record family and genuine eligible carriers. Follow a trail
   without travelling to its destination; then travel much later. Read at a
   destination, enter before reading, revisit an already-looted site, destroy
   carriers before placement, and remove/move/destroy an already placed payoff.
   Check duplicate copies and two designs sharing one destination.
4. Trace vanilla stash preparation and loot completion around insertion. The
   adapter uses `OnFillContainer`, the loot window's `beforeFloor` boundary, and
   an explored-container background scan. Prove our item survives subsequent
   native preparation and appears before its carrier can first be inspected.
   No code forces exploration, clears native loot or calls stash preparation.
5. Inject each debug-only single-use interruption with
   `ConspiracyFiles.MapMediaRuntime.injectFault("beforeInsert")`, `"afterInsert"`,
   `"beforeCommit"`, and `"afterCommit"`, then exercise the production placement
   path. Save/reload at each point. BeforeInsert adds nothing; after insertion,
   a visible token reconciles without duplicate insertion; unloaded/changed or
   uninspectable carriers remain unknown. Unknown is not a missing-item verdict.
6. Recognise through native search mode and carried Look. Cancel each timed action.
   Inspect in place and carried. Refuse a combined budget commit and confirm
   neither root advances. Reload/replay the journal, retain immutable facts and
   discovery places, and verify chronological organiser rows with ordinary cases.
7. Read a linked flyer before and after finding evidence, and an unrelated flyer.
   Check optional place context without a new quest, inventory requirement or
   progress total. Verify specialist/default readings and no unseen-record leak.
8. Check multiplayer clean disable and normal single-player activation without an
   extra feature switch. Existing generated-case behaviour must still work.

## Measure the budget instead of treating it as an engine limit

On disposable benchmark saves use actual campaign, ledger and map-media shapes,
including unknown/placed locators, all 500 discoveries, all 125 entries and all
133 print reads. Test mixed intermediate states as well as the final noted state.
Preserve the existing other-root allowance and archive headroom; include actual
identity/key/visit data in native runs. Do not pad a string and call it a real save.

Measure around 600 kB, 800 kB and 1 MB **estimated canonical bytes**, and report
actual `global_mod_data.bin` bytes separately. Repeat matched saves with the same
world and baseline; measure synchronous save time, ordinary write validation,
load/deserialisation, journal replay and per-frame maximums, then verify every
saved reference/body/place after reload. Capture scheduler and write peaks from
`MapMediaRuntime.status()` alongside actual frame timing. A two-second process
responsiveness poll cannot prove no stutter.

## Boundaries that must stay explicit

Native hook order, all-map location coverage, capacity estimates and frame costs
are unverified. Full recursive writes may exceed the scheduler's two-millisecond
target; do not claim the scheduler preempts one expensive operation. The earlier
rolling-placement mismatch remains unresolved; clean map-media runs do not prove
its cause or fix. The new path shares WorldAccess resolution and whole-save budget
accounting, but has its own insertion/intention state and never relocates a payoff.

If a destination has no eligible loaded carrier, it stays unplaced. If insertion
cannot be reconciled, it stays unknown. Neither condition should be described as
complete or recovered. Any native failure goes into a concrete defect report,
not a silent reduction of coverage or loss of retained evidence.

Graph maintenance: `graphify update .` was attempted after implementation on
Windows and failed with `WinError 5: access denied`. The graph has not been
refreshed; rerun the AST-only update on Linux after integration.
