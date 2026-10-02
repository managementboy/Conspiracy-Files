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
3. [InputScriptData](CraftRecipeData.InputScriptData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [recipeData](#recipeData)
   2. [inputScript](#inputScript)
   3. [inputItems](#inputItems)
   4. [pool](#pool)
6. [Constructor Details](#constructor-detail)
   1. [InputScriptData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(CraftRecipeData, InputScript)](#Alloc(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.scripting.entity.components.crafting.InputScript))
   2. [Release(CraftRecipeData.InputScriptData)](#Release(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData))
   3. [getRecipeData()](#getRecipeData())
   4. [reset()](#reset())
   5. [getInputScript()](#getInputScript())
   6. [isCachedCanConsume()](#isCachedCanConsume())
   7. [getManualInputItems(ArrayList)](#getManualInputItems(java.util.ArrayList))
   8. [getInputItemCount()](#getInputItemCount())
   9. [getInputItemUses()](#getInputItemUses())
   10. [getInputItemFluidUses()](#getInputItemFluidUses())
   11. [getFirstInputItem()](#getFirstInputItem())
   12. [getLastInputItem()](#getLastInputItem())
   13. [isInputItemsSatisfied()](#isInputItemsSatisfied())
   14. [isInputItemsSatisifiedToMaximum()](#isInputItemsSatisifiedToMaximum())
   15. [acceptsInputItem(InventoryItem)](#acceptsInputItem(zombie.inventory.InventoryItem))
   16. [addInputItem(InventoryItem)](#addInputItem(zombie.inventory.InventoryItem))
   17. [removeInputItem(InventoryItem)](#removeInputItem(zombie.inventory.InventoryItem))
   18. [verifyInputItems(ArrayList)](#verifyInputItems(java.util.ArrayList))
   19. [isDestroy()](#isDestroy())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeData.InputScriptData
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe")

zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData

Enclosing class:
:   `CraftRecipeData`

---

public static class CraftRecipeData.InputScriptData
extends [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<InventoryItem>`

  `inputItems`

  `private InputScript`

  `inputScript`

  `private static final ArrayDeque<CraftRecipeData.InputScriptData>`

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

  `InputScriptData()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `acceptsInputItem(InventoryItem inventoryItem)`

  `boolean`

  `addInputItem(InventoryItem inventoryItem)`

  `private static CraftRecipeData.InputScriptData`

  `Alloc(CraftRecipeData recipeData,
  InputScript inputScript)`

  `InventoryItem`

  `getFirstInputItem()`

  `int`

  `getInputItemCount()`

  `float`

  `getInputItemFluidUses()`

  `int`

  `getInputItemUses()`

  `InputScript`

  `getInputScript()`

  `InventoryItem`

  `getLastInputItem()`

  `void`

  `getManualInputItems(ArrayList<InventoryItem> list)`

  `protected CraftRecipeData`

  `getRecipeData()`

  `boolean`

  `isCachedCanConsume()`

  `boolean`

  `isDestroy()`

  `boolean`

  `isInputItemsSatisfied()`

  `boolean`

  `isInputItemsSatisifiedToMaximum()`

  `private static void`

  `Release(CraftRecipeData.InputScriptData data)`

  `boolean`

  `removeInputItem(InventoryItem item)`

  `private void`

  `reset()`

  `void`

  `verifyInputItems(ArrayList<InventoryItem> playerItems)`

  ### Methods inherited from class [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html#method-summary "class in zombie.entity.components.crafting.recipe")

  `addAppliedItem, addAppliedItemsToList, clearCache, getAppliedItem, getAppliedItemsCount, getFirstAppliedItem, getMostRecentItem, hasAppliedItem, hasAppliedItemType, isMoveToOutputs, loadInputs, saveInputs, setMostRecentItemNull, setMoveToOutputs, softReset, softResetInput, softResetOutput`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### recipeData

    private [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData
  + ### inputScript

    private [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript
  + ### inputItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> inputItems
  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe")> pool
* Constructor Details
  -------------------

  + ### InputScriptData

    public InputScriptData()
* Method Details
  --------------

  + ### Alloc

    private static [CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") Alloc([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData,
    [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### Release

    private static void Release([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") data)
  + ### getRecipeData

    protected [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()

    Specified by:
    :   `getRecipeData` in class `CraftRecipeData.CacheData`
  + ### reset

    private void reset()
  + ### getInputScript

    public [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") getInputScript()
  + ### isCachedCanConsume

    public boolean isCachedCanConsume()
  + ### getManualInputItems

    public void getManualInputItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getInputItemCount

    public int getInputItemCount()
  + ### getInputItemUses

    public int getInputItemUses()
  + ### getInputItemFluidUses

    public float getInputItemFluidUses()
  + ### getFirstInputItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstInputItem()
  + ### getLastInputItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getLastInputItem()
  + ### isInputItemsSatisfied

    public boolean isInputItemsSatisfied()
  + ### isInputItemsSatisifiedToMaximum

    public boolean isInputItemsSatisifiedToMaximum()
  + ### acceptsInputItem

    public boolean acceptsInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### addInputItem

    public boolean addInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### removeInputItem

    public boolean removeInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### verifyInputItems

    public void verifyInputItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> playerItems)
  + ### isDestroy

    public boolean isDestroy()