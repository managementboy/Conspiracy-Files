# Successive investigations — reviewed test build, 2026-09-06

Status: PM completed remaining integration, reviewed and installed a controlled debug test build. Native multi-case acceptance is pending. Prior worker handoffs were partial and must not be treated as completed acceptance.

## Storage and compatibility

The Global ModData envelope now accepts legacy `canonical` and a single active `campaign` field. `campaign` holds the complete first/later sessions and global discovery ordering. Readers use Cases.current and prefer campaign. A legacy-only save remains readable. The first successful campaign write retains the old canonical as a frozen fallback; it is never treated as current afterward. Staged aggregate is copied to avoid cross-root aliases, recursively validated, budget-checked including fallback plus active bytes and peers, then assigned in ONE `store.campaign = staged` operation. Runtime reference changes afterward only. This is the project's Lua-level single-field commit boundary, not an operating-system crash/disk transaction guarantee.

All real runtime consumers now resolve active campaign: placement/identity/inspection, hint scan, markers, notebook owning-case rendering and diagnostics. Global ordinal order appends new inspections, including late first-case discoveries. Marker renderer still accepts explicit isolated projections for temporary colour fixtures. Scheduler is replaced on session API replacement; nextCase does not discard active placement jobs and defers while pending/placing work exists. Invalid outer stores and fabricated global known IDs are rejected.

Manual debug nextCase uses current position, survival reach and distinct retained-site filtering. Missing storage defers without widening reach. Development aggregate bound is three retained cases total; this is a test-build bound, not final gameplay concurrency policy. No automatic scheduling, completion gate or new narrative templates introduced.

## Evidence

PASS test/g2_smoke.lua: real two-case creation/physical placement; legacy fallback upgrade; initial and later injected campaign-write failure retain saved/local state; explicit second-case selection then late old discovery; stable notebook and marker ordinals; blue ink/source catch-up and retention through reload; real Notebook generatedRows code resolves owning-case text; isolated fixture renderer; duplicates and insufficient storage deferral.

PASS test/g2_faults.lua: interrupted intent, positive identity reconciliation, unloaded storage, out-of-scan retention, sticky duplicates and saved known evidence.
PASS test/successive_cases.lua: identities, aggregate validation, fallback/active reader, fabricated global discovery rejection.
PASS test/save_budget.lua: active replacement and fallback byte accounting plus prior peer/replacement checks.
PASS test/clue_markers.lua, test/clue_hints.lua (isolated adapter fixtures), test/notebook_toolbar.lua, test/notebook_menu.lua, test/marker_colour_test.lua. Full-case marker/Notebook coverage is in g2_smoke, not claimed from minimal isolated fixtures.
Final bundle sync and syntax checks passed for all eight deployment files. Accepted 64x48 notebook asset and hover/toggle retained.

## Deployment

Installed and SHA256 verified eight Lua files, backup: C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-141630-successive-campaign. Generator additive API, SuccessiveCases, GeneratedRuntime, GeneratedDiagnostic, ClueHints, ClueMarkers, SaveBudget, Notebook. No save files changed by deployment. Existing runtime has a loaded guard/new module dependencies: FULL GAME RESTART required; do not hot-reload this integration. Load the existing test save, run Trial.start(), verify old evidence, then request `ConspiracyFiles.GeneratedRuntime.nextCase(20260906)` once. Wait for real loaded storage/placement and read log for first new container. Never reset the save to manufacture acceptance. Ordinary pickup, Inspect, writing-tool and map-source tests then save/reload both cases remain owner-operated.

## Subsequent policy change — P4-R63

Owner removed pre-1.0 old-save compatibility requirements after this deployment. The legacy fallback described above is an implementation history, no longer a design requirement. Future simplification may remove it and require a fresh save. Single-field staged commit, current-build integrity and multi-case evidence retention remain required. No save deletion or code deployment performed by recording this decision.
