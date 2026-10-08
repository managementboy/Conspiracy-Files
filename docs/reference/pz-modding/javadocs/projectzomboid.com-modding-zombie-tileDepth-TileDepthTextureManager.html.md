[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileDepthTextureManager](TileDepthTextureManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [DELAYED\_LOADING](#DELAYED_LOADING)
   3. [remainingLoadTasks](#remainingLoadTasks)
   4. [loadedTileDefinitions](#loadedTileDefinitions)
   5. [modData](#modData)
   6. [previouslyLoadedModData](#previouslyLoadedModData)
   7. [defaultDepthTextureTileset](#defaultDepthTextureTileset)
   8. [billboardDepthTextureTileset](#billboardDepthTextureTileset)
   9. [presetDepthTextureTileset](#presetDepthTextureTileset)
   10. [mergedTilesets](#mergedTilesets)
   11. [nullTilesets](#nullTilesets)
   12. [emptyDepthTextures](#emptyDepthTextures)
7. [Constructor Details](#constructor-detail)
   1. [TileDepthTextureManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [initMergedTilesets()](#initMergedTilesets())
   6. [mergeAfterEditing(String)](#mergeAfterEditing(java.lang.String))
   7. [reloadTileset(String, String)](#reloadTileset(java.lang.String,java.lang.String))
   8. [getModData(String)](#getModData(java.lang.String))
   9. [getModData(String, ArrayList)](#getModData(java.lang.String,java.util.ArrayList))
   10. [loadTilesetPixelsIfNeeded(String, String)](#loadTilesetPixelsIfNeeded(java.lang.String,java.lang.String))
   11. [saveTileset(String, String)](#saveTileset(java.lang.String,java.lang.String))
   12. [getTexture(String, String, int)](#getTexture(java.lang.String,java.lang.String,int))
   13. [getTextureFromTileName(String, String)](#getTextureFromTileName(java.lang.String,java.lang.String))
   14. [getTexture(String, int)](#getTexture(java.lang.String,int))
   15. [getTextureFromTileName(String)](#getTextureFromTileName(java.lang.String))
   16. [initDefaultDepthTexture()](#initDefaultDepthTexture())
   17. [getDefaultDepthTexture()](#getDefaultDepthTexture())
   18. [initBillboardDepthTexture()](#initBillboardDepthTexture())
   19. [getBillboardDepthTexture()](#getBillboardDepthTexture())
   20. [initPresetDepthTexture()](#initPresetDepthTexture())
   21. [getPresetTilesetDepthTexture()](#getPresetTilesetDepthTexture())
   22. [getPresetDepthTexture(int, int)](#getPresetDepthTexture(int,int))
   23. [initSprites()](#initSprites())
   24. [initSprites(String)](#initSprites(java.lang.String))
   25. [Reset()](#Reset())
   26. [addedLoadTask()](#addedLoadTask())
   27. [finishedLoadTask()](#finishedLoadTask())
   28. [loadedTileDefinitions()](#loadedTileDefinitions())
   29. [isLoadingFinished()](#isLoadingFinished())
   30. [getEmptyDepthTexture(int, int)](#getEmptyDepthTexture(int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileDepthTextureManager
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileDepthTextureManager

---

public final class TileDepthTextureManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `TileDepthTextureManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private TilesetDepthTexture`

  `billboardDepthTextureTileset`

  `private TilesetDepthTexture`

  `defaultDepthTextureTileset`

  `static final boolean`

  `DELAYED_LOADING`

  `private final ArrayList<Texture>`

  `emptyDepthTextures`

  `private static TileDepthTextureManager`

  `instance`

  `private boolean`

  `loadedTileDefinitions`

  `private TileDepthTextures`

  `mergedTilesets`

  `private final ArrayList<TileDepthTextureManager.ModData>`

  `modData`

  `private final HashSet<String>`

  `nullTilesets`

  `private TilesetDepthTexture`

  `presetDepthTextureTileset`

  `private final ArrayList<TileDepthTextureManager.ModData>`

  `previouslyLoadedModData`

  `private int`

  `remainingLoadTasks`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileDepthTextureManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addedLoadTask()`

  `void`

  `finishedLoadTask()`

  `TileDepthTexture`

  `getBillboardDepthTexture()`

  `TileDepthTexture`

  `getDefaultDepthTexture()`

  `Texture`

  `getEmptyDepthTexture(int width,
  int height)`

  `static TileDepthTextureManager`

  `getInstance()`

  `(package private) TileDepthTextureManager.ModData`

  `getModData(String modID)`

  `(package private) TileDepthTextureManager.ModData`

  `getModData(String modID,
  ArrayList<TileDepthTextureManager.ModData> modData)`

  `TileDepthTexture`

  `getPresetDepthTexture(int col,
  int row)`

  `TilesetDepthTexture`

  `getPresetTilesetDepthTexture()`

  `TileDepthTexture`

  `getTexture(String tilesetName,
  int tileIndex)`

  `TileDepthTexture`

  `getTexture(String modID,
  String tilesetName,
  int tileIndex)`

  `TileDepthTexture`

  `getTextureFromTileName(String tileName)`

  `TileDepthTexture`

  `getTextureFromTileName(String modID,
  String tileName)`

  `void`

  `init()`

  `private void`

  `initBillboardDepthTexture()`

  `private void`

  `initDefaultDepthTexture()`

  `void`

  `initGameData()`

  `private void`

  `initMergedTilesets()`

  `void`

  `initModData(ChooseGameInfo.Mod mod)`

  `private void`

  `initPresetDepthTexture()`

  `void`

  `initSprites()`

  `void`

  `initSprites(String tilesetName)`

  `boolean`

  `isLoadingFinished()`

  `void`

  `loadedTileDefinitions()`

  `void`

  `loadTilesetPixelsIfNeeded(String modID,
  String tilesetName)`

  `void`

  `mergeAfterEditing(String tilesetName)`

  `void`

  `reloadTileset(String modID,
  String tilesetName)`

  `void`

  `Reset()`

  `void`

  `saveTileset(String modID,
  String tilesetName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [TileDepthTextureManager](TileDepthTextureManager.html "class in zombie.tileDepth") instance
  + ### DELAYED\_LOADING

    public static final boolean DELAYED\_LOADING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.tileDepth.TileDepthTextureManager.DELAYED_LOADING)
  + ### remainingLoadTasks

    private int remainingLoadTasks
  + ### loadedTileDefinitions

    private boolean loadedTileDefinitions
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileDepthTextureManager.ModData](TileDepthTextureManager.ModData.html "class in zombie.tileDepth")> modData
  + ### previouslyLoadedModData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileDepthTextureManager.ModData](TileDepthTextureManager.ModData.html "class in zombie.tileDepth")> previouslyLoadedModData
  + ### defaultDepthTextureTileset

    private [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") defaultDepthTextureTileset
  + ### billboardDepthTextureTileset

    private [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") billboardDepthTextureTileset
  + ### presetDepthTextureTileset

    private [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") presetDepthTextureTileset
  + ### mergedTilesets

    private [TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") mergedTilesets
  + ### nullTilesets

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> nullTilesets
  + ### emptyDepthTextures

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../core/textures/Texture.html "class in zombie.core.textures")> emptyDepthTextures
* Constructor Details
  -------------------

  + ### TileDepthTextureManager

    private TileDepthTextureManager()
* Method Details
  --------------

  + ### getInstance

    public static [TileDepthTextureManager](TileDepthTextureManager.html "class in zombie.tileDepth") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### initMergedTilesets

    private void initMergedTilesets()
  + ### mergeAfterEditing

    public void mergeAfterEditing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### reloadTileset

    public void reloadTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getModData

    [TileDepthTextureManager.ModData](TileDepthTextureManager.ModData.html "class in zombie.tileDepth") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getModData

    [TileDepthTextureManager.ModData](TileDepthTextureManager.ModData.html "class in zombie.tileDepth") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileDepthTextureManager.ModData](TileDepthTextureManager.ModData.html "class in zombie.tileDepth")> modData)
  + ### loadTilesetPixelsIfNeeded

    public void loadTilesetPixelsIfNeeded([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### saveTileset

    public void saveTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileIndex)
  + ### getTextureFromTileName

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTextureFromTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### getTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileIndex)
  + ### getTextureFromTileName

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTextureFromTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### initDefaultDepthTexture

    private void initDefaultDepthTexture()
  + ### getDefaultDepthTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getDefaultDepthTexture()
  + ### initBillboardDepthTexture

    private void initBillboardDepthTexture()
  + ### getBillboardDepthTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getBillboardDepthTexture()
  + ### initPresetDepthTexture

    private void initPresetDepthTexture()
  + ### getPresetTilesetDepthTexture

    public [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") getPresetTilesetDepthTexture()
  + ### getPresetDepthTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getPresetDepthTexture(int col,
    int row)
  + ### initSprites

    public void initSprites()
  + ### initSprites

    public void initSprites([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### Reset

    public void Reset()
  + ### addedLoadTask

    public void addedLoadTask()
  + ### finishedLoadTask

    public void finishedLoadTask()
  + ### loadedTileDefinitions

    public void loadedTileDefinitions()
  + ### isLoadingFinished

    public boolean isLoadingFinished()
  + ### getEmptyDepthTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getEmptyDepthTexture(int width,
    int height)