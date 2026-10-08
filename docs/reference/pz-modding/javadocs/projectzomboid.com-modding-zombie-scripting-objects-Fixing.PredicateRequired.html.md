[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Fixing](Fixing.html)
3. [PredicateRequired](Fixing.PredicateRequired.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fixer](#fixer)
   2. [brokenItem](#brokenItem)
   3. [uses](#uses)
6. [Constructor Details](#constructor-detail)
   1. [PredicateRequired()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [test(InventoryItem)](#test(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Fixing.PredicateRequired
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Fixing.PredicateRequired

All Implemented Interfaces:
:   `Predicate<InventoryItem>`

Enclosing class:
:   `Fixing`

---

private static final class Fixing.PredicateRequired
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) InventoryItem`

  `brokenItem`

  `(package private) Fixing.Fixer`

  `fixer`

  `(package private) int`

  `uses`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PredicateRequired()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `test(InventoryItem item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html#method-summary "class or interface in java.util.function")

  `and, negate, or`

* Field Details
  -------------

  + ### fixer

    [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") fixer
  + ### brokenItem

    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") brokenItem
  + ### uses

    int uses
* Constructor Details
  -------------------

  + ### PredicateRequired

    private PredicateRequired()
* Method Details
  --------------

  + ### test

    public boolean test([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `test` in interface `Predicate<InventoryItem>`