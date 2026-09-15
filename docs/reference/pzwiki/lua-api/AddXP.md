---
title: "AddXP"
source: "https://pzwiki.net/wiki/AddXP"
source_revision: "https://pzwiki.net/w/index.php?title=AddXP&oldid=1385089"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 00:48."
retrieved: "2026-09-15T11:42:17.625Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# AddXP

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](AddXP.md) (Create account)

<a id="Event"></a>

## Event

(Server) AddXP

<a id="Description"></a>

## Description

Fires after a character gains perk XP, except when the XP source specifically requested not to.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character who gained the XP.
- perk: PerkFactory.Perk (JavaDoc) - The perk XP was gained in.
- amount: number - The amount of XP gained. This is the final value after all modifiers.

<a id="Examples"></a>

## Examples



```text
local function AddXP(character, perk, amount)
    -- your code here
end

Events.AddXP.Add(AddXP)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=AddXP&oldid=1385089](AddXP.md)"
