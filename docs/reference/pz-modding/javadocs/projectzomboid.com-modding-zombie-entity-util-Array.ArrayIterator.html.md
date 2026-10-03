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
3. [ArrayIterator](Array.ArrayIterator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [array](#array)
   2. [allowRemove](#allowRemove)
   3. [index](#index)
   4. [valid](#valid)
6. [Constructor Details](#constructor-detail)
   1. [ArrayIterator(Array)](#%3Cinit%3E(zombie.entity.util.Array))
   2. [ArrayIterator(Array, boolean)](#%3Cinit%3E(zombie.entity.util.Array,boolean))
7. [Method Details](#method-detail)
   1. [hasNext()](#hasNext())
   2. [next()](#next())
   3. [remove()](#remove())
   4. [reset()](#reset())
   5. [iterator()](#iterator())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Array.ArrayIterator<T>
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.Array.ArrayIterator<T>

All Implemented Interfaces:
:   `Iterable<T>, Iterator<T>`

Enclosing class:
:   `Array<T>`

---

public static class Array.ArrayIterator<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<T>, [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<T>

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

  `(package private) int`

  `index`

  `(package private) boolean`

  `valid`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ArrayIterator(Array<T> array)`

  `ArrayIterator(Array<T> array,
  boolean allowRemove)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `hasNext()`

  `Array.ArrayIterator<T>`

  `iterator()`

  `T`

  `next()`

  `void`

  `remove()`

  `void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

  ### Methods inherited from interface [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html#method-summary "class or interface in java.util")

  `forEachRemaining`

* Field Details
  -------------

  + ### array

    private final [Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterator")> array
  + ### allowRemove

    private final boolean allowRemove
  + ### index

    int index
  + ### valid

    boolean valid
* Constructor Details
  -------------------

  + ### ArrayIterator

    public ArrayIterator([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterator")> array)
  + ### ArrayIterator

    public ArrayIterator([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterator")> array,
    boolean allowRemove)
* Method Details
  --------------

  + ### hasNext

    public boolean hasNext()

    Specified by:
    :   `hasNext` in interface `Iterator<T>`
  + ### next

    public [T](#type-param-T "type parameter in Array.ArrayIterator") next()

    Specified by:
    :   `next` in interface `Iterator<T>`
  + ### remove

    public void remove()

    Specified by:
    :   `remove` in interface `Iterator<T>`
  + ### reset

    public void reset()
  + ### iterator

    public [Array.ArrayIterator](Array.ArrayIterator.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array.ArrayIterator")> iterator()

    Specified by:
    :   `iterator` in interface `Iterable<T>`