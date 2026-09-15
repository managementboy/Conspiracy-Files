---
title: "Fluids (craftRecipe)"
source: "https://pzwiki.net/wiki/Fluids_(craftRecipe)"
source_revision: "https://pzwiki.net/w/index.php?title=Fluids_(craftRecipe)&oldid=1459271"
source_last_edited: "Last modified\n\t\t         This page was last edited on 20 August 2026, at 16:28."
retrieved: "2026-09-15T11:39:53.531Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# Fluids (craftRecipe)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Fluids_craftRecipe.md) (Create account)

This article may be outdated.

For a few versions now, the game no longer has a single example of`+fluid` being used. Some changes to the fluid handling might not be working the same as what this documentation shows. This page needs updating.

Editors are encouraged to update this article with new information. [Edit](Fluids_craftRecipe.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

**Fluids** use in recipes do not use a specific parameter to be defined but are directly defined in [inputs](inputs.md), even for fluid output.

They are used in the same way as items, but have specific formatting. You start by defining which container the liquid can be in, usually this is done by listing every item with`[*]` and then defining the gain or loss of liquid.



```text
inputs
{
    item <quantity integer> [item1, item2...] <mode optional> <flags optional>,
    -fluid <quantity float> [fluid1, fluid2...],
    item <quantity integer> [item1, item2...] <mode optional> <flags optional>,
    +fluid <quantity float> outputFluid,
}
```



All fluid consumption and production is listed in`inputs` but`-fluid` defines fluid consumption while`+fluid` defines fluid production. The`quantity` is a float that defines the amount of liquid used or produced.

`-fluid` requires the definition of fluids used inside a table like formatting (`[Water;TaintedWater...]`) while`+fluid` requires the definition of a single fluid (`Water`).

Notice that the fluids which serve as inputs are in between`[]` while the output fluid is not. This is because input can take multiple options for the fluid while output can only have one option.

<a id="Example"></a>

## Example

**Source:**`ProjectZomboid\media\scripts\entities\appliances\workstations\entity_coffeemachine.txt`

**Retrieved**: Build 42.5.1



```text
craftRecipe MakeCoffeeMug
{
    timedAction = MakeCoffee,
    Time = 20,
    category = Cooking,
    Tags = CoffeeMachine;Cooking,
    inputs
    {
        item 1 [Base.Coffee2],
        item 1 [*],
        -fluid 0.2 [Water;TaintedWater],
        item 1 tags[CoffeeMaker],
        +fluid 0.2 Coffee,
    }
    outputs
    {
    }
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Fluids_(craftRecipe)&oldid=1459271](Fluids_craftRecipe.md)"
