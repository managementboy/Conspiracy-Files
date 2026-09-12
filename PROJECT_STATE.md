# Conspiracy-Files — Project State

Status: **generated G2 playable loop and core found-clue map markers have owner-observed live passes (2026-09-06)**. Dynamic generation and automatic location selection remain the destination (P4-R53); the installed development runtime is still one case per save. Offline expansion work is not yet live acceptance or a production release.
Target: Project Zomboid Build 42; T1/T2/T3/T4/T5/T7/T8/T9/T10 verified stable Build **42.20.4**, revision **b0bbce05d5**, Steam build ID **24909800**, with the limitations recorded in their reports. Other capability claims remain subject to their named spikes/research.

## MILESTONE — person/key/place connection proven live, 2026-09-07

**DEV-0.8.9-proxinv.** The full four-fact chain closed in play for the first
time, deriving a connection and rendering it in the notebook as entry #6:

    [CF-PERSON] keyDoorMatch door=10714:9986:0:2 building=10977700185374755
    [CF-LEDGER] #6 connection connection:...document-1;...identity:2063428190;
                ...person-key:...;...match:... at hour 9.71
    [CF-VOICE]  said "That's worth writing down." halo=true sound=true

The connection id carries the whole inference: the clue found, the ID naming
Norman Valle, the key found with his body, and the door that key opened. Four
independently observed facts joined into one interpretation.

Notebook #6 reads: "A key observed with a document naming Norman Valle matches
the building where I found Dispatch copy / R-340. This suggests a connection
between those belongings and that place. It does not establish who lived there
or wrote the clue. The original clue remains unchanged." Cautious register held
under the most tempting possible circumstances.

This satisfies the owner's original requirement that a key found on a named
corpse can connect that person to an otherwise unnamed clue location.

**Every link fired:** bound, nameDocument, key placed, keySource,
keyDoorMatch, derived connection, ledger entry, voice line.

**Still unproven:** the observed vanilla-key path (`observedKeyDoor`) and its
Set B named voice line, which needs the corpse's real residence key used on
its own house. And wallet identity observation - see below, now the priority.

**Priority correction from the owner:** most corpses carry their ID inside a
wallet, not loose on the body. The fixture corpse is unusual in having both.
Wallet observation is therefore the identity mechanic, not an edge case, and
it is not currently confirmed working. A second corpse (ID: Alejandra Bunn)
was on screen and recorded nothing. See docs/design/CORPSE_KEYS_AND_IDS.md.

**Tooling note, CORRECTED 2026-09-07:** an earlier version of this file claimed
reloadLuaFile leaves IdentityObserver half-attached. That was wrong. The render
hook and tick handler are registered once and are not rebound on reload, but
both dispatch through the module table (`I.afterRender`, `I.tick`), so the
reloaded functions are the ones that run. Reloading it is safe, and was proven
so when diagnostics added after a reload fired immediately. The load line now
reports `renderHookInstalled`/`tickHandler` so this is checkable rather than
guessed at.

## Live session 2 — 2026-09-07 afternoon, DEV-0.8.8-voice

**The person/key strand ran end to end for the first time.** Previously only
`anonymousClue` had ever fired.

    [CF-PERSONNAME] recorded name for token corpse-item:521727268
    [CF-PERSON] bound ... name=Norman Valle building=10977700185374755
                keyId=77527912 occupation=unemployed
    [CF-PERSON] nameDocument name=Norman Valle
    [CF-LEDGER] #6 identity identity:Base.IDcard_Male:337615145 at hour 10.56
    [CF-VOICE]  said "That's worth writing down." halo=true sound=true

`occupation=unemployed` is read from the corpse descriptor. The same code that
morning would have asserted "electrician" for every body.

**Four defects found and fixed during the session:**

- `InventoryItemFactory` is not exposed to mod Lua. Key creation had always
  been wrong; nothing had ever reached it. Now uses `instanceItem`, the
  vanilla factory (0d8bbde).
- Nothing required `PlayerVoice`, so it could never load - the same class as
  `GeneratedDiagnostic` that morning (86ade2c).
- The provenance race fix was confirmed working: `adopted corpse provenance`
  replaced the crash-and-loop, with the retry cap reporting `Deferred (1/3)`.
- The role/carrier change invalidated every saved case, because `G.validate`
  re-derives a case to detect tampering. It was reverted to keep the retained
  fixture loadable (d97f6cc); re-land it with a generator revision bump.

**Open defect:** identity observation requires a click, not merely a visible
row. See docs/testing/OBSERVER_CLICK_DEFECT.md.

**Still unproven:** the key-door link itself. The session closed before a door
was opened with the residence key, so `observedKeyDoor`, the connection ledger
entry and the Set B/C voice line have never fired. Reachability gating,
basement placement and stale clue relocation also remain untested in play.

**Recurring lesson:** five separate debugging rounds were lost to silent early
returns. Instrumentation resolved each in minutes. Prefer a throttled log line
over a silent return in any path the player can observe.

## Live verification — 2026-09-07

**Discovery-ledger ordering passed owner live testing.** One case, four
documents plus one identity observation, DEV-0.8.6-discovery-ledger.

Documents were discovered out of generation order (document-1, 3, 4, 2) and
the notebook rendered them #1-#4 in that true order, then placed the ID card
at #5 in its real chronological position. Under the previous code identity
rows were appended after all evidence regardless of when they were found.
Ledger log and notebook agreed exactly:

    #1 evidence document-1 hour 3.30      notebook #1 Dispatch copy
    #2 evidence document-3 hour 4.72      notebook #2 File review
    #3 evidence document-4 hour 5.46      notebook #3 Press clipping
    #4 evidence document-2 hour 5.58      notebook #4 Receiving copy
    #5 identity IDcard_Male hour 6.74     notebook #5 Found ID Card

Also observed live: clue hints fired at four separate containers with speech,
halo text and UI sound, with varied phrasing and correct suppression once a
container was emptied; map marker capture; `[CF-PERSON] anonymousClue`; and
the cautious identity wording that refuses to assert who the body was.

The identity was captured from a **loose ID card in the corpse container**,
with no wallet transfer, confirming the prediction in
docs/design/CORPSE_KEYS_AND_IDS.md that the wallet flow is a special case
rather than the normal path.

**Not verified by this run, do not treat as passed:**

- Reachability gating and basement placement. Every target in this case was
  z=0, and ground level short-circuits before the predicate is consulted.
- The person/key chain beyond `anonymousClue`. `bound`, `nameDocument` and
  `key placed` have still never fired.
- Stale clue relocation, which needs 72 game hours.
- Notebook window position/open-state across a real quit and reload.

Two defects were found and fixed during the run: engine methods called
without a receiver in ReachabilityRequest (77d46ef), and a corpse provenance
race that threw when a body carried both a loose ID and a wallet (a5dc1bf).
A retry-forever weakness remains in LocalPersonIntegration.tick: a failing
queue entry is re-queued indefinitely rather than dropped once.

## Latest persistent handoff — 2026-09-06

**Discovery ledger (DEV-0.8.6-discovery-ledger, installed 2026-09-06):** a single shared chronological ledger `ConspiracyFiles/DiscoveryLedger` (domain) plus `ConspiracyFiles/DiscoveryLog` (ModData, tag `ConspiracyFiles.DiscoveryLedger`) now records every discovery as it happens: generated evidence on inspect, identity documents on observation commit, and derived key/person/building connections after the fact that completes them. Each event carries a stable sequence number and the world-age hour, because several discoveries share one game-time interval. `Window:rows()` orders and numbers both notebook sections from that ledger, so journal numbering follows real discovery order instead of grouping by source. Under P4-R63 no migration was written: existing saves have no ledger, and unledgered rows fall back to their previous source order. Requires a fresh test save. No player save data was altered. Backup of the replaced install: `C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-210547-discovery-ledger`.

**Current policy P4-R63:** no backwards compatibility of old saves is required before 1.0. Use fresh saves when breaking schemas; compatibility scaffolding is no longer a design/delivery requirement. Current-build save/reload integrity and failed-write safeguards remain required. This supersedes earlier legacy-save preservation instructions below.

**Active development:** separate Terra Low task `01a07630-3d93-74e3-95cc-859ea1cbda10` implements a bounded successive-investigation candidate (first explicit debug next-case entry, preserving existing case/evidence/markers). No live deployment authorized to worker; PM review required. Handoff expected at docs/management/SUCCESSIVE_CASES_DEVELOPMENT.md. Starting allowance 38% remaining, worker checkpoints/stops at 30% (owner updated 2026-09-06); automatic scheduling is a later increment.

Owner reaffirmed the separate development-task workflow: one focused Terra Low task implements/tests each bounded segment; this PM task reviews, integrates, installs and guides live testing. Keep handoffs compact and conserve shared allowance. See AGENTS.md.

Core found-clue markers passed manual live testing: no-tool suppression, pencil catch-up at the original finding location, existing marks retained after tool removal, subsequent new-clue queue and reacquisition catch-up, shared-location label grouping, and all three annotations surviving save/reload. Owner approved the handwritten graphite text and vanilla question-mark appearance. Detailed evidence: [live session record](docs/management/LIVE_SESSION_2026-09-06.md).

New annotations retain the writing tool's vanilla colour at writing time; legacy records without ink display neutral graphite. Multiple tools use deterministic priority: black pen, pencil, red, blue, green. Pending marks also passed owner testing across save/reload followed by pencil acquisition, appearing at the original finding location. Blue text/question colour passed live using the temporary fixture, with earlier graphite annotations unchanged. Red ink and retention of existing blue ink after switching tools also passed live. Green remains untested live. Owner subsequently confirmed explored-area and Muldraugh paper-map house-number coverage, with undiscovered clues remaining hidden. Map panning, zooming and repeated close/reopen passed owner testing without observed visual problems, noticeable pauses or Lua errors. Runtime cost remains a separate, unmeasured gate. Current annotations are mod overlays, not native draggable/rotatable notes.

Latest focused update installed and SHA256 verified: ClueMarkers.lua, synced Notebook.lua and manually started MarkerColourTest.lua. Backup: `C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-115559-temporary-colour-notes`. Owner approved two temporary physical colour-test notes after exhausting the case; these have session-only annotations and no canonical/journal writes. Temporary fixture ran live and blue appearance passed. Its ground papers initially lacked visible rendering until picked up and dropped; cause unproven, tracked separately. See live-session log. Offline case-expansion modules remain undeployed. For the existing marker module use `reloadLuaFile("media/lua/client/ConspiracyFiles/ClueMarkers.lua"); ConspiracyFiles.ClueMarkers.start()`. Earlier `dofile` instruction caused a Lua error; do not repeat it.

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
when an in-session `reloadLuaFile(...)` command can apply the change
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

## Historical v0.1 delivery backlog

The table records the previous fixture work. P4-R53 and Immediate work below supersede its owner-location-approval sequence; see the execution plan for proposed backlog remapping.

| Work | GitHub issue | Attendance boundary |
|---|---:|---|
| Final two-site Muldraugh binding | #28 | Requires owner/manual live PZ session for route and arrival-negative evidence |
| Dead Air human content approval | #26 | Owner approval verified; context/disclosure/fixture corrections implemented offline; review and live delivery remain separate |
| T11 adapter-composition gate | #29 | Preparation is unattended; final live GUI/save matrix requires attendance |
| T12 ISUI runtime-feasibility gate | #25 | In progress; shared DEV-0.6 candidate prepared, no archived live pass |
| Approved UI and remaining product decisions | #30 | P4-R47–R52 recorded; no repeat product-choice approval needed |
| Production Dead Air vertical slice | #31 | Corrected candidate exists; promotion requires live gates |
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
- All 16 acceptance criteria classified `plain-Lua automated test` pass under PUC Lua 5.1.5. The corrected suite reports 42 passing tests, including focused review regressions and placement/runtime checks, and verifies that every classified criterion retains at least one named test. See `docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md`.
- Historical takeover baseline: 26 tests and 26 parsed Lua files. Current candidate: 42 offline tests pass, including two-location membership, transaction failures, runtime/menu mocks and shared UI composition. Neither result accepts an engine criterion. See correction evidence for current source hashes and syntax output.
- This acceptance is limited to the PZ-independent domain layer. It does not accept ModData adapter behavior, physical placement/commit sequencing, live item identity, reader/UI integration, location-arrival integration, exact map bindings or any other Build 42 engine behavior.

