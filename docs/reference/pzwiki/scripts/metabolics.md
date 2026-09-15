---
title: "metabolics"
source: "https://pzwiki.net/wiki/Metabolics"
source_revision: "https://pzwiki.net/w/index.php?title=Metabolics&oldid=1252759"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:45."
retrieved: "2026-09-15T11:42:24.139Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 1
---

# metabolics

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](metabolics.md) (Create account)

Main article: [timedAction (scripts)](timedAction_scripts.md)

The`metabolics` parameter is used to define the impact of the action on the player character's metabolics, such as the calories burn rate or body heat generation. It uses predefined enumeration values to specify the multiplier on the metabolism.

To use the metabolics in a timed action, use the following format:



```text
metabolics = <metabolics value>,
```



<a id="Available_values"></a>

## Available values

Below are each values available alongside their respective multiplier on the metabolism:

| Value | Multiplier |
| --- | --- |
|`Sleeping` | 0.8 |
|`SeatedResting` | 1.0 |
|`StandingAtRest` | 1.2 |
|`SedentaryActivity` | 1.2 |
|`Default` | 1.6 |
|`DrivingCar` | 1.4 |
|`LightDomestic` | 1.9 |
|`HeavyDomestic` | 2.9 |
|`DefaultExercise` | 3.0 |
|`UsingTools` | 3.4 |
|`LightWork` | 4.3 |
|`MediumWork` | 5.4 |
|`DiggingSpade` | 6.5 |
|`HeavyWork` | 7.0 |
|`ForestryAxe` | 8.5 |
|`Walking2kmh` | 1.9 |
|`Walking5kmh` | 3.1 |
|`Running10kmh` | 6.5 |
|`Running15kmh` | 9.5 |
|`JumpFence` | 4.0 |
|`ClimbRope` | 8.0 |
|`Fitness` | 6.0 |
|`FitnessHeavy` | 9.0 |
|`MAX` | 10.3 |

![Article illustration](../assets/73c8ffc1fdd2bf2be94e.png)

These values were retrieved from the decompiled game code

**Source:**`ProjectZomboid\zombie\character\BodyDamage\Metabolics.java`

**Retrieved**: Build 42.8.1



```text
public enum Metabolics {
    Sleeping(0.8F),
    SeatedResting(1.0F),
    StandingAtRest(1.2F),
    SedentaryActivity(1.2F),
    Default(1.6F),
    DrivingCar(1.4F),
    LightDomestic(1.9F),
    HeavyDomestic(2.9F),
    DefaultExercise(3.0F),
    UsingTools(3.4F),
    LightWork(4.3F),
    MediumWork(5.4F),
    DiggingSpade(6.5F),
    HeavyWork(7.0F),
    ForestryAxe(8.5F),
    Walking2kmh(1.9F),
    Walking5kmh(3.1F),
    Running10kmh(6.5F),
    Running15kmh(9.5F),
    JumpFence(4.0F),
    ClimbRope(8.0F),
    Fitness(6.0F),
    FitnessHeavy(9.0F),
    MAX(10.3F);
```



<a id="Example"></a>

## Example



```text
metabolics = HeavyWork,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Metabolics&oldid=1252759](metabolics.md)"
