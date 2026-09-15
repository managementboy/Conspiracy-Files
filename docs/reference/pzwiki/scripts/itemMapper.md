---
title: "itemMapper"
source: "https://pzwiki.net/wiki/ItemMapper_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=ItemMapper_(scripts)&oldid=1315643"
source_last_edited: "Last modified\n\t\t         This page was last edited on 15 January 2026, at 01:52."
retrieved: "2026-09-15T11:39:53.093Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# itemMapper

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](itemMapper.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`itemMapper` parameter allows input items to be mapped to an output item. This is useful when you want to use a specific item in the recipe, but the player can use different items that are equivalent. This can alternatively be used for crafts that are the same for different types of objects. Mappers involve [inputs](inputs.md) and [outputs](outputs.md) as well as a whole new parameter`itemMapper`. To map items you need to use the following format:



```text
inputs
{
    item 1 <item table> mappers[mapperID],
}
outputs
{
    item 1 mapper:mapperID,
}
itemMapper mapperID
{
    <output item3> = <input item1>,
    <output item4> = <input item2>,
    ...
}
```



It is also possible to have two different inputs be used in the mapper:



```text
inputs
{
    item 1 <item table> mappers[mapperID],
    item 1 <item table> mappers[mapperID],
}
outputs
{
    item 1 mapper:mapperID,
}
itemMapper mapperID
{
    <output item3> = <input item1>;<input item5>,
    <output item4> = <input item2>;<input item6>,
    ...
}
```



What this does is it will output`item3` if the two inputs defined in the`inputs` block are respectively`item1` and`item5` and it will be`item4` if they are respectively`item2` and`item6`.

<a id="Example"></a>

## Example

Creating a recipe which allows the user to open or close an umbrella needs to take into account the different colors of the umbrella.

For example, if you want to use a closed umbrella in a recipe, but the player can use any color of closed umbrella, you can use the following code:



```text
inputs
{
    item 1 [Base.ClosedUmbrellaBlack;Base.ClosedUmbrellaBlue;Base.ClosedUmbrellaRed;Base.ClosedUmbrellaTINTED;Base.ClosedUmbrellaWhite] mappers[umbrellaElla] flags[InheritColor;Prop1],
}
outputs
{
    item 1 mapper:umbrellaElla,
}
itemMapper umbrellaElla
{
    Base.UmbrellaBlack = Base.ClosedUmbrellaBlack,
    Base.UmbrellaBlue = Base.ClosedUmbrellaBlue,
    Base.UmbrellaRed = Base.ClosedUmbrellaRed,
    Base.UmbrellaTINTED = Base.ClosedUmbrellaTINTED,
    Base.UmbrellaWhite = Base.ClosedUmbrellaWhite,
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=ItemMapper_(scripts)&oldid=1315643](itemMapper.md)"