## Historical v0.1 fixture scope

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
- P4-R48 selects the two-site Muldraugh electronics/relay and police candidate, with D4 at relay. Exact container, route, floor/room and boundary evidence remains outstanding. Bindings.accepted stays false; production world adapters require debug mode until acceptance.
- No live Build 42 behavior was validated by the accepted domain-core work. The separately completed T1/T2/T3/T4/T5/T7/T8/T9/T10 results are authoritative, with their recorded limitations, for persistence, enumeration, categorisation, placement, physical identity, asset text/readers, curated arrival, network transport and cooperative inventory-pane actions.

## Immediate work

The active build is the generated G2 investigation with the shared notebook, fixed Muldraugh addresses, and a found-clue marker trial. Owner play verified placement/Inspect, notebook display, save/reload of evidence, and retention after returning physical notes. Address labels were observed live; curves/setback coverage and clue markers still need the next owner run.

The offline batch on 2026-09-05 adds aggregate save-budget checks, marker failure isolation, player-facing map status, and the manual Trial.start entry point. Follow [next live session](docs/management/TOMORROW_PLAYTEST.md) after a full game restart. No live checks were automated while the owner was away.

Next gates: newly captured clue origins, writing-tool loss/catch-up, native marker persistence/rendering, paper-map visibility, and performance. Preserve one case per save and conservative interrupted-placement recovery. Larger content/template and progression work follows these checks; no per-site plausibility tour is required.

## Rule for disproven decisions

Do not preserve a decision merely because it was previously marked settled. If a spike disproves it, supersede it explicitly in `DECISIONS.md`, link the spike result, and add the replacement ruling.

## G2 development integration — 2026-09-05

One-case generated placement/Inspect/journal/save-resume path implemented; 52 suite tests plus end-to-end runtime mocks pass. Survival-radius selector verified live previously; actual generated gameplay is pending owner play. See [G2 playable trial](docs/management/G2_PLAYABLE_TRIAL.md) for commands, acceptance and unresolved conservative recovery. No production acceptance or multi-case scheduling is claimed.

## Muldraugh addressing trial — 2026-09-05

Implemented fixed per-save fictional address book, native-known-area map overlay and notebook address presentation. Unit/mocked adapter checks pass; native label visibility, cost, paper-map reveal and ordinary-player navigation await owner run. See [address trial](docs/research/MULDRAUGH_ADDRESS_TRIAL.md). Found-clue markers remain the next increment.

## Found-clue marker trial — 2026-09-05

P4-R59/P4-R60 implementation added: actual pickup-source capture, known-evidence map overlay, recursive vanilla pen/pencil eligibility, persistent catch-up and drop/reload retention. Existing historical clues without recorded sources are intentionally not backfilled. Read [clue-marker trial](docs/management/CLUE_MARKER_TRIAL.md) for activation, coverage, tests and native acceptance gates. Mod-owned marks are separate from vanilla editable annotations.

## Economical development workflow — 2026-09-05

P4-R61 recorded in DECISIONS.md and AGENTS.md. One scoped Terra Low worker at a time is the default for independent routine implementation; primary integrates/reviews. Use compact handoffs without conversation forks. Do not claim current primary effort settings changed; actual model settings remain app-controlled.

## Queued notebook shortcut — 2026-09-06

Owner requested separate UI task 01a07637-87a5-71c0-bbce-803b2d6c1b51 (Terra Low): replace inventory Open Journal entry with a conspiracy-notebook icon immediately right of Investigate Area, opening the existing notebook. Preserve clue inspection. Project Cook reference screenshot mentioned but not received in that message; PM requested attachment. Worker starts read-only research, defers implementation until successive-case worker is finished to avoid shared-file conflicts, and respects the 30% allowance reserve. Handoff: docs/management/NOTEBOOK_TOOLBAR_DEVELOPMENT.md. No live deployment yet.


Notebook toolbar reference received: codex-clipboard-77b33368-f76a-436e-afc0-d8262c2edb41.png shows Project Cook's pan beside the crafting icon. This demonstrates horizontal placement only; the approved notebook anchor remains immediately right of Investigate Area/search. Reference forwarded to UI task. Successive-investigation go-ahead reconfirmed; no duplicate worker created.


## Current successive-case handoff — 2026-09-06

PM completed the worker's partial storage/reader changes and installed the reviewed test build at backup 20260906-141630-successive-campaign. Source/live now use one campaign field with frozen legacy fallback, global discovery ordering, multi-case markers/Notebook and validated budgeted replacement. All focused checks passed; native acceptance pending. Restart PZ fully before testing; existing save remains the test target. See docs/management/SUCCESSIVE_CASES_DEVELOPMENT.md for exact files/tests/commands. Development tasks are idle because work is handed back; PM must actively consume completion before reporting ongoing work. Do not promise background review after ending the PM turn.

## Current allowance reserve — owner update, 2026-09-06
Owner authorizes continuing development down to 25% weekly remaining (75% used), superseding prior 30% checkpoint. Earlier task/budget entries are historical. Resume with Wood St missing-number audit; no reset credits or paused automations authorized.
## Successive investigations — live acceptance, 2026-09-06

Owner passes two-investigation evidence/marker persistence after save/quit/reload: R-208 #1-#3 plus File review / R-781 #4, retained together with correct global discovery numbering. Basement physical clue placement and proximity hint also passed. This validates the manually triggered successive-case path; automatic scheduling remains a later increment. Upper-floor placement pending, missing Wood St house number deferred by owner. Evidence: docs/management/LIVE_SESSION_2026-09-06.md.
## Next milestone expanded — P4-R64, 2026-09-06

Owner adds richer authored evidence prose (what found, context, tentative implications) and physical variety to automatic successive-investigation development. Next playable test must include keys, diaries, notebooks and newspaper clippings, not only dispatch files. Further proposed types and scoped acceptance are in docs/management/NEXT_PLAYABLE_MILESTONE.md. Requirements recorded; implementation pending. Continue sequential Terra Low development and 25% reserve. Missing Wood St number deferred; existing multi-case live passes retained.

## Latest allowance reserve — 2026-09-06
Owner now authorizes development until 5% weekly allowance remains (95% used). This supersedes all earlier reserve entries, including25%. Mixed-evidence installation was interrupted; verify live hashes before completing it.
## Mixed evidence installed — 2026-09-06

DEV-0.8.2-mixed-evidence installed and eight source/live SHA256 hashes verified after interruption. Seven richer evidence items per investigation: three record roles plus tagged key, diary, notebook and press clipping using verified distinct native carriers. Fourteen-item two-case mock inspection/reload and related regression checks pass; new content/types require native acceptance. Full restart and fresh test save REQUIRED for generator revision g2-mixed-evidence-1. No saves changed/deleted. Backup 20260906-153711-mixed-evidence. See docs/management/MIXED_EVIDENCE_DEVELOPMENT.md. Automatic scheduling remains next; owner latest stop threshold is 5% remaining, not25%.

Fresh-save crash fixed: GeneratedRuntime.setup used missing Kahlua next global. Replaced with pairs; G2 regression with next=nil passed and fixed runtime installed/hash verified. Full exit/relaunch required before retry; native acceptance pending.
## Mixed-evidence native acceptance — 2026-09-06

Owner confirms all seven R-487 evidence entries and their map annotations survive save/quit/reload. Keys, diary, notebook and press clipping were found/inspected alongside the three expanded records; pen catch-up and all seven map labels observed. P4-R64 initial mixed-evidence playable slice passes core native acceptance. Next development: automatic successive-investigation availability. Upper-floor and key-in-keyring checks remain pending; Wood St number deferred. Current reserve remains5% weekly allowance remaining.

## Identity feasibility priority — 2026-09-06
Owner pauses further feature development to investigate existing game-generated names/occupations before inventing a cast. Read-only IdentityProbe implemented and mock-tested; native data availability/persistence pending. See docs/research/IDENTITY_PROBE.md. Does not create identities, loot or save data. Automatic investigation timing remains deferred until this detour is assessed.

First native identity sample:12 zombies plus1 corpse all expose names; all13 professions report unemployed. Player control reports burglar. Scan completed with8 existing items read and0 getter errors; no matching identity items logged. Names are available locally; occupations and save-stable identity remain unverified. Next owner test: same-area save/reload and rerun probe, compare stationary corpse Shauna Strickland at10792,10287,0. Details in docs/research/IDENTITY_PROBE.md.

Identity follow-up: requested reload-test rerun returned the same corpse Shauna Strickland at10792,10287,0 and unchanged player identity;1 entity,8 items,0 errors. No live zombies in scan scope, so zombie persistence remains untested. Corpse identity matches across samples; reload not separately confirmed beyond owner reporting command run. Recommend case-owned snapshots of sampled names if integrated; occupations remain unknown/default, not inferred from outfit. Findings recorded in identity research notes.

P4-R65: owner accepts authored occupations regardless of clothing, corpses as future evidence/opening candidates, and journal observations only for ID/credit cards actually seen on corpses or in opened containers/wallets. Closed nested contents remain unknown. Known corpse candidate recorded at10792,10287,0. Sequential Terra Low worker implementing bounded observed-card journal slice with verified native visibility hooks and current-build dedup/budget tests; occupation assignment and corpse placement are subsequent slices. Not yet installed or native-tested.

Observed-card slice implemented/reviewed by PM after bounded Terra pure-model handoff. Four Lua files installed with matching source/live hashes; backup20260906-170746-identity-observations. Pure model, native-adapter mocks, actual Notebook journal integration, combined save budget, menu and G2 regressions plus syntax checks passed. Full PZ restart required for new modules; native corpse/open-wallet/no-duplicate acceptance pending. No cards planted, occupations written or saves reset. Journal observations append after case rows; native card-ID persistence still needs verification. See docs/research/IDENTITY_OBSERVATIONS.md for exact behavior and test sequence.

P4-R66 automatic investigations implemented: DEV-0.8.3-automatic. Automatic debug-SP startup, opening site fixed to current building with exact ID/recheck and no neighbour fallback, later cases at current anchor after24 in-game hours (test default), cap3 retained with no completion requirement. Case clock commits atomically and survives all replacements/reload; fresh save required for automatic acceptance. T3 retains required initial building within12-site cap. Parking/speeding tickets join visible identity-document observations. Focused clock, full mocked runtime, T3, identity and G2 regressions pass; native acceptance pending. Details docs/management/AUTOMATIC_INVESTIGATIONS.md. Latest allowance check80% used, stop remains95% used.

DEV-0.8.3-automatic installed:8 matching source/live hashes, backup20260906-172207-automatic-investigations. Owner next step: full PZ restart, fresh debug-SP save indoors, no Trial.start/nextCase commands. First-house and24h successive native acceptance still pending. Current saves were not changed/deleted.

Native startup log2026-09-06: automatic metadata begins frame30 at10770,10271,0, completes657 (12 buildings,627 frames,peak2ms,zero callbacks over2ms). First case commits757; opening container10766,10276,0; all7 placements acknowledged by876. Owner screenshot shows empty DEV-0.8.3 notebook, appropriate before inspection. Log also exposes repeated Notebook.layout setVisible(nil) in narrow empty state. Fixed optional detailOnly expressions to explicit booleans; actual layout regression passes narrow-empty/selected/wide. Notebook fix installed and hash verified. Reload same save after full restart; no fresh save needed for this UI-only correction. Later24h native scheduling and visible-document observations still pending.

Notebook window memory implemented/installed: player UI preferences now retain x/y/width/height, isOpen and selected section while open as well as on close. Unchanged frames do not rewrite preferences; OnGameStart clears transient geometry and restores once runtime is ready through OnPostUIDraw (also works paused). Closed preference remains closed; no cross-save geometry leakage. Focused actual-code regression and syntax pass. Native test pending: after loading update, open/reposition notebook, save with it open, quit/reload same save; repeat leaving it closed. Existing pre-update saves cannot reveal their former open state; no fresh save required.

P4-R67 DEV-0.8.4-scattered: new cases use seven distinct containers rather than one shared container per building. Storage collection capped8/site, overlapping rectangle dedup, same selected floor retained, real loaded targets revalidated before atomic case commit. Starting building requires3 containers, partner4; later random pair conservatively requires4 each. No shared-container fallback; shortage defers. Existing committed clues remain unchanged. Focused candidate/distribution test plus updated realistic four-container G2/automatic fixtures pass; native acceptance pending. One Terra Low worker supplied collection change, PM completed tests/integration. Reserve check83%used, stop95%.

DEV-0.8.4-scattered installed: Storage, Session, GeneratedRuntime and Notebook source/live hashes matched. Full PZ restart required. Current case retains original placements; native test requires a newly generated investigation (fresh save for immediate first-house test, or later case in existing save). No saves or placed items changed.

Native identity observation PASS: owner confirms Damian McGowan ID journal entry remains recorded after transfer to player inventory and save/reload, retaining original observed source (corpse belongings) and location10799,10280,0 without duplicate entry. This validates direct visible corpse-card capture and persistence, not original ownership (owner manually placed this test card), nested-wallet provenance, other card/ticket variants or corpse-name integration into generated stories. Journal identity ordinal restarts at#1 after case rows: known UI defect still pending.

Owner native acceptance2026-09-06: finding clues/separate-container placement works as expected, PASS. Owner explicitly defers the24-in-game-hour next-investigation playthrough; automatic later-case timing remains native-unverified (mock checks passed). No request for accelerated time, changed pacing, reminders or further long gameplay testing. Resume this test when owner is ready.

Next design direction P4-R68: variable clue count/types selected by story roles, installed-object audit (owner examples not a fixed checklist), nearby zombie/corpse cast and occupations, delayed evidence-person inference via observed relationships such as working house keys. Current fixed7/three-four split and fictional cast are not the intended final design. Initial installed-source check confirms map variants, house/padlock/car key types, newspaper/notebook/diaries, business cards and photo variants as audit candidates; existence alone is not tested story/mechanic support. Recommended first playable slice: anonymous house clue -> locally named corpse/zombie -> observed working matching key -> journal adds qualified person/place/clue connection. Not implemented yet; original clue facts and knowledge gates remain immutable.

Owner authorized threaded development. Fresh Terra Low task01a07797-3caf-7360-adc8-2009e2d78017 developing tested key-connection foundation; previous worker idle, its untested drafts not accepted/deployed. PM object audit completed in docs/research/MYSTERY_OBJECT_CATALOGUE.md; sequential integration plan/status in docs/management/LOCAL_PERSON_MYSTERY.md. Current live build stays DEV-0.8.4-scattered. Latest allowance85%used, mandatory stop95%used.

DEV-0.8.5-local-links installed2026-09-06 after sequential Terra Low tasks and PM integration. Fresh generated save required (schema2, g2-variable-evidence-2), no saves reset or changed. Generated evidence now3–7 roles with letters/receipts/notepads plus optional earlier types; actual case drives distinct-container requirements. PM completed observed corpse/card source binding, authored electrician key, durable intent/no-respawn reconciliation, wallet source memory, known-only key/building journal inference through cooperative native completion hooks, combined ordinals and shared-budget roots. This is the observed-corpse first playable path, not hidden living-zombie casting. Main suite53/53 and16 focused commands passed;14 Lua files syntax checked and source/live hashes verified. Backup20260906-200423-local-links. Native acceptance of new key flow remains pending. Instructions and limitations: docs/management/LOCAL_LINKS_ACCEPTANCE.md. Full PZ restart and fresh debug-SP game indoors required;24-hour later-case native test remains deferred. Usage91%used, ownerstop95%unchanged. Development worker01a077cc-112b-7d11-a000-ada29a2fbb96 idle; no background work scheduled.
