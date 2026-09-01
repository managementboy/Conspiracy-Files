# Release and Distribution

**Status:** Approved policy; deterministic local pipeline implemented.
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

## Local deterministic pipeline

Requirements are Git, Python 3, a PUC Lua 5.1-compatible interpreter and compiler (`lua5.1` and `luac5.1` by default). The validation and packaging work is entirely local and makes no network, GitHub or Workshop calls.

Run the complete gate from a clean repository checkout:

```text
python3 tools/release_pipeline.py all --output dist
```

The command runs the project suite, compiles every packaged Lua file in syntax-check mode, verifies the exact `mod/` source structure and release metadata, scans production candidates for forbidden paths/files and credential patterns, builds twice and compares every output SHA-256, then writes:

```text
dist/
├── Conspiracy-Files-0.1.0-github.zip
├── Conspiracy-Files-0.1.0-workshop.zip
├── Conspiracy-Files-0.1.0-workshop/
│   └── Contents/mods/ConspiracyFiles/...
└── SHA256SUMS
```

The GitHub ZIP has `ConspiracyFiles/` as its installable root. The Workshop directory and ZIP have `Contents/mods/ConspiracyFiles/` as their root. Both wrap byte-identical copies of one staged payload. That payload contains `release-metadata.json`, deterministic `RELEASE_NOTES.md`, and `SHA256SUMS` covering every other payload file.

The metadata authority is `release/release.json`; the pipeline rejects a version, content revision, schema version or minimum PZ version that disagrees with the production Lua or `mod.info`. It also refuses a dirty working tree, making the recorded 40-character source commit exact.

Useful narrower gates are:

```text
python3 tools/release_pipeline.py verify
python3 tools/release_pipeline.py reproducibility-test
python3 -m unittest discover -s test -p 'test_release_pipeline.py'
```

`CF_LUA` and `CF_LUAC` may name alternate offline Lua 5.1-compatible binaries. No command uploads or publishes anything.

## Cross-device prerelease smoke test

1. On the build device, run the complete gate and retain `dist/SHA256SUMS` with the two ZIPs.
2. Verify the artifacts from inside the output directory (`cd dist && sha256sum -c SHA256SUMS`), then transfer the GitHub ZIP to a second device and verify its SHA-256 again before extraction. Do not copy the repository or an existing mod directory.
3. Extract `ConspiracyFiles/` into that device's `Zomboid/mods/` directory. Confirm the installed payload's `SHA256SUMS` and `release-metadata.json` remain present.
4. Start the exact verified PZ build recorded in the metadata, enable only Conspiracy-Files in a new disposable single-player save, and confirm the mod loads without an initialization error. Multiplayer must remain disabled.
5. Record operating system, enabled mods, clean/copied-save status, exact artifact checksum, source commit, content/schema revisions and PZ build. Exercise the currently applicable v0.1 smoke matrix and retain only sanitized Conspiracy-Files log excerpts.
6. Remove the disposable save and test installation after the report. A successful smoke permits consideration of an unlisted Workshop beta; it does not publish one and does not satisfy the remaining live acceptance matrix by itself.
