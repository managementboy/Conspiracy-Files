# CI Plan

**Status:** Core jobs implemented by `.github/workflows/ci.yml`; deterministic
artifact/range checks are implemented by `.github/workflows/release-validation.yml`.
PM-GOV-001 independent review and promotion decisions remain human gates.

## Required jobs

1. **Lua static checks** — `luacheck` over the PZ-free domain core and project-owned Lua.
2. **Unit tests** — `lua5.1 test/run.lua` against the domain core and fake-backed integration shell with no Project Zomboid runtime classes.
3. **Content validation** — `lua5.1 tools/validate_content.lua` validates the built-in registries, IDs, references and approved fixture bodies.
4. **Secret scan** — reject committed API keys/provider profiles/local secrets.
5. **Release validation** — require a resolvable event/base range (only an exact
   all-zero new-branch sentinel selects the empty tree), run changed-range diff
   hygiene, and build the deterministic payload twice from a clean commit.

## PM-GOV-001 candidate gate

Before independent QA or any later promotion, the exact candidate range must
also be audited for unexpected paths, removed-feature residue, localization
consumption, release/version metadata and stale documentation. Integrity changes
require positive and adversarial negative evidence plus raw artifact inspection.
Any production-code change invalidates prior independent QA. Record traceability
from decision and acceptance criterion to exact offline evidence and the named
live matrix; do not treat CI success as live acceptance.

## Architectural requirement

CI is only practical if the domain core has zero PZ dependencies. Engine integration adapters are verified with in-game spikes/integration checks; domain logic is tested outside the game.

Do not create a generic content-pack schema validator until at least a second real content set exists; validate the built-in fixture first.
