[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)
3. [ClimateNetInfo](ClimateManager.ClimateNetInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [isStopWeather](#isStopWeather)
   2. [isTrigger](#isTrigger)
   3. [isGenerate](#isGenerate)
   4. [triggerDuration](#triggerDuration)
   5. [triggerStorm](#triggerStorm)
   6. [triggerTropical](#triggerTropical)
   7. [triggerBlizzard](#triggerBlizzard)
   8. [generateStrength](#generateStrength)
   9. [generateFront](#generateFront)
6. [Constructor Details](#constructor-detail)
   1. [ClimateNetInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.ClimateNetInfo
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.ClimateNetInfo

Enclosing class:
:   `ClimateManager`

---

private static class ClimateManager.ClimateNetInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `generateFront`

  `float`

  `generateStrength`

  `boolean`

  `isGenerate`

  `boolean`

  `isStopWeather`

  `boolean`

  `isTrigger`

  `boolean`

  `triggerBlizzard`

  `float`

  `triggerDuration`

  `boolean`

  `triggerStorm`

  `boolean`

  `triggerTropical`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ClimateNetInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### isStopWeather

    public boolean isStopWeather
  + ### isTrigger

    public boolean isTrigger
  + ### isGenerate

    public boolean isGenerate
  + ### triggerDuration

    public float triggerDuration
  + ### triggerStorm

    public boolean triggerStorm
  + ### triggerTropical

    public boolean triggerTropical
  + ### triggerBlizzard

    public boolean triggerBlizzard
  + ### generateStrength

    public float generateStrength
  + ### generateFront

    public int generateFront
* Constructor Details
  -------------------

  + ### ClimateNetInfo

    private ClimateNetInfo()
* Method Details
  --------------

  + ### reset

    private void reset()