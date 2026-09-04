# Conspiracy-Files — Agent / Codex Instructions

Before making any design or code change:

1. Read `/PROJECT_STATE.md`.
2. Read `/ROADMAP.md`.
3. Read `/DECISIONS.md` — current authoritative decisions.
4. Use `/DECISIONS_BASELINE.md` only for historical discovery context.
5. Read `/DECISIONS_SUPERSESSIONS_2026-08-30.md` for the review correction trail.
6. Read `/docs/architecture/ARCHITECTURE_V0.2.md`.
7. Check `/docs/research/` before assuming a Project Zomboid Build 42 hook/capability exists.

## Project rules

- Target Project Zomboid Build 42; exact supported minor line must follow verified research.
- Vanilla Lua first. Add ZombieBuddy/Java only for missing API access, measured performance, or persistence/data-processing complexity.
- The domain core must have zero PZ runtime dependencies and be testable in plain Lua 5.1. All engine contact belongs behind integration adapters.
- The central conspiracy model is authoritative; UI is a derived view.
- Immutable evidence facts, mutable interpretation.
- No-AI is the primary supported experience. Runtime AI is optional and may never create authoritative world facts.
- Preserve PZ's normal survival loop; do not turn Conspiracy-Files into a linear quest framework.
- Prefer native PZ behavior, but use a custom reader/Inspect surface if T7 proves runtime story text cannot use native readers safely.
- No vanilla Lua file replacement; no global namespace pollution beyond one `ConspiracyFiles` table; hooks must be cooperative.
- Detect multiplayer and disable cleanly until MP support is explicitly designed.
- Full hidden-state diagnostics are debug/development only.
- Outside initialization, target ≤2 ms/frame and use bounded queued work rather than unbounded loops.
- Completed T1 makes ≤500 KB/save the hard v0.1 canonical-state budget under P4-R17, with mandatory staged recursive validation before canonical ModData replacement under P4-R32.
- P4-R44/ADR-0006 permits a ZombieBuddy-based helper only through the separately auditable `dev/t10-zombiebuddy-helper/` Build 42.20.4 T10/E08 fixture contract. Do not install/configure it or broaden it: it is never production payload, normal-play automation, direct-world support, hidden-truth access, arbitrary input, injection, or authority to alter PZ, saves, controls, security or power.

## Decision integrity

- No implementation should silently contradict an existing decision.
- **If a spike disproves a decision, supersede it in `DECISIONS.md`, link the spike/issue/result, and record the replacement. Technical reality wins.**
- New technical decisions with lasting consequences go in `docs/decisions/`.
- New Build 42 API assumptions must be verified and recorded in `docs/research/`.

## Current delivery scope

The first implementation target is the `ROADMAP.md` v0.1 vertical slice. Do not pull graph, AI, content packs, retrofit, migration, or multiplayer into v0.1.
