---
title: "OnCustomUIKeyPressed"
source: "https://pzwiki.net/wiki/OnCustomUIKeyPressed"
source_revision: "https://pzwiki.net/w/index.php?title=OnCustomUIKeyPressed&oldid=1391501"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:28."
retrieved: "2026-09-15T11:42:26.047Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnCustomUIKeyPressed

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnCustomUIKeyPressed.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnCustomUIKeyPressed

<a id="Description"></a>

## Description

Fires when a key that is not used by vanilla UI is pressed.

<a id="Parameters"></a>

## Parameters

- key: integer - Key code of the key that was pressed.

<a id="Examples"></a>

## Examples



```text
local function OnCustomUIKeyPressed(key)
    -- your code here
end

Events.OnCustomUIKeyPressed.Add(OnCustomUIKeyPressed)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnCustomUIKeyPressed&oldid=1391501](OnCustomUIKeyPressed.md)"
