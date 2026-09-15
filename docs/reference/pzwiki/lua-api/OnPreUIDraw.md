---
title: "OnPreUIDraw"
source: "https://pzwiki.net/wiki/OnPreUIDraw"
source_revision: "https://pzwiki.net/w/index.php?title=OnPreUIDraw&oldid=1253385"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:00."
retrieved: "2026-09-15T11:42:52.005Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnPreUIDraw

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnPreUIDraw.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnPreUIDraw

<a id="Description"></a>

## Description

Fires before every UI render frame

<a id="Parameters"></a>

## Parameters

No parameters.

<a id="Examples"></a>

## Examples



```text
local function OnPreUIDraw()
    -- your code here
end

Events.OnPreUIDraw.Add(OnPreUIDraw)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnPreUIDraw&oldid=1253385](OnPreUIDraw.md)"
