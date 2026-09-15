---
title: "timedAction (scripts)"
source: "https://pzwiki.net/wiki/TimedAction_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=TimedAction_(scripts)&oldid=1440703"
source_last_edited: "Last modified\n\t\t         This page was last edited on 21 June 2026, at 21:18."
retrieved: "2026-09-15T11:42:12.997Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# timedAction (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](timedAction_scripts.md) (Create account)

timedAction

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module

[ID](Scripts.md#ID)

Any

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about the`timedAction` parameter used in crafting recipes. For the`timedAction` parameter of [craftRecipe](craftRecipe.md), see [timedAction (craftRecipe)](timedAction_craftRecipe.md). For the Lua timed actions used in the game, see [Timed Action (Lua)](../lua-api/Timed_Action_Lua.md).

The timedAction script block is used to define an action which can be used in [craftRecipes](craftRecipe.md). You can specify the animation played, props in hands during the action, the sound played. Also define its impact on the player character, including effects on calories burned and body heat generation.

<a id="timedAction_parameters"></a>

## timedAction parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Example"></a>

## Example

Below are a few examples of`timedAction` blocks from the vanilla game:



```text
timedAction UseLathe
{
    metabolics      = Default,
    actionAnim      = UseLathe,
}
```





```text
timedAction BuildCairn
{
    metabolics      = HeavyWork,
    actionAnim      = Loot,
    animVarKey      = LootPosition,
    animVarVal      = Low,
    sound           = BuildingGeneric,
    completionSound = BuildFenceCairn,
    muscleStrainFactor = 0.0025,
    muscleStrainSkill = Strength,
    muscleStrainParts = Neck,
}
```





```text
timedAction BuildBarbedWireFence
{
    metabolics      = HeavyWork,
    actionAnim      = Loot,
    animVarKey      = LootPosition,
    animVarVal      = Low,
    sound           = BuildingGeneric,
    completionSound = BuildMetalStructureSmallWiredFence,
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=TimedAction_(scripts)&oldid=1440703](timedAction_scripts.md)"
