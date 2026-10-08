[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderDebugOptions](FBORenderDebugOptions.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [bulletTracers](#bulletTracers)
   2. [combinedFbo](#combinedFbo)
   3. [corpsesInChunkTexture](#corpsesInChunkTexture)
   4. [depthTestAll](#depthTestAll)
   5. [fixJigglyModels](#fixJigglyModels)
   6. [highResChunkTextures](#highResChunkTextures)
   7. [forceAlphaAndTargetOne](#forceAlphaAndTargetOne)
   8. [forceAlphaToTarget](#forceAlphaToTarget)
   9. [forceSkyLightLevel](#forceSkyLightLevel)
   10. [itemsInChunkTexture](#itemsInChunkTexture)
   11. [mipMaps](#mipMaps)
   12. [nolighting](#nolighting)
   13. [renderChunkTextures](#renderChunkTextures)
   14. [renderMustSeeSquares](#renderMustSeeSquares)
   15. [renderTranslucentFloor](#renderTranslucentFloor)
   16. [renderTranslucentNonFloor](#renderTranslucentNonFloor)
   17. [renderVisionPolygon](#renderVisionPolygon)
   18. [renderWallLines](#renderWallLines)
   19. [renderWaterFlow](#renderWaterFlow)
   20. [seamFix1](#seamFix1)
   21. [seamFix2](#seamFix2)
   22. [updateSquareLightInfo](#updateSquareLightInfo)
   23. [useWeatherShader](#useWeatherShader)
6. [Constructor Details](#constructor-detail)
   1. [FBORenderDebugOptions()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderDebugOptions
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.options.OptionGroup

zombie.iso.fboRenderChunk.FBORenderDebugOptions

All Implemented Interfaces:
:   `zombie.debug.options.IDebugOption, zombie.debug.options.IDebugOptionGroup`

---

public final class FBORenderDebugOptions
extends zombie.debug.options.OptionGroup

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final BooleanDebugOption`

  `bulletTracers`

  `final BooleanDebugOption`

  `combinedFbo`

  `final BooleanDebugOption`

  `corpsesInChunkTexture`

  `final BooleanDebugOption`

  `depthTestAll`

  `final BooleanDebugOption`

  `fixJigglyModels`

  `final BooleanDebugOption`

  `forceAlphaAndTargetOne`

  `final BooleanDebugOption`

  `forceAlphaToTarget`

  `final BooleanDebugOption`

  `forceSkyLightLevel`

  `final BooleanDebugOption`

  `highResChunkTextures`

  `final BooleanDebugOption`

  `itemsInChunkTexture`

  `final BooleanDebugOption`

  `mipMaps`

  `final BooleanDebugOption`

  `nolighting`

  `final BooleanDebugOption`

  `renderChunkTextures`

  `final BooleanDebugOption`

  `renderMustSeeSquares`

  `final BooleanDebugOption`

  `renderTranslucentFloor`

  `final BooleanDebugOption`

  `renderTranslucentNonFloor`

  `final BooleanDebugOption`

  `renderVisionPolygon`

  `final BooleanDebugOption`

  `renderWallLines`

  `final BooleanDebugOption`

  `renderWaterFlow`

  `final BooleanDebugOption`

  `seamFix1`

  `final BooleanDebugOption`

  `seamFix2`

  `final BooleanDebugOption`

  `updateSquareLightInfo`

  `final BooleanDebugOption`

  `useWeatherShader`

  ### Fields inherited from class zombie.debug.options.OptionGroup

  `group`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FBORenderDebugOptions()`
* Method Summary
  --------------

  ### Methods inherited from class zombie.debug.options.OptionGroup

  `addChild, getChildren, getCombinedName, getGroupName, getName, getParent, onChildAdded, onDescendantAdded, onFullPathChanged, removeChild, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.debug.options.IDebugOptionGroup

  `getCombinedName, newDebugOnlyOption, newOption, newOptionGroup`

* Field Details
  -------------

  + ### bulletTracers

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") bulletTracers
  + ### combinedFbo

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") combinedFbo
  + ### corpsesInChunkTexture

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") corpsesInChunkTexture
  + ### depthTestAll

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") depthTestAll
  + ### fixJigglyModels

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") fixJigglyModels
  + ### highResChunkTextures

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") highResChunkTextures
  + ### forceAlphaAndTargetOne

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") forceAlphaAndTargetOne
  + ### forceAlphaToTarget

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") forceAlphaToTarget
  + ### forceSkyLightLevel

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") forceSkyLightLevel
  + ### itemsInChunkTexture

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") itemsInChunkTexture
  + ### mipMaps

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") mipMaps
  + ### nolighting

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") nolighting
  + ### renderChunkTextures

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderChunkTextures
  + ### renderMustSeeSquares

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderMustSeeSquares
  + ### renderTranslucentFloor

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderTranslucentFloor
  + ### renderTranslucentNonFloor

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderTranslucentNonFloor
  + ### renderVisionPolygon

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderVisionPolygon
  + ### renderWallLines

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderWallLines
  + ### renderWaterFlow

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") renderWaterFlow
  + ### seamFix1

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") seamFix1
  + ### seamFix2

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") seamFix2
  + ### updateSquareLightInfo

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") updateSquareLightInfo
  + ### useWeatherShader

    public final [BooleanDebugOption](../../debug/BooleanDebugOption.html "class in zombie.debug") useWeatherShader
* Constructor Details
  -------------------

  + ### FBORenderDebugOptions

    public FBORenderDebugOptions()