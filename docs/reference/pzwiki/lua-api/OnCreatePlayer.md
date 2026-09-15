---
title: "OnCreatePlayer"
source: "https://pzwiki.net/wiki/OnCreatePlayer"
source_revision: "https://pzwiki.net/w/index.php?title=OnCreatePlayer&oldid=1477281"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:41."
retrieved: "2026-09-15T11:42:25.024Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnCreatePlayer

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnCreatePlayer.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

(Client) OnCreatePlayer

<a id="Description"></a>

## Description

Fires every time a local player loads into the world.

<a id="Parameters"></a>

## Parameters

- playerNum: integer - The player number of the newly-spawned character
- player: IsoPlayer (JavaDoc) - The new player object

<a id="Examples"></a>

## Examples



```text
local function OnCreatePlayer(playerNum, player)
    -- your code here
end

Events.OnCreatePlayer.Add(OnCreatePlayer)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnCreatePlayer&oldid=1477281](OnCreatePlayer.md)"
