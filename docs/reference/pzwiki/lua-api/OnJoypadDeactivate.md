---
title: "OnJoypadDeactivate"
source: "https://pzwiki.net/wiki/OnJoypadDeactivate"
source_revision: "https://pzwiki.net/w/index.php?title=OnJoypadDeactivate&oldid=1391569"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:30."
retrieved: "2026-09-15T11:42:38.188Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnJoypadDeactivate

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnJoypadDeactivate.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnJoypadDeactivate

<a id="Description"></a>

## Description

Fires after a controller has been disconnected.

<a id="Parameters"></a>

## Parameters

- joypadId: integer - ID of the joypad.

<a id="Examples"></a>

## Examples



```text
local function OnJoypadDeactivate(joypadId)
    -- your code here
end

Events.OnJoypadDeactivate.Add(OnJoypadDeactivate)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnJoypadDeactivate&oldid=1391569](OnJoypadDeactivate.md)"
