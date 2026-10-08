[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoCell](IsoCell.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [CELL\_SIZE\_IN\_CHUNKS](#CELL_SIZE_IN_CHUNKS)
   2. [CELL\_SIZE\_IN\_SQUARES](#CELL_SIZE_IN_SQUARES)
   3. [maxHeight](#maxHeight)
   4. [floorRenderShader](#floorRenderShader)
   5. [wallRenderShader](#wallRenderShader)
   6. [trees](#trees)
   7. [minHeight](#minHeight)
   8. [stchoices](#stchoices)
   9. [chunkMap](#chunkMap)
   10. [buildingList](#buildingList)
   11. [windowList](#windowList)
   12. [objectList](#objectList)
   13. [pushableObjectList](#pushableObjectList)
   14. [buildingScores](#buildingScores)
   15. [roomList](#roomList)
   16. [staticUpdaterObjectList](#staticUpdaterObjectList)
   17. [staticUpdaterObjectSet](#staticUpdaterObjectSet)
   18. [zombieList](#zombieList)
   19. [remoteSurvivorList](#remoteSurvivorList)
   20. [removeList](#removeList)
   21. [addList](#addList)
   22. [processIsoObject](#processIsoObject)
   23. [processIsoObjectSet](#processIsoObjectSet)
   24. [processIsoObjectRemove](#processIsoObjectRemove)
   25. [processItems](#processItems)
   26. [processItemsRemove](#processItemsRemove)
   27. [processWorldItems](#processWorldItems)
   28. [processWorldItemsRemove](#processWorldItemsRemove)
   29. [gridSquares](#gridSquares)
   30. [ENABLE\_SQUARE\_CACHE](#ENABLE_SQUARE_CACHE)
   31. [height](#height)
   32. [width](#width)
   33. [worldX](#worldX)
   34. [worldY](#worldY)
   35. [dangerScore](#dangerScore)
   36. [safeToAdd](#safeToAdd)
   37. [lamppostPositions](#lamppostPositions)
   38. [roomLights](#roomLights)
   39. [heatSources](#heatSources)
   40. [addVehicles](#addVehicles)
   41. [vehicles](#vehicles)
   42. [ISOANGLEFACTOR](#ISOANGLEFACTOR)
   43. [ZOMBIESCANBUDGET](#ZOMBIESCANBUDGET)
   44. [NEARESTZOMBIEDISTSQRMAX](#NEARESTZOMBIEDISTSQRMAX)
   45. [zombieScanCursor](#zombieScanCursor)
   46. [nearestVisibleZombie](#nearestVisibleZombie)
   47. [nearestVisibleZombieDistSqr](#nearestVisibleZombieDistSqr)
   48. [buildingscores](#buildingscores)
   49. [gridStack](#gridStack)
   50. [RTF\_SolidFloor](#RTF_SolidFloor)
   51. [RTF\_VegetationCorpses](#RTF_VegetationCorpses)
   52. [RTF\_MinusFloorCharacters](#RTF_MinusFloorCharacters)
   53. [RTF\_ShadedFloor](#RTF_ShadedFloor)
   54. [RTF\_Shadows](#RTF_Shadows)
   55. [ShadowSquares](#ShadowSquares)
   56. [MinusFloorCharacters](#MinusFloorCharacters)
   57. [SolidFloor](#SolidFloor)
   58. [ShadedFloor](#ShadedFloor)
   59. [VegetationCorpses](#VegetationCorpses)
   60. [perPlayerRender](#perPlayerRender)
   61. [stencilTexture](#stencilTexture)
   62. [stencilAreas](#stencilAreas)
   63. [diamondMatrixIterator](#diamondMatrixIterator)
   64. [diamondMatrixPos](#diamondMatrixPos)
   65. [deferredCharacterTick](#deferredCharacterTick)
   66. [hasSetupSnowGrid](#hasSetupSnowGrid)
   67. [snowGridTilesSquare](#snowGridTilesSquare)
   68. [snowGridTilesStrip](#snowGridTilesStrip)
   69. [snowGridTilesEdge](#snowGridTilesEdge)
   70. [snowGridTilesCove](#snowGridTilesCove)
   71. [snowGridTilesEnclosed](#snowGridTilesEnclosed)
   72. [snowFirstNonSquare](#snowFirstNonSquare)
   73. [snowNoise2d](#snowNoise2d)
   74. [snowGridCur](#snowGridCur)
   75. [snowGridPrev](#snowGridPrev)
   76. [snowFracTarget](#snowFracTarget)
   77. [snowFadeTime](#snowFadeTime)
   78. [snowTransitionTime](#snowTransitionTime)
   79. [raport](#raport)
   80. [SNOWSHORE\_NONE](#SNOWSHORE_NONE)
   81. [SNOWSHORE\_N](#SNOWSHORE_N)
   82. [SNOWSHORE\_E](#SNOWSHORE_E)
   83. [SNOWSHORE\_S](#SNOWSHORE_S)
   84. [SNOWSHORE\_W](#SNOWSHORE_W)
   85. [recalcFloors](#recalcFloors)
   86. [wx](#wx)
   87. [wy](#wy)
   88. [drag](#drag)
   89. [survivorList](#survivorList)
   90. [texWhite](#texWhite)
   91. [instance](#instance)
   92. [currentLx](#currentLx)
   93. [currentLy](#currentLy)
   94. [currentLz](#currentLz)
   95. [recalcShading](#recalcShading)
   96. [lastMinX](#lastMinX)
   97. [lastMinY](#lastMinY)
   98. [rainScroll](#rainScroll)
   99. [rainX](#rainX)
   100. [rainY](#rainY)
   101. [rainTextures](#rainTextures)
   102. [rainFileTime](#rainFileTime)
   103. [rainAlphaMax](#rainAlphaMax)
   104. [rainAlpha](#rainAlpha)
   105. [rainIntensity](#rainIntensity)
   106. [rainSpeed](#rainSpeed)
   107. [lightUpdateCount](#lightUpdateCount)
   108. [rendering](#rendering)
   109. [hideFloors](#hideFloors)
   110. [unhideFloorsCounter](#unhideFloorsCounter)
   111. [occludedByOrphanStructureFlag](#occludedByOrphanStructureFlag)
   112. [playerPeekedRoomId](#playerPeekedRoomId)
   113. [playerOccluderBuildings](#playerOccluderBuildings)
   114. [playerOccluderBuildingsArr](#playerOccluderBuildingsArr)
   115. [playerWindowPeekingRoomId](#playerWindowPeekingRoomId)
   116. [playerHidesOrphanStructures](#playerHidesOrphanStructures)
   117. [playerCutawaysDirty](#playerCutawaysDirty)
   118. [tempCutawaySqrVector](#tempCutawaySqrVector)
   119. [tempPrevPlayerCutawayRoomIds](#tempPrevPlayerCutawayRoomIds)
   120. [tempPlayerCutawayRoomIds](#tempPlayerCutawayRoomIds)
   121. [lastPlayerSquare](#lastPlayerSquare)
   122. [lastPlayerSquareHalf](#lastPlayerSquareHalf)
   123. [lastPlayerDir](#lastPlayerDir)
   124. [lastPlayerAngle](#lastPlayerAngle)
   125. [hidesOrphanStructuresAbove](#hidesOrphanStructuresAbove)
   126. [buildingRectTemp](#buildingRectTemp)
   127. [zombieOccluderBuildings](#zombieOccluderBuildings)
   128. [zombieOccluderBuildingsArr](#zombieOccluderBuildingsArr)
   129. [lastZombieSquare](#lastZombieSquare)
   130. [lastZombieSquareHalf](#lastZombieSquareHalf)
   131. [otherOccluderBuildings](#otherOccluderBuildings)
   132. [otherOccluderBuildingsArr](#otherOccluderBuildingsArr)
   133. [mustSeeSquaresRadius](#mustSeeSquaresRadius)
   134. [mustSeeSquaresGridSize](#mustSeeSquaresGridSize)
   135. [gridSquaresTempLeft](#gridSquaresTempLeft)
   136. [gridSquaresTempRight](#gridSquaresTempRight)
   137. [weatherFx](#weatherFx)
   138. [minX](#minX)
   139. [maxX](#maxX)
   140. [minY](#minY)
   141. [maxY](#maxY)
   142. [minZ](#minZ)
   143. [maxZ](#maxZ)
   144. [dangerUpdate](#dangerUpdate)
   145. [lightInfoUpdate](#lightInfoUpdate)
   146. [lastServerItemsUpdate](#lastServerItemsUpdate)
   147. [spottedRooms](#spottedRooms)
   148. [fakeZombieForHit](#fakeZombieForHit)
7. [Constructor Details](#constructor-detail)
   1. [IsoCell(int, int)](#%3Cinit%3E(int,int))
8. [Method Details](#method-detail)
   1. [getMaxHeight()](#getMaxHeight())
   2. [getCellSizeInChunks()](#getCellSizeInChunks())
   3. [getCellSizeInSquares()](#getCellSizeInSquares())
   4. [getCurrentLotHeader()](#getCurrentLotHeader())
   5. [getChunkMap(int)](#getChunkMap(int))
   6. [getFreeTile(RoomDef)](#getFreeTile(zombie.iso.RoomDef))
   7. [getBuildings()](#getBuildings())
   8. [setBuildings(Stack)](#setBuildings(java.util.Stack))
   9. [getNearestVisibleZombie(int)](#getNearestVisibleZombie(int))
   10. [getChunkForGridSquare(int, int, int)](#getChunkForGridSquare(int,int,int))
   11. [getChunk(int, int)](#getChunk(int,int))
   12. [CalculateVertColoursForTile(IsoGridSquare, int, int, int, int)](#CalculateVertColoursForTile(zombie.iso.IsoGridSquare,int,int,int,int))
   13. [getStencilTexture(String)](#getStencilTexture(java.lang.String))
   14. [drawStencilMask()](#drawStencilMask())
   15. [drawStencilMask(String, int, int, int, int)](#drawStencilMask(java.lang.String,int,int,int,int))
   16. [isInStencil(float, float)](#isInStencil(float,float))
   17. [getStencilAreas()](#getStencilAreas())
   18. [RenderTiles(int)](#RenderTiles(int))
   19. [renderTilesInternal(int)](#renderTilesInternal(int))
   20. [initTileShaders()](#initTileShaders())
   21. [getPerPlayerRenderAt(int)](#getPerPlayerRenderAt(int))
   22. [recalculateAnyGridStacks(IsoCell.PerPlayerRender, int, int, long)](#recalculateAnyGridStacks(zombie.iso.IsoCell.PerPlayerRender,int,int,long))
   23. [flattenAnyFoliage(IsoCell.PerPlayerRender, int)](#flattenAnyFoliage(zombie.iso.IsoCell.PerPlayerRender,int))
   24. [performRenderTiles(IsoCell.PerPlayerRender, int, int, long)](#performRenderTiles(zombie.iso.IsoCell.PerPlayerRender,int,int,long))
   25. [renderShadows()](#renderShadows())
   26. [renderDebugPhysics(int)](#renderDebugPhysics(int))
   27. [renderDebugLighting(IsoCell.PerPlayerRender, int)](#renderDebugLighting(zombie.iso.IsoCell.PerPlayerRender,int))
   28. [CullFullyOccludedSquares(IsoGridStack, boolean[][][], boolean[][])](#CullFullyOccludedSquares(zombie.iso.IsoGridStack,boolean%5B%5D%5B%5D%5B%5D,boolean%5B%5D%5B%5D))
   29. [RenderFloorShading(int)](#RenderFloorShading(int))
   30. [IsPlayerWindowPeeking(int)](#IsPlayerWindowPeeking(int))
   31. [CanBuildingSquareOccludePlayer(IsoGridSquare, int)](#CanBuildingSquareOccludePlayer(zombie.iso.IsoGridSquare,int))
   32. [GetEffectivePlayerRoomId()](#GetEffectivePlayerRoomId())
   33. [SetCutawayRoomsForPlayer()](#SetCutawayRoomsForPlayer())
   34. [IsCutawaySquare(IsoGridSquare, long)](#IsCutawaySquare(zombie.iso.IsoGridSquare,long))
   35. [DoesSquareHaveValidCutaways(IsoGridSquare, IsoGridSquare, int, long)](#DoesSquareHaveValidCutaways(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,int,long))
   36. [IsCollapsibleBuildingSquare(IsoGridSquare)](#IsCollapsibleBuildingSquare(zombie.iso.IsoGridSquare))
   37. [collapsibleBuildingSquareAlgorithm(BuildingDef, IsoGridSquare, IsoGridSquare)](#collapsibleBuildingSquareAlgorithm(zombie.iso.BuildingDef,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   38. [IsDissolvedSquare(IsoGridSquare, int)](#IsDissolvedSquare(zombie.iso.IsoGridSquare,int))
   39. [GetBuildingHeightAt(IsoBuilding, int, int, int)](#GetBuildingHeightAt(zombie.iso.areas.IsoBuilding,int,int,int))
   40. [updateSnow(int)](#updateSnow(int))
   41. [setSnowTarget(int)](#setSnowTarget(int))
   42. [getSnowTarget()](#getSnowTarget())
   43. [gridSquareIsSnow(int, int, int)](#gridSquareIsSnow(int,int,int))
   44. [RenderSnow(int)](#RenderSnow(int))
   45. [renderSnowTileGeneral(IsoCell.SnowGrid, float, IsoGridSquare, int, int, int, int, int, int)](#renderSnowTileGeneral(zombie.iso.IsoCell.SnowGrid,float,zombie.iso.IsoGridSquare,int,int,int,int,int,int))
   46. [renderSnowTileBase(Texture, int, int, float, boolean)](#renderSnowTileBase(zombie.core.textures.Texture,int,int,float,boolean))
   47. [renderSnowTile(IsoCell.SnowGrid, int, int, int, IsoGridSquare, int, Texture, int, int, float)](#renderSnowTile(zombie.iso.IsoCell.SnowGrid,int,int,int,zombie.iso.IsoGridSquare,int,zombie.core.textures.Texture,int,int,float))
   48. [getShoreInt(IsoGridSquare)](#getShoreInt(zombie.iso.IsoGridSquare))
   49. [isSnowShore(IsoGridSquare, int, int)](#isSnowShore(zombie.iso.IsoGridSquare,int,int))
   50. [getClosestBuildingExcept(IsoGameCharacter, IsoRoom)](#getClosestBuildingExcept(zombie.characters.IsoGameCharacter,zombie.iso.areas.IsoRoom))
   51. [getDangerScore(int, int)](#getDangerScore(int,int))
   52. [ObjectDeletionAddition()](#ObjectDeletionAddition())
   53. [ProcessItems(Iterator)](#ProcessItems(java.util.Iterator))
   54. [ProcessIsoObject()](#ProcessIsoObject())
   55. [ProcessObjects(Iterator)](#ProcessObjects(java.util.Iterator))
   56. [updateZombieVocals()](#updateZombieVocals())
   57. [ProcessRemoveItems(Iterator)](#ProcessRemoveItems(java.util.Iterator))
   58. [ProcessStaticUpdaters()](#ProcessStaticUpdaters())
   59. [addToProcessIsoObject(IsoObject)](#addToProcessIsoObject(zombie.iso.IsoObject))
   60. [addToProcessIsoObjectRemove(IsoObject)](#addToProcessIsoObjectRemove(zombie.iso.IsoObject))
   61. [addToStaticUpdaterObjectList(IsoObject)](#addToStaticUpdaterObjectList(zombie.iso.IsoObject))
   62. [removeFromStaticUpdaterObjectList(IsoObject)](#removeFromStaticUpdaterObjectList(zombie.iso.IsoObject))
   63. [addToProcessItems(InventoryItem)](#addToProcessItems(zombie.inventory.InventoryItem))
   64. [addToProcessItems(ArrayList)](#addToProcessItems(java.util.ArrayList))
   65. [addToProcessItemsRemove(InventoryItem)](#addToProcessItemsRemove(zombie.inventory.InventoryItem))
   66. [addToProcessItemsRemove(ArrayList)](#addToProcessItemsRemove(java.util.ArrayList))
   67. [addToProcessWorldItems(IsoWorldInventoryObject)](#addToProcessWorldItems(zombie.iso.objects.IsoWorldInventoryObject))
   68. [addToProcessWorldItemsRemove(IsoWorldInventoryObject)](#addToProcessWorldItemsRemove(zombie.iso.objects.IsoWorldInventoryObject))
   69. [getNetworkPlayer(int)](#getNetworkPlayer(int))
   70. [ConnectNewSquare(IsoGridSquare, boolean, boolean)](#ConnectNewSquare(zombie.iso.IsoGridSquare,boolean,boolean))
   71. [ConnectNewSquare(IsoGridSquare, boolean)](#ConnectNewSquare(zombie.iso.IsoGridSquare,boolean))
   72. [PlaceLot(String, int, int, int, boolean)](#PlaceLot(java.lang.String,int,int,int,boolean))
   73. [PlaceLot(IsoLot, int, int, int, boolean)](#PlaceLot(zombie.iso.IsoLot,int,int,int,boolean))
   74. [PlaceLot(IsoLot, int, int, int, IsoChunk, int, int, boolean[])](#PlaceLot(zombie.iso.IsoLot,int,int,int,zombie.iso.IsoChunk,int,int,boolean%5B%5D))
   75. [setDrag(KahluaTable, int)](#setDrag(se.krka.kahlua.vm.KahluaTable,int))
   76. [getDrag(int)](#getDrag(int))
   77. [DoBuilding(int, boolean)](#DoBuilding(int,boolean))
   78. [doBuildingInternal(int, boolean)](#doBuildingInternal(int,boolean))
   79. [DistanceFromSupport(int, int, int)](#DistanceFromSupport(int,int,int))
   80. [getBuildingList()](#getBuildingList())
   81. [getWindowList()](#getWindowList())
   82. [addToWindowList(IsoWindow)](#addToWindowList(zombie.iso.objects.IsoWindow))
   83. [removeFromWindowList(IsoWindow)](#removeFromWindowList(zombie.iso.objects.IsoWindow))
   84. [getObjectList()](#getObjectList())
   85. [getObjectListForLua()](#getObjectListForLua())
   86. [getRoom(int)](#getRoom(int))
   87. [getPushableObjectList()](#getPushableObjectList())
   88. [getBuildingScores()](#getBuildingScores())
   89. [getRoomList()](#getRoomList())
   90. [getStaticUpdaterObjectList()](#getStaticUpdaterObjectList())
   91. [getZombieList()](#getZombieList())
   92. [getRemoteSurvivorList()](#getRemoteSurvivorList())
   93. [getRemoveList()](#getRemoveList())
   94. [getAddList()](#getAddList())
   95. [addMovingObject(IsoMovingObject)](#addMovingObject(zombie.iso.IsoMovingObject))
   96. [getProcessItems()](#getProcessItems())
   97. [getProcessWorldItems()](#getProcessWorldItems())
   98. [getProcessIsoObjects()](#getProcessIsoObjects())
   99. [getProcessItemsRemove()](#getProcessItemsRemove())
   100. [getVehicles()](#getVehicles())
   101. [getHeight()](#getHeight())
   102. [setHeight(int)](#setHeight(int))
   103. [getWidth()](#getWidth())
   104. [setWidth(int)](#setWidth(int))
   105. [getWorldX()](#getWorldX())
   106. [setWorldX(int)](#setWorldX(int))
   107. [getWorldY()](#getWorldY())
   108. [setWorldY(int)](#setWorldY(int))
   109. [isSafeToAdd()](#isSafeToAdd())
   110. [setSafeToAdd(boolean)](#setSafeToAdd(boolean))
   111. [getLamppostPositions()](#getLamppostPositions())
   112. [getLightSourceAt(int, int, int)](#getLightSourceAt(int,int,int))
   113. [addLamppost(IsoLightSource)](#addLamppost(zombie.iso.IsoLightSource))
   114. [addLamppost(int, int, int, float, float, float, int)](#addLamppost(int,int,int,float,float,float,int))
   115. [removeLamppost(int, int, int)](#removeLamppost(int,int,int))
   116. [removeLamppost(IsoLightSource)](#removeLamppost(zombie.iso.IsoLightSource))
   117. [getCurrentLightX()](#getCurrentLightX())
   118. [setCurrentLightX(int)](#setCurrentLightX(int))
   119. [getCurrentLightY()](#getCurrentLightY())
   120. [setCurrentLightY(int)](#setCurrentLightY(int))
   121. [getCurrentLightZ()](#getCurrentLightZ())
   122. [setCurrentLightZ(int)](#setCurrentLightZ(int))
   123. [getMinX()](#getMinX())
   124. [setMinX(int)](#setMinX(int))
   125. [getMaxX()](#getMaxX())
   126. [setMaxX(int)](#setMaxX(int))
   127. [getMinY()](#getMinY())
   128. [setMinY(int)](#setMinY(int))
   129. [getMaxY()](#getMaxY())
   130. [setMaxY(int)](#setMaxY(int))
   131. [getMinZ()](#getMinZ())
   132. [setMinZ(int)](#setMinZ(int))
   133. [getMaxZ()](#getMaxZ())
   134. [setMaxZ(int)](#setMaxZ(int))
   135. [getDangerUpdate()](#getDangerUpdate())
   136. [setDangerUpdate(OnceEvery)](#setDangerUpdate(zombie.core.utils.OnceEvery))
   137. [getLightInfoUpdate()](#getLightInfoUpdate())
   138. [setLightInfoUpdate(Thread)](#setLightInfoUpdate(java.lang.Thread))
   139. [getSurvivorList()](#getSurvivorList())
   140. [getRComponent(int)](#getRComponent(int))
   141. [getGComponent(int)](#getGComponent(int))
   142. [getBComponent(int)](#getBComponent(int))
   143. [toIntColor(float, float, float, float)](#toIntColor(float,float,float,float))
   144. [getRandomOutdoorTile()](#getRandomOutdoorTile())
   145. [InsertAt(int, BuildingScore, BuildingScore[])](#InsertAt(int,zombie.iso.areas.BuildingScore,zombie.iso.areas.BuildingScore%5B%5D))
   146. [Place(BuildingScore, BuildingScore[], IsoCell.BuildingSearchCriteria)](#Place(zombie.iso.areas.BuildingScore,zombie.iso.areas.BuildingScore%5B%5D,zombie.iso.IsoCell.BuildingSearchCriteria))
   147. [getBestBuildings(IsoCell.BuildingSearchCriteria, int)](#getBestBuildings(zombie.iso.IsoCell.BuildingSearchCriteria,int))
   148. [blocked(Mover, int, int, int, int, int, int)](#blocked(zombie.ai.astar.Mover,int,int,int,int,int,int))
   149. [Dispose()](#Dispose())
   150. [getGridSquare(double, double, double)](#getGridSquare(double,double,double))
   151. [getOrCreateGridSquare(double, double, double)](#getOrCreateGridSquare(double,double,double))
   152. [setCacheGridSquare(int, int, int, IsoGridSquare)](#setCacheGridSquare(int,int,int,zombie.iso.IsoGridSquare))
   153. [getOrCreateGridSquares(int)](#getOrCreateGridSquares(int))
   154. [setCacheChunk(IsoChunk)](#setCacheChunk(zombie.iso.IsoChunk))
   155. [setCacheChunk(IsoChunk, int)](#setCacheChunk(zombie.iso.IsoChunk,int))
   156. [clearCacheGridSquare(int)](#clearCacheGridSquare(int))
   157. [setCacheGridSquareLocal(int, int, int, IsoGridSquare, int)](#setCacheGridSquareLocal(int,int,int,zombie.iso.IsoGridSquare,int))
   158. [getGridSquare(Double, Double, Double)](#getGridSquare(java.lang.Double,java.lang.Double,java.lang.Double))
   159. [getGridSquare(int, int, int)](#getGridSquare(int,int,int))
   160. [EnsureSurroundNotNull(int, int, int)](#EnsureSurroundNotNull(int,int,int))
   161. [DeleteAllMovingObjects()](#DeleteAllMovingObjects())
   162. [getMaxFloors()](#getMaxFloors())
   163. [getLuaObjectList()](#getLuaObjectList())
   164. [getHeightInTiles()](#getHeightInTiles())
   165. [getWidthInTiles()](#getWidthInTiles())
   166. [isNull(int, int, int)](#isNull(int,int,int))
   167. [Remove(IsoMovingObject)](#Remove(zombie.iso.IsoMovingObject))
   168. [isBlocked(IsoGridSquare, IsoGridSquare)](#isBlocked(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   169. [CalculateColor(IsoGridSquare, IsoGridSquare, IsoGridSquare, IsoGridSquare, int, int)](#CalculateColor(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,int,int))
   170. [getInstance()](#getInstance())
   171. [render()](#render())
   172. [renderInternal()](#renderInternal())
   173. [renderLast()](#renderLast())
   174. [updateZombiesForRender(IsoGameCharacter, int)](#updateZombiesForRender(zombie.characters.IsoGameCharacter,int))
   175. [invalidatePeekedRoom(int)](#invalidatePeekedRoom(int))
   176. [initWeatherFx()](#initWeatherFx())
   177. [updateWeatherFx()](#updateWeatherFx())
   178. [renderWeatherFx()](#renderWeatherFx())
   179. [getWeatherFX()](#getWeatherFX())
   180. [renderRain()](#renderRain())
   181. [setRainAlpha(int)](#setRainAlpha(int))
   182. [setRainIntensity(int)](#setRainIntensity(int))
   183. [getRainIntensity()](#getRainIntensity())
   184. [setRainSpeed(int)](#setRainSpeed(int))
   185. [reloadRainTextures()](#reloadRainTextures())
   186. [GetBuildingsInFrontOfCharacter(ArrayList, IsoGridSquare, boolean)](#GetBuildingsInFrontOfCharacter(java.util.ArrayList,zombie.iso.IsoGridSquare,boolean))
   187. [GetBuildingsInFrontOfCharacterSquare(int, int, int, boolean, ArrayList)](#GetBuildingsInFrontOfCharacterSquare(int,int,int,boolean,java.util.ArrayList))
   188. [GetBuildingsInFrontOfMustSeeSquare(IsoGridSquare, IsoGridOcclusionData.OcclusionFilter)](#GetBuildingsInFrontOfMustSeeSquare(zombie.iso.IsoGridSquare,zombie.iso.IsoGridOcclusionData.OcclusionFilter))
   189. [GetPeekedInBuilding(IsoGridSquare, IsoDirections)](#GetPeekedInBuilding(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   190. [GetSquaresAroundPlayerSquare(IsoPlayer, IsoGridSquare, ArrayList, ArrayList)](#GetSquaresAroundPlayerSquare(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare,java.util.ArrayList,java.util.ArrayList))
   191. [IsBehindStuff(IsoGridSquare)](#IsBehindStuff(zombie.iso.IsoGridSquare))
   192. [FromMouseTile()](#FromMouseTile())
   193. [update()](#update())
   194. [updateInternal()](#updateInternal())
   195. [getRandomFreeTile()](#getRandomFreeTile())
   196. [getRandomOutdoorFreeTile()](#getRandomOutdoorFreeTile())
   197. [getRandomFreeTileInRoom()](#getRandomFreeTileInRoom())
   198. [roomSpotted(IsoRoom)](#roomSpotted(zombie.iso.areas.IsoRoom))
   199. [ProcessSpottedRooms()](#ProcessSpottedRooms())
   200. [addTileObject(IsoGridSquare, String)](#addTileObject(zombie.iso.IsoGridSquare,java.lang.String))
   201. [save(DataOutputStream, boolean)](#save(java.io.DataOutputStream,boolean))
   202. [LoadPlayer(int)](#LoadPlayer(int))
   203. [getRelativeGridSquare(int, int, int)](#getRelativeGridSquare(int,int,int))
   204. [createNewGridSquare(int, int, int, boolean)](#createNewGridSquare(int,int,int,boolean))
   205. [getGridSquareDirect(int, int, int, int)](#getGridSquareDirect(int,int,int,int))
   206. [isInChunkMap(int, int)](#isInChunkMap(int,int))
   207. [getProcessIsoObjectRemove()](#getProcessIsoObjectRemove())
   208. [checkHaveRoof(int, int)](#checkHaveRoof(int,int))
   209. [getFakeZombieForHit()](#getFakeZombieForHit())
   210. [addHeatSource(IsoHeatSource)](#addHeatSource(zombie.iso.IsoHeatSource))
   211. [removeHeatSource(IsoHeatSource)](#removeHeatSource(zombie.iso.IsoHeatSource))
   212. [updateHeatSources()](#updateHeatSources())
   213. [getHeatSourceTemperature(int, int, int)](#getHeatSourceTemperature(int,int,int))
   214. [getHeatSourceHighestTemperature(float, int, int, int)](#getHeatSourceHighestTemperature(float,int,int,int))
   215. [putInVehicle(IsoGameCharacter)](#putInVehicle(zombie.characters.IsoGameCharacter))
   216. [resumeVehicleSounds(IsoGameCharacter)](#resumeVehicleSounds(zombie.characters.IsoGameCharacter))
   217. [AddUniqueToBuildingList(ArrayList, IsoBuilding)](#AddUniqueToBuildingList(java.util.ArrayList,zombie.iso.areas.IsoBuilding))
   218. [getSpriteManager()](#getSpriteManager())
   219. [getAnimals()](#getAnimals())
   220. [isBasementWallAdjacentToTheVoid\_North(IsoObject)](#isBasementWallAdjacentToTheVoid_North(zombie.iso.IsoObject))
   221. [isBasementWallAdjacentToTheVoid\_West(IsoObject)](#isBasementWallAdjacentToTheVoid_West(zombie.iso.IsoObject))
   222. [isBasementWallAdjacentToTheVoid(IsoObject, IsoFlagType, IsoDirections)](#isBasementWallAdjacentToTheVoid(zombie.iso.IsoObject,zombie.iso.SpriteDetails.IsoFlagType,zombie.iso.IsoDirections))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCell

---

public final class IsoCell
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `IsoCell.BuildingSearchCriteria`

  `static final class`

  `IsoCell.PerPlayerRender`

  `static class`

  `IsoCell.s_performance`

  `private class`

  `IsoCell.SnowGrid`

  `protected class`

  `IsoCell.SnowGridTiles`

  `static final record`

  `IsoCell.StencilArea`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Set<IsoMovingObject>`

  `addList`

  `final Set<BaseVehicle>`

  `addVehicles`

  `final ArrayList<IsoBuilding>`

  `buildingList`

  `(package private) final Rectangle`

  `buildingRectTemp`

  `private static Stack<zombie.iso.areas.BuildingScore>`

  `buildingscores`

  `private final HashMap<Integer, zombie.iso.areas.BuildingScore>`

  `buildingScores`

  `static final int`

  `CELL_SIZE_IN_CHUNKS`

  `static final int`

  `CELL_SIZE_IN_SQUARES`

  `final IsoChunkMap[]`

  `chunkMap`

  `private int`

  `currentLx`

  `private int`

  `currentLy`

  `private int`

  `currentLz`

  `zombie.core.utils.IntGrid`

  `dangerScore`

  `private zombie.core.utils.OnceEvery`

  `dangerUpdate`

  `int`

  `deferredCharacterTick`

  `private final zombie.iso.DiamondMatrixIterator`

  `diamondMatrixIterator`

  `private final org.joml.Vector2i`

  `diamondMatrixPos`

  `(package private) final se.krka.kahlua.vm.KahluaTable[]`

  `drag`

  `static final boolean`

  `ENABLE_SQUARE_CACHE`

  `private IsoZombie`

  `fakeZombieForHit`

  `static zombie.core.opengl.Shader`

  `floorRenderShader`

  `private final IsoGridSquare[][]`

  `gridSquares`

  `final ArrayList<IsoGridSquare>`

  `gridSquaresTempLeft`

  `final ArrayList<IsoGridSquare>`

  `gridSquaresTempRight`

  `static ArrayList<IsoGridSquare>`

  `gridStack`

  `private boolean`

  `hasSetupSnowGrid`

  `private final ArrayList<IsoHeatSource>`

  `heatSources`

  `private int`

  `height`

  `final boolean[]`

  `hideFloors`

  `int`

  `hidesOrphanStructuresAbove`

  `private static IsoCell`

  `instance`

  `static final int`

  `ISOANGLEFACTOR`

  `private final Stack<IsoLightSource>`

  `lamppostPositions`

  `int`

  `lastMinX`

  `int`

  `lastMinY`

  `final Vector2[]`

  `lastPlayerAngle`

  `final IsoDirections[]`

  `lastPlayerDir`

  `final IsoGridSquare[]`

  `lastPlayerSquare`

  `final boolean[]`

  `lastPlayerSquareHalf`

  `(package private) long`

  `lastServerItemsUpdate`

  `final IsoGridSquare[]`

  `lastZombieSquare`

  `final boolean[]`

  `lastZombieSquareHalf`

  `private Thread`

  `lightInfoUpdate`

  `int`

  `lightUpdateCount`

  `static int`

  `maxHeight`

  `int`

  `maxX`

  `int`

  `maxY`

  `int`

  `maxZ`

  `int`

  `minHeight`

  `static final ArrayList<IsoGridSquare>`

  `MinusFloorCharacters`

  `int`

  `minX`

  `int`

  `minY`

  `int`

  `minZ`

  `(package private) final int`

  `mustSeeSquaresGridSize`

  `(package private) final int`

  `mustSeeSquaresRadius`

  `final IsoZombie[]`

  `nearestVisibleZombie`

  `final float[]`

  `nearestVisibleZombieDistSqr`

  `static final float`

  `NEARESTZOMBIEDISTSQRMAX`

  `private final Set<IsoMovingObject>`

  `objectList`

  `boolean`

  `occludedByOrphanStructureFlag`

  `final ArrayList<ArrayList<IsoBuilding>>`

  `otherOccluderBuildings`

  `final IsoBuilding[][]`

  `otherOccluderBuildingsArr`

  `static final IsoCell.PerPlayerRender[]`

  `perPlayerRender`

  `final boolean[]`

  `playerCutawaysDirty`

  `final boolean[]`

  `playerHidesOrphanStructures`

  `final ArrayList<ArrayList<IsoBuilding>>`

  `playerOccluderBuildings`

  `final IsoBuilding[][]`

  `playerOccluderBuildingsArr`

  `long`

  `playerPeekedRoomId`

  `final long[]`

  `playerWindowPeekingRoomId`

  `private final ArrayList<IsoObject>`

  `processIsoObject`

  `private final Set<IsoObject>`

  `processIsoObjectRemove`

  `private final Set<IsoObject>`

  `processIsoObjectSet`

  `private final ArrayList<InventoryItem>`

  `processItems`

  `private final Set<InventoryItem>`

  `processItemsRemove`

  `private final ArrayList<IsoWorldInventoryObject>`

  `processWorldItems`

  `final Set<IsoWorldInventoryObject>`

  `processWorldItemsRemove`

  `private final ArrayList<IsoPushableObject>`

  `pushableObjectList`

  `private final float[]`

  `rainAlpha`

  `private float`

  `rainAlphaMax`

  `private final long[]`

  `rainFileTime`

  `protected int`

  `rainIntensity`

  `private float`

  `rainScroll`

  `protected int`

  `rainSpeed`

  `private final Texture[]`

  `rainTextures`

  `private final int[]`

  `rainX`

  `private final int[]`

  `rainY`

  `private final int`

  `raport`

  `boolean`

  `recalcFloors`

  `int`

  `recalcShading`

  `private final ArrayList<IsoGameCharacter>`

  `remoteSurvivorList`

  `private final Set<IsoMovingObject>`

  `removeList`

  `boolean`

  `rendering`

  `final ArrayList<zombie.iso.IsoRoomLight>`

  `roomLights`

  `private final ArrayList<IsoRoom>`

  `roomList`

  `static final int`

  `RTF_MinusFloorCharacters`

  `static final int`

  `RTF_ShadedFloor`

  `static final int`

  `RTF_Shadows`

  `static final int`

  `RTF_SolidFloor`

  `static final int`

  `RTF_VegetationCorpses`

  `private boolean`

  `safeToAdd`

  `static final ArrayList<IsoGridSquare>`

  `ShadedFloor`

  `static final ArrayList<IsoGridSquare>`

  `ShadowSquares`

  `private long`

  `snowFadeTime`

  `private int`

  `snowFirstNonSquare`

  `private int`

  `snowFracTarget`

  `private IsoCell.SnowGrid`

  `snowGridCur`

  `private IsoCell.SnowGrid`

  `snowGridPrev`

  `private IsoCell.SnowGridTiles[]`

  `snowGridTilesCove`

  `private IsoCell.SnowGridTiles[]`

  `snowGridTilesEdge`

  `private IsoCell.SnowGridTiles`

  `snowGridTilesEnclosed`

  `private IsoCell.SnowGridTiles`

  `snowGridTilesSquare`

  `private IsoCell.SnowGridTiles[]`

  `snowGridTilesStrip`

  `private zombie.erosion.utils.Noise2D`

  `snowNoise2d`

  `private static final int`

  `SNOWSHORE_E`

  `private static final int`

  `SNOWSHORE_N`

  `private static final int`

  `SNOWSHORE_NONE`

  `private static final int`

  `SNOWSHORE_S`

  `private static final int`

  `SNOWSHORE_W`

  `private final float`

  `snowTransitionTime`

  `static final ArrayList<IsoGridSquare>`

  `SolidFloor`

  `private final Stack<IsoRoom>`

  `spottedRooms`

  `private final ArrayList<IsoObject>`

  `staticUpdaterObjectList`

  `private final Set<IsoObject>`

  `staticUpdaterObjectSet`

  `(package private) static final ArrayList<IsoGridSquare>`

  `stchoices`

  `private final List<IsoCell.StencilArea>`

  `stencilAreas`

  `private final Map<String,Texture>`

  `stencilTexture`

  `(package private) final ArrayList<IsoSurvivor>`

  `survivorList`

  `(package private) final Vector2`

  `tempCutawaySqrVector`

  `ArrayList<ArrayList<Long>>`

  `tempPlayerCutawayRoomIds`

  `(package private) ArrayList<ArrayList<Long>>`

  `tempPrevPlayerCutawayRoomIds`

  `private static Texture`

  `texWhite`

  `ArrayList<IsoGridSquare>`

  `trees`

  `final int[]`

  `unhideFloorsCounter`

  `static final ArrayList<IsoGridSquare>`

  `VegetationCorpses`

  `final Set<BaseVehicle>`

  `vehicles`

  `static zombie.core.opengl.Shader`

  `wallRenderShader`

  `private IsoWeatherFX`

  `weatherFx`

  `private int`

  `width`

  `private final ArrayList<IsoWindow>`

  `windowList`

  `private int`

  `worldX`

  `private int`

  `worldY`

  `(package private) static int`

  `wx`

  `(package private) static int`

  `wy`

  `private final ArrayList<IsoZombie>`

  `zombieList`

  `final ArrayList<ArrayList<IsoBuilding>>`

  `zombieOccluderBuildings`

  `final IsoBuilding[][]`

  `zombieOccluderBuildingsArr`

  `static final int`

  `ZOMBIESCANBUDGET`

  `int`

  `zombieScanCursor`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoCell(int width,
  int height)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addHeatSource(IsoHeatSource heatSource)`

  `IsoLightSource`

  `addLamppost(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  int rad)`

  `void`

  `addLamppost(IsoLightSource light)`

  `void`

  `addMovingObject(IsoMovingObject o)`

  `IsoObject`

  `addTileObject(IsoGridSquare sq,
  String spriteName)`

  `void`

  `addToProcessIsoObject(IsoObject object)`

  `void`

  `addToProcessIsoObjectRemove(IsoObject object)`

  `void`

  `addToProcessItems(ArrayList<InventoryItem> items)`

  `void`

  `addToProcessItems(InventoryItem item)`

  `void`

  `addToProcessItemsRemove(ArrayList<InventoryItem> items)`

  `void`

  `addToProcessItemsRemove(InventoryItem item)`

  `void`

  `addToProcessWorldItems(IsoWorldInventoryObject worldItem)`

  `void`

  `addToProcessWorldItemsRemove(IsoWorldInventoryObject worldItem)`

  `void`

  `addToStaticUpdaterObjectList(IsoObject object)`

  `void`

  `addToWindowList(IsoWindow window)`

  `void`

  `AddUniqueToBuildingList(ArrayList<IsoBuilding> buildings,
  IsoBuilding inBuilding)`

  `boolean`

  `blocked(zombie.ai.astar.Mover mover,
  int x,
  int y,
  int z,
  int lx,
  int ly,
  int lz)`

  `private int`

  `CalculateColor(IsoGridSquare sqUL,
  IsoGridSquare sqU,
  IsoGridSquare sqL,
  IsoGridSquare sqThis,
  int col,
  int playerIndex)`

  `void`

  `CalculateVertColoursForTile(IsoGridSquare sqThis,
  int x,
  int y,
  int zz,
  int playerIndex)`

  `boolean`

  `CanBuildingSquareOccludePlayer(IsoGridSquare square,
  int playerIndex)`

  `void`

  `checkHaveRoof(int x,
  int y)`

  `void`

  `clearCacheGridSquare(int playerIndex)`

  `boolean`

  `collapsibleBuildingSquareAlgorithm(BuildingDef def,
  IsoGridSquare sq,
  IsoGridSquare pl)`

  `IsoGridSquare`

  `ConnectNewSquare(IsoGridSquare newSquare,
  boolean bDoSurrounds)`

  `(package private) IsoGridSquare`

  `ConnectNewSquare(IsoGridSquare newSquare,
  boolean bDoSurrounds,
  boolean specialSquare)`

  `IsoGridSquare`

  `createNewGridSquare(int x,
  int y,
  int z,
  boolean recalcAll)`

  `private void`

  `CullFullyOccludedSquares(zombie.iso.IsoGridStack gridStacks,
  boolean[][][] vf,
  boolean[][] cf)`

  `void`

  `DeleteAllMovingObjects()`

  `void`

  `Dispose()`

  `float`

  `DistanceFromSupport(int x,
  int y,
  int z)`

  `boolean`

  `DoBuilding(int player,
  boolean bRender)`

  `private boolean`

  `doBuildingInternal(int player,
  boolean bRender)`

  `boolean`

  `DoesSquareHaveValidCutaways(IsoGridSquare playerSquare,
  IsoGridSquare square,
  int playerIndex,
  long currentTimeMillis)`

  `void`

  `drawStencilMask()`

  `private void`

  `drawStencilMask(String filename,
  int x,
  int y,
  int offX,
  int offY)`

  `void`

  `EnsureSurroundNotNull(int xx,
  int yy,
  int zz)`

  `void`

  `flattenAnyFoliage(IsoCell.PerPlayerRender perPlayerRender,
  int playerIndex)`

  `static IsoDirections`

  `FromMouseTile()`

  `Set<IsoMovingObject>`

  `getAddList()`

  `List<IsoAnimal>`

  `getAnimals()`

  `static int`

  `getBComponent(int col)`

  `Stack<zombie.iso.areas.BuildingScore>`

  `getBestBuildings(IsoCell.BuildingSearchCriteria criteria,
  int count)`

  `private int`

  `GetBuildingHeightAt(IsoBuilding building,
  int inX,
  int inY,
  int inZ)`

  `ArrayList<IsoBuilding>`

  `getBuildingList()`

  `static Stack<zombie.iso.areas.BuildingScore>`

  `getBuildings()`

  `HashMap<Integer, zombie.iso.areas.BuildingScore>`

  `getBuildingScores()`

  `void`

  `GetBuildingsInFrontOfCharacter(ArrayList<IsoBuilding> buildings,
  IsoGridSquare square,
  boolean bRightOfSquare)`

  `private void`

  `GetBuildingsInFrontOfCharacterSquare(int inX,
  int inY,
  int inZ,
  boolean bRightOfSquare,
  ArrayList<IsoBuilding> outBuildings)`

  `ArrayList<IsoBuilding>`

  `GetBuildingsInFrontOfMustSeeSquare(IsoGridSquare square,
  zombie.iso.IsoGridOcclusionData.OcclusionFilter filter)`

  `static int`

  `getCellSizeInChunks()`

  `static int`

  `getCellSizeInSquares()`

  `IsoChunk`

  `getChunk(int wx,
  int wy)`

  `IsoChunk`

  `getChunkForGridSquare(int x,
  int y,
  int z)`

  `IsoChunkMap`

  `getChunkMap(int pl)`

  `IsoBuilding`

  `getClosestBuildingExcept(IsoGameCharacter chr,
  IsoRoom except)`

  `int`

  `getCurrentLightX()`

  `int`

  `getCurrentLightY()`

  `int`

  `getCurrentLightZ()`

  `zombie.iso.LotHeader`

  `getCurrentLotHeader()`

  `int`

  `getDangerScore(int x,
  int y)`

  `zombie.core.utils.OnceEvery`

  `getDangerUpdate()`

  `se.krka.kahlua.vm.KahluaTable`

  `getDrag(int player)`

  `long`

  `GetEffectivePlayerRoomId()`

  `IsoZombie`

  `getFakeZombieForHit()`

  `IsoGridSquare`

  `getFreeTile(RoomDef def)`

  `static int`

  `getGComponent(int col)`

  `IsoGridSquare`

  `getGridSquare(double x,
  double y,
  double z)`

  `IsoGridSquare`

  `getGridSquare(int x,
  int y,
  int z)`

  `IsoGridSquare`

  `getGridSquare(Double x,
  Double y,
  Double z)`

  `IsoGridSquare`

  `getGridSquareDirect(int x,
  int y,
  int z,
  int playerIndex)`

  `float`

  `getHeatSourceHighestTemperature(float surroundingAirTemperature,
  int x,
  int y,
  int z)`

  `int`

  `getHeatSourceTemperature(int x,
  int y,
  int z)`

  `int`

  `getHeight()`

  `int`

  `getHeightInTiles()`

  `static IsoCell`

  `getInstance()`

  `Stack<IsoLightSource>`

  `getLamppostPositions()`

  `Thread`

  `getLightInfoUpdate()`

  `IsoLightSource`

  `getLightSourceAt(int x,
  int y,
  int z)`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaObjectList()`

  `int`

  `getMaxFloors()`

  `static int`

  `getMaxHeight()`

  `int`

  `getMaxX()`

  `int`

  `getMaxY()`

  `int`

  `getMaxZ()`

  `int`

  `getMinX()`

  `int`

  `getMinY()`

  `int`

  `getMinZ()`

  `IsoZombie`

  `getNearestVisibleZombie(int playerIndex)`

  `IsoSurvivor`

  `getNetworkPlayer(int remoteId)`

  `Set<IsoMovingObject>`

  `getObjectList()`

  `List<IsoMovingObject>`

  `getObjectListForLua()`

  `IsoGridSquare`

  `getOrCreateGridSquare(double x,
  double y,
  double z)`

  `private IsoGridSquare[]`

  `getOrCreateGridSquares(int playerIndex)`

  `IsoBuilding`

  `GetPeekedInBuilding(IsoGridSquare square,
  IsoDirections lookDir)`

  `IsoCell.PerPlayerRender`

  `getPerPlayerRenderAt(int playerIndex)`

  `Set<IsoObject>`

  `getProcessIsoObjectRemove()`

  `ArrayList<IsoObject>`

  `getProcessIsoObjects()`

  `ArrayList<InventoryItem>`

  `getProcessItems()`

  `Set<InventoryItem>`

  `getProcessItemsRemove()`

  `ArrayList<IsoWorldInventoryObject>`

  `getProcessWorldItems()`

  `ArrayList<IsoPushableObject>`

  `getPushableObjectList()`

  `int`

  `getRainIntensity()`

  `(package private) IsoGridSquare`

  `getRandomFreeTile()`

  `IsoGridSquare`

  `getRandomFreeTileInRoom()`

  `(package private) IsoGridSquare`

  `getRandomOutdoorFreeTile()`

  `IsoGridSquare`

  `getRandomOutdoorTile()`

  `static int`

  `getRComponent(int col)`

  `IsoGridSquare`

  `getRelativeGridSquare(int x,
  int y,
  int z)`

  `ArrayList<IsoGameCharacter>`

  `getRemoteSurvivorList()`

  `Set<IsoMovingObject>`

  `getRemoveList()`

  `IsoRoom`

  `getRoom(int id)`

  `ArrayList<IsoRoom>`

  `getRoomList()`

  `private static int`

  `getShoreInt(IsoGridSquare sq)`

  `int`

  `getSnowTarget()`

  `IsoSpriteManager`

  `getSpriteManager()`

  `void`

  `GetSquaresAroundPlayerSquare(IsoPlayer player,
  IsoGridSquare square,
  ArrayList<IsoGridSquare> outGridSquaresToLeft,
  ArrayList<IsoGridSquare> outGridSquaresToRight)`

  `ArrayList<IsoObject>`

  `getStaticUpdaterObjectList()`

  `List<IsoCell.StencilArea>`

  `getStencilAreas()`

  `private Texture`

  `getStencilTexture(String filename)`

  `ArrayList<IsoSurvivor>`

  `getSurvivorList()`

  `Set<BaseVehicle>`

  `getVehicles()`

  `IsoWeatherFX`

  `getWeatherFX()`

  `int`

  `getWidth()`

  `int`

  `getWidthInTiles()`

  `ArrayList<IsoWindow>`

  `getWindowList()`

  `int`

  `getWorldX()`

  `int`

  `getWorldY()`

  `ArrayList<IsoZombie>`

  `getZombieList()`

  `boolean`

  `gridSquareIsSnow(int x,
  int y,
  int z)`

  `void`

  `initTileShaders()`

  `protected boolean`

  `initWeatherFx()`

  `private static void`

  `InsertAt(int a,
  zombie.iso.areas.BuildingScore score,
  zombie.iso.areas.BuildingScore[] array)`

  `void`

  `invalidatePeekedRoom(int playerIndex)`

  `private static boolean`

  `isBasementWallAdjacentToTheVoid(IsoObject object,
  IsoFlagType wallType,
  IsoDirections adjacentDir)`

  `static boolean`

  `isBasementWallAdjacentToTheVoid_North(IsoObject object)`

  `static boolean`

  `isBasementWallAdjacentToTheVoid_West(IsoObject object)`

  `boolean`

  `IsBehindStuff(IsoGridSquare sq)`

  `(package private) boolean`

  `isBlocked(IsoGridSquare from,
  IsoGridSquare to)`

  `boolean`

  `IsCollapsibleBuildingSquare(IsoGridSquare square)`

  `boolean`

  `IsCutawaySquare(IsoGridSquare square,
  long currentTimeMillis)`

  `private boolean`

  `IsDissolvedSquare(IsoGridSquare square,
  int playerIndex)`

  `boolean`

  `isInChunkMap(int x,
  int y)`

  `boolean`

  `isInStencil(float sx,
  float sy)`

  `boolean`

  `isNull(int x,
  int y,
  int z)`

  `boolean`

  `IsPlayerWindowPeeking(int playerIndex)`

  `boolean`

  `isSafeToAdd()`

  `private static boolean`

  `isSnowShore(IsoGridSquare sq,
  int ox,
  int oy)`

  `boolean`

  `LoadPlayer(int worldVersion)`

  `private void`

  `ObjectDeletionAddition()`

  `private void`

  `performRenderTiles(IsoCell.PerPlayerRender perPlayerRender,
  int maxHeight,
  int playerIndex,
  long currentTimeMillis)`

  `(package private) static void`

  `Place(zombie.iso.areas.BuildingScore score,
  zombie.iso.areas.BuildingScore[] array,
  IsoCell.BuildingSearchCriteria criteria)`

  `void`

  `PlaceLot(String filename,
  int sx,
  int sy,
  int sz,
  boolean bClearExisting)`

  `void`

  `PlaceLot(IsoLot lot,
  int sx,
  int sy,
  int sz,
  boolean bClearExisting)`

  `int`

  `PlaceLot(IsoLot lot,
  int sx,
  int sy,
  int sz,
  IsoChunk ch,
  int wx,
  int wy,
  boolean[] bDoneSquares)`

  `private void`

  `ProcessIsoObject()`

  `private void`

  `ProcessItems(Iterator<InventoryItem> it2)`

  `private void`

  `ProcessObjects(Iterator<IsoMovingObject> it)`

  `private void`

  `ProcessRemoveItems(Iterator<InventoryItem> it2)`

  `void`

  `ProcessSpottedRooms()`

  `private void`

  `ProcessStaticUpdaters()`

  `void`

  `putInVehicle(IsoGameCharacter chr)`

  `private void`

  `recalculateAnyGridStacks(IsoCell.PerPlayerRender perPlayerRender,
  int maxHeight,
  int playerIndex,
  long currentTimeMillis)`

  `void`

  `reloadRainTextures()`

  `void`

  `Remove(IsoMovingObject obj)`

  `void`

  `removeFromStaticUpdaterObjectList(IsoObject object)`

  `void`

  `removeFromWindowList(IsoWindow window)`

  `void`

  `removeHeatSource(IsoHeatSource heatSource)`

  `void`

  `removeLamppost(int x,
  int y,
  int z)`

  `void`

  `removeLamppost(IsoLightSource light)`

  `void`

  `render()`

  `void`

  `renderDebugLighting(IsoCell.PerPlayerRender perPlayerRender,
  int maxHeight)`

  `void`

  `renderDebugPhysics(int playerIndex)`

  `void`

  `RenderFloorShading(int zza)`

  `private void`

  `renderInternal()`

  `private void`

  `renderLast()`

  `void`

  `renderRain()`

  `void`

  `renderShadows()`

  `void`

  `RenderSnow(int zza)`

  `private void`

  `renderSnowTile(IsoCell.SnowGrid sgrid,
  int gx,
  int gy,
  int s,
  IsoGridSquare sq,
  int shore,
  Texture tex,
  int sx,
  int sy,
  float alpha)`

  `private void`

  `renderSnowTileBase(Texture tex,
  int sx,
  int sy,
  float alpha,
  boolean square)`

  `private void`

  `renderSnowTileGeneral(IsoCell.SnowGrid snowGrid,
  float alpha,
  IsoGridSquare square,
  int shore,
  int snowX,
  int snowY,
  int sx,
  int sy,
  int s)`

  `void`

  `RenderTiles(int maxHeight)`

  `private void`

  `renderTilesInternal(int maxHeight)`

  `private void`

  `renderWeatherFx()`

  `void`

  `resumeVehicleSounds(IsoGameCharacter chr)`

  Deprecated.

  `void`

  `roomSpotted(IsoRoom room)`

  `void`

  `save(DataOutputStream output,
  boolean bDoChars)`

  `static void`

  `setBuildings(Stack<zombie.iso.areas.BuildingScore> scores)`

  `void`

  `setCacheChunk(IsoChunk chunk)`

  `void`

  `setCacheChunk(IsoChunk chunk,
  int playerIndex)`

  `void`

  `setCacheGridSquare(int x,
  int y,
  int z,
  IsoGridSquare square)`

  `void`

  `setCacheGridSquareLocal(int x,
  int y,
  int z,
  IsoGridSquare square,
  int playerIndex)`

  `void`

  `setCurrentLightX(int currentLX)`

  `void`

  `setCurrentLightY(int currentLY)`

  `void`

  `setCurrentLightZ(int currentLZ)`

  `boolean`

  `SetCutawayRoomsForPlayer()`

  `void`

  `setDangerUpdate(zombie.core.utils.OnceEvery dangerUpdate)`

  `void`

  `setDrag(se.krka.kahlua.vm.KahluaTable draggingItem,
  int player)`

  `void`

  `setHeight(int height)`

  `void`

  `setLightInfoUpdate(Thread lightInfoUpdate)`

  `void`

  `setMaxX(int maxX)`

  `void`

  `setMaxY(int maxY)`

  `void`

  `setMaxZ(int maxZ)`

  `void`

  `setMinX(int minX)`

  `void`

  `setMinY(int minY)`

  `void`

  `setMinZ(int minZ)`

  `void`

  `setRainAlpha(int alpha)`

  `void`

  `setRainIntensity(int intensity)`

  `void`

  `setRainSpeed(int speed)`

  `void`

  `setSafeToAdd(boolean safeToAdd)`

  `void`

  `setSnowTarget(int target)`

  `void`

  `setWidth(int width)`

  `void`

  `setWorldX(int worldX)`

  `void`

  `setWorldY(int worldY)`

  `static int`

  `toIntColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `update()`

  `void`

  `updateHeatSources()`

  `private void`

  `updateInternal()`

  `private void`

  `updateSnow(int fracTarget)`

  `private void`

  `updateWeatherFx()`

  `private void`

  `updateZombiesForRender(IsoGameCharacter isoGameCharacter,
  int playerIndex)`

  `private void`

  `updateZombieVocals()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### CELL\_SIZE\_IN\_CHUNKS

    public static final int CELL\_SIZE\_IN\_CHUNKS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.CELL_SIZE_IN_CHUNKS)
  + ### CELL\_SIZE\_IN\_SQUARES

    public static final int CELL\_SIZE\_IN\_SQUARES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.CELL_SIZE_IN_SQUARES)
  + ### maxHeight

    public static int maxHeight
  + ### floorRenderShader

    public static zombie.core.opengl.Shader floorRenderShader
  + ### wallRenderShader

    public static zombie.core.opengl.Shader wallRenderShader
  + ### trees

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> trees
  + ### minHeight

    public int minHeight
  + ### stchoices

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> stchoices
  + ### chunkMap

    public final [IsoChunkMap](IsoChunkMap.html "class in zombie.iso")[] chunkMap
  + ### buildingList

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> buildingList
  + ### windowList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects")> windowList
  + ### objectList

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> objectList
  + ### pushableObjectList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPushableObject](IsoPushableObject.html "class in zombie.iso")> pushableObjectList
  + ### buildingScores

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), zombie.iso.areas.BuildingScore> buildingScores
  + ### roomList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas")> roomList
  + ### staticUpdaterObjectList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> staticUpdaterObjectList
  + ### staticUpdaterObjectSet

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> staticUpdaterObjectSet
  + ### zombieList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> zombieList
  + ### remoteSurvivorList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> remoteSurvivorList
  + ### removeList

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> removeList
  + ### addList

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> addList
  + ### processIsoObject

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> processIsoObject
  + ### processIsoObjectSet

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> processIsoObjectSet
  + ### processIsoObjectRemove

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> processIsoObjectRemove
  + ### processItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> processItems
  + ### processItemsRemove

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> processItemsRemove
  + ### processWorldItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> processWorldItems
  + ### processWorldItemsRemove

    public final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> processWorldItemsRemove
  + ### gridSquares

    private final [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[][] gridSquares
  + ### ENABLE\_SQUARE\_CACHE

    public static final boolean ENABLE\_SQUARE\_CACHE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.ENABLE_SQUARE_CACHE)
  + ### height

    private int height
  + ### width

    private int width
  + ### worldX

    private int worldX
  + ### worldY

    private int worldY
  + ### dangerScore

    public zombie.core.utils.IntGrid dangerScore
  + ### safeToAdd

    private boolean safeToAdd
  + ### lamppostPositions

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoLightSource](IsoLightSource.html "class in zombie.iso")> lamppostPositions
  + ### roomLights

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoRoomLight> roomLights
  + ### heatSources

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoHeatSource](IsoHeatSource.html "class in zombie.iso")> heatSources
  + ### addVehicles

    public final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles")> addVehicles
  + ### vehicles

    public final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles")> vehicles
  + ### ISOANGLEFACTOR

    public static final int ISOANGLEFACTOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.ISOANGLEFACTOR)
  + ### ZOMBIESCANBUDGET

    public static final int ZOMBIESCANBUDGET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.ZOMBIESCANBUDGET)
  + ### NEARESTZOMBIEDISTSQRMAX

    public static final float NEARESTZOMBIEDISTSQRMAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.NEARESTZOMBIEDISTSQRMAX)
  + ### zombieScanCursor

    public int zombieScanCursor
  + ### nearestVisibleZombie

    public final [IsoZombie](../characters/IsoZombie.html "class in zombie.characters")[] nearestVisibleZombie
  + ### nearestVisibleZombieDistSqr

    public final float[] nearestVisibleZombieDistSqr
  + ### buildingscores

    private static [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.areas.BuildingScore> buildingscores
  + ### gridStack

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> gridStack
  + ### RTF\_SolidFloor

    public static final int RTF\_SolidFloor

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.RTF_SolidFloor)
  + ### RTF\_VegetationCorpses

    public static final int RTF\_VegetationCorpses

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.RTF_VegetationCorpses)
  + ### RTF\_MinusFloorCharacters

    public static final int RTF\_MinusFloorCharacters

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.RTF_MinusFloorCharacters)
  + ### RTF\_ShadedFloor

    public static final int RTF\_ShadedFloor

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.RTF_ShadedFloor)
  + ### RTF\_Shadows

    public static final int RTF\_Shadows

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.RTF_Shadows)
  + ### ShadowSquares

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> ShadowSquares
  + ### MinusFloorCharacters

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> MinusFloorCharacters
  + ### SolidFloor

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> SolidFloor
  + ### ShadedFloor

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> ShadedFloor
  + ### VegetationCorpses

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> VegetationCorpses
  + ### perPlayerRender

    public static final [IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso")[] perPlayerRender
  + ### stencilTexture

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Texture](../core/textures/Texture.html "class in zombie.core.textures")> stencilTexture
  + ### stencilAreas

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoCell.StencilArea](IsoCell.StencilArea.html "class in zombie.iso")> stencilAreas
  + ### diamondMatrixIterator

    private final zombie.iso.DiamondMatrixIterator diamondMatrixIterator
  + ### diamondMatrixPos

    private final org.joml.Vector2i diamondMatrixPos
  + ### deferredCharacterTick

    public int deferredCharacterTick
  + ### hasSetupSnowGrid

    private boolean hasSetupSnowGrid
  + ### snowGridTilesSquare

    private [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso") snowGridTilesSquare
  + ### snowGridTilesStrip

    private [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso")[] snowGridTilesStrip
  + ### snowGridTilesEdge

    private [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso")[] snowGridTilesEdge
  + ### snowGridTilesCove

    private [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso")[] snowGridTilesCove
  + ### snowGridTilesEnclosed

    private [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso") snowGridTilesEnclosed
  + ### snowFirstNonSquare

    private int snowFirstNonSquare
  + ### snowNoise2d

    private zombie.erosion.utils.Noise2D snowNoise2d
  + ### snowGridCur

    private [IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") snowGridCur
  + ### snowGridPrev

    private [IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") snowGridPrev
  + ### snowFracTarget

    private int snowFracTarget
  + ### snowFadeTime

    private long snowFadeTime
  + ### snowTransitionTime

    private final float snowTransitionTime

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.snowTransitionTime)
  + ### raport

    private final int raport

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.raport)
  + ### SNOWSHORE\_NONE

    private static final int SNOWSHORE\_NONE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SNOWSHORE_NONE)
  + ### SNOWSHORE\_N

    private static final int SNOWSHORE\_N

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SNOWSHORE_N)
  + ### SNOWSHORE\_E

    private static final int SNOWSHORE\_E

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SNOWSHORE_E)
  + ### SNOWSHORE\_S

    private static final int SNOWSHORE\_S

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SNOWSHORE_S)
  + ### SNOWSHORE\_W

    private static final int SNOWSHORE\_W

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SNOWSHORE_W)
  + ### recalcFloors

    public boolean recalcFloors
  + ### wx

    static int wx
  + ### wy

    static int wy
  + ### drag

    final se.krka.kahlua.vm.KahluaTable[] drag
  + ### survivorList

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSurvivor](../characters/IsoSurvivor.html "class in zombie.characters")> survivorList
  + ### texWhite

    private static [Texture](../core/textures/Texture.html "class in zombie.core.textures") texWhite
  + ### instance

    private static [IsoCell](IsoCell.html "class in zombie.iso") instance
  + ### currentLx

    private int currentLx
  + ### currentLy

    private int currentLy
  + ### currentLz

    private int currentLz
  + ### recalcShading

    public int recalcShading
  + ### lastMinX

    public int lastMinX
  + ### lastMinY

    public int lastMinY
  + ### rainScroll

    private float rainScroll
  + ### rainX

    private final int[] rainX
  + ### rainY

    private final int[] rainY
  + ### rainTextures

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures")[] rainTextures
  + ### rainFileTime

    private final long[] rainFileTime
  + ### rainAlphaMax

    private float rainAlphaMax
  + ### rainAlpha

    private final float[] rainAlpha
  + ### rainIntensity

    protected int rainIntensity
  + ### rainSpeed

    protected int rainSpeed
  + ### lightUpdateCount

    public int lightUpdateCount
  + ### rendering

    public boolean rendering
  + ### hideFloors

    public final boolean[] hideFloors
  + ### unhideFloorsCounter

    public final int[] unhideFloorsCounter
  + ### occludedByOrphanStructureFlag

    public boolean occludedByOrphanStructureFlag
  + ### playerPeekedRoomId

    public long playerPeekedRoomId
  + ### playerOccluderBuildings

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")>> playerOccluderBuildings
  + ### playerOccluderBuildingsArr

    public final [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")[][] playerOccluderBuildingsArr
  + ### playerWindowPeekingRoomId

    public final long[] playerWindowPeekingRoomId
  + ### playerHidesOrphanStructures

    public final boolean[] playerHidesOrphanStructures
  + ### playerCutawaysDirty

    public final boolean[] playerCutawaysDirty
  + ### tempCutawaySqrVector

    final [Vector2](Vector2.html "class in zombie.iso") tempCutawaySqrVector
  + ### tempPrevPlayerCutawayRoomIds

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")>> tempPrevPlayerCutawayRoomIds
  + ### tempPlayerCutawayRoomIds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")>> tempPlayerCutawayRoomIds
  + ### lastPlayerSquare

    public final [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] lastPlayerSquare
  + ### lastPlayerSquareHalf

    public final boolean[] lastPlayerSquareHalf
  + ### lastPlayerDir

    public final [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] lastPlayerDir
  + ### lastPlayerAngle

    public final [Vector2](Vector2.html "class in zombie.iso")[] lastPlayerAngle
  + ### hidesOrphanStructuresAbove

    public int hidesOrphanStructuresAbove
  + ### buildingRectTemp

    final [Rectangle](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/Rectangle.html "class or interface in java.awt") buildingRectTemp
  + ### zombieOccluderBuildings

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")>> zombieOccluderBuildings
  + ### zombieOccluderBuildingsArr

    public final [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")[][] zombieOccluderBuildingsArr
  + ### lastZombieSquare

    public final [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] lastZombieSquare
  + ### lastZombieSquareHalf

    public final boolean[] lastZombieSquareHalf
  + ### otherOccluderBuildings

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")>> otherOccluderBuildings
  + ### otherOccluderBuildingsArr

    public final [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")[][] otherOccluderBuildingsArr
  + ### mustSeeSquaresRadius

    final int mustSeeSquaresRadius

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.mustSeeSquaresRadius)
  + ### mustSeeSquaresGridSize

    final int mustSeeSquaresGridSize

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.mustSeeSquaresGridSize)
  + ### gridSquaresTempLeft

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> gridSquaresTempLeft
  + ### gridSquaresTempRight

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> gridSquaresTempRight
  + ### weatherFx

    private [IsoWeatherFX](weather/fx/IsoWeatherFX.html "class in zombie.iso.weather.fx") weatherFx
  + ### minX

    public int minX
  + ### maxX

    public int maxX
  + ### minY

    public int minY
  + ### maxY

    public int maxY
  + ### minZ

    public int minZ
  + ### maxZ

    public int maxZ
  + ### dangerUpdate

    private zombie.core.utils.OnceEvery dangerUpdate
  + ### lightInfoUpdate

    private [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") lightInfoUpdate
  + ### lastServerItemsUpdate

    long lastServerItemsUpdate
  + ### spottedRooms

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas")> spottedRooms
  + ### fakeZombieForHit

    private [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") fakeZombieForHit
* Constructor Details
  -------------------

  + ### IsoCell

    public IsoCell(int width,
    int height)
* Method Details
  --------------

  + ### getMaxHeight

    public static int getMaxHeight()
  + ### getCellSizeInChunks

    public static int getCellSizeInChunks()
  + ### getCellSizeInSquares

    public static int getCellSizeInSquares()
  + ### getCurrentLotHeader

    public zombie.iso.LotHeader getCurrentLotHeader()
  + ### getChunkMap

    public [IsoChunkMap](IsoChunkMap.html "class in zombie.iso") getChunkMap(int pl)
  + ### getFreeTile

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFreeTile([RoomDef](RoomDef.html "class in zombie.iso") def)
  + ### getBuildings

    public static [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.areas.BuildingScore> getBuildings()

    Returns:
    :   the getBuildings
  + ### setBuildings

    public static void setBuildings([Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.areas.BuildingScore> scores)
  + ### getNearestVisibleZombie

    public [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") getNearestVisibleZombie(int playerIndex)
  + ### getChunkForGridSquare

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunkForGridSquare(int x,
    int y,
    int z)
  + ### getChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunk(int wx,
    int wy)
  + ### CalculateVertColoursForTile

    public void CalculateVertColoursForTile([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqThis,
    int x,
    int y,
    int zz,
    int playerIndex)
  + ### getStencilTexture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") getStencilTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### drawStencilMask

    public void drawStencilMask()
  + ### drawStencilMask

    private void drawStencilMask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int x,
    int y,
    int offX,
    int offY)
  + ### isInStencil

    public boolean isInStencil(float sx,
    float sy)
  + ### getStencilAreas

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoCell.StencilArea](IsoCell.StencilArea.html "class in zombie.iso")> getStencilAreas()
  + ### RenderTiles

    public void RenderTiles(int maxHeight)
  + ### renderTilesInternal

    private void renderTilesInternal(int maxHeight)
  + ### initTileShaders

    public void initTileShaders()
  + ### getPerPlayerRenderAt

    public [IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") getPerPlayerRenderAt(int playerIndex)
  + ### recalculateAnyGridStacks

    private void recalculateAnyGridStacks([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int maxHeight,
    int playerIndex,
    long currentTimeMillis)
  + ### flattenAnyFoliage

    public void flattenAnyFoliage([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int playerIndex)
  + ### performRenderTiles

    private void performRenderTiles([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int maxHeight,
    int playerIndex,
    long currentTimeMillis)
  + ### renderShadows

    public void renderShadows()
  + ### renderDebugPhysics

    public void renderDebugPhysics(int playerIndex)
  + ### renderDebugLighting

    public void renderDebugLighting([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int maxHeight)
  + ### CullFullyOccludedSquares

    private void CullFullyOccludedSquares(zombie.iso.IsoGridStack gridStacks,
    boolean[][][] vf,
    boolean[][] cf)
  + ### RenderFloorShading

    public void RenderFloorShading(int zza)
  + ### IsPlayerWindowPeeking

    public boolean IsPlayerWindowPeeking(int playerIndex)
  + ### CanBuildingSquareOccludePlayer

    public boolean CanBuildingSquareOccludePlayer([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int playerIndex)
  + ### GetEffectivePlayerRoomId

    public long GetEffectivePlayerRoomId()
  + ### SetCutawayRoomsForPlayer

    public boolean SetCutawayRoomsForPlayer()
  + ### IsCutawaySquare

    public boolean IsCutawaySquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    long currentTimeMillis)
  + ### DoesSquareHaveValidCutaways

    public boolean DoesSquareHaveValidCutaways([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") playerSquare,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int playerIndex,
    long currentTimeMillis)
  + ### IsCollapsibleBuildingSquare

    public boolean IsCollapsibleBuildingSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### collapsibleBuildingSquareAlgorithm

    public boolean collapsibleBuildingSquareAlgorithm([BuildingDef](BuildingDef.html "class in zombie.iso") def,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") pl)
  + ### IsDissolvedSquare

    private boolean IsDissolvedSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int playerIndex)
  + ### GetBuildingHeightAt

    private int GetBuildingHeightAt([IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") building,
    int inX,
    int inY,
    int inZ)
  + ### updateSnow

    private void updateSnow(int fracTarget)
  + ### setSnowTarget

    public void setSnowTarget(int target)
  + ### getSnowTarget

    public int getSnowTarget()
  + ### gridSquareIsSnow

    public boolean gridSquareIsSnow(int x,
    int y,
    int z)
  + ### RenderSnow

    public void RenderSnow(int zza)
  + ### renderSnowTileGeneral

    private void renderSnowTileGeneral([IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") snowGrid,
    float alpha,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int shore,
    int snowX,
    int snowY,
    int sx,
    int sy,
    int s)
  + ### renderSnowTileBase

    private void renderSnowTileBase([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    int sx,
    int sy,
    float alpha,
    boolean square)
  + ### renderSnowTile

    private void renderSnowTile([IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") sgrid,
    int gx,
    int gy,
    int s,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    int shore,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    int sx,
    int sy,
    float alpha)
  + ### getShoreInt

    private static int getShoreInt([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### isSnowShore

    private static boolean isSnowShore([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    int ox,
    int oy)
  + ### getClosestBuildingExcept

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getClosestBuildingExcept([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") except)
  + ### getDangerScore

    public int getDangerScore(int x,
    int y)
  + ### ObjectDeletionAddition

    private void ObjectDeletionAddition()
  + ### ProcessItems

    private void ProcessItems([Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> it2)
  + ### ProcessIsoObject

    private void ProcessIsoObject()
  + ### ProcessObjects

    private void ProcessObjects([Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> it)
  + ### updateZombieVocals

    private void updateZombieVocals()
  + ### ProcessRemoveItems

    private void ProcessRemoveItems([Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> it2)
  + ### ProcessStaticUpdaters

    private void ProcessStaticUpdaters()
  + ### addToProcessIsoObject

    public void addToProcessIsoObject([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### addToProcessIsoObjectRemove

    public void addToProcessIsoObjectRemove([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### addToStaticUpdaterObjectList

    public void addToStaticUpdaterObjectList([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### removeFromStaticUpdaterObjectList

    public void removeFromStaticUpdaterObjectList([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### addToProcessItems

    public void addToProcessItems([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### addToProcessItems

    public void addToProcessItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### addToProcessItemsRemove

    public void addToProcessItemsRemove([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### addToProcessItemsRemove

    public void addToProcessItemsRemove([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### addToProcessWorldItems

    public void addToProcessWorldItems([IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") worldItem)
  + ### addToProcessWorldItemsRemove

    public void addToProcessWorldItemsRemove([IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") worldItem)
  + ### getNetworkPlayer

    public [IsoSurvivor](../characters/IsoSurvivor.html "class in zombie.characters") getNetworkPlayer(int remoteId)
  + ### ConnectNewSquare

    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") ConnectNewSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") newSquare,
    boolean bDoSurrounds,
    boolean specialSquare)
  + ### ConnectNewSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") ConnectNewSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") newSquare,
    boolean bDoSurrounds)
  + ### PlaceLot

    public void PlaceLot([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int sx,
    int sy,
    int sz,
    boolean bClearExisting)
  + ### PlaceLot

    public void PlaceLot([IsoLot](IsoLot.html "class in zombie.iso") lot,
    int sx,
    int sy,
    int sz,
    boolean bClearExisting)
  + ### PlaceLot

    public int PlaceLot([IsoLot](IsoLot.html "class in zombie.iso") lot,
    int sx,
    int sy,
    int sz,
    [IsoChunk](IsoChunk.html "class in zombie.iso") ch,
    int wx,
    int wy,
    boolean[] bDoneSquares)
  + ### setDrag

    public void setDrag(se.krka.kahlua.vm.KahluaTable draggingItem,
    int player)
  + ### getDrag

    public se.krka.kahlua.vm.KahluaTable getDrag(int player)
  + ### DoBuilding

    public boolean DoBuilding(int player,
    boolean bRender)
  + ### doBuildingInternal

    private boolean doBuildingInternal(int player,
    boolean bRender)
  + ### DistanceFromSupport

    public float DistanceFromSupport(int x,
    int y,
    int z)
  + ### getBuildingList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> getBuildingList()

    Returns:
    :   the BuildingList
  + ### getWindowList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects")> getWindowList()
  + ### addToWindowList

    public void addToWindowList([IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### removeFromWindowList

    public void removeFromWindowList([IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### getObjectList

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getObjectList()

    Returns:
    :   the ObjectList
  + ### getObjectListForLua

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getObjectListForLua()
  + ### getRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getRoom(int id)
  + ### getPushableObjectList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPushableObject](IsoPushableObject.html "class in zombie.iso")> getPushableObjectList()

    Returns:
    :   the PushableObjectList
  + ### getBuildingScores

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), zombie.iso.areas.BuildingScore> getBuildingScores()

    Returns:
    :   the BuildingScores
  + ### getRoomList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas")> getRoomList()

    Returns:
    :   the RoomList
  + ### getStaticUpdaterObjectList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getStaticUpdaterObjectList()

    Returns:
    :   the StaticUpdaterObjectList
  + ### getZombieList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> getZombieList()

    Returns:
    :   the ZombieList
  + ### getRemoteSurvivorList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> getRemoteSurvivorList()

    Returns:
    :   the RemoteSurvivorList
  + ### getRemoveList

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getRemoveList()

    Returns:
    :   the removeList
  + ### getAddList

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMovingObject](IsoMovingObject.html "class in zombie.iso")> getAddList()

    Returns:
    :   the addList
  + ### addMovingObject

    public void addMovingObject([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") o)
  + ### getProcessItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> getProcessItems()

    Returns:
    :   the ProcessItems
  + ### getProcessWorldItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> getProcessWorldItems()
  + ### getProcessIsoObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getProcessIsoObjects()
  + ### getProcessItemsRemove

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> getProcessItemsRemove()

    Returns:
    :   the ProcessItemsRemove
  + ### getVehicles

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles")> getVehicles()
  + ### getHeight

    public int getHeight()

    Returns:
    :   the height
  + ### setHeight

    public void setHeight(int height)

    Parameters:
    :   `height` - the height to set
  + ### getWidth

    public int getWidth()

    Returns:
    :   the width
  + ### setWidth

    public void setWidth(int width)

    Parameters:
    :   `width` - the width to set
  + ### getWorldX

    public int getWorldX()

    Returns:
    :   the worldX
  + ### setWorldX

    public void setWorldX(int worldX)

    Parameters:
    :   `worldX` - the worldX to set
  + ### getWorldY

    public int getWorldY()

    Returns:
    :   the worldY
  + ### setWorldY

    public void setWorldY(int worldY)

    Parameters:
    :   `worldY` - the worldY to set
  + ### isSafeToAdd

    public boolean isSafeToAdd()

    Returns:
    :   the safeToAdd
  + ### setSafeToAdd

    public void setSafeToAdd(boolean safeToAdd)

    Parameters:
    :   `safeToAdd` - the safeToAdd to set
  + ### getLamppostPositions

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoLightSource](IsoLightSource.html "class in zombie.iso")> getLamppostPositions()

    Returns:
    :   the LamppostPositions
  + ### getLightSourceAt

    public [IsoLightSource](IsoLightSource.html "class in zombie.iso") getLightSourceAt(int x,
    int y,
    int z)
  + ### addLamppost

    public void addLamppost([IsoLightSource](IsoLightSource.html "class in zombie.iso") light)
  + ### addLamppost

    public [IsoLightSource](IsoLightSource.html "class in zombie.iso") addLamppost(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    int rad)
  + ### removeLamppost

    public void removeLamppost(int x,
    int y,
    int z)
  + ### removeLamppost

    public void removeLamppost([IsoLightSource](IsoLightSource.html "class in zombie.iso") light)
  + ### getCurrentLightX

    public int getCurrentLightX()

    Returns:
    :   the currentLX
  + ### setCurrentLightX

    public void setCurrentLightX(int currentLX)

    Parameters:
    :   `currentLX` - the currentLX to set
  + ### getCurrentLightY

    public int getCurrentLightY()

    Returns:
    :   the currentLY
  + ### setCurrentLightY

    public void setCurrentLightY(int currentLY)

    Parameters:
    :   `currentLY` - the currentLY to set
  + ### getCurrentLightZ

    public int getCurrentLightZ()

    Returns:
    :   the currentLZ
  + ### setCurrentLightZ

    public void setCurrentLightZ(int currentLZ)

    Parameters:
    :   `currentLZ` - the currentLZ to set
  + ### getMinX

    public int getMinX()

    Returns:
    :   the minX
  + ### setMinX

    public void setMinX(int minX)

    Parameters:
    :   `minX` - the minX to set
  + ### getMaxX

    public int getMaxX()

    Returns:
    :   the maxX
  + ### setMaxX

    public void setMaxX(int maxX)

    Parameters:
    :   `maxX` - the maxX to set
  + ### getMinY

    public int getMinY()

    Returns:
    :   the minY
  + ### setMinY

    public void setMinY(int minY)

    Parameters:
    :   `minY` - the minY to set
  + ### getMaxY

    public int getMaxY()

    Returns:
    :   the maxY
  + ### setMaxY

    public void setMaxY(int maxY)

    Parameters:
    :   `maxY` - the maxY to set
  + ### getMinZ

    public int getMinZ()

    Returns:
    :   the minZ
  + ### setMinZ

    public void setMinZ(int minZ)

    Parameters:
    :   `minZ` - the minZ to set
  + ### getMaxZ

    public int getMaxZ()

    Returns:
    :   the maxZ
  + ### setMaxZ

    public void setMaxZ(int maxZ)

    Parameters:
    :   `maxZ` - the maxZ to set
  + ### getDangerUpdate

    public zombie.core.utils.OnceEvery getDangerUpdate()

    Returns:
    :   the dangerUpdate
  + ### setDangerUpdate

    public void setDangerUpdate(zombie.core.utils.OnceEvery dangerUpdate)

    Parameters:
    :   `dangerUpdate` - the dangerUpdate to set
  + ### getLightInfoUpdate

    public [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") getLightInfoUpdate()

    Returns:
    :   the LightInfoUpdate
  + ### setLightInfoUpdate

    public void setLightInfoUpdate([Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") lightInfoUpdate)

    Parameters:
    :   `lightInfoUpdate` - the LightInfoUpdate to set
  + ### getSurvivorList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSurvivor](../characters/IsoSurvivor.html "class in zombie.characters")> getSurvivorList()
  + ### getRComponent

    public static int getRComponent(int col)
  + ### getGComponent

    public static int getGComponent(int col)
  + ### getBComponent

    public static int getBComponent(int col)
  + ### toIntColor

    public static int toIntColor(float r,
    float g,
    float b,
    float a)
  + ### getRandomOutdoorTile

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomOutdoorTile()
  + ### InsertAt

    private static void InsertAt(int a,
    zombie.iso.areas.BuildingScore score,
    zombie.iso.areas.BuildingScore[] array)
  + ### Place

    static void Place(zombie.iso.areas.BuildingScore score,
    zombie.iso.areas.BuildingScore[] array,
    [IsoCell.BuildingSearchCriteria](IsoCell.BuildingSearchCriteria.html "enum class in zombie.iso") criteria)
  + ### getBestBuildings

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.areas.BuildingScore> getBestBuildings([IsoCell.BuildingSearchCriteria](IsoCell.BuildingSearchCriteria.html "enum class in zombie.iso") criteria,
    int count)
  + ### blocked

    public boolean blocked(zombie.ai.astar.Mover mover,
    int x,
    int y,
    int z,
    int lx,
    int ly,
    int lz)
  + ### Dispose

    public void Dispose()
  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare(double x,
    double y,
    double z)
  + ### getOrCreateGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getOrCreateGridSquare(double x,
    double y,
    double z)
  + ### setCacheGridSquare

    public void setCacheGridSquare(int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getOrCreateGridSquares

    private [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] getOrCreateGridSquares(int playerIndex)
  + ### setCacheChunk

    public void setCacheChunk([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### setCacheChunk

    public void setCacheChunk([IsoChunk](IsoChunk.html "class in zombie.iso") chunk,
    int playerIndex)
  + ### clearCacheGridSquare

    public void clearCacheGridSquare(int playerIndex)
  + ### setCacheGridSquareLocal

    public void setCacheGridSquareLocal(int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int playerIndex)
  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") x,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") y,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") z)
  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare(int x,
    int y,
    int z)
  + ### EnsureSurroundNotNull

    public void EnsureSurroundNotNull(int xx,
    int yy,
    int zz)
  + ### DeleteAllMovingObjects

    public void DeleteAllMovingObjects()
  + ### getMaxFloors

    public int getMaxFloors()
  + ### getLuaObjectList

    public se.krka.kahlua.vm.KahluaTable getLuaObjectList()
  + ### getHeightInTiles

    public int getHeightInTiles()
  + ### getWidthInTiles

    public int getWidthInTiles()
  + ### isNull

    public boolean isNull(int x,
    int y,
    int z)
  + ### Remove

    public void Remove([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") obj)
  + ### isBlocked

    boolean isBlocked([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") to)
  + ### CalculateColor

    private int CalculateColor([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqUL,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqU,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqL,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sqThis,
    int col,
    int playerIndex)
  + ### getInstance

    public static [IsoCell](IsoCell.html "class in zombie.iso") getInstance()
  + ### render

    public void render()
  + ### renderInternal

    private void renderInternal()
  + ### renderLast

    private void renderLast()
  + ### updateZombiesForRender

    private void updateZombiesForRender([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    int playerIndex)
  + ### invalidatePeekedRoom

    public void invalidatePeekedRoom(int playerIndex)
  + ### initWeatherFx

    protected boolean initWeatherFx()
  + ### updateWeatherFx

    private void updateWeatherFx()
  + ### renderWeatherFx

    private void renderWeatherFx()
  + ### getWeatherFX

    public [IsoWeatherFX](weather/fx/IsoWeatherFX.html "class in zombie.iso.weather.fx") getWeatherFX()
  + ### renderRain

    public void renderRain()
  + ### setRainAlpha

    public void setRainAlpha(int alpha)
  + ### setRainIntensity

    public void setRainIntensity(int intensity)
  + ### getRainIntensity

    public int getRainIntensity()
  + ### setRainSpeed

    public void setRainSpeed(int speed)
  + ### reloadRainTextures

    public void reloadRainTextures()
  + ### GetBuildingsInFrontOfCharacter

    public void GetBuildingsInFrontOfCharacter([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> buildings,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    boolean bRightOfSquare)
  + ### GetBuildingsInFrontOfCharacterSquare

    private void GetBuildingsInFrontOfCharacterSquare(int inX,
    int inY,
    int inZ,
    boolean bRightOfSquare,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> outBuildings)
  + ### GetBuildingsInFrontOfMustSeeSquare

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> GetBuildingsInFrontOfMustSeeSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    zombie.iso.IsoGridOcclusionData.OcclusionFilter filter)
  + ### GetPeekedInBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") GetPeekedInBuilding([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") lookDir)
  + ### GetSquaresAroundPlayerSquare

    public void GetSquaresAroundPlayerSquare([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> outGridSquaresToLeft,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> outGridSquaresToRight)
  + ### IsBehindStuff

    public boolean IsBehindStuff([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### FromMouseTile

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") FromMouseTile()
  + ### update

    public void update()
  + ### updateInternal

    private void updateInternal()
  + ### getRandomFreeTile

    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomFreeTile()
  + ### getRandomOutdoorFreeTile

    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomOutdoorFreeTile()
  + ### getRandomFreeTileInRoom

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomFreeTileInRoom()
  + ### roomSpotted

    public void roomSpotted([IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") room)
  + ### ProcessSpottedRooms

    public void ProcessSpottedRooms()
  + ### addTileObject

    public [IsoObject](IsoObject.html "class in zombie.iso") addTileObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output,
    boolean bDoChars)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### LoadPlayer

    public boolean LoadPlayer(int worldVersion)
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
  + ### getRelativeGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRelativeGridSquare(int x,
    int y,
    int z)
  + ### createNewGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") createNewGridSquare(int x,
    int y,
    int z,
    boolean recalcAll)
  + ### getGridSquareDirect

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquareDirect(int x,
    int y,
    int z,
    int playerIndex)
  + ### isInChunkMap

    public boolean isInChunkMap(int x,
    int y)
  + ### getProcessIsoObjectRemove

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getProcessIsoObjectRemove()
  + ### checkHaveRoof

    public void checkHaveRoof(int x,
    int y)
  + ### getFakeZombieForHit

    public [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") getFakeZombieForHit()
  + ### addHeatSource

    public void addHeatSource([IsoHeatSource](IsoHeatSource.html "class in zombie.iso") heatSource)
  + ### removeHeatSource

    public void removeHeatSource([IsoHeatSource](IsoHeatSource.html "class in zombie.iso") heatSource)
  + ### updateHeatSources

    public void updateHeatSources()
  + ### getHeatSourceTemperature

    public int getHeatSourceTemperature(int x,
    int y,
    int z)
  + ### getHeatSourceHighestTemperature

    public float getHeatSourceHighestTemperature(float surroundingAirTemperature,
    int x,
    int y,
    int z)
  + ### putInVehicle

    public void putInVehicle([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### resumeVehicleSounds

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void resumeVehicleSounds([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Deprecated.
  + ### AddUniqueToBuildingList

    public void AddUniqueToBuildingList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> buildings,
    [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") inBuilding)
  + ### getSpriteManager

    public [IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") getSpriteManager()
  + ### getAnimals

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimals()
  + ### isBasementWallAdjacentToTheVoid\_North

    public static boolean isBasementWallAdjacentToTheVoid\_North([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### isBasementWallAdjacentToTheVoid\_West

    public static boolean isBasementWallAdjacentToTheVoid\_West([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### isBasementWallAdjacentToTheVoid

    private static boolean isBasementWallAdjacentToTheVoid([IsoObject](IsoObject.html "class in zombie.iso") object,
    [IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") wallType,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") adjacentDir)