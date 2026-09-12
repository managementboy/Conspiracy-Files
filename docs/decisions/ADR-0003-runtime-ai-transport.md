# ADR-0003 — Runtime AI transport under the T9 constraint

**Status:** Proposed — owner decision required on the transport option.

Supersedes nothing. Extends [ADR-0002](ADR-0002-ai-boundary.md) with a concrete
transport analysis. Constrained by **P4-R33** and
[T9](../research/T9_NETWORK_EGRESS.md).

## Context

The owner wants mysteries whose theory text, logic and evidence are produced on
demand by an LLM reached with an API key, instead of being authored ahead of
time. The authoring cap is real: every mystery today needs its text, its logic
and its evidence pre-built.

T9 proved on Build 42.20.4 that this cannot be done directly. From vanilla Lua:

- `getUrlInputStream`, `URL`, `URLConnection`, `HttpURLConnection`,
  `HttpClient`, `OkHttpClient`, `Request`, `Socket` — all nil.
- `Thread`, `Runnable`, `luajava`, internal `PublicServerUtil` — all nil, so
  there is no asynchronous surface either.
- The only callable HTTP-like operation, `getPublicServersList`, uses a
  hardcoded URL, blocked `OnTick` for 312 ms, and exposed no status, headers,
  body or error.

**P4-R33** therefore requires any general runtime-AI transport to cross a
Java/ZombieBuddy or external-companion boundary.

T9 did **not** examine file I/O. Vanilla Build 42 Lua does expose it —
`getFileWriter` (16 vanilla call sites), `getFileReader` (12) and `fileExists`
(18) — which opens a transport T9's conclusion does not forbid.

## Options

### A. File-bridge companion — recommended

The mod writes a request file under the Zomboid folder; a small external helper
process watches the directory, calls the LLM, and writes a response file; the
mod polls with `fileExists` and reads with `getFileReader`.

- Vanilla Lua only. No Java mod, no second mod for the user to install.
- Asynchronous by construction: polling never blocks a frame, unlike the 312 ms
  synchronous engine call T9 measured.
- **The API key never enters mod space.** It lives in the helper's own config.
- Absent helper degrades silently to the no-AI experience.
- Cost: the user must run a companion process; that is a real adoption barrier
  and must be optional.

### B. Java/ZombieBuddy companion

Real in-process HTTP exposed to Lua.

- Requires the user to install a Java mod, and is the more fragile option
  across PZ updates.
- The API key passes through mod space. See the risk below.
- Contradicts the Lua-first default in ADR-0001 without a demonstrated need
  that option A cannot meet.

### C. Offline pre-generation — recommended alongside A

Run the model at development time and ship the output as ordinary authored
content. No runtime key, no network, no companion, no new failure mode. This
removes the *authoring volume* cap, which is most of the stated problem, and it
is already permitted by P4-R02/P4-R26 (AI assists drafts; the owner approves
canonical content).

## Decision

Proposed: adopt **C** now and **A** when a runtime need is demonstrated that C
cannot meet. Reject **B** unless A is proven insufficient.

## Non-negotiable constraints on any option

1. **Runtime AI may never create authoritative world facts** (P4-R03). The
   deterministic core owns structure — entities, relations, evidence roles,
   locations, which clue corroborates which. The model renders prose for facts
   already decided.
2. **Generated text is written into canonical state once.** A reload must never
   re-query and the story must never change under the player.
3. **Every generated text has a deterministic fallback that ships.** With no
   key, no network and no helper, the game is complete (P4-R03, P4-R22).
4. **The API key must never reach Lua.** ModData is serialised into the save
   file, so a key held in mod state would be written into savegames that
   players share. This on its own disqualifies the naive approach and is the
   strongest argument for option A over option B.
5. Provenance is recorded for AI-assisted content (P2-Q69 / P4-R11).
6. No network call on the main thread; the 312 ms measured stall is the
   standing example of why.

## Consequences

- The no-AI experience remains primary and complete, unchanged.
- Option A can be built and tested without touching the domain core, because
  the core only ever asks for prose for a structure it already fixed.
- If a future PZ build exposes real HTTP to Lua, only the transport adapter
  changes.

## Open question for the owner

Whether the companion process in option A is acceptable to ask of players, or
whether offline pre-generation (C) is the intended destination on its own.
