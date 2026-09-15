---
title: "OnInitGlobalModData"
source: "https://pzwiki.net/wiki/OnInitGlobalModData"
source_revision: "https://pzwiki.net/w/index.php?title=OnInitGlobalModData&oldid=1477263"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:35."
retrieved: "2026-09-15T11:42:33.969Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnInitGlobalModData

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnInitGlobalModData.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

OnInitGlobalModData

<a id="Description"></a>

## Description

Fires when GlobalModData is initialised.

<a id="Parameters"></a>

## Parameters

- newGame: boolean - True if this is the first time the save has started.

<a id="Examples"></a>

## Examples



```text
local function OnInitGlobalModData(newGame)
    -- your code here
end

Events.OnInitGlobalModData.Add(OnInitGlobalModData)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnInitGlobalModData&oldid=1477263](OnInitGlobalModData.md)"
