# CI Plan

CI validation is enabled in `.github/workflows/release-validation.yml`. It has read-only repository permission, runs tests and the deterministic double-build gate, and neither uploads nor publishes artifacts.

## Validation responsibilities

1. **Lua syntax checks** — Lua 5.1 `luac -p` over every packaged Lua source.
2. **Project suite** — the dependency-free Lua 5.1 runner covers the domain core, production shell and built-in content/binding drift.
3. **Package validation** — exact Build 42 layout, metadata consistency, forbidden-file, local-path and credential-pattern checks.
4. **Reproducibility** — two complete builds must have identical per-path SHA-256 manifests, including both ZIP files.

## Architectural requirement

CI is only practical if the domain core has zero PZ dependencies. Engine integration adapters are verified with in-game spikes/integration checks; domain logic is tested outside the game.

Do not create a generic content-pack schema validator until at least a second real content set exists; validate the built-in fixture first.

The workflow installs only the Lua 5.1 toolchain, calls the repository-owned offline pipeline and defines no upload, release or Workshop step.
