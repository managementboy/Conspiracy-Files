---
title: "alias"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/alias.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/alias.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="alias"></a>

<a id="scripts-alias"></a>

# alias

**Soft Override:** Unknown

**No comma:** True

Defines an alias for a list of tiles. This can be directly be refered to in [rule](rule.md) blocks to list a bunch of tiles in different blocks or to organize them by type. Say for example you can list all the trees in an alias to use later, or split by tree type to easily associate to a color.

Here is an example of how to use it:



```cpp
alias
{
    name = treez1
    tiles = [
        e_americanholly_1_3
        e_americanholly_1_2
        e_americanholly_1_1
        e_americanlinden_1_11
        e_americanlinden_1_10
        e_americanlinden_1_15
        e_americanlinden_1_14
        e_canadianhemlock_1_3
        e_canadianhemlock_1_2
        e_canadianhemlock_1_1
        e_carolinasilverbell_1_15
        e_carolinasilverbell_1_14
        e_cockspurhawthorn_1_15
        e_cockspurhawthorn_1_14
        e_cockspurhawthorn_1_13
        e_dogwood_1_15
        e_dogwood_1_14
        e_easternredbud_1_15
        e_easternredbud_1_14
        vegetation_trees_01_13
        vegetation_trees_01_14
        vegetation_trees_01_15
        vegetation_trees_01_8
        vegetation_trees_01_9
        vegetation_trees_01_10
        vegetation_trees_01_11
        vegetation_trees_01_17
    ]
}

rule
{
    label = General Trees
    bitmap = 1
    color = 139 156 68
    tiles = [
      treez1
    ]
    layer = 0_Vegetation
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-Rules](root_files/rules.md#scripts-root-rules)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-alias-name"></a>

### name

**Type:** string

No description provided.

<a id="scripts-alias-tiles"></a>

### tiles

**Type:** Unknown

No description provided.
