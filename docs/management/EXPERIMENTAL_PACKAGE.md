# Experimental package — DEV-0.8.1-overnight-20260905

`tools/package_experimental.py` produces a deterministic, **EXPERIMENTAL DEBUG-ONLY** zip. It packages only the current mod runtime roots (`mod/42` and `mod/common`) into the Project Zomboid layout `ConspiracyFiles/42/mod.info` and `ConspiracyFiles/common/...`. Offline prototypes, tests, and documentation are deliberately excluded and remain review material.

The embedded manifest records exact source-byte SHA-256 values, a fixed package version, and the only observed supported build: **42.20.4**. It does not claim compatibility with all Build 42 releases. The tool sorts entries, uses a fixed timestamp and permissions, rejects symlinks, refuses an existing output path, and verifies safe paths, duplicate entries, and manifest rows after building. Runtime input is explicitly limited to `42/mod.info`, `42/README.md`, and `.lua` files below `common`; dot/cache directories are skipped.

Build from the `Conspiracy-Files` directory with a new filename:

```powershell
python tools/package_experimental.py --output ..\artifacts\experimental\ConspiracyFiles-DEV-0.8.1-overnight-20260905.zip
```

Before trying an experimental package, quit the game. Keep the mod zip and a copy of the affected save together so they can be restored as a pair. There is no save migration: if reverting, quit first, restore the prior mod and its matching save backup, then restart. This package contains no claim of gameplay acceptance; only archive integrity is verified.

## Review bundle

`ConspiracyFiles-review-DEV-0.8.1-overnight-20260905.zip` is a separate **NOT INSTALLABLE** archive. It contains an explicit allowlist of tonight's `dev/next-phase` modules, their focused tests, the G2 fault harness, offline benchmark, relevant research/help/ledger documents, and only the shared Lua dependencies needed to review the offline modules. It has no `42/mod.info`, no installable mod root, and does not package the live runtime as review material. `g2_faults.lua` still requires the repository runtime or the separate experimental runtime archive when executed.

## Final artifacts

Use the runtime archive ending `-r2.zip` and the review archive ending `-batch2.zip` in the parent workspace `artifacts/experimental/` folder. Earlier archives are retained as superseded review snapshots. The final review bundle includes packaging tools/tests; its manifest captures the exact ledger snapshot. Reproducibility is verified under the same Python/compression runtime; byte identity across different compression-library versions is not claimed.

The approved-policy review snapshot also contains CampaignPolicy and MultiCaseNotebook, their focused tests and research contracts. The suffix indicates policy decisions were received, not gameplay or prose acceptance. Runtime r2 remains unchanged.

Second-batch review includes the integrated offline flow, encounter/update/archive/bookmark modules and tests. Its shared Generator dependency includes the additive generateSelected API, which is not deployed. Runtime r2 remains the earlier live-test baseline; do not treat the review bundle as a save-compatible replacement mod.
