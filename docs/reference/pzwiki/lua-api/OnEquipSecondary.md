---
title: "OnEquipSecondary"
source: "https://pzwiki.net/wiki/OnEquipSecondary"
source_revision: "https://pzwiki.net/w/index.php?title=OnEquipSecondary&oldid=1391525"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:29.082Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnEquipSecondary

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnEquipSecondary.md) (Create account)

<a id="Event"></a>

## Event

OnEquipSecondary

<a id="Description"></a>

## Description

Fires when a character equips a new item in their secondary slot.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character that equipped the item.
- item: InventoryItem (JavaDoc) - The item that was equipped.

<a id="Examples"></a>

## Examples



```text
local function OnEquipSecondary(character, item)
    -- your code here
end

Events.OnEquipSecondary.Add(OnEquipSecondary)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnEquipSecondary&oldid=1391525](OnEquipSecondary.md)"
