[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TilesetDepthTexture](TilesetDepthTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [name](#name)
   3. [columns](#columns)
   4. [rows](#rows)
   5. [tiles](#tiles)
   6. [is2x](#is2x)
   7. [fileExists](#fileExists)
   8. [keepPixels](#keepPixels)
6. [Constructor Details](#constructor-detail)
   1. [TilesetDepthTexture(TileDepthTextures, String, int, int, boolean)](#%3Cinit%3E(zombie.tileDepth.TileDepthTextures,java.lang.String,int,int,boolean))
7. [Method Details](#method-detail)
   1. [getColumns()](#getColumns())
   2. [getRows()](#getRows())
   3. [is2x()](#is2x())
   4. [setKeepPixels(boolean)](#setKeepPixels(boolean))
   5. [isKeepPixels()](#isKeepPixels())
   6. [getOrCreateTile(int)](#getOrCreateTile(int))
   7. [createTile(int)](#createTile(int))
   8. [getOrCreateTile(int, int)](#getOrCreateTile(int,int))
   9. [getName()](#getName())
   10. [getTileWidth()](#getTileWidth())
   11. [getTileHeight()](#getTileHeight())
   12. [getWidth()](#getWidth())
   13. [getHeight()](#getHeight())
   14. [getTileCount()](#getTileCount())
   15. [tileIndex(int, int)](#tileIndex(int,int))
   16. [isEmpty()](#isEmpty())
   17. [getBufferedImage()](#getBufferedImage())
   18. [writeImageToFile(BufferedImage, String)](#writeImageToFile(java.awt.image.BufferedImage,java.lang.String))
   19. [getRelativeFileName()](#getRelativeFileName())
   20. [getAbsoluteFileName()](#getAbsoluteFileName())
   21. [load()](#load())
   22. [save()](#save())
   23. [fileExists()](#fileExists())
   24. [removeFile()](#removeFile())
   25. [getTexture()](#getTexture())
   26. [reload()](#reload())
   27. [mergeTileset(TilesetDepthTexture)](#mergeTileset(zombie.tileDepth.TilesetDepthTexture))
   28. [initSprites()](#initSprites())
   29. [recalculateDepth()](#recalculateDepth())
   30. [recalculateShadowDepth()](#recalculateShadowDepth())
   31. [clearTiles()](#clearTiles())
   32. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TilesetDepthTexture
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TilesetDepthTexture

---

public final class TilesetDepthTexture
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `columns`

  `private int`

  `fileExists`

  `private final boolean`

  `is2x`

  `private boolean`

  `keepPixels`

  `private final String`

  `name`

  `private final TileDepthTextures`

  `owner`

  `private final int`

  `rows`

  `private final TileDepthTexture[]`

  `tiles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TilesetDepthTexture(TileDepthTextures owner,
  String name,
  int columns,
  int rows,
  boolean b2x)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearTiles()`

  `private TileDepthTexture`

  `createTile(int index)`

  `boolean`

  `fileExists()`

  `String`

  `getAbsoluteFileName()`

  `(package private) BufferedImage`

  `getBufferedImage()`

  `int`

  `getColumns()`

  `int`

  `getHeight()`

  `String`

  `getName()`

  `TileDepthTexture`

  `getOrCreateTile(int index)`

  `TileDepthTexture`

  `getOrCreateTile(int col,
  int row)`

  `String`

  `getRelativeFileName()`

  `int`

  `getRows()`

  `Texture`

  `getTexture()`

  `int`

  `getTileCount()`

  `int`

  `getTileHeight()`

  `int`

  `getTileWidth()`

  `int`

  `getWidth()`

  `void`

  `initSprites()`

  `boolean`

  `is2x()`

  `(package private) boolean`

  `isEmpty()`

  `boolean`

  `isKeepPixels()`

  `void`

  `load()`

  `void`

  `mergeTileset(TilesetDepthTexture other)`

  `(package private) void`

  `recalculateDepth()`

  `void`

  `recalculateShadowDepth()`

  `void`

  `reload()`

  `void`

  `removeFile()`

  `void`

  `Reset()`

  `void`

  `save()`

  `void`

  `setKeepPixels(boolean bKeepPixels)`

  `private int`

  `tileIndex(int col,
  int row)`

  `(package private) void`

  `writeImageToFile(BufferedImage bufferedImage,
  String fileName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    private final [TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") owner
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### columns

    private final int columns
  + ### rows

    private final int rows
  + ### tiles

    private final [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth")[] tiles
  + ### is2x

    private final boolean is2x
  + ### fileExists

    private int fileExists
  + ### keepPixels

    private boolean keepPixels
* Constructor Details
  -------------------

  + ### TilesetDepthTexture

    public TilesetDepthTexture([TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int columns,
    int rows,
    boolean b2x)
* Method Details
  --------------

  + ### getColumns

    public int getColumns()
  + ### getRows

    public int getRows()
  + ### is2x

    public boolean is2x()
  + ### setKeepPixels

    public void setKeepPixels(boolean bKeepPixels)
  + ### isKeepPixels

    public boolean isKeepPixels()
  + ### getOrCreateTile

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getOrCreateTile(int index)
  + ### createTile

    private [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") createTile(int index)
  + ### getOrCreateTile

    public [TileDepthTexture](TileDepthTexture.html "class in zombie.tileDepth") getOrCreateTile(int col,
    int row)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getTileWidth

    public int getTileWidth()
  + ### getTileHeight

    public int getTileHeight()
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### getTileCount

    public int getTileCount()
  + ### tileIndex

    private int tileIndex(int col,
    int row)
  + ### isEmpty

    boolean isEmpty()
  + ### getBufferedImage

    [BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") getBufferedImage()
  + ### writeImageToFile

    void writeImageToFile([BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") bufferedImage,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getRelativeFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRelativeFileName()
  + ### getAbsoluteFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAbsoluteFileName()
  + ### load

    public void load()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### save

    public void save()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### fileExists

    public boolean fileExists()
  + ### removeFile

    public void removeFile()
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### reload

    public void reload()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### mergeTileset

    public void mergeTileset([TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") other)
  + ### initSprites

    public void initSprites()
  + ### recalculateDepth

    void recalculateDepth()
  + ### recalculateShadowDepth

    public void recalculateShadowDepth()
  + ### clearTiles

    public void clearTiles()
  + ### Reset

    public void Reset()