# Release and Distribution

**Status:** Approved policy; pipeline not yet implemented.
**Authority:** ADR-0003 and P4-R46.

## Release channels

| Channel | Audience | Delivery | Gate |
|---|---|---|---|
| Local development | Developers on the X380 | Repository checkout | Relevant local tests pass |
| Internal test | Project owner and invited device testers | Versioned GitHub prerelease ZIP or temporary CI artifact | Automated validation and installable package |
| Beta | Invited Workshop testers | Unlisted/access-limited Steam Workshop item | Successful install/load on another device |
| Stable | Public players | Public Steam Workshop item plus retained GitHub release | Complete v0.1 acceptance matrix |

## Artifact contract

The deterministic packager must generate one production payload for both GitHub and Workshop distribution. Its final layout follows the production shell's verified Build 42 result rather than the historical packaging hypothesis in `mod/42/README.md`.

The package contains only loadable production files and required metadata/assets. It excludes:

- `dev/`, `test/`, raw research evidence and local audit archives;
- `.git/`, repository-management files and contributor instructions;
- saves, machine configuration, paths and logs;
- credentials, secrets, provider profiles and helper binaries.

Each build identifies its Conspiracy-Files version, source commit, content revision, state-schema version and supported PZ build. Retained artifacts receive a SHA-256 checksum and release notes containing known limitations and an explicit save-compatibility statement.

## Validation gate

Before promotion, automation should:

1. run the plain-Lua suite;
2. run Lua static/syntax checks;
3. validate built-in IDs/references and package contents;
4. reject secrets and forbidden development/local files;
5. build the package twice and compare manifests/checksums where practical;
6. smoke-install the artifact on a clean test device before Workshop beta.

Development artifacts may be disposable. A retained prerelease or release must remain traceable to its exact source commit and checksum.

## Device test report

Every report should record:

- artifact version and checksum;
- source commit and content revision;
- exact PZ build and operating system;
- enabled mods and whether the save was clean or copied;
- reproduction steps and only sanitized Conspiracy-Files log evidence.

Internal testing uses disposable saves until the release explicitly declares save compatibility.
