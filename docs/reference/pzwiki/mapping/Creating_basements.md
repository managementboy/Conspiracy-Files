---
title: "Creating basements"
source: "https://pzwiki.net/wiki/Creating_basements"
source_revision: "https://pzwiki.net/w/index.php?title=Creating_basements&oldid=1462571"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 07:57."
retrieved: "2026-09-15T11:42:14.941Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# Creating basements

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.12.3).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Creating_basements.md) (Create account)

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about creating basements in a custom map using the [mapping](Mapping.md) tools. For explanation about basements in the game, see Basement.

This guide will cover how to add custom basements to a custom [map](Mapping.md) using the [Mapping tools (Alree)](Mapping_tools_Alree.md). It will teach how to create a simple 1 level basement, and how to import it into the editor.

There are two methods to creating basements:

- Creating the basement as a standalone`.tbx` file.
- Creating the basement directly into your`building.tbx`

This guide will focus on the first method.

<a id="Creating_a_basement"></a>

## Creating a basement

To begin, inside [TileZed](Mapping_tools_Alree.md) navigate into the Building Editor by selecting the Tools tab at the top, then Building Editor.

Once inside the building editor, create a New Building. Before drawing a basement be sure to check the list of rooms and their definitions, so when drawing the basement it has the correct room definitions.

In iso mode, using the Draw Room tool, draw out the basement on floor 1/1 making sure it is completely enclosed. To create a basement with more than 1 level, simply add more floors but note that topmost floor will be the first floor into the basement.

Using the Place Stairs tool, place a staircase anywehere for player to enter the basement. Then save the tbx file.

<a id="Preparing_the_basement_placement"></a>

### Preparing the basement placement

Open your map project in TilEd, and choose a location on your map where you would like the basement entrance to be.

Selecting the BMP Eraser tool in the top right, delete 3 ground floor tiles by left clicking. These 3 deleted tiles will be directly above the staircase to allow entry into the basement.

<a id="Placing_the_basement"></a>

### Placing the basement

Open your project in [WorldEd](Mapping_tools_Alree.md), then drag your basement`.tbx` file into your map.

Navigate to the “lots” tab on the left side of the program, where a list of “Levels” can be found. Drag your basement`.tbx` file name from Level 0 onto Level -1. You can also select Level -1 before dragging the basement`.tbx` into your map to place the Basement directly on Floor -1. The basement should appear underground.

Finally, left click and drag your basement so the 3 tiles removed earlier using BMP eraser are directly above the staircase.

<a id="Connecting_to_a_building"></a>

## Connecting to a building

In the building editor, open the`.tbx` file for a house/building and navigate to the “Edit rooms” tab, then set the “floor” tile in your room to None, Click OK.

Navigate to Tile mode on the left side of the program below Iso mode, then in the bottom right tab named "Tilesets" type “flooring”. Selecting a floor tile of your choice and making sure the “floor” layer is selected on the layers tab, use the Draw Tile tool to place the flooring down everywhere except for 3 tiles directly above your staircase. Save the building TBX.

Place the house/building tbx into WorldEd, and line up the 3 missing floor tiles.

Retrieved from "[https://pzwiki.net/w/index.php?title=Creating_basements&oldid=1462571](Creating_basements.md)"
