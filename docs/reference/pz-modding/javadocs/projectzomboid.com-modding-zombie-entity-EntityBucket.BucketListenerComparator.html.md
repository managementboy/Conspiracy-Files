[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [EntityBucket](EntityBucket.html)
3. [BucketListenerComparator](EntityBucket.BucketListenerComparator.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [BucketListenerComparator()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(EntityBucket.BucketListenerData, EntityBucket.BucketListenerData)](#compare(zombie.entity.EntityBucket.BucketListenerData,zombie.entity.EntityBucket.BucketListenerData))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EntityBucket.BucketListenerComparator
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.EntityBucket.BucketListenerComparator

All Implemented Interfaces:
:   `Comparator<EntityBucket.BucketListenerData>`

Enclosing class:
:   `EntityBucket`

---

private static class EntityBucket.BucketListenerComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[EntityBucket.BucketListenerData](EntityBucket.BucketListenerData.html "class in zombie.entity")>

* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BucketListenerComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(EntityBucket.BucketListenerData a,
  EntityBucket.BucketListenerData b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### BucketListenerComparator

    private BucketListenerComparator()
* Method Details
  --------------

  + ### compare

    public int compare([EntityBucket.BucketListenerData](EntityBucket.BucketListenerData.html "class in zombie.entity") a,
    [EntityBucket.BucketListenerData](EntityBucket.BucketListenerData.html "class in zombie.entity") b)

    Specified by:
    :   `compare` in interface `Comparator<EntityBucket.BucketListenerData>`