---
title: "Tile properties"
source: "https://pzwiki.net/wiki/Tile_properties"
source_revision: "https://pzwiki.net/w/index.php?title=Tile_properties&oldid=1465161"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 10:01."
retrieved: "2026-09-15T11:40:23.923Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# Tile properties

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Tile_properties.md) (Create account)

**Tile properties** are used to provide different characteristics and information about the tiles. It is a necessary process to go through when [creating new tiles](Adding_new_tiles.md) which is often resolved by copying the tile properties of existing tiles that are similar to the new tile you are creating. But if in need of documentation on what each property does, you can refer to the PZ API Doc.

Not all game interactions come from tile properties. For example, if a car is driving on a floor tile from blends_street_*, it's considered to be on a road, otherwise the car is offroad. Reading the java source files is the only way to find other such interactions.

<a id="Directions"></a>

## Directions

Directions for the tiles follow the classic coordinate system of the Project Zomboid isometric view, with north being the top right and west being the top left.

![Article illustration](../assets/2f800ccd58a838529198.png)

<a id="Surface_and_ItemHeight"></a>

## Surface and ItemHeight

Below are images demonstration the parameters Surface, ItemHeight and IsSurfaceOffset. The "Zero" here is not a parameter but simply added on the image to better show where the parameters start counting from.

![Article illustration](../assets/0526e45a6b3b861e8e47.png)

![Article illustration](../assets/934cf934e30f84c1a738.png)

Retrieved from "[https://pzwiki.net/w/index.php?title=Tile_properties&oldid=1465161](Tile_properties.md)"
