[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [Array](Array.html)
3. [ArrayIterable](Array.ArrayIterable.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [array](#array)
   2. [allowRemove](#allowRemove)
   3. [iterator1](#iterator1)
   4. [iterator2](#iterator2)
6. [Constructor Details](#constructor-detail)
   1. [ArrayIterable(Array)](#%3Cinit%3E(zombie.entity.util.Array))
   2. [ArrayIterable(Array, boolean)](#%3Cinit%3E(zombie.entity.util.Array,boolean))
7. [Method Details](#method-detail)
   1. [iterator()](#iterator())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Array.ArrayIterable<T>
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.Array.ArrayIterable<T>

All Implemented Interfaces:
:   `Iterable<T>`

Enclosing class:
:   `Array<T>`

---

public static class Array.ArrayIterable<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<T>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `allowRemove`

  `private final Array<T>`

  `array`

  `private Array.ArrayIterator<T>`

  `iterator1`

  `private Array.ArrayIterator<T>`

  `iterator2`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ArrayIterable(Array<T> array)`

  `ArrayIterable(Array<T> array,
  boolean allowRemove)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Array.ArrayIterator<T>`

  `iterator()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

* Field Details
  -------------

  + ### array

    private final [Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> array
  + ### allowRemove

    private final boolean allowRemove
  + ### iterator1

    private [Array.ArrayIterator](Array.ArrayIterator.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> iterator1
  + ### iterator2

    private [Array.ArrayIterator](Array.ArrayIterator.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> iterator2
* Constructor Details
  -------------------

  + ### ArrayIterable

    public ArrayIterable([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> array)
  + ### ArrayIterable

    public ArrayIterable([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> array,
    boolean allowRemove)
* Method Details
  --------------

  + ### iterator

    public [Array.ArrayIterator](Array.ArrayIterator.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterable")> iterator()

    Specified by:
    :   `iterator` in interface `Iterable<T>`

    See Also:
    :   - `Collections.allocateIterators`