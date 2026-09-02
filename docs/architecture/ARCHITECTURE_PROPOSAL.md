# Conspiracy-Files — Proposed System Architecture

Status: Proposed for review  
Target: Project Zomboid Build 42  
Implementation philosophy: Vanilla Lua first; ZombieBuddy/Java only for missing API access, demonstrated performance bottlenecks, or persistence/data-processing complexity.

---

## 1. Architecture principles

1. **Vanilla-first** — use normal Project Zomboid Lua events and exposed Java APIs wherever possible.
2. **One authoritative model** — the Conspiracy Model is the source of truth. Notebook, graph, diagnostics, archive, and AI context are projections of that model.
3. **Minimal canonical persistence** — persist only state that cannot safely be reconstructed. Rebuild indexes, caches, lookup tables, and UI views on load.
4. **Entity + relationship architecture** — domain entities are stored in typed collections. Relationships are canonical records in a central relationship store.
5. **Event boundary** — PZ events are translated into internal Conspiracy-Files domain events. Internal systems do not depend directly on each other through ad-hoc calls.
6. **No polling as the default** — use meaningful game events and internal events. Refresh/rebuild views when opened as a safety net.
7. **Story overlay, not world replacement** — Conspiracy-Files observes and annotates the vanilla world. Discovery should not directly mutate the world unless a content asset must be placed into an unloaded area.
8. **Initialization quality over startup speed** — spend time before play constructing and validating a coherent conspiracy.
9. **Runtime AI never defines reality** — runtime AI may summarize and narrate state but may not create authoritative facts.
10. **Diagnostics are complete but read-only** — full initialized conspiracy state may be inspected without modifying the save.

---

# 2. Top-level subsystems

## 2.1 CF Core / Bootstrap

Responsibilities:
- detect compatible Conspiracy-Files version;
- load save/world configuration;
- determine active content pack;
- orchestrate initialization or save-state load;
- initialize subsystem registry;
- translate PZ lifecycle events into internal events;
- expose subsystem health to diagnostics.

Does not own evidence, UI, or narrative generation.

Recommended layer: Lua.

## 2.2 Conspiracy Model

The authoritative state for one save.

Contains typed canonical collections for:
- Asset
- Evidence
- Identity
- Organization
- Location
- Event
- Theory
- PlayerThread
- JournalEntry
- UnresolvedQuestion
- Relationship
- ContentPackState
- WorldConfiguration
- InitializationState

The model contains facts and persistent state, not UI widgets or cached graph structures beyond player-authored node positions.

Recommended layer: Lua initially.

## 2.3 ID Service

Two ID classes:

### Deterministic IDs
For authored/generated world entities. Conceptual form: `pack-id:entity-type:entity-key`.

Used for authored identities, organizations, documents, story events, location requirements, and content-pack assets.

### Generated IDs
For runtime/player-created state such as theories, player notes, unresolved questions, player-created threads, and runtime evidence instances that cannot map to deterministic world IDs.

Requirement: IDs are stable for the life of the save.

## 2.4 Relationship Store

Canonical store for all entity relationships.

Each relationship record conceptually contains:
- relationship ID
- source entity ID
- target entity ID
- relationship type
- status
- provenance
- active/outdated state
- metadata
- creation game-time
- optional confidence/relevance metadata
- optional originating evidence IDs

Example relationship types:
- FOUND_AT
- OWNED_BY
- MENTIONS
- OCCURRED_AT
- BEFORE
- AFTER
- SUPPORTS
- CONTRADICTS
- SAME_SOURCE
- METADATA_MATCH
- PLAYER_LINK
- AI_SUGGESTED
- POSSIBLY_SAME_PERSON
- SAME_PERSON

Per-entity adjacency/index tables are derived caches and rebuilt on load.

---

# 3. Internal event architecture

## 3.1 Boundary events

Vanilla PZ events are treated as external inputs. A thin adapter layer receives them and produces Conspiracy-Files events.

Desired boundary triggers include:
- world/save loaded;
- player created;
- player death;
- game-time progression;
- inventory item acquired;
- item inspected/read;
- building/room entered;
- chunk/cell loaded;
- item/container becoming available;
- notebook opened;
- save requested.

Exact PZ hooks must be verified during technical implementation.

## 3.2 Internal domain events

Examples:
- CF_WORLD_READY
- CF_INITIALIZATION_STARTED
- CF_INITIALIZATION_COMPLETE
- CF_INITIALIZATION_FAILED
- CF_LOCATION_REGISTERED
- CF_LOCATION_CONFIRMED
- CF_ASSET_PLACED
- CF_ASSET_DISCOVERED
- CF_EVIDENCE_MARKED_INTERESTING
- CF_EVIDENCE_DISCOVERED
- CF_EVIDENCE_CONTEXT_CHANGED
- CF_EVIDENCE_REINTERPRETED
- CF_RELATIONSHIP_ADDED
- CF_RELATIONSHIP_OUTDATED
- CF_IDENTITY_REFINED
- CF_ORGANIZATION_REFINED
- CF_EVENT_REFINED
- CF_MAJOR_DISCOVERY
- CF_THEORY_CREATED
- CF_THEORY_UPDATED
- CF_PLAYER_THREAD_CHANGED
- CF_JOURNAL_ENTRY_CREATED
- CF_ARCHIVE_STATE_CHANGED
- CF_AI_SUMMARY_REQUESTED
- CF_PLAYER_DIED

Domain events describe what happened, not how the UI should respond.

---

# 4. Canonical data model

## 4.1 Asset

Represents authored/generated world content.

Conceptual fields:
- asset ID
- content pack ID
- asset type
- template/version
- resolved variables
- display name
- injected text/description
- native item type
- story metadata
- related entity IDs
- eligible placement rules
- placement candidates
- chosen placement state
- world-age/timing rules
- anchor/fallback metadata
- discovery state

Asset types may include notebook, diary, letter, memo, report, map, photo, key, ID/badge, ordinary item, newspaper, flyer, package/container, or any other supported vanilla item type.

## 4.2 Evidence

Evidence is not identical to Asset. An authored letter is an Asset; the player's discovery of that letter in a particular context becomes Evidence.

Conceptual fields:
- evidence ID
- source asset/item/entity ID
- discovery time
- discovery location
- source container/context
- nearby-context snapshot
- character state
- world state
- original item metadata
- player note
- interesting flag
- current interpretation
- relevance metadata
- lifecycle state
- tracked physical-item reference if possible
- archive state
- major-discovery state
- last reinterpretation time

Original evidence facts are immutable. Interpretation may change.

## 4.3 Identity

Represents one encountered identity, not necessarily one biological person.

Fields include identity ID, current label, known attributes, role, alias/callsign information belonging to that identity, source history, and discovery/refinement state.

Two identities are never merged. Confirmed aliases are connected by SAME_PERSON.

## 4.4 Organization

Fields include organization ID, current display label, initially generic type, confirmed name if independently corroborated, associated identities/assets/events/locations, and source evidence.

Promotion from generic type to named organization requires multiple independent clues.

## 4.5 Location

Represents a story-relevant geographic place.

Fields include:
- location ID
- map/world identifier
- category
- exact world coordinates/bounds when known internally
- building/room/meta-grid references where available
- player-facing precision state
- landmark description
- confirmed building label
- discovery state
- candidate-placement suitability
- visited/confirmed state
- related entities/assets

Important distinction: the system may internally know exact coordinates while the player-facing model exposes only landmark-level knowledge.

## 4.6 Event

Fields include event ID, generic current label, date/time range if known, location relations, participants, organization relations, source evidence, and refinement state.

Events become more specific as evidence accumulates.

## 4.7 Theory

Player-created interpretation container.

Contains theory ID, player title, claim/body, selected evidence, supporting relationships, contradicting relationships, optional AI summary cache, and creation/update time.

Theories do not define world truth.

## 4.8 PlayerThread

Very lightweight graph grouping containing a thread ID, player-created name, and member node IDs. It has no completion state or authored quest semantics.

## 4.9 JournalEntry

Chronological projection record containing journal entry ID, created game-time, entry type, referenced entity/evidence IDs, rendered/current interpretation, update-marker state, major-discovery marker, and archive state.

New entries append. Updated entries remain in original chronological position.

---

# 5. Derived indexes and caches

Rebuilt on save load:
- ID → entity lookup
- entity type indexes
- relationship adjacency lists
- asset placement eligibility index
- location-category index
- evidence relevance index
- active/archived journal indexes
- graph visibility/index data
- search helper indexes
- unresolved location candidate indexes

Rule: if rebuilding a cache can change story truth, it is not a cache and must instead be persisted.

---

# 6. Persistence architecture

## 6.1 Canonical state to persist

Persist:
- world conspiracy definition;
- selected content pack and exact version;
- resolved template variables;
- world configuration;
- identities;
- organizations;
- locations;
- events;
- assets and placement states;
- canonical relationships;
- evidence/discovery state;
- evidence lifecycle;
- player notes;
- theories;
- unresolved questions;
- player threads;
- graph node positions;
- journal chronology;
- archive state;
- initialization status;
- migration-required/current version metadata.

Do not persist:
- UI widget instances;
- hover/selection state;
- graph adjacency cache;
- search indexes;
- temporary relevance calculations that can be reproduced deterministically;
- transient AI request state.

## 6.2 Save format

Recommendation: one Conspiracy-Files root save-state structure with explicit internal schema versioning even if user-facing compatibility requires exact core/pack versions.

Logical sections:
- header
- config
- pack
- world
- entities
- relationships
- evidence
- player
- journal
- graph
- initialization

Exact serialization mechanism remains implementation-dependent.

---

# 7. Content Pack architecture

Each content pack is isolated and self-contained.

A pack defines:
- manifest
- exact compatible Conspiracy-Files version
- story entities
- relationships
- asset templates
- placement requirements
- location categories
- timing rules
- anchor/fallback definitions
- narrative metadata
- AI-assisted development templates
- migration manifest where supported

Only one pack may be active per save. No pack-to-pack references, pack overrides, or mid-save pack switching.

---

# 8. Initialization pipeline

## Stage 0 — Eligibility

For a new world: normal initialization.

For retrofit into an existing save:
- calculate globally loaded vs never-loaded map chunks;
- require >90% never loaded;
- reject otherwise.

No conspiracy content may be injected into previously loaded chunks during retrofit.

## Stage 1 — Content Pack Load

- load selected pack;
- verify exact core compatibility;
- validate manifest;
- load authored entities/assets/relationships;
- reject broken schema/IDs/references.

## Stage 2 — World/Map Discovery

Build a Location Registry.

Goals:
- enumerate usable map geography;
- discover buildings/rooms/zones/meta-grid records;
- identify candidate categories such as police stations, bookstores, hospitals, warehouses, towers, offices, residences, etc.;
- include compatible map-mod geography when possible;
- derive stable location references.

This stage needs implementation-level validation against Build 42 metadata conventions.

## Stage 3 — Story Resolution

Resolve bounded world-specific variables:
- names;
- aliases;
- dates;
- codes;
- labels;
- selected document variants;
- supporting assets;
- investigation entry points.

Low randomness only.

Never randomize core conspiracy logic, canon-critical facts, major anchor relationships, or tone/thematic rules.

## Stage 4 — Candidate Assignment

For each required story location/asset:
- resolve category candidates;
- include exact authored locations where required;
- rank candidates by authored priority;
- account for start region/reachability;
- apply density and clustering constraints;
- preserve narrative exceptions;
- choose fallback candidates.

Do not necessarily instantiate physical items yet.

## Stage 5 — Validation

Validate:
- every required reference exists;
- every anchor has a reachable placement path;
- required location categories are satisfied;
- chosen locations are valid;
- timeline is coherent;
- aliases/organizations/events are internally consistent;
- critical fallbacks exist;
- story graph contains no broken required edges;
- retrofit placements are entirely in never-loaded chunks.

## Stage 6 — Retry

If invalid:
- regenerate affected resolved state;
- retry a small fixed number of times;
- avoid regenerating the PZ world itself.

If all retries fail:
- stop initialization;
- show short reason;
- offer manual retry;
- full terminal-style diagnostics available.

## Stage 7 — Commit

Only after successful validation:
- commit generated conspiracy model into canonical save state;
- freeze resolved world-specific variables;
- persist candidate/fallback assignment;
- mark initialization complete.

From this point the conspiracy is authoritative for the save.

---

# 9. Location Registry architecture

The Location Registry maintains two concepts.

## World Location
What exists physically in PZ: exact building, room, zone, object landmark, tower/site, custom-map location.

## Story Location
What a content pack requires, e.g. POLICE_STATION, BOOKSTORE, TRANSMISSION_SITE, HOSPITAL, WAREHOUSE, GOVERNMENT_OFFICE.

A resolver maps Story Location requirements onto World Locations. This avoids hard-coding every coordinate while still permitting exact authored locations.

## 9.1 Player arrival

Preferred behavior: event/state transition determines the player's current building/location and compares it with registered story locations.

Building targets confirm when the player enters the target building. Non-building targets such as towers likely require zone/object/radius detection. Exact technical hooks must be verified during implementation.

---

# 10. Deferred placement

Physical content should not all be spawned at initialization.

1. Story model chooses canonical placement candidate and fallback candidates.
2. Placement remains pending.
3. Relevant chunk/cell/container becomes available.
4. Placement subsystem verifies the location is still eligible.
5. Asset is injected using normal PZ item/content mechanisms.
6. Placement is recorded canonically.
7. Redundant unused anchors are invalidated/removed as required.

This fits the agreed hybrid initialization model.

---

# 11. Evidence lifecycle

Potential states:
- UNDISCOVERED
- DISCOVERED
- MARKED_INTERESTING
- ACTIVE
- ARCHIVED
- RESURFACED
- LOST_PHYSICAL
- RECOVERED_PHYSICAL

Interpretation has a separate lifecycle from evidence facts.

Discovery triggers include explicit interaction, acquiring authored clue item, reading native readable asset, Inspect action, or player manually marking an object interesting. No broad proximity auto-discovery.

On evidence creation, capture as much as technically available: game time, exact internal world location, player-facing known location, container/source, surrounding items, bodies/zombies, character state, profession/traits/skills, world state, original item metadata, player note, and structured environmental snapshot.

When new evidence changes interpretation:
- original evidence facts remain immutable;
- interpretation field updates;
- journal marks entry updated;
- existing old relationships are not deleted;
- invalidated relationships become OUTDATED;
- graph renders outdated links faded.

Major reinterpretation may be determined partly by number of affected relationships.

---

# 12. Relevance engine

The Relevance Engine derives connections from canonical evidence and metadata.

It may detect:
- shared person/name;
- shared organization;
- location match;
- date/time correspondence;
- code/serial match;
- source/container pattern;
- repeated object type;
- repeated wording/symbol;
- related events;
- authored cross-reference.

Output includes relevance explanations, relationship suggestions, and possible lead context.

System-derived relevance does not become world truth merely because it scores highly.

---

# 13. Journal / Survivor Notebook

Notebook is a view/controller over the canonical model and owns no independent story truth.

Sections:
- chronological journal
- evidence
- theories
- relationship graph
- archive
- help/reference

Behavior:
- opens by dedicated key;
- pause behavior configured inside notebook;
- remembers last page;
- remembers last selected object;
- new pages append;
- long entries paginate;
- archive appears as older notebook material;
- update marker expires based on in-game time;
- major discoveries get a dedicated marker.

UI principle: reuse vanilla PZ controls/list behaviors where practical. Use custom UI only where notebook/graph functionality requires it.

---

# 14. Inspect action

Native-first interaction rule: if vanilla PZ already supports reading/opening the asset, use vanilla behavior. If not, add `Inspect`.

Inspect may show:
- item details;
- injected narrative content physically perceivable on/in object;
- discovery context;
- player note;
- known graph connections;
- mark-as-interesting action.

Inspect must never reveal information the survivor could not legitimately perceive or know.

---

# 15. Relationship Graph

Graph is derived from entities, relationship store, player-created thread membership, and player manual layout.

Canonical player state persisted:
- node positions;
- thread names/membership.

Derived/rebuildable:
- edge lookup;
- visible cluster calculations;
- hover focus;
- rendered styling.

Behavior:
- new nodes placed near strongest related nodes in nearest open space;
- existing manual positions never auto-rearranged;
- hover node → dim unrelated links;
- click node → lock focus;
- outdated links remain but faded;
- relationship type controls line pattern/thickness/direction/color/icon as needed;
- link meaning appears on hover/select.

---

# 16. AI architecture

## 16.1 Development-time AI

Purpose: generate candidate content for human approval.

Can produce letters, diaries, reports, photograph descriptions, item names, bureaucratic documents, template variants, and dark-humor wording.

Output is not automatically canonical. Manual approval is required.

## 16.2 Initialization-time AI

Optional.

Purpose: resolve bounded world-specific narrative text/variables where templates permit it.

Inputs:
- approved template;
- allowed variables;
- generated world model;
- content-pack rules.

Restrictions:
- no new entities unless allowed by template schema;
- no changing core conspiracy logic;
- no changing canon-critical facts;
- output validated before commit.

If AI is unavailable, initialization should be able to use approved pre-generated/template fallback content unless a future pack explicitly requires AI. This exact fallback behavior remains subject to review.

## 16.3 Runtime AI

Player-invoked only.

Functions:
- current investigation summary;
- recent discovery summary;
- selected theory summary;

Inputs may include canonical evidence, current interpretations, player notes, theory state, journal history, and relevant character/game state.

Rules:
- never create authoritative world facts;
- never reveal undiscovered hidden state unless diagnostics mode is explicitly being used outside narrative;
- no omniscient truth;
- maintain 1990s knowledge boundary;
- maintain the approved in-character narrative voice.

Runtime AI output is narrative, not evidence.

---

# 17. AI Provider boundary

Provider credentials/configuration are global, outside the save. Save stores no API keys.

The core should call an abstract AI service interface rather than provider-specific code.

Conceptual operations:
- summarizeInvestigation(context)
- summarizeRecent(context)
- summarizeTheory(context)
- summarizeDeath(context)

Implementation may begin in Lua if feasible. Move to Java/ZombieBuddy only if vanilla networking is insufficient, JSON/schema handling becomes too fragile, or provider communication becomes a demonstrated maintenance problem.

---

# 18. Diagnostics

Dedicated key opens read-only 1990s terminal-style diagnostics.

May expose full internal state:
- initialization stages;
- location registry results;
- candidate selection;
- chosen story locations;
- anchor/fallback choices;
- validation;
- retry history;
- content-pack details;
- compatibility notes;
- hidden entities;
- relationships;
- internal IDs;
- placement state.

Diagnostics must not mutate save state.

---

# 19. Archiving

Journal material archives after a module-defined in-game time threshold. Archive state is canonical.

If new evidence makes archived material relevant, automatically reactivate/resurface it. The relevance engine may trigger resurface events.

---

# 20. Existing-save retrofit

Retrofit is a special initialization mode.

Requirements:
- >90% of all map chunks globally must remain never loaded;
- zero conspiracy injection into already-loaded chunks;
- selected pack must have enough untouched placement candidates;
- otherwise initialization fails.

Once validated, the conspiracy overlay is generated against untouched world only.

---

# 21. Migration

Migration only occurs with:
- explicit player confirmation;
- exact compatible target core version;
- matching target content-pack version;
- explicit migration manifest.

Migration must preserve journal, evidence, context, graph, graph positions, player threads, notes, theories, unresolved questions, and active content-pack identity.

On failure: abort and leave existing save untouched.

No migration history is retained after success.

---

# 22. Lua vs ZombieBuddy responsibility matrix

## Lua by default

Recommended Lua ownership:
- bootstrap;
- content-pack load;
- canonical model;
- relationships;
- evidence logic;
- journal;
- graph;
- theories;
- player notes;
- archive;
- configuration;
- normal PZ event adapters;
- location confirmation;
- item Inspect behavior;
- native literature/item integration;
- save/load orchestration;
- diagnostics UI.

## ZombieBuddy/Java only if justified

Candidate uses:
1. missing API access;
2. world/location scanning performance if initialization scans are demonstrably too expensive in Lua;
3. complex structured persistence if canonical save serialization/validation becomes unsafe or unmaintainable in Lua;
4. precise required game hooks if no exposed Lua event exists and polling would otherwise be necessary.

Not a default justification: “Java is nicer,” ordinary UI, ordinary evidence logic, simple item hooks, or runtime AI by itself unless networking/data handling proves inadequate.

ZombieBuddy remains a conditional dependency, not an architectural prerequisite.

---

# 23. Performance rules

Never:
- scan the full map every frame;
- recompute the full graph every tick;
- continuously compare all evidence pairs;
- continuously call AI;
- repeatedly serialize full state unnecessarily.

Preferred work scheduling:

### Once per initialization
- location registry scan;
- story resolution;
- candidate selection;
- full validation.

### Once per relevant chunk/cell availability
- check pending placements relevant to that region.

### Once per evidence event
- capture context;
- update relevant local relationships;
- update journal;
- invalidate affected derived caches.

