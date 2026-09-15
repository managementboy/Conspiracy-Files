---
title: "evolvedrecipe"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/evolvedrecipe.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/evolvedrecipe.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="evolvedrecipe"></a>

<a id="scripts-evolvedrecipe"></a>

# evolvedrecipe

**Soft Override:** Unknown

Defines a dynamic recipe where items can be added in as ingredients in multiple steps. This is notably used to define soups, stews or beverages that can accept multiple combination of ingredients. Stats from each [items](item.md) are added to the final product.

For an item to be accepted in a specific evolvedrecipe, it needs to have the parameter EvolvedRecipe which lists every evolved recipes it can be used in and in what quantity.

For example:



```cpp
evolvedrecipe Sandwich
{
    BaseItem = Base.BreadSlices,
    MaxItems = 4,
    ResultItem = Base.Sandwich,
    Name = Make Sandwich,
    CanAddSpicesEmpty = true,
    AddIngredientIfCooked = true,
    Template = Sandwich,
    Cookable = true,
}

item Processedcheese
{
    EvolvedRecipe = Sandwich:5;Burger:5;Hotdog:5;Rice:5;Pasta:5;Bread:5;Omelette:5;Toast:5,
    ...
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

**Can have spaces:** True

<a id="parameters"></a>

## Parameters

<a id="scripts-evolvedrecipe-addingredientifcooked"></a>

### AddIngredientIfCooked

**Type:** boolean

Whenever ingredients can be added even after the item has been cooked.

<a id="scripts-evolvedrecipe-addingredientsound"></a>

### AddIngredientSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `AddItemInBeverage`

The [sound](sound.md) which will be played when an ingredient is added.

If set to `AddItemInBeverage`, when the [ingredient](item.md) has the tag `base:wetbeverageingredient`, the sound will be changed to `AddWetItemInBeverage` but if not present, it will changed to `AddDryItemInBeverage`.

<a id="scripts-evolvedrecipe-baseitem"></a>

### BaseItem

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

The [item](item.md) which will serve as the base for this recipe, that is the item which will be combined with the ingredients to create the ResultItem.

<a id="scripts-evolvedrecipe-canaddspicesempty"></a>

### CanAddSpicesEmpty

**Type:** boolean

If true, the spices can be added to the BaseItem directly without any ingredients yet added.

<a id="scripts-evolvedrecipe-cookable"></a>

### Cookable

**Type:** boolean

**Allowed values:** `true`

If this parameter is present, the ResultItem will be cookable. Setting it to false will **NOT** make this value false internally, you need to remove the parameter entirely to make it false.

<a id="scripts-evolvedrecipe-maxitems"></a>

### MaxItems

**Type:** integer

**Minimum:** `1`

The maximum number of ingredients which will be used in this recipe. Unique spices on the other hand can be added infinitely.

<a id="scripts-evolvedrecipe-minimumwater"></a>

### MinimumWater

**Type:** float

**Default:** `0.0`

The minimum amount of water which must be present in the BaseItem for this recipe to be valid.

<a id="scripts-evolvedrecipe-name"></a>

### Name

**Type:** string

The translation key for the name of this recipe which will be retrieved from the [Recipes.json](../translations/translation_files.md#recipes) file.

<a id="scripts-evolvedrecipe-resultitem"></a>

### ResultItem

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-evolvedrecipe-template"></a>

### Template

**Type:** string

Whenever an [item](item.md) uses this recipe via the EvolvedRecipe parameter, and links to the recipe of the `Template`, that ingredient will be added to both every evolved recipe with this template value. This allows you to make variants of the same evolved recipe with different containers, for example for beverages, where the same recipe can be used for a cup, a bottle or a jar.
