---
title: "OnGameBoot"
source: "https://pzwiki.net/wiki/OnGameBoot"
source_revision: "https://pzwiki.net/w/index.php?title=OnGameBoot&oldid=1477247"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:28."
retrieved: "2026-09-15T11:42:30.438Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnGameBoot

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnGameBoot.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

OnGameBoot

<a id="Description"></a>

## Description

Fires after the game finishes starting up. Note: For clients, lua files in lua/server/ will not have loaded by the time this event is fired. This does not apply to servers.

<a id="Parameters"></a>

## Parameters

No parameters.

<a id="Examples"></a>

## Examples



```text
local function OnGameBoot()
    -- your code here
end

Events.OnGameBoot.Add(OnGameBoot)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnGameBoot&oldid=1477247](OnGameBoot.md)"
