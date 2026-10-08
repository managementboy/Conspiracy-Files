[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoPlayer](IsoPlayer.html)
3. [VehicleContainer](IsoPlayer.VehicleContainer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicle](#vehicle)
   2. [containerIndex](#containerIndex)
6. [Constructor Details](#constructor-detail)
   1. [VehicleContainer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(BaseVehicle, int)](#set(zombie.vehicles.BaseVehicle,int))
   2. [equals(Object)](#equals(java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPlayer.VehicleContainer
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoPlayer.VehicleContainer

Enclosing class:
:   `IsoPlayer`

---

private static class IsoPlayer.VehicleContainer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `containerIndex`

  `private BaseVehicle`

  `vehicle`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleContainer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(Object other)`

  `IsoPlayer.VehicleContainer`

  `set(BaseVehicle vehicle,
  int containerIndex)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vehicle

    private [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle
  + ### containerIndex

    private int containerIndex
* Constructor Details
  -------------------

  + ### VehicleContainer

    private VehicleContainer()
* Method Details
  --------------

  + ### set

    public [IsoPlayer.VehicleContainer](IsoPlayer.VehicleContainer.html "class in zombie.characters") set([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    int containerIndex)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`