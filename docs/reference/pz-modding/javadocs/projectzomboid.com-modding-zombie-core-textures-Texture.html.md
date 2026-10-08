[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [Texture](Texture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [pngSize](#pngSize)
   2. [nullTextures](#nullTextures)
   3. [objRen](#objRen)
   4. [ASSET\_TYPE](#ASSET_TYPE)
   5. [bindCount](#bindCount)
   6. [doingQuad](#doingQuad)
   7. [lr](#lr)
   8. [lg](#lg)
   9. [lb](#lb)
   10. [la](#la)
   11. [lastlastTextureID](#lastlastTextureID)
   12. [totalTextureID](#totalTextureID)
   13. [white](#white)
   14. [errorTexture](#errorTexture)
   15. [mipmap](#mipmap)
   16. [lastTextureID](#lastTextureID)
   17. [warnFailFindTexture](#warnFailFindTexture)
   18. [textures](#textures)
   19. [s\_sharedTextureTable](#s_sharedTextureTable)
   20. [steamAvatarMap](#steamAvatarMap)
   21. [flip](#flip)
   22. [offsetX](#offsetX)
   23. [offsetY](#offsetY)
   24. [bindAlways](#bindAlways)
   25. [xEnd](#xEnd)
   26. [yEnd](#yEnd)
   27. [xStart](#xStart)
   28. [yStart](#yStart)
   29. [dataid](#dataid)
   30. [mask](#mask)
   31. [name](#name)
   32. [solid](#solid)
   33. [width](#width)
   34. [height](#height)
   35. [heightOrig](#heightOrig)
   36. [widthOrig](#widthOrig)
   37. [realWidth](#realWidth)
   38. [realHeight](#realHeight)
   39. [destroyed](#destroyed)
   40. [splitIconTex](#splitIconTex)
   41. [splitX](#splitX)
   42. [splitY](#splitY)
   43. [splitW](#splitW)
   44. [splitH](#splitH)
   45. [subTexture](#subTexture)
   46. [assetParams](#assetParams)
7. [Constructor Details](#constructor-detail)
   1. [Texture(AssetPath, AssetManager, Texture.TextureAssetParams)](#%3Cinit%3E(zombie.asset.AssetPath,zombie.asset.AssetManager,zombie.core.textures.Texture.TextureAssetParams))
   2. [Texture(TextureID, String)](#%3Cinit%3E(zombie.core.textures.TextureID,java.lang.String))
   3. [Texture(TextureID, String, int, int, int, int)](#%3Cinit%3E(zombie.core.textures.TextureID,java.lang.String,int,int,int,int))
   4. [Texture(String)](#%3Cinit%3E(java.lang.String))
   5. [Texture(String, BufferedInputStream, boolean)](#%3Cinit%3E(java.lang.String,java.io.BufferedInputStream,boolean))
   6. [Texture(String, boolean, boolean)](#%3Cinit%3E(java.lang.String,boolean,boolean))
   7. [Texture(String, boolean)](#%3Cinit%3E(java.lang.String,boolean))
   8. [Texture(int, int, String, int)](#%3Cinit%3E(int,int,java.lang.String,int))
   9. [Texture(int, int, int)](#%3Cinit%3E(int,int,int))
   10. [Texture(int, int, int, int, int)](#%3Cinit%3E(int,int,int,int,int))
   11. [Texture(int, int, int, boolean)](#%3Cinit%3E(int,int,int,boolean))
   12. [Texture(String, int, int, int)](#%3Cinit%3E(java.lang.String,int,int,int))
   13. [Texture(Texture)](#%3Cinit%3E(zombie.core.textures.Texture))
   14. [Texture()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [TexDeferedCreation(int, int, int, int, int)](#TexDeferedCreation(int,int,int,int,int))
   2. [TexDeferedCreation(int, int, int)](#TexDeferedCreation(int,int,int))
   3. [processFilePath(String)](#processFilePath(java.lang.String))
   4. [bindNone()](#bindNone())
   5. [getWhite()](#getWhite())
   6. [getErrorTexture()](#getErrorTexture())
   7. [initEngineMipmapTextureLevel(int, int, int, int, int, int, int)](#initEngineMipmapTextureLevel(int,int,int,int,int,int,int))
   8. [getEngineMipmapTexture()](#getEngineMipmapTexture())
   9. [clearTextures()](#clearTextures())
   10. [getSharedTexture(String)](#getSharedTexture(java.lang.String))
   11. [getSharedTexture(String, int)](#getSharedTexture(java.lang.String,int))
   12. [trygetTexture(String)](#trygetTexture(java.lang.String))
   13. [onTextureFileChanged(String)](#onTextureFileChanged(java.lang.String))
   14. [onTexturePacksChanged()](#onTexturePacksChanged())
   15. [setSharedTextureInternal(String, Texture)](#setSharedTextureInternal(java.lang.String,zombie.core.textures.Texture))
   16. [getSharedTextureInternal(String, int)](#getSharedTextureInternal(java.lang.String,int))
   17. [getTexture(String)](#getTexture(java.lang.String))
   18. [getSteamAvatar(long)](#getSteamAvatar(long))
   19. [steamAvatarChanged(long)](#steamAvatarChanged(long))
   20. [forgetTexture(String)](#forgetTexture(java.lang.String))
   21. [reload(String)](#reload(java.lang.String))
   22. [flipPixels(int[], int, int)](#flipPixels(int%5B%5D,int,int))
   23. [reloadFromFile(String)](#reloadFromFile(java.lang.String))
   24. [bind()](#bind())
   25. [bind(int)](#bind(int))
   26. [copyMaskRegion(Texture, int, int, int, int)](#copyMaskRegion(zombie.core.textures.Texture,int,int,int,int))
   27. [createMask()](#createMask())
   28. [createMask(boolean[])](#createMask(boolean%5B%5D))
   29. [createMask(BooleanGrid)](#createMask(zombie.core.utils.BooleanGrid))
   30. [createMask(WrappedBuffer)](#createMask(zombie.core.utils.WrappedBuffer))
   31. [destroy()](#destroy())
   32. [equals(Texture)](#equals(zombie.core.textures.Texture))
   33. [getData()](#getData())
   34. [setData(ByteBuffer)](#setData(java.nio.ByteBuffer))
   35. [getHeight()](#getHeight())
   36. [setHeight(int)](#setHeight(int))
   37. [getHeightHW()](#getHeightHW())
   38. [getHeightOrig()](#getHeightOrig())
   39. [getID()](#getID())
   40. [getMask()](#getMask())
   41. [setMask(Mask)](#setMask(zombie.core.textures.Mask))
   42. [isMaskSet(int, int)](#isMaskSet(int,int))
   43. [getName()](#getName())
   44. [setName(String)](#setName(java.lang.String))
   45. [getTextureId()](#getTextureId())
   46. [getUseAlphaChannel()](#getUseAlphaChannel())
   47. [setUseAlphaChannel(boolean)](#setUseAlphaChannel(boolean))
   48. [getX()](#getX())
   49. [getY()](#getY())
   50. [getWidth()](#getWidth())
   51. [setWidth(int)](#setWidth(int))
   52. [getWidthHW()](#getWidthHW())
   53. [getWidthOrig()](#getWidthOrig())
   54. [getXEnd()](#getXEnd())
   55. [getXStart()](#getXStart())
   56. [getYEnd()](#getYEnd())
   57. [getYStart()](#getYStart())
   58. [getOffsetX()](#getOffsetX())
   59. [setOffsetX(int)](#setOffsetX(int))
   60. [getOffsetY()](#getOffsetY())
   61. [setOffsetY(int)](#setOffsetY(int))
   62. [isCollisionable()](#isCollisionable())
   63. [isDestroyed()](#isDestroyed())
   64. [isSolid()](#isSolid())
   65. [isValid()](#isValid())
   66. [makeTransp(int, int, int)](#makeTransp(int,int,int))
   67. [render(float, float, float, float)](#render(float,float,float,float))
   68. [render(float, float)](#render(float,float))
   69. [render(float, float, float, float, float, float, float, float, Consumer)](#render(float,float,float,float,float,float,float,float,java.util.function.Consumer))
   70. [render(ObjectRenderEffects, float, float, float, float, float, float, float, float, Consumer)](#render(zombie.iso.objects.ObjectRenderEffects,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   71. [rendershader2(float, float, float, float, int, int, int, int, float, float, float, float)](#rendershader2(float,float,float,float,int,int,int,int,float,float,float,float))
   72. [renderdiamond(float, float, float, float, int, int, int, int)](#renderdiamond(float,float,float,float,int,int,int,int))
   73. [renderwallnw(float, float, float, float, int, int, int, int, int, int)](#renderwallnw(float,float,float,float,int,int,int,int,int,int))
   74. [renderwallw(float, float, float, float, int, int, int, int)](#renderwallw(float,float,float,float,int,int,int,int))
   75. [renderwalln(float, float, float, float, int, int, int, int)](#renderwalln(float,float,float,float,int,int,int,int))
   76. [renderstrip(int, int, int, int, float, float, float, float, Consumer)](#renderstrip(int,int,int,int,float,float,float,float,java.util.function.Consumer))
   77. [setAlphaForeach(int, int, int, int)](#setAlphaForeach(int,int,int,int))
   78. [setCustomizedTexture()](#setCustomizedTexture())
   79. [setNameOnly(String)](#setNameOnly(java.lang.String))
   80. [setRegion(int, int, int, int)](#setRegion(int,int,int,int))
   81. [splitIcon()](#splitIcon())
   82. [split(int, int, int, int)](#split(int,int,int,int))
   83. [split(String, int, int, int, int)](#split(java.lang.String,int,int,int,int))
   84. [split(int, int, int, int, int, int, int, int)](#split(int,int,int,int,int,int,int,int))
   85. [split2D(int[], int[])](#split2D(int%5B%5D,int%5B%5D))
   86. [toString()](#toString())
   87. [saveMask(String)](#saveMask(java.lang.String))
   88. [saveToZomboidDirectory(String)](#saveToZomboidDirectory(java.lang.String))
   89. [saveToCurrentSavefileDirectory(String)](#saveToCurrentSavefileDirectory(java.lang.String))
   90. [saveOnRenderThread(String)](#saveOnRenderThread(java.lang.String))
   91. [loadMaskRegion(ByteBuffer)](#loadMaskRegion(java.nio.ByteBuffer))
   92. [saveMaskRegion(ByteBuffer)](#saveMaskRegion(java.nio.ByteBuffer))
   93. [getRealWidth()](#getRealWidth())
   94. [setRealWidth(int)](#setRealWidth(int))
   95. [getRealHeight()](#getRealHeight())
   96. [setRealHeight(int)](#setRealHeight(int))
   97. [getUVScale(Vector2)](#getUVScale(zombie.iso.Vector2))
   98. [syncReadSize()](#syncReadSize())
   99. [getType()](#getType())
   100. [onBeforeReady()](#onBeforeReady())
   101. [collectAllIcons(HashMap, HashMap)](#collectAllIcons(java.util.HashMap,java.util.HashMap))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Texture
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

zombie.core.textures.Texture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

Direct Known Subclasses:
:   `AngelCodeFont.CharDefTexture, SmartTexture, VideoTexture`

---

public class Texture
extends zombie.asset.Asset
implements zombie.interfaces.IDestroyable, [ITexture](../../interfaces/ITexture.html "interface in zombie.interfaces"), [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.core.textures.Texture)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `Texture.TextureAssetParams`

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final zombie.asset.AssetType`

  `ASSET_TYPE`

  `Texture.TextureAssetParams`

  `assetParams`

  `boolean`

  `bindAlways`

  `static int`

  `bindCount`

  `protected zombie.core.textures.TextureID`

  `dataid`

  `private boolean`

  `destroyed`

  `static boolean`

  `doingQuad`

  `private static Texture`

  `errorTexture`

  `boolean`

  `flip`

  `protected int`

  `height`

  `protected int`

  `heightOrig`

  `static float`

  `la`

  `static int`

  `lastlastTextureID`

  `static int`

  `lastTextureID`

  `static float`

  `lb`

  `static float`

  `lg`

  `static float`

  `lr`

  `protected zombie.core.textures.Mask`

  `mask`

  `private static Texture`

  `mipmap`

  `protected String`

  `name`

  `static final HashSet<String>`

  `nullTextures`

  `private static final ObjectRenderEffects`

  `objRen`

  `float`

  `offsetX`

  `float`

  `offsetY`

  `private static final ThreadLocal<zombie.core.textures.PNGSize>`

  `pngSize`

  `private int`

  `realHeight`

  `private int`

  `realWidth`

  `private static final HashMap<String,Texture>`

  `s_sharedTextureTable`

  `protected boolean`

  `solid`

  `private int`

  `splitH`

  `private Texture`

  `splitIconTex`

  `private int`

  `splitW`

  `private int`

  `splitX`

  `private int`

  `splitY`

  `private static final HashMap<Long,Texture>`

  `steamAvatarMap`

  `protected zombie.fileSystem.FileSystem.SubTexture`

  `subTexture`

  `private static final HashMap<String,Texture>`

  `textures`

  `static int`

  `totalTextureID`

  `static boolean`

  `warnFailFindTexture`

  `private static Texture`

  `white`

  `protected int`

  `width`

  `protected int`

  `widthOrig`

  `float`

  `xEnd`

  `float`

  `xStart`

  `float`

  `yEnd`

  `float`

  `yStart`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Texture()`

  `Texture(int width,
  int height,
  int flags)`

  `Texture(int width,
  int height,
  int flags,
  boolean deferCreation)`

  `Texture(int width,
  int height,
  int flags,
  int format,
  int internalFormat)`

  `Texture(int width,
  int height,
  String name,
  int flags)`

  `Texture(String file)`

  `Texture(String file,
  boolean useAlphaChannel)`

  `Texture(String file,
  boolean bDelete,
  boolean bUseAlpha)`

  `Texture(String file,
  int red,
  int green,
  int blue)`

  `Texture(String name,
  BufferedInputStream b,
  boolean bDoMask)`

  `Texture(zombie.asset.AssetPath path,
  zombie.asset.AssetManager manager,
  Texture.TextureAssetParams params)`

  `Texture(Texture t)`

  `Texture(zombie.core.textures.TextureID data,
  String name)`

  `Texture(zombie.core.textures.TextureID data,
  String name,
  int splitX,
  int splitY,
  int splitW,
  int splitH)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `bind()`

  bind the current texture in the VRAM

  `void`

  `bind(int unit)`

  bind the current texture object in the specified texture unit

  `static void`

  `bindNone()`

  `static void`

  `clearTextures()`

  `static void`

  `collectAllIcons(HashMap<String,String> map,
  HashMap<String,String> mapFull)`

  `void`

  `copyMaskRegion(Texture from,
  int x,
  int y,
  int width,
  int height)`

  `void`

  `createMask()`

  `void`

  `createMask(boolean[] mask)`

  `void`

  `createMask(zombie.core.utils.BooleanGrid mask)`

  `void`

  `createMask(zombie.core.utils.WrappedBuffer buf)`

  `void`

  `destroy()`

  `boolean`

  `equals(Texture other)`

  `static int[]`

  `flipPixels(int[] imgPixels,
  int imgw,
  int imgh)`

  `static void`

  `forgetTexture(String name)`

  `zombie.core.utils.WrappedBuffer`

  `getData()`

  returns the texture's pixel in a ByteBuffer

  `static Texture`

  `getEngineMipmapTexture()`

  `static Texture`

  `getErrorTexture()`

  `int`

  `getHeight()`

  returns the height of image

  `int`

  `getHeightHW()`

  return the height hardware of image

  `int`

  `getHeightOrig()`

  `int`

  `getID()`

  returns the ID of image in the Vram

  `zombie.core.textures.Mask`

  `getMask()`

  `String`

  `getName()`

  `float`

  `getOffsetX()`

  `float`

  `getOffsetY()`

  `int`

  `getRealHeight()`

  `int`

  `getRealWidth()`

  `static Texture`

  `getSharedTexture(String name)`

  `static Texture`

  `getSharedTexture(String name,
  int flags)`

  `private static Texture`

  `getSharedTextureInternal(String name,
  int flags)`

  `static Texture`

  `getSteamAvatar(long steamID)`

  `static Texture`

  `getTexture(String name)`

  `zombie.core.textures.TextureID`

  `getTextureId()`

  `zombie.asset.AssetType`

  `getType()`

  `boolean`

  `getUseAlphaChannel()`

  `Vector2`

  `getUVScale(Vector2 uvScale)`

  `static Texture`

  `getWhite()`

  `int`

  `getWidth()`

  returns the width of image

  `int`

  `getWidthHW()`

  return the width Hardware of image

  `int`

  `getWidthOrig()`

  `int`

  `getX()`

  `float`

  `getXEnd()`

  returns the end X-coordinate

  `float`

  `getXStart()`

  returns the start X-coordinate

  `int`

  `getY()`

  `float`

  `getYEnd()`

  returns the end Y-coordinate

  `float`

  `getYStart()`

  returns the start Y-coordinate

  `private static void`

  `initEngineMipmapTextureLevel(int level,
  int width,
  int height,
  int r,
  int g,
  int b,
  int a)`

  `boolean`

  `isCollisionable()`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isMaskSet(int x,
  int y)`

  `boolean`

  `isSolid()`

  indicates if the texture is solid or not.  
  a non solid texture is a texture that containe an alpha channel

  `boolean`

  `isValid()`

  `void`

  `loadMaskRegion(ByteBuffer cache)`

  `void`

  `makeTransp(int red,
  int green,
  int blue)`

  sets transparent each pixel that it's equal to the red, green blue value specified

  `void`

  `onBeforeReady()`

  `private static void`

  `onTextureFileChanged(String fileName)`

  `static void`

  `onTexturePacksChanged()`

  `static String`

  `processFilePath(String filePath)`

  `static void`

  `reload(String name)`

  `void`

  `reloadFromFile(String name)`

  `void`

  `render(float x,
  float y)`

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
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `render(ObjectRenderEffects dr,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderdiamond(float x,
  float y,
  float width,
  float height,
  int l,
  int u,
  int r,
  int d)`

  `void`

  `rendershader2(float x,
  float y,
  float width,
  float height,
  int texx,
  int texy,
  int texWidth,
  int texHeight,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderstrip(int x,
  int y,
  int width,
  int height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderwalln(float x,
  float y,
  float width,
  float height,
  int u,
  int d,
  int u2,
  int d2)`

  `void`

  `renderwallnw(float x,
  float y,
  float width,
  float height,
  int u,
  int d,
  int u2,
  int d2,
  int r,
  int r2)`

  `void`

  `renderwallw(float x,
  float y,
  float width,
  float height,
  int u,
  int d,
  int u2,
  int d2)`

  `void`

  `saveMask(String name)`

  `void`

  `saveMaskRegion(ByteBuffer cache)`

  `void`

  `saveOnRenderThread(String filename)`

  `void`

  `saveToCurrentSavefileDirectory(String filename)`

  `void`

  `saveToZomboidDirectory(String filename)`

  `void`

  `setAlphaForeach(int red,
  int green,
  int blue,
  int alpha)`

  sets the specified alpha for each pixel that it's equal to the red, green blue value specified

  `void`

  `setCustomizedTexture()`

  `void`

  `setData(ByteBuffer data)`

  sets the texture's pixel from a ByteBuffer

  `void`

  `setHeight(int height)`

  `void`

  `setMask(zombie.core.textures.Mask mask)`

  Pixel collision mask of texture

  `void`

  `setName(String name)`

  `void`

  `setNameOnly(String name)`

  `void`

  `setOffsetX(int offset)`

  `void`

  `setOffsetY(int offset)`

  `void`

  `setRealHeight(int realHeight)`

  `void`

  `setRealWidth(int realWidth)`

  `void`

  `setRegion(int x,
  int y,
  int width,
  int height)`

  sets the region of the image

  `private static void`

  `setSharedTextureInternal(String fileName,
  Texture texture)`

  `void`

  `setUseAlphaChannel(boolean value)`

  `void`

  `setWidth(int width)`

  `Texture`

  `split(int xOffset,
  int yOffset,
  int width,
  int height)`

  `Texture[]`

  `split(int xOffset,
  int yOffset,
  int row,
  int coloumn,
  int width,
  int height,
  int spaceX,
  int spaceY)`

  `Texture`

  `split(String name,
  int xOffset,
  int yOffset,
  int width,
  int height)`

  `Texture[][]`

  `split2D(int[] xstep,
  int[] ystep)`

  `Texture`

  `splitIcon()`

  `static void`

  `steamAvatarChanged(long steamID)`

  `private void`

  `syncReadSize()`

  `void`

  `TexDeferedCreation(int w,
  int h,
  int flags)`

  `void`

  `TexDeferedCreation(int w,
  int h,
  int flags,
  int format,
  int internalFormat)`

  `String`

  `toString()`

  `static Texture`

  `trygetTexture(String name)`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, isEmpty, isFailure, isReady, onBeforeEmpty, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### pngSize

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<zombie.core.textures.PNGSize> pngSize
  + ### nullTextures

    public static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> nullTextures
  + ### objRen

    private static final [ObjectRenderEffects](../../iso/objects/ObjectRenderEffects.html "class in zombie.iso.objects") objRen
  + ### ASSET\_TYPE

    public static final zombie.asset.AssetType ASSET\_TYPE
  + ### bindCount

    public static int bindCount
  + ### doingQuad

    public static boolean doingQuad
  + ### lr

    public static float lr
  + ### lg

    public static float lg
  + ### lb

    public static float lb
  + ### la

    public static float la
  + ### lastlastTextureID

    public static int lastlastTextureID
  + ### totalTextureID

    public static int totalTextureID
  + ### white

    private static [Texture](Texture.html "class in zombie.core.textures") white
  + ### errorTexture

    private static [Texture](Texture.html "class in zombie.core.textures") errorTexture
  + ### mipmap

    private static [Texture](Texture.html "class in zombie.core.textures") mipmap
  + ### lastTextureID

    public static int lastTextureID
  + ### warnFailFindTexture

    public static boolean warnFailFindTexture
  + ### textures

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Texture](Texture.html "class in zombie.core.textures")> textures
  + ### s\_sharedTextureTable

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Texture](Texture.html "class in zombie.core.textures")> s\_sharedTextureTable
  + ### steamAvatarMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"),[Texture](Texture.html "class in zombie.core.textures")> steamAvatarMap
  + ### flip

    public boolean flip
  + ### offsetX

    public float offsetX
  + ### offsetY

    public float offsetY
  + ### bindAlways

    public boolean bindAlways
  + ### xEnd

    public float xEnd
  + ### yEnd

    public float yEnd
  + ### xStart

    public float xStart
  + ### yStart

    public float yStart
  + ### dataid

    protected zombie.core.textures.TextureID dataid
  + ### mask

    protected zombie.core.textures.Mask mask
  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### solid

    protected boolean solid
  + ### width

    protected int width
  + ### height

    protected int height
  + ### heightOrig

    protected int heightOrig
  + ### widthOrig

    protected int widthOrig
  + ### realWidth

    private int realWidth
  + ### realHeight

    private int realHeight
  + ### destroyed

    private boolean destroyed
  + ### splitIconTex

    private [Texture](Texture.html "class in zombie.core.textures") splitIconTex
  + ### splitX

    private int splitX
  + ### splitY

    private int splitY
  + ### splitW

    private int splitW
  + ### splitH

    private int splitH
  + ### subTexture

    protected zombie.fileSystem.FileSystem.SubTexture subTexture
  + ### assetParams

    public [Texture.TextureAssetParams](Texture.TextureAssetParams.html "class in zombie.core.textures") assetParams
* Constructor Details
  -------------------

  + ### Texture

    public Texture(zombie.asset.AssetPath path,
    zombie.asset.AssetManager manager,
    [Texture.TextureAssetParams](Texture.TextureAssetParams.html "class in zombie.core.textures") params)
  + ### Texture

    public Texture(zombie.core.textures.TextureID data,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### Texture

    public Texture(zombie.core.textures.TextureID data,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int splitX,
    int splitY,
    int splitW,
    int splitH)
  + ### Texture

    public Texture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Texture

    public Texture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [BufferedInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedInputStream.html "class or interface in java.io") b,
    boolean bDoMask)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Texture

    public Texture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean bDelete,
    boolean bUseAlpha)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Texture

    public Texture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean useAlphaChannel)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Texture

    public Texture(int width,
    int height,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int flags)
  + ### Texture

    public Texture(int width,
    int height,
    int flags)
  + ### Texture

    public Texture(int width,
    int height,
    int flags,
    int format,
    int internalFormat)
  + ### Texture

    public Texture(int width,
    int height,
    int flags,
    boolean deferCreation)
  + ### Texture

    public Texture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int red,
    int green,
    int blue)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Texture

    public Texture([Texture](Texture.html "class in zombie.core.textures") t)
  + ### Texture

    public Texture()
* Method Details
  --------------

  + ### TexDeferedCreation

    public void TexDeferedCreation(int w,
    int h,
    int flags,
    int format,
    int internalFormat)
  + ### TexDeferedCreation

    public void TexDeferedCreation(int w,
    int h,
    int flags)
  + ### processFilePath

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") processFilePath([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filePath)
  + ### bindNone

    public static void bindNone()
  + ### getWhite

    public static [Texture](Texture.html "class in zombie.core.textures") getWhite()
  + ### getErrorTexture

    public static [Texture](Texture.html "class in zombie.core.textures") getErrorTexture()
  + ### initEngineMipmapTextureLevel

    private static void initEngineMipmapTextureLevel(int level,
    int width,
    int height,
    int r,
    int g,
    int b,
    int a)
  + ### getEngineMipmapTexture

    public static [Texture](Texture.html "class in zombie.core.textures") getEngineMipmapTexture()
  + ### clearTextures

    public static void clearTextures()
  + ### getSharedTexture

    public static [Texture](Texture.html "class in zombie.core.textures") getSharedTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSharedTexture

    public static [Texture](Texture.html "class in zombie.core.textures") getSharedTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int flags)
  + ### trygetTexture

    public static [Texture](Texture.html "class in zombie.core.textures") trygetTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### onTextureFileChanged

    private static void onTextureFileChanged([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### onTexturePacksChanged

    public static void onTexturePacksChanged()
  + ### setSharedTextureInternal

    private static void setSharedTextureInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [Texture](Texture.html "class in zombie.core.textures") texture)
  + ### getSharedTextureInternal

    private static [Texture](Texture.html "class in zombie.core.textures") getSharedTextureInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int flags)
  + ### getTexture

    public static [Texture](Texture.html "class in zombie.core.textures") getTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSteamAvatar

    public static [Texture](Texture.html "class in zombie.core.textures") getSteamAvatar(long steamID)
  + ### steamAvatarChanged

    public static void steamAvatarChanged(long steamID)
  + ### forgetTexture

    public static void forgetTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### reload

    public static void reload([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### flipPixels

    public static int[] flipPixels(int[] imgPixels,
    int imgw,
    int imgh)
  + ### reloadFromFile

    public void reloadFromFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### bind

    public void bind()

    Description copied from interface: `ITexture`

    bind the current texture in the VRAM

    Specified by:
    :   `bind` in interface `ITexture`
  + ### bind

    public void bind(int unit)

    Description copied from interface: `ITexture`

    bind the current texture object in the specified texture unit

    Specified by:
    :   `bind` in interface `ITexture`

    Parameters:
    :   `unit` - the texture unit in witch the current TextureObject will be binded
  + ### copyMaskRegion

    public void copyMaskRegion([Texture](Texture.html "class in zombie.core.textures") from,
    int x,
    int y,
    int width,
    int height)
  + ### createMask

    public void createMask()
  + ### createMask

    public void createMask(boolean[] mask)
  + ### createMask

    public void createMask(zombie.core.utils.BooleanGrid mask)
  + ### createMask

    public void createMask(zombie.core.utils.WrappedBuffer buf)
  + ### destroy

    public void destroy()

    Specified by:
    :   `destroy` in interface `zombie.interfaces.IDestroyable`
  + ### equals

    public boolean equals([Texture](Texture.html "class in zombie.core.textures") other)
  + ### getData

    public zombie.core.utils.WrappedBuffer getData()

    returns the texture's pixel in a ByteBuffer

    EXAMPLE:  
    ByteBuffer bb = getData();  
    byte r, g, b;  
    bb.rewind(); //invalid input: '<'-- IMPORTANT!!  
    try {  
    while (true) {  
    bb.mark();  
    r = bb.get();  
    g = bb.get();  
    b = bb.get();  
    bb.reset();  
    bb.put((byte)(r+red));  
    bb.put((byte)(g+green));  
    bb.put((byte)(b+blue));  
    bb.get(); // alpha  
      
    catch (Exception e) {  
      
    setData(bb);

    Specified by:
    :   `getData` in interface `ITexture`

    Returns:
    :   texture's pixel
  + ### setData

    public void setData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") data)

    sets the texture's pixel from a ByteBuffer

    EXAMPLE:  
    ByteBuffer bb = getData();  
    byte r, g, b;  
    bb.rewind(); //invalid input: '<'-- IMPORTANT!!  
    try {  
    while (true) {  
    bb.mark();  
    r = bb.get();  
    g = bb.get();  
    b = bb.get();  
    bb.reset();  
    bb.put((byte)(r+red));  
    bb.put((byte)(g+green));  
    bb.put((byte)(b+blue));  
    bb.get(); // alpha  
      
    catch (Exception e) {  
      
    setData(bb);

    Specified by:
    :   `setData` in interface `ITexture`

    Parameters:
    :   `data` - texture's pixel data
  + ### getHeight

    public int getHeight()

    Description copied from interface: `ITexture`

    returns the height of image

    Specified by:
    :   `getHeight` in interface `ITexture`

    Returns:
    :   the height of image
  + ### setHeight

    public void setHeight(int height)
  + ### getHeightHW

    public int getHeightHW()

    Description copied from interface: `ITexture`

    return the height hardware of image

    Specified by:
    :   `getHeightHW` in interface `ITexture`
  + ### getHeightOrig

    public int getHeightOrig()
  + ### getID

    public int getID()

    Description copied from interface: `ITexture`

    returns the ID of image in the Vram

    Specified by:
    :   `getID` in interface `ITexture`

    Returns:
    :   the ID of image in the Vram
  + ### getMask

    public zombie.core.textures.Mask getMask()

    Specified by:
    :   `getMask` in interface `zombie.interfaces.IMaskerable`
  + ### setMask

    public void setMask(zombie.core.textures.Mask mask)

    Description copied from interface: `ITexture`

    Pixel collision mask of texture

    Specified by:
    :   `setMask` in interface `ITexture`
  + ### isMaskSet

    public boolean isMaskSet(int x,
    int y)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getTextureId

    public zombie.core.textures.TextureID getTextureId()
  + ### getUseAlphaChannel

    public boolean getUseAlphaChannel()
  + ### setUseAlphaChannel

    public void setUseAlphaChannel(boolean value)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getWidth

    public int getWidth()

    Description copied from interface: `ITexture`

    returns the width of image

    Specified by:
    :   `getWidth` in interface `ITexture`

    Returns:
    :   the width of image
  + ### setWidth

    public void setWidth(int width)
  + ### getWidthHW

    public int getWidthHW()

    Description copied from interface: `ITexture`

    return the width Hardware of image

    Specified by:
    :   `getWidthHW` in interface `ITexture`
  + ### getWidthOrig

    public int getWidthOrig()
  + ### getXEnd

    public float getXEnd()

    Description copied from interface: `ITexture`

    returns the end X-coordinate

    Specified by:
    :   `getXEnd` in interface `ITexture`

    Returns:
    :   the end X-coordinate
  + ### getXStart

    public float getXStart()

    Description copied from interface: `ITexture`

    returns the start X-coordinate

    Specified by:
    :   `getXStart` in interface `ITexture`

    Returns:
    :   the start X-coordinate
  + ### getYEnd

    public float getYEnd()

    Description copied from interface: `ITexture`

    returns the end Y-coordinate

    Specified by:
    :   `getYEnd` in interface `ITexture`

    Returns:
    :   the end Y-coordinate
  + ### getYStart

    public float getYStart()

    Description copied from interface: `ITexture`

    returns the start Y-coordinate

    Specified by:
    :   `getYStart` in interface `ITexture`

    Returns:
    :   the start Y-coordinate
  + ### getOffsetX

    public float getOffsetX()
  + ### setOffsetX

    public void setOffsetX(int offset)
  + ### getOffsetY

    public float getOffsetY()
  + ### setOffsetY

    public void setOffsetY(int offset)
  + ### isCollisionable

    public boolean isCollisionable()
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.interfaces.IDestroyable`
  + ### isSolid

    public boolean isSolid()

    Description copied from interface: `ITexture`

    indicates if the texture is solid or not.  
    a non solid texture is a texture that containe an alpha channel

    Specified by:
    :   `isSolid` in interface `ITexture`

    Returns:
    :   if the texture is solid or not.
  + ### isValid

    public boolean isValid()
  + ### makeTransp

    public void makeTransp(int red,
    int green,
    int blue)

    Description copied from interface: `ITexture`

    sets transparent each pixel that it's equal to the red, green blue value specified

    Specified by:
    :   `makeTransp` in interface `ITexture`

    Parameters:
    :   `red` - color used in the test
    :   `green` - color used in the test
    :   `blue` - color used in the test
  + ### render

    public void render(float x,
    float y,
    float width,
    float height)
  + ### render

    public void render(float x,
    float y)
  + ### render

    public void render(float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public void render([ObjectRenderEffects](../../iso/objects/ObjectRenderEffects.html "class in zombie.iso.objects") dr,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### rendershader2

    public void rendershader2(float x,
    float y,
    float width,
    float height,
    int texx,
    int texy,
    int texWidth,
    int texHeight,
    float r,
    float g,
    float b,
    float a)
  + ### renderdiamond

    public void renderdiamond(float x,
    float y,
    float width,
    float height,
    int l,
    int u,
    int r,
    int d)
  + ### renderwallnw

    public void renderwallnw(float x,
    float y,
    float width,
    float height,
    int u,
    int d,
    int u2,
    int d2,
    int r,
    int r2)
  + ### renderwallw

    public void renderwallw(float x,
    float y,
    float width,
    float height,
    int u,
    int d,
    int u2,
    int d2)
  + ### renderwalln

    public void renderwalln(float x,
    float y,
    float width,
    float height,
    int u,
    int d,
    int u2,
    int d2)
  + ### renderstrip

    public void renderstrip(int x,
    int y,
    int width,
    int height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### setAlphaForeach

    public void setAlphaForeach(int red,
    int green,
    int blue,
    int alpha)

    Description copied from interface: `ITexture`

    sets the specified alpha for each pixel that it's equal to the red, green blue value specified

    Specified by:
    :   `setAlphaForeach` in interface `ITexture`

    Parameters:
    :   `red` - color used in the test
    :   `green` - color used in the test
    :   `blue` - color used in the test
    :   `alpha` - the alpha color that will be setted to the pixel that pass the test
  + ### setCustomizedTexture

    public void setCustomizedTexture()
  + ### setNameOnly

    public void setNameOnly([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setRegion

    public void setRegion(int x,
    int y,
    int width,
    int height)

    Description copied from interface: `ITexture`

    sets the region of the image

    Specified by:
    :   `setRegion` in interface `ITexture`

    Parameters:
    :   `x` - xstart position
    :   `y` - ystart position
    :   `width` - width of the region
    :   `height` - height of the region
  + ### splitIcon

    public [Texture](Texture.html "class in zombie.core.textures") splitIcon()
  + ### split

    public [Texture](Texture.html "class in zombie.core.textures") split(int xOffset,
    int yOffset,
    int width,
    int height)
  + ### split

    public [Texture](Texture.html "class in zombie.core.textures") split([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int xOffset,
    int yOffset,
    int width,
    int height)
  + ### split

    public [Texture](Texture.html "class in zombie.core.textures")[] split(int xOffset,
    int yOffset,
    int row,
    int coloumn,
    int width,
    int height,
    int spaceX,
    int spaceY)
  + ### split2D

    public [Texture](Texture.html "class in zombie.core.textures")[][] split2D(int[] xstep,
    int[] ystep)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### saveMask

    public void saveMask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### saveToZomboidDirectory

    public void saveToZomboidDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### saveToCurrentSavefileDirectory

    public void saveToCurrentSavefileDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### saveOnRenderThread

    public void saveOnRenderThread([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### loadMaskRegion

    public void loadMaskRegion([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") cache)
  + ### saveMaskRegion

    public void saveMaskRegion([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") cache)
  + ### getRealWidth

    public int getRealWidth()
  + ### setRealWidth

    public void setRealWidth(int realWidth)
  + ### getRealHeight

    public int getRealHeight()
  + ### setRealHeight

    public void setRealHeight(int realHeight)
  + ### getUVScale

    public [Vector2](../../iso/Vector2.html "class in zombie.iso") getUVScale([Vector2](../../iso/Vector2.html "class in zombie.iso") uvScale)
  + ### syncReadSize

    private void syncReadSize()
  + ### getType

    public zombie.asset.AssetType getType()

    Specified by:
    :   `getType` in class `zombie.asset.Asset`
  + ### onBeforeReady

    public void onBeforeReady()

    Overrides:
    :   `onBeforeReady` in class `zombie.asset.Asset`
  + ### collectAllIcons

    public static void collectAllIcons([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> map,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mapFull)