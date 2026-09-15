---
title: "OnMouseMove"
source: "https://pzwiki.net/wiki/OnMouseMove"
source_revision: "https://pzwiki.net/w/index.php?title=OnMouseMove&oldid=1391589"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:43.073Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnMouseMove

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnMouseMove.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnMouseMove

<a id="Description"></a>

## Description

Fires every frame, unless mouse movement is eaten by something else.

<a id="Parameters"></a>

## Parameters

- x: integer - Screen X co-ordinate of the click.
- y: integer - Screen Y co-ordinate of the click.
- xMultiplied: integer - Screen X co-ordinate of the click multiplied by zoom level.
- yMultiplied: integer - Screen Y co-ordinate of the click multiplied by zoom level.

<a id="Examples"></a>

## Examples



```text
local function OnMouseMove(x, y, xMultiplied, yMultiplied)
    -- your code here
end

Events.OnMouseMove.Add(OnMouseMove)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnMouseMove&oldid=1391589](OnMouseMove.md)"
