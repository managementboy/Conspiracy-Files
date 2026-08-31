# Conspiracy-Files — Current Decision Index

This file contains the **current** project decisions. The complete original discovery record is preserved in [`DECISIONS_BASELINE.md`](DECISIONS_BASELINE.md). Engineering-review corrections are also preserved in [`DECISIONS_SUPERSESSIONS_2026-08-30.md`](DECISIONS_SUPERSESSIONS_2026-08-30.md).

If a spike disproves a decision, technical reality wins: supersede the decision explicitly and link the spike result.

## Product decisions

| ID | Current decision | Rationale |
|---|---|---|
| P1-Q1 | Conspiracy-Files combines investigation/mystery, emergent objectives, roleplay/narrative and a hidden-world conspiracy layer. | Defines the product fantasy. |
| P1-Q2 | The main gap addressed is lack of mystery in normal survival play. | Keeps the module focused. |
| P1-Q3 | Solo is the only designed-for player mode today. | Multiplayer architecture is deferred. |
| P1-Q5 | Entry should be early, escalation gradual, investigation open-ended, with multiple entry points. | Avoids a linear quest structure. |
| P1-Q6 | There is no conventional final completion; the character usually dies without learning the full truth. | Matches Project Zomboid's core philosophy. |
| P1-Q7 | Integrate systemically with vanilla survival rather than replace it. | The conspiracy is an overlay on survival. |
| P1-Q9 | Minimal intrusion: do not rewrite core vanilla mechanics unless a proven requirement forces it. | Compatibility and maintainability. |
| P1-Q15 / P4-R06 | Replay variation means different entry points, placements, timing and details into the same authored conspiracy, not different core truths. | Reconciles low randomness with replay value. |
| P1-Q19 | Target Project Zomboid Build 42. Exact supported minor line must follow verified research. | Build 42 is the development target; patch-exact assumptions are retired. |
| P1-Q20 / P4-R12 | UI/static strings are localisation-ready; dynamic/template-composed story prose is English-first in v1. | Full localisation conflicts with runtime composition. |
| P1-Q21 | Tone: grounded government/military/scientific conspiracy with substantial dark bureaucratic humour. | Core voice. |
| P1-Q22 | Remain canon-compatible, never confirm the Knox Event's true cause, and respect the 1990s setting. | Protects PZ lore and ambiguity. |
| P1-Q23 / P4-R01 | The project may be creatively “never finished,” but development uses finishable milestones beginning with a concrete v0.1 vertical slice. | Prevents permanent pre-production. |
| P1-Q26 | The project owner is the sole final arbiter of whether the experience is good. | No market-fit/community approval requirement. |

## Player-experience decisions

| ID | Current decision | Rationale |
|---|---|---|
| P2-Q4 | The player can manually mark acquired objects/facts as interesting. | Player curiosity is a core input. |
| P2-Q6 / P4-R24 | Track physical evidence identity where technically possible; if identity is lost, keep the evidence record and mark the object unavailable. | Never erase investigation truth because an item cannot be followed. |
| P2-Q7 | Evidence records may capture rich discovery context, bounded by proven persistence/performance limits. | Context is part of the clue. |
| P2-Q16 | Critical paths use anchor + fallback opportunities; do not intentionally materialise duplicate backup clues as red herrings. | Reliability without clutter/false leads. |
| P2-Q19 | System-derived relevance must be explainable. | Avoid opaque “the system says it matters.” |
| P2-Q20 / P4-R05 | Journal + evidence list are primary through v1. Relationship graph is a v2 feature and must be prototyped separately. | Graph scope is disproportionate for v1. |
| P2-Q26 | No deliberately meaningless authored false leads. | Player time should not be wasted by fake content. |
| P2-Q27 | Discovering evidence does not directly make the world react to player knowledge. | The module observes/interprets more than it scripts reactions. |
| P2-Q31 | Generated/narrated text respects known facts, character knowledge, canon and the 1990s boundary; speculation remains speculation. | Preserves trust. |
| P2-Q36 | Journal chronology is discovery order. | Keeps the survivor's investigation history legible. |
| P2-Q42 / P4-R07 | Timing/system rules remain hidden in normal play; full hidden-state diagnostics are development/debug only. | Diagnostics must not defeat the mystery. |
| P2-Q51/Q52 | Save-affecting gameplay configuration is selected at world creation and stays fixed for that save. | Prevents mid-save story inconsistency. |
| P2-Q54 / P4-R03 | **No-AI is the primary experience.** Runtime AI is optional enhancement only. | Core play cannot depend on API keys/network/cost. |
| P2-Q58/Q59 | Optional AI narrative voice is in-character, funny, irreverent and fatalistic; humour remains present even in grim moments. | Defines the optional narration tone. |
| P2-Q62/Q63 / P4-R13 | Onboarding is an in-fiction notebook/help page, not one-time quest-like popups. | Fits the fiction and reduces UI intrusion. |
| P2-Q69 / P4-R11 | Provenance is stored internally and may be shown with an optional toggle; approved AI-assisted authored assets are normal in-fiction content. | Makes interpretation auditable without cluttering default presentation. |
| P2-Q74-Q78 / P4-R14 | Old material may archive by in-game time and resurface when relevant; re-scoring is event-scoped using affected indexes, never all-pairs polling. | Keeps long investigations usable within the runtime budget. |
| P2-Q81/Q82 | Progression is emergent; the module never announces case/mystery completion. | Avoids turning PZ into a quest game. |
| P2-Q108/Q109 | Preserve conflicting evidence and do not automatically reconcile it. | Contradiction is part of the conspiracy. |
| P2-Q113 / P4-R15 | Identity nodes remain separate even when confirmed as the same person; organisation labels may refine in place. | Alias encounter history is valuable; organisation naming is a different problem. |
| P2-Q118 | Original evidence facts remain immutable when interpretation changes. | Core integrity invariant. |
| P2-Q142 / P4-R29 | One normal-play global keybind opens the notebook. Help lives inside it; diagnostics use debug tooling. | Minimises mod key conflicts. |
| P2-Q152-Q159 / P4-R08 | Working asset-text model is hybrid: vanilla inventory/container behaviour plus custom reader/Inspect for world-specific ModData where needed. Final ruling awaits T7. | Runtime text support is unproven. |
| P2-Q161-Q163 | Randomness is low and never changes core conspiracy logic, canon-critical facts, major anchor relationships or tone. | Coherence over procedural novelty. |
| P2-Q180/Q181 / P4-R07 | Normal play has no truth-dump diagnostics. Development/debug diagnostics may expose everything read-only. | Protects the central mystery. |
| P2-Q190/Q191 / P4-R10 | Future compatibility separates PZ minor-line support, CF schema/API compatibility and authored content revision. Typo/text-only fixes must not require migrations. | Exact-match versioning is untenable. |
| P2-Q198 / P4-R30 | If migrations return later, keep a minimal migration audit line. | Supportability. |
| P2-Q205-Q207 / P4-R23 | The global >90% retrofit rule is retired. Retrofit is out of v1; any future model is per-candidate and reachability-based. | Global chunk percentage measures the wrong thing. |

## Architecture decisions

| ID | Current decision | Rationale |
|---|---|---|
| P3-Q1 / ADR-0001 | Vanilla Lua first. | Use the platform's normal extension path unless evidence says otherwise. |
| P3-Q2 | Java/ZombieBuddy requires missing API access, measured performance bottleneck, or persistence/data-processing complexity. | Keep the dependency boundary narrow. |
| P3-Q3 | One authoritative core model; UI/diagnostics are projections. | Prevents competing truths. |
| P3-Q4 | Persist minimal canonical state; rebuild caches/indexes. | Controls save size and state drift. |
| P3-Q6 | Typed entity collections + a central relationship store. | Serves both domain logic and future graph views. |
| P3-Q7 | Deterministic IDs for authored entities; generated IDs for player/runtime entities. | Stable references without predeclaring player content. |
| P3-Q8 | Central relationship table is canonical; per-entity adjacency is a rebuildable index. | Avoids duplicated relationship truth. |
| P3-Q9 | Domain events propagate meaningful model changes; views can rebuild on open as a safety net. | Event-driven without fragile UI coupling. |
| P3-Q10 | PZ events are boundary inputs translated into internal CF domain events. | Keeps engine code outside the domain core. |
| P4-R16 | Provisional runtime budget ≤2 ms/frame outside explicit initialization; use bounded queued work. | PZ Lua is main-thread constrained. |
| P4-R17 | **Hard v0.1 canonical-state budget: ≤500 KB/save.** | T1's live Build 42.20.4 results retained the target as an evidence-based production ceiling; technically serialisable larger states caused unacceptable synchronous stalls. |
| P4-R18 | Detect multiplayer and disable cleanly until MP support is designed. | Avoid half-running/corrupt state. |
| P4-R19 | Every PZ adapter uses `pcall`; repeated subsystem failures auto-disable that subsystem with concise reporting. | Error containment. |
| P4-R20 | Domain core has zero PZ runtime dependencies and runs in plain Lua 5.1 tests. | Testability. |
| P4-R21 | No vanilla Lua replacement; one `ConspiracyFiles` namespace; cooperative context-menu/event hooks. | Mod compatibility. |
| P4-R32 | Before swapping canonical ModData, recursively validate a staged full replacement: allow only string/number keys and string/number/boolean/plain-table values (nil means absence); reject cycles; reject multiply referenced tables or normalize/copy them so meaning cannot depend on alias identity; reject metatables, functions, userdata, threads and exposed Java objects; enforce maximum depth 64; validate schema and estimated serialized size against P4-R17; swap only after the complete replacement passes, preserving the last known-good canonical root on rejection. | T1 found silent dropping of unsupported values and keys, loss of shared-reference identity, and catastrophic whole-tag loss from a cycle even when `saveGame()` returned; pre-save validation is therefore mandatory. |

## Delivery/scope decisions

| ID | Current decision | Rationale |
|---|---|---|
| P4-R01 | v0.1 = one hand-authored thread, 6 documents, 3 identities, 1 organisation, 2 curated locations, 1 anchor + 1 fallback, journal + evidence list, manual Mark Interesting. | Smallest end-to-end proof of the experience. |
| P4-R02 / P4-R26 | Content precedes generic schema; project owner writes/approves canonical content, with AI only assisting drafts. | Avoid schema-first design. |
| P4-R04 | Retrofit, migration and external content packs are not in v1. | De-risk core first. |
| P4-R05/P4-R25 | Graph is v2; prototype separately with provisional 250 visible-node cap. | Biggest UI risk. |
| P4-R22 | Death recap has a deterministic no-AI fallback; optional AI may enhance it later. | Death payoff cannot depend on network success. |
| P4-R27 | Three concrete reward moments are defined in `docs/requirements/PLAYER_MOMENTS.md`. | Ensures the mod rewards the player without completion banners. |
| P4-R28 | “Long inactivity” means a real-world gap between play sessions. | It is a return-player memory aid, not an in-world timer. |

## Technical decisions intentionally pending spikes

- **T2:** map/meta-grid enumeration cost and scheduler requirements.
- **T3:** automatic location categorisation reliability.
- **T4:** exact-once placement hook/idempotency sequence.
- **T5:** persistent physical item identity.
- **T6:** never-loaded chunk detection, only if retrofit returns.
- **T7:** runtime item text/name/page behaviour.
- **T8:** building/room/non-building arrival detection.
- **T9:** Lua network egress; AI remains optional regardless.
- **T10:** cooperative Inspect context-menu integration.

See GitHub issues #1–#10 and `docs/research/SPIKE_TEMPLATE.md`.
