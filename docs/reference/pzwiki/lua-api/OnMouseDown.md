---
title: "OnMouseDown"
source: "https://pzwiki.net/wiki/OnMouseDown"
source_revision: "https://pzwiki.net/w/index.php?title=OnMouseDown&oldid=1391587"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:42.714Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnMouseDown

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnMouseDown.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnMouseDown

<a id="Description"></a>

## Description

Fires when the player left clicks, as long as the input isn't eaten by UI.

<a id="Parameters"></a>

## Parameters

- x: number - Screen X co-ordinate of the click.
- y: number - Screen Y co-ordinate of the click.

<a id="Examples"></a>

## Examples



```text
local function OnMouseDown(x, y)
    -- your code here
end

Events.OnMouseDown.Add(OnMouseDown)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnMouseDown&oldid=1391587](OnMouseDown.md)"
