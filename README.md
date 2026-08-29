# Conspiracy-Files

A Project Zomboid Build 42 investigation and conspiracy module.

Conspiracy-Files layers an open-ended mystery system over normal Project Zomboid survival. The player discovers documents, objects, locations, identities, events, and relationships while simply trying to stay alive. There is no conventional quest completion and no guaranteed truth before death.

## Project status

**Planning / architecture. No implementation code yet.**

GitHub is the source of truth for cross-chat and future Codex work.

## Start here

1. [`PROJECT_STATE.md`](PROJECT_STATE.md) — concise bootstrap for a new chat or development session.
2. [`DECISIONS.md`](DECISIONS.md) — detailed product, player-requirement, and capability decisions.
3. [`docs/architecture/ARCHITECTURE_PROPOSAL.md`](docs/architecture/ARCHITECTURE_PROPOSAL.md) — current proposed system architecture.

## Repository layout

- `docs/architecture/` — architecture and subsystem specifications.
- `docs/requirements/` — product vision, capabilities, and player requirements.
- `docs/design/` — detailed design specifications created before implementation.
- `docs/research/` — verified Project Zomboid Build 42 API/modding research.
- `docs/decisions/` — future ADR-style technical/design decisions.
- `content-packs/` — future isolated conspiracy content packs and schemas.
- `mod/42/` — future Project Zomboid Build 42 mod source/package tree.
- `dev/` — development-only probes and tooling.
- `tools/` — validation/build/support tools.
- `test/` — tests and fixtures.

## Architecture direction

The current direction is a **Lua-first modular monolith** using vanilla Project Zomboid Lua/events/exposed Java APIs wherever possible. ZombieBuddy/Java remains optional and should only be introduced for missing API access, demonstrated performance bottlenecks, or persistence/data-processing complexity.
