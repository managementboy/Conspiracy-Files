[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [RadarPanel](RadarPanel.html)
3. [ZombiePosPool](RadarPanel.ZombiePosPool.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
6. [Constructor Details](#constructor-detail)
   1. [ZombiePosPool()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc(float, float)](#alloc(float,float))
   2. [release(Collection)](#release(java.util.Collection))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadarPanel.ZombiePosPool
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.RadarPanel.ZombiePosPool

Enclosing class:
:   `RadarPanel`

---

private static class RadarPanel.ZombiePosPool
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayDeque<RadarPanel.ZombiePos>`

  `pool`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ZombiePosPool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `RadarPanel.ZombiePos`

  `alloc(float x,
  float y)`

  `void`

  `release(Collection<RadarPanel.ZombiePos> other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[RadarPanel.ZombiePos](RadarPanel.ZombiePos.html "class in zombie.ui")> pool
* Constructor Details
  -------------------

  + ### ZombiePosPool

    private ZombiePosPool()
* Method Details
  --------------

  + ### alloc

    public [RadarPanel.ZombiePos](RadarPanel.ZombiePos.html "class in zombie.ui") alloc(float x,
    float y)
  + ### release

    public void release([Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<[RadarPanel.ZombiePos](RadarPanel.ZombiePos.html "class in zombie.ui")> other)