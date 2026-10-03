[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.WornItems](package-summary.html)
2. [WornItem](WornItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [itemBodyLocation](#itemBodyLocation)
   2. [item](#item)
6. [Constructor Details](#constructor-detail)
   1. [WornItem(ItemBodyLocation, InventoryItem)](#%3Cinit%3E(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
7. [Method Details](#method-detail)
   1. [getLocation()](#getLocation())
   2. [getItem()](#getItem())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WornItem
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.WornItems.WornItem

---

public final class WornItem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final InventoryItem`

  `item`

  `private final ItemBodyLocation`

  `itemBodyLocation`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WornItem(ItemBodyLocation itemBodyLocation,
  InventoryItem item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `InventoryItem`

  `getItem()`

  `ItemBodyLocation`

  `getLocation()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### itemBodyLocation

    private final [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation
  + ### item

    private final [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
* Constructor Details
  -------------------

  + ### WornItem

    public WornItem([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
* Method Details
  --------------

  + ### getLocation

    public [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") getLocation()
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()