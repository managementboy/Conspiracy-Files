---
title: "spawnpoints.lua"
source: "https://pzwiki.net/wiki/Spawnpoints.lua"
source_revision: "https://pzwiki.net/w/index.php?title=Spawnpoints.lua&oldid=1316065"
source_last_edited: "Last modified\n\t\t         This page was last edited on 19 January 2026, at 20:17."
retrieved: "2026-09-15T11:39:41.485Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# spawnpoints.lua

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](spawnpoints.lua.md) (Create account)

`spawnpoints.lua` is a file located in the [map folder](Mapping.md#Folder_structure) of a map to define the various spawn points available for players. You notably define occupation specific spawn points. The file needs to contain a function`SpawnPoints` taking no arguments and returning a [dictionary](../lua-api/Lua_language.md#Lookup_tables) of occupations with an [array](../lua-api/Lua_language.md#Tables) of spawn points.

<a id="Syntax"></a>

## Syntax

The function uses the following typings:



```text
---@namespace YourMod

---@class SpawnPoint
---@field posX number -- Absolute world map X coordinate
---@field posY number -- Absolute world map Y coordinate
---@field posZ number -- Absolute world map Z coordinate
---@field worldX? number -- World map cell X coordinate (backwards compatibility with Build 41 spawnpoints)
---@field worldY? number -- World map cell Y coordinate (backwards compatibility with Build 41 spawnpoints)

---@return table<string, SpawnPoint[]>
function SpawnPoints()
    return {
        ...
    }
end
```



The tables defined as the class`SpawnPoint` needs to contain the following fields:

-`posX`: The world map X coordinate of the spawn point.
-`posY`: The world map Y coordinate of the spawn point.
-`posZ`: The world map Z coordinate of the spawn point. (`0` for ground level)

The class also supports an alternative syntax for backwards compatibility with Build 41 spawnpoints where the fields`worldX` and`worldY` can be provided as the map cell coordinates which makes`posX` and`posY` calculated relatively to that cell coordinates. The cell is considered here to be a 300x300 area so the fields are now:

-`worldX`: The world map cell X coordinate of the spawn point.
-`worldY`: The world map cell Y coordinate of the spawn point.
-`posX`: The X coordinate within the cell (0-299).
-`posY`: The Y coordinate within the cell (0-299).
-`posZ`: The world map Z coordinate of the spawn point. (`0` for ground level)

<a id="Relative_coordinates_calculation"></a>

## Relative coordinates calculation

To calculate the absolute world map coordinates from the cell coordinates, the game uses the following code: **Source:**`ProjectZomboid/zombie\iso/SpawnPoints.java`

**Retrieved**: Build 42.13.2



```text
Double worldX = Type.tryCastTo(point.rawget("worldX"), Double.class);
Double worldY = Type.tryCastTo(point.rawget("worldY"), Double.class);
Double posX = Type.tryCastTo(point.rawget("posX"), Double.class);
Double posY = Type.tryCastTo(point.rawget("posY"), Double.class);
Double posZ = Type.tryCastTo(point.rawget("posZ"), Double.class);
if (worldX == null || worldY == null || posX == null || posY == null) {
    return;
}

this.tempLocation.x = worldX.intValue() * 300 + posX.intValue();
this.tempLocation.y = worldY.intValue() * 300 + posY.intValue();
this.tempLocation.z = posZ == null ? 0 : posZ.intValue();
```



<a id="Example"></a>

## Example

![Article illustration](../assets/73c8ffc1fdd2bf2be94e.png)

This section contains source code from Project Zomboid

**Source:**`ProjectZomboid\media\scripts\media/maps/Muldraugh, KY/spawnpoints.lua`

**Retrieved**: Build 42.13.2



```text
function SpawnPoints()
return {
  chef = {
    { posX = 10606, posY = 9474, posZ = 0 },
    { posX = 10624, posY = 10533, posZ = 0 },
    { posX = 10629, posY = 9658, posZ = 0 },
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 }
  },
  constructionworker = {
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  doctor = {
    { posX = 10878, posY = 10028, posZ = 0 },
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 }
  },
  fireofficer = {
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  nurse = {
    { posX = 10878, posY = 10028, posZ = 0 },
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 }
  },
  parkranger = {
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  policeofficer = {
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  repairman = {
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  securityguard = {
    { posX = 10839, posY = 9537, posZ = 0 },
    { posX = 10863, posY = 10247, posZ = 0 },
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10131, posZ = 0 },
    { posX = 10942, posY = 9373, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
  unemployed = {
    { posX = 10916, posY = 10133, posZ = 0 },
    { posX = 10803, posY = 10073, posZ = 0 },
    { posX = 10919, posY = 10132, posZ = 0 },
    { posX = 10944, posY = 9374, posZ = 0 },
    { posX = 10951, posY = 9490, posZ = 0 },
    { posX = 10872, posY = 9489, posZ = 0 },
    { posX = 10976, posY = 9785, posZ = 0 },
    { posX = 10851, posY = 9846, posZ = 0 },
    { posX = 10854, posY = 9894, posZ = 0 },
    { posX = 10908, posY = 9994, posZ = 0 },
    { posX = 10884, posY = 10159, posZ = 0 },
    { posX = 10917, posY = 10093, posZ = 0 }
  },
}
end
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Spawnpoints.lua&oldid=1316065](spawnpoints.lua.md)"
