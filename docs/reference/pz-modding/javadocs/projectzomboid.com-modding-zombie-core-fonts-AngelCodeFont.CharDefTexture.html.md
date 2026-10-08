[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.fonts](package-summary.html)
2. [AngelCodeFont](AngelCodeFont.html)
3. [CharDefTexture](AngelCodeFont.CharDefTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [CharDefTexture(TextureID, String)](#%3Cinit%3E(zombie.core.textures.TextureID,java.lang.String))
7. [Method Details](#method-detail)
   1. [releaseCharDef()](#releaseCharDef())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AngelCodeFont.CharDefTexture
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

[zombie.core.textures.Texture](../textures/Texture.html "class in zombie.core.textures")

zombie.core.fonts.AngelCodeFont.CharDefTexture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

Enclosing class:
:   `AngelCodeFont`

---

public static final class AngelCodeFont.CharDefTexture
extends [Texture](../textures/Texture.html "class in zombie.core.textures")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.core.fonts.AngelCodeFont.CharDefTexture)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Texture](../textures/Texture.html#nested-class-summary "class in zombie.core.textures")

  `Texture.TextureAssetParams`

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  ### Fields inherited from class [Texture](../textures/Texture.html#field-summary "class in zombie.core.textures")

  `ASSET_TYPE, assetParams, bindAlways, bindCount, dataid, doingQuad, flip, height, heightOrig, la, lastlastTextureID, lastTextureID, lb, lg, lr, mask, name, nullTextures, offsetX, offsetY, solid, subTexture, totalTextureID, warnFailFindTexture, width, widthOrig, xEnd, xStart, yEnd, yStart`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharDefTexture(zombie.core.textures.TextureID data,
  String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `releaseCharDef()`

  ### Methods inherited from class [Texture](../textures/Texture.html#method-summary "class in zombie.core.textures")

  `bind, bind, bindNone, clearTextures, collectAllIcons, copyMaskRegion, createMask, createMask, createMask, createMask, destroy, equals, flipPixels, forgetTexture, getData, getEngineMipmapTexture, getErrorTexture, getHeight, getHeightHW, getHeightOrig, getID, getMask, getName, getOffsetX, getOffsetY, getRealHeight, getRealWidth, getSharedTexture, getSharedTexture, getSteamAvatar, getTexture, getTextureId, getType, getUseAlphaChannel, getUVScale, getWhite, getWidth, getWidthHW, getWidthOrig, getX, getXEnd, getXStart, getY, getYEnd, getYStart, isCollisionable, isDestroyed, isMaskSet, isSolid, isValid, loadMaskRegion, makeTransp, onBeforeReady, onTexturePacksChanged, processFilePath, reload, reloadFromFile, render, render, render, render, renderdiamond, rendershader2, renderstrip, renderwalln, renderwallnw, renderwallw, saveMask, saveMaskRegion, saveOnRenderThread, saveToCurrentSavefileDirectory, saveToZomboidDirectory, setAlphaForeach, setCustomizedTexture, setData, setHeight, setMask, setName, setNameOnly, setOffsetX, setOffsetY, setRealHeight, setRealWidth, setRegion, setUseAlphaChannel, setWidth, split, split, split, split2D, splitIcon, steamAvatarChanged, TexDeferedCreation, TexDeferedCreation, toString, trygetTexture`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, isEmpty, isFailure, isReady, onBeforeEmpty, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### CharDefTexture

    public CharDefTexture(zombie.core.textures.TextureID data,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### releaseCharDef

    public void releaseCharDef()