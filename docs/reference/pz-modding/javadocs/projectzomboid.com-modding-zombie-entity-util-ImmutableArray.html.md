[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [ImmutableArray](ImmutableArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [array](#array)
   2. [iterable](#iterable)
6. [Constructor Details](#constructor-detail)
   1. [ImmutableArray(Array)](#%3Cinit%3E(zombie.entity.util.Array))
7. [Method Details](#method-detail)
   1. [size()](#size())
   2. [get(int)](#get(int))
   3. [contains(T, boolean)](#contains(T,boolean))
   4. [indexOf(T, boolean)](#indexOf(T,boolean))
   5. [lastIndexOf(T, boolean)](#lastIndexOf(T,boolean))
   6. [peek()](#peek())
   7. [first()](#first())
   8. [random()](#random())
   9. [toArray()](#toArray())
   10. [toArray(Class)](#toArray(java.lang.Class))
   11. [hashCode()](#hashCode())
   12. [equals(Object)](#equals(java.lang.Object))
   13. [toString()](#toString())
   14. [toString(String)](#toString(java.lang.String))
   15. [iterator()](#iterator())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ImmutableArray<T>
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.ImmutableArray<T>

All Implemented Interfaces:
:   `Iterable<T>`

---

public class ImmutableArray<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<T>

Wrapper class to treat [`Array`](Array.html "class in zombie.entity.util") objects as if they were immutable. However, note that the values could be modified if they
are mutable.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Array<T>`

  `array`

  `private Array.ArrayIterable<T>`

  `iterable`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ImmutableArray(Array<T> array)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `contains(T value,
  boolean identity)`

  `boolean`

  `equals(Object object)`

  `T`

  `first()`

  `T`

  `get(int index)`

  `int`

  `hashCode()`

  `int`

  `indexOf(T value,
  boolean identity)`

  `Iterator<T>`

  `iterator()`

  `int`

  `lastIndexOf(T value,
  boolean identity)`

  `T`

  `peek()`

  `T`

  `random()`

  `int`

  `size()`

  `T[]`

  `toArray()`

  `<V> V[]`

  `toArray(Class<V> type)`

  `String`

  `toString()`

  `String`

  `toString(String separator)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

* Field Details
  -------------

  + ### array

    private final [Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in ImmutableArray")> array
  + ### iterable

    private [Array.ArrayIterable](Array.ArrayIterable.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in ImmutableArray")> iterable
* Constructor Details
  -------------------

  + ### ImmutableArray

    public ImmutableArray([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in ImmutableArray")> array)
* Method Details
  --------------

  + ### size

    public int size()
  + ### get

    public [T](#type-param-T "type parameter in ImmutableArray") get(int index)
  + ### contains

    public boolean contains([T](#type-param-T "type parameter in ImmutableArray") value,
    boolean identity)
  + ### indexOf

    public int indexOf([T](#type-param-T "type parameter in ImmutableArray") value,
    boolean identity)
  + ### lastIndexOf

    public int lastIndexOf([T](#type-param-T "type parameter in ImmutableArray") value,
    boolean identity)
  + ### peek

    public [T](#type-param-T "type parameter in ImmutableArray") peek()
  + ### first

    public [T](#type-param-T "type parameter in ImmutableArray") first()
  + ### random

    public [T](#type-param-T "type parameter in ImmutableArray") random()
  + ### toArray

    public [T](#type-param-T "type parameter in ImmutableArray")[] toArray()
  + ### toArray

    public <V> V[] toArray([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<V> type)
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") object)

    Overrides:
    :   `equals` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### iterator

    public [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[T](#type-param-T "type parameter in ImmutableArray")> iterator()

    Specified by:
    :   `iterator` in interface `Iterable<T>`