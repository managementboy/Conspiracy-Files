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
3. [EvalArgComparator](ItemContainer.EvalArgComparator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [functionObj](#functionObj)
   2. [arg](#arg)
6. [Constructor Details](#constructor-detail)
   1. [EvalArgComparator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(LuaClosure, Object)](#init(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   2. [compare(InventoryItem, InventoryItem)](#compare(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.EvalArgComparator
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.EvalArgComparator

All Implemented Interfaces:
:   `Comparator<InventoryItem>`

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.EvalArgComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Object`

  `arg`

  `private se.krka.kahlua.vm.LuaClosure`

  `functionObj`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EvalArgComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(InventoryItem o1,
  InventoryItem o2)`

  `(package private) ItemContainer.EvalArgComparator`

  `init(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### functionObj

    private se.krka.kahlua.vm.LuaClosure functionObj
  + ### arg

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg
* Constructor Details
  -------------------

  + ### EvalArgComparator

    private EvalArgComparator()
* Method Details
  --------------

  + ### init

    [ItemContainer.EvalArgComparator](ItemContainer.EvalArgComparator.html "class in zombie.inventory") init(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### compare

    public int compare([InventoryItem](InventoryItem.html "class in zombie.inventory") o1,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") o2)

    Specified by:
    :   `compare` in interface `Comparator<InventoryItem>`