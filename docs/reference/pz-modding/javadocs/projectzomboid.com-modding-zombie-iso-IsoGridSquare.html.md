[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoGridSquare](IsoGridSquare.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [USE\_WALL\_SHADER](#USE_WALL_SHADER)
   2. [ADD\_UNDERGROUND\_BLOCKS](#ADD_UNDERGROUND_BLOCKS)
   3. [CUTAWAY\_OUTLINE\_ALPHA](#CUTAWAY_OUTLINE_ALPHA)
   4. [cutawayY](#cutawayY)
   5. [cutawayNWWidth](#cutawayNWWidth)
   6. [cutawayNWHeight](#cutawayNWHeight)
   7. [cutawaySEXCut](#cutawaySEXCut)
   8. [cutawaySEXUncut](#cutawaySEXUncut)
   9. [cutawaySEWidth](#cutawaySEWidth)
   10. [cutawaySEHeight](#cutawaySEHeight)
   11. [cutawayNXFullyCut](#cutawayNXFullyCut)
   12. [cutawayNXCutW](#cutawayNXCutW)
   13. [cutawayNXUncut](#cutawayNXUncut)
   14. [cutawayNXCutE](#cutawayNXCutE)
   15. [cutawayWXFullyCut](#cutawayWXFullyCut)
   16. [cutawayWXCutS](#cutawayWXCutS)
   17. [cutawayWXUncut](#cutawayWXUncut)
   18. [cutawayWXCutN](#cutawayWXCutN)
   19. [cutawayFenceXOffset](#cutawayFenceXOffset)
   20. [cutawayLogWallXOffset](#cutawayLogWallXOffset)
   21. [cutawayMedicalCurtainWXOffset](#cutawayMedicalCurtainWXOffset)
   22. [cutawayTentWallXOffset](#cutawayTentWallXOffset)
   23. [cutawaySpiffoWindowXOffset](#cutawaySpiffoWindowXOffset)
   24. [cutawayRoof4XOffset](#cutawayRoof4XOffset)
   25. [cutawayRoof17XOffset](#cutawayRoof17XOffset)
   26. [cutawayRoof28XOffset](#cutawayRoof28XOffset)
   27. [cutawayRoof41XOffset](#cutawayRoof41XOffset)
   28. [WALL\_TYPE\_N](#WALL_TYPE_N)
   29. [WALL\_TYPE\_S](#WALL_TYPE_S)
   30. [WALL\_TYPE\_W](#WALL_TYPE_W)
   31. [WALL\_TYPE\_E](#WALL_TYPE_E)
   32. [SURFACE\_OFFSETS](#SURFACE_OFFSETS)
   33. [VisiFlagTimerPeriod\_ms](#VisiFlagTimerPeriod_ms)
   34. [PCF\_NONE](#PCF_NONE)
   35. [PCF\_NORTH](#PCF_NORTH)
   36. [PCF\_WEST](#PCF_WEST)
   37. [threadLocalZones](#threadLocalZones)
   38. [DIRECTIONS](#DIRECTIONS)
   39. [lighting](#lighting)
   40. [tempo](#tempo)
   41. [tempo2](#tempo2)
   42. [rmod](#rmod)
   43. [gmod](#gmod)
   44. [bmod](#bmod)
   45. [idMax](#idMax)
   46. [col](#col)
   47. [path](#path)
   48. [pathdoor](#pathdoor)
   49. [vision](#vision)
   50. [rainsplashCache](#rainsplashCache)
   51. [useSlowCollision](#useSlowCollision)
   52. [associatedBuilding](#associatedBuilding)
   53. [hasTree](#hasTree)
   54. [lightInfluenceB](#lightInfluenceB)
   55. [lightInfluenceG](#lightInfluenceG)
   56. [lightInfluenceR](#lightInfluenceR)
   57. [nav](#nav)
   58. [lightLevel](#lightLevel)
   59. [collideMatrix](#collideMatrix)
   60. [pathMatrix](#pathMatrix)
   61. [visionMatrix](#visionMatrix)
   62. [room](#room)
   63. [w](#w)
   64. [nw](#nw)
   65. [sw](#sw)
   66. [s](#s)
   67. [n](#n)
   68. [ne](#ne)
   69. [se](#se)
   70. [e](#e)
   71. [u](#u)
   72. [d](#d)
   73. [haveSheetRope](#haveSheetRope)
   74. [isoWorldRegion](#isoWorldRegion)
   75. [hasSetIsoWorldRegion](#hasSetIsoWorldRegion)
   76. [objectsSyncCount](#objectsSyncCount)
   77. [roofHideBuilding](#roofHideBuilding)
   78. [flattenGrassEtc](#flattenGrassEtc)
   79. [playerCutawayFlags](#playerCutawayFlags)
   80. [playerCutawayFlagLockUntilTimes](#playerCutawayFlagLockUntilTimes)
   81. [targetPlayerCutawayFlags](#targetPlayerCutawayFlags)
   82. [playerIsDissolvedFlags](#playerIsDissolvedFlags)
   83. [playerIsDissolvedFlagLockUntilTimes](#playerIsDissolvedFlagLockUntilTimes)
   84. [targetPlayerIsDissolvedFlags](#targetPlayerIsDissolvedFlags)
   85. [water](#water)
   86. [puddles](#puddles)
   87. [puddlesCacheSize](#puddlesCacheSize)
   88. [puddlesCacheLevel](#puddlesCacheLevel)
   89. [waterSplashData](#waterSplashData)
   90. [lightInfo](#lightInfo)
   91. [rainDrop](#rainDrop)
   92. [rainSplash](#rainSplash)
   93. [splashX](#splashX)
   94. [splashY](#splashY)
   95. [splashFrame](#splashFrame)
   96. [splashFrameNum](#splashFrameNum)
   97. [waterSplashCache](#waterSplashCache)
   98. [isWaterSplashCacheInitialised](#isWaterSplashCacheInitialised)
   99. [gridSquareCacheEmptyTimer](#gridSquareCacheEmptyTimer)
   100. [darkStep](#darkStep)
   101. [recalcLightTime](#recalcLightTime)
   102. [lightcache](#lightcache)
   103. [propertiesDirty](#propertiesDirty)
   104. [defColorInfo](#defColorInfo)
   105. [blackColorInfo](#blackColorInfo)
   106. [colu](#colu)
   107. [coll](#coll)
   108. [colr](#colr)
   109. [colu2](#colu2)
   110. [coll2](#coll2)
   111. [colr2](#colr2)
   112. [doSlowPathfinding](#doSlowPathfinding)
   113. [circleStencil](#circleStencil)
   114. [hashCodeObjects](#hashCodeObjects)
   115. [FIRE\_IMMUNE\_THRESHOLD](#FIRE_IMMUNE_THRESHOLD)
   116. [FLOORS\_BURNT\_SPRITE\_PREFIX](#FLOORS_BURNT_SPRITE_PREFIX)
   117. [cellGetSquare](#cellGetSquare)
   118. [x](#x)
   119. [y](#y)
   120. [z](#z)
   121. [cachedScreenValue](#cachedScreenValue)
   122. [cachedScreenX](#cachedScreenX)
   123. [cachedScreenY](#cachedScreenY)
   124. [torchTimer](#torchTimer)
   125. [solidFloorCached](#solidFloorCached)
   126. [solidFloor](#solidFloor)
   127. [cacheIsFree](#cacheIsFree)
   128. [cachedIsFree](#cachedIsFree)
   129. [chunk](#chunk)
   130. [roomId](#roomId)
   131. [id](#id)
   132. [zone](#zone)
   133. [deferedCharacters](#deferedCharacters)
   134. [deferredCharacterTick](#deferredCharacterTick)
   135. [staticMovingObjects](#staticMovingObjects)
   136. [movingObjects](#movingObjects)
   137. [objects](#objects)
   138. [worldObjects](#worldObjects)
   139. [hasTypes](#hasTypes)
   140. [properties](#properties)
   141. [specialObjects](#specialObjects)
   142. [haveRoof](#haveRoof)
   143. [burntOut](#burntOut)
   144. [hasFlies](#hasFlies)
   145. [biome](#biome)
   146. [occlusionDataCache](#occlusionDataCache)
   147. [tempWorldInventoryObjects](#tempWorldInventoryObjects)
   148. [isoGridSquareCache](#isoGridSquareCache)
   149. [loadGridSquareCache](#loadGridSquareCache)
   150. [overlayDone](#overlayDone)
   151. [table](#table)
   152. [trapPositionX](#trapPositionX)
   153. [trapPositionY](#trapPositionY)
   154. [trapPositionZ](#trapPositionZ)
   155. [ignoreBlockingSprites](#ignoreBlockingSprites)
   156. [choices](#choices)
   157. [lightInfoTemp](#lightInfoTemp)
   158. [doorWindowCutawayLightMin](#doorWindowCutawayLightMin)
   159. [wallCutawayW](#wallCutawayW)
   160. [wallCutawayN](#wallCutawayN)
   161. [isSolidFloorCache](#isSolidFloorCache)
   162. [isExteriorCache](#isExteriorCache)
   163. [isVegitationCache](#isVegitationCache)
   164. [hourLastSeen](#hourLastSeen)
   165. [lastLoaded](#lastLoaded)
   166. [tr](#tr)
   167. [tl](#tl)
   168. [br](#br)
   169. [bl](#bl)
   170. [interp1](#interp1)
   171. [interp2](#interp2)
   172. [finalCol](#finalCol)
   173. [comp](#comp)
   174. [isOnScreenLast](#isOnScreenLast)
   175. [erosion](#erosion)
7. [Constructor Details](#constructor-detail)
   1. [IsoGridSquare(IsoCell, SliceY, int, int, int)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.SliceY,int,int,int))
8. [Method Details](#method-detail)
   1. [getCoords()](#getCoords())
   2. [getMatrixBit(int, int, int, int)](#getMatrixBit(int,int,int,int))
   3. [getMatrixBit(int, byte, byte, byte)](#getMatrixBit(int,byte,byte,byte))
   4. [setMatrixBit(int, int, int, int, boolean)](#setMatrixBit(int,int,int,int,boolean))
   5. [setMatrixBit(int, byte, byte, byte, boolean)](#setMatrixBit(int,byte,byte,byte,boolean))
   6. [GetRLightLevel()](#GetRLightLevel())
   7. [GetGLightLevel()](#GetGLightLevel())
   8. [GetBLightLevel()](#GetBLightLevel())
   9. [SetRLightLevel(int)](#SetRLightLevel(int))
   10. [SetGLightLevel(int)](#SetGLightLevel(int))
   11. [SetBLightLevel(int)](#SetBLightLevel(int))
   12. [setPlayerCutawayFlag(int, int, long)](#setPlayerCutawayFlag(int,int,long))
   13. [addPlayerCutawayFlag(int, int, long)](#addPlayerCutawayFlag(int,int,long))
   14. [clearPlayerCutawayFlag(int, int, long)](#clearPlayerCutawayFlag(int,int,long))
   15. [getPlayerCutawayFlag(int, long)](#getPlayerCutawayFlag(int,long))
   16. [setIsDissolved(int, boolean, long)](#setIsDissolved(int,boolean,long))
   17. [getIsDissolved(int, long)](#getIsDissolved(int,long))
   18. [hasWater()](#hasWater())
   19. [getWater()](#getWater())
   20. [clearWater()](#clearWater())
   21. [getPuddles()](#getPuddles())
   22. [clearPuddles()](#clearPuddles())
   23. [getPuddlesInGround()](#getPuddlesInGround())
   24. [removeUnderground()](#removeUnderground())
   25. [isInsideRectangle(int, int, int, int)](#isInsideRectangle(int,int,int,int))
   26. [doGridNav(IsoGridSquare.GetSquare)](#doGridNav(zombie.iso.IsoGridSquare.GetSquare))
   27. [getOcclusionData()](#getOcclusionData())
   28. [getOrCreateOcclusionData()](#getOrCreateOcclusionData())
   29. [softClear()](#softClear())
   30. [getGridSneakModifier(boolean)](#getGridSneakModifier(boolean))
   31. [isSomethingTo(IsoGridSquare)](#isSomethingTo(zombie.iso.IsoGridSquare))
   32. [getTransparentWallTo(IsoGridSquare)](#getTransparentWallTo(zombie.iso.IsoGridSquare))
   33. [isWallTo(IsoGridSquare)](#isWallTo(zombie.iso.IsoGridSquare))
   34. [isWallTo(IsoGridSquare, int)](#isWallTo(zombie.iso.IsoGridSquare,int))
   35. [isWindowTo(IsoGridSquare)](#isWindowTo(zombie.iso.IsoGridSquare))
   36. [haveDoor()](#haveDoor())
   37. [hasDoorOnEdge(IsoDirections, boolean)](#hasDoorOnEdge(zombie.iso.IsoDirections,boolean))
   38. [hasClosedDoorOnEdge(IsoDirections)](#hasClosedDoorOnEdge(zombie.iso.IsoDirections))
   39. [hasOpenDoorOnEdge(IsoDirections)](#hasOpenDoorOnEdge(zombie.iso.IsoDirections))
   40. [isDoorTo(IsoGridSquare)](#isDoorTo(zombie.iso.IsoGridSquare))
   41. [isBlockedTo(IsoGridSquare)](#isBlockedTo(zombie.iso.IsoGridSquare))
   42. [canReachTo(IsoGridSquare)](#canReachTo(zombie.iso.IsoGridSquare))
   43. [isWindowBlockedTo(IsoGridSquare)](#isWindowBlockedTo(zombie.iso.IsoGridSquare))
   44. [hasBlockedWindow(boolean)](#hasBlockedWindow(boolean))
   45. [isDoorBlockedTo(IsoGridSquare)](#isDoorBlockedTo(zombie.iso.IsoGridSquare))
   46. [hasBlockedDoor(boolean)](#hasBlockedDoor(boolean))
   47. [getCurtain(IsoObjectType)](#getCurtain(zombie.iso.SpriteDetails.IsoObjectType))
   48. [getHoppable(boolean)](#getHoppable(boolean))
   49. [getHoppableTo(IsoGridSquare)](#getHoppableTo(zombie.iso.IsoGridSquare))
   50. [isHoppableTo(IsoGridSquare)](#isHoppableTo(zombie.iso.IsoGridSquare))
   51. [getBendable(boolean)](#getBendable(boolean))
   52. [getBendableTo(IsoGridSquare)](#getBendableTo(zombie.iso.IsoGridSquare))
   53. [discard()](#discard())
   54. [DistTo(int, int)](#DistTo(int,int))
   55. [DistTo(IsoGridSquare)](#DistTo(zombie.iso.IsoGridSquare))
   56. [DistToProper(int, int)](#DistToProper(int,int))
   57. [DistToProper(IsoGridSquare)](#DistToProper(zombie.iso.IsoGridSquare))
   58. [DistTo(IsoMovingObject)](#DistTo(zombie.iso.IsoMovingObject))
   59. [DistToProper(IsoMovingObject)](#DistToProper(zombie.iso.IsoMovingObject))
   60. [isSafeToSpawn()](#isSafeToSpawn())
   61. [isSafeToSpawn(IsoGridSquare, int)](#isSafeToSpawn(zombie.iso.IsoGridSquare,int))
   62. [renderAttachedSpritesWithNoWallLighting(IsoObject, ColorInfo, Consumer)](#renderAttachedSpritesWithNoWallLighting(zombie.iso.IsoObject,zombie.core.textures.ColorInfo,java.util.function.Consumer))
   63. [calculateCutawayOutlineAlpha(int, boolean)](#calculateCutawayOutlineAlpha(int,boolean))
   64. [DoCutawayShader(IsoObject, IsoDirections, int, int, int, int, int, boolean, boolean, boolean, boolean, WallShaper)](#DoCutawayShader(zombie.iso.IsoObject,zombie.iso.IsoDirections,int,int,int,int,int,boolean,boolean,boolean,boolean,zombie.iso.sprite.shapers.WallShaper))
   65. [DoCutawayShaderAttached(IsoObject, IsoDirections, Texture, boolean, ColorInfo, int, int, int, int, int, int, int, int, SpriteRenderer.WallShaderTexRender)](#DoCutawayShaderAttached(zombie.iso.IsoObject,zombie.iso.IsoDirections,zombie.core.textures.Texture,boolean,zombie.core.textures.ColorInfo,int,int,int,int,int,int,int,int,zombie.core.SpriteRenderer.WallShaderTexRender))
   66. [DoCutawayShaderSprite(IsoSprite, IsoDirections, int, int, int, int, int)](#DoCutawayShaderSprite(zombie.iso.sprite.IsoSprite,zombie.iso.IsoDirections,int,int,int,int,int))
   67. [DoWallLightingNW(IsoObject, int, int, int, int, int, int, boolean, boolean, boolean, boolean, Shader)](#DoWallLightingNW(zombie.iso.IsoObject,int,int,int,int,int,int,boolean,boolean,boolean,boolean,zombie.core.opengl.Shader))
   68. [DoWallLightingN(IsoObject, int, int, int, int, int, int, boolean, boolean, Shader)](#DoWallLightingN(zombie.iso.IsoObject,int,int,int,int,int,int,boolean,boolean,zombie.core.opengl.Shader))
   69. [DoWallLightingW(IsoObject, int, int, int, int, int, int, boolean, boolean, Shader)](#DoWallLightingW(zombie.iso.IsoObject,int,int,int,int,int,int,boolean,boolean,zombie.core.opengl.Shader))
   70. [performDrawWallSegmentSingle(IsoObject, int, int, int, int, int, int, boolean, boolean, boolean, boolean, boolean, boolean, IsoObjectType, IsoObjectType, boolean, IsoFlagType, IsoFlagType, IsoFlagType, IsoDirections, boolean, WallShaperWhole, Shader)](#performDrawWallSegmentSingle(zombie.iso.IsoObject,int,int,int,int,int,int,boolean,boolean,boolean,boolean,boolean,boolean,zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType,boolean,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.IsoDirections,boolean,zombie.iso.sprite.shapers.WallShaperWhole,zombie.core.opengl.Shader))
   71. [performDrawWallOnly(IsoObject, IsoDirections, int, int, boolean, Consumer, Shader)](#performDrawWallOnly(zombie.iso.IsoObject,zombie.iso.IsoDirections,int,int,boolean,java.util.function.Consumer,zombie.core.opengl.Shader))
   72. [performDrawWall(IsoObject, IsoDirections, int, int, boolean, Consumer, Shader)](#performDrawWall(zombie.iso.IsoObject,zombie.iso.IsoDirections,int,int,boolean,java.util.function.Consumer,zombie.core.opengl.Shader))
   73. [calculateWallAlphaCommon(IsoObject, boolean, boolean, boolean, int, boolean, boolean)](#calculateWallAlphaCommon(zombie.iso.IsoObject,boolean,boolean,boolean,int,boolean,boolean))
   74. [calculateWallAlphaAndCircleStencilEdge(IsoObject, boolean, boolean, boolean, IsoFlagType, IsoFlagType, IsoFlagType, boolean, int, boolean, boolean)](#calculateWallAlphaAndCircleStencilEdge(zombie.iso.IsoObject,boolean,boolean,boolean,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.SpriteDetails.IsoFlagType,boolean,int,boolean,boolean))
   75. [calculateWallAlphaAndCircleStencilCorner(IsoObject, int, boolean, boolean, boolean, boolean, boolean, int, boolean, boolean, boolean, boolean)](#calculateWallAlphaAndCircleStencilCorner(zombie.iso.IsoObject,int,boolean,boolean,boolean,boolean,boolean,int,boolean,boolean,boolean,boolean))
   76. [getLuaMovingObjectList()](#getLuaMovingObjectList())
   77. [has(IsoFlagType)](#has(zombie.iso.SpriteDetails.IsoFlagType))
   78. [has(IsoPropertyType)](#has(zombie.core.properties.IsoPropertyType))
   79. [has(IsoPropertyType...)](#has(zombie.core.properties.IsoPropertyType...))
   80. [has(String)](#has(java.lang.String))
   81. [has(IsoObjectType)](#has(zombie.iso.SpriteDetails.IsoObjectType))
   82. [has(int)](#has(int))
   83. [set(String)](#set(java.lang.String))
   84. [unset(String)](#unset(java.lang.String))
   85. [DeleteTileObject(IsoObject)](#DeleteTileObject(zombie.iso.IsoObject))
   86. [getLuaTileObjectList()](#getLuaTileObjectList())
   87. [HasDoor(boolean)](#HasDoor(boolean))
   88. [HasStairs()](#HasStairs())
   89. [HasStairsNorth()](#HasStairsNorth())
   90. [HasStairsWest()](#HasStairsWest())
   91. [isStairBlockedTo(IsoGridSquare)](#isStairBlockedTo(zombie.iso.IsoGridSquare))
   92. [HasStairTop()](#HasStairTop())
   93. [HasStairTopNorth()](#HasStairTopNorth())
   94. [HasStairTopWest()](#HasStairTopWest())
   95. [HasStairsBelow()](#HasStairsBelow())
   96. [getStairPillar()](#getStairPillar())
   97. [getFloorSquareBelow()](#getFloorSquareBelow())
   98. [hasFloorBelow()](#hasFloorBelow())
   99. [getObjectWithSprite(String)](#getObjectWithSprite(java.lang.String))
   100. [hasFloorAtTopOfStairs()](#hasFloorAtTopOfStairs())
   101. [getStairs()](#getStairs())
   102. [HasElevatedFloor()](#HasElevatedFloor())
   103. [isSameStaircase(int, int, int)](#isSameStaircase(int,int,int))
   104. [hasRainBlockingTile()](#hasRainBlockingTile())
   105. [haveRoofFull()](#haveRoofFull())
   106. [HasSlopedRoof()](#HasSlopedRoof())
   107. [HasSlopedRoofWest()](#HasSlopedRoofWest())
   108. [HasSlopedRoofNorth()](#HasSlopedRoofNorth())
   109. [HasEave()](#HasEave())
   110. [HasTree()](#HasTree())
   111. [getTree()](#getTree())
   112. [getStump()](#getStump())
   113. [getOre()](#getOre())
   114. [hasBush()](#hasBush())
   115. [getBush()](#getBush())
   116. [getBushes()](#getBushes())
   117. [getGrass()](#getGrass())
   118. [hasGrassLike()](#hasGrassLike())
   119. [getGrassLike()](#getGrassLike())
   120. [getOres()](#getOres())
   121. [getCountertopObject()](#getCountertopObject())
   122. [getCountertopAttachObject()](#getCountertopAttachObject())
   123. [shouldSave()](#shouldSave())
   124. [save(ByteBuffer, ObjectOutputStream)](#save(java.nio.ByteBuffer,java.io.ObjectOutputStream))
   125. [save(ByteBuffer, ObjectOutputStream, boolean)](#save(java.nio.ByteBuffer,java.io.ObjectOutputStream,boolean))
   126. [loadmatrix(boolean[][][], DataInputStream)](#loadmatrix(boolean%5B%5D%5B%5D%5B%5D,java.io.DataInputStream))
   127. [savematrix(boolean[][][], DataOutputStream)](#savematrix(boolean%5B%5D%5B%5D%5B%5D,java.io.DataOutputStream))
   128. [isCommonGrass()](#isCommonGrass())
   129. [toBoolean(byte[])](#toBoolean(byte%5B%5D))
   130. [removeCorpse(IsoDeadBody, boolean)](#removeCorpse(zombie.iso.objects.IsoDeadBody,boolean))
   131. [getDeadBody()](#getDeadBody())
   132. [getDeadBodys()](#getDeadBodys())
   133. [addCorpse(IsoDeadBody, boolean)](#addCorpse(zombie.iso.objects.IsoDeadBody,boolean))
   134. [getBrokenGlass()](#getBrokenGlass())
   135. [addBrokenGlass()](#addBrokenGlass())
   136. [getFire()](#getFire())
   137. [getHiddenStash()](#getHiddenStash())
   138. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   139. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   140. [debugPrintGridSquare()](#debugPrintGridSquare())
   141. [scoreAsWaypoint(int, int)](#scoreAsWaypoint(int,int))
   142. [InvalidateSpecialObjectPaths()](#InvalidateSpecialObjectPaths())
   143. [isSolid()](#isSolid())
   144. [isSolidTrans()](#isSolidTrans())
   145. [isFree(boolean)](#isFree(boolean))
   146. [isFreeOrMidair(boolean)](#isFreeOrMidair(boolean))
   147. [isFreeOrMidair(boolean, boolean)](#isFreeOrMidair(boolean,boolean))
   148. [connectedWithFloor()](#connectedWithFloor())
   149. [hasFloor(boolean)](#hasFloor(boolean))
   150. [hasFloor()](#hasFloor())
   151. [isNotBlocked(boolean)](#isNotBlocked(boolean))
   152. [getDoor(boolean)](#getDoor(boolean))
   153. [getIsoDoor()](#getIsoDoor())
   154. [getDoorTo(IsoGridSquare)](#getDoorTo(zombie.iso.IsoGridSquare))
   155. [getWindow(boolean)](#getWindow(boolean))
   156. [getWindow()](#getWindow())
   157. [getWindowTo(IsoGridSquare)](#getWindowTo(zombie.iso.IsoGridSquare))
   158. [isAdjacentToWindow()](#isAdjacentToWindow())
   159. [isAdjacentToHoppable()](#isAdjacentToHoppable())
   160. [getThumpableWindow(boolean)](#getThumpableWindow(boolean))
   161. [getWindowThumpableTo(IsoGridSquare)](#getWindowThumpableTo(zombie.iso.IsoGridSquare))
   162. [getThumpable(boolean)](#getThumpable(boolean))
   163. [getHoppableThumpable(boolean)](#getHoppableThumpable(boolean))
   164. [getHoppableThumpableTo(IsoGridSquare)](#getHoppableThumpableTo(zombie.iso.IsoGridSquare))
   165. [getWallHoppable(boolean)](#getWallHoppable(boolean))
   166. [getWallHoppableTo(IsoGridSquare)](#getWallHoppableTo(zombie.iso.IsoGridSquare))
   167. [getBedTo(IsoGridSquare)](#getBedTo(zombie.iso.IsoGridSquare))
   168. [getWindowFrame(boolean)](#getWindowFrame(boolean))
   169. [getWindowFrameTo(IsoGridSquare)](#getWindowFrameTo(zombie.iso.IsoGridSquare))
   170. [hasWindowFrame()](#hasWindowFrame())
   171. [hasWindowOrWindowFrame()](#hasWindowOrWindowFrame())
   172. [getSpecialWall(boolean)](#getSpecialWall(boolean))
   173. [getSheetRope()](#getSheetRope())
   174. [damageSpriteSheetRopeFromBottom(IsoPlayer, boolean)](#damageSpriteSheetRopeFromBottom(zombie.characters.IsoPlayer,boolean))
   175. [removeSheetRopeFromBottom(IsoPlayer, boolean)](#removeSheetRopeFromBottom(zombie.characters.IsoPlayer,boolean))
   176. [getSpecialSolid()](#getSpecialSolid())
   177. [testCollideSpecialObjects(IsoGridSquare)](#testCollideSpecialObjects(zombie.iso.IsoGridSquare))
   178. [getDoorFrameTo(IsoGridSquare)](#getDoorFrameTo(zombie.iso.IsoGridSquare))
   179. [getSquaresForThread(ArrayDeque, int)](#getSquaresForThread(java.util.ArrayDeque,int))
   180. [getNew(IsoCell, SliceY, int, int, int)](#getNew(zombie.iso.IsoCell,zombie.iso.SliceY,int,int,int))
   181. [getNew(ArrayDeque, IsoCell, SliceY, int, int, int)](#getNew(java.util.ArrayDeque,zombie.iso.IsoCell,zombie.iso.SliceY,int,int,int))
   182. [getHashCodeObjects()](#getHashCodeObjects())
   183. [getHashCodeObjectsInt()](#getHashCodeObjectsInt())
   184. [recalcHashCodeObjects()](#recalcHashCodeObjects())
   185. [hashCodeNoOverride()](#hashCodeNoOverride())
   186. [getTileInDirection(IsoDirections)](#getTileInDirection(zombie.iso.IsoDirections))
   187. [getWall()](#getWall())
   188. [getThumpableWall(boolean)](#getThumpableWall(boolean))
   189. [getHoppableWall(boolean)](#getHoppableWall(boolean))
   190. [getThumpableWallOrHoppable(boolean)](#getThumpableWallOrHoppable(boolean))
   191. [getWallFull()](#getWallFull())
   192. [hasNonHoppableWall(boolean)](#hasNonHoppableWall(boolean))
   193. [isPlayerAbleToHopWallTo(IsoDirections, IsoGridSquare)](#isPlayerAbleToHopWallTo(zombie.iso.IsoDirections,zombie.iso.IsoGridSquare))
   194. [getWallExcludingList(boolean, ArrayList)](#getWallExcludingList(boolean,java.util.ArrayList))
   195. [getWallExcludingObject(boolean, IsoObject)](#getWallExcludingObject(boolean,zombie.iso.IsoObject))
   196. [getWall(boolean)](#getWall(boolean))
   197. [getWallSE()](#getWallSE())
   198. [getWallNW()](#getWallNW())
   199. [getGarageDoor(boolean)](#getGarageDoor(boolean))
   200. [getFloor()](#getFloor())
   201. [getPlayerBuiltFloor()](#getPlayerBuiltFloor())
   202. [getWaterObject()](#getWaterObject())
   203. [interpolateLight(ColorInfo, float, float)](#interpolateLight(zombie.core.textures.ColorInfo,float,float))
   204. [EnsureSurroundNotNull()](#EnsureSurroundNotNull())
   205. [setSquareChanged()](#setSquareChanged())
   206. [addFloor(String)](#addFloor(java.lang.String))
   207. [addUndergroundBlock(String)](#addUndergroundBlock(java.lang.String))
   208. [isUndergroundBlock()](#isUndergroundBlock())
   209. [AddStairs(boolean, int, String, String, KahluaTable)](#AddStairs(boolean,int,java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   210. [ReCalculateAll(IsoGridSquare)](#ReCalculateAll(zombie.iso.IsoGridSquare))
   211. [ReCalculateAll(IsoGridSquare, IsoGridSquare.GetSquare)](#ReCalculateAll(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   212. [ReCalculateAll(boolean, IsoGridSquare, IsoGridSquare.GetSquare)](#ReCalculateAll(boolean,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   213. [ReCalculateMineOnly(IsoGridSquare)](#ReCalculateMineOnly(zombie.iso.IsoGridSquare))
   214. [getOpenAir()](#getOpenAir())
   215. [RecalcAllWithNeighbours(boolean)](#RecalcAllWithNeighbours(boolean))
   216. [RecalcAllWithNeighbours(boolean, IsoGridSquare.GetSquare)](#RecalcAllWithNeighbours(boolean,zombie.iso.IsoGridSquare.GetSquare))
   217. [RecalcAllWithNeighboursMineOnly()](#RecalcAllWithNeighboursMineOnly())
   218. [IsWindow(int, int, int)](#IsWindow(int,int,int))
   219. [RemoveAllWith(IsoFlagType)](#RemoveAllWith(zombie.iso.SpriteDetails.IsoFlagType))
   220. [hasSupport()](#hasSupport())
   221. [getID()](#getID())
   222. [setID(int)](#setID(int))
   223. [savematrix(boolean[][][], byte[], int)](#savematrix(boolean%5B%5D%5B%5D%5B%5D,byte%5B%5D,int))
   224. [loadmatrix(boolean[][][], byte[], int)](#loadmatrix(boolean%5B%5D%5B%5D%5B%5D,byte%5B%5D,int))
   225. [savematrix(boolean[][][], ByteBuffer)](#savematrix(boolean%5B%5D%5B%5D%5B%5D,java.nio.ByteBuffer))
   226. [loadmatrix(boolean[][][], ByteBuffer)](#loadmatrix(boolean%5B%5D%5B%5D%5B%5D,java.nio.ByteBuffer))
   227. [DirtySlice()](#DirtySlice())
   228. [setHourSeenToCurrent()](#setHourSeenToCurrent())
   229. [splatBlood(int, float)](#splatBlood(int,float))
   230. [haveBlood()](#haveBlood())
   231. [haveBloodWall()](#haveBloodWall())
   232. [haveBloodFloor()](#haveBloodFloor())
   233. [haveGrime()](#haveGrime())
   234. [haveGrimeWall()](#haveGrimeWall())
   235. [haveGrimeFloor()](#haveGrimeFloor())
   236. [haveGraffiti()](#haveGraffiti())
   237. [getGraffitiObject()](#getGraffitiObject())
   238. [haveStains()](#haveStains())
   239. [removeGrime()](#removeGrime())
   240. [removeGraffiti()](#removeGraffiti())
   241. [removeBlood(boolean, boolean)](#removeBlood(boolean,boolean))
   242. [DoSplat(String, boolean, IsoFlagType, float, float, float)](#DoSplat(java.lang.String,boolean,zombie.iso.SpriteDetails.IsoFlagType,float,float,float))
   243. [ClearTileObjects()](#ClearTileObjects())
   244. [ClearTileObjectsExceptFloor()](#ClearTileObjectsExceptFloor())
   245. [RemoveTileObject(IsoObject)](#RemoveTileObject(zombie.iso.IsoObject))
   246. [RemoveTileObject(IsoObject, boolean)](#RemoveTileObject(zombie.iso.IsoObject,boolean))
   247. [RemoveTileObjectErosionNoRecalc(IsoObject)](#RemoveTileObjectErosionNoRecalc(zombie.iso.IsoObject))
   248. [AddSpecialObject(IsoObject)](#AddSpecialObject(zombie.iso.IsoObject))
   249. [AddSpecialObject(IsoObject, int)](#AddSpecialObject(zombie.iso.IsoObject,int))
   250. [AddTileObject(IsoObject)](#AddTileObject(zombie.iso.IsoObject))
   251. [AddTileObject(IsoObject, int)](#AddTileObject(zombie.iso.IsoObject,int))
   252. [placeWallAndDoorCheck(IsoObject, int)](#placeWallAndDoorCheck(zombie.iso.IsoObject,int))
   253. [transmitAddObjectToSquare(IsoObject, int)](#transmitAddObjectToSquare(zombie.iso.IsoObject,int))
   254. [transmitRemoveItemFromSquare(IsoObject)](#transmitRemoveItemFromSquare(zombie.iso.IsoObject))
   255. [transmitRemoveItemFromSquare(IsoObject, boolean)](#transmitRemoveItemFromSquare(zombie.iso.IsoObject,boolean))
   256. [transmitRemoveItemFromSquareOnClients(IsoObject)](#transmitRemoveItemFromSquareOnClients(zombie.iso.IsoObject))
   257. [transmitModdata()](#transmitModdata())
   258. [SpawnWorldInventoryItem(String, float, float, float, int)](#SpawnWorldInventoryItem(java.lang.String,float,float,float,int))
   259. [SpawnWorldInventoryItem(String, float, float, float)](#SpawnWorldInventoryItem(java.lang.String,float,float,float))
   260. [SpawnWorldInventoryItem(String, float, float, float, boolean)](#SpawnWorldInventoryItem(java.lang.String,float,float,float,boolean))
   261. [AddWorldInventoryItem(String, float, float, float, int)](#AddWorldInventoryItem(java.lang.String,float,float,float,int))
   262. [AddWorldInventoryItem(ItemKey, float, float, float)](#AddWorldInventoryItem(zombie.scripting.objects.ItemKey,float,float,float))
   263. [AddWorldInventoryItem(String, float, float, float)](#AddWorldInventoryItem(java.lang.String,float,float,float))
   264. [AddWorldInventoryItem(ItemKey, float, float, float, boolean)](#AddWorldInventoryItem(zombie.scripting.objects.ItemKey,float,float,float,boolean))
   265. [AddWorldInventoryItem(String, float, float, float, boolean)](#AddWorldInventoryItem(java.lang.String,float,float,float,boolean))
   266. [AddWorldInventoryItem(String, float, float, float, boolean, boolean)](#AddWorldInventoryItem(java.lang.String,float,float,float,boolean,boolean))
   267. [AddWorldInventoryItem(InventoryItem, float, float, float)](#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))
   268. [createAnimalCorpseFromItem(InventoryItem)](#createAnimalCorpseFromItem(zombie.inventory.InventoryItem))
   269. [SpawnWorldInventoryItem(InventoryItem, float, float, float, boolean)](#SpawnWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float,boolean))
   270. [AddWorldInventoryItem(InventoryItem, float, float, float, boolean)](#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float,boolean))
   271. [AddWorldInventoryItem(InventoryItem, float, float, float, boolean, boolean)](#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float,boolean,boolean))
   272. [tryAddCorpseToWorld(InventoryItem, float, float)](#tryAddCorpseToWorld(zombie.inventory.InventoryItem,float,float))
   273. [tryAddCorpseToWorld(InventoryItem, float, float, boolean)](#tryAddCorpseToWorld(zombie.inventory.InventoryItem,float,float,boolean))
   274. [restackSheetRope()](#restackSheetRope())
   275. [Burn()](#Burn())
   276. [Burn(boolean)](#Burn(boolean))
   277. [BurnWalls(boolean, boolean)](#BurnWalls(boolean,boolean))
   278. [BurnWallsTCOnly()](#BurnWallsTCOnly())
   279. [BurnTick()](#BurnTick())
   280. [CalculateCollide(IsoGridSquare, boolean, boolean, boolean)](#CalculateCollide(zombie.iso.IsoGridSquare,boolean,boolean,boolean))
   281. [CalculateCollide(IsoGridSquare, boolean, boolean, boolean, boolean)](#CalculateCollide(zombie.iso.IsoGridSquare,boolean,boolean,boolean,boolean))
   282. [CalculateCollide(IsoGridSquare, boolean, boolean, boolean, boolean, IsoGridSquare.GetSquare)](#CalculateCollide(zombie.iso.IsoGridSquare,boolean,boolean,boolean,boolean,zombie.iso.IsoGridSquare.GetSquare))
   283. [CalculateVisionBlocked(IsoGridSquare)](#CalculateVisionBlocked(zombie.iso.IsoGridSquare))
   284. [CalculateVisionBlocked(IsoGridSquare, IsoGridSquare.GetSquare)](#CalculateVisionBlocked(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   285. [FindFriend(IsoGameCharacter, int, Stack)](#FindFriend(zombie.characters.IsoGameCharacter,int,java.util.Stack))
   286. [FindEnemy(IsoGameCharacter, int, ArrayList, IsoGameCharacter, int)](#FindEnemy(zombie.characters.IsoGameCharacter,int,java.util.ArrayList,zombie.characters.IsoGameCharacter,int))
   287. [FindEnemy(IsoGameCharacter, int, ArrayList)](#FindEnemy(zombie.characters.IsoGameCharacter,int,java.util.ArrayList))
   288. [getX()](#getX())
   289. [getY()](#getY())
   290. [getZ()](#getZ())
   291. [getCenterX()](#getCenterX())
   292. [getCenterY()](#getCenterY())
   293. [RecalcProperties()](#RecalcProperties())
   294. [RecalcPropertiesIfNeeded()](#RecalcPropertiesIfNeeded())
   295. [ReCalculateCollide(IsoGridSquare)](#ReCalculateCollide(zombie.iso.IsoGridSquare))
   296. [ReCalculateCollide(IsoGridSquare, IsoGridSquare.GetSquare)](#ReCalculateCollide(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   297. [ReCalculatePathFind(IsoGridSquare)](#ReCalculatePathFind(zombie.iso.IsoGridSquare))
   298. [ReCalculatePathFind(IsoGridSquare, IsoGridSquare.GetSquare)](#ReCalculatePathFind(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   299. [ReCalculateVisionBlocked(IsoGridSquare)](#ReCalculateVisionBlocked(zombie.iso.IsoGridSquare))
   300. [ReCalculateVisionBlocked(IsoGridSquare, IsoGridSquare.GetSquare)](#ReCalculateVisionBlocked(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare.GetSquare))
   301. [testCollideSpecialObjects(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#testCollideSpecialObjects(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   302. [testCollideAdjacent(IsoMovingObject, int, int, int)](#testCollideAdjacent(zombie.iso.IsoMovingObject,int,int,int))
   303. [testCollideAdjacentAdvanced(int, int, int, boolean)](#testCollideAdjacentAdvanced(int,int,int,boolean))
   304. [setCollisionMode()](#setCollisionMode())
   305. [testPathFindAdjacent(IsoMovingObject, int, int, int)](#testPathFindAdjacent(zombie.iso.IsoMovingObject,int,int,int))
   306. [testPathFindAdjacent(IsoMovingObject, int, int, int, IsoGridSquare.GetSquare)](#testPathFindAdjacent(zombie.iso.IsoMovingObject,int,int,int,zombie.iso.IsoGridSquare.GetSquare))
   307. [testVisionAdjacent(int, int, int, boolean, boolean)](#testVisionAdjacent(int,int,int,boolean,boolean))
   308. [TreatAsSolidFloor()](#TreatAsSolidFloor())
   309. [AddSpecialTileObject(IsoObject)](#AddSpecialTileObject(zombie.iso.IsoObject))
   310. [renderCharacters(int, boolean, boolean)](#renderCharacters(int,boolean,boolean))
   311. [renderDeferredCharacters(int)](#renderDeferredCharacters(int))
   312. [switchLight(boolean)](#switchLight(boolean))
   313. [removeGlassAttachments(IsoWindow)](#removeGlassAttachments(zombie.iso.objects.IsoWindow))
   314. [IsOnScreen()](#IsOnScreen())
   315. [IsOnScreen(boolean)](#IsOnScreen(boolean))
   316. [initWaterSplashCache()](#initWaterSplashCache())
   317. [startWaterSplash(boolean, float, float)](#startWaterSplash(boolean,float,float))
   318. [startWaterSplash(boolean)](#startWaterSplash(boolean))
   319. [shouldRenderFishSplash(int)](#shouldRenderFishSplash(int))
   320. [getLightInfo(int)](#getLightInfo(int))
   321. [cacheLightInfo()](#cacheLightInfo())
   322. [setLightInfoServerGUIOnly(ColorInfo)](#setLightInfoServerGUIOnly(zombie.core.textures.ColorInfo))
   323. [renderFloor(Shader)](#renderFloor(zombie.core.opengl.Shader))
   324. [renderFloorInternal(Shader)](#renderFloorInternal(zombie.core.opengl.Shader))
   325. [renderRainSplash(int, ColorInfo)](#renderRainSplash(int,zombie.core.textures.ColorInfo))
   326. [renderRainSplash(int, ColorInfo, float, boolean)](#renderRainSplash(int,zombie.core.textures.ColorInfo,float,boolean))
   327. [renderFishSplash(int, ColorInfo)](#renderFishSplash(int,zombie.core.textures.ColorInfo))
   328. [isSpriteOnSouthOrEastWall(IsoObject)](#isSpriteOnSouthOrEastWall(zombie.iso.IsoObject))
   329. [RenderOpenDoorOnly()](#RenderOpenDoorOnly())
   330. [RenderMinusFloorFxMask(int, boolean, boolean)](#RenderMinusFloorFxMask(int,boolean,boolean))
   331. [isWindowOrWindowFrame(IsoObject, boolean)](#isWindowOrWindowFrame(zombie.iso.IsoObject,boolean))
   332. [renderMinusFloor(int, boolean, boolean, int, int, int, int, int, Shader)](#renderMinusFloor(int,boolean,boolean,int,int,int,int,int,zombie.core.opengl.Shader))
   333. [RereouteWallMaskTo(IsoObject)](#RereouteWallMaskTo(zombie.iso.IsoObject))
   334. [setBlockedGridPointers(IsoGridSquare.GetSquare)](#setBlockedGridPointers(zombie.iso.IsoGridSquare.GetSquare))
   335. [getContainerItem(String)](#getContainerItem(java.lang.String))
   336. [StartFire()](#StartFire())
   337. [getHourLastSeen()](#getHourLastSeen())
   338. [getHoursSinceLastSeen()](#getHoursSinceLastSeen())
   339. [CalcVisibility(int, IsoGameCharacter, VisibilityData)](#CalcVisibility(int,zombie.characters.IsoGameCharacter,zombie.characters.VisibilityData))
   340. [DoDiagnalCheck(int, int, int, boolean)](#DoDiagnalCheck(int,int,int,boolean))
   341. [HasNoCharacters()](#HasNoCharacters())
   342. [getZombie()](#getZombie())
   343. [getPlayer()](#getPlayer())
   344. [getDarkStep()](#getDarkStep())
   345. [setDarkStep(float)](#setDarkStep(float))
   346. [getRecalcLightTime()](#getRecalcLightTime())
   347. [setRecalcLightTime(float)](#setRecalcLightTime(float))
   348. [getLightcache()](#getLightcache())
   349. [setLightcache(int)](#setLightcache(int))
   350. [isCouldSee(int)](#isCouldSee(int))
   351. [setCouldSee(int, boolean)](#setCouldSee(int,boolean))
   352. [isCanSee(int)](#isCanSee(int))
   353. [setCanSee(int, boolean)](#setCanSee(int,boolean))
   354. [getCell()](#getCell())
   355. [getE()](#getE())
   356. [setE(IsoGridSquare)](#setE(zombie.iso.IsoGridSquare))
   357. [getLightInfluenceB()](#getLightInfluenceB())
   358. [setLightInfluenceB(ArrayList)](#setLightInfluenceB(java.util.ArrayList))
   359. [getLightInfluenceG()](#getLightInfluenceG())
   360. [setLightInfluenceG(ArrayList)](#setLightInfluenceG(java.util.ArrayList))
   361. [getLightInfluenceR()](#getLightInfluenceR())
   362. [setLightInfluenceR(ArrayList)](#setLightInfluenceR(java.util.ArrayList))
   363. [getStaticMovingObjects()](#getStaticMovingObjects())
   364. [getStaticMovingObjects(Class, Predicate)](#getStaticMovingObjects(java.lang.Class,java.util.function.Predicate))
   365. [getStaticMovingObjectsInNearbySquares(Class, BiPredicate, Predicate)](#getStaticMovingObjectsInNearbySquares(java.lang.Class,java.util.function.BiPredicate,java.util.function.Predicate))
   366. [visitStaticMovingObjects(Class, Param, Predicate, BiConsumer)](#visitStaticMovingObjects(java.lang.Class,Param,java.util.function.Predicate,java.util.function.BiConsumer))
   367. [visitStaticMovingObjectsInNearbySquares(Class, Param, BiPredicate, Predicate, BiConsumer)](#visitStaticMovingObjectsInNearbySquares(java.lang.Class,Param,java.util.function.BiPredicate,java.util.function.Predicate,java.util.function.BiConsumer))
   368. [getMovingObjects()](#getMovingObjects())
   369. [visitNearbySquares(Param, BiPredicate, BiConsumer)](#visitNearbySquares(Param,java.util.function.BiPredicate,java.util.function.BiConsumer))
   370. [getN()](#getN())
   371. [setN(IsoGridSquare)](#setN(zombie.iso.IsoGridSquare))
   372. [getObjects()](#getObjects())
   373. [getProperties()](#getProperties())
   374. [getRoom()](#getRoom())
   375. [setRoom(IsoRoom)](#setRoom(zombie.iso.areas.IsoRoom))
   376. [getRoomDef()](#getRoomDef())
   377. [getBuilding()](#getBuilding())
   378. [getBuildingDef()](#getBuildingDef())
   379. [getS()](#getS())
   380. [setS(IsoGridSquare)](#setS(zombie.iso.IsoGridSquare))
   381. [getSpecialObjects()](#getSpecialObjects())
   382. [getW()](#getW())
   383. [setW(IsoGridSquare)](#setW(zombie.iso.IsoGridSquare))
   384. [getLampostTotalR()](#getLampostTotalR())
   385. [setLampostTotalR(float)](#setLampostTotalR(float))
   386. [getLampostTotalG()](#getLampostTotalG())
   387. [setLampostTotalG(float)](#setLampostTotalG(float))
   388. [getLampostTotalB()](#getLampostTotalB())
   389. [setLampostTotalB(float)](#setLampostTotalB(float))
   390. [isSeen(int)](#isSeen(int))
   391. [setIsSeen(int, boolean)](#setIsSeen(int,boolean))
   392. [getDarkMulti(int)](#getDarkMulti(int))
   393. [setDarkMulti(int, float)](#setDarkMulti(int,float))
   394. [getTargetDarkMulti(int)](#getTargetDarkMulti(int))
   395. [setTargetDarkMulti(int, float)](#setTargetDarkMulti(int,float))
   396. [setX(int)](#setX(int))
   397. [setY(int)](#setY(int))
   398. [setZ(int)](#setZ(int))
   399. [getDeferedCharacters()](#getDeferedCharacters())
   400. [addDeferredCharacter(IsoGameCharacter)](#addDeferredCharacter(zombie.characters.IsoGameCharacter))
   401. [isCacheIsFree()](#isCacheIsFree())
   402. [setCacheIsFree(boolean)](#setCacheIsFree(boolean))
   403. [isCachedIsFree()](#isCachedIsFree())
   404. [setCachedIsFree(boolean)](#setCachedIsFree(boolean))
   405. [isbDoSlowPathfinding()](#isbDoSlowPathfinding())
   406. [setbDoSlowPathfinding(boolean)](#setbDoSlowPathfinding(boolean))
   407. [isSolidFloorCached()](#isSolidFloorCached())
   408. [setSolidFloorCached(boolean)](#setSolidFloorCached(boolean))
   409. [isSolidFloor()](#isSolidFloor())
   410. [setSolidFloor(boolean)](#setSolidFloor(boolean))
   411. [getDefColorInfo()](#getDefColorInfo())
   412. [isOutside()](#isOutside())
   413. [HasPushable()](#HasPushable())
   414. [setRoomID(long)](#setRoomID(long))
   415. [getRoomID()](#getRoomID())
   416. [getRoomIDString()](#getRoomIDString())
   417. [getCanSee(int)](#getCanSee(int))
   418. [getSeen(int)](#getSeen(int))
   419. [getChunk()](#getChunk())
   420. [getDoorOrWindow(boolean)](#getDoorOrWindow(boolean))
   421. [getDoorOrWindowOrWindowFrame(IsoDirections, boolean)](#getDoorOrWindowOrWindowFrame(zombie.iso.IsoDirections,boolean))
   422. [getOpenDoor(IsoDirections)](#getOpenDoor(zombie.iso.IsoDirections))
   423. [removeWorldObject(IsoWorldInventoryObject)](#removeWorldObject(zombie.iso.objects.IsoWorldInventoryObject))
   424. [removeAllWorldObjects()](#removeAllWorldObjects())
   425. [getWorldObjects()](#getWorldObjects())
   426. [getNextNonItemObjectIndex(int)](#getNextNonItemObjectIndex(int))
   427. [getModData()](#getModData())
   428. [hasModData()](#hasModData())
   429. [setVertLight(int, int, int)](#setVertLight(int,int,int))
   430. [getVertLight(int, int)](#getVertLight(int,int))
   431. [setRainDrop(IsoRaindrop)](#setRainDrop(zombie.iso.objects.IsoRaindrop))
   432. [getRainDrop()](#getRainDrop())
   433. [setRainSplash(IsoRainSplash)](#setRainSplash(zombie.iso.objects.IsoRainSplash))
   434. [getRainSplash()](#getRainSplash())
   435. [getZone()](#getZone())
   436. [getZoneType()](#getZoneType())
   437. [isOverlayDone()](#isOverlayDone())
   438. [setOverlayDone(boolean)](#setOverlayDone(boolean))
   439. [getErosionData()](#getErosionData())
   440. [disableErosion()](#disableErosion())
   441. [removeErosionObject(String)](#removeErosionObject(java.lang.String))
   442. [syncIsoTrap(HandWeapon, IsoPlayer)](#syncIsoTrap(zombie.inventory.types.HandWeapon,zombie.characters.IsoPlayer))
   443. [getTrapPositionX()](#getTrapPositionX())
   444. [setTrapPositionX(int)](#setTrapPositionX(int))
   445. [getTrapPositionY()](#getTrapPositionY())
   446. [setTrapPositionY(int)](#setTrapPositionY(int))
   447. [getTrapPositionZ()](#getTrapPositionZ())
   448. [setTrapPositionZ(int)](#setTrapPositionZ(int))
   449. [haveElectricity()](#haveElectricity())
   450. [setHaveElectricity(boolean)](#setHaveElectricity(boolean))
   451. [getGenerator()](#getGenerator())
   452. [stopFire()](#stopFire())
   453. [transmitStopFire()](#transmitStopFire())
   454. [playSound(String)](#playSound(java.lang.String))
   455. [playSoundLocal(String)](#playSoundLocal(java.lang.String))
   456. [playSound(String, boolean)](#playSound(java.lang.String,boolean))
   457. [FixStackableObjects()](#FixStackableObjects())
   458. [setTableTopObjectDirection(IsoObject, IsoObject, PropertyContainer)](#setTableTopObjectDirection(zombie.iso.IsoObject,zombie.iso.IsoObject,zombie.core.properties.PropertyContainer))
   459. [fixPlacedItemRenderOffsets()](#fixPlacedItemRenderOffsets())
   460. [getVehicleContainer()](#getVehicleContainer())
   461. [isVehicleIntersecting()](#isVehicleIntersecting())
   462. [isVehicleIntersectingCrops()](#isVehicleIntersectingCrops())
   463. [getDeviceData()](#getDeviceData())
   464. [checkForIntersectingCrops(BaseVehicle)](#checkForIntersectingCrops(zombie.vehicles.BaseVehicle))
   465. [getCompost()](#getCompost())
   466. [getAllContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getAllContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   467. [getAllContainersFromAdjacentSquare(IsoDirections, T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getAllContainersFromAdjacentSquare(zombie.iso.IsoDirections,T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   468. [getObjectContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getObjectContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   469. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   470. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   471. [setIsoWorldRegion(IsoWorldRegion)](#setIsoWorldRegion(zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   472. [getIsoWorldRegion()](#getIsoWorldRegion())
   473. [ResetIsoWorldRegion()](#ResetIsoWorldRegion())
   474. [isInARoom()](#isInARoom())
   475. [getRoomSize()](#getRoomSize())
   476. [getWallType()](#getWallType())
   477. [getPuddlesDir()](#getPuddlesDir())
   478. [haveFire()](#haveFire())
   479. [getRoofHideBuilding()](#getRoofHideBuilding())
   480. [getAdjacentSquare(IsoDirections)](#getAdjacentSquare(zombie.iso.IsoDirections))
   481. [setAdjacentSquare(IsoDirections, IsoGridSquare)](#setAdjacentSquare(zombie.iso.IsoDirections,zombie.iso.IsoGridSquare))
   482. [getSurroundingSquares()](#getSurroundingSquares())
   483. [getSquareAbove()](#getSquareAbove())
   484. [getAdjacentPathSquare(IsoDirections)](#getAdjacentPathSquare(zombie.iso.IsoDirections))
   485. [getApparentZ(float, float)](#getApparentZ(float,float))
   486. [getStairsDirection()](#getStairsDirection())
   487. [getStairsHeightMax()](#getStairsHeightMax())
   488. [getStairsHeightMin()](#getStairsHeightMin())
   489. [getStairsHeight(IsoDirections)](#getStairsHeight(zombie.iso.IsoDirections))
   490. [isStairsEdgeBlocked(IsoDirections)](#isStairsEdgeBlocked(zombie.iso.IsoDirections))
   491. [hasSlopedSurface()](#hasSlopedSurface())
   492. [getSlopedSurfaceDirection()](#getSlopedSurfaceDirection())
   493. [hasIdenticalSlopedSurface(IsoGridSquare)](#hasIdenticalSlopedSurface(zombie.iso.IsoGridSquare))
   494. [getSlopedSurfaceHeightMin()](#getSlopedSurfaceHeightMin())
   495. [getSlopedSurfaceHeightMax()](#getSlopedSurfaceHeightMax())
   496. [getSlopedSurfaceHeight(float, float)](#getSlopedSurfaceHeight(float,float))
   497. [getSlopedSurfaceHeight(IsoDirections)](#getSlopedSurfaceHeight(zombie.iso.IsoDirections))
   498. [isSlopedSurfaceEdgeBlocked(IsoDirections)](#isSlopedSurfaceEdgeBlocked(zombie.iso.IsoDirections))
   499. [hasSlopedSurfaceToLevelAbove(IsoDirections)](#hasSlopedSurfaceToLevelAbove(zombie.iso.IsoDirections))
   500. [getTotalWeightOfItemsOnFloor()](#getTotalWeightOfItemsOnFloor())
   501. [getCollideMatrix(int, int, int)](#getCollideMatrix(int,int,int))
   502. [getPathMatrix(int, int, int)](#getPathMatrix(int,int,int))
   503. [getVisionMatrix(int, int, int)](#getVisionMatrix(int,int,int))
   504. [checkRoomSeen(int)](#checkRoomSeen(int))
   505. [hasFlies()](#hasFlies())
   506. [setHasFlies(boolean)](#setHasFlies(boolean))
   507. [getLightLevel(int)](#getLightLevel(int))
   508. [getLightLevel2()](#getLightLevel2())
   509. [getAnimals(ArrayList)](#getAnimals(java.util.ArrayList))
   510. [getAnimals()](#getAnimals())
   511. [checkHaveGrass()](#checkHaveGrass())
   512. [checkHaveDung()](#checkHaveDung())
   513. [removeAllDung()](#removeAllDung())
   514. [removeGrass()](#removeGrass())
   515. [getGrassRegrowthZone()](#getGrassRegrowthZone())
   516. [getZombieCount()](#getZombieCount())
   517. [getSquareRegion()](#getSquareRegion())
   518. [containsVegetation()](#containsVegetation())
   519. [getAnimalTrack()](#getAnimalTrack())
   520. [hasTrashReceptacle()](#hasTrashReceptacle())
   521. [hasTrash()](#hasTrash())
   522. [getTrashReceptacle()](#getTrashReceptacle())
   523. [isExtraFreeSquare()](#isExtraFreeSquare())
   524. [getRandomAdjacentFreeSameRoom()](#getRandomAdjacentFreeSameRoom())
   525. [getZombiesType()](#getZombiesType())
   526. [getLootZone()](#getLootZone())
   527. [addTileObject(String)](#addTileObject(java.lang.String))
   528. [hasSand()](#hasSand())
   529. [hasDirt()](#hasDirt())
   530. [hasNaturalFloor()](#hasNaturalFloor())
   531. [dirtStamp()](#dirtStamp())
   532. [getRandomAdjacent()](#getRandomAdjacent())
   533. [isAdjacentTo(IsoGridSquare)](#isAdjacentTo(zombie.iso.IsoGridSquare))
   534. [hasFireObject()](#hasFireObject())
   535. [hasAdjacentFireObject()](#hasAdjacentFireObject())
   536. [addGrindstone()](#addGrindstone())
   537. [addFreezer()](#addFreezer())
   538. [addFloodLights()](#addFloodLights())
   539. [addSpinningWheel()](#addSpinningWheel())
   540. [addLoom()](#addLoom())
   541. [addHandPress()](#addHandPress())
   542. [addWorkstationEntity(String, String)](#addWorkstationEntity(java.lang.String,java.lang.String))
   543. [addWorkstationEntity(GameEntityScript, String)](#addWorkstationEntity(zombie.scripting.entity.GameEntityScript,java.lang.String))
   544. [addWorkstationEntity(IsoThumpable, GameEntityScript)](#addWorkstationEntity(zombie.iso.objects.IsoThumpable,zombie.scripting.entity.GameEntityScript))
   545. [isDoorSquare()](#isDoorSquare())
   546. [isWallSquare()](#isWallSquare())
   547. [isWallSquareNW()](#isWallSquareNW())
   548. [isFreeWallSquare()](#isFreeWallSquare())
   549. [isDoorOrWallSquare()](#isDoorOrWallSquare())
   550. [spawnRandomRuralWorkstation()](#spawnRandomRuralWorkstation())
   551. [spawnRandomWorkstation()](#spawnRandomWorkstation())
   552. [isRural()](#isRural())
   553. [isRuralExtraFussy()](#isRuralExtraFussy())
   554. [isFreeWallPair(IsoDirections, boolean)](#isFreeWallPair(zombie.iso.IsoDirections,boolean))
   555. [isGoodSquare()](#isGoodSquare())
   556. [isWaterSquare()](#isWaterSquare())
   557. [isGoodOutsideSquare()](#isGoodOutsideSquare())
   558. [addStump()](#addStump())
   559. [setBlendFunc()](#setBlendFunc())
   560. [invalidateRenderChunkLevel(long)](#invalidateRenderChunkLevel(long))
   561. [invalidateVispolyChunkLevel()](#invalidateVispolyChunkLevel())
   562. [getHutchTiles(IsoHutch)](#getHutchTiles(zombie.iso.objects.IsoHutch))
   563. [getHutch()](#getHutch())
   564. [getSquareZombiesType()](#getSquareZombiesType())
   565. [hasRoomDef()](#hasRoomDef())
   566. [spawnRandomGenerator()](#spawnRandomGenerator())
   567. [spawnRandomNewGenerator()](#spawnRandomNewGenerator())
   568. [hasGrave()](#hasGrave())
   569. [hasFarmingPlant()](#hasFarmingPlant())
   570. [getFarmingPlant()](#getFarmingPlant())
   571. [destroyFarmingPlant()](#destroyFarmingPlant())
   572. [hasLitCampfire()](#hasLitCampfire())
   573. [getCampfire()](#getCampfire())
   574. [putOutCampfire()](#putOutCampfire())
   575. [DoDiagnalCheck(IsoGridSquareCollisionData, int, int, int, boolean)](#DoDiagnalCheck(zombie.iso.IsoGridSquareCollisionData,int,int,int,boolean))
   576. [getFirstBlocking(IsoGridSquareCollisionData, int, int, int, boolean, boolean)](#getFirstBlocking(zombie.iso.IsoGridSquareCollisionData,int,int,int,boolean,boolean))
   577. [hasCutawayCapableWallNorth(IsoGridSquare)](#hasCutawayCapableWallNorth(zombie.iso.IsoGridSquare))
   578. [hasCutawayCapableWallWest(IsoGridSquare)](#hasCutawayCapableWallWest(zombie.iso.IsoGridSquare))
   579. [canSpawnVermin()](#canSpawnVermin())
   580. [isNoGas()](#isNoGas())
   581. [isNoPower()](#isNoPower())
   582. [isNoWater()](#isNoWater())
   583. [getButcherHook()](#getButcherHook())
   584. [isShop()](#isShop())
   585. [hasFireplace()](#hasFireplace())
   586. [addCorpse()](#addCorpse())
   587. [addCorpse(boolean)](#addCorpse(boolean))
   588. [createCorpse(boolean)](#createCorpse(boolean))
   589. [createCorpse(IsoZombie)](#createCorpse(zombie.characters.IsoZombie))
   590. [createCorpse(IsoZombie, boolean)](#createCorpse(zombie.characters.IsoZombie,boolean))
   591. [getBed()](#getBed())
   592. [getPuddleFloor()](#getPuddleFloor())
   593. [flagForHotSave()](#flagForHotSave())
   594. [hasGridPower()](#hasGridPower())
   595. [hasGridPower(int)](#hasGridPower(int))
   596. [isDerelict()](#isDerelict())
   597. [isUserDefinedRoom()](#isUserDefinedRoom())
   598. [isUserDefinedBuilding()](#isUserDefinedBuilding())
   599. [shouldNotSpawnActivatedRadiosOrTvs()](#shouldNotSpawnActivatedRadiosOrTvs())
   600. [hasFence()](#hasFence())
   601. [hasFenceInVicinity()](#hasFenceInVicinity())
   602. [hasFloorOverWater()](#hasFloorOverWater())
   603. [getRadius(int)](#getRadius(int))
   604. [getSquareBelow()](#getSquareBelow())
   605. [canStand()](#canStand())
   606. [hasAdjacentCanStandSquare()](#hasAdjacentCanStandSquare())
   607. [addAshes()](#addAshes())
   608. [isHorizontalNeighbor(int, int, int, int)](#isHorizontalNeighbor(int,int,int,int))
   609. [isVerticalNeighbor(int, int, int, int)](#isVerticalNeighbor(int,int,int,int))
   610. [isNorthFacingSequence(IsoObjectType, IsoObjectType)](#isNorthFacingSequence(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType))
   611. [isWestFacingSequence(IsoObjectType, IsoObjectType)](#isWestFacingSequence(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType))
   612. [hasAdjacentStairs(IsoGridSquare, IsoDirections, IsoObjectType)](#hasAdjacentStairs(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,zombie.iso.SpriteDetails.IsoObjectType))
   613. [hasConnectingBNStair(IsoObjectType, IsoObjectType, IsoGridSquare)](#hasConnectingBNStair(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.IsoGridSquare))
   614. [hasConnectingBWStair(IsoObjectType, IsoObjectType, IsoGridSquare)](#hasConnectingBWStair(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.IsoGridSquare))
   615. [hasConnectingTNStair(IsoObjectType, IsoObjectType, IsoGridSquare, IsoGridSquare)](#hasConnectingTNStair(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   616. [hasConnectingTWStair(IsoObjectType, IsoObjectType, IsoGridSquare, IsoGridSquare)](#hasConnectingTWStair(zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.SpriteDetails.IsoObjectType,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoGridSquare

---

public final class IsoGridSquare
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `IsoGridSquare.CircleStencilShader`

  `static final class`

  `IsoGridSquare.CutawayNoDepthShader`

  `static interface`

  `IsoGridSquare.GetSquare`

  `static interface`

  `IsoGridSquare.ILighting`

  `static final class`

  `IsoGridSquare.Lighting`

  `static final class`

  `IsoGridSquare.NoCircleStencilShader`

  `static class`

  `IsoGridSquare.PuddlesDirection`

  `private static interface`

  `IsoGridSquare.RenderWallCallback`

  `static final class`

  `IsoGridSquare.ResultLight`

  `private static final class`

  `IsoGridSquare.s_performance`

  `private static final class`

  `IsoGridSquare.WaterSplashData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final boolean`

  `ADD_UNDERGROUND_BLOCKS`

  `BuildingDef`

  `associatedBuilding`

  `private zombie.iso.worldgen.biomes.IBiome`

  `biome`

  `private static final Color`

  `bl`

  `private static final ColorInfo`

  `blackColorInfo`

  `static float`

  `bmod`

  `private static final Color`

  `br`

  `private boolean`

  `burntOut`

  `private boolean`

  `cachedIsFree`

  `private int`

  `cachedScreenValue`

  `float`

  `cachedScreenX`

  `float`

  `cachedScreenY`

  `private boolean`

  `cacheIsFree`

  `static final IsoGridSquare.GetSquare`

  `cellGetSquare`

  `static final ArrayList<IsoGridSquare>`

  `choices`

  `IsoChunk`

  `chunk`

  `static boolean`

  `circleStencil`

  `private static int`

  `col`

  `private static int`

  `coll`

  `private static int`

  `coll2`

  `int`

  `collideMatrix`

  `private static int`

  `colr`

  `private static int`

  `colr2`

  `private static int`

  `colu`

  `private static int`

  `colu2`

  `private static final Comparator<IsoMovingObject>`

  `comp`

  `private static final float`

  `CUTAWAY_OUTLINE_ALPHA`

  `private static final int`

  `cutawayFenceXOffset`

  `private static final int`

  `cutawayLogWallXOffset`

  `private static final int`

  `cutawayMedicalCurtainWXOffset`

  `private static final int`

  `cutawayNWHeight`

  `private static final int`

  `cutawayNWWidth`

  `private static final int`

  `cutawayNXCutE`

  `private static final int`

  `cutawayNXCutW`

  `private static final int`

  `cutawayNXFullyCut`

  `private static final int`

  `cutawayNXUncut`

  `private static final int`

  `cutawayRoof17XOffset`

  `private static final int`

  `cutawayRoof28XOffset`

  `private static final int`

  `cutawayRoof41XOffset`

  `private static final int`

  `cutawayRoof4XOffset`

  `private static final int`

  `cutawaySEHeight`

  `private static final int`

  `cutawaySEWidth`

  `private static final int`

  `cutawaySEXCut`

  `private static final int`

  `cutawaySEXUncut`

  `private static final int`

  `cutawaySpiffoWindowXOffset`

  `private static final int`

  `cutawayTentWallXOffset`

  `private static final int`

  `cutawayWXCutN`

  `private static final int`

  `cutawayWXCutS`

  `private static final int`

  `cutawayWXFullyCut`

  `private static final int`

  `cutawayWXUncut`

  `private static final int`

  `cutawayY`

  `IsoGridSquare`

  `d`

  `private static float`

  `darkStep`

  `private static final ColorInfo`

  `defColorInfo`

  `private final ArrayList<IsoGameCharacter>`

  `deferedCharacters`

  `private int`

  `deferredCharacterTick`

  `private static final IsoDirections[]`

  `DIRECTIONS`

  `private static final float`

  `doorWindowCutawayLightMin`

  `private static boolean`

  `doSlowPathfinding`

  `IsoGridSquare`

  `e`

  `private zombie.erosion.ErosionData.Square`

  `erosion`

  `private static final Color`

  `finalCol`

  `int`

  `FIRE_IMMUNE_THRESHOLD`

  `boolean`

  `flattenGrassEtc`

  `static final String`

  `FLOORS_BURNT_SPRITE_PREFIX`

  `static float`

  `gmod`

  `static int`

  `gridSquareCacheEmptyTimer`

  `private boolean`

  `hasFlies`

  `long`

  `hashCodeObjects`

  `private boolean`

  `hasSetIsoWorldRegion`

  `private boolean`

  `hasTree`

  `long`

  `hasTypes`

  `boolean`

  `haveRoof`

  `boolean`

  `haveSheetRope`

  `int`

  `hourLastSeen`

  `Integer`

  `id`

  `static int`

  `idMax`

  `static final ArrayList<String>`

  `ignoreBlockingSprites`

  `private static final Color`

  `interp1`

  `private static final Color`

  `interp2`

  `boolean`

  `isExteriorCache`

  `static final zombie.util.CappedConcurrentQueue<IsoGridSquare>`

  `isoGridSquareCache`

  `static boolean`

  `isOnScreenLast`

  `private zombie.iso.areas.isoregion.regions.IWorldRegion`

  `isoWorldRegion`

  `boolean`

  `isSolidFloorCache`

  `boolean`

  `isVegitationCache`

  `private static boolean`

  `isWaterSplashCacheInitialised`

  `private static IsoGridSquare`

  `lastLoaded`

  `private static int`

  `lightcache`

  `private ArrayList<Float>`

  `lightInfluenceB`

  `private ArrayList<Float>`

  `lightInfluenceG`

  `private ArrayList<Float>`

  `lightInfluenceR`

  `private final ColorInfo[]`

  `lightInfo`

  `private static final ColorInfo`

  `lightInfoTemp`

  `final IsoGridSquare.ILighting[]`

  `lighting`

  `int`

  `lightLevel`

  `static ArrayDeque<IsoGridSquare>`

  `loadGridSquareCache`

  `private final ArrayList<IsoMovingObject>`

  `movingObjects`

  `IsoGridSquare`

  `n`

  `private final IsoGridSquare[]`

  `nav`

  `IsoGridSquare`

  `ne`

  `IsoGridSquare`

  `nw`

  `protected final PZArrayList<IsoObject>`

  `objects`

  `int`

  `objectsSyncCount`

  `private zombie.iso.IsoGridOcclusionData`

  `occlusionDataCache`

  `private boolean`

  `overlayDone`

  `private static int`

  `path`

  `private static int`

  `pathdoor`

  `int`

  `pathMatrix`

  `static final byte`

  `PCF_NONE`

  `static final byte`

  `PCF_NORTH`

  `static final byte`

  `PCF_WEST`

  `private final long[]`

  `playerCutawayFlagLockUntilTimes`

  `private final byte[]`

  `playerCutawayFlags`

  `private final long[]`

  `playerIsDissolvedFlagLockUntilTimes`

  `private final boolean[]`

  `playerIsDissolvedFlags`

  `private final PropertyContainer`

  `properties`

  `boolean`

  `propertiesDirty`

  `private zombie.iso.IsoPuddlesGeometry`

  `puddles`

  `private float`

  `puddlesCacheLevel`

  `private float`

  `puddlesCacheSize`

  `private zombie.iso.objects.IsoRaindrop`

  `rainDrop`

  `private zombie.iso.objects.IsoRainSplash`

  `rainSplash`

  `private static final String[]`

  `rainsplashCache`

  `static float`

  `recalcLightTime`

  `static float`

  `rmod`

  `IsoBuilding`

  `roofHideBuilding`

  `IsoRoom`

  `room`

  `long`

  `roomId`

  `IsoGridSquare`

  `s`

  `IsoGridSquare`

  `se`

  `boolean`

  `solidFloor`

  `boolean`

  `solidFloorCached`

  `private final ArrayList<IsoObject>`

  `specialObjects`

  `private float`

  `splashFrame`

  `private int`

  `splashFrameNum`

  `private float`

  `splashX`

  `private float`

  `splashY`

  `private final ArrayList<IsoMovingObject>`

  `staticMovingObjects`

  `private static final int[]`

  `SURFACE_OFFSETS`

  `IsoGridSquare`

  `sw`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private final byte[]`

  `targetPlayerCutawayFlags`

  `private final boolean[]`

  `targetPlayerIsDissolvedFlags`

  `private static final Vector2`

  `tempo`

  `private static final Vector2`

  `tempo2`

  `private static final PZArrayList<IsoWorldInventoryObject>`

  `tempWorldInventoryObjects`

  `private static final ThreadLocal<ArrayList<Zone>>`

  `threadLocalZones`

  `private static final Color`

  `tl`

  `private static long`

  `torchTimer`

  `private static final Color`

  `tr`

  `private int`

  `trapPositionX`

  `private int`

  `trapPositionY`

  `private int`

  `trapPositionZ`

  `IsoGridSquare`

  `u`

  `static final boolean`

  `USE_WALL_SHADER`

  `static boolean`

  `useSlowCollision`

  `private static final long`

  `VisiFlagTimerPeriod_ms`

  `private static int`

  `vision`

  `int`

  `visionMatrix`

  `IsoGridSquare`

  `w`

  `static final int`

  `WALL_TYPE_E`

  `static final int`

  `WALL_TYPE_N`

  `static final int`

  `WALL_TYPE_S`

  `static final int`

  `WALL_TYPE_W`

  `private static boolean`

  `wallCutawayN`

  `private static boolean`

  `wallCutawayW`

  `private IsoWaterGeometry`

  `water`

  `private static final Texture[]`

  `waterSplashCache`

  `private final IsoGridSquare.WaterSplashData`

  `waterSplashData`

  `private final ArrayList<IsoWorldInventoryObject>`

  `worldObjects`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`

  `Zone`

  `zone`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoGridSquare(IsoCell cell,
  SliceY slice,
  int x,
  int y,
  int z)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAshes()`

  `IsoBrokenGlass`

  `addBrokenGlass()`

  `IsoDeadBody`

  `addCorpse()`

  `IsoDeadBody`

  `addCorpse(boolean isSkeleton)`

  `void`

  `addCorpse(IsoDeadBody body,
  boolean bRemote)`

  `void`

  `addDeferredCharacter(IsoGameCharacter chr)`

  `void`

  `addFloodLights()`

  `IsoObject`

  `addFloor(String sprite)`

  `void`

  `addFreezer()`

  `void`

  `addGrindstone()`

  `void`

  `addHandPress()`

  `void`

  `addLoom()`

  `void`

  `addPlayerCutawayFlag(int playerIndex,
  int flag,
  long currentTimeMillis)`

  `void`

  `AddSpecialObject(IsoObject obj)`

  `void`

  `AddSpecialObject(IsoObject obj,
  int index)`

  `void`

  `AddSpecialTileObject(IsoObject obj)`

  `void`

  `addSpinningWheel()`

  `IsoThumpable`

  `AddStairs(boolean north,
  int level,
  String sprite,
  String pillarSprite,
  se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `addStump()`

  `IsoObject`

  `addTileObject(String spriteName)`

  `void`

  `AddTileObject(IsoObject obj)`

  `void`

  `AddTileObject(IsoObject obj,
  int index)`

  `IsoObject`

  `addUndergroundBlock(String sprite)`

  `IsoThumpable`

  `addWorkstationEntity(String scriptString,
  String sprite)`

  `void`

  `addWorkstationEntity(IsoThumpable thumpable,
  GameEntityScript script)`

  `IsoThumpable`

  `addWorkstationEntity(GameEntityScript script,
  String sprite)`

  `InventoryItem`

  `AddWorldInventoryItem(String itemType,
  float x,
  float y,
  float height)`

  `InventoryItem`

  `AddWorldInventoryItem(String itemType,
  float x,
  float y,
  float height,
  boolean autoAge)`

  `InventoryItem`

  `AddWorldInventoryItem(String itemType,
  float x,
  float y,
  float height,
  boolean autoAge,
  boolean synchSpawn)`

  `void`

  `AddWorldInventoryItem(String itemType,
  float x,
  float y,
  float height,
  int nbr)`

  `InventoryItem`

  `AddWorldInventoryItem(InventoryItem item,
  float x,
  float y,
  float height)`

  `InventoryItem`

  `AddWorldInventoryItem(InventoryItem item,
  float x,
  float y,
  float height,
  boolean transmit)`

  `InventoryItem`

  `AddWorldInventoryItem(InventoryItem item,
  float x,
  float y,
  float height,
  boolean transmit,
  boolean synchSpawn)`

  `InventoryItem`

  `AddWorldInventoryItem(ItemKey itemKey,
  float x,
  float y,
  float height)`

  `InventoryItem`

  `AddWorldInventoryItem(ItemKey itemKey,
  float x,
  float y,
  float height,
  boolean autoAge)`

  `void`

  `Burn()`

  `void`

  `Burn(boolean explode)`

  `void`

  `BurnTick()`

  `void`

  `BurnWalls(boolean explode,
  boolean recursive)`

  `void`

  `BurnWallsTCOnly()`

  `void`

  `cacheLightInfo()`

  `boolean`

  `CalculateCollide(IsoGridSquare gridSquare,
  boolean bVision,
  boolean bPathfind,
  boolean bIgnoreSolidTrans)`

  `boolean`

  `CalculateCollide(IsoGridSquare gridSquare,
  boolean bVision,
  boolean bPathfind,
  boolean bIgnoreSolidTrans,
  boolean bIgnoreSolid)`

  `boolean`

  `CalculateCollide(IsoGridSquare gridSquare,
  boolean bVision,
  boolean bPathfind,
  boolean bIgnoreSolidTrans,
  boolean bIgnoreSolid,
  IsoGridSquare.GetSquare getter)`

  `private float`

  `calculateCutawayOutlineAlpha(int playerIndex,
  boolean north)`

  `boolean`

  `CalculateVisionBlocked(IsoGridSquare gridSquare)`

  `boolean`

  `CalculateVisionBlocked(IsoGridSquare gridSquare,
  IsoGridSquare.GetSquare getter)`

  `private boolean`

  `calculateWallAlphaAndCircleStencilCorner(IsoObject obj,
  int cutawaySelf,
  boolean bHasDoorN,
  boolean bHasDoorW,
  boolean bHasWindowN,
  boolean bHasWindowW,
  boolean circleStencil,
  int playerIndex,
  boolean isDoorN,
  boolean isDoorW,
  boolean isWindowN,
  boolean isWindowW)`

  `private boolean`

  `calculateWallAlphaAndCircleStencilEdge(IsoObject obj,
  boolean hasNoDoor,
  boolean hasNoWindow,
  boolean isCutaway,
  IsoFlagType transparentFlag,
  IsoFlagType transparentWindowFlag,
  IsoFlagType hoppableType,
  boolean circleStencil,
  int playerIndex,
  boolean isDoor,
  boolean isWindow)`

  `private void`

  `calculateWallAlphaCommon(IsoObject obj,
  boolean isCutaway,
  boolean bHasDoor,
  boolean bHasWindow,
  int playerIndex,
  boolean isDoor,
  boolean isWindow)`

  `void`

  `CalcVisibility(int playerIndex,
  IsoGameCharacter isoGameCharacter,
  zombie.characters.VisibilityData visibilityData)`

  `boolean`

  `canReachTo(IsoGridSquare other)`

  `boolean`

  `canSpawnVermin()`

  `boolean`

  `canStand()`

  `void`

  `checkForIntersectingCrops(BaseVehicle vehicle)`

  `boolean`

  `checkHaveDung()`

  `boolean`

  `checkHaveGrass()`

  Check if we have or not an attached sprite for blends\_natural\_01\_87, if true it means the grass on this square has already been eaten

  `void`

  `checkRoomSeen(int playerIndex)`

  `void`

  `clearPlayerCutawayFlag(int playerIndex,
  int flag,
  long currentTimeMillis)`

  `void`

  `clearPuddles()`

  `void`

  `ClearTileObjects()`

  `void`

  `ClearTileObjectsExceptFloor()`

  `void`

  `clearWater()`

  `boolean`

  `connectedWithFloor()`

  `boolean`

  `containsVegetation()`

  `IsoDeadBody`

  `createAnimalCorpseFromItem(InventoryItem item)`

  `IsoDeadBody`

  `createCorpse(boolean skeleton)`

  `IsoDeadBody`

  `createCorpse(IsoZombie zombie)`

  `IsoDeadBody`

  `createCorpse(IsoZombie zombie,
  boolean skeleton)`

  `boolean`

  `damageSpriteSheetRopeFromBottom(IsoPlayer player,
  boolean north)`

  `private void`

  `debugPrintGridSquare()`

  `void`

  `DeleteTileObject(IsoObject obj)`

  `void`

  `destroyFarmingPlant()`

  `void`

  `dirtStamp()`

  `void`

  `DirtySlice()`

  `void`

  `disableErosion()`

  `void`

  `discard()`

  `float`

  `DistTo(int x,
  int y)`

  `float`

  `DistTo(IsoGridSquare sq)`

  `float`

  `DistTo(IsoMovingObject other)`

  `float`

  `DistToProper(int x,
  int y)`

  `float`

  `DistToProper(IsoGridSquare sq)`

  `float`

  `DistToProper(IsoMovingObject other)`

  `void`

  `DoCutawayShader(IsoObject obj,
  IsoDirections dir,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  boolean bHasDoorN,
  boolean bHasDoorW,
  boolean bHasWindowN,
  boolean bHasWindowW,
  zombie.iso.sprite.shapers.WallShaper texdModifier)`

  `private void`

  `DoCutawayShaderAttached(IsoObject obj,
  IsoDirections dir,
  Texture tex2,
  boolean noWallLighting,
  ColorInfo lightInfo,
  int cutawayX,
  int cutawayY,
  int cutawayW,
  int cutawayH,
  int col0,
  int col1,
  int col2,
  int col3,
  SpriteRenderer.WallShaderTexRender wallShaderTexRender)`

  `void`

  `DoCutawayShaderSprite(IsoSprite sprite,
  IsoDirections dir,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE)`

  `private LosUtil.TestResults`

  `DoDiagnalCheck(int x,
  int y,
  int z,
  boolean bIgnoreDoors)`

  `private zombie.iso.IsoGridSquareCollisionData`

  `DoDiagnalCheck(zombie.iso.IsoGridSquareCollisionData isoGridSquareCollisionData,
  int x,
  int y,
  int z,
  boolean bIgnoreDoors)`

  `IsoGridSquare`

  `doGridNav(IsoGridSquare.GetSquare getter)`

  `void`

  `DoSplat(String id,
  boolean bFlip,
  IsoFlagType prop,
  float offX,
  float offZ,
  float alpha)`

  `int`

  `DoWallLightingN(IsoObject obj,
  int stenciled,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  boolean bHasDoorN,
  boolean bHasWindowN,
  zombie.core.opengl.Shader wallRenderShader)`

  `int`

  `DoWallLightingNW(IsoObject obj,
  int stenciled,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  boolean bHasDoorN,
  boolean bHasDoorW,
  boolean bHasWindowN,
  boolean bHasWindowW,
  zombie.core.opengl.Shader wallRenderShader)`

  `int`

  `DoWallLightingW(IsoObject obj,
  int stenciled,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  boolean bHasDoorW,
  boolean bHasWindowW,
  zombie.core.opengl.Shader wallRenderShader)`

  `void`

  `EnsureSurroundNotNull()`

  `IsoGameCharacter`

  `FindEnemy(IsoGameCharacter g,
  int range,
  ArrayList<IsoMovingObject> enemyList)`

  `IsoGameCharacter`

  `FindEnemy(IsoGameCharacter g,
  int range,
  ArrayList<IsoMovingObject> enemyList,
  IsoGameCharacter rangeTest,
  int testRangeMax)`

  `IsoGameCharacter`

  `FindFriend(IsoGameCharacter g,
  int range,
  Stack<IsoGameCharacter> enemyList)`

  `void`

  `fixPlacedItemRenderOffsets()`

  `void`

  `FixStackableObjects()`

  `void`

  `flagForHotSave()`

  `IsoGridSquare`

  `getAdjacentPathSquare(IsoDirections dir)`

  `IsoGridSquare`

  `getAdjacentSquare(IsoDirections dir)`

  `<T> PZArrayList<ItemContainer>`

  `getAllContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `<T> PZArrayList<ItemContainer>`

  `getAllContainersFromAdjacentSquare(IsoDirections dir,
  T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `ArrayList<IsoAnimal>`

  `getAnimals()`

  `ArrayList<IsoAnimal>`

  `getAnimals(ArrayList<IsoAnimal> result)`

  `IsoAnimalTrack`

  `getAnimalTrack()`

  `float`

  `getApparentZ(float dx,
  float dy)`

  `IsoObject`

  `getBed()`

  `IsoObject`

  `getBedTo(IsoGridSquare next)`

  `IsoObject`

  `getBendable(boolean north)`

  `IsoObject`

  `getBendableTo(IsoGridSquare next)`

  `int`

  `GetBLightLevel()`

  `IsoBrokenGlass`

  `getBrokenGlass()`

  `IsoBuilding`

  `getBuilding()`

  `BuildingDef`

  `getBuildingDef()`

  `IsoObject`

  `getBush()`

  `List<IsoObject>`

  `getBushes()`

  `IsoButcherHook`

  `getButcherHook()`

  `GlobalObject`

  `getCampfire()`

  `boolean`

  `getCanSee(int playerIndex)`

  `IsoCell`

  `getCell()`

  `float`

  `getCenterX()`

  `float`

  `getCenterY()`

  `IsoChunk`

  `getChunk()`

  `boolean`

  `getCollideMatrix(int dx,
  int dy,
  int dz)`

  `IsoCompost`

  `getCompost()`

  `IsoObject`

  `getContainerItem(String type)`

  `zombie.iso.worldgen.utils.SquareCoord`

  `getCoords()`

  `IsoObject`

  `getCountertopAttachObject()`

  `IsoObject`

  `getCountertopObject()`

  `IsoCurtain`

  `getCurtain(IsoObjectType curtainType)`

  `float`

  `getDarkMulti(int playerIndex)`

  `static float`

  `getDarkStep()`

  `IsoDeadBody`

  `getDeadBody()`

  `List<IsoDeadBody>`

  `getDeadBodys()`

  `static ColorInfo`

  `getDefColorInfo()`

  `ArrayList<IsoGameCharacter>`

  `getDeferedCharacters()`

  `DeviceData`

  `getDeviceData()`

  `IsoObject`

  `getDoor(boolean north)`

  `IsoObject`

  `getDoorFrameTo(IsoGridSquare next)`

  `IsoObject`

  `getDoorOrWindow(boolean north)`

  `IsoObject`

  `getDoorOrWindowOrWindowFrame(IsoDirections dir,
  boolean ignoreOpen)`

  `IsoObject`

  `getDoorTo(IsoGridSquare next)`

  `IsoGridSquare`

  `getE()`

  `zombie.erosion.ErosionData.Square`

  `getErosionData()`

  `GlobalObject`

  `getFarmingPlant()`

  `IsoFire`

  `getFire()`

  `zombie.iso.IsoGridSquareCollisionData`

  `getFirstBlocking(zombie.iso.IsoGridSquareCollisionData isoGridSquareCollisionData,
  int x,
  int y,
  int z,
  boolean specialDiag,
  boolean bIgnoreDoors)`

  `IsoObject`

  `getFloor()`

  `IsoGridSquare`

  `getFloorSquareBelow()`

  `IsoObject`

  `getGarageDoor(boolean bNorth)`

  `IsoGenerator`

  `getGenerator()`

  `int`

  `GetGLightLevel()`

  `IsoObject`

  `getGraffitiObject()`

  `IsoObject`

  `getGrass()`

  `List<IsoObject>`

  `getGrassLike()`

  `private Zone`

  `getGrassRegrowthZone()`

  `float`

  `getGridSneakModifier(boolean onlySolidTrans)`

  `long`

  `getHashCodeObjects()`

  Deprecated.

  `int`

  `getHashCodeObjectsInt()`

  Deprecated.

  `IsoObject`

  `getHiddenStash()`

  `IsoObject`

  `getHoppable(boolean north)`

  `IsoThumpable`

  `getHoppableThumpable(boolean north)`

  `IsoThumpable`

  `getHoppableThumpableTo(IsoGridSquare next)`

  `IsoObject`

  `getHoppableTo(IsoGridSquare next)`

  `IsoObject`

  `getHoppableWall(boolean bNorth)`

  `int`

  `getHourLastSeen()`

  `float`

  `getHoursSinceLastSeen()`

  `IsoHutch`

  `getHutch()`

  `ArrayList<IsoHutch>`

  `getHutchTiles(IsoHutch sourceHutch)`

  `Integer`

  `getID()`

  `boolean`

  `getIsDissolved(int playerIndex,
  long currentTimeMillis)`

  `IsoDoor`

  `getIsoDoor()`

  `zombie.iso.areas.isoregion.regions.IWorldRegion`

  `getIsoWorldRegion()`

  `float`

  `getLampostTotalB()`

  `float`

  `getLampostTotalG()`

  `float`

  `getLampostTotalR()`

  `static int`

  `getLightcache()`

  `ArrayList<Float>`

  `getLightInfluenceB()`

  `ArrayList<Float>`

  `getLightInfluenceG()`

  `ArrayList<Float>`

  `getLightInfluenceR()`

  `ColorInfo`

  `getLightInfo(int playerNumber)`

  `float`

  `getLightLevel(int playerIndex)`

  `float`

  `getLightLevel2()`

  `String`

  `getLootZone()`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaMovingObjectList()`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaTileObjectList()`

  `static boolean`

  `getMatrixBit(int matrix,
  byte x,
  byte y,
  byte z)`

  `static boolean`

  `getMatrixBit(int matrix,
  int x,
  int y,
  int z)`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `ArrayList<IsoMovingObject>`

  `getMovingObjects()`

  `IsoGridSquare`

  `getN()`

  `static IsoGridSquare`

  `getNew(ArrayDeque<IsoGridSquare> isoGridSquareCache,
  IsoCell cell,
  SliceY slice,
  int x,
  int y,
  int z)`

  `static IsoGridSquare`

  `getNew(IsoCell cell,
  SliceY slice,
  int x,
  int y,
  int z)`

  `int`

  `getNextNonItemObjectIndex(int index)`

  `<T> PZArrayList<ItemContainer>`

  `getObjectContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `PZArrayList<IsoObject>`

  `getObjects()`

  `IsoObject`

  `getObjectWithSprite(String spriteName)`

  `zombie.iso.IsoGridOcclusionData`

  `getOcclusionData()`

  `boolean`

  `getOpenAir()`

  `IsoObject`

  `getOpenDoor(IsoDirections dir)`

  `zombie.iso.IsoGridOcclusionData`

  `getOrCreateOcclusionData()`

  `IsoObject`

  `getOre()`

  `List<IsoObject>`

  `getOres()`

  `boolean`

  `getPathMatrix(int dx,
  int dy,
  int dz)`

  `IsoPlayer`

  `getPlayer()`

  `IsoObject`

  `getPlayerBuiltFloor()`

  `int`

  `getPlayerCutawayFlag(int playerIndex,
  long currentTimeMillis)`

  `PropertyContainer`

  `getProperties()`

  `IsoObject`

  `getPuddleFloor()`

  `zombie.iso.IsoPuddlesGeometry`

  `getPuddles()`

  `int`

  `getPuddlesDir()`

  `float`

  `getPuddlesInGround()`

  `List<IsoGridSquare>`

  `getRadius(int radius)`

  `zombie.iso.objects.IsoRaindrop`

  `getRainDrop()`

  `zombie.iso.objects.IsoRainSplash`

  `getRainSplash()`

  `IsoGridSquare`

  `getRandomAdjacent()`

  `IsoGridSquare`

  `getRandomAdjacentFreeSameRoom()`

  `static float`

  `getRecalcLightTime()`

  `int`

  `GetRLightLevel()`

  `IsoBuilding`

  `getRoofHideBuilding()`

  `IsoRoom`

  `getRoom()`

  `RoomDef`

  `getRoomDef()`

  `long`

  `getRoomID()`

  `String`

  `getRoomIDString()`

  `int`

  `getRoomSize()`

  `IsoGridSquare`

  `getS()`

  `boolean`

  `getSeen(int playerIndex)`

  `IsoObject`

  `getSheetRope()`

  `IsoDirections`

  `getSlopedSurfaceDirection()`

  `float`

  `getSlopedSurfaceHeight(float dx,
  float dy)`

  `float`

  `getSlopedSurfaceHeight(IsoDirections edge)`

  `float`

  `getSlopedSurfaceHeightMax()`

  `float`

  `getSlopedSurfaceHeightMin()`

  `ArrayList<IsoObject>`

  `getSpecialObjects()`

  `private IsoObject`

  `getSpecialSolid()`

  `private IsoObject`

  `getSpecialWall(boolean north)`

  `IsoGridSquare`

  `getSquareAbove()`

  `IsoGridSquare`

  `getSquareBelow()`

  `String`

  `getSquareRegion()`

  `static void`

  `getSquaresForThread(ArrayDeque<IsoGridSquare> isoGridSquareCacheDest,
  int count)`

  `String`

  `getSquareZombiesType()`

  `IsoObject`

  `getStairPillar()`

  `IsoObjectType`

  `getStairs()`

  `IsoDirections`

  `getStairsDirection()`

  `float`

  `getStairsHeight(IsoDirections edge)`

  `float`

  `getStairsHeightMax()`

  `float`

  `getStairsHeightMin()`

  `ArrayList<IsoMovingObject>`

  `getStaticMovingObjects()`

  `<ObjectType extends IsoMovingObject>  
  List<ObjectType>`

  `getStaticMovingObjects(Class<? extends ObjectType> objectType,
  Predicate<ObjectType> objectFilter)`

  `<ObjectType extends IsoMovingObject>  
  List<ObjectType>`

  `getStaticMovingObjectsInNearbySquares(Class<? extends ObjectType> objectType,
  BiPredicate<IsoGridSquare, IsoGridSquare> squareFilter,
  Predicate<ObjectType> objectFilter)`

  `IsoObject`

  `getStump()`

  `IsoGridSquare[]`

  `getSurroundingSquares()`

  `float`

  `getTargetDarkMulti(int playerIndex)`

  `IsoThumpable`

  `getThumpable(boolean north)`

  `IsoObject`

  `getThumpableWall(boolean bNorth)`

  `IsoObject`

  `getThumpableWallOrHoppable(boolean bNorth)`

  `IsoThumpable`

  `getThumpableWindow(boolean north)`

  `IsoGridSquare`

  `getTileInDirection(IsoDirections directions)`

  `float`

  `getTotalWeightOfItemsOnFloor()`

  `IsoObject`

  `getTransparentWallTo(IsoGridSquare other)`

  `int`

  `getTrapPositionX()`

  `int`

  `getTrapPositionY()`

  `int`

  `getTrapPositionZ()`

  `IsoObject`

  `getTrashReceptacle()`

  `IsoTree`

  `getTree()`

  `BaseVehicle`

  `getVehicleContainer()`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate)`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `int`

  `getVertLight(int i,
  int playerIndex)`

  `boolean`

  `getVisionMatrix(int dx,
  int dy,
  int dz)`

  `IsoGridSquare`

  `getW()`

  `IsoObject`

  `getWall()`

  `IsoObject`

  `getWall(boolean bNorth)`

  `(package private) IsoObject`

  `getWallExcludingList(boolean bNorth,
  ArrayList<String> excluded)`

  `IsoObject`

  `getWallExcludingObject(boolean bNorth,
  IsoObject exclude)`

  `Boolean`

  `getWallFull()`

  `IsoObject`

  `getWallHoppable(boolean north)`

  `IsoObject`

  `getWallHoppableTo(IsoGridSquare next)`

  `IsoObject`

  `getWallNW()`

  `IsoObject`

  `getWallSE()`

  `int`

  `getWallType()`

  `IsoWaterGeometry`

  `getWater()`

  `IsoObject`

  `getWaterObject()`

  `IsoWindow`

  `getWindow()`

  `IsoWindow`

  `getWindow(boolean north)`

  `IsoWindowFrame`

  `getWindowFrame(boolean north)`

  `IsoWindowFrame`

  `getWindowFrameTo(IsoGridSquare next)`

  `IsoThumpable`

  `getWindowThumpableTo(IsoGridSquare next)`

  `IsoWindow`

  `getWindowTo(IsoGridSquare next)`

  `ArrayList<IsoWorldInventoryObject>`

  `getWorldObjects()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `IsoZombie`

  `getZombie()`

  `int`

  `getZombieCount()`

  `String`

  `getZombiesType()`

  `Zone`

  `getZone()`

  `String`

  `getZoneType()`

  `boolean`

  `has(int type)`

  `boolean`

  `has(String flag)`

  `boolean`

  `has(IsoPropertyType flag)`

  `boolean`

  `has(IsoPropertyType... flag)`

  `boolean`

  `has(IsoFlagType flag)`

  `boolean`

  `has(IsoObjectType type)`

  `boolean`

  `hasAdjacentCanStandSquare()`

  `boolean`

  `hasAdjacentFireObject()`

  `private boolean`

  `hasAdjacentStairs(IsoGridSquare square,
  IsoDirections dir,
  IsoObjectType type)`

  `boolean`

  `hasBlockedDoor(boolean north)`

  `boolean`

  `hasBlockedWindow(boolean north)`

  `boolean`

  `hasBush()`

  `boolean`

  `hasClosedDoorOnEdge(IsoDirections edge)`

  `private boolean`

  `hasConnectingBNStair(IsoObjectType upStairs,
  IsoObjectType leftStairs,
  IsoGridSquare upSquare)`

  `private boolean`

  `hasConnectingBWStair(IsoObjectType rightStairs,
  IsoObjectType leftStairs,
  IsoGridSquare rightSquare)`

  `private boolean`

  `hasConnectingTNStair(IsoObjectType downStairs,
  IsoObjectType leftStairs,
  IsoGridSquare downSquare,
  IsoGridSquare upSquare)`

  `private boolean`

  `hasConnectingTWStair(IsoObjectType leftStairs,
  IsoObjectType upStairs,
  IsoGridSquare leftSquare,
  IsoGridSquare upSquare)`

  `private static boolean`

  `hasCutawayCapableWallNorth(IsoGridSquare square)`

  `private static boolean`

  `hasCutawayCapableWallWest(IsoGridSquare square)`

  `boolean`

  `hasDirt()`

  `(package private) boolean`

  `HasDoor(boolean north)`

  `boolean`

  `hasDoorOnEdge(IsoDirections edge,
  boolean ignoreOpen)`

  `boolean`

  `HasEave()`

  `boolean`

  `HasElevatedFloor()`

  `boolean`

  `hasFarmingPlant()`

  `boolean`

  `hasFence()`

  `boolean`

  `hasFenceInVicinity()`

  `boolean`

  `hasFireObject()`

  `boolean`

  `hasFireplace()`

  `boolean`

  `hasFlies()`

  `boolean`

  `hasFloor()`

  `boolean`

  `hasFloor(boolean north)`

  `boolean`

  `hasFloorAtTopOfStairs()`

  `boolean`

  `hasFloorBelow()`

  `boolean`

  `hasFloorOverWater()`

  `boolean`

  `hasGrassLike()`

  `boolean`

  `hasGrave()`

  `boolean`

  `hasGridPower()`

  `boolean`

  `hasGridPower(int offset)`

  `int`

  `hashCodeNoOverride()`

  Deprecated.

  `boolean`

  `hasIdenticalSlopedSurface(IsoGridSquare other)`

  `boolean`

  `hasLitCampfire()`

  `boolean`

  `hasModData()`

  `boolean`

  `hasNaturalFloor()`

  `(package private) boolean`

  `HasNoCharacters()`

  `boolean`

  `hasNonHoppableWall(boolean isNorth)`

  `boolean`

  `hasOpenDoorOnEdge(IsoDirections edge)`

  `boolean`

  `HasPushable()`

  `boolean`

  `hasRainBlockingTile()`

  `boolean`

  `hasRoomDef()`

  `boolean`

  `hasSand()`

  `boolean`

  `HasSlopedRoof()`

  `boolean`

  `HasSlopedRoofNorth()`

  `boolean`

  `HasSlopedRoofWest()`

  `boolean`

  `hasSlopedSurface()`

  `boolean`

  `hasSlopedSurfaceToLevelAbove(IsoDirections dir)`

  `boolean`

  `HasStairs()`

  `boolean`

  `HasStairsBelow()`

  `boolean`

  `HasStairsNorth()`

  `boolean`

  `HasStairsWest()`

  `boolean`

  `HasStairTop()`

  `boolean`

  `HasStairTopNorth()`

  `boolean`

  `HasStairTopWest()`

  `boolean`

  `hasSupport()`

  `boolean`

  `hasTrash()`

  `boolean`

  `hasTrashReceptacle()`

  `boolean`

  `HasTree()`

  `boolean`

  `hasWater()`

  `boolean`

  `hasWindowFrame()`

  `boolean`

  `hasWindowOrWindowFrame()`

  `boolean`

  `haveBlood()`

  `boolean`

  `haveBloodFloor()`

  `boolean`

  `haveBloodWall()`

  `boolean`

  `haveDoor()`

  `boolean`

  `haveElectricity()`

  `boolean`

  `haveFire()`

  `boolean`

  `haveGraffiti()`

  `boolean`

  `haveGrime()`

  `boolean`

  `haveGrimeFloor()`

  `boolean`

  `haveGrimeWall()`

  `boolean`

  `haveRoofFull()`

  `boolean`

  `haveStains()`

  `private static void`

  `initWaterSplashCache()`

  `void`

  `interpolateLight(ColorInfo inf,
  float x,
  float y)`

  `void`

  `invalidateRenderChunkLevel(long dirtyFlags)`

  `void`

  `InvalidateSpecialObjectPaths()`

  `void`

  `invalidateVispolyChunkLevel()`

  `boolean`

  `isAdjacentTo(IsoGridSquare sq)`

  `boolean`

  `isAdjacentToHoppable()`

  `boolean`

  `isAdjacentToWindow()`

  `static boolean`

  `isbDoSlowPathfinding()`

  `boolean`

  `isBlockedTo(IsoGridSquare other)`

  `boolean`

  `isCachedIsFree()`

  `boolean`

  `isCacheIsFree()`

  `boolean`

  `isCanSee(int playerIndex)`

  `boolean`

  `isCommonGrass()`

  `boolean`

  `isCouldSee(int playerIndex)`

  `boolean`

  `isDerelict()`

  `boolean`

  `isDoorBlockedTo(IsoGridSquare other)`

  `boolean`

  `isDoorOrWallSquare()`

  `boolean`

  `isDoorSquare()`

  `boolean`

  `isDoorTo(IsoGridSquare other)`

  `boolean`

  `isExtraFreeSquare()`

  `boolean`

  `isFree(boolean bCountOtherCharacters)`

  `boolean`

  `isFreeOrMidair(boolean bCountOtherCharacters)`

  `boolean`

  `isFreeOrMidair(boolean bCountOtherCharacters,
  boolean bDoZombie)`

  `boolean`

  `isFreeWallPair(IsoDirections dir,
  boolean both)`

  `boolean`

  `isFreeWallSquare()`

  `boolean`

  `isGoodOutsideSquare()`

  `boolean`

  `isGoodSquare()`

  `boolean`

  `isHoppableTo(IsoGridSquare other)`

  `private boolean`

  `isHorizontalNeighbor(int x1,
  int y1,
  int x2,
  int y2)`

  `boolean`

  `isInARoom()`

  `boolean`

  `isInsideRectangle(int x,
  int y,
  int w,
  int h)`

  `boolean`

  `isNoGas()`

  `boolean`

  `isNoPower()`

  `private boolean`

  `isNorthFacingSequence(IsoObjectType up,
  IsoObjectType down)`

  `boolean`

  `isNotBlocked(boolean bCountOtherCharacters)`

  `boolean`

  `isNoWater()`

  `boolean`

  `IsOnScreen()`

  `boolean`

  `IsOnScreen(boolean halfTileBorder)`

  `boolean`

  `isOutside()`

  `boolean`

  `isOverlayDone()`

  `boolean`

  `isPlayerAbleToHopWallTo(IsoDirections dir,
  IsoGridSquare oppositeSq)`

  `boolean`

  `isRural()`

  `boolean`

  `isRuralExtraFussy()`

  `boolean`

  `isSafeToSpawn()`

  `void`

  `isSafeToSpawn(IsoGridSquare sq,
  int depth)`

  `boolean`

  `isSameStaircase(int x,
  int y,
  int z)`

  `boolean`

  `isSeen(int playerIndex)`

  `boolean`

  `isShop()`

  `boolean`

  `isSlopedSurfaceEdgeBlocked(IsoDirections edge)`

  `boolean`

  `isSolid()`

  `boolean`

  `isSolidFloor()`

  `boolean`

  `isSolidFloorCached()`

  `boolean`

  `isSolidTrans()`

  `boolean`

  `isSomethingTo(IsoGridSquare other)`

  `boolean`

  `isSpriteOnSouthOrEastWall(IsoObject obj)`

  `boolean`

  `isStairBlockedTo(IsoGridSquare other)`

  `boolean`

  `isStairsEdgeBlocked(IsoDirections edge)`

  `boolean`

  `isUndergroundBlock()`

  `boolean`

  `isUserDefinedBuilding()`

  `boolean`

  `isUserDefinedRoom()`

  `boolean`

  `isVehicleIntersecting()`

  `boolean`

  `isVehicleIntersectingCrops()`

  `private boolean`

  `isVerticalNeighbor(int x1,
  int y1,
  int x2,
  int y2)`

  `boolean`

  `isWallSquare()`

  `boolean`

  `isWallSquareNW()`

  `boolean`

  `isWallTo(IsoGridSquare other)`

  `boolean`

  `isWallTo(IsoGridSquare other,
  int depth)`

  `boolean`

  `isWaterSquare()`

  `private boolean`

  `isWestFacingSequence(IsoObjectType left,
  IsoObjectType right)`

  `(package private) boolean`

  `IsWindow(int sx,
  int sy,
  int sz)`

  `boolean`

  `isWindowBlockedTo(IsoGridSquare other)`

  `boolean`

  `isWindowOrWindowFrame(IsoObject obj,
  boolean north)`

  `boolean`

  `isWindowTo(IsoGridSquare other)`

  `void`

  `load(ByteBuffer b,
  int worldVersion)`

  `void`

  `load(ByteBuffer b,
  int worldVersion,
  boolean isDebugSave)`

  `private int`

  `loadmatrix(boolean[][][] pathMatrix,
  byte[] databytes,
  int index)`

  `(package private) static void`

  `loadmatrix(boolean[][][] matrix,
  DataInputStream input)`

  `private void`

  `loadmatrix(boolean[][][] pathMatrix,
  ByteBuffer databytes)`

  `private int`

  `performDrawWall(IsoObject obj,
  IsoDirections dir,
  int stenciled,
  int playerIndex,
  boolean noWallLighting,
  Consumer<zombie.core.textures.TextureDraw> texdModifier,
  zombie.core.opengl.Shader wallRenderShader)`

  `private int`

  `performDrawWallOnly(IsoObject obj,
  IsoDirections dir,
  int stenciled,
  int playerIndex,
  boolean noWallLighting,
  Consumer<zombie.core.textures.TextureDraw> texdModifier,
  zombie.core.opengl.Shader wallRenderShader)`

  `private int`

  `performDrawWallSegmentSingle(IsoObject obj,
  int stenciled,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  boolean bHasDoorW,
  boolean bHasWindowW,
  boolean bHasDoorN,
  boolean bHasWindowN,
  boolean hasNoDoor,
  boolean hasNoWindow,
  IsoObjectType doorFrType,
  IsoObjectType doorType,
  boolean isCutaway,
  IsoFlagType transparentFlag,
  IsoFlagType transparentWindowFlag,
  IsoFlagType hoppableType,
  IsoDirections cutawayDirection,
  boolean circleStencil,
  zombie.iso.sprite.shapers.WallShaperWhole texdModifier,
  zombie.core.opengl.Shader wallRenderShader)`

  `int`

  `placeWallAndDoorCheck(IsoObject obj,
  int index)`

  `long`

  `playSound(String file)`

  `long`

  `playSound(String file,
  boolean doWorldSound)`

  Deprecated.

  `long`

  `playSoundLocal(String file)`

  `void`

  `putOutCampfire()`

  `void`

  `RecalcAllWithNeighbours(boolean bDoReverse)`

  `void`

  `RecalcAllWithNeighbours(boolean bDoReverse,
  IsoGridSquare.GetSquare getter)`

  `void`

  `RecalcAllWithNeighboursMineOnly()`

  `void`

  `recalcHashCodeObjects()`

  Deprecated.

  `void`

  `RecalcProperties()`

  `void`

  `RecalcPropertiesIfNeeded()`

  `(package private) void`

  `ReCalculateAll(boolean bDoReverse,
  IsoGridSquare a,
  IsoGridSquare.GetSquare getter)`

  `(package private) void`

  `ReCalculateAll(IsoGridSquare a)`

  `(package private) void`

  `ReCalculateAll(IsoGridSquare a,
  IsoGridSquare.GetSquare getter)`

  `void`

  `ReCalculateCollide(IsoGridSquare square)`

  `void`

  `ReCalculateCollide(IsoGridSquare square,
  IsoGridSquare.GetSquare getter)`

  `(package private) void`

  `ReCalculateMineOnly(IsoGridSquare a)`

  `void`

  `ReCalculatePathFind(IsoGridSquare square)`

  `void`

  `ReCalculatePathFind(IsoGridSquare square,
  IsoGridSquare.GetSquare getter)`

  `void`

  `ReCalculateVisionBlocked(IsoGridSquare square)`

  `void`

  `ReCalculateVisionBlocked(IsoGridSquare square,
  IsoGridSquare.GetSquare getter)`

  `ArrayList<InventoryItem>`

  `removeAllDung()`

  `(package private) void`

  `RemoveAllWith(IsoFlagType propertyType)`

  `void`

  `removeAllWorldObjects()`

  `void`

  `removeBlood(boolean remote,
  boolean onlyWall)`

  `void`

  `removeCorpse(IsoDeadBody body,
  boolean bRemote)`

  `void`

  `removeErosionObject(String type)`

  `void`

  `removeGlassAttachments(IsoWindow window)`

  `void`

  `removeGraffiti()`

  `boolean`

  `removeGrass()`

  `void`

  `removeGrime()`

  `boolean`

  `removeSheetRopeFromBottom(IsoPlayer player,
  boolean north)`

  `int`

  `RemoveTileObject(IsoObject obj)`

  `int`

  `RemoveTileObject(IsoObject obj,
  boolean safelyRemove)`

  `int`

  `RemoveTileObjectErosionNoRecalc(IsoObject obj)`

  `void`

  `removeUnderground()`

  `void`

  `removeWorldObject(IsoWorldInventoryObject object)`

  `private void`

  `renderAttachedSpritesWithNoWallLighting(IsoObject obj,
  ColorInfo lightInfo,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderCharacters(int maxZ,
  boolean deadRender,
  boolean doBlendFunc)`

  `void`

  `renderDeferredCharacters(int maxZ)`

  `void`

  `renderFishSplash(int playerIndex,
  ColorInfo lightInfo)`

  `int`

  `renderFloor(zombie.core.opengl.Shader floorShader)`

  `private int`

  `renderFloorInternal(zombie.core.opengl.Shader floorShader)`

  `boolean`

  `renderMinusFloor(int maxZ,
  boolean doSE,
  boolean vegitationRender,
  int cutawaySelf,
  int cutawayN,
  int cutawayS,
  int cutawayW,
  int cutawayE,
  zombie.core.opengl.Shader wallRenderShader)`

  `boolean`

  `RenderMinusFloorFxMask(int maxZ,
  boolean doSE,
  boolean vegitationRender)`

  `void`

  `RenderOpenDoorOnly()`

  `void`

  `renderRainSplash(int playerIndex,
  ColorInfo lightInfo)`

  `void`

  `renderRainSplash(int playerIndex,
  ColorInfo lightInfo,
  float splashFrame,
  boolean bRandomXY)`

  `(package private) void`

  `RereouteWallMaskTo(IsoObject obj)`

  `void`

  `ResetIsoWorldRegion()`

  `void`

  `restackSheetRope()`

  `void`

  `save(ByteBuffer output,
  ObjectOutputStream outputObj)`

  `void`

  `save(ByteBuffer output,
  ObjectOutputStream outputObj,
  boolean isDebugSave)`

  `private int`

  `savematrix(boolean[][][] pathMatrix,
  byte[] databytes,
  int index)`

  `(package private) static void`

  `savematrix(boolean[][][] matrix,
  DataOutputStream output)`

  `private void`

  `savematrix(boolean[][][] pathMatrix,
  ByteBuffer databytes)`

  `float`

  `scoreAsWaypoint(int x,
  int y)`

  `void`

  `set(String tilePropertyKey)`

  `void`

  `setAdjacentSquare(IsoDirections dir,
  IsoGridSquare square)`

  `static void`

  `setbDoSlowPathfinding(boolean abDoSlowPathfinding)`

  `static void`

  `setBlendFunc()`

  `void`

  `SetBLightLevel(int val)`

  `(package private) void`

  `setBlockedGridPointers(IsoGridSquare.GetSquare getter)`

  `void`

  `setCachedIsFree(boolean cachedIsFree)`

  `void`

  `setCacheIsFree(boolean cacheIsFree)`

  `void`

  `setCanSee(int playerIndex,
  boolean canSee)`

  `static void`

  `setCollisionMode()`

  `void`

  `setCouldSee(int playerIndex,
  boolean bCouldSee)`

  `void`

  `setDarkMulti(int playerIndex,
  float darkMulti)`

  `static void`

  `setDarkStep(float aDarkStep)`

  `void`

  `setE(IsoGridSquare e)`

  `void`

  `SetGLightLevel(int val)`

  `void`

  `setHasFlies(boolean hasFlies)`

  `void`

  `setHaveElectricity(boolean haveElectricity)`

  Deprecated.

  `void`

  `setHourSeenToCurrent()`

  `void`

  `setID(int id)`

  `void`

  `setIsDissolved(int playerIndex,
  boolean bDissolved,
  long currentTimeMillis)`

  `void`

  `setIsoWorldRegion(IsoWorldRegion mr)`

  `void`

  `setIsSeen(int playerIndex,
  boolean bSeen)`

  `void`

  `setLampostTotalB(float lampostTotalB)`

  `void`

  `setLampostTotalG(float lampostTotalG)`

  `void`

  `setLampostTotalR(float lampostTotalR)`

  `static void`

  `setLightcache(int aLightcache)`

  `void`

  `setLightInfluenceB(ArrayList<Float> lightInfluenceB)`

  `void`

  `setLightInfluenceG(ArrayList<Float> lightInfluenceG)`

  `void`

  `setLightInfluenceR(ArrayList<Float> lightInfluenceR)`

  `void`

  `setLightInfoServerGUIOnly(ColorInfo c)`

  `static int`

  `setMatrixBit(int matrix,
  byte x,
  byte y,
  byte z,
  boolean val)`

  `static int`

  `setMatrixBit(int matrix,
  int x,
  int y,
  int z,
  boolean val)`

  `void`

  `setN(IsoGridSquare n)`

  `void`

  `setOverlayDone(boolean overlayDone)`

  `void`

  `setPlayerCutawayFlag(int playerIndex,
  int flags,
  long currentTimeMillis)`

  `void`

  `setRainDrop(zombie.iso.objects.IsoRaindrop drop)`

  `void`

  `setRainSplash(zombie.iso.objects.IsoRainSplash splash)`

  `static void`

  `setRecalcLightTime(float aRecalcLightTime)`

  `void`

  `SetRLightLevel(int val)`

  `void`

  `setRoom(IsoRoom room)`

  `void`

  `setRoomID(long roomId)`

  `void`

  `setS(IsoGridSquare s)`

  `void`

  `setSolidFloor(boolean solidFloor)`

  `void`

  `setSolidFloorCached(boolean solidFloorCached)`

  `void`

  `setSquareChanged()`

  `private void`

  `setTableTopObjectDirection(IsoObject table,
  IsoObject obj,
  PropertyContainer props)`

  `void`

  `setTargetDarkMulti(int playerIndex,
  float targetDarkMulti)`

  `void`

  `setTrapPositionX(int trapPositionX)`

  `void`

  `setTrapPositionY(int trapPositionY)`

  `void`

  `setTrapPositionZ(int trapPositionZ)`

  `void`

  `setVertLight(int i,
  int col,
  int playerIndex)`

  `void`

  `setW(IsoGridSquare w)`

  `void`

  `setX(int x)`

  `void`

  `setY(int y)`

  `void`

  `setZ(int z)`

  `boolean`

  `shouldNotSpawnActivatedRadiosOrTvs()`

  `boolean`

  `shouldRenderFishSplash(int playerIndex)`

  `boolean`

  `shouldSave()`

  `void`

  `softClear()`

  `void`

  `spawnRandomGenerator()`

  `void`

  `spawnRandomNewGenerator()`

  `void`

  `spawnRandomRuralWorkstation()`

  `void`

  `spawnRandomWorkstation()`

  `InventoryItem`

  `SpawnWorldInventoryItem(String itemType,
  float x,
  float y,
  float height)`

  `InventoryItem`

  `SpawnWorldInventoryItem(String itemType,
  float x,
  float y,
  float height,
  boolean autoAge)`

  `void`

  `SpawnWorldInventoryItem(String itemType,
  float x,
  float y,
  float height,
  int nbr)`

  `InventoryItem`

  `SpawnWorldInventoryItem(InventoryItem item,
  float x,
  float y,
  float height,
  boolean transmit)`

  `void`

  `splatBlood(int dist,
  float alpha)`

  `void`

  `StartFire()`

  Deprecated.

  `void`

  `startWaterSplash(boolean isBigSplash)`

  `void`

  `startWaterSplash(boolean isBigSplash,
  float dx,
  float dy)`

  `void`

  `stopFire()`

  `void`

  `switchLight(boolean active)`

  `void`

  `syncIsoTrap(HandWeapon weapon,
  IsoPlayer attacker)`

  `boolean`

  `testCollideAdjacent(IsoMovingObject collideObject,
  int x,
  int y,
  int z)`

  `boolean`

  `testCollideAdjacentAdvanced(int x,
  int y,
  int z,
  boolean ignoreDoors)`

  `IsoObject`

  `testCollideSpecialObjects(IsoGridSquare next)`

  `private static boolean`

  `testCollideSpecialObjects(IsoMovingObject collideObject,
  IsoGridSquare sqFrom,
  IsoGridSquare sqTo)`

  `boolean`

  `testPathFindAdjacent(IsoMovingObject mover,
  int x,
  int y,
  int z)`

  `boolean`

  `testPathFindAdjacent(IsoMovingObject mover,
  int x,
  int y,
  int z,
  IsoGridSquare.GetSquare getter)`

  `LosUtil.TestResults`

  `testVisionAdjacent(int x,
  int y,
  int z,
  boolean specialDiag,
  boolean bIgnoreDoors)`

  `static boolean`

  `toBoolean(byte[] data)`

  `void`

  `transmitAddObjectToSquare(IsoObject obj,
  int index)`

  `void`

  `transmitModdata()`

  `int`

  `transmitRemoveItemFromSquare(IsoObject obj)`

  `int`

  `transmitRemoveItemFromSquare(IsoObject obj,
  boolean safelyRemove)`

  `void`

  `transmitRemoveItemFromSquareOnClients(IsoObject obj)`

  `void`

  `transmitStopFire()`

  `boolean`

  `TreatAsSolidFloor()`

  `IsoDeadBody`

  `tryAddCorpseToWorld(InventoryItem item,
  float x,
  float y)`

  `@Nullable IsoDeadBody`

  `tryAddCorpseToWorld(InventoryItem item,
  float x,
  float y,
  boolean isVisible)`

  `void`

  `unset(String tilePropertyKey)`

  `<Param> Param`

  `visitNearbySquares(Param param,
  BiPredicate<IsoGridSquare, IsoGridSquare> squareFilter,
  BiConsumer<Param, IsoGridSquare> squareVisitor)`

  `<Param, ObjectType extends IsoMovingObject>  
  Param`

  `visitStaticMovingObjects(Class<? extends ObjectType> objectType,
  Param param,
  Predicate<ObjectType> objectFilter,
  BiConsumer<Param, ObjectType> objectVisitor)`

  `<Param, ObjectType extends IsoMovingObject>  
  Param`

  `visitStaticMovingObjectsInNearbySquares(Class<? extends ObjectType> objectType,
  Param param,
  BiPredicate<IsoGridSquare, IsoGridSquare> squareFilter,
  Predicate<ObjectType> objectFilter,
  BiConsumer<Param, ObjectType> objectVisitor)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### USE\_WALL\_SHADER

    public static final boolean USE\_WALL\_SHADER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.USE_WALL_SHADER)
  + ### ADD\_UNDERGROUND\_BLOCKS

    public static final boolean ADD\_UNDERGROUND\_BLOCKS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.ADD_UNDERGROUND_BLOCKS)
  + ### CUTAWAY\_OUTLINE\_ALPHA

    private static final float CUTAWAY\_OUTLINE\_ALPHA

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.CUTAWAY_OUTLINE_ALPHA)
  + ### cutawayY

    private static final int cutawayY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayY)
  + ### cutawayNWWidth

    private static final int cutawayNWWidth

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNWWidth)
  + ### cutawayNWHeight

    private static final int cutawayNWHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNWHeight)
  + ### cutawaySEXCut

    private static final int cutawaySEXCut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawaySEXCut)
  + ### cutawaySEXUncut

    private static final int cutawaySEXUncut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawaySEXUncut)
  + ### cutawaySEWidth

    private static final int cutawaySEWidth

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawaySEWidth)
  + ### cutawaySEHeight

    private static final int cutawaySEHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawaySEHeight)
  + ### cutawayNXFullyCut

    private static final int cutawayNXFullyCut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNXFullyCut)
  + ### cutawayNXCutW

    private static final int cutawayNXCutW

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNXCutW)
  + ### cutawayNXUncut

    private static final int cutawayNXUncut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNXUncut)
  + ### cutawayNXCutE

    private static final int cutawayNXCutE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayNXCutE)
  + ### cutawayWXFullyCut

    private static final int cutawayWXFullyCut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayWXFullyCut)
  + ### cutawayWXCutS

    private static final int cutawayWXCutS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayWXCutS)
  + ### cutawayWXUncut

    private static final int cutawayWXUncut

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayWXUncut)
  + ### cutawayWXCutN

    private static final int cutawayWXCutN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayWXCutN)
  + ### cutawayFenceXOffset

    private static final int cutawayFenceXOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayFenceXOffset)
  + ### cutawayLogWallXOffset

    private static final int cutawayLogWallXOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayLogWallXOffset)
  + ### cutawayMedicalCurtainWXOffset

    private static final int cutawayMedicalCurtainWXOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayMedicalCurtainWXOffset)
  + ### cutawayTentWallXOffset

    private static final int cutawayTentWallXOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayTentWallXOffset)
  + ### cutawaySpiffoWindowXOffset

    private static final int cutawaySpiffoWindowXOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawaySpiffoWindowXOffset)
  + ### cutawayRoof4XOffset

    private static final int cutawayRoof4XOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayRoof4XOffset)
  + ### cutawayRoof17XOffset

    private static final int cutawayRoof17XOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayRoof17XOffset)
  + ### cutawayRoof28XOffset

    private static final int cutawayRoof28XOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayRoof28XOffset)
  + ### cutawayRoof41XOffset

    private static final int cutawayRoof41XOffset

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.cutawayRoof41XOffset)
  + ### WALL\_TYPE\_N

    public static final int WALL\_TYPE\_N

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.WALL_TYPE_N)
  + ### WALL\_TYPE\_S

    public static final int WALL\_TYPE\_S

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.WALL_TYPE_S)
  + ### WALL\_TYPE\_W

    public static final int WALL\_TYPE\_W

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.WALL_TYPE_W)
  + ### WALL\_TYPE\_E

    public static final int WALL\_TYPE\_E

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.WALL_TYPE_E)
  + ### SURFACE\_OFFSETS

    private static final int[] SURFACE\_OFFSETS
  + ### VisiFlagTimerPeriod\_ms

    private static final long VisiFlagTimerPeriod\_ms

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.VisiFlagTimerPeriod_ms)
  + ### PCF\_NONE

    public static final byte PCF\_NONE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.PCF_NONE)
  + ### PCF\_NORTH

    public static final byte PCF\_NORTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.PCF_NORTH)
  + ### PCF\_WEST

    public static final byte PCF\_WEST

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.PCF_WEST)
  + ### threadLocalZones

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")>> threadLocalZones
  + ### DIRECTIONS

    private static final [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] DIRECTIONS
  + ### lighting

    public final [IsoGridSquare.ILighting](IsoGridSquare.ILighting.html "interface in zombie.iso")[] lighting
  + ### tempo

    private static final [Vector2](Vector2.html "class in zombie.iso") tempo
  + ### tempo2

    private static final [Vector2](Vector2.html "class in zombie.iso") tempo2
  + ### rmod

    public static float rmod
  + ### gmod

    public static float gmod
  + ### bmod

    public static float bmod
  + ### idMax

    public static int idMax
  + ### col

    private static int col
  + ### path

    private static int path
  + ### pathdoor

    private static int pathdoor
  + ### vision

    private static int vision
  + ### rainsplashCache

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] rainsplashCache
  + ### useSlowCollision

    public static boolean useSlowCollision
  + ### associatedBuilding

    public [BuildingDef](BuildingDef.html "class in zombie.iso") associatedBuilding
  + ### hasTree

    private boolean hasTree
  + ### lightInfluenceB

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceB
  + ### lightInfluenceG

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceG
  + ### lightInfluenceR

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceR
  + ### nav

    private final [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] nav
  + ### lightLevel

    public int lightLevel
  + ### collideMatrix

    public int collideMatrix
  + ### pathMatrix

    public int pathMatrix
  + ### visionMatrix

    public int visionMatrix
  + ### room

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") room
  + ### w

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") w
  + ### nw

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") nw
  + ### sw

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sw
  + ### s

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") s
  + ### n

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") n
  + ### ne

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") ne
  + ### se

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") se
  + ### e

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") e
  + ### u

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") u
  + ### d

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") d
  + ### haveSheetRope

    public boolean haveSheetRope
  + ### isoWorldRegion

    private zombie.iso.areas.isoregion.regions.IWorldRegion isoWorldRegion
  + ### hasSetIsoWorldRegion

    private boolean hasSetIsoWorldRegion
  + ### objectsSyncCount

    public int objectsSyncCount
  + ### roofHideBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") roofHideBuilding
  + ### flattenGrassEtc

    public boolean flattenGrassEtc
  + ### playerCutawayFlags

    private final byte[] playerCutawayFlags
  + ### playerCutawayFlagLockUntilTimes

    private final long[] playerCutawayFlagLockUntilTimes
  + ### targetPlayerCutawayFlags

    private final byte[] targetPlayerCutawayFlags
  + ### playerIsDissolvedFlags

    private final boolean[] playerIsDissolvedFlags
  + ### playerIsDissolvedFlagLockUntilTimes

    private final long[] playerIsDissolvedFlagLockUntilTimes
  + ### targetPlayerIsDissolvedFlags

    private final boolean[] targetPlayerIsDissolvedFlags
  + ### water

    private [IsoWaterGeometry](IsoWaterGeometry.html "class in zombie.iso") water
  + ### puddles

    private zombie.iso.IsoPuddlesGeometry puddles
  + ### puddlesCacheSize

    private float puddlesCacheSize
  + ### puddlesCacheLevel

    private float puddlesCacheLevel
  + ### waterSplashData

    private final [IsoGridSquare.WaterSplashData](IsoGridSquare.WaterSplashData.html "class in zombie.iso") waterSplashData
  + ### lightInfo

    private final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures")[] lightInfo
  + ### rainDrop

    private zombie.iso.objects.IsoRaindrop rainDrop
  + ### rainSplash

    private zombie.iso.objects.IsoRainSplash rainSplash
  + ### splashX

    private float splashX
  + ### splashY

    private float splashY
  + ### splashFrame

    private float splashFrame
  + ### splashFrameNum

    private int splashFrameNum
  + ### waterSplashCache

    private static final [Texture](../core/textures/Texture.html "class in zombie.core.textures")[] waterSplashCache
  + ### isWaterSplashCacheInitialised

    private static boolean isWaterSplashCacheInitialised
  + ### gridSquareCacheEmptyTimer

    public static int gridSquareCacheEmptyTimer
  + ### darkStep

    private static float darkStep
  + ### recalcLightTime

    public static float recalcLightTime
  + ### lightcache

    private static int lightcache
  + ### propertiesDirty

    public boolean propertiesDirty
  + ### defColorInfo

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") defColorInfo
  + ### blackColorInfo

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") blackColorInfo
  + ### colu

    private static int colu
  + ### coll

    private static int coll
  + ### colr

    private static int colr
  + ### colu2

    private static int colu2
  + ### coll2

    private static int coll2
  + ### colr2

    private static int colr2
  + ### doSlowPathfinding

    private static boolean doSlowPathfinding
  + ### circleStencil

    public static boolean circleStencil
  + ### hashCodeObjects

    public long hashCodeObjects
  + ### FIRE\_IMMUNE\_THRESHOLD

    public int FIRE\_IMMUNE\_THRESHOLD
  + ### FLOORS\_BURNT\_SPRITE\_PREFIX

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FLOORS\_BURNT\_SPRITE\_PREFIX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.FLOORS_BURNT_SPRITE_PREFIX)
  + ### cellGetSquare

    public static final [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") cellGetSquare
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### cachedScreenValue

    private int cachedScreenValue
  + ### cachedScreenX

    public float cachedScreenX
  + ### cachedScreenY

    public float cachedScreenY
  + ### torchTimer

    private static long torchTimer
  + ### solidFloorCached

    public boolean solidFloorCached
  + ### solidFloor

    public boolean solidFloor
  + ### cacheIsFree

    private boolean cacheIsFree
  + ### cachedIsFree

    private boolean cachedIsFree
  + ### chunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") chunk
  + ### roomId

    public long roomId
  + ### id

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") id
  + ### zone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") zone
  + ### deferedCharacters

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> deferedCharacters
  + ### deferredCharacterTick

    private int deferredCharacterTick
  + ### staticMovingObjects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> staticMovingObjects
  + ### movingObjects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> movingObjects
  + ### objects

    protected final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[IsoObject](IsoObject.html "class in zombie.iso")> objects
  + ### worldObjects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> worldObjects
  + ### hasTypes

    public long hasTypes
  + ### properties

    private final [PropertyContainer](../core/properties/PropertyContainer.html "class in zombie.core.properties") properties
  + ### specialObjects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> specialObjects
  + ### haveRoof

    public boolean haveRoof
  + ### burntOut

    private boolean burntOut
  + ### hasFlies

    private boolean hasFlies
  + ### biome

    private zombie.iso.worldgen.biomes.IBiome biome
  + ### occlusionDataCache

    private zombie.iso.IsoGridOcclusionData occlusionDataCache
  + ### tempWorldInventoryObjects

    private static final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> tempWorldInventoryObjects
  + ### isoGridSquareCache

    public static final zombie.util.CappedConcurrentQueue<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> isoGridSquareCache
  + ### loadGridSquareCache

    public static [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> loadGridSquareCache
  + ### overlayDone

    private boolean overlayDone
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### trapPositionX

    private int trapPositionX
  + ### trapPositionY

    private int trapPositionY
  + ### trapPositionZ

    private int trapPositionZ
  + ### ignoreBlockingSprites

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ignoreBlockingSprites
  + ### choices

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> choices
  + ### lightInfoTemp

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfoTemp
  + ### doorWindowCutawayLightMin

    private static final float doorWindowCutawayLightMin

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.doorWindowCutawayLightMin)
  + ### wallCutawayW

    private static boolean wallCutawayW
  + ### wallCutawayN

    private static boolean wallCutawayN
  + ### isSolidFloorCache

    public boolean isSolidFloorCache
  + ### isExteriorCache

    public boolean isExteriorCache
  + ### isVegitationCache

    public boolean isVegitationCache
  + ### hourLastSeen

    public int hourLastSeen
  + ### lastLoaded

    private static [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") lastLoaded
  + ### tr

    private static final [Color](../core/Color.html "class in zombie.core") tr
  + ### tl

    private static final [Color](../core/Color.html "class in zombie.core") tl
  + ### br

    private static final [Color](../core/Color.html "class in zombie.core") br
  + ### bl

    private static final [Color](../core/Color.html "class in zombie.core") bl
  + ### interp1

    private static final [Color](../core/Color.html "class in zombie.core") interp1
  + ### interp2

    private static final [Color](../core/Color.html "class in zombie.core") interp2
  + ### finalCol

    private static final [Color](../core/Color.html "class in zombie.core") finalCol
  + ### comp

    private static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> comp
  + ### isOnScreenLast

    public static boolean isOnScreenLast
  + ### erosion

    private zombie.erosion.ErosionData.Square erosion
* Constructor Details
  -------------------

  + ### IsoGridSquare

    public IsoGridSquare([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [SliceY](SliceY.html "class in zombie.iso") slice,
    int x,
    int y,
    int z)
* Method Details
  --------------

  + ### getCoords

    public zombie.iso.worldgen.utils.SquareCoord getCoords()
  + ### getMatrixBit

    public static boolean getMatrixBit(int matrix,
    int x,
    int y,
    int z)
  + ### getMatrixBit

    public static boolean getMatrixBit(int matrix,
    byte x,
    byte y,
    byte z)
  + ### setMatrixBit

    public static int setMatrixBit(int matrix,
    int x,
    int y,
    int z,
    boolean val)
  + ### setMatrixBit

    public static int setMatrixBit(int matrix,
    byte x,
    byte y,
    byte z,
    boolean val)
  + ### GetRLightLevel

    public int GetRLightLevel()
  + ### GetGLightLevel

    public int GetGLightLevel()
  + ### GetBLightLevel

    public int GetBLightLevel()
  + ### SetRLightLevel

    public void SetRLightLevel(int val)
  + ### SetGLightLevel

    public void SetGLightLevel(int val)
  + ### SetBLightLevel

    public void SetBLightLevel(int val)
  + ### setPlayerCutawayFlag

    public void setPlayerCutawayFlag(int playerIndex,
    int flags,
    long currentTimeMillis)
  + ### addPlayerCutawayFlag

    public void addPlayerCutawayFlag(int playerIndex,
    int flag,
    long currentTimeMillis)
  + ### clearPlayerCutawayFlag

    public void clearPlayerCutawayFlag(int playerIndex,
    int flag,
    long currentTimeMillis)
  + ### getPlayerCutawayFlag

    public int getPlayerCutawayFlag(int playerIndex,
    long currentTimeMillis)
  + ### setIsDissolved

    public void setIsDissolved(int playerIndex,
    boolean bDissolved,
    long currentTimeMillis)
  + ### getIsDissolved

    public boolean getIsDissolved(int playerIndex,
    long currentTimeMillis)
  + ### hasWater

    public boolean hasWater()
  + ### getWater

    public [IsoWaterGeometry](IsoWaterGeometry.html "class in zombie.iso") getWater()
  + ### clearWater

    public void clearWater()
  + ### getPuddles

    public zombie.iso.IsoPuddlesGeometry getPuddles()
  + ### clearPuddles

    public void clearPuddles()
  + ### getPuddlesInGround

    public float getPuddlesInGround()
  + ### removeUnderground

    public void removeUnderground()
  + ### isInsideRectangle

    public boolean isInsideRectangle(int x,
    int y,
    int w,
    int h)
  + ### doGridNav

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") doGridNav([IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### getOcclusionData

    public zombie.iso.IsoGridOcclusionData getOcclusionData()
  + ### getOrCreateOcclusionData

    public zombie.iso.IsoGridOcclusionData getOrCreateOcclusionData()
  + ### softClear

    public void softClear()
  + ### getGridSneakModifier

    public float getGridSneakModifier(boolean onlySolidTrans)
  + ### isSomethingTo

    public boolean isSomethingTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### getTransparentWallTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getTransparentWallTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### isWallTo

    public boolean isWallTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### isWallTo

    public boolean isWallTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other,
    int depth)
  + ### isWindowTo

    public boolean isWindowTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### haveDoor

    public boolean haveDoor()
  + ### hasDoorOnEdge

    public boolean hasDoorOnEdge([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge,
    boolean ignoreOpen)
  + ### hasClosedDoorOnEdge

    public boolean hasClosedDoorOnEdge([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### hasOpenDoorOnEdge

    public boolean hasOpenDoorOnEdge([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### isDoorTo

    public boolean isDoorTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### isBlockedTo

    public boolean isBlockedTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### canReachTo

    public boolean canReachTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### isWindowBlockedTo

    public boolean isWindowBlockedTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### hasBlockedWindow

    public boolean hasBlockedWindow(boolean north)
  + ### isDoorBlockedTo

    public boolean isDoorBlockedTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### hasBlockedDoor

    public boolean hasBlockedDoor(boolean north)
  + ### getCurtain

    public [IsoCurtain](objects/IsoCurtain.html "class in zombie.iso.objects") getCurtain([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") curtainType)
  + ### getHoppable

    public [IsoObject](IsoObject.html "class in zombie.iso") getHoppable(boolean north)
  + ### getHoppableTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getHoppableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### isHoppableTo

    public boolean isHoppableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### getBendable

    public [IsoObject](IsoObject.html "class in zombie.iso") getBendable(boolean north)
  + ### getBendableTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getBendableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### discard

    public void discard()
  + ### DistTo

    public float DistTo(int x,
    int y)
  + ### DistTo

    public float DistTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### DistToProper

    public float DistToProper(int x,
    int y)
  + ### DistToProper

    public float DistToProper([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### DistTo

    public float DistTo([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### DistToProper

    public float DistToProper([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### isSafeToSpawn

    public boolean isSafeToSpawn()
  + ### isSafeToSpawn

    public void isSafeToSpawn([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    int depth)
  + ### renderAttachedSpritesWithNoWallLighting

    private void renderAttachedSpritesWithNoWallLighting([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### calculateCutawayOutlineAlpha

    private float calculateCutawayOutlineAlpha(int playerIndex,
    boolean north)
  + ### DoCutawayShader

    public void DoCutawayShader([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    boolean bHasDoorN,
    boolean bHasDoorW,
    boolean bHasWindowN,
    boolean bHasWindowW,
    zombie.iso.sprite.shapers.WallShaper texdModifier)
  + ### DoCutawayShaderAttached

    private void DoCutawayShaderAttached([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex2,
    boolean noWallLighting,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo,
    int cutawayX,
    int cutawayY,
    int cutawayW,
    int cutawayH,
    int col0,
    int col1,
    int col2,
    int col3,
    [SpriteRenderer.WallShaderTexRender](../core/SpriteRenderer.WallShaderTexRender.html "enum class in zombie.core") wallShaderTexRender)
  + ### DoCutawayShaderSprite

    public void DoCutawayShaderSprite([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE)
  + ### DoWallLightingNW

    public int DoWallLightingNW([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int stenciled,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    boolean bHasDoorN,
    boolean bHasDoorW,
    boolean bHasWindowN,
    boolean bHasWindowW,
    zombie.core.opengl.Shader wallRenderShader)
  + ### DoWallLightingN

    public int DoWallLightingN([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int stenciled,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    boolean bHasDoorN,
    boolean bHasWindowN,
    zombie.core.opengl.Shader wallRenderShader)
  + ### DoWallLightingW

    public int DoWallLightingW([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int stenciled,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    boolean bHasDoorW,
    boolean bHasWindowW,
    zombie.core.opengl.Shader wallRenderShader)
  + ### performDrawWallSegmentSingle

    private int performDrawWallSegmentSingle([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int stenciled,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    boolean bHasDoorW,
    boolean bHasWindowW,
    boolean bHasDoorN,
    boolean bHasWindowN,
    boolean hasNoDoor,
    boolean hasNoWindow,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorFrType,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorType,
    boolean isCutaway,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentFlag,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentWindowFlag,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") hoppableType,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") cutawayDirection,
    boolean circleStencil,
    zombie.iso.sprite.shapers.WallShaperWhole texdModifier,
    zombie.core.opengl.Shader wallRenderShader)
  + ### performDrawWallOnly

    private int performDrawWallOnly([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int stenciled,
    int playerIndex,
    boolean noWallLighting,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier,
    zombie.core.opengl.Shader wallRenderShader)
  + ### performDrawWall

    private int performDrawWall([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int stenciled,
    int playerIndex,
    boolean noWallLighting,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier,
    zombie.core.opengl.Shader wallRenderShader)
  + ### calculateWallAlphaCommon

    private void calculateWallAlphaCommon([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean isCutaway,
    boolean bHasDoor,
    boolean bHasWindow,
    int playerIndex,
    boolean isDoor,
    boolean isWindow)
  + ### calculateWallAlphaAndCircleStencilEdge

    private boolean calculateWallAlphaAndCircleStencilEdge([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean hasNoDoor,
    boolean hasNoWindow,
    boolean isCutaway,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentFlag,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentWindowFlag,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") hoppableType,
    boolean circleStencil,
    int playerIndex,
    boolean isDoor,
    boolean isWindow)
  + ### calculateWallAlphaAndCircleStencilCorner

    private boolean calculateWallAlphaAndCircleStencilCorner([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int cutawaySelf,
    boolean bHasDoorN,
    boolean bHasDoorW,
    boolean bHasWindowN,
    boolean bHasWindowW,
    boolean circleStencil,
    int playerIndex,
    boolean isDoorN,
    boolean isDoorW,
    boolean isWindowN,
    boolean isWindowW)
  + ### getLuaMovingObjectList

    public se.krka.kahlua.vm.KahluaTable getLuaMovingObjectList()
  + ### has

    public boolean has([IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### has

    public boolean has([IsoPropertyType](../core/properties/IsoPropertyType.html "enum class in zombie.core.properties") flag)
  + ### has

    public boolean has([IsoPropertyType](../core/properties/IsoPropertyType.html "enum class in zombie.core.properties")... flag)
  + ### has

    public boolean has([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") flag)
  + ### has

    public boolean has([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") type)
  + ### has

    public boolean has(int type)
  + ### set

    public void set([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilePropertyKey)
  + ### unset

    public void unset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilePropertyKey)
  + ### DeleteTileObject

    public void DeleteTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getLuaTileObjectList

    public se.krka.kahlua.vm.KahluaTable getLuaTileObjectList()
  + ### HasDoor

    boolean HasDoor(boolean north)
  + ### HasStairs

    public boolean HasStairs()
  + ### HasStairsNorth

    public boolean HasStairsNorth()
  + ### HasStairsWest

    public boolean HasStairsWest()
  + ### isStairBlockedTo

    public boolean isStairBlockedTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### HasStairTop

    public boolean HasStairTop()
  + ### HasStairTopNorth

    public boolean HasStairTopNorth()
  + ### HasStairTopWest

    public boolean HasStairTopWest()
  + ### HasStairsBelow

    public boolean HasStairsBelow()
  + ### getStairPillar

    public [IsoObject](IsoObject.html "class in zombie.iso") getStairPillar()
  + ### getFloorSquareBelow

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFloorSquareBelow()
  + ### hasFloorBelow

    public boolean hasFloorBelow()
  + ### getObjectWithSprite

    public [IsoObject](IsoObject.html "class in zombie.iso") getObjectWithSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### hasFloorAtTopOfStairs

    public boolean hasFloorAtTopOfStairs()
  + ### getStairs

    public [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") getStairs()
  + ### HasElevatedFloor

    public boolean HasElevatedFloor()
  + ### isSameStaircase

    public boolean isSameStaircase(int x,
    int y,
    int z)
  + ### hasRainBlockingTile

    public boolean hasRainBlockingTile()
  + ### haveRoofFull

    public boolean haveRoofFull()
  + ### HasSlopedRoof

    public boolean HasSlopedRoof()
  + ### HasSlopedRoofWest

    public boolean HasSlopedRoofWest()
  + ### HasSlopedRoofNorth

    public boolean HasSlopedRoofNorth()
  + ### HasEave

    public boolean HasEave()
  + ### HasTree

    public boolean HasTree()
  + ### getTree

    public [IsoTree](objects/IsoTree.html "class in zombie.iso.objects") getTree()
  + ### getStump

    public [IsoObject](IsoObject.html "class in zombie.iso") getStump()
  + ### getOre

    public [IsoObject](IsoObject.html "class in zombie.iso") getOre()
  + ### hasBush

    public boolean hasBush()
  + ### getBush

    public [IsoObject](IsoObject.html "class in zombie.iso") getBush()
  + ### getBushes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getBushes()
  + ### getGrass

    public [IsoObject](IsoObject.html "class in zombie.iso") getGrass()
  + ### hasGrassLike

    public boolean hasGrassLike()
  + ### getGrassLike

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getGrassLike()
  + ### getOres

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getOres()
  + ### getCountertopObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getCountertopObject()
  + ### getCountertopAttachObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getCountertopAttachObject()
  + ### shouldSave

    public boolean shouldSave()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [ObjectOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/ObjectOutputStream.html "class or interface in java.io") outputObj)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [ObjectOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/ObjectOutputStream.html "class or interface in java.io") outputObj,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadmatrix

    static void loadmatrix(boolean[][][] matrix,
    [DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### savematrix

    static void savematrix(boolean[][][] matrix,
    [DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isCommonGrass

    public boolean isCommonGrass()
  + ### toBoolean

    public static boolean toBoolean(byte[] data)
  + ### removeCorpse

    public void removeCorpse([IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    boolean bRemote)
  + ### getDeadBody

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") getDeadBody()
  + ### getDeadBodys

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects")> getDeadBodys()
  + ### addCorpse

    public void addCorpse([IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    boolean bRemote)
  + ### getBrokenGlass

    public [IsoBrokenGlass](objects/IsoBrokenGlass.html "class in zombie.iso.objects") getBrokenGlass()
  + ### addBrokenGlass

    public [IsoBrokenGlass](objects/IsoBrokenGlass.html "class in zombie.iso.objects") addBrokenGlass()
  + ### getFire

    public [IsoFire](objects/IsoFire.html "class in zombie.iso.objects") getFire()
  + ### getHiddenStash

    public [IsoObject](IsoObject.html "class in zombie.iso") getHiddenStash()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### debugPrintGridSquare

    private void debugPrintGridSquare()
  + ### scoreAsWaypoint

    public float scoreAsWaypoint(int x,
    int y)
  + ### InvalidateSpecialObjectPaths

    public void InvalidateSpecialObjectPaths()
  + ### isSolid

    public boolean isSolid()
  + ### isSolidTrans

    public boolean isSolidTrans()
  + ### isFree

    public boolean isFree(boolean bCountOtherCharacters)
  + ### isFreeOrMidair

    public boolean isFreeOrMidair(boolean bCountOtherCharacters)
  + ### isFreeOrMidair

    public boolean isFreeOrMidair(boolean bCountOtherCharacters,
    boolean bDoZombie)
  + ### connectedWithFloor

    public boolean connectedWithFloor()
  + ### hasFloor

    public boolean hasFloor(boolean north)
  + ### hasFloor

    public boolean hasFloor()
  + ### isNotBlocked

    public boolean isNotBlocked(boolean bCountOtherCharacters)
  + ### getDoor

    public [IsoObject](IsoObject.html "class in zombie.iso") getDoor(boolean north)
  + ### getIsoDoor

    public [IsoDoor](objects/IsoDoor.html "class in zombie.iso.objects") getIsoDoor()
  + ### getDoorTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getDoorTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getWindow

    public [IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") getWindow(boolean north)
  + ### getWindow

    public [IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") getWindow()
  + ### getWindowTo

    public [IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") getWindowTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### isAdjacentToWindow

    public boolean isAdjacentToWindow()
  + ### isAdjacentToHoppable

    public boolean isAdjacentToHoppable()
  + ### getThumpableWindow

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") getThumpableWindow(boolean north)
  + ### getWindowThumpableTo

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") getWindowThumpableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getThumpable

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") getThumpable(boolean north)
  + ### getHoppableThumpable

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") getHoppableThumpable(boolean north)
  + ### getHoppableThumpableTo

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") getHoppableThumpableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getWallHoppable

    public [IsoObject](IsoObject.html "class in zombie.iso") getWallHoppable(boolean north)
  + ### getWallHoppableTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getWallHoppableTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getBedTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getBedTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getWindowFrame

    public [IsoWindowFrame](objects/IsoWindowFrame.html "class in zombie.iso.objects") getWindowFrame(boolean north)
  + ### getWindowFrameTo

    public [IsoWindowFrame](objects/IsoWindowFrame.html "class in zombie.iso.objects") getWindowFrameTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### hasWindowFrame

    public boolean hasWindowFrame()
  + ### hasWindowOrWindowFrame

    public boolean hasWindowOrWindowFrame()
  + ### getSpecialWall

    private [IsoObject](IsoObject.html "class in zombie.iso") getSpecialWall(boolean north)
  + ### getSheetRope

    public [IsoObject](IsoObject.html "class in zombie.iso") getSheetRope()
  + ### damageSpriteSheetRopeFromBottom

    public boolean damageSpriteSheetRopeFromBottom([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean north)
  + ### removeSheetRopeFromBottom

    public boolean removeSheetRopeFromBottom([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean north)
  + ### getSpecialSolid

    private [IsoObject](IsoObject.html "class in zombie.iso") getSpecialSolid()
  + ### testCollideSpecialObjects

    public [IsoObject](IsoObject.html "class in zombie.iso") testCollideSpecialObjects([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getDoorFrameTo

    public [IsoObject](IsoObject.html "class in zombie.iso") getDoorFrameTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") next)
  + ### getSquaresForThread

    public static void getSquaresForThread([ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> isoGridSquareCacheDest,
    int count)
  + ### getNew

    public static [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getNew([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [SliceY](SliceY.html "class in zombie.iso") slice,
    int x,
    int y,
    int z)
  + ### getNew

    public static [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getNew([ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> isoGridSquareCache,
    [IsoCell](IsoCell.html "class in zombie.iso") cell,
    [SliceY](SliceY.html "class in zombie.iso") slice,
    int x,
    int y,
    int z)
  + ### getHashCodeObjects

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public long getHashCodeObjects()

    Deprecated.
  + ### getHashCodeObjectsInt

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getHashCodeObjectsInt()

    Deprecated.
  + ### recalcHashCodeObjects

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void recalcHashCodeObjects()

    Deprecated.
  + ### hashCodeNoOverride

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int hashCodeNoOverride()

    Deprecated.
  + ### getTileInDirection

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getTileInDirection([IsoDirections](IsoDirections.html "enum class in zombie.iso") directions)
  + ### getWall

    public [IsoObject](IsoObject.html "class in zombie.iso") getWall()
  + ### getThumpableWall

    public [IsoObject](IsoObject.html "class in zombie.iso") getThumpableWall(boolean bNorth)
  + ### getHoppableWall

    public [IsoObject](IsoObject.html "class in zombie.iso") getHoppableWall(boolean bNorth)
  + ### getThumpableWallOrHoppable

    public [IsoObject](IsoObject.html "class in zombie.iso") getThumpableWallOrHoppable(boolean bNorth)
  + ### getWallFull

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getWallFull()
  + ### hasNonHoppableWall

    public boolean hasNonHoppableWall(boolean isNorth)
  + ### isPlayerAbleToHopWallTo

    public boolean isPlayerAbleToHopWallTo([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") oppositeSq)
  + ### getWallExcludingList

    [IsoObject](IsoObject.html "class in zombie.iso") getWallExcludingList(boolean bNorth,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> excluded)
  + ### getWallExcludingObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getWallExcludingObject(boolean bNorth,
    [IsoObject](IsoObject.html "class in zombie.iso") exclude)
  + ### getWall

    public [IsoObject](IsoObject.html "class in zombie.iso") getWall(boolean bNorth)
  + ### getWallSE

    public [IsoObject](IsoObject.html "class in zombie.iso") getWallSE()
  + ### getWallNW

    public [IsoObject](IsoObject.html "class in zombie.iso") getWallNW()
  + ### getGarageDoor

    public [IsoObject](IsoObject.html "class in zombie.iso") getGarageDoor(boolean bNorth)
  + ### getFloor

    public [IsoObject](IsoObject.html "class in zombie.iso") getFloor()
  + ### getPlayerBuiltFloor

    public [IsoObject](IsoObject.html "class in zombie.iso") getPlayerBuiltFloor()
  + ### getWaterObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getWaterObject()
  + ### interpolateLight

    public void interpolateLight([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") inf,
    float x,
    float y)
  + ### EnsureSurroundNotNull

    public void EnsureSurroundNotNull()
  + ### setSquareChanged

    public void setSquareChanged()
  + ### addFloor

    public [IsoObject](IsoObject.html "class in zombie.iso") addFloor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### addUndergroundBlock

    public [IsoObject](IsoObject.html "class in zombie.iso") addUndergroundBlock([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### isUndergroundBlock

    public boolean isUndergroundBlock()
  + ### AddStairs

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") AddStairs(boolean north,
    int level,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pillarSprite,
    se.krka.kahlua.vm.KahluaTable table)
  + ### ReCalculateAll

    void ReCalculateAll([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") a)
  + ### ReCalculateAll

    void ReCalculateAll([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") a,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### ReCalculateAll

    void ReCalculateAll(boolean bDoReverse,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") a,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### ReCalculateMineOnly

    void ReCalculateMineOnly([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") a)
  + ### getOpenAir

    public boolean getOpenAir()
  + ### RecalcAllWithNeighbours

    public void RecalcAllWithNeighbours(boolean bDoReverse)
  + ### RecalcAllWithNeighbours

    public void RecalcAllWithNeighbours(boolean bDoReverse,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### RecalcAllWithNeighboursMineOnly

    public void RecalcAllWithNeighboursMineOnly()
  + ### IsWindow

    boolean IsWindow(int sx,
    int sy,
    int sz)
  + ### RemoveAllWith

    void RemoveAllWith([IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") propertyType)
  + ### hasSupport

    public boolean hasSupport()
  + ### getID

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") getID()
  + ### setID

    public void setID(int id)
  + ### savematrix

    private int savematrix(boolean[][][] pathMatrix,
    byte[] databytes,
    int index)
  + ### loadmatrix

    private int loadmatrix(boolean[][][] pathMatrix,
    byte[] databytes,
    int index)
  + ### savematrix

    private void savematrix(boolean[][][] pathMatrix,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") databytes)
  + ### loadmatrix

    private void loadmatrix(boolean[][][] pathMatrix,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") databytes)
  + ### DirtySlice

    public void DirtySlice()
  + ### setHourSeenToCurrent

    public void setHourSeenToCurrent()
  + ### splatBlood

    public void splatBlood(int dist,
    float alpha)
  + ### haveBlood

    public boolean haveBlood()
  + ### haveBloodWall

    public boolean haveBloodWall()
  + ### haveBloodFloor

    public boolean haveBloodFloor()
  + ### haveGrime

    public boolean haveGrime()
  + ### haveGrimeWall

    public boolean haveGrimeWall()
  + ### haveGrimeFloor

    public boolean haveGrimeFloor()
  + ### haveGraffiti

    public boolean haveGraffiti()
  + ### getGraffitiObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getGraffitiObject()
  + ### haveStains

    public boolean haveStains()
  + ### removeGrime

    public void removeGrime()
  + ### removeGraffiti

    public void removeGraffiti()
  + ### removeBlood

    public void removeBlood(boolean remote,
    boolean onlyWall)
  + ### DoSplat

    public void DoSplat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    boolean bFlip,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") prop,
    float offX,
    float offZ,
    float alpha)
  + ### ClearTileObjects

    public void ClearTileObjects()
  + ### ClearTileObjectsExceptFloor

    public void ClearTileObjectsExceptFloor()
  + ### RemoveTileObject

    public int RemoveTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### RemoveTileObject

    public int RemoveTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean safelyRemove)
  + ### RemoveTileObjectErosionNoRecalc

    public int RemoveTileObjectErosionNoRecalc([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### AddSpecialObject

    public void AddSpecialObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### AddSpecialObject

    public void AddSpecialObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int index)
  + ### AddTileObject

    public void AddTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### AddTileObject

    public void AddTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int index)
  + ### placeWallAndDoorCheck

    public int placeWallAndDoorCheck([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int index)
  + ### transmitAddObjectToSquare

    public void transmitAddObjectToSquare([IsoObject](IsoObject.html "class in zombie.iso") obj,
    int index)
  + ### transmitRemoveItemFromSquare

    public int transmitRemoveItemFromSquare([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### transmitRemoveItemFromSquare

    public int transmitRemoveItemFromSquare([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean safelyRemove)
  + ### transmitRemoveItemFromSquareOnClients

    public void transmitRemoveItemFromSquareOnClients([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### transmitModdata

    public void transmitModdata()
  + ### SpawnWorldInventoryItem

    public void SpawnWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height,
    int nbr)
  + ### SpawnWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") SpawnWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height)
  + ### SpawnWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") SpawnWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height,
    boolean autoAge)
  + ### AddWorldInventoryItem

    public void AddWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height,
    int nbr)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") itemKey,
    float x,
    float y,
    float height)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") itemKey,
    float x,
    float y,
    float height,
    boolean autoAge)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height,
    boolean autoAge)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float x,
    float y,
    float height,
    boolean autoAge,
    boolean synchSpawn)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y,
    float height)
  + ### createAnimalCorpseFromItem

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") createAnimalCorpseFromItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### SpawnWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") SpawnWorldInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y,
    float height,
    boolean transmit)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y,
    float height,
    boolean transmit)
  + ### AddWorldInventoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") AddWorldInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y,
    float height,
    boolean transmit,
    boolean synchSpawn)
  + ### tryAddCorpseToWorld

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") tryAddCorpseToWorld([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y)
  + ### tryAddCorpseToWorld

    public @Nullable [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") tryAddCorpseToWorld([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float x,
    float y,
    boolean isVisible)
  + ### restackSheetRope

    public void restackSheetRope()
  + ### Burn

    public void Burn()
  + ### Burn

    public void Burn(boolean explode)
  + ### BurnWalls

    public void BurnWalls(boolean explode,
    boolean recursive)
  + ### BurnWallsTCOnly

    public void BurnWallsTCOnly()
  + ### BurnTick

    public void BurnTick()
  + ### CalculateCollide

    public boolean CalculateCollide([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean bVision,
    boolean bPathfind,
    boolean bIgnoreSolidTrans)
  + ### CalculateCollide

    public boolean CalculateCollide([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean bVision,
    boolean bPathfind,
    boolean bIgnoreSolidTrans,
    boolean bIgnoreSolid)
  + ### CalculateCollide

    public boolean CalculateCollide([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean bVision,
    boolean bPathfind,
    boolean bIgnoreSolidTrans,
    boolean bIgnoreSolid,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### CalculateVisionBlocked

    public boolean CalculateVisionBlocked([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare)
  + ### CalculateVisionBlocked

    public boolean CalculateVisionBlocked([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### FindFriend

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") FindFriend([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") g,
    int range,
    [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> enemyList)
  + ### FindEnemy

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") FindEnemy([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") g,
    int range,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> enemyList,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") rangeTest,
    int testRangeMax)
  + ### FindEnemy

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") FindEnemy([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") g,
    int range,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> enemyList)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### getCenterX

    public float getCenterX()
  + ### getCenterY

    public float getCenterY()
  + ### RecalcProperties

    public void RecalcProperties()
  + ### RecalcPropertiesIfNeeded

    public void RecalcPropertiesIfNeeded()
  + ### ReCalculateCollide

    public void ReCalculateCollide([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### ReCalculateCollide

    public void ReCalculateCollide([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### ReCalculatePathFind

    public void ReCalculatePathFind([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### ReCalculatePathFind

    public void ReCalculatePathFind([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### ReCalculateVisionBlocked

    public void ReCalculateVisionBlocked([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### ReCalculateVisionBlocked

    public void ReCalculateVisionBlocked([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### testCollideSpecialObjects

    private static boolean testCollideSpecialObjects([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") collideObject,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqFrom,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqTo)
  + ### testCollideAdjacent

    public boolean testCollideAdjacent([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") collideObject,
    int x,
    int y,
    int z)
  + ### testCollideAdjacentAdvanced

    public boolean testCollideAdjacentAdvanced(int x,
    int y,
    int z,
    boolean ignoreDoors)
  + ### setCollisionMode

    public static void setCollisionMode()
  + ### testPathFindAdjacent

    public boolean testPathFindAdjacent([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") mover,
    int x,
    int y,
    int z)
  + ### testPathFindAdjacent

    public boolean testPathFindAdjacent([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") mover,
    int x,
    int y,
    int z,
    [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### testVisionAdjacent

    public [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") testVisionAdjacent(int x,
    int y,
    int z,
    boolean specialDiag,
    boolean bIgnoreDoors)
  + ### TreatAsSolidFloor

    public boolean TreatAsSolidFloor()
  + ### AddSpecialTileObject

    public void AddSpecialTileObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### renderCharacters

    public void renderCharacters(int maxZ,
    boolean deadRender,
    boolean doBlendFunc)
  + ### renderDeferredCharacters

    public void renderDeferredCharacters(int maxZ)
  + ### switchLight

    public void switchLight(boolean active)
  + ### removeGlassAttachments

    public void removeGlassAttachments([IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### IsOnScreen

    public boolean IsOnScreen()
  + ### IsOnScreen

    public boolean IsOnScreen(boolean halfTileBorder)
  + ### initWaterSplashCache

    private static void initWaterSplashCache()
  + ### startWaterSplash

    public void startWaterSplash(boolean isBigSplash,
    float dx,
    float dy)
  + ### startWaterSplash

    public void startWaterSplash(boolean isBigSplash)
  + ### shouldRenderFishSplash

    public boolean shouldRenderFishSplash(int playerIndex)
  + ### getLightInfo

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getLightInfo(int playerNumber)
  + ### cacheLightInfo

    public void cacheLightInfo()
  + ### setLightInfoServerGUIOnly

    public void setLightInfoServerGUIOnly([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") c)
  + ### renderFloor

    public int renderFloor(zombie.core.opengl.Shader floorShader)
  + ### renderFloorInternal

    private int renderFloorInternal(zombie.core.opengl.Shader floorShader)
  + ### renderRainSplash

    public void renderRainSplash(int playerIndex,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)
  + ### renderRainSplash

    public void renderRainSplash(int playerIndex,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo,
    float splashFrame,
    boolean bRandomXY)
  + ### renderFishSplash

    public void renderFishSplash(int playerIndex,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)
  + ### isSpriteOnSouthOrEastWall

    public boolean isSpriteOnSouthOrEastWall([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### RenderOpenDoorOnly

    public void RenderOpenDoorOnly()
  + ### RenderMinusFloorFxMask

    public boolean RenderMinusFloorFxMask(int maxZ,
    boolean doSE,
    boolean vegitationRender)
  + ### isWindowOrWindowFrame

    public boolean isWindowOrWindowFrame([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean north)
  + ### renderMinusFloor

    public boolean renderMinusFloor(int maxZ,
    boolean doSE,
    boolean vegitationRender,
    int cutawaySelf,
    int cutawayN,
    int cutawayS,
    int cutawayW,
    int cutawayE,
    zombie.core.opengl.Shader wallRenderShader)
  + ### RereouteWallMaskTo

    void RereouteWallMaskTo([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### setBlockedGridPointers

    void setBlockedGridPointers([IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso") getter)
  + ### getContainerItem

    public [IsoObject](IsoObject.html "class in zombie.iso") getContainerItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### StartFire

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void StartFire()

    Deprecated.
  + ### getHourLastSeen

    public int getHourLastSeen()
  + ### getHoursSinceLastSeen

    public float getHoursSinceLastSeen()
  + ### CalcVisibility

    public void CalcVisibility(int playerIndex,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    zombie.characters.VisibilityData visibilityData)
  + ### DoDiagnalCheck

    private [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") DoDiagnalCheck(int x,
    int y,
    int z,
    boolean bIgnoreDoors)
  + ### HasNoCharacters

    boolean HasNoCharacters()
  + ### getZombie

    public [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") getZombie()
  + ### getPlayer

    public [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayer()
  + ### getDarkStep

    public static float getDarkStep()
  + ### setDarkStep

    public static void setDarkStep(float aDarkStep)
  + ### getRecalcLightTime

    public static float getRecalcLightTime()
  + ### setRecalcLightTime

    public static void setRecalcLightTime(float aRecalcLightTime)
  + ### getLightcache

    public static int getLightcache()
  + ### setLightcache

    public static void setLightcache(int aLightcache)
  + ### isCouldSee

    public boolean isCouldSee(int playerIndex)
  + ### setCouldSee

    public void setCouldSee(int playerIndex,
    boolean bCouldSee)
  + ### isCanSee

    public boolean isCanSee(int playerIndex)
  + ### setCanSee

    public void setCanSee(int playerIndex,
    boolean canSee)
  + ### getCell

    public [IsoCell](IsoCell.html "class in zombie.iso") getCell()
  + ### getE

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getE()

    Returns:
    :   the e
  + ### setE

    public void setE([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") e)
  + ### getLightInfluenceB

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getLightInfluenceB()
  + ### setLightInfluenceB

    public void setLightInfluenceB([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceB)
  + ### getLightInfluenceG

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getLightInfluenceG()
  + ### setLightInfluenceG

    public void setLightInfluenceG([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceG)

    Parameters:
    :   `lightInfluenceG` - the LightInfluenceG to set
  + ### getLightInfluenceR

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getLightInfluenceR()
  + ### setLightInfluenceR

    public void setLightInfluenceR([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> lightInfluenceR)
  + ### getStaticMovingObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getStaticMovingObjects()
  + ### getStaticMovingObjects

    public <ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<ObjectType> getStaticMovingObjects([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends ObjectType> objectType,
    [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<ObjectType> objectFilter)
  + ### getStaticMovingObjectsInNearbySquares

    public <ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<ObjectType> getStaticMovingObjectsInNearbySquares([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends ObjectType> objectType,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso"), [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareFilter,
    [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<ObjectType> objectFilter)
  + ### visitStaticMovingObjects

    public <Param, ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    Param visitStaticMovingObjects([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends ObjectType> objectType,
    Param param,
    [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<ObjectType> objectFilter,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<Param, ObjectType> objectVisitor)
  + ### visitStaticMovingObjectsInNearbySquares

    public <Param, ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    Param visitStaticMovingObjectsInNearbySquares([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends ObjectType> objectType,
    Param param,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso"), [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareFilter,
    [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<ObjectType> objectFilter,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<Param, ObjectType> objectVisitor)
  + ### getMovingObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getMovingObjects()
  + ### visitNearbySquares

    public <Param> Param visitNearbySquares(Param param,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso"), [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareFilter,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<Param, [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareVisitor)
  + ### getN

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getN()
  + ### setN

    public void setN([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") n)
  + ### getObjects

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[IsoObject](IsoObject.html "class in zombie.iso")> getObjects()
  + ### getProperties

    public [PropertyContainer](../core/properties/PropertyContainer.html "class in zombie.core.properties") getProperties()
  + ### getRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getRoom()
  + ### setRoom

    public void setRoom([IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") room)
  + ### getRoomDef

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoomDef()
  + ### getBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getBuilding()
  + ### getBuildingDef

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getBuildingDef()
  + ### getS

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getS()
  + ### setS

    public void setS([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") s)
  + ### getSpecialObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getSpecialObjects()
  + ### getW

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getW()
  + ### setW

    public void setW([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") w)

    Parameters:
    :   `w` - the w to set
  + ### getLampostTotalR

    public float getLampostTotalR()
  + ### setLampostTotalR

    public void setLampostTotalR(float lampostTotalR)
  + ### getLampostTotalG

    public float getLampostTotalG()
  + ### setLampostTotalG

    public void setLampostTotalG(float lampostTotalG)
  + ### getLampostTotalB

    public float getLampostTotalB()
  + ### setLampostTotalB

    public void setLampostTotalB(float lampostTotalB)
  + ### isSeen

    public boolean isSeen(int playerIndex)
  + ### setIsSeen

    public void setIsSeen(int playerIndex,
    boolean bSeen)
  + ### getDarkMulti

    public float getDarkMulti(int playerIndex)
  + ### setDarkMulti

    public void setDarkMulti(int playerIndex,
    float darkMulti)
  + ### getTargetDarkMulti

    public float getTargetDarkMulti(int playerIndex)
  + ### setTargetDarkMulti

    public void setTargetDarkMulti(int playerIndex,
    float targetDarkMulti)
  + ### setX

    public void setX(int x)
  + ### setY

    public void setY(int y)
  + ### setZ

    public void setZ(int z)
  + ### getDeferedCharacters

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> getDeferedCharacters()
  + ### addDeferredCharacter

    public void addDeferredCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isCacheIsFree

    public boolean isCacheIsFree()
  + ### setCacheIsFree

    public void setCacheIsFree(boolean cacheIsFree)
  + ### isCachedIsFree

    public boolean isCachedIsFree()
  + ### setCachedIsFree

    public void setCachedIsFree(boolean cachedIsFree)
  + ### isbDoSlowPathfinding

    public static boolean isbDoSlowPathfinding()
  + ### setbDoSlowPathfinding

    public static void setbDoSlowPathfinding(boolean abDoSlowPathfinding)
  + ### isSolidFloorCached

    public boolean isSolidFloorCached()
  + ### setSolidFloorCached

    public void setSolidFloorCached(boolean solidFloorCached)
  + ### isSolidFloor

    public boolean isSolidFloor()
  + ### setSolidFloor

    public void setSolidFloor(boolean solidFloor)
  + ### getDefColorInfo

    public static [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getDefColorInfo()
  + ### isOutside

    public boolean isOutside()
  + ### HasPushable

    public boolean HasPushable()
  + ### setRoomID

    public void setRoomID(long roomId)
  + ### getRoomID

    public long getRoomID()
  + ### getRoomIDString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRoomIDString()
  + ### getCanSee

    public boolean getCanSee(int playerIndex)
  + ### getSeen

    public boolean getSeen(int playerIndex)
  + ### getChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunk()
  + ### getDoorOrWindow

    public [IsoObject](IsoObject.html "class in zombie.iso") getDoorOrWindow(boolean north)
  + ### getDoorOrWindowOrWindowFrame

    public [IsoObject](IsoObject.html "class in zombie.iso") getDoorOrWindowOrWindowFrame([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    boolean ignoreOpen)
  + ### getOpenDoor

    public [IsoObject](IsoObject.html "class in zombie.iso") getOpenDoor([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### removeWorldObject

    public void removeWorldObject([IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") object)
  + ### removeAllWorldObjects

    public void removeAllWorldObjects()
  + ### getWorldObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> getWorldObjects()
  + ### getNextNonItemObjectIndex

    public int getNextNonItemObjectIndex(int index)
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### hasModData

    public boolean hasModData()
  + ### setVertLight

    public void setVertLight(int i,
    int col,
    int playerIndex)
  + ### getVertLight

    public int getVertLight(int i,
    int playerIndex)
  + ### setRainDrop

    public void setRainDrop(zombie.iso.objects.IsoRaindrop drop)
  + ### getRainDrop

    public zombie.iso.objects.IsoRaindrop getRainDrop()
  + ### setRainSplash

    public void setRainSplash(zombie.iso.objects.IsoRainSplash splash)
  + ### getRainSplash

    public zombie.iso.objects.IsoRainSplash getRainSplash()
  + ### getZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZone()
  + ### getZoneType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getZoneType()
  + ### isOverlayDone

    public boolean isOverlayDone()
  + ### setOverlayDone

    public void setOverlayDone(boolean overlayDone)
  + ### getErosionData

    public zombie.erosion.ErosionData.Square getErosionData()
  + ### disableErosion

    public void disableErosion()
  + ### removeErosionObject

    public void removeErosionObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### syncIsoTrap

    public void syncIsoTrap([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") attacker)
  + ### getTrapPositionX

    public int getTrapPositionX()
  + ### setTrapPositionX

    public void setTrapPositionX(int trapPositionX)
  + ### getTrapPositionY

    public int getTrapPositionY()
  + ### setTrapPositionY

    public void setTrapPositionY(int trapPositionY)
  + ### getTrapPositionZ

    public int getTrapPositionZ()
  + ### setTrapPositionZ

    public void setTrapPositionZ(int trapPositionZ)
  + ### haveElectricity

    public boolean haveElectricity()
  + ### setHaveElectricity

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setHaveElectricity(boolean haveElectricity)

    Deprecated.
  + ### getGenerator

    public [IsoGenerator](objects/IsoGenerator.html "class in zombie.iso.objects") getGenerator()
  + ### stopFire

    public void stopFire()
  + ### transmitStopFire

    public void transmitStopFire()
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSoundLocal

    public long playSoundLocal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSound

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound)

    Deprecated.
  + ### FixStackableObjects

    public void FixStackableObjects()
  + ### setTableTopObjectDirection

    private void setTableTopObjectDirection([IsoObject](IsoObject.html "class in zombie.iso") table,
    [IsoObject](IsoObject.html "class in zombie.iso") obj,
    [PropertyContainer](../core/properties/PropertyContainer.html "class in zombie.core.properties") props)
  + ### fixPlacedItemRenderOffsets

    public void fixPlacedItemRenderOffsets()
  + ### getVehicleContainer

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getVehicleContainer()
  + ### isVehicleIntersecting

    public boolean isVehicleIntersecting()
  + ### isVehicleIntersectingCrops

    public boolean isVehicleIntersectingCrops()
  + ### getDeviceData

    public [DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") getDeviceData()
  + ### checkForIntersectingCrops

    public void checkForIntersectingCrops([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### getCompost

    public [IsoCompost](objects/IsoCompost.html "class in zombie.iso.objects") getCompost()
  + ### getAllContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getAllContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getAllContainersFromAdjacentSquare

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getAllContainersFromAdjacentSquare([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getObjectContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getObjectContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### setIsoWorldRegion

    public void setIsoWorldRegion([IsoWorldRegion](areas/isoregion/regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") mr)
  + ### getIsoWorldRegion

    public zombie.iso.areas.isoregion.regions.IWorldRegion getIsoWorldRegion()
  + ### ResetIsoWorldRegion

    public void ResetIsoWorldRegion()
  + ### isInARoom

    public boolean isInARoom()
  + ### getRoomSize

    public int getRoomSize()
  + ### getWallType

    public int getWallType()
  + ### getPuddlesDir

    public int getPuddlesDir()
  + ### haveFire

    public boolean haveFire()
  + ### getRoofHideBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getRoofHideBuilding()
  + ### getAdjacentSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getAdjacentSquare([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### setAdjacentSquare

    public void setAdjacentSquare([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getSurroundingSquares

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] getSurroundingSquares()
  + ### getSquareAbove

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getSquareAbove()
  + ### getAdjacentPathSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getAdjacentPathSquare([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getApparentZ

    public float getApparentZ(float dx,
    float dy)
  + ### getStairsDirection

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getStairsDirection()
  + ### getStairsHeightMax

    public float getStairsHeightMax()
  + ### getStairsHeightMin

    public float getStairsHeightMin()
  + ### getStairsHeight

    public float getStairsHeight([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### isStairsEdgeBlocked

    public boolean isStairsEdgeBlocked([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### hasSlopedSurface

    public boolean hasSlopedSurface()
  + ### getSlopedSurfaceDirection

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getSlopedSurfaceDirection()
  + ### hasIdenticalSlopedSurface

    public boolean hasIdenticalSlopedSurface([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") other)
  + ### getSlopedSurfaceHeightMin

    public float getSlopedSurfaceHeightMin()
  + ### getSlopedSurfaceHeightMax

    public float getSlopedSurfaceHeightMax()
  + ### getSlopedSurfaceHeight

    public float getSlopedSurfaceHeight(float dx,
    float dy)
  + ### getSlopedSurfaceHeight

    public float getSlopedSurfaceHeight([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### isSlopedSurfaceEdgeBlocked

    public boolean isSlopedSurfaceEdgeBlocked([IsoDirections](IsoDirections.html "enum class in zombie.iso") edge)
  + ### hasSlopedSurfaceToLevelAbove

    public boolean hasSlopedSurfaceToLevelAbove([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getTotalWeightOfItemsOnFloor

    public float getTotalWeightOfItemsOnFloor()
  + ### getCollideMatrix

    public boolean getCollideMatrix(int dx,
    int dy,
    int dz)
  + ### getPathMatrix

    public boolean getPathMatrix(int dx,
    int dy,
    int dz)
  + ### getVisionMatrix

    public boolean getVisionMatrix(int dx,
    int dy,
    int dz)
  + ### checkRoomSeen

    public void checkRoomSeen(int playerIndex)
  + ### hasFlies

    public boolean hasFlies()
  + ### setHasFlies

    public void setHasFlies(boolean hasFlies)
  + ### getLightLevel

    public float getLightLevel(int playerIndex)
  + ### getLightLevel2

    public float getLightLevel2()
  + ### getAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimals([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> result)
  + ### getAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimals()
  + ### checkHaveGrass

    public boolean checkHaveGrass()

    Check if we have or not an attached sprite for blends\_natural\_01\_87, if true it means the grass on this square has already been eaten
  + ### checkHaveDung

    public boolean checkHaveDung()
  + ### removeAllDung

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> removeAllDung()
  + ### removeGrass

    public boolean removeGrass()
  + ### getGrassRegrowthZone

    private [Zone](zones/Zone.html "class in zombie.iso.zones") getGrassRegrowthZone()
  + ### getZombieCount

    public int getZombieCount()
  + ### getSquareRegion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSquareRegion()
  + ### containsVegetation

    public boolean containsVegetation()
  + ### getAnimalTrack

    public [IsoAnimalTrack](objects/IsoAnimalTrack.html "class in zombie.iso.objects") getAnimalTrack()
  + ### hasTrashReceptacle

    public boolean hasTrashReceptacle()
  + ### hasTrash

    public boolean hasTrash()
  + ### getTrashReceptacle

    public [IsoObject](IsoObject.html "class in zombie.iso") getTrashReceptacle()
  + ### isExtraFreeSquare

    public boolean isExtraFreeSquare()
  + ### getRandomAdjacentFreeSameRoom

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomAdjacentFreeSameRoom()
  + ### getZombiesType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getZombiesType()
  + ### getLootZone

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLootZone()
  + ### addTileObject

    public [IsoObject](IsoObject.html "class in zombie.iso") addTileObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### hasSand

    public boolean hasSand()
  + ### hasDirt

    public boolean hasDirt()
  + ### hasNaturalFloor

    public boolean hasNaturalFloor()
  + ### dirtStamp

    public void dirtStamp()
  + ### getRandomAdjacent

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomAdjacent()
  + ### isAdjacentTo

    public boolean isAdjacentTo([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### hasFireObject

    public boolean hasFireObject()
  + ### hasAdjacentFireObject

    public boolean hasAdjacentFireObject()
  + ### addGrindstone

    public void addGrindstone()
  + ### addFreezer

    public void addFreezer()
  + ### addFloodLights

    public void addFloodLights()
  + ### addSpinningWheel

    public void addSpinningWheel()
  + ### addLoom

    public void addLoom()
  + ### addHandPress

    public void addHandPress()
  + ### addWorkstationEntity

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") addWorkstationEntity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptString,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### addWorkstationEntity

    public [IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") addWorkstationEntity([GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### addWorkstationEntity

    public void addWorkstationEntity([IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") thumpable,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script)
  + ### isDoorSquare

    public boolean isDoorSquare()
  + ### isWallSquare

    public boolean isWallSquare()
  + ### isWallSquareNW

    public boolean isWallSquareNW()
  + ### isFreeWallSquare

    public boolean isFreeWallSquare()
  + ### isDoorOrWallSquare

    public boolean isDoorOrWallSquare()
  + ### spawnRandomRuralWorkstation

    public void spawnRandomRuralWorkstation()
  + ### spawnRandomWorkstation

    public void spawnRandomWorkstation()
  + ### isRural

    public boolean isRural()
  + ### isRuralExtraFussy

    public boolean isRuralExtraFussy()
  + ### isFreeWallPair

    public boolean isFreeWallPair([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    boolean both)
  + ### isGoodSquare

    public boolean isGoodSquare()
  + ### isWaterSquare

    public boolean isWaterSquare()
  + ### isGoodOutsideSquare

    public boolean isGoodOutsideSquare()
  + ### addStump

    public void addStump()
  + ### setBlendFunc

    public static void setBlendFunc()
  + ### invalidateRenderChunkLevel

    public void invalidateRenderChunkLevel(long dirtyFlags)
  + ### invalidateVispolyChunkLevel

    public void invalidateVispolyChunkLevel()
  + ### getHutchTiles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoHutch](objects/IsoHutch.html "class in zombie.iso.objects")> getHutchTiles([IsoHutch](objects/IsoHutch.html "class in zombie.iso.objects") sourceHutch)
  + ### getHutch

    public [IsoHutch](objects/IsoHutch.html "class in zombie.iso.objects") getHutch()
  + ### getSquareZombiesType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSquareZombiesType()
  + ### hasRoomDef

    public boolean hasRoomDef()
  + ### spawnRandomGenerator

    public void spawnRandomGenerator()
  + ### spawnRandomNewGenerator

    public void spawnRandomNewGenerator()
  + ### hasGrave

    public boolean hasGrave()
  + ### hasFarmingPlant

    public boolean hasFarmingPlant()
  + ### getFarmingPlant

    public [GlobalObject](../globalObjects/GlobalObject.html "class in zombie.globalObjects") getFarmingPlant()
  + ### destroyFarmingPlant

    public void destroyFarmingPlant()
  + ### hasLitCampfire

    public boolean hasLitCampfire()
  + ### getCampfire

    public [GlobalObject](../globalObjects/GlobalObject.html "class in zombie.globalObjects") getCampfire()
  + ### putOutCampfire

    public void putOutCampfire()
  + ### DoDiagnalCheck

    private zombie.iso.IsoGridSquareCollisionData DoDiagnalCheck(zombie.iso.IsoGridSquareCollisionData isoGridSquareCollisionData,
    int x,
    int y,
    int z,
    boolean bIgnoreDoors)
  + ### getFirstBlocking

    public zombie.iso.IsoGridSquareCollisionData getFirstBlocking(zombie.iso.IsoGridSquareCollisionData isoGridSquareCollisionData,
    int x,
    int y,
    int z,
    boolean specialDiag,
    boolean bIgnoreDoors)
  + ### hasCutawayCapableWallNorth

    private static boolean hasCutawayCapableWallNorth([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### hasCutawayCapableWallWest

    private static boolean hasCutawayCapableWallWest([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### canSpawnVermin

    public boolean canSpawnVermin()
  + ### isNoGas

    public boolean isNoGas()
  + ### isNoPower

    public boolean isNoPower()
  + ### isNoWater

    public boolean isNoWater()
  + ### getButcherHook

    public [IsoButcherHook](IsoButcherHook.html "class in zombie.iso") getButcherHook()
  + ### isShop

    public boolean isShop()
  + ### hasFireplace

    public boolean hasFireplace()
  + ### addCorpse

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") addCorpse()
  + ### addCorpse

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") addCorpse(boolean isSkeleton)
  + ### createCorpse

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse(boolean skeleton)
  + ### createCorpse

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### createCorpse

    public [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie,
    boolean skeleton)
  + ### getBed

    public [IsoObject](IsoObject.html "class in zombie.iso") getBed()
  + ### getPuddleFloor

    public [IsoObject](IsoObject.html "class in zombie.iso") getPuddleFloor()
  + ### flagForHotSave

    public void flagForHotSave()
  + ### hasGridPower

    public boolean hasGridPower()
  + ### hasGridPower

    public boolean hasGridPower(int offset)
  + ### isDerelict

    public boolean isDerelict()
  + ### isUserDefinedRoom

    public boolean isUserDefinedRoom()
  + ### isUserDefinedBuilding

    public boolean isUserDefinedBuilding()
  + ### shouldNotSpawnActivatedRadiosOrTvs

    public boolean shouldNotSpawnActivatedRadiosOrTvs()
  + ### hasFence

    public boolean hasFence()
  + ### hasFenceInVicinity

    public boolean hasFenceInVicinity()
  + ### hasFloorOverWater

    public boolean hasFloorOverWater()
  + ### getRadius

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> getRadius(int radius)
  + ### getSquareBelow

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getSquareBelow()
  + ### canStand

    public boolean canStand()
  + ### hasAdjacentCanStandSquare

    public boolean hasAdjacentCanStandSquare()
  + ### addAshes

    public void addAshes()
  + ### isHorizontalNeighbor

    private boolean isHorizontalNeighbor(int x1,
    int y1,
    int x2,
    int y2)
  + ### isVerticalNeighbor

    private boolean isVerticalNeighbor(int x1,
    int y1,
    int x2,
    int y2)
  + ### isNorthFacingSequence

    private boolean isNorthFacingSequence([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") up,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") down)
  + ### isWestFacingSequence

    private boolean isWestFacingSequence([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") left,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") right)
  + ### hasAdjacentStairs

    private boolean hasAdjacentStairs([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") type)
  + ### hasConnectingBNStair

    private boolean hasConnectingBNStair([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") upStairs,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") leftStairs,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") upSquare)
  + ### hasConnectingBWStair

    private boolean hasConnectingBWStair([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") rightStairs,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") leftStairs,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") rightSquare)
  + ### hasConnectingTNStair

    private boolean hasConnectingTNStair([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") downStairs,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") leftStairs,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") downSquare,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") upSquare)
  + ### hasConnectingTWStair

    private boolean hasConnectingTWStair([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") leftStairs,
    [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") upStairs,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") leftSquare,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") upSquare)