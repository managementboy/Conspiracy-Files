[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.audio.parameters](package-summary.html)
2. [ParameterTemperature](ParameterTemperature.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ParameterTemperature()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [calculateCurrentValue()](#calculateCurrentValue())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ParameterTemperature
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.FMODParameter

zombie.audio.FMODGlobalParameter

zombie.audio.parameters.ParameterTemperature

---

public final class ParameterTemperature
extends zombie.audio.FMODGlobalParameter

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParameterTemperature()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `calculateCurrentValue()`

  ### Methods inherited from class zombie.audio.FMODGlobalParameter

  `setCurrentValue, startEventInstance, stopEventInstance`

  ### Methods inherited from class zombie.audio.FMODParameter

  `getCurrentValue, getName, getParameterDescription, getParameterID, resetToDefault, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ParameterTemperature

    public ParameterTemperature()
* Method Details
  --------------

  + ### calculateCurrentValue

    public float calculateCurrentValue()

    Specified by:
    :   `calculateCurrentValue` in class `zombie.audio.FMODParameter`