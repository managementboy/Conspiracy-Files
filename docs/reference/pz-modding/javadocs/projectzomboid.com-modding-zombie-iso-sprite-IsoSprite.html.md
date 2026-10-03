[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.sprite](package-summary.html)
2. [IsoSprite](IsoSprite.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [maxCount](#maxCount)
   2. [alphaStep](#alphaStep)
   3. [globalOffsetX](#globalOffsetX)
   4. [globalOffsetY](#globalOffsetY)
   5. [info](#info)
   6. [AnimNameSet](#AnimNameSet)
   7. [firerequirement](#firerequirement)
   8. [burntTile](#burntTile)
   9. [forceAmbient](#forceAmbient)
   10. [solidfloor](#solidfloor)
   11. [canBeRemoved](#canBeRemoved)
   12. [attachedFloor](#attachedFloor)
   13. [cutW](#cutW)
   14. [cutN](#cutN)
   15. [solid](#solid)
   16. [solidTrans](#solidTrans)
   17. [invisible](#invisible)
   18. [alwaysDraw](#alwaysDraw)
   19. [forceRender](#forceRender)
   20. [moveWithWind](#moveWithWind)
   21. [isBush](#isBush)
   22. [RL\_DEFAULT](#RL_DEFAULT)
   23. [RL\_FLOOR](#RL_FLOOR)
   24. [renderLayer](#renderLayer)
   25. [windType](#windType)
   26. [texture](#texture)
   27. [animate](#animate)
   28. [currentAnim](#currentAnim)
   29. [deleteWhenFinished](#deleteWhenFinished)
   30. [loop](#loop)
   31. [soffX](#soffX)
   32. [soffY](#soffY)
   33. [properties](#properties)
   34. [tintMod](#tintMod)
   35. [animMap](#animMap)
   36. [animStack](#animStack)
   37. [name](#name)
   38. [tilesetName](#tilesetName)
   39. [tileSheetIndex](#tileSheetIndex)
   40. [DEFAULT\_SPRITE\_ID](#DEFAULT_SPRITE_ID)
   41. [id](#id)
   42. [def](#def)
   43. [modelSlot](#modelSlot)
   44. [parentManager](#parentManager)
   45. [tileType](#tileType)
   46. [parentObjectName](#parentObjectName)
   47. [spriteGrid](#spriteGrid)
   48. [treatAsWallOrder](#treatAsWallOrder)
   49. [spriteModel](#spriteModel)
   50. [depthTexture](#depthTexture)
   51. [depthFlags](#depthFlags)
   52. [hideForWaterRender](#hideForWaterRender)
   53. [curtainOffset](#curtainOffset)
   54. [snowSprite](#snowSprite)
   55. [fasciaEdge](#fasciaEdge)
   56. [SDF\_USE\_OBJECT\_DEPTH\_TEXTURE](#SDF_USE_OBJECT_DEPTH_TEXTURE)
   57. [SDF\_TRANSLUCENT](#SDF_TRANSLUCENT)
   58. [SDF\_OPAQUE\_PIXELS\_ONLY](#SDF_OPAQUE_PIXELS_ONLY)
   59. [seamFix2](#seamFix2)
   60. [seamEast](#seamEast)
   61. [SEAM\_SOUTH](#SEAM_SOUTH)
   62. [AND\_THEN](#AND_THEN)
   63. [initRoofProperties](#initRoofProperties)
   64. [roofProperties](#roofProperties)
7. [Constructor Details](#constructor-detail)
   1. [IsoSprite()](#%3Cinit%3E())
   2. [IsoSprite(IsoSpriteManager)](#%3Cinit%3E(zombie.iso.sprite.IsoSpriteManager))
8. [Method Details](#method-detail)
   1. [setHideForWaterRender()](#setHideForWaterRender())
   2. [CreateSprite(IsoSpriteManager)](#CreateSprite(zombie.iso.sprite.IsoSpriteManager))
   3. [CreateSpriteUsingCache(String, String, int)](#CreateSpriteUsingCache(java.lang.String,java.lang.String,int))
   4. [getSprite(IsoSpriteManager, int)](#getSprite(zombie.iso.sprite.IsoSpriteManager,int))
   5. [setSpriteID(IsoSpriteManager, int, IsoSprite)](#setSpriteID(zombie.iso.sprite.IsoSpriteManager,int,zombie.iso.sprite.IsoSprite))
   6. [getSprite(IsoSpriteManager, IsoSprite, int)](#getSprite(zombie.iso.sprite.IsoSpriteManager,zombie.iso.sprite.IsoSprite,int))
   7. [getSprite(IsoSpriteManager, String, int)](#getSprite(zombie.iso.sprite.IsoSpriteManager,java.lang.String,int))
   8. [DisposeAll()](#DisposeAll())
   9. [HasCache(String)](#HasCache(java.lang.String))
   10. [newInstance()](#newInstance())
   11. [getProperties()](#getProperties())
   12. [getProperty(IsoPropertyType)](#getProperty(zombie.core.properties.IsoPropertyType))
   13. [getProperty(String)](#getProperty(java.lang.String))
   14. [hasProperty(IsoPropertyType)](#hasProperty(zombie.core.properties.IsoPropertyType))
   15. [hasProperty(String)](#hasProperty(java.lang.String))
   16. [hasProperty(IsoFlagType)](#hasProperty(zombie.iso.SpriteDetails.IsoFlagType))
   17. [getParentObjectName()](#getParentObjectName())
   18. [setParentObjectName(String)](#setParentObjectName(java.lang.String))
   19. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   20. [load(DataInputStream)](#load(java.io.DataInputStream))
   21. [Dispose()](#Dispose())
   22. [allocateAnimationIfNeeded()](#allocateAnimationIfNeeded())
   23. [disposeAnimation()](#disposeAnimation())
   24. [isMaskClicked(IsoDirections, int, int)](#isMaskClicked(zombie.iso.IsoDirections,int,int))
   25. [isMaskClicked(IsoDirections, int, int, boolean)](#isMaskClicked(zombie.iso.IsoDirections,int,int,boolean))
   26. [getMaskClickedY(IsoDirections, int, int, boolean)](#getMaskClickedY(zombie.iso.IsoDirections,int,int,boolean))
   27. [LoadSingleTexture(String)](#LoadSingleTexture(java.lang.String))
   28. [LoadFrameExplicit(String)](#LoadFrameExplicit(java.lang.String))
   29. [LoadFrames(String, String, int)](#LoadFrames(java.lang.String,java.lang.String,int))
   30. [LoadFramesReverseAltName(String, String, String, int)](#LoadFramesReverseAltName(java.lang.String,java.lang.String,java.lang.String,int))
   31. [LoadFramesNoDirPage(String, String, int)](#LoadFramesNoDirPage(java.lang.String,java.lang.String,int))
   32. [LoadFramesNoDirPageDirect(String, String, int)](#LoadFramesNoDirPageDirect(java.lang.String,java.lang.String,int))
   33. [LoadFramesNoDirPageSimple(String)](#LoadFramesNoDirPageSimple(java.lang.String))
   34. [ReplaceCurrentAnimFrames(String)](#ReplaceCurrentAnimFrames(java.lang.String))
   35. [LoadFramesPageSimple(String, String, String, String)](#LoadFramesPageSimple(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   36. [PlayAnim(IsoAnim)](#PlayAnim(zombie.iso.sprite.IsoAnim))
   37. [PlayAnim(String)](#PlayAnim(java.lang.String))
   38. [PlayAnimUnlooped(String)](#PlayAnimUnlooped(java.lang.String))
   39. [ChangeTintMod(ColorInfo)](#ChangeTintMod(zombie.core.textures.ColorInfo))
   40. [RenderGhostTile(int, int, int)](#RenderGhostTile(int,int,int))
   41. [RenderGhostTileRed(int, int, int)](#RenderGhostTileRed(int,int,int))
   42. [RenderGhostTileColor(int, int, int, float, float, float, float)](#RenderGhostTileColor(int,int,int,float,float,float,float))
   43. [RenderGhostTileColor(int, int, int, float, float, float, float, float, float)](#RenderGhostTileColor(int,int,int,float,float,float,float,float,float))
   44. [hasActiveModel()](#hasActiveModel())
   45. [renderVehicle(IsoSpriteInstance, IsoObject, float, float, float, float, float, ColorInfo, boolean)](#renderVehicle(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,float,float,zombie.core.textures.ColorInfo,boolean))
   46. [getSpriteInstance()](#getSpriteInstance())
   47. [initSpriteInstance()](#initSpriteInstance())
   48. [render(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean)](#render(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean))
   49. [render(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#render(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   50. [renderDepth(IsoObject, IsoDirections, boolean, boolean, boolean, int, float, float, float, float, float, ColorInfo, boolean, Consumer)](#renderDepth(zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean,boolean,boolean,int,float,float,float,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   51. [render(IsoSpriteInstance, IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean)](#render(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean))
   52. [renderWallSliceW(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#renderWallSliceW(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   53. [renderWallSliceN(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#renderWallSliceN(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   54. [render(IsoSpriteInstance, IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#render(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   55. [renderDepth(IsoSpriteInstance, IsoObject, IsoDirections, boolean, boolean, boolean, int, float, float, float, float, float, ColorInfo, boolean, Consumer)](#renderDepth(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean,boolean,boolean,int,float,float,float,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   56. [renderCurrentAnim(IsoSpriteInstance, IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#renderCurrentAnim(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   57. [renderCurrentAnim\_FBORender(IsoSpriteInstance, IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#renderCurrentAnim_FBORender(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   58. [renderCurrentAnimDepth(IsoSpriteInstance, IsoObject, IsoDirections, boolean, boolean, boolean, int, float, float, float, float, float, ColorInfo, boolean, Consumer)](#renderCurrentAnimDepth(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean,boolean,boolean,int,float,float,float,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   59. [setupTileDepth(IsoObject, float, float, float, float, boolean)](#setupTileDepth(zombie.iso.IsoObject,float,float,float,float,boolean))
   60. [setupTileDepthWall(IsoObject, IsoDirections, float, float, float, boolean)](#setupTileDepthWall(zombie.iso.IsoObject,zombie.iso.IsoDirections,float,float,float,boolean))
   61. [startTileDepthShader(IsoObject, float, float, float, float, boolean)](#startTileDepthShader(zombie.iso.IsoObject,float,float,float,float,boolean))
   62. [setupTileDepthWall2(IsoDirections, int, int, float, float, float, boolean)](#setupTileDepthWall2(zombie.iso.IsoDirections,int,int,float,float,float,boolean))
   63. [startTileDepthShader2(int, int, float, float, float, float, boolean)](#startTileDepthShader2(int,int,float,float,float,float,boolean))
   64. [renderTextureWithDepth(Texture, float, float, float, float, float, float, float, float, float)](#renderTextureWithDepth(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float))
   65. [getParentSpriteDepthTextureToUse(IsoObject)](#getParentSpriteDepthTextureToUse(zombie.iso.IsoObject))
   66. [hasAnimation()](#hasAnimation())
   67. [getFrameCount()](#getFrameCount())
   68. [hasNoTextures()](#hasNoTextures())
   69. [getCurrentSpriteFrame(IsoSpriteInstance)](#getCurrentSpriteFrame(zombie.iso.sprite.IsoSpriteInstance))
   70. [prepareToRenderSprite(IsoSpriteInstance, IsoObject, float, float, float, IsoDirections, float, float, boolean, int, Vector3)](#prepareToRenderSprite(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,boolean,int,zombie.iso.Vector3))
   71. [calculateDepth(float, float, float)](#calculateDepth(float,float,float))
   72. [performRenderFrame(IsoSpriteInstance, IsoObject, IsoDirections, int, float, float, float, Consumer)](#performRenderFrame(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,zombie.iso.IsoDirections,int,float,float,float,java.util.function.Consumer))
   73. [renderSpriteOutline(float, float, Texture, float, float)](#renderSpriteOutline(float,float,zombie.core.textures.Texture,float,float))
   74. [renderActiveModel()](#renderActiveModel())
   75. [renderBloodSplat(float, float, float, ColorInfo)](#renderBloodSplat(float,float,float,zombie.core.textures.ColorInfo))
   76. [renderObjectPicker(IsoSpriteInstance, IsoObject, IsoDirections)](#renderObjectPicker(zombie.iso.sprite.IsoSpriteInstance,zombie.iso.IsoObject,zombie.iso.IsoDirections))
   77. [getAnimFrame(int)](#getAnimFrame(int))
   78. [getTextureForFrame(int, IsoDirections, boolean)](#getTextureForFrame(int,zombie.iso.IsoDirections,boolean))
   79. [getTextureForFrame(int, IsoDirections)](#getTextureForFrame(int,zombie.iso.IsoDirections))
   80. [getTextureForCurrentFrame(IsoDirections, boolean)](#getTextureForCurrentFrame(zombie.iso.IsoDirections,boolean))
   81. [getTextureForCurrentFrame(IsoDirections)](#getTextureForCurrentFrame(zombie.iso.IsoDirections))
   82. [getTextureForCurrentFrame(IsoDirections, IsoObject)](#getTextureForCurrentFrame(zombie.iso.IsoDirections,zombie.iso.IsoObject))
   83. [update()](#update())
   84. [update(IsoSpriteInstance)](#update(zombie.iso.sprite.IsoSpriteInstance))
   85. [CacheAnims(String)](#CacheAnims(java.lang.String))
   86. [LoadCache(String)](#LoadCache(java.lang.String))
   87. [setFromCache(String, String, int)](#setFromCache(java.lang.String,java.lang.String,int))
   88. [getType()](#getType())
   89. [setType(IsoObjectType)](#setType(zombie.iso.SpriteDetails.IsoObjectType))
   90. [getTileType()](#getTileType())
   91. [setTileType(IsoObjectType)](#setTileType(zombie.iso.SpriteDetails.IsoObjectType))
   92. [AddProperties(IsoSprite)](#AddProperties(zombie.iso.sprite.IsoSprite))
   93. [getItemHeight()](#getItemHeight())
   94. [getSurface()](#getSurface())
   95. [getStackReplaceTileOffset()](#getStackReplaceTileOffset())
   96. [isTable()](#isTable())
   97. [isTableTop()](#isTableTop())
   98. [isSurfaceOffset()](#isSurfaceOffset())
   99. [getSlopedSurfaceDirection()](#getSlopedSurfaceDirection())
   100. [getID()](#getID())
   101. [getName()](#getName())
   102. [setName(String)](#setName(java.lang.String))
   103. [getTintMod()](#getTintMod())
   104. [setTintMod(ColorInfo)](#setTintMod(zombie.core.textures.ColorInfo))
   105. [setAnimate(boolean)](#setAnimate(boolean))
   106. [getSpriteGrid()](#getSpriteGrid())
   107. [setSpriteGrid(IsoSpriteGrid)](#setSpriteGrid(zombie.iso.sprite.IsoSpriteGrid))
   108. [isMoveWithWind()](#isMoveWithWind())
   109. [is(IsoFlagType)](#is(zombie.iso.SpriteDetails.IsoFlagType))
   110. [isWallSE()](#isWallSE())
   111. [getSheetGridIdFromName()](#getSheetGridIdFromName())
   112. [getSheetGridIdFromName(String)](#getSheetGridIdFromName(java.lang.String))
   113. [getFacing()](#getFacing())
   114. [initRoofProperties()](#initRoofProperties())
   115. [getRoofProperties()](#getRoofProperties())
   116. [clearCurtainOffset()](#clearCurtainOffset())
   117. [setCurtainOffset(float, float, float)](#setCurtainOffset(float,float,float))
   118. [getCurtainOffset()](#getCurtainOffset())
   119. [shouldHaveCollision()](#shouldHaveCollision())
   120. [setSnowSprite(IsoSprite)](#setSnowSprite(zombie.iso.sprite.IsoSprite))
   121. [getSnowSprite()](#getSnowSprite())
   122. [setFasciaEdge(FasciaEdge)](#setFasciaEdge(zombie.core.properties.FasciaEdge))
   123. [getFasciaEdge()](#getFasciaEdge())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSprite
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.sprite.IsoSprite

---

public final class IsoSprite
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoSprite.AndThen`

  `private static class`

  `IsoSprite.l_renderCurrentAnim`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static float`

  `alphaStep`

  `boolean`

  `alwaysDraw`

  `private static final IsoSprite.AndThen`

  `AND_THEN`

  `boolean`

  `animate`

  `HashMap<String, zombie.iso.sprite.IsoAnim>`

  `animMap`

  `private static final HashMap<String,Object[]>`

  `AnimNameSet`

  `ArrayList<zombie.iso.sprite.IsoAnim>`

  `animStack`

  `boolean`

  `attachedFloor`

  `String`

  `burntTile`

  `boolean`

  `canBeRemoved`

  `zombie.iso.sprite.IsoAnim`

  `currentAnim`

  `private Vector3f`

  `curtainOffset`

  `boolean`

  `cutN`

  `boolean`

  `cutW`

  `IsoSpriteInstance`

  `def`

  `static final int`

  `DEFAULT_SPRITE_ID`

  `boolean`

  `deleteWhenFinished`

  `int`

  `depthFlags`

  `TileDepthTexture`

  `depthTexture`

  `private zombie.core.properties.FasciaEdge`

  `fasciaEdge`

  `int`

  `firerequirement`

  `boolean`

  `forceAmbient`

  `boolean`

  `forceRender`

  `static float`

  `globalOffsetX`

  `static float`

  `globalOffsetY`

  `private boolean`

  `hideForWaterRender`

  `int`

  `id`

  `private static final ColorInfo`

  `info`

  `private boolean`

  `initRoofProperties`

  `boolean`

  `invisible`

  `boolean`

  `isBush`

  `boolean`

  `loop`

  `static int`

  `maxCount`

  `zombie.core.skinnedmodel.ModelManager.ModelSlot`

  `modelSlot`

  `boolean`

  `moveWithWind`

  `String`

  `name`

  `(package private) IsoSpriteManager`

  `parentManager`

  `private String`

  `parentObjectName`

  `final PropertyContainer`

  `properties`

  `byte`

  `renderLayer`

  `static final byte`

  `RL_DEFAULT`

  `static final byte`

  `RL_FLOOR`

  `private zombie.core.properties.RoofProperties`

  `roofProperties`

  `static final int`

  `SDF_OPAQUE_PIXELS_ONLY`

  `static final int`

  `SDF_TRANSLUCENT`

  `static final int`

  `SDF_USE_OBJECT_DEPTH_TEXTURE`

  `static final boolean`

  `SEAM_SOUTH`

  `static boolean`

  `seamEast`

  `static TileSeamManager.Tiles`

  `seamFix2`

  `private IsoSprite`

  `snowSprite`

  `short`

  `soffX`

  `short`

  `soffY`

  `boolean`

  `solid`

  `boolean`

  `solidfloor`

  `boolean`

  `solidTrans`

  `private IsoSpriteGrid`

  `spriteGrid`

  `SpriteModel`

  `spriteModel`

  `Texture`

  `texture`

  `String`

  `tilesetName`

  `int`

  `tileSheetIndex`

  `private IsoObjectType`

  `tileType`

  `final ColorInfo`

  `tintMod`

  `boolean`

  `treatAsWallOrder`

  `int`

  `windType`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSprite()`

  `IsoSprite(IsoSpriteManager manager)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddProperties(IsoSprite sprite)`

  `private void`

  `allocateAnimationIfNeeded()`

  `void`

  `CacheAnims(String key)`

  `static float`

  `calculateDepth(float x,
  float y,
  float z)`

  `void`

  `ChangeTintMod(ColorInfo newTintMod)`

  `void`

  `clearCurtainOffset()`

  `static IsoSprite`

  `CreateSprite(IsoSpriteManager manager)`

  `static IsoSprite`

  `CreateSpriteUsingCache(String objectName,
  String animName,
  int numFrames)`

  `void`

  `Dispose()`

  `static void`

  `DisposeAll()`

  `void`

  `disposeAnimation()`

  `zombie.iso.sprite.IsoDirectionFrame`

  `getAnimFrame(int frame)`

  `private float`

  `getCurrentSpriteFrame(IsoSpriteInstance inst)`

  `Vector3f`

  `getCurtainOffset()`

  `IsoDirections`

  `getFacing()`

  `zombie.core.properties.FasciaEdge`

  `getFasciaEdge()`

  `int`

  `getFrameCount()`

  `int`

  `getID()`

  `int`

  `getItemHeight()`

  `float`

  `getMaskClickedY(IsoDirections dir,
  int x,
  int y,
  boolean flip)`

  `String`

  `getName()`

  `String`

  `getParentObjectName()`

  `private TileDepthTexture`

  `getParentSpriteDepthTextureToUse(IsoObject obj)`

  `PropertyContainer`

  `getProperties()`

  `String`

  `getProperty(String name)`

  `String`

  `getProperty(IsoPropertyType propertyType)`

  `zombie.core.properties.RoofProperties`

  `getRoofProperties()`

  `int`

  `getSheetGridIdFromName()`

  `static int`

  `getSheetGridIdFromName(String name)`

  `IsoDirections`

  `getSlopedSurfaceDirection()`

  `IsoSprite`

  `getSnowSprite()`

  `static IsoSprite`

  `getSprite(IsoSpriteManager manager,
  int id)`

  `static IsoSprite`

  `getSprite(IsoSpriteManager manager,
  String name,
  int offset)`

  `static IsoSprite`

  `getSprite(IsoSpriteManager manager,
  IsoSprite spr,
  int offset)`

  `IsoSpriteGrid`

  `getSpriteGrid()`

  `private IsoSpriteInstance`

  `getSpriteInstance()`

  `int`

  `getStackReplaceTileOffset()`

  `int`

  `getSurface()`

  `Texture`

  `getTextureForCurrentFrame(IsoDirections dir)`

  `Texture`

  `getTextureForCurrentFrame(IsoDirections dir,
  boolean useSnowSprite)`

  `Texture`

  `getTextureForCurrentFrame(IsoDirections dir,
  IsoObject obj)`

  `Texture`

  `getTextureForFrame(int frame,
  IsoDirections dir)`

  `Texture`

  `getTextureForFrame(int frame,
  IsoDirections dir,
  boolean useSnowSprite)`

  `IsoObjectType`

  `getTileType()`

  `ColorInfo`

  `getTintMod()`

  `IsoObjectType`

  `getType()`

  `boolean`

  `hasActiveModel()`

  `boolean`

  `hasAnimation()`

  `static boolean`

  `HasCache(String string)`

  `boolean`

  `hasNoTextures()`

  `boolean`

  `hasProperty(String propertyName)`

  `boolean`

  `hasProperty(IsoPropertyType propertyType)`

  `boolean`

  `hasProperty(IsoFlagType flag)`

  `private void`

  `initRoofProperties()`

  `private void`

  `initSpriteInstance()`

  `boolean`

  `is(IsoFlagType flag)`

  `boolean`

  `isMaskClicked(IsoDirections dir,
  int x,
  int y)`

  `boolean`

  `isMaskClicked(IsoDirections dir,
  int x,
  int y,
  boolean flip)`

  `boolean`

  `isMoveWithWind()`

  `boolean`

  `isSurfaceOffset()`

  `boolean`

  `isTable()`

  `boolean`

  `isTableTop()`

  `boolean`

  `isWallSE()`

  `void`

  `load(DataInputStream input)`

  `void`

  `LoadCache(String string)`

  `Texture`

  `LoadFrameExplicit(String objectName)`

  `void`

  `LoadFrames(String objectName,
  String animName,
  int nFrames)`

  `void`

  `LoadFramesNoDirPage(String objectName,
  String animName,
  int nFrames)`

  `void`

  `LoadFramesNoDirPageDirect(String objectName,
  String animName,
  int nFrames)`

  `void`

  `LoadFramesNoDirPageSimple(String objectName)`

  `void`

  `LoadFramesPageSimple(String nObjectName,
  String sObjectName,
  String eObjectName,
  String wObjectName)`

  `void`

  `LoadFramesReverseAltName(String objectName,
  String animName,
  String altName,
  int nFrames)`

  `Texture`

  `LoadSingleTexture(String textureName)`

  `IsoSpriteInstance`

  `newInstance()`

  `private void`

  `performRenderFrame(IsoSpriteInstance inst,
  IsoObject obj,
  IsoDirections dir,
  int frame,
  float tx,
  float ty,
  float tdepth,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `PlayAnim(String name)`

  `void`

  `PlayAnim(zombie.iso.sprite.IsoAnim anim)`

  `void`

  `PlayAnimUnlooped(String name)`

  `private void`

  `prepareToRenderSprite(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  boolean bDoRenderPrep,
  int frame,
  Vector3 spritePos)`

  `final void`

  `render(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep)`

  `final void`

  `render(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `final void`

  `render(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep)`

  `void`

  `render(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderActiveModel()`

  `void`

  `renderBloodSplat(float x,
  float y,
  float z,
  ColorInfo info2)`

  `void`

  `renderCurrentAnim(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo col,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `private void`

  `renderCurrentAnim_FBORender(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo col,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderCurrentAnimDepth(IsoSpriteInstance inst,
  IsoObject obj,
  IsoDirections dir,
  boolean cutawayNW,
  boolean cutawayNE,
  boolean cutawaySW,
  int cutawaySEX,
  float x,
  float y,
  float z,
  float offsetX,
  float offsetY,
  ColorInfo col,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `final void`

  `renderDepth(IsoObject obj,
  IsoDirections isoDirections,
  boolean cutawayNW,
  boolean cutawayNE,
  boolean cutawaySW,
  int cutawaySEX,
  float x,
  float y,
  float z,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderDepth(IsoSpriteInstance inst,
  IsoObject obj,
  IsoDirections isoDirections,
  boolean cutawayNW,
  boolean cutawayNE,
  boolean cutawaySW,
  int cutawaySEX,
  float x,
  float y,
  float z,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `RenderGhostTile(int x,
  int y,
  int z)`

  `void`

  `RenderGhostTileColor(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `RenderGhostTileColor(int x,
  int y,
  int z,
  float offsetX,
  float offsetY,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `RenderGhostTileRed(int x,
  int y,
  int z)`

  `void`

  `renderObjectPicker(IsoSpriteInstance def,
  IsoObject obj,
  IsoDirections dir)`

  `private void`

  `renderSpriteOutline(float tx,
  float ty,
  Texture tex,
  float scaleX,
  float scaleY)`

  `static void`

  `renderTextureWithDepth(Texture texture,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  float x,
  float y,
  float z)`

  `void`

  `renderVehicle(IsoSpriteInstance inst,
  IsoObject obj,
  float x,
  float y,
  float z,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep)`

  `void`

  `renderWallSliceN(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderWallSliceW(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `ReplaceCurrentAnimFrames(String objectName)`

  `void`

  `save(DataOutputStream output)`

  `void`

  `setAnimate(boolean animate)`

  `void`

  `setCurtainOffset(float x,
  float y,
  float z)`

  `void`

  `setFasciaEdge(zombie.core.properties.FasciaEdge fasciaEdge)`

  `IsoSprite`

  `setFromCache(String objectName,
  String animName,
  int numFrames)`

  `void`

  `setHideForWaterRender()`

  `void`

  `setName(String string)`

  `void`

  `setParentObjectName(String val)`

  `void`

  `setSnowSprite(IsoSprite sprite)`

  `void`

  `setSpriteGrid(IsoSpriteGrid sGrid)`

  `static void`

  `setSpriteID(IsoSpriteManager manager,
  int id,
  IsoSprite spr)`

  `void`

  `setTileType(IsoObjectType type)`

  `void`

  `setTintMod(ColorInfo info)`

  `void`

  `setType(IsoObjectType type)`

  `private boolean`

  `setupTileDepth(IsoObject obj,
  float x,
  float y,
  float z,
  float z2,
  boolean drawPixels)`

  `private boolean`

  `setupTileDepthWall(IsoObject obj,
  IsoDirections isoDirections,
  float x,
  float y,
  float z,
  boolean drawPixels)`

  `private boolean`

  `setupTileDepthWall2(IsoDirections isoDirections,
  int objX,
  int objY,
  float x,
  float y,
  float z,
  boolean drawPixels)`

  `boolean`

  `shouldHaveCollision()`

  `private void`

  `startTileDepthShader(IsoObject obj,
  float x,
  float y,
  float z,
  float z2,
  boolean drawPixels)`

  `private void`

  `startTileDepthShader2(int objX,
  int objY,
  float x,
  float y,
  float z,
  float z2,
  boolean drawPixels)`

  `void`

  `update()`

  `void`

  `update(IsoSpriteInstance def)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### maxCount

    public static int maxCount
  + ### alphaStep

    public static float alphaStep
  + ### globalOffsetX

    public static float globalOffsetX
  + ### globalOffsetY

    public static float globalOffsetY
  + ### info

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info
  + ### AnimNameSet

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[]> AnimNameSet
  + ### firerequirement

    public int firerequirement
  + ### burntTile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") burntTile
  + ### forceAmbient

    public boolean forceAmbient
  + ### solidfloor

    public boolean solidfloor
  + ### canBeRemoved

    public boolean canBeRemoved
  + ### attachedFloor

    public boolean attachedFloor
  + ### cutW

    public boolean cutW
  + ### cutN

    public boolean cutN
  + ### solid

    public boolean solid
  + ### solidTrans

    public boolean solidTrans
  + ### invisible

    public boolean invisible
  + ### alwaysDraw

    public boolean alwaysDraw
  + ### forceRender

    public boolean forceRender
  + ### moveWithWind

    public boolean moveWithWind
  + ### isBush

    public boolean isBush
  + ### RL\_DEFAULT

    public static final byte RL\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.RL_DEFAULT)
  + ### RL\_FLOOR

    public static final byte RL\_FLOOR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.RL_FLOOR)
  + ### renderLayer

    public byte renderLayer
  + ### windType

    public int windType
  + ### texture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### animate

    public boolean animate
  + ### currentAnim

    public zombie.iso.sprite.IsoAnim currentAnim
  + ### deleteWhenFinished

    public boolean deleteWhenFinished
  + ### loop

    public boolean loop
  + ### soffX

    public short soffX
  + ### soffY

    public short soffY
  + ### properties

    public final [PropertyContainer](../../core/properties/PropertyContainer.html "class in zombie.core.properties") properties
  + ### tintMod

    public final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") tintMod
  + ### animMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.iso.sprite.IsoAnim> animMap
  + ### animStack

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.sprite.IsoAnim> animStack
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### tilesetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName
  + ### tileSheetIndex

    public int tileSheetIndex
  + ### DEFAULT\_SPRITE\_ID

    public static final int DEFAULT\_SPRITE\_ID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.DEFAULT_SPRITE_ID)
  + ### id

    public int id
  + ### def

    public [IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") def
  + ### modelSlot

    public zombie.core.skinnedmodel.ModelManager.ModelSlot modelSlot
  + ### parentManager

    [IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") parentManager
  + ### tileType

    private [IsoObjectType](../SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") tileType
  + ### parentObjectName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parentObjectName
  + ### spriteGrid

    private [IsoSpriteGrid](IsoSpriteGrid.html "class in zombie.iso.sprite") spriteGrid
  + ### treatAsWallOrder

    public boolean treatAsWallOrder
  + ### spriteModel

    public [SpriteModel](../SpriteModel.html "class in zombie.iso") spriteModel
  + ### depthTexture

    public [TileDepthTexture](../../tileDepth/TileDepthTexture.html "class in zombie.tileDepth") depthTexture
  + ### depthFlags

    public int depthFlags
  + ### hideForWaterRender

    private boolean hideForWaterRender
  + ### curtainOffset

    private [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") curtainOffset
  + ### snowSprite

    private [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") snowSprite
  + ### fasciaEdge

    private zombie.core.properties.FasciaEdge fasciaEdge
  + ### SDF\_USE\_OBJECT\_DEPTH\_TEXTURE

    public static final int SDF\_USE\_OBJECT\_DEPTH\_TEXTURE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.SDF_USE_OBJECT_DEPTH_TEXTURE)
  + ### SDF\_TRANSLUCENT

    public static final int SDF\_TRANSLUCENT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.SDF_TRANSLUCENT)
  + ### SDF\_OPAQUE\_PIXELS\_ONLY

    public static final int SDF\_OPAQUE\_PIXELS\_ONLY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.SDF_OPAQUE_PIXELS_ONLY)
  + ### seamFix2

    public static [TileSeamManager.Tiles](../../tileDepth/TileSeamManager.Tiles.html "enum class in zombie.tileDepth") seamFix2
  + ### seamEast

    public static boolean seamEast
  + ### SEAM\_SOUTH

    public static final boolean SEAM\_SOUTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.sprite.IsoSprite.SEAM_SOUTH)
  + ### AND\_THEN

    private static final [IsoSprite.AndThen](IsoSprite.AndThen.html "class in zombie.iso.sprite") AND\_THEN
  + ### initRoofProperties

    private boolean initRoofProperties
  + ### roofProperties

    private zombie.core.properties.RoofProperties roofProperties
* Constructor Details
  -------------------

  + ### IsoSprite

    public IsoSprite()
  + ### IsoSprite

    public IsoSprite([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager)
* Method Details
  --------------

  + ### setHideForWaterRender

    public void setHideForWaterRender()
  + ### CreateSprite

    public static [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") CreateSprite([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager)
  + ### CreateSpriteUsingCache

    public static [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") CreateSpriteUsingCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int numFrames)
  + ### getSprite

    public static [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager,
    int id)
  + ### setSpriteID

    public static void setSpriteID([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager,
    int id,
    [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") spr)
  + ### getSprite

    public static [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager,
    [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") spr,
    int offset)
  + ### getSprite

    public static [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite([IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") manager,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int offset)
  + ### DisposeAll

    public static void DisposeAll()
  + ### HasCache

    public static boolean HasCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### newInstance

    public [IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") newInstance()
  + ### getProperties

    public [PropertyContainer](../../core/properties/PropertyContainer.html "class in zombie.core.properties") getProperties()
  + ### getProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProperty([IsoPropertyType](../../core/properties/IsoPropertyType.html "enum class in zombie.core.properties") propertyType)
  + ### getProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### hasProperty

    public boolean hasProperty([IsoPropertyType](../../core/properties/IsoPropertyType.html "enum class in zombie.core.properties") propertyType)
  + ### hasProperty

    public boolean hasProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propertyName)
  + ### hasProperty

    public boolean hasProperty([IsoFlagType](../SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### getParentObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getParentObjectName()
  + ### setParentObjectName

    public void setParentObjectName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Dispose

    public void Dispose()
  + ### allocateAnimationIfNeeded

    private void allocateAnimationIfNeeded()
  + ### disposeAnimation

    public void disposeAnimation()
  + ### isMaskClicked

    public boolean isMaskClicked([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    int x,
    int y)
  + ### isMaskClicked

    public boolean isMaskClicked([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    int x,
    int y,
    boolean flip)
  + ### getMaskClickedY

    public float getMaskClickedY([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    int x,
    int y,
    boolean flip)
  + ### LoadSingleTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") LoadSingleTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### LoadFrameExplicit

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") LoadFrameExplicit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName)
  + ### LoadFrames

    public void LoadFrames([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int nFrames)
  + ### LoadFramesReverseAltName

    public void LoadFramesReverseAltName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") altName,
    int nFrames)
  + ### LoadFramesNoDirPage

    public void LoadFramesNoDirPage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int nFrames)
  + ### LoadFramesNoDirPageDirect

    public void LoadFramesNoDirPageDirect([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int nFrames)
  + ### LoadFramesNoDirPageSimple

    public void LoadFramesNoDirPageSimple([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName)
  + ### ReplaceCurrentAnimFrames

    public void ReplaceCurrentAnimFrames([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName)
  + ### LoadFramesPageSimple

    public void LoadFramesPageSimple([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nObjectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sObjectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eObjectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wObjectName)
  + ### PlayAnim

    public void PlayAnim(zombie.iso.sprite.IsoAnim anim)
  + ### PlayAnim

    public void PlayAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### PlayAnimUnlooped

    public void PlayAnimUnlooped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### ChangeTintMod

    public void ChangeTintMod([ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") newTintMod)
  + ### RenderGhostTile

    public void RenderGhostTile(int x,
    int y,
    int z)
  + ### RenderGhostTileRed

    public void RenderGhostTileRed(int x,
    int y,
    int z)
  + ### RenderGhostTileColor

    public void RenderGhostTileColor(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    float a)
  + ### RenderGhostTileColor

    public void RenderGhostTileColor(int x,
    int y,
    int z,
    float offsetX,
    float offsetY,
    float r,
    float g,
    float b,
    float a)
  + ### hasActiveModel

    public boolean hasActiveModel()
  + ### renderVehicle

    public void renderVehicle([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep)
  + ### getSpriteInstance

    private [IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") getSpriteInstance()
  + ### initSpriteInstance

    private void initSpriteInstance()
  + ### render

    public final void render([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep)
  + ### render

    public final void render([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderDepth

    public final void renderDepth([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") isoDirections,
    boolean cutawayNW,
    boolean cutawayNE,
    boolean cutawaySW,
    int cutawaySEX,
    float x,
    float y,
    float z,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public final void render([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep)
  + ### renderWallSliceW

    public void renderWallSliceW([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderWallSliceN

    public void renderWallSliceN([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public void render([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderDepth

    public void renderDepth([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") isoDirections,
    boolean cutawayNW,
    boolean cutawayNE,
    boolean cutawaySW,
    int cutawaySEX,
    float x,
    float y,
    float z,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderCurrentAnim

    public void renderCurrentAnim([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderCurrentAnim\_FBORender

    private void renderCurrentAnim\_FBORender([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderCurrentAnimDepth

    public void renderCurrentAnimDepth([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    boolean cutawayNW,
    boolean cutawayNE,
    boolean cutawaySW,
    int cutawaySEX,
    float x,
    float y,
    float z,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### setupTileDepth

    private boolean setupTileDepth([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    float z2,
    boolean drawPixels)
  + ### setupTileDepthWall

    private boolean setupTileDepthWall([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") isoDirections,
    float x,
    float y,
    float z,
    boolean drawPixels)
  + ### startTileDepthShader

    private void startTileDepthShader([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    float z2,
    boolean drawPixels)
  + ### setupTileDepthWall2

    private boolean setupTileDepthWall2([IsoDirections](../IsoDirections.html "enum class in zombie.iso") isoDirections,
    int objX,
    int objY,
    float x,
    float y,
    float z,
    boolean drawPixels)
  + ### startTileDepthShader2

    private void startTileDepthShader2(int objX,
    int objY,
    float x,
    float y,
    float z,
    float z2,
    boolean drawPixels)
  + ### renderTextureWithDepth

    public static void renderTextureWithDepth([Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    float x,
    float y,
    float z)
  + ### getParentSpriteDepthTextureToUse

    private [TileDepthTexture](../../tileDepth/TileDepthTexture.html "class in zombie.tileDepth") getParentSpriteDepthTextureToUse([IsoObject](../IsoObject.html "class in zombie.iso") obj)
  + ### hasAnimation

    public boolean hasAnimation()
  + ### getFrameCount

    public int getFrameCount()
  + ### hasNoTextures

    public boolean hasNoTextures()
  + ### getCurrentSpriteFrame

    private float getCurrentSpriteFrame([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst)
  + ### prepareToRenderSprite

    private void prepareToRenderSprite([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    boolean bDoRenderPrep,
    int frame,
    [Vector3](../Vector3.html "class in zombie.iso") spritePos)
  + ### calculateDepth

    public static float calculateDepth(float x,
    float y,
    float z)
  + ### performRenderFrame

    private void performRenderFrame([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") inst,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    int frame,
    float tx,
    float ty,
    float tdepth,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderSpriteOutline

    private void renderSpriteOutline(float tx,
    float ty,
    [Texture](../../core/textures/Texture.html "class in zombie.core.textures") tex,
    float scaleX,
    float scaleY)
  + ### renderActiveModel

    public void renderActiveModel()
  + ### renderBloodSplat

    public void renderBloodSplat(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2)
  + ### renderObjectPicker

    public void renderObjectPicker([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") def,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### getAnimFrame

    public zombie.iso.sprite.IsoDirectionFrame getAnimFrame(int frame)
  + ### getTextureForFrame

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTextureForFrame(int frame,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    boolean useSnowSprite)
  + ### getTextureForFrame

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTextureForFrame(int frame,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### getTextureForCurrentFrame

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTextureForCurrentFrame([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    boolean useSnowSprite)
  + ### getTextureForCurrentFrame

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTextureForCurrentFrame([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### getTextureForCurrentFrame

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTextureForCurrentFrame([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    [IsoObject](../IsoObject.html "class in zombie.iso") obj)
  + ### update

    public void update()
  + ### update

    public void update([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") def)
  + ### CacheAnims

    public void CacheAnims([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### LoadCache

    public void LoadCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### setFromCache

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") setFromCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int numFrames)
  + ### getType

    public [IsoObjectType](../SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") getType()
  + ### setType

    public void setType([IsoObjectType](../SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") type)
  + ### getTileType

    public [IsoObjectType](../SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") getTileType()
  + ### setTileType

    public void setTileType([IsoObjectType](../SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") type)
  + ### AddProperties

    public void AddProperties([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getItemHeight

    public int getItemHeight()
  + ### getSurface

    public int getSurface()
  + ### getStackReplaceTileOffset

    public int getStackReplaceTileOffset()
  + ### isTable

    public boolean isTable()
  + ### isTableTop

    public boolean isTableTop()
  + ### isSurfaceOffset

    public boolean isSurfaceOffset()
  + ### getSlopedSurfaceDirection

    public [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getSlopedSurfaceDirection()
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### getTintMod

    public [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") getTintMod()
  + ### setTintMod

    public void setTintMod([ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info)
  + ### setAnimate

    public void setAnimate(boolean animate)
  + ### getSpriteGrid

    public [IsoSpriteGrid](IsoSpriteGrid.html "class in zombie.iso.sprite") getSpriteGrid()
  + ### setSpriteGrid

    public void setSpriteGrid([IsoSpriteGrid](IsoSpriteGrid.html "class in zombie.iso.sprite") sGrid)
  + ### isMoveWithWind

    public boolean isMoveWithWind()
  + ### is

    public boolean is([IsoFlagType](../SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### isWallSE

    public boolean isWallSE()
  + ### getSheetGridIdFromName

    public int getSheetGridIdFromName()
  + ### getSheetGridIdFromName

    public static int getSheetGridIdFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getFacing

    public [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getFacing()
  + ### initRoofProperties

    private void initRoofProperties()
  + ### getRoofProperties

    public zombie.core.properties.RoofProperties getRoofProperties()
  + ### clearCurtainOffset

    public void clearCurtainOffset()
  + ### setCurtainOffset

    public void setCurtainOffset(float x,
    float y,
    float z)
  + ### getCurtainOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getCurtainOffset()
  + ### shouldHaveCollision

    public boolean shouldHaveCollision()
  + ### setSnowSprite

    public void setSnowSprite([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSnowSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSnowSprite()
  + ### setFasciaEdge

    public void setFasciaEdge(zombie.core.properties.FasciaEdge fasciaEdge)
  + ### getFasciaEdge

    public zombie.core.properties.FasciaEdge getFasciaEdge()