---
title: "Multistagebuild (scripts)"
source: "https://pzwiki.net/wiki/Multistagebuild_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Multistagebuild_(scripts)&oldid=1370073"
source_last_edited: "Last modified\n\t\t         This page was last edited on 22 May 2026, at 03:17."
retrieved: "2026-09-15T11:42:13.424Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 20
source_tables: 0
---

# Multistagebuild (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version (41.78.19).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Multistagebuild_scripts.md) (Create account)

<a id="Introduction"></a>

## Introduction

The block describes an option to improve/create a multi stage building.

Example:



```text
multistagebuild UpgradeWoodenWall_2To3
{
    PreviousStage:WoodenWallLvl2,
    Name:WoodenWallLvl3,
    TimeNeeded:200,
    BonusHealth:100,
    BonusSkill:FALSE,
    SkillRequired:Woodwork=7,
    ItemsRequired:Base.Plank=1;Base.Nails=4,
    ItemsToKeep:Base.Hammer,
    Sprite:walls_exterior_wooden_01_24,
    NorthSprite:walls_exterior_wooden_01_25,
    CanBePlastered:true,
    WallType:wall,
    CraftingSound:Hammering,
    ID:Upgrade to Wooden Wall Lvl 32,
    XP:Woodwork=10,
}
```



<a id="Parameters"></a>

## Parameters

<a id="Name"></a>

### Name

A unique name for the recipe. Not used for display in the game (name of the block is used for display in the game)



```text
Name:WoodenWallLvl3,
```



<a id="TimeNeeded"></a>

### TimeNeeded

Time required to build.



```text
TimeNeeded:250,
```



<a id="BonusHealth"></a>

### BonusHealth

Parameter of additional durability for building. The parameter is also affected by the bonus durability setting in Sandbox.



```text
BonusHealth:500,
```



<a id="Sprite"></a>

### Sprite

The parameter sets the tile of west sprite.



```text
sprite:walls_exterior_wooden_01_40,
```



<a id="North_Sprite"></a>

### North Sprite

The parameter sets the tile of north sprite.



```text
NorthSprite:walls_exterior_wooden_01_41,
```



<a id="KnownRecipe"></a>

### KnownRecipe

A recipe that a player must know in order to complete a building.



```text
KnownRecipe: Make Metal Walls,
```



<a id="Thump_Sound"></a>

### Thump Sound

The sound that will be played when someone hits a building.



```text
ThumpSound:ZombieThumpMetal,
```



<a id="WallType"></a>

### WallType

Sets the wall type. Options: wall/doorframe/windowsframe.



```text
WallType:doorframe,
```



<a id="CraftingSound"></a>

### CraftingSound

The sound that will be played during construction.



```text
CraftingSound: Hammering,
```



<a id="CompletionSound"></a>

### CompletionSound

The sound that will be played when the building is completed.



```text
CompletionSound:BuildMetalStructureMedium,
```



<a id="ID"></a>

### ID

The unique recipe ID. Used to prevent building recipes from being duplicated.



```text
ID:Create Metal Window Lvl 1,
```



<a id="CanBePlastered"></a>

### CanBePlastered

The parameter indicates that the building can be plastered.



```text
CanBePlastered:true,
```



<a id="BonusSkill"></a>

### BonusSkill

If the parameter is true, then a bonus to the health of the building is given (depending on the carpentry skill).



```text
BonusSkill:false
```



<a id="Can_Barricade"></a>

### Can Barricade

Sets whether this building can be barricaded.



```text
CanBarricade:true,
```



<a id="XP"></a>

### XP

Specifies how much experience will be given to certain skills.



```text
XP:Woodwork=10;MetalWelding=15,
```



<a id="PreviousStage"></a>

### PreviousStage

Specifies the previous building stage to which the current building can be applied.



```text
PreviousStage:WoodenWallFrame;MetalWallFrame,
```



<a id="SkillRequired"></a>

### SkillRequired

Specifies the minimum skill level required to build.



```text
SkillRequired:MetalWelding=5,
```



<a id="ItemsRequired"></a>

### ItemsRequired

Specifies the resources that will be spent on the construction.



```text
ItemsRequired:Base.SheetMetal=3;Base.BlowTorch=7,
```



<a id="ItemsToKeep"></a>

### ItemsToKeep

Specifies the item that the player must have in their inventory.



```text
ItemsToKeep:Base.BlowTorch,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Multistagebuild_(scripts)&oldid=1370073](Multistagebuild_scripts.md)"
