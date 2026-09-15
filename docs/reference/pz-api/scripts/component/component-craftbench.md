---
title: "component CraftBench"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/component/component-craftbench.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/component/component-craftbench.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="component-craftbench"></a>

<a id="scripts-component-craftbench"></a>

# component CraftBench

**Soft Override:** Unknown

**Is Variant of:** [component](../component.md#scripts-component)

Used to add a crafting bench property to an [entity](../entity.md) script, which can then be used in the tags parameter of a [craftRecipe](../craftrecipe.md) script to create a crafting bench tag.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [entity](../entity.md#scripts-entity)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-component-craftbench-recipes"></a>

### Recipes

**Type:** array (array of string, separator: ‘;’)

The tag name for this crafting bench to be used in the tags parameter of a [craftRecipe](../craftrecipe.md) script.
