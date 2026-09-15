---
title: "MetaRecipe"
source: "https://pzwiki.net/wiki/MetaRecipe"
source_revision: "https://pzwiki.net/w/index.php?title=MetaRecipe&oldid=1252757"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:45."
retrieved: "2026-09-15T11:42:26.856Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# MetaRecipe

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](MetaRecipe.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`MetaRecipe` parameter is used to link two recipes so that if the meta recipe is known then the main recipe is known. The opposite however is not true, if the main recipe is known the meta recipe is not automatically known.

<a id="Example"></a>

## Example

In this example below, the recipe`MyRecipe1` will be known if the recipe`MyRecipe2` is known. However if the recipe`MyRecipe1` is known, the recipe`MyRecipe2` will not automatically be known and needs to be learnt.



```text
craftRecipe MyRecipe1
{
    ...
}

craftRecipe MyRecipe2
{
    ...
    metaRecipe = MyRecipe1,
    ...
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=MetaRecipe&oldid=1252757](MetaRecipe.md)"
