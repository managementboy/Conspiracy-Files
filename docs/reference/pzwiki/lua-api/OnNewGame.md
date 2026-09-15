---
title: "OnNewGame"
source: "https://pzwiki.net/wiki/OnNewGame"
source_revision: "https://pzwiki.net/w/index.php?title=OnNewGame&oldid=1477273"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:39."
retrieved: "2026-09-15T11:42:44.605Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnNewGame

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnNewGame.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

(Client) OnNewGame

<a id="Description"></a>

## Description

Fires whenever a local player character is created for the first time.

<a id="Parameters"></a>

## Parameters

- player: IsoPlayer (JavaDoc) - The character that was created.
- square: IsoGridSquare (JavaDoc) - The square the character spawned on.

<a id="Examples"></a>

## Examples



```text
local function OnNewGame(player, square)
    -- your code here
end

Events.OnNewGame.Add(OnNewGame)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnNewGame&oldid=1477273](OnNewGame.md)"
