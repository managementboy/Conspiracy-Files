[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.AttachedItems](package-summary.html)
2. [AttachedItem](AttachedItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [location](#location)
   2. [item](#item)
6. [Constructor Details](#constructor-detail)
   1. [AttachedItem(String, InventoryItem)](#%3Cinit%3E(java.lang.String,zombie.inventory.InventoryItem))
7. [Method Details](#method-detail)
   1. [getLocation()](#getLocation())
   2. [getItem()](#getItem())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AttachedItem
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.AttachedItems.AttachedItem

---

public final class AttachedItem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final InventoryItem`

  `item`

  `protected final String`

  `location`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttachedItem(String location,
  InventoryItem item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `InventoryItem`

  `getItem()`

  `String`

  `getLocation()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### location

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location
  + ### item

    protected final [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
* Constructor Details
  -------------------

  + ### AttachedItem

    public AttachedItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
* Method Details
  --------------

  + ### getLocation

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocation()
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()