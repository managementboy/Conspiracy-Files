# Tests

**DEV-0.6 correction:** run test/run.lua with PUC Lua 5.1.5. Current suite has 42 tests; runtime/menu/UI entries use explicit local mocks and do not control PZ. See the correction evidence directory for archived output. Native rendering, focus, save/reload and timing remain manual live gates.

The domain core must be testable without launching Project Zomboid.

## Rule
All Project Zomboid classes/events stay behind integration adapters. Domain model, relationships, evidence rules, journal rules, validation and pure content logic run under plain Lua 5.1 tests.

## Planned layers
- **Unit tests:** plain Lua 5.1, run in CI once implementation exists.
- **Content fixtures:** hand-authored narrative examples under `test/fixtures/`; `THREAD-001-DEAD-AIR.md` is the first schema-pressure fixture.
- **In-game spikes/integration checks:** PZ-specific behaviour under `dev/`, recorded in `docs/research/`.

A code change that can only be verified by launching the game should be isolated to the integration adapter wherever possible.

## v0.1 domain-core command

With PUC Lua 5.1 (or a Lua 5.1-compatible interpreter) on `PATH`:

```text
lua5.1 test/run.lua
```

The path may be relative or absolute; the runner resolves fixtures and project
modules from its own filename rather than the process working directory.

The runner has no third-party test dependency and intentionally runs with Project Zomboid globals absent. It covers every criterion classified `plain-Lua automated test` in `docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md`. See `docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md` for the exact mapping.
