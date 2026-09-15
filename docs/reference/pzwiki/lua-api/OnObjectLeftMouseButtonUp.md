---
title: "OnObjectLeftMouseButtonUp"
source: "https://pzwiki.net/wiki/OnObjectLeftMouseButtonUp"
source_revision: "https://pzwiki.net/w/index.php?title=OnObjectLeftMouseButtonUp&oldid=1391609"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:46.462Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnObjectLeftMouseButtonUp

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnObjectLeftMouseButtonUp.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnObjectLeftMouseButtonUp

<a id="Description"></a>

## Description

Fires when the player releases left click on a world object.

<a id="Parameters"></a>

## Parameters

- object: IsoObject (JavaDoc) - The object that was clicked.
- x: number - Screen X co-ordinate of the click.
- y: number - Screen Y co-ordinate of the click.

<a id="Examples"></a>

## Examples



```text
local function OnObjectLeftMouseButtonUp(object, x, y)
    -- your code here
end

Events.OnObjectLeftMouseButtonUp.Add(OnObjectLeftMouseButtonUp)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnObjectLeftMouseButtonUp&oldid=1391609](OnObjectLeftMouseButtonUp.md)"
