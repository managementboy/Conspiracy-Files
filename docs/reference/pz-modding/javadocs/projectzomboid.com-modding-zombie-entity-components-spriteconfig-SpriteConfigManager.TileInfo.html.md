[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfigManager](SpriteConfigManager.html)
3. [TileInfo](SpriteConfigManager.TileInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tileSprite](#tileSprite)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
   5. [masterOffsetX](#masterOffsetX)
   6. [masterOffsetY](#masterOffsetY)
   7. [masterOffsetZ](#masterOffsetZ)
   8. [master](#master)
   9. [empty](#empty)
   10. [blocking](#blocking)
6. [Constructor Details](#constructor-detail)
   1. [TileInfo(String, int, int, int, boolean, boolean, boolean)](#%3Cinit%3E(java.lang.String,int,int,int,boolean,boolean,boolean))
7. [Method Details](#method-detail)
   1. [getSpriteName()](#getSpriteName())
   2. [getX()](#getX())
   3. [getY()](#getY())
   4. [getZ()](#getZ())
   5. [isMaster()](#isMaster())
   6. [isEmpty()](#isEmpty())
   7. [isBlocking()](#isBlocking())
   8. [getMasterOffsetX()](#getMasterOffsetX())
   9. [getMasterOffsetY()](#getMasterOffsetY())
   10. [getMasterOffsetZ()](#getMasterOffsetZ())
   11. [verifyObject(IsoObject)](#verifyObject(zombie.iso.IsoObject))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigManager.TileInfo
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.spriteconfig.SpriteConfigManager.TileInfo

Enclosing class:
:   `SpriteConfigManager`

---

public static class SpriteConfigManager.TileInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `blocking`

  `private final boolean`

  `empty`

  `private final boolean`

  `master`

  `private int`

  `masterOffsetX`

  `private int`

  `masterOffsetY`

  `private int`

  `masterOffsetZ`

  `private final String`

  `tileSprite`

  `private final int`

  `x`

  `private final int`

  `y`

  `private final int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileInfo(String tileSprite,
  int x,
  int y,
  int z,
  boolean master,
  boolean empty,
  boolean blocking)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getMasterOffsetX()`

  `int`

  `getMasterOffsetY()`

  `int`

  `getMasterOffsetZ()`

  `String`

  `getSpriteName()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `boolean`

  `isBlocking()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isMaster()`

  `boolean`

  `verifyObject(IsoObject object)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tileSprite

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileSprite
  + ### x

    private final int x
  + ### y

    private final int y
  + ### z

    private final int z
  + ### masterOffsetX

    private int masterOffsetX
  + ### masterOffsetY

    private int masterOffsetY
  + ### masterOffsetZ

    private int masterOffsetZ
  + ### master

    private final boolean master
  + ### empty

    private final boolean empty
  + ### blocking

    private final boolean blocking
* Constructor Details
  -------------------

  + ### TileInfo

    private TileInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileSprite,
    int x,
    int y,
    int z,
    boolean master,
    boolean empty,
    boolean blocking)
* Method Details
  --------------

  + ### getSpriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpriteName()
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### isMaster

    public boolean isMaster()
  + ### isEmpty

    public boolean isEmpty()
  + ### isBlocking

    public boolean isBlocking()
  + ### getMasterOffsetX

    public int getMasterOffsetX()
  + ### getMasterOffsetY

    public int getMasterOffsetY()
  + ### getMasterOffsetZ

    public int getMasterOffsetZ()
  + ### verifyObject

    public boolean verifyObject([IsoObject](../../../iso/IsoObject.html "class in zombie.iso") object)