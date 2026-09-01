# ADR-0003 — Reproducible release artifacts and staged distribution

**Status:** Accepted
**Decision date:** 2026-09-01

## Context

The Lenovo X380 is a development and local Project Zomboid test machine, not a distribution host or the sole source of a testable build. Conspiracy-Files must be installable on other devices without copying a working tree, development probes, local saves, logs, helper binaries, or machine-specific state.

Build 42 packaging still requires production-shell verification. The distribution policy must therefore define reproducibility and release gates without prematurely freezing an unverified directory layout.

## Decision

The repository and its reviewed history are the source of truth. Testers receive versioned artifacts produced by a deterministic packager from a specific commit.

Distribution uses staged channels:

1. **Local development:** the X380 repository checkout and disposable local saves.
2. **Internal test:** versioned GitHub prerelease ZIPs, or temporary CI artifacts, after automated validation.
3. **Beta:** an unlisted or otherwise access-limited Steam Workshop item after the packaged mod installs and loads successfully on another device.
4. **Stable:** a public Workshop release only after the v0.1 acceptance matrix passes.

The GitHub ZIP and Workshop upload must be generated from the same production payload. No hand-edited Workshop-only copy is maintained.

Every retained test/release artifact includes or is accompanied by:

- Conspiracy-Files version;
- source commit;
- content revision, beginning with `dead-air-r1`;
- canonical-state schema version;
- supported/verified Project Zomboid Build 42 line;
- SHA-256 checksum;
- concise change log, known limitations and save-compatibility statement.

Packaging excludes development probes, tests, raw research evidence, Git metadata, local saves/configuration, machine paths, logs, credentials, provider profiles and helper binaries. CI must run the applicable Lua tests, content/static validation, secret scan and package validation before an artifact is promoted.

## Consequences

- Test results can name one exact artifact instead of an unknown working copy.
- Other devices do not need a development checkout or the X380's local environment.
- GitHub prereleases provide auditable internal builds before Workshop publication.
- Workshop convenience cannot bypass repository validation or v0.1 acceptance.
- A packaging/release-pipeline implementation remains required after the production shell verifies the exact Build 42 mod layout.
