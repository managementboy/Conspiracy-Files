# Linux handover — 19 September 2026

## Superseded entry sequence — later clarification today

Start with the [central-mystery development handoff](CENTRAL_MYSTERY_DEVELOPMENT_HANDOFF_2026-09-19.md) and [review of all 32 decisions](../design/CENTRAL_MYSTERY_REVIEW_2026-09-19.md). The personal opening is independent of vanilla media; media-identity work below is not its prerequisite. Every discovered annotated map needs a destination payoff, connected to the search for an explanation of isolation. Earlier optional-media and incidental-larger-connection assumptions are superseded. The inventory and technical limitations below remain valid.


## Resume here

**Planning is complete for this session; implementation belongs on the Linux laptop.** The owner requested this handover and publication of accumulated work to Git. Windows gameplay and the Steam Workshop installation were not changed by this planning work.

1. Fetch GitHub and update a clean Linux checkout of `main`; inspect local changes before merging. Read this file, then the occupation plan below.
2. Review proposed story premises with the owner under Q27. The 25 occupation stories are suggestions, not approved content or implemented features.
3. Begin the bounded identity/state verification slice. Reuse the existing inventory; compare the installed build and relevant source hashes before repeating any research.

## Authoritative reading order

- [Direction review: all 32 answers, remaining questions and agenda](../design/DIRECTION_REVIEW_2026-09-19.md).
- [Decision index](../../DECISIONS.md): dated September 19 records take precedence over conflicting earlier product commitments. Unreviewed commitments remain pending.
- [Occupation premises, mechanics and Linux verification tickets](../design/OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md).
- [Vanilla printed-media research and limitations](../research/vanilla-print-2026-09-19/README.md), [searchable catalogue](../research/vanilla-print-2026-09-19/catalogue.html), [transcripts](../research/vanilla-print-2026-09-19/transcripts.md).
- [Product vision](../requirements/PRODUCT_VISION.md) and [player requirements](../requirements/PLAYER_REQUIREMENTS.md) summarise confirmed direction.

## Done and evidence boundaries

- Completed the 32-question direction review and recorded owner corrections, including removal of arbitrary suspicion bookmarks and the discarded hunch concept.
- Catalogued 258 vanilla designs: 125 annotated maps, 111 flyers and 22 brochures; resolved 594 marks. Also indexed 15 ordinary map items. Source text, identifiers, categories, hashes and contact sheets are retained. Eight unsupported title-only candidates and nine placeholder anchors are flagged.
- Wrote premises for all 25 installed occupation definitions and linked 46 existing media IDs. These are design proposals.
- Identified source-level media routing and identity candidates; distinguished seen, read and recorded state; specified carrier reachability and stash-timing experiments. **No new live-engine verification was performed for this integration.** Printed claims, map rectangles and source hooks do not establish a reachable live destination or a successful read-completion event.
- Inventory scripts and catalogue JavaScript were checked. Browser rendering of the catalogue was not verified. Original full artwork remains in the game installation; catalogue artwork links reference Windows paths and need path regeneration on Linux if wanted.

Baseline brought from Git before planning: DEV-0.44.0-addresses-that-travel. Windows reference installation was Build 42.20.4, revision b0bbce05d5, Steam build 24909800. Verify Linux independently. Archived Linux boot evidence at `docs/management/evidence/linux-autotest/20260919T012736-boot.txt` reports 106/106 files and zero errors at its recorded source revision; it is not a test of these proposed features.

Research/planning commits before this handover: `c6456c2` (questionnaire), `efaa817` (media inventory), `bb591e0` (occupation plan). Use Git history for the complete decision trail and publication commit.

## Confirmed direction to preserve

- Version 1.0 enriches ordinary single-player survival on vanilla Build 42. Full campaign, broader compatibility and PC/CD-ROM integration are future possibilities.
- Offline authored content and local rules; organiser plus physical evidence. Local stories may explain people and motives, never the cause of the Knox Event. Fatalistic bureaucratic dark comedy throughout.
- Next priority order: **personal opening → survival connections → current-loop improvements**. Early themes favour actual starting skills; later mysteries require travel and can require a particular skill or tool.
- Keep the well-liked discovery/Inspect loop. A concrete evidence-based lead can replace hunches; arbitrary ordinary-object suspicion bookmarks were removed.
- Missed clues may be offered at new locations after a delay, respecting what the player has already seen or learned. Do not equate unrecorded with unseen. Named destinations and established facts must remain coherent.
- Bulk items appearing only after Investigate Area broke plausibility: ten dust masks in a previously searched place. Redesign this; no duplication root cause has been proven. Small overlooked papers/keys remain plausible.
- Maps and flyers should give purpose. Relay Site 31 is the owner's example of a named destination that should lead to further clues. Do not equate a printed site name with an arbitrary relay station or source rectangle.
- Recover predecessor knowledge through recovered evidence/organiser. A generic replacement device does not grant knowledge. Battery depletion does not erase records.
- Breaking changes are allowed until the owner considers the feature set playable long term. Announce fresh-save requirements; never delete saves. Technical checks passing are the milestone acceptance gate; review direction at each playable milestone.

## Linux integration work: bounded first slice

Use the detailed ticket definitions in the occupation plan; collect build, source revision, steps, observations and logs for each result.

| Order | Work | Required evidence |
|---|---|---|
| 1 | O1, M1, M2: occupation availability, media identity and exposure timing | Actual engine identifiers and successful presentation boundary; distinguish possession, visible inventory, opened media and our record action. No invented universal read event. |
| 2 | M3, R1, S1, S2, P1 with one electrician opening and unemployed fallback | Recording/recovery survives reload; carrier is accessible; vanilla stash timing observed; no duplicate activation or implausible bulk discoveries. |
| 3 | A contrasting tailor/unemployed premise; R2 and G1 when relevant | Multiple floors/obstacles and deliberate tool/skill gates tested before adopting those destinations. |

For stash timing compare: no map, obtained unread, read, reveal, destination loaded, container opened; include already-visited locations and reload. Test relevant info-only/cache/conditional cases. Do not trigger vanilla stash preparation twice.

Reachable ground does not prove reachable container. Unloaded destinations stay pending; inspect floor access, obstacles, containers and intentional gates. Revalidate at interaction time. Preserve separate design identity, physical copy identity, character observation and case evidence identity.

## Remaining wishlist and open decisions

- Detailed player settings with sensible defaults: owner wanted this tackled today; latest instruction moves development to Linux. Exact controls and mid-save policy need definition.
- Reuse the previous narrator base/travel feature after locating and verifying it. Base knowledge is for outbound/return journeys, not necessary for current-position clue relocation.
- Later: use-X-on-Y skill/tool revelations, meaningful clue lines on the map, optional PC/CD-ROM documents.
- **Last on the research agenda:** existing vanilla indoor corpses (not zombies), car wrecks, burned-out houses and survivor houses as mystery locations. This research is still outstanding. Survivor houses are not player bases.
- Still open: extent of authored player biography; relocation delay and duplicate policy; inherited partial/full records; detailed settings; manual/automatic map lines; exact first survival connection. Earlier content freeze, external packs and existing-save retrofit must not be silently reaffirmed.

## Delivery and next-agent guardrails

Develop separately on Linux. Keep Windows owner gameplay untouched. Delivery remains Steam Workshop; do not create a competing local `Zomboid/mods/ConspiracyFiles` install. This handover does not publish a new Workshop build.

Use relevant existing engine evidence, then run checks for the concrete integration risks above. Do not repeat the whole printed-media inventory. Use `tools/research/catalogue_vanilla_print.py` and `tools/research/review_vanilla_print.py` only when a build/source change or artifact-path need warrants it. They are research tools, not gameplay code.

Historical project-state, roadmap and campaign sections remain useful evidence of earlier work, but do not reinstate superseded product commitments. Record new decisions and verified results in Git as work proceeds.
