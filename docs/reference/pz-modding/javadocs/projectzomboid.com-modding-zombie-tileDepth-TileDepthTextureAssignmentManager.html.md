[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileDepthTextureAssignmentManager](TileDepthTextureAssignmentManager.html)

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
   1. [TileDepthTextureAssignmentManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [initGameData()](#initGameData())
   4. [initModData(ChooseGameInfo.Mod)](#initModData(zombie.gameStates.ChooseGameInfo.Mod))
   5. [save(String)](#save(java.lang.String))
   6. [getModData(String)](#getModData(java.lang.String))
   7. [initSprites()](#initSprites())
   8. [assignTileName(String, String, String)](#assignTileName(java.lang.String,java.lang.String,java.lang.String))
   9. [getAssignedTileName(String, String)](#getAssignedTileName(java.lang.String,java.lang.String))
   10. [clearAssignedTileName(String, String)](#clearAssignedTileName(java.lang.String,java.lang.String))
   11. [assignDepthTextureToSprite(String, String)](#assignDepthTextureToSprite(java.lang.String,java.lang.String))
   12. [getAssignedTileName(String)](#getAssignedTileName(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileDepthTextureAssignmentManager
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileDepthTextureAssignmentManager

---

public final class TileDepthTextureAssignmentManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `TileDepthTextureAssignmentManager.ModData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static TileDepthTextureAssignmentManager`

  `instance`

  `private final ArrayList<TileDepthTextureAssignmentManager.ModData>`

  `modData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileDepthTextureAssignmentManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `assignDepthTextureToSprite(String modID,
  String tileName)`

  `void`

  `assignTileName(String modID,
  String assignTo,
  String otherTile)`

  `void`

  `clearAssignedTileName(String modID,
  String assignTo)`

  `(package private) String`

  `getAssignedTileName(String tileName)`

  `String`

  `getAssignedTileName(String modID,
  String tileName)`

  `static TileDepthTextureAssignmentManager`

  `getInstance()`

  `(package private) TileDepthTextureAssignmentManager.ModData`

  `getModData(String modID)`

  `void`

  `init()`

  `void`

  `initGameData()`

  `void`

  `initModData(ChooseGameInfo.Mod mod)`

  `void`

  `initSprites()`

  `void`

  `save(String modID)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [TileDepthTextureAssignmentManager](TileDepthTextureAssignmentManager.html "class in zombie.tileDepth") instance
  + ### modData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileDepthTextureAssignmentManager.ModData](TileDepthTextureAssignmentManager.ModData.html "class in zombie.tileDepth")> modData
* Constructor Details
  -------------------

  + ### TileDepthTextureAssignmentManager

    private TileDepthTextureAssignmentManager()
* Method Details
  --------------

  + ### getInstance

    public static [TileDepthTextureAssignmentManager](TileDepthTextureAssignmentManager.html "class in zombie.tileDepth") getInstance()
  + ### init

    public void init()
  + ### initGameData

    public void initGameData()
  + ### initModData

    public void initModData([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### save

    public void save([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getModData

    [TileDepthTextureAssignmentManager.ModData](TileDepthTextureAssignmentManager.ModData.html "class in zombie.tileDepth") getModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### initSprites

    public void initSprites()
  + ### assignTileName

    public void assignTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") assignTo,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") otherTile)
  + ### getAssignedTileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAssignedTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### clearAssignedTileName

    public void clearAssignedTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") assignTo)
  + ### assignDepthTextureToSprite

    public void assignDepthTextureToSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### getAssignedTileName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAssignedTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)