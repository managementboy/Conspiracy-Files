---
title: "OnFillContainer"
source: "https://pzwiki.net/wiki/OnFillContainer"
source_revision: "https://pzwiki.net/w/index.php?title=OnFillContainer&oldid=1391529"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:29.790Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnFillContainer

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnFillContainer.md) (Create account)

<a id="Event"></a>

## Event

(Server) OnFillContainer

<a id="Description"></a>

## Description

Fires whenever a container is first filled with loot, or when loot respawns. Never fires for corpses.

<a id="Parameters"></a>

## Parameters

- roomType: string - Distribution type of the room the container is in, or the type of the vehicle.
- containerType: string - The type of the container that was filled.
- container: ItemContainer (JavaDoc) - The container that was filled.

<a id="Examples"></a>

## Examples



```text
local function OnFillContainer(roomType, containerType, container)
    -- your code here
end

Events.OnFillContainer.Add(OnFillContainer)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnFillContainer&oldid=1391529](OnFillContainer.md)"
