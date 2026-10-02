[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [GlobalObject](GlobalObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [system](#system)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
   5. [modData](#modData)
6. [Constructor Details](#constructor-detail)
   1. [GlobalObject(GlobalObjectSystem, int, int, int)](#%3Cinit%3E(zombie.globalObjects.GlobalObjectSystem,int,int,int))
7. [Method Details](#method-detail)
   1. [getSystem()](#getSystem())
   2. [setLocation(int, int, int)](#setLocation(int,int,int))
   3. [getX()](#getX())
   4. [getY()](#getY())
   5. [getZ()](#getZ())
   6. [getSquare()](#getSquare())
   7. [getIsoObject()](#getIsoObject())
   8. [isValidIsoObject(IsoObject)](#isValidIsoObject(zombie.iso.IsoObject))
   9. [getModData()](#getModData())
   10. [Reset()](#Reset())
   11. [destroyThisObject()](#destroyThisObject())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GlobalObject
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.globalObjects.GlobalObject

Direct Known Subclasses:
:   `CGlobalObject, SGlobalObject`

---

public abstract class GlobalObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final se.krka.kahlua.vm.KahluaTable`

  `modData`

  `protected zombie.globalObjects.GlobalObjectSystem`

  `system`

  `protected int`

  `x`

  `protected int`

  `y`

  `protected int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GlobalObject(zombie.globalObjects.GlobalObjectSystem system,
  int x,
  int y,
  int z)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `destroyThisObject()`

  `IsoObject`

  `getIsoObject()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `IsoGridSquare`

  `getSquare()`

  `zombie.globalObjects.GlobalObjectSystem`

  `getSystem()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `boolean`

  `isValidIsoObject(IsoObject obj)`

  `void`

  `Reset()`

  `void`

  `setLocation(int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### system

    protected zombie.globalObjects.GlobalObjectSystem system
  + ### x

    protected int x
  + ### y

    protected int y
  + ### z

    protected int z
  + ### modData

    protected final se.krka.kahlua.vm.KahluaTable modData
* Constructor Details
  -------------------

  + ### GlobalObject

    GlobalObject(zombie.globalObjects.GlobalObjectSystem system,
    int x,
    int y,
    int z)
* Method Details
  --------------

  + ### getSystem

    public zombie.globalObjects.GlobalObjectSystem getSystem()
  + ### setLocation

    public void setLocation(int x,
    int y,
    int z)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getIsoObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getIsoObject()
  + ### isValidIsoObject

    public boolean isValidIsoObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### Reset

    public void Reset()
  + ### destroyThisObject

    public void destroyThisObject()