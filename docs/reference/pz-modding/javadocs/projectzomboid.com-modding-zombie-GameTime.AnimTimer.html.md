[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameTime](GameTime.html)
3. [AnimTimer](GameTime.AnimTimer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [elapsed](#elapsed)
   2. [duration](#duration)
   3. [finished](#finished)
   4. [ticks](#ticks)
6. [Constructor Details](#constructor-detail)
   1. [AnimTimer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int)](#init(int))
   2. [update()](#update())
   3. [ratio()](#ratio())
   4. [finished()](#finished())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameTime.AnimTimer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameTime.AnimTimer

Enclosing class:
:   `GameTime`

---

public static class GameTime.AnimTimer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `duration`

  `float`

  `elapsed`

  `boolean`

  `finished`

  `int`

  `ticks`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimTimer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `finished()`

  `void`

  `init(int ticks)`

  `float`

  `ratio()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### elapsed

    public float elapsed
  + ### duration

    public float duration
  + ### finished

    public boolean finished
  + ### ticks

    public int ticks
* Constructor Details
  -------------------

  + ### AnimTimer

    public AnimTimer()
* Method Details
  --------------

  + ### init

    public void init(int ticks)
  + ### update

    public void update()
  + ### ratio

    public float ratio()
  + ### finished

    public boolean finished()