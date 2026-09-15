---
title: "OnLoadedTileDefinitions"
source: "https://pzwiki.net/wiki/OnLoadedTileDefinitions"
source_revision: "https://pzwiki.net/w/index.php?title=OnLoadedTileDefinitions&oldid=1477265"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:36."
retrieved: "2026-09-15T11:42:40.024Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnLoadedTileDefinitions

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnLoadedTileDefinitions.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

OnLoadedTileDefinitions

<a id="Description"></a>

## Description

Fires after loading the tile definitions. This is the earliest event after [sandbox options](../scripts/Sandbox_options.md) are loaded.

<a id="Parameters"></a>

## Parameters

- spriteManager: IsoSpriteManager (JavaDoc) - The sprite manager.

<a id="Examples"></a>

## Examples



```text
local function OnLoadedTileDefinitions(spriteManager)
    -- your code here
end

Events.OnLoadedTileDefinitions.Add(OnLoadedTileDefinitions)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnLoadedTileDefinitions&oldid=1477265](OnLoadedTileDefinitions.md)"
