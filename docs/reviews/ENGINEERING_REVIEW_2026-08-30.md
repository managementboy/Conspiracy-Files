# Engineering Review — 2026-08-30

**Reviewer:** Lead developer  
**Reviewed baseline:** `managementboy/Conspiracy-Files` @ `446f3b4`  
**Scope:** documentation-only first draft; no implementation code existed.

This is a durable project summary of the full review supplied during planning. The dispositions are in `ENGINEERING_REVIEW_RESPONSE_2026-08-30.md`.

## Verdict
The first draft had strong organisation and several correct architectural instincts—canonical model + derived projections, immutable evidence facts/mutable interpretation, deterministic/generated ID split, Lua-first/narrow-Java stance, and a useful technical-risk list—but it over-specified the system before validating Build 42 capabilities. The reviewer requested a finishable v0.1, real content, and technical spikes before more architecture.

## Blockers identified
1. **No v0.1 scope:** define a vertical slice rather than treating every capability as eventual mandatory scope.
2. **No worked content:** hand-write one complete thread before designing generic schemas.
3. **Runtime AI risk:** assume vanilla Lua network egress is unavailable until proven; no-AI should be primary.
4. **Retrofit metric wrong:** global >90% unopened-map threshold does not measure usable story placement; retrofit should be deferred.
5. **Diagnostics reveal truth:** hidden-state diagnostics cannot be available during normal play.
6. **Asset text assumptions unproven:** runtime text/name/page behaviour needs a spike; likely hybrid vanilla inventory + custom reader/Inspect.

## Contradictions called out
- strong default vs no sacred default;
- automatic latest asset revisions vs exact version compatibility;
- world-creation-only config vs retrofit;
- no false leads vs redundant anchors;
- hidden timing vs normal-play truth diagnostics;
- invisible provenance vs AI/fact trust boundary;
- auto-resurfacing archive vs no all-pairs polling;
- unlimited graph growth vs graph as primary UI;
- organisation refinement vs identity non-merge;
- notebook pause option living inside the notebook;
- localisation vs dynamically composed story text;
- no migration history vs support diagnostics.

## Required technical spikes
- **T1** ModData persistence/size limits.
- **T2** full map/meta-grid enumeration cost.
- **T3** location categorisation reliability.
- **T4** exact-once deferred item placement.
- **T5** persistent physical item identity.
- **T6** never-loaded chunk detection (future retrofit only).
- **T7** runtime item name/description/page-text mutation.
- **T8** building/room/non-building arrival detection.
- **T9** network egress from vanilla Lua.
- **T10** cooperative Inspect context-menu integration.

## Missing architecture/process items requested
- ≤2 ms/frame provisional runtime budget and a work scheduler;
- ≤500 KB provisional canonical save-state target;
- clean MP-disable stance;
- `pcall` error boundaries and subsystem error budget;
- explicit mod compatibility rules;
- PZ-free domain core testable under plain Lua 5.1;
- glossary and stable decision IDs;
- rationales for load-bearing decisions;
- robust death-summary fallback;
- `.gitignore` and future CI plan;
- GitHub issues for spikes;
- ROADMAP with v0.1 and explicit deferrals;
- ADR-0001 Lua-first and ADR-0002 AI boundary;
- AI-content provenance policy;
- Build 42 mod-layout verification;
- inverse agent rule: spike results may supersede decisions.

## Design pushback
The reviewer asked for three concrete rewarding moments despite the lack of completion systems, demoted the relationship graph from primary/v1 scope, identified content as the major unanswered product question, reframed replay as likely “same story, different entry points/details,” and recommended one normal-play keybind rather than separate notebook/help/diagnostic keys.

## Requested delivery sequence
1. De-risk with T1/T9, then T2–T5.
2. Write the hand-authored story fixture in parallel.
3. Use results to amend decisions/ADRs.
4. Start implementation only after the vertical slice and critical technical assumptions are grounded.

## Baseline preservation
The reviewed baseline commit is recorded as `446f3b4`. The connector used for this planning session cannot create Git tags, so the requested `v0.1-architecture` tag remains a manual repository-admin action if desired. The baseline files remain recoverable in Git history and `DECISIONS_BASELINE.md`.
