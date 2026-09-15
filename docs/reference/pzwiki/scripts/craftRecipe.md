---
title: "craftRecipe"
source: "https://pzwiki.net/wiki/CraftRecipe"
source_revision: "https://pzwiki.net/w/index.php?title=CraftRecipe&oldid=1456503"
source_last_edited: "Last modified\n\t\t         This page was last edited on 11 August 2026, at 23:01."
retrieved: "2026-09-15T11:42:31.604Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 11
source_tables: 3
---

# craftRecipe

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.2).

Help by adding any missing content. [Edit](craftRecipe.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

craftRecipe

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module

[Children blocks](Scripts.md#Children_blocks)

[outputs](outputs.md)
[inputs](inputs.md)
overlayMapper
[itemMapper](itemMapper.md)

[ID](Scripts.md#ID)

Any

[Soft overrides](Scripts.md#Soft_overrides)

True

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about Build 42 crafting recipes. For crafting recipes for Build 41, see [Recipe (scripts)](Recipe_scripts.md).

The **craftRecipe** [script](Scripts.md) block is used to define a crafting recipe, which allows players to craft items or tiles in the game based on the parent script block. For example, a craftRecipe defined inside a module will be a recipe to craft an item usually, while when defined inside an entity it will be the building recipe for that entity.

A craftRecipe will usually require an [inputs](inputs.md) and [outputs](outputs.md) block. Other parameters are used to define properties of this recipe, such as the time it takes to craft or the XP awarded for crafting it.

For example:



```text
module yourModule /* or Base */
{
    craftRecipe yourRecipeID
    {
        ...
    }
}
```



To define a [translation](../translations/Translation.md) for this recipe, you need to create an entry in the translation file Recipes.json. The translation entry should be formatted like this:



```text
{
  "yourRecipeID": "Your recipe"
}
```



Notice how you shouldn't use the module in the translation file key and only the craftRecipe ID.

<a id="craftingRecipe_format"></a>

## craftingRecipe format

To create a new crafting recipe, simply use the following entry in a script file:



```text
module yourModule /* or Base */
{
    craftRecipe <RecipeID>
    {
        ...
    }
}
```



The`<RecipeID>` is a unique identifier for the recipe, and **should not have spaces in it**. It is used to define the name of the recipe in the [translation files](../translations/Translation.md), in`Recipes.json`. For example, if the`<RecipeID>` is`MyRecipe`, the translation file for English needs to have:



```text
{
    "MyRecipe": "My recipe name"
}
```



<a id="craftRecipe_parameters"></a>

## craftRecipe parameters

You can find a full list of the parameters in the ScriptsDocs.

You can also learn more about specific elements of the craftRecipe script block in the following pages:

- [Fluids](Fluids_craftRecipe.md)
- [inputs](inputs.md)
- [outputs](outputs.md)
- [itemMapper](itemMapper.md)

<a id="Available_skills"></a>

### Available skills

You can define multiple skills and their respective experience points/levels by separating them with`;`. Below is how each parameters need to be formatted:

- [xpAward](xpAwards.md) format is`skill:experience`
- [SkillRequired](SkillRequired.md) format is`skill:level`
- AutoLearnAll format is`skill:level`
- AutoLearnAny format is`skill:level`

You can find the available skills in the PerkFactory.Perks class. Alternatively, you can also use modded skills defined by your mod or other mods.

<a id="List_of_tags"></a>

### List of tags

Below is the list of tags that are used in vanilla crafts:

| Tag | Description |
| --- | --- |
|`CanAlwaysBeResearched` | Doesn't need to respect specific conditions to be researched. |
|`CanBeDoneInDark` | Can be crafted in the dark. |
|`RightClickOnly` | Can only be crafted by right-clicking. |

| Tag | Description |
| --- | --- |
|`Cooking` |  |
|`Electrical` |  |
|`Engineer` |  |
|`Farming` |  |
|`Fishing` |  |
|`Glassmaking` |  |
|`Health` |  |
|`Packing` |  |
|`Pottery` |  |
|`Smithing` |  |
|`Survivalist` |  |
|`Trapper` |  |
|`Welding` |  |

| Tag | Description |
| --- | --- |
|`AnySurfaceCraft` | Can be crafted on any surface. |
|`InHandCraft` | Can be crafted in hand. Makes the recipe available from the context menu on items usable in the recipe. |
|`CanBeDoneFromFloor` | Can be crafted from the floor. |
|`CoffeeMachine` | Can be crafted in a coffee machine. |
|`Forge` | Can be crafted in a forge. |
|`Furnace` | Can be crafted in a furnace. |
|`Grindstone` | Can be crafted on a grindstone. |
|`HandPress` | Can be crafted on a hand press. |
|`Heckling` | Can be crafted on a heckle. |
|`KeyDuplicator` | Can be crafted in a key duplicator. |
|`KilnLarge` | Can be crafted in a large kiln. |
|`KilnSmall` | Can be crafted in a small kiln. |
|`PotteryBench` | Can be crafted on a pottery bench. |
|`PotteryWheel` | Can be crafted on a pottery wheel. |
|`Rippling` | Can be crafted in a ripple comb. |
|`Scutching` | Can be crafted on a scutching board. |
|`StandingDrillPress` | Can be crafted on a standing drill press. |
|`Toaster` | Can be crafted in a toaster. |

The crafting bench tag is mandatory for the recipe to be recognized.

<a id="Modifying_existing_recipes"></a>

## Modifying existing recipes

Source marks this entry as incomplete.

Below will be a list of known methods to modify specific elements of existing recipes.

The new craftRecipe from Build 42 is very limited when it comes to modifying existing recipes from the Lua compared to the previous [recipe scripts](Recipe_scripts.md) from Build 41. It often requires the use of tricks to access recipe data and is often suboptimal.
Want this to change ? Push for TIS to implement proper modification methods for modders here!

<a id="Overriding_simple_recipe_key-value_parameter"></a>

### Overriding simple recipe key-value parameter

Say for example you want to speed up the specific recipe crafting time. This is possible to achieve by (ab)using`craftRecipe:Load()` in a similar way to how using`item:DoParam()` works for overriding item properties. The only thing to watch out for is you have to enclose clode block in`{ ... }` brackets, otherwise game engine's script parser errors out with`IndexOutOfBoundsException` while trying to find first script block in script parser. And don't forget the comma after parameter value, comma is extremely important for script parser.

Example code:



```text
local function AdjustRecipe(recipeName, propertyName, propertyValue)
    local recipe = ScriptManager.instance:getCraftRecipe(recipeName)
    if not recipe then return end
    local scriptCode = "{ " .. tostring(propertyName) .. " = " .. tostring(propertyValue) .. ", }"
    recipe:Load(recipeName, scriptCode)
end

AdjustRecipe("SawLogs", "time", 50) -- speed up sawing logs
```



It is not easily possible to use this to override values that contain lists (such as Tags or xpAward). And do not use this to override sub-blocks like inputs or outputs.

Patch 42.18 added`getModTags()`,`setTags()` for CraftRecipe. It may be possible to use those now.

<a id="Adding_a_new_output_mapper_output"></a>

### Adding a new output mapper output

Below are listed methods to modify an existing craftRecipe [itemMappers](itemMapper.md).

<a id="First_method"></a>

#### First method

This method needs the mod to define a craftRecipe with the same name as the one to add new [itemMapper](itemMapper.md) entries. Only the itemMapper or overlayMapper entries need to be added the craftRecipe, which will not overwrite the original craftRecipe but add new entries to it. Simply make sure that your item gets added to the [inputs](inputs.md) either by adding it manually or if the input uses item tags, that your item has the same tags.



```text
craftRecipe DrySmallLeather
    {
        itemMapper DryLeatherSmall
        {
            Base.RaccoonLeather_Spiffo_Fur_Tan = Base.RaccoonLeather_Spiffo_Fur_Tan_Wet,
        }
        overlayMapper
        {
            Base.RaccoonLeather_Spiffo_Fur_Tan_Wet = DeerLeather,
        }
}
```



<a id="Second_method"></a>

#### Second method

The second method involves the use of Lua.



```text
Events.OnGameStart.Add(function()
    local recipe = ScriptManager.instance:getCraftRecipe("SliceHead")
    if recipe then
        local outputs = recipe:getOutputs()
        for i=0, outputs:size()-1 do
            local out = outputs:get(i)
            local mapper = out:getOutputMapper()
            if mapper then
                local list = ArrayList.new()
                list:add("HorseMod.Horse_Head")
                mapper:addOutputEntree("HorseMod.Horse_Skull", list)
                mapper:OnPostWorldDictionaryInit(recipe:getName())
            end
        end
    end
end)
```



<a id="Adding_new_inputs"></a>

### Adding new inputs

Below is an example of how you can add new items to the [inputs](inputs.md) of an existing craftRecipe using Lua. The hardest part of adding new items to inputs is identifying the inputs themselves, which is done with a testFunction in the example below.

In the example provided, the recipe also depends on itemMappers, so you need to make sure to patch using the method described in [#Adding a new output mapper output](craftRecipe.md#Adding_a_new_output_mapper_output).

![Article illustration](../assets/73c8ffc1fdd2bf2be94e.png)

Full snipet for adding new inputs to an existing craftRecipe



```text
local items = {
    "HorseMod.HorseLeather_AP_Fur_Tan",
    "HorseMod.HorseLeather_AP_Fur_Tan_Medium",
    "HorseMod.HorseLeather_APHO_Fur_Tan",
    "HorseMod.HorseLeather_APHO_Fur_Tan_Medium",
    "HorseMod.HorseLeather_AQHBR_Fur_Tan",
    "HorseMod.HorseLeather_AQHBR_Fur_Tan_Medium",
    "HorseMod.HorseLeather_AQHP_Fur_Tan",
    "HorseMod.HorseLeather_AQHP_Fur_Tan_Medium",
    "HorseMod.HorseLeather_FBG_Fur_Tan",
    "HorseMod.HorseLeather_FBG_Fur_Tan_Medium",
    "HorseMod.HorseLeather_GDA_Fur_Tan",
    "HorseMod.HorseLeather_GDA_Fur_Tan_Medium",
    "HorseMod.HorseLeather_LPA_Fur_Tan",
    "HorseMod.HorseLeather_LPA_Fur_Tan_Medium",
    "HorseMod.HorseLeather_T_Fur_Tan",
    "HorseMod.HorseLeather_T_Fur_Tan_Medium",
}

-- this is the item full type we will use to identify the correct input to add our new items to
-- in this recipe example this is enough because we know the second input only contains tool items, so not really leathers
local checkItem = "Base.Leather_Crude_Large"

---An example of input identification function. Checks if the input contains an item with a specific full type, which is usually enough to identify it.
---@param input InputScript
---@param loadedItems List<string>
---@return boolean
local function identifyInput(input, loadedItems)
    if loadedItems:contains(checkItem) then return true end
    return false
end

---Function used to patch a recipe by adding new items to one of its inputs. Uses a `testInput` function to identify the correct input to add items to.
---@param recipeID string
---@param testInput fun(input: InputScript, loadedItems: List<string>): boolean
---@param itemsToAdd string[]
local function patchRecipe(recipeID, testInput, itemsToAdd)
    -- retrieve the recipe informations
    local craftRecipe = getScriptManager():getCraftRecipe(recipeID)
    local inputs = craftRecipe:getInputs()

    for i = 0, inputs:size() - 1 do
        -- retrieve the input and its script loaded items
        local input = inputs:get(i)
        local loadedItems = inputs:getItems()

        -- check if the input passes the test function
        if testInput(input, loadedItems) then
            -- add the items to the input
            for j = 1, #itemsToAdd do
                loadedItems:add(itemsToAdd[j])
            end
            return
        end
    end
end

patchRecipe("Base.CutLeatherInHalf", identifyInput, items)
```



<a id="Hiding_recipes"></a>

### Hiding recipes

dane's Library provides the ability to hide recipes from the crafting menu. OnAddToMenu may also be a possible solution to hide the recipe from the crafting menu (doesn't seem to hide in the context menu however).

<a id="Example"></a>

## Example

Here's an example of a craftRecipe with some parameters defined:



```text
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



```text
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



```text
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



Retrieved from "[https://pzwiki.net/w/index.php?title=CraftRecipe&oldid=1456503](craftRecipe.md)"
