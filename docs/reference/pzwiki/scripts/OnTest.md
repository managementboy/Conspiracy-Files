---
title: "OnTest"
source: "https://pzwiki.net/wiki/OnTest"
source_revision: "https://pzwiki.net/w/index.php?title=OnTest&oldid=1253559"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:03."
retrieved: "2026-09-15T11:42:27.983Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# OnTest

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnTest.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`OnTest` parameter is used to define a Lua function that will be called to verify if the recipe can be crafted. If the function returns`true`, the recipe can be crafted but if the function returns`false`, the recipe cannot be crafted. The function should be [global](../lua-api/Lua_language.md#Local_and_global) and defined in a Lua file. Vanilla puts its global crafting functions inside the file`media/lua/server/recipecode.lua` however make sure to define your custom functions in a uniquely named file.

The function should have the following structure:



```text
function MyOnTestFunction(item, result)
    -- your custom code here
    return logicTestResult  -- based on your logic test above
end
```



<a id="Example"></a>

## Example



```text
OnTest = Recipe.OnTest.OnlyBrokenSaw,
```



**Source:**`ProjectZomboid\media\lua\server\recipecode.lua`

**Retrieved**: Build 42.5.1



```text
function Recipe.OnTest.OnlyBrokenSaw (sourceItem, result)
    if sourceItem:hasTag("Saw") then return true end
	return not sourceItem:isBroken()
end
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnTest&oldid=1253559](OnTest.md)"
