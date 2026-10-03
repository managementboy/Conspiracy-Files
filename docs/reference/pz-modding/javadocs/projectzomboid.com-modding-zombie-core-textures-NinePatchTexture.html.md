[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [NinePatchTexture](NinePatchTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [ASSET\_TYPE](#ASSET_TYPE)
   2. [TOP\_LEFT](#TOP_LEFT)
   3. [TOP\_MIDDLE](#TOP_MIDDLE)
   4. [TOP\_RIGHT](#TOP_RIGHT)
   5. [MIDDLE\_LEFT](#MIDDLE_LEFT)
   6. [MIDDLE\_CENTER](#MIDDLE_CENTER)
   7. [MIDDLE\_RIGHT](#MIDDLE_RIGHT)
   8. [BOTTOM\_LEFT](#BOTTOM_LEFT)
   9. [BOTTOM\_MIDDLE](#BOTTOM_MIDDLE)
   10. [BOTTOM\_RIGHT](#BOTTOM_RIGHT)
   11. [s\_sharedTextures](#s_sharedTextures)
   12. [s\_nullTextures](#s_nullTextures)
   13. [red](#red)
   14. [green](#green)
   15. [blue](#blue)
   16. [alpha](#alpha)
   17. [widths](#widths)
   18. [heights](#heights)
   19. [textureId](#textureId)
   20. [texture](#texture)
7. [Constructor Details](#constructor-detail)
   1. [NinePatchTexture(AssetPath, AssetManager)](#%3Cinit%3E(zombie.asset.AssetPath,zombie.asset.AssetManager))
8. [Method Details](#method-detail)
   1. [getSharedTexture(String)](#getSharedTexture(java.lang.String))
   2. [onTexturePacksChanged()](#onTexturePacksChanged())
   3. [Reset()](#Reset())
   4. [getType()](#getType())
   5. [unloadData()](#unloadData())
   6. [getColumnWidth(int)](#getColumnWidth(int))
   7. [getRowHeight(int)](#getRowHeight(int))
   8. [getMinWidth()](#getMinWidth())
   9. [getMinHeight()](#getMinHeight())
   10. [hasTopRow()](#hasTopRow())
   11. [hasBottomRow()](#hasBottomRow())
   12. [hasLeftColumn()](#hasLeftColumn())
   13. [hasRightColumn()](#hasRightColumn())
   14. [is9x9()](#is9x9())
   15. [is3x1()](#is3x1())
   16. [is1x3()](#is1x3())
   17. [render(float, float, float, float)](#render(float,float,float,float))
   18. [render(float, float, float, float, float, float, float, float)](#render(float,float,float,float,float,float,float,float))
   19. [renderPatch(int, int, int, int, float, float, float, float)](#renderPatch(int,int,int,int,float,float,float,float))
   20. [renderPatch(int, int, int, int, float, float, float, float, boolean, boolean)](#renderPatch(int,int,int,int,float,float,float,float,boolean,boolean))
   21. [setImageData(ImageData)](#setImageData(zombie.core.textures.ImageData))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NinePatchTexture
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

zombie.core.textures.NinePatchTexture

---

public class NinePatchTexture
extends zombie.asset.Asset

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static float`

  `alpha`

  `static final zombie.asset.AssetType`

  `ASSET_TYPE`

  `private static float`

  `blue`

  `static final int`

  `BOTTOM_LEFT`

  `static final int`

  `BOTTOM_MIDDLE`

  `static final int`

  `BOTTOM_RIGHT`

  `private static float`

  `green`

  `private final int[]`

  `heights`

  `static final int`

  `MIDDLE_CENTER`

  `static final int`

  `MIDDLE_LEFT`

  `static final int`

  `MIDDLE_RIGHT`

  `private static float`

  `red`

  `private static final HashSet<String>`

  `s_nullTextures`

  `private static final HashMap<String, NinePatchTexture>`

  `s_sharedTextures`

  `private Texture`

  `texture`

  `private zombie.core.textures.TextureID`

  `textureId`

  `static final int`

  `TOP_LEFT`

  `static final int`

  `TOP_MIDDLE`

  `static final int`

  `TOP_RIGHT`

  `private final int[]`

  `widths`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `NinePatchTexture(zombie.asset.AssetPath path,
  zombie.asset.AssetManager manager)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getColumnWidth(int column)`

  `int`

  `getMinHeight()`

  `int`

  `getMinWidth()`

  `int`

  `getRowHeight(int row)`

  `static NinePatchTexture`

  `getSharedTexture(String path)`

  `zombie.asset.AssetType`

  `getType()`

  `boolean`

  `hasBottomRow()`

  `boolean`

  `hasLeftColumn()`

  `boolean`

  `hasRightColumn()`

  `boolean`

  `hasTopRow()`

  `boolean`

  `is1x3()`

  `boolean`

  `is3x1()`

  `boolean`

  `is9x9()`

  `static void`

  `onTexturePacksChanged()`

  `void`

  `render(float x,
  float y,
  float width,
  float height)`

  `void`

  `render(float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a)`

  `private void`

  `renderPatch(int xSrc,
  int ySrc,
  int widthSrc,
  int heightSrc,
  float x,
  float y,
  float width,
  float height)`

  `private void`

  `renderPatch(int xSrc,
  int ySrc,
  int widthSrc,
  int heightSrc,
  float x,
  float y,
  float width,
  float height,
  boolean isStretchW,
  boolean isStretchH)`

  `static void`

  `Reset()`

  `void`

  `setImageData(zombie.core.textures.ImageData imageData)`

  `protected void`

  `unloadData()`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, isEmpty, isFailure, isReady, onBeforeEmpty, onBeforeReady, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ASSET\_TYPE

    public static final zombie.asset.AssetType ASSET\_TYPE
  + ### TOP\_LEFT

    public static final int TOP\_LEFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.TOP_LEFT)
  + ### TOP\_MIDDLE

    public static final int TOP\_MIDDLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.TOP_MIDDLE)
  + ### TOP\_RIGHT

    public static final int TOP\_RIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.TOP_RIGHT)
  + ### MIDDLE\_LEFT

    public static final int MIDDLE\_LEFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.MIDDLE_LEFT)
  + ### MIDDLE\_CENTER

    public static final int MIDDLE\_CENTER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.MIDDLE_CENTER)
  + ### MIDDLE\_RIGHT

    public static final int MIDDLE\_RIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.MIDDLE_RIGHT)
  + ### BOTTOM\_LEFT

    public static final int BOTTOM\_LEFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.BOTTOM_LEFT)
  + ### BOTTOM\_MIDDLE

    public static final int BOTTOM\_MIDDLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.BOTTOM_MIDDLE)
  + ### BOTTOM\_RIGHT

    public static final int BOTTOM\_RIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.textures.NinePatchTexture.BOTTOM_RIGHT)
  + ### s\_sharedTextures

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [NinePatchTexture](NinePatchTexture.html "class in zombie.core.textures")> s\_sharedTextures
  + ### s\_nullTextures

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> s\_nullTextures
  + ### red

    private static float red
  + ### green

    private static float green
  + ### blue

    private static float blue
  + ### alpha

    private static float alpha
  + ### widths

    private final int[] widths
  + ### heights

    private final int[] heights
  + ### textureId

    private zombie.core.textures.TextureID textureId
  + ### texture

    private [Texture](Texture.html "class in zombie.core.textures") texture
* Constructor Details
  -------------------

  + ### NinePatchTexture

    protected NinePatchTexture(zombie.asset.AssetPath path,
    zombie.asset.AssetManager manager)
* Method Details
  --------------

  + ### getSharedTexture

    public static [NinePatchTexture](NinePatchTexture.html "class in zombie.core.textures") getSharedTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### onTexturePacksChanged

    public static void onTexturePacksChanged()
  + ### Reset

    public static void Reset()
  + ### getType

    public zombie.asset.AssetType getType()

    Specified by:
    :   `getType` in class `zombie.asset.Asset`
  + ### unloadData

    protected void unloadData()
  + ### getColumnWidth

    public int getColumnWidth(int column)
  + ### getRowHeight

    public int getRowHeight(int row)
  + ### getMinWidth

    public int getMinWidth()
  + ### getMinHeight

    public int getMinHeight()
  + ### hasTopRow

    public boolean hasTopRow()
  + ### hasBottomRow

    public boolean hasBottomRow()
  + ### hasLeftColumn

    public boolean hasLeftColumn()
  + ### hasRightColumn

    public boolean hasRightColumn()
  + ### is9x9

    public boolean is9x9()
  + ### is3x1

    public boolean is3x1()
  + ### is1x3

    public boolean is1x3()
  + ### render

    public void render(float x,
    float y,
    float width,
    float height)
  + ### render

    public void render(float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a)
  + ### renderPatch

    private void renderPatch(int xSrc,
    int ySrc,
    int widthSrc,
    int heightSrc,
    float x,
    float y,
    float width,
    float height)
  + ### renderPatch

    private void renderPatch(int xSrc,
    int ySrc,
    int widthSrc,
    int heightSrc,
    float x,
    float y,
    float width,
    float height,
    boolean isStretchW,
    boolean isStretchH)
  + ### setImageData

    public void setImageData(zombie.core.textures.ImageData imageData)