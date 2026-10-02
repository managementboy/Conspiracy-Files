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
3. [TagEvalArgPredicate](ItemContainer.TagEvalArgPredicate.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [itemTag](#itemTag)
   2. [functionObj](#functionObj)
   3. [arg](#arg)
6. [Constructor Details](#constructor-detail)
   1. [TagEvalArgPredicate()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(ItemTag, LuaClosure, Object)](#init(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   2. [test(InventoryItem)](#test(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.TagEvalArgPredicate
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.TagEvalArgPredicate

All Implemented Interfaces:
:   `Predicate<InventoryItem>`

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.TagEvalArgPredicate
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

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

  `private ItemTag`

  `itemTag`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TagEvalArgPredicate()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private ItemContainer.TagEvalArgPredicate`

  `init(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `boolean`

  `test(InventoryItem item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html#method-summary "class or interface in java.util.function")

  `and, negate, or`

* Field Details
  -------------

  + ### itemTag

    private [ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag
  + ### functionObj

    private se.krka.kahlua.vm.LuaClosure functionObj
  + ### arg

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg
* Constructor Details
  -------------------

  + ### TagEvalArgPredicate

    private TagEvalArgPredicate()
* Method Details
  --------------

  + ### init

    private [ItemContainer.TagEvalArgPredicate](ItemContainer.TagEvalArgPredicate.html "class in zombie.inventory") init([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### test

    public boolean test([InventoryItem](InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `test` in interface `Predicate<InventoryItem>`