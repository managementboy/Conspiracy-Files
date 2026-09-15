---
title: "AcceptedTrade"
source: "https://pzwiki.net/wiki/AcceptedTrade"
source_revision: "https://pzwiki.net/w/index.php?title=AcceptedTrade&oldid=1385077"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 00:48."
retrieved: "2026-09-15T11:42:17.270Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# AcceptedTrade

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](AcceptedTrade.md) (Create account)

<a id="Event"></a>

## Event

(Multiplayer only) (Client) AcceptedTrade

<a id="Description"></a>

## Description

Fires when the other player in the client's current trade accepts or declines the trade.

<a id="Parameters"></a>

## Parameters

- accepted: boolean - Whether the trade was accepted.

<a id="Examples"></a>

## Examples



```text
local function AcceptedTrade(accepted)
    -- your code here
end

Events.AcceptedTrade.Add(AcceptedTrade)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=AcceptedTrade&oldid=1385077](AcceptedTrade.md)"
