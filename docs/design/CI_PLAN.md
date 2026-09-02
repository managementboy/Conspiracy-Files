# CI Plan

**Status:** Implemented by `.github/workflows/ci.yml`.

## Required jobs

1. **Lua static checks** — `luacheck` over the PZ-free domain core and project-owned Lua.
2. **Unit tests** — `lua5.1 test/run.lua` against the domain core and fake-backed integration shell with no Project Zomboid runtime classes.
3. **Content validation** — `lua5.1 tools/validate_content.lua` validates the built-in registries, IDs, references and approved fixture bodies.
4. **Secret scan** — reject committed API keys/provider profiles/local secrets.

## Architectural requirement

CI is only practical if the domain core has zero PZ dependencies. Engine integration adapters are verified with in-game spikes/integration checks; domain logic is tested outside the game.

Do not create a generic content-pack schema validator until at least a second real content set exists; validate the built-in fixture first.
