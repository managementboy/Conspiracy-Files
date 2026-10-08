[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.seams](package-summary.html)
2. [SeamManager](SeamManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [modData](#modData)
7. [Constructor Details](#constructor-detail)
   1. [SeamManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [getModIDs()](#getModIDs())
   6. [getModData(String)](#getModData(java.lang.String))
   7. [getHighestPriorityTile(String, int, int)](#getHighestPriorityTile(java.lang.String,int,int))
   8. [getHighestPriorityTileFromName(String)](#getHighestPriorityTileFromName(java.lang.String))
   9. [getTileProperty(String, String, int, int, String)](#getTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String))
   10. [setTileProperty(String, String, int, int, String, String)](#setTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String,java.lang.String))
   11. [getTileJoinE(String, String, int, int, boolean)](#getTileJoinE(java.lang.String,java.lang.String,int,int,boolean))
   12. [getTileJoinS(String, String, int, int, boolean)](#getTileJoinS(java.lang.String,java.lang.String,int,int,boolean))
   13. [getTileJoinBelowE(String, String, int, int, boolean)](#getTileJoinBelowE(java.lang.String,java.lang.String,int,int,boolean))
   14. [getTileJoinBelowS(String, String, int, int, boolean)](#getTileJoinBelowS(java.lang.String,java.lang.String,int,int,boolean))
   15. [getTile(String, String, int, int)](#getTile(java.lang.String,java.lang.String,int,int))
   16. [getTileFromName(String, String)](#getTileFromName(java.lang.String,java.lang.String))
   17. [getOrCreateTile(String, String, int, int)](#getOrCreateTile(java.lang.String,java.lang.String,int,int))
   18. [isMasterTile(String, String, int, int)](#isMasterTile(java.lang.String,java.lang.String,int,int))
   19. [getMasterTileName(String, String, int, int)](#getMasterTileName(java.lang.String,java.lang.String,int,int))
   20. [write(String)](#write(java.lang.String))
   21. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SeamManager
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.seams.SeamManager

---

public final class SeamManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `SeamManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static SeamManager`

  `instance`

  `private final ArrayList<SeamManager.ModData>`

  `modData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SeamManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.seams.SeamFile.Tile`

  `getHighestPriorityTile(String tilesetName,
  int col,
  int row)`

  `zombie.seams.SeamFile.Tile`

  `getHighestPriorityTileFromName(String tileName)`

  `static SeamManager`

  `getInstance()`

  `String`

  `getMasterTileName(String modID,
  String tilesetName,
  int col,
  int row)`

  `(package private) SeamManager.ModData`

  `getModData(String modID)`

  `ArrayList<String>`

  `getModIDs()`

  `zombie.seams.SeamFile.Tile`

  `getOrCreateTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `zombie.seams.SeamFile.Tile`

  `getTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `zombie.seams.SeamFile.Tile`

  `getTileFromName(String modID,
  String tileName)`

  `ArrayList<String>`

  `getTileJoinBelowE(String modID,
  String tilesetName,
  int col,
  int row,
  boolean bAllocate)`

  `ArrayList<String>`

  `getTileJoinBelowS(String modID,
  String tilesetName,
  int col,
  int row,
  boolean bAllocate)`

  `ArrayList<String>`

  `getTileJoinE(String modID,
  String tilesetName,
  int col,
  int row,
  boolean bAllocate)`

  `ArrayList<String>`

  `getTileJoinS(String modID,
  String tilesetName,
  int col,
  int row,
  boolean bAllocate)`

  `String`

  `getTileProperty(String modID,
  String tilesetName,
  int col,
  int row,
  String key)`

  `void`

  `init()`

  `void`

  `initGameData()`

  `void`

  `initModData(ChooseGameInfo.Mod mod)`

  `boolean`

  `isMasterTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `void`

  `Reset()`

  `void`

  `setTileProperty(String modID,
  String tilesetName,
  int col,
  int row,
  String key,
  String value)`

  `void`

  `write(String modID)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [SeamManager](SeamManager.html "class in zombie.seams") instance
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SeamManager.ModData](SeamManager.ModData.html "class in zombie.seams")> modData
* Constructor Details
  -------------------

  + ### SeamManager

    private SeamManager()
* Method Details
  --------------

  + ### getInstance

    public static [SeamManager](SeamManager.html "class in zombie.seams") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### getModIDs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getModIDs()
  + ### getModData

    [SeamManager.ModData](SeamManager.ModData.html "class in zombie.seams") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getHighestPriorityTile

    public zombie.seams.SeamFile.Tile getHighestPriorityTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getHighestPriorityTileFromName

    public zombie.seams.SeamFile.Tile getHighestPriorityTileFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### getTileProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTileProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### setTileProperty

    public void setTileProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### getTileJoinE

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTileJoinE([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    boolean bAllocate)
  + ### getTileJoinS

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTileJoinS([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    boolean bAllocate)
  + ### getTileJoinBelowE

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTileJoinBelowE([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    boolean bAllocate)
  + ### getTileJoinBelowS

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTileJoinBelowS([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    boolean bAllocate)
  + ### getTile

    public zombie.seams.SeamFile.Tile getTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getTileFromName

    public zombie.seams.SeamFile.Tile getTileFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### getOrCreateTile

    public zombie.seams.SeamFile.Tile getOrCreateTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### isMasterTile

    public boolean isMasterTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getMasterTileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMasterTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### Reset

    public void Reset()