[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UITransition](UITransition.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [duration](#duration)
   2. [elapsed](#elapsed)
   3. [frac](#frac)
   4. [fadeOut](#fadeOut)
   5. [ignoreUpdateTime](#ignoreUpdateTime)
   6. [updateTimeMs](#updateTimeMs)
   7. [currentTimeMS](#currentTimeMS)
   8. [elapsedTimeMS](#elapsedTimeMS)
6. [Constructor Details](#constructor-detail)
   1. [UITransition()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [UpdateAll()](#UpdateAll())
   2. [init(float, boolean)](#init(float,boolean))
   3. [update()](#update())
   4. [fraction()](#fraction())
   5. [setFadeIn(boolean)](#setFadeIn(boolean))
   6. [reset()](#reset())
   7. [setIgnoreUpdateTime(boolean)](#setIgnoreUpdateTime(boolean))
   8. [getElapsed()](#getElapsed())
   9. [setElapsed(float)](#setElapsed(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UITransition
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UITransition

---

public final class UITransition
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static long`

  `currentTimeMS`

  `private float`

  `duration`

  `private float`

  `elapsed`

  `private static long`

  `elapsedTimeMS`

  `private boolean`

  `fadeOut`

  `private float`

  `frac`

  `private boolean`

  `ignoreUpdateTime`

  `private long`

  `updateTimeMs`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UITransition()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `fraction()`

  `float`

  `getElapsed()`

  `void`

  `init(float duration,
  boolean fadeOut)`

  `void`

  `reset()`

  `void`

  `setElapsed(float elapsed)`

  `void`

  `setFadeIn(boolean fadeIn)`

  `void`

  `setIgnoreUpdateTime(boolean ignore)`

  `void`

  `update()`

  `static void`

  `UpdateAll()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### duration

    private float duration
  + ### elapsed

    private float elapsed
  + ### frac

    private float frac
  + ### fadeOut

    private boolean fadeOut
  + ### ignoreUpdateTime

    private boolean ignoreUpdateTime
  + ### updateTimeMs

    private long updateTimeMs
  + ### currentTimeMS

    private static long currentTimeMS
  + ### elapsedTimeMS

    private static long elapsedTimeMS
* Constructor Details
  -------------------

  + ### UITransition

    public UITransition()
* Method Details
  --------------

  + ### UpdateAll

    public static void UpdateAll()
  + ### init

    public void init(float duration,
    boolean fadeOut)
  + ### update

    public void update()
  + ### fraction

    public float fraction()
  + ### setFadeIn

    public void setFadeIn(boolean fadeIn)
  + ### reset

    public void reset()
  + ### setIgnoreUpdateTime

    public void setIgnoreUpdateTime(boolean ignore)
  + ### getElapsed

    public float getElapsed()
  + ### setElapsed

    public void setElapsed(float elapsed)