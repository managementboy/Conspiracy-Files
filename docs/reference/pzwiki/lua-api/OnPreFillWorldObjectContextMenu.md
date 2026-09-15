---
title: "OnPreFillWorldObjectContextMenu"
source: "https://pzwiki.net/wiki/OnPreFillWorldObjectContextMenu"
source_revision: "https://pzwiki.net/w/index.php?title=OnPreFillWorldObjectContextMenu&oldid=1391633"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:32."
retrieved: "2026-09-15T11:42:50.491Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnPreFillWorldObjectContextMenu

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnPreFillWorldObjectContextMenu.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnPreFillWorldObjectContextMenu

<a id="Description"></a>

## Description

Fires after the world context menu is created, before it is filled.

<a id="Parameters"></a>

## Parameters

- playerIndex: integer - The number of the player whose context menu has been created.
- context: [ISContextMenu](ISContextMenu.md) - The context menu that was created.
- worldobjects: IsoObject[] (JavaDoc) - The objects that were selected.
- test: boolean - Whether the context menu was created to test for interactive objects on the square. If true, the context menu will not actually be displayed.

<a id="Examples"></a>

## Examples



```text
local function OnPreFillWorldObjectContextMenu(playerIndex, context, worldobjects, test)
    -- your code here
end

Events.OnPreFillWorldObjectContextMenu.Add(OnPreFillWorldObjectContextMenu)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnPreFillWorldObjectContextMenu&oldid=1391633](OnPreFillWorldObjectContextMenu.md)"
