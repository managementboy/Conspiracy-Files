---
title: "component CraftRecipe"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/component/component-craftrecipe.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/component/component-craftrecipe.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="component-craftrecipe"></a>

<a id="scripts-component-craftrecipe"></a>

# component CraftRecipe

**Soft Override:** Unknown

**Is Variant of:** [component](../component.md#scripts-component)

No description provided.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [entity](../entity.md#scripts-entity)

This block requires these following children to be valid:

- [inputs](../inputs.md#scripts-inputs)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-component-craftrecipe-category"></a>

### category

**Type:** translation

**Default:** `Miscellaneous`

The category under which the recipe will be listed in the crafting menu. Helps to organize and identify recipes in crafting menu. Your category should have a key with the suffix `IGUI_CraftingCategories_` in the [IG_UI.json](../../translations/translation_files.md#ig-ui) translation file to be properly displayed in the crafting menu. For example:



```java
category = MyCategory,
```



And in the translation file:



```json
{
  "IGUI_CraftingCategories_MyCategory": "My Category"
}
```



<a id="scripts-component-craftrecipe-needtobelearn"></a>

### NeedToBeLearn

**Type:** Unknown

Whether the recipe needs to be learned before it can be crafted.

<a id="scripts-component-craftrecipe-onaddtomenu"></a>

### OnAddToMenu

**Type:** Unknown

No description provided.

<a id="scripts-component-craftrecipe-oncreate"></a>

### OnCreate

**Type:** callback

Various callback functions can be added to a recipe to trigger at specific moments during the crafting process:

- OnCreate is called when the crafting recipe is finished.
- OnTest is called to verify if the item can be used in the recipe.
- OnFailed is called when the crafting recipe fails or is canceled.
- OnUpdate is called every tick while the recipe is being crafted.

The callback needs to be a Lua function defined as a global function#Local_and_global), which can also be stored in a global table. The vanilla game OnCreate’s are stored in the [Java](../../../pzwiki/java/Java.md).

For example, for OnCreate you should have the following structure:



```lua
---@param craftRecipeData CraftRecipeData
---@param character IsoGameCharacter
function MyOnCreateFunction(craftRecipeData, character)
    -- your custom code here
end
```



The `craftRecipeData` is a java object that contains the data of the crafting recipe. The `character` is the player character who is crafting the recipe.

For OnTest you should have the following structure:



```lua
---@param item InventoryItem
---@param character IsoGameCharacter
---@return boolean logicTestResult
function MyOnTestFunction(item, character)
    -- your custom code here
    return logicTestResult  -- based on your logic test above
end
```



<a id="scripts-component-craftrecipe-skillrequired"></a>

### SkillRequired

**Type:** object (object: string->>integer, kv: ‘:’, pairs: ‘;’)

Specifies the skill level required to perform this crafting action. It should be formatted this way:



```java
/* a single skill */
skillRequired = <skill name>:<level>,

/* multiple skills */
skillRequired = <skill1 name>:<level>;<skill2 name>:<level>,
```



For the list of available skills, see the [wiki](../../../pzwiki/scripts/craftRecipe.md).

For example:



```java
skillRequired = Blacksmith:3;Tailoring:2,
```



<a id="scripts-component-craftrecipe-tags"></a>

### tags

**Type:** array (array of string, separator: ‘;’)

**Required:** True

Specifies specific conditions which need to be respected to craft this item. At least one crafting bench tag is necessary for the craft to be recognized, such as `AnySurfaceCraft`. The syntax is as follows:



```java
/* single tag */
Tags = tag1,

/* multiple tags */
Tags = tag1;tag2;...,
```



For example:



```java
Tags = InHandCraft;CanAlwaysBeResearched,
```



A crafting bench tag can be created by adding a [component CraftBench](component-craftbench.md) to an [entity](../entity.md) script, which can then be used in this tags parameter.

You can find a list of tags available on the [wiki](../../../pzwiki/scripts/craftRecipe.md).

<a id="scripts-component-craftrecipe-time"></a>

### time

**Type:** integer

**Default:** `50`

The time it takes to craft the item, not using a specific unit of time so refer to the vanilla recipes to get an idea of what value to use.

<a id="scripts-component-craftrecipe-timedaction"></a>

### timedAction

**Type:** block (block: [timedAction](../timedaction.md#scripts-timedaction))

Refers to a timed action script block to trigger during the crafting process, for animations and/or sounds but also the calories burned and body heat generation.

<a id="scripts-component-craftrecipe-tooltip"></a>

### Tooltip

**Type:** translation

Description of the crafting which is shown in the crafting menu. The value needs be a key in the [Tooltip.json](../../translations/translation_files.md#tooltip) translation file. For example:



```java
Tooltip = MyTooltipKey,
```



And in the translation file:



```json
{
  "MyTooltipKey": "This is my tooltip description."
}
```



<a id="scripts-component-craftrecipe-xpaward"></a>

### xpAward

**Type:** Unknown

Specifies the experience points awarded for crafting this item. The parameter should be formatted this way:



```java
/* a single skill */
xpAward = <skill name>:<xp amount>,

/* multiple skills */
xpAward = <skill1 name>:<xp amount>;<skill2 name>:<xp amount>,format
```



For the list of available skills, see the [wiki](../../../pzwiki/scripts/craftRecipe.md).

For example:



```java
xpAward = Blacksmith:10;Tailoring:5,
```
