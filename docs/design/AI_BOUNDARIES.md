# AI Boundaries

**Current decision:** no-AI is the primary supported experience. See `docs/decisions/ADR-0002-ai-boundary.md` and `docs/design/AI_PROVENANCE.md`.

- Development-time AI may write content; no separate approval step (P4-R97).
- Runtime AI is optional and never creates authoritative facts.
- Every runtime-AI feature requires a deterministic no-AI path.
- Provider credentials never live in the save or repository.
- T9 decides network/transport feasibility; it does not gate core gameplay.

Do not expand runtime-AI architecture until T9 has an observed Build 42 result.
