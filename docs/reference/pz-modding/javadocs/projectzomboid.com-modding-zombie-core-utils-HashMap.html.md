[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.utils](package-summary.html)
2. [HashMap](HashMap.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [capacity](#capacity)
   2. [elements](#elements)
   3. [buckets](#buckets)
7. [Constructor Details](#constructor-detail)
   1. [HashMap()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [clear()](#clear())
   2. [grow()](#grow())
   3. [get(Object)](#get(java.lang.Object))
   4. [remove(Object)](#remove(java.lang.Object))
   5. [put(Object, Object)](#put(java.lang.Object,java.lang.Object))
   6. [size()](#size())
   7. [isEmpty()](#isEmpty())
   8. [iterator()](#iterator())
   9. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class HashMap
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.utils.HashMap

---

public class HashMap
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `HashMap.Bucket`

  `static class`

  `HashMap.Iterator`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private HashMap.Bucket[]`

  `buckets`

  `private int`

  `capacity`

  `private int`

  `elements`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HashMap()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `Object`

  `get(Object key)`

  `private void`

  `grow()`

  `boolean`

  `isEmpty()`

  `HashMap.Iterator`

  `iterator()`

  `Object`

  `put(Object key,
  Object value)`

  `Object`

  `remove(Object key)`

  `int`

  `size()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### capacity

    private int capacity
  + ### elements

    private int elements
  + ### buckets

    private [HashMap.Bucket](HashMap.Bucket.html "class in zombie.core.utils")[] buckets
* Constructor Details
  -------------------

  + ### HashMap

    public HashMap()
* Method Details
  --------------

  + ### clear

    public void clear()
  + ### grow

    private void grow()
  + ### get

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") get([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### remove

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") remove([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### put

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") put([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)
  + ### size

    public int size()
  + ### isEmpty

    public boolean isEmpty()
  + ### iterator

    public [HashMap.Iterator](HashMap.Iterator.html "class in zombie.core.utils") iterator()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`