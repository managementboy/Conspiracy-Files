---
title: "OnCreate (craftRecipe)"
source: "https://pzwiki.net/wiki/OnCreate_(craftRecipe)"
source_revision: "https://pzwiki.net/w/index.php?title=OnCreate_(craftRecipe)&oldid=1253143"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:54."
retrieved: "2026-09-15T11:42:27.643Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# OnCreate (craftRecipe)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnCreate_craftRecipe.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`OnCreate` parameter allows the referencing of a Lua function that will be called when the crafting recipe is finished. This can be used to add custom behavior to the crafting recipe when it gets finished. The function should be [global](../lua-api/Lua_language.md#Local_and_global) and defined in a Lua file. Vanilla puts its global crafting functions inside the file`media/lua/server/recipecode.lua` however make sure to define your custom functions in a uniquely named file.

The function should have the following structure:



```text
function MyOnCreateFunction(craftRecipeData, character)
    -- your custom code here
end
```



The craftRecipeData is a java object that contains the data of the crafting recipe. The`character` is the player character who is crafting the recipe.

<a id="Example"></a>

## Example



```text
OnCreate = Recipe.OnCreate.OpenCannedFood,
```



**Source:**`ProjectZomboid\media\lua\server\recipecode.lua`

**Retrieved**: Build 42.5.1



```text
-- set back the age of the food and give the jar back
function Recipe.OnCreate.OpenCannedFood(craftRecipeData, character)
	local items = craftRecipeData:getAllConsumedItems();
	local result = craftRecipeData:getAllCreatedItems():get(0);
    local jar = items:get(0);
    local aged = jar:getAge() / jar:getOffAgeMax();
    result:setBaseHunger(jar:getBaseHunger())
    result:setHungChange(jar:getHungChange())
    result:setCarbohydrates(jar:getCarbohydrates())
    result:setLipids(jar:getLipids())
    result:setProteins(jar:getProteins())
    result:setCalories(jar:getCalories())

    result:setAge(result:getOffAgeMax() * aged);
    result:setCooked(jar:isCooked())
    result:setBurnt(jar:isBurnt())

	result:syncItemFields();

    -- character:getInventory():AddItem("Base.EmptyJar");
    local lid = instanceItem("Base.JarLid");
    local mData = jar:getModData()
    local cond = mData.LidCondition or 9
    lid:setCondition(cond)
    character:getInventory():AddItem(lid);
	sendAddItemToContainer(character:getInventory(), lid);

--    print("you're new food have age " .. result:getAge());
end
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnCreate_(craftRecipe)&oldid=1253143](OnCreate_craftRecipe.md)"
