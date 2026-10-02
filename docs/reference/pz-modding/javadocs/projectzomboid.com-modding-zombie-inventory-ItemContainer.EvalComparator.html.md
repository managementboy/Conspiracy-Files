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
3. [EvalComparator](ItemContainer.EvalComparator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [functionObj](#functionObj)
6. [Constructor Details](#constructor-detail)
   1. [EvalComparator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(LuaClosure)](#init(se.krka.kahlua.vm.LuaClosure))
   2. [compare(InventoryItem, InventoryItem)](#compare(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.EvalComparator
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.EvalComparator

All Implemented Interfaces:
:   `Comparator<InventoryItem>`

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.EvalComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private se.krka.kahlua.vm.LuaClosure`

  `functionObj`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EvalComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(InventoryItem o1,
  InventoryItem o2)`

  `private ItemContainer.EvalComparator`

  `init(se.krka.kahlua.vm.LuaClosure functionObj)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### functionObj

    private se.krka.kahlua.vm.LuaClosure functionObj
* Constructor Details
  -------------------

  + ### EvalComparator

    private EvalComparator()
* Method Details
  --------------

  + ### init

    private [ItemContainer.EvalComparator](ItemContainer.EvalComparator.html "class in zombie.inventory") init(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### compare

    public int compare([InventoryItem](InventoryItem.html "class in zombie.inventory") o1,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") o2)

    Specified by:
    :   `compare` in interface `Comparator<InventoryItem>`