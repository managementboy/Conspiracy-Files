[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemContainer](ItemContainer.html)
3. [InventoryItemListPool](ItemContainer.InventoryItemListPool.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [InventoryItemListPool()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [release(ItemContainer.InventoryItemList)](#release(zombie.inventory.ItemContainer.InventoryItemList))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.InventoryItemListPool
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.statistics.counters.ObjectPoolCounter

zombie.popman.ObjectPool<[ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory")>

zombie.inventory.ItemContainer.InventoryItemListPool

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.InventoryItemListPool
extends zombie.popman.ObjectPool<[ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.popman.ObjectPool

  `zombie.popman.ObjectPool.Allocator<T>`
* Field Summary
  -------------

  ### Fields inherited from class zombie.popman.ObjectPool

  `DEFAULT_MAX_SIZE`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `InventoryItemListPool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `release(ItemContainer.InventoryItemList obj)`

  ### Methods inherited from class zombie.popman.ObjectPool

  `alloc, clear, forEach, makeObject, release, release, release, releaseAll, releaseAll, setMaxSize, size`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### InventoryItemListPool

    public InventoryItemListPool()
* Method Details
  --------------

  + ### release

    public void release([ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory") obj)

    Overrides:
    :   `release` in class `zombie.popman.ObjectPool<ItemContainer.InventoryItemList>`