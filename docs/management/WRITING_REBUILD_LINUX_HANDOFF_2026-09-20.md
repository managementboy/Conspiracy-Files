# Writing rebuild: Linux build and validation handoff

**Draft handoff saved before restart; final static integration review remains.** Development version: `DEV-0.46.0-writing-rebuild`. Use a fresh disposable save. This is an unvalidated development candidate, not a release. Codex performed source review and whitespace checks, not Lua execution, compilation, tests, sample export, packaging or gameplay.

This supersedes the unfinished implementation checklist in `WRITING_REBUILD_STATUS_2026-09-20.md` and the older map-media branch handoff. Work is integrated on `main`. The restart checkpoint is `0385075`; use the later commit containing this document and the completed integration changes. Record `git rev-parse HEAD` before testing and retain it in every result. Do not test the old Workshop tag or assume a local Windows commit has reached GitHub: verify the source contains `MapMediaPlaceStories.lua`, `PlaceNames.context` and this handoff before running anything. Preserve unrelated Linux changes.

## What is implemented

- All 22 generated families use authored events, two variants each. Every variant has three essential records, a local outcome, source requirements for comparisons, and separate physical observation, original source and survivor note. The generic unrelated-role/pile generator is removed. Optional evidence belongs to its event; supported ways prefer a compatible contribution. A returning organisation selects an event authored for that business. Player readings cannot rewrite existing events.
- The opening recognises the survivor's own name and accounts for the missed collection. The follow-up reconstructs how the name entered the booking, preserving source reference, clerk, company, survivor and documentary cutoff. It does not invent consent or memories, and the caller remains unidentified. Missing essential evidence withholds the closing reading and continuation.
- Named businesses perform their archived vanilla activities. Bureaucratic priorities produce the human consequence and the humour. Twenty ordinary families, the personal pair, optional objects, map families, memo, identity/key prose and the retained Dead Air journal have been reviewed as their respective writing surfaces. The standalone memo is historical context; overlapping dates never establish causality.
- All 125 map designs retain independent state. Seventeen authored map families provide four distinct records each, plus a specific Irvington Speedway repair-booking variant. Recipient correspondence permits records at an ordinary bound site without turning that site into the named business. Selection uses printed business context, whole annotation words, reviewed explicit family lists or the recipient-copy pool. This is **not 125 unique stories** and does not promise each printed map author wrote our separate correspondence.
- Eleven previously zero-building maps have reviewed source-marked destination footprints. MulStashMap11 and MulStashMap16 follow their actual restaurant marks to one Spiffo's, with independent food/head-count files and a shared finding only after both complete files are known. Map 16's native bank stash is untouched. The lap-time map uses its actual Cossette/Dart times. Loaded target owners refine overlapping building metadata.
- Generated and map placement use bounded pools of up to eight kinds and eight targets per kind. Kind choice gets no extra votes for repeated kitchen counters. Identified non-floor furniture is eligible; existing vehicle rules remain separate. No loot-category blacklist or floor extension was added. Map fill permission belongs to the exact observed container; replacement furniture cannot inherit it merely by occupying the same coordinate/sprite/index.
- Map insertion retains intent before insertion, token identity, conservative unknown state and reconciliation. Scoped interruptions identify design and part. Repeated reads/copies do not create new trails, and uncertain/missing destination evidence is not duplicated.
- Journals and native pages resolve actual addresses, with directions between the two named copy locations when the counterpart lacks a street number. Source copies explicitly name their filing origin. A follow-up resolves its earlier address from the retained known source file, including after retirement. Backend unseen-title hints are removed. Native pages omit survivor interpretation.
- Retirement keeps all discovered rows, findings, location context, order, answers, completion/gaps and last-seen descriptions. The 16-case campaign and provisional 1,000,000 estimated-byte aggregate allowance remain. Budget refusal does not erase old evidence. Closing popups wrap and scroll within the display.

## Source completion audit

| Requirement | Source evidence reviewed | Linux evidence still required |
|---|---|---|
| Audit before rewrite, complete example | `docs/design/WRITING_SYSTEM_AUDIT_2026-09-20.md`, `WRITING_REFERENCE_PERSONAL_COLLECTION_2026-09-20.md` | Review actual rendered examples against that standard |
| All generated families and variants | `OrdinaryScenarios`, `InventoryScenarios`, `AdministrativeScenarios`, `CorrespondenceScenarios`, `PersonalScenarios`, `PersonalContinuation`, `Premises` | Family contract, all variants and player-visible samples |
| Coherent generation and knowledge | `Story`, `Generator`, `Questions`, `EvidenceRows`, `DocumentPages`; optional and steering drafts | Discovery subsets/order, immutable source pages, supported steering/refusal |
| Grounding and tone | Archived `vanilla-print-2026-09-19/catalogue.json`; scenario grounding fields and complete source chains | Readability and humour in the real small pane; do not substitute a word-count check |
| Opening/follow-up navigation | `PlaceNames.context/render`, `DocumentPages.resolve`, runtime `writePages`, `EvidenceRows` | Numbered, mixed and wholly unnumbered sites; old source address after retirement/reload |
| Map content and destinations | `MapMediaContent`, service/civic/place stories, `MapMediaDestinations`, catalogue/footer generator, `MapMediaRuntime` | All 125 location verdicts, actual furniture/reachability, shared restaurant pair and source-mark relevance |
| Placement variety and loot parity | `Generated/StorageChoices`, `Storage`, `Session`, deferred scans, map candidate/selection path | Actual variety, scan latency, moved/dismantled furniture, no forced loot/exploration |
| Transaction safety and recovery | Map `place/reconcile`, scoped fault receipt, revised `checks/map_placement.lua/.sh` | All four actual fault points, positive insertion, save/reload, no duplicate payoff |
| Preserved history and incomplete cases | `RetiredCase`, `Session`, `SuccessiveCases`, `SaveBudget`, budget/full-archive drafts | Full campaign + all map records; actual 600 kB/800 kB/1 MB save costs; incomplete cases stay incomplete |
| Supporting prose and UI | Memo, Content journal, identity/key modules, PlayerVoice, KnoxUI/KnoxApps | Native page and organiser parity, scrolling, fonts, input and supported spoken findings |

## Start here on Linux

Confirm the intended source revision is actually present. The build string is defined only in `Version.lua`. Do not overwrite a prior Workshop release tag.

```sh
git status --short --branch
git rev-parse HEAD
tools/autotest/unit.sh
lua5.1 tools/export_story_samples.lua > /tmp/conspiracy-writing-samples.md
tools/package.sh
```

The unit script already invokes Kahlua parsing and all standalone Lua tests. Run the commands in order and stop on failure. The test changes are drafts; fix a stale fixture only after checking the intended behavior against this handoff and the owner decisions. Never weaken a non-vacuous guard simply to make it green. Source checks in Codex are not prior passing results.

The exporter covers 44 generated variants, all map families and the real catalogue selections. Read complete examples. A well-formed table or a nonempty note does not establish a coherent or funny story. One reported review concern about the gallery note referring to Natalie's map is not an unseen-source defect: the trail activates only after that exact map is read. Keep this distinction when reviewing first-found evidence.

Use the established Linux boot/machine-lock workflow after packaging. Then run:

```sh
tools/autotest/checks/map_placement.sh --hidden
```

The revised fixture covers normal placement and `beforeInsert`, `afterInsert`, `beforeCommit`, `afterCommit`, each on a separate design. It scopes faults to the intended payoff, captures the canonical state at interruption, resets only the runtime scheduler between cases, requires a positively observed placement, counts actual physical tokens at the persisted target and loaded neighbourhood, and repeats observation after save/reload. No hand-passed `filled=true`. An unconsumed fault or unobservable target is INCONCLUSIVE (exit 2), never PASS. Confirm the script itself reaches each intended production boundary.

## Required native acceptance before publishing

1. A fresh opening followed by its linked enquiry: recognise the player name, read source-only item pages, reach the actual counterpart from the text, obtain distinct findings in different discovery orders, then retain those findings through completion and reload. Missing an essential source must not produce the closing reading or continuation. Missing optional evidence may leave a corroborating gap.
2. An annotated map actually acquired as loot and opened by hand: cancelled/successful transfer, read/reread, duplicate physical copy, ordinary map and world-map reveal. Follow all three paced local parts and its anchored destination, including destination-first discovery and a missed fragment on a later journey.
3. Record `MapMediaRuntime.coverage(id)` after indexing for all 125 designs, with real reachable fixed non-floor containers. Area counts and metadata intersections are **not success criteria**. Review all eleven footprint designs, the nine previously multiple-building designs, gallery, Speedway and both actual restaurant maps. Shared finding must remain absent until all eight source records are noted. Never invent a nearby substitute destination or restore the old six-furniture restriction to pass this gate.
4. Placement variety across repeated fresh houses, including bedroom storage; generated/map deferred scans; true fill/exploration ordering; a moved or dismantled candidate; replacement furniture at identical coordinates; ordinary valuable-loot containers without adding better loot. Record worst scan-step cost and time from area availability to discovery. The 2 ms scheduler target does not prove native calls meet it.
5. Full campaign/archive and all-map save load: source rows, findings, answers, last-seen information, chronology, no phantom completion, no admission that discards history. Measure actual save timing and size on real data around 600 kB, 800 kB and 1 MB. The allowance is provisional, not an engine limit.
6. FILES/NAMES/DATES/PLACES and closing questions: actual font sizes, long notes/choices, popup scrolling/taps/rocker, known-only interpretations, live-to-retired view, continued source addresses and no raw debug coordinates. Check shared map findings refresh when the second file becomes complete.

Archive commit/version, setup, actions, observations and logs for each result. The old native baseline (105 single-building / 11 none / 9 multiple; no real shared destination) applies to the old build only. These source changes require fresh evidence. Do not describe the new candidate as validated or publish it until the gates pass. Fix concrete defects within the established scope or return reproducible findings; do not send the owner between agents for routine repairs.
