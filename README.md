# Conspiracy-Files

A Project Zomboid Build 42 investigation/conspiracy module.

**Current phase:** engineering de-risk and v0.1 definition. The project deliberately moved from a broad first-draft specification to a small vertical slice after lead-developer review.

## Start here

1. [`PROJECT_STATE.md`](PROJECT_STATE.md) — current state and immediate gates.
2. [`ROADMAP.md`](ROADMAP.md) — v0.1/v1/v2 scope.
3. [`DECISIONS.md`](DECISIONS.md) — historical discovery decisions.
4. [`DECISIONS_SUPERSESSIONS_2026-08-30.md`](DECISIONS_SUPERSESSIONS_2026-08-30.md) — authoritative review corrections where they conflict with the baseline.
5. [`docs/architecture/ARCHITECTURE_V0.2.md`](docs/architecture/ARCHITECTURE_V0.2.md) — current architecture.
6. [`docs/research/`](docs/research/) — Build 42 probe results; observed technical facts override assumptions.
7. [`docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md`](docs/reviews/ENGINEERING_REVIEW_RESPONSE_2026-08-30.md) — review disposition and rulings.

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
- `mod/` — future loadable mod.
- `tools/` — future validators/build helpers.

No production feature code should be built on an unverified Build 42 assumption when a listed spike can answer it first.
