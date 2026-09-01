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

## Engineering gate A — before v0.1 implementation is trusted
Run six critical probes:
1. [x] T1 ModData persistence/size limits — complete on Build 42.20.4; decisions incorporated.
2. [x] T9 Lua network egress — complete on Build 42.20.4; vanilla Lua has no general HTTP client, so future optional runtime-AI transport needs Java/ZombieBuddy or an external companion and remains outside v0.1.
3. [x] T2 map/meta-grid enumeration cost — complete on Build 42.20.4; 96,414 building/room records took 227–244 ms synchronously, while 100 records/frame stayed at or below 2 ms. Future discovery must stream/filter behind dual record/time bounds; v0.1 remains curated.
4. [ ] T3 location categorisation reliability — pending.
5. [ ] T4 exact-once deferred placement — pending.
6. [ ] T5 persistent item identity — pending.

A negative result is a valid result and must update the decision record.

## Engineering gate B — before broader v1 architecture sign-off
- T7 asset text/name/page mutation.
- T8 building/room/non-building arrival detection.
- T10 cooperative `Inspect` context-menu integration.
- T6 never-loaded chunk detection only if retrofit is revived.

## v1 — Core investigation experience
Provisional, only after v0.1 is fun and Gate A results are incorporated:
- built-in authored conspiracy content;
- notebook + evidence list;
- curated location catalog where automatic categorisation is not proven;
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
- broader automatic map/mod location categorisation.

## Process rule
The project may remain “never finished” as a creative philosophy, but every development milestone must have a finishable scope.
