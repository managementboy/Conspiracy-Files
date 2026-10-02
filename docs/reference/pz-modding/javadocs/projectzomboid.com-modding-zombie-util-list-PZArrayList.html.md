[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.util.list](package-summary.html)
2. [PZArrayList](PZArrayList.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [elements](#elements)
   2. [numElements](#numElements)
   3. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [PZArrayList(Class, int)](#%3Cinit%3E(java.lang.Class,int))
7. [Method Details](#method-detail)
   1. [get(int)](#get(int))
   2. [size()](#size())
   3. [indexOf(Object)](#indexOf(java.lang.Object))
   4. [indexOf(E1, Invokers.Params2.Boolean.ICallback)](#indexOf(E1,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   5. [isEmpty()](#isEmpty())
   6. [contains(Object)](#contains(java.lang.Object))
   7. [containsReference(E)](#containsReference(E))
   8. [contains(E1, Invokers.Params2.Boolean.ICallback)](#contains(E1,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   9. [iterator()](#iterator())
   10. [listIterator()](#listIterator())
   11. [listIterator(int)](#listIterator(int))
   12. [addUnique(E)](#addUnique(E))
   13. [addUniqueReference(E)](#addUniqueReference(E))
   14. [addUnique(E, Invokers.Params2.Boolean.ICallback)](#addUnique(E,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   15. [add(E)](#add(E))
   16. [add(int, E)](#add(int,E))
   17. [remove(int)](#remove(int))
   18. [remove(Object)](#remove(java.lang.Object))
   19. [removeAll(Collection)](#removeAll(java.util.Collection))
   20. [set(int, E)](#set(int,E))
   21. [clear()](#clear())
   22. [toString()](#toString())
   23. [getElements()](#getElements())
   24. [emptyList()](#emptyList())
   25. [ensureCapacity(int)](#ensureCapacity(int))
   26. [objectsEqual(E1, E2)](#objectsEqual(E1,E2))
   27. [referenceEqual(E1, E2)](#referenceEqual(E1,E2))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PZArrayList<E>
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.util.AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<E>

[java.util.AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<E>

zombie.util.list.PZArrayList<E>

All Implemented Interfaces:
:   `Iterable<E>, Collection<E>, List<E>, RandomAccess, SequencedCollection<E>`

---

public final class PZArrayList<E>
extends [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<E>
implements [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<E>, [RandomAccess](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/RandomAccess.html "class or interface in java.util")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private E[]`

  `elements`

  `private static final PZArrayList<Object>`

  `instance`

  `private int`

  `numElements`

  ### Fields inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#field-summary "class or interface in java.util")

  `modCount`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PZArrayList(Class<E> elementType,
  int initialCapacity)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(int index,
  E e)`

  `boolean`

  `add(E e)`

  `void`

  `addUnique(E newItem)`

  `void`

  `addUnique(E newItem,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<E,E> comparator)`

  `void`

  `addUniqueReference(E newItem)`

  `void`

  `clear()`

  `<E1> boolean`

  `contains(E1 o,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<E1,E> comparator)`

  `boolean`

  `contains(Object o)`

  `boolean`

  `containsReference(E o)`

  `static <E> AbstractList<E>`

  `emptyList()`

  `void`

  `ensureCapacity(int minCapacity)`

  `E`

  `get(int index)`

  `E[]`

  `getElements()`

  `<E1> int`

  `indexOf(E1 o,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<E1,E> comparator)`

  `int`

  `indexOf(Object o)`

  `boolean`

  `isEmpty()`

  `Iterator<E>`

  `iterator()`

  `ListIterator<E>`

  `listIterator()`

  `ListIterator<E>`

  `listIterator(int index)`

  `static <E1,E2> boolean`

  `objectsEqual(E1 a,
  E2 b)`

  `static <E1,E2> boolean`

  `referenceEqual(E1 a,
  E2 b)`

  `E`

  `remove(int index)`

  `boolean`

  `remove(Object o)`

  `boolean`

  `removeAll(Collection<?> c)`

  `E`

  `set(int index,
  E e)`

  `int`

  `size()`

  `String`

  `toString()`

  ### Methods inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#method-summary "class or interface in java.util")

  `addAll, equals, hashCode, lastIndexOf, removeRange, subList`

  ### Methods inherited from class [AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html#method-summary "class or interface in java.util")

  `addAll, containsAll, retainAll, toArray, toArray`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#method-summary "class or interface in java.util")

  `parallelStream, removeIf, stream, toArray`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach`

  ### Methods inherited from interface [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html#method-summary "class or interface in java.util")

  `addAll, addAll, addFirst, addLast, containsAll, equals, getFirst, getLast, hashCode, lastIndexOf, removeFirst, removeLast, replaceAll, retainAll, reversed, sort, spliterator, subList, toArray, toArray`

* Field Details
  -------------

  + ### elements

    private [E](#type-param-E "type parameter in PZArrayList")[] elements
  + ### numElements

    private int numElements
  + ### instance

    private static final [PZArrayList](PZArrayList.html "class in zombie.util.list")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> instance
* Constructor Details
  -------------------

  + ### PZArrayList

    public PZArrayList([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[E](#type-param-E "type parameter in PZArrayList")> elementType,
    int initialCapacity)
* Method Details
  --------------

  + ### get

    public [E](#type-param-E "type parameter in PZArrayList") get(int index)

    Specified by:
    :   `get` in interface `List<E>`

    Specified by:
    :   `get` in class `AbstractList<E>`
  + ### size

    public int size()

    Specified by:
    :   `size` in interface `Collection<E>`

    Specified by:
    :   `size` in interface `List<E>`

    Specified by:
    :   `size` in class `AbstractCollection<E>`
  + ### indexOf

    public int indexOf([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `indexOf` in interface `List<E>`

    Overrides:
    :   `indexOf` in class `AbstractList<E>`
  + ### indexOf

    public <E1> int indexOf(E1 o,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<E1,[E](#type-param-E "type parameter in PZArrayList")> comparator)
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in interface `Collection<E>`

    Specified by:
    :   `isEmpty` in interface `List<E>`

    Overrides:
    :   `isEmpty` in class `AbstractCollection<E>`
  + ### contains

    public boolean contains([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `contains` in interface `Collection<E>`

    Specified by:
    :   `contains` in interface `List<E>`

    Overrides:
    :   `contains` in class `AbstractCollection<E>`
  + ### containsReference

    public boolean containsReference([E](#type-param-E "type parameter in PZArrayList") o)
  + ### contains

    public <E1> boolean contains(E1 o,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<E1,[E](#type-param-E "type parameter in PZArrayList")> comparator)
  + ### iterator

    public [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZArrayList")> iterator()

    Specified by:
    :   `iterator` in interface `Collection<E>`

    Specified by:
    :   `iterator` in interface `Iterable<E>`

    Specified by:
    :   `iterator` in interface `List<E>`

    Overrides:
    :   `iterator` in class `AbstractList<E>`
  + ### listIterator

    public [ListIterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ListIterator.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZArrayList")> listIterator()

    Specified by:
    :   `listIterator` in interface `List<E>`

    Overrides:
    :   `listIterator` in class `AbstractList<E>`
  + ### listIterator

    public [ListIterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ListIterator.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZArrayList")> listIterator(int index)

    Specified by:
    :   `listIterator` in interface `List<E>`

    Overrides:
    :   `listIterator` in class `AbstractList<E>`
  + ### addUnique

    public void addUnique([E](#type-param-E "type parameter in PZArrayList") newItem)
  + ### addUniqueReference

    public void addUniqueReference([E](#type-param-E "type parameter in PZArrayList") newItem)
  + ### addUnique

    public void addUnique([E](#type-param-E "type parameter in PZArrayList") newItem,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<[E](#type-param-E "type parameter in PZArrayList"),[E](#type-param-E "type parameter in PZArrayList")> comparator)
  + ### add

    public boolean add([E](#type-param-E "type parameter in PZArrayList") e)

    Specified by:
    :   `add` in interface `Collection<E>`

    Specified by:
    :   `add` in interface `List<E>`

    Overrides:
    :   `add` in class `AbstractList<E>`
  + ### add

    public void add(int index,
    [E](#type-param-E "type parameter in PZArrayList") e)

    Specified by:
    :   `add` in interface `List<E>`

    Overrides:
    :   `add` in class `AbstractList<E>`
  + ### remove

    public [E](#type-param-E "type parameter in PZArrayList") remove(int index)

    Specified by:
    :   `remove` in interface `List<E>`

    Overrides:
    :   `remove` in class `AbstractList<E>`
  + ### remove

    public boolean remove([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `remove` in interface `Collection<E>`

    Specified by:
    :   `remove` in interface `List<E>`

    Overrides:
    :   `remove` in class `AbstractCollection<E>`
  + ### removeAll

    public boolean removeAll([Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<?> c)

    Specified by:
    :   `removeAll` in interface `Collection<E>`

    Specified by:
    :   `removeAll` in interface `List<E>`

    Overrides:
    :   `removeAll` in class `AbstractCollection<E>`
  + ### set

    public [E](#type-param-E "type parameter in PZArrayList") set(int index,
    [E](#type-param-E "type parameter in PZArrayList") e)

    Specified by:
    :   `set` in interface `List<E>`

    Overrides:
    :   `set` in class `AbstractList<E>`
  + ### clear

    public void clear()

    Specified by:
    :   `clear` in interface `Collection<E>`

    Specified by:
    :   `clear` in interface `List<E>`

    Overrides:
    :   `clear` in class `AbstractList<E>`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `AbstractCollection<E>`
  + ### getElements

    public [E](#type-param-E "type parameter in PZArrayList")[] getElements()
  + ### emptyList

    public static <E> [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<E> emptyList()
  + ### ensureCapacity

    public void ensureCapacity(int minCapacity)
  + ### objectsEqual

    public static <E1,E2> boolean objectsEqual(E1 a,
    E2 b)
  + ### referenceEqual

    public static <E1,E2> boolean referenceEqual(E1 a,
    E2 b)