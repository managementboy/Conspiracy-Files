# Conspiracy-Files — Architecture v0.2

**Status:** Current architecture after engineering review. Provisional until Build 42 spikes resolve the load-bearing API questions.

The reviewed `ARCHITECTURE_PROPOSAL.md` remains as the historical first draft. This document is the implementation-facing correction.

## 1. Non-negotiable invariants

- One authoritative domain model; notebook/evidence UI are projections.
- **If rebuilding a cache can change story truth, it is not a cache.**
- Evidence facts are immutable; interpretation is mutable.
- Deterministic IDs for authored content; generated IDs for player/runtime records.
- Lua-first modular monolith; Java/ZombieBuddy only when a spike proves need.
- No-AI is the primary supported experience.
- Domain core has zero PZ dependencies and runs under plain Lua 5.1 tests.
- All PZ contact is behind integration adapters.

## 2. v0.1 architecture boundary

v0.1 is deliberately smaller than the long-term model:

- one built-in hand-authored narrative thread;
- 6 documents, 3 identities, 1 organisation, 2 locations;
- 1 anchor + 1 fallback;
- chronological journal + evidence list;
- manual Mark Interesting;
- two curated/hardcoded locations;
- minimal persistence and exact-once placement.

Not in v0.1: graph, theories, runtime AI, content packs, retrofit, migration, MP, generic location registry.

## 3. Layers

### Domain core (plain Lua 5.1)
Owns:
- canonical entities and relationships;
- evidence facts and interpretation;
- journal chronology;
- player notes/Mark Interesting state;
- anchor/fallback state;
- pure validation rules.

Must never import PZ runtime classes.

### Integration adapters (PZ-facing)
Own:
- PZ lifecycle/event hooks;
- ModData persistence adapter;
- inventory/item/container access;
- placement hooks;
- building/location arrival detection;
- context-menu Inspect integration;
- time/player-state snapshots.

Every adapter invokes domain work behind `pcall`.

Curated location arrival follows T8: evaluate only referenced bindings on a bounded approximately 4 Hz state sampler, debounce with two consecutive samples for the same logical square, and persist a sticky confirmed ID before emitting one domain event. Use exact binding-specific room/building/floor/basement/radius/rectangle/zone predicates. `OnPlayerMove` may wake the adapter but is not authoritative because scripted teleports emitted no callbacks in the probe.

### Projection/UI layer
v0.1:
- notebook journal;
- evidence list;
- in-fiction help/onboarding page.

v2 candidate:
- relationship graph.

### Optional external/Java boundary
Not present by default. May be introduced only for:
- missing API access;
- measured Lua performance bottleneck;
- persistence/data-processing complexity.

Runtime AI transport, if ever added, lives behind this boundary or an external companion after T9; it cannot be a core dependency.

## 4. Canonical state

Persist only what cannot be reconstructed:
- selected built-in story/version metadata;
- resolved authored entity IDs;
- placed/discovered evidence state;
- immutable discovery context required by v0.1;
- current interpretation;
- Mark Interesting/player notes;
- journal chronology;
- anchor/fallback materialisation/idempotency state;
- current configuration relevant to the save.

Do **not** persist a full map registry in v0.1.

Provisional target: **≤500 KB canonical state per save**. T1 owns the real limit.

## 5. Entity model for v0.1

- **Asset:** authored world content definition.
- **Evidence:** player's encounter with an asset/object in context.
- **Identity:** encountered person/name/cover record.
- **Organisation:** organisation record whose label may refine.
- **Location:** one of the two curated story locations.
- **Relationship:** source ID, target ID, type, provenance, active/outdated state.
- **JournalEntry:** chronological projection record.

Graph-only entities/features stay out until v2.

## 6. Placement model

v0.1 does not scan the whole map. The fixture provides two exact curated locations.

T4 fixes the placement protocol:

1. select the deterministic Asset/placement token and curated binding; P4-R32-validate a full root with `pending`;
2. use `LoadGridsquare` only to enqueue relevant bindings and `OnGameStart` to catch already-loaded targets;
3. resolve the exact target and scan its container for the token before constructing anything;
4. if zero, stage `placing`, create and stamp the item while detached, add that exact instance, verify one, then stage `placed`;
5. if one, reconcile to `placed` without adding; if more than one, enter `conflict`; if `placed` later has zero at the target, invoke T5's bounded wider physical-identity reconciliation and never blindly respawn;
6. keep merely unloaded targets pending; mark terminally destroyed/burned/invalid pre-placement targets `unavailable` and consider the authored fallback.

Every canonical transition is a staged full-root replacement under P4-R32/P4-R17. T4 found and tested no Lua-visible atomic transaction across chunk/container files and Global ModData, so ambiguous partial persistence biases toward loss/fallback rather than duplication. Work is drained through a deduplicated bounded queue behind a `pcall` adapter boundary.

Anchor and fallback are both valid authored content, but they are not deliberately spawned together as duplicate red herrings.

The narrative rule for an anchor that was durably placed but remained undiscovered before later becoming `lost` is still a product choice and must be decided before `entryOpportunityUsed` is implemented.

## 7. Asset text model

