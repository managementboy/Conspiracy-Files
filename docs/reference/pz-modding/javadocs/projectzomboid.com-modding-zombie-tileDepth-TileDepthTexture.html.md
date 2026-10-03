[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileDepthTexture](TileDepthTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tileset](#tileset)
   2. [index](#index)
   3. [width](#width)
   4. [height](#height)
   5. [pixels](#pixels)
   6. [name](#name)
   7. [texture](#texture)
   8. [empty](#empty)
   9. [s\_clampedPixels](#s_clampedPixels)
   10. [clampedPixelsInit](#clampedPixelsInit)
   11. [floorPolygon](#floorPolygon)
6. [Constructor Details](#constructor-detail)
   1. [TileDepthTexture(TilesetDepthTexture, int)](#%3Cinit%3E(zombie.tileDepth.TilesetDepthTexture,int))
7. [Method Details](#method-detail)
   1. [getTileset()](#getTileset())
   2. [getIndex()](#getIndex())
   3. [getColumn()](#getColumn())
   4. [getRow()](#getRow())
   5. [getName()](#getName())
   6. [getWidth()](#getWidth())
   7. [getHeight()](#getHeight())
   8. [isEmpty()](#isEmpty())
   9. [getPixels()](#getPixels())
   10. [setPixel(int, int, float)](#setPixel(int,int,float))
   11. [getPixel(int, int)](#getPixel(int,int))
   12. [setMinPixel(int, int, float)](#setMinPixel(int,int,float))
   13. [setPixels(int, int, int, int, float)](#setPixels(int,int,int,int,float))
   14. [replacePixels(int, int, int, int, float, float)](#replacePixels(int,int,int,int,float,float))
   15. [index(int, int)](#index(int,int))
   16. [allocPixelsIfNeeded()](#allocPixelsIfNeeded())
   17. [load(float[], BufferedImage, int, int)](#load(float%5B%5D,java.awt.image.BufferedImage,int,int))
   18. [load(float[], ByteBuffer, int, int, int)](#load(float%5B%5D,java.nio.ByteBuffer,int,int,int))
   19. [setBufferedImage(BufferedImage, int, int)](#setBufferedImage(java.awt.image.BufferedImage,int,int))
   20. [clampPixelToUpperFloor(int, int, float)](#clampPixelToUpperFloor(int,int,float))
   21. [initClampedPixels()](#initClampedPixels())
   22. [save()](#save())
   23. [fileExists()](#fileExists())
   24. [getTexture()](#getTexture())
   25. [updateGPUTexture()](#updateGPUTexture())
   26. [recalculateDepth()](#recalculateDepth())
   27. [getOrCreateFloorPolygon()](#getOrCreateFloorPolygon())
   28. [recalculateShadowDepth()](#recalculateShadowDepth())
   29. [reload()](#reload())
   30. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileDepthTexture
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileDepthTexture

---

public final class TileDepthTexture
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static boolean`

  `clampedPixelsInit`

  `private boolean`

  `empty`

  `(package private) static zombie.tileDepth.TileGeometryFile.Polygon`

  `floorPolygon`

  `private final int`

  `height`

  `private final int`

  `index`

  `private final String`

  `name`

  `private float[]`

  `pixels`

  `private static final float[]`

  `s_clampedPixels`

  `private Texture`

  `texture`

  `private final TilesetDepthTexture`

  `tileset`

  `private final int`

  `width`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileDepthTexture(TilesetDepthTexture tileset,
  int tileIndex)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `allocPixelsIfNeeded()`

  `private float`

  `clampPixelToUpperFloor(int x,
  int y,
  float pixel)`

  `boolean`

  `fileExists()`

  `int`

  `getColumn()`

  `int`

  `getHeight()`

  `int`

  `getIndex()`

  `String`

  `getName()`

  `(package private) zombie.tileDepth.TileGeometryFile.Geometry`

  `getOrCreateFloorPolygon()`

  `float`

  `getPixel(int x,
  int y)`

  `float[]`

  `getPixels()`

  `int`

  `getRow()`

  `Texture`

  `getTexture()`

  `TilesetDepthTexture`

  `getTileset()`

  `int`

  `getWidth()`

  `int`

  `index(int x,
  int y)`

  `private static void`

  `initClampedPixels()`

  `boolean`

  `isEmpty()`

  `(package private) void`

  `load(float[] pixels,
  BufferedImage bufferedImage,
  int left,
  int top)`

  Deprecated.

  `(package private) void`

  `load(float[] pixels,
  ByteBuffer bb,
  int stride,
  int left,
  int top)`

  `(package private) void`

  `recalculateDepth()`

  `(package private) void`

  `recalculateShadowDepth()`

  `void`

  `reload()`

  `void`

  `replacePixels(int x,
  int y,
  int w,
  int h,
  float oldPixel,
  float newPixel)`

  `void`

  `Reset()`

  `void`

  `save()`

  `(package private) BufferedImage`

  `setBufferedImage(BufferedImage bufferedImage,
  int left,
  int top)`

  `void`

  `setMinPixel(int x,
  int y,
  float pixel)`

  `void`

  `setPixel(int x,
  int y,
  float pixel)`

  `void`

  `setPixels(int x,
  int y,
  int w,
  int h,
  float pixel)`

  `void`

  `updateGPUTexture()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tileset

    private final [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") tileset
  + ### index

    private final int index
  + ### width

    private final int width
  + ### height

    private final int height
  + ### pixels

    private float[] pixels
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### texture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### empty

    private boolean empty
  + ### s\_clampedPixels

    private static final float[] s\_clampedPixels
  + ### clampedPixelsInit

    private static boolean clampedPixelsInit
  + ### floorPolygon

    static zombie.tileDepth.TileGeometryFile.Polygon floorPolygon
* Constructor Details
  -------------------

  + ### TileDepthTexture

    public TileDepthTexture([TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") tileset,
    int tileIndex)
* Method Details
  --------------

  + ### getTileset

    public [TilesetDepthTexture](TilesetDepthTexture.html "class in zombie.tileDepth") getTileset()
  + ### getIndex

    public int getIndex()
  + ### getColumn

    public int getColumn()
  + ### getRow

    public int getRow()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### isEmpty

    public boolean isEmpty()
  + ### getPixels

    public float[] getPixels()
  + ### setPixel

    public void setPixel(int x,
    int y,
    float pixel)
  + ### getPixel

    public float getPixel(int x,
    int y)
  + ### setMinPixel

    public void setMinPixel(int x,
    int y,
    float pixel)
  + ### setPixels

    public void setPixels(int x,
    int y,
    int w,
    int h,
    float pixel)
  + ### replacePixels

    public void replacePixels(int x,
    int y,
    int w,
    int h,
    float oldPixel,
    float newPixel)
  + ### index

    public int index(int x,
    int y)
  + ### allocPixelsIfNeeded

    void allocPixelsIfNeeded()
  + ### load

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    void load(float[] pixels,
    [BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") bufferedImage,
    int left,
    int top)

    Deprecated.
  + ### load

    void load(float[] pixels,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int stride,
    int left,
    int top)
  + ### setBufferedImage

    [BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") setBufferedImage([BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") bufferedImage,
    int left,
    int top)
  + ### clampPixelToUpperFloor

    private float clampPixelToUpperFloor(int x,
    int y,
    float pixel)
  + ### initClampedPixels

    private static void initClampedPixels()
  + ### save

    public void save()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### fileExists

    public boolean fileExists()
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### updateGPUTexture

    public void updateGPUTexture()
  + ### recalculateDepth

    void recalculateDepth()
  + ### getOrCreateFloorPolygon

    zombie.tileDepth.TileGeometryFile.Geometry getOrCreateFloorPolygon()
  + ### recalculateShadowDepth

    void recalculateShadowDepth()
  + ### reload

    public void reload()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Reset

    public void Reset()