[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.audio.parameters](package-summary.html)
2. [ParameterZone](ParameterZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [zoneName](#zoneName)
   2. [zones](#zones)
6. [Constructor Details](#constructor-detail)
   1. [ParameterZone(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [calculateCurrentValue()](#calculateCurrentValue())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ParameterZone
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.FMODParameter

zombie.audio.FMODGlobalParameter

zombie.audio.parameters.ParameterZone

---

public final class ParameterZone
extends zombie.audio.FMODGlobalParameter

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `zoneName`

  `private final ArrayList<Zone>`

  `zones`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParameterZone(String name,
  String zoneName)`
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

* Field Details
  -------------

  + ### zoneName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName
  + ### zones

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](../../iso/zones/Zone.html "class in zombie.iso.zones")> zones
* Constructor Details
  -------------------

  + ### ParameterZone

    public ParameterZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
* Method Details
  --------------

  + ### calculateCurrentValue

    public float calculateCurrentValue()

    Specified by:
    :   `calculateCurrentValue` in class `zombie.audio.FMODParameter`