# ADR-0004 — Which interpreter proves what

**Status:** Accepted, 2026-09-12. Supersedes nothing; records the split that
`tools/kahlua/run.sh`, `test/run.lua` and `tools/autotest/` already assume.

## Context

The project has three ways to run Lua, and a handoff on 2026-09-11 asked for a
behaviour test under Kahlua that Kahlua cannot run. The reason is recorded in
[KAHLUA_CLI.md](../research/KAHLUA_CLI.md): a bare `J2SEPlatform` has no
`require`, `dofile`, `io` or `next`, so a test cannot load the module it is
testing. `pcall` is worse than absent — it throws a Java `NullPointerException`
outside the game, so any module built around `pcall` containment is untestable
there.

Meanwhile the Linux auto-testing decision of 2026-09-11 added a fourth option
that did not exist when the earlier handoffs were written: the real game, run
unattended, with `tools/autotest/pz.sh eval` to ask it questions.

## Decision

Each layer proves one thing, and nothing is asked of a layer that cannot
answer it.

| Layer | Command | Proves |
|---|---|---|
| PUC Lua 5.1 | `lua5.1 test/run.lua`, `lua5.1 test/<one>.lua` | Behaviour, against mocks. The only layer where a test harness works. |
| Kahlua | `tools/kahlua/run.sh --parse-all` | The engine's own compiler accepts every shipped file. Also, with a small script, whether a standard-library call Kahlua lacks is being used. |
| Real game, Linux | `tools/autotest/*.sh`, `pz.sh eval` | Engine behaviour: loading, events, persistence, timing, fault containment. Counts as evidence. |
| Real game, Windows | Attended session | How it feels, Workshop delivery, owner acceptance. No injected helpers. |

A behaviour test under Kahlua is not required and should not be requested.
Where Kahlua's own gaps matter, check them directly — a short script that
exercises the standard-library calls a module relies on and exits non-zero if
one is missing — rather than trying to run the module.

## Consequences

- The receiver rule in `AGENTS.md` stays load-bearing: plain-table mocks under
  PUC Lua cannot catch `object.method()`, and neither can Kahlua parsing. Only
  the real game does, which is now cheap to reach on Linux.
- A module written so it can only be proven inside the game is acceptable, so
  long as an autotest check covers it.
- If the Kahlua runner ever gains a `require`/`dofile` shim, this ADR should be
  revisited rather than worked around.
