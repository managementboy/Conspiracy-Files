---
title: "map.info"
source: "https://pzwiki.net/wiki/Map.info"
source_revision: "https://pzwiki.net/w/index.php?title=Map.info&oldid=1390621"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:06."
retrieved: "2026-09-15T11:39:32.663Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 1
---

# map.info

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.16.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](map.info.md) (Create account)

This page explains the`map.info` file which is used to define the map's information. It is used by the game to display the map in the map selection screen and to load the map into the world.

<a id="Location"></a>

## Location

The file is located in the following directory:



```text
📁 media
    📁 maps
        📁 <map folder>
            📄 map.info
```



<a id="Parameters"></a>

## Parameters

| Parameter name | Description |
| --- | --- |
|`title` | Title of the map. |
|`description` | Description of the map. |
|`lots` | Refers to the world map the map will be loaded into. For a map which is inside the vanilla world map, use`lots=Muldraugh, KY`. |
|`fixed2x` | Boolean which fixes rendering issues. Leave it as`true` if you are not sure. Need more informations about the exact effect of this parameter. |
|`zoomX` | Position parameter used to define the position of the camera on the world map when chosing the map to spawn in. |
|`zoomY` | Position parameter used to define the position of the camera on the world map when chosing the map to spawn in. |
|`zoomS` | Zoom parameter used to define the position of the camera on the world map when chosing the map to spawn in. |
|`demoVideo` | [Video file](File_formats.md#Video_format) used to showcase the map when selecting it. |

`title` and`description` can be directly defined in a [translation](../translations/Translation.md) file without the need to put anything special in these parameters.

<a id="See_also"></a>

## See also

- [Game files](Game_files.md)
- [mod.info](mod.info.md)
- [workshop.txt](workshop.txt.md)

Retrieved from "[https://pzwiki.net/w/index.php?title=Map.info&oldid=1390621](map.info.md)"
