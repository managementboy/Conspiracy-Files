---
title: "ROOT-ModInfo"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/root_files/modinfo.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/root_files/modinfo.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="root-modinfo"></a>

<a id="scripts-root-modinfo"></a>

# ROOT-ModInfo

**Soft Override:** Unknown

**Is Root:** True

**No comma:** True

**Root patterns:** `mod\.info$`

The `mod.info` file, which contains all the information about a mod. It needs to be located alongside the media folder. See the wiki page [Mod structure](../../../pzwiki/foundations/Mod_structure.md) for more information.



```
📁 MyMod
  📁 <version>
    📁 media
    📄 mod.info
```



<a id="parameters"></a>

## Parameters

<a id="scripts-root-modinfo-author"></a>

### author

**Type:** string

Name of the author(s) of the mod. Multiple authors are often separated by commas but no convention exists.

<a id="scripts-root-modinfo-category"></a>

### category

**Type:** string

Category is used for filtering mods in the in-game ModManager. Known categories are “map”, “vehicle”, “features”, “modpack”. Using other terms will not generate a new filter category.

<a id="scripts-root-modinfo-description"></a>

### description

**Type:** translation

Description of your mod, which shows up in the mod manager. The description supports [ISRichTextPanel](../../../pzwiki/lua-api/ISRichTextPanel.md) tags. A translation can be provided in the [Mod.json translation file](../../../pzwiki/translations/Translation.md).

<a id="scripts-root-modinfo-icon"></a>

### icon

**Type:** string

Image which will be used in the mod manager to put next to the name of the mod in the list of available mods. This image will be small and while you can use a full image size, you do not need it. You can set your poster as the icon too to not ship two images if desired.

<a id="scripts-root-modinfo-id"></a>

### id

**Type:** string

The unique identifier of the mod, used in a mod list of the user or
servers to activate the mod. Make sure to use something unique which isn’t shared
between mods.

**Note:** This is not the same as the [Workshop ID](../../../pzwiki/foundations/Workshop_ID.md).

<a id="scripts-root-modinfo-incompatible"></a>

### incompatible

**Type:** string

Mods that cannot be enabled at the same time as this mod. When enabled, the other mods will be unselectable. This mod will also become unselectable if any of the other mods are enabled.

Example:



```
incompatible=theUnwantedMod,theOtherOne
```



<a id="scripts-root-modinfo-loadmodafter"></a>

### loadModAfter

**Type:** string

Loads the mod only after the set of mods listed.

Example:



```
loadModAfter=someMod,anotherMod
```



<a id="scripts-root-modinfo-loadmodbefore"></a>

### loadModBefore

**Type:** string

Loads the mod before the set of mods listed.

Example:



```
loadModBefore=someMod,anotherMod
```



<a id="scripts-root-modinfo-modversion"></a>

### modversion

**Type:** string

Version of the mod.

<a id="scripts-root-modinfo-name"></a>

### name

**Type:** translation

The displayed name for your mod in the game’s mod manager. A translation can be provided in the [Mod.json translation file](../../../pzwiki/translations/Translation.md).

<a id="scripts-root-modinfo-pack"></a>

### pack

**Type:** string

Name of pack files that need to be loaded by the game. Notably used for Texture pack and [Tile pack](../../../pzwiki/mapping/Mapping.md).

<a id="scripts-root-modinfo-poster"></a>

### poster

**Type:** string

Image which will show up in the mod manager as the mod image. Multiple posters can be used to show multiple images, but the first one will be used as the main poster in the mod manager. The rest will be in a list of images of the mod that users can click on to view.

Example:



```
poster=poster.png
poster=showcase.png
poster=flying_chickens.png
poster=credits.png
```



If you have multiple versions of your mod (e.g., 42.12 and 42.13) and don’t want to copy your images, you can leave them in the common folder and use the following (but use unique names for these images since it will use the pool of all mods and their images in the common folder):



```
poster=../common/mymodname_poster.png
poster=../common/mymodname_showcase.png
poster=../common/mymodname_flying_chickens.png
poster=../common/mymodname_credits.png
```



<a id="scripts-root-modinfo-require"></a>

### require

**Type:** string

Mods required to run this mod. Multiple mods can be specified separated by commas.

Example:



```
require=theNeededMod,theOtherOne
```



<a id="scripts-root-modinfo-tiledef"></a>

### tiledef

**Type:** string

Name of the tiledef with its ID that are added by the mod. You can find a community managed list of already used tiledef IDs in [Tiledefs used by mods](../../../pzwiki/mapping/Tiledefs_used_by_mods.md).

Example:



```
tiledef=Excavation 2112
```



If you upload your mod with a new tiledef ID, you can update the list to reduce the chance of incompatibility with other mods adding tile packs.

<a id="scripts-root-modinfo-url"></a>

### url

**Type:** string

Shows a URL link in the mod manager on the page of your mod for users to click on to open in their internet browser. The parameter appears as “Homepage” in the mod manager. For a list of valid links, see URL.

<a id="scripts-root-modinfo-versionmax"></a>

### versionMax

**Type:** string

The maximum version of the game the mod can be used on. This number needs to be in the format `build.major` at the very least, and not just `build` or it won’t work. Example `42.12`.

<a id="scripts-root-modinfo-versionmin"></a>

### versionMin

**Type:** string

The minimum version of the game the mod can be used on. This number needs to be in the format `build.major` at the very least, and not just `build` or it won’t work. Example `42.0`.
