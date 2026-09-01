# Conspiracy-Files

A Project Zomboid Build 42 investigation/conspiracy module.

**Current phase:** v0.1 vertical-slice integration. The PZ-free Dead Air domain, production shell, exact location bindings, E02–E07 world adapters and presentation/input surface are implemented offline; end-to-end live Build 42 acceptance is still pending.

## Start here

1. [`PROJECT_STATE.md`](PROJECT_STATE.md) — current state and immediate gates.
2. [`ROADMAP.md`](ROADMAP.md) — v0.1/v1/v2 scope.
3. [`DECISIONS.md`](DECISIONS.md) — **current authoritative decision index**.
4. [`DECISIONS_BASELINE.md`](DECISIONS_BASELINE.md) — complete original 207-question discovery record.
5. [`DECISIONS_SUPERSESSIONS_2026-08-30.md`](DECISIONS_SUPERSESSIONS_2026-08-30.md) — engineering-review correction trail.
6. [`docs/architecture/ARCHITECTURE_V0.2.md`](docs/architecture/ARCHITECTURE_V0.2.md) — current architecture.
7. [`docs/research/`](docs/research/) — Build 42 probe results; observed technical facts override assumptions.
8. [`docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md`](docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md) — review disposition and rulings.

## Core direction

- Solo-first; disable cleanly in multiplayer until MP is designed.
- Vanilla Lua first; narrow Java/ZombieBuddy boundary only if proven necessary.
- One canonical domain model; UI is a projection.
- Immutable evidence facts, mutable interpretation.
- No-AI is the primary experience; AI is optional enhancement and development-time authoring assistance.
- Journal + evidence list are the primary v1 interface; graph is v2.
- Content comes before generic pack schema: build one real thread first.

## Repository

- `docs/requirements/` — product/player requirements and target player moments.
- `docs/architecture/` — architecture.
- `docs/design/` — design specifications/budgets/policies.
- `docs/research/` — spike templates and observed PZ API results.
- `docs/decisions/` — ADRs.
- `docs/reviews/` — engineering review trail.
- `test/fixtures/` — hand-authored content fixtures before schemas.
- `mod/` — loadable Build 42 mod root; production adapters still require their named live acceptance matrices.
- `tools/` — offline validators and deterministic release tooling.

No production feature code should be built on an unverified Build 42 assumption when a listed spike can answer it first.
