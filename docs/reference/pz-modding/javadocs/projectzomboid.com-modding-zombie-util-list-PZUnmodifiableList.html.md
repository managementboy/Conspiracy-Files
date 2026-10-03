[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.util.list](package-summary.html)
2. [PZUnmodifiableList](PZUnmodifiableList.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [list](#list)
6. [Constructor Details](#constructor-detail)
   1. [PZUnmodifiableList(List)](#%3Cinit%3E(java.util.List))
7. [Method Details](#method-detail)
   1. [wrap(List)](#wrap(java.util.List))
   2. [equals(Object)](#equals(java.lang.Object))
   3. [hashCode()](#hashCode())
   4. [get(int)](#get(int))
   5. [set(int, E)](#set(int,E))
   6. [add(int, E)](#add(int,E))
   7. [remove(int)](#remove(int))
   8. [indexOf(Object)](#indexOf(java.lang.Object))
   9. [lastIndexOf(Object)](#lastIndexOf(java.lang.Object))
   10. [addAll(int, Collection)](#addAll(int,java.util.Collection))
   11. [replaceAll(UnaryOperator)](#replaceAll(java.util.function.UnaryOperator))
   12. [sort(Comparator)](#sort(java.util.Comparator))
   13. [listIterator()](#listIterator())
   14. [listIterator(int)](#listIterator(int))
   15. [subList(int, int)](#subList(int,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PZUnmodifiableList<E>
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.list.PZUnmodifiableCollection<E>

zombie.util.list.PZUnmodifiableList<E>

All Implemented Interfaces:
:   `Iterable<E>, Collection<E>, List<E>, SequencedCollection<E>`

---

public class PZUnmodifiableList<E>
extends zombie.util.list.PZUnmodifiableCollection<E>
implements [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<E>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final List<? extends E>`

  `list`

  ### Fields inherited from class zombie.util.list.PZUnmodifiableCollection

  `c`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PZUnmodifiableList(List<? extends E> list)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(int index,
  E element)`

  `boolean`

  `addAll(int index,
  Collection<? extends E> c)`

  `boolean`

  `equals(Object o)`

  `E`

  `get(int index)`

  `int`

  `hashCode()`

  `int`

  `indexOf(Object o)`

  `int`

  `lastIndexOf(Object o)`

  `ListIterator<E>`

  `listIterator()`

  `ListIterator<E>`

  `listIterator(int index)`

  `E`

  `remove(int index)`

  `void`

  `replaceAll(UnaryOperator<E> operator)`

  `E`

  `set(int index,
  E element)`

  `void`

  `sort(Comparator<? super E> c)`

  `List<E>`

  `subList(int fromIndex,
  int toIndex)`

  `static <T> List<T>`

  `wrap(List<? extends T> list)`

  ### Methods inherited from class zombie.util.list.PZUnmodifiableCollection

  `add, addAll, clear, contains, containsAll, forEach, isEmpty, iterator, parallelStream, remove, removeAll, removeIf, retainAll, size, spliterator, stream, toArray, toArray, toArray, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#method-summary "class or interface in java.util")

  `parallelStream, removeIf, stream, toArray`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach`

  ### Methods inherited from interface [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html#method-summary "class or interface in java.util")

  `add, addAll, addFirst, addLast, clear, contains, containsAll, getFirst, getLast, isEmpty, iterator, remove, removeAll, removeFirst, removeLast, retainAll, reversed, size, spliterator, toArray, toArray`

* Field Details
  -------------

  + ### list

    final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<? extends [E](#type-param-E "type parameter in PZUnmodifiableList")> list
* Constructor Details
  -------------------

  + ### PZUnmodifiableList

    PZUnmodifiableList([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<? extends [E](#type-param-E "type parameter in PZUnmodifiableList")> list)
* Method Details
  --------------

  + ### wrap

    public static <T> [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<T> wrap([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<? extends T> list)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `equals` in interface `Collection<E>`

    Specified by:
    :   `equals` in interface `List<E>`

    Overrides:
    :   `equals` in class `Object`
  + ### hashCode

    public int hashCode()

    Specified by:
    :   `hashCode` in interface `Collection<E>`

    Specified by:
    :   `hashCode` in interface `List<E>`

    Overrides:
    :   `hashCode` in class `Object`
  + ### get

    public [E](#type-param-E "type parameter in PZUnmodifiableList") get(int index)

    Specified by:
    :   `get` in interface `List<E>`
  + ### set

    public [E](#type-param-E "type parameter in PZUnmodifiableList") set(int index,
    [E](#type-param-E "type parameter in PZUnmodifiableList") element)

    Specified by:
    :   `set` in interface `List<E>`
  + ### add

    public void add(int index,
    [E](#type-param-E "type parameter in PZUnmodifiableList") element)

    Specified by:
    :   `add` in interface `List<E>`
  + ### remove

    public [E](#type-param-E "type parameter in PZUnmodifiableList") remove(int index)

    Specified by:
    :   `remove` in interface `List<E>`
  + ### indexOf

    public int indexOf([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `indexOf` in interface `List<E>`
  + ### lastIndexOf

    public int lastIndexOf([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `lastIndexOf` in interface `List<E>`
  + ### addAll

    public boolean addAll(int index,
    [Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<? extends [E](#type-param-E "type parameter in PZUnmodifiableList")> c)

    Specified by:
    :   `addAll` in interface `List<E>`
  + ### replaceAll

    public void replaceAll([UnaryOperator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/UnaryOperator.html "class or interface in java.util.function")<[E](#type-param-E "type parameter in PZUnmodifiableList")> operator)

    Specified by:
    :   `replaceAll` in interface `List<E>`
  + ### sort

    public void sort([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [E](#type-param-E "type parameter in PZUnmodifiableList")> c)

    Specified by:
    :   `sort` in interface `List<E>`
  + ### listIterator

    public [ListIterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ListIterator.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZUnmodifiableList")> listIterator()

    Specified by:
    :   `listIterator` in interface `List<E>`
  + ### listIterator

    public [ListIterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ListIterator.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZUnmodifiableList")> listIterator(int index)

    Specified by:
    :   `listIterator` in interface `List<E>`
  + ### subList

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[E](#type-param-E "type parameter in PZUnmodifiableList")> subList(int fromIndex,
    int toIndex)

    Specified by:
    :   `subList` in interface `List<E>`