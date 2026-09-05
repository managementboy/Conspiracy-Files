# Conspiracy-Files — Project State

Status: **v0.1 integration correction and evidence reconciliation**. The PZ-independent historical domain core was accepted and merged in PR #15; the current runtime/UI candidate and live Build 42 integration have not been accepted. See [PM takeover audit, 2026-09-05](docs/management/PM_TAKEOVER_AUDIT_2026-09-05.md) for reviewed provenance, blockers and current gates.
Target: Project Zomboid Build 42; T1/T2/T3/T4/T5/T7/T8/T9/T10 verified stable Build **42.20.4**, revision **b0bbce05d5**, Steam build ID **24909800**, with the limitations recorded in their reports. Other capability claims remain subject to their named spikes/research.

## Source of truth order

1. `DECISIONS.md` — current authoritative decision index.
2. `DECISIONS_BASELINE.md` — preserved full discovery history.
3. `DECISIONS_SUPERSESSIONS_2026-08-30.md` — engineering-review correction trail.
4. `ROADMAP.md` — delivery scope and gates.
5. `docs/architecture/ARCHITECTURE_V0.2.md` — current provisional architecture.
6. `docs/research/` — observed Build 42 facts from spikes. **Observed technical reality overrides a speculative decision.**
7. `docs/decisions/` — ADRs for durable engineering choices.

## Live testing workflow policy

Project Zomboid validation should be performed in **debug mode** whenever the
test concerns development probes, UI behavior, placement, arrival detection or
other instrumentation-supported mechanics. The test operator should retain any
required development companion tooling for the specific probe.

For T10-derived context-menu validation, P4-R44 and the current takeover instruction control: manual owner input only; no injected helpers, synthetic input, security changes or UI automation. General debug/reload preferences do not override that boundary.

When a live test needs a script reload, setup action, teleport, state
inspection or repeatable input, prefer a one-line Lua console command in the
current session. Do not ask the owner to restart the game or recreate the save
when an in-session `dofile(...)` or equivalent command can apply the change
safely. A restart is a fallback only when the engine cannot safely reload the
affected code or when the test explicitly measures startup/load behavior.

## Spike-to-GitHub-issue map

Spike numbers and GitHub issue numbers are not interchangeable. Use this authoritative mapping:

| Spike | GitHub issue |
|---|---:|
| T1 | #1 |
| T9 | #2 |
| T2 | #3 |
| T3 | #4 |
| T4 | #5 |
| T5 | #6 |
| T6 | #7 |
| T7 | #8 |
| T8 | #9 |
| T10 | #10 |

## v0.1 delivery backlog

| Work | GitHub issue | Attendance boundary |
|---|---:|---|
| Final P2/R2 location binding | #28 | Requires owner/manual live PZ session for route and arrival-negative evidence |
| Dead Air human content approval | #26 | Owner approval verified 2026-09-05; context delivery/disclosure and documentation corrections remain; issue open |
| T11 adapter-composition gate | #29 | Preparation is unattended; final live GUI/save matrix requires attendance |
| T12 ISUI runtime-feasibility gate | #25 | In progress with reported scrollbar/contrast failures; DEV-0.5 has no archived pass |
| Approved UI and remaining product decisions | #30 | Approved Help placement may be reconciled now; unresolved preference decisions require owner input |
| Production Dead Air vertical slice | #31 | Starts only after the pre-assembly gates pass |
| Full v0.1 live acceptance | #27 | Requires manual live PZ validation |

The milestone is [v0.1 Vertical Slice](https://github.com/managementboy/Conspiracy-Files/milestone/1). T6 / Issue #7 remains open but is not on the v0.1 critical path unless retrofit returns.

## Core product

Conspiracy-Files is a solo-first Project Zomboid investigation overlay. The player survives normally and opportunistically discovers a grounded 1990s government/scientific conspiracy through ordinary PZ places and objects. There is no conventional case completion and no guaranteed final truth before death.

## Review correction

The first specification over-committed to unproven Build 42 capabilities. The engineering review dated 2026-08-30 is incorporated. Key corrections:

- a concrete v0.1 vertical slice now exists;
- no-AI is the primary experience;
- graph is v2;
- content packs, retrofit, migration and multiplayer are out of v1;
- full diagnostics are debug/development only;
- v0.1 uses hand-curated/hardcoded story locations;
- six critical spikes gate core implementation, with four additional probes required before broader v1 architecture sign-off;
- the domain core must be PZ-free/testable under Lua 5.1;
- the runtime budget remains provisionally ≤2 ms/frame outside initialization; completed T1 makes ≤500 KB/save the hard v0.1 canonical-state budget.

## Completed de-risking

- **T1 ModData persistence/size limits:** complete. The live single-player save/reload matrix on Build 42.20.4 revision b0bbce05d5 (Steam build ID 24909800) validated vanilla Lua Global ModData within the hard ≤500 KB/save canonical-state budget and established mandatory recursive pre-save validation. See `docs/research/T1_MODDATA_PERSISTENCE.md`.
- **T9 vanilla Lua network egress:** complete. The live `-nosteam` probe on Build 42.20.4 found synchronous DNS and a fixed blocking server-list helper, but no arbitrary GET, POST, TLS/timeout controls or async HTTP response surface. Any future optional runtime-AI transport requires Java/ZombieBuddy or an external companion and remains outside v0.1. See `docs/research/T9_NETWORK_EGRESS.md`.
- **T2 map/meta-grid enumeration cost:** complete. The live isolated Build 42.20.4 probe counted 9,978 buildings and 86,436 rooms (96,414 records). Full synchronous scans occupied 227–244 ms; 100 records/frame stayed at or below 2 ms, while 500 and 1,000 exceeded P4-R16. A generic rich full-map index retained an observed 90–102 MiB of JVM heap, so future discovery must stream/filter into rebuildable non-canonical candidate indexes. v0.1 remains curated. See `docs/research/T2_MAP_ENUMERATION_COST.md`.
- **T3 location categorisation reliability:** complete. A dual-bounded live Build 42.20.4 scan evaluated 55 curated vanilla building cases across police, bookstore, hospital/clinic, office and transmission categories. Conservative explainable rules produced 28 TP, 25 TN, 0 FP and 2 FN in that in-sample matrix, but building-wide labels remained context-sensitive and no semantic non-building transmission zone existed. Automatic categorisation is advisory only; v0.1/v1 remain curated. See `docs/research/T3_LOCATION_CATEGORISATION.md`.
- **T4 exact-once deferred placement:** complete. A live 13-scenario fault/reload matrix on Build 42.20.4 proved queued `LoadGridsquare` wake-ups plus `OnGameStart` catch-up, detached item pre-stamping, and exact-container reconciliation. Seven valid interruption paths remained at one item through a true target-square stream-out/in and three reloads. Terminal pre-placement target loss becomes `unavailable`; duplicates become `conflict`. T5 later corrected the post-placement rule: missing from the original container triggers wider physical-identity reconciliation, not immediate loss. See `docs/research/T4_EXACT_ONCE_PLACEMENT.md` and `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`.
- **T5 persistent physical item identity:** complete. A fixed multi-load Build 42.20.4 matrix carried one detached-prestamped `Base.Note` through inventory, ordinary container, floor, vehicle and back to inventory with the same ModData token and observed engine ID, then proved permanent removal stayed absent. Real disposable-character death moved one stamped item to the corpse. `copyModData`/`CopyModData` produced distinct engine items with the same token, so duplicates are a sticky `conflict`; engine IDs remain diagnostics only. See `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`.
- **T7 runtime item text and native readers:** complete. A nine-carrier Build 42.20.4 matrix proved custom item names and ModData bodies persist on literature, photos, generic items, keys and maps; `InventoryItem.description` did not persist. Locked Literature custom pages reopened in the vanilla read-only journal but are plain, limited projections. Runtime-shaped `printMedia` was unsafe, including a formatter failure on raw `%` content. The authoritative world-specific body therefore remains in ModData/domain content and uses the custom T10 `Inspect` reader. See `docs/research/T7_RUNTIME_ITEM_TEXT.md`.
- **T8 curated location arrival detection:** complete with explicit reload/reference limitations. Scripted teleports produced zero `OnPlayerMove` callbacks. Bounded 15-tick state sampling with two stable samples correctly confirmed reached exact-room, whole-building, floor, basement, radius, rectangle and installed-zone predicates in 248–344 ms, with adjacent/wrong-floor/boundary negatives and sticky leave/re-entry behavior. Late scripted teleports became unreliable; delayed-reference ordering and reload-inside remain production-adapter tests rather than claimed results. See `docs/research/T8_LOCATION_ARRIVAL.md`.
- **T10 cooperative Inspect integration:** complete through the P4-R44 manual-GUI route. Repeated inventory-pane menus preserved vanilla actions and another additive listener, privately keyed Inspect activated once, Mark Interesting emitted one intent and stayed disabled across reload, hidden/invalid/ambiguous/unowned states behaved conservatively, and injected faults were contained without a crash. Ground inventory is the supported dropped-item surface; direct world right-click received zero inventory subjects and is explicitly unsupported. Controller activation was unavailable. See `docs/research/T10_COOPERATIVE_INSPECT.md`.

## Accepted offline implementation

- **v0.1 plain-Lua domain core:** accepted and merged in PR #15 at `c9d845e21a0a4298a83ce8b92204e66b6e59d073`. It implements the static Dead Air registries, private canonical ThreadState API, authored and Mark Interesting Evidence, append-only journal events, deterministic no-AI rendering, derived Organisation/Location labels, idempotent domain transitions, D5/D6 contradiction handling, B-37 recontextualisation, major-discovery evaluation, staged P4-R32 validation, the conservative P4-R17 size gate and static content resolution.
- All 16 acceptance criteria classified `plain-Lua automated test` pass under PUC Lua 5.1.5. The current suite reports 26 passing tests, including focused review regressions and placement/runtime checks, and verifies that every classified criterion retains at least one named test. See `docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md`.
- Takeover rerun: 26 tests, zero failures; 26 Lua files pass syntax parsing. These results do not accept the current three-location content inventory or any engine criterion. The suite does not enforce static P01/P02/P05 against the two-location scope.
- This acceptance is limited to the PZ-independent domain layer. It does not accept ModData adapter behavior, physical placement/commit sequencing, live item identity, reader/UI integration, location-arrival integration, exact map bindings or any other Build 42 engine behavior.

## v0.1 vertical slice

One built-in hand-authored thread:
- 6 documents;
- 3 identities;
- 1 organisation;
- 2 locations;
- 1 anchor + 1 fallback;
- chronological notebook journal + evidence list;
- manual Mark Interesting;
- hardcoded/curated locations;
- no graph, theories, runtime AI, content packs, retrofit, migration, or MP.

## v0.1 content/model status

- `test/fixtures/THREAD-001-DEAD-AIR.md` is now a complete Dead Air authored-content candidate rather than a structural fixture: six full documents, three identities, one organisation, two story locations, anchor/fallback behavior, discovery paths, three reward moments, deterministic journal output and a Mark Interesting example.
- The Dead Air text was development-time AI-assisted and was approved for v0.1 on 2026-09-05 under `docs/design/AI_PROVENANCE.md`, with contextual introductions added for discovered documents and the D1/D4 timing aligned at 23:58. The approval does not settle exact map bindings or live adapter acceptance.
- `docs/design/V0_1_DATA_MODEL.md` now derives the smallest v0.1 logical model from that story. Static authored prose/entities remain outside save state; v0.1 relationships are static ID references rather than standalone relationship records.
- `docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md` separates observable product/domain acceptance from live engine validation. Its 16 plain-Lua criteria are covered by the accepted domain-core suite; T4/T5/T7/T8/T10 establish mechanisms and production-adapter matrices, but production live integration and final map bindings remain unaccepted.
- Exact vanilla map targets remain unbound pending live inspection. The target geography is a roughly 1,000–1,600-tile straight-line regional journey (P4-R41). First inspection priority is provisional pair P2 `(13206,3073)`, a medium local police station, and R2 `(13549,1572)`, a compact communications/news facility with service garage, at roughly 1,538 straight-line tiles. P2 must have credible property/records containers or the large headquarters remains fallback; R2 must pass newsroom-character, access, boundary and container-plausibility checks. These priorities are not final bindings.
- No live Build 42 behavior was validated by the accepted domain-core work. The separately completed T1/T2/T3/T4/T5/T7/T8/T9/T10 results are authoritative, with their recorded limitations, for persistence, enumeration, categorisation, placement, physical identity, asset text/readers, curated arrival, network transport and cooperative inventory-pane actions.

## Immediate work

### Content follow-up

- Expand the player-facing Journal summaries for every `Major`, `Updated`,
  `Contradiction` and other event kind from short report-like sentences into
  atmospheric prose. Keep the compact row title and state label for scanning,
  but make the selected detail text immersive enough to convey the conspiracy's
  human and practical context without revealing conclusions the player has not
  earned.

Before implementation architecture is signed off:

1. Resolve Issue #28's scope conflict before resuming a route: this takeover specifies P2/R2 and two locations, while direct owner instructions from 2026-09-04 moved the test to Muldraugh and the candidate includes a motel. Preserve checkpoint `9103ea9`; neither route is accepted as a final shipping binding. See the takeover audit.
2. Reconcile the approved `dead-air-r1` contextual introductions under Issue #26; do not expand the scope into new lore before live integration.
3. Run T11 / Issue #29 on one real bound fixture before treating the production adapters as a single implementation step.
4. Complete T12 / Issue #25 against the corrected production-intended path before promoting the existing candidate notebook; browser approval and earlier probe callbacks do not accept it.
5. Complete Issue #30's remaining owner decisions and keep `DECISIONS.md`, requirements and UI direction synchronized.
6. Only then assemble Issue #31 and execute Issue #27's full E01–E13 live acceptance matrix.

All integration work must use the mechanisms proven by the named spikes, including P4-R32 staging, P4-R36 placement, P4-R37 identity, P4-R39 arrival sampling and P4-R45 inventory-pane-only actions. Direct-world-item right-click is not a supported dependency. T6 only matters if retrofit is revived.

P4-R40 resolves the former entry-selection to-do: if durably placed but undiscovered D1 becomes conclusively `unavailable` only after T5/P4-R37 reconciliation, D2 may activate once as the fallback introduction. Unloading, original-container absence, `unknown`, `untracked` and `conflict` do not qualify, and D1 never respawns.

## Rule for disproven decisions

Do not preserve a decision merely because it was previously marked settled. If a spike disproves it, supersede it explicitly in `DECISIONS.md`, link the spike result, and add the replacement ruling.
