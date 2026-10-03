[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [SmartTexture](SmartTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [commands](#commands)
   2. [result](#result)
   3. [dirty](#dirty)
   4. [hue](#hue)
   5. [tint](#tint)
   6. [masked](#masked)
   7. [dirtMask](#dirtMask)
   8. [categoryMap](#categoryMap)
   9. [bodyMask](#bodyMask)
   10. [bodyMaskTint](#bodyMaskTint)
   11. [bodyMaskHue](#bodyMaskHue)
   12. [bodyMaskParams](#bodyMaskParams)
   13. [addHole](#addHole)
   14. [addHoleParams](#addHoleParams)
   15. [removeHole](#removeHole)
   16. [removeHoleParams](#removeHoleParams)
   17. [blit](#blit)
7. [Constructor Details](#constructor-detail)
   1. [SmartTexture()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addToCat(int)](#addToCat(int))
   2. [getFirstFromCategory(int)](#getFirstFromCategory(int))
   3. [addOverlayPatches(String, String, int)](#addOverlayPatches(java.lang.String,java.lang.String,int))
   4. [addOverlay(String, String, float, int)](#addOverlay(java.lang.String,java.lang.String,float,int))
   5. [addDirtOverlay(String, String, float, int)](#addDirtOverlay(java.lang.String,java.lang.String,float,int))
   6. [addOverlay(String, SmartShader)](#addOverlay(java.lang.String,zombie.core.opengl.SmartShader))
   7. [addTintedOverlay(String, String, float, int, float, float, float)](#addTintedOverlay(java.lang.String,java.lang.String,float,int,float,float,float))
   8. [addRect(String, int, int, int, int)](#addRect(java.lang.String,int,int,int,int))
   9. [destroy()](#destroy())
   10. [addTint(String, int, float, float, float)](#addTint(java.lang.String,int,float,float,float))
   11. [addTint(Texture, int, float, float, float)](#addTint(zombie.core.textures.Texture,int,float,float,float))
   12. [addHue(String, int, float)](#addHue(java.lang.String,int,float))
   13. [addHue(Texture, int, float)](#addHue(zombie.core.textures.Texture,int,float))
   14. [addHole(BloodBodyPartType)](#addHole(zombie.characterTextures.BloodBodyPartType))
   15. [removeHole(String, BloodBodyPartType)](#removeHole(java.lang.String,zombie.characterTextures.BloodBodyPartType))
   16. [removeHole(Texture, BloodBodyPartType)](#removeHole(zombie.core.textures.Texture,zombie.characterTextures.BloodBodyPartType))
   17. [removeHole(Texture, Texture, BloodBodyPartType)](#removeHole(zombie.core.textures.Texture,zombie.core.textures.Texture,zombie.characterTextures.BloodBodyPartType))
   18. [mask(String, String, int)](#mask(java.lang.String,java.lang.String,int))
   19. [mask(Texture, Texture, int)](#mask(zombie.core.textures.Texture,zombie.core.textures.Texture,int))
   20. [maskHue(String, String, int, float)](#maskHue(java.lang.String,java.lang.String,int,float))
   21. [maskHue(Texture, Texture, int, float)](#maskHue(zombie.core.textures.Texture,zombie.core.textures.Texture,int,float))
   22. [maskTint(String, String, int, float, float, float)](#maskTint(java.lang.String,java.lang.String,int,float,float,float))
   23. [maskTint(Texture, Texture, int, float, float, float)](#maskTint(zombie.core.textures.Texture,zombie.core.textures.Texture,int,float,float,float))
   24. [addMaskedTexture(CharacterMask, String, String, int, ImmutableColor, float)](#addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,java.lang.String,int,zombie.core.ImmutableColor,float))
   25. [addMaskedTexture(CharacterMask, String, Texture, int, ImmutableColor, float)](#addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,zombie.core.textures.Texture,int,zombie.core.ImmutableColor,float))
   26. [addMaskFlags(SmartTexture, CharacterMask, String, Texture, int)](#addMaskFlags(zombie.core.textures.SmartTexture,zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,zombie.core.textures.Texture,int))
   27. [addMaskFlagsHue(SmartTexture, CharacterMask, String, Texture, int, float)](#addMaskFlagsHue(zombie.core.textures.SmartTexture,zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,zombie.core.textures.Texture,int,float))
   28. [addMaskFlagsTint(SmartTexture, CharacterMask, String, Texture, int, ImmutableColor)](#addMaskFlagsTint(zombie.core.textures.SmartTexture,zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,zombie.core.textures.Texture,int,zombie.core.ImmutableColor))
   29. [addMaskedTexture(SmartTexture, CharacterMask, String, Texture, int, ImmutableColor, float)](#addMaskedTexture(zombie.core.textures.SmartTexture,zombie.core.skinnedmodel.model.CharacterMask,java.lang.String,zombie.core.textures.Texture,int,zombie.core.ImmutableColor,float))
   30. [addTexture(String, int, ImmutableColor, float)](#addTexture(java.lang.String,int,zombie.core.ImmutableColor,float))
   31. [addTexture(SmartTexture, String, int, ImmutableColor, float)](#addTexture(zombie.core.textures.SmartTexture,java.lang.String,int,zombie.core.ImmutableColor,float))
   32. [create()](#create())
   33. [getData()](#getData())
   34. [bind()](#bind())
   35. [getID()](#getID())
   36. [calculate()](#calculate())
   37. [clear()](#clear())
   38. [add(String)](#add(java.lang.String))
   39. [add(Texture)](#add(zombie.core.textures.Texture))
   40. [add(String, SmartShader, ArrayList)](#add(java.lang.String,zombie.core.opengl.SmartShader,java.util.ArrayList))
   41. [add(Texture, SmartShader, ArrayList)](#add(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,java.util.ArrayList))
   42. [add(String, SmartShader, String, int, int)](#add(java.lang.String,zombie.core.opengl.SmartShader,java.lang.String,int,int))
   43. [add(Texture, SmartShader, Texture, int, int)](#add(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,zombie.core.textures.Texture,int,int))
   44. [add(String, SmartShader, int, int)](#add(java.lang.String,zombie.core.opengl.SmartShader,int,int))
   45. [add(Texture, SmartShader, int, int)](#add(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,int,int))
   46. [addSeparate(String, SmartShader, int, int, int, int)](#addSeparate(java.lang.String,zombie.core.opengl.SmartShader,int,int,int,int))
   47. [addSeparate(Texture, SmartShader, int, int, int, int)](#addSeparate(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,int,int,int,int))
   48. [add(String, SmartShader, String, ArrayList, int, int)](#add(java.lang.String,zombie.core.opengl.SmartShader,java.lang.String,java.util.ArrayList,int,int))
   49. [add(Texture, SmartShader, Texture, ArrayList, int, int)](#add(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,zombie.core.textures.Texture,java.util.ArrayList,int,int))
   50. [addSeparate(String, SmartShader, String, ArrayList, int, int, int, int)](#addSeparate(java.lang.String,zombie.core.opengl.SmartShader,java.lang.String,java.util.ArrayList,int,int,int,int))
   51. [addSeparate(Texture, SmartShader, Texture, ArrayList, int, int, int, int)](#addSeparate(zombie.core.textures.Texture,zombie.core.opengl.SmartShader,zombie.core.textures.Texture,java.util.ArrayList,int,int,int,int))
   52. [getTextureWithFlags(String)](#getTextureWithFlags(java.lang.String))
   53. [saveOnRenderThread(String)](#saveOnRenderThread(java.lang.String))
   54. [setDirty()](#setDirty())
   55. [isEmpty()](#isEmpty())
   56. [isFailure()](#isFailure())
   57. [isReady()](#isReady())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SmartTexture
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

[zombie.core.textures.Texture](Texture.html "class in zombie.core.textures")

zombie.core.textures.SmartTexture

All Implemented Interfaces:
:   `Serializable, zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable, ITexture`

Direct Known Subclasses:
:   `CharacterSmartTexture, ItemSmartTexture`

---

public class SmartTexture
extends [Texture](Texture.html "class in zombie.core.textures")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.core.textures.SmartTexture)

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

  `private static zombie.core.opengl.SmartShader`

  `addHole`

  `private static final ArrayList<zombie.core.textures.TextureCombinerShaderParam>`

  `addHoleParams`

  `private static zombie.core.opengl.SmartShader`

  `blit`

  `private static zombie.core.opengl.SmartShader`

  `bodyMask`

  `private static zombie.core.opengl.SmartShader`

  `bodyMaskHue`

  `private static final ArrayList<zombie.core.textures.TextureCombinerShaderParam>`

  `bodyMaskParams`

  `private static zombie.core.opengl.SmartShader`

  `bodyMaskTint`

  `private final HashMap<Integer, ArrayList<Integer>>`

  `categoryMap`

  `final ArrayList<zombie.core.textures.TextureCombinerCommand>`

  `commands`

  `private static zombie.core.opengl.SmartShader`

  `dirtMask`

  `private boolean`

  `dirty`

  `private static zombie.core.opengl.SmartShader`

  `hue`

  `private static zombie.core.opengl.SmartShader`

  `masked`

  `private static zombie.core.opengl.SmartShader`

  `removeHole`

  `private static final ArrayList<zombie.core.textures.TextureCombinerShaderParam>`

  `removeHoleParams`

  `Texture`

  `result`

  `private static zombie.core.opengl.SmartShader`

  `tint`

  ### Fields inherited from class [Texture](Texture.html#field-summary "class in zombie.core.textures")

  `ASSET_TYPE, assetParams, bindAlways, bindCount, dataid, doingQuad, flip, height, heightOrig, la, lastlastTextureID, lastTextureID, lb, lg, lr, mask, name, nullTextures, offsetX, offsetY, solid, subTexture, totalTextureID, warnFailFindTexture, width, widthOrig, xEnd, xStart, yEnd, yStart`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SmartTexture()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(String tex)`

  `void`

  `add(String tex,
  zombie.core.opengl.SmartShader shader,
  int srcBlend,
  int destBlend)`

  `void`

  `add(String tex,
  zombie.core.opengl.SmartShader shader,
  String maskTex,
  int srcBlend,
  int destBlend)`

  `void`

  `add(String tex,
  zombie.core.opengl.SmartShader shader,
  String maskTex,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params,
  int srcBlend,
  int destBlend)`

  `void`

  `add(String tex,
  zombie.core.opengl.SmartShader shader,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params)`

  `void`

  `add(Texture tex)`

  `void`

  `add(Texture tex,
  zombie.core.opengl.SmartShader shader,
  int srcBlend,
  int destBlend)`

  `void`

  `add(Texture tex,
  zombie.core.opengl.SmartShader shader,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params)`

  `void`

  `add(Texture tex,
  zombie.core.opengl.SmartShader shader,
  Texture maskTex,
  int srcBlend,
  int destBlend)`

  `void`

  `add(Texture tex,
  zombie.core.opengl.SmartShader shader,
  Texture maskTex,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params,
  int srcBlend,
  int destBlend)`

  `void`

  `addDirtOverlay(String tex,
  String mask,
  float intensity,
  int category)`

  `Texture`

  `addHole(BloodBodyPartType part)`

  `void`

  `addHue(String tex,
  int category,
  float h)`

  `void`

  `addHue(Texture tex,
  int category,
  float h)`

  `void`

  `addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  String base,
  int category,
  ImmutableColor tint,
  float hue)`

  `void`

  `addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  Texture base,
  int category,
  ImmutableColor tint,
  float hue)`

  `private static void`

  `addMaskedTexture(SmartTexture tex,
  zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  Texture base,
  int category,
  ImmutableColor tint,
  float hue)`

  `private static void`

  `addMaskFlags(SmartTexture tex,
  zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  Texture base,
  int category)`

  `private static void`

  `addMaskFlagsHue(SmartTexture tex,
  zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  Texture base,
  int category,
  float hue)`

  `private static void`

  `addMaskFlagsTint(SmartTexture tex,
  zombie.core.skinnedmodel.model.CharacterMask mask,
  String masksFolder,
  Texture base,
  int category,
  ImmutableColor tint)`

  `void`

  `addOverlay(String tex,
  String mask,
  float intensity,
  int category)`

  `void`

  `addOverlay(String tex,
  zombie.core.opengl.SmartShader shader)`

  `void`

  `addOverlayPatches(String tex,
  String mask,
  int category)`

  `void`

  `addRect(String tex,
  int x,
  int y,
  int w,
  int h)`

  `void`

  `addSeparate(String tex,
  zombie.core.opengl.SmartShader shader,
  int srcBlend,
  int destBlend,
  int srcBlendA,
  int destBlendA)`

  `void`

  `addSeparate(String tex,
  zombie.core.opengl.SmartShader shader,
  String maskTex,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params,
  int srcBlend,
  int destBlend,
  int srcBlendA,
  int destBlendA)`

  `void`

  `addSeparate(Texture tex,
  zombie.core.opengl.SmartShader shader,
  int srcBlend,
  int destBlend,
  int srcBlendA,
  int destBlendA)`

  `void`

  `addSeparate(Texture tex,
  zombie.core.opengl.SmartShader shader,
  Texture maskTex,
  ArrayList<zombie.core.textures.TextureCombinerShaderParam> params,
  int srcBlend,
  int destBlend,
  int srcBlendA,
  int destBlendA)`

  `void`

  `addTexture(String base,
  int category,
  ImmutableColor tint,
  float hue)`

  `private static void`

  `addTexture(SmartTexture tex,
  String base,
  int category,
  ImmutableColor tint,
  float hue)`

  `void`

  `addTint(String tex,
  int category,
  float r,
  float g,
  float b)`

  `void`

  `addTint(Texture tex,
  int category,
  float r,
  float g,
  float b)`

  `void`

  `addTintedOverlay(String tex,
  String mask,
  float intensity,
  int category,
  float r,
  float g,
  float b)`

  `(package private) void`

  `addToCat(int cat)`

  `void`

  `bind()`

  bind the current texture in the VRAM

  `void`

  `calculate()`

  `void`

  `clear()`

  `private void`

  `create()`

  `void`

  `destroy()`

  `zombie.core.utils.WrappedBuffer`

  `getData()`

  returns the texture's pixel in a ByteBuffer

  `zombie.core.textures.TextureCombinerCommand`

  `getFirstFromCategory(int cat)`

  `int`

  `getID()`

  returns the ID of image in the Vram

  `private static Texture`

  `getTextureWithFlags(String fileName)`

  `boolean`

  `isEmpty()`

  `boolean`

  `isFailure()`

  `boolean`

  `isReady()`

  `void`

  `mask(String tex,
  String maskTex,
  int category)`

  `void`

  `mask(Texture tex,
  Texture maskTex,
  int category)`

  `void`

  `maskHue(String tex,
  String maskTex,
  int category,
  float h)`

  `void`

  `maskHue(Texture tex,
  Texture maskTex,
  int category,
  float h)`

  `void`

  `maskTint(String tex,
  String maskTex,
  int category,
  float r,
  float g,
  float b)`

  `void`

  `maskTint(Texture tex,
  Texture maskTex,
  int category,
  float r,
  float g,
  float b)`

  `void`

  `removeHole(String bodyTex,
  BloodBodyPartType part)`

  `void`

  `removeHole(Texture bodyTex,
  BloodBodyPartType part)`

  `void`

  `removeHole(Texture bodyTex,
  Texture maskTex,
  BloodBodyPartType part)`

  `void`

  `saveOnRenderThread(String filename)`

  `protected void`

  `setDirty()`

  ### Methods inherited from class [Texture](Texture.html#method-summary "class in zombie.core.textures")

  `bind, bindNone, clearTextures, collectAllIcons, copyMaskRegion, createMask, createMask, createMask, createMask, equals, flipPixels, forgetTexture, getEngineMipmapTexture, getErrorTexture, getHeight, getHeightHW, getHeightOrig, getMask, getName, getOffsetX, getOffsetY, getRealHeight, getRealWidth, getSharedTexture, getSharedTexture, getSteamAvatar, getTexture, getTextureId, getType, getUseAlphaChannel, getUVScale, getWhite, getWidth, getWidthHW, getWidthOrig, getX, getXEnd, getXStart, getY, getYEnd, getYStart, isCollisionable, isDestroyed, isMaskSet, isSolid, isValid, loadMaskRegion, makeTransp, onBeforeReady, onTexturePacksChanged, processFilePath, reload, reloadFromFile, render, render, render, render, renderdiamond, rendershader2, renderstrip, renderwalln, renderwallnw, renderwallw, saveMask, saveMaskRegion, saveToCurrentSavefileDirectory, saveToZomboidDirectory, setAlphaForeach, setCustomizedTexture, setData, setHeight, setMask, setName, setNameOnly, setOffsetX, setOffsetY, setRealHeight, setRealWidth, setRegion, setUseAlphaChannel, setWidth, split, split, split, split2D, splitIcon, steamAvatarChanged, TexDeferedCreation, TexDeferedCreation, toString, trygetTexture`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, onBeforeEmpty, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### commands

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerCommand> commands
  + ### result

    public [Texture](Texture.html "class in zombie.core.textures") result
  + ### dirty

    private boolean dirty
  + ### hue

    private static zombie.core.opengl.SmartShader hue
  + ### tint

    private static zombie.core.opengl.SmartShader tint
  + ### masked

    private static zombie.core.opengl.SmartShader masked
  + ### dirtMask

    private static zombie.core.opengl.SmartShader dirtMask
  + ### categoryMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")>> categoryMap
  + ### bodyMask

    private static zombie.core.opengl.SmartShader bodyMask
  + ### bodyMaskTint

    private static zombie.core.opengl.SmartShader bodyMaskTint
  + ### bodyMaskHue

    private static zombie.core.opengl.SmartShader bodyMaskHue
  + ### bodyMaskParams

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> bodyMaskParams
  + ### addHole

    private static zombie.core.opengl.SmartShader addHole
  + ### addHoleParams

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> addHoleParams
  + ### removeHole

    private static zombie.core.opengl.SmartShader removeHole
  + ### removeHoleParams

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> removeHoleParams
  + ### blit

    private static zombie.core.opengl.SmartShader blit
* Constructor Details
  -------------------

  + ### SmartTexture

    public SmartTexture()
* Method Details
  --------------

  + ### addToCat

    void addToCat(int cat)
  + ### getFirstFromCategory

    public zombie.core.textures.TextureCombinerCommand getFirstFromCategory(int cat)
  + ### addOverlayPatches

    public void addOverlayPatches([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    int category)
  + ### addOverlay

    public void addOverlay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category)
  + ### addDirtOverlay

    public void addDirtOverlay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category)
  + ### addOverlay

    public void addOverlay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader)
  + ### addTintedOverlay

    public void addTintedOverlay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mask,
    float intensity,
    int category,
    float r,
    float g,
    float b)
  + ### addRect

    public void addRect([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    int x,
    int y,
    int w,
    int h)
  + ### destroy

    public void destroy()

    Specified by:
    :   `destroy` in interface `zombie.interfaces.IDestroyable`

    Overrides:
    :   `destroy` in class `Texture`
  + ### addTint

    public void addTint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    int category,
    float r,
    float g,
    float b)
  + ### addTint

    public void addTint([Texture](Texture.html "class in zombie.core.textures") tex,
    int category,
    float r,
    float g,
    float b)
  + ### addHue

    public void addHue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    int category,
    float h)
  + ### addHue

    public void addHue([Texture](Texture.html "class in zombie.core.textures") tex,
    int category,
    float h)
  + ### addHole

    public [Texture](Texture.html "class in zombie.core.textures") addHole([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### removeHole

    public void removeHole([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyTex,
    [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### removeHole

    public void removeHole([Texture](Texture.html "class in zombie.core.textures") bodyTex,
    [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### removeHole

    public void removeHole([Texture](Texture.html "class in zombie.core.textures") bodyTex,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### mask

    public void mask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    int category)
  + ### mask

    public void mask([Texture](Texture.html "class in zombie.core.textures") tex,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    int category)
  + ### maskHue

    public void maskHue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    int category,
    float h)
  + ### maskHue

    public void maskHue([Texture](Texture.html "class in zombie.core.textures") tex,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    int category,
    float h)
  + ### maskTint

    public void maskTint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    int category,
    float r,
    float g,
    float b)
  + ### maskTint

    public void maskTint([Texture](Texture.html "class in zombie.core.textures") tex,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    int category,
    float r,
    float g,
    float b)
  + ### addMaskedTexture

    public void addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint,
    float hue)
  + ### addMaskedTexture

    public void addMaskedTexture(zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [Texture](Texture.html "class in zombie.core.textures") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint,
    float hue)
  + ### addMaskFlags

    private static void addMaskFlags([SmartTexture](SmartTexture.html "class in zombie.core.textures") tex,
    zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [Texture](Texture.html "class in zombie.core.textures") base,
    int category)
  + ### addMaskFlagsHue

    private static void addMaskFlagsHue([SmartTexture](SmartTexture.html "class in zombie.core.textures") tex,
    zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [Texture](Texture.html "class in zombie.core.textures") base,
    int category,
    float hue)
  + ### addMaskFlagsTint

    private static void addMaskFlagsTint([SmartTexture](SmartTexture.html "class in zombie.core.textures") tex,
    zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [Texture](Texture.html "class in zombie.core.textures") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint)
  + ### addMaskedTexture

    private static void addMaskedTexture([SmartTexture](SmartTexture.html "class in zombie.core.textures") tex,
    zombie.core.skinnedmodel.model.CharacterMask mask,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder,
    [Texture](Texture.html "class in zombie.core.textures") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint,
    float hue)
  + ### addTexture

    public void addTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint,
    float hue)
  + ### addTexture

    private static void addTexture([SmartTexture](SmartTexture.html "class in zombie.core.textures") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") base,
    int category,
    [ImmutableColor](../ImmutableColor.html "class in zombie.core") tint,
    float hue)
  + ### create

    private void create()
  + ### getData

    public zombie.core.utils.WrappedBuffer getData()

    Description copied from class: `Texture`

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

    Overrides:
    :   `getData` in class `Texture`

    Returns:
    :   texture's pixel
  + ### bind

    public void bind()

    Description copied from interface: `ITexture`

    bind the current texture in the VRAM

    Specified by:
    :   `bind` in interface `ITexture`

    Overrides:
    :   `bind` in class `Texture`
  + ### getID

    public int getID()

    Description copied from interface: `ITexture`

    returns the ID of image in the Vram

    Specified by:
    :   `getID` in interface `ITexture`

    Overrides:
    :   `getID` in class `Texture`

    Returns:
    :   the ID of image in the Vram
  + ### calculate

    public void calculate()
  + ### clear

    public void clear()
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### add

    public void add([Texture](Texture.html "class in zombie.core.textures") tex)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params)
  + ### add

    public void add([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    int srcBlend,
    int destBlend)
  + ### add

    public void add([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    int srcBlend,
    int destBlend)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    int srcBlend,
    int destBlend)
  + ### add

    public void add([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    int srcBlend,
    int destBlend)
  + ### addSeparate

    public void addSeparate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    int srcBlend,
    int destBlend,
    int srcBlendA,
    int destBlendA)
  + ### addSeparate

    public void addSeparate([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    int srcBlend,
    int destBlend,
    int srcBlendA,
    int destBlendA)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params,
    int srcBlend,
    int destBlend)
  + ### add

    public void add([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params,
    int srcBlend,
    int destBlend)
  + ### addSeparate

    public void addSeparate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    zombie.core.opengl.SmartShader shader,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskTex,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params,
    int srcBlend,
    int destBlend,
    int srcBlendA,
    int destBlendA)
  + ### addSeparate

    public void addSeparate([Texture](Texture.html "class in zombie.core.textures") tex,
    zombie.core.opengl.SmartShader shader,
    [Texture](Texture.html "class in zombie.core.textures") maskTex,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureCombinerShaderParam> params,
    int srcBlend,
    int destBlend,
    int srcBlendA,
    int destBlendA)
  + ### getTextureWithFlags

    private static [Texture](Texture.html "class in zombie.core.textures") getTextureWithFlags([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### saveOnRenderThread

    public void saveOnRenderThread([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)

    Overrides:
    :   `saveOnRenderThread` in class `Texture`
  + ### setDirty

    protected void setDirty()
  + ### isEmpty

    public boolean isEmpty()

    Overrides:
    :   `isEmpty` in class `zombie.asset.Asset`
  + ### isFailure

    public boolean isFailure()

    Overrides:
    :   `isFailure` in class `zombie.asset.Asset`
  + ### isReady

    public boolean isReady()

    Overrides:
    :   `isReady` in class `zombie.asset.Asset`