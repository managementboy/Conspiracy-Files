---
title: "OnObjectAdded"
source: "https://pzwiki.net/wiki/OnObjectAdded"
source_revision: "https://pzwiki.net/w/index.php?title=OnObjectAdded&oldid=1391603"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:45.391Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnObjectAdded

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnObjectAdded.md) (Create account)

<a id="Event"></a>

## Event

OnObjectAdded

<a id="Description"></a>

## Description

Fires when an object is added to the world. Note: usually not called on the client, but is in some cases.

<a id="Parameters"></a>

## Parameters

- object: IsoObject (JavaDoc)

<a id="Examples"></a>

## Examples



```text
local function OnObjectAdded(object)
    -- your code here
end

Events.OnObjectAdded.Add(OnObjectAdded)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnObjectAdded&oldid=1391603](OnObjectAdded.md)"
