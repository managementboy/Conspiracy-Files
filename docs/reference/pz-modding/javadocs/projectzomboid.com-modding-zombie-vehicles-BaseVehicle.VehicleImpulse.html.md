[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [VehicleImpulse](BaseVehicle.VehicleImpulse.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [impulse](#impulse)
   3. [relPos](#relPos)
   4. [enable](#enable)
   5. [applied](#applied)
6. [Constructor Details](#constructor-detail)
   1. [VehicleImpulse()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc()](#alloc())
   2. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.VehicleImpulse
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.BaseVehicle.VehicleImpulse

Enclosing class:
:   `BaseVehicle`

---

private static final class BaseVehicle.VehicleImpulse
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `applied`

  `private boolean`

  `enable`

  `private final Vector3f`

  `impulse`

  `private static final ArrayDeque<BaseVehicle.VehicleImpulse>`

  `pool`

  `private final Vector3f`

  `relPos`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleImpulse()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static BaseVehicle.VehicleImpulse`

  `alloc()`

  `private void`

  `release()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[BaseVehicle.VehicleImpulse](BaseVehicle.VehicleImpulse.html "class in zombie.vehicles")> pool
  + ### impulse

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") impulse
  + ### relPos

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") relPos
  + ### enable

    private boolean enable
  + ### applied

    private boolean applied
* Constructor Details
  -------------------

  + ### VehicleImpulse

    private VehicleImpulse()
* Method Details
  --------------

  + ### alloc

    private static [BaseVehicle.VehicleImpulse](BaseVehicle.VehicleImpulse.html "class in zombie.vehicles") alloc()
  + ### release

    private void release()