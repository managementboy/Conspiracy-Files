# Conspiracy-Files — Project State

Status: Planning / architecture proposal under review.
Target game: Project Zomboid Build 42.
Development phase: No implementation code yet.
Repository: `managementboy/Conspiracy-Files`.

## How to use this file

This is the bootstrap document for a new chat, Codex session, or development handoff.

1. Treat this file, `DECISIONS.md`, and the current architecture documents as authoritative project memory.
2. Do not reopen settled decisions unless a contradiction, technical limitation, or explicit design change is discovered.
3. Preserve the core design philosophy: Conspiracy-Files layers mystery and investigation onto ordinary Project Zomboid survival instead of turning the game into a quest game.
4. Before implementation, validate technical assumptions against the current Project Zomboid Build 42 modding API and world/map behavior.
5. GitHub is now the long-term source of truth for project continuity.

## Core product vision

Conspiracy-Files is a solo-first Project Zomboid Build 42 investigation/conspiracy module combining:
- investigation and mystery,
- emergent objectives/leads,
- roleplay/narrative,
- hidden-world/conspiracy storytelling.

The primary gap addressed is lack of mystery. The conspiracy is not meant to be solved cleanly. The character will usually die without learning the full truth, consistent with Project Zomboid's core philosophy.

The module should integrate deeply with vanilla systems while minimally intruding on or rewriting core mechanics.

## Core experience principles

- Solo player is the design target.
- The only success criterion is whether the project owner considers the experience good.
- Survival remains the main game loop; investigation happens opportunistically during normal play.
- No formal case completion, chapter completion, progress bar, or final truth.
- No deliberate false leads: authored clues ultimately matter, even if their meaning remains ambiguous.
- Contradictions remain unresolved and are part of the conspiracy.
- Canon-compatible with Project Zomboid and grounded in 1990s technology/culture.
- Government/military and scientific conspiracy themes with heavy dark bureaucratic humor.
- AI may narrate and interpret verified state but must not invent factual world state.
- AI is also used during development to pre-generate approved text assets and templates.
- Runtime AI is player-invoked.
- The investigation ends with character death; an AI-generated final summary/epilogue may be produced, but no hidden truth is revealed.

## Primary player-facing systems

### Survivor notebook
A dedicated-key notebook that feels like a survivor's personal notebook, with minimal decoration and vanilla-style interaction patterns where possible.

Sections include:
- chronological journal,
- evidence,
- theories,
- relationship graph,
- archive,
- help/reference.

New entries append at the end. Long entries flow across pages. Updated entries stay in their original chronological position.

### Evidence
The player can manually mark ordinary acquired objects/facts as interesting. Evidence can preserve:
- exact item identity where technically possible,
- discovery date/time,
- location,
- source/container,
- nearby objects/corpses/zombies,
- player condition,
- character profession/traits/skills,
- world state,
- original item metadata,
- player note,
- structured context snapshot.

### Theories
Theories are evidence bundles with:
- a claim,
- supporting evidence,
- contradicting evidence,
- AI-assisted summary,
- competing theories,
- evolving interpretations.

### Relationship graph
The graph may contain:
- evidence,
- documents,
- locations,
- identities,
- organizations,
- events,
- theories,
- player notes,
- broadcasts,
- vehicles/special objects.

Relationships include factual, system-derived, player-created, and AI-suggested connections. Relationship provenance is internally preserved.

Manual graph layout persists for the whole save. New nodes auto-place near related nodes. Hovering a node dims unrelated links; selecting a node locks focus.

### Locations
Locations progress from vague landmark descriptions toward precise confirmation through physical exploration. A location becomes confirmed when the player enters the relevant building.

Stories may use category-discovered real map locations and exact authored locations. Initialization should build a location registry from the PZ map/meta-grid where technically possible.

### Assets
Use native Project Zomboid interactions whenever an asset already has one. For non-readable/non-openable evidence, add a vanilla-style `Inspect` action.

Injected conspiracy content may be attached to any viable vanilla asset type, including notebooks/diaries, letters/notes/mail, reports/memos, photos, keys, maps, IDs/badges/business cards, ordinary objects, newspapers/pamphlets/flyers, and containers/packages.

Asset text is AI-assisted during development, manually approved, then stored as versioned template-driven content.

## Initialization philosophy

Quality of initialized data is more important than fast startup.

Hybrid strategy:
- build the world-specific conspiracy model up front,
- resolve some physical placements later when relevant chunks/containers are available.

Initialization should:
- build a location registry,
- validate story consistency,
- balance reachability,
- ensure location-category diversity,
- account for compatible map mods,
- preselect fallbacks,
- validate clue reachability, references, locations, identities, timeline, and redundancy.

If validation fails, retry a fixed small number of times. If still invalid, show an error with a short reason and allow manual retry.

Initialization UI should look like a 1990s computer program: sparse status by default, detailed terminal-style diagnostics on demand.

Diagnostics remain available in normal play via a dedicated key and are read-only. They may expose full internal conspiracy state.

## Existing-save retrofit

Conspiracy-Files may initialize on an existing save only if:
- more than 90% of the entire map remains never-loaded,
- all new clue injection is restricted to never-loaded chunks,
- there is sufficient untouched space for the conspiracy.

Otherwise initialization fails.

## Content packs

- Data-driven external content packs are supported.
- Only one content pack can be active per save.
- Pack is selected manually at world creation/initialization.
- Packs are isolated and cannot depend on or reference each other.
- Packs can define supported story assets, entities, rules, locations, links, timing, anchors, fallbacks, and AI pre-generation templates.
- Pack/core compatibility is exact-version only.
- Mid-save pack switching is not allowed.
- Missing/invalid active pack blocks Conspiracy-Files from loading.
- Core and pack migrate together.
- Migration is player-selected, must be explicitly declared, and must preserve all investigation state.
- Failed migration aborts safely and leaves the save untouched.

## Architecture direction

Current approved architecture principles:
- vanilla Project Zomboid Lua first;
- ZombieBuddy/Java only for missing API access, demonstrated performance bottlenecks, or persistence/data-processing complexity;
- one authoritative conspiracy model with notebook/graph/UI as derived views;
- minimal canonical persistence with rebuildable indexes/caches;
- typed entity collections plus a separate canonical relationship store;
- deterministic IDs for authored entities and generated IDs for runtime/player-created entities;
- central relationship table with rebuildable per-entity indexes;
- domain-event propagation with UI refresh/rebuild as a safety net;
- vanilla PZ events at the boundary and internal Conspiracy-Files domain events inside.

See `docs/architecture/ARCHITECTURE_PROPOSAL.md` for the current full proposal.

## Next planning work

Review and refine the architecture proposal, then produce technical proof/spec documents for:
1. Build 42 persistence,
2. map/meta-grid location registry,
3. player building/location arrival detection,
4. exact-once deferred item placement,
5. persistent evidence item identity,
6. native-style Inspect integration,
7. notebook persistence,
8. relationship graph persistence,
9. runtime AI/network boundary,
10. the exact point, if any, where ZombieBuddy becomes necessary.
