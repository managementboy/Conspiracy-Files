# Conspiracy-Files — Roadmap

**Current checkpoint (2026-09-06):** generated placement, notebook evidence persistence and core found-clue map-marker behavior have owner-observed live passes, including writing-tool queue/catch-up, removal, grouped labels and annotation save/reload. See [live evidence and remaining limits](docs/management/LIVE_SESSION_2026-09-06.md).

## Active destination and next increment

P4-R63: pre-1.0 builds may require fresh saves. Old-save compatibility and migrations are not delivery gates; preserve current-build persistence and disclose breaking changes.

P4-R53 remains the destination: automatically selected locations and dynamically generated investigations. No per-site owner approval.

1. Core found-clue marker live check complete. Pending marks across save/reload and subsequent catch-up also passed. Red/blue colours and retention across tool changes also passed; green remains an optional live check; do not repeat passed checks without a relevant change.
2. Paper-map/known-area label visibility and undiscovered-clue concealment passed owner testing. Map pan/zoom/reopen stability also passed owner testing. Broader road coverage and measured runtime cost remain separate checks.
3. Retain conservative interrupted-placement behavior until recovery can be proven. Do not treat absent items as safe to respawn.
4. Manual successive investigations now pass live: evidence from R-208 and R-781, global numbering, map annotations and save/reload coexist correctly. Automatic case progression remains the next integration milestone.
5. P4-R64: include richer narrative descriptions and physically varied evidence in the next playable test: keys, diaries, notebooks and newspaper clippings, with further conspiracy-related evidence selected for coherent story roles. See [next playable milestone](docs/management/NEXT_PLAYABLE_MILESTONE.md).

Offline hardening includes shared canonical budget accounting, safe marker failure handling, notebook map-status messages and a manual one-command trial entry. It does not replace native-engine acceptance.

## Historical v0.1 — Dead Air mechanism fixture

Purpose: retained regression fixture for placement, discovery, UI and persistence. Its fixed story and locations do not prove dynamic generation and are no longer the active product definition.

### In scope
- one built-in hand-authored thread;
- 6 documents;
- 3 identities;
- 1 organisation;
- 2 hand-curated/hardcoded locations;
- 1 anchor clue + 1 fallback;
- chronological survivor notebook journal;
- evidence list;
- manual **Mark Interesting**;
- minimal persistence required by the slice;
- exact-once placement for the fixture content;
- location arrival detection for the two fixture locations;
- ordinary police-arrival journal entry and plain-language physical availability.

### Explicitly out of v0.1
- death recap (P4-R52); death/save integrity remains required;
- relationship graph;
- theory UI;
- runtime AI;
- content-pack system;
- automatic map-wide location registry;
- retrofit into old saves;
- migrations;
- multiplayer;
- generic mod-map categorisation;
- broad procedural story generation.

## Engineering gate A — before v0.1 implementation is trusted
Run six critical probes:
1. [x] T1 ModData persistence/size limits — complete on Build 42.20.4; decisions incorporated.
2. [x] T9 Lua network egress — complete on Build 42.20.4; vanilla Lua has no general HTTP client, so future optional runtime-AI transport needs Java/ZombieBuddy or an external companion and remains outside v0.1.
3. [x] T2 map/meta-grid enumeration cost — complete on Build 42.20.4; 96,414 building/room records took 227–244 ms synchronously, while 100 records/frame stayed at or below 2 ms. Future discovery must stream/filter behind dual record/time bounds; v0.1 remains curated.
4. [x] T3 location categorisation reliability — complete on Build 42.20.4; exact bookstore/clinic/hospital room labels produced useful candidates, but generic building categorisation and non-building transmission landmarks were not reliable enough to become story truth. T3's limitations stand; P4-R53 replaces curated-only product policy with constrained automatic selection and bounded discovery.
5. [x] T4 exact-once deferred placement — complete on Build 42.20.4; use queued `LoadGridsquare` wake-ups plus `OnGameStart` catch-up, detached pre-stamping, exact-container reconciliation, and loss-over-duplication handling for ambiguous persisted state.
6. [x] T5 persistent item identity — complete on Build 42.20.4; use a mod-owned per-instance ModData token, keep engine IDs diagnostic only, separate placement outcome from current physical availability, treat copied-token duplicates as sticky `conflict`, and never infer loss from absence in only the original placement container.

A negative result is a valid result and must update the decision record.

## Engineering gate B — before broader v1 architecture sign-off
- [x] T7 asset text/name/page mutation — complete on Build 42.20.4; persistent custom names + ModData are the universal carrier, locked custom pages are a limited plain-text projection, and world-specific bodies use the custom Inspect reader.
- [x] T8 building/room/non-building arrival detection — complete on Build 42.20.4; scripted teleports emitted no `OnPlayerMove`, while bounded 15-tick sampling with two stable samples correctly handled exact room/building/floor/basement/radius/rectangle/zone predicates, negatives and leave/re-entry. Use sticky idempotent confirmation; reload-inside and delayed-reference ordering remain production-adapter cases.
- [x] T10 cooperative `Inspect` context-menu integration — complete on Build 42.20.4 through the manual-GUI route. Player and Ground/loot inventory panes preserve vanilla/foreign actions and provide privately keyed, activation-revalidated Inspect/Mark behavior. Direct world-object right-click did not receive dropped inventory subjects and is not supported.
- T6 never-loaded chunk detection only if retrofit is revived.

## Historical fixture gates — retained, not the next owner itinerary

The isolated mechanism spikes do not accept complete slice assembly. Conditional runtime/notebook code already exists locally; the following gates control its acceptance and promotion. P4-R48 now selects the two-site Muldraugh candidate with D4 at relay. Exact live binding remains open; see the [correction report](docs/management/CORRECTION_REPORT_2026-09-05.md).

1. [ ] **Location binding / Issue #28:** verify the Muldraugh route, exact targets and candidate-specific arrival negatives; promote bindings only after observation.
2. [ ] **Content reconciliation / Issue #26:** owner approval of `dead-air-r1` with added context is verified on 2026-09-05. Finish context delivery/disclosure and dependent-document corrections; do not ask for the same approval again or equate it with live acceptance.
3. [ ] **T11 adapter composition / Issue #29:** combine T1/T4/T5/T8/T10 mechanisms with the accepted domain core on one real bound fixture item and publish observed live evidence.
4. [ ] **T12 UI runtime feasibility / Issue #25:** validate the approved notebook/Inspect interaction requirements against Build 42 ISUI and feed any limitations back into the design.
5. [x] **Decision reconciliation / Issue #30:** owner selected ordinary police arrival, plain-language availability and death recap deferred; recorded in P4-R50–R52. Runtime usability remains a separate gate.

These gates retain their historical evidence status. Their fixed-site itinerary is suspended under P4-R53. Reusable adapter/UI checks will be applied to generated output; no gate is marked passed by changing direction.

## v1 — Generated investigation experience
Expand only after the generated prototype passes its technical and playtest checks:
- dynamically assembled investigations from authored building blocks and consistent per-case facts;
- notebook + evidence list;
- progressively larger capability-based location database and automatic site/container selection, with provenance and explicit exclusions; no per-place owner approval;
- evidence context capture within proven save budget;
- reinterpretation/update markers;
- archiving/resurfacing with event-scoped relevance;
- normal PZ-style asset interaction or hybrid custom reader per T7;
- one normal-play keybind;
- no-AI required.

### Not in v1
- graph;
- external content packs;
- retrofit;
- migration;
- multiplayer;
- runtime AI as required functionality.

## Owner requests, not yet scheduled

- **Tell the player the mod is starting** (2026-09-11: "I would love a progress
  bar or something to tell the player that our mod is starting"). On a new game
  the mod builds an address book, scans the nearby buildings and prepares a
  case - a minute or so in which nothing visible happens. Preferred shape is in
  the survivor's own voice rather than a UI bar, since UI work is deferred and
  the mod already speaks through halo text: "Taking in the street names...",
  then "Something about this place...", then silence once the first case
  exists. Each phase already logs; the halo only needs to follow it.
- **Late-binding names** - see `docs/design/LATE_BINDING_NAMES.md`, three open
  questions for the owner at the end.
- **Premise-tied objects** - each premise declares the object that belongs to
  its story and the paperwork mentions it (the ledger's craft knife, the fuel
  account's can, the callout's ventilation part). Agreed 2026-09-11.
- **Address book for all of Knox** - it is frozen per save from ~60 street
  segments of a Muldraugh trial region; `streets.xml` has 1,099. Regenerating
  helps new saves only, and the 400 KB cap needs checking first.

## v2 candidates
- relationship graph (after standalone UI prototype);
- optional runtime AI summaries;
- content-pack schema, extracted only after at least a second real content set exists;
- migrations;
- retrofit if a per-candidate safe-placement model proves viable;
- multiplayer design;
- broader advisory map/mod location candidate discovery with explicit aliases/overrides.

## Process rule
The project may remain “never finished” as a creative philosophy, but every development milestone must have a finishable scope.

## G2 development integration — 2026-09-05

One-case generated placement/Inspect/journal/save-resume path implemented; 52 suite tests plus end-to-end runtime mocks pass. Survival-radius selector verified live previously; actual generated gameplay is pending owner play. See [G2 playable trial](docs/management/G2_PLAYABLE_TRIAL.md) for commands, acceptance and unresolved conservative recovery. No production acceptance or multi-case scheduling is claimed.

## Muldraugh addressing trial — 2026-09-05

Implemented fixed per-save fictional address book, native-known-area map overlay and notebook address presentation. Unit/mocked adapter checks pass; native label visibility, cost, paper-map reveal and ordinary-player navigation await owner run. See [address trial](docs/research/MULDRAUGH_ADDRESS_TRIAL.md). Found-clue markers remain the next increment.

Clue-marker follow-up: P4-R60 requires a qualifying inventory writing tool before adding clue annotations. Preserve discovery/source records without a tool, catch up unmarked known clues when one is acquired, and pause new writing when removed. Existing marks persist. Verify vanilla eligibility during implementation; include Help and save/reload/idempotency checks.

## Clue markers — 2026-09-05

Implemented development trial for discovered generated-clue map marks and writing-tool catch-up. Source capture happens on successful pickups; inspection gates evidence visibility. Tests pass; native new-evidence/tool-loss/save-reload run pending. See [trial](docs/management/CLUE_MARKER_TRIAL.md).

## Next-phase task breakdown

[Next-phase development tasks](docs/management/NEXT_PHASE_TASKS.md) defines NP-01–NP-10, dependencies and phase-exit criteria. Start with live acceptance plus offline interruption tests and performance instrumentation. Natural first-clue discovery, unloaded-location handling and successive cases follow proven recovery contracts. This is a proposed backlog; no pending feature or live gate is marked complete.
## P4-R64 implementation checkpoint — 2026-09-06

Mixed physical evidence and richer narrative candidate implemented, focused offline checks passed, installed for fresh-save native testing. Seven evidence items per case; four requested physical forms included. See docs/management/MIXED_EVIDENCE_DEVELOPMENT.md. Automatic successive timing remains unimplemented. Current allowance reserve is5% remaining per latest owner instruction.
