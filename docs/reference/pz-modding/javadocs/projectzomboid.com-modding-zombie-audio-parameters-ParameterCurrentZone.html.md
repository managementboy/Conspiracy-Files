[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.audio.parameters](package-summary.html)
2. [ParameterCurrentZone](ParameterCurrentZone.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [object](#object)
   2. [metaZone](#metaZone)
   3. [zone](#zone)
7. [Constructor Details](#constructor-detail)
   1. [ParameterCurrentZone(IsoObject)](#%3Cinit%3E(zombie.iso.IsoObject))
8. [Method Details](#method-detail)
   1. [calculateCurrentValue()](#calculateCurrentValue())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ParameterCurrentZone
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.FMODParameter

zombie.audio.FMODLocalParameter

zombie.audio.parameters.ParameterCurrentZone

---

public final class ParameterCurrentZone
extends zombie.audio.FMODLocalParameter

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static enum`

  `ParameterCurrentZone.Zone`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Zone`

  `metaZone`

  `private final IsoObject`

  `object`

  `private ParameterCurrentZone.Zone`

  `zone`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParameterCurrentZone(IsoObject object)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `calculateCurrentValue()`

  ### Methods inherited from class zombie.audio.FMODLocalParameter

  `setCurrentValue, startEventInstance, stopEventInstance`

  ### Methods inherited from class zombie.audio.FMODParameter

  `getCurrentValue, getName, getParameterDescription, getParameterID, resetToDefault, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### object

    private final [IsoObject](../../iso/IsoObject.html "class in zombie.iso") object
  + ### metaZone

    private [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") metaZone
  + ### zone

    private [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") zone
* Constructor Details
  -------------------

  + ### ParameterCurrentZone

    public ParameterCurrentZone([IsoObject](../../iso/IsoObject.html "class in zombie.iso") object)
* Method Details
  --------------

  + ### calculateCurrentValue

    public float calculateCurrentValue()

    Overrides:
    :   `calculateCurrentValue` in class `zombie.audio.FMODLocalParameter`