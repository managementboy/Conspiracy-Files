# Conspiracy-Files — Project State

Status: **v0.1 integrated offline candidate**. The approved Dead Air content, PZ-independent domain core, exact P2/R2 bindings, production shell, world-facing E02–E07 adapters, presentation/input slice, E10 lifecycle boundary and deterministic release pipeline are integrated. End-to-end live Build 42 integration has not been accepted.
Target: Project Zomboid Build 42; T1/T2/T3/T4/T5/T7/T8/T9/T10 verified stable Build **42.20.4**, revision **b0bbce05d5**, Steam build ID **24909800**, with the limitations recorded in their reports. Other capability claims remain subject to their named spikes/research.

## Source of truth order

1. `DECISIONS.md` — current authoritative decision index.
2. `DECISIONS_BASELINE.md` — preserved full discovery history.
3. `DECISIONS_SUPERSESSIONS_2026-08-30.md` — engineering-review correction trail.
4. `ROADMAP.md` — delivery scope and gates.
5. `docs/architecture/ARCHITECTURE_V0.2.md` — current provisional architecture.
6. `docs/research/` — observed Build 42 facts from spikes. **Observed technical reality overrides a speculative decision.**
7. `docs/decisions/` — ADRs for durable engineering choices.

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
- All 16 acceptance criteria classified `plain-Lua automated test` pass under PUC Lua 5.1.5. The integrated repository suite reports 52 passing tests: 16 domain criteria, eleven shell/lifecycle cases, one static CF-V01-E01 binding guard, fourteen world-adapter cases including the cross-slice placement-to-Inspect contract, nine presentation/input cases and one traceability guard. See `docs/testing/V0_1_INTEGRATION_CANDIDATE_HANDOFF.md`.
- This acceptance is limited to the PZ-independent domain layer. It does not accept ModData adapter behavior, physical placement/commit sequencing, live item identity, reader/UI integration, location-arrival integration or other production-adapter behavior. CF-V01-E01 separately accepts the exact static map bindings on Build 42.20.4.
- **v0.1 production integration shell:** integrated on `main` at `7ec2f97`. It supplies the Build 42 package root and bootstrap, fail-closed multiplayer decision, six additive lifecycle/world hooks, bounded scheduler, per-subsystem error budgets and staged Global ModData persistence adapter. Its offline tests pass, but CF-V01-E09/E10/E11/E12/E13 remain live acceptance work. The later slices below supply its world, presentation and lifecycle surfaces.
- **v0.1 world-facing E02–E07 adapters:** implemented offline from base `0f90648`. They add accepted P2/R2 exact-container resolution with fail-closed signature checks, T4 detached prestamping and reconciliation, T5 mutable availability/sticky-conflict tracking, P4-R40 fallback gating, T7 custom-name plus validated ModData title/description/body projection, and T8 two-sample whole-building arrival through the production scheduler. Placement now also writes the presentation slice's nested validated contract, so every D1–D6 item is Inspect-compatible without weakening the flat physical-token boundary. Fourteen fake-backed matrices pass. No live Build 42 acceptance is claimed.
- **v0.1 presentation/input slice:** implemented offline from base `0f90648`. It supplies the validated T7 item-presentation contract, T10 inventory-pane-only Inspect/Mark adapter, full custom reader, canonical journal/evidence/help projections and exactly one configurable notebook key binding. Nine fake-backed/static cases pass; CF-V01-E06/E08/E14 remain live acceptance work. See `docs/testing/V0_1_PRESENTATION_INPUT_HANDOFF.md`.
- **CF-V01-E10 death/reload lifecycle boundary:** implemented from `0f90648`
  with additive `OnSave`/`OnPlayerDeath` checkpoints that re-stage only the
  persistence adapter's private last-known-good full root. Three focused cases
  cover interrupted private staging, checkpoint replacement failure, corrupt
  published-root recovery, repeated death/save callbacks, invalid same-process
  reload fail-closed behavior and exact ordinal/projection reconstruction. No
  recap is included.
  This is offline evidence only; callback ordering, normal/abrupt exits,
  mutation-in-`OnSave` serialization and already-dead reload remain in
  `docs/testing/CF_V01_E10_LIVE_MATRIX.md`.

## Development tooling

- `dev/live-inspection/` is the reusable, hardware-renderer-enforcing live investigation harness, committed at `5451964`. Its 12 offline tests pass. The normal-desktop GPU path still needs one end-to-end live validation before it replaces all spike-specific runners operationally.
- `dev/location-binding/` preserves the audited one-off CF-V01-E01 probe and runner that produced the accepted P2/R2 evidence. It is development evidence, not part of the production payload.
- `tools/release_pipeline.py` implements ADR-0003's offline deterministic gate. It validates the exact production tree and metadata, runs Lua 5.1 tests/syntax checks, rejects forbidden release content, creates GitHub and Workshop wrappers from one payload, and proves reproducibility by comparing two complete SHA-256 manifests. Cross-device smoke and promotion remain manual gates.

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

- `test/fixtures/THREAD-001-DEAD-AIR.md` is the approved canonical Dead Air content revision `dead-air-r1`: six full documents, three identities, one organisation, two story locations, anchor/fallback behavior, discovery paths, three reward moments, deterministic journal output and a Mark Interesting example.
- The project owner approved Dead Air on 2026-09-01. Its development-time AI assistance remains disclosed under `docs/design/AI_PROVENANCE.md`; see `docs/reviews/DEAD_AIR_CONTENT_APPROVAL_2026-09-01.md`.
- `docs/design/V0_1_DATA_MODEL.md` now derives the smallest v0.1 logical model from that story. Static authored prose/entities remain outside save state; v0.1 relationships are static ID references rather than standalone relationship records.
- `docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md` separates observable product/domain acceptance from live engine validation. Its 16 plain-Lua criteria are covered by the accepted domain-core suite; CF-V01-E01 now passes, while T4/T5/T7/T8/T10 establish mechanisms whose production-adapter integration remains unaccepted.
- Exact vanilla map targets are bound from the 2026-09-01 clean Build 42.20.4 matrix. Relay Site 31 uses R2's whole communications/news building at reference `(13564,1596,0)`, with D1/D3 on shelves `(13555,1576,1)` / `(13556,1576,1)` and D4 in desk `(13562,1579,1)`. Police property uses P2's whole station at reference `(13208,3088,0)`, with D2/D5/D6 in filing cabinets `(13207..13209,3087,0)`. The sites are `1533.884` straight-line tiles apart. See P4-R42/P4-R43 and `docs/research/CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`.
- No live Build 42 behavior was validated by the accepted domain-core work. The separately completed T1/T2/T3/T4/T5/T7/T8/T9/T10 results are authoritative, with their recorded limitations, for persistence, enumeration, categorisation, placement, physical identity, asset text/readers, curated arrival, network transport and cooperative inventory-pane actions.

## Immediate work

The next finishable milestone is the integrated, playable Dead Air vertical slice:

1. run the precise E02–E07 live production-adapter matrices in `docs/testing/V0_1_WORLD_ADAPTER_HANDOFF.md` on the supported Build 42 line;
2. run the production custom-reader/context-menu/notebook live matrices for CF-V01-E06/E08/E14;
3. run E10's explicit death/reload live matrix and resolve its already-dead
   reload support disposition;
4. run the live E09/E11/E12/E13 production-shell matrices plus the integrated E02–E08/E10/E14 matrices on the supported Build 42 line;
5. validate the reusable live-inspection harness once on the hardware-rendered path, then use it for future live matrices;
6. run the deterministic release packager and complete the documented cross-device prerelease smoke before any Workshop beta.

P4-R40 resolves the former entry-selection to-do: if durably placed but undiscovered D1 becomes conclusively `unavailable` only after T5/P4-R37 reconciliation, D2 may activate once as the fallback introduction. Unloading, original-container absence, `unknown`, `untracked` and `conflict` do not qualify, and D1 never respawns.

## Rule for disproven decisions

Do not preserve a decision merely because it was previously marked settled. If a spike disproves it, supersede it explicitly in `DECISIONS.md`, link the spike result, and add the replacement ruling.
