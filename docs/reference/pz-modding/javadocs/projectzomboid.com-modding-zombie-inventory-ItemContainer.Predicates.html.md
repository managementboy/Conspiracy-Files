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
3. [Predicates](ItemContainer.Predicates.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [category](#category)
   2. [eval](#eval)
   3. [evalArg](#evalArg)
   4. [tag](#tag)
   5. [tagEval](#tagEval)
   6. [tagEvalArg](#tagEvalArg)
   7. [type](#type)
   8. [typeEval](#typeEval)
   9. [typeEvalArg](#typeEvalArg)
6. [Constructor Details](#constructor-detail)
   1. [Predicates()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.Predicates
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer.Predicates

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.Predicates
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.popman.ObjectPool<ItemContainer.CategoryPredicate>`

  `category`

  `private final zombie.popman.ObjectPool<ItemContainer.EvalPredicate>`

  `eval`

  `private final zombie.popman.ObjectPool<ItemContainer.EvalArgPredicate>`

  `evalArg`

  `private final zombie.popman.ObjectPool<ItemContainer.TagPredicate>`

  `tag`

  `private final zombie.popman.ObjectPool<ItemContainer.TagEvalPredicate>`

  `tagEval`

  `private final zombie.popman.ObjectPool<ItemContainer.TagEvalArgPredicate>`

  `tagEvalArg`

  `private final zombie.popman.ObjectPool<ItemContainer.TypePredicate>`

  `type`

  `private final zombie.popman.ObjectPool<ItemContainer.TypeEvalPredicate>`

  `typeEval`

  `private final zombie.popman.ObjectPool<ItemContainer.TypeEvalArgPredicate>`

  `typeEvalArg`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Predicates()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### category

    private final zombie.popman.ObjectPool<[ItemContainer.CategoryPredicate](ItemContainer.CategoryPredicate.html "class in zombie.inventory")> category
  + ### eval

    private final zombie.popman.ObjectPool<[ItemContainer.EvalPredicate](ItemContainer.EvalPredicate.html "class in zombie.inventory")> eval
  + ### evalArg

    private final zombie.popman.ObjectPool<[ItemContainer.EvalArgPredicate](ItemContainer.EvalArgPredicate.html "class in zombie.inventory")> evalArg
  + ### tag

    private final zombie.popman.ObjectPool<[ItemContainer.TagPredicate](ItemContainer.TagPredicate.html "class in zombie.inventory")> tag
  + ### tagEval

    private final zombie.popman.ObjectPool<[ItemContainer.TagEvalPredicate](ItemContainer.TagEvalPredicate.html "class in zombie.inventory")> tagEval
  + ### tagEvalArg

    private final zombie.popman.ObjectPool<[ItemContainer.TagEvalArgPredicate](ItemContainer.TagEvalArgPredicate.html "class in zombie.inventory")> tagEvalArg
  + ### type

    private final zombie.popman.ObjectPool<[ItemContainer.TypePredicate](ItemContainer.TypePredicate.html "class in zombie.inventory")> type
  + ### typeEval

    private final zombie.popman.ObjectPool<[ItemContainer.TypeEvalPredicate](ItemContainer.TypeEvalPredicate.html "class in zombie.inventory")> typeEval
  + ### typeEvalArg

    private final zombie.popman.ObjectPool<[ItemContainer.TypeEvalArgPredicate](ItemContainer.TypeEvalArgPredicate.html "class in zombie.inventory")> typeEvalArg
* Constructor Details
  -------------------

  + ### Predicates

    private Predicates()