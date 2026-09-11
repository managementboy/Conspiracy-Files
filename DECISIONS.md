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
| P2-Q6 / P4-R24 | Track physical evidence with a mod-owned per-instance token where available. Physical availability is mutable and separate from immutable Evidence; unavailable/untracked/conflict states never erase the evidence record. Tracking may resume only when the same uncompromised token is observed exactly once. | T5 proved ModData persistence through normal transitions and confirmed that copied ModData can compromise uniqueness. |
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
| P2-Q62/Q63 / P4-R13 / P4-R46 | Onboarding remains quiet, in-fiction guidance rather than a quest tutorial, but Help is a separate dark utility window opened from a labeled notebook-chrome control; it is not a notebook page or tab. No objective popup is introduced. | The owner-approved 2026-09-01 UI direction found that instructional copy inside the survivor-authored notebook breaks immersion. This supersedes only the earlier notebook-page placement, while preserving the non-quest onboarding intent. See [Issue #30](https://github.com/managementboy/Conspiracy-Files/issues/30). |
| P2-Q69 / P4-R11 | Provenance is stored internally and may be shown with an optional toggle; approved AI-assisted authored assets are normal in-fiction content. | Makes interpretation auditable without cluttering default presentation. |
| P2-Q74-Q78 / P4-R14 | Old material may archive by in-game time and resurface when relevant; re-scoring is event-scoped using affected indexes, never all-pairs polling. | Keeps long investigations usable within the runtime budget. |
| P2-Q81/Q82 | Progression is emergent; the module never announces case/mystery completion. | Avoids turning PZ into a quest game. |
| P2-Q97-Q101 / P4-R39 | Location knowledge may begin as nearby-landmark context and become more precise through physical exploration. Confirmation refines a vague description only when the player satisfies the exact curated binding's room/building/floor/basement/radius/rectangle/zone predicate; entering a building is not a universal confirmation rule. | Preserves P2-Q97-Q99 and P2-Q101's compatible progressive-precision intent while [T8 / Issue #9](https://github.com/managementboy/Conspiracy-Files/issues/9) supersedes P2-Q100's universal building-entry trigger. See `docs/research/T8_LOCATION_ARRIVAL.md`. |
| P2-Q108/Q109 | Preserve conflicting evidence and do not automatically reconcile it. | Contradiction is part of the conspiracy. |
| P2-Q113 / P4-R15 | Identity nodes remain separate even when confirmed as the same person; organisation labels may refine in place. | Alias encounter history is valuable; organisation naming is a different problem. |
| P2-Q118 | Original evidence facts remain immutable when interpretation changes. | Core integrity invariant. |
| P2-Q142 / P4-R29 / P4-R46 | One normal-play global keybind opens the notebook. A labeled notebook-chrome control opens the separate Help utility window; diagnostics use debug tooling. | Minimises mod key conflicts while keeping system instructions outside the survivor-authored notebook fiction. |
| P2-Q152-Q159 / P4-R08 | **T7 resolves the asset-text model as hybrid:** preserve vanilla inventory/container behaviour and persistent per-instance custom names, keep the authoritative world-specific title/description/body in item ModData, and render the body through the cooperative custom `Inspect` reader. Locked `Literature.customPages` may present deliberately short plain-text page artifacts, but are not the universal store. Never rely on `InventoryItem.description`, raw runtime `printMedia` keys, or key/map/generic native UI for body text. | T7 on Build 42.20.4 proved names, ModData and custom pages persist; descriptions do not, journal markup is literal/size-limited, runtime-shaped print media is unsafe, and non-literature native UIs do not consume the body. See `docs/research/T7_RUNTIME_ITEM_TEXT.md`. |
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
| P3-Q6 | Typed entity collections + a central relationship store. | Long-term direction for richer domain linkage; see P4-R31 for the v0.1 Dead Air exception. |
| P3-Q7 | Deterministic IDs for authored entities; generated IDs for player/runtime entities. | Stable references without predeclaring player content. |
| P3-Q8 | Central relationship table is canonical; per-entity adjacency is a rebuildable index. | Long-term direction once relationship lifecycle is justified; see P4-R31 for v0.1. |
| P3-Q9 | Domain events propagate meaningful model changes; views can rebuild on open as a safety net. | Event-driven without fragile UI coupling. |
| P3-Q10 | PZ events are boundary inputs translated into internal CF domain events. | Keeps engine code outside the domain core. |
| P4-R16 | Provisional runtime budget ≤2 ms/frame outside explicit initialization; use bounded queued work. | PZ Lua is main-thread constrained. |
| P4-R17 | **Hard v0.1 canonical-state budget: ≤500 KB/save.** | T1's live Build 42.20.4 results retained the target as an evidence-based production ceiling; technically serialisable larger states caused unacceptable synchronous stalls. |
| P4-R18 | Detect multiplayer and disable cleanly until MP support is designed. | Avoid half-running/corrupt state. |
| P4-R19 | Every PZ adapter uses `pcall`; repeated subsystem failures auto-disable that subsystem with concise reporting. | Error containment. |
| P4-R20 | Domain core has zero PZ runtime dependencies and runs in plain Lua 5.1 tests. | Testability. |
| P4-R21 | No vanilla Lua replacement; one `ConspiracyFiles` namespace; cooperative context-menu/event hooks. | Mod compatibility. |
| P4-R31 | **v0.1 Dead Air uses static stable-ID references on authored Assets instead of instantiating or persisting standalone Relationship records.** Re-evaluate a central relationship store only when a second real content set or the v2 graph creates an actual need. | The complete v0.1 story needs references, leads, contradictions and recontextualisation, but none of those relationships have runtime lifecycle in the slice. Content-first minimality wins over pre-building graph-era structure. |
| P4-R32 | Before swapping canonical ModData, recursively validate a staged full replacement: allow only string/number keys and string/number/boolean/plain-table values (nil means absence); reject cycles; reject multiply referenced tables or normalize/copy them so meaning cannot depend on alias identity; reject metatables, functions, userdata, threads and exposed Java objects; enforce maximum depth 64; validate schema and estimated serialized size against P4-R17; swap only after the complete replacement passes, preserving the last known-good canonical root on rejection. | T1 found silent dropping of unsupported values and keys, loss of shared-reference identity, and catastrophic whole-tag loss from a cycle even when `saveGame()` returned; pre-save validation is therefore mandatory. |
| P4-R33 | **Any future general runtime-AI network transport must cross a Java/ZombieBuddy or external-companion boundary and remains outside v0.1.** Vanilla Lua may use DNS and fixed engine services, but it must not be treated as an arbitrary HTTP client. | T9 on Build 42.20.4 found no callable general GET, POST, TLS-control, timeout-control or asynchronous HTTP surface; the sole fixed HTTPS helper blocked `OnTick` for 312 ms and returned no usable response. See `docs/research/T9_NETWORK_EGRESS.md`. |
| P4-R34 | **Future map-wide discovery is a rebuildable, non-persistent, filtered session process. Never synchronously scan the full map in normal play; queue work behind both a conservative record cap below the tested 100-record/frame boundary and an elapsed-time deadline under P4-R16, and retain only candidate facts needed downstream.** v0.1 continues to use curated locations. | T2 on Build 42.20.4 counted 96,414 building/room records; synchronous scans occupied 227–244 ms, 100 records/frame peaked at 2 ms, and a generic rich full-map Lua index retained an observed 90–102 MiB of JVM heap. Persisting or retaining the unfiltered registry is unjustified. See `docs/research/T2_MAP_ENUMERATION_COST.md`. |
| P4-R35 — catalog policy revised by P4-R53; technical findings retained | **Automatic location categorisation is advisory candidate discovery, not authoritative story truth. v0.1 and v1 use curated location catalogs. Future automation is room/area-first, preserves the exact matched-property/rule provenance, supports explicit per-map aliases/overrides, and remains filtered, rebuildable, non-persistent, and dual-bounded under P4-R34. Non-building landmarks require curated/object-specific handling.** | T3 on Build 42.20.4 found strong exact room labels for sampled bookstores and clinics/hospitals, but generic office/medical/communications labels were context-sensitive, a conservative 55-row matrix missed a large police HQ and communications-tower building, and no semantic non-building transmission zone existed. See `docs/research/T3_LOCATION_CATEGORISATION.md`. |
| P4-R36 | **Deferred placement uses `LoadGridsquare` only to enqueue relevant curated bindings plus an `OnGameStart` catch-up; reconciliation scans the exact target for a deterministic item stamp before any add. Stage `placing` under P4-R32, create and stamp the item while detached, add that exact instance, verify count one, then stage `placed`. One target stamp repairs stale intent; more than one becomes `conflict`. Terminal pre-placement target loss becomes `unavailable`; mere unloading remains pending. After `placed`, zero in the original container triggers P4-R37 physical-identity reconciliation, not immediate loss.** | T4 proved exact-once pre-placement behavior; T5 proved a normally moved item is legitimately absent from that container while remaining available elsewhere. See `docs/research/T4_EXACT_ONCE_PLACEMENT.md` and `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`. |
| P4-R37 | **Physical evidence identity is a save-scoped mod-owned string token, unique per intended physical instance and stamped in item ModData before exposure. Engine item IDs are diagnostics only. Placement outcome and physical availability are separate. One token match is `available`; confirmed destruction/complete covered absence is `unavailable`; unknown/unloaded coverage is `unknown`/`untracked`; two or more distinct items with one token are sticky `conflict`. Never automatically delete, choose, restamp or clear a conflict, and copy/transform paths must omit or deliberately replace the token.** | T5 on Build 42.20.4 preserved one token across inventory/container/floor/vehicle/reload and real corpse transfer, while both ModData copy methods created persistent duplicate identities on different engine items. See `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`. |
| P4-R38 | **The PZ-facing asset adapter writes a persistent custom item name and validated plain ModData fields for resolved title/description/body. The domain/authored body remains authoritative and is never derived back from presentation pages. The custom `Inspect` reader is the default world-specific body surface; optional locked Literature pages are generated projections for short plain-text artifacts only.** | T7 separated durable storage from presentation and found no safe universal native body carrier. See `docs/research/T7_RUNTIME_ITEM_TEXT.md`. |
| P4-R39 | **Curated location arrival uses bounded, debounced state sampling as its authority, not `OnPlayerMove` alone. At approximately 4 Hz, evaluate only referenced bindings, require two consecutive samples for the same logical square, apply exact binding-specific room/building/floor/basement/radius/rectangle/zone predicates, and persist a sticky confirmed location ID before emitting one domain event.** `OnPlayerMove` may only be an opportunistic wake-up. | T8 observed zero `OnPlayerMove` callbacks for scripted teleports, while 15-tick sampling confirmed the reached room/building/floor/outdoor/zone matrix in 248–344 ms with no false positives in the clean core and no duplicates on leave/re-entry. See `docs/research/T8_LOCATION_ARRIVAL.md`. |
| P4-R40 — superseded as specified by P4-R48/R49 | **If D1 was durably placed but remained undiscovered and later becomes conclusively `unavailable` only after T5/P4-R37 reconciliation, D2 may activate once as the fallback introduction.** Mere unloading, absence from D1's original container, `unknown`, `untracked` or `conflict` does not qualify. D1 never respawns. | Preserves a viable introduction after confirmed physical loss without turning incomplete identity coverage into a duplicate-clue trigger. |
| P4-R41 — superseded as specified by P4-R48/R49 | **Dead Air targets a regional journey of roughly 1,000–1,600 straight-line tiles between its two curated story locations, subject to live route and access verification.** | The two-sided investigation should require meaningful travel while remaining a regional survival journey rather than a map-spanning expedition. |
| P4-R42 — superseded as specified by P4-R48/R49 | **Prefer a medium local police station over the large headquarters. Candidate P2 at `(13206,3073)` is the first police site to inspect; the headquarters remains fallback if P2 lacks credible property/records containers.** This is a verification priority, not a final binding. | The local-station scale better fits the story, but physical container and access plausibility must decide the binding in live Build 42. |
| P4-R43 — superseded as specified by P4-R48/R49 | **Candidate R2 at `(13549,1572)`, the compact communications/news facility with a service garage, is the first relay site to inspect. It is provisionally paired with P2 at roughly 1,538 straight-line tiles and must pass live newsroom-character, access, boundary and container-plausibility checks.** This is not a final binding. | T3's checked-in live candidate matrix supplies enough provenance to prioritize inspection, but not enough evidence to bind either story Location. |
| P4-R44 | **T10 and any rerun use only the manual-GUI procedure.** No helper/injected agent, quarantine restoration, antivirus exclusion or bypass, alternate injection, synthetic input or computer control is permitted. The project owner manually launches/enters the disposable save and performs right-clicks while the pure-Lua probe only logs callbacks/assertions. | The completed manual run produced no security alert and did not reintroduce the abandoned injected-helper route; the earlier `runner.exe` alert provenance remains unknown. |
| P4-R45 | **The supported cooperative asset-action surface is `OnFillInventoryObjectContextMenu` for player inventory and Ground/loot inventory panes.** Add privately keyed `Inspect`/`Mark Interesting` actions after vanilla construction, remove only stored mod callback identities, normalize/deduplicate selection, revalidate at activation, disable ambiguous/unowned/already-marked intent and wrap the boundary in `pcall`. Do not promise direct-world-item right-click actions. | T10's live manual matrix preserved vanilla and another additive listener, reached Inspect once and Mark intent once, persisted the disabled Mark state across reload, and contained injected faults. Direct photo-sprite right-click fired the world event with zero inventory subjects, while the Ground pane worked. See `docs/research/T10_COOPERATIVE_INSPECT.md`. |

## Delivery/scope decisions

| ID | Current decision | Rationale |
|---|---|---|
| P4-R01 — historical fixture scope; see P4-R53 | v0.1 = one hand-authored thread, 6 documents, 3 identities, 1 organisation, 2 curated locations, 1 anchor + 1 fallback, journal + evidence list, manual Mark Interesting. | Smallest end-to-end proof of the experience. |
| P4-R02 / P4-R26 | Content precedes generic schema; project owner writes/approves canonical content, with AI only assisting drafts. | Avoid schema-first design. |
| P4-R04 | Retrofit, migration and external content packs are not in v1. | De-risk core first. |
| P4-R05/P4-R25 | Graph is v2; prototype separately with provisional 250 visible-node cap. | Biggest UI risk. |
| P4-R22 | Death recap has a deterministic no-AI fallback; optional AI may enhance it later. | Death payoff cannot depend on network success. |
| P4-R27 | Three concrete reward moments are defined in `docs/requirements/PLAYER_MOMENTS.md`. | Ensures the mod rewards the player without completion banners. |
| P4-R28 | “Long inactivity” means a real-world gap between play sessions. | It is a return-player memory aid, not an in-world timer. |

## Takeover reconciliation — 2026-09-05

- **P4-R47 — notebook input:** the owner directed native X close controls and one configurable notebook open/close binding, with Escape reserved for the game's options flow. Do not assign a fixed function key. This supersedes the Escape-close expectation in earlier T12/browser material; controller mapping remains unverified. Direct owner instruction: 2026-09-05 11:18:36 UTC, archived in [owner provenance](docs/management/evidence/2026-09-05-takeover/owner-provenance.json).
- **Content approval record:** `dead-air-r1` was owner-approved on 2026-09-05 with explanatory context, followed by a required D1/D4 timing correction. Approval is not pending; delivery/disclosure inconsistencies are tracked under Issue #26 and the [takeover audit](docs/management/PM_TAKEOVER_AUDIT_2026-09-05.md).
- **Historical scope reconciliation (resolved by P4-R48 below):** the owner explicitly selected a Muldraugh test route and bounded per-save randomized placement on 2026-09-04. The current takeover still specifies two locations and P2/R2. Preserve both records; do not infer a final three-location shipping approval or silently supersede P4-R01/R40/R41–R43. Issue #28/#30 must settle route, motel membership and the relationship between order-independent evidence and fallback opportunity.

## Remaining conditional spike

- **T6:** never-loaded chunk detection, only if retrofit returns.

See GitHub issues #1–#10 and `docs/research/SPIKE_TEMPLATE.md`.

## Approved correction decisions — 2026-09-05

The owner directed “I want to follow all your recommendations” after the takeover audit and explicitly answered “Use those three recommendations” for the police-arrival, availability-language and death-recap choices in this task. Prior Muldraugh direction is archived in the takeover owner-provenance record.

- **P4-R48 — two-site Muldraugh candidate:** retain exactly two story locations, use the owner-selected Muldraugh electronics/relay site and police station, and return D4 to the relay location. The motel is excluded. This supersedes P4-R42/R43's P2/R2 inspection priority and P4-R41's 1,000–1,600-tile target for this candidate. The provisional centres are approximately 806 tiles apart; route/access plausibility and exact container/arrival predicates still require owner observation. P4-R01's two-location limit stands. Preserve the older P2/R2 checkpoint as history; do not resume it by default.
- **P4-R49 — entry opportunity and physical eligibility:** all six distinct documents and the optional key are eligible at their own locations regardless of discovery order. D2 is not a duplicate copy of D1 and is not withheld until D1 is lost. Either can introduce the thread once; the first eligible D1/D2 discovery records anchor/fallback selection. Conclusive undiscovered D1 loss can select the fallback opportunity; mere absence, unknown coverage or conflict cannot. No D1 respawn. This narrows P4-R40 to fallback introduction bookkeeping, superseding any implied delayed D2 materialisation.
- **P4-R50 — ordinary police arrival:** police-property confirmation is an ordinary journal entry. Only the existing eligible Major event classes remain.
- **P4-R51 — availability copy:** normal players see plain-language consequences; internal available/unknown/untracked/unavailable/conflict identifiers remain diagnostic state. Immutable Evidence survives physical loss or conflict.
- **P4-R52 — death recap deferred:** no death recap in v0.1. Actual death/corpse/save/reload integrity under E10 remains required; deferring prose does not waive lifecycle acceptance.
- **Implementation boundary:** the corrected aggregate schema uses one validated canonical root. Incompatible development saves are refused without migration or overwrite. T11 and T12 wrappers exercise shared candidate modules with explicit differences recorded in their runbooks. Offline tests and source inspection do not accept their live gates.

## Product direction restored — 2026-09-05

**P4-R53 — dynamic investigations and automatic location selection.** The owner clarified that the intended mod uses a large database of possible locations and dynamically generates conspiracies. Manual owner approval of individual places is not a product requirement. The owner approved a bounded roadmap/prototype-specification increment; this does not authorize claiming that generation already exists.

- Dead Air and its fixed Muldraugh bindings remain regression/test fixtures, not the final product model. P4-R01 and P4-R48's prescribed-location scope no longer define the active delivery destination or require an owner plausibility tour.
- This supersedes P4-R35's curated-only v1 catalog policy, not T3's measured limitations. Catalog entries may come from filtered map metadata and explicit capability rules. Uncertain categories remain uncertain; automation cannot invent a police station or radio mast from a generic office label.
- An automatically selected, technically eligible candidate does not require per-place owner approval. Automated predicates must validate location/container suitability for the template; the owner evaluates the generated investigation through play. Runtime placement, boundaries, persistence and performance still require technical verification.
- Authored building blocks and constraints may generate different case facts, people, documents and connections for different new saves. Facts are consistent and fixed within a committed case. This extends earlier low-randomness/static-story rulings for the new prototype; it does not permit changing established evidence or contradicting PZ canon.
- No-AI remains the complete primary experience. No graph, external content-pack platform, retrofit, migrations or multiplayer is added by this correction.
- The next work increment is the specification in docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md. Implementation follows separately in bounded steps; the existing hard-coded registries cannot be relabeled as a generator.

**CPU clarification:** the owner reported that the observed CPU strain was unrelated to the mod. Remove that incident as a project blocker. This is an owner clarification, not a measured performance pass; the existing runtime budget and live performance criterion remain.

## Initial location sources — 2026-09-05

**P4-R54 — owner nominations plus technical enrichment:** the owner will supply 12 interesting places in Muldraugh. Use those as the prototype's real candidate set, with stable provenance, supplemented/enriched by existing map research as needed. This updates P4-R53's initial research-only catalog assumption, not its automatic-selection goal. Nominations do not establish observed storage or require owner inspection of containers. Synthetic test records remain separate and are ineligible by default. See docs/design/MULDRAUGH_LOCATION_INTAKE.md.

## Investigation reach progression — 2026-09-05

**P4-R55 — new conspiracy range grows with character survival time.** Owner approved these initial playtest defaults to keep early investigations close while the player establishes survival:

| Completed days survived by the character | Maximum radius for newly generated conspiracies |
|---|---:|
| 0–3 | 250 tiles |
| 4–10 | 500 tiles |
| 11–20 | 1,000 tiles |
| 21+ | 1,500 tiles |

- Use character survival duration, not real-world time or the world's calendar age. Tier boundaries are 4, 11 and 21 completed days survived.
- Apply the radius when generating a new case. Existing conspiracies retain their committed locations and facts as time advances.
- If the allowed area has few suitable buildings, accept less category variety. Never silently expand beyond the early-game limit. Required technical suitability and distinct-site constraints still apply; if no valid case can be formed, defer generation.
- These values are approved starting defaults, subject to playtesting, not proven travel or difficulty measurements.
- The current manual T3 probe's explicit radius argument remains a development control; this decision records intended gameplay behavior and does not claim runtime progression is implemented.
- The radius anchor for later cases (original spawn, current position or another reference) remains an implementation/design choice to resolve separately; this decision approves the distance progression only.

See [Generated investigation prototype](docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md#investigation-reach-progression).

**P4-R55 implementation follow-up:** pure reach policy, `Generator.generateNew` filtering and automatic survival-based T3 default implemented. Boundary/scarcity/restoration tests pass (51 suite tests plus focused probe checks). Live automatic-radius verification and full gameplay integration remain pending; see generator design.

## Nearby clue assistance — 2026-09-05

**P4-R56 — proximity text:** owner requested varied overhead text when one tile from a clue. Implemented five tentative phrases using native Say text, same-floor one-tile proximity including diagonals, only for undiscovered physically present generated documents. Implementation defaults: 60-second global cooldown, one hint per container visit, rearm after moving more than three tiles away. No discovery is granted and no clue facts are revealed. Missing, duplicate or conflicted items remain silent. Tests pass; live display awaits owner check.

## Player-facing location references — 2026-09-05

**P4-R57 — addresses and recognizable place names, not debug coordinates.** Owner identified that ordinary players cannot use coordinate-based document leads. Player-facing generated documents, journal entries and leads must identify destinations through verified place names or real available addresses. Raw coordinates remain internal placement data and development diagnostics only.

- T3 currently supplies room labels and geometry; the current extraction does not establish street names, house numbers or business signage. Do not invent an address or promote a generic office label into a named institution.
- Prefer a verified place name/address. Where those are unavailable, a grounded landmark/directional description may provide a fallback only if it distinguishes the destination sufficiently for normal play. Generic descriptions shared by several nearby buildings are not a solved lead.
- Naming requires provenance and must remain consistent across all documents referencing the same location. Technical IDs and exact container coordinates stay separate from presentation.
- Existing saved case facts/text remain immutable. Any presentation correction for the active prototype must preserve the referenced location and case identity; do not silently regenerate the case or rewrite canonical evidence.
- The current coordinate-heavy G2 prose is an acknowledged prototype defect. A naming/resolution layer and owner navigation check are required before ordinary-player playability can be accepted. This decision records the requirement; no real-address database or naming implementation is claimed.

## Town addressing baseline and player Help — 2026-09-05

**P4-R58 — stable town baselines with player-visible addressing rules.** Owner approved using Main Street and/or First Street as town numbering baselines where suitable, and a fixed named alternative baseline where they are absent or unsuitable. The selected baseline must be documented for each town and explained in player Help. Do not infer that every town has those streets from the preliminary spawn-proximity check.

- Implement the agreed fictional mod address system: fixed town baselines, increasing block ranges away from the baseline, hundred-number ranges for successive defined street blocks, odd/even numbers on opposite sides, stable building addresses independent of case seed and candidate selection. Detached sheds/garages share their main property's address where that relationship is established.
- Adopt the previously researched Louisville parity as the mod convention: north side odd/south side even on east-west roads; east side odd/west side even on north-south roads. Curved roads and ambiguous frontage need explicit deterministic rules before assignment.
- This supersedes P4-R57's prohibition on fictional house numbers only for the explicitly labelled, consistent mod addressing system. Do not claim these are real-world or original vanilla addresses. Street names continue to require map provenance.
- Numbers must be visible to ordinary players at buildings or on their map; a number in a document alone is insufficient. Help must explain how to read them and identify the chosen baseline for supported towns.
- Town baseline choices, full building/frontage indexing and visible address display remain to be implemented. The current Help describes this as planned, rather than pretending numbered buildings already exist. Existing case identities and discoveries remain unchanged.

## Discovery markers and knowledge-limited house labels — 2026-09-05

**P4-R59 — map annotations follow player knowledge.** Owner requests a map marker for each found clue at its finding location, plus house-number labels only for buildings already exposed by the game's map knowledge. Reading a town map should allow labels throughout the area that map actually reveals.

- Capture the actual finding/source location; do not substitute the player's later reading position. Do not automatically mark all placement targets or disclose unfound evidence. Where original finding location is unavailable, do not invent it.
- Clue markers and journal knowledge persist after dropping the physical item and across save/reload. Repeated inspection does not duplicate markers. Multiple clues at one location remain individually identifiable without unreadable stacked labels.
- Assign house addresses independently of exploration and conspiracy selection; reveal their labels according to native map knowledge. House labels do not reveal clue presence.
- Follow the area actually revealed by opening/reading a paper map, not merely possessing an item named Muldraugh Map. Do not reveal additional terrain or buildings to make numbering easier. Player annotations must be preserved.
- Installed ISMap:initMapData calls MapUtils.revealKnownArea, which uses WorldMapVisited:setKnownInSquares for the map's bounds. Map symbol APIs are present. Exact known-area read/masking granularity and annotation persistence still require implementation and live verification; these capabilities are not accepted from source inspection alone.
- This is an approved requirement, not a claim that house numbering or map annotations are already implemented. P4-R58 baseline/address assignment work remains prerequisite for house labels.

## Writing tools gate clue-map annotations — 2026-09-05

**P4-R60 — record knowledge immediately; annotate the map only with a writing tool.** Owner requires automatic clue markers to depend on a suitable pen/pencil in the player's inventory. Implementation may follow with the clue-marker increment; this is not implemented in the address trial.

- Journal discovery and captured actual finding location persist independently of writing-tool possession. Existing map marks remain when the tool is removed.
- Without a qualifying tool, queue known clues for map annotation; never lose or relocate their original finding positions.
- On acquiring a qualifying tool, catch up all known, unmarked clues with valid recorded finding locations. Removing the tool pauses further writing; acquiring one again resumes the backlog.
- Catch-up is idempotent across repeated inventory changes and save/reload. No duplicate markers and no disclosure of undiscovered clues. Missing historical finding locations are not guessed from the current player position.
- Match the installed vanilla game's writing-tool eligibility/inventory handling after source verification; do not assume an exhaustive item list yet. Use bounded updates rather than continuous full inventory/world scans.
- This requirement concerns clue annotations. Knowledge-limited house-address labels remain map information governed by P4-R59.
- Explain the writing-tool requirement and deferred catch-up in player Help when implemented.

## Economical task delegation — 2026-09-05

**P4-R61 — owner-approved focused worker strategy.** Primary handles PM, integration and difficult bugs; routine independent work goes to one short-context worker at a time, normally Terra Low (Luna for simpler scopes). Higher Astra effort is reserved for demanding reviews; Astra Low is preferred for routine primary work when explicitly set through the app. Do not claim self-reconfiguration. Delegate compact scopes without full-history forks, share authoritative project files, test once at the proper level, and review before integration. All tasks consume the shared allowance; no guaranteed savings. See AGENTS.md for operating instructions. Owner authorized recording and immediately applying this strategy.


## Successive investigations and story tone — 2026-09-05

**P4-R62 — owner accepted all three offered recommendations.** Later investigations use the player's current position at creation as their reach anchor. Availability uses a minimum in-game time gap and a small concurrent-case cap, without requiring completion of a previous case. Authored conspiracies keep a grounded, ambiguous cover-up tone. Existing cases keep their committed anchors, reach, places and facts.

The owner accepted the policy directions, not specific numerical gap/cap values or individual draft prose. Offline prototypes may take explicit tunable policy inputs; do not claim an unoffered number is owner-approved. Retention must not silently erase learned evidence. Native integration and individual new story drafts retain their existing review/playtest gates.

## Pre-1.0 save compatibility — 2026-09-06

**P4-R63 — no backwards compatibility obligation before version 1.0.** Owner explicitly removes old-save compatibility from the design requirements until the mod reaches 1.0. Breaking data/schema changes may require a fresh save. Do not build or retain fallback readers, upgrade adapters, migrations or compatibility tests solely to support saves created by older mod versions. Prefer one current authoritative schema and simpler current-build paths.

This supersedes earlier requirements to preserve cross-version generated saves or retain a legacy canonical fallback in the successive-case design. Historical work and its test evidence remain history; existing code need not be ripped out merely to record this policy, but subsequent storage changes may remove the compatibility scaffolding. Cross-version preservation is no longer a delivery gate.

Save/reload integrity within the current supported build, failed-write protection, immutable evidence within an ongoing supported save, validation, bounded save budgets and duplicate prevention still apply. State plainly when a build requires a fresh save. Do not silently reset, erase or reinterpret user saves. This decision is not authorization to delete saves, and does not itself define the eventual 1.0 compatibility contract.

## Development allowance reserve update — 2026-09-06
Owner lowers the reserve from 30% to 25% weekly allowance remaining. Checkpoint and stop development at 75% used. This overrides previous reserve thresholds in task handoffs; economical sequential development continues. No authorization to consume reset credits or resume paused automations.
## Richer story and varied physical evidence — 2026-09-06

**P4-R64 — owner requests the next playable expansion.** Evidence descriptions must be more substantive: explain what was found, add story and context, and offer what the survivor could infer. Keep observations separate from tentative interpretation; preserve grounded ambiguity and avoid spoilers from undiscovered evidence. This extends prose and content, not authoritative inference of an unproven conspiracy.

The next playable test must include keys, diaries, notebooks and newspaper clippings, expanding beyond dispatch copies/files toward further conspiracy-related evidence. Use distinct appropriate physical item forms and story roles; maintain established inspection, discovery/source capture, notebook and map-marker behavior. Proposed additional forms are photos, receipts, annotated maps, letters, logs and recordings, subject to verified engine support and story usefulness. Working locks or audio playback are not automatically promised by adding keys or recordings. Implementation/testing plan: docs/management/NEXT_PLAYABLE_MILESTONE.md. These are requirements, not a claim of completed development.

## Development allowance reserve update — 2026-09-06, latest
Owner now sets the stop threshold to 5% weekly allowance remaining (95% used), superseding the previous 25% reserve and all earlier thresholds. Continue economical sequential development and checkpoint at this threshold. No reset credits or paused automation use is authorized.

## Corpse identities and observed cards — 2026-09-06

**P4-R65 — owner-approved identity/story direction.** For the first conspiracy, a story may assign a spawned character an occupation independently of clothing; an electrician need not wear work clothes. Assigned occupation is authored world data, not a claim that a probe discovered a reliable native occupation. Commit story facts consistently; do not overwrite established case facts when sampling characters again.

Corpses are candidate locations for planting conspiracy evidence and can provide the opening discovery. Track/revalidate suitable loaded corpse candidates internally before any future placement; no automatic journal revelation from candidate enumeration. The current known probe candidate is at10792,10287,0 (descriptor name Shauna Strickland); this is an encounter location, not a home address or proof of card ownership. Corpse placement itself remains a separate implementation slice.

Generate a journal observation when the player actually sees an ID or credit card on a corpse or inside an opened container, including a wallet. Seeing a closed wallet or merely approaching a corpse does not reveal the cards inside it. No pickup or right-click is required if the card is visibly listed. Record only information exposed by the observed item and its source; a card's name does not by itself establish the corpse's identity. Reopening, transferring and save/reload must not duplicate the same observation. Hidden descriptor names/occupations and unopened nested contents must not leak into journal knowledge. Current-build validation and shared save budget still apply.

## Automatic start and named tickets — 2026-09-06

**P4-R66 — owner requests automatic successive investigations now.** The first investigation's opening evidence must be placed inside the house the player currently occupies, not a random nearby building. If indoors/eligible storage is unavailable, wait rather than silently choosing another building. Later cases appear automatically near the player's current position under P4-R62 timing/reach/cap policy; no console commands required for the gameplay flow. Keep learned cases intact and persist timing with case creation. Numeric test pacing remains a configurable implementation choice, not a previously approved owner number.

Owner notes parking and speeding tickets also carry names associated with zombies/corpses. Include visible named tickets as identity-document observations under P4-R65's same knowledge gate; capture displayed labels, not unseen descriptor facts. Installed item scripts verify Base.ParkingTicket and Base.SpeedingTicket; actual owner-name behavior remains subject to native item testing.

Owner adds business cards as another possible name source. Installed literature.txt declares Base.BusinessCard, Base.BusinessCard_Personal and Base.BusinessCard_Nolans. Include these in visible-document observations; the card label is evidence of what was seen, not automatic proof of the corpse's name or profession.

Owner requests native-like notebook window memory: remember placement/size and whether left open or closed. Implement per-save player UI preferences, including active Journal/Evidence tab. Capture layout while open, restore after runtime readiness, and do not carry another save's window state across loads.

**P4-R67 — spread clues across containers.** Owner rejects discovering several investigation clues together in one container. Newly generated investigations assign each clue to a different physical container, retaining the required first-house opening. If there are insufficient suitable containers, defer creation instead of silently stacking clues. Already committed placements are not reshuffled or duplicated. Native acceptance remains required.

**P4-R68 — variable evidence and local people.** Owner explicitly rejects seven fixed clues and fixed evidence types. Earlier object examples were suggestions, not a mandatory checklist. Audit installed game objects for mystery roles and actual usable mechanics; choose evidence count/types around each coherent mystery, required connections and available placements. No new numerical min/max approved yet. The three/four building split is an implementation limitation to remove with this change, not a design requirement.

Nearby zombie/corpse names and occupations should participate in generated mysteries. Reuse available existing names; occupations may be authored consistently per P4-R65 where native profession is default/unknown. Keep chosen world facts stable and reveal them only through observed evidence. Clues may begin without a known person and acquire inferred connections later. Owner example: unnamed clue in101 Main St; later a key found on a named zombie actually opens that house, providing a connection from person to place and earlier clue. Record observed key provenance, verified key/lock relationship, and derived interpretation separately. Access supports association, not necessarily residence, ownership or authorship. Preserve original clue text and discovery context; add new journal interpretation rather than retrospectively inventing a name on the original object. Implement/test functioning native key relationship before claiming it works.

## The mod may change what the world already contains — 2026-09-11

**Decision (owner):** "we have broken that rule a lot since we started
developing this mod. So remove that constraint from our project."

**Withdrawn:** "never rewrite what a player's world already contains" - the rule
that the mod only ever placed its own evidence and left vanilla loot alone.

**Why it no longer held.** It had already been broken, deliberately, several
times: a nearby zombie is given the case person's name and an ID card
(CasePerson), placed evidence sets its own display category, and the survivor's
papers are a vanilla photo album renamed. Each was the right call for the
investigation, and a rule that is routinely broken for good reasons is not a
rule; it is a trap for whoever reads it next.

**What this allows.** Filling an empty vanilla diary with a looted person's
story; naming and equipping zombies; changing vanilla items where that serves a
case.

**What still holds, and is a different rule.** Never delete, reset or rewrite a
player's SAVE, and never do it for them. That concerns their save file and is
unaffected by this decision.

**The cost, stated so it is chosen rather than forgotten.** Once the mod edits
vanilla items, a player can no longer assume that anything they find is simply
the game's. For an investigation mod that ambiguity is arguably a feature. It
does mean the notebook's own restraint matters more, not less: an edited item
may still only ever say what it says, never what it proves.
