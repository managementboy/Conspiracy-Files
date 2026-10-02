[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [DebugOptions](DebugOptions.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [VERSION](#VERSION)
   2. [instance](#instance)
   3. [triggerWatcher](#triggerWatcher)
   4. [options](#options)
   5. [debugOptions](#debugOptions)
   6. [asset](#asset)
   7. [multiplayer](#multiplayer)
   8. [cheat](#cheat)
   9. [collideWithObstacles](#collideWithObstacles)
   10. [deadBodyAtlas](#deadBodyAtlas)
   11. [worldItemAtlas](#worldItemAtlas)
   12. [debugScenarioForceLaunch](#debugScenarioForceLaunch)
   13. [mechanicsRenderHitbox](#mechanicsRenderHitbox)
   14. [joypadRenderUi](#joypadRenderUi)
   15. [joypadRenderUiNavigation](#joypadRenderUiNavigation)
   16. [model](#model)
   17. [modRenderLoaded](#modRenderLoaded)
   18. [pathfindPathToMouseAllowCrawl](#pathfindPathToMouseAllowCrawl)
   19. [pathfindPathToMouseAllowThump](#pathfindPathToMouseAllowThump)
   20. [pathfindPathToMouseEnable](#pathfindPathToMouseEnable)
   21. [pathfindPathToMouseIgnoreCrawlCost](#pathfindPathToMouseIgnoreCrawlCost)
   22. [pathfindPathToMouseRenderSuccessors](#pathfindPathToMouseRenderSuccessors)
   23. [pathfindRenderChunkRegions](#pathfindRenderChunkRegions)
   24. [pathfindRenderPath](#pathfindRenderPath)
   25. [pathfindRenderWaiting](#pathfindRenderWaiting)
   26. [pathfindSmoothPlayerPath](#pathfindSmoothPlayerPath)
   27. [pathfindUseNativeCode](#pathfindUseNativeCode)
   28. [pathfindBorderFinder](#pathfindBorderFinder)
   29. [threadPathfinding](#threadPathfinding)
   30. [physicsRender](#physicsRender)
   31. [physicsRenderPlayerLevelOnly](#physicsRenderPlayerLevelOnly)
   32. [physicsRenderBallisticsControllers](#physicsRenderBallisticsControllers)
   33. [physicsRenderBallisticsTargets](#physicsRenderBallisticsTargets)
   34. [physicsRenderHighlightBallisticsTargets](#physicsRenderHighlightBallisticsTargets)
   35. [pathfindRenderClusters](#pathfindRenderClusters)
   36. [pathfindRenderConnections](#pathfindRenderConnections)
   37. [pathfindRenderCrawling](#pathfindRenderCrawling)
   38. [pathfindRenderLineClearCollide](#pathfindRenderLineClearCollide)
   39. [pathfindRenderNodes](#pathfindRenderNodes)
   40. [tooltipInfo](#tooltipInfo)
   41. [tooltipAttributes](#tooltipAttributes)
   42. [tooltipModName](#tooltipModName)
   43. [translationPrefix](#translationPrefix)
   44. [uiRenderOutline](#uiRenderOutline)
   45. [uiDebugConsoleStartVisible](#uiDebugConsoleStartVisible)
   46. [uiDebugConsoleDebugLog](#uiDebugConsoleDebugLog)
   47. [uiDebugConsoleEchoCommand](#uiDebugConsoleEchoCommand)
   48. [uiDisableLogoState](#uiDisableLogoState)
   49. [uiDisableWelcomeMessage](#uiDisableWelcomeMessage)
   50. [uiHideDebugContextMenuOptions](#uiHideDebugContextMenuOptions)
   51. [uiShowResearchableEtc](#uiShowResearchableEtc)
   52. [uiShowContextMenuReportOptions](#uiShowContextMenuReportOptions)
   53. [vehicleCycleColor](#vehicleCycleColor)
   54. [vehicleRenderBlood0](#vehicleRenderBlood0)
   55. [vehicleRenderBlood50](#vehicleRenderBlood50)
   56. [vehicleRenderBlood100](#vehicleRenderBlood100)
   57. [vehicleRenderDamage0](#vehicleRenderDamage0)
   58. [vehicleRenderDamage1](#vehicleRenderDamage1)
   59. [vehicleRenderDamage2](#vehicleRenderDamage2)
   60. [vehicleRenderRust0](#vehicleRenderRust0)
   61. [vehicleRenderRust50](#vehicleRenderRust50)
   62. [vehicleRenderRust100](#vehicleRenderRust100)
   63. [vehicleRenderOutline](#vehicleRenderOutline)
   64. [vehicleRenderArea](#vehicleRenderArea)
   65. [vehicleRenderAuthorizations](#vehicleRenderAuthorizations)
   66. [vehicleRenderInterpolateBuffer](#vehicleRenderInterpolateBuffer)
   67. [vehicleRenderAttackPositions](#vehicleRenderAttackPositions)
   68. [vehicleRenderExit](#vehicleRenderExit)
   69. [vehicleRenderIntersectedSquares](#vehicleRenderIntersectedSquares)
   70. [vehicleRenderTrailerPositions](#vehicleRenderTrailerPositions)
   71. [vehicleRenderVelocity](#vehicleRenderVelocity)
   72. [vehicleSpawnEverywhere](#vehicleSpawnEverywhere)
   73. [ambientWallEmittersRender](#ambientWallEmittersRender)
   74. [worldSoundRender](#worldSoundRender)
   75. [objectAmbientEmitterRender](#objectAmbientEmitterRender)
   76. [parameterInsideRender](#parameterInsideRender)
   77. [zombieVocalsRender](#zombieVocalsRender)
   78. [lightingRender](#lightingRender)
   79. [skyboxShow](#skyboxShow)
   80. [worldStreamerSlowLoad](#worldStreamerSlowLoad)
   81. [debugDrawSkipVboDraw](#debugDrawSkipVboDraw)
   82. [debugDrawSkipDrawNonSkinnedModel](#debugDrawSkipDrawNonSkinnedModel)
   83. [debugDrawSkipWorldShading](#debugDrawSkipWorldShading)
   84. [debugDrawFishingZones](#debugDrawFishingZones)
   85. [gameProfilerEnabled](#gameProfilerEnabled)
   86. [gameTimeSpeedHalf](#gameTimeSpeedHalf)
   87. [gameTimeSpeedQuarter](#gameTimeSpeedQuarter)
   88. [gameTimeSpeedEighth](#gameTimeSpeedEighth)
   89. [freezeTimeOfDay](#freezeTimeOfDay)
   90. [threadCrashEnabled](#threadCrashEnabled)
   91. [threadCrashGameThread](#threadCrashGameThread)
   92. [threadCrashRenderThread](#threadCrashRenderThread)
   93. [threadCrashGameLoadingThread](#threadCrashGameLoadingThread)
   94. [thumpableResetCurrentCellWindows](#thumpableResetCurrentCellWindows)
   95. [thumpableBarricadeCurrentCellWindowsFullPlanks](#thumpableBarricadeCurrentCellWindowsFullPlanks)
   96. [thumpableBarricadeCurrentCellWindowsHalfPlanks](#thumpableBarricadeCurrentCellWindowsHalfPlanks)
   97. [thumpableBarricadeCurrentCellWindowsFullMetalBars](#thumpableBarricadeCurrentCellWindowsFullMetalBars)
   98. [thumpableBarricadeCurrentCellWindowsMetalPlate](#thumpableBarricadeCurrentCellWindowsMetalPlate)
   99. [thumpableRemoveBarricadeCurrentCellWindows](#thumpableRemoveBarricadeCurrentCellWindows)
   100. [worldChunkMap5x5](#worldChunkMap5x5)
   101. [worldChunkMap7x7](#worldChunkMap7x7)
   102. [worldChunkMap9x9](#worldChunkMap9x9)
   103. [worldChunkMap11x11](#worldChunkMap11x11)
   104. [worldChunkMap13x13](#worldChunkMap13x13)
   105. [zombieRenderCanCrawlUnderVehicle](#zombieRenderCanCrawlUnderVehicle)
   106. [zombieRenderFakeDead](#zombieRenderFakeDead)
   107. [zombieRenderMemory](#zombieRenderMemory)
   108. [zombieRenderThump](#zombieRenderThump)
   109. [zombieRenderViewDistance](#zombieRenderViewDistance)
   110. [zombieOutfitRandom](#zombieOutfitRandom)
   111. [entityDebugUi](#entityDebugUi)
   112. [zombieImposterRendering](#zombieImposterRendering)
   113. [zombieBlendPreview](#zombieBlendPreview)
   114. [zombieImposterPreview](#zombieImposterPreview)
   115. [zombieImposterBlend](#zombieImposterBlend)
   116. [renderTestFsQuad](#renderTestFsQuad)
   117. [zombieAnimationDelay](#zombieAnimationDelay)
   118. [zombieRenderInstanced](#zombieRenderInstanced)
   119. [newedDebugOnlyOption](#newedDebugOnlyOption)
   120. [threadLighting](#threadLighting)
   121. [lightingSplitUpdate](#lightingSplitUpdate)
   122. [threadAmbient](#threadAmbient)
   123. [displayVisibilityPolygon](#displayVisibilityPolygon)
   124. [useNewVisibility](#useNewVisibility)
   125. [previewTiles](#previewTiles)
   126. [cheapOcclusionCount](#cheapOcclusionCount)
   127. [threadGridStacks](#threadGridStacks)
   128. [threadSound](#threadSound)
   129. [threadWorld](#threadWorld)
   130. [threadModelSlotInit](#threadModelSlotInit)
   131. [threadAnimation](#threadAnimation)
   132. [delayObjectRender](#delayObjectRender)
   133. [renderTreeSeen](#renderTreeSeen)
   134. [checks](#checks)
   135. [isoSprite](#isoSprite)
   136. [network](#network)
   137. [offscreenBuffer](#offscreenBuffer)
   138. [terrain](#terrain)
   139. [weather](#weather)
   140. [animation](#animation)
   141. [character](#character)
   142. [fboRenderChunk](#fboRenderChunk)
   143. [statistics](#statistics)
7. [Constructor Details](#constructor-detail)
   1. [DebugOptions()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [testThreadCrash(int)](#testThreadCrash(int))
   2. [init()](#init())
   3. [initMessaging()](#initMessaging())
   4. [onTrigger\_SetDebugOptions(String)](#onTrigger_SetDebugOptions(java.lang.String))
   5. [getChildren()](#getChildren())
   6. [addChild(IDebugOption)](#addChild(zombie.debug.options.IDebugOption))
   7. [removeChild(IDebugOption)](#removeChild(zombie.debug.options.IDebugOption))
   8. [onChildAdded(IDebugOption)](#onChildAdded(zombie.debug.options.IDebugOption))
   9. [onDescendantAdded(IDebugOption)](#onDescendantAdded(zombie.debug.options.IDebugOption))
   10. [addOption(IDebugOption)](#addOption(zombie.debug.options.IDebugOption))
   11. [addDescendantOptions(IDebugOptionGroup)](#addDescendantOptions(zombie.debug.options.IDebugOptionGroup))
   12. [getSlowMotionMultiplier()](#getSlowMotionMultiplier())
   13. [getName()](#getName())
   14. [getCombinedName(String)](#getCombinedName(java.lang.String))
   15. [getParent()](#getParent())
   16. [setParent(IDebugOptionGroup)](#setParent(zombie.debug.options.IDebugOptionGroup))
   17. [onFullPathChanged()](#onFullPathChanged())
   18. [getOptionByName(String)](#getOptionByName(java.lang.String))
   19. [getOptionCount()](#getOptionCount())
   20. [getOptionByIndex(int)](#getOptionByIndex(int))
   21. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   22. [getBoolean(String)](#getBoolean(java.lang.String))
   23. [save()](#save())
   24. [load()](#load())
   25. [testThreadCrashInternal(int)](#testThreadCrashInternal(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugOptions
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.DebugOptions

All Implemented Interfaces:
:   `zombie.debug.options.IDebugOption, zombie.debug.options.IDebugOptionGroup`

---

public final class DebugOptions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.debug.options.IDebugOptionGroup

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `DebugOptions.Checks`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final BooleanDebugOption`

  `ambientWallEmittersRender`

  `final zombie.debug.options.Animation`

  `animation`

  `final zombie.debug.options.Asset`

  `asset`

  `final zombie.debug.options.Character`

  `character`

  `final BooleanDebugOption`

  `cheapOcclusionCount`

  `final zombie.debug.options.Cheat`

  `cheat`

  `final DebugOptions.Checks`

  `checks`

  `final zombie.debug.options.CollideWithObstacles`

  `collideWithObstacles`

  `final zombie.debug.options.DeadBodyAtlas`

  `deadBodyAtlas`

  `final BooleanDebugOption`

  `debugDrawFishingZones`

  `final BooleanDebugOption`

  `debugDrawSkipDrawNonSkinnedModel`

  `final BooleanDebugOption`

  `debugDrawSkipVboDraw`

  `final BooleanDebugOption`

  `debugDrawSkipWorldShading`

  `private final ArrayList<zombie.debug.options.IDebugOption>`

  `debugOptions`

  `final BooleanDebugOption`

  `debugScenarioForceLaunch`

  `final BooleanDebugOption`

  `delayObjectRender`

  `final BooleanDebugOption`

  `displayVisibilityPolygon`

  `final BooleanDebugOption`

  `entityDebugUi`

  `final FBORenderDebugOptions`

  `fboRenderChunk`

  `final BooleanDebugOption`

  `freezeTimeOfDay`

  `final BooleanDebugOption`

  `gameProfilerEnabled`

  `final BooleanDebugOption`

  `gameTimeSpeedEighth`

  `final BooleanDebugOption`

  `gameTimeSpeedHalf`

  `final BooleanDebugOption`

  `gameTimeSpeedQuarter`

  `static final DebugOptions`

  `instance`

  `final IsoSprite`

  `isoSprite`

  `final BooleanDebugOption`

  `joypadRenderUi`

  `final BooleanDebugOption`

  `joypadRenderUiNavigation`

  `final BooleanDebugOption`

  `lightingRender`

  `final BooleanDebugOption`

  `lightingSplitUpdate`

  `final BooleanDebugOption`

  `mechanicsRenderHitbox`

  `final zombie.debug.options.Model`

  `model`

  `final BooleanDebugOption`

  `modRenderLoaded`

  `final zombie.debug.options.Multiplayer`

  `multiplayer`

  `final zombie.debug.options.Network`

  `network`

  `final BooleanDebugOption`

  `newedDebugOnlyOption`

  `final BooleanDebugOption`

  `objectAmbientEmitterRender`

  `final zombie.debug.options.OffscreenBuffer`

  `offscreenBuffer`

  `private final ArrayList<BooleanDebugOption>`

  `options`

  `final BooleanDebugOption`

  `parameterInsideRender`

  `final BooleanDebugOption`

  `pathfindBorderFinder`

  `final BooleanDebugOption`

  `pathfindPathToMouseAllowCrawl`

  `final BooleanDebugOption`

  `pathfindPathToMouseAllowThump`

  `final BooleanDebugOption`

  `pathfindPathToMouseEnable`

  `final BooleanDebugOption`

  `pathfindPathToMouseIgnoreCrawlCost`

  `final BooleanDebugOption`

  `pathfindPathToMouseRenderSuccessors`

  `final BooleanDebugOption`

  `pathfindRenderChunkRegions`

  `final BooleanDebugOption`

  `pathfindRenderClusters`

  `final BooleanDebugOption`

  `pathfindRenderConnections`

  `final BooleanDebugOption`

  `pathfindRenderCrawling`

  `final BooleanDebugOption`

  `pathfindRenderLineClearCollide`

  `final BooleanDebugOption`

  `pathfindRenderNodes`

  `final BooleanDebugOption`

  `pathfindRenderPath`

  `final BooleanDebugOption`

  `pathfindRenderWaiting`

  `final BooleanDebugOption`

  `pathfindSmoothPlayerPath`

  `final BooleanDebugOption`

  `pathfindUseNativeCode`

  `final BooleanDebugOption`

  `physicsRender`

  `final BooleanDebugOption`

  `physicsRenderBallisticsControllers`

  `final BooleanDebugOption`

  `physicsRenderBallisticsTargets`

  `final BooleanDebugOption`

  `physicsRenderHighlightBallisticsTargets`

  `final BooleanDebugOption`

  `physicsRenderPlayerLevelOnly`

  `final BooleanDebugOption`

  `previewTiles`

  `final BooleanDebugOption`

  `renderTestFsQuad`

  `final BooleanDebugOption`

  `renderTreeSeen`

  `final BooleanDebugOption`

  `skyboxShow`

  `final zombie.debug.options.Statistics`

  `statistics`

  `final zombie.debug.options.Terrain`

  `terrain`

  `final BooleanDebugOption`

  `threadAmbient`

  `final BooleanDebugOption`

  `threadAnimation`

  `final BooleanDebugOption`

  `threadCrashEnabled`

  `final BooleanDebugOption[]`

  `threadCrashGameLoadingThread`

  `final BooleanDebugOption[]`

  `threadCrashGameThread`

  `final BooleanDebugOption[]`

  `threadCrashRenderThread`

  `final BooleanDebugOption`

  `threadGridStacks`

  `final BooleanDebugOption`

  `threadLighting`

  `final BooleanDebugOption`

  `threadModelSlotInit`

  `final BooleanDebugOption`

  `threadPathfinding`

  `final BooleanDebugOption`

  `threadSound`

  `final BooleanDebugOption`

  `threadWorld`

  `final BooleanDebugOption`

  `thumpableBarricadeCurrentCellWindowsFullMetalBars`

  `final BooleanDebugOption`

  `thumpableBarricadeCurrentCellWindowsFullPlanks`

  `final BooleanDebugOption`

  `thumpableBarricadeCurrentCellWindowsHalfPlanks`

  `final BooleanDebugOption`

  `thumpableBarricadeCurrentCellWindowsMetalPlate`

  `final BooleanDebugOption`

  `thumpableRemoveBarricadeCurrentCellWindows`

  `final BooleanDebugOption`

  `thumpableResetCurrentCellWindows`

  `final BooleanDebugOption`

  `tooltipAttributes`

  `final BooleanDebugOption`

  `tooltipInfo`

  `final BooleanDebugOption`

  `tooltipModName`

  `final BooleanDebugOption`

  `translationPrefix`

  `private static zombie.PredicatedFileWatcher`

  `triggerWatcher`

  `final BooleanDebugOption`

  `uiDebugConsoleDebugLog`

  `final BooleanDebugOption`

  `uiDebugConsoleEchoCommand`

  `final BooleanDebugOption`

  `uiDebugConsoleStartVisible`

  `final BooleanDebugOption`

  `uiDisableLogoState`

  `final BooleanDebugOption`

  `uiDisableWelcomeMessage`

  `final BooleanDebugOption`

  `uiHideDebugContextMenuOptions`

  `final BooleanDebugOption`

  `uiRenderOutline`

  `final BooleanDebugOption`

  `uiShowContextMenuReportOptions`

  `final BooleanDebugOption`

  `uiShowResearchableEtc`

  `final BooleanDebugOption`

  `useNewVisibility`

  `final BooleanDebugOption`

  `vehicleCycleColor`

  `final BooleanDebugOption`

  `vehicleRenderArea`

  `final BooleanDebugOption`

  `vehicleRenderAttackPositions`

  `final BooleanDebugOption`

  `vehicleRenderAuthorizations`

  `final BooleanDebugOption`

  `vehicleRenderBlood0`

  `final BooleanDebugOption`

  `vehicleRenderBlood100`

  `final BooleanDebugOption`

  `vehicleRenderBlood50`

  `final BooleanDebugOption`

  `vehicleRenderDamage0`

  `final BooleanDebugOption`

  `vehicleRenderDamage1`

  `final BooleanDebugOption`

  `vehicleRenderDamage2`

  `final BooleanDebugOption`

  `vehicleRenderExit`

  `final BooleanDebugOption`

  `vehicleRenderInterpolateBuffer`

  `final BooleanDebugOption`

  `vehicleRenderIntersectedSquares`

  `final BooleanDebugOption`

  `vehicleRenderOutline`

  `final BooleanDebugOption`

  `vehicleRenderRust0`

  `final BooleanDebugOption`

  `vehicleRenderRust100`

  `final BooleanDebugOption`

  `vehicleRenderRust50`

  `final BooleanDebugOption`

  `vehicleRenderTrailerPositions`

  `final BooleanDebugOption`

  `vehicleRenderVelocity`

  `final BooleanDebugOption`

  `vehicleSpawnEverywhere`

  `static final int`

  `VERSION`

  `final zombie.debug.options.Weather`

  `weather`

  `final BooleanDebugOption`

  `worldChunkMap11x11`

  `final BooleanDebugOption`

  `worldChunkMap13x13`

  `final BooleanDebugOption`

  `worldChunkMap5x5`

  `final BooleanDebugOption`

  `worldChunkMap7x7`

  `final BooleanDebugOption`

  `worldChunkMap9x9`

  `final zombie.debug.options.WorldItemAtlas`

  `worldItemAtlas`

  `final BooleanDebugOption`

  `worldSoundRender`

  `final BooleanDebugOption`

  `worldStreamerSlowLoad`

  `final BooleanDebugOption`

  `zombieAnimationDelay`

  `final BooleanDebugOption`

  `zombieBlendPreview`

  `final BooleanDebugOption`

  `zombieImposterBlend`

  `final BooleanDebugOption`

  `zombieImposterPreview`

  `final BooleanDebugOption`

  `zombieImposterRendering`

  `final BooleanDebugOption`

  `zombieOutfitRandom`

  `final BooleanDebugOption`

  `zombieRenderCanCrawlUnderVehicle`

  `final BooleanDebugOption`

  `zombieRenderFakeDead`

  `final BooleanDebugOption`

  `zombieRenderInstanced`

  `final BooleanDebugOption`

  `zombieRenderMemory`

  `final BooleanDebugOption`

  `zombieRenderThump`

  `final BooleanDebugOption`

  `zombieRenderViewDistance`

  `final BooleanDebugOption`

  `zombieVocalsRender`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DebugOptions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChild(zombie.debug.options.IDebugOption newChild)`

  `private void`

  `addDescendantOptions(zombie.debug.options.IDebugOptionGroup group)`

  `private void`

  `addOption(zombie.debug.options.IDebugOption newOption)`

  `boolean`

  `getBoolean(String name)`

  `Iterable<zombie.debug.options.IDebugOption>`

  `getChildren()`

  `String`

  `getCombinedName(String childName)`

  `String`

  `getName()`

  `BooleanDebugOption`

  `getOptionByIndex(int index)`

  `BooleanDebugOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `zombie.debug.options.IDebugOptionGroup`

  `getParent()`

  `zombie.SlowMotionMultiplier`

  `getSlowMotionMultiplier()`

  `void`

  `init()`

  `private void`

  `initMessaging()`

  `void`

  `load()`

  `void`

  `onChildAdded(zombie.debug.options.IDebugOption newOption)`

  `void`

  `onDescendantAdded(zombie.debug.options.IDebugOption newOption)`

  `void`

  `onFullPathChanged()`

  `private void`

  `onTrigger_SetDebugOptions(String entryKey)`

  `void`

  `removeChild(zombie.debug.options.IDebugOption child)`

  `void`

  `save()`

  `void`

  `setBoolean(String name,
  boolean value)`

  `void`

  `setParent(zombie.debug.options.IDebugOptionGroup parent)`

  `static void`

  `testThreadCrash(int idx)`

  `private void`

  `testThreadCrashInternal(int idx)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.debug.options.IDebugOptionGroup

  `newDebugOnlyOption, newOption, newOptionGroup`

* Field Details
  -------------

  + ### VERSION

    public static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.debug.DebugOptions.VERSION)
  + ### instance

    public static final [DebugOptions](DebugOptions.html "class in zombie.debug") instance
  + ### triggerWatcher

    private static zombie.PredicatedFileWatcher triggerWatcher
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug")> options
  + ### debugOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.debug.options.IDebugOption> debugOptions
  + ### asset

    public final zombie.debug.options.Asset asset
  + ### multiplayer

    public final zombie.debug.options.Multiplayer multiplayer
  + ### cheat

    public final zombie.debug.options.Cheat cheat
  + ### collideWithObstacles

    public final zombie.debug.options.CollideWithObstacles collideWithObstacles
  + ### deadBodyAtlas

    public final zombie.debug.options.DeadBodyAtlas deadBodyAtlas
  + ### worldItemAtlas

    public final zombie.debug.options.WorldItemAtlas worldItemAtlas
  + ### debugScenarioForceLaunch

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") debugScenarioForceLaunch
  + ### mechanicsRenderHitbox

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") mechanicsRenderHitbox
  + ### joypadRenderUi

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") joypadRenderUi
  + ### joypadRenderUiNavigation

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") joypadRenderUiNavigation
  + ### model

    public final zombie.debug.options.Model model
  + ### modRenderLoaded

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") modRenderLoaded
  + ### pathfindPathToMouseAllowCrawl

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindPathToMouseAllowCrawl
  + ### pathfindPathToMouseAllowThump

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindPathToMouseAllowThump
  + ### pathfindPathToMouseEnable

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindPathToMouseEnable
  + ### pathfindPathToMouseIgnoreCrawlCost

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindPathToMouseIgnoreCrawlCost
  + ### pathfindPathToMouseRenderSuccessors

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindPathToMouseRenderSuccessors
  + ### pathfindRenderChunkRegions

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderChunkRegions
  + ### pathfindRenderPath

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderPath
  + ### pathfindRenderWaiting

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderWaiting
  + ### pathfindSmoothPlayerPath

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindSmoothPlayerPath
  + ### pathfindUseNativeCode

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindUseNativeCode
  + ### pathfindBorderFinder

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindBorderFinder
  + ### threadPathfinding

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadPathfinding
  + ### physicsRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") physicsRender
  + ### physicsRenderPlayerLevelOnly

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") physicsRenderPlayerLevelOnly
  + ### physicsRenderBallisticsControllers

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") physicsRenderBallisticsControllers
  + ### physicsRenderBallisticsTargets

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") physicsRenderBallisticsTargets
  + ### physicsRenderHighlightBallisticsTargets

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") physicsRenderHighlightBallisticsTargets
  + ### pathfindRenderClusters

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderClusters
  + ### pathfindRenderConnections

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderConnections
  + ### pathfindRenderCrawling

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderCrawling
  + ### pathfindRenderLineClearCollide

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderLineClearCollide
  + ### pathfindRenderNodes

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") pathfindRenderNodes
  + ### tooltipInfo

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") tooltipInfo
  + ### tooltipAttributes

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") tooltipAttributes
  + ### tooltipModName

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") tooltipModName
  + ### translationPrefix

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") translationPrefix
  + ### uiRenderOutline

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiRenderOutline
  + ### uiDebugConsoleStartVisible

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiDebugConsoleStartVisible
  + ### uiDebugConsoleDebugLog

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiDebugConsoleDebugLog
  + ### uiDebugConsoleEchoCommand

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiDebugConsoleEchoCommand
  + ### uiDisableLogoState

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiDisableLogoState
  + ### uiDisableWelcomeMessage

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiDisableWelcomeMessage
  + ### uiHideDebugContextMenuOptions

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiHideDebugContextMenuOptions
  + ### uiShowResearchableEtc

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiShowResearchableEtc
  + ### uiShowContextMenuReportOptions

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") uiShowContextMenuReportOptions
  + ### vehicleCycleColor

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleCycleColor
  + ### vehicleRenderBlood0

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderBlood0
  + ### vehicleRenderBlood50

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderBlood50
  + ### vehicleRenderBlood100

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderBlood100
  + ### vehicleRenderDamage0

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderDamage0
  + ### vehicleRenderDamage1

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderDamage1
  + ### vehicleRenderDamage2

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderDamage2
  + ### vehicleRenderRust0

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderRust0
  + ### vehicleRenderRust50

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderRust50
  + ### vehicleRenderRust100

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderRust100
  + ### vehicleRenderOutline

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderOutline
  + ### vehicleRenderArea

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderArea
  + ### vehicleRenderAuthorizations

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderAuthorizations
  + ### vehicleRenderInterpolateBuffer

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderInterpolateBuffer
  + ### vehicleRenderAttackPositions

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderAttackPositions
  + ### vehicleRenderExit

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderExit
  + ### vehicleRenderIntersectedSquares

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderIntersectedSquares
  + ### vehicleRenderTrailerPositions

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderTrailerPositions
  + ### vehicleRenderVelocity

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleRenderVelocity
  + ### vehicleSpawnEverywhere

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") vehicleSpawnEverywhere
  + ### ambientWallEmittersRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") ambientWallEmittersRender
  + ### worldSoundRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldSoundRender
  + ### objectAmbientEmitterRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") objectAmbientEmitterRender
  + ### parameterInsideRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") parameterInsideRender
  + ### zombieVocalsRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieVocalsRender
  + ### lightingRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") lightingRender
  + ### skyboxShow

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") skyboxShow
  + ### worldStreamerSlowLoad

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldStreamerSlowLoad
  + ### debugDrawSkipVboDraw

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") debugDrawSkipVboDraw
  + ### debugDrawSkipDrawNonSkinnedModel

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") debugDrawSkipDrawNonSkinnedModel
  + ### debugDrawSkipWorldShading

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") debugDrawSkipWorldShading
  + ### debugDrawFishingZones

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") debugDrawFishingZones
  + ### gameProfilerEnabled

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") gameProfilerEnabled
  + ### gameTimeSpeedHalf

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") gameTimeSpeedHalf
  + ### gameTimeSpeedQuarter

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") gameTimeSpeedQuarter
  + ### gameTimeSpeedEighth

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") gameTimeSpeedEighth
  + ### freezeTimeOfDay

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") freezeTimeOfDay
  + ### threadCrashEnabled

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadCrashEnabled
  + ### threadCrashGameThread

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug")[] threadCrashGameThread
  + ### threadCrashRenderThread

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug")[] threadCrashRenderThread
  + ### threadCrashGameLoadingThread

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug")[] threadCrashGameLoadingThread
  + ### thumpableResetCurrentCellWindows

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableResetCurrentCellWindows
  + ### thumpableBarricadeCurrentCellWindowsFullPlanks

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableBarricadeCurrentCellWindowsFullPlanks
  + ### thumpableBarricadeCurrentCellWindowsHalfPlanks

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableBarricadeCurrentCellWindowsHalfPlanks
  + ### thumpableBarricadeCurrentCellWindowsFullMetalBars

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableBarricadeCurrentCellWindowsFullMetalBars
  + ### thumpableBarricadeCurrentCellWindowsMetalPlate

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableBarricadeCurrentCellWindowsMetalPlate
  + ### thumpableRemoveBarricadeCurrentCellWindows

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") thumpableRemoveBarricadeCurrentCellWindows
  + ### worldChunkMap5x5

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldChunkMap5x5
  + ### worldChunkMap7x7

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldChunkMap7x7
  + ### worldChunkMap9x9

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldChunkMap9x9
  + ### worldChunkMap11x11

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldChunkMap11x11
  + ### worldChunkMap13x13

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") worldChunkMap13x13
  + ### zombieRenderCanCrawlUnderVehicle

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderCanCrawlUnderVehicle
  + ### zombieRenderFakeDead

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderFakeDead
  + ### zombieRenderMemory

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderMemory
  + ### zombieRenderThump

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderThump
  + ### zombieRenderViewDistance

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderViewDistance
  + ### zombieOutfitRandom

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieOutfitRandom
  + ### entityDebugUi

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") entityDebugUi
  + ### zombieImposterRendering

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieImposterRendering
  + ### zombieBlendPreview

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieBlendPreview
  + ### zombieImposterPreview

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieImposterPreview
  + ### zombieImposterBlend

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieImposterBlend
  + ### renderTestFsQuad

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") renderTestFsQuad
  + ### zombieAnimationDelay

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieAnimationDelay
  + ### zombieRenderInstanced

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") zombieRenderInstanced
  + ### newedDebugOnlyOption

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") newedDebugOnlyOption
  + ### threadLighting

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadLighting
  + ### lightingSplitUpdate

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") lightingSplitUpdate
  + ### threadAmbient

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadAmbient
  + ### displayVisibilityPolygon

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") displayVisibilityPolygon
  + ### useNewVisibility

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") useNewVisibility
  + ### previewTiles

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") previewTiles
  + ### cheapOcclusionCount

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") cheapOcclusionCount
  + ### threadGridStacks

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadGridStacks
  + ### threadSound

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadSound
  + ### threadWorld

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadWorld
  + ### threadModelSlotInit

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadModelSlotInit
  + ### threadAnimation

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") threadAnimation
  + ### delayObjectRender

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") delayObjectRender
  + ### renderTreeSeen

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") renderTreeSeen
  + ### checks

    public final [DebugOptions.Checks](DebugOptions.Checks.html "class in zombie.debug") checks
  + ### isoSprite

    public final [IsoSprite](options/IsoSprite.html "class in zombie.debug.options") isoSprite
  + ### network

    public final zombie.debug.options.Network network
  + ### offscreenBuffer

    public final zombie.debug.options.OffscreenBuffer offscreenBuffer
  + ### terrain

    public final zombie.debug.options.Terrain terrain
  + ### weather

    public final zombie.debug.options.Weather weather
  + ### animation

    public final zombie.debug.options.Animation animation
  + ### character

    public final zombie.debug.options.Character character
  + ### fboRenderChunk

    public final [FBORenderDebugOptions](../iso/fboRenderChunk/FBORenderDebugOptions.html "class in zombie.iso.fboRenderChunk") fboRenderChunk
  + ### statistics

    public final zombie.debug.options.Statistics statistics
* Constructor Details
  -------------------

  + ### DebugOptions

    public DebugOptions()
* Method Details
  --------------

  + ### testThreadCrash

    public static void testThreadCrash(int idx)
  + ### init

    public void init()
  + ### initMessaging

    private void initMessaging()
  + ### onTrigger\_SetDebugOptions

    private void onTrigger\_SetDebugOptions([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") entryKey)
  + ### getChildren

    public [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<zombie.debug.options.IDebugOption> getChildren()

    Specified by:
    :   `getChildren` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### addChild

    public void addChild(zombie.debug.options.IDebugOption newChild)

    Specified by:
    :   `addChild` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### removeChild

    public void removeChild(zombie.debug.options.IDebugOption child)

    Specified by:
    :   `removeChild` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### onChildAdded

    public void onChildAdded(zombie.debug.options.IDebugOption newOption)

    Specified by:
    :   `onChildAdded` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### onDescendantAdded

    public void onDescendantAdded(zombie.debug.options.IDebugOption newOption)

    Specified by:
    :   `onDescendantAdded` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### addOption

    private void addOption(zombie.debug.options.IDebugOption newOption)
  + ### addDescendantOptions

    private void addDescendantOptions(zombie.debug.options.IDebugOptionGroup group)
  + ### getSlowMotionMultiplier

    public zombie.SlowMotionMultiplier getSlowMotionMultiplier()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Specified by:
    :   `getName` in interface `zombie.debug.options.IDebugOption`
  + ### getCombinedName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCombinedName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") childName)

    Specified by:
    :   `getCombinedName` in interface `zombie.debug.options.IDebugOptionGroup`
  + ### getParent

    public zombie.debug.options.IDebugOptionGroup getParent()

    Specified by:
    :   `getParent` in interface `zombie.debug.options.IDebugOption`
  + ### setParent

    public void setParent(zombie.debug.options.IDebugOptionGroup parent)

    Specified by:
    :   `setParent` in interface `zombie.debug.options.IDebugOption`
  + ### onFullPathChanged

    public void onFullPathChanged()

    Specified by:
    :   `onFullPathChanged` in interface `zombie.debug.options.IDebugOption`
  + ### getOptionByName

    public [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOptionCount

    public int getOptionCount()
  + ### getOptionByIndex

    public [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") getOptionByIndex(int index)
  + ### setBoolean

    public void setBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean value)
  + ### getBoolean

    public boolean getBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### save

    public void save()
  + ### load

    public void load()
  + ### testThreadCrashInternal

    private void testThreadCrashInternal(int idx)