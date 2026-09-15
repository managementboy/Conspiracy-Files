---
title: "Load order"
source: "https://pzwiki.net/wiki/Load_order"
source_revision: "https://pzwiki.net/w/index.php?title=Load_order&oldid=1458101"
source_last_edited: "Last modified\n\t\t         This page was last edited on 18 August 2026, at 13:46."
retrieved: "2026-09-15T11:39:40.440Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# Load order

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.3).

Help by adding any missing content. [Edit](Load_order.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

**Load order** in [Modding](Modding.md) is often presented as important when it really isn't as issues very rarely arise from wrong load orders. The basic of it is that load order doesn't matter if no mods override each others or the same vanilla files.

Making sure mods don't override the same thing can be complex when you don't know much about modding, for this you can simply try to compare mods you activate and think if they replace features of the game, or if two mods do the same thing or impact the same features. The best way would be to check the [mod files](Mod_structure.md#Online_workshop_folder) but this can prove impossible when you have to compare with hundreds if not thousands of other mods. If you think a mod may clash with your mod, you'd be interested to check their files however.

When it comes to

<a id="Mapping"></a>

## Mapping

[Maps](../mapping/Mapping.md) are the most at risk of load order but as long as they don't share [cells](../mapping/Mapping.md#Cells), there won't be any particular need for load order. Tiles depend on if another mod replaces another tile mod tiles. But even then load order cannot fix conflicts between maps and one of the two will have broken elements eitherway, you can't do anything about it but move those maps elsewhere (which isn't a solution either).

Tiles can have their tiledef ID clash. but to reduce this risk you can chose an ID that is not yet documented in [Tiledefs used by mods](../mapping/Tiledefs_used_by_mods.md), which lists a large amount of tiledef IDs already used.

When it comes to [cells](../mapping/Mapping.md#Cells) being shared between map mods, there isn't a data base currently of already shared map cells. Tools like Map Mod Manager and PZ Map Analyser allows you to verify conflicts between map mods.

<a id="Lua_and_Scripts"></a>

## Lua and Scripts

[Lua](../lua-api/Lua_API.md) and [Scripts](../scripts/Scripts.md) mods should almost never depend on load order as it is extremely easy to not have them clash with others. When they clash with each others it is either one of the following cases:

- The modder didn't put his files at unique relative paths (see [Lua (API)](../lua-api/Lua_API.md#Folder_structure) and [Scripts](../scripts/Scripts.md#Folder_structure))
- They are overriding files they don't have to (see [Scripts soft overrides](../scripts/Scripts.md#Soft_overrides) and [Lua decorations](../lua-api/Lua_language.md#Decoration))
- They had no choice but overwrite a file

In the majority of cases you will be in scenario 1 or 2 and it is very easy to prevent these situations.

<a id="File_overwrites"></a>

### File overwrites

File overwrites can often be accidental where you don't realize your files will clash with other mods. Files in the`media/lua` and`media/scripts` folder will overwrite files with the same relative path to`media`. Mods which are loaded last (below) another one will overwrite that other mod files.

For example:



```text
# first mod
📁 media
    📁 lua
        📁 shared
            📄 main.lua

# second mod
📁 media
    📁 lua
        📁 shared
            📄 main.lua     # this will overwrite the first mod files
```



Files being in the [common or versioning folders](Mod_structure.md#Common_and_versioning_folders) don't matter, only the currently loaded files of the mods can clash with each others.

To prevent this, the solution is very easy: simply make a subfolder named after your mod that will contain all your mod files.



```text
# first mod
📁 media
    📁 lua
        📁 client
        📁 server
        📁 shared
            📁 MyFirstMod
                📄 main.lua

# second mod
📁 media
    📁 lua
        📁 client
        📁 server
        📁 shared
            📁 MySecondMod
                📄 main.lua     # this will overwrite the first mod files
```



For [Lua](../lua-api/Lua_API.md) mods, the client, server and shared folders (see [Lua (API)](../lua-api/Lua_API.md#Folder_structure)) will not clash between each others. Simply remember it is the relative path **to the media folder** that matters for file clashes for Lua and Scripts.

For [Scripts](../scripts/Scripts.md) mods, overwriting the vanilla files is almost completely not a solution but they are automatically generated and items are almost all in the same files. The good news is that you should not have to do that thanks to methods to modify existing scripts such as [soft overrides](../scripts/Scripts.md#Soft_overrides) or in some cases documented methods to modify scripts from the Lua (see [item (scripts)](../scripts/item_scripts.md#Modifying_existing_item_definitions) and [craftRecipe](../scripts/craftRecipe.md#Modifying_existing_recipes)).

<a id="Textures.2C_animations_and_models"></a>

## Textures, animations and models

This article may need more content.

This section needs more information how texture, animation and model files clash with each others between mods.

Editors are encouraged to add new material to the page while expanding upon current topics. [Edit](Load_order.md) (Create account)

AnimSets files will follow the same overwriting rules as Lua and Scripts [file overwrites](Load_order.md#File_overwrites).

<a id="See_also"></a>

## See also

- [Mod structure](Mod_structure.md)

Retrieved from "[https://pzwiki.net/w/index.php?title=Load_order&oldid=1458101](Load_order.md)"
