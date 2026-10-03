[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeListNodeCollection](CraftRecipeListNodeCollection.html)
3. [RecipeNodeComparator](CraftRecipeListNodeCollection.RecipeNodeComparator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [recipeComparator](#recipeComparator)
6. [Constructor Details](#constructor-detail)
   1. [RecipeNodeComparator(Comparator)](#%3Cinit%3E(java.util.Comparator))
7. [Method Details](#method-detail)
   1. [compare(CraftRecipeListNode, CraftRecipeListNode)](#compare(zombie.entity.components.crafting.recipe.CraftRecipeListNode,zombie.entity.components.crafting.recipe.CraftRecipeListNode))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeListNodeCollection.RecipeNodeComparator
========================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeListNodeCollection.RecipeNodeComparator

All Implemented Interfaces:
:   `Comparator<CraftRecipeListNode>`

Enclosing class:
:   `CraftRecipeListNodeCollection`

---

private static class CraftRecipeListNodeCollection.RecipeNodeComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Comparator<? super CraftRecipe>`

  `recipeComparator`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeNodeComparator(Comparator<? super CraftRecipe> recipeComparator)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(CraftRecipeListNode v1,
  CraftRecipeListNode v2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### recipeComparator

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipeComparator
* Constructor Details
  -------------------

  + ### RecipeNodeComparator

    public RecipeNodeComparator([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipeComparator)
* Method Details
  --------------

  + ### compare

    public int compare([CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") v1,
    [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") v2)

    Specified by:
    :   `compare` in interface `Comparator<CraftRecipeListNode>`