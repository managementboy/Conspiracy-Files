---
title: "outputs"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/outputs.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/outputs.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="outputs"></a>

<a id="scripts-outputs"></a>

# outputs

**Soft Override:** False

The `outputs` block defines the items that will be created when the recipe is finished. Outputs are listed one after the other and follow the format below:



```cpp
outputs
{

    /* simple item output */
    item quantity item,

    /* using mappers */
    item quantity mapper:mapperID,

    ...
}
```



For example:



```cpp
outputs
{
    item 1 Base.Tissue,
    item 1 Base.ScratchTicket,
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [craftRecipe](craftrecipe.md#scripts-craftrecipe)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

This block has no parameters.
