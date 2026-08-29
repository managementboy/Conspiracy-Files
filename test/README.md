# Tests

The domain core must be testable without launching Project Zomboid.

## Rule
All Project Zomboid classes/events stay behind integration adapters. Domain model, relationships, evidence rules, journal rules, validation and pure content logic run under plain Lua 5.1 tests.

## Planned layers
- **Unit tests:** plain Lua 5.1, run in CI once implementation exists.
- **Content fixtures:** hand-authored narrative examples under `test/fixtures/`; `THREAD-001-DEAD-AIR.md` is the first schema-pressure fixture.
- **In-game spikes/integration checks:** PZ-specific behaviour under `dev/`, recorded in `docs/research/`.

A code change that can only be verified by launching the game should be isolated to the integration adapter wherever possible.
