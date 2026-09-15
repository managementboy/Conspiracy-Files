---
title: "ROOT-MapInfo"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/root_files/mapinfo.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/root_files/mapinfo.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="root-mapinfo"></a>

<a id="scripts-root-mapinfo"></a>

# ROOT-MapInfo

**Soft Override:** Unknown

**Is Root:** True

**No comma:** True

**Root patterns:** `media\/maps\/[\s\S]+\/map\.info$`

The `map.info` file is used to define the map’s information. It is used by the game to display the map in the map selection screen and to load the map into the world.

It needs to be located in:



```
📁 media
  📁 maps
    📁 <map folder>
      📄 map.info
```



<a id="parameters"></a>

## Parameters

<a id="scripts-root-mapinfo-demovideo"></a>

### demoVideo

**Type:** Unknown

[Video file](../../../pzwiki/foundations/File_formats.md) used to showcase the map when selecting it.

<a id="scripts-root-mapinfo-description"></a>

### description

**Type:** Unknown

Description of the map.

<a id="scripts-root-mapinfo-fixed2x"></a>

### fixed2x

**Type:** Unknown

Boolean which fixes rendering issues. Leave it as `true` if you are not sure.

<a id="scripts-root-mapinfo-lots"></a>

### lots

**Type:** Unknown

Refers to the world map the map will be loaded into. For a map which is inside the vanilla world map, use `lots=Muldraugh, KY`.

<a id="scripts-root-mapinfo-title"></a>

### title

**Type:** Unknown

Title of the map.

<a id="scripts-root-mapinfo-zooms"></a>

### zoomS

**Type:** Unknown

Zoom parameter used to define the position of the camera on the world map when chosing the map to spawn in.

<a id="scripts-root-mapinfo-zoomx"></a>

### zoomX

**Type:** Unknown

Position parameter used to define the position of the camera on the world map when chosing the map to spawn in.

<a id="scripts-root-mapinfo-zoomy"></a>

### zoomY

**Type:** Unknown

Position parameter used to define the position of the camera on the world map when chosing the map to spawn in.
