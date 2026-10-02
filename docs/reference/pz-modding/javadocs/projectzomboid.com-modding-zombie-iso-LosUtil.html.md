[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [LosUtil](LosUtil.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [sizeX](#sizeX)
   2. [sizeY](#sizeY)
   3. [sizeZ](#sizeZ)
   4. [cachedresults](#cachedresults)
   5. [cachecleared](#cachecleared)
7. [Constructor Details](#constructor-detail)
   1. [LosUtil()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init(int, int)](#init(int,int))
   2. [lineClear(IsoCell, int, int, int, int, int, int, boolean)](#lineClear(zombie.iso.IsoCell,int,int,int,int,int,int,boolean))
   3. [lineClear(IsoCell, int, int, int, int, int, int, boolean, int)](#lineClear(zombie.iso.IsoCell,int,int,int,int,int,int,boolean,int))
   4. [lineClearCollide(int, int, int, int, int, int, boolean)](#lineClearCollide(int,int,int,int,int,int,boolean))
   5. [lineClearCollideCount(IsoGameCharacter, IsoCell, int, int, int, int, int, int)](#lineClearCollideCount(zombie.characters.IsoGameCharacter,zombie.iso.IsoCell,int,int,int,int,int,int))
   6. [lineClearCached(IsoCell, int, int, int, int, int, int, boolean, int)](#lineClearCached(zombie.iso.IsoCell,int,int,int,int,int,int,boolean,int))
   7. [getFirstBlockingIsoGridSquare(IsoCell, int, int, int, int, int, int, boolean)](#getFirstBlockingIsoGridSquare(zombie.iso.IsoCell,int,int,int,int,int,int,boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LosUtil
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.LosUtil

---

public final class LosUtil
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `LosUtil.PerPlayerData`

  `static enum`

  `LosUtil.TestResults`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static boolean[]`

  `cachecleared`

  `static LosUtil.PerPlayerData[]`

  `cachedresults`

  `static int`

  `sizeX`

  `static int`

  `sizeY`

  `static int`

  `sizeZ`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LosUtil()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static zombie.iso.IsoGridSquareCollisionData`

  `getFirstBlockingIsoGridSquare(IsoCell cell,
  int x0,
  int y0,
  int z0,
  int x1,
  int y1,
  int z1,
  boolean bIgnoreDoors)`

  `static void`

  `init(int width,
  int height)`

  `static LosUtil.TestResults`

  `lineClear(IsoCell cell,
  int x0,
  int y0,
  int z0,
  int x1,
  int y1,
  int z1,
  boolean bIgnoreDoors)`

  `static LosUtil.TestResults`

  `lineClear(IsoCell cell,
  int x0,
  int y0,
  int z0,
  int x1,
  int y1,
  int z1,
  boolean bIgnoreDoors,
  int rangeTillWindows)`

  `static LosUtil.TestResults`

  `lineClearCached(IsoCell cell,
  int x1,
  int y1,
  int z1,
  int x0,
  int y0,
  int z0,
  boolean bIgnoreDoors,
  int playerIndex)`

  `static boolean`

  `lineClearCollide(int x1,
  int y1,
  int z1,
  int x0,
  int y0,
  int z0,
  boolean bIgnoreDoors)`

  `static int`

  `lineClearCollideCount(IsoGameCharacter chr,
  IsoCell cell,
  int x1,
  int y1,
  int z1,
  int x0,
  int y0,
  int z0)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sizeX

    public static int sizeX
  + ### sizeY

    public static int sizeY
  + ### sizeZ

    public static int sizeZ
  + ### cachedresults

    public static [LosUtil.PerPlayerData](LosUtil.PerPlayerData.html "class in zombie.iso")[] cachedresults
  + ### cachecleared

    public static boolean[] cachecleared
* Constructor Details
  -------------------

  + ### LosUtil

    public LosUtil()
* Method Details
  --------------

  + ### init

    public static void init(int width,
    int height)
  + ### lineClear

    public static [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") lineClear([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int x0,
    int y0,
    int z0,
    int x1,
    int y1,
    int z1,
    boolean bIgnoreDoors)
  + ### lineClear

    public static [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") lineClear([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int x0,
    int y0,
    int z0,
    int x1,
    int y1,
    int z1,
    boolean bIgnoreDoors,
    int rangeTillWindows)
  + ### lineClearCollide

    public static boolean lineClearCollide(int x1,
    int y1,
    int z1,
    int x0,
    int y0,
    int z0,
    boolean bIgnoreDoors)
  + ### lineClearCollideCount

    public static int lineClearCollideCount([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [IsoCell](IsoCell.html "class in zombie.iso") cell,
    int x1,
    int y1,
    int z1,
    int x0,
    int y0,
    int z0)
  + ### lineClearCached

    public static [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") lineClearCached([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int x1,
    int y1,
    int z1,
    int x0,
    int y0,
    int z0,
    boolean bIgnoreDoors,
    int playerIndex)
  + ### getFirstBlockingIsoGridSquare

    public static zombie.iso.IsoGridSquareCollisionData getFirstBlockingIsoGridSquare([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int x0,
    int y0,
    int z0,
    int x1,
    int y1,
    int z1,
    boolean bIgnoreDoors)