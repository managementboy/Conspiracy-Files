# Second offline development batch — 2026-09-05

Planning requested after the first nine offline segments. This is a proposed execution list, not a claim of implementation or authorization to bypass native gates. Weekly checkpoint: 52% used / 48% remaining. Retain the overnight stop at 35% remaining, do not start a new segment below 38%, and stop by 06:00 Europe/Berlin. Check actual usage between segments; elapsed time alone is not a reason to spend allowance.

## Findings from the original goals

The original experience included an ordinary marked object gaining meaning later, old evidence receiving new context, unexplained contradictions remaining visible, and older notebook material resurfacing when relevant. The current generated trial and tonight's prototypes cover only parts of that experience. Historical fixed-fixture implementations should be reused where appropriate, not recreated blindly.

Sources: [Player moments](../requirements/PLAYER_MOMENTS.md), [notebook contract](../design/V0_1_NOTEBOOK_UI_SPEC.md), [baseline decisions](../../DECISIONS_BASELINE.md) P2-Q5/Q7/Q74–78/Q108/Q119–121/Q150, [engineering corrections](../../DECISIONS_SUPERSESSIONS_2026-08-30.md) P4-R14, [current roadmap](../../ROADMAP.md), and [P4-R62](../../DECISIONS.md). Current decisions supersede historical scope. PRODUCT_VISION.md and PLAYER_REQUIREMENTS.md are still placeholders.

## Sequential candidates

| Order | Task and original goal | Deliverable that can finish without gameplay | Offline acceptance / remaining native boundary |
|---|---|---|---|
| B1 | Connect the new components into one offline investigation flow | A small orchestrator joining FirstClue, current generator, LocationReadiness, CampaignPolicy and MultiCaseNotebook through explicit adapters. Preserve selected introductory site ordering, stage full case plus ledger together, and count all canonical roots. | One deterministic scenario selects, verifies, commits, discovers, reloads and projects two cases. Rejections retain the previous complete state. No live hooks or schema migration; actual startup/placement remains gated. |
| B2 | Preserve meaningful discovery context | A bounded generated-evidence encounter record for actual source, time and supplied verified context. Keep pickup/source capture distinct from inspection and mutable player notes. Reuse existing fixed-fixture context rules. | Moving, dropping, re-reading and reload never rewrite the original encounter. Unknown facts stay unknown; no nearby-world scan or unverified engine fields. Native capture wiring remains later. |
| B3 | Make old evidence gain new meaning | A generated-case interpretation event reducer and Updated-state projection, using explicit authored known-document relationships. Reuse existing fixed ThreadState behavior where suitable. | Discover related documents in every order: emit each update once, preserve both contradictory accounts and original evidence order, reveal no unknown names/documents. Expiry uses explicit configurable in-game durations. Native badges remain later. |
| B4 | Archive and resurface older notes | A pure notebook archive view with in-game age rules and an index for affected known entities/metadata. New relevant evidence can bring an older entry back into view. | Retain all evidence; only presentation changes. Event-scoped work, no full pairwise rescoring. Test save/load, repeat events and unrelated events. Archiving evidence does not silently free a campaign concurrency slot or mean a case is solved. |
| B5 | Mark ordinary objects as interesting in generated investigations | Extend the offline generated evidence contract to support player bookmarks, a bounded note and immutable source context without inventing authored story truth. | Repeated actions are idempotent for supplied stable identity; ordinary objects gain no authoritative conspiracy role just because the player marked them. Mocked projections cover both documents and marked objects. Native item/context-menu integration remains later. |
| B6 | Give generated stories meaningful variation | Expand constrained fact/phrase pools around the two draft outlines; produce a review booklet from fixed seeds and lint chronology, repeated codes, identities, leads and contradictions. | Same input is deterministic; variation changes document substance, not just labels. All prose stays marked owner-review-required. No external content-pack schema or runtime AI. |
| B7 | Contain failures and cooperate with other mods | A reusable boundary/circuit-breaker helper and fault fixtures for chained hooks, repeated failures and module reload. Reuse existing pcall guards; isolate one subsystem without disabling retained knowledge. | Mock foreign hooks before/after ours; preserve call/return behavior, avoid duplicate registration, bound logging and failures. Real mod coexistence still needs native checks. |
| B8 | Make offline verification reproducible | A single runner for the existing core and focused next-phase tests, bundle synchronization checks, syntax checks and concise machine-readable evidence. Update the stale CI plan to reflect existing Lua implementation. | Intentional failing fixture fails the runner; all required suites are actually enumerated. Keep benchmarks labelled synthetic. Local runner can finish tonight; remote CI execution is separate. |
| B9 | Reconcile the product requirements | Populate the existing vision/requirements placeholders with a short current-goal matrix: approved, implemented offline, observed live, deferred. Link tests and source decisions instead of duplicating history. | P4-R53/R55/R58–62 reflected; no stale curated-only/manual-site-approval policy promoted. Documentation only, useful as a low-cost final segment. |

## Recommended scope tonight

Start with B1, then B2 and B3. Continue B4/B5 if measured allowance allows. B7/B8 are useful independent alternatives if a product decision blocks a feature; B6 and B9 are lower priority. Use one compact Terra Low worker at a time, with primary review, retaining the current live baseline. Do not treat the entire list as a promise to spend the remaining allowance.

Exact numerical tuning can remain explicit test inputs. Unexpected product choices are recorded and skipped under the owner's standing instruction. Each accepted segment must leave a concrete module/integration or document and meaningful evidence, rather than another disconnected design sketch.

No gameplay is needed for these bounded deliverables. Player experience, live persistence, actual container hooks, performance inside PZ and ordinary-play access remain separate acceptance gates. Graph, required runtime AI, external content packs, migrations, multiplayer, and death recap remain deferred.


## Execution ledger

Owner approved recommendations at 20:06 UTC. Starting allowance: 52% used / 48% remaining. Work B1–B3 sequentially, then B4/B5 if reserve allows. Optional alternatives are not a mandate to exhaust allowance. No live interaction or deployment.

| Segment | Status | Evidence |
|---|---|---|
| B1 | Complete; reviewed | InvestigationFlow integrated two-case tests pass; selected-generation tests plus existing53tests pass. Explicit-order API additive in source only; prior runtime r2 remains live baseline. |
| B2 | Complete; reviewed | EncounterContext and integrated pickup/inspection/reload tests pass; historical reloot cannot backfill original source. |
| B3 | Complete; reviewed | Six discovery orders, exact expiry, complete relation roots and timestamps bound to learned events pass. |
| B4 | Complete; reviewed | Integrated relevance replay, bucket-only touched records, archive/resurface and malformed-save tests pass. |
| B5 | Complete; reviewed | Personal notes, immutable verified/unknown context, editable note, 64-record cap and atomic shared-budget checks pass. |

No automatic continuation needed while this turn is active. Existing overnight automation remains paused.

B1 checkpoint20:15UTC:53%used47%remaining. Commit, discovery andrestore sharebudgetchecks; loadedreadiness exceptions/refusals preservepreviousstate. No nativeacceptance.

B2 checkpoint: 54% used / 46% remaining. Original source is immutable; display excludes raw coordinates and unknown documents.

B3 checkpoint20:22UTC:54% used /46% remaining. Continue B4 then B5 within unchanged reserve rules.

B4 checkpoint: 56% used / 44% remaining at 20:31 UTC. Primary completed final relevance validation and repaired tamper fixtures to test full valid roots before modification. B5 is the last recommended segment in this batch.


Final checkpoint: 57% used / 43% remaining at 20:36 UTC. B1–B5 complete offline. Stop this recommended batch; B6–B9 remain optional future work. Existing continuation automation remains paused. No live game interaction, deployment or native acceptance occurred.

Verification: selected_generation.lua passed across 20 seeds; existing test/run.lua passed 53 tests after the additive Generator API change. Final focused investigation_flow.lua, evidence_archive.lua and object_bookmarks.lua pass. Packaging reproducibility/integrity tests are run when building the final review artifact. No broad suite was repeatedly run for unrelated changes.

Deliverable limits: Flow is an unreleased offline composition, not the installed G2 runtime. Native item placement/identity, pickup callbacks, notebook rendering and real save timing are still separate gates. Archive relevance currently operates within each generated case; ordinary bookmarks do not automatically acquire authored conspiracy links. Configured timing/cap values remain test inputs. New schema fields have no migration path to live saves.

Latest non-installable artifact: parent workspace artifacts/experimental/ConspiracyFiles-review-DEV-0.8.1-overnight-20260905-batch2.zip. Runtime r2 remains the unchanged live-test baseline.
