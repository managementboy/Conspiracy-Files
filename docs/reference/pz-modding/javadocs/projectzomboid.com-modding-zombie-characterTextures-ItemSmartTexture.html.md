[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characterTextures](package-summary.html)
2. [ItemSmartTexture](ItemSmartTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DecalOverlayCategory](#DecalOverlayCategory)
   2. [FluidOverlayCategory](#FluidOverlayCategory)
   3. [texName](#texName)
7. [Constructor Details](#constructor-detail)
   1. [ItemSmartTexture(String)](#%3Cinit%3E(java.lang.String))
   2. [ItemSmartTexture(String, float)](#%3Cinit%3E(java.lang.String,float))
8. [Method Details](#method-detail)
   1. [setDenimPatches(BloodBodyPartType)](#setDenimPatches(zombie.characterTextures.BloodBodyPartType))
   2. [setLeatherPatches(BloodBodyPartType)](#setLeatherPatches(zombie.characterTextures.BloodBodyPartType))
   3. [setBasicPatches(BloodBodyPartType)](#setBasicPatches(zombie.characterTextures.BloodBodyPartType))
   4. [setFluid(String, String, float, int, Color)](#setFluid(java.lang.String,java.lang.String,float,int,zombie.core.Color))
   5. [setTintMask(String, String, int, Color)](#setTintMask(java.lang.String,java.lang.String,int,zombie.core.Color))
   6. [setBlood(String, BloodBodyPartType, float)](#setBlood(java.lang.String,zombie.characterTextures.BloodBodyPartType,float))
   7. [setBlood(String, String, float, int)](#setBlood(java.lang.String,java.lang.String,float,int))
   8. [addBlood(String, BloodBodyPartType, float)](#addBlood(java.lang.String,zombie.characterTextures.BloodBodyPartType,float))
   9. [addDirt(String, BloodBodyPartType, float)](#addDirt(java.lang.String,zombie.characterTextures.BloodBodyPartType,float))
   10. [addBlood(String, String, float, int)](#addBlood(java.lang.String,java.lang.String,float,int))
   11. [addDirt(String, String, float, int)](#addDirt(java.lang.String,java.lang.String,float,int))
   12. [removeBlood()](#removeBlood())
   13. [removeDirt()](#removeDirt())
   14. [removeBlood(BloodBodyPartType)](#removeBlood(zombie.characterTextures.BloodBodyPartType))
   15. [removeDirt(BloodBodyPartType)](#removeDirt(zombie.characterTextures.BloodBodyPartType))
   16. [getTexName()](#getTexName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemSmartTexture
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

[zombie.core.textures.Texture](../core/textures/Texture.html "class in zombie.core.textures")

[zombie.core.textures.SmartTexture](../core/textures/SmartTexture.html "class in zombie.core.textures")

zombie.characterTextures.ItemSmartTexture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

---

public final class ItemSmartTexture
extends [SmartTexture](../core/textures/SmartTexture.html "class in zombie.core.textures")

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characterTextures.ItemSmartTexture)

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

  `static final int`

  `DecalOverlayCategory`

  `static final int`

  `FluidOverlayCategory`

  `private String`

  `texName`

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

  `ItemSmartTexture(String tex)`

  `ItemSmartTexture(String tex,
  float hue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `addBlood(String tex,
  String mask,
  float intensity,
  int category)`

  `float`

  `addBlood(String tex,
  BloodBodyPartType bodyPart,
  float intensity)`

  `float`

  `addDirt(String tex,
  String mask,
  float intensity,
  int category)`

  `float`

  `addDirt(String tex,
  BloodBodyPartType bodyPart,
  float intensity)`

  `String`

  `getTexName()`

  `void`

  `removeBlood()`

  `void`

  `removeBlood(BloodBodyPartType bodyPart)`

  `void`

  `removeDirt()`

  `void`

  `removeDirt(BloodBodyPartType bodyPart)`

  `void`

  `setBasicPatches(BloodBodyPartType bodyPart)`

  `void`

  `setBlood(String tex,
  String mask,
  float intensity,
  int category)`

  `void`

  `setBlood(String tex,
  BloodBodyPartType bodyPart,
  float intensity)`

  `void`

  `setDenimPatches(BloodBodyPartType bodyPart)`

  `void`

  `setFluid(String tex,
  String mask,
  float intensity,
  int category,
  Color tint)`

  `void`

  `setLeatherPatches(BloodBodyPartType bodyPart)`

  `void`

  `setTintMask(String tex,
  String mask,
  int category,
  Color tint)`

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

  + ### DecalOverlayCategory

    public static final int DecalOverlayCategory

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.ItemSmartTexture.DecalOverlayCategory)
  + ### FluidOverlayCategory

    public static final int FluidOverlayCategory

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characterTextures.ItemSmartTexture.FluidOverlayCategory)
  + ### texName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName
* Constructor Details
  -------------------

  + ### ItemSmartTexture

    public ItemSmartTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### ItemSmartTexture

    public ItemSmartTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    float hue)
* Method Details
  --------------

  + ### setDenimPatches

    public void setDenimPatches([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### setLeatherPatches

    public void setLeatherPatches([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### setBasicPatches

    public void setBasicPatches([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### setFluid

    public void setFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category,
    [Color](../core/Color.html "class in zombie.core") tint)
  + ### setTintMask

    public void setTintMask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    int category,
    [Color](../core/Color.html "class in zombie.core") tint)
  + ### setBlood

    public void setBlood([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity)
  + ### setBlood

    public void setBlood([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category)
  + ### addBlood

    public float addBlood([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity)
  + ### addDirt

    public float addDirt([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart,
    float intensity)
  + ### addBlood

    public float addBlood([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category)
  + ### addDirt

    public float addDirt([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category)
  + ### removeBlood

    public void removeBlood()
  + ### removeDirt

    public void removeDirt()
  + ### removeBlood

    public void removeBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### removeDirt

    public void removeDirt([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPart)
  + ### getTexName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTexName()