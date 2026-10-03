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
3. [Bucket](HashMap.Bucket.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [keys](#keys)
   2. [values](#values)
   3. [count](#count)
   4. [nextIndex](#nextIndex)
6. [Constructor Details](#constructor-detail)
   1. [Bucket()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [put(Object, Object)](#put(java.lang.Object,java.lang.Object))
   2. [remove(Object)](#remove(java.lang.Object))
   3. [grow()](#grow())
   4. [size()](#size())
   5. [clear()](#clear())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class HashMap.Bucket
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.utils.HashMap.Bucket

Enclosing class:
:   `HashMap`

---

private static class HashMap.Bucket
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `count`

  `Object[]`

  `keys`

  `int`

  `nextIndex`

  `Object[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Bucket()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `private void`

  `grow()`

  `void`

  `put(Object key,
  Object value)`

  `Object`

  `remove(Object key)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### keys

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] keys
  + ### values

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] values
  + ### count

    public int count
  + ### nextIndex

    public int nextIndex
* Constructor Details
  -------------------

  + ### Bucket

    private Bucket()
* Method Details
  --------------

  + ### put

    public void put([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)
    throws [IllegalStateException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalStateException.html "class or interface in java.lang")

    Throws:
    :   `IllegalStateException`
  + ### remove

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") remove([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### grow

    private void grow()
  + ### size

    public int size()
  + ### clear

    public void clear()