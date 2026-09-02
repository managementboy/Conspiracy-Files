# T11 — Minimal loadable Build 42 production package

**Status:** Offline package phase passed; live Build 42 load phase is the next required integration run.
**Target:** Project Zomboid 42.20.x; live acceptance target 42.20.4 revision `b0bbce05d5`.
**Owner:** v0.1 production-integration workstream; the project owner performs any required click-to-start/manual gate.

## Question

Does the production `common/` + `42/` package layout load through Build 42's real mod loader, resolve `require("ConspiracyFiles.*")`, register each additive lifecycle hook once, and preserve/disable canonical state according to ADR-0004?

## Package under test

```text
Contents/mods/ConspiracyFiles/
├── common/media/lua/shared/ConspiracyFilesBootstrap.lua
├── common/media/lua/shared/ConspiracyFiles/**
└── 42/mod.info
```

`mod/42/mod.info` now declares `id=ConspiracyFiles` and `versionMin=42.20.0`. The same `mod/` root is used for local installation and later placed under `Contents/mods/ConspiracyFiles/` by the release packager.

## Phase 1 — offline result

Passed in the repository suite:

- every production Lua file parses/loads under Lua 5.1 where PZ globals are faked;
- the actual Build 42 entrypoint creates only the `ConspiracyFiles` namespace;
- `OnInitGlobalModData`, `OnGameStart`, and `OnTick` are registered additively exactly once;
- no canonical root is created before `OnInitGlobalModData`;
- multiplayer and incompatible-state paths fail closed;
- fixture/ID/reference validation passes independently.

Commands:

```text
lua5.1 test/run.lua
lua5.1 tools/validate_content.lua
```

This phase resolves the old “no `mod.info` / no package tree” defect. It does not prove PZ loader behavior.

## Phase 2 — live matrix (required before adapters rely on it)

1. Install the exact production tree as the sole mod in a marked disposable Sandbox clone.
2. Clean-boot Build 42.20.4 and pass the ordinary click-to-start gate.
3. Record exact game revision, active mod ID, bootstrap log, lifecycle callbacks, and absence of require/loader errors.
4. Save/reload once; prove one schema-2 root and no duplicate hook registration.
5. Repeat with a deliberately incompatible disposable root; prove the bytes are unchanged and the mod reports/enters `disabled-incompatible-state`.
6. Exit normally, restore protected controls byte-for-byte, sanitize the structured transcript, and record limitations/hashes here.

Use the repository's disposable-save safety discipline. This is not a T10 interaction run and must not reintroduce any injected-helper route.

## Limitation

Until phase 2 passes, “loadable production Build 42 mod” remains an unaccepted hypothesis even though the package shape and offline entrypoint are implemented. Adapter implementation may compile against the shell, but no live acceptance claim may depend on loader/require behavior yet.

On 2026-09-01 the reusable harness preflight reached the disposable-save authorization check on the real desktop path and correctly refused the configured Sandbox source because it did not contain `.cf-live-inspection-source`. No save, mod, or protected control was mutated. The marker is explicit owner authorization and was not invented for this review; phase 2 therefore remains blocked until the owner designates an audited disposable source clone.
