---
title: "fluid (scripts)"
source: "https://pzwiki.net/wiki/Fluid_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Fluid_(scripts)&oldid=1442311"
source_last_edited: "Last modified\n\t\t         This page was last edited on 13 July 2026, at 17:01."
retrieved: "2026-09-15T11:39:41.665Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# fluid (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](fluid_scripts.md) (Create account)

fluid

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module

[Children blocks](Scripts.md#Children_blocks)

BlendWhiteList
Poison
Categories
BlendBlackList
Properties

[ID](Scripts.md#ID)

Any

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about script blocks defining fluids in-game and how to create a custom fluid. For in-game fluids, see Fluid.

Create a new fluid definition. Different properties can be provided for the fluid v ia the use of different children blocks:

- Properties is used to indicate the various stats change that drinking this fluid would cause to the player.
- Categories act as tags for the fluid, to easily identify it.
- BlendWhiteList and BlendBlackList are used to provide rules for the blending of this fluid with other fluids.
- Poison is used to define poison properties for the fluid.

<a id="Parameters"></a>

## Parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Example"></a>

## Example



```text
fluid Test
    {
        Color           = 1.000 : 0.894 : 0.769, , -- The color value here must be an RGB01 value ( Decimal ranges from 0 to 1. Alpha (transparency) input is not supported.
        ColorReference  = Red, -- You can also use a plaintext color reference.
        DisplayName     = FLUID_TEST,

        Categories
        {

            Beverage,
            Industrial,
        }

        -- Optional stuff:

        -- reference a filter script:
        BlendWhiteList  = MyFluidFilter,
        BlendBlackList  = MyFluidFilter,

        BlendWhiteList -- You can define whether this fluid can or cannot be blended with others.
        {
            whitelist = true,
            fluids
            {
                Water,
            }
            categories
            {
                Beverage,
            }
        }

        Properties
        {
            fatigueChange           = 0,
            hungerChange            = 0,
            stressChange            = 0,
            thirstChange            = 0,
            unhappyChange           = 0,
            calories                = 0,
            carbohydrates           = 0,
            lipids                  = 0,
            proteins                = 0,
            alcohol                 = 0,
            fluReduction            = 0,
            painReduction           = 0,
            enduranceChange         = 0,
            foodSicknessChange      = 0,
        }

        Poison
        {
            maxEffect       = None, -- Acceptable values: None, Low(Unconfirmed/Untested), Medium, Extreme, Deadly,
            minAmount       = 0, -- Minimum poison effect. Any decimal value from 0 to 1.0
            diluteRatio     = 0, -- The ratio of this poison and how diluted it becomes when added to other fluids.
        }

    }
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Fluid_(scripts)&oldid=1442311](fluid_scripts.md)"
