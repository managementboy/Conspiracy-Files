[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.spriteModel](package-summary.html)
2. [SpriteModelManager](SpriteModelManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [loadedTileDefinitions](#loadedTileDefinitions)
   3. [modData](#modData)
7. [Constructor Details](#constructor-detail)
   1. [SpriteModelManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [getModIDs()](#getModIDs())
   6. [getModData(String)](#getModData(java.lang.String))
   7. [setTileProperties(String, String, int, int, SpriteModel)](#setTileProperties(java.lang.String,java.lang.String,int,int,zombie.iso.SpriteModel))
   8. [getTileProperties(String, String, int, int)](#getTileProperties(java.lang.String,java.lang.String,int,int))
   9. [clearTileProperties(String, String, int, int)](#clearTileProperties(java.lang.String,java.lang.String,int,int))
   10. [findTileset(String, String)](#findTileset(java.lang.String,java.lang.String))
   11. [toScriptManager(String)](#toScriptManager(java.lang.String))
   12. [toScriptManager()](#toScriptManager())
   13. [loadedTileDefinitions()](#loadedTileDefinitions())
   14. [initSprites()](#initSprites())
   15. [write(String)](#write(java.lang.String))
   16. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpriteModelManager
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.spriteModel.SpriteModelManager

---

public final class SpriteModelManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `SpriteModelManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static SpriteModelManager`

  `instance`

  `private boolean`

  `loadedTileDefinitions`

  `private final ArrayList<SpriteModelManager.ModData>`

  `modData`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SpriteModelManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearTileProperties(String modID,
  String tilesetName,
  int col,
  int row)`

  `zombie.iso.SpriteModelsFile.Tileset`

  `findTileset(String modID,
  String tilesetName)`

  `static SpriteModelManager`

  `getInstance()`

  `(package private) SpriteModelManager.ModData`

  `getModData(String modID)`

  `ArrayList<String>`

  `getModIDs()`

  `SpriteModel`

  `getTileProperties(String modID,
  String tilesetName,
  int col,
  int row)`

  `void`

  `init()`

  `void`

  `initGameData()`

  `void`

  `initModData(ChooseGameInfo.Mod mod)`

  `void`

  `initSprites()`

  `void`

  `loadedTileDefinitions()`

  `void`

  `Reset()`

  `void`

  `setTileProperties(String modID,
  String tilesetName,
  int col,
  int row,
  SpriteModel spriteModel)`

  `void`

  `toScriptManager()`

  `void`

  `toScriptManager(String modID)`

  `void`

  `write(String modID)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [SpriteModelManager](SpriteModelManager.html "class in zombie.spriteModel") instance
  + ### loadedTileDefinitions

    private boolean loadedTileDefinitions
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteModelManager.ModData](SpriteModelManager.ModData.html "class in zombie.spriteModel")> modData
* Constructor Details
  -------------------

  + ### SpriteModelManager

    public SpriteModelManager()
* Method Details
  --------------

  + ### getInstance

    public static [SpriteModelManager](SpriteModelManager.html "class in zombie.spriteModel") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### getModIDs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getModIDs()
  + ### getModData

    [SpriteModelManager.ModData](SpriteModelManager.ModData.html "class in zombie.spriteModel") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### setTileProperties

    public void setTileProperties([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [SpriteModel](../iso/SpriteModel.html "class in zombie.iso") spriteModel)
  + ### getTileProperties

    public [SpriteModel](../iso/SpriteModel.html "class in zombie.iso") getTileProperties([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### clearTileProperties

    public void clearTileProperties([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### findTileset

    public zombie.iso.SpriteModelsFile.Tileset findTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### toScriptManager

    public void toScriptManager([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### toScriptManager

    public void toScriptManager()
  + ### loadedTileDefinitions

    public void loadedTileDefinitions()
  + ### initSprites

    public void initSprites()
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### Reset

    public void Reset()