---
title: "timedAction"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/timedaction.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/timedaction.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="timedaction"></a>

<a id="scripts-timedaction"></a>

# timedAction

**Soft Override:** Unknown

The timedAction script block is used to define an action which can be used in [craftRecipes](craftrecipe.md). You can specify the animation played, props in hands during the action, the sound played. Also define its impact on the player character, including effects on calories burned and body heat generation.

Below are a few examples of `timedAction` blocks from the vanilla game:



```cpp
timedAction UseLathe
{
    metabolics      = Default,
    actionAnim      = UseLathe,
}
```





```cpp
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





```cpp
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



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-timedaction-actionanim"></a>

### actionAnim

**Type:** string

The actionAnim parameter is used to define the animation played during a timed action. It links to a PerformingAction define in the action [AnimSets](../../pzwiki/assets-and-animation/AnimSet.md) of the player.

<a id="scripts-timedaction-animvarkey"></a>

### animVarKey

**Type:** Unknown

The animVarKey and animVarVal parameters are used together to link to a specific AnimNode Conditions. `animVarKey` will correspond to the `m_Name` field and `animVarVal` to the `m_Value` field.

This allows for easy swapping between variants of actionAnim. For example, for the AnimNode:



```cpp
<?xml version="1.0" encoding="utf-8"?>
<animNode x_extends="Loot.xml">
  <m_Name>LootHigh</m_Name>
  <m_AnimName>Bob_IdleLooting_High</m_AnimName>
  <m_Conditions />
  <m_Conditions />
  <m_Conditions>
    <m_Name>LootPosition</m_Name>
    <m_Type>STRING</m_Type>
    <m_StringValue>High</m_StringValue>
  </m_Conditions>
</animNode>
```



You can define those parameters in the timedAction as follows:



```cpp
actionAnim      = Loot,
animVarKey      = LootPosition,
animVarVal      = Low,
```



<a id="scripts-timedaction-animvarval"></a>

### animVarVal

**Type:** Unknown

See parameter [animVarKey](timedaction.md#scripts-timedaction-animvarkey).

<a id="scripts-timedaction-completionsound"></a>

### completionSound

**Type:** block (block: [sound](sound.md#scripts-sound))

Defines the sound played at the end of the action.

<a id="scripts-timedaction-metabolics"></a>

### metabolics

**Type:** Unknown

The metabolics parameter is used to define the impact of the action on the player character’s metabolics, such as the calories burn rate or body heat generation. It uses predefined enumeration values to specify the multiplier on the metabolism. You can find a list of metabolic types and their associated values in the [Metabolics](../java/metabolics.md) documentation.

<a id="scripts-timedaction-musclestrainfactor"></a>

### muscleStrainFactor

**Type:** Unknown

Muscle strain is an effect which applies to the character limbs, simulating the fatigue and strain of performing certain actions. A timedAction script can be set to apply muscle strain to specific limbs and based on the level of the character in a specific skill.

muscleStrainFactor serves as a parameter of how much muscle strain will be gained.

muscleStrainParts will indicate the limbs affected by the muscle strain, which needs to be an array of BodyPartType.

If muscleStrainSkill is provided, the skill will be used to reduce the muscle strain when the player gets better at something.



```
strain = deltaTime * muscleStrainFactor * (1 - skillLevel * 0.5)
```



<a id="scripts-timedaction-musclestrainparts"></a>

### muscleStrainParts

**Type:** array (array of string, separator: ‘;’)

See parameter [muscleStrainFactor](timedaction.md#scripts-timedaction-musclestrainfactor).

<a id="scripts-timedaction-musclestrainskill"></a>

### muscleStrainSkill

**Type:** Unknown

See parameter [muscleStrainFactor](timedaction.md#scripts-timedaction-musclestrainfactor).

<a id="scripts-timedaction-prop1"></a>

### prop1

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-timedaction-prop2"></a>

### prop2

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-timedaction-sound"></a>

### sound

**Type:** block (block: [sound](sound.md#scripts-sound))

Defines the sound played during the action.

<a id="scripts-timedaction-soundtime"></a>

### soundTime

**Type:** string

**Is useless:** True

**Default:** `action_start`

This parameter is used in the Lua to indicate when the sound should be played during the timed action. This is notably used to play a sound at the end or the start of the action during crafting.

By itself, this doesn’t do anything and requires implementation in Lua). For example inside `ISHandcraftAction`.

For a full list of the accepted events, see [this](../java/action_sound_time.md).
