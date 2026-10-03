[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleDoor](VehicleDoor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [part](#part)
   2. [open](#open)
   3. [locked](#locked)
   4. [lockBroken](#lockBroken)
6. [Constructor Details](#constructor-detail)
   1. [VehicleDoor(VehiclePart)](#%3Cinit%3E(zombie.vehicles.VehiclePart))
7. [Method Details](#method-detail)
   1. [init(VehicleScript.Door)](#init(zombie.scripting.objects.VehicleScript.Door))
   2. [isOpen()](#isOpen())
   3. [setOpen(boolean)](#setOpen(boolean))
   4. [isLocked()](#isLocked())
   5. [setLocked(boolean)](#setLocked(boolean))
   6. [isLockBroken()](#isLockBroken())
   7. [setLockBroken(boolean)](#setLockBroken(boolean))
   8. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   9. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleDoor
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VehicleDoor

---

public final class VehicleDoor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `lockBroken`

  `protected boolean`

  `locked`

  `protected boolean`

  `open`

  `protected VehiclePart`

  `part`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleDoor(VehiclePart part)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init(VehicleScript.Door scriptDoor)`

  `boolean`

  `isLockBroken()`

  `boolean`

  `isLocked()`

  `boolean`

  `isOpen()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setLockBroken(boolean broken)`

  `void`

  `setLocked(boolean locked)`

  `void`

  `setOpen(boolean open)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### part

    protected [VehiclePart](VehiclePart.html "class in zombie.vehicles") part
  + ### open

    protected boolean open
  + ### locked

    protected boolean locked
  + ### lockBroken

    protected boolean lockBroken
* Constructor Details
  -------------------

  + ### VehicleDoor

    public VehicleDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
* Method Details
  --------------

  + ### init

    public void init([VehicleScript.Door](../scripting/objects/VehicleScript.Door.html "class in zombie.scripting.objects") scriptDoor)
  + ### isOpen

    public boolean isOpen()
  + ### setOpen

    public void setOpen(boolean open)
  + ### isLocked

    public boolean isLocked()
  + ### setLocked

    public void setLocked(boolean locked)
  + ### isLockBroken

    public boolean isLockBroken()
  + ### setLockBroken

    public void setLockBroken(boolean broken)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`