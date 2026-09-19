# Conspiracy-Files

## Latest premise clarification — 2026-09-19

The search for why the survivor is isolated in Knox drives the investigations, although the Knox Event has no definitive explanation. Start with the [revised development handoff](docs/management/CENTRAL_MYSTERY_DEVELOPMENT_HANDOFF_2026-09-19.md) and [all 32 decisions reassessed](docs/design/CENTRAL_MYSTERY_REVIEW_2026-09-19.md). Personal openings use our own local clues; naturally discovered annotated maps each lead to destination evidence and a meaningful local payoff connected to the central search. No random occupation-flyer prerequisite or secret final answer. Specific story details and unresolved trigger/coverage rules remain proposals. Planning only; no new engine verification.


A Project Zomboid Build 42 investigation/conspiracy module.

**Current phase (2026-09-19):** playable development baseline DEV-0.44.0-addresses-that-travel; revised direction and occupation/media integration planning ready for Linux. Start with the [Linux handover](docs/management/LINUX_HANDOVER_2026-09-19.md).

## Start here

1. [`PROJECT_STATE.md`](PROJECT_STATE.md) — current state and immediate gates.
2. [`ROADMAP.md`](ROADMAP.md) — v0.1/v1/v2 scope.
3. [`DECISIONS.md`](DECISIONS.md) — **current authoritative decision index**.
4. [`DECISIONS_BASELINE.md`](DECISIONS_BASELINE.md) — historical discovery record.
5. [`DECISIONS_SUPERSESSIONS_2026-08-30.md`](DECISIONS_SUPERSESSIONS_2026-08-30.md) — engineering-review correction trail.
6. [`docs/architecture/ARCHITECTURE_V0.2.md`](docs/architecture/ARCHITECTURE_V0.2.md) — current architecture.
7. [`docs/research/`](docs/research/) — Build 42 probe results; observed technical facts override assumptions.
8. [`docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md`](docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md) — review disposition and rulings.

## Core direction

- Solo-first; disable cleanly in multiplayer until MP is designed.
- Vanilla Lua first; narrow Java/ZombieBuddy boundary only if proven necessary.
- One canonical domain model; UI is a projection.
- Immutable evidence facts, mutable interpretation.
- Offline authored content and local generation are the gameplay direction; development-time AI is separate.
- Organiser plus physical evidence are primary; meaningful map connections and a separate relationship graph are later work.
- Personal opening comes next, followed by survival connections and loop improvements.

## Repository

- `docs/requirements/` — product/player requirements and target player moments.
- `docs/architecture/` — architecture.
- `docs/design/` — design specifications/budgets/policies.
- `docs/research/` — spike templates and observed PZ API results.
- `docs/decisions/` — ADRs.
- `docs/reviews/` — engineering review trail.
- [`docs/reference/pzwiki/`](docs/reference/pzwiki/README.md) — offline PZwiki modding references, examples, and category indexes for development; external context, not a replacement for verified project research.
- [`docs/reference/pz-api/`](docs/reference/pz-api/README.md) — offline Build 42.20.4 API and script definitions, examples, mapping data, translations, and XML references.
- `test/fixtures/` — hand-authored content fixtures before schemas.
- `mod/` — loadable mod source.
- `tools/` — validators, build helpers and research tools.

No production feature code should be built on an unverified Build 42 assumption when a listed spike can answer it first.
