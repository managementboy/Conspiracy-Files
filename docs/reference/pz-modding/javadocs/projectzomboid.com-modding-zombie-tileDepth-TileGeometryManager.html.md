[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileGeometryManager](TileGeometryManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [ONE\_PIXEL\_OFFSET](#ONE_PIXEL_OFFSET)
   3. [modData](#modData)
7. [Constructor Details](#constructor-detail)
   1. [TileGeometryManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [loadedTileDefinitions()](#loadedTileDefinitions())
   6. [initSpriteProperties()](#initSpriteProperties())
   7. [getModIDs()](#getModIDs())
   8. [getModData(String)](#getModData(java.lang.String))
   9. [setGeometry(String, String, int, int, ArrayList)](#setGeometry(java.lang.String,java.lang.String,int,int,java.util.ArrayList))
   10. [copyGeometry(String, String, int, int, ArrayList)](#copyGeometry(java.lang.String,java.lang.String,int,int,java.util.ArrayList))
   11. [getGeometry(String, String, int, int)](#getGeometry(java.lang.String,java.lang.String,int,int))
   12. [getTileProperty(String, String, int, int, String)](#getTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String))
   13. [setTileProperty(String, String, int, int, String, String)](#setTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String,java.lang.String))
   14. [getTile(String, String, int, int)](#getTile(java.lang.String,java.lang.String,int,int))
   15. [getOrCreateTile(String, String, int, int)](#getOrCreateTile(java.lang.String,java.lang.String,int,int))
   16. [write(String)](#write(java.lang.String))
   17. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileGeometryManager
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileGeometryManager

---

public final class TileGeometryManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `TileGeometryManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static TileGeometryManager`

  `instance`

  `private final ArrayList<TileGeometryManager.ModData>`

  `modData`

  `static final boolean`

  `ONE_PIXEL_OFFSET`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileGeometryManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `copyGeometry(String modID,
  String tilesetName,
  int col,
  int row,
  ArrayList<zombie.tileDepth.TileGeometryFile.Geometry> geometries)`

  `ArrayList<zombie.tileDepth.TileGeometryFile.Geometry>`

  `getGeometry(String modID,
  String tilesetName,
  int col,
  int row)`

  `static TileGeometryManager`

  `getInstance()`

  `(package private) TileGeometryManager.ModData`

  `getModData(String modID)`

  `ArrayList<String>`

  `getModIDs()`

  `zombie.tileDepth.TileGeometryFile.Tile`

  `getOrCreateTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `zombie.tileDepth.TileGeometryFile.Tile`

  `getTile(String modID,
  String tilesetName,
  int col,
  int row)`

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

  `void`

  `initSpriteProperties()`

  `void`

  `loadedTileDefinitions()`

  `void`

  `Reset()`

  `void`

  `setGeometry(String modID,
  String tilesetName,
  int col,
  int row,
  ArrayList<zombie.tileDepth.TileGeometryFile.Geometry> geometry)`

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

    private static [TileGeometryManager](TileGeometryManager.html "class in zombie.tileDepth") instance
  + ### ONE\_PIXEL\_OFFSET

    public static final boolean ONE\_PIXEL\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.tileDepth.TileGeometryManager.ONE_PIXEL_OFFSET)
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileGeometryManager.ModData](TileGeometryManager.ModData.html "class in zombie.tileDepth")> modData
* Constructor Details
  -------------------

  + ### TileGeometryManager

    private TileGeometryManager()
* Method Details
  --------------

  + ### getInstance

    public static [TileGeometryManager](TileGeometryManager.html "class in zombie.tileDepth") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### loadedTileDefinitions

    public void loadedTileDefinitions()
  + ### initSpriteProperties

    public void initSpriteProperties()
  + ### getModIDs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getModIDs()
  + ### getModData

    [TileGeometryManager.ModData](TileGeometryManager.ModData.html "class in zombie.tileDepth") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### setGeometry

    public void setGeometry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.tileDepth.TileGeometryFile.Geometry> geometry)
  + ### copyGeometry

    public void copyGeometry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.tileDepth.TileGeometryFile.Geometry> geometries)
  + ### getGeometry

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.tileDepth.TileGeometryFile.Geometry> getGeometry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
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
  + ### getTile

    public zombie.tileDepth.TileGeometryFile.Tile getTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getOrCreateTile

    public zombie.tileDepth.TileGeometryFile.Tile getOrCreateTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### Reset

    public void Reset()