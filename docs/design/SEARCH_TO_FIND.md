# Clues are found by searching (P4-R132)

- **Status:** Design, 2026-09-16. Stage 1 (search and recognise) built 2026-09-17; see the end.
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
