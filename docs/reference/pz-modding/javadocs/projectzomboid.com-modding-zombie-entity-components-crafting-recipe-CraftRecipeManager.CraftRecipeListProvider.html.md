[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeManager](CraftRecipeManager.html)
3. [CraftRecipeListProvider](CraftRecipeManager.CraftRecipeListProvider.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [CraftRecipeListProvider()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [getTaggedObjectList()](#getTaggedObjectList())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeManager.CraftRecipeListProvider
================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeManager.CraftRecipeListProvider

All Implemented Interfaces:
:   `zombie.util.TaggedObjectManager.BackingListProvider<CraftRecipe>`

Enclosing class:
:   `CraftRecipeManager`

---

private static class CraftRecipeManager.CraftRecipeListProvider
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.util.TaggedObjectManager.BackingListProvider<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")>

* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CraftRecipeListProvider()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ArrayList<CraftRecipe>`

  `getTaggedObjectList()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### CraftRecipeListProvider

    private CraftRecipeListProvider()
* Method Details
  --------------

  + ### getTaggedObjectList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getTaggedObjectList()

    Specified by:
    :   `getTaggedObjectList` in interface `zombie.util.TaggedObjectManager.BackingListProvider<CraftRecipe>`