---
title: "OnPressReloadButton"
source: "https://pzwiki.net/wiki/OnPressReloadButton"
source_revision: "https://pzwiki.net/w/index.php?title=OnPressReloadButton&oldid=1391637"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:32."
retrieved: "2026-09-15T11:42:51.259Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnPressReloadButton

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnPressReloadButton.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnPressReloadButton

<a id="Description"></a>

## Description

Fires when a local player has a gun and presses the button to reload it.

<a id="Parameters"></a>

## Parameters

- player: IsoPlayer (JavaDoc) - The player attempting to reload.
- weapon: HandWeapon (JavaDoc) - The weapon they are attempting to reload.

<a id="Examples"></a>

## Examples



```text
local function OnPressReloadButton(player, weapon)
    -- your code here
end

Events.OnPressReloadButton.Add(OnPressReloadButton)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnPressReloadButton&oldid=1391637](OnPressReloadButton.md)"
