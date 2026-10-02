[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.skills](package-summary.html)
2. [PerkFactory](PerkFactory.html)
3. [Perks](PerkFactory.Perks.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [None](#None)
   2. [Agility](#Agility)
   3. [Cooking](#Cooking)
   4. [Melee](#Melee)
   5. [Crafting](#Crafting)
   6. [Fitness](#Fitness)
   7. [Strength](#Strength)
   8. [Blunt](#Blunt)
   9. [Axe](#Axe)
   10. [Lightfoot](#Lightfoot)
   11. [Nimble](#Nimble)
   12. [Sprinting](#Sprinting)
   13. [Sneak](#Sneak)
   14. [Woodwork](#Woodwork)
   15. [Aiming](#Aiming)
   16. [Reloading](#Reloading)
   17. [Farming](#Farming)
   18. [Survivalist](#Survivalist)
   19. [Fishing](#Fishing)
   20. [Trapping](#Trapping)
   21. [Passiv](#Passiv)
   22. [Firearm](#Firearm)
   23. [PlantScavenging](#PlantScavenging)
   24. [Doctor](#Doctor)
   25. [Electricity](#Electricity)
   26. [Blacksmith](#Blacksmith)
   27. [MetalWelding](#MetalWelding)
   28. [Melting](#Melting)
   29. [Mechanics](#Mechanics)
   30. [Spear](#Spear)
   31. [Maintenance](#Maintenance)
   32. [SmallBlade](#SmallBlade)
   33. [LongBlade](#LongBlade)
   34. [SmallBlunt](#SmallBlunt)
   35. [Combat](#Combat)
   36. [Tailoring](#Tailoring)
   37. [Tracking](#Tracking)
   38. [Husbandry](#Husbandry)
   39. [FlintKnapping](#FlintKnapping)
   40. [Masonry](#Masonry)
   41. [Pottery](#Pottery)
   42. [Carving](#Carving)
   43. [Butchering](#Butchering)
   44. [Glassmaking](#Glassmaking)
   45. [FarmingCategory](#FarmingCategory)
   46. [PhysicalCategory](#PhysicalCategory)
   47. [MAX](#MAX)
6. [Constructor Details](#constructor-detail)
   1. [Perks()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getMaxIndex()](#getMaxIndex())
   2. [fromIndex(int)](#fromIndex(int))
   3. [FromString(String)](#FromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PerkFactory.Perks
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.skills.PerkFactory.Perks

Enclosing class:
:   `PerkFactory`

---

public static final class PerkFactory.Perks
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final PerkFactory.Perk`

  `Agility`

  `static final PerkFactory.Perk`

  `Aiming`

  `static final PerkFactory.Perk`

  `Axe`

  `static final PerkFactory.Perk`

  `Blacksmith`

  `static final PerkFactory.Perk`

  `Blunt`

  `static final PerkFactory.Perk`

  `Butchering`

  `static final PerkFactory.Perk`

  `Carving`

  `static final PerkFactory.Perk`

  `Combat`

  `static final PerkFactory.Perk`

  `Cooking`

  `static final PerkFactory.Perk`

  `Crafting`

  `static final PerkFactory.Perk`

  `Doctor`

  `static final PerkFactory.Perk`

  `Electricity`

  `static final PerkFactory.Perk`

  `Farming`

  `static final PerkFactory.Perk`

  `FarmingCategory`

  `static final PerkFactory.Perk`

  `Firearm`

  `static final PerkFactory.Perk`

  `Fishing`

  `static final PerkFactory.Perk`

  `Fitness`

  `static final PerkFactory.Perk`

  `FlintKnapping`

  `static final PerkFactory.Perk`

  `Glassmaking`

  `static final PerkFactory.Perk`

  `Husbandry`

  `static final PerkFactory.Perk`

  `Lightfoot`

  `static final PerkFactory.Perk`

  `LongBlade`

  `static final PerkFactory.Perk`

  `Maintenance`

  `static final PerkFactory.Perk`

  `Masonry`

  `static final PerkFactory.Perk`

  `MAX`

  `static final PerkFactory.Perk`

  `Mechanics`

  `static final PerkFactory.Perk`

  `Melee`

  `static final PerkFactory.Perk`

  `Melting`

  `static final PerkFactory.Perk`

  `MetalWelding`

  `static final PerkFactory.Perk`

  `Nimble`

  `static final PerkFactory.Perk`

  `None`

  `static final PerkFactory.Perk`

  `Passiv`

  `static final PerkFactory.Perk`

  `PhysicalCategory`

  `static final PerkFactory.Perk`

  `PlantScavenging`

  `static final PerkFactory.Perk`

  `Pottery`

  `static final PerkFactory.Perk`

  `Reloading`

  `static final PerkFactory.Perk`

  `SmallBlade`

  `static final PerkFactory.Perk`

  `SmallBlunt`

  `static final PerkFactory.Perk`

  `Sneak`

  `static final PerkFactory.Perk`

  `Spear`

  `static final PerkFactory.Perk`

  `Sprinting`

  `static final PerkFactory.Perk`

  `Strength`

  `static final PerkFactory.Perk`

  `Survivalist`

  `static final PerkFactory.Perk`

  `Tailoring`

  `static final PerkFactory.Perk`

  `Tracking`

  `static final PerkFactory.Perk`

  `Trapping`

  `static final PerkFactory.Perk`

  `Woodwork`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Perks()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static PerkFactory.Perk`

  `fromIndex(int value)`

  `static PerkFactory.Perk`

  `FromString(String id)`

  `static int`

  `getMaxIndex()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### None

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") None
  + ### Agility

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Agility
  + ### Cooking

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Cooking
  + ### Melee

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Melee
  + ### Crafting

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Crafting
  + ### Fitness

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Fitness
  + ### Strength

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Strength
  + ### Blunt

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Blunt
  + ### Axe

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Axe
  + ### Lightfoot

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Lightfoot
  + ### Nimble

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Nimble
  + ### Sprinting

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Sprinting
  + ### Sneak

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Sneak
  + ### Woodwork

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Woodwork
  + ### Aiming

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Aiming
  + ### Reloading

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Reloading
  + ### Farming

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Farming
  + ### Survivalist

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Survivalist
  + ### Fishing

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Fishing
  + ### Trapping

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Trapping
  + ### Passiv

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Passiv
  + ### Firearm

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Firearm
  + ### PlantScavenging

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") PlantScavenging
  + ### Doctor

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Doctor
  + ### Electricity

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Electricity
  + ### Blacksmith

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Blacksmith
  + ### MetalWelding

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") MetalWelding
  + ### Melting

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Melting
  + ### Mechanics

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Mechanics
  + ### Spear

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Spear
  + ### Maintenance

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Maintenance
  + ### SmallBlade

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") SmallBlade
  + ### LongBlade

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") LongBlade
  + ### SmallBlunt

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") SmallBlunt
  + ### Combat

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Combat
  + ### Tailoring

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Tailoring
  + ### Tracking

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Tracking
  + ### Husbandry

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Husbandry
  + ### FlintKnapping

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") FlintKnapping
  + ### Masonry

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Masonry
  + ### Pottery

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Pottery
  + ### Carving

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Carving
  + ### Butchering

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Butchering
  + ### Glassmaking

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") Glassmaking
  + ### FarmingCategory

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") FarmingCategory
  + ### PhysicalCategory

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") PhysicalCategory
  + ### MAX

    public static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") MAX
* Constructor Details
  -------------------

  + ### Perks

    public Perks()
* Method Details
  --------------

  + ### getMaxIndex

    public static int getMaxIndex()
  + ### fromIndex

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") fromIndex(int value)
  + ### FromString

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)