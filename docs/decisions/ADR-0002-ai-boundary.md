# ADR-0002 — AI is optional; no-AI is primary

**Status:** Accepted

## Context
Runtime AI implies network transport, player credentials/API key, latency, cost and Workshop/distribution complexity. Vanilla Lua network egress is unproven and expected to be unavailable. The core investigation experience must not depend on it.

## Decision
- No-AI play is the primary fully supported experience.
- Development-time AI may draft content, but a human must approve canonical assets.
- Runtime AI is an optional enhancement for summaries only and never creates authoritative facts.
- Every runtime-AI feature requires a deterministic no-AI path.
- Save files never contain API credentials.

## Consequences
The notebook, story content, theories/interpretations and death recap must be useful without a provider. T9 determines transport options, not whether the core game works.
