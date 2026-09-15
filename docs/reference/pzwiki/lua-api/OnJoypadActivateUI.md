---
title: "OnJoypadActivateUI"
source: "https://pzwiki.net/wiki/OnJoypadActivateUI"
source_revision: "https://pzwiki.net/w/index.php?title=OnJoypadActivateUI&oldid=1391563"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:30."
retrieved: "2026-09-15T11:42:37.049Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnJoypadActivateUI

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnJoypadActivateUI.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnJoypadActivateUI

<a id="Description"></a>

## Description

Fires whenever a controller starts being used outside of gameplay, such as on the main menu.

<a id="Parameters"></a>

## Parameters

- joypadId: integer - ID of the joypad.

<a id="Examples"></a>

## Examples



```text
local function OnJoypadActivateUI(joypadId)
    -- your code here
end

Events.OnJoypadActivateUI.Add(OnJoypadActivateUI)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnJoypadActivateUI&oldid=1391563](OnJoypadActivateUI.md)"
