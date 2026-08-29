# Decision Supersessions — Engineering Review 2026-08-30

This file is an authoritative overlay on the original `DECISIONS.md` baseline. If a decision conflicts with this file, this file wins. The original log is preserved as historical discovery context.

## Superseded baseline decisions

- P1-Q17: usable defaults, not a sacred intended profile.
- P1-Q20: localisation applies to UI/static strings; dynamic story prose is English-first in v1.
- P1-Q23/P1-Q24: project keeps a never-finished philosophy, but delivery uses finishable milestones and explicit deferrals.
- P2-Q20: graph is not primary in v1; journal + evidence list are primary, graph moves to v2.
- P2-Q34/P2-Q35: compatible text-only revisions may update without migration; semantic/schema changes require compatibility handling.
- P2-Q54: no-AI is primary; AI is optional enhancement.
- P2-Q62/P2-Q63: popup onboarding removed; use an in-fiction notebook/help page.
- P2-Q69: provenance remains internally stored and may be exposed by an optional toggle.
- P2-Q144: pause/help preferences move to mod options; one normal-play notebook keybind.
- P2-Q180/P2-Q181: full hidden-state diagnostics are development/debug only.
- P2-Q190/P2-Q191: exact pack/core version matching retired; future compatibility separates content revision, CF schema/API, and PZ minor line.
- P2-Q198: retain a minimal one-line migration audit if migrations return.
- P2-Q205/P2-Q206/P2-Q207: global >90% retrofit metric retired; retrofit itself is out of v1.

# Phase 4 — Engineering Review Rulings (2026-08-30)

These rulings incorporate the lead-developer review. They supersede earlier decisions where stated.

| ID | Ruling | Rationale |
|---|---|---|
| P4-R01 | Define a concrete **v0.1 vertical slice**: 1 hand-authored thread, 6 documents, 3 identities, 1 organisation, 2 hardcoded locations, 1 anchor + 1 fallback, journal + evidence list, manual Mark Interesting. No graph, theories, runtime AI, packs, retrofit, migration. | We need the smallest build that proves the intended feeling and de-risks persistence/placement/evidence. |
| P4-R02 | Write one complete hand-authored thread fixture before finalising schemas. | Content must drive the schema, not the reverse. |
| P4-R03 | **No-AI is the primary experience.** Development-time AI may assist drafting; runtime AI is an optional bonus only. | Network/API-key/cost/distribution constraints must not gate the core game loop. |
| P4-R04 | Retrofit, migration, and external content packs are **not in v1**. | They add large technical risk before the core experience is proven. |
| P4-R05 | Relationship graph is **v2**, secondary to journal + evidence list, and must be prototyped separately before commitment. | It is plausibly the largest UI work item. |
| P4-R06 | Replay variation means **different entry points, placements, timing/details into the same authored conspiracy**, not different core truths. | This reconciles low randomness with replay variation. |
| P4-R07 | Full diagnostics are **development/debug gated** only. Normal play never exposes hidden conspiracy state. | A truth-dump hotkey defeats the mystery pillar. |
| P4-R08 | Expected asset-text model is **hybrid**: normal vanilla inventory/container behaviour plus custom reader/Inspect rendering for world-specific ModData; native readable behaviour may be used for static pre-baked assets. Final ruling awaits T7. | PZ runtime item text capabilities are load-bearing and unproven. |
| P4-R09 | Ship usable defaults, but no default is sacred. | Resolves P1-Q17/P2-Q49 without forcing configuration from scratch. |
| P4-R10 | Decouple **content revision**, **Conspiracy-Files schema/API compatibility**, and **PZ build compatibility**. Typo/text-only compatible fixes do not require save migration. PZ support targets a minor line (provisionally 42.20.x), not every patch. | Exact-match versioning makes a never-finished content project unmaintainable. |
| P4-R11 | Runtime-AI/system/player provenance is stored and an **optional provenance toggle** may display it. AI-assisted, human-approved authored assets are treated as normal authored content in-fiction. | Players need a way to audit generated interpretation without making the notebook visually noisy by default. |
| P4-R12 | Localise UI/static strings. Dynamic/template-composed story prose is English-first and not guaranteed localisable in v1. | Runtime composition and full localisation conflict. |
| P4-R13 | Replace popup onboarding with an **in-fiction first notebook/help page**. Use **one global notebook keybind**; help lives inside the notebook. Pause preference lives in mod options. | Reduces quest-like UI and keybind collisions. |
| P4-R14 | Archive relevance is re-evaluated **only on affected evidence/relationship events**, using shared entity/metadata indexes; never re-score all evidence pairs continuously. | Makes auto-resurface compatible with the performance rules. |
| P4-R15 | Organisation refinement vs identity non-merge is deliberate: an organisation record's label may become known, while separate identity nodes preserve alias encounter history even when linked SAME_PERSON. | Resolves apparent inconsistency without discarding useful history. |
| P4-R16 | Provisional non-initialisation runtime budget: **≤2 ms/frame** for Conspiracy-Files work, with a queued work scheduler and bounded per-frame batches. | PZ Lua runs on the main thread; performance needs an explicit budget. |
| P4-R17 | Provisional canonical save-state target: **≤500 KB per save**; never persist the entire map registry unless spike data proves it cheap. | Gives T1 a measurable architectural target. |
| P4-R18 | Multiplayer: detect MP and disable Conspiracy-Files cleanly until MP support is explicitly designed. | Solo-first must not mean half-running in MP. |
| P4-R19 | Every PZ event adapter gets a `pcall` boundary; repeated subsystem failures auto-disable that subsystem and surface one concise notification/log entry. | Prevents error spam and half-written state. |
| P4-R20 | The domain core must have **zero PZ runtime dependencies** and be testable under plain Lua 5.1; all engine contact stays behind integration adapters. | Makes unit testing possible without launching the game. |
| P4-R21 | Compatibility rules: no vanilla Lua replacement, no global namespace pollution beyond `ConspiracyFiles`, cooperative context-menu/event hooks, never assume exclusive listener ownership. | Turns mod compatibility from aspiration into enforceable architecture. |
| P4-R22 | Death summary has a deterministic no-AI fallback generated from canonical state and persisted before/at death handling; optional AI may enhance it later. A failed/pending AI call must never lose the epilogue. | Death is abrupt and the payoff cannot depend on a network request. |
| P4-R23 | If retrofit returns after v1, eligibility is **per candidate**: selected placements must be never-loaded and enough reachable candidates must remain. The global >90% rule is retired. | The global metric does not measure whether usable story locations remain. |
| P4-R24 | If tracked physical evidence identity is lost, the evidence record remains, is marked physical-object-unavailable, and tracking stops until the same stamped identity is observed again. | Preserves investigation truth without pretending the item can always be followed. |
| P4-R25 | Graph v2 starts with a provisional **250 visible-node cap**; above it the view must filter/aggregate. Final budget awaits graph prototype/perf measurements. | Prevents unbounded UI growth from duplicate context and alias nodes. |
| P4-R26 | Content owner: the project owner writes/approves canonical content; AI may assist drafting during development. First fixture is hand-authored before schema extraction. | Establishes ownership and avoids schema-first content design. |
| P4-R27 | Three target reward moments are specified in `docs/requirements/PLAYER_MOMENTS.md`. | The mod needs concrete emotional/UI payoffs despite no completion state. |
| P4-R28 | “Long inactivity” means a **real-world gap between play sessions**, not in-game elapsed time; implementation mechanism remains to be proven. | The intent is return-player memory assistance. |
| P4-R29 | One normal-play global keybind: open notebook. Diagnostics use debug tooling, not another normal-play key. | Reduces conflicts in heavily modded games. |
| P4-R30 | Successful migrations (future feature) retain a minimal audit record: from-version, to-version, timestamp/result. | Needed for diagnostics/support even if full migration history is unnecessary. |

---

# Technical decisions pending spikes

The following are intentionally **not settled** until the corresponding Build 42 probes run:

- T1 canonical state limits and final save-size ceiling.
- T2 full meta-grid enumeration cost and work-scheduler needs.
- T3 automatic location categorisation reliability; v0.1 uses curated locations regardless.
- T4 exact-once deferred placement hook/idempotency model.
- T5 persistent physical item identity behaviour.
- T6 never-loaded chunk detection (future retrofit only).
- T7 asset text/name/page mutation; P4-R08 is the expected model, not yet proven.
- T8 building/room/non-building arrival detection.
- T9 Lua network egress; runtime AI remains optional regardless.
- T10 cooperative Inspect/context-menu integration.
