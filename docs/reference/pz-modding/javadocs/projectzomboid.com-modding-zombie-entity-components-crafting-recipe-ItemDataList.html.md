[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [ItemDataList](ItemDataList.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [dataElements](#dataElements)
   2. [size](#size)
   3. [peak](#peak)
   4. [unprocessed](#unprocessed)
7. [Constructor Details](#constructor-detail)
   1. [ItemDataList(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [checkCapacity(int)](#checkCapacity(int))
   2. [size()](#size())
   3. [getItem(int)](#getItem(int))
   4. [getInventoryItem(int)](#getInventoryItem(int))
   5. [setProcessed(int)](#setProcessed(int))
   6. [isProcessed(int)](#isProcessed(int))
   7. [getUnprocessed(ArrayList)](#getUnprocessed(java.util.ArrayList))
   8. [getUnprocessed(ArrayList, boolean)](#getUnprocessed(java.util.ArrayList,boolean))
   9. [hasUnprocessed()](#hasUnprocessed())
   10. [clear()](#clear())
   11. [reset()](#reset())
   12. [get(int)](#get(int))
   13. [getNextElement()](#getNextElement())
   14. [addItem(InventoryItem)](#addItem(zombie.inventory.InventoryItem))
   15. [addItem(InventoryItem, boolean)](#addItem(zombie.inventory.InventoryItem,boolean))
   16. [addItem(Item)](#addItem(zombie.scripting.objects.Item))
   17. [addItem(Item, boolean)](#addItem(zombie.scripting.objects.Item,boolean))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class ItemDataList
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.ItemDataList

---

public class ItemDataList
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `ItemDataList.ItemData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ItemDataList.ItemData[]`

  `dataElements`

  `private int`

  `peak`

  `private int`

  `size`

  `private int`

  `unprocessed`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemDataList(int capacity)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addItem(InventoryItem inventoryItem)`

  `void`

  `addItem(InventoryItem inventoryItem,
  boolean existingItem)`

  `void`

  `addItem(Item item)`

  `void`

  `addItem(Item item,
  boolean existingItem)`

  `private void`

  `checkCapacity(int size)`

  `void`

  `clear()`

  `private ItemDataList.ItemData`

  `get(int index)`

  `InventoryItem`

  `getInventoryItem(int index)`

  `Item`

  `getItem(int index)`

  `private ItemDataList.ItemData`

  `getNextElement()`

  `void`

  `getUnprocessed(ArrayList<InventoryItem> items)`

  `void`

  `getUnprocessed(ArrayList<InventoryItem> items,
  boolean includeExisting)`

  `boolean`

  `hasUnprocessed()`

  `boolean`

  `isProcessed(int index)`

  `void`

  `reset()`

  `void`

  `setProcessed(int index)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dataElements

    private [ItemDataList.ItemData](ItemDataList.ItemData.html "class in zombie.entity.components.crafting.recipe")[] dataElements
  + ### size

    private int size
  + ### peak

    private int peak
  + ### unprocessed

    private int unprocessed
* Constructor Details
  -------------------

  + ### ItemDataList

    public ItemDataList(int capacity)
* Method Details
  --------------

  + ### checkCapacity

    private void checkCapacity(int size)
  + ### size

    public int size()
  + ### getItem

    public [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getItem(int index)
  + ### getInventoryItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getInventoryItem(int index)
  + ### setProcessed

    public void setProcessed(int index)
  + ### isProcessed

    public boolean isProcessed(int index)
  + ### getUnprocessed

    public void getUnprocessed([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getUnprocessed

    public void getUnprocessed([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items,
    boolean includeExisting)
  + ### hasUnprocessed

    public boolean hasUnprocessed()
  + ### clear

    public void clear()
  + ### reset

    public void reset()
  + ### get

    private [ItemDataList.ItemData](ItemDataList.ItemData.html "class in zombie.entity.components.crafting.recipe") get(int index)
  + ### getNextElement

    private [ItemDataList.ItemData](ItemDataList.ItemData.html "class in zombie.entity.components.crafting.recipe") getNextElement()
  + ### addItem

    public void addItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### addItem

    public void addItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean existingItem)
  + ### addItem

    public void addItem([Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### addItem

    public void addItem([Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    boolean existingItem)