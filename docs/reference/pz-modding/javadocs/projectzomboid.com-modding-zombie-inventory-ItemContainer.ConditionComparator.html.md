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
3. [ConditionComparator](ItemContainer.ConditionComparator.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ConditionComparator()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(InventoryItem, InventoryItem)](#compare(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.ConditionComparator
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.ConditionComparator

All Implemented Interfaces:
:   `Comparator<InventoryItem>`

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.ConditionComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ConditionComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(InventoryItem o1,
  InventoryItem o2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### ConditionComparator

    private ConditionComparator()
* Method Details
  --------------

  + ### compare

    public int compare([InventoryItem](InventoryItem.html "class in zombie.inventory") o1,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") o2)

    Specified by:
    :   `compare` in interface `Comparator<InventoryItem>`