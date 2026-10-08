[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftRecipe](CraftRecipe.html)
3. [IOScript](CraftRecipe.IOScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [parentRecipe](#parentRecipe)
6. [Constructor Details](#constructor-detail)
   1. [IOScript(CraftRecipe)](#%3Cinit%3E(zombie.scripting.entity.components.crafting.CraftRecipe))
7. [Method Details](#method-detail)
   1. [getParentRecipe()](#getParentRecipe())
   2. [getRecipeLineIndex()](#getRecipeLineIndex())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipe.IOScript
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.crafting.CraftRecipe.IOScript

Direct Known Subclasses:
:   `InputScript, OutputScript`

Enclosing class:
:   `CraftRecipe`

---

public abstract static class CraftRecipe.IOScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final CraftRecipe`

  `parentRecipe`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `IOScript(CraftRecipe parentRecipe)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `CraftRecipe`

  `getParentRecipe()`

  `int`

  `getRecipeLineIndex()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parentRecipe

    private final [CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe
* Constructor Details
  -------------------

  + ### IOScript

    protected IOScript([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe)
* Method Details
  --------------

  + ### getParentRecipe

    public [CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getParentRecipe()
  + ### getRecipeLineIndex

    public int getRecipeLineIndex()