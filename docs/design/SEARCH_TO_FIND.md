# Clues are found by searching (P4-R132)

- **Status:** Design, 2026-09-16. Stage 1 (search and recognise) and stage 2 (look it over, timed Inspect, the wordless cue) built 2026-09-17; stage 3 (the checks) the same day; see the end.
- **The collision with P4-R134, found and settled 2026-09-18.** A clue on a
  **walking zombie** cannot be spotted: **the game turns Search Mode off by
  itself when a zombie is close**, which is exactly where the survivor would
  have to stand. Evidence `20260918T045929-instalments.txt` - a clue on a zombie
  one tile away, facing it, `isSearchMode` still false after 120 seconds of the
  check turning it on once a second. The owner settled it in favour of this
  decision (**P4-R136**): a clue is placed only on a body, which is no threat,
  so Search Mode stays on beside it. The corpse carrier itself was broken by a
  wrong inventory call and was fixed the same day (see
  `docs/design/CLUES_ON_THE_MOVE.md`, fault 1). Searching is therefore still how
  every kind of clue is found.
- **Owner:** shaped in conversation on 2026-09-16 ("I would love to mix both",
  "perfect!", "the investigate area dropdown would need another entry").
- **Game:** Build 42.20. Everything marked *verified* was read in the installed
  game's own Lua on the Linux machine.

## Why

The mod announces two different things the same way: a white line with the
survivor's words and a coloured bubble with a fact, fired together and queued
into each other.

- **(a)** "be aware of something"
- **(b)** "your character did something"

The owner found the order weird. The fix is not a new arrangement of those two
surfaces. It hands each job to a system Project Zomboid players already read
without thinking.

## The loop

**sense → search → recognise → note**

1. **Sense.** Near an unrecognised clue the survivor may give a wordless cue in
   the speech bubble ("Hm?"). Passing a further unrecognised clue later gives
   "...again?". It never names the thing, its direction or its distance. Rules:
   - once per place (container or square);
   - only when the survivor could plausibly see it (same room, or in view
     outdoors);
   - its chance falls with darkness and rain, as spotting does;
   - the very first cue of the first case says "Hm? I should have a proper look
     around here." This is the only teaching; Knox.OS HELP also mentions
     searching.
2. **Search.** Only with the game's Search Mode on (the Investigate Area window)
   can a clue be spotted. Each clue gets an icon of our own class at its
   container's square, like the game's stash containers. The game's spotting
   rules apply:
   - a timer that fills while the spot is in view;
   - faster when sneaking or aiming;
   - slower in darkness or rain;
   - better with Eagle Eyed.

   When spotted, the game's own bounce and ground marker show the container.
   Nothing is written over the head.
3. **Recognise.** A clue is placed as an ordinary game item: a "Key", a
   "Note". It has no title, no Evidence category and no Inspect option. It
   becomes evidence (title, Evidence category, Inspect) at one of two moments:
   - it is spotted in Search Mode; or
   - **"Look it over"** is used on it while carried. This is a short timed
     action with the game's progress bar, so a clue looted without searching is
     never lost to the case.
4. **Note.** Inspecting is a timed action with the game's progress bar. The
   survivor takes out the organiser; moving or a zombie interrupts it, as
   reading does. When the bar completes, the item shows its record number. Map
   marks already use the pen action; filing into the album is the game's own
   move-item action. None of these has a line over the head.

The survivor's voice stays only for realisations that happen in the head:
records that disagree or agree, a body's key fitting this door, nothing left to
find, and "What do I make of it?". They are rare, so they no longer compete in
a queue.

## Search Focus entry

The Investigate Area window lists search focuses (Animal Tracks, Firewood,
Stones). We add one, proposed **"Clues"**.

- *Verified:* `ISSearchWindow:updateSearchFocusCategories` lists every
  `forageSystem.catDefs` entry that is not `categoryHidden`, whose
  `identifyCategoryPerk` level is met, and that has a translation
  `IGUI_SearchMode_Categories_<name>`. Mods add categories with
  `forageSystem.addCatDef`.
- *Verified:* the chosen focus only changes the game's own forage icons
  (`ISForageIcon`, `ISSearchManager` focus rolls). Our clue icons read
  `searchWindow.searchFocusCategory` themselves: with "Clues" chosen, spotting
  is faster and reaches further; with no focus, clues are still spottable, just
  more slowly.
- *To verify in game:* a category with no forage items and no zones must not
  make the forage system try to spawn random finds.

## Verified hooks in the game

- `ISSearchManager:addIcon(id, iconClass, itemType, itemObj, x, y, z)` adds an
  icon of any class on any square.
- `ISBaseIcon:updateSpotTimer` / `checkIsSpotted` / `spotIcon` handle spotting:
  view distance, centre of view, perk level, timer, bounce, ground marker.
  Spotting only runs while `manager.isSearchMode`.
- `forageSystem.getWeatherPenalty`, `getLightLevelPenalty` and
  `getTraitVisionBonus` supply the conditions.
- `createIconsForContainers` already marks stash containers on their square,
  which is the model for a clue in a closed drawer.
- `onToggleSearchMode` is a Lua event.

## What changes in the mod

| Today | After |
|---|---|
| A clue is titled and categorised Evidence when placed | A plain item until spotted or looked over |
| ClueHints speaks near a hidden clue | The wordless cue (sense) |
| "I should take a proper look at this" on pickup | Only after recognition |
| Inspect is instant | Timed action with progress bar |
| "Inspect Investigation Evidence" on any clue | Only on recognised clues |
| Set A "noted" lines over the head | Gone; the progress bar and the item change say it |

Rules change, so a new game is needed (P4-R77).

## Risks

- **Players who never search.** Clues still turn up by ordinary looting, and
  "Look it over" recognises them, so no case becomes unfinishable. But the
  intended pace depends on players learning to search.
- **The cue as a hot-and-cold marker.** Guarded by once per place, line of
  sight, conditions, and no direction. Playtest will tell.
- **Foraging internals are the game's.** A game update can change them. The
  build keeps our icon class, focus handling and spot logic in one module and
  checks the hooks at start.
- **Tests.** Every automatic check that inspects a clue needs a "search and
  spot" or "look it over" step first.

## Build order (when approved)

1. A Linux proof: add the "Clues" focus and one icon on a known container;
   spot it in Search Mode; confirm no random forage spawns and no errors.
2. Recognition: place clues as plain items; relabel on spot and on "Look it
   over".
3. Timed Inspect with progress bar; remove the Set A lines.
4. The wordless cue with its guardrails; retire ClueHints' spoken hints.
5. Update the checks (core_loop, campaign, knox) with search and spot steps;
   unit tests; boot check; publish; attended Windows playtest.

## Stage 1 built (2026-09-17, DEV-0.42.0-search-to-find-1)

Built: search and recognise. Not yet: "Look it over", timed Inspect, the
wordless cue, retiring ClueHints' spoken hints, and the checks that inspect
clues (core_loop, campaign, knox, drop_note) - those now fail at Inspect until
stage 3 adds a search or look step (`ConspiracyFiles.ClueSearch.debugRecognise(docId)`).

**Proven in the real game** (`tools/autotest/checks/clue_search.sh`, PASS,
docs/management/evidence/linux-autotest/20260917T135239-clue-search.txt):
- The "Clues" focus is in `forageSystem.catDefs`, `IGUI_SearchMode_Categories_Clues`
  resolves to "Clues", and the Investigate Area window offers it. Across all 17
  loot-table zones it has 0 items and 0 rolls, and `pickRandomItemType(zone, "Clues")`
  returned nothing in 170 tries. This settles the design's "to verify in game".
- Forage icons counted outdoors near the start after 20 s of Search Mode: 9
  with no focus, 9 with Clues, same categories, none of category Clues.
- With Search Mode on, each unrecognised clue within 16 tiles has an icon of
  our class (`ISClueIcon`, iconClass `clueObject`) on its container square.
- Standing at a clue with no focus: spotted and recognised 4.2 s after Search
  Mode went on (game timer 2500 ms at Foraging 0, view 3.0 tiles). With Clues:
  2.9 s (timer fills twice as fast, view 4.5 tiles). Times include the check's
  own polling. The item read "Photograph of a First Birthday Party / Memento"
  before and "Staff photograph / BF-441 / Evidence" after.
- 0 errors inside the mod; the boot check passed on the same build.

**Numbers chosen:** icons within 16 tiles, dropped past 24; Clues focus spots
2x as fast and 1.5x as far (capped at the game's 15-tile vision cap); the pin
lingers 8 s after recognition. All in `ClueSearchRules.lua`.

**Differs from the design:**
- *No ground marker.* The game only draws its iso marker for forage icons, and
  its marker housekeeping removes any other; a spotted clue shows the game's
  bouncing pin (a "?" pin, never the item's picture) and the item changes name.
- *Seeing furniture.* The game's own sight test failed for clues in shelves
  (the shelf blocks its own square, and the game does not count that square as
  seen). Our icon also counts a clue as seen when the lighting passes the game's
  rule and a side of it with no wall is the survivor's square or one they can
  see. Darkness is unchanged: a clue in a room darker than the game's cutoff
  (light penalty 0.50) is not spotted at all, as with forage. The first run hit
  exactly that; "Look it over" (stage 2) is the way for dark rooms.
- *Clues in cars* get an icon where the car stood at placement; if the car has
  since moved, the icon is in the wrong place (stage 2's "Look it over" covers it).
- *Other leaks closed as well:* the evidence album no longer files an
  unrecognised clue, the pickup line and unread reminder ignore it, and dropping
  one on the organiser counts it as not evidence.

**Interfaces for stages 2 and 3** (all in the client runtime):
- `R.recognise(itemOrDocId, how)` - how is "search", "look" or "debug"; returns
  ok, newlyRecognised. Saves the flag (`recognised` list in the case root,
  validated by Session) and stamps title and category on every reachable copy.
- `R.isRecognised(item)`, `R.isRecognisedId(id)` - noted and finished-case
  evidence count as recognised.
- `R.inspect` refuses an unrecognised clue; GeneratedMenu offers nothing for one
  (stage 2 adds "Look it over" at that spot).
- `R.clueTargets()` - {id,x,y,z,status,recognised,vehicle} for live clues.
- `ConspiracyFiles.ClueSearch`: `sync()`, `state()`, `spotted`, `counters`,
  `debugRecognise(docId)`, `Rules.debugSpotScale` (checks only).

## Stage 2 built (2026-09-17, DEV-0.42.0-search-to-find-2)

Built: "Look it over", Inspect as a timed action, Set A removed, the wordless
cue (ClueHints retired), a Knox.OS HELP entry, car icons that follow the car.
Not yet: the checks that inspect clues (core_loop, campaign, knox, drop_note)
still need a search or look step, now also a wait for the timed action or
`ClueActions.instant` (stage 3).

**Proven in the real game** (`tools/autotest/checks/clue_actions.sh`, PASS on
00d8da4, docs/management/evidence/linux-autotest/20260917T142928-clue-actions.txt):
- *The cue.* Walking (the game's own walk action) from 7 tiles up to a lit
  clue in a hall, the survivor said "Hm? I should have a proper look around
  here." once (the first cue of the save). Leaving, clearing the session's
  cooldown and coming back to the same place gave no second cue; the log says
  `place already cued`. In an earlier run the cue came by itself right after
  spawn, at a clue in the start house, with the teaching line
  (20260917T142321-clue-actions.txt; that run failed on faults in the check
  itself, fixed since: a walk past a second clue rightly cued that one first).
- *Look it over.* A plain "Friendly Letter / Junk", taken into the inventory,
  had exactly one mod option, "Look it over". Choosing it ran `CFLookItOver`
  in the action queue with the progress bar for 3.1 s (150 units); it was not
  recognised while running and afterwards read "Public notice / MC-811 /
  Evidence".
- *Inspect.* Then "Inspect Investigation Evidence" (not greyed) ran
  `CFInspectEvidence` for 2.1 s (100 units); not noted while running, noted
  after. No "Noted" line; the discovery hook logged `nothing said`.
- 0 errors inside the mod. The stage 1 check (`clue_search.sh`, PASS on the
  same commit, 20260917T143145-clue-search.txt) still spots and recognises
  after the sight test was moved into a shared helper, and the boot check
  passed (105 of 105 mod files, 20260917T143449-boot.txt).

**Numbers chosen** (ClueCueRules.lua, ClueActions.lua): cue within 3 tiles on
the same floor, re-armed past 5; 60 s cooldown between cues; chance 0.8 times
the game's foraging light factor times its weather factor
(`forageSystem.getLightLevelPenalty`, `getWeatherPenalty`), rolled once per
approach; a spot darker than the game's light cutoff gives no cue at all; at
most 64 cued places kept. Look it over 150 units (3.1 s), Inspect 100 (2.1 s).

**How the cue decides** (ClueCue.lua): a placed clue nobody has recognised,
still really in its container (a clue already taken keeps its "placed"
status), seen by `ClueSearch.seesSpot` - same floor; same room, or both out of
doors; lit; in view the game's way or from an open side of the furniture, as
stage 1's icons. Once per place (container, or the car's part) for the life of
the case, remembered in the world's ModData (`ConspiracyFiles.ClueCue`:
`first`, `cases`, `places`; finished cases pruned). The bubble only, no halo,
the soft UI tick. Logged once per approach: `cue said`, `cue suppressed ...:
<why>`, or `cue not possible ...: <why>`.

**Differs from the design or the brief:**
- *Carried only.* Look it over is offered only for a clue whose outermost
  container is the survivor (bags included); in the world, searching is the
  way.
- *No organiser taken out.* Inspect keeps today's conditions (carried, or the
  organiser open; "Note in the Investigation" in place otherwise) and does not
  equip the organiser. Both actions use the game's reading pose.
- *"Same room"* is the game's room: in an open-plan house two areas without a
  wall between are different rooms and give no cue across.
- *Interruption by moving* is the game's `stopOnWalk`/`stopOnRun`/`stopOnAim`,
  proven in the unit tests only, not in the game.
- *Car icons* follow the car when it is loaded (found by the mark on its part
  within 24 tiles of the survivor, looked up at most every 2 s); unit-tested,
  not yet seen in the game with a driven car.
- *T3Nearby's old copy* of the spoken hints (`T3Nearby.enableHints`) was
  removed with ClueHints.

**Interfaces for stage 3** (all debug-only knobs, never set by the mod):
- `ConspiracyFiles.ClueActions.instant=true` - "Look it over", Inspect and Note
  complete at once when chosen (same guards), so a check driving the menu need
  not wait. Otherwise wait for `R.isRecognised(item)` / `R.isInspected(item)`,
  or read the queue (`ISTimedActionQueue.getTimedActionQueue(p).queue[1].Type`
  is `CFLookItOver` / `CFInspectEvidence`).
- `ClueActions.lookItOver(player,item)`, `ClueActions.inspect(player,item,inPlace,expected)`;
  `ClueActions.lastLook` / `lastInspect` = {ok, ms}; `LOOK_TIME`, `INSPECT_TIME`.
- `ConspiracyFiles.ClueCue`: `state()`, `debugReset()` (session memory and
  cooldown, never the save), `debugOnly=<docId>`, `Rules.debugChance=<0..1>`.
- `ClueSearch.debugRecognise(docId)` as before; `ClueSearch.seesSpot(player,square)`,
  `ClueSearch.liveClues(player)`.
- `R.clueTargets()` rows now also carry `case`, `place`, `token`, `part` and
  `target` (the stored table; read, never change).

## Stage 3 built (2026-09-17, DEV-0.42.0-search-to-find-3)

Built: the checks that inspect clues now recognise them first, the player's
way. One mod bug found and fixed on the way (below), hence the version.

**How the checks find, recognise and inspect now.** One helper,
`note_carried` in `tools/autotest/lib.sh`, used by `inspect_doc` (reload, death,
faults, perf, campaign), core_loop, knox and writecost:
- find and take the clue as before (`CFLoop.find` looks up the item by its
  `cfGeneratedId`, never by name or category, so the plain name does not
  matter);
- choose **"Look it over"** from the real right-click menu (`CFLoop.lookOver`)
  and wait up to 20 s for `CFLoop.recognised()`;
- choose **"Inspect Investigation Evidence"** (`CFLoop.inspect`) and wait up to
  20 s for `CFLoop.inspected()`. A failure names the action queue's head.

Reports now print the recognised title and the plain name it was found as
("Timesheet / LD-832 (found as Note)"). drop_note looks each carried clue over
(not inspected: the drop notes them) and recognises the one it leaves lying in
its drawer by Search Mode (`CFLoop.searchOn`, facing it); only if that fails in
15 s (a room too dark to spot) does it use `ClueSearch.debugRecognise`, and says
so as a finding. It was spotted by search in both runs.

**`ClueActions.instant` is not used by any check.** The two timed actions add
about 6 s per clue; no check's budget needed more.

**Results in the real game (Linux, Intel GPU, `docs/management/evidence/linux-autotest/`):**

| Check | Result | Evidence |
|---|---|---|
| core_loop | FAIL, then PASS | 20260917T144206 (all 4 clues looked over and inspected; failed only on "no second case within 150 s": the mod logged "insufficient distinct loaded storage nearby", the standing-still limitation of 98c3e42), 20260917T144714 PASS |
| knox | PASS | 20260917T145339-knox.txt |
| drop_note | FAIL, then PASS | 20260917T145344 (mod error, the bug below), 20260917T145803 PASS on the fix |
| organiser | PASS | 20260917T150346-organiser.txt |
| reload | PASS | 20260917T150351-reload.txt |
| death | PASS | 20260917T151058-death.txt |
| faults | PASS | 20260917T151338-faults.txt |
| perf | PASS | 20260917T151937-perf.txt |
| clue_actions, clue_search | PASS after the proof | 20260917T154859, 20260917T155112 |

Other suite members do not inspect clues (vehicle_reach only takes one;
wallet_id, case_body, reshuffle, hardware, pdagame, pdalife, pdaperf, boot and
the Fieldnote check touch no clue) and were not re-run.

**Mod bug found.** `ClueActions` chose the reading pose with
`item:getReadType()`, which only Literature has. On a clue that is a piece of
wooden armour it threw inside `pcall`, and the game still logs that as a mod
error (drop_note 20260917T145344). Now asked only when
`instanceof(item,"Literature")`; `test/look_it_over.lua` covers it.

**prove.py** (20260917T152343-prove.txt, caught 3 of 3, both baselines PASS,
worktree clean afterwards):
- `spot-recognises` (clue_search): spotting no longer recognises. CAUGHT: "not
  spotted within 120 s" for both focuses.
- `look-recognises` (clue_actions): Look it over completes but does not
  recognise. CAUGHT: "not recognised after Look it over".
- `cue-once-per-place` (clue_actions): the once-per-place rule removed. CAUGHT:
  "a second cue at the same place".

**campaign** (run once, 20260917T160453-campaign.txt): FAIL, only on the known
limitation. Case 1 was played end to end (5 clues looked over and inspected,
Evidence / Old, FILES question row, save/reload); case 3's four clues were
played the same way; 0 mod errors in every session. Every failure follows from
"no second case within four minutes of the gap being removed": the mod logged
"Deferred: insufficient distinct loaded storage nearby" 17 times, which is
P4-R125/P4-R67 waiting for a survivor who moves, and the check stands still
(as in the runs of 98c3e42). Not chased. The boot check passed on the final
build (20260917T170357-boot.txt, 105 of 105 files, 0 errors).

## The pin for a clue in a car goes on the part (2026-09-17, after stage 3)

**The bug.** `ClueSearch.vehicleSpot` pinned the icon at
`part:getVehicle():getSquare()` - the middle of the car. The game's spot timer
only fills while the survivor is within the icon's `viewDistance`
(`ISBaseIcon:updateSpotTimer`), and at Foraging 0 in daylight `viewDistance` is
exactly `forageSystem.minVisionRadius`, 3.0 tiles: `doVisionCheck` multiplies
the radius down by the level-0 difficulty penalty (0.1) and the item-size
penalty (0.5) and then clamps it back up to `minRadius`. A car's body blocks the
squares it stands on, so the middle of a car is further from any square the
survivor can stand on at its front or its back than the game will ever reach -
a clue in a pickup's bed could not be spotted from the tailgate at all.

**The evidence** (`20260917T215847-clue-field.txt`): the icon existed and
followed the moved car, the sight test passed, the light was clear
(penalty 1.00, too dark false), and the spot timer stayed at 0 of 2500 through
156 s of searching, 3.54 tiles away. Every number in that run follows from the
game's own code: `spotTimerMax` 2500 means `updateSpotTimer` was running, so
the icon was being *seen*; 3.54 > 3.0 means the timer could only ever decay.
The darkness stage's `0/10000` in the same run is the same reading in reverse -
`spotTimerMax` untouched from `ISBaseIcon:new`, because a spot the game calls
too dark never reaches `updateSpotTimer` at all.

**The fix.** `vehicleSpot` now asks the game where the part is, the way the
game's own UI does (`ISVehiclePartMenu.lua:28`):
`vehicle:getAreaCenter(part:getArea())`, then the square under that point. A
glovebox sits at the front passenger seat, a boot at the tailgate, a seat at
its door - all squares the survivor can stand beside. A part with no area (an
engine part, or a car script without one) keeps the car's own square, so a clue
is never pinned nowhere. `test/clue_search_rules.lua` pins it: the bed of a
truck two tiles behind its middle is inside the 3.0-tile reach from the
tailgate and the middle is not, and the icon goes up on the bed's square.

**Half of that failing run was the check, not the mod**, and it is worth saying
plainly: at Foraging 0 the reach is 3.0 tiles, and the harness searched from
3.54. `tools/autotest/checks/clue_field.lua` has since been changed to stand on
the nearest free square and try the Clues focus (05e98c5), which is the right
answer for the check; the pin on the part is the right answer for the mod. A
real game still has to show a clue in a car spotted and recognised - nothing
below the icon layer has been proven for a car yet.

## What the game answered, overnight 2026-09-17/18 (`checks/clue_field.sh`)

Four things this design had shipped on unit tests or on a reading of the game's
Lua. All four were put to the running game (Linux, Intel GPU); the check is
`tools/autotest/checks/clue_field.sh`, evidence
`docs/management/evidence/linux-autotest/20260917T21{4331,5304,5847}-clue-field.txt`
and `20260918T001740-clue-field.txt` (PASS).

**Interruption is real.** Walking cut "Look it over" at 33-34% of the bar and
the clue stayed unrecognised (`ClueActions.lastLook` nil); aiming cut it at 32%;
walking cut Inspect at 48% and nothing reached the record. Left alone, both
completed (Inspect 2.1 s). The survivor walked and aimed from the real keyboard
and mouse - `pz.sh hold w 2` and `pz.sh hold mouse3 2` - and the game itself
reported them moving and aiming, so this is `stopOnWalk`/`stopOnAim` doing the
work, not a Lua guess.

**Recognition survives a save and a reload.** A "Receipt" looked over became
"Establishment list / HK-937 / Evidence"; after `stop --save` and
`start --continue` it was still that, still Evidence, still recognised by the
record, still offered Inspect (not greyed), and Inspect then noted it in 2.1 s.
Repeated on three runs with different clues.

**A clue in a car, once the car moves.** A case put a clue in a parked van's
glove box; the van was taken out of the world, put down ten tiles away and
given its physics back (`removeFromWorld`, `setPhysicsActive(false)`,
`setPosition`, `setCurrentSquareFromPosition`, `addToWorld`, `createPhysics` -
all accepted on Build 42.20). The clue's icon followed to the **part's own
square**: 0.00 tiles off it, 1.00 from the car's middle, and it was spotted
there with **no search focus at all**, at once. The run before the part-pinning
fix stood 3.54 tiles from the car's middle and never spotted it in 156 s, which
is what that fix was for.

**Darkness, and what a torch does.** At 01:00 in an office the clue's square
read a light penalty of 0.07 - below the game's own cutoff (50) - and standing
2.0 tiles away in the same room it was NOT spotted in 80 s of searching, with
the spot timer stuck at 0/10000. With a lit heavy-duty flashlight in hand at
the same distance the square read 1.00, "too dark" cleared, and it was
recognised at once. The game's rule underneath, read in `ISBaseIcon`, is worth
knowing: `getCanSeeThisUpdate` returns true for `isOnSquare` BEFORE it tests the
light, and `doVisionCheck` caps an unlit spot at `darkVisionRadius` 1.5 tiles.
So an unlit clue is not "unfindable" - it is findable only by standing on it,
or by bringing a light. A check that teleports onto the clue's square, as the
first run did, spots it in 3 s and proves nothing about darkness.