### On notebook open
- rebuild/refresh stale projections.

### On explicit AI request
- construct bounded narrative context and call provider.

### On save
- serialize canonical dirty state.

---

# 24. Failure isolation

A subsystem failure should not corrupt canonical state.

Rules:
- perform validation before committing generated world state;
- use staged initialization;
- only write canonical placement state after successful injection;
- migration is transactional;
- runtime AI failure never changes evidence state;
- notebook/graph rendering failure never changes conspiracy truth;
- derived caches may always be discarded and rebuilt.

---

# 25. Technical risks requiring explicit PZ verification

These must be proven before implementation architecture is considered final:

1. **Location categorization** — how reliably can Build 42 map metadata distinguish police stations, bookstores, towers, hospitals, etc.?
2. **Transmission towers / non-building landmarks** — determine sprite, object, zone, or map metadata strategy.
3. **Never-loaded chunk detection** — confirm reliable API/save metadata for global loaded/unloaded chunk history.
4. **Deferred container/item injection** — identify the safest event/hook for placing an authored item exactly once.
5. **Persistent physical item identity** — determine whether unique evidence instance identity survives all inventory/container/world transitions.
6. **Full map registry cost** — benchmark scanning map/meta-grid metadata during initialization.
7. **Save persistence limits** — confirm appropriate Build 42 mechanism and practical state-size limits.
8. **Item text mutation** — verify behavior of name/description/page-text injection across desired asset types.
9. **Map-mod discovery** — confirm how added map areas appear in the meta-grid and how stable their identifiers are.
10. **Runtime HTTP/provider communication** — confirm whether vanilla Lua/exposed APIs are sufficient before introducing Java.

---

# 26. Proposed source/module structure

Conceptual only:

```text
ConspiracyFiles/
  core/          Bootstrap, EventBus, IDs, Config
  model/         ConspiracyModel, Entities, Relationships
  persistence/   SaveState, Migration
  content/       PackLoader, Templates, Validation
  world/         LocationRegistry, Placement, WorldEligibility
  evidence/      Discovery, Tracking, ContextCapture, Relevance, Interpretation
  journal/       JournalProjection, Archive
  graph/         GraphProjection, GraphLayout
  ai/            AIService, ContextBuilder
  ui/            Notebook, Inspect, Help, Diagnostics
  integration/   PZEvents, Inventory, Literature, Map, OptionalJavaBridge
```

This is a logical architecture, not a required physical file layout.

---

# 27. Recommended implementation order

## Architecture proof stage
Before feature implementation:
1. prove persistence;
2. prove internal event bus;
3. prove vanilla Build 42 location registry;
4. prove building-entry confirmation;
5. prove exact-once deferred placement;
6. prove evidence item identity/persistence;
7. prove native-style Inspect;
8. prove notebook persistence;
9. prove graph persistence/manual positions;
10. decide whether any of these genuinely requires ZombieBuddy.

## Core implementation stage
1. canonical model;
2. persistence;
3. pack loader;
4. initialization validator;
5. location registry;
6. asset placement;
7. evidence capture;
8. journal;
9. relationships/relevance;
10. graph;
11. theories/threads;
12. archiving;
13. diagnostics;
14. AI service;
15. migration.

---

# 28. Architecture acceptance criteria

Architecture is ready for implementation only when we can demonstrate or document:
- one canonical source of truth;
- deterministic entity identity;
- stable relationship model;
- safe save/load;
- no dependence on UI state for story truth;
- initialization can fail without corrupting the save;
- critical assets have validated placement paths;
- no placement occurs twice accidentally;
- player arrival at registered locations can be detected reliably;
- evidence facts cannot be silently overwritten by interpretation;
- graph can rebuild from canonical state;
- runtime AI failure cannot damage investigation state;
- existing-save retrofit can reliably identify never-loaded world;
- optional Java boundary is narrow and justified by measured need.

---

# 29. Current recommendation

Proceed with a **Lua-first modular monolith**.

Meaning:
- one mod;
- one authoritative Lua domain model;
- clearly separated subsystems;
- an internal event bus;
- derived notebook/graph projections;
- canonical persistence;
- optional narrow Java bridge behind an interface.

Do not begin with microservices, multiple databases, a Java-first domain core, or widespread bytecode patching.

The architecture should remain capable of introducing ZombieBuddy later without requiring the domain model to change.
