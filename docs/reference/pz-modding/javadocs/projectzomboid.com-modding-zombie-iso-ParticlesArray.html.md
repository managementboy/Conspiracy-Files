[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [ParticlesArray](ParticlesArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [needToUpdate](#needToUpdate)
   2. [particleSystemsCount](#particleSystemsCount)
   3. [particleSystemsLast](#particleSystemsLast)
6. [Constructor Details](#constructor-detail)
   1. [ParticlesArray()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addParticle(E)](#addParticle(E))
   2. [deleteParticle(int)](#deleteParticle(int))
   3. [defragmentParticle()](#defragmentParticle())
   4. [getCount()](#getCount())
   5. [getNeedToUpdate()](#getNeedToUpdate())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ParticlesArray<E>
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.util.AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<E>

[java.util.AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<E>

[java.util.ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<E>

zombie.iso.ParticlesArray<E>

All Implemented Interfaces:
:   `Serializable, Cloneable, Iterable<E>, Collection<E>, List<E>, RandomAccess, SequencedCollection<E>`

---

public final class ParticlesArray<E>
extends [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<E>

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.iso.ParticlesArray)

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `needToUpdate`

  `private int`

  `particleSystemsCount`

  `private int`

  `particleSystemsLast`

  ### Fields inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#field-summary "class or interface in java.util")

  `modCount`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParticlesArray()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `addParticle(E p)`

  `void`

  `defragmentParticle()`

  `boolean`

  `deleteParticle(int k)`

  `int`

  `getCount()`

  `boolean`

  `getNeedToUpdate()`

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

* Field Details
  -------------

  + ### needToUpdate

    private boolean needToUpdate
  + ### particleSystemsCount

    private int particleSystemsCount
  + ### particleSystemsLast

    private int particleSystemsLast
* Constructor Details
  -------------------

  + ### ParticlesArray

    public ParticlesArray()
* Method Details
  --------------

  + ### addParticle

    public int addParticle([E](#type-param-E "type parameter in ParticlesArray") p)
  + ### deleteParticle

    public boolean deleteParticle(int k)
  + ### defragmentParticle

    public void defragmentParticle()
  + ### getCount

    public int getCount()
  + ### getNeedToUpdate

    public boolean getNeedToUpdate()