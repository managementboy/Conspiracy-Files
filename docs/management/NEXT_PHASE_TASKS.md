# Next-phase development tasks

Checkpoint: 2026-09-05. Proposed next phase: an automatically started, replayable Muldraugh investigation experience that works through ordinary survival play. Current G2 remains a manual debug trial with one case per save. This task list is planning, not acceptance of the features below or authorization to bypass existing gates.

## Prioritized backlog

| ID | Task | Concrete outcome / acceptance | Work mode and dependencies |
|---|---|---|---|
| NP-01 | Finish current live acceptance | Verify new pickup locations, pen/pencil loss and catch-up, marker/journal save-reload, paper-map knowledge, and address stability. Record failures individually; retain existing save. | Owner play; use TOMORROW_PLAYTEST.md. Blocks promotion of the current mechanism. |
| NP-02 | Prove interrupted-placement behavior | Exercise interruption before intent, after intent, after item insertion and before acknowledgment; include moved, unloaded and duplicate items. Define which states can recover from positive evidence and which must remain uncertain. Never respawn because a partial scan found nothing. | Offline fault tests first, then native checks. Astra reviews the recovery contract; a bounded worker can implement tests. No claimed exact-once guarantee until demonstrated. |
| NP-03 | Measure and bound runtime cost | Measure address initialization, inventory/tool checks, identity scans, map labels and synchronous save validation separately. Fix measured spikes; keep work bounded and report save sizes. | Offline instrumentation and stress fixtures now; native profiling at NP-01/02. Terra Low implementation; primary reviews measurements. |
| NP-04 | Make the first clue discoverable through normal play | Select a plausible nearby introductory placement automatically and give the player a fair chance to notice it. No teleport, debug coordinates, granted discoveries or quest completion messages. Demonstrate finding and following it without console guidance. | Draft rules/fixtures offline now; runtime integration after NP-01/02. Owner evaluates survival fit and prose. |
| NP-05 | Prepare locations beyond currently loaded rooms | Separate metadata candidates from verified storage. Wait for relevant areas to load, verify real containers, and commit only under a defined consistency policy. Unloaded does not mean unsuitable or destroyed. Preserve radius and scarce-location deferral rules. | Offline contract and mocked load/unload sequences first. Recovery review before native implementation; depends on NP-02. |
| NP-06 | Expand authored conspiracy building blocks | Add a small, distinct set of outlines and document roles, with coherent dates, people, organizations and evidential relationships. Validate deterministic generation across seeds and discovery orders. Keep author approval separate from structural tests. | Terra Low for generator/tests; scoped content drafting separately. Integrate after current playable loop passes. No generic content-pack platform. |
| NP-07 | Support successive investigations and growing reach | Specify later-case anchor, pacing, repeat-location avoidance and save retention. Then support multiple immutable cases while applying the approved survival-radius tiers only to newly created cases. No automatic widening and no forced completion state. | Design can proceed offline; these open policy choices are not settled by this list. Implementation depends on NP-02/04/05 and storage-budget evidence. Primary/Astra reviews save structure. |
| NP-08 | Keep a multi-case notebook understandable | Separate cases in the notebook, retain evidence after item loss, link only learned information and make map markers identifiable across cases. Avoid spoilers and duplicate pins. | Offline projection/UI fixtures after NP-07 contract; Terra Low worker. Native usability check before acceptance. |
| NP-09 | Complete player-facing navigation and help | Explain numbering, writing tools, pending marks and availability in ordinary language. Verify one notebook keybind and non-debug access; address remaining ambiguous destination references. Development diagnostics remain debug-only. | Scoped Terra/Luna work on established rules; ordinary-play check depends on NP-04/08. Do not remove debug guards before mechanism acceptance. |
| NP-10 | Package an ordinary-play alpha | Produce a versioned installable build with a verified manifest, supported-build declaration, concise setup guide, rollback instructions and an acceptance report. Existing save compatibility must be explicit; do not invent a migration. | After prerequisite live gates. Primary integrates, reviews and installs under standing authorization. |

## Offline work before the next playtest

Prioritize NP-02 fault fixtures and NP-03 instrumentation. Draft NP-04/05 contracts next without prematurely changing runtime placement. The current marker/address build remains the live-test baseline unless a verified fix is necessary. Avoid accumulating several untested gameplay changes before the owner returns.

## Economical execution

Follow P4-R61: one short-context Terra Low worker at a time for independent routine implementation, Luna for simple documentation/extraction, primary for integration. Reserve higher-effort Astra for recovery, state architecture and difficult review. Assign a concrete output, allowed files and meaningful test per segment; do not fork this whole conversation. Model choices do not guarantee account savings.

## Phase exit

A new survivor can encounter an investigation naturally, navigate using player-visible places/addresses, inspect and retain evidence, and mark actual finding locations only with a writing tool. Later investigations can grow in reach without changing old facts. Persistence/recovery and native performance have observed evidence. Multiplayer, runtime AI, graphs, migrations and external content packs remain outside this phase unless separately approved.
