[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.advancedanimation.debug](package-summary.html)
2. [AnimatorDebugMonitor](AnimatorDebugMonitor.html)
3. [MonitoredVar](AnimatorDebugMonitor.MonitoredVar.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [key](#key)
   2. [value](#value)
   3. [isFloat](#isFloat)
   4. [valFloat](#valFloat)
   5. [active](#active)
   6. [updated](#updated)
   7. [floats](#floats)
   8. [index](#index)
   9. [min](#min)
   10. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [MonitoredVar()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [logFloat(float)](#logFloat(float))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class AnimatorDebugMonitor.MonitoredVar
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.MonitoredVar

Enclosing class:
:   `AnimatorDebugMonitor`

---

private class AnimatorDebugMonitor.MonitoredVar
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `active`

  `(package private) float[]`

  `floats`

  `(package private) int`

  `index`

  `(package private) boolean`

  `isFloat`

  `(package private) String`

  `key`

  `(package private) float`

  `max`

  `(package private) float`

  `min`

  `(package private) boolean`

  `updated`

  `(package private) float`

  `valFloat`

  `(package private) String`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MonitoredVar()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `logFloat(float f)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### key

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key
  + ### value

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value
  + ### isFloat

    boolean isFloat
  + ### valFloat

    float valFloat
  + ### active

    boolean active
  + ### updated

    boolean updated
  + ### floats

    float[] floats
  + ### index

    int index
  + ### min

    float min
  + ### max

    float max
* Constructor Details
  -------------------

  + ### MonitoredVar

    private MonitoredVar()
* Method Details
  --------------

  + ### logFloat

    public void logFloat(float f)