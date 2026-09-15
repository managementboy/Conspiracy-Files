---
title: "LevelPerk"
source: "https://pzwiki.net/wiki/LevelPerk"
source_revision: "https://pzwiki.net/w/index.php?title=LevelPerk&oldid=1390193"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 02:56."
retrieved: "2026-09-15T11:42:19.754Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# LevelPerk

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](LevelPerk.md) (Create account)

<a id="Event"></a>

## Event

(Client) LevelPerk

<a id="Description"></a>

## Description

Fires after a local character gains or loses a perk level.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character whose perk level changed.
- perk: PerkFactory.Perk (JavaDoc) - The perk that changed level.
- level: integer - The new level of the perk.
- increased: boolean - True if the level increased, false if it decreased.

<a id="Examples"></a>

## Examples



```text
local function LevelPerk(character, perk, level, increased)
    -- your code here
end

Events.LevelPerk.Add(LevelPerk)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=LevelPerk&oldid=1390193](LevelPerk.md)"
