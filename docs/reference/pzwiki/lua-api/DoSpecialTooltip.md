---
title: "DoSpecialTooltip"
source: "https://pzwiki.net/wiki/DoSpecialTooltip"
source_revision: "https://pzwiki.net/w/index.php?title=DoSpecialTooltip&oldid=1387801"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 01:56."
retrieved: "2026-09-15T11:42:18.054Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# DoSpecialTooltip

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](DoSpecialTooltip.md) (Create account)

<a id="Event"></a>

## Event

DoSpecialTooltip

<a id="Description"></a>

## Description

Fires when updating the tooltip of an IsoObject with a special tooltip. Used for hover-over information about plants.

<a id="Parameters"></a>

## Parameters

- tooltip: ObjectTooltip (JavaDoc) - Empty tooltip for the object.
- square: IsoGridSquare (JavaDoc) - Square of the object the tooltip is being updated for.

<a id="Examples"></a>

## Examples



```text
local function DoSpecialTooltip(tooltip, square)
    -- your code here
end

Events.DoSpecialTooltip.Add(DoSpecialTooltip)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=DoSpecialTooltip&oldid=1387801](DoSpecialTooltip.md)"
