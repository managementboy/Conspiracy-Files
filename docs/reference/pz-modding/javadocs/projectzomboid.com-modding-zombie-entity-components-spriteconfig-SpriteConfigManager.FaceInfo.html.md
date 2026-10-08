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
3. [FaceInfo](SpriteConfigManager.FaceInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sprites](#sprites)
   2. [face](#face)
   3. [width](#width)
   4. [height](#height)
   5. [zLayers](#zLayers)
   6. [tileInfos](#tileInfos)
   7. [masterPosX](#masterPosX)
   8. [masterPosY](#masterPosY)
   9. [masterPosZ](#masterPosZ)
   10. [isMasterSet](#isMasterSet)
   11. [isMultiSquare](#isMultiSquare)
6. [Constructor Details](#constructor-detail)
   1. [FaceInfo(String, int, int, int)](#%3Cinit%3E(java.lang.String,int,int,int))
7. [Method Details](#method-detail)
   1. [getFaceName()](#getFaceName())
   2. [getWidth()](#getWidth())
   3. [getHeight()](#getHeight())
   4. [getzLayers()](#getzLayers())
   5. [getMasterX()](#getMasterX())
   6. [getMasterY()](#getMasterY())
   7. [getMasterZ()](#getMasterZ())
   8. [isMasterSet()](#isMasterSet())
   9. [isMultiSquare()](#isMultiSquare())
   10. [getMasterTileInfo()](#getMasterTileInfo())
   11. [verifyObject(int, int, int, IsoObject)](#verifyObject(int,int,int,zombie.iso.IsoObject))
   12. [CreateTile(String, int, int, int, boolean)](#CreateTile(java.lang.String,int,int,int,boolean))
   13. [CreateEmpty(boolean, int, int, int)](#CreateEmpty(boolean,int,int,int))
   14. [getTileInfo(int, int, int)](#getTileInfo(int,int,int))
   15. [getTileInfoForSprite(String)](#getTileInfoForSprite(java.lang.String))
   16. [ensureTileInfos()](#ensureTileInfos())
   17. [getMainSpriteName()](#getMainSpriteName())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigManager.FaceInfo
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.spriteconfig.SpriteConfigManager.FaceInfo

Enclosing class:
:   `SpriteConfigManager`

---

public static class SpriteConfigManager.FaceInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `face`

  `private final int`

  `height`

  `private boolean`

  `isMasterSet`

  `private final boolean`

  `isMultiSquare`

  `private int`

  `masterPosX`

  `private int`

  `masterPosY`

  `private int`

  `masterPosZ`

  `private final HashMap<String, SpriteConfigManager.TileInfo>`

  `sprites`

  `private final SpriteConfigManager.TileInfo[][][]`

  `tileInfos`

  `private final int`

  `width`

  `private final int`

  `zLayers`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FaceInfo(String face,
  int width,
  int height,
  int zLayers)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private SpriteConfigManager.TileInfo`

  `CreateEmpty(boolean blocks,
  int gridPosX,
  int gridPosY,
  int gridPosZ)`

  `private SpriteConfigManager.TileInfo`

  `CreateTile(String sprite,
  int gridPosX,
  int gridPosY,
  int gridPosZ,
  boolean isMaster)`

  `protected void`

  `ensureTileInfos()`

  `String`

  `getFaceName()`

  `int`

  `getHeight()`

  `protected String`

  `getMainSpriteName()`

  `SpriteConfigManager.TileInfo`

  `getMasterTileInfo()`

  `int`

  `getMasterX()`

  `int`

  `getMasterY()`

  `int`

  `getMasterZ()`

  `SpriteConfigManager.TileInfo`

  `getTileInfo(int x,
  int y,
  int z)`

  `SpriteConfigManager.TileInfo`

  `getTileInfoForSprite(String tile)`

  `int`

  `getWidth()`

  `int`

  `getzLayers()`

  `boolean`

  `isMasterSet()`

  `boolean`

  `isMultiSquare()`

  `boolean`

  `verifyObject(int x,
  int y,
  int z,
  IsoObject object)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sprites

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig")> sprites
  + ### face

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") face
  + ### width

    private final int width
  + ### height

    private final int height
  + ### zLayers

    private final int zLayers
  + ### tileInfos

    private final [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig")[][][] tileInfos
  + ### masterPosX

    private int masterPosX
  + ### masterPosY

    private int masterPosY
  + ### masterPosZ

    private int masterPosZ
  + ### isMasterSet

    private boolean isMasterSet
  + ### isMultiSquare

    private final boolean isMultiSquare
* Constructor Details
  -------------------

  + ### FaceInfo

    private FaceInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") face,
    int width,
    int height,
    int zLayers)
* Method Details
  --------------

  + ### getFaceName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFaceName()
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### getzLayers

    public int getzLayers()
  + ### getMasterX

    public int getMasterX()
  + ### getMasterY

    public int getMasterY()
  + ### getMasterZ

    public int getMasterZ()
  + ### isMasterSet

    public boolean isMasterSet()
  + ### isMultiSquare

    public boolean isMultiSquare()
  + ### getMasterTileInfo

    public [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") getMasterTileInfo()
  + ### verifyObject

    public boolean verifyObject(int x,
    int y,
    int z,
    [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") object)
  + ### CreateTile

    private [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") CreateTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite,
    int gridPosX,
    int gridPosY,
    int gridPosZ,
    boolean isMaster)
  + ### CreateEmpty

    private [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") CreateEmpty(boolean blocks,
    int gridPosX,
    int gridPosY,
    int gridPosZ)
  + ### getTileInfo

    public [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") getTileInfo(int x,
    int y,
    int z)
  + ### getTileInfoForSprite

    public [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") getTileInfoForSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile)
  + ### ensureTileInfos

    protected void ensureTileInfos()
  + ### getMainSpriteName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMainSpriteName()