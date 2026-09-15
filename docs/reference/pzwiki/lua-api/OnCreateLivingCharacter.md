---
title: "OnCreateLivingCharacter"
source: "https://pzwiki.net/wiki/OnCreateLivingCharacter"
source_revision: "https://pzwiki.net/w/index.php?title=OnCreateLivingCharacter&oldid=1391493"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:28."
retrieved: "2026-09-15T11:42:24.694Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnCreateLivingCharacter

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnCreateLivingCharacter.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnCreateLivingCharacter

<a id="Description"></a>

## Description

Fires when an IsoPlayer or IsoSurvivor object is created.

<a id="Parameters"></a>

## Parameters

- character: IsoLivingCharacter (JavaDoc) - The character who was created.
- desc: SurvivorDesc (JavaDoc) - The character's descriptor.

<a id="Examples"></a>

## Examples



```text
local function OnCreateLivingCharacter(character, desc)
    -- your code here
end

Events.OnCreateLivingCharacter.Add(OnCreateLivingCharacter)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnCreateLivingCharacter&oldid=1391493](OnCreateLivingCharacter.md)"
