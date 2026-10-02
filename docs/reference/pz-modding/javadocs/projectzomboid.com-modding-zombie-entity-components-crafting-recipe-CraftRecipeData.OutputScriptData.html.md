[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeData](CraftRecipeData.html)
3. [OutputScriptData](CraftRecipeData.OutputScriptData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [recipeData](#recipeData)
   3. [outputScript](#outputScript)
6. [Constructor Details](#constructor-detail)
   1. [OutputScriptData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(CraftRecipeData, OutputScript)](#Alloc(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.scripting.entity.components.crafting.OutputScript))
   2. [Release(CraftRecipeData.OutputScriptData)](#Release(zombie.entity.components.crafting.recipe.CraftRecipeData.OutputScriptData))
   3. [getRecipeData()](#getRecipeData())
   4. [getOutputScript()](#getOutputScript())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeData.OutputScriptData
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe")

zombie.entity.components.crafting.recipe.CraftRecipeData.OutputScriptData

Enclosing class:
:   `CraftRecipeData`

---

public static class CraftRecipeData.OutputScriptData
extends [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private OutputScript`

  `outputScript`

  `private static final ArrayDeque<CraftRecipeData.OutputScriptData>`

  `pool`

  `private CraftRecipeData`

  `recipeData`

  ### Fields inherited from class [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html#field-summary "class in zombie.entity.components.crafting.recipe")

  `cachedCanConsume, energyConsumed, energyCreated, fluidConsume, fluidConsumed, fluidCreated, fluidSample, mostRecentItem, usesConsumed, usesCreated`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OutputScriptData()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static CraftRecipeData.OutputScriptData`

  `Alloc(CraftRecipeData recipeData,
  OutputScript outputScript)`

  `OutputScript`

  `getOutputScript()`

  `protected CraftRecipeData`

  `getRecipeData()`

  `private static void`

  `Release(CraftRecipeData.OutputScriptData data)`

  ### Methods inherited from class [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html#method-summary "class in zombie.entity.components.crafting.recipe")

  `addAppliedItem, addAppliedItemsToList, clearCache, getAppliedItem, getAppliedItemsCount, getFirstAppliedItem, getMostRecentItem, hasAppliedItem, hasAppliedItemType, isMoveToOutputs, loadInputs, saveInputs, setMostRecentItemNull, setMoveToOutputs, softReset, softResetInput, softResetOutput`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe")> pool
  + ### recipeData

    private [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData
  + ### outputScript

    private [OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") outputScript
* Constructor Details
  -------------------

  + ### OutputScriptData

    public OutputScriptData()
* Method Details
  --------------

  + ### Alloc

    private static [CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe") Alloc([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData,
    [OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") outputScript)
  + ### Release

    private static void Release([CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe") data)
  + ### getRecipeData

    protected [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()

    Specified by:
    :   `getRecipeData` in class `CraftRecipeData.CacheData`
  + ### getOutputScript

    public [OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") getOutputScript()