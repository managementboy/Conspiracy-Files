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
3. [Iterator](HashMap.Iterator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [hashMap](#hashMap)
   2. [bucketIdx](#bucketIdx)
   3. [keyValuePairIdx](#keyValuePairIdx)
   4. [elementIdx](#elementIdx)
   5. [currentKey](#currentKey)
   6. [currentValue](#currentValue)
6. [Constructor Details](#constructor-detail)
   1. [Iterator(HashMap)](#%3Cinit%3E(zombie.core.utils.HashMap))
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [hasNext()](#hasNext())
   3. [advance()](#advance())
   4. [getKey()](#getKey())
   5. [getValue()](#getValue())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class HashMap.Iterator
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.utils.HashMap.Iterator

Enclosing class:
:   `HashMap`

---

public static class HashMap.Iterator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `bucketIdx`

  `private Object`

  `currentKey`

  `private Object`

  `currentValue`

  `private int`

  `elementIdx`

  `private final HashMap`

  `hashMap`

  `private int`

  `keyValuePairIdx`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Iterator(HashMap hashmap)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `advance()`

  `Object`

  `getKey()`

  `Object`

  `getValue()`

  `boolean`

  `hasNext()`

  `HashMap.Iterator`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### hashMap

    private final [HashMap](HashMap.html "class in zombie.core.utils") hashMap
  + ### bucketIdx

    private int bucketIdx
  + ### keyValuePairIdx

    private int keyValuePairIdx
  + ### elementIdx

    private int elementIdx
  + ### currentKey

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") currentKey
  + ### currentValue

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") currentValue
* Constructor Details
  -------------------

  + ### Iterator

    public Iterator([HashMap](HashMap.html "class in zombie.core.utils") hashmap)
* Method Details
  --------------

  + ### reset

    public [HashMap.Iterator](HashMap.Iterator.html "class in zombie.core.utils") reset()
  + ### hasNext

    public boolean hasNext()
  + ### advance

    public boolean advance()
  + ### getKey

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getKey()
  + ### getValue

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getValue()