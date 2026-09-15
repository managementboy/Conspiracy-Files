---
title: "outputs"
source: "https://pzwiki.net/wiki/Outputs_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Outputs_(scripts)&oldid=1315639"
source_last_edited: "Last modified\n\t\t         This page was last edited on 15 January 2026, at 01:51."
retrieved: "2026-09-15T11:39:52.724Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 3
---

# outputs

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](outputs.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`outputs` parameter defines the items that will be created when the recipe is finished. Outputs are listed one after the other and follow the format below:

outputs

{

-- simple item output

item quantity item,

-- using mappers

item quantity mapper:mapperID,

...

}

Every`outputs` lines need to finish with a comma or this will cause a parsing error. However, make sure to NOT put a comma after the final`}` of the`outputs` block !

<a id="Parameters"></a>

## Parameters

| Parameter | Description |
| --- | --- |
|`quantity` | The quantity is an integer that defines the number of items needed for the recipe. |
|`item` | The output item is unique for an output line. The items need to have their full type noted in the list. For example,`Base.ClosedUmbrellaBlack` is the black closed umbrella item. For a custom module it would have to be`YourModuleName.YourItemID`.`item 1 Base.SmallKnife item 1 Base.ClosedUmbrellaBlack, item 1 YourModuleName.YourItemID,` Notice the difference with the [inputs](inputs.md) writing where here`item` is not in-between`[]` because only one item can exist for an output entry. |
|`mapperID` | The mapper is a parameter used to link input items to their output equivalent. To see more detail on mappers and how they are used, see [itemMapper](itemMapper.md). |
| flags Unused | Flags for outputs currently do not have a single example in the vanilla recipes. The flags are listed because present in the game code, but there currently is no confirmation of them working. See [flags](outputs.md#flags) for the list of flags. |

Both item and mapper methods of listing items can't be combined.

<a id="flags"></a>

## flags

Below is the full list of flags that can be used:

| Flag | Description |
| --- | --- |
|`HandcraftOnly` | The output item can only be crafted when you didn't use automation. |
|`AutomationOnly` | The output item can only be crafted when you used automation. (existed but not implemented yet) |

| Flag | Description |
| --- | --- |
|`IsEmpty` | The fluidContainer is empty. |
|`ForceEmpty` | Fluid already contained will be emptied. |
|`AlwaysFill` | The fluidContainer will try to fill up if the available capacity exceeds the create fluid amount. |
|`RespectCapacity` | The fluidContainer must have enough free capacity. |

Flags for outputs currently do not have a single example in the vanilla recipes. The flags are listed because present in the game code, but there currently is no confirmation of them working.

<a id="Example"></a>

## Example



```text
outputs
{
    item 1 Base.Tissue,
    item 1 Base.ScratchTicket,
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Outputs_(scripts)&oldid=1315639](outputs.md)"
