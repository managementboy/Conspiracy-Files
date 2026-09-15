# Mixed evidence candidate — 2026-09-06

Implemented and installed DEV-0.8.2-mixed-evidence. Fresh test save and full game restart required: generator revision changed to g2-mixed-evidence-1. No migration or save deletion, per P4-R63.

## Behavior

Each generated investigation has seven evidence items at its two selected locations. Three existing record roles remain, with substantially expanded physical description, authored detail and tentative implications. Four additional items provide distinct perspectives: tagged key, private diary, shift notebook, press clipping. Relations are shown only for inspected evidence. Text is committed and reconstructed under its generator revision; discoveries cannot rewrite it.

EvidenceKinds is an authoritative carrier whitelist: Base.Note, Base.Key1, Base.Diary1, Base.Notebook and Base.Newspaper. Verified against installed Build 42.20.4 media/scripts/generated/items/key.txt and literature.txt. The newspaper carries the clipping; no custom clipping mesh added. The key has no confirmed matching lock or bespoke unlocking adapter. Registry returns copies and rejects arbitrary full-type inputs.

Runtime creates each item via the whitelist instead of always Base.Note. Generator projections carry kind; notebook labels use its display metadata; inventory action reads Inspect Investigation Evidence. Session/aggregate discovery limits now accommodate seven items per case. Global ordering, marker source/ink behavior and staged persistence remain in place. Automatic later-case timing is not implemented by this candidate.

## Review and tests

Terra Low worker implemented the registry and assisted with test adaptation. PM completed generator/runtime/UI integration and fixed the test wait to re-read immutable saved snapshots on each tick. No runtime placement defect was established by that stale-test-snapshot failure.

Passed Lua 5.1 checks: evidence_kinds, g2_smoke, g2_faults, successive_cases, notebook_menu, save_budget, clue_markers, clue_hints and notebook_toolbar; syntax checks for changed Lua including synced Notebook bundles. Runtime mock verifies all five physical carriers, seven items per case, fourteen across two cases, all fourteen inspected, kind tampering rejection, immutable text/order on reload, duplicate conflicts, failed-write preservation and source capture. These are offline tests, not native acceptance of the new physical carriers or longer text.

## Deployment

Eight files SHA256 verified against live mod after an interrupted tool response: shared Generated/EvidenceKinds.lua (new), Generator.lua, Session.lua, SuccessiveCases.lua; client GeneratedRuntime.lua, GeneratedMenu.lua, Notebook.lua and ClueMarkers.lua. Backup: C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-153711-mixed-evidence. Installation completed before the user interruption; verification prevented duplicate deployment.

## Owner test

Fully restart PZ, start a fresh debug single-player save with Conspiracy-Files and without T11/T12. Run require("ConspiracyFiles/Trial").start() and unpause for placement. PM reads the first clue location from the log. Inspect the dispatch record, key and notebook at the first location; receiving record, review, diary and clipping at the other. Verify distinct appearance/inventory behavior, rich text/scrolling and uncertainty, notebook type labels, source markers and seven-entry save/reload. Key-in-keyring inspection remains a native check. Later verify a second seven-item case and global numbering. Upper-floor placement remains pending. Missing Wood St house number remains deferred.

## Remaining milestone

Automatic case availability is the next separate integration segment. Reuse dev/next-phase/CampaignPolicy.lua principles with the current runtime, not a second competing save authority. Policy requires current-player anchor, survival reach, minimum in-game gap, small concurrent cap and no completion prerequisite. Explicit tuning and staged timestamps/backoff need implementation and tests. Latest owner budget reserve is 5% remaining (95% used); this supersedes all prior worker checkpoint thresholds.
## Fresh-save Kahlua correction

Live start failed at GeneratedRuntime.setup line27, calling missing next(store). Source now checks nonempty stores using pairs, preserving refusal of invalid nonempty saves. G2 runtime regression runs with global next=nil and passes full fourteen-item inspection/reload/failure checks. Runtime syntax passed; fixed file installed/hash verified with fresh-save-kahlua backup. Native retry pending. Owner's game process at error still started14:25:50, before mixed-evidence deployment: require full exit/relaunch, not hot reload, to get a coherent module set. Reuse the newly created mixed-evidence test save if it contains no committed earlier revision; do not reset/delete it automatically.
