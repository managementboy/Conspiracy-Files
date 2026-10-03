[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [MetaObject](MetaObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [x](#x)
   3. [y](#y)
   4. [def](#def)
   5. [used](#used)
6. [Constructor Details](#constructor-detail)
   1. [MetaObject(int, int, int, RoomDef)](#%3Cinit%3E(int,int,int,zombie.iso.RoomDef))
7. [Method Details](#method-detail)
   1. [getRoom()](#getRoom())
   2. [getUsed()](#getUsed())
   3. [setUsed(boolean)](#setUsed(boolean))
   4. [getX()](#getX())
   5. [getY()](#getY())
   6. [getType()](#getType())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MetaObject
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.MetaObject

---

public final class MetaObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) RoomDef`

  `def`

  `(package private) int`

  `type`

  `(package private) boolean`

  `used`

  `(package private) int`

  `x`

  `(package private) int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MetaObject(int type,
  int x,
  int y,
  RoomDef def)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `RoomDef`

  `getRoom()`

  `int`

  `getType()`

  `boolean`

  `getUsed()`

  `int`

  `getX()`

  `int`

  `getY()`

  `void`

  `setUsed(boolean bUsed)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    int type
  + ### x

    int x
  + ### y

    int y
  + ### def

    [RoomDef](RoomDef.html "class in zombie.iso") def
  + ### used

    boolean used
* Constructor Details
  -------------------

  + ### MetaObject

    public MetaObject(int type,
    int x,
    int y,
    [RoomDef](RoomDef.html "class in zombie.iso") def)
* Method Details
  --------------

  + ### getRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoom()
  + ### getUsed

    public boolean getUsed()
  + ### setUsed

    public void setUsed(boolean bUsed)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getType

    public int getType()