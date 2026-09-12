# Integration correction report — 2026-09-05

Status: reviewable DEV-0.6 candidate; offline checks pass; live acceptance remains open.

Published candidate: [draft PR #33](https://github.com/managementboy/Conspiracy-Files/pull/33), source commit 8546a8c, stacked on preparation PR #32. Issues #25–#31 were reconciled and remain open; #26/#30 now distinguish recorded owner approval from patch review. [Before/after issue snapshots](evidence/2026-09-05-correction/github-reconciliation.json) preserve the update trail.

## Authorization and preservation

The owner accepted the takeover recommendations and explicitly selected ordinary police arrival, plain-language availability and no v0.1 death recap. P4-R48–R52 records scope and product decisions. Existing content approval is preserved.

The two inherited commits (9682992, e2b4d20) remain intact. Checkpoint de4439a preserves all audited uncommitted work and PM reconciliation on integration/v0.1-corrected-candidate. No reset, amend, rebase, force push, save deletion or game-profile mutation was used. Historical audit evidence remains unchanged.

PR #32 retains its preparation branch/code scope. The integration branch is submitted separately as a draft stacked on that branch, so the old local ahead commits are not accidentally pushed into #32. No gate closes automatically and no main merge is requested.

## Corrected candidate

- **Canonical commit:** Session stages a schema-2 aggregate containing domain and placement, validates structure/schema/combined 500 KB budget, then replaces one wrapper.canonical value. Failed sink writes preserve the previous private root. Invalid/legacy roots are refused without migration.
- **Placement:** two-site deterministic per-save candidate plan; exact target includes coordinates, object/container indices, type and sprite. Complete candidate coverage is required before binding. Intent precedes detached stamping/add, and count one precedes placed/materialised commit. Conflict is sticky.
- **Identity:** resumable readers inspect player inventory/bags, nearby floor/corpses/storage, occupied vehicle storage and stored targets. Zero in partial coverage means unknown; it never proves loss, activates fallback or respawns an item. Conclusive destruction is currently an explicit debug scenario control, not an invented inference.
- **Arrival:** referenced bindings only, two stable logical-square samples, sticky canonical confirmation and wrong-floor/boundary checks in mocks. Both live predicates remain provisional.
- **Scheduling/errors:** resumable world reads use a 48-step cap and 2 ms deadline with per-subsystem failure limits. Native calls and synchronous canonical/UI work can still exceed the target; E12 must measure them.
- **Actions:** cooperative selection normalization, deduplication, sticky token ambiguity, ownership for marking, expected-container/token revalidation, commit-before-display, generic mark idempotency and stable callback registration. Ground/loot inventory is supported; direct-world right-click remains unsupported.
- **Content:** six authored bodies preserved, D4 restored to relay, C.S.S. role explained without premature company-name reveal, fixture display/context/summary copy aligned. Selected journal details add bounded survivor reflections without new lore or runtime AI.
- **UI:** shared document pane with explicit RGB ink and separate scrollbar; fixed title/actions, Help utility, contrast, compact/wide layout, keyboard controls, native X and configurable unassigned toggle. Escape is not consumed. Source text angle brackets are escaped for the native rich-text parser.
- **Probe isolation:** T12 builds 86 synthetic evidence rows in memory and disables world/ModData work before startup. T11 uses the same adapters with a separate tag and D1-only eligible placement. DebugHarness is read-only except explicit one-shot fault arming and never simulates a GUI discovery.

## Verification

42 tests pass under PUC Lua 5.1.5. They include the accepted 16 plain-Lua criteria, whole-root rejection, interrupted placement, reload-shaped state, conflicts, arrival, scheduler failure isolation, actual runtime/menu mocks, server/client no-write startup, probe modes, generic marks and UI composition.

See [evidence](evidence/2026-09-05-correction/README.md) for the complete suite, Lua syntax pass, preserved-body/fixture comparison, current source hashes and repository checks. Mock output explicitly says synthetic/mock; it is not engine observation. Installed ISRichTextPanel source confirms explicit RGB parsing is needed; it does not confirm visual usability.

## Open technical and live gates

1. **#28 / E01:** exact Muldraugh route, plausible containers and room/floor/boundary predicates are unaccepted. Bindings.accepted=false keeps world adapters debug-only.
2. **#29 / E02:** an empty persisted placement intent is ambiguous across world/canonical save boundaries. The candidate conservatively preserves placing/unknown without respawning. That does not yet satisfy E02's count-one outcome on every interrupted path. Preserve the criterion and obtain the actual one-item fault/reload evidence before choosing a stronger recovery rule.
3. **#29 / E05:** identity coverage is partial, capped and not a whole-world uniqueness proof. Unoccupied distant vehicles, unloaded chunks and unobserved destruction remain unknown. Native copy/transform omission hooks are not implemented; detected duplicates become sticky conflict. Do not claim all transformation/loss paths accepted.
4. **#25:** previous DEV-0.4 scrollbar/contrast failures remain historical evidence; DEV-0.6 has no live visual pass. Native keyboard focus, scaling, scrollbar capture and geometry persistence require observation. Controller support is unimplemented and needs an explicit unsupported/unavailable verdict.
5. **#27 / E10–E13:** actual death/reload, all multiplayer modes, coexistence, engine persistence failures and real timing remain unobserved. Offline server/client branch checks do not satisfy the live multiplayer matrix.
6. **#26/#30:** owner approvals/choices are recorded and candidate copy is reconciled; keep issue review linked to the draft patch. Do not ask for the same approvals again.

## Next attendance

Use [OWNER_ATTENDANCE_CHECKLIST.md](OWNER_ATTENDANCE_CHECKLIST.md). Start with the previously failing T12 contrast/scrollbar case on the shared version; then verify Muldraugh bindings and run T11. The owner launches and performs GUI actions. No deployment or launch was performed during these corrections. Full E01–E13 follows evidence-backed correction and promotion.
