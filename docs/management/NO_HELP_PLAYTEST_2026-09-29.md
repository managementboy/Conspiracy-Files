# No Help playtest - after the gap plan (2026-09-29)

Owner plays visibly on Windows. Spoiler-free: this guide names no scene,
place, person or clue. Report what you see in plain words; quote log lines.

## Before starting (once)

1. Steam profile: edit the profile summary and add this line anywhere
   (the profile must be public):
   `JavaModZBS:4a74ae101677a6e8e4e4cbdbd9b5640b4a5d43b0e58af910b0737fbef2c60b4c`
2. ZombieBuddy is subscribed and the Steam launch option is set:
   `-javaagent:ZombieBuddy.jar --`
3. Get the mod from branch `nohelp-content` (it holds
   `42/media/java/NoHelpScenes.jar` and `NoHelpScenes.jar.zbs`), enable
   "Conspiracy Files: No Help" (it now requires ZombieBuddy).
4. First start: ZombieBuddy shows a dialog for "NoHelpScenes" signed by
   your Steam ID. Allow it and tick "trust this author". It should never
   ask again.

## In a NEW game (checks)

| # | Do | Expect |
|---|----|--------|
| 1 | Start, open the debug console, type `print(NHSceneListener())` | `1|n|0|0|0` with n > 0 after some exploring: scenes are being heard |
| 2 | Explore for an in-game day or two | console.txt has `ev=scan why=scene-generated` lines |
| 3 | Find a clue, choose Inspect | the survivor says its text above the head, piece by piece; the coloured bubble shows the clue's title |
| 4 | Inspect it again later | it is said again |
| 5 | Note where clues are | mostly in containers (drawers, fridges, bins, lockers...), few loose on the floor |
| 6 | Carry a pen, find several clues | question marks on the world map, also after many finds |
| 7 | Play a long session | no stutter at saves; say if anything feels slow |

Right-click the ground > the state-dump menu entry gives a count-only status
line to quote. Send console.txt lines with `[CF]` or `ZB` in them if anything
looks wrong.
