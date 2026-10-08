[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [VideoTexture](VideoTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [successfullyLoaded](#successfullyLoaded)
   2. [failedToLoad](#failedToLoad)
   3. [useAsync](#useAsync)
   4. [videoFilename](#videoFilename)
   5. [binkId](#binkId)
7. [Constructor Details](#constructor-detail)
   1. [VideoTexture(String, int, int)](#%3Cinit%3E(java.lang.String,int,int))
   2. [VideoTexture(String, int, int, boolean)](#%3Cinit%3E(java.lang.String,int,int,boolean))
8. [Method Details](#method-detail)
   1. [getOrCreate(String, int, int, boolean)](#getOrCreate(java.lang.String,int,int,boolean))
   2. [getOrCreate(String, int, int)](#getOrCreate(java.lang.String,int,int))
   3. [closeAndDestroy()](#closeAndDestroy())
   4. [LoadVideoFile()](#LoadVideoFile())
   5. [Close()](#Close())
   6. [RenderFrameAsync()](#RenderFrameAsync())
   7. [RenderFrame()](#RenderFrame())
   8. [isValid()](#isValid())
   9. [openVideo(String)](#openVideo(java.lang.String))
   10. [isReadyForNewFrame(int)](#isReadyForNewFrame(int))
   11. [processFrame(int)](#processFrame(int))
   12. [processFrameAsync(int)](#processFrameAsync(int))
   13. [processFrameAsyncWait(int, int)](#processFrameAsyncWait(int,int))
   14. [nextFrame(int)](#nextFrame(int))
   15. [shouldSkipFrame(int)](#shouldSkipFrame(int))
   16. [isEndOfVideo(int)](#isEndOfVideo(int))
   17. [closeVideo(int)](#closeVideo(int))
   18. [getCurrentFrameData(int)](#getCurrentFrameData(int))
   19. [getFrameDataSize(int)](#getFrameDataSize(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VideoTexture
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

[zombie.core.textures.Texture](Texture.html "class in zombie.core.textures")

zombie.core.textures.VideoTexture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

---

public class VideoTexture
extends [Texture](Texture.html "class in zombie.core.textures")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.core.textures.VideoTexture)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Texture](Texture.html#nested-class-summary "class in zombie.core.textures")

  `Texture.TextureAssetParams`

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected int`

  `binkId`

  `private static final HashSet<String>`

  `failedToLoad`

  `private static final HashMap<String, VideoTexture>`

  `successfullyLoaded`

  `protected boolean`

  `useAsync`

  `protected String`

  `videoFilename`

  ### Fields inherited from class [Texture](Texture.html#field-summary "class in zombie.core.textures")

  `ASSET_TYPE, assetParams, bindAlways, bindCount, dataid, doingQuad, flip, height, heightOrig, la, lastlastTextureID, lastTextureID, lb, lg, lr, mask, name, nullTextures, offsetX, offsetY, solid, subTexture, totalTextureID, warnFailFindTexture, width, widthOrig, xEnd, xStart, yEnd, yStart`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VideoTexture(String filename,
  int width,
  int height)`

  `private`

  `VideoTexture(String filename,
  int width,
  int height,
  boolean useAsync)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Close()`

  `void`

  `closeAndDestroy()`

  `private void`

  `closeVideo(int binkVideoId)`

  `private long`

  `getCurrentFrameData(int binkVideoId)`

  `private int`

  `getFrameDataSize(int binkVideoId)`

  `static VideoTexture`

  `getOrCreate(String filename,
  int width,
  int height)`

  `static VideoTexture`

  `getOrCreate(String filename,
  int width,
  int height,
  boolean useAsync)`

  `private boolean`

  `isEndOfVideo(int binkVideoId)`

  `private boolean`

  `isReadyForNewFrame(int binkVideoId)`

  `boolean`

  `isValid()`

  `boolean`

  `LoadVideoFile()`

  `private void`

  `nextFrame(int binkVideoId)`

  `private int`

  `openVideo(String filename)`

  `private void`

  `processFrame(int binkVideoId)`

  `private void`

  `processFrameAsync(int binkVideoId)`

  `private boolean`

  `processFrameAsyncWait(int binkVideoId,
  int time)`

  `void`

  `RenderFrame()`

  `protected void`

  `RenderFrameAsync()`

  `private boolean`

  `shouldSkipFrame(int binkVideoId)`

  ### Methods inherited from class [Texture](Texture.html#method-summary "class in zombie.core.textures")

  `bind, bind, bindNone, clearTextures, collectAllIcons, copyMaskRegion, createMask, createMask, createMask, createMask, destroy, equals, flipPixels, forgetTexture, getData, getEngineMipmapTexture, getErrorTexture, getHeight, getHeightHW, getHeightOrig, getID, getMask, getName, getOffsetX, getOffsetY, getRealHeight, getRealWidth, getSharedTexture, getSharedTexture, getSteamAvatar, getTexture, getTextureId, getType, getUseAlphaChannel, getUVScale, getWhite, getWidth, getWidthHW, getWidthOrig, getX, getXEnd, getXStart, getY, getYEnd, getYStart, isCollisionable, isDestroyed, isMaskSet, isSolid, loadMaskRegion, makeTransp, onBeforeReady, onTexturePacksChanged, processFilePath, reload, reloadFromFile, render, render, render, render, renderdiamond, rendershader2, renderstrip, renderwalln, renderwallnw, renderwallw, saveMask, saveMaskRegion, saveOnRenderThread, saveToCurrentSavefileDirectory, saveToZomboidDirectory, setAlphaForeach, setCustomizedTexture, setData, setHeight, setMask, setName, setNameOnly, setOffsetX, setOffsetY, setRealHeight, setRealWidth, setRegion, setUseAlphaChannel, setWidth, split, split, split, split2D, splitIcon, steamAvatarChanged, TexDeferedCreation, TexDeferedCreation, toString, trygetTexture`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, isEmpty, isFailure, isReady, onBeforeEmpty, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### successfullyLoaded

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [VideoTexture](VideoTexture.html "class in zombie.core.textures")> successfullyLoaded
  + ### failedToLoad

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> failedToLoad
  + ### useAsync

    protected boolean useAsync
  + ### videoFilename

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") videoFilename
  + ### binkId

    protected int binkId
* Constructor Details
  -------------------

  + ### VideoTexture

    private VideoTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int width,
    int height)
  + ### VideoTexture

    private VideoTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int width,
    int height,
    boolean useAsync)
* Method Details
  --------------

  + ### getOrCreate

    public static [VideoTexture](VideoTexture.html "class in zombie.core.textures") getOrCreate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int width,
    int height,
    boolean useAsync)
  + ### getOrCreate

    public static [VideoTexture](VideoTexture.html "class in zombie.core.textures") getOrCreate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int width,
    int height)
  + ### closeAndDestroy

    public void closeAndDestroy()
  + ### LoadVideoFile

    public boolean LoadVideoFile()
  + ### Close

    public void Close()
  + ### RenderFrameAsync

    protected void RenderFrameAsync()
  + ### RenderFrame

    public void RenderFrame()
  + ### isValid

    public boolean isValid()

    Overrides:
    :   `isValid` in class `Texture`
  + ### openVideo

    private int openVideo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### isReadyForNewFrame

    private boolean isReadyForNewFrame(int binkVideoId)
  + ### processFrame

    private void processFrame(int binkVideoId)
  + ### processFrameAsync

    private void processFrameAsync(int binkVideoId)
  + ### processFrameAsyncWait

    private boolean processFrameAsyncWait(int binkVideoId,
    int time)
  + ### nextFrame

    private void nextFrame(int binkVideoId)
  + ### shouldSkipFrame

    private boolean shouldSkipFrame(int binkVideoId)
  + ### isEndOfVideo

    private boolean isEndOfVideo(int binkVideoId)
  + ### closeVideo

    private void closeVideo(int binkVideoId)
  + ### getCurrentFrameData

    private long getCurrentFrameData(int binkVideoId)
  + ### getFrameDataSize

    private int getFrameDataSize(int binkVideoId)