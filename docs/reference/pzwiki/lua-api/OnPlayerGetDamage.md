---
title: "OnPlayerGetDamage"
source: "https://pzwiki.net/wiki/OnPlayerGetDamage"
source_revision: "https://pzwiki.net/w/index.php?title=OnPlayerGetDamage&oldid=1391621"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:47.592Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnPlayerGetDamage

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnPlayerGetDamage.md) (Create account)

<a id="Event"></a>

## Event

OnPlayerGetDamage

<a id="Description"></a>

## Description

Fires every time a local player takes damage. Bleeding bodyparts fire the event once per frame each. It also fires when zombies are hit by weapons: this is the only case in which the event fires on the server.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character who took damage.
- damageType - The type of damage the character took.

- "POISON"
- "HUNGRY"
- "SICK"
- "BLEEDING"
- "THIRST"
- "HEAVYLOAD"
- "INFECTION"
- "LOWWEIGHT"
- "FALLDOWN"
- "WEAPONHIT"
- "CARHITDAMAGE"
- "CARCRASHDAMAGE"
- damage: number - The damage that was taken.

<a id="Examples"></a>

## Examples



```text
local function OnPlayerGetDamage(character, damageType, damage)
    -- your code here
end

Events.OnPlayerGetDamage.Add(OnPlayerGetDamage)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnPlayerGetDamage&oldid=1391621](OnPlayerGetDamage.md)"
