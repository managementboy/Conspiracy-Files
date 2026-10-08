[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileDepthTextures](TileDepthTextures.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [modId](#modId)
   2. [mediaAbsPath](#mediaAbsPath)
   3. [tilesetRows](#tilesetRows)
   4. [tilesets](#tilesets)
   5. [nullTilesets](#nullTilesets)
7. [Constructor Details](#constructor-detail)
   1. [TileDepthTextures(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [saveTileset(String)](#saveTileset(java.lang.String))
   2. [getTexture(String, int)](#getTexture(java.lang.String,int))
   3. [getTextureFromTileName(String)](#getTextureFromTileName(java.lang.String))
   4. [createTileset(String, boolean)](#createTileset(java.lang.String,boolean))
   5. [getExistingTileset(String)](#getExistingTileset(java.lang.String))
   6. [getTilesetRows(String, boolean)](#getTilesetRows(java.lang.String,boolean))
   7. [loadDepthTextureImages()](#loadDepthTextureImages())
   8. [hackAddPresetTilesetDepthTexture()](#hackAddPresetTilesetDepthTexture())
   9. [mergeTilesets(TileDepthTextures)](#mergeTilesets(zombie.tileDepth.TileDepthTextures))
   10. [mergeTileset(TilesetDepthTexture)](#mergeTileset(zombie.tileDepth.TilesetDepthTexture))
   11. [initSprites()](#initSprites())
   12. [initSprites(String)](#initSprites(java.lang.String))
   13. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileDepthTextures
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileDepthTextures

---

public final class TileDepthTextures
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `TileDepthTextures.LoadTask`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final String`

  `mediaAbsPath`

  `(package private) final String`

  `modId`

  `private final HashSet<String>`

  `nullTilesets`

  `private final HashMap<String,Integer>`

  `tilesetRows`

  `private final HashMap<String, TilesetDepthTexture>`

  `tilesets`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileDepthTextures(String modID,
  String mediaAbsPath)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private TilesetDepthTexture`

  `createTileset(String tilesetName,
  boolean bUseCachedValue)`

  `TilesetDepthTexture`

  `getExistingTileset(String tilesetName)`

  `TileDepthTexture`

  `getTexture(String tilesetName,
  int tileIndex)`

  `TileDepthTexture`

  `getTextureFromTileName(String tileName)`

  `private int`

  `getTilesetRows(String tilesetName,
  boolean bUseCachedValue)`

  `protected void`

  `hackAddPresetTilesetDepthTexture()`

  `void`

  `initSprites()`

  `void`

  `initSprites(String tilesetName)`

  `void`

  `loadDepthTextureImages()`

  `void`

  `mergeTileset(TilesetDepthTexture other)`

  `void`

  `mergeTilesets(TileDepthTextures other)`

  `void`

  `Reset()`

  `void`

  `saveTileset(String tilesetName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### modId

    final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### mediaAbsPath

    final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaAbsPath
  + ### tilesetRows

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> tilesetRows
  + ### tilesets

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth")> tilesets
  + ### nullTilesets

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> nullTilesets
* Constructor Details
  -------------------

  + ### TileDepthTextures

    public TileDepthTextures([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaAbsPath)
* Method Details
  --------------

  + ### saveTileset

    public void saveTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getTexture

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileIndex)
  + ### getTextureFromTileName

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getTextureFromTileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### createTileset

    private [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") createTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    boolean bUseCachedValue)
  + ### getExistingTileset

    public [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") getExistingTileset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### getTilesetRows

    private int getTilesetRows([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    boolean bUseCachedValue)
  + ### loadDepthTextureImages

    public void loadDepthTextureImages()
  + ### hackAddPresetTilesetDepthTexture

    protected void hackAddPresetTilesetDepthTexture()
  + ### mergeTilesets

    public void mergeTilesets([TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") other)
  + ### mergeTileset

    public void mergeTileset([TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") other)
  + ### initSprites

    public void initSprites()
  + ### initSprites

    public void initSprites([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName)
  + ### Reset

    public void Reset()