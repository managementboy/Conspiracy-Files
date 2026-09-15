---
title: "Resolving problems with mods"
source: "https://pzwiki.net/wiki/Resolving_problems_with_mods"
source_revision: "https://pzwiki.net/w/index.php?title=Resolving_problems_with_mods&oldid=1392779"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 04:00."
retrieved: "2026-09-15T11:39:39.631Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# Resolving problems with mods

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version (41.78.19).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Resolving_problems_with_mods.md) (Create account)

This is the guide with **solutions with mod problems**.

<a id="Solving_the_most_common_problems_with_mods"></a>

## Solving the most common problems with mods

In this article, we will tell you what to do if the mod is not installed, does not start, gives errors, breaks the game, etc.

<a id="Mod_not_installed"></a>

### Mod not installed

**If you installed the mod via Steam, try this:**

- Close the game
- Unsubscribe from the mod
- Subscribe him again
- Wait for the mod to install (A loading bar should go through at the bottom of the Steam window. Sometimes the Steam servers are loaded and you need to wait a bit)
- Start the game

**If you installed the mod manually:**

- Check that the mod is in the path`...\Zomboid\mods\`.
- Check that the mod is not in the archive
- Check that the mod folder contains the mod.info file and the media folder (If not, find the folder with these contents. This will be the true mod folder. This is what you need to put in the`...\Zomboid\mods\ ` folder

<a id="Mod_installed_but_won.27t_run"></a>

### Mod installed but won't run

- To check if the mod is running in the current game world - press the pause menu and in the lower right corner click on the "Mods" button. You will be shown a list of all running mods in the current game world.
- If the mod is red in mods menu (or when save is running - in mod list in lower right corner in pause menu), then the mod is missing a third-party mod that it depends on. It is usually listed on the right side of the mod's Steam page ("Required Items").
- If you enabled the mod in the mods menu in the main menu, but the mod did not enable in your old world - [Read how to enable mods in the old game world](Mods.md#Changing_mods_in_an_existing_world)

<a id="Mod_not_working"></a>

### Mod not working

Have you checked that the mod is enabled in your current game world, but the functionality is not working? Read again in detail the description of the mod on the mod page on Steam. If you did not find the answer to your question - write a comment or ask in #mod_support in the PZ discord

<a id="Mod_throws_errors"></a>

### Mod throws errors

A fairly common situation is when a mod provokes errors. Most often, they do not interfere with the game much, but if some errors critically affect your gameplay, then write on the mod page on Steam in the discussion about errors (or in the comments) in detail about the error (in what situations it appears and how it manifests itself). And wait for the mod developer to fix it.

<a id="Mod_breaks_the_game"></a>

### Mod breaks the game

If after installing and running the mod you have:

- The game stopped launch - unsubscribe from this mod and try to start the game again.
- Broke the save - try removing the mod from the save mods list and load the save again. If that doesn't help, then your save is permanently broken.

**Before adding mods to an old save, it is highly recommended to make a backup save!**

<a id="Mod_does_not_work_with_other_mods"></a>

### Mod does not work with other mods

Mods can sometimes conflict with each other. If the errors are not critical for you, you can continue to play. If critical, you will have to remove one of the mods. You can check the mod pages on Steam ahead of time to see if there is a list of incompatible mods.

<a id="Can.27t_connect_to_server_due_to_mod"></a>

### Can't connect to server due to mod

Try to close the game, unsubscribe from the mod, then subscribe again and try connecting to the server again.

<a id="Find_the_problematic_mod_1:_Look_for_logs"></a>

### Find the problematic mod 1: Look for logs

Look for logs (especially if errors - bottom right red boxes - show up) they are likely to tell where the problem is.

For solo games and clients/hosts in Multiplayer games, the default log file on Windows is %USERNAME%/Zomboid/console.txt

For server, the default log file on Windows is %USERNAME%/Zomboid/server-console.txt

<a id="Find_the_problematic_mod_2:_Mod_search_by_bifurcation"></a>

### Find the problematic mod 2: Mod search by bifurcation

You have too many mods (e.g., 100) and meet an unexpected behavior, then you need to:

- Get a systematic procedure to reproduce that behavior on a new save (use [debug mode](Debug_mode.md) to facilitate the reproduction).
- Ensure the behavior does not occur without mods on a new save.
- Then create a new game with half the mods (e.g., 50 first mods) and apply your procedure.
- If the problem occurs, then create a new game with half the mods (e.g., 25 first) and apply your procedure...
- If the problem does not occur, then create a new game with the other half (e.g., 50 last mods) and apply your procedure...
- Repeat until you circumvent the potential problematic mods to 1: you got it!

Now share what you've found (problem and reproduction procedure) on the mod owner's workshop.

Thank you! You've improved the modding world of Project Zomboid!

<a id="See_also"></a>

## See also

- [Mods](Mods.md)
- [Testing mods in multiplayer](Testing_mods_in_multiplayer.md)

Retrieved from "[https://pzwiki.net/w/index.php?title=Resolving_problems_with_mods&oldid=1392779](Resolving_problems_with_mods.md)"
