---
title: "Fixing (scripts)"
source: "https://pzwiki.net/wiki/Fixing_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Fixing_(scripts)&oldid=1368643"
source_last_edited: "Last modified\n\t\t         This page was last edited on 22 May 2026, at 02:41."
retrieved: "2026-09-15T11:39:40.273Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 5
source_tables: 0
---

# Fixing (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version (41.78.19).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Fixing_scripts.md) (Create account)

<a id="Introduction"></a>

## Introduction

Fixing blocks are used to fix items in Project Zomboid. Example: repairing Wood Axe with different materials:



```text
fixing Fix Wood Axe
{
    Require : WoodAxe,

    Fixer : Woodglue=2; Woodwork=2,
    Fixer : DuctTape=2,
    Fixer : Glue=2,
    Fixer : Scotchtape=4,
}
```



**More about parameters:**

<a id="Required"></a>

### Required

Item to be repaired.



```text
Required : WoodAxe,
```



<a id="Fixer"></a>

### Fixer

This parameter specifies the material that will be used for repair and its quantity. Also, as an optional second parameter, you can specify the skill required for this type of repair. Example:



```text
Fixer : Woodglue=2; Woodwork=2,
Fixer : DuctTape=2,
Fixer : Nails,
```



Important - The first parameter is the material, the second parameter (if required) is the skill.

Skill List: Axe, Blunt, SmallBlunt, LongBlade, SmallBlade, Spear, Maintenance, Aiming, Reloading, Woodwork, Cooking, Farming, Doctor, Electricity, MetalWelding, Mechanics, Tailoring, Fishing, Trapping, PlantScavenging, Fitness, Strength, Sprinting, Lightfoot , Nimble, Sneak

<a id="GlobalItem"></a>

### GlobalItem

An additional item that is needed to repair the item (to be used)



```text
GlobalItem : DuctTape=3,
```



<a id="ConditionModifier"></a>

### ConditionModifier

Item repair percentage modifier.



```text
ConditionModifier : 0.3,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Fixing_(scripts)&oldid=1368643](Fixing_scripts.md)"
