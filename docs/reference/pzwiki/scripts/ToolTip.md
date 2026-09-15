---
title: "ToolTip"
source: "https://pzwiki.net/wiki/ToolTip"
source_revision: "https://pzwiki.net/w/index.php?title=ToolTip&oldid=1366043"
source_last_edited: "Last modified\n\t\t         This page was last edited on 16 May 2026, at 15:06."
retrieved: "2026-09-15T11:42:28.850Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# ToolTip

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.18.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](ToolTip.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`Tooltip` parameter is used to define the description of the recipe. This parameter will refer to a translation key in the translation files (see [Translation](../translations/Translation.md)). It is important to note the casing of the Tooltip parameter and the syntax of the translation file. As of Build 42.15.0, the translation files are`.json` files and should be formatted as`.json` key-value pairs.

<a id="Example"></a>

## Example



```text
Tooltip = Tooltip_Recipe_MyRecipe,
```



And in the translation file:



```text
{
    "Tooltip_Recipe_MyRecipe" : "This is a description of my recipe"
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=ToolTip&oldid=1366043](ToolTip.md)"