T7 fixes the boundary:
- predefine generic/static PZ item types as necessary and retain vanilla inventory/container behaviour;
- persist the resolved per-instance display name with `setName`/`setCustomName(true)`;
- store validated plain resolved title/description/body fields in item ModData, while the authored/domain body remains authoritative;
- render world-specific bodies through the cooperative custom `Inspect` surface owned by T10;
- optionally project deliberately short plain-text artifacts into locked `Literature.customPages`; treat the 15-line/1,200-character page UI and literal markup behavior as presentation constraints, never canonical storage;
- do not use `InventoryItem.description`, raw runtime `printMedia` keys, or key/map/generic native UI as body carriers. Static pre-baked print media requires asset-specific proof.

Do not finalise content-pack schemas until T7 and a second real content set exist.

## 8. Evidence identity

T5 fixes the v0.1 rule:

- stamp one save-scoped mod-owned string token per intended physical instance in item ModData while the item is detached; T4's materialisation token may serve this role only when it is instance-unique;
- never use an engine item ID as authority; it is diagnostic transition correlation only;
- keep `assetMaterialisation=placed` separate from mutable physical availability/location;
- one observed token is `available`; confirmed destruction or complete covered absence is `unavailable`; incomplete/unloaded coverage is `unknown`/`untracked`;
- two or more distinct items with one token are sticky `conflict`; never silently select/delete/restamp a winner or clear the conflict because only one later remains;
- all copy/transform code must explicitly omit or replace the identity token unless it deliberately preserves the same physical instance;
- immutable Evidence survives every availability state, and tracking may resume after non-conflict loss only when the same token is observed exactly once.

Normal movement can remove a placed item from its original container. That zero count starts bounded identity reconciliation and cannot by itself set `lost`.

## 9. Events and error containment

PZ events are boundary inputs translated to internal domain events.

Rules:
- every adapter uses `pcall`;
- multi-step canonical changes are staged/validated before commit;
- repeated subsystem failures auto-disable that subsystem for the session after a bounded threshold;
- surface one concise error instead of per-frame spam.

## 10. Performance scheduler

PZ Lua is treated as main-thread constrained.

Provisional normal-play budget: **≤2 ms/frame** for Conspiracy-Files outside explicit initialization/probe screens.

Expensive work uses a queue with bounded work per frame. Never:
- scan the full map each frame;
- compare every evidence pair continuously;
- serialize the entire model unnecessarily;
- run AI automatically.

Archive relevance, when implemented, re-evaluates only records sharing affected entity/metadata indexes after a relevant domain event.

T2 makes the map-discovery constraint concrete. The Build 42.20.4 vanilla map exposed 96,414 building/room records; full scans occupied 227–244 ms. Future map-wide discovery must stream behind both a conservative record cap below the tested 100-record/frame boundary and an elapsed-time deadline under 2 ms. It retains only filtered candidate facts required downstream. The generic full rich index is not the production shape: T2 observed a 90–102 MiB retained JVM used-heap delta while that index was held. Any candidate index remains a rebuildable session cache and is never persisted wholesale.

T3 constrains what such discovery may mean. Exact room labels can yield useful candidates, but no general authoritative building category exists and non-building transmission landmarks were absent from semantic zone metadata. v0.1 and v1 therefore use curated location catalogs. Any future automatic discovery is advisory, room/area-first, preserves matched-property/rule provenance, permits explicit per-map aliases/overrides, and stays behind T2's filtered dual-bounded session process. It never creates story truth.

## 11. Multiplayer

Until an MP architecture exists:
- detect multiplayer;
- disable Conspiracy-Files cleanly;
- do not partially initialize canonical state.

## 12. Mod compatibility

- no vanilla Lua file replacement;
- one global namespace: `ConspiracyFiles`;
- cooperative event/context-menu hooks;
- never assume exclusive listener ownership;
- never write unrelated ModData;
- custom Inspect adds behaviour rather than replacing vanilla handlers.

## 13. AI boundary

### Development-time AI
May draft assets; human approval required before content becomes canonical.

### Runtime AI
Optional bonus only. May summarize canonical state. Never creates facts. Every AI feature has a deterministic no-AI path.

Provider credentials live outside saves/repo. T9 determines whether transport requires Java/companion process.

## 14. Death recap

Required path is deterministic and no-AI. It is generated from canonical state and must survive a failed/pending AI call.

Runtime AI may optionally enhance the recap later, never reveal hidden truth.

Alt-F4/death lifecycle mechanics require a dedicated PZ lifecycle probe before the final spec is locked.

## 15. Diagnostics

Full hidden-state diagnostics are development/debug only. They may be read-only and exhaustive, but normal play must not provide a truth-dump keybind.

## 16. Versioning

Separate:
- PZ supported minor line;
- Conspiracy-Files core/schema/API compatibility;
- authored content revision.

Backward-compatible typo/text revisions must not force save migration. Content packs and migrations are post-v1 and their detailed compatibility policy is intentionally deferred.

## 17. Future features explicitly deferred

- advisory map-wide location candidate discovery — post-v1 only, using T2's filtered/rebuildable dual-bounded scheduler and T3's room-first/provenance/override constraints; curated catalogs remain authoritative;
- relationship graph — v2, separate prototype first;
- content packs — after a second real content set;
- retrofit — post-v1, per-candidate never-loaded/reachability model if revived;
- migration — post-v1;
- multiplayer — future architecture;
- runtime AI — optional future enhancement.

## 18. Architecture proof gates

Before the broad architecture is considered signed off, record spike results for T1–T10 using `docs/research/SPIKE_TEMPLATE.md`.

The first six critical probes are T1, T9, T2, T3, T4 and T5. T7 and T8 are complete; T10 still gates broader v1 behavior. T6 is only needed if retrofit returns.
