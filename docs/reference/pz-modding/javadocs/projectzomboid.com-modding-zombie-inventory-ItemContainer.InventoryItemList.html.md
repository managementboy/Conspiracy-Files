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
3. [InventoryItemList](ItemContainer.InventoryItemList.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [InventoryItemList()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [equals(Object)](#equals(java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer.InventoryItemList
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.util.AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

[java.util.AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

[java.util.ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

zombie.inventory.ItemContainer.InventoryItemList

All Implemented Interfaces:
:   `Serializable, Cloneable, Iterable<InventoryItem>, Collection<InventoryItem>, List<InventoryItem>, RandomAccess, SequencedCollection<InventoryItem>`

Enclosing class:
:   `ItemContainer`

---

private static final class ItemContainer.InventoryItemList
extends [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")>

* Field Summary
  -------------

  ### Fields inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#field-summary "class or interface in java.util")

  `modCount`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `InventoryItemList()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(Object o)`

  ### Methods inherited from class [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html#method-summary "class or interface in java.util")

  `add, add, addAll, addAll, addFirst, addLast, clear, clone, contains, ensureCapacity, forEach, get, getFirst, getLast, hashCode, indexOf, isEmpty, iterator, lastIndexOf, listIterator, listIterator, remove, remove, removeAll, removeFirst, removeIf, removeLast, removeRange, replaceAll, retainAll, set, size, sort, spliterator, subList, toArray, toArray, trimToSize`

  ### Methods inherited from class [AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html#method-summary "class or interface in java.util")

  `containsAll, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#method-summary "class or interface in java.util")

  `parallelStream, stream, toArray`

  ### Methods inherited from interface [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html#method-summary "class or interface in java.util")

  `containsAll, reversed`

* Constructor Details
  -------------------

  + ### InventoryItemList

    private InventoryItemList()
* Method Details
  --------------

  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `equals` in interface `Collection<InventoryItem>`

    Specified by:
    :   `equals` in interface `List<InventoryItem>`

    Overrides:
    :   `equals` in class `ArrayList<InventoryItem>`