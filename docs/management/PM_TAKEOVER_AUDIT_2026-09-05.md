# PM takeover audit — 2026-09-05

Current phase: v0.1 integration correction and evidence reconciliation. The accepted historical domain core remains accepted; the current runtime and UI candidate are not accepted. Recommendation: **revise before push**, then separate production candidate work from PR #32's preparation scope without rewriting or discarding the inherited branch.

## Repository safety and provenance

Initial branch: `pm/v0.1-unattended-prep`; HEAD `e2b4d20ccb42ddcdbef092743c878eea7d012b50`; remote-tracking/PR head `6a0933f82081d3ccb4707ec3921a974224734844`. Two unpushed commits, both authored/committed as Elkin:

- `9682992fe8398dc489a02b71c33d9403d9ee80e9`: randomized placement, runtime, notebook, projections and scaffold validation report.
- `e2b4d20ccb42ddcdbef092743c878eea7d012b50`: domain-state remediation, load guard and regressions.

Both commit patches and all 13 unstaged file diffs were inspected before management edits. No staged changes were present. The original dirty files were hashed in [inherited-dirty-sha256.txt](evidence/2026-09-05-takeover/inherited-dirty-sha256.txt). No code, fixture prose, probe implementation or inherited commit was changed by this audit.

| Inherited dirty files | Established provenance / disposition |
|---|---|
| `PROJECT_STATE.md`, `docs/management/OWNER_ATTENDANCE_CHECKLIST.md` | Earlier task records owner debug/reload preferences, content approval and prose follow-up. Preserve these instructions; reconcile stale status. |
| `dev/t12-ui-runtime/API_DISCOVERY.md`, `README.md`, `common/media/lua/client/ConspiracyFilesT12Probe.lua` | Attended T12 iteration: save guard, Escape removal, configurable binding, contrast and scrollbar attempts. Latest candidate identifies itself as DEV-0.5-document-scrollbar; archived console identifies DEV-0.4-scrollbar. No latest-version pass. |
| `docs/design/V0_1_NOTEBOOK_UI_SPEC.md`, `mod/common/media/lua/client/ConspiracyFiles/Notebook.lua`, `ContextMenu.lua` | Owner requested basic notebook testing, general Inspect wording, context and configurable open/close. Implementation remains conditional on T11/T12. |
| `docs/reviews/DEAD_AIR_CONTENT_REVIEW_2026-09-03.md`, `mod/common/media/lua/shared/ConspiracyFiles/Content.lua`, `NotebookProjection.lua`, `test/domain_core_spec.lua`, `test/fixtures/THREAD-001-DEAD-AIR.md` | Owner approved content with contextual introductions, required consistent timing and rejected unexplained shorthand. Fixture/body correction is present; integration and knowledge-disclosure inconsistencies remain below. |

Provenance was recovered from the local task **Assess game engine buildability**, ID `01a06d98-325c-7bd1-9d2d-3596789a1d7b`, including direct user messages, not inferred authorship from file timestamps. Selected messages are archived in [owner-provenance.json](evidence/2026-09-05-takeover/owner-provenance.json). This establishes task-level provenance, not exclusive human authorship of every line.

The sibling `UI-Design-Workspace` was inspected read-only (README, visual system and prototype results). Its design approval is distinct from runtime acceptance. Its isolation and asset-provenance rules remain intact; no HTML, fonts, icons, textures or other assets were imported.

## GitHub snapshot

Read through the GitHub connector on 2026-09-05:

Machine-readable [GitHub snapshot](evidence/2026-09-05-takeover/github-snapshot.json) retains the retrieved PR/issue metadata.

- [PR #32](https://github.com/managementboy/Conspiracy-Files/pull/32): open, non-draft, mergeable, four remote commits, 20 changed files; title remains “Establish v0.1 pre-assembly gates and T12 UI probe”. It does not contain the two local commits or dirty follow-up.
- [#25](https://github.com/managementboy/Conspiracy-Files/issues/25), [#26](https://github.com/managementboy/Conspiracy-Files/issues/26), [#27](https://github.com/managementboy/Conspiracy-Files/issues/27), [#28](https://github.com/managementboy/Conspiracy-Files/issues/28), [#29](https://github.com/managementboy/Conspiracy-Files/issues/29), [#30](https://github.com/managementboy/Conspiracy-Files/issues/30), [#31](https://github.com/managementboy/Conspiracy-Files/issues/31): all open, milestone 1. Issue #26 has no approval comment.
- Remote-head combined statuses and workflow runs are empty. This establishes no returned status/run evidence for that commit; it does not prove repository-wide automation configuration is absent.

No external state was changed. No push, amendment, merge, issue closure or commit was performed.

## Verified offline results

PUC Lua 5.1.5: **26 tests, 0 failures**, matching the current PROJECT_STATE count. All 16 criteria classified plain-Lua retain named coverage. All 26 Lua files under `mod/`, `dev/`, and `test/` pass `luac5.1 -p`. Both inherited dirty and unpushed-commit diffs passed `git diff --check`.

[Suite output](evidence/2026-09-05-takeover/lua51-suite.txt), [syntax result](evidence/2026-09-05-takeover/lua51-syntax.txt), [reproduction script](evidence/2026-09-05-takeover/static-review-probe.lua), [reproduction results](evidence/2026-09-05-takeover/static-review-results.txt).

The fixture test compares the six document bodies after CRLF normalization. It does not verify all titles, summaries, context lines or location membership. The timing test measures an offline average, not the live per-frame peak. The registration test uses mocks. None accepts E01–E13.

## Findings requiring revision

| Priority / requirement | Evidence and consequence | Required correction / verification |
|---|---|---|
| High — scope, P01/P02/P05/E01 | `Content.lua` registers three Location IDs and moves D4 to a motel; `Placement.lua`/`Runtime.lua` use Muldraugh coordinates, while current requirements specify two locations and P2/R2. The owner explicitly requested a Muldraugh test on 2026-09-04; this is not unexplained agent invention. A motel visit alone does not approve a third shipping Location. | Resolve the conflict with the current takeover scope before binding. Preserve Muldraugh as documented test history. Do not silently restore Louisville or expand shipping scope. |
| High — P4-R36, E02–E04 | `attemptAssignment` adds directly from `pending` then commits `placed`; no durable `placing` stage or post-add token-count verification. Candidate container ordinals are recomputed from the currently loaded neighbourhood, so missing/changed containers can change the selected physical target. | Bind a stable exact target; implement staged intent, count-one verification and fault/reload recovery before T11. |
| High — P4-R37/R40, E03/E05 | The planner accepts only pending/placed/conflict; placed items are never scanned for wider identity reconciliation. There is no physical availability model or conclusive-loss fallback path. All seven items are eligible independently. | Reconcile the owner-approved order-independent placement direction with anchor/fallback semantics; implement unknown/untracked/unavailable/sticky conflict separately from materialisation. No original-container-absence loss inference. |
| High — P4-R32, E09/E13 | `replaceModData` clears a live table and copies fields into it. Domain state changes before `Runtime.persist`; placement and domain tags commit separately. An error after one mutation can leave memory/persisted tags divergent; malformed nonempty state without schemaVersion is treated as fresh. | Prepare and validate the complete replacement before touching canonical storage, preserve last-good state on failure, and define cross-tag recovery. Exercise invalid-root and between-write faults. |
| High — P4-R39, E07 | Runtime confirms broad z=0 rectangles on one 15-tick sample, regardless of prior references; no two-stable-square debounce. | Exact candidate predicates, reference arming, two samples, delayed-reference and reload-inside cases. |
| High — P4-R45, E08/E13 | Context menu chooses the first item rather than normalizing/deduplicating the whole selection. No ownership/token/conflict checks, already-marked disablement or full activation revalidation. `mark`, menu and LoadGridsquare boundaries lack pcall containment; context registration lacks a reload guard. | Complete the T10-derived contract and test repeated menus, ambiguity, ownership, stale activation, foreign listener and boundary faults manually under P4-R44. |
| High — approved context delivery | `asset` is local inside `if Runtime.state` in `inspect`, then referenced outside it. The reader receives nil context in a plain-Lua reproduction. Failed discovery can still proceed to display item ModData text. | Fix scope and make valid discovery/known evidence a prerequisite to display; revalidate the subject and authoritative text. Verify using mocks first, then one manual Inspect. |
| Medium — P16/P22, content reconciliation | D2's new context/journal expands Cumberland Signal Services while the D2-only derived organisation label remains generic. The fixture explicitly defers the full name. D4's context still uses unexplained CSS; fixture titles/summaries lag Content.lua. | Honor the owner's abbreviation request consistently across copy, discovery rules and tests; explicitly document any changed reveal rule. Do not label this a missing human approval. |
| High — P4-R18/R19/R16, E11–E13 | Runtime checks isClient only; it does not establish clean host/dedicated disablement. Hooks install before initialization. One tick failure disables the whole runtime rather than the failing subsystem. Container/object/item loops have no record/time deadline within a scheduled batch. | Verify all MP modes; contain each boundary and isolate subsystem failure; add measured bounded work before acceptance. |
| Medium — P4-R07/R46, T12 | Location correctness overlays and callable debug harness are not gated to debug. Production notebook lacks the approved Help utility, high contrast, focus/controller route and geometry persistence; it uses a different scrollbar composition from DEV-0.5. Titles and metadata are inside scrolling detail. | Keep debug conveniences outside normal play; test the actual production-intended UI path, not only the synthetic probe. Help remains required; unsupported controller behavior needs an explicit recorded verdict. |

These are source/reproduction findings, not claims of observed live corruption or crashes in the current candidate. Production code remains untouched for the implementation follow-up.

## Content and evidence decisions

The owner directly approved Dead Air at **2026-09-05 09:35:54 UTC**, requiring additional context. At **09:53:04 UTC**, the owner required D1/D4 consistency. Those decisions are verified and must not be asked again. The 23:58 and 7C-41 body changes match the fixture.

Issue #26 remains open for implementation/document reconciliation: missing Inspect context, conflicting first-discovery disclosure, stale fixture projection copy, and a durable reviewed patch carrying the approval record. Human approval is recorded; overall content delivery is not yet accepted. County terminology is a nonblocking preference, not an invented approval prerequisite.

The 2026-09-04 live summary establishes a reported earlier Muldraugh scaffold session, not the current randomized candidate or P2/R2 binding. `DebugHarness.inspect` calls domain discovery directly; its completion marker is not proof of physical retrieval or manual context-menu behavior.

T12 is **In progress, unresolved**, not “Not run”. Archived [console excerpts](evidence/2026-09-05-takeover/t12-console-excerpt.txt) identify DEV-0.4 at 3200×2000, font setting 3, opening and row selection. Owner text reports wheel scrolling without a scrollbar, unreadable contrast, and repeated failures. DEV-0.5 has no archived passing observation. Screenshots referenced in the earlier task were not re-inspected in this audit. No visual pass is inferred from callback logs.

## Updated gates and smallest attendance session

T11 remains a one-item composition gate; its directory contains a runbook/map/template and mod.info, not a runnable Lua implementation. Prepare an isolated test wrapper for the revised production-intended adapter path. Record code hashes and any difference from shipping code. Do not copy isolated spike code into production or substitute the existing direct-domain harness for manual Inspect evidence. First D1 discovery normally appends asset-discovered plus thread-introduced entries; count event kinds exactly rather than incorrectly requiring one total JournalEntry.

T12 remains the full runtime-feasibility gate. Candidate UI code already exists, so the gate now controls acceptance/promotion rather than a fictional future start of coding. Carry the owner-approved X/configurable-toggle/Escape behavior into the matrix. Complete static corrections and identify the deployed version before another owner retest.

Next attendance should be a **short decision-only session; no game launch yet**:

1. Resolve the current handover's P2/R2 requirement against the recorded Muldraugh test direction, including the two-location limit and motel/D4 disposition. Until resolved, neither route is a final shipping binding.
2. Resolve only the remaining product choices: police arrival Major treatment, human-readable versus technical availability wording, and optional death recap (name the lifecycle probe if retained). Existing Help, content approval and Escape decisions stand.

After unattended corrections, prepare one versioned disposable manual session for the selected location's exact boundary/room/floor/route checks and the remaining T12 failures. T11 follows only when a runnable probe and usable exact binding exist. The owner launches and supplies manual input; no injected helpers, synthetic input, security changes or automated context-menu activation. Debug console reloads are preferred where safe, but actual save/reload acceptance still requires a real reload.

## Next three actions and PR disposition

1. Preserve this audited baseline, resolve the route/scope conflict, and implement the bounded blockers above before another push or owner retest.
2. Keep PR #32 focused on management/probe preparation and evidence reconciliation. Prepare runtime/UI/content integration in a separate branch/PR from a preserved checkpoint after correction; extract domain-hardening changes separately if independently reviewable. Do not reset/cherry-pick/rebase the current dirty branch to perform the split during takeover.
3. Run the versioned attended location/T12 session, then the runnable one-item T11 matrix; only after evidence-backed verdicts promote Issue #31 and run all E01–E13 under #27.

Audit changes are management/research/acceptance documentation and archived review evidence only. No game launch, code fix, deployment, commit or external mutation was performed. Atmospheric journal prose remains the recorded bounded content follow-up, not unrelated v2 work.
