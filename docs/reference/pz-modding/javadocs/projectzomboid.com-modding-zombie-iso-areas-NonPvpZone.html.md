[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [NonPvpZone](NonPvpZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [x2](#x2)
   4. [y2](#y2)
   5. [size](#size)
   6. [title](#title)
   7. [nonPvpZoneList](#nonPvpZoneList)
6. [Constructor Details](#constructor-detail)
   1. [NonPvpZone()](#%3Cinit%3E())
   2. [NonPvpZone(String, int, int, int, int)](#%3Cinit%3E(java.lang.String,int,int,int,int))
7. [Method Details](#method-detail)
   1. [addNonPvpZone(String, int, int, int, int)](#addNonPvpZone(java.lang.String,int,int,int,int))
   2. [removeNonPvpZone(String)](#removeNonPvpZone(java.lang.String))
   3. [getZoneByTitle(String)](#getZoneByTitle(java.lang.String))
   4. [getNonPvpZone(int, int)](#getNonPvpZone(int,int))
   5. [getAllZones()](#getAllZones())
   6. [isInNonPvpZone(IsoPlayer)](#isInNonPvpZone(zombie.characters.IsoPlayer))
   7. [syncNonPvpZone(boolean)](#syncNonPvpZone(boolean))
   8. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   9. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   10. [getX()](#getX())
   11. [setX(int)](#setX(int))
   12. [getY()](#getY())
   13. [setY(int)](#setY(int))
   14. [getX2()](#getX2())
   15. [setX2(int)](#setX2(int))
   16. [getY2()](#getY2())
   17. [setY2(int)](#setY2(int))
   18. [getTitle()](#getTitle())
   19. [setTitle(String)](#setTitle(java.lang.String))
   20. [getSize()](#getSize())
   21. [setSize(int)](#setSize(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NonPvpZone
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.NonPvpZone

---

public final class NonPvpZone
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ArrayList<NonPvpZone>`

  `nonPvpZoneList`

  `private int`

  `size`

  `private String`

  `title`

  `private int`

  `x`

  `private int`

  `x2`

  `private int`

  `y`

  `private int`

  `y2`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NonPvpZone()`

  `NonPvpZone(String title,
  int x,
  int y,
  int x2,
  int y2)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static NonPvpZone`

  `addNonPvpZone(String title,
  int x,
  int y,
  int x2,
  int y2)`

  `static ArrayList<NonPvpZone>`

  `getAllZones()`

  `static NonPvpZone`

  `getNonPvpZone(int x,
  int y)`

  `int`

  `getSize()`

  `String`

  `getTitle()`

  `int`

  `getX()`

  `int`

  `getX2()`

  `int`

  `getY()`

  `int`

  `getY2()`

  `static NonPvpZone`

  `getZoneByTitle(String title)`

  `static boolean`

  `isInNonPvpZone(IsoPlayer player)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `static void`

  `removeNonPvpZone(String title)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setSize(int size)`

  `void`

  `setTitle(String title)`

  `void`

  `setX(int x)`

  `void`

  `setX2(int x2)`

  `void`

  `setY(int y)`

  `void`

  `setY2(int y2)`

  `void`

  `syncNonPvpZone(boolean remove)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    private int x
  + ### y

    private int y
  + ### x2

    private int x2
  + ### y2

    private int y2
  + ### size

    private int size
  + ### title

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### nonPvpZoneList

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[NonPvpZone](NonPvpZone.html "class in zombie.iso.areas")> nonPvpZoneList
* Constructor Details
  -------------------

  + ### NonPvpZone

    public NonPvpZone()
  + ### NonPvpZone

    public NonPvpZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title,
    int x,
    int y,
    int x2,
    int y2)
* Method Details
  --------------

  + ### addNonPvpZone

    public static [NonPvpZone](NonPvpZone.html "class in zombie.iso.areas") addNonPvpZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title,
    int x,
    int y,
    int x2,
    int y2)
  + ### removeNonPvpZone

    public static void removeNonPvpZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getZoneByTitle

    public static [NonPvpZone](NonPvpZone.html "class in zombie.iso.areas") getZoneByTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getNonPvpZone

    public static [NonPvpZone](NonPvpZone.html "class in zombie.iso.areas") getNonPvpZone(int x,
    int y)
  + ### getAllZones

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[NonPvpZone](NonPvpZone.html "class in zombie.iso.areas")> getAllZones()
  + ### isInNonPvpZone

    public static boolean isInNonPvpZone([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### syncNonPvpZone

    public void syncNonPvpZone(boolean remove)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### getX

    public int getX()
  + ### setX

    public void setX(int x)
  + ### getY

    public int getY()
  + ### setY

    public void setY(int y)
  + ### getX2

    public int getX2()
  + ### setX2

    public void setX2(int x2)
  + ### getY2

    public int getY2()
  + ### setY2

    public void setY2(int y2)
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### setTitle

    public void setTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getSize

    public int getSize()
  + ### setSize

    public void setSize(int size)