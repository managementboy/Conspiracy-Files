---
title: "mod.info"
source: "https://pzwiki.net/wiki/Mod.info"
source_revision: "https://pzwiki.net/w/index.php?title=Mod.info&oldid=1363935"
source_last_edited: "Last modified\n\t\t         This page was last edited on 9 May 2026, at 00:45."
retrieved: "2026-09-15T11:39:38.599Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# mod.info

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.17.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](mod.info.md) (Create account)

This page explains the`mod.info` file which is used to get mods to be recognized by the game and its properties. The file needs to be placed in the [mod folder](Game_files.md) and is a simple text file with the`.info` file extension. It is the root of your mod and you can edit it with any text editor.

This file, while working in both the [common and versioning folders](Mod_structure.md#Common_and_versioning_folders), is best kept only in the versioning folders for ease of use and organization between different game versions, whenever you add new requirements. Technically, all of the parameters are optional, but excluding some of these might just break your mod, make it not available to run or other problems. The necessary parameters should at least be the`ID` and`name`.

Make sure to name the file in full lowercase for Linux and macOS compatibility.

Make sure that you don't have a hidden`.txt` extension on your file. To verify that it isn't the case, you can find a setting to show file extensions in your file explorer.

<a id="Parameters"></a>

## Parameters

You can find a full list of parameters in the ScriptsDocs.

<a id="Example"></a>

## Example



```text
name=My amazing mod !
id=myAmazingModID
author=an amazing modder!
description=Hello World !
poster=preview.png
icon=icon.png
require=otherModID,anotherModID
```



<a id="See_also"></a>

## See also

- [Game files](Game_files.md)
- [Mod structure](Mod_structure.md)
- [workshop.txt](workshop.txt.md)

Retrieved from "[https://pzwiki.net/w/index.php?title=Mod.info&oldid=1363935](mod.info.md)"
