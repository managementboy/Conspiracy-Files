---
title: "OnKeyKeepPressed"
source: "https://pzwiki.net/wiki/OnKeyKeepPressed"
source_revision: "https://pzwiki.net/w/index.php?title=OnKeyKeepPressed&oldid=1391573"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:30."
retrieved: "2026-09-15T11:42:39.017Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnKeyKeepPressed

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnKeyKeepPressed.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnKeyKeepPressed

<a id="Description"></a>

## Description

Fires every frame while a key is held down.

<a id="Parameters"></a>

## Parameters

- key: integer - Key code of the key that was held.

<a id="Examples"></a>

## Examples



```text
local function OnKeyKeepPressed(key)
    -- your code here
end

Events.OnKeyKeepPressed.Add(OnKeyKeepPressed)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnKeyKeepPressed&oldid=1391573](OnKeyKeepPressed.md)"
