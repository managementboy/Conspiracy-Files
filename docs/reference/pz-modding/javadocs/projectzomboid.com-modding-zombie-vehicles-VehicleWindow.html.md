[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleWindow](VehicleWindow.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [part](#part)
   2. [openable](#openable)
   3. [open](#open)
   4. [openDelta](#openDelta)
6. [Constructor Details](#constructor-detail)
   1. [VehicleWindow(VehiclePart)](#%3Cinit%3E(zombie.vehicles.VehiclePart))
7. [Method Details](#method-detail)
   1. [init(VehicleScript.Window)](#init(zombie.scripting.objects.VehicleScript.Window))
   2. [getHealth()](#getHealth())
   3. [isDestroyed()](#isDestroyed())
   4. [isOpenable()](#isOpenable())
   5. [isOpen()](#isOpen())
   6. [setOpen(boolean)](#setOpen(boolean))
   7. [setOpenDelta(float)](#setOpenDelta(float))
   8. [getOpenDelta()](#getOpenDelta())
   9. [getPart()](#getPart())
   10. [isHittable()](#isHittable())
   11. [hit(IsoGameCharacter)](#hit(zombie.characters.IsoGameCharacter))
   12. [damage(int)](#damage(int))
   13. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   14. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleWindow
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VehicleWindow

---

public final class VehicleWindow
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `open`

  `protected boolean`

  `openable`

  `private float`

  `openDelta`

  `protected VehiclePart`

  `part`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleWindow(VehiclePart part)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `damage(int amount)`

  `int`

  `getHealth()`

  `float`

  `getOpenDelta()`

  `VehiclePart`

  `getPart()`

  `void`

  `hit(IsoGameCharacter chr)`

  `void`

  `init(VehicleScript.Window scriptWindow)`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isHittable()`

  `boolean`

  `isOpen()`

  `boolean`

  `isOpenable()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setOpen(boolean open)`

  `void`

  `setOpenDelta(float delta)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### part

    protected [VehiclePart](VehiclePart.html "class in zombie.vehicles") part
  + ### openable

    protected boolean openable
  + ### open

    protected boolean open
  + ### openDelta

    private float openDelta
* Constructor Details
  -------------------

  + ### VehicleWindow

    public VehicleWindow([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
* Method Details
  --------------

  + ### init

    public void init([VehicleScript.Window](../scripting/objects/VehicleScript.Window.html "class in zombie.scripting.objects") scriptWindow)
  + ### getHealth

    public int getHealth()
  + ### isDestroyed

    public boolean isDestroyed()
  + ### isOpenable

    public boolean isOpenable()
  + ### isOpen

    public boolean isOpen()
  + ### setOpen

    public void setOpen(boolean open)
  + ### setOpenDelta

    public void setOpenDelta(float delta)
  + ### getOpenDelta

    public float getOpenDelta()
  + ### getPart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPart()
  + ### isHittable

    public boolean isHittable()
  + ### hit

    public void hit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### damage

    public void damage(int amount)
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