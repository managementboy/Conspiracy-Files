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
3. [CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [recipe](#recipe)
   3. [isValid](#isValid)
   4. [canPerform](#canPerform)
   5. [available](#available)
6. [Constructor Details](#constructor-detail)
   1. [CachedRecipeInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(CraftRecipe)](#Alloc(zombie.scripting.entity.components.crafting.CraftRecipe))
   2. [Release(BaseCraftingLogic.CachedRecipeInfo)](#Release(zombie.entity.components.crafting.BaseCraftingLogic.CachedRecipeInfo))
   3. [getRecipe()](#getRecipe())
   4. [isValid()](#isValid())
   5. [isCanPerform()](#isCanPerform())
   6. [isAvailable()](#isAvailable())
   7. [overrideCanPerform(boolean)](#overrideCanPerform(boolean))
   8. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BaseCraftingLogic.CachedRecipeInfo
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.BaseCraftingLogic.CachedRecipeInfo

Enclosing class:
:   `BaseCraftingLogic`

---

public static class BaseCraftingLogic.CachedRecipeInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `available`

  `private boolean`

  `canPerform`

  `private boolean`

  `isValid`

  `private static final ArrayDeque<BaseCraftingLogic.CachedRecipeInfo>`

  `pool`

  `private CraftRecipe`

  `recipe`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CachedRecipeInfo()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static BaseCraftingLogic.CachedRecipeInfo`

  `Alloc(CraftRecipe recipe)`

  `CraftRecipe`

  `getRecipe()`

  `boolean`

  `isAvailable()`

  `boolean`

  `isCanPerform()`

  `boolean`

  `isValid()`

  `void`

  `overrideCanPerform(boolean value)`

  `private static void`

  `Release(BaseCraftingLogic.CachedRecipeInfo info)`

  `private void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting")> pool
  + ### recipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe
  + ### isValid

    private boolean isValid
  + ### canPerform

    private boolean canPerform
  + ### available

    private boolean available
* Constructor Details
  -------------------

  + ### CachedRecipeInfo

    public CachedRecipeInfo()
* Method Details
  --------------

  + ### Alloc

    private static [BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting") Alloc([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### Release

    private static void Release([BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting") info)
  + ### getRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### isValid

    public boolean isValid()
  + ### isCanPerform

    public boolean isCanPerform()
  + ### isAvailable

    public boolean isAvailable()
  + ### overrideCanPerform

    public void overrideCanPerform(boolean value)
  + ### reset

    private void reset()