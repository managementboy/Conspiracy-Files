---
title: "OnDeviceText"
source: "https://pzwiki.net/wiki/OnDeviceText"
source_revision: "https://pzwiki.net/w/index.php?title=OnDeviceText&oldid=1391509"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:26.804Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnDeviceText

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnDeviceText.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnDeviceText

<a id="Description"></a>

## Description

Fires whenever a radio displays text.

<a id="Parameters"></a>

## Parameters

- guid: string - GUID of the line being displayed.
- codes: string - Codes of the line being displayed. These typically contain perk/stat changes, but can be used to associate any arbitrary data with a line.
- x: number - World X co-ordinate where the line is being displayed.
- y: number - World Y co-ordinate where the line is being displayed.
- z: number - World Z co-ordinate where the line is being displayed.
- text: string - The displayed, translated text of the line.
- device: WaveSignalDevice (JavaDoc) - The device playing the line.

<a id="Examples"></a>

## Examples



```text
local function OnDeviceText(guid, codes, x, y, z, text, device)
    -- your code here
end

Events.OnDeviceText.Add(OnDeviceText)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnDeviceText&oldid=1391509](OnDeviceText.md)"
