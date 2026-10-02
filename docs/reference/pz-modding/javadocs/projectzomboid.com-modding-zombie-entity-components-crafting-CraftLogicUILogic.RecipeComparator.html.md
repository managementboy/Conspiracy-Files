[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftLogicUILogic](CraftLogicUILogic.html)
3. [RecipeComparator](CraftLogicUILogic.RecipeComparator.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [player](#player)
   2. [compareMode](#compareMode)
7. [Constructor Details](#constructor-detail)
   1. [RecipeComparator(IsoPlayer)](#%3Cinit%3E(zombie.characters.IsoPlayer))
8. [Method Details](#method-detail)
   1. [compare(CraftRecipe, CraftRecipe)](#compare(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.entity.components.crafting.CraftRecipe))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftLogicUILogic.RecipeComparator
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.CraftLogicUILogic.RecipeComparator

All Implemented Interfaces:
:   `Comparator<CraftRecipe>`

Enclosing class:
:   `CraftLogicUILogic`

---

public static class CraftLogicUILogic.RecipeComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `CraftLogicUILogic.RecipeComparator.CompareMode`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `CraftLogicUILogic.RecipeComparator.CompareMode`

  `compareMode`

  `private final IsoPlayer`

  `player`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeComparator(IsoPlayer player)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(CraftRecipe v1,
  CraftRecipe v2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### player

    private final [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player
  + ### compareMode

    public [CraftLogicUILogic.RecipeComparator.CompareMode](CraftLogicUILogic.RecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") compareMode
* Constructor Details
  -------------------

  + ### RecipeComparator

    public RecipeComparator([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
* Method Details
  --------------

  + ### compare

    public int compare([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v1,
    [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v2)

    Specified by:
    :   `compare` in interface `Comparator<CraftRecipe>`