# Conspiracy-Files: decide the direction again

Prepared 19 September 2026 against `main` at `73e6b62`, build `DEV-0.44.0-addresses-that-travel`.

**Status: Q01–Q30 confirmed. Passing technical checks is the milestone acceptance criterion. Breaking changes are acceptable until the owner judges the feature set playable long term. Detailed player settings are requested for work today; implausible bulk discoveries need redesign. The maps/flyers brainstorm remains after the questionnaire, and vanilla-scene research remains last. Remaining choices await answers. This review builds a new wishlist and revisits all existing commitments.**

**Confirmed scope:** version 1.0 enriches ordinary survival with investigations (Q01 A). A survivor-centered campaign (Q01 B) is a possible future option. All remaining recommendations must be considered within that boundary; campaign features are not implied 1.0 commitments.

**Confirmed next-development priority:** a mystery about the survivor's missing past/how they arrived, with early mysteries prioritised to match starting skills (Q03 A). This personal opening belongs within the ordinary-survival investigation direction and does not require the full future campaign. Electrician/power/radio is the owner's example of thematic fit, not a mandatory template.

**Confirmed travel direction:** start with mysteries following player exploration (Q05 A); later in the game generate mysteries that require travel (Q05 C). This progression belongs to the 1.0 investigation direction. The transition, distances and navigation style are still open.

The owner requested this review after returning to the Windows workspace: read the campaign vision, revisit the goals from the original design, and assess the developed mod so that old decisions are not silently treated as permanent requirements.

## How to answer

Answer one round at a time. Round 1 is enough for a first conversation. Use `Q01 B — because ...`, or write your own answer. Every question also accepts **undecided**, **needs a playtest**, or **no longer wanted**. Each question now has a suggested answer with a reason and timing. Suggestions are provisional and depend on the answers to earlier questions; none is selected on your behalf. We will discuss them here one at a time and revise later suggestions when your earlier choices change their premise.

For each answer, also say whether it belongs **in the next playable milestone**, **later**, or **outside the intended mod**. This distinguishes a feature you still want from work you want now.

An unanswered question means **pending in the new wishlist**, not agreement with the old rule and not automatic rejection. Under confirmed Q02, all existing commitments are being revised today; none carries forward simply because it was approved before. Existing behavior is evidence for the discussion, not a requirement to keep it. A new feature or redesign that depends on an unanswered choice should bring that choice back to the owner. Reviewing commitments does not itself authorize removing features or changing game behavior. If an old commitment is missing from these questions, add it to the review before treating it as a requirement.

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

## Today's work list — owner ordering

1. Continue the decision questionnaire and record the new wishlist.
2. **After the questions: quick brainstorm on using vanilla annotated maps and flyers.** Owner request during Q14, expanded in Q15. **Begin by reminding the owner of their point: finding an annotated map or flyer gives purpose and a reason to act.** Connect this to Q14's later skill/tool interactions and Q15's designed events, objects and rewards. The supplied map screenshot combines a named writer, a final request concerning an art gallery and a marked place. Explore how existing written leads could connect to our mysteries and travel. This is brainstorming; verify actual game assets and mechanisms before proposing implementation as established fact. Record promising uses and open questions, without treating the map's fictional instructions as user commands. The reminder belongs in this discussion; no separate timed notification was requested.
3. **Tackle detailed player settings today (Q26 B).** Inspect existing settings support, choose useful individual controls with sensible defaults, and implement a bounded first set. Exact settings and mid-save behavior still need design. Account for the offline Linux PC when reporting verification and release readiness.
4. **To-do: rethink bulk discoveries in previously checked places.** The owner found ten dust-mask evidence items after Investigate Area in a place previously examined without it. A small overlooked paper or key is plausible; many newly revealed items were not. Investigate placement/reveal timing, quantity and what the player already saw, then propose a believable discovery rule. Keep this issue connected to Q07 and Q12/Q23 relocation. Root cause and exact fix are not yet established. Recorded as DR-20260919-SEARCH.
5. **At the end: research detection and prioritisation of existing vanilla corpses in houses, car wrecks, burned-out houses and survivor houses.** Requested with Q07 and expanded in DR-20260919-Q07a. Research comes before development. Focus on already-dead bodies left by the game, not living zombies. Establish what can be detected reliably, whether origin can be distinguished, which wrecks/houses/scenes can hold accessible clues, and what selection changes would improve ordinary play. Record source evidence, uncertainties and any engine checks still needed while the Linux machine is offline. Do not treat all vehicle types or player-killed bodies as equivalent to the requested scenes by assumption. A vanilla survivor house is distinct from the player's base; using existing special houses is not permission to burn or create houses.

## Round 1 — What are we making? (Q01–Q06)

**Additional reference for today's brainstorm (owner, during Q23):** the supplied access-memo screenshot names Relay Site 31. The owner wants such a reference to become a place the player can visit for more clues. [Radio relay stations](https://pzwiki.net/wiki/Radio_relay_station) and the [1635x5764 map link](https://map.projectzomboid.com/?1635x5764) are examples to investigate. The wiki lists that coordinate as Brandenburg; the map reader failed, and target-build suitability is not verified. Do not silently designate that station as Site 31. Discuss how a written reference becomes a discoverable destination and connects to maps, flyers and later skill/tool interactions. Keep this within the brainstorm; corpse/wreck/special-house research stays last.

### Q01 — What is the main product now?

**Starting point:** Original P1-Q1/Q4 combines mystery, narrative and objectives; the [campaign vision](CAMPAIGN_VISION.md) calls the current investigation system a module within something larger.

- A. An investigation layer that enriches ordinary survival indefinitely.
- B. A campaign about the survivor, built from connected investigations across Knox.
- C. Both as explicitly separate modes, with a choice of which we finish first.

**Original assistant suggestion — not adopted:** B, a survivor-centered campaign as the destination.

**Owner decision — confirmed 19 September 2026:** A for version 1.0: investigations that enrich ordinary survival. B may be an option for the future. This does not commit a campaign release or make its features requirements for 1.0. Recorded as DR-20260919-Q01 in `DECISIONS.md`.

### Q02 — Does the original “nothing is optional” promise still apply?

**Starting point:** P1-Q23/Q24 says the long-term feature list is mandatory and prioritisation is only sequencing. That makes a growing wishlist an obligation even when the game has moved on.

- A. Keep the entire original destination; decide its order.
- B. Replace it with a small set of essential experiences; everything else must earn its place.
- C. Treat the original list as ideas and choose one bounded release at a time.

- D. Build a new wishlist; all existing commitments are being revised today. (Owner's added option.)

**Original assistant suggestion — not adopted:** B, a small set of essential experiences. The owner instead chose to rebuild the wishlist through today's review; the assistant's proposed essentials are not confirmed requirements.

**Owner decision — confirmed 19 September 2026:** D: “we are building a new wishlist. all commitments are being revised today”. Start the new wishlist from confirmed answers in this review. Previously approved commitments remain open to revision; unanswered or omitted topics do not carry forward automatically. Recorded as DR-20260919-Q02 in `DECISIONS.md`.

### Q03 — Is the survivor's missing past still the opening we want?

**Starting point:** The campaign vision begins with not knowing how the survivor arrived. The current first-case mechanism waits for an indoor location; that does not implement amnesia.

- A. Every campaign starts with that personal mystery.
- B. It is an optional background or campaign mode.
- C. The survivor's past stays player-defined; investigations concern the surrounding world.

If A or B: what may the mod establish about the survivor without taking away their roleplay?

**Original assistant suggestion — not adopted:** defer the missing-past opening to a possible future campaign.

**Owner decision — confirmed 19 September 2026:** A, as one of the priorities for next development. Also prioritise mysteries that match the survivor's skills at game start: an electrician might encounter mysteries involving power or radio. The example illustrates thematic fit; it does not prescribe a fixed case or prohibit other themes. Recorded as DR-20260919-Q03 in `DECISIONS.md`.

**Still to establish:** how much of the survivor's past the opening may define; how actual starting skill levels and profession influence selection; and whether skills affect only theme or also observations/actions. No hard skill gate is approved by this answer.

### Q04 — What kinds of truth may the player actually establish?

**Starting point:** P1-Q6/Q15/Q22 favours ambiguity and protects the cause of the Knox Event. P4-R109 now permits a settled, observed fact about an object or place.

- A. Keep that limit: objects and places can yield facts; people and motives stay unresolved.
- B. Allow local mysteries about people and motives to be solved while keeping the Knox Event unexplained.
- C. Reopen how much larger truth a campaign may reveal, including whether Knox's cause must remain unknowable.

**Suggested answer — not approved:** B — Allow well-supported local conclusions about people and motives while leaving the cause of the Knox Event unresolved. Evidence must distinguish what was observed, what a source claims and what remains a hunch. Reason: some earned answers make the remaining uncertainty meaningful. Timing: next milestone's narrative design; new truth rules need implementation and testing.

**Owner decision — confirmed 19 September 2026:** B: local mysteries, including parts of the survivor's past, may have discoverable answers; the Knox Event's cause stays unexplained. This broadens the former objects-and-places-only limit on settled local facts. It does not require every mystery to be resolved. Recorded as DR-20260919-Q04 in `DECISIONS.md`. The recommendation's specific presentation, timing and implementation details remain proposals.

### Q05 — Who decides when and where the player should travel?

**Starting point:** The campaign vision suggests geographical pull. [Cold trail and pull](COLD_TRAIL_AND_PULL.md) proposes player-requested travel. The current travel test proves the mod works during travel, not that it provides a campaign route.

- A. The player travels freely; cases follow the places they visit.
- B. The player asks for a new direction, and a local clue points somewhere distant.
- C. The campaign proactively offers a route or objectives; the player may ignore them.

If B or C: should guidance be prose and landmarks, exact map destinations, or a player-selectable level?

**Original assistant suggestion — revised by the owner:** A for the 1.0 baseline, with B as a possible later enhancement.

**Owner decision — confirmed 19 September 2026:** A early, C later. Start with mysteries around the places the player explores; later generate mysteries that require travel to other locations. The owner cited the need for new placement locations as a reason. Travel-generating mysteries belong within the 1.0 investigation direction and do not wait for the possible full campaign. Recorded as DR-20260919-Q05 in `DECISIONS.md`.

**Still to establish:** what marks the later stage, how far the player must travel, which destinations qualify and how the clues communicate a destination. No specific threshold, town sequence or navigation UI has been approved. A player-requested direction (B) is not a requirement from this answer.

### Q06 — How tightly should investigations connect?

**Starting point:** P4-R91/R96 links dates through the relay memo; R113 lets answers shape later cases. This does not yet establish a complete overarching plot.

- A. Mostly separate mysteries with occasional recurring details.
- B. Recurring people, organisations and consequences create a continuing web.
- C. An authored central arc with generated cases serving its chapters.

**Suggested answer — not approved:** B — Build a continuing web of recurring people, organisations and unresolved consequences. Use authored connections where they matter, with generated cases around them. Reason: continuity can make earlier discoveries useful without requiring a fully scripted chapter structure. Timing: next milestone, demonstrated with two linked cases.

**Owner decision — confirmed 19 September 2026:** B: recurring people, organisations and discoveries form a continuing web across mysteries. Owner: “yes the mod has developed well into this direction”. Individual mysteries can still have their own answers (Q04). This confirms the direction, not every older implementation rule or the assistant's suggested milestone. How hunches steer later cases remains open in Q09. Recorded as DR-20260919-Q06 in `DECISIONS.md`.

## Round 2 — What should playing feel like? (Q07–Q12)

### Q07 — Is sense → search → recognise → note still the core discovery loop?

**Starting point:** P4-R132 replaced immediate recognition with Search Mode or Look it over, followed by timed Inspect. The owner praised it in play, but that is evidence for this review, not a permanent exemption from review.

- A. Keep it as the standard for every clue.
- B. Keep it for subtle clues; obvious clues can be recognised directly.
- C. Make the recognition and timed-action requirements adjustable.

**Suggested answer — not approved:** A — Keep sense, search, recognition and noting as the standard. Preserve Look it over for clues already carried, and tune repetition through playtesting before adding exceptions. Reason: the current loop gives investigation a physical action in the world and already has positive owner feedback. Timing: retain and validate next milestone.

**Owner decision — confirmed 19 September 2026:** A. Owner feedback: “it is very good playing it!” Keep the current discovery loop. Improve detection and prioritisation of vanilla corpses already left by the game in houses (not zombies), and prioritise car wrecks and similar existing scenes. Research this in detail before development; put the research at the end of today's list. Recorded as DR-20260919-Q07 in `DECISIONS.md` and in the work list above.

**Owner addition during Q18:** also include vanilla burned-out houses and vanilla survivor houses as mystery locations. Add their detection and use to the same research task before development. Recorded as DR-20260919-Q07a.

### Q08 — Which player reward should guide the next milestone?

**Starting point:** The [original player moments](../requirements/PLAYER_MOMENTS.md) emphasise a suspicious ordinary object, finding a place and discovering a contradiction. P4-R110 adds leads to existing survival opportunities.

Choose a primary reward and, optionally, a secondary one:
- A. “I noticed a connection and worked something out.”
- B. “Following this led to somewhere useful or memorable.”
- C. “My survivor's story moved forward because of what I chose.”

**Suggested answer — not approved:** A primary, B secondary — Aim first for 'I worked something out', then reward following it with a useful or memorable destination. A changed personal story can grow from these later. Reason: collecting records alone is insufficient payoff. Timing: next milestone; ask the owner to describe the connection they understood and why the journey mattered.

**Owner decision — confirmed 19 September 2026:** A and B: noticing a connection and working something out, and following it somewhere useful or memorable. No ranking was specified; the assistant's primary/secondary ordering is not adopted. This does not itself approve new loot rewards or guaranteed supplies. Recorded as DR-20260919-Q08 in `DECISIONS.md`.

### Q09 — How much should a hunch change the next case?

**Starting point:** P4-R113/R119–R123 and the generator use answers to select returning entities and investigative emphasis, without marking the answer right or wrong.

**Owner correction:** the previous hunch system was discarded because it was too difficult to react to. The question above assumed it remained a wanted system and is withdrawn in that form. The fetched source still contains question rows and generator steering, but retained source is not proof of the desired or current live experience.

- A. Keep this: later evidence tests the chosen interpretation.
- B. Hunches only change the survivor's record; the world story is fixed independently.
- C. Hunches branch the campaign more strongly, changing later events or outcomes.

- D. The old hunch system was discarded; consider a new proposal only if its gameplay is clear. (Owner's added option.)

**Original assistant suggestion — not adopted:** A, continuing the former steering system.

**Owner correction — confirmed 19 September 2026:** D. The old system was discarded and was too difficult to react to. The owner asks whether a good gameplay system can record a hunch and respond to it. A replacement is not yet approved. Recorded as DR-20260919-Q09 in `DECISIONS.md`.

**Replacement proposal — not approved: record a concrete lead to check.** While reading evidence, the player can choose a known person, place or reference mentioned in it and select “Follow this lead”. The organiser keeps the source, the selected subject and an optional personal note. For a first prototype, offer a small set of supported intentions such as checking a mentioned place or watching for the same reference. Free text is personal writing; the game does not attempt to interpret it.

Example: a radio service note mentions a workshop. The player records “Was this radio repaired there?” against that known workshop. They travel there, search and inspect a service tag. If the discovered tag contains the same recorded radio serial, the organiser adds “The serial on this tag matches the radio record.” That is a concrete response; whether the workshop actually performed the repair still depends on what the evidence establishes. Only existing, observed identifiers may be matched. This example is a proposed content scenario, not a claim that serial matching or radio mechanics already exist.

The game reacts to following the lead by linking newly discovered relevant evidence and making the next known action easy to find. It does not create confirming evidence because the player wrote a suspicion or silently rewrite a future case. No match leaves the lead unresolved; the player may revise or shelve it. Investigation proceeds through ordinary search, travel and inspection. First prove one supported lead end to end; assess whether it adds more than a bookmark before building a general hunch system.

**Owner decision on replacement — confirmed 19 September 2026:** “good feedback. add as such”. Add the concrete-lead proposal above to the new wishlist as a bounded prototype: record a lead, pursue it through normal play, and connect newly discovered relevant evidence without inventing confirmation. Prove one complete interaction before committing to a general system. Its development order is not yet assigned; this does not revive the discarded end-of-case questionnaire. Recorded as DR-20260919-Q09a in `DECISIONS.md`.

### Q10 — How visible should a case's structure and completion be?

**Starting point:** Original P2-Q82 rejects completion announcements. Current decisions offer “That's all of it,” end-of-case questions, Case N rows and Evidence / Old, while hiding an undiscovered-clue total.

- A. Keep cases and reflection moments visible, with no clue checklist.
- B. Make cases less explicit; let discoveries form one continuous record.
- C. Show progress and completion clearly, including counts or checklists where useful.

**Suggested answer — not approved:** A — Keep visible cases and reflection points without showing a hidden-clue checklist. Phrase closure as 'enough to form a view' when appropriate; do not imply that an expired or inaccessible clue was found. Reason: players need orientation and a pause to think without being told every unknown. Timing: next milestone, coordinated with Q12.

**Owner decision — confirmed 19 September 2026:** A: keep recognisable cases and meaningful conclusions without revealing hidden-clue counts. Later, draw lines on the map between clues that lead to a meaningful conclusion. Recorded as DR-20260919-Q10 in `DECISIONS.md`.

**Still to establish for map lines:** manual versus automatic drawing, visual treatment of tentative versus supported connections, handling of co-located or moved clues, and any writing-tool requirement. These are not implied by accepting the goal. The separate relationship graph remains open in Q21.

### Q11 — What pace should the player experience?

**Starting point:** Automatic scheduling currently has a 24-game-hour minimum gap and an additional wait after completion; up to four active cases and placement in instalments are implementation choices, not inherently the right experience.

- A. One principal mystery at a time, with room to breathe after it.
- B. Several overlapping mysteries arriving at a restrained rate.
- C. Player-controlled demand: ask for another lead when ready.

Give a concrete expectation: during one typical real-world play session, how much investigation should happen alongside survival?

**Suggested answer — not approved:** A — Focus attention on one principal mystery; let incidental discoveries be retained quietly for later. Initial playtest target: one meaningful discovery or connection in roughly 30–60 minutes of ordinary play, with no obligation to investigate every session. This is a tuning hypothesis, not a guarantee or a reason to spawn clues beside the player. Timing: next milestone; test before changing fixed case limits.

**Owner decision — confirmed 19 September 2026:** A: one principal mystery, with incidental discoveries saved for later. This is an attention/pacing goal; it does not itself fix an internal active-case limit. The suggested 30–60-minute target and exact implementation timing were not approved. Recorded as DR-20260919-Q11 in `DECISIONS.md`.

### Q12 — What should happen to an unfinished or impossible trail?

**Starting point:** P2-Q218 leaves ignored leads indefinitely. P4-R133 drops clues that cannot be placed within three game days; a voluntary cold trail is a different proposed behavior.

- A. Preserve the mystery until the player explicitly shelves it; add recovery opportunities when necessary.
- B. Let opportunities expire naturally, with an honest incomplete record.
- C. Let the player shelve and later resume a trail; decide technical expiry separately.

For the selected approach, what must the player be told about missing evidence, and should an unplaceable clue ever count toward a case being finished?

- D. After a delay, place evidence the player has not found in new containers closer to them; unknown placement may change. (Owner's added option.)

**Original assistant suggestion — not adopted:** C, voluntary shelving and resumption. The owner instead selected renewed discovery opportunities through relocation.

**Owner decision — confirmed 19 September 2026:** D: “after a time we can place the Evidence not found in new containers closer to the player. What the player doesnt know never happened.” Unfound evidence may be placed closer after a delay. Already-learned facts remain consistent. Recorded as DR-20260919-Q12 in `DECISIONS.md`.

**Still to establish:** delay, distance, eligible containers, relocation frequency, safe handling of the previous copy and the boundary of player knowledge. A location mentioned in a read clue or an item seen but not noted may already be known. Relocation must also be reconciled with Q05's later travel requirement; no specific exception or algorithm is assumed. Voluntary shelving is not approved by this answer.

## Round 3 — How does this belong in survival? (Q13–Q18)

### Q13 — What role should bases play?

**Starting point:** The campaign vision wants places the survivor returns to; the current investigation foundation does not establish a base-centered campaign.

- A. Bases stay entirely within ordinary PZ play.
- B. A chosen home becomes a reference point for leads and return journeys.
- C. Several bases form deliberate stages of the campaign.

**Suggested answer — not approved:** B — Let the player explicitly designate a home as a reference point for departures and returns. Start with one home and allow it to change; avoid inferring ownership from a passing visit. Reason: returning can give travel meaning without turning base building into compulsory chapters. Timing: later, after the first distant-lead journey.

**Owner response — recorded 19 September 2026:** B. Reuse the base feature remembered from pz-narrator and implement it here. The owner also questions why this mod needs to know the base. The reuse request is recorded; gameplay purpose and the port's detailed behavior remain under discussion. Recorded as DR-20260919-Q13 in `DECISIONS.md`.

**Initial inspection:** the local narrator checkout at `15ac5dc` (24 August) contains room/shelter observation in `StateReader.java` and `Delta.java`. Persistent base tracking has not been verified in that copy. Find the relevant newer or alternate source before porting. This is not a finding that the remembered feature never existed.

**Purpose to resolve:** relocation toward the player can use current position. Home tracking would add a stable origin for outward travel and return journeys. It needs a concrete use; simply recording home does not create gameplay. The proposed manual designation, number of bases and timing have not been independently confirmed.

**Follow-up confirmed 19 September 2026:** owner answered “yes” to using base tracking specifically for planning outbound and return journeys and implementing it alongside travel progression. Reuse the earlier feature after locating and verifying it. Manual versus automatic designation, multiple bases and precise travel rules remain open. Recorded as DR-20260919-Q13a in `DECISIONS.md`; this resolves the purpose and sequencing questions above.

### Q14 — What does “crafting mastery” mean now?

**Starting point:** The campaign vision names dynamically built mastery; P1-Q12/Q13 favours soft requirements and survival as the main difficulty.

- A. Use existing survival skills incidentally; no investigation progression system.
- B. Existing skills provide extra interpretations and alternative ways forward.
- C. A defined crafting/skill progression unlocks campaign stages or necessary tools.

If B or C, name one desired player moment before choosing recipes, skills or XP rules.

**Original assistant suggestion — not adopted:** B, always providing alternative ways forward without a required skill/tool. The owner selected actual requirements for later-game mysteries.

**Owner decision — confirmed 19 September 2026:** some later-game mystery solutions will require a particular skill or specific tool. Use the old Monkey Island games as a mechanical reference: “use X on Y will make something appear”. This is for later development. Record concrete interactions that reveal something new; exact objects, results and skill rules remain to be designed. Do not assume every requirement must have a bypass. Recorded as DR-20260919-Q14 in `DECISIONS.md`.

**Separate request:** brainstorm existing vanilla annotated maps after these questions today, as recorded in the work list and DR-20260919-MAPS. The screenshot is reference material for that discussion, not a selected integration design.

### Q15 — How much may the mod change the existing world?

**Starting point:** Minimal intrusion was an original principle. The unnumbered 11 September decision “The mod may change what the world already contains” permits changes to existing world objects; case-person code can name and equip an existing person, while P4-R110 limits survival rewards to opportunities already present.

- A. Keep the current bounded changes for clues and case people.
- B. Observe existing people and objects; minimise or remove authored identity/loot changes.
- C. Permit story-driven events, spawned content or tangible rewards within defined limits.

Specify any unacceptable changes to bodies, inventories, buildings or survival balance.

**Original written suggestion — not adopted:** A, bounded changes to existing objects and people. In conversation the recommendation was revised to C in light of Q14, and the owner selected C.

**Owner decision — confirmed 19 September 2026:** C: allow carefully designed events, objects or rewards when a mystery needs them. Q14's skill/tool interactions work into this. Finding an annotated map gives purpose, as does finding a flyer. Remind the owner of that point during today's brainstorming session. Recorded as DR-20260919-Q15 in `DECISIONS.md` and in today's work list.

**Still to establish:** specific world changes, reward balance and boundaries around player belongings. No particular event, tool, loot item, map alteration or flyer integration was selected by this answer.

### Q16 — How strongly should the survivor's character affect investigation?

**Starting point:** P1-Q14 wants profession-, trait- and skill-specific interpretation; current Search Mode already inherits some vanilla perception conditions.

**Already confirmed through Q03:** prioritise early mysteries matching skills at game start. This is a next-development priority. The remaining question is how those skills affect observations and ways of investigating, beyond choosing a suitable theme.

- A. Keep differences mainly in spotting and survival ability.
- B. Let traits, professions and skills reveal different observations, with alternative routes.
- C. Give different characters substantially different campaign possibilities.

**Assistant recommendation as presented after Q14:** B, skill-specific observations that make expertise useful while exploring, without requiring separate stories for every profession. The earlier written suggestion of universally available alternative routes is superseded by Q14's accepted skill/tool requirements.

**Owner decision — confirmed 19 September 2026:** B: skills also change what the survivor notices or understands. This complements Q03's starting-skill mystery selection and Q14's later required skills/tools. Exact skills, thresholds and observations remain to be designed; separate stories for every character build are not required by this answer. Recorded as DR-20260919-Q16 in `DECISIONS.md`.

### Q17 — Whose investigation survives death?

**Starting point:** P1-Q6 and P2-Q28 end the story with the survivor. P4-R128 says the world retains the case record and any organiser can read it, including a new character's.

- A. The world's investigation continues automatically with a replacement survivor.
- B. A replacement survivor must recover evidence or a device to inherit the investigation.
- C. The next survivor starts a new investigation; the old record is only a historical artifact.

Should a death recap be wanted now, later, or dropped? What may it reveal?

**Suggested answer — not approved:** B — Make inherited investigation knowledge something a new survivor acquires through recovery of the previous survivor's records or device. Recovering a generic empty organiser alone should not grant another person's memories. Keep personal notes attributed to their author. A death recap can come later and contain only discovered information. Reason: this connects persistence to the physical world and preserves the meaning of death. Timing: later, as an explicit change from today's world-wide access.

**Owner decision — confirmed 19 September 2026:** “b exactly”. A new survivor must recover the previous survivor's evidence or organiser to inherit the investigation. Automatic access merely from being in the same world or acquiring a generic organiser is not the chosen behavior. Recorded as DR-20260919-Q17 in `DECISIONS.md`.

**Still to establish:** partial versus full knowledge from recovered items, how inherited records identify their original author, how a predecessor's personal opening is presented to the new survivor, and implementation timing. The death-recap subquestion has not been answered.

### Q18 — How much investigation history must remain readable?

**Starting point:** The original record is an archive. P4-R135 keeps four finished cases fully readable and reduces older cases; the current store and discovery ledger still have finite capacity. Unlimited investigation is not demonstrated by that arrangement.

- A. Preserve every discovered record throughout a long save; redesign storage if needed.
- B. Keep full recent cases and permanent concise summaries of older ones.
- C. Accept a bounded campaign/history and make that limit part of the experience.

**Suggested answer — not approved:** B — Preserve full recent cases and permanent concise summaries of older ones, including important evidence sources, unresolved connections and the player's own writing. Never silently discard owner-written notes. Measure storage before promising unlimited history; resolve retention limits before advertising a long campaign. Reason: useful continuity matters more than retaining every rendered paragraph. Timing: next milestone's retention requirements, followed by a measured storage plan.

**Owner decision — confirmed 19 September 2026:** B: recent cases remain complete; older cases retain concise summaries, important connections and the player's own notes. Material needed for unresolved mysteries or inherited investigations remains available. This does not reaffirm the existing four-full-case limit; exact recency, summary and storage rules remain to be designed. Q17's recovery requirement still controls what a new survivor may access. Recorded as DR-20260919-Q18 in `DECISIONS.md`.

## Round 4 — What should the player read, control and believe? (Q19–Q24)

### Q19 — Is the organiser still the main interface we want?

**Starting point:** P4-R79/R128 replaced the original notebook window. Physical evidence and the album remain, but the complete case view is on the organiser.

- A. Keep the organiser as the main case-reading interface.
- B. Offer equally capable electronic and paper interfaces.
- C. Make a simple accessible case view primary, with the device as an optional presentation.

**Suggested answer — not approved:** A — Keep the organiser as the main case-reading interface and retain ordinary readable physical evidence. Focus on legibility and navigation rather than rebuilding a second full interface. Reason: the device gives the mod a distinctive identity and is already substantially implemented. Timing: retain now; test during the next milestone.

**Owner decision — confirmed 19 September 2026:** A: keep the organiser as the main investigation interface. In future versions, integrate a PC through an existing PC mod the owner recalls supporting booting and CD-ROM use. Provide mysterious CDs containing, for example, government software or spreadsheets that further immerse the player in investigations. Recorded as DR-20260919-Q19 in `DECISIONS.md`.

**Future integration research:** identify the actual PC mod and verify supported game versions, media/content extension capabilities and dependency/distribution requirements. No specific mod or API is yet confirmed. Government software and spreadsheets are examples of in-game content; a full spreadsheet engine, organiser synchronisation and networking are not implied. This is future-version work, not an additional task ahead of today's explicitly ordered brainstorm and scene research.

### Q20 — Which costs of using the organiser improve the game?

**Starting point:** The implemented device uses hands, power, batteries and physical recovery; the later dead-battery decision protects stored data (P4-R86).

Choose separately for **holding it**, **battery use**, and **needing a replacement when lost**:
- A. Required gameplay cost.
- B. Optional realism setting.
- C. Remove the restriction for easier reading.

**Suggested answer — not approved:** Holding: A; battery use: A; replacement when lost: A for the default experience. Reading should work in either available hand, battery drain should allow a reasonable reading session, and power loss must preserve writing. Offer an optional easier-reading preset later if playtesting shows a need. Reason: the device belongs in survival, but its costs should create choices rather than repetitive interruptions. Timing: retain now and measure inconvenience in play.

**Owner decision — confirmed 19 September 2026:** “keep that way”: keep all three costs presented in conversation. Reading occupies an available hand; battery use matters without excessive drain from reading; losing the organiser requires recovery or replacement. A dead battery never erases evidence or notes. The optional preset in the earlier written recommendation was not selected. Recorded as DR-20260919-Q20 in `DECISIONS.md`.

**Consistency requirement:** replacing a device does not bypass Q17's recovery requirement for inheriting another survivor's investigation. Exact power tuning and any further loss-of-device data rules remain open.

### Q21 — Do we still want a player-facing relationship graph?

**Starting point:** P2-Q20 made it the main browser; later scope moved it to v2. The development Graphify graph is a separate tool and does not implement this feature.

**Already confirmed in Q10:** later draw map lines between clues leading to a meaningful conclusion. This question now asks whether a separate relationship-graph interface is also wanted; the map-line goal does not depend on choosing it.

- A. Essential to the intended mod; schedule a player prototype.
- B. A later option if ordinary records become difficult to navigate.
- C. Remove it from the intended product.

**Suggested answer — not approved:** B — Keep a player graph as a later option, conditional on actual difficulty following relationships in the organiser. First test whether a clear connection summary solves that problem. Reason: a graph is a possible interface, not itself the emotional goal of investigation. Timing: later; no graph-layout commitments return automatically.

**Owner decision — confirmed 19 September 2026:** B: keep a separate relationship graph as a future option; first assess the organiser and the planned map connections. The map-line goal from Q10 remains independently confirmed. The separate graph is not a mandatory feature or assigned to a release by this answer. Recorded as DR-20260919-Q21 in `DECISIONS.md`.

### Q22 — May the player investigate things the generator did not mark as clues?

**Starting point:** P2-Q4/Q5/Q17 and Player Moment 1 promise suspicion, bookmarks and later connections for ordinary items. Generated-case collection alone does not satisfy that promise.

- A. Any ordinary object or observation can be kept as a personal lead.
- B. Support free notes and selected object types, with a bounded scope.
- C. Keep formal investigation limited to generated clues.

If A or B, should the system sometimes connect these suspicions to a case, or should they remain the player's own notes?

**Assistant suggestions — not adopted:** bookmarking selected ordinary objects, then a narrower proposal restricted to supported follow-up actions/comparisons. The owner challenged the value beyond ordinary notes and removed the requirement.

**Owner decision — confirmed 19 September 2026:** “remove that requirement”. Ordinary-object suspicion capture/bookmarking is outside the revised requirements, not a deferred commitment. Existing free notes are not being removed. Q09a's concrete-lead prototype remains a separate confirmed item; it does not require support for arbitrary ordinary objects. Recorded as DR-20260919-Q22 in `DECISIONS.md`.

### Q23 — How much assistance should locating and remembering clues provide?

**Starting point:** P1-Q11 wants subtle guidance and stronger reminders after long breaks; current systems include Search Mode, real addresses and writing-tool-gated marks for found clues.

- A. Keep knowledge-limited hints, addresses and marks; rely on the player to follow them.
- B. Add an optional return-to-session recap and clearer help when stuck.
- C. Offer strong navigation and reminders as a normal or selectable mode.

- D. Put never-found clues in new locations to create another discovery opportunity. (Owner's added option.)

**Original assistant suggestion — not adopted:** B, an optional recap of known evidence and the lead being followed.

**Owner decision — confirmed 19 September 2026:** D: place clues never found in new locations, consistent with Q12. The owner also invites further suggestions; the assistance direction is physical discovery opportunities, not an approved recap or navigation UI. Recorded as DR-20260919-Q23 in `DECISIONS.md`.

**Related example:** the access memo naming Relay Site 31 should give the player a reason to find a real relay site and discover more clues there. Candidate station references and the supplied screenshot are recorded for today's brainstorm under DR-20260919-RELAY.

**Assistant refinement — for discussion:** move an unfound connecting clue nearer the player to explain how to find Site 31, while retaining the established destination and a reason to travel there. This supports Q05 and avoids making relocation erase all travel. It is not yet a separately approved relocation rule.

### Q24 — What emotional tone should lead?

**Starting point:** P1-Q21 combines grounded conspiracy, government/science and heavy bureaucratic dark comedy; P2-Q59 says humour is always present, including grim discoveries.

- A. Unease and mystery first; humour appears when the situation supports it.
- B. Fatalistic bureaucratic dark comedy is present throughout.
- C. Tone varies by case or campaign, with explicit limits.

Name one moment that should feel funny and one that should be allowed to stay serious.

**Original assistant suggestion — not adopted:** A — unease and mystery first, with humour when appropriate. The owner chose B instead.

**Owner decision — confirmed 19 September 2026:** B: fatalistic bureaucratic dark comedy throughout. Reaffirms the tone direction of P1-Q21/P2-Q59 in the new wishlist. Specific examples and implementation timing remain open. Recorded as DR-20260919-Q24 in `DECISIONS.md`.

## Round 5 — What are we willing to support? (Q25–Q30)

### Q25 — Is runtime AI still part of the destination?

**Starting point:** Original P2-Q1/Q2 treats AI storytelling as a capability. Current architecture makes play without AI primary; the shipped mod has no runtime AI. AI used to develop the mod is a different decision.

- A. Keep gameplay entirely offline and authored/generated by local rules.
- B. Add optional on-demand summaries or character voice, with factual boundaries.
- C. Reopen a larger AI role and assess cost, connectivity and consistency before designing it.

**Suggested answer — not approved:** A for the planned product — Keep gameplay offline and use authored content plus local generation rules. Runtime AI becomes a new proposal only if a concrete player need emerges that the local system cannot serve well. Development-time AI assistance remains separate. Reason: runtime AI adds service dependency and factual consistency work without yet solving the most important gameplay gap. Timing: outside the current roadmap, open to a future explicit review.

**Owner decision — confirmed 19 September 2026:** A: keep gameplay entirely offline using authored content and local generation rules. The owner reports this approach has proved very good in play. Runtime AI is not part of the revised product direction; development-time AI assistance remains separate. Recorded as DR-20260919-Q25 in `DECISIONS.md`.

### Q26 — Which controls should players get?

**Starting point:** P2-Q47–Q52 asks for broad configuration fixed at world creation, while many current pacing and capacity choices are constants.

- A. A few curated presets for pacing, guidance and realism.
- B. Broad individual controls, with safe defaults.
- C. One designed experience for now; expand settings only after playtest needs appear.

Which settings must remain adjustable during an existing save?

**Suggested answer — not approved:** A — Offer a few clear presets for pace, assistance and device realism once the core experience is tested. Reading/accessibility and reminder settings should be adjustable mid-save; story facts and generated content must remain stable. Apply changed future-case pacing prospectively. Reason: a few meaningful choices are easier to understand and support than many interacting switches. Timing: later; record the accessibility requirement now.

**Owner decision — confirmed 19 September 2026:** B: detailed individual settings with sensible defaults. The owner reports this has not yet been implemented and asks to tackle it today. Exact controls, ranges, defaults and mid-save adjustability remain open; the original recommendation's later timing and small-preset scope were not adopted. Recorded as DR-20260919-Q26 in `DECISIONS.md`.

### Q27 — How should new story content be approved?

**Starting point:** P4-R97 explicitly removed mandatory approval of AI-written text before shipping. P4-R107 later froze new premises/programs until the first new-style case ships; this review does not assume whether that milestone has been accepted.

- A. Continue shipping reviewed and tested content for owner evaluation in play.
- B. Approve the premise, tone and boundaries first; individual text can then ship within them.
- C. Review every new case/text package before publication.

Should the content freeze now stay, end, or be replaced by a different milestone?

**Suggested answer — not approved:** B — Agree the premise, tone and factual boundaries before a new story direction, then allow tested text within that scope to ship for owner review in play. Replace the ambiguous blanket freeze with the chosen milestone's explicit scope: content needed to prove it is allowed; unrelated expansion waits. Reason: this protects creative intent without requiring approval of every sentence. Timing: next milestone; this is a proposed amendment to the existing content workflow.

**Owner decision — confirmed 19 September 2026:** B: agree the premise, tone and boundaries first, then publish tested writing within that scope. Individual text approval is not required within the agreed scope. The separate content-freeze question was not presented in chat and remains open; the recommendation's proposed freeze replacement is not adopted by inference. Recorded as DR-20260919-Q27 in `DECISIONS.md`.

### Q28 — What compatibility must the next release promise?

**Starting point:** P1-Q18 gives high priority to custom maps and other mods; current delivery is single-player Build 42 with verified vanilla-world assumptions.

- A. Single-player on the verified vanilla Build 42 map first.
- B. Single-player plus an explicit shortlist of supported maps and mods.
- C. Multiplayer or broad mod-map support is part of the next product milestone and must be scoped before other expansion.

Name the map/mod combinations that actually matter to your play.

Separately, are external story/content packs **required later**, **an optional extension**, or **no longer wanted**? P2-Q183–Q191 specified them before a second content set established what an extension format should contain.

**Suggested answer — not approved:** A — Promise single-player on the verified vanilla Build 42 map for the next milestone. Add a small compatibility list when you name the mods you actually use; do not claim support merely because no conflict is known. External story packs should be an optional later extension, after a second genuinely different content set shows what is needed. Reason: broad compatibility is an expensive promise with no defined test matrix yet. Timing: next milestone for vanilla; later for named extensions.

**Owner decision — confirmed 19 September 2026:** A for version 1.0: single-player on the vanilla Build 42 map. The owner's explicit version scope extends beyond the question's next-release framing. Exact supported Build 42 revisions need verification; broad custom-map or multiplayer support is not a 1.0 commitment. Future PC-mod integration remains on the wishlist. The separate external-content-pack question was not presented in chat and remains open. Recorded as DR-20260919-Q28 in `DECISIONS.md`.

### Q29 — How disruptive may development updates be to a save?

**Starting point:** P4-R63/R77 permit or require fresh games for breaking pre-1.0 changes; the original design wanted migration and adding the mod to existing saves. Compatibility behavior varies by change, so “every update needs a fresh save” is not an adequate policy.

- A. Keep fresh-game freedom for breaking development changes, with clear notices.
- B. Introduce stable playtest periods; group breaking changes between them.
- C. Make continuity of existing saves a priority now, accepting the extra engineering work.

Is adding the mod to an already-running vanilla save still desired later, or should that promise be retired?

**Suggested answer — not approved:** B — Work in stable playtest periods and group breaking changes between them. State exactly which build needs a new game and why; within a period, favour preserving the ongoing run. Adding the mod to an established vanilla save stays a later research candidate, not a release promise. Reason: a campaign cannot be judged if its save is repeatedly invalidated. Timing: start with the next playable milestone.

**Owner decision — confirmed 19 September 2026:** A: allow breaking development changes until the owner feels the feature set is playable long term. Clearly identify updates requiring a fresh game. The transition depends on the owner's judgment, not an automatic version/date threshold. Stable periods were not selected; compatibility need not be broken when a change does not require it. The separate existing-vanilla-save question was not presented in chat and remains open. Recorded as DR-20260919-Q29 in `DECISIONS.md`.

### Q30 — What evidence is enough to call the next milestone good?

**Starting point:** Linux automation can prove engine behavior; Windows/Steam playtests assess delivery, clarity and feel. A boot PASS cannot establish enjoyable pacing or a satisfying mystery. The Linux machine is currently offline.

- A. Technical checks pass, then you play one complete representative investigation.
- B. Technical checks pass, then a multi-session journey proves continuity, pacing and returning to the save.
- C. Define a small invited playtest with specific observations before calling the milestone accepted.
- D. Technical checks pass. (Owner's added option.)

Name three things you want to experience. Until Linux is back, choose the useful work: Windows playtest/feedback, documentation and design, or offline implementation held for later engine verification. Steam Workshop remains the delivery route you specified.

**Suggested answer — not approved:** B — Require relevant technical checks plus your multi-session Steam playtest. Three outcomes: a discovered connection makes sense; following a chosen lead creates a worthwhile journey; after a break or reload you can understand and resume the investigation. While Linux is offline, prioritise this decision review, documentation and feedback on the already-published Windows build; hold new engine-dependent releases for verification. Reason: boot success and enjoyable continuity answer different questions. Timing: next milestone.

**Owner decision — confirmed 19 September 2026:** D: technical checks pass. No additional owner or invited playtest is required for milestone acceptance. The assistant's combined technical-and-multi-session-playtest recommendation was not adopted. Relevant technical verification still needs actual evidence; offline equipment does not waive checks or make archived passes apply to new changes. Q29's owner judgment of long-term readiness remains separate. Recorded as DR-20260919-Q30 in `DECISIONS.md`.

## Final choices — What happens after the review? (Q31–Q32)

### Q31 — What is the next bounded playable milestone?

Choose after Q01–Q30, not from momentum. These are candidates, not a preselected roadmap:

- A. Consolidate the current investigation loop: readable stories, reliable pacing, clear clues and satisfying reflection.
- B. Prove one campaign connection: a personal opening or a player-requested distant lead, followed through to a meaningful return.
- C. Prove one survival connection: a base or crafting moment that makes investigation change how you play.

Describe the intended playable behavior and keep the scope bounded. Under confirmed Q30, milestone acceptance requires passing technical checks; an owner playthrough is not an additional gate.

**Suggested answer — not approved, revised after Q03:** B, narrowed to the confirmed personal-opening priority, supported by necessary fixes to the existing loop. Suggested finish line: 'In a normal Steam-delivered survival game I encounter a mystery about how I arrived, its subject fits my character's starting skills, and I can follow and resume that investigation through the existing discovery and record systems.' Compare contrasting starting characters and a character without a strongly specialised skill profile. Reason: this tests the newly confirmed priority within ordinary survival. A deliberate campaign route, bases as campaign stages and crafting mastery remain separate open choices. Timing: next milestone proposal; exact scope and acceptance criteria still await the remaining answers.

**Owner decision:** _unanswered_

### Q32 — What rule stops old decisions becoming permanent by accident?

- A. Reaffirm the product direction at every playable milestone; technical fixes can proceed between reviews.
- B. Review when a player experience, feature boundary or real-world constraint changes; track those triggers explicitly.
- C. Use a regular short review plus a living one-page direction and a list of unresolved choices.

For the chosen rule, define what agents may decide independently, what needs an owner choice, and how that choice is recorded. Age alone should neither invalidate a decision nor protect it from review.

**Suggested answer — not approved:** A, with a living one-page record — Review direction at each playable milestone and immediately when a change would contradict a confirmed decision. Agents may fix defects, improve diagnostics and choose internal implementation details that preserve agreed behavior; changes to story truth, player agency, save continuity, interface costs or release scope need an owner decision. Record confirmation, affected older IDs and the next review trigger. Reason: deliberate reviews prevent both stale assumptions and constant reopening of minor choices. Timing: begin with this questionnaire.

**Owner decision:** _unanswered_

## Decision capture sheet

Q09 correction is recorded as DR-20260919-Q09: the previous hunch system is discarded. DR-20260919-Q09a adds the replacement above to the wishlist as a small prototype. Remaining source code must be reconciled before related implementation.

Copy one row for each answered question. Keep any uncertainty visible.

| Question | Owner's confirmed wording | Next / later / outside | Older IDs kept, amended or retired | Evidence needed | Review trigger |
|---|---|---|---|---|---|
| Q01 | A for 1.0: investigations enriching ordinary survival; B may be a future option | A: 1.0; B: possible future | DR-20260919-Q01; reaffirms P1-Q2/P2-Q208; qualifies P1-Q1 and campaign-vision scope | Normal-survival playtest criteria to be decided in Q30–Q31 | Any proposal to require a personal campaign for 1.0 |
| Q02 | D: build a new wishlist; all existing commitments are being revised today | This review | DR-20260919-Q02; replaces P1-Q24's blanket commitment | Explicit owner answers; check omitted commitments before relying on them | Any proposed requirement justified only by an old decision |
| Q03 | A: prioritise a missing-past opening and early mysteries fitting starting skills; electrician/power/radio is an example | Priority for next development | DR-20260919-Q03; personal opening adopted within Q01; starting-skill theme relevance also answers part of Q16 | Opening and character-fit acceptance criteria to be defined in Q30–Q31 | A proposal that assigns unapproved biography, adds hard skill gates or treats the example as mandatory |
| Q04 | B: local mysteries, including the survivor's past, may have answers; Knox Event's cause remains unexplained | New wishlist; informs personal-opening design | DR-20260919-Q04; broadens P4-R109, revises P1-Q15 for local mysteries, reaffirms P1-Q22's Knox boundary | Evidence and conclusion rules to be designed | A proposal that prohibits all local answers or reveals the Knox Event's cause |
| Q05 | A early, C later: begin around player exploration; later mysteries require travel | 1.0 direction; implementation sequence pending | DR-20260919-Q05; revises assistant's A-only baseline; qualifies Q01 without committing a full campaign | Transition, travel distances, destination selection and guidance to be decided | A proposal for a fixed route/threshold or to defer all required travel to a future campaign |
| Q06 | B: recurring people, organisations and discoveries form a continuing web; the developed direction is supported | 1.0 direction | DR-20260919-Q06; reaffirms inter-case continuity in P4-R91/R96/R113 at product level; Q09 reviews steering details | Specific continuity and player-understanding checks to be chosen in Q30–Q31 | A proposal to make cases wholly independent or require a central chapter storyline |
| Q07 | A: keep discovery loop; improve use of game-placed indoor corpses, car wrecks, vanilla burned-out houses and survivor houses | Research at the end of today's list, before development | DR-20260919-Q07/Q07a; reaffirms P4-R132's experience; expanded research request | Verified corpse/wreck/house detection, provenance limits, storage/access and prioritisation options | Before implementing scene selection or equating survivor houses with the player's base |
| Q08 | A and B: understanding a connection and reaching somewhere useful or memorable; no ranking specified | New wishlist; informs content and acceptance criteria | DR-20260919-Q08; renews the connection and destination player moments | Owner playtest can describe what was understood and why the destination mattered | A proposal that equates rewards solely with collecting records or assumes permission to spawn rewards |
| Q10 | A: recognisable cases and conclusions without hidden-clue counts; later connect clues leading to a conclusion with map lines | Case presentation: wishlist; map lines: later | DR-20260919-Q10; revises blanket P2-Q82 closure prohibition; separate graph stays open in Q21 | Connection meaning and map-line interaction design still needed | A proposal that exposes hidden clues or assumes automatic/manual drawing without a decision |
| Q11 | A: one principal mystery, incidental discoveries retained for later | New wishlist; detailed pacing pending | DR-20260919-Q11; current case cap and timer not automatically reaffirmed | Playtest attention and continuity; design handling of background discoveries | A proposal that equates principal mystery with deleting other cases or imposes an unapproved timer |
| Q12 | D: after a delay place unfound evidence in new containers closer to the player; unknown placement may change | New wishlist; implementation order pending | DR-20260919-Q12; reopens untouched-lead and expiry/relocation assumptions | Define knowledge boundary, timing, proximity and safe physical relocation; reconcile Q05 travel | A proposal that changes learned facts, duplicates evidence or makes all required travel disappear |
| Q13 | B: reuse pz-narrator base tracking for outbound and return journeys | Alongside travel progression | DR-20260919-Q13/Q13a; purpose and sequencing confirmed | Locate and verify actual base implementation; settle designation and route rules | Before porting or assuming additional base-dependent behavior |
| Q14 | C: later mystery solutions can require skills/tools; use-X-on-Y interactions reveal something new | Later development | DR-20260919-Q14; replaces assistant's universal-alternative-route recommendation | Specific interactions, acquisition paths, skill requirements and engine support need design/research | A proposal that removes all real requirements or assumes an unverified game interaction |
| Q15 | C: designed events, objects and rewards may serve mysteries; maps and flyers give purpose and connect to Q14 | Wishlist; maps/flyers brainstorm after questions today | DR-20260919-Q15; expands beyond P4-R110's existing-opportunities-only boundary | Define specific interactions, balance and player-property limits | Before implementing a world change or forgetting the maps/flyers purpose reminder |
| Q16 | B: skills affect observations and understanding, alongside mystery selection and later requirements | New wishlist; detailed timing pending | DR-20260919-Q16; reaffirms skill-specific observations from P1-Q14; complements Q03/Q14 | Define supported observations, skill thresholds and verified game interfaces | A proposal that invents facts from expertise or assumes every required skill has a bypass |
| Q17 | B: a new survivor must recover the predecessor's evidence or organiser to inherit the investigation | New wishlist; timing pending | DR-20260919-Q17; changes P4-R128 automatic access and original death-ending assumption | Test character knowledge, physical recovery and persistence; decide partial/full access and authorship | A proposal that grants automatic inherited knowledge or treats the predecessor's personal history as the new survivor's |
| Q18 | B: full recent cases; older summaries, important connections and player notes retained; needed evidence remains available | New wishlist; timing pending | DR-20260919-Q18; revises archive requirements without reaffirming current numeric limits | Define recency and summary content, measure storage and verify Q17 access rules | A proposal that discards needed evidence/notes or confuses retention with automatic inheritance |
| Q19 | A: organiser stays primary; future PC integration with mysterious CDs, such as government software or spreadsheets | Organiser: current direction; PC integration: future versions | DR-20260919-Q19; reaffirms P4-R79/R128 organiser direction and adds a future wishlist item | Identify PC mod; verify content APIs, game support and dependency model | Before assuming capabilities or making PC integration a 1.0 requirement |
| Q20 | Keep hand use, meaningful battery use and recovery/replacement when lost; dead batteries never erase evidence or notes | Retain in current direction; tuning pending | DR-20260919-Q20; reaffirms physical organiser and P4-R86 data protection | Check practical reading time, power persistence and Q17 knowledge access | A proposal that erases data on battery failure or grants inherited knowledge through a generic replacement |
| Q21 | B: separate relationship graph is a future option; assess organiser and map connections first | Possible future, not a release commitment | DR-20260919-Q21; replaces mandatory graph scope inherited from P2-Q20–Q25; Q10 map lines stand | Observe relationship-navigation needs before deciding on a graph | A proposal that assumes a graph must ship or restores old detailed graph requirements automatically |
| Q22 | Remove the requirement to capture suspicions/bookmarks about ordinary objects | Outside revised requirements | DR-20260919-Q22; retires ordinary-object capture promises in P2-Q4/Q5/Q17 at this scope; Q09a stands | None required to remove a wishlist requirement | A proposal that reintroduces arbitrary-object leads as an inherited obligation or deletes free notes by inference |
| Q23 | D: renewed discovery opportunities by putting unfound clues in new locations | New wishlist; detail coordinated with Q12 | DR-20260919-Q23; recap proposal not adopted; relay example in DR-20260919-RELAY | Define relocation versus established destinations; verify candidate sites before binding them | A proposal that silently removes required travel or treats a sample relay coordinate as the chosen Site 31 |
| Q24 | B: fatalistic bureaucratic dark comedy throughout | New wishlist; timing open | DR-20260919-Q24; reaffirms P1-Q21/P2-Q59 tone | Representative writing reviewed in play | A proposed change to the overall tone |
| Q25 | A: offline gameplay using authored content and local generation; owner reports very good results | Retain current approach | DR-20260919-Q25; supersedes runtime-AI expectation in P2-Q1/Q2 | Owner's positive play experience | Any proposal to introduce runtime AI |
| Q26 | B: detailed individual settings with sensible defaults | Tackle today after questions and brainstorm | DR-20260919-Q26; broad configuration confirmed, world-creation-only rule still open | Inspect existing support; define and verify useful controls | Settings that rewrite established facts or change confirmed physical-device behavior |
| Q27 | B: agree premise, tone and boundaries, then publish tested writing within scope | Content workflow | DR-20260919-Q27; qualifies P4-R97; separate P4-R107 freeze question open | Agreed story scope and tested content | New premises or content outside approved boundaries |
| Q28 | A: single-player on the vanilla Build 42 map | Version 1.0 | DR-20260919-Q28; reaffirms P1-Q3/P1-Q19 and narrows P1-Q18 for 1.0 | Verify supported game revisions and vanilla-world play | A proposed 1.0 promise of multiplayer or broad custom-map support |
| Q29 | A: allow breaking changes until the owner judges the feature set playable long term | Current development; owner decides transition | DR-20260919-Q29; reaffirms P4-R63/R77 with owner-controlled threshold | Clear notice when an update requires a fresh game | Owner declares long-term readiness or requests save continuity |
| Q30 | D: technical checks pass; no additional playtest acceptance gate | Milestone acceptance | DR-20260919-Q30; combined technical-and-playtest suggestion not adopted | Actual passing checks relevant to the changed milestone | A proposed additional acceptance gate or claim based on stale technical evidence |

Before implementation begins, check the answers together: travel guidance against survival freedom; answer-driven cases against a fixed underlying truth; physical device costs against accessibility; finite storage against promised campaign length; and new-game rules against a long personal campaign. Present conflicts for a decision instead of resolving them silently.

## Source map and coverage

- [Original discovery record](../../DECISIONS_BASELINE.md): P1 product/audience/tone/scope; P2 evidence, AI, graph, survival, identity, UI, configuration, persistence and compatibility; P3 architecture. Its numbering continues through P2-Q218 despite some older documents describing it as a 207-question record.
- [Current decision history](../../DECISIONS.md): particularly P4-R63/R68/R77, R79–R86, R91/R96/R97, R107–R123, R127–R139. A dated “not built” phrase is not reliable current implementation status by itself.
- [Engineering supersessions](../../DECISIONS_SUPERSESSIONS_2026-08-30.md), [architecture](../architecture/ARCHITECTURE_V0.2.md), [roadmap](../../ROADMAP.md) and [project state](../../PROJECT_STATE.md): context and prior constraints, with stale opening summaries noted above.
- [Campaign vision](CAMPAIGN_VISION.md), [cold trail and pull](COLD_TRAIL_AND_PULL.md), [player moments](../requirements/PLAYER_MOMENTS.md): desired experiences rather than automatic claims of delivery.
- [What do I make of it?](WHAT_DO_I_MAKE_OF_IT.md), [search loop](SEARCH_TO_FIND.md), [case pacing](CASE_PACING.md), [clues on the move](CLUES_ON_THE_MOVE.md), [Knox.OS](KNOX_OS.md): recent choices and implementation/evidence notes.
- Current implementation checked: [generator and steering](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua), [case retention](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/SuccessiveCases.lua), [question model](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Questions.lua), [automatic scheduling](../../mod/common/media/lua/client/ConspiracyFiles/AutomaticInvestigations.lua), and [organiser views](../../mod/common/media/lua/client/ConspiracyFiles/KnoxApps.lua).

Original detailed choices about graph layout, alias badges, pack formats, migration machinery and runtime AI providers are deliberately not repeated as dozens of UI or engineering questions. Q21/Q25/Q28/Q29 decide whether those parent capabilities remain wanted. If retained, their old detailed decisions need their own focused review before implementation; they do not return automatically with the feature. External content packs likewise remain an explicit later scope choice, not a commitment inherited from P2-Q183–Q191.
