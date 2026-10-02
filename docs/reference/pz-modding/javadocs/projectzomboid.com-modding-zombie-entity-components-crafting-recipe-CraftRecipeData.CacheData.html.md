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
3. [CacheData](CraftRecipeData.CacheData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [mostRecentItem](#mostRecentItem)
   2. [appliedItems](#appliedItems)
   3. [moveToOutputs](#moveToOutputs)
   4. [usesConsumed](#usesConsumed)
   5. [fluidConsumed](#fluidConsumed)
   6. [energyConsumed](#energyConsumed)
   7. [fluidSample](#fluidSample)
   8. [fluidConsume](#fluidConsume)
   9. [usesCreated](#usesCreated)
   10. [fluidCreated](#fluidCreated)
   11. [energyCreated](#energyCreated)
   12. [cachedCanConsume](#cachedCanConsume)
6. [Constructor Details](#constructor-detail)
   1. [CacheData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addAppliedItem(InventoryItem)](#addAppliedItem(zombie.inventory.InventoryItem))
   2. [getAppliedItemsCount()](#getAppliedItemsCount())
   3. [hasAppliedItem(InventoryItem)](#hasAppliedItem(zombie.inventory.InventoryItem))
   4. [hasAppliedItemType(Item)](#hasAppliedItemType(zombie.scripting.objects.Item))
   5. [getMostRecentItem()](#getMostRecentItem())
   6. [setMostRecentItemNull()](#setMostRecentItemNull())
   7. [getAppliedItem(int)](#getAppliedItem(int))
   8. [getFirstAppliedItem()](#getFirstAppliedItem())
   9. [addAppliedItemsToList(ArrayList)](#addAppliedItemsToList(java.util.ArrayList))
   10. [getRecipeData()](#getRecipeData())
   11. [clearCache()](#clearCache())
   12. [isMoveToOutputs()](#isMoveToOutputs())
   13. [setMoveToOutputs(boolean)](#setMoveToOutputs(boolean))
   14. [softReset()](#softReset())
   15. [softResetInput()](#softResetInput())
   16. [softResetOutput()](#softResetOutput())
   17. [saveInputs(ByteBuffer)](#saveInputs(java.nio.ByteBuffer))
   18. [loadInputs(ByteBuffer, int)](#loadInputs(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeData.CacheData
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData

Direct Known Subclasses:
:   `CraftRecipeData.InputScriptData, CraftRecipeData.OutputScriptData`

Enclosing class:
:   `CraftRecipeData`

---

public abstract static class CraftRecipeData.CacheData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<InventoryItem>`

  `appliedItems`

  `protected boolean`

  `cachedCanConsume`

  `protected float`

  `energyConsumed`

  `protected float`

  `energyCreated`

  `protected FluidConsume`

  `fluidConsume`

  `protected float`

  `fluidConsumed`

  `protected float`

  `fluidCreated`

  `protected FluidSample`

  `fluidSample`

  `protected InventoryItem`

  `mostRecentItem`

  `private boolean`

  `moveToOutputs`

  `protected float`

  `usesConsumed`

  `protected float`

  `usesCreated`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CacheData()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `addAppliedItem(InventoryItem inventoryItem)`

  `void`

  `addAppliedItemsToList(ArrayList<InventoryItem> items)`

  `protected void`

  `clearCache()`

  `InventoryItem`

  `getAppliedItem(int index)`

  `int`

  `getAppliedItemsCount()`

  `InventoryItem`

  `getFirstAppliedItem()`

  `InventoryItem`

  `getMostRecentItem()`

  `protected abstract CraftRecipeData`

  `getRecipeData()`

  `boolean`

  `hasAppliedItem(InventoryItem item)`

  `boolean`

  `hasAppliedItemType(Item item)`

  `boolean`

  `isMoveToOutputs()`

  `protected void`

  `loadInputs(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `saveInputs(ByteBuffer output)`

  `protected void`

  `setMostRecentItemNull()`

  `void`

  `setMoveToOutputs(boolean b)`

  `protected void`

  `softReset()`

  `protected void`

  `softResetInput()`

  `protected void`

  `softResetOutput()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### mostRecentItem

    protected [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") mostRecentItem
  + ### appliedItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> appliedItems
  + ### moveToOutputs

    private boolean moveToOutputs
  + ### usesConsumed

    protected float usesConsumed
  + ### fluidConsumed

    protected float fluidConsumed
  + ### energyConsumed

    protected float energyConsumed
  + ### fluidSample

    protected [FluidSample](../../fluids/FluidSample.html "class in zombie.entity.components.fluids") fluidSample
  + ### fluidConsume

    protected [FluidConsume](../../fluids/FluidConsume.html "class in zombie.entity.components.fluids") fluidConsume
  + ### usesCreated

    protected float usesCreated
  + ### fluidCreated

    protected float fluidCreated
  + ### energyCreated

    protected float energyCreated
  + ### cachedCanConsume

    protected boolean cachedCanConsume
* Constructor Details
  -------------------

  + ### CacheData

    public CacheData()
* Method Details
  --------------

  + ### addAppliedItem

    protected void addAppliedItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### getAppliedItemsCount

    public int getAppliedItemsCount()
  + ### hasAppliedItem

    public boolean hasAppliedItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### hasAppliedItemType

    public boolean hasAppliedItemType([Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### getMostRecentItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getMostRecentItem()
  + ### setMostRecentItemNull

    protected void setMostRecentItemNull()
  + ### getAppliedItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getAppliedItem(int index)
  + ### getFirstAppliedItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstAppliedItem()
  + ### addAppliedItemsToList

    public void addAppliedItemsToList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getRecipeData

    protected abstract [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()
  + ### clearCache

    protected void clearCache()
  + ### isMoveToOutputs

    public boolean isMoveToOutputs()
  + ### setMoveToOutputs

    public void setMoveToOutputs(boolean b)
  + ### softReset

    protected void softReset()
  + ### softResetInput

    protected void softResetInput()
  + ### softResetOutput

    protected void softResetOutput()
  + ### saveInputs

    protected void saveInputs([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadInputs

    protected void loadInputs([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`