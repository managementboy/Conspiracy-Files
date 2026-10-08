[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characterTextures](package-summary.html)
2. [CharacterSmartTexture](CharacterSmartTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [BODY\_CATEGORY](#BODY_CATEGORY)
   2. [CLOTHING\_BOTTOM\_CATEGORY](#CLOTHING_BOTTOM_CATEGORY)
   3. [CLOTHING\_TOP\_CATEGORY](#CLOTHING_TOP_CATEGORY)
   4. [CLOTHING\_ITEM\_CATEGORY](#CLOTHING_ITEM_CATEGORY)
   5. [DECAL\_OVERLAY\_CATEGORY](#DECAL_OVERLAY_CATEGORY)
   6. [DIRT\_OVERLAY\_CATEGORY](#DIRT_OVERLAY_CATEGORY)
   7. [MaskFiles](#MaskFiles)
   8. [BasicPatchesMaskFiles](#BasicPatchesMaskFiles)
   9. [DenimPatchesMaskFiles](#DenimPatchesMaskFiles)
   10. [LeatherPatchesMaskFiles](#LeatherPatchesMaskFiles)
7. [Constructor Details](#constructor-detail)
   1. [CharacterSmartTexture()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setBlood(BloodBodyPartType, float)](#setBlood(zombie.characterTextures.BloodBodyPartType,float))
   2. [setDirt(BloodBodyPartType, float)](#setDirt(zombie.characterTextures.BloodBodyPartType,float))
   3. [removeBlood()](#removeBlood())
   4. [removeBlood(BloodBodyPartType)](#removeBlood(zombie.characterTextures.BloodBodyPartType))
   5. [addBlood(BloodBodyPartType, float, IsoGameCharacter)](#addBlood(zombie.characterTextures.BloodBodyPartType,float,zombie.characters.IsoGameCharacter))
   6. [addDirt(BloodBodyPartType, float, IsoGameCharacter)](#addDirt(zombie.characterTextures.BloodBodyPartType,float,zombie.characters.IsoGameCharacter))
   7. [addShirtDecal(String)](#addShirtDecal(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterSmartTexture
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

[zombie.core.textures.Texture](../core/textures/Texture.html "class in zombie.core.textures")

[zombie.core.textures.SmartTexture](../core/textures/SmartTexture.html "class in zombie.core.textures")

zombie.characterTextures.CharacterSmartTexture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

---

public final class CharacterSmartTexture
extends [SmartTexture](../core/textures/SmartTexture.html "class in zombie.core.textures")

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characterTextures.CharacterSmartTexture)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Texture](../core/textures/Texture.html#nested-class-summary "class in zombie.core.textures")

  `Texture.TextureAssetParams`

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final String[]`

  `BasicPatchesMaskFiles`

  `static final int`

  `BODY_CATEGORY`

  `static final int`

  `CLOTHING_BOTTOM_CATEGORY`

  `static final int`

  `CLOTHING_ITEM_CATEGORY`

  `static final int`

  `CLOTHING_TOP_CATEGORY`

  `static final int`

  `DECAL_OVERLAY_CATEGORY`

  `static final String[]`

  `DenimPatchesMaskFiles`

  `static final int`

  `DIRT_OVERLAY_CATEGORY`

  `static final String[]`

  `LeatherPatchesMaskFiles`

  `static final String[]`

  `MaskFiles`

  ### Fields inherited from class [SmartTexture](../core/textures/SmartTexture.html#field-summary "class in zombie.core.textures")

  `commands, result`

  ### Fields inherited from class [Texture](../core/textures/Texture.html#field-summary "class in zombie.core.textures")

  `ASSET_TYPE, assetParams, bindAlways, bindCount, dataid, doingQuad, flip, height, heightOrig, la, lastlastTextureID, lastTextureID, lb, lg, lr, mask, name, nullTextures, offsetX, offsetY, solid, subTexture, totalTextureID, warnFailFindTexture, width, widthOrig, xEnd, xStart, yEnd, yStart`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterSmartTexture()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `addBlood(BloodBodyPartType bodyPart,
  float intensity,
  IsoGameCharacter chr)`

  `float`

  `addDirt(BloodBodyPartType bodyPart,
  float intensity,
  IsoGameCharacter chr)`

  `void`

  `addShirtDecal(String dec)`

  `void`

  `removeBlood()`

  `void`

  `removeBlood(BloodBodyPartType bodyPart)`

  `void`

  `setBlood(BloodBodyPartType bodyPart,
  float intensity)`

  `void`

  `setDirt(BloodBodyPartType bodyPart,
  float intensity)`

  ### Methods inherited from class [SmartTexture](../core/textures/SmartTexture.html#method-summary "class in zombie.core.textures")

  `add, add, add, add, add, add, add, add, add, add, addDirtOverlay, addHole, addHue, addHue, addMaskedTexture, addMaskedTexture, addOverlay, addOverlay, addOverlayPatches, addRect, addSeparate, addSeparate, addSeparate, addSeparate, addTexture, addTint, addTint, addTintedOverlay, bind, calculate, clear, destroy, getData, getFirstFromCategory, getID, isEmpty, isFailure, isReady, mask, mask, maskHue, maskHue, maskTint, maskTint, removeHole, removeHole, removeHole, saveOnRenderThread, setDirty`

  ### Methods inherited from class [Texture](../core/textures/Texture.html#method-summary "class in zombie.core.textures")

  `bind, bindNone, clearTextures, collectAllIcons, copyMaskRegion, createMask, createMask, createMask, createMask, equals, flipPixels, forgetTexture, getEngineMipmapTexture, getErrorTexture, getHeight, getHeightHW, getHeightOrig, getMask, getName, getOffsetX, getOffsetY, getRealHeight, getRealWidth, getSharedTexture, getSharedTexture, getSteamAvatar, getTexture, getTextureId, getType, getUseAlphaChannel, getUVScale, getWhite, getWidth, getWidthHW, getWidthOrig, getX, getXEnd, getXStart, getY, getYEnd, getYStart, isCollisionable, isDestroyed, isMaskSet, isSolid, isValid, loadMaskRegion, makeTransp, onBeforeReady, onTexturePacksChanged, processFilePath, reload, reloadFromFile, render, render, render, render, renderdiamond, rendershader2, renderstrip, renderwalln, renderwallnw, renderwallw, saveMask, saveMaskRegion, saveToCurrentSavefileDirectory, saveToZomboidDirectory, setAlphaForeach, setCustomizedTexture, setData, setHeight, setMask, setName, setNameOnly, setOffsetX, setOffsetY, setRealHeight, setRealWidth, setRegion, setUseAlphaChannel, setWidth, split, split, split, split2D, splitIcon, steamAvatarChanged, TexDeferedCreation, TexDeferedCreation, toString, trygetTexture`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, onBeforeEmpty, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### BODY\_CATEGORY

    public static final int BODY\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.BODY_CATEGORY)
  + ### CLOTHING\_BOTTOM\_CATEGORY

    public static final int CLOTHING\_BOTTOM\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.CLOTHING_BOTTOM_CATEGORY)
  + ### CLOTHING\_TOP\_CATEGORY

    public static final int CLOTHING\_TOP\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.CLOTHING_TOP_CATEGORY)
  + ### CLOTHING\_ITEM\_CATEGORY

    public static final int CLOTHING\_ITEM\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.CLOTHING_ITEM_CATEGORY)
  + ### DECAL\_OVERLAY\_CATEGORY

    public static final int DECAL\_OVERLAY\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.DECAL_OVERLAY_CATEGORY)
  + ### DIRT\_OVERLAY\_CATEGORY

    public static final int DIRT\_OVERLAY\_CATEGORY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.CharacterSmartTexture.DIRT_OVERLAY_CATEGORY)
  + ### MaskFiles

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] MaskFiles
  + ### BasicPatchesMaskFiles

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] BasicPatchesMaskFiles
  + ### DenimPatchesMaskFiles

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] DenimPatchesMaskFiles
  + ### LeatherPatchesMaskFiles

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] LeatherPatchesMaskFiles
* Constructor Details
  -------------------

  + ### CharacterSmartTexture

    public CharacterSmartTexture()
* Method Details
  --------------

  + ### setBlood

    public void setBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity)
  + ### setDirt

    public void setDirt([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity)
  + ### removeBlood

    public void removeBlood()
  + ### removeBlood

    public void removeBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### addBlood

    public float addBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addDirt

    public float addDirt([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addShirtDecal

    public void addShirtDecal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dec)