# Developer Review Response — 2026-09-01

**Reviewed baseline:** `1be30c4`
**Resolution target:** current `main` working tree after the production-shell/location-binding commits
**Verdict:** all review findings were validated. The four domain blockers and normal-flow code/doc findings are resolved offline. T11 live package acceptance remains deliberately open; legal ownership can be stated as project intent but not independently certified by code.

## Blockers

| Item | Validation | Resolution |
|---|---|---|
| B1 content fix destroys saves | Confirmed. Schema validation exact-matched `contentRevision`; invalid-load policy was implicit. | ADR-0004/schema 2 separates `schemaVersion`, informational `contentRevision`, and `pzMinorLine`. Compatible text revisions load. Invalid roots remain untouched and put the runtime in `disabled-incompatible-state` with one diagnostic. Regression tests cover both paths. |
| B2 false 4× budget, silent ceiling, no caps | Confirmed. Strings were charged 4× and all three fields were unbounded. | Estimator now charges encoded bytes once plus overhead against the real 500 KB ceiling. Caps are 4,096/256/128 bytes. Capacity rejection is atomic, reported once, preserves the last good root, and blocks further canonical growth for the session. |
| B3 entry field disagrees with introduction | Confirmed. Selection/discovery were independent. | First D1/D2 discovery commits the role when absent; a preselected role must agree; schema validation cross-checks the immutable `thread-introduced` event. |
| B4 core cannot express T4/T5 | Confirmed. Only `materialised` existed and the monotonic check prohibited transitions. | ADR-0005 and schema 2 add separate placement and physical-availability maps, legal transitions, sticky conflicts, and a restated monotonic invariant. |

## Should-fix findings

| Item | Result |
|---|---|
| S2.1 CI | Added four jobs: Lua 5.1 suite, luacheck, fixture/ID validation, and secret scan. Added `.luacheckrc`. |
| S2.2 one test per criterion | Changed traceability to one-or-more; blocker regressions reuse criterion prefixes without weakening coverage guards. |
| S2.3 prose in renderer | Moved static strings/templates into `Content.strings`; renderer only resolves them. |
| S2.4 duplicate physical marks | Core now permits one marked Evidence per authored ordinary Asset, with intent ID as a second idempotency guard. |
| S2.5 O(state)/O(n²) | Staging remains intentionally O(state) for P4-R32. Journal batch rendering is now linear. A complete-Dead-Air plain-Lua characterization asserts average mutation/render cost below 2 ms; live E12 remains authoritative. |
| S2.6 loadable mod hypothesis | Later commits had already added `mod/42/mod.info` and the production shell. T11 now tracks the package explicitly; offline entrypoint/package checks pass. Live preflight failed closed because no audited source clone carried the required disposable marker, so loader/require/save-reload acceptance remains open without mutating a real save. |
| S2.7 stale docs | `DATA_MODEL.md` and the three empty requirement stubs are explicitly superseded; `V0_1_DATA_MODEL.md` and architecture now agree on zero v0.1 Relationship records. |

## Clarification rulings

| Item | Ruling |
|---|---|
| C1 journal | Point-in-time chronological record. Later knowledge appends; it never rewrites old wording/eligibility. |
| C2 leads | A lead is outstanding. Confirmed locations disappear from `leads()`. |
| C3 compatibility axes | `schemaVersion`, `contentRevision`, and `pzMinorLine` are separate root fields under ADR-0004. |
| C4 death/reload lifecycle | CF-V01-E10 covers supported checkpoint and state-integrity behavior across death/reload. |
| C5 P2/R2 | Completed after the reviewed commit. The v0.1 integration workstream/project owner ran the disposable-save inspection; the checked-in structured transcript, exact bindings, reproduction commands, hashes, and limitations are in `CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`. |
| C6 human approval | A dated repo artifact naming approver role, exact content revision/source, approval scope, and boundaries. `DEAD_AIR_CONTENT_APPROVAL_2026-09-01.md` is the first instance. |
| C7 licence/disclosure | Project intent is CC0-1.0 for project-owned code, docs, and narrative. P4-R51 records this and approved Workshop disclosure wording; third-party PZ material is not relicensed. This is an intent record, not independent legal advice. |

## Nits

| Item | Resolution |
|---|---|
| N1 renderer nil access | Marked Asset resolution now uses an explicit assertion and label assertion. |
| N2 copy/alias mismatch | Copy now follows value semantics, rejects repeated table identity, and no longer copies forbidden table keys. |
| N3 ID collision | `dead-air:evidence:marked:*` is reserved; authored Evidence conversion rejects colliding Asset slugs. |
| N4 `%04d` | Comments/model docs state it is minimum width and intentionally widens beyond 9,999. |
| N5 lint/packaging hygiene | Added `.luacheckrc`, `*.zip`, and root `/Contents/` ignores. |

## Verification

The repository suite reports 36 tests, 0 failures under Lua 5.1. Standalone Dead Air content validation passes. CI configuration is checked in; live T11 and the broader E02–E14 matrices remain engine acceptance work and are not represented as passed.
