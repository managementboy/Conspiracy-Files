---
title: "OnMouseUp"
source: "https://pzwiki.net/wiki/OnMouseUp"
source_revision: "https://pzwiki.net/w/index.php?title=OnMouseUp&oldid=1391591"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:43.410Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnMouseUp

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnMouseUp.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnMouseUp

<a id="Description"></a>

## Description

Fires whenever the player releases the left mouse button, unless the input is eaten by UI.

<a id="Parameters"></a>

## Parameters

- x: number - Screen X co-ordinate of the click.
- y: number - Screen Y co-ordinate of the click.

<a id="Examples"></a>

## Examples



```text
local function OnMouseUp(x, y)
    -- your code here
end

Events.OnMouseUp.Add(OnMouseUp)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnMouseUp&oldid=1391591](OnMouseUp.md)"
