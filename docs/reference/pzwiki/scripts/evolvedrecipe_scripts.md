---
title: "evolvedrecipe (scripts)"
source: "https://pzwiki.net/wiki/Evolvedrecipe_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Evolvedrecipe_(scripts)&oldid=1463093"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 08:12."
retrieved: "2026-09-15T11:39:39.896Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# evolvedrecipe (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](evolvedrecipe_scripts.md) (Create account)

evolvedrecipe

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module

[ID](Scripts.md#ID)

Any

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

Defines a dynamic recipe where items can be added in as ingredients in multiple steps. This is notably used to define soups, stews or beverages that can accept multiple combination of ingredients. Stats from each [items](item_scripts.md) are added to the final product.

For an item to be accepted in a specific evolvedrecipe, it needs to have the parameter EvolvedRecipe which lists every evolved recipes it can be used in and in what quantity.

<a id="Parameters"></a>

## Parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Example"></a>

## Example



```text
module Base {
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
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Evolvedrecipe_(scripts)&oldid=1463093](evolvedrecipe_scripts.md)"
