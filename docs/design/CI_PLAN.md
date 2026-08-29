# CI Plan

CI is intentionally not enabled while the repository contains no Lua implementation, but the architecture is designed so CI is cheap to add as soon as code exists.

## Required jobs once Lua exists

1. **Lua static checks** — `luacheck` over the PZ-free domain core and project-owned Lua.
2. **Unit tests** — `busted` (or an equivalent Lua 5.1-compatible test runner) against the domain core with no Project Zomboid runtime classes.
3. **Content validation** — a tool under `tools/` validates built-in story fixtures/IDs/references against the project schema once that schema is extracted from real content.
4. **Secret scan** — reject committed API keys/provider profiles/local secrets.

## Architectural requirement

CI is only practical if the domain core has zero PZ dependencies. Engine integration adapters are verified with in-game spikes/integration checks; domain logic is tested outside the game.

Do not create a generic content-pack schema validator until at least a second real content set exists; validate the built-in fixture first.
