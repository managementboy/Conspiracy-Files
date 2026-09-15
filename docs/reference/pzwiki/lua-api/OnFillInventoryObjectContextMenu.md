---
title: "OnFillInventoryObjectContextMenu"
source: "https://pzwiki.net/wiki/OnFillInventoryObjectContextMenu"
source_revision: "https://pzwiki.net/w/index.php?title=OnFillInventoryObjectContextMenu&oldid=1391531"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:30.071Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnFillInventoryObjectContextMenu

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnFillInventoryObjectContextMenu.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnFillInventoryObjectContextMenu

<a id="Description"></a>

## Description

Fires after the context menu for an inventory item is filled.

<a id="Parameters"></a>

## Parameters

- playerNum: integer - The number of the player whose context menu has been filled.
- context: [ISContextMenu](ISContextMenu.md) - The context menu that was filled.
- items - The items that were selected to fill the context menu. If only full stacks are selected, a table of ContextMenuItemStacks is passed. Otherwise it is a table of InventoryItems.

- InventoryItem[]
- ContextMenuItemStack[]

<a id="Examples"></a>

## Examples



```text
local function OnFillInventoryObjectContextMenu(playerNum, context, items)
    -- your code here
end

Events.OnFillInventoryObjectContextMenu.Add(OnFillInventoryObjectContextMenu)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnFillInventoryObjectContextMenu&oldid=1391531](OnFillInventoryObjectContextMenu.md)"
