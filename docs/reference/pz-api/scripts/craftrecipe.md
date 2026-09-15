---
title: "craftRecipe"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/craftrecipe.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/craftrecipe.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="craftrecipe"></a>

<a id="scripts-craftrecipe"></a>

# craftRecipe

**Soft Override:** True

The ‘craftRecipe’ script block is used to define a crafting recipe, which allows players to craft items or tiles in the game based on the parent script block. For example, a craftRecipe defined inside a [module](module.md) will be a recipe to craft an item usually, while when defined inside an [entity](entity.md) it will be the building recipe for that entity.

A craftRecipe will usually require an [inputs](inputs.md) and [outputs](outputs.md) block. Other parameters are used to define properties of this recipe, such as the time it takes to craft or the XP awarded for crafting it.

For example:



```java
module yourModule /* or Base */
{
    craftRecipe yourRecipeID
    {
        ...
    }
}
```



Some methods to modify existing recipes are documented on the [wiki](../../pzwiki/scripts/craftRecipe.md).

To define a translation for this recipe, you need to create an entry in the translation file [Recipes.json](../translations/translation_files.md#recipes). The translation entry should be formatted like this:



```json
{
  "yourRecipeID": "Your recipe"
}
```



Notice how you shouldn’t use the [module](module.md) in the translation file key and only the craftRecipe ID.

Here’s an example of a craftRecipe with some parameters defined:



```java
craftRecipe SawLogs
{
    timedAction = SawLogs,
    Time = 230,
    Tags = InHandCraft;CanBeDoneFromFloor,
    category = Carpentry,
    xpAward = Woodwork:5,
    inputs
    {
        item 1 [Base.Log] flags[Prop2],
        item 1 tags[Saw] mode:keep flags[MayDegradeLight;Prop1],
    }
    outputs
    {
        item 3 Base.Plank,
    }
}
```



Or:



```java
craftRecipe CarveWhistle
{
    time = 200,
    tags = AnySurfaceCraft;Survivalist,
    category = Carving,
    xpAward = Carving:60,
    SkillRequired = Carving:6,
    needTobeLearn = true,
    AutoLearnAny = Carving:8,
    timedAction = SharpenStake,
    inputs
    {
        item 1 tags[DrillWood;DrillMetal;DrillWoodPoor] mode:keep flags[MayDegradeLight],
        item 1 tags[SharpKnife] mode:keep flags[MayDegradeLight],
        item 1 [Base.SmallAnimalBone] flags[Prop2;AllowDestroyedItem],
    }
    outputs
    {
        item 1 Base.Whistle_Bone,
    }
}
```



And a more advanced one:



```java
craftRecipe RefillHurricaneLantern
{
    timedAction = Making,
    Time = 50,
    OnCreate = Recipe.OnCreate.RefillHurricaneLantern,
    /* OnTest = Recipe.OnTest.RefillHurricaneLantern, */
    Tags = InHandCraft;CanBeDoneInDark,
    category = Miscellaneous, /*category = Survival,*/
    inputs
    {
        item 1 [Base.Lantern_Hurricane;Base.Lantern_Hurricane_Copper;Base.Lantern_Hurricane_Forged;Base.Lantern_Hurricane_Gold;Base.Lantern_Hurricane_Silver] mode:destroy flags[NotFull;AllowFavorite;InheritFavorite;ItemCount] mappers[LampMapper],
        item 1 [*],
        -fluid 1.0 [Petrol],
    }
    outputs
    {
        item 1 mapper:LampMapper,
    }
    itemMapper LampMapper
    {
        Base.Lantern_Hurricane = Base.Lantern_Hurricane,
        Base.Lantern_Hurricane_Copper = Base.Lantern_Hurricane_Copper,
        Base.Lantern_Hurricane_Forged = Base.Lantern_Hurricane_Forged,
        Base.Lantern_Hurricane_Gold = Base.Lantern_Hurricane_Gold,
        Base.Lantern_Hurricane_Silver = Base.Lantern_Hurricane_Silver,

        default = Base.Lantern_Hurricane,
    }
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

This block requires these following children to be valid:

- [inputs](inputs.md#scripts-inputs)

This block can have the following child blocks:

- [itemMapper](itemmapper.md#scripts-itemmapper)
- [outputs](outputs.md#scripts-outputs)
- [overlayMapper](overlaymapper.md#scripts-overlaymapper)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** True

<a id="parameters"></a>

## Parameters

<a id="scripts-craftrecipe-allowbatchcraft"></a>

### AllowBatchCraft

**Type:** boolean

**Default:** `True`

The AllowBatchCraft parameter is used to allow the recipe to be crafted in batches. This will make a slider appear on the crafting to craft multiple ones at once. Needs to be a boolean and default is `true`, set to `false` to disable batch craft.

<a id="scripts-craftrecipe-animation"></a>

### Animation

**Type:** string

**Is useless:** True

No description provided.

<a id="scripts-craftrecipe-autolearnall"></a>

### AutoLearnAll

**Type:** object (object: string->>integer, kv: ‘:’, pairs: ‘;’)

The AutoLearnAll parameter specifies that all the provided skills and their associated level need to be reached to automatically learn the recipe. On the other hand, AutoLearnAny specifies that at least one of the skills and its associated level need to be reached to automatically learn the recipe. Both can also be used together.

Both parameters should be formatted this way:



```java
/* a single skill */
autoLearnAll = <skill name>:<level amount>,

/* multiple skills */
autoLearnAll = <skill1 name>:<level amount>;<skill2 name>:<level amount>,
```



For the list of available skills, see the [wiki](../../pzwiki/scripts/craftRecipe.md).

For example:



```java
autoLearnAll = Carving:3;Maintenance:2,
```



<a id="scripts-craftrecipe-autolearnany"></a>

### AutoLearnAny

**Type:** object (object: string->>integer, kv: ‘:’, pairs: ‘;’)

See parameter [AutoLearnAll](craftrecipe.md#scripts-craftrecipe-autolearnall).

<a id="scripts-craftrecipe-canwalk"></a>

### CanWalk

**Type:** boolean

**Default:** `False`

Whether the player can walk while crafting this recipe.

<a id="scripts-craftrecipe-category"></a>

### category

**Type:** translation

**Default:** `Miscellaneous`

The category under which the recipe will be listed in the crafting menu. Helps to organize and identify recipes in crafting menu. Your category should have a key with the suffix `IGUI_CraftingCategories_` in the [IG_UI.json](../translations/translation_files.md#ig-ui) translation file to be properly displayed in the crafting menu. For example:



```java
category = MyCategory,
```



And in the translation file:



```json
{
  "IGUI_CraftingCategories_MyCategory": "My Category"
}
```



<a id="scripts-craftrecipe-icon"></a>

### Icon

**Type:** string

Specifies the icon associated with this crafting recipe. The icon needs to be located in `media/textures`, for example `media/textures/myIcon.png` will be refered to as `Icon = myIcon,`.

This seems to be used only once in the vanilla recipes with the entry `Icon = Item_WaterDrop,`, as the icon usually defaults to the items that will be crafted.

<a id="scripts-craftrecipe-metarecipe"></a>

### MetaRecipe

**Type:** Unknown

A meta recipe is used to link two recipes so that if the meta recipe is known then this recipe will be known. The opposite however is not true, if the main recipe is known the meta recipe is not automatically known.

In this example below, the recipe `MyRecipe1` will be known if the recipe `MyRecipe2` is known. However if the recipe `MyRecipe1` is known, the recipe `MyRecipe2` will not automatically be known and needs to be learnt.



```java
craftRecipe MyRecipe1
{
    ...
}

craftRecipe MyRecipe2
{
    ...
    metaRecipe = MyRecipe1,
    ...
}
```



<a id="scripts-craftrecipe-needtobelearn"></a>

### NeedToBeLearn

**Type:** Unknown

Whether the recipe needs to be learned before it can be crafted.

<a id="scripts-craftrecipe-onaddtomenu"></a>

### OnAddToMenu

**Type:** callback

Called when the recipe gets added to the recipe menu. Return `true` to add it, and return `false` to stop it from getting added to the menu.

<a id="scripts-craftrecipe-oncreate"></a>

### OnCreate

**Type:** callback

Various callback functions can be added to a recipe to trigger at specific moments during the crafting process:

- OnCreate is called when the crafting recipe is finished.
- OnTest is called to verify if the item can be used in the recipe.
- OnFailed is called when the crafting recipe fails or is canceled.
- OnUpdate is called every tick while the recipe is being crafted.

The callback needs to be a Lua function defined as a global function#Local_and_global), which can also be stored in a global table. The vanilla game OnCreate’s are stored in the [Java](../../pzwiki/java/Java.md).

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



<a id="scripts-craftrecipe-onfailed"></a>

### OnFailed

**Type:** callback

See parameter [OnCreate](craftrecipe.md#scripts-craftrecipe-oncreate).

<a id="scripts-craftrecipe-ontest"></a>

### OnTest

**Type:** callback

See parameter [OnCreate](craftrecipe.md#scripts-craftrecipe-oncreate).

<a id="scripts-craftrecipe-onupdate"></a>

### OnUpdate

**Type:** callback

See parameter [OnCreate](craftrecipe.md#scripts-craftrecipe-oncreate).

<a id="scripts-craftrecipe-overlaystyle"></a>

### overlayStyle

**Type:** Unknown

No description provided.

<a id="scripts-craftrecipe-recipegroup"></a>

### recipeGroup

**Type:** Unknown

No description provided.

<a id="scripts-craftrecipe-researchall"></a>

### ResearchAll

**Type:** Unknown

See parameter [ResearchSkillLevel](craftrecipe.md#scripts-craftrecipe-researchskilllevel).

<a id="scripts-craftrecipe-researchany"></a>

### ResearchAny

**Type:** Unknown

See parameter [ResearchSkillLevel](craftrecipe.md#scripts-craftrecipe-researchskilllevel).

<a id="scripts-craftrecipe-researchskilllevel"></a>

### ResearchSkillLevel

**Type:** integer

**Default:** `-1`

ResearchSkillLevel is used to define the skill level required for ResearchAll and ResearchAny to be able to research the recipe. Having the inventive trait will lower the required level by 2.

ResearchAll will require all the provided skills to be at least the required level, while ResearchAny will require only one or more of the provided skills.

<a id="scripts-craftrecipe-skillrequired"></a>

### SkillRequired

**Type:** object (object: string->>integer, kv: ‘:’, pairs: ‘;’)

Specifies the skill level required to perform this crafting action. It should be formatted this way:



```java
/* a single skill */
skillRequired = <skill name>:<level>,

/* multiple skills */
skillRequired = <skill1 name>:<level>;<skill2 name>:<level>,
```



For the list of available skills, see the [wiki](../../pzwiki/scripts/craftRecipe.md).

For example:



```java
skillRequired = Blacksmith:3;Tailoring:2,
```



<a id="scripts-craftrecipe-tags"></a>

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



A crafting bench tag can be created by adding a [component CraftBench](component/component-craftbench.md) to an [entity](entity.md) script, which can then be used in this tags parameter.

You can find a list of tags available on the [wiki](../../pzwiki/scripts/craftRecipe.md).

<a id="scripts-craftrecipe-time"></a>

### time

**Type:** integer

**Default:** `50`

The time it takes to craft the item, not using a specific unit of time so refer to the vanilla recipes to get an idea of what value to use.

<a id="scripts-craftrecipe-timedaction"></a>

### timedAction

**Type:** block (block: [timedAction](timedaction.md#scripts-timedaction))

Refers to a timed action script block to trigger during the crafting process, for animations and/or sounds but also the calories burned and body heat generation.

<a id="scripts-craftrecipe-tooltip"></a>

### Tooltip

**Type:** translation

Description of the crafting which is shown in the crafting menu. The value needs be a key in the [Tooltip.json](../translations/translation_files.md#tooltip) translation file. For example:



```java
Tooltip = MyTooltipKey,
```



And in the translation file:



```json
{
  "MyTooltipKey": "This is my tooltip description."
}
```



<a id="scripts-craftrecipe-xpaward"></a>

### xpAward

**Type:** Unknown

Specifies the experience points awarded for crafting this item. The parameter should be formatted this way:



```java
/* a single skill */
xpAward = <skill name>:<xp amount>,

/* multiple skills */
xpAward = <skill1 name>:<xp amount>;<skill2 name>:<xp amount>,format
```



For the list of available skills, see the [wiki](../../pzwiki/scripts/craftRecipe.md).

For example:



```java
xpAward = Blacksmith:10;Tailoring:5,
```
