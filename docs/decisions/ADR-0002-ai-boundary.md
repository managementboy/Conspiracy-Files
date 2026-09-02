# ADR-0002 — AI is optional; no-AI is primary

**Status:** Accepted

## Context
Runtime AI implies network transport, player credentials/API key, latency, cost and Workshop/distribution complexity. T9 confirmed on Build 42.20.4 that vanilla Lua exposes no general HTTP request/response or asynchronous transport surface. The core investigation experience must not depend on it.

## Decision
- No-AI play is the primary fully supported experience.
- Development-time AI may draft content, but a human must approve canonical assets.
- Runtime AI is an optional enhancement for summaries only and never creates authoritative facts.
- Every runtime-AI feature requires a deterministic no-AI path.
- Save files never contain API credentials.
- Any future general runtime-AI transport crosses an explicit Java/ZombieBuddy or external-companion boundary and remains outside v0.1.

## Consequences
The notebook, story content and supported interpretations must be useful without a provider. T9's negative general-egress result does not block v0.1; it makes a future optional transport dependency explicit. See `docs/research/T9_NETWORK_EGRESS.md`.
