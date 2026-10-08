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
3. [Passenger](VehicleScript.Passenger.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [id](#id)
   2. [anims](#anims)
   3. [switchSeats](#switchSeats)
   4. [hasRoof](#hasRoof)
   5. [showPassenger](#showPassenger)
   6. [door](#door)
   7. [door2](#door2)
   8. [area](#area)
   9. [positions](#positions)
7. [Constructor Details](#constructor-detail)
   1. [Passenger()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [makeCopy()](#makeCopy())
   3. [getPositionCount()](#getPositionCount())
   4. [getPosition(int)](#getPosition(int))
   5. [getPositionById(String)](#getPositionById(java.lang.String))
   6. [getSwitchSeatById(String)](#getSwitchSeatById(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Passenger
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Passenger

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Passenger
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `VehicleScript.Passenger.SwitchSeat`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<VehicleScript.Anim>`

  `anims`

  `String`

  `area`

  `String`

  `door`

  `String`

  `door2`

  `boolean`

  `hasRoof`

  `String`

  `id`

  `final ArrayList<VehicleScript.Position>`

  `positions`

  `boolean`

  `showPassenger`

  `final ArrayList<VehicleScript.Passenger.SwitchSeat>`

  `switchSeats`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Passenger()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getId()`

  `VehicleScript.Position`

  `getPosition(int index)`

  `VehicleScript.Position`

  `getPositionById(String id)`

  `int`

  `getPositionCount()`

  `VehicleScript.Passenger.SwitchSeat`

  `getSwitchSeatById(String id)`

  `VehicleScript.Passenger`

  `makeCopy()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### anims

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects")> anims
  + ### switchSeats

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Passenger.SwitchSeat](VehicleScript.Passenger.SwitchSeat.html "class in zombie.scripting.objects")> switchSeats
  + ### hasRoof

    public boolean hasRoof
  + ### showPassenger

    public boolean showPassenger
  + ### door

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") door
  + ### door2

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") door2
  + ### area

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") area
  + ### positions

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects")> positions
* Constructor Details
  -------------------

  + ### Passenger

    public Passenger()
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### makeCopy

    public [VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects") makeCopy()
  + ### getPositionCount

    public int getPositionCount()
  + ### getPosition

    public [VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects") getPosition(int index)
  + ### getPositionById

    public [VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects") getPositionById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getSwitchSeatById

    public [VehicleScript.Passenger.SwitchSeat](VehicleScript.Passenger.SwitchSeat.html "class in zombie.scripting.objects") getSwitchSeatById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)