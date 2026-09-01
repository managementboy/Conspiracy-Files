# Conspiracy-Files — Roadmap

## v0.1 — Vertical slice

Goal: prove the intended feeling once, with the smallest end-to-end build.

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
- deterministic non-AI death recap if the slice reaches death-summary work.

### Explicitly out of v0.1
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

### Current delivery checkpoint

- [x] Dead Air `dead-air-r1` content approved.
- [x] Plain-Lua domain core accepted.
- [x] Exact P2/R2 bindings accepted on Build 42.20.4.
- [x] Build 42 production package/bootstrap, scheduler, error budget and persistence shell implemented with offline tests.
- [ ] D1–D6 placement, physical identity, reader/Inspect and arrival adapters integrated end to end.
- [ ] Notebook journal, evidence list, in-fiction help and the one normal-play notebook keybind implemented.
- [ ] Death/reload lifecycle boundary assigned, implemented and tested.
- [ ] Production shell and complete vertical slice pass their live Build 42 acceptance matrices.
- [ ] Deterministic package pipeline and cross-device prerelease smoke pass.

## Engineering gate A — before v0.1 implementation is trusted
Run six critical probes:
1. [x] T1 ModData persistence/size limits — complete on Build 42.20.4; decisions incorporated.
2. [x] T9 Lua network egress — complete on Build 42.20.4; vanilla Lua has no general HTTP client, so future optional runtime-AI transport needs Java/ZombieBuddy or an external companion and remains outside v0.1.
3. [x] T2 map/meta-grid enumeration cost — complete on Build 42.20.4; 96,414 building/room records took 227–244 ms synchronously, while 100 records/frame stayed at or below 2 ms. Future discovery must stream/filter behind dual record/time bounds; v0.1 remains curated.
4. [x] T3 location categorisation reliability — complete on Build 42.20.4; exact bookstore/clinic/hospital room labels produced useful candidates, but generic building categorisation and non-building transmission landmarks were not reliable enough to become story truth. v0.1/v1 remain curated; future automation is advisory and P4-R34-bounded.
5. [x] T4 exact-once deferred placement — complete on Build 42.20.4; use queued `LoadGridsquare` wake-ups plus `OnGameStart` catch-up, detached pre-stamping, exact-container reconciliation, and loss-over-duplication handling for ambiguous persisted state.
6. [x] T5 persistent item identity — complete on Build 42.20.4; use a mod-owned per-instance ModData token, keep engine IDs diagnostic only, separate placement outcome from current physical availability, treat copied-token duplicates as sticky `conflict`, and never infer loss from absence in only the original placement container.

A negative result is a valid result and must update the decision record.

## Engineering gate B — before broader v1 architecture sign-off
- [x] T7 asset text/name/page mutation — complete on Build 42.20.4; persistent custom names + ModData are the universal carrier, locked custom pages are a limited plain-text projection, and world-specific bodies use the custom Inspect reader.
- [x] T8 building/room/non-building arrival detection — complete on Build 42.20.4; scripted teleports emitted no `OnPlayerMove`, while bounded 15-tick sampling with two stable samples correctly handled exact room/building/floor/basement/radius/rectangle/zone predicates, negatives and leave/re-entry. Use sticky idempotent confirmation; reload-inside and delayed-reference ordering remain production-adapter cases.
- [x] T10 cooperative `Inspect` context-menu integration — complete on Build 42.20.4 through the manual-GUI route. Player and Ground/loot inventory panes preserve vanilla/foreign actions and provide privately keyed, activation-revalidated Inspect/Mark behavior. Direct world-object right-click did not receive dropped inventory subjects and is not supported.
- [x] CF-V01-E01 Dead Air location bindings — complete on Build 42.20.4. P2 is the police property/records building and R2 is the relay communications/news building; all six document containers, exact whole-building arrival references, access objects and `1533.884`-tile separation are recorded in `docs/research/CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`.
- T6 never-loaded chunk detection only if retrofit is revived.

## v1 — Core investigation experience
Provisional, only after v0.1 is fun and Gate A results are incorporated:
- built-in authored conspiracy content;
- notebook + evidence list;
- authoritative curated location catalog; any automatic categorisation is advisory candidate assistance under P4-R34/P4-R35;
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

## Distribution path

Distribution follows P4-R46 / ADR-0003:

1. live-verify the implemented production Build 42 layout and bootstrap;
2. add a deterministic package/validation pipeline;
3. publish versioned GitHub prerelease ZIPs for internal cross-device testing;
4. use an unlisted/access-limited Workshop item only after another device installs and loads the same payload successfully;
5. publish publicly only after every v0.1 acceptance criterion passes.
