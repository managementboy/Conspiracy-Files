---
title: "OnGetTableResult"
source: "https://pzwiki.net/wiki/OnGetTableResult"
source_revision: "https://pzwiki.net/w/index.php?title=OnGetTableResult&oldid=1391545"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:30."
retrieved: "2026-09-15T11:42:32.821Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnGetTableResult

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnGetTableResult.md) (Create account)

<a id="Event"></a>

## Event

(Multiplayer only) (Client) OnGetTableResult

<a id="Description"></a>

## Description

Fires when receiving a database table query result from the server.

<a id="Parameters"></a>

## Parameters

- data: ArrayList<DBResult>
- rowId: integer
- tableName: string

<a id="Examples"></a>

## Examples



```text
local function OnGetTableResult(data, rowId, tableName)
    -- your code here
end

Events.OnGetTableResult.Add(OnGetTableResult)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnGetTableResult&oldid=1391545](OnGetTableResult.md)"
