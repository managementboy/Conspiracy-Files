[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.visual](package-summary.html)
2. [ItemVisuals](ItemVisuals.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [ItemVisuals()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   2. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   3. [findHat()](#findHat())
   4. [findMask()](#findMask())
   5. [contains(String)](#contains(java.lang.String))
   6. [getDescription()](#getDescription())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ItemVisuals
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.util.AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<[ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual")>

[java.util.AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<[ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual")>

[java.util.ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual")>

zombie.core.skinnedmodel.visual.ItemVisuals

All Implemented Interfaces:
:   `Serializable, Cloneable, Iterable<ItemVisual>, Collection<ItemVisual>, List<ItemVisual>, RandomAccess, SequencedCollection<ItemVisual>`

---

public final class ItemVisuals
extends [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual")>

See Also:
:   * [Serialized Form](../../../../serialized-form.html#zombie.core.skinnedmodel.visual.ItemVisuals)

* Field Summary
  -------------

  ### Fields inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#field-summary "class or interface in java.util")

  `modCount`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemVisuals()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `contains(String itemType)`

  `ItemVisual`

  `findHat()`

  `ItemVisual`

  `findMask()`

  `String`

  `getDescription()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  ### Methods inherited from class [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html#method-summary "class or interface in java.util")

  `add, add, addAll, addAll, addFirst, addLast, clear, clone, contains, ensureCapacity, equals, forEach, get, getFirst, getLast, hashCode, indexOf, isEmpty, iterator, lastIndexOf, listIterator, listIterator, remove, remove, removeAll, removeFirst, removeIf, removeLast, removeRange, replaceAll, retainAll, set, size, sort, spliterator, subList, toArray, toArray, trimToSize`

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

  + ### ItemVisuals

    public ItemVisuals()
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### findHat

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") findHat()
  + ### findMask

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") findMask()
  + ### contains

    private boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()