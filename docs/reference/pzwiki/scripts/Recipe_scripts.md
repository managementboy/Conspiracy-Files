---
title: "Recipe (scripts)"
source: "https://pzwiki.net/wiki/Recipe_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Recipe_(scripts)&oldid=1370831"
source_last_edited: "Last modified\n\t\t         This page was last edited on 22 May 2026, at 03:36."
retrieved: "2026-09-15T11:39:45.055Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 43
source_tables: 0
---

# Recipe (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version (41.78.19).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Recipe_scripts.md) (Create account)

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about Build 41 crafting recipes. For crafting recipes for Build 42, see [craftRecipe](craftRecipe.md). For an item called “Recipe”, see Recipe.

<a id="Introduction"></a>

## Introduction

Recipes are a description of the ingredients for crafting an item and a description of the item that will result from crafting.

Be careful in the syntax of describing parameters in recipes. Recipes use the property:value format, while items use property=value.

Recipe example:



```text
recipe Open Box of Nails
{
    NailsBox,

    Result:Nails=20,
    Sound:PutItemInBag,
    Time:5.0,
}
```



**Recipe parameters:**

<a id="Source"></a>

### Source

Crafting resources are specified without a parameter word. There are several options for specifying the resources needed for crafting:

**1) itemType1/itemType2/itemType3,**

Items allowed for crafting are indicated. The recipe will require one of these items.

Example:



```text
Paperclip/Nails/FishingHook,
```



**2) itemType=Count,**

Specifies the type of item and the quantity of the item that will be used. If the item is Drainable, then the uses of the item are used. If only one item is needed, then only the item type can be specified.

Example:



```text
FishingRodBreak,
Nails=3,
```



**3) itemType;Count,**

Specifies the type of food item and the quantity of 'Hunger' that will be used. Functions identically to itemType=Count for Drainable items.

Example:



```text
EmptyJar,
Sugar;5,
```



**4) [LuaFuncToGetItemTypes]=Count,**

The Lua function is used to specify items. The functions are specified in a separate Lua file (the file must be placed in the media\lua\server folder).

Example:

**Part of recipe code:**



```text
[Recipe.GetItemTypes.FishingLine]=2,
```



**Lua code:** (Add all items tagged "FishingLine")



```text
function Recipe.GetItemTypes.FishingLine(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FishingLine"))
end
```



**5) keep ItemType,**

So you can specify an item that will not be spent on a recipe, but that you need to keep in hand for crafting.

Example:



```text
keep Saw,
```



**6) destroy ItemType**

So you can specify that the item will be destroyed after crafting.

Example:



```text
destroy RippedSheets,
```



<a id="Override"></a>

### Override

If this parameter is specified, then a recipe that is already loaded by the game will be overwritten with this recipe. Used, for example, to overwrite vanilla recipes.



```text
Override:true,
```



<a id="AnimNode"></a>

### AnimNode

Specifies the ID of the animation that will be used when crafting the item. Example:



```text
AnimNode:RipSheets,
```



<a id="Prop1"></a>

### Prop1

Used to indicate the item that will be in the main (right) hand during crafting.



```text
Prop1:Screwdriver,
```



Also, as an item, you can specify a resource for crafting **Source=%Ordinal number of the resource%**. Example:



```text
Prop1:Source=1
```



<a id="Prop2"></a>

### Prop2

Used to indicate the item that will be in the extra (left) hand during crafting.



```text
Prop2:Log,
```



Also, as an item, you can specify a resource for crafting **Source=%Ordinal number of the resource%**. Example:



```text
Prop2:Source=3
```



<a id="Time"></a>

### Time

Specifies how much time will be spent on crafting.



```text
Time:230.0,
```



<a id="Sound"></a>

### Sound

Sound that will be played when player craft item.



```text
Sound:PutItemInBag,
```



<a id="InSameInventory"></a>

### InSameInventory

If the parameter is true, then the resources for crafting will be used from only one container (the one where the crafting menu was opened).



```text
InSameInventory:true,
```



<a id="Result"></a>

### Result

The result of crafting (item type and quantity). Example:



```text
Result:FishingHook=10,
```



If the result of crafting is an item in a single copy, then the number of items can be skipped.



```text
Result:Hat_TinFoilHat,
```



<a id="OnCanPerform"></a>

### OnCanPerform

The parameter contains the name of a Lua function that will check the condition necessary to start crafting. Example:



```text
OnCanPerform:Recipe.OnCanPerform.HockeyMaskSmashBottle,
```





```text
function Recipe.OnCanPerform.HockeyMaskSmashBottle(recipe, playerObj)
    local wornItem = playerObj:getWornItem("MaskEyes")
    return (wornItem ~= nil) and (wornItem:getType() == "Hat_HockeyMask")
end
```



<a id="OnTest"></a>

### OnTest

The parameter contains the name of the Lua function that checks the resources (items) used in crafting and returns true or false.



```text
OnTest:Recipe.OnTest.IsNotWorn,
```





```text
function Recipe.OnTest.IsNotWorn(item)
    if instanceof(item, "Clothing") then
    return not item:isWorn()
    end
    return true
end
```



<a id="OnCreate"></a>

### OnCreate

The parameter contains the name of the Lua function that is called before using the resources and getting the crafting result. Allows you to add additional functional. Resource items, a crafting result item, and a player object are passed as input to the function.



```text
OnCreate:Recipe.OnCreate.Dismantle,
```





```text
function Recipe.OnCreate.Dismantle(items, result, player)
    player:getInventory():AddItem("Base.ElectronicsScrap");
end
```



<a id="AllowDestroyedItem"></a>

### AllowDestroyedItem

If the parameter is true, then allows the use of broken items as a resource



```text
AllowDestroyedItem:true,
```



<a id="AllowFrozenItem"></a>

### AllowFrozenItem

If the parameter is true, then allows frozen items to be used as a resource



```text
AllowFrozenItem:true
```



<a id="AllowRottenItem"></a>

### AllowRottenItem

If the parameter is true, then allows the use of rotten items as a resource



```text
AllowRottenItem:true
```



<a id="NeedToBeLearn"></a>

### NeedToBeLearn

If the parameter is true, then in order to craft this item, you must first learn the recipe. Usually recipes are learned through magazines or given for certain perks/professions.



```text
NeedToBeLearn:true,
```



<a id="Category"></a>

### Category

Specifies the category in which the recipe will be displayed. Example:



```text
Category:Carpentry,
```



<a id="RemoveResultItem"></a>

### RemoveResultItem

If the parameter is true, then the recipe will not return the crafting result to the player.



```text
RemoveResultItem:true
```



<a id="CanBeDoneFromFloor"></a>

### CanBeDoneFromFloor

If the parameter is true, then the crafting of the item can be done without picking up resources from the floor Required

Item to be repaired.

Required : WoodAxe, (The player will not move items to inventory)



```text
CanBeDoneFromFloor:true,
```



<a id="NearItem"></a>

### NearItem

Allows crafting only if there is an object nearby with the name of the value, which is specified in the parameter.



```text
NearItem:Workbench,
```



<a id="SkillRequired"></a>

### SkillRequired

The parameter indicates the required skill and its level for crafting.



```text
SkillRequired:Woodwork=7,
```



Skill List: Axe, Blunt, SmallBlunt, LongBlade, SmallBlade, Spear, Maintenance, Aiming, Reloading, Woodwork, Cooking, Farming, Doctor, Electricity, MetalWelding, Mechanics, Tailoring, Fishing, Trapping, PlantScavenging, Fitness, Strength, Sprinting, Lightfoot , Nimble, Sneak

<a id="OnGiveXP"></a>

### OnGiveXP

The parameter contains the name of a Lua function that gives experience to the crafting player.



```text
OnGiveXP:Recipe.OnGiveXP.SawLogs,
```





```text
function Recipe.OnGiveXP.SawLogs(recipe, ingredients, result, player)
    if player:getPerkLevel(Perks.Woodwork) <= 3 then
        player:getXp():AddXP(Perks.Woodwork, 3);
    else
        player:getXp():AddXP(Perks.Woodwork, 1);
    end
end
```



<a id="Obsolete"></a>

### Obsolete

If the parameter is true, then the recipe will be removed from the game. The parameter can be useful for overriding and removing vanilla recipes.



```text
Obsolete:true,
```



<a id="Heat"></a>

### Heat

The parameter indicates the temperature of the resource required for crafting. -1.0 (Very hot) to 1.0 (Very cold).



```text
Heat:-0.22
```



<a id="NoBrokenItems"></a>

### NoBrokenItems

If the parameter is true, then broken items cannot be used in crafting.



```text
NoBrokenItems:true,
```



<a id="StopOnWalk"></a>

### StopOnWalk

If the parameter is true, then it will not be possible to craft the item when the player is walking. If it is false, then it will be possible to craft on the go.



```text
StopOnWalk:false
```



<a id="StopOnRun"></a>

### StopOnRun

If the parameter is true, then it will not be possible to craft an item when the player is running. If set to false, then it will be possible to craft while running.



```text
StopOnRun:false
```



<a id="IsHidden"></a>

### IsHidden

If the parameter is true, then hides crafting from the crafting menu.



```text
IsHidden:true,
```



<a id="Lua"></a>

## Lua

Inherit`Recipe` from`Base` first:



```text
local Recipe = Recipe

function Recipe.OnCreate.YourRecipe(items, result, player, selectedItem)
   ...
end
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Recipe_(scripts)&oldid=1370831](Recipe_scripts.md)"
