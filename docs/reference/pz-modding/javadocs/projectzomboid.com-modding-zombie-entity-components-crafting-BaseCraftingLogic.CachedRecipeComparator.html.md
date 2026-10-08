[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [BaseCraftingLogic](BaseCraftingLogic.html)
3. [CachedRecipeComparator](BaseCraftingLogic.CachedRecipeComparator.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [logic](#logic)
   2. [compareMode](#compareMode)
7. [Constructor Details](#constructor-detail)
   1. [CachedRecipeComparator(BaseCraftingLogic)](#%3Cinit%3E(zombie.entity.components.crafting.BaseCraftingLogic))
8. [Method Details](#method-detail)
   1. [compare(CraftRecipe, CraftRecipe)](#compare(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.entity.components.crafting.CraftRecipe))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BaseCraftingLogic.CachedRecipeComparator
==============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.BaseCraftingLogic.CachedRecipeComparator

All Implemented Interfaces:
:   `Comparator<CraftRecipe>`

Enclosing class:
:   `BaseCraftingLogic`

---

public static class BaseCraftingLogic.CachedRecipeComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")>

sort order: Valid Recipes, CanPerform Recipe, AlphaNumeric

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `BaseCraftingLogic.CachedRecipeComparator.CompareMode`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `BaseCraftingLogic.CachedRecipeComparator.CompareMode`

  `compareMode`

  `private final BaseCraftingLogic`

  `logic`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CachedRecipeComparator(BaseCraftingLogic logic)`
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

  + ### logic

    private final [BaseCraftingLogic](BaseCraftingLogic.html "class in zombie.entity.components.crafting") logic
  + ### compareMode

    public [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") compareMode
* Constructor Details
  -------------------

  + ### CachedRecipeComparator

    public CachedRecipeComparator([BaseCraftingLogic](BaseCraftingLogic.html "class in zombie.entity.components.crafting") logic)
* Method Details
  --------------

  + ### compare

    public int compare([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v1,
    [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v2)

    Specified by:
    :   `compare` in interface `Comparator<CraftRecipe>`