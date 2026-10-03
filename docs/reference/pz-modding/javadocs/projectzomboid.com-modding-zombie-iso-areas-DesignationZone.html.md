[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [DesignationZone](DesignationZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [hourLastSeen](#hourLastSeen)
   3. [lastActionTimestamp](#lastActionTimestamp)
   4. [name](#name)
   5. [type](#type)
   6. [x](#x)
   7. [y](#y)
   8. [z](#z)
   9. [w](#w)
   10. [h](#h)
   11. [streamed](#streamed)
   12. [lastUpdate](#lastUpdate)
   13. [allZones](#allZones)
6. [Constructor Details](#constructor-detail)
   1. [DesignationZone()](#%3Cinit%3E())
   2. [DesignationZone(String, String, int, int, int, int, int, boolean)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,boolean))
7. [Method Details](#method-detail)
   1. [addZone(String, String, int, int, int, int, int)](#addZone(java.lang.String,java.lang.String,int,int,int,int,int))
   2. [doMeta(int)](#doMeta(int))
   3. [isStillStreamed()](#isStillStreamed())
   4. [removeZone(String, String)](#removeZone(java.lang.String,java.lang.String))
   5. [removeZone(DesignationZone, boolean)](#removeZone(zombie.iso.areas.DesignationZone,boolean))
   6. [getZoneByName(String)](#getZoneByName(java.lang.String))
   7. [getZoneByNameAndType(String, String)](#getZoneByNameAndType(java.lang.String,java.lang.String))
   8. [getZone(int, int, int)](#getZone(int,int,int))
   9. [getZoneByType(String, int, int, int)](#getZoneByType(java.lang.String,int,int,int))
   10. [isFullyStreamed()](#isFullyStreamed())
   11. [getZoneById(Double)](#getZoneById(java.lang.Double))
   12. [unloading()](#unloading())
   13. [loading()](#loading())
   14. [checkStreamed()](#checkStreamed())
   15. [getRandomSquare()](#getRandomSquare())
   16. [getRandomFreeSquare()](#getRandomFreeSquare())
   17. [getAllZonesByType(String)](#getAllZonesByType(java.lang.String))
   18. [getName()](#getName())
   19. [setName(String)](#setName(java.lang.String))
   20. [update()](#update())
   21. [check()](#check())
   22. [getW()](#getW())
   23. [getH()](#getH())
   24. [getX()](#getX())
   25. [getY()](#getY())
   26. [getZ()](#getZ())
   27. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   28. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   29. [Reset()](#Reset())
   30. [getId()](#getId())
   31. [sync()](#sync())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DesignationZone
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.DesignationZone

Direct Known Subclasses:
:   `DesignationZoneAnimal`

---

public class DesignationZone
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ArrayList<DesignationZone>`

  `allZones`

  `int`

  `h`

  `int`

  `hourLastSeen`

  `Double`

  `id`

  `int`

  `lastActionTimestamp`

  `static long`

  `lastUpdate`

  `String`

  `name`

  `boolean`

  `streamed`

  `String`

  `type`

  `int`

  `w`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DesignationZone()`

  `DesignationZone(String type,
  String name,
  int x,
  int y,
  int z,
  int x2,
  int y2,
  boolean doSync)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static DesignationZone`

  `addZone(String type,
  String name,
  int x,
  int y,
  int z,
  int x2,
  int y2)`

  `void`

  `check()`

  `private void`

  `checkStreamed()`

  Check if a zone disapear (not fully streamed) or not

  `void`

  `doMeta(int hours)`

  `static ArrayList<DesignationZone>`

  `getAllZonesByType(String type)`

  `int`

  `getH()`

  `Double`

  `getId()`

  `String`

  `getName()`

  `IsoGridSquare`

  `getRandomFreeSquare()`

  `IsoGridSquare`

  `getRandomSquare()`

  `int`

  `getW()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `static DesignationZone`

  `getZone(int x,
  int y,
  int z)`

  `static DesignationZone`

  `getZoneById(Double id)`

  `static DesignationZone`

  `getZoneByName(String name)`

  `static DesignationZone`

  `getZoneByNameAndType(String type,
  String name)`

  `static DesignationZone`

  `getZoneByType(String type,
  int x,
  int y,
  int z)`

  `boolean`

  `isFullyStreamed()`

  `boolean`

  `isStillStreamed()`

  `static DesignationZone`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `loading()`

  `static void`

  `removeZone(String type,
  String name)`

  `static void`

  `removeZone(DesignationZone zone,
  boolean doSync)`

  `static void`

  `Reset()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setName(String name)`

  `protected void`

  `sync()`

  `void`

  `unloading()`

  Is our zone fully unloaded, in this case we need to save the current world age so when the zone is loaded back in we'll know how much hours passed

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") id
  + ### hourLastSeen

    public int hourLastSeen
  + ### lastActionTimestamp

    public int lastActionTimestamp
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### w

    public int w
  + ### h

    public int h
  + ### streamed

    public boolean streamed
  + ### lastUpdate

    public static long lastUpdate
  + ### allZones

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZone](DesignationZone.html "class in zombie.iso.areas")> allZones
* Constructor Details
  -------------------

  + ### DesignationZone

    public DesignationZone()
  + ### DesignationZone

    public DesignationZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int z,
    int x2,
    int y2,
    boolean doSync)
* Method Details
  --------------

  + ### addZone

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") addZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int z,
    int x2,
    int y2)
  + ### doMeta

    public void doMeta(int hours)
  + ### isStillStreamed

    public boolean isStillStreamed()
  + ### removeZone

    public static void removeZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### removeZone

    public static void removeZone([DesignationZone](DesignationZone.html "class in zombie.iso.areas") zone,
    boolean doSync)
  + ### getZoneByName

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") getZoneByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getZoneByNameAndType

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") getZoneByNameAndType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getZone

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") getZone(int x,
    int y,
    int z)
  + ### getZoneByType

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") getZoneByType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z)
  + ### isFullyStreamed

    public boolean isFullyStreamed()
  + ### getZoneById

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") getZoneById([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") id)
  + ### unloading

    public void unloading()

    Is our zone fully unloaded, in this case we need to save the current world age so when the zone is loaded back in we'll know how much hours passed
  + ### loading

    public void loading()
  + ### checkStreamed

    private void checkStreamed()

    Check if a zone disapear (not fully streamed) or not
  + ### getRandomSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomSquare()
  + ### getRandomFreeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomFreeSquare()
  + ### getAllZonesByType

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZone](DesignationZone.html "class in zombie.iso.areas")> getAllZonesByType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### update

    public static void update()
  + ### check

    public void check()
  + ### getW

    public int getW()
  + ### getH

    public int getH()
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public static [DesignationZone](DesignationZone.html "class in zombie.iso.areas") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### Reset

    public static void Reset()
  + ### getId

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getId()
  + ### sync

    protected void sync()