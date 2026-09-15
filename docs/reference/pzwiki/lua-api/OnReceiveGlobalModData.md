---
title: "OnReceiveGlobalModData"
source: "https://pzwiki.net/wiki/OnReceiveGlobalModData"
source_revision: "https://pzwiki.net/w/index.php?title=OnReceiveGlobalModData&oldid=1391645"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:32."
retrieved: "2026-09-15T11:42:52.679Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnReceiveGlobalModData

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnReceiveGlobalModData.md) (Create account)

<a id="Event"></a>

## Event

(Multiplayer only) OnReceiveGlobalModData

<a id="Description"></a>

## Description

Fires when receiving a global mod data table.

<a id="Parameters"></a>

## Parameters

- key: string - The key of the mod data table that was requested.
- data - The mod data table that was returned. False if there was no mod data table by that key.

- table
- false

<a id="Examples"></a>

## Examples



```text
local function OnReceiveGlobalModData(key, data)
    -- your code here
end

Events.OnReceiveGlobalModData.Add(OnReceiveGlobalModData)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnReceiveGlobalModData&oldid=1391645](OnReceiveGlobalModData.md)"
