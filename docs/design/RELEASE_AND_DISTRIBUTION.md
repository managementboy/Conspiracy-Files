# Release and Distribution

**Status:** Approved policy; deterministic pipeline implemented and tested offline, promotion gates pending.
**Authority:** ADR-0003, P4-R46 and PM-GOV-001.

## Licence and disclosure

The repository's CC0-1.0 dedication is intentionally applied to all project-owned code, documentation and narrative content. It does not purport to relicense Project Zomboid, third-party assets, names or trademarks. Release and Workshop descriptions include the approved disclosure wording from `AI_PROVENANCE.md`.

## Release channels

| Channel | Audience | Delivery | Gate |
|---|---|---|---|
| Local development | Developers on the X380 | Repository checkout | Relevant local tests pass |
| Internal test | Project owner and invited device testers | Versioned GitHub prerelease ZIP or temporary CI artifact | Automated validation and installable package |
| Beta | Invited Workshop testers | Unlisted/access-limited Steam Workshop item | Successful install/load on another device |
| Stable | Public players | Public Steam Workshop item plus retained GitHub release | Complete v0.1 acceptance matrix |

## Artifact contract

The deterministic packager generates one production payload for both GitHub and Workshop wrappers. Its current layout follows the production shell's offline-validated Build 42 package shape; the real loader behavior remains subject to T11 live acceptance.

The package contains only loadable production files and required metadata/assets. It excludes:

- `dev/`, `test/`, raw research evidence and local audit archives;
- `.git/`, repository-management files and contributor instructions;
- saves, machine configuration, paths and logs;
- credentials, secrets, provider profiles and helper binaries.

Each build identifies its Conspiracy-Files version, source commit, content revision, state-schema version and supported PZ build. Retained artifacts receive a SHA-256 checksum and release notes containing known limitations and an explicit save-compatibility statement.

## Validation gate

Before promotion, automation runs:

1. run the plain-Lua suite;
2. run Lua static/syntax checks;
3. validate built-in IDs/references and package contents;
4. reject secrets and forbidden development/local files;
5. build the package twice and compare manifests/checksums where practical;
6. fail closed unless the exact changed-range base exists, then audit the full range for unexpected paths, removed-feature residue, localization consumption, release/version metadata and stale documentation;
7. run adversarial negative persistence/identity cases and inspect their raw artifacts in addition to summarized results;
8. require independent offline QA on the exact candidate commit; any later production-code change invalidates that QA;
9. require a separate clean-device smoke before Workshop beta; this is not an offline pipeline claim.

Development artifacts may be disposable. A retained prerelease or release must
remain traceable from its owning decision/acceptance criterion through the exact
source commit and offline/live evidence to its checksum. Offline evidence never
substitutes for a required live matrix.

## Device test report

Every report should record:

- artifact version and checksum;
- source commit and content revision;
- exact PZ build and operating system;
- enabled mods and whether the save was clean or copied;
- reproduction steps and only sanitized Conspiracy-Files log evidence.

Internal testing uses disposable saves until the release explicitly declares save compatibility.
