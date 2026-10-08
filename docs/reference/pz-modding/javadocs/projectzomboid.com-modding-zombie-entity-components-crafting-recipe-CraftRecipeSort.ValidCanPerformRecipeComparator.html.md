[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeSort](CraftRecipeSort.html)
3. [ValidCanPerformRecipeComparator](CraftRecipeSort.ValidCanPerformRecipeComparator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [isValidCache](#isValidCache)
   2. [canPerformCache](#canPerformCache)
6. [Constructor Details](#constructor-detail)
   1. [ValidCanPerformRecipeComparator(List, IsoGameCharacter, ArrayList, ArrayList, ArrayList)](#%3Cinit%3E(java.util.List,zombie.characters.IsoGameCharacter,java.util.ArrayList,java.util.ArrayList,java.util.ArrayList))
7. [Method Details](#method-detail)
   1. [compare(CraftRecipe, CraftRecipe)](#compare(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.entity.components.crafting.CraftRecipe))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeSort.ValidCanPerformRecipeComparator
=====================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeSort.ValidCanPerformRecipeComparator

All Implemented Interfaces:
:   `Comparator<CraftRecipe>`

Enclosing class:
:   `CraftRecipeSort`

---

public static class CraftRecipeSort.ValidCanPerformRecipeComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")>

sort order: Valid Recipes, CanPerform Recipe, AlphaNumeric

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashSet<CraftRecipe>`

  `canPerformCache`

  `private final HashSet<CraftRecipe>`

  `isValidCache`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ValidCanPerformRecipeComparator(List<CraftRecipe> compareList,
  IsoGameCharacter character,
  ArrayList<Resource> sourceResources,
  ArrayList<InventoryItem> sourceItems,
  ArrayList<ItemContainer> containers)`
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

  + ### isValidCache

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> isValidCache
  + ### canPerformCache

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> canPerformCache
* Constructor Details
  -------------------

  + ### ValidCanPerformRecipeComparator

    public ValidCanPerformRecipeComparator([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> compareList,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> sourceResources,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> sourceItems,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
* Method Details
  --------------

  + ### compare

    public int compare([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v1,
    [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") v2)

    Specified by:
    :   `compare` in interface `Comparator<CraftRecipe>`