[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [VehicleScript](VehicleScript.html)
3. [Container](VehicleScript.Container.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [capacity](#capacity)
   2. [seat](#seat)
   3. [seatId](#seatId)
   4. [luaTest](#luaTest)
   5. [contentType](#contentType)
   6. [conditionAffectsCapacity](#conditionAffectsCapacity)
   7. [soundMap](#soundMap)
6. [Constructor Details](#constructor-detail)
   1. [Container()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getSoundByID(SoundMapKey)](#getSoundByID(zombie.scripting.objects.SoundMapKey))
   2. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Container
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Container

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Container
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `capacity`

  `boolean`

  `conditionAffectsCapacity`

  `String`

  `contentType`

  `String`

  `luaTest`

  `int`

  `seat`

  `String`

  `seatId`

  `final Map<String,String>`

  `soundMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Container()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getSoundByID(SoundMapKey id)`

  `(package private) VehicleScript.Container`

  `makeCopy()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### capacity

    public int capacity
  + ### seat

    public int seat
  + ### seatId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seatId
  + ### luaTest

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaTest
  + ### contentType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") contentType
  + ### conditionAffectsCapacity

    public boolean conditionAffectsCapacity
  + ### soundMap

    public final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> soundMap
* Constructor Details
  -------------------

  + ### Container

    public Container()
* Method Details
  --------------

  + ### getSoundByID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundByID([SoundMapKey](SoundMapKey.html "class in zombie.scripting.objects") id)
  + ### makeCopy

    [VehicleScript.Container](VehicleScript.Container.html "class in zombie.scripting.objects") makeCopy()