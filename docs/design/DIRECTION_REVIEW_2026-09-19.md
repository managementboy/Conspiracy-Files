# Conspiracy-Files: decide the direction again

Prepared 19 September 2026 against `main` at `73e6b62`, build `DEV-0.44.0-addresses-that-travel`.

**Status: questionnaire for the owner. No answers have been assumed or approved.**

The owner requested this review after returning to the Windows workspace: read the campaign vision, revisit the goals from the original design, and assess the developed mod so that old decisions are not silently treated as permanent requirements.

## How to answer

Answer one round at a time. Round 1 is enough for a first conversation. Use `Q01 B — because ...`, or write your own answer. Every question also accepts **undecided**, **needs a playtest**, or **no longer wanted**. Options are discussion starters, not recommendations; none is selected by default.

For each answer, also say whether it belongs **in the next playable milestone**, **later**, or **outside the intended mod**. This distinguishes a feature you still want from work you want now.

An unanswered question means **not reaffirmed in this review**, not agreement with the old rule and not automatic repeal. Existing behavior remains the observable baseline. A new feature or redesign that depends on an unanswered choice should bring that choice back to the owner. Routine fixes can preserve existing behavior without deciding the product direction for them.

After a round is answered, read back the decision in plain language, its consequences, and exactly which older decisions it keeps, changes or retires. Record the confirmed wording in `DECISIONS.md`; retain dated history. A recommendation, source-code comment, old plan, or this questionnaire is not an owner answer.

## The position we are reviewing

### Done: a substantial playable foundation

- Generated investigations, physical clues, multiple cases, case retirement and a chronological discovery record exist in the current source.
- Search Mode, the Clues focus, Look it over and timed Inspect form the discovery loop. Buildings, cars, mailboxes and bodies provide places for clues; walking zombies were excluded from the general clue-carrier system after live testing (P4-R132–R136).
- The handheld organiser and Knox.OS are the main reading interface. The separate notebook window was removed (P4-R128).
- Cases already have some continuity: the relay memo provides a shared date connection, and answers to “What do I make of it?” can carry a person or organisation and an investigative approach into a later case (P4-R96, R113, R119–R123; `Generated/Generator.lua`). This is more than the independent cases described in the older campaign vision.
- The archived [latest boot check](../management/evidence/linux-autotest/20260919T012736-boot.txt) reports PASS: 106/106 mod files loaded and no mod errors. The [travel check](../management/evidence/linux-autotest/20260919T001915-travel.txt) records searching and inspecting clues during a journey and generating cases in towns reached along the way. These are specific technical results, not proof that the whole campaign is complete or satisfying.
- Git was clean and matched the fetched `origin/main` at the start of this review. Delivery is through Steam Workshop, as the owner reaffirmed in this conversation.

### Loose ends worth closing

The docs describe several different generations of the product. `README.md`, `PROJECT_STATE.md` and `ROADMAP.md` still open with early September scope; the product-vision and player-requirements documents are placeholders. Some later design docs contain both “built” and “not built” status lines. These need reconciliation after decisions, not blind promotion of whichever sentence an agent reads first.

Some particularly important changes:

| Earlier position | Later decision or implementation | Review questions |
|---|---|---|
| Every requested capability remains mandatory; sequencing alone may change | A much narrower playable module developed, alongside a broader campaign proposal | Q01–Q02, Q31 |
| Cases are independent; inter-case links are new work | Shared relay-week evidence and answer-driven later cases now exist | Q06, Q09 |
| A lead is never proof | Observable facts about objects and places may be settled; people, motives and Knox remain uncertain | Q04 |
| The original graph and journal are the primary interface | The organiser replaced the notebook window; the player graph remains deferred | Q19–Q21 |
| Acquiring a clue immediately recognises/logs it | Search or Look it over recognises it; Inspect records it | Q07 |
| All clues matter; ignored leads remain available | Unplaceable waiting clues can expire after three game days | Q11–Q12 |
| Investigation ends with the character | The world keeps the case record and a new character can read it with an organiser | Q17 |
| A lasting archive preserves the investigation | Four finished cases retain full rows; older cases are reduced under the current save budget | Q18 |
| Every AI-written asset needs approval before shipping | P4-R97 removed that approval requirement; owner review happens in play | Q27 |

### Leave for later until the direction is chosen

The amnesiac opening, a deliberate campaign route, bases as story destinations and crafting mastery are ambitions in the campaign vision. The reviewed evidence does not establish them as a delivered campaign. The cold-trail travel proposal likewise needs its scope settled. They are choices here, not an automatic implementation queue.

The Linux development PC is offline. This review uses source and archived evidence; it does not claim a fresh engine test or a green full test suite. Some older campaign logs record failures and unexercised conditions. Those require comparison with later fixes before being classified as current defects or closed issues.

### Recommended finish for this review

1. Answer Round 1 to establish what the mod is meant to become.
2. Answer the remaining rounds in order of relevance, then select one playable milestone and its acceptance evidence.
3. Publish a concise, confirmed direction in the existing vision and decision documents, with explicit supersessions and a remaining-open list.

## Round 1 — What are we making? (Q01–Q06)

### Q01 — What is the main product now?

**Starting point:** Original P1-Q1/Q4 combines mystery, narrative and objectives; the [campaign vision](CAMPAIGN_VISION.md) calls the current investigation system a module within something larger.

- A. An investigation layer that enriches ordinary survival indefinitely.
- B. A campaign about the survivor, built from connected investigations across Knox.
- C. Both as explicitly separate modes, with a choice of which we finish first.

**Answer / reason / timing:** _unanswered_

### Q02 — Does the original “nothing is optional” promise still apply?

**Starting point:** P1-Q23/Q24 says the long-term feature list is mandatory and prioritisation is only sequencing. That makes a growing wishlist an obligation even when the game has moved on.

- A. Keep the entire original destination; decide its order.
- B. Replace it with a small set of essential experiences; everything else must earn its place.
- C. Treat the original list as ideas and choose one bounded release at a time.

**Answer / reason / timing:** _unanswered_

### Q03 — Is the survivor's missing past still the opening we want?

**Starting point:** The campaign vision begins with not knowing how the survivor arrived. The current first-case mechanism waits for an indoor location; that does not implement amnesia.

- A. Every campaign starts with that personal mystery.
- B. It is an optional background or campaign mode.
- C. The survivor's past stays player-defined; investigations concern the surrounding world.

If A or B: what may the mod establish about the survivor without taking away their roleplay?

**Answer / reason / timing:** _unanswered_

### Q04 — What kinds of truth may the player actually establish?

**Starting point:** P1-Q6/Q15/Q22 favours ambiguity and protects the cause of the Knox Event. P4-R109 now permits a settled, observed fact about an object or place.

- A. Keep that limit: objects and places can yield facts; people and motives stay unresolved.
- B. Allow local mysteries about people and motives to be solved while keeping the Knox Event unexplained.
- C. Reopen how much larger truth a campaign may reveal, including whether Knox's cause must remain unknowable.

**Answer / reason / timing:** _unanswered_

### Q05 — Who decides when and where the player should travel?

**Starting point:** The campaign vision suggests geographical pull. [Cold trail and pull](COLD_TRAIL_AND_PULL.md) proposes player-requested travel. The current travel test proves the mod works during travel, not that it provides a campaign route.

- A. The player travels freely; cases follow the places they visit.
- B. The player asks for a new direction, and a local clue points somewhere distant.
- C. The campaign proactively offers a route or objectives; the player may ignore them.

If B or C: should guidance be prose and landmarks, exact map destinations, or a player-selectable level?

**Answer / reason / timing:** _unanswered_

### Q06 — How tightly should investigations connect?

**Starting point:** P4-R91/R96 links dates through the relay memo; R113 lets answers shape later cases. This does not yet establish a complete overarching plot.

- A. Mostly separate mysteries with occasional recurring details.
- B. Recurring people, organisations and consequences create a continuing web.
- C. An authored central arc with generated cases serving its chapters.

**Answer / reason / timing:** _unanswered_

## Round 2 — What should playing feel like? (Q07–Q12)

### Q07 — Is sense → search → recognise → note still the core discovery loop?

**Starting point:** P4-R132 replaced immediate recognition with Search Mode or Look it over, followed by timed Inspect. The owner praised it in play, but that is evidence for this review, not a permanent exemption from review.

- A. Keep it as the standard for every clue.
- B. Keep it for subtle clues; obvious clues can be recognised directly.
- C. Make the recognition and timed-action requirements adjustable.

**Answer / reason / timing:** _unanswered_

### Q08 — Which player reward should guide the next milestone?

**Starting point:** The [original player moments](../requirements/PLAYER_MOMENTS.md) emphasise a suspicious ordinary object, finding a place and discovering a contradiction. P4-R110 adds leads to existing survival opportunities.

Choose a primary reward and, optionally, a secondary one:
- A. “I noticed a connection and worked something out.”
- B. “Following this led to somewhere useful or memorable.”
- C. “My survivor's story moved forward because of what I chose.”

**Answer / reason / timing:** _unanswered_

### Q09 — How much should a hunch change the next case?

**Starting point:** P4-R113/R119–R123 and the generator use answers to select returning entities and investigative emphasis, without marking the answer right or wrong.

- A. Keep this: later evidence tests the chosen interpretation.
- B. Hunches only change the survivor's record; the world story is fixed independently.
- C. Hunches branch the campaign more strongly, changing later events or outcomes.

**Answer / reason / timing:** _unanswered_

### Q10 — How visible should a case's structure and completion be?

**Starting point:** Original P2-Q82 rejects completion announcements. Current decisions offer “That's all of it,” end-of-case questions, Case N rows and Evidence / Old, while hiding an undiscovered-clue total.

- A. Keep cases and reflection moments visible, with no clue checklist.
- B. Make cases less explicit; let discoveries form one continuous record.
- C. Show progress and completion clearly, including counts or checklists where useful.

**Answer / reason / timing:** _unanswered_

### Q11 — What pace should the player experience?

**Starting point:** Automatic scheduling currently has a 24-game-hour minimum gap and an additional wait after completion; up to four active cases and placement in instalments are implementation choices, not inherently the right experience.

- A. One principal mystery at a time, with room to breathe after it.
- B. Several overlapping mysteries arriving at a restrained rate.
- C. Player-controlled demand: ask for another lead when ready.

Give a concrete expectation: during one typical real-world play session, how much investigation should happen alongside survival?

**Answer / reason / timing:** _unanswered_

### Q12 — What should happen to an unfinished or impossible trail?

**Starting point:** P2-Q218 leaves ignored leads indefinitely. P4-R133 drops clues that cannot be placed within three game days; a voluntary cold trail is a different proposed behavior.

- A. Preserve the mystery until the player explicitly shelves it; add recovery opportunities when necessary.
- B. Let opportunities expire naturally, with an honest incomplete record.
- C. Let the player shelve and later resume a trail; decide technical expiry separately.

For the selected approach, what must the player be told about missing evidence, and should an unplaceable clue ever count toward a case being finished?

**Answer / reason / timing:** _unanswered_

## Round 3 — How does this belong in survival? (Q13–Q18)

### Q13 — What role should bases play?

**Starting point:** The campaign vision wants places the survivor returns to; the current investigation foundation does not establish a base-centered campaign.

- A. Bases stay entirely within ordinary PZ play.
- B. A chosen home becomes a reference point for leads and return journeys.
- C. Several bases form deliberate stages of the campaign.

**Answer / reason / timing:** _unanswered_

### Q14 — What does “crafting mastery” mean now?

**Starting point:** The campaign vision names dynamically built mastery; P1-Q12/Q13 favours soft requirements and survival as the main difficulty.

- A. Use existing survival skills incidentally; no investigation progression system.
- B. Existing skills provide extra interpretations and alternative ways forward.
- C. A defined crafting/skill progression unlocks campaign stages or necessary tools.

If B or C, name one desired player moment before choosing recipes, skills or XP rules.

**Answer / reason / timing:** _unanswered_

### Q15 — How much may the mod change the existing world?

**Starting point:** Minimal intrusion was an original principle. The unnumbered 11 September decision “The mod may change what the world already contains” permits changes to existing world objects; case-person code can name and equip an existing person, while P4-R110 limits survival rewards to opportunities already present.

- A. Keep the current bounded changes for clues and case people.
- B. Observe existing people and objects; minimise or remove authored identity/loot changes.
- C. Permit story-driven events, spawned content or tangible rewards within defined limits.

Specify any unacceptable changes to bodies, inventories, buildings or survival balance.

**Answer / reason / timing:** _unanswered_

### Q16 — How strongly should the survivor's character affect investigation?

**Starting point:** P1-Q14 wants profession-, trait- and skill-specific interpretation; current Search Mode already inherits some vanilla perception conditions.

- A. Keep differences mainly in spotting and survival ability.
- B. Let traits, professions and skills reveal different observations, with alternative routes.
- C. Give different characters substantially different campaign possibilities.

**Answer / reason / timing:** _unanswered_

### Q17 — Whose investigation survives death?

**Starting point:** P1-Q6 and P2-Q28 end the story with the survivor. P4-R128 says the world retains the case record and any organiser can read it, including a new character's.

- A. The world's investigation continues automatically with a replacement survivor.
- B. A replacement survivor must recover evidence or a device to inherit the investigation.
- C. The next survivor starts a new investigation; the old record is only a historical artifact.

Should a death recap be wanted now, later, or dropped? What may it reveal?

**Answer / reason / timing:** _unanswered_

### Q18 — How much investigation history must remain readable?

**Starting point:** The original record is an archive. P4-R135 keeps four finished cases fully readable and reduces older cases; the current store and discovery ledger still have finite capacity. Unlimited investigation is not demonstrated by that arrangement.

- A. Preserve every discovered record throughout a long save; redesign storage if needed.
- B. Keep full recent cases and permanent concise summaries of older ones.
- C. Accept a bounded campaign/history and make that limit part of the experience.

**Answer / reason / timing:** _unanswered_

## Round 4 — What should the player read, control and believe? (Q19–Q24)

### Q19 — Is the organiser still the main interface we want?

**Starting point:** P4-R79/R128 replaced the original notebook window. Physical evidence and the album remain, but the complete case view is on the organiser.

- A. Keep the organiser as the main case-reading interface.
- B. Offer equally capable electronic and paper interfaces.
- C. Make a simple accessible case view primary, with the device as an optional presentation.

**Answer / reason / timing:** _unanswered_

### Q20 — Which costs of using the organiser improve the game?

**Starting point:** The implemented device uses hands, power, batteries and physical recovery; the later dead-battery decision protects stored data (P4-R86).

Choose separately for **holding it**, **battery use**, and **needing a replacement when lost**:
- A. Required gameplay cost.
- B. Optional realism setting.
- C. Remove the restriction for easier reading.

**Answer / reason / timing:** _unanswered_

### Q21 — Do we still want a player-facing relationship graph?

**Starting point:** P2-Q20 made it the main browser; later scope moved it to v2. The development Graphify graph is a separate tool and does not implement this feature.

- A. Essential to the intended mod; schedule a player prototype.
- B. A later option if ordinary records become difficult to navigate.
- C. Remove it from the intended product.

**Answer / reason / timing:** _unanswered_

### Q22 — May the player investigate things the generator did not mark as clues?

**Starting point:** P2-Q4/Q5/Q17 and Player Moment 1 promise suspicion, bookmarks and later connections for ordinary items. Generated-case collection alone does not satisfy that promise.

- A. Any ordinary object or observation can be kept as a personal lead.
- B. Support free notes and selected object types, with a bounded scope.
- C. Keep formal investigation limited to generated clues.

If A or B, should the system sometimes connect these suspicions to a case, or should they remain the player's own notes?

**Answer / reason / timing:** _unanswered_

### Q23 — How much assistance should locating and remembering clues provide?

**Starting point:** P1-Q11 wants subtle guidance and stronger reminders after long breaks; current systems include Search Mode, real addresses and writing-tool-gated marks for found clues.

- A. Keep knowledge-limited hints, addresses and marks; rely on the player to follow them.
- B. Add an optional return-to-session recap and clearer help when stuck.
- C. Offer strong navigation and reminders as a normal or selectable mode.

**Answer / reason / timing:** _unanswered_

### Q24 — What emotional tone should lead?

**Starting point:** P1-Q21 combines grounded conspiracy, government/science and heavy bureaucratic dark comedy; P2-Q59 says humour is always present, including grim discoveries.

- A. Unease and mystery first; humour appears when the situation supports it.
- B. Fatalistic bureaucratic dark comedy is present throughout.
- C. Tone varies by case or campaign, with explicit limits.

Name one moment that should feel funny and one that should be allowed to stay serious.

**Answer / reason / timing:** _unanswered_

## Round 5 — What are we willing to support? (Q25–Q30)

### Q25 — Is runtime AI still part of the destination?

**Starting point:** Original P2-Q1/Q2 treats AI storytelling as a capability. Current architecture makes play without AI primary; the shipped mod has no runtime AI. AI used to develop the mod is a different decision.

- A. Keep gameplay entirely offline and authored/generated by local rules.
- B. Add optional on-demand summaries or character voice, with factual boundaries.
- C. Reopen a larger AI role and assess cost, connectivity and consistency before designing it.

**Answer / reason / timing:** _unanswered_

### Q26 — Which controls should players get?

**Starting point:** P2-Q47–Q52 asks for broad configuration fixed at world creation, while many current pacing and capacity choices are constants.

- A. A few curated presets for pacing, guidance and realism.
- B. Broad individual controls, with safe defaults.
- C. One designed experience for now; expand settings only after playtest needs appear.

Which settings must remain adjustable during an existing save?

**Answer / reason / timing:** _unanswered_

### Q27 — How should new story content be approved?

**Starting point:** P4-R97 explicitly removed mandatory approval of AI-written text before shipping. P4-R107 later froze new premises/programs until the first new-style case ships; this review does not assume whether that milestone has been accepted.

- A. Continue shipping reviewed and tested content for owner evaluation in play.
- B. Approve the premise, tone and boundaries first; individual text can then ship within them.
- C. Review every new case/text package before publication.

Should the content freeze now stay, end, or be replaced by a different milestone?

**Answer / reason / timing:** _unanswered_

### Q28 — What compatibility must the next release promise?

**Starting point:** P1-Q18 gives high priority to custom maps and other mods; current delivery is single-player Build 42 with verified vanilla-world assumptions.

- A. Single-player on the verified vanilla Build 42 map first.
- B. Single-player plus an explicit shortlist of supported maps and mods.
- C. Multiplayer or broad mod-map support is part of the next product milestone and must be scoped before other expansion.

Name the map/mod combinations that actually matter to your play.

Separately, are external story/content packs **required later**, **an optional extension**, or **no longer wanted**? P2-Q183–Q191 specified them before a second content set established what an extension format should contain.

**Answer / reason / timing:** _unanswered_

### Q29 — How disruptive may development updates be to a save?

**Starting point:** P4-R63/R77 permit or require fresh games for breaking pre-1.0 changes; the original design wanted migration and adding the mod to existing saves. Compatibility behavior varies by change, so “every update needs a fresh save” is not an adequate policy.

- A. Keep fresh-game freedom for breaking development changes, with clear notices.
- B. Introduce stable playtest periods; group breaking changes between them.
- C. Make continuity of existing saves a priority now, accepting the extra engineering work.

Is adding the mod to an already-running vanilla save still desired later, or should that promise be retired?

**Answer / reason / timing:** _unanswered_

### Q30 — What evidence is enough to call the next milestone good?

**Starting point:** Linux automation can prove engine behavior; Windows/Steam playtests assess delivery, clarity and feel. A boot PASS cannot establish enjoyable pacing or a satisfying mystery. The Linux machine is currently offline.

- A. Technical checks pass, then you play one complete representative investigation.
- B. Technical checks pass, then a multi-session journey proves continuity, pacing and returning to the save.
- C. Define a small invited playtest with specific observations before calling the milestone accepted.

Name three things you want to experience. Until Linux is back, choose the useful work: Windows playtest/feedback, documentation and design, or offline implementation held for later engine verification. Steam Workshop remains the delivery route you specified.

**Answer / reason / timing:** _unanswered_

## Final choices — What happens after the review? (Q31–Q32)

### Q31 — What is the next bounded playable milestone?

Choose after Q01–Q30, not from momentum. These are candidates, not a preselected roadmap:

- A. Consolidate the current investigation loop: readable stories, reliable pacing, clear clues and satisfying reflection.
- B. Prove one campaign connection: a personal opening or a player-requested distant lead, followed through to a meaningful return.
- C. Prove one survival connection: a base or crafting moment that makes investigation change how you play.

Write: **“The milestone is done when I can ___ in a normal Steam-delivered game, and we have observed ___.”** List at most three essential experiences and explicitly defer the rest.

**Answer / reason / timing:** _unanswered_

### Q32 — What rule stops old decisions becoming permanent by accident?

- A. Reaffirm the product direction at every playable milestone; technical fixes can proceed between reviews.
- B. Review when a player experience, feature boundary or real-world constraint changes; track those triggers explicitly.
- C. Use a regular short review plus a living one-page direction and a list of unresolved choices.

For the chosen rule, define what agents may decide independently, what needs an owner choice, and how that choice is recorded. Age alone should neither invalidate a decision nor protect it from review.

**Answer / reason / timing:** _unanswered_

## Decision capture sheet

Copy one row for each answered question. Keep any uncertainty visible.

| Question | Owner's confirmed wording | Next / later / outside | Older IDs kept, amended or retired | Evidence needed | Review trigger |
|---|---|---|---|---|---|
| — | No decisions confirmed yet | — | — | — | — |

Before implementation begins, check the answers together: travel guidance against survival freedom; answer-driven cases against a fixed underlying truth; physical device costs against accessibility; finite storage against promised campaign length; and new-game rules against a long personal campaign. Present conflicts for a decision instead of resolving them silently.

## Source map and coverage

- [Original discovery record](../../DECISIONS_BASELINE.md): P1 product/audience/tone/scope; P2 evidence, AI, graph, survival, identity, UI, configuration, persistence and compatibility; P3 architecture. Its numbering continues through P2-Q218 despite some older documents describing it as a 207-question record.
- [Current decision history](../../DECISIONS.md): particularly P4-R63/R68/R77, R79–R86, R91/R96/R97, R107–R123, R127–R139. A dated “not built” phrase is not reliable current implementation status by itself.
- [Engineering supersessions](../../DECISIONS_SUPERSESSIONS_2026-08-30.md), [architecture](../architecture/ARCHITECTURE_V0.2.md), [roadmap](../../ROADMAP.md) and [project state](../../PROJECT_STATE.md): context and prior constraints, with stale opening summaries noted above.
- [Campaign vision](CAMPAIGN_VISION.md), [cold trail and pull](COLD_TRAIL_AND_PULL.md), [player moments](../requirements/PLAYER_MOMENTS.md): desired experiences rather than automatic claims of delivery.
- [What do I make of it?](WHAT_DO_I_MAKE_OF_IT.md), [search loop](SEARCH_TO_FIND.md), [case pacing](CASE_PACING.md), [clues on the move](CLUES_ON_THE_MOVE.md), [Knox.OS](KNOX_OS.md): recent choices and implementation/evidence notes.
- Current implementation checked: [generator and steering](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua), [case retention](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/SuccessiveCases.lua), [question model](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Questions.lua), [automatic scheduling](../../mod/common/media/lua/client/ConspiracyFiles/AutomaticInvestigations.lua), and [organiser views](../../mod/common/media/lua/client/ConspiracyFiles/KnoxApps.lua).

Original detailed choices about graph layout, alias badges, pack formats, migration machinery and runtime AI providers are deliberately not repeated as dozens of UI or engineering questions. Q21/Q25/Q28/Q29 decide whether those parent capabilities remain wanted. If retained, their old detailed decisions need their own focused review before implementation; they do not return automatically with the feature. External content packs likewise remain an explicit later scope choice, not a commitment inherited from P2-Q183–Q191.
