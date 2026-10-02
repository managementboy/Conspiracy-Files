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
3. [Comparators](ItemContainer.Comparators.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [condition](#condition)
   2. [eval](#eval)
   3. [evalArg](#evalArg)
6. [Constructor Details](#constructor-detail)
   1. [Comparators()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.Comparators
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.Comparators

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.Comparators
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) zombie.popman.ObjectPool<ItemContainer.ConditionComparator>`

  `condition`

  `(package private) zombie.popman.ObjectPool<ItemContainer.EvalComparator>`

  `eval`

  `(package private) zombie.popman.ObjectPool<ItemContainer.EvalArgComparator>`

  `evalArg`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Comparators()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### condition

    zombie.popman.ObjectPool<[ItemContainer.ConditionComparator](ItemContainer.ConditionComparator.html "class in zombie.inventory")> condition
  + ### eval

    zombie.popman.ObjectPool<[ItemContainer.EvalComparator](ItemContainer.EvalComparator.html "class in zombie.inventory")> eval
  + ### evalArg

    zombie.popman.ObjectPool<[ItemContainer.EvalArgComparator](ItemContainer.EvalArgComparator.html "class in zombie.inventory")> evalArg
* Constructor Details
  -------------------

  + ### Comparators

    private Comparators()