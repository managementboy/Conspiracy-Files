# Conspiracy-Files — Agent / Codex Instructions

Before making any design or code change:

1. Read `/PROJECT_STATE.md`.
2. Read `/DECISIONS.md` for settled product and capability decisions.
3. Read `/docs/architecture/ARCHITECTURE_PROPOSAL.md` for the current architecture direction.
4. Check `/docs/research/` for verified Build 42 API findings before assuming a Project Zomboid hook or capability exists.

## Project rules

- Target Project Zomboid Build 42 only.
- Vanilla Lua first. Do not add ZombieBuddy/Java unless missing API access, measured performance, or persistence/data-processing complexity justifies it.
- No implementation should silently contradict an existing decision. If technical reality conflicts with a decision, document the conflict before changing behavior.
- The central conspiracy model is authoritative; UI is a derived view.
- Runtime AI may narrate verified state but must not create authoritative world facts.
- Preserve Project Zomboid's normal survival loop; do not turn Conspiracy-Files into a linear quest framework.
- Prefer native PZ UI/item behavior and add custom interaction only where vanilla has no suitable action.
- New technical decisions with lasting consequences should be documented in `docs/decisions/`.
- New Build 42 API assumptions should be verified and recorded in `docs/research/`.

## Current phase

Planning and architecture. Do not treat conceptual architecture names as finalized physical module/file names until technical proof work validates them.
