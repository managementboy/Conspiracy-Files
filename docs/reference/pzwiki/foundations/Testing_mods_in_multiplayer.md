---
title: "Testing mods in multiplayer"
source: "https://pzwiki.net/wiki/Testing_mods_in_multiplayer"
source_revision: "https://pzwiki.net/w/index.php?title=Testing_mods_in_multiplayer&oldid=1394139"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 04:35."
retrieved: "2026-09-15T11:39:40.045Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# Testing mods in multiplayer

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version (41.78.19).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Testing_mods_in_multiplayer.md) (Create account)

This article may be in need of improvement.

It needs to be rewritten. Consider consulting the Discord or talk page for suggestions.

Editors are encouraged to add any missing information to the article, while verifying that the article's current content is correct. [Edit](Testing_mods_in_multiplayer.md) (Create account)

This guide is about **testing mods in multiplayer**.

<a id="Testing_mods_on_multiplayer_with_Windows"></a>

## Testing mods on multiplayer with Windows

1. The mod you want to test must be in the Mods folder of your Zomboid directory (since we'll be testing with the`-nosteam` [startup parameter](Startup_parameters.md), the workshop folder will be ignored).

- My Zomboid folder is located at C:\Users[username]\Zomboid\mods
- The folder you copy must be the one that immediately contains the media folder. The game apparently doesn't dig through nested folders to find eligible mods.

2. Open the command prompt (win+R and type "cmd.exe" or any of the other dozens of ways to get the command prompt open)

3. Navigate to where the zomboid EXEs are. For me it's:

- cd "C:\Program Files (x86)\Steam\SteamApps\common\ProjectZomboid"

4. Execute one of the exes (32 or 64) to be the server host:

- start ProjectZomboid64.exe -nosteam -debug

5. From the main menu, host a server. Click "Manage settings" in the host game menu. Click "Edit Selected Settings" and click "Mods" from the INI list. Add any mods you need to test from the "Add an installed mod to the list" drop down. Save this configuration change. Back up through the configuration settings and click "Start" to launch the server. Create your admin character as necessary.

6. Execute a non -debug instance for your non-admin player:

- start ProjectZomboid64.exe -nosteam

7. From the main menu click "Join" to join a server. Fill in the account name and account password fields and save this server. IP and port settings should be correct for local play.

8. Click "Join Server" on your newly favorited 127.0.0.1 server. Create your character as necessary.

9. If you need to see your second character you can use the following teleport command:

- press tab, t, or enter to open the multiplayer chat window
- type /teleport "playerTwoName" to jump the admin to player two.
- if you would prefer to bring them to you, use /teleport "PlayerTwoName" "AdminName"

10. Test your mod to your heart's content!

<a id="See_also"></a>

## See also

- [Mods](Mods.md)
- [Resolving problems with mods](Resolving_problems_with_mods.md)

<a id="External_links"></a>

## External links

- How to launch 2 instances of Zomboid for testing MP mods - Steam guide to using 2 instances of Zomboid to test MP mods.

Retrieved from "[https://pzwiki.net/w/index.php?title=Testing_mods_in_multiplayer&oldid=1394139](Testing_mods_in_multiplayer.md)"
