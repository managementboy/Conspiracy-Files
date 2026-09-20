# Claude handoff: build and validate the writing rebuild

## Your task

Take the completed implementation on GitHub `main` through Linux compilation, tests, game validation and the existing unlisted Workshop delivery process. Fix reproducible defects within the agreed scope as you find them. Keep ownership through the whole phase; do not send the owner between Claude and Codex for routine repairs.

Repository: `managementboy/Conspiracy-Files`  
Branch: `main`  
Required implementation/delivery baseline: **`8cdf2c62ee8209fcdb1efba21bb5f8c2c48c165e`** (or a descendant containing this handoff)  
Development version: **`DEV-0.46.0-writing-rebuild`**  
Save requirement: **fresh saves only**

The implementation is committed and pushed. Codex performed source review and whitespace checks, but **did not execute Lua, tests, compilers, story export, packaging or the game**. Treat every changed test as an unexecuted draft. The old Workshop build and its green suite do not validate this revision.

This document replaces the earlier writing/map implementation handoffs. Read repository `AGENTS.md` for standing rules and `docs/management/LINUX_AUTOTEST.md` for the Linux machine workflow.

## 1. Get the correct source

Inspect the checkout first and preserve any unrelated Linux work. On a clean `main`, run:

```sh
git fetch origin
git merge --ff-only origin/main
git merge-base --is-ancestor 8cdf2c62ee8209fcdb1efba21bb5f8c2c48c165e HEAD
git status --short --branch
git rev-parse HEAD
```

Do not force-reset a dirty or diverged checkout. Record the actual tested commit in every result. Do not build `codex/map-media` or reuse the old `DEV-0.45.0-map-media` tag.

## 2. Run source checks, preview, package and boot

Run these commands individually, in order. On failure, diagnose and fix before continuing:

```sh
tools/autotest/unit.sh
lua5.1 tools/export_story_samples.lua > /tmp/conspiracy-writing-samples.md
tools/package.sh
tools/autotest/boot_check.sh --hidden
tools/autotest/checks/map_placement.sh --hidden
```

The unit script includes Kahlua parsing and the Lua suite. Read the exported stories; a successful export is not an editorial pass. Review the Speedway-specific event separately in `MapMediaPlaceStories.lua`, since the exporter previews the shared families and lists real map selections.

The game scripts use the existing machine lock. Run game checks serially. Hidden runs use software rendering; record the renderer and use the normal hardware configuration for performance conclusions. The boot check runs the repository-linked mod, so separately verify the eventual packaged/uploaded source matches the tested commit.

The revised placement check covers normal insertion and four scoped interruptions: `beforeInsert`, `afterInsert`, `beforeCommit`, `afterCommit`. Check that each fault actually fired in the intended design/part. Require a positively observed item and correct recovery after save/reload. **Exit 2, an unconsumed fault or an unobservable target means INCONCLUSIVE, never PASS.** Do not manually pass `filled=true` to manufacture eligibility.

## 3. Validate the changed features in the game

| Area | Required evidence |
|---|---|
| Personal opening and continuation | Pick up and recognise the opening through Investigate Area. The survivor recognises their own name; each clue adds a different fact. Complete the missed-collection case and its enquiry follow-up. Preserve reference, names, dates and earlier address. No invented survivor memories or consent. |
| Knowledge and source voice | Test different discovery orders, including the destination first. Comparisons appear only after their sources are known. Native item pages contain source text; the organiser adds physical observations and first-person interpretation. Missing essential evidence prevents completion/continuation; optional evidence is not required for the local answer. |
| Navigation and UI | Numbered, mixed and wholly unnumbered sites must be locatable from the discovered text. Check inherited addresses after retirement/reload. Inspect FILES/NAMES/DATES/PLACES, long notes, fonts, closing questions, scrolling and input. No raw coordinate labels or clipped answers. |
| Real map journey | Acquire an annotated map as loot and open it by hand. Check cancelled/successful reading, rereading and duplicate copies; ordinary maps must not start trails. Follow the three paced local parts and destination record. Test a missed part on a later journey and destination-first discovery. |
| All 125 destinations | Record coverage after indexing, then establish actual reachable non-floor containers. Geometry/metadata counts alone are insufficient. Exercise all eleven area overlays in `MapMediaDestinations.lua`, the nine previously ambiguous building bindings, gallery and Speedway. Do not substitute an unrelated nearby building. |
| Shared restaurant | `MulStashMap11` and `MulStashMap16` have independent files at their actual shared Spiffo's mark. The cross-file finding appears only after all eight records are known and refreshes in the organiser. Map 16's native bank stash stays unchanged. |
| Placement and recovery | Repeat fresh-house starts, including bedroom storage. Check kind variety, deferred scans, real fill/exploration order, moved/dismantled furniture, and replacement containers at the same coordinates. No extra vanilla loot or forced exploration. Measure scan-step cost and total discovery delay. |
| History and storage | Preserve the full 16-case campaign and all-map evidence through save/load: source rows, findings, answers, order, locations and last-seen information. Admission refusal must preserve history. Measure actual save costs with real data around 600 kB, 800 kB and 1 MB. |

## 4. Judge the writing against the actual request

There are **22 generated families with two event variants each**, **17 map families**, and a **Speedway-specific event**. There are not 125 unique map stories: otherwise unclassified maps use coherent recipient correspondence. A named business must have a causal role consistent with its archived vanilla activity; an ordinary destination is not automatically that business's premises.

Read complete cases against these questions:

- What happened, and what does each source add?
- What can the player reasonably infer now, and what remains unanswered?
- Does the survivor sound personally involved where warranted, without invented history?
- Does the institutional absurdity produce fatalistic, bureaucratic dark comedy throughout?

Use `docs/design/WRITING_REFERENCE_PERSONAL_COLLECTION_2026-09-20.md` as the complete example and `docs/design/WRITING_SYSTEM_AUDIT_2026-09-20.md` for scope. Read rendered examples across all families. Metadata or keyword checks cannot establish coherent or funny writing. Repair clear contradictions; bring genuine creative-direction choices to the owner with concrete examples.

## Constraints to preserve while fixing

- Fresh saves only; no migration work or feature-disable workaround.
- Plain-table storage with full evidence history. **1,000,000 estimated bytes is provisional, not an engine limit.** Do not restore the old 500 kB ceiling, compress or discard history to satisfy stale tests.
- Identified non-floor furniture is eligible. Keep eight kinds/up to eight targets per kind; do not restore the six-kind restriction or add a loot-category blacklist. Discovery uses Investigate Area, not a requirement to loot every drawer.
- Player readings cannot rewrite historical events. Supported optional evidence belongs to its authored event. No definitive explanation of Knox.
- Use `ConspiracyFiles/Log`. If a limit changes, prove its boundary test still reaches that limit. Do not weaken assertions merely to make the suite green.

## Finish and report

Archive reproducible results under `docs/management/evidence/linux-autotest/`, with commit/version, setup, actions, observations and logs. Separate PASS, FAIL and INCONCLUSIVE. Fix defects, rerun affected checks, then run the complete source suite and boot check on the final candidate.

Once the required gates pass, commit/push the fixes and use the established unlisted Workshop workflow. Tag the exact published revision; never overwrite an existing release tag. Confirm the uploaded content matches the tested source. If a required gate remains failed or inconclusive, report it explicitly and do not call the candidate validated or publish it as passed.

Return one concise report: tested commit and version; fixes; gate results with evidence; remaining failures or inconclusive checks; and Workshop/tag status. Nothing is waiting for another Codex implementation batch before you start.
