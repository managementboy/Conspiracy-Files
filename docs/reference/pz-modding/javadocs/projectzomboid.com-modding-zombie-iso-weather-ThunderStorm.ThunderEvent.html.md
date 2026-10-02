[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ThunderStorm](ThunderStorm.html)
3. [ThunderEvent](ThunderStorm.ThunderEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [eventX](#eventX)
   2. [eventY](#eventY)
   3. [doLightning](#doLightning)
   4. [doRumble](#doRumble)
   5. [doStrike](#doStrike)
   6. [soundDelay](#soundDelay)
   7. [isRunning](#isRunning)
6. [Constructor Details](#constructor-detail)
   1. [ThunderEvent()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ThunderStorm.ThunderEvent
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ThunderStorm.ThunderEvent

Enclosing class:
:   `ThunderStorm`

---

private static class ThunderStorm.ThunderEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `doLightning`

  `private boolean`

  `doRumble`

  `private boolean`

  `doStrike`

  `private int`

  `eventX`

  `private int`

  `eventY`

  `private boolean`

  `isRunning`

  `private final GameTime.AnimTimer`

  `soundDelay`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ThunderEvent()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### eventX

    private int eventX
  + ### eventY

    private int eventY
  + ### doLightning

    private boolean doLightning
  + ### doRumble

    private boolean doRumble
  + ### doStrike

    private boolean doStrike
  + ### soundDelay

    private final [GameTime.AnimTimer](../../GameTime.AnimTimer.html "class in zombie") soundDelay
  + ### isRunning

    private boolean isRunning
* Constructor Details
  -------------------

  + ### ThunderEvent

    private ThunderEvent()