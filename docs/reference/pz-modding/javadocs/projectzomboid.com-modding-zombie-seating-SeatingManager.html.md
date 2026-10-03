[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.seating](package-summary.html)
2. [SeatingManager](SeatingManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [DEFAULT\_FACING](#DEFAULT_FACING)
   3. [modData](#modData)
   4. [mergedTilesets](#mergedTilesets)
7. [Constructor Details](#constructor-detail)
   1. [SeatingManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [initMergedTilesets()](#initMergedTilesets())
   6. [mergeAfterEditing()](#mergeAfterEditing())
   7. [getModIDs()](#getModIDs())
   8. [getModData(String)](#getModData(java.lang.String))
   9. [getModDataRequired(String)](#getModDataRequired(java.lang.String))
   10. [getSeatingDataRequired(String)](#getSeatingDataRequired(java.lang.String))
   11. [addTilePosition(String, String, int, int, String)](#addTilePosition(java.lang.String,java.lang.String,int,int,java.lang.String))
   12. [removeTilePosition(String, String, int, int, int)](#removeTilePosition(java.lang.String,java.lang.String,int,int,int))
   13. [getTilePositionCount(String, String, int, int)](#getTilePositionCount(java.lang.String,java.lang.String,int,int))
   14. [getTilePositionCount(String, int, int)](#getTilePositionCount(java.lang.String,int,int))
   15. [getTilePositionCount(IsoObject)](#getTilePositionCount(zombie.iso.IsoObject))
   16. [getTilePositionID(String, String, int, int, int)](#getTilePositionID(java.lang.String,java.lang.String,int,int,int))
   17. [hasTilePositionWithID(String, String, int, int, String)](#hasTilePositionWithID(java.lang.String,java.lang.String,int,int,java.lang.String))
   18. [getTilePositionTranslate(String, String, int, int, int)](#getTilePositionTranslate(java.lang.String,java.lang.String,int,int,int))
   19. [getTilePositionProperty(String, String, int, int, int, String)](#getTilePositionProperty(java.lang.String,java.lang.String,int,int,int,java.lang.String))
   20. [setTilePositionProperty(String, String, int, int, int, String, String)](#setTilePositionProperty(java.lang.String,java.lang.String,int,int,int,java.lang.String,java.lang.String))
   21. [getTileProperty(String, int, int, String)](#getTileProperty(java.lang.String,int,int,java.lang.String))
   22. [getTileProperty(String, String, int, int, String)](#getTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String))
   23. [setTileProperty(String, String, int, int, String, String)](#setTileProperty(java.lang.String,java.lang.String,int,int,java.lang.String,java.lang.String))
   24. [getTile(String, String, int, int)](#getTile(java.lang.String,java.lang.String,int,int))
   25. [getOrCreateTile(String, String, int, int)](#getOrCreateTile(java.lang.String,java.lang.String,int,int))
   26. [getTranslation(String, IsoSprite, String, Vector3f)](#getTranslation(java.lang.String,zombie.iso.sprite.IsoSprite,java.lang.String,org.joml.Vector3f))
   27. [getTranslation(SeatingData, String, int, String, Vector3f)](#getTranslation(zombie.seating.SeatingData,java.lang.String,int,java.lang.String,org.joml.Vector3f))
   28. [getTranslation(String, String, int, String, Vector3f)](#getTranslation(java.lang.String,java.lang.String,int,java.lang.String,org.joml.Vector3f))
   29. [getTranslation(String, int, String, Vector3f)](#getTranslation(java.lang.String,int,java.lang.String,org.joml.Vector3f))
   30. [getTranslation(SeatingData, IsoSprite, String, Vector3f)](#getTranslation(zombie.seating.SeatingData,zombie.iso.sprite.IsoSprite,java.lang.String,org.joml.Vector3f))
   31. [getTranslation(IsoSprite, String, Vector3f)](#getTranslation(zombie.iso.sprite.IsoSprite,java.lang.String,org.joml.Vector3f))
   32. [getAdjacentPosition(IsoGameCharacter, IsoObject, String, String, String, String, Vector3f)](#getAdjacentPosition(zombie.characters.IsoGameCharacter,zombie.iso.IsoObject,java.lang.String,java.lang.String,java.lang.String,java.lang.String,org.joml.Vector3f))
   33. [getAdjacentPosition(SeatingData, IsoSprite, String, String, Model, String, String, String, Vector2f)](#getAdjacentPosition(zombie.seating.SeatingData,zombie.iso.sprite.IsoSprite,java.lang.String,java.lang.String,zombie.core.skinnedmodel.model.Model,java.lang.String,java.lang.String,java.lang.String,org.joml.Vector2f))
   34. [getAdjacentPosition(String, IsoSprite, String, String, Model, String, String, String, Vector2f)](#getAdjacentPosition(java.lang.String,zombie.iso.sprite.IsoSprite,java.lang.String,java.lang.String,zombie.core.skinnedmodel.model.Model,java.lang.String,java.lang.String,java.lang.String,org.joml.Vector2f))
   35. [getFacingDirection(SeatingData, String, int, int)](#getFacingDirection(zombie.seating.SeatingData,java.lang.String,int,int))
   36. [getFacingDirection(String, String, int, int)](#getFacingDirection(java.lang.String,java.lang.String,int,int))
   37. [getFacingDirection(String, int, int)](#getFacingDirection(java.lang.String,int,int))
   38. [getFacingDirection(IsoSprite)](#getFacingDirection(zombie.iso.sprite.IsoSprite))
   39. [getFacingDirection(IsoObject)](#getFacingDirection(zombie.iso.IsoObject))
   40. [getTotalDeferredMovement(SkinningData, AnimNode, Vector2)](#getTotalDeferredMovement(zombie.core.skinnedmodel.model.SkinningData,zombie.core.skinnedmodel.advancedanimation.AnimNode,zombie.iso.Vector2))
   41. [getDeferredMovement(BoneAxis, Vector3f, Vector2)](#getDeferredMovement(zombie.core.skinnedmodel.animation.BoneAxis,org.lwjgl.util.vector.Vector3f,zombie.iso.Vector2))
   42. [getAnimationTrackFraction(IsoGameCharacter, String)](#getAnimationTrackFraction(zombie.characters.IsoGameCharacter,java.lang.String))
   43. [write(String)](#write(java.lang.String))
   44. [fixDefaultPositions()](#fixDefaultPositions())
   45. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SeatingManager
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.seating.SeatingManager

---

public final class SeatingManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `SeatingManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final String`

  `DEFAULT_FACING`

  `private static SeatingManager`

  `instance`

  `private final zombie.seating.SeatingData`

  `mergedTilesets`

  `private final ArrayList<SeatingManager.ModData>`

  `modData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SeatingManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `addTilePosition(String modID,
  String tilesetName,
  int col,
  int row,
  String id)`

  `void`

  `fixDefaultPositions()`

  `boolean`

  `getAdjacentPosition(String modID,
  IsoSprite sprite,
  String sitDirectionStr,
  String sideStr,
  zombie.core.skinnedmodel.model.Model model,
  String animSetName,
  String animStateName,
  String animNodeName,
  Vector2f worldPos)`

  `boolean`

  `getAdjacentPosition(IsoGameCharacter character,
  IsoObject isoObject,
  String sitDirection,
  String side,
  String animStateName,
  String animNodeName,
  Vector3f worldPos)`

  `private boolean`

  `getAdjacentPosition(zombie.seating.SeatingData data,
  IsoSprite sprite,
  String sitDirectionStr,
  String sideStr,
  zombie.core.skinnedmodel.model.Model model,
  String animSetName,
  String animStateName,
  String animNodeName,
  Vector2f worldPos)`

  `float`

  `getAnimationTrackFraction(IsoGameCharacter character,
  String animNodeName)`

  `Vector2`

  `getDeferredMovement(zombie.core.skinnedmodel.animation.BoneAxis boneAxis,
  org.lwjgl.util.vector.Vector3f bonePos,
  Vector2 deferredPos)`

  `String`

  `getFacingDirection(String tilesetName,
  int col,
  int row)`

  `String`

  `getFacingDirection(String modID,
  String tilesetName,
  int col,
  int row)`

  `String`

  `getFacingDirection(IsoObject object)`

  `String`

  `getFacingDirection(IsoSprite sprite)`

  `private String`

  `getFacingDirection(zombie.seating.SeatingData data,
  String tilesetName,
  int col,
  int row)`

  `static SeatingManager`

  `getInstance()`

  `(package private) SeatingManager.ModData`

  `getModData(String modID)`

  `(package private) SeatingManager.ModData`

  `getModDataRequired(String modID)`

  `ArrayList<String>`

  `getModIDs()`

  `zombie.seating.SeatingFile.Tile`

  `getOrCreateTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `(package private) zombie.seating.SeatingData`

  `getSeatingDataRequired(String modID)`

  `zombie.seating.SeatingFile.Tile`

  `getTile(String modID,
  String tilesetName,
  int col,
  int row)`

  `int`

  `getTilePositionCount(String tilesetName,
  int col,
  int row)`

  `int`

  `getTilePositionCount(String modID,
  String tilesetName,
  int col,
  int row)`

  `int`

  `getTilePositionCount(IsoObject isoObject)`

  `String`

  `getTilePositionID(String modID,
  String tilesetName,
  int col,
  int row,
  int index)`

  `String`

  `getTilePositionProperty(String modID,
  String tilesetName,
  int col,
  int row,
  int index,
  String key)`

  `Vector3f`

  `getTilePositionTranslate(String modID,
  String tilesetName,
  int col,
  int row,
  int index)`

  `String`

  `getTileProperty(String tilesetName,
  int col,
  int row,
  String key)`

  `String`

  `getTileProperty(String modID,
  String tilesetName,
  int col,
  int row,
  String key)`

  `(package private) void`

  `getTotalDeferredMovement(zombie.core.skinnedmodel.model.SkinningData skinningData,
  zombie.core.skinnedmodel.advancedanimation.AnimNode animNode,
  Vector2 result)`

  `Vector3f`

  `getTranslation(String tilesetName,
  int tileSheetIndex,
  String sitDirection,
  Vector3f xln)`

  `Vector3f`

  `getTranslation(String modID,
  String tilesetName,
  int tileSheetIndex,
  String sitDirection,
  Vector3f xln)`

  `Vector3f`

  `getTranslation(String modID,
  IsoSprite sprite,
  String sitDirection,
  Vector3f xln)`

  `Vector3f`

  `getTranslation(IsoSprite sprite,
  String sitDirection,
  Vector3f xln)`

  `private Vector3f`

  `getTranslation(zombie.seating.SeatingData data,
  String tilesetName,
  int tileSheetIndex,
  String sitDirection,
  Vector3f xln)`

  `private Vector3f`

  `getTranslation(zombie.seating.SeatingData data,
  IsoSprite sprite,
  String sitDirection,
  Vector3f xln)`

  `boolean`

  `hasTilePositionWithID(String modID,
  String tilesetName,
  int col,
  int row,
  String id)`

  `void`

  `init()`

  `void`

  `initGameData()`

  `private void`

  `initMergedTilesets()`

  `void`

  `initModData(ChooseGameInfo.Mod mod)`

  `void`

  `mergeAfterEditing()`

  `void`

  `removeTilePosition(String modID,
  String tilesetName,
  int col,
  int row,
  int index)`

  `void`

  `Reset()`

  `void`

  `setTilePositionProperty(String modID,
  String tilesetName,
  int col,
  int row,
  int index,
  String key,
  String value)`

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

    private static [SeatingManager](SeatingManager.html "class in zombie.seating") instance
  + ### DEFAULT\_FACING

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_FACING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.seating.SeatingManager.DEFAULT_FACING)
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SeatingManager.ModData](SeatingManager.ModData.html "class in zombie.seating")> modData
  + ### mergedTilesets

    private final zombie.seating.SeatingData mergedTilesets
* Constructor Details
  -------------------

  + ### SeatingManager

    private SeatingManager()
* Method Details
  --------------

  + ### getInstance

    public static [SeatingManager](SeatingManager.html "class in zombie.seating") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### initMergedTilesets

    private void initMergedTilesets()
  + ### mergeAfterEditing

    public void mergeAfterEditing()
  + ### getModIDs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getModIDs()
  + ### getModData

    [SeatingManager.ModData](SeatingManager.ModData.html "class in zombie.seating") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getModDataRequired

    [SeatingManager.ModData](SeatingManager.ModData.html "class in zombie.seating") getModDataRequired([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getSeatingDataRequired

    zombie.seating.SeatingData getSeatingDataRequired([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### addTilePosition

    public int addTilePosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### removeTilePosition

    public void removeTilePosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    int index)
  + ### getTilePositionCount

    public int getTilePositionCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getTilePositionCount

    public int getTilePositionCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getTilePositionCount

    public int getTilePositionCount([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### getTilePositionID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTilePositionID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    int index)
  + ### hasTilePositionWithID

    public boolean hasTilePositionWithID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getTilePositionTranslate

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTilePositionTranslate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    int index)
  + ### getTilePositionProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTilePositionProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    int index,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### setTilePositionProperty

    public void setTilePositionProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    int index,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### getTileProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTileProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
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

    public zombie.seating.SeatingFile.Tile getTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getOrCreateTile

    public zombie.seating.SeatingFile.Tile getOrCreateTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getTranslation

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getTranslation

    private [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation(zombie.seating.SeatingData data,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileSheetIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getTranslation

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileSheetIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getTranslation

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileSheetIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getTranslation

    private [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation(zombie.seating.SeatingData data,
    [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getTranslation

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslation([IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") xln)
  + ### getAdjacentPosition

    public boolean getAdjacentPosition([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") side,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animStateName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animNodeName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos)
  + ### getAdjacentPosition

    private boolean getAdjacentPosition(zombie.seating.SeatingData data,
    [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirectionStr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sideStr,
    zombie.core.skinnedmodel.model.Model model,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animSetName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animStateName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animNodeName,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") worldPos)
  + ### getAdjacentPosition

    public boolean getAdjacentPosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sitDirectionStr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sideStr,
    zombie.core.skinnedmodel.model.Model model,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animSetName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animStateName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animNodeName,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") worldPos)
  + ### getFacingDirection

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFacingDirection(zombie.seating.SeatingData data,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getFacingDirection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFacingDirection([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getFacingDirection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFacingDirection([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int col,
    int row)
  + ### getFacingDirection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFacingDirection([IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getFacingDirection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFacingDirection([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### getTotalDeferredMovement

    void getTotalDeferredMovement(zombie.core.skinnedmodel.model.SkinningData skinningData,
    zombie.core.skinnedmodel.advancedanimation.AnimNode animNode,
    [Vector2](../iso/Vector2.html "class in zombie.iso") result)
  + ### getDeferredMovement

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getDeferredMovement(zombie.core.skinnedmodel.animation.BoneAxis boneAxis,
    org.lwjgl.util.vector.Vector3f bonePos,
    [Vector2](../iso/Vector2.html "class in zombie.iso") deferredPos)
  + ### getAnimationTrackFraction

    public float getAnimationTrackFraction([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animNodeName)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### fixDefaultPositions

    public void fixDefaultPositions()
  + ### Reset

    public void Reset()