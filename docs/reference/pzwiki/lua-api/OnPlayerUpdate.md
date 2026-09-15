---
title: "OnPlayerUpdate"
source: "https://pzwiki.net/wiki/OnPlayerUpdate"
source_revision: "https://pzwiki.net/w/index.php?title=OnPlayerUpdate&oldid=1391625"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:32."
retrieved: "2026-09-15T11:42:48.273Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnPlayerUpdate

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnPlayerUpdate.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnPlayerUpdate

<a id="Description"></a>

## Description

Fires during each local player's update (every tick).

<a id="Parameters"></a>

## Parameters

- player: IsoPlayer (JavaDoc) - The player being updated.

<a id="Examples"></a>

## Examples



```text
local function OnPlayerUpdate(player)
    -- your code here
end

Events.OnPlayerUpdate.Add(OnPlayerUpdate)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnPlayerUpdate&oldid=1391625](OnPlayerUpdate.md)"
