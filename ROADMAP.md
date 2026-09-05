# Conspiracy-Files — Roadmap

## Active destination and next increment

P4-R53 restores the intended product: a large database of possible locations, automatic evidence placement and dynamically generated conspiracies. Players investigate; they do not approve locations in advance.

1. **Planning increment (this change):** define a bounded generated prototype, explicit constraints and measurable acceptance.
2. **G1 — offline generation:** use 8–12 provenance-backed catalog records, two small case outlines, three documents and two automatically chosen locations per case. Prove repeatability, meaningful seed variation and coherent references before engine work.
3. **G2 — live composition:** generalize only the adapter contracts needed to consume a generated case; validate storage automatically, commit one case, then test actual placement/Inspect/save/reload. Preserve conservative identity recovery and surface its unresolved cases.
4. **G3 — owner playtest:** play generated investigations and judge clarity, interest and survival fit. No plausibility tour or individual site-approval step.
5. **Later expansion:** grow database coverage and template variety from measured gaps, without building a generic platform first.

See [Generated investigation prototype](docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md). No generator implementation is included in this planning increment. The unrelated CPU incident is not a blocker; normal performance verification remains required.


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
