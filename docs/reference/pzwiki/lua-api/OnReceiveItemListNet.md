---
title: "OnReceiveItemListNet"
source: "https://pzwiki.net/wiki/OnReceiveItemListNet"
source_revision: "https://pzwiki.net/w/index.php?title=OnReceiveItemListNet&oldid=1391647"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:32."
retrieved: "2026-09-15T11:42:53.107Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnReceiveItemListNet

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnReceiveItemListNet.md) (Create account)

<a id="Event"></a>

## Event

(Multiplayer only) OnReceiveItemListNet

<a id="Description"></a>

## Description

Fires when receiving a list of items sent with sendItemListNet. This is not used by vanilla, it is provided for mods to use. Item lists sent by clients cannot be longer than 50 items and all of the items must be in the player's inventory.

<a id="Parameters"></a>

## Parameters

- sender: IsoPlayer? - The player who sent the item list. Nil if it was sent by the server.
- items: ArrayList<InventoryItem> - The list of items.
- receiver: IsoPlayer? - The specific local player the list was sent to. Nil if it was sent by a client to the server, or by the server to all clients.
- transferID: string - Arbitrary string associated with the message. Defaults to -1 if none was given.
- custom: string? - Arbitrary string associated with the message. Nil if none was given.

<a id="Examples"></a>

## Examples



```text
local function OnReceiveItemListNet(sender, items, receiver, transferID, custom)
    -- your code here
end

Events.OnReceiveItemListNet.Add(OnReceiveItemListNet)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnReceiveItemListNet&oldid=1391647](OnReceiveItemListNet.md)"
