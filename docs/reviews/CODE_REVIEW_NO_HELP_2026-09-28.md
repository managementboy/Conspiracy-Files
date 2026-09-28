# Static Code Review — Conspiracy Files: No Help

**Reviewed:** 2026-09-28  
**Repository:** `managementboy/Conspiracy-Files`  
**Branch / revision:** `nohelp-content` at `8581a1fbe5d553db4881cd9c45819debda6df258`  
**Scope:** `mod-nohelp/` runtime/package metadata, with the current project state and No Help handoff used as evidence. This is a focused static review, not a line-by-line audit of all 3,425 tracked files.

## Findings

### F-01 — The package advertises Build 42.0.0 compatibility without evidence for that range

**Severity: P1 — compatibility / release blocker**

`mod-nohelp/42/mod.info:6` declares `versionMin=42.0.0`. The project state and source research identify Build **42.20.4** as the observed/verified target, while the project rules say the supported minor line must follow verified research. That leaves the package metadata promising compatibility with earlier Build 42 versions that this repository does not establish.

If earlier versions lack or differ in any API used by the mod, players can load a package that is advertised as compatible and then hit runtime failures. The metadata also makes future bug reports hard to triage because it does not express the actual tested range.

**Claude action:** Set `versionMin` to the earliest supported version backed by the repository's evidence, or add real compatibility checks for every earlier version the package intends to support. Keep the supported version line consistent in `mod.info`, build/package validation, and the release notes. Do not infer support from “Build 42.”

**Evidence:** `mod-nohelp/42/mod.info:6`; `PROJECT_STATE.md` identifies Build 42.20.4 as the verified line; `AGENTS.md` says the exact supported minor line must follow verified research.

### F-02 — Vehicle candidate discovery suppresses errors and returns a partial catalogue

**Severity: P2 — silent feature loss / diagnosability**

`mod-nohelp/common/media/lua/shared/NHShared/Generated/Storage.lua:153-154` wraps the entire `addVehicles` pass in `pcall`, discards the error value, and continues with the furniture-only results. The failure branch (`rooms=rooms`) is a no-op. A single engine/API/data error can therefore remove vehicle candidates for the whole scan without a log or a visible failed state. Any authored clue that requires a vehicle may then be deferred or dropped for reasons the logs do not explain.

This is especially difficult to debug because the scan still completes successfully and downstream code receives a plausible but incomplete catalogue.

**Claude action:** Capture and report the error through the project's shared logging path. Decide explicitly whether vehicle discovery is optional (record the omission and continue) or required for the current case (fail/retry that scan); do not silently present partial results as a successful complete scan. Add a regression around the chosen failure behavior.

**Evidence:** `Storage.lua:153-154`; the project-wide error-boundary rule is in `AGENTS.md` under “Project rules.”

## Checks to run at 2pm (not confirmed defects)

1. **Cold-load cost of the fixed-container payload.** `Storage.lua:5` eagerly requires `FixedContainerIndexData.lua` (3,836,309 bytes on this revision). The index code defers per-building validation, but that does not defer parsing and constructing the generated Lua table. Measure first-load time and memory in the actual game on a fresh save; the project's frame budget is explicit, and source-level scheduler bounds do not cover module-load cost. If it is material, split or defer the payload load.
2. **Current-branch gameplay acceptance.** The No Help handoff dated 2026-09-26 records a co-install boot check but says the extracted mod had never been played through. I did not find evidence in the reviewed files that supersedes that status for this revision. Confirm the handoff is current, then test one real case from startup through clue discovery, recognition, and save/reload with both mods installed.

## Review limits

- This review was static. I did not run GitHub Actions, Lua/Kahlua tests, the game, or a fresh-save playthrough.
- I am not claiming either item in “Checks to run” is a confirmed defect.
- The repository includes a large original mod, generated catalogues, tooling, and extensive tests. This pass focuses on the separately packaged `mod-nohelp/` path; it is not a certification of the whole repository or a release approval.
