---
title: "inputs"
source: "https://pzwiki.net/wiki/Inputs_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Inputs_(scripts)&oldid=1389571"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 02:40."
retrieved: "2026-09-15T11:39:39.090Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 4
source_tables: 8
---

# inputs

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](inputs.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`inputs` parameter defines the ingredients needed to craft an item. It usually includes a combination of items, tags, modes, and mappers for consumption of the crafting ingredients.

Inputs are listed one after the other and follow the format examples below:

inputs

{

-- simplest form

item quantity [item1;item2...],

-- simplest form, different quantity for some items

item quantity [item1;2:item2...],

-- with tags

item quantity tags[tag1;tag2...],

-- combining tags with item table

item quantity [item1;item2...] tags[tag1;tag2...],

-- with mode, mappers and flags

item quantity [item1;item2...] mode:mode mappers[mapperID] flags[flag1;flag2...],

...

}

Every`inputs` line needs to end with a comma, or this will cause a parsing error. However, make sure to NOT include a comma after the final`}` of the`inputs` block!

<a id="Parameters"></a>

## Parameters

| Parameter | Description |
| --- | --- |
|`quantity` | The quantity is an integer that defines the number of items needed for the recipe. |
|`item` table | Items are listed in a table by separating them with a semicolon (`;`). The table can contain multiple items which the player can use for this specific input. The items need to have their full type noted in the list. For example,`Base.ClosedUmbrellaBlack` is the black closed umbrella item. For a custom module it would have to be`YourModuleName.YourItemID`.`item 1 [Base.SmallKnife], item 1 [Base.ClosedUmbrellaBlack;Base.ClosedUmbrellaBlue], item 1 [YourModuleName.YourItemID],` You can also use`[*]` for the item table to allow any item. This is notably used for fluids which are detailed in [Fluids (craftRecipe)](Fluids_craftRecipe.md). You can have different input amounts for different items in the table by adding`quantity:` in front of the item ID which needs to have a different quantity value than the default one. For example:`item 1 [Item1;2:Item2;10:Item3],` |
|`tag` table | Tags are used to identify a specific class of items that can be used in the recipe. It differs from [Tags (craftRecipe)](Tags_craftRecipe.md) which are recipe tags and instead uses tags which are defined in the [item script](item_scripts.md) itself to identify types of items. You can define your own custom tags in your own items to use in your custom recipes too. Tags are listed in the format`tags[tagName1;tagName2...]`. See item tag for the list of tags available in the game. For example,`Base.SmallKnife` has the tags:`Tags = CutPlant;SharpKnife;ButcherAnimal;HasMetal;Blade;Sharpenable;KillAnimal` which define specific uses of the knife so you can identify it with the most relevant tag for your recipe.`item 1 tags[base:sharpknife],` |
|`mode` | The mode is an optional parameter that can be used to define how the item is used in the recipe. Currently only two options are available:`keep` - The item will be kept after the recipe is finished.;`destroy` - The item will be deleted after the recipe is finished.; By default,`destroy` is used. Some [flags](inputs.md#Flags) can be used to impact how`keep` is used, like reducing the condition of the item for example. |
|`mapperID` | The mapper is an optional parameter used to link input items to their output equivalent. To see more detail on mappers and how they are used, see [itemMapper](itemMapper.md). |
|`flag` table | Flags are used to define conditions to respect for items to be used in this input or behaviors to apply to this input item when keeping it. See [flags](inputs.md#Flags) for the list of flags available. |

<a id="Flags"></a>

## Flags

This article may need more content.

This list is outdated and incomplete. The last version of it dates to the Build 42.6.0

Editors are encouraged to add new material to the page while expanding upon current topics. [Edit](inputs.md) (Create account)

Below is a list of flags that can be used:

| Flag | Description |
| --- | --- |
|`Prop1` | The item will be equipped in the right hand. |
|`Prop2` | The item will be equipped in the left hand. |

| Flag | Description |
| --- | --- |
|`AllowFavorite` |  |
|`HandcraftOnly` | The item can only be crafted by hand. |
|`DontPutBack` | Item won't be put back in the container it was taken from (usually bottles that need to be opened). |
|`IsExclusive` | Whenever multiple possible inputs are available but only a single type can be used, to not mix multiple different items. |

| Flag | Description |
| --- | --- |
|`AllowFrozenItem` |  |
|`AllowRottenItem` |  |
|`IsCookedFoodItem` | The item is cooked. |
|`IsUncookedFoodItem` | The item is uncooked. |
|`IsWholeFoodItem` | Instead of consuming uses of the item, it will use the whole food item. |

| Flag | Description |
| --- | --- |
|`ItemIsFluid` | The item is a fluid, unclear. |
|`FullOfWater` |  |
|`IsEmpty` |  |
|`NotEmpty` |  |
|`IsFull` |  |
|`NotFull` |  |

| Flag | Description |
| --- | --- |
|`IsDamaged` | The item is damaged. |
|`IsUndamaged` | The item is not damaged. |
|`IsWorn` | The item (clothing) is currently worn by the player. |
|`IsNotWorn` | The item (clothing) is currently not worn by the player. |
|`AllowDestroyedItem` | The item may be destroyed. |
|`NoBrokenItems` | The item is not broken. |
|`IsHeadPart` | The item is a head part. |
|`MayDegrade` | Will degrade the item used. |
|`MayDegradeHeavy` | Will degrade heavily the item used. |
|`MayDegradeLight` | Will degrade lightly the item used. |
|`IsSharpenable` | The item can be sharpened. |
|`IsNotDull` | The item is sharp. |
|`SharpnessCheck` | The item's sharpness will be reduced. |

| Flag | Description |
| --- | --- |
|`CopyClothing` | The output clothing item will copy the input clothing item condition, like dirt, blood, holes, decal/variant and patches. |
|`InheritAmmunition` | Crafted item will receive the ammunition of the input item. |
|`InheritColor` | Crafted item will receive the color of the input item. |
|`InheritCondition` | Crafted item will receive the condition of the input item. |
|`InheritCooked` | Crafted item will receive the cooked status of the input item. |
|`InheritFavorite` | Crafted item will receive the favorite status of the input item. |
|`InheritFoodAge` | Crafted item will receive the food age of the input item. |
|`InheritHeadCondition` | Crafted item will receive the head condition of the input item. |
|`InheritSharpness` | Crafted item will receive the sharpness amount of the input item. |
|`InheritUses` | Crafted item will receive the uses amount of the input item. |
|`InheritEquipped` | Crafted item will receive the equipped status of the input item. |

| Flag | Description |
| --- | --- |
|`ItemCount` | Used for Drainable items. Use the item count instead of drainable item uses. |
|`DontReplace` |  |

<a id="Example"></a>

## Example



```text
inputs
{
    item 1 tags[base:ripclothingcotton] flags[AllowDestroyedItem;IsNotWorn],
    item 1 [Base.ClosedUmbrellaBlack;Base.ClosedUmbrellaBlue] mappers[umbrellaElla],
    item 1 [Base.Hammer] mode:keep flags[Prop1],
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Inputs_(scripts)&oldid=1389571](inputs.md)"
