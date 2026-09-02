# Conspiracy-Files — Decision Log

This is the detailed discovery record. Question numbers refer to the discovery passes.

---

# Phase 1 — Product / Client Discovery (26 questions)

| Q | Decision |
|---|---|
| 1 | Core idea: Investigation/Mystery + Quest/Objectives + Roleplay/Narrative + Hidden-world/Conspiracy. |
| 2 | Main gap: lack of mystery. |
| 3 | Primary audience: solo player. |
| 4 | Desired capabilities: all listed capabilities, with emphasis on searching clues, collecting evidence, following investigation chains, and maintaining an investigation record. |
| 5 | Player journey: early-game hook, gradual escalation, open-ended investigation, multiple entry points. |
| 6 | No conventional ending. Like base PZ, the story ends when the player dies, probably without finding the truth. |
| 7 | Systemic integration with existing vanilla survival systems rather than replacing them. |
| 8 | Integrate with all listed vanilla systems: loot, traits/professions, skills, radio/TV, maps, vehicles, electricity, zombies, buildings, crafting, timed actions, weather/time, mood/needs, readable media, world age. |
| 9 | Minimal intrusion principle: integrate broadly but avoid rewriting core vanilla mechanics unless necessary. |
| 10 | Information delivery: physical documents, maps/annotations, lightweight UI notifications, with the player journal/investigation log as the primary channel. |
| 11 | Moderately guided + subtle. After a long inactivity period, clearer reminders are useful. |
| 12 | Difficulty: low artificial friction; resource-, skill-, and knowledge-gated where appropriate; survival itself remains the primary difficulty. |
| 13 | Access: skills, specific items, locations, world age; primarily soft requirements rather than hard gates. |
| 14 | Profession-, skill-, and trait-specific observations/interpretations. |
| 15 | Moderate replay variation, different entry points, multiple plausible interpretations, no definitive truth. |
| 16 | Solo-first; multiplayer can be addressed later. |
| 17 | Strongly defined default experience plus advanced configuration for narrative intensity, discovery assistance, randomization, etc.; later refined to configurable PZ-style options rather than a sacred default. |
| 18 | High mod compatibility priority, especially custom maps, UI mods, trait/profession mods, explicit compatibility testing, and extension points. |
| 19 | Target Project Zomboid Build 42 only. |
| 20 | Assets: text content, custom investigation UI, localization readiness, reuse vanilla assets wherever possible. |
| 21 | Tone: grounded conspiracy thriller + government/military + scientific themes + heavy dark comedy/bureaucratic absurdity. |
| 22 | Strict canon compatibility, never confirm the Knox Event's true cause, historically grounded in the 1990s. |
| 23 | No conventional first release; “never finished” PZ-style philosophy. Long-term target includes all listed capabilities. |
| 24 | Nothing in the evolving target list is considered optional; prioritization is sequencing, not exclusion. |
| 25 | All proposed boundaries are out of scope: replacing core PZ gameplay, linear quest game, definitive Knox explanation, heavy custom-map/assets dependence, multiplayer-first systems, combat/zombie AI overhaul, anachronism, confirmed supernatural truth, canon contradiction. |
| 26 | Success is determined solely by the project owner; no external market/community success criterion. |

---

# Phase 2 — Module Capability & Player Requirements

## Journal, evidence, AI, theories

| Q | Decision |
|---|---|
| 1 | Journal role: active investigation tool + memory aid + narrative archive + character-aware notebook. AI storytelling is part of the module. |
| 2 | AI: narrate discoveries, summarize investigation history, write in-character journal material, but never invent factual world state. AI also pre-generates approved asset text during development and may generate dynamic descriptions from verified in-game data. |
| 3 | Any listed thing may be a clue: documents, printed media, maps, objects, environment, corpses/zombies, broadcasts, vehicles, character observations, timed events, relationships between ordinary facts, player-created observations. |
| 4 | Clues enter mainly through manual capture plus delayed interpretation. Player can mark acquired objects/facts as interesting. |
| 5 | Player-marked evidence supports bookmark, note, tags, manual links, automatic context, persistent identity, theory grouping, and AI commentary. |
| 6 | Evidence identity/persistence: all desired tracking features if technically possible, including movement, loss/destruction, recovery, and preservation after object loss. |
| 7 | Capture all listed context: time, location, source, nearby items/bodies, player condition, character identity, world state, metadata, player note, structured snapshot. |
| 8 | Evidence connections: system-suggested + AI-suggested. |
| 9 | Theories: evidence bundles + structured hypothesis + AI summary + competing theories + theory evolution; theory history is a later extension. |
| 10 | Leads: evidence-backed, possible next action, possible location, possible object/item. |
| 11 | Lead guidance: subtle, context-sensitive, stronger after long breaks, player-configurable hint level, never quest-marker language. |
| 12 | All listed events may trigger journal updates. |
| 13 | Runtime AI narration is on-demand only; AI also pre-generates contextual world assets ahead of time. |
| 14 | Pre-generated documents: template variants, context pools, linked document chains, 1990s authenticity, dark bureaucratic humor. |
| 15 | Document placement: contextual loot injection, character/corpse association, world-age dependence, linked chains, rare accidental discoveries, guaranteed anchors. |
| 16 | Critical anchors: always spawn somewhere valid; redundant candidates exist but unused alternatives are removed/invalidated once one is found; fallback generation allowed before discovery; discovered knowledge persists; no thread depends on one fragile object. |
| 17 | Ordinary suspicious items: preserve player suspicion; later metadata matching may create objective connections. |
| 18 | Clue importance: system-derived relevance. |
| 19 | Relevance must be explainable to the player. |
| 20 | Primary browsing interface: relationship graph. |
| 21 | Graph supports all node types, with contextual filtering. |
| 22 | Graph supports all relationship types, with visible provenance for each relationship. |
| 23 | Graph evolves continuously, keeps historical states, and uncertain links may disappear when contradicted. |
| 24 | Graph history: automatic snapshots. |
| 25 | Primary graph-node direct action: mark as interesting. |
| 26 | No authored false leads; every authored clue ultimately matters. |
| 27 | Discovering clues does not directly alter the game world. |
| 28 | On death everything ends with the character. |
| 30 | AI may read, summarize, suggest from, challenge, but never overwrite player notes; notes remain subjective unless corroborated. |
| 31 | Generated text: strict fact boundary, speculation framed as uncertainty, character-limited knowledge, no omniscience, contradictions allowed, canon protected, 1990s knowledge boundary. |
| 32 | Every AI-generated asset requires manual approval before inclusion. |
| 33 | Approved text assets are versioned content. |
| 34 | Existing saves always use newest asset version. |
| 35 | Revised clue/text asset replaces previous version immediately. |
| 36 | Journal discovery ordering: chronological. |
| 37 | Unresolved questions are simple freeform questions. |
| 38 | Unresolved questions are created by manual text entry only. |
| 39 | Clue discovery from gameplay: explicit interaction, inventory acquisition, world timing. |
| 40 | Inventory-acquired clue: immediate recognition/logging. |
| 41 | World timing may use a combination of date gates, phases, events, disappearance, replacement, and contextual change. |
| 42 | Timing rules are completely hidden from the player. |
| 43 | Missed time-sensitive clues are reintroduced later. |
| 44 | Reintroduction uses the same clue in a new opportunity. |
| 45 | Reintroduced clue has a delay before resurfacing. |
| 46 | Clue rarity uses a mix of common/rare, contextual/dynamic, and authored placement approaches. |
| 47 | Clue density is player-configurable. |
| 48 | Density settings may control overall frequency, clue type, conspiracy depth, world phase, location type, rarity tier, and presets. |
| 49 | No sacred default experience; later clarified that usable defaults still exist. |
| 50 | All major configuration dimensions are exposed, with preconfigured defaults in the module’s PZ configuration page. |
| 51 | Configuration cannot be changed for an existing save. |
| 52 | Configuration is chosen at world creation. |
| 53 | AI provider/API configuration is global, outside the save. |
| 54 | If runtime AI is unavailable, use pre-generated summaries where possible and disable AI controls gracefully. |
| 55 | No gameplay requirement for invoking runtime AI if configured. |
| 56 | Runtime AI is accessible from both journal and relationship graph. |
| 57 | Runtime AI can summarize current investigation, recent discoveries, and selected theory. |
| 58 | AI summary voice: in-character survivor, funny and irreverent. |
| 59 | Humor is always present, even for grim discoveries. |
| 60 | Journal onboarding: light onboarding. |
| 61 | Onboarding covers all listed major features. |
| 62 | Onboarding delivery: one-time popups. |
| 63 | Popups can be dismissed permanently after first view. |
| 64 | Help is later accessible via a key binding. |
| 65 | Help key opens a compact help overlay. |
| 66 | Help overlay includes all major controls/concepts. |
| 67 | Player notes: general freeform + evidence-attached + theory-attached. |
| 68 | Evidence-attached notes stay with evidence; theory notes stay in theory view. |
| 69 | Normal journal presentation does not visually distinguish facts/player interpretation/AI text. |
| 70 | Full provenance is still tracked internally. |
| 71 | No special visible/mechanical AI weighting by provenance; AI still cannot invent/contradict verified state. |
| 72 | Duplicates are retained if their context differs. |
| 73 | Duplicate context compares location, time, source/container, nearby environment, and character state. |
| 74 | Large investigations: automatically archive old material. |
| 75 | Archiving is time-based. |
| 76 | Archived material automatically returns to active view if relevant again. |
| 77 | Archive threshold is fixed by the module. |
| 78 | Archive threshold uses in-game time. |
| 79 | Core player requirements: curiosity, pattern recognition, patience, survival competence. |
| 80 | Exhaustive investigation is moderately rewarded. |
| 81 | Progression is purely emergent. |
| 82 | The module never tells the player they completed a case/mystery/objective. |
| 83 | Major discoveries are emphasized in the journal. |
| 84 | Major discovery emphasis uses a dedicated marker. |
| 85 | Major-discovery status may combine connectivity, theory impact, important entity/event revelation, question resolution, and authored importance. |
| 86 | A clue may belong to multiple conspiracy threads. |
| 87 | Visible thread names are created by the player. |
| 88 | A player-created thread contains only a custom name; intentionally lightweight. |
| 89 | Thread names affect graph by visual grouping only. |
| 90 | Nodes are assigned to threads manually only. |
| 91 | A node may belong to multiple threads. |
| 92 | Thread grouping: boxes/regions around grouped nodes + floating thread label; collapse may be future enhancement. |
| 93 | Multi-thread membership shown with badges/labels on the node. |
| 94 | Thread membership removal is manual only. |
| 95 | Deleting a thread removes grouping only, not underlying content. |

## Locations, identities, graph behavior

| Q | Decision |
|---|---|
| 96 | Graph locations are exact building/location nodes. |
| 97 | Location precision starts with nearby-landmark context and gets closer/more precise over time. |
| 98 | Location becomes more precise through physical exploration. |
| 99 | Imprecise location is represented as a landmark description. |
| 100 | Location is confirmed when player enters the building. |
| 101 | On confirmation, vague description is replaced by exact building. |
| 102 | People/identities use progressive identity. |
| 103 | Any listed evidence type may refine identity. |
| 104 | Organizations initially appear as generic type only. |
| 105 | Specific organization identity requires multiple independent clues agreeing. |
| 106 | Events initially appear as generic event labels. |
| 107 | Any listed evidence route may make an event more specific. |
| 108 | Contradictory clues are both preserved; conflicts are part of the conspiracy. |
| 109 | The module never automatically explains why clues conflict. |
| 110 | Duplicate names stay separate until proven; people may have multiple identities. |
| 111 | Alias suspicion is player-only. |
| 112 | Alias suspicion is expressed with a manual “possibly same person” link. |
| 113 | Identity nodes are never merged, even for confirmed aliases. |
| 114 | Confirmed aliases use an explicit “Same person” link. |
| 115 | Identity history preserves source history. |
| 116 | Source history is shown in an expandable provenance panel. |
| 117 | When meaning changes, replace old interpretation with the new one. |
| 118 | Original underlying evidence remains unchanged. |
| 119 | Updated interpretation gets an “updated” marker. |
| 120 | Updated status clears after in-game time. |
| 121 | Duration is context-dependent. |
| 122 | Major/minor reinterpretation is determined by number of affected graph connections. |
| 123 | Reinterpretation does not remove old graph links; old links remain but are outdated. |
| 124 | Outdated links appear faded/dimmed. |
| 125 | Major discoveries do not rearrange graph; user may rearrange manually. |
| 126 | Manual graph arrangement persists for entire save. |
| 127 | New nodes auto-place in nearest open space. |
| 128 | Auto-placement favors proximity to related nodes. |
| 129 | Relationship types use different line styles. |
| 130 | Styles may combine pattern, thickness, direction, color, and icons. |
| 131 | Link meaning appears on hover/select. |
| 132 | In dense clusters, temporarily dim unrelated links. |
| 133 | Dimming is triggered by hovering a node. |
| 134 | Only unrelated links dim; unrelated nodes remain visible. |
| 135 | Selecting a node locks graph focus. |
| 136 | Outdated links remain visible but faded during focus. |

## Notebook, asset interaction, UI

| Q | Decision |
|---|---|
| 137 | Evidence attachments: related documents in a normal PZ-style list view. |
| 138 | Use same list behaviors/options as vanilla game wherever possible. |
| 139 | Hybrid UI: vanilla conventions for ordinary lists/records; custom UI only for graph/theory-specific needs. |
| 140 | Journal is presented like a survivor notebook. |
| 141 | Notebook visual style: minimal decoration, clean and readable. |
| 142 | Notebook opens via dedicated key binding. |
| 143 | Whether notebook pauses game is player-configurable. |
| 144 | Pause option is configured inside the notebook. |
| 145 | Notebook remembers last open page + last selected evidence/theory/node. |
| 146 | Notebook contains all major sections: journal, evidence, theories, graph, archive, help/reference. |
| 147 | Sections may combine physical dividers/tabs, bookmarks, page-turn navigation, and vanilla controls styled as notebook UI. |
| 148 | Archive feels like older notebook pages deeper in the same notebook. |
| 149 | Newest page is appended at the end. |
| 150 | Updated pages stay in original chronological position. |
| 151 | Long entries continue across multiple pages automatically. |
| 152 | Native-first asset interaction: use vanilla read/open behavior where it exists; notebook references the original evidence rather than copying full documents into notebook pages. |
| 153 | Custom action for non-readable evidence is named `Inspect`. |
| 154 | Inspect shows all: basic details, discovery context, player note, related graph connections, mark-as-interesting action. |
| 155 | Inspect never reveals unknowable information, but may show legitimate module-injected text/content. |
| 156 | Any technically viable vanilla asset type may carry injected conspiracy content. |
| 157 | Injected content: AI-generated during development then approved + template-driven. |
| 158 | Templates may vary all listed fields: names/aliases, dates/times, locations, organizations/codes, item IDs, bounded wording, humor/tone, cross-references. |
| 159 | Template resolution happens during development and at world creation, with AI assistance. |
| 160 | At world creation fix identity graph, document variants, names/dates/codes, placement candidates, cross-references, hidden thread structure. |
| 161 | World-generation randomness is low. |
| 162 | Limited randomness may vary placement, names/aliases, dates/codes, supporting documents, wording/tone, entry points. |
| 163 | Never randomize core conspiracy logic, canon-critical facts, major anchor relationships, tone/thematic rules. |

## Initialization, geography, existing saves

| Q | Decision |
|---|---|
| 164 | Validate all: clue reachability, references, location validity, identity consistency, timeline consistency, redundancy. |
| 165 | If validation fails, regenerate automatically. |
| 166 | Use a fixed small retry count; exact strategy must follow Build 42 world/chunk research. |
| 167 | Hybrid initialization: conspiracy model up front, physical placement later as chunks/containers become available. |
| 168 | Deferred placement uses a combination of first-valid, weighted, priority, distance-aware, and world-state-aware logic. |
| 169 | Prevent clustering using combined spacing, per-building caps, area caps, thread-aware distribution, with narrative exceptions. |
| 170 | Story location selection: hybrid category-driven + exact authored locations, player-region aware. Initialization may take longer to improve consistency. |
| 171 | Initialization prioritizes complete location registry, story consistency, reachability, location diversity, map-mod awareness, fallback planning. |
| 172 | Initialization UI: 1990s computer-program style, little detail by default, more-details button. |
| 173 | If initialization takes long, keep running with status updates; do not skip validation. |
| 174 | If retries fail, show an error and offer manual retry. |
| 175 | Failure screen shows short reason + full diagnostics option. |
| 176 | Full diagnostics use 1990s terminal style. |
| 177 | Diagnostics include all listed stages/results/validation/retries/fallback/map compatibility details. |
| 178 | Diagnostics remain available after successful initialization, read-only. |
| 179 | Successful-run diagnostics accessible by dedicated key binding. |
| 180 | Diagnostics available in normal play. |
| 181 | Diagnostics may expose full hidden internal conspiracy state. |
| 182 | Diagnostics remain read-only. |
| 183 | External data-driven content packs supported. |
| 184 | Packs may define all listed content/story data and AI pre-generation templates. |
| 185 | Content packs are completely isolated from each other. |
| 186 | Only one content pack active per save. |
| 187 | Pack selected manually at world creation/start. |
| 188 | Revised: pack switching is only possible at start; mid-journey switching is not allowed. |
| 189 | If active pack becomes missing/invalid mid-save, block Conspiracy-Files from loading and show error. |
| 190 | Content packs use strict core-version requirement. |
| 191 | Exact version match only. |
| 192 | Existing-save migration is player-selected. |
| 193 | Migration preserves all investigation state. |
| 194 | Migration failure aborts safely, leaving existing save untouched. |
| 195 | Supported migration is presented with a simple prompt. |
| 196 | Core and content pack migrate together. |
| 197 | Migration availability is defined by explicit migration manifest. |
| 198 | Migration history is not tracked after success. |
| 199 | Conspiracy-Files may be added to an existing save. |
| 200 | For retrofit, critical placement uses only unloaded/unvisited space; refined later to never-loaded chunks. |
| 201 | Safe critical placement signal: chunk never loaded. |
| 202 | Never inject any conspiracy content into already-loaded chunks during retrofit. |
| 203 | If too little unexplored world remains, initialization fails. |
| 204 | “Enough” unexplored world initially framed as minimum valid untouched locations. |
| 205 | Refined threshold: retrofit requires more than 90% of map unopened/unloaded. |
| 206 | Measure that threshold globally across all map chunks. |
| 207 | >90% threshold is hard-coded. |

## Return to main features

| Q | Decision |
|---|---|
| 208 | Main loop: survive normally; investigate opportunistically. |
| 209 | Any of the listed things may pull player deeper: strange item, specific document reference, recurring entity/symbol, unusual location, converging clues, old suspicion gaining support. |
| 210 | If no meaningful discovery happened during normal play, journal does nothing. |
| 211 | Clues may attract attention through any combination of unusual context, distinctive naming, injected description, readable content, or repeated pattern. |
| 212 | Clue obviousness may vary; combination of obvious, subtle, and context-dependent. |
| 213 | Ordinary-but-suspicious objects may combine vanilla appearance/name, subtle renamed variants, Inspect detail, and delayed significance. |
| 214 | When an ordinary object becomes significant later, update journal only. |
| 215 | Player learns this through an updated marker in the journal. |
| 216 | Major discoveries may combine clearer interpretations, new possible locations/items, more specific identities/events, and increased relevance of old evidence. |
| 217 | New leads are pursued through normal travel, map/landmark clues, item references, and recurring entities. |
| 218 | Ignored leads remain untouched indefinitely until the player chooses to follow them. |

---

# Phase 3 — Architecture Decisions

| Q | Decision |
|---|---|
| 1 | Core implementation philosophy: vanilla Lua first. Use normal PZ Lua/events/exposed Java APIs wherever sufficient. |
| 2 | ZombieBuddy/Java is justified for missing API access, demonstrated Lua performance bottlenecks, or persistence/data-processing complexity. External AI communication alone is not an automatic reason to use Java. |
| 3 | Source of truth: one authoritative core conspiracy model with notebook, graph, archive, diagnostics, and UI as derived views. |
| 4 | Persistence strategy: minimal canonical state plus rebuildable indexes/caches. |
| 5 | Canonical persistent state includes world conspiracy model, discovery state, player-authored state, evidence lifecycle, graph layout, journal chronology, and version/configuration state. |
| 6 | Internal model: typed entity collections plus a separate relationship store. |
| 7 | IDs: deterministic for authored entities; generated for runtime/player-created entities. |
| 8 | Relationships: central canonical relationship table plus rebuildable per-entity indexes. |
| 9 | Model propagation: domain events for meaningful changes, with view rebuild/refresh on open as a safety net. |
| 10 | Event boundary: vanilla PZ events at the edge, internal Conspiracy-Files domain events inside. |

---

# Pending / unresolved

The previous story-focused Question 219 was intentionally not answered. Architecture is now being handled as a system proposal rather than further one-question-at-a-time discovery.

Current next focus:
1. review/refine `docs/architecture/ARCHITECTURE_PROPOSAL.md`,
2. verify Build 42 technical assumptions,
3. prove persistence, location registry, building-entry detection, deferred placement, item identity, Inspect integration, notebook persistence, and graph persistence,
4. decide the narrowest possible ZombieBuddy boundary only after those proofs.
