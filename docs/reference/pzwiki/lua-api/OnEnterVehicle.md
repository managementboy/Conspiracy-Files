---
title: "OnEnterVehicle"
source: "https://pzwiki.net/wiki/OnEnterVehicle"
source_revision: "https://pzwiki.net/w/index.php?title=OnEnterVehicle&oldid=1391521"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:28.729Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnEnterVehicle

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnEnterVehicle.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnEnterVehicle

<a id="Description"></a>

## Description

Fires when a character enters a vehicle.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character that entered the vehicle.

<a id="Examples"></a>

## Examples



```text
local function OnEnterVehicle(character)
    -- your code here
end

Events.OnEnterVehicle.Add(OnEnterVehicle)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnEnterVehicle&oldid=1391521](OnEnterVehicle.md)"
