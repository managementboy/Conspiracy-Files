[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoChunk](IsoChunk.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DIRECTIONS](#DIRECTIONS)
   2. [delayedPhysicsShapeSet](#delayedPhysicsShapeSet)
   3. [doServerRequests](#doServerRequests)
   4. [wx](#wx)
   5. [wy](#wy)
   6. [squares](#squares)
   7. [corpseCount](#corpseCount)
   8. [corpseData](#corpseData)
   9. [renderLevels](#renderLevels)
   10. [generatorsTouchingThisChunk](#generatorsTouchingThisChunk)
   11. [levels](#levels)
   12. [maxLevel](#maxLevel)
   13. [minLevel](#minLevel)
   14. [soundList](#soundList)
   15. [treeCount](#treeCount)
   16. [numberOfWaterTiles](#numberOfWaterTiles)
   17. [lightingUpdateCounter](#lightingUpdateCounter)
   18. [scavengeZone](#scavengeZone)
   19. [spawnedRooms](#spawnedRooms)
   20. [next](#next)
   21. [collision](#collision)
   22. [adjacentChunkLoadedCounter](#adjacentChunkLoadedCounter)
   23. [vehicleStorySpawnData](#vehicleStorySpawnData)
   24. [loadVehiclesObject](#loadVehiclesObject)
   25. [objectEmitterData](#objectEmitterData)
   26. [cutawayData](#cutawayData)
   27. [vispolyData](#vispolyData)
   28. [blendingDoneFull](#blendingDoneFull)
   29. [blendingDonePartial](#blendingDonePartial)
   30. [blendingModified](#blendingModified)
   31. [blendingDepth](#blendingDepth)
   32. [attachmentsDoneFull](#attachmentsDoneFull)
   33. [attachmentsState](#attachmentsState)
   34. [attachmentsPartial](#attachmentsPartial)
   35. [comparatorBool4](#comparatorBool4)
   36. [comparatorBool5](#comparatorBool5)
   37. [chunkGenerationStatus](#chunkGenerationStatus)
   38. [doWorldgen](#doWorldgen)
   39. [doForaging](#doForaging)
   40. [doAttachments](#doAttachments)
   41. [loadedFrame](#loadedFrame)
   42. [renderFrame](#renderFrame)
   43. [frameDelay](#frameDelay)
   44. [maxFrameDelay](#maxFrameDelay)
   45. [requiresHotSave](#requiresHotSave)
   46. [preventHotSave](#preventHotSave)
   47. [ignorePathfind](#ignorePathfind)
   48. [jobType](#jobType)
   49. [lotheader](#lotheader)
   50. [floorBloodSplats](#floorBloodSplats)
   51. [floorBloodSplatsFade](#floorBloodSplatsFade)
   52. [MAX\_BLOOD\_SPLATS](#MAX_BLOOD_SPLATS)
   53. [nextSplatIndex](#nextSplatIndex)
   54. [renderByIndex](#renderByIndex)
   55. [refs](#refs)
   56. [loaded](#loaded)
   57. [blam](#blam)
   58. [addZombies](#addZombies)
   59. [proceduralZombieSquares](#proceduralZombieSquares)
   60. [fixed2x](#fixed2x)
   61. [lightCheck](#lightCheck)
   62. [lightingNeverDone](#lightingNeverDone)
   63. [roomLights](#roomLights)
   64. [vehicles](#vehicles)
   65. [lootRespawnHour](#lootRespawnHour)
   66. [LB\_PATHFIND](#LB_PATHFIND)
   67. [loadedBits](#loadedBits)
   68. [INVALID\_LOAD\_ID](#INVALID_LOAD_ID)
   69. [nextLoadID](#nextLoadID)
   70. [loadId](#loadId)
   71. [objectsSyncCount](#objectsSyncCount)
   72. [addVehiclesForTestVtype](#addVehiclesForTestVtype)
   73. [addVehiclesForTestVskin](#addVehiclesForTestVskin)
   74. [addVehiclesForTestVrot](#addVehiclesForTestVrot)
   75. [BaseVehicleCheckedVehicles](#BaseVehicleCheckedVehicles)
   76. [minLevelPhysics](#minLevelPhysics)
   77. [maxLevelPhysics](#maxLevelPhysics)
   78. [MAX\_SHAPES](#MAX_SHAPES)
   79. [shapes](#shapes)
   80. [bshapes](#bshapes)
   81. [chunkGetter](#chunkGetter)
   82. [newSquareList](#newSquareList)
   83. [loadedPhysics](#loadedPhysics)
   84. [ragdollControllersForAddToWorld](#ragdollControllersForAddToWorld)
   85. [loadGridSquare](#loadGridSquare)
   86. [BLOCK\_SIZE](#BLOCK_SIZE)
   87. [sliceBuffer](#sliceBuffer)
   88. [sliceBufferLoad](#sliceBufferLoad)
   89. [WriteLock](#WriteLock)
   90. [tempRoomDefs](#tempRoomDefs)
   91. [tempBuildingDefs](#tempBuildingDefs)
   92. [tempBuildings](#tempBuildings)
   93. [Locks](#Locks)
   94. [FreeLocks](#FreeLocks)
   95. [sanityCheck](#sanityCheck)
   96. [crcLoad](#crcLoad)
   97. [crcSave](#crcSave)
   98. [erosion](#erosion)
   99. [Fix2xMap](#Fix2xMap)
   100. [randomId](#randomId)
   101. [revision](#revision)
7. [Constructor Details](#constructor-detail)
   1. [IsoChunk(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoChunk(WorldReuserThread)](#%3Cinit%3E(zombie.iso.WorldReuserThread))
8. [Method Details](#method-detail)
   1. [flagForHotSave()](#flagForHotSave())
   2. [updateSounds()](#updateSounds())
   3. [IsOnScreen(boolean)](#IsOnScreen(boolean))
   4. [checkLightingLater\_AllPlayers\_AllLevels()](#checkLightingLater_AllPlayers_AllLevels())
   5. [checkLightingLater\_AllPlayers\_OneLevel(int)](#checkLightingLater_AllPlayers_OneLevel(int))
   6. [checkLightingLater\_OnePlayer\_AllLevels(int)](#checkLightingLater_OnePlayer_AllLevels(int))
   7. [checkLightingLater\_OnePlayer\_OneLevel(int, int)](#checkLightingLater_OnePlayer_OneLevel(int,int))
   8. [addBloodSplat(float, float, float, int)](#addBloodSplat(float,float,float,int))
   9. [AddCorpses(int, int)](#AddCorpses(int,int))
   10. [AddBlood(int, int)](#AddBlood(int,int))
   11. [checkVehiclePos(BaseVehicle, IsoChunk)](#checkVehiclePos(zombie.vehicles.BaseVehicle,zombie.iso.IsoChunk))
   12. [fixVehiclePos(BaseVehicle, IsoChunk)](#fixVehiclePos(zombie.vehicles.BaseVehicle,zombie.iso.IsoChunk))
   13. [isGoodVehiclePos(BaseVehicle, IsoChunk)](#isGoodVehiclePos(zombie.vehicles.BaseVehicle,zombie.iso.IsoChunk))
   14. [AddVehicles\_ForTest(Zone)](#AddVehicles_ForTest(zombie.iso.zones.Zone))
   15. [AddVehicles\_OnZone(VehicleZone, String)](#AddVehicles_OnZone(zombie.iso.zones.VehicleZone,java.lang.String))
   16. [AddVehicles\_OnZonePolyline(VehicleZone, String)](#AddVehicles_OnZonePolyline(zombie.iso.zones.VehicleZone,java.lang.String))
   17. [removeFromCheckedVehicles(BaseVehicle)](#removeFromCheckedVehicles(zombie.vehicles.BaseVehicle))
   18. [addFromCheckedVehicles(BaseVehicle)](#addFromCheckedVehicles(zombie.vehicles.BaseVehicle))
   19. [Reset()](#Reset())
   20. [doSpawnedVehiclesInInvalidPosition(BaseVehicle)](#doSpawnedVehiclesInInvalidPosition(zombie.vehicles.BaseVehicle))
   21. [spawnVehicleRandomAngle(IsoGridSquare, Zone, String)](#spawnVehicleRandomAngle(zombie.iso.IsoGridSquare,zombie.iso.zones.Zone,java.lang.String))
   22. [RandomizeModel(BaseVehicle, Zone, String, VehicleType)](#RandomizeModel(zombie.vehicles.BaseVehicle,zombie.iso.zones.Zone,java.lang.String,zombie.vehicles.VehicleType))
   23. [AddVehicles\_TrafficJam\_W(Zone, String)](#AddVehicles_TrafficJam_W(zombie.iso.zones.Zone,java.lang.String))
   24. [AddVehicles\_TrafficJam\_E(Zone, String)](#AddVehicles_TrafficJam_E(zombie.iso.zones.Zone,java.lang.String))
   25. [AddVehicles\_TrafficJam\_S(Zone, String)](#AddVehicles_TrafficJam_S(zombie.iso.zones.Zone,java.lang.String))
   26. [AddVehicles\_TrafficJam\_N(Zone, String)](#AddVehicles_TrafficJam_N(zombie.iso.zones.Zone,java.lang.String))
   27. [AddVehicles\_TrafficJam\_Polyline(Zone, String)](#AddVehicles_TrafficJam_Polyline(zombie.iso.zones.Zone,java.lang.String))
   28. [TryAddVehicle\_TrafficJam(Zone, String, float, float, Vector2, float, float)](#TryAddVehicle_TrafficJam(zombie.iso.zones.Zone,java.lang.String,float,float,zombie.iso.Vector2,float,float))
   29. [AddVehicles()](#AddVehicles())
   30. [addSurvivorInHorde(boolean)](#addSurvivorInHorde(boolean))
   31. [canAddSurvivorInHorde(Zone, boolean)](#canAddSurvivorInHorde(zombie.iso.zones.Zone,boolean))
   32. [addSurvivorInHorde(Zone)](#addSurvivorInHorde(zombie.iso.zones.Zone))
   33. [canAddRandomCarCrash(Zone, boolean)](#canAddRandomCarCrash(zombie.iso.zones.Zone,boolean))
   34. [addRandomCarCrash(Zone, boolean)](#addRandomCarCrash(zombie.iso.zones.Zone,boolean))
   35. [FileExists(int, int)](#FileExists(int,int))
   36. [checkPhysicsLater(int)](#checkPhysicsLater(int))
   37. [updatePhysicsForLevel(int)](#updatePhysicsForLevel(int))
   38. [addPhysicsShape(IsoGridSquare, int[], int, int)](#addPhysicsShape(zombie.iso.IsoGridSquare,int%5B%5D,int,int))
   39. [addPhysicsShape(IsoGridSquare, int[], int, IsoChunk.PhysicsShapes)](#addPhysicsShape(zombie.iso.IsoGridSquare,int%5B%5D,int,zombie.iso.IsoChunk.PhysicsShapes))
   40. [calcPhysics(int, int, int, int[])](#calcPhysics(int,int,int,int%5B%5D))
   41. [setBlendingDoneFull(boolean)](#setBlendingDoneFull(boolean))
   42. [isBlendingDoneFull()](#isBlendingDoneFull())
   43. [setBlendingDonePartial(boolean)](#setBlendingDonePartial(boolean))
   44. [isBlendingDonePartial()](#isBlendingDonePartial())
   45. [setBlendingModified(int)](#setBlendingModified(int))
   46. [isBlendingDone(int)](#isBlendingDone(int))
   47. [setModifDepth(BlendDirection, byte)](#setModifDepth(zombie.iso.worldgen.blending.BlendDirection,byte))
   48. [setModifDepth(BlendDirection, int)](#setModifDepth(zombie.iso.worldgen.blending.BlendDirection,int))
   49. [getModifDepth(BlendDirection)](#getModifDepth(zombie.iso.worldgen.blending.BlendDirection))
   50. [setAttachmentsDoneFull(boolean)](#setAttachmentsDoneFull(boolean))
   51. [isAttachmentsDoneFull()](#isAttachmentsDoneFull())
   52. [setAttachmentsState(int, boolean)](#setAttachmentsState(int,boolean))
   53. [isAttachmentsDone(int)](#isAttachmentsDone(int))
   54. [getAttachmentsState()](#getAttachmentsState())
   55. [setAttachmentsPartial(SquareCoord)](#setAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord))
   56. [getAttachmentsPartial(int)](#getAttachmentsPartial(int))
   57. [hasAttachmentsPartial(SquareCoord)](#hasAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord))
   58. [attachmentsPartialSize()](#attachmentsPartialSize())
   59. [isModded()](#isModded())
   60. [isModded(EnumSet)](#isModded(java.util.EnumSet))
   61. [isModded(ChunkGenerationStatus)](#isModded(zombie.iso.enums.ChunkGenerationStatus))
   62. [addModded(ChunkGenerationStatus)](#addModded(zombie.iso.enums.ChunkGenerationStatus))
   63. [rmModded(ChunkGenerationStatus)](#rmModded(zombie.iso.enums.ChunkGenerationStatus))
   64. [getFromPool()](#getFromPool())
   65. [LoadBrandNew(int, int)](#LoadBrandNew(int,int))
   66. [hasEmptySquaresOnLevelZero()](#hasEmptySquaresOnLevelZero())
   67. [hasNonEmptySquareBelow(int, int, int)](#hasNonEmptySquareBelow(int,int,int))
   68. [LoadChunk(int, int, ByteBuffer)](#LoadChunk(int,int,java.nio.ByteBuffer))
   69. [LoadOrCreate(int, int, ByteBuffer)](#LoadOrCreate(int,int,java.nio.ByteBuffer))
   70. [LoadFromBuffer(int, int, ByteBuffer)](#LoadFromBuffer(int,int,java.nio.ByteBuffer))
   71. [assignRoom(IsoGridSquare)](#assignRoom(zombie.iso.IsoGridSquare))
   72. [ensureNotNull3x3(int, int, int)](#ensureNotNull3x3(int,int,int))
   73. [ensureNotNull(int, int, int, int, int)](#ensureNotNull(int,int,int,int,int))
   74. [loadInWorldStreamerThread()](#loadInWorldStreamerThread())
   75. [RecalcAllWithNeighbour(IsoGridSquare, IsoDirections, int)](#RecalcAllWithNeighbour(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,int))
   76. [EnsureSurroundNotNullX(int, int, int)](#EnsureSurroundNotNullX(int,int,int))
   77. [EnsureSurroundNotNullY(int, int, int)](#EnsureSurroundNotNullY(int,int,int))
   78. [EnsureSurroundNotNull(int, int, int)](#EnsureSurroundNotNull(int,int,int))
   79. [getMinLevelOf(int, IsoChunk)](#getMinLevelOf(int,zombie.iso.IsoChunk))
   80. [getMaxLevelOf(int, IsoChunk)](#getMaxLevelOf(int,zombie.iso.IsoChunk))
   81. [loadInMainThread()](#loadInMainThread())
   82. [fixObjectAmbientEmittersOnAdjacentChunks(IsoChunk, IsoChunk)](#fixObjectAmbientEmittersOnAdjacentChunks(zombie.iso.IsoChunk,zombie.iso.IsoChunk))
   83. [fixObjectAmbientEmittersOnSquare(IsoGridSquare, boolean)](#fixObjectAmbientEmittersOnSquare(zombie.iso.IsoGridSquare,boolean))
   84. [recalcNeighboursNow()](#recalcNeighboursNow())
   85. [updateBuildings()](#updateBuildings())
   86. [updatePlayerInBullet()](#updatePlayerInBullet())
   87. [update()](#update())
   88. [updateVehicleStory()](#updateVehicleStory())
   89. [squaresIndexOfLevel(int)](#squaresIndexOfLevel(int))
   90. [getSquaresForLevel(int)](#getSquaresForLevel(int))
   91. [doPathfind()](#doPathfind())
   92. [ignorePathfind()](#ignorePathfind())
   93. [setSquare(int, int, int, IsoGridSquare)](#setSquare(int,int,int,zombie.iso.IsoGridSquare))
   94. [getMinLevel()](#getMinLevel())
   95. [getMaxLevel()](#getMaxLevel())
   96. [isValidLevel(int)](#isValidLevel(int))
   97. [setMinMaxLevel(int, int)](#setMinMaxLevel(int,int))
   98. [getLevelData(int)](#getLevelData(int))
   99. [getGridSquare(int, int, int)](#getGridSquare(int,int,int))
   100. [getRoom(long)](#getRoom(long))
   101. [removeFromWorld()](#removeFromWorld())
   102. [disconnectFromAdjacentChunks(IsoGridSquare)](#disconnectFromAdjacentChunks(zombie.iso.IsoGridSquare))
   103. [doReuseGridsquares()](#doReuseGridsquares())
   104. [bufferSize(int)](#bufferSize(int))
   105. [ensureCapacity(ByteBuffer, int)](#ensureCapacity(java.nio.ByteBuffer,int))
   106. [ensureCapacity(ByteBuffer)](#ensureCapacity(java.nio.ByteBuffer))
   107. [readFlags(ByteBuffer, int)](#readFlags(java.nio.ByteBuffer,int))
   108. [writeFlags(ByteBuffer, boolean[])](#writeFlags(java.nio.ByteBuffer,boolean%5B%5D))
   109. [LoadFromDisk()](#LoadFromDisk())
   110. [LoadFromDiskOrBuffer(ByteBuffer)](#LoadFromDiskOrBuffer(java.nio.ByteBuffer))
   111. [LoadFromDiskOrBufferInternal(ByteBuffer)](#LoadFromDiskOrBufferInternal(java.nio.ByteBuffer))
   112. [doLoadGridsquare()](#doLoadGridsquare())
   113. [loadGridSquareIfNeeded(IsoGridSquare)](#loadGridSquareIfNeeded(zombie.iso.IsoGridSquare))
   114. [addRatsAfterLoading(IsoGridSquare)](#addRatsAfterLoading(zombie.iso.IsoGridSquare))
   115. [CheckGrassRegrowth()](#CheckGrassRegrowth())
   116. [randomizeBuildingsEtc(ArrayList)](#randomizeBuildingsEtc(java.util.ArrayList))
   117. [checkAdjacentChunks()](#checkAdjacentChunks())
   118. [AddZombieZoneStory()](#AddZombieZoneStory())
   119. [AddRanchAnimals()](#AddRanchAnimals())
   120. [setCache()](#setCache())
   121. [acquireLock(int, int)](#acquireLock(int,int))
   122. [releaseLock(IsoChunk.ChunkLock)](#releaseLock(zombie.iso.IsoChunk.ChunkLock))
   123. [setCacheIncludingNull()](#setCacheIncludingNull())
   124. [Save(boolean)](#Save(boolean))
   125. [SafeWrite(int, int, ByteBuffer)](#SafeWrite(int,int,java.nio.ByteBuffer))
   126. [SafeRead(int, int, ByteBuffer)](#SafeRead(int,int,java.nio.ByteBuffer))
   127. [SaveLoadedChunk(ClientChunkRequest.Chunk, CRC32)](#SaveLoadedChunk(zombie.network.ClientChunkRequest.Chunk,java.util.zip.CRC32))
   128. [IsDebugSave()](#IsDebugSave())
   129. [Save(ByteBuffer, CRC32, boolean)](#Save(java.nio.ByteBuffer,java.util.zip.CRC32,boolean))
   130. [saveObjectState(ByteBuffer)](#saveObjectState(java.nio.ByteBuffer))
   131. [loadObjectState(ByteBuffer)](#loadObjectState(java.nio.ByteBuffer))
   132. [Blam(int, int)](#Blam(int,int))
   133. [BackupBlam(int, int, Exception)](#BackupBlam(int,int,java.lang.Exception))
   134. [copyFile(File, File)](#copyFile(java.io.File,java.io.File))
   135. [getErosionData()](#getErosionData())
   136. [newtiledefinitions(int, int)](#newtiledefinitions(int,int))
   137. [Fix2x(IsoGridSquare, int)](#Fix2x(zombie.iso.IsoGridSquare,int))
   138. [Fix2x(String)](#Fix2x(java.lang.String))
   139. [addGeneratorPos(int, int, int)](#addGeneratorPos(int,int,int))
   140. [removeGeneratorPos(int, int, int)](#removeGeneratorPos(int,int,int))
   141. [isGeneratorPoweringSquare(int, int, int)](#isGeneratorPoweringSquare(int,int,int))
   142. [checkForMissingGenerators()](#checkForMissingGenerators())
   143. [addObjectPoweredByGenerator(IsoObject)](#addObjectPoweredByGenerator(zombie.iso.IsoObject))
   144. [removeObjectPoweredByGenerator(IsoObject)](#removeObjectPoweredByGenerator(zombie.iso.IsoObject))
   145. [isNewChunk()](#isNewChunk())
   146. [addSpawnedRoom(long)](#addSpawnedRoom(long))
   147. [isSpawnedRoom(long)](#isSpawnedRoom(long))
   148. [getScavengeZone()](#getScavengeZone())
   149. [unlinkSquares(IsoChunkLevel)](#unlinkSquares(zombie.iso.IsoChunkLevel))
   150. [resetForStore()](#resetForStore())
   151. [getNumberOfWaterTiles()](#getNumberOfWaterTiles())
   152. [setRandomVehicleStoryToSpawnLater(VehicleStorySpawnData)](#setRandomVehicleStoryToSpawnLater(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData))
   153. [hasObjectAmbientEmitter(IsoObject)](#hasObjectAmbientEmitter(zombie.iso.IsoObject))
   154. [addObjectAmbientEmitter(IsoObject, ObjectAmbientEmitters.PerObjectLogic)](#addObjectAmbientEmitter(zombie.iso.IsoObject,zombie.audio.ObjectAmbientEmitters.PerObjectLogic))
   155. [removeObjectAmbientEmitter(IsoObject)](#removeObjectAmbientEmitter(zombie.iso.IsoObject))
   156. [addItemOnGround(IsoGridSquare, String)](#addItemOnGround(zombie.iso.IsoGridSquare,java.lang.String))
   157. [assignLoadID()](#assignLoadID())
   158. [getLoadID()](#getLoadID())
   159. [containsPoint(float, float)](#containsPoint(float,float))
   160. [getRenderLevels(int)](#getRenderLevels(int))
   161. [invalidateRenderChunkLevel(int, long)](#invalidateRenderChunkLevel(int,long))
   162. [invalidateRenderChunkLevels(long)](#invalidateRenderChunkLevels(long))
   163. [getCutawayData()](#getCutawayData())
   164. [getCutawayDataForLevel(int)](#getCutawayDataForLevel(int))
   165. [invalidateVispolyChunkLevel(int)](#invalidateVispolyChunkLevel(int))
   166. [getVispolyData()](#getVispolyData())
   167. [getVispolyDataForLevel(int)](#getVispolyDataForLevel(int))
   168. [hasWaterSquare()](#hasWaterSquare())
   169. [addRagdollControllers()](#addRagdollControllers())
   170. [checkForActiveRagdoll(IsoGridSquare)](#checkForActiveRagdoll(zombie.iso.IsoGridSquare))
   171. [checkPhysicsLaterForActiveRagdoll(IsoChunkLevel)](#checkPhysicsLaterForActiveRagdoll(zombie.iso.IsoChunkLevel))
   172. [hasFence()](#hasFence())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoChunk
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoChunk

---

public final class IsoChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `IsoChunk.ChunkGetter`

  `private static class`

  `IsoChunk.ChunkLock`

  `static enum`

  `IsoChunk.JobType`

  `private static enum`

  `IsoChunk.PhysicsShapes`

  `private static class`

  `IsoChunk.SanityCheck`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static int`

  `addVehiclesForTestVrot`

  `private static int`

  `addVehiclesForTestVskin`

  `private static int`

  `addVehiclesForTestVtype`

  `private boolean`

  `addZombies`

  `int`

  `adjacentChunkLoadedCounter`

  `private boolean`

  `attachmentsDoneFull`

  `private List<zombie.iso.worldgen.utils.SquareCoord>`

  `attachmentsPartial`

  `private boolean[]`

  `attachmentsState`

  `private static final ArrayList<BaseVehicle>`

  `BaseVehicleCheckedVehicles`

  `private boolean`

  `blam`

  `private final byte[]`

  `blendingDepth`

  `private boolean`

  `blendingDoneFull`

  `private boolean`

  `blendingDonePartial`

  `private boolean[]`

  `blendingModified`

  `static final int`

  `BLOCK_SIZE`

  `private static final byte[]`

  `bshapes`

  `private EnumSet<zombie.iso.enums.ChunkGenerationStatus>`

  `chunkGenerationStatus`

  `private static final IsoChunk.ChunkGetter`

  `chunkGetter`

  `final zombie.pathfind.CollideWithObstaclesPoly.ChunkData`

  `collision`

  `private static final boolean[]`

  `comparatorBool4`

  `private static final boolean[]`

  `comparatorBool5`

  `zombie.iso.CorpseCount.ChunkData`

  `corpseCount`

  `zombie.FliesSound.ChunkData`

  `corpseData`

  `private static final CRC32`

  `crcLoad`

  `private static final CRC32`

  `crcSave`

  `final zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelsData`

  `cutawayData`

  `private final Set<IsoGridSquare>`

  `delayedPhysicsShapeSet`

  `private static final IsoDirections[]`

  `DIRECTIONS`

  `static boolean`

  `doAttachments`

  `static boolean`

  `doForaging`

  `static boolean`

  `doServerRequests`

  `static boolean`

  `doWorldgen`

  `private zombie.erosion.ErosionData.Chunk`

  `erosion`

  `private static final HashMap<String,String>`

  `Fix2xMap`

  `private boolean`

  `fixed2x`

  `final zombie.core.utils.BoundedQueue<zombie.iso.IsoFloorBloodSplat>`

  `floorBloodSplats`

  `final ArrayList<zombie.iso.IsoFloorBloodSplat>`

  `floorBloodSplatsFade`

  `private static int`

  `frameDelay`

  `private static final Stack<IsoChunk.ChunkLock>`

  `FreeLocks`

  `private ArrayList<IsoGameCharacter.Location>`

  `generatorsTouchingThisChunk`

  `private boolean`

  `ignorePathfind`

  `private static final short`

  `INVALID_LOAD_ID`

  `IsoChunk.JobType`

  `jobType`

  `static final short`

  `LB_PATHFIND`

  `private zombie.iso.IsoChunkLevel[]`

  `levels`

  `final boolean[]`

  `lightCheck`

  `final boolean[]`

  `lightingNeverDone`

  `int`

  `lightingUpdateCounter`

  `boolean`

  `loaded`

  `short`

  `loadedBits`

  `long`

  `loadedFrame`

  `private boolean`

  `loadedPhysics`

  `static final zombie.util.CappedConcurrentQueue<IsoChunk>`

  `loadGridSquare`

  `private short`

  `loadId`

  `Object`

  `loadVehiclesObject`

  `private static final ArrayList<IsoChunk.ChunkLock>`

  `Locks`

  `int`

  `lootRespawnHour`

  `zombie.iso.LotHeader`

  `lotheader`

  `private static final int`

  `MAX_BLOOD_SPLATS`

  `private static final int`

  `MAX_SHAPES`

  `private static final int`

  `maxFrameDelay`

  `int`

  `maxLevel`

  `private int`

  `maxLevelPhysics`

  `int`

  `minLevel`

  `private int`

  `minLevelPhysics`

  `(package private) static final ArrayList<IsoGridSquare>`

  `newSquareList`

  `IsoChunk`

  `next`

  `private static short`

  `nextLoadID`

  `private int`

  `nextSplatIndex`

  `private int`

  `numberOfWaterTiles`

  `final zombie.audio.ObjectAmbientEmitters.ChunkData`

  `objectEmitterData`

  `int`

  `objectsSyncCount`

  `boolean`

  `preventHotSave`

  `ArrayList<IsoGridSquare>`

  `proceduralZombieSquares`

  `ArrayList<IsoGameCharacter>`

  `ragdollControllersForAddToWorld`

  `int`

  `randomId`

  `final ArrayList<IsoChunkMap>`

  `refs`

  `static final byte[][]`

  `renderByIndex`

  `long`

  `renderFrame`

  `private final zombie.iso.fboRenderChunk.FBORenderLevels[]`

  `renderLevels`

  `boolean`

  `requiresHotSave`

  `long`

  `revision`

  `final ArrayList<zombie.iso.IsoRoomLight>`

  `roomLights`

  `private static final IsoChunk.SanityCheck`

  `sanityCheck`

  `private Zone`

  `scavengeZone`

  `private final int[]`

  `shapes`

  `private static ByteBuffer`

  `sliceBuffer`

  `private static ByteBuffer`

  `sliceBufferLoad`

  `final ArrayList<WorldSoundManager.WorldSound>`

  `soundList`

  `private final gnu.trove.list.array.TLongArrayList`

  `spawnedRooms`

  `IsoGridSquare[][]`

  `squares`

  `private static final ArrayList<BuildingDef>`

  `tempBuildingDefs`

  `private static final ArrayList<IsoBuilding>`

  `tempBuildings`

  `private static final ArrayList<RoomDef>`

  `tempRoomDefs`

  `private int`

  `treeCount`

  `final ArrayList<BaseVehicle>`

  `vehicles`

  `zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData`

  `vehicleStorySpawnData`

  `final zombie.vispoly.VisibilityPolygon2.ChunkData`

  `vispolyData`

  `static final Object`

  `WriteLock`

  `int`

  `wx`

  `int`

  `wy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoChunk(IsoCell cell)`

  `IsoChunk(zombie.iso.WorldReuserThread dummy)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private static IsoChunk.ChunkLock`

  `acquireLock(int wx,
  int wy)`

  `void`

  `AddBlood(int wx,
  int wy)`

  `void`

  `addBloodSplat(float x,
  float y,
  float z,
  int type)`

  `void`

  `AddCorpses(int wx,
  int wy)`

  `static void`

  `addFromCheckedVehicles(BaseVehicle v)`

  `void`

  `addGeneratorPos(int x,
  int y,
  int z)`

  `private void`

  `addItemOnGround(IsoGridSquare square,
  String type)`

  `void`

  `addModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)`

  `void`

  `addObjectAmbientEmitter(IsoObject object,
  zombie.audio.ObjectAmbientEmitters.PerObjectLogic logic)`

  `void`

  `addObjectPoweredByGenerator(IsoObject object)`

  `private int`

  `addPhysicsShape(IsoGridSquare sq,
  int[] shapes,
  int count,
  int shape)`

  `private int`

  `addPhysicsShape(IsoGridSquare sq,
  int[] shapes,
  int count,
  IsoChunk.PhysicsShapes shape)`

  `private void`

  `addRagdollControllers()`

  `private void`

  `AddRanchAnimals()`

  `void`

  `addRandomCarCrash(Zone zone,
  boolean addToWorld)`

  `private void`

  `addRatsAfterLoading(IsoGridSquare square)`

  `void`

  `addSpawnedRoom(long roomID)`

  `void`

  `addSurvivorInHorde(boolean forced)`

  `private void`

  `addSurvivorInHorde(Zone zone)`

  `void`

  `AddVehicles()`

  `private void`

  `AddVehicles_ForTest(Zone zone)`

  `private void`

  `AddVehicles_OnZone(VehicleZone zone,
  String zoneName)`

  `private void`

  `AddVehicles_OnZonePolyline(VehicleZone zone,
  String zoneName)`

  `private void`

  `AddVehicles_TrafficJam_E(Zone zone,
  String zoneName)`

  `private void`

  `AddVehicles_TrafficJam_N(Zone zone,
  String zoneName)`

  `private void`

  `AddVehicles_TrafficJam_Polyline(Zone zone,
  String zoneName)`

  `private void`

  `AddVehicles_TrafficJam_S(Zone zone,
  String zoneName)`

  `private void`

  `AddVehicles_TrafficJam_W(Zone zone,
  String zoneName)`

  `private void`

  `AddZombieZoneStory()`

  `void`

  `assignLoadID()`

  `private void`

  `assignRoom(IsoGridSquare sq)`

  `Integer`

  `attachmentsPartialSize()`

  `private void`

  `BackupBlam(int wx,
  int wy,
  Exception ex)`

  `void`

  `Blam(int wx,
  int wy)`

  `private static int`

  `bufferSize(int size)`

  `private void`

  `calcPhysics(int x,
  int y,
  int z,
  int[] shapes)`

  `boolean`

  `canAddRandomCarCrash(Zone zone,
  boolean force)`

  `private boolean`

  `canAddSurvivorInHorde(Zone zone,
  boolean force)`

  `private void`

  `checkAdjacentChunks()`

  `private boolean`

  `checkForActiveRagdoll(IsoGridSquare isoGridSquare)`

  `void`

  `checkForMissingGenerators()`

  `private void`

  `CheckGrassRegrowth()`

  `void`

  `checkLightingLater_AllPlayers_AllLevels()`

  `void`

  `checkLightingLater_AllPlayers_OneLevel(int level)`

  `void`

  `checkLightingLater_OnePlayer_AllLevels(int playerIndex)`

  `void`

  `checkLightingLater_OnePlayer_OneLevel(int playerIndex,
  int level)`

  `void`

  `checkPhysicsLater(int level)`

  `void`

  `checkPhysicsLaterForActiveRagdoll(zombie.iso.IsoChunkLevel isoChunkLevel)`

  `private void`

  `checkVehiclePos(BaseVehicle vehicle,
  IsoChunk chunk)`

  `boolean`

  `containsPoint(float x,
  float y)`

  `private static void`

  `copyFile(File sourceFile,
  File destFile)`

  `private void`

  `disconnectFromAdjacentChunks(IsoGridSquare sq)`

  `void`

  `doLoadGridsquare()`

  `void`

  `doPathfind()`

  `void`

  `doReuseGridsquares()`

  `static boolean`

  `doSpawnedVehiclesInInvalidPosition(BaseVehicle v)`

  `private static ByteBuffer`

  `ensureCapacity(ByteBuffer bb)`

  `private static ByteBuffer`

  `ensureCapacity(ByteBuffer bb,
  int capacity)`

  `private void`

  `ensureNotNull(int lx,
  int ly,
  int z,
  int dx,
  int dy)`

  `private void`

  `ensureNotNull3x3(int lx,
  int ly,
  int z)`

  `private void`

  `EnsureSurroundNotNull(int x,
  int y,
  int z)`

  `private void`

  `EnsureSurroundNotNullX(int x,
  int y,
  int z)`

  `private void`

  `EnsureSurroundNotNullY(int x,
  int y,
  int z)`

  `static boolean`

  `FileExists(int wx,
  int wy)`

  `static String`

  `Fix2x(String tileName)`

  `static int`

  `Fix2x(IsoGridSquare square,
  int spriteID)`

  `private void`

  `fixObjectAmbientEmittersOnAdjacentChunks(IsoChunk chunkE,
  IsoChunk chunkS)`

  `private void`

  `fixObjectAmbientEmittersOnSquare(IsoGridSquare square,
  boolean north)`

  `private boolean`

  `fixVehiclePos(BaseVehicle vehicle,
  IsoChunk chunk)`

  `void`

  `flagForHotSave()`

  `zombie.iso.worldgen.utils.SquareCoord`

  `getAttachmentsPartial(int i)`

  `boolean[]`

  `getAttachmentsState()`

  `zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelsData`

  `getCutawayData()`

  `zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelData`

  `getCutawayDataForLevel(int z)`

  `zombie.erosion.ErosionData.Chunk`

  `getErosionData()`

  `private static IsoChunk`

  `getFromPool()`

  `IsoGridSquare`

  `getGridSquare(int chunkSquareX,
  int chunkSquareY,
  int worldSquareZ)`

  `zombie.iso.IsoChunkLevel`

  `getLevelData(int level)`

  `short`

  `getLoadID()`

  `int`

  `getMaxLevel()`

  `private static int`

  `getMaxLevelOf(int maxLevel,
  IsoChunk chunk)`

  `int`

  `getMinLevel()`

  `private static int`

  `getMinLevelOf(int minLevel,
  IsoChunk chunk)`

  `byte`

  `getModifDepth(zombie.iso.worldgen.blending.BlendDirection dir)`

  `int`

  `getNumberOfWaterTiles()`

  `zombie.iso.fboRenderChunk.FBORenderLevels`

  `getRenderLevels(int playerIndex)`

  `IsoRoom`

  `getRoom(long roomID)`

  `Zone`

  `getScavengeZone()`

  `IsoGridSquare[]`

  `getSquaresForLevel(int worldSquareZ)`

  `zombie.vispoly.VisibilityPolygon2.ChunkData`

  `getVispolyData()`

  `zombie.vispoly.VisibilityPolygon2.ChunkLevelData`

  `getVispolyDataForLevel(int z)`

  `boolean`

  `hasAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord coord)`

  `boolean`

  `hasEmptySquaresOnLevelZero()`

  `boolean`

  `hasFence()`

  `private boolean`

  `hasNonEmptySquareBelow(int x,
  int y,
  int z)`

  `boolean`

  `hasObjectAmbientEmitter(IsoObject object)`

  `boolean`

  `hasWaterSquare()`

  `void`

  `ignorePathfind()`

  `void`

  `invalidateRenderChunkLevel(int level,
  long dirtyFlags)`

  `void`

  `invalidateRenderChunkLevels(long dirtyFlags)`

  `void`

  `invalidateVispolyChunkLevel(int level)`

  `boolean`

  `isAttachmentsDone(int i)`

  `boolean`

  `isAttachmentsDoneFull()`

  `boolean`

  `isBlendingDone(int i)`

  `boolean`

  `isBlendingDoneFull()`

  `boolean`

  `isBlendingDonePartial()`

  `static boolean`

  `IsDebugSave()`

  `boolean`

  `isGeneratorPoweringSquare(int x,
  int y,
  int z)`

  `private boolean`

  `isGoodVehiclePos(BaseVehicle vehicle,
  IsoChunk chunk)`

  `EnumSet<zombie.iso.enums.ChunkGenerationStatus>`

  `isModded()`

  `void`

  `isModded(EnumSet<zombie.iso.enums.ChunkGenerationStatus> chunkGenerationStatus)`

  `void`

  `isModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)`

  `boolean`

  `isNewChunk()`

  `boolean`

  `IsOnScreen(boolean halfTileBorder)`

  `boolean`

  `isSpawnedRoom(long roomID)`

  `boolean`

  `isValidLevel(int level)`

  `private boolean`

  `LoadBrandNew(int wx,
  int wy)`

  `boolean`

  `LoadChunk(int wx,
  int wy,
  ByteBuffer fromServer)`

  `boolean`

  `LoadFromBuffer(int wx,
  int wy,
  ByteBuffer bb)`

  `void`

  `LoadFromDisk()`

  `private void`

  `LoadFromDiskOrBuffer(ByteBuffer bb)`

  `private void`

  `LoadFromDiskOrBufferInternal(ByteBuffer bb)`

  `private void`

  `loadGridSquareIfNeeded(IsoGridSquare square)`

  `void`

  `loadInMainThread()`

  `void`

  `loadInWorldStreamerThread()`

  `void`

  `loadObjectState(ByteBuffer bb)`

  `private boolean`

  `LoadOrCreate(int wx,
  int wy,
  ByteBuffer fromServer)`

  `private static int`

  `newtiledefinitions(int tilesetNumber,
  int tileID)`

  `private void`

  `randomizeBuildingsEtc(ArrayList<IsoBuilding> buildings)`

  `boolean`

  `RandomizeModel(BaseVehicle v,
  Zone zone,
  String name,
  VehicleType type)`

  Randomize a model with his corresponding texture defined in VehicleType

  `private boolean[]`

  `readFlags(ByteBuffer bb,
  int nFlags)`

  `private void`

  `RecalcAllWithNeighbour(IsoGridSquare sq,
  IsoDirections dir,
  int dz)`

  `void`

  `recalcNeighboursNow()`

  Deprecated.

  `private static void`

  `releaseLock(IsoChunk.ChunkLock lock)`

  `static void`

  `removeFromCheckedVehicles(BaseVehicle v)`

  `void`

  `removeFromWorld()`

  `void`

  `removeGeneratorPos(int x,
  int y,
  int z)`

  `void`

  `removeObjectAmbientEmitter(IsoObject object)`

  `void`

  `removeObjectPoweredByGenerator(IsoObject object)`

  `static void`

  `Reset()`

  `void`

  `resetForStore()`

  `void`

  `rmModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)`

  `static ByteBuffer`

  `SafeRead(int wx,
  int wy,
  ByteBuffer bb)`

  `static void`

  `SafeWrite(int wx,
  int wy,
  ByteBuffer bb)`

  `void`

  `Save(boolean bPreventChunkReuse)`

  `ByteBuffer`

  `Save(ByteBuffer bb,
  CRC32 crc,
  boolean bHotSave)`

  `void`

  `SaveLoadedChunk(zombie.network.ClientChunkRequest.Chunk ccrc,
  CRC32 crc32)`

  `boolean`

  `saveObjectState(ByteBuffer bb)`

  `void`

  `setAttachmentsDoneFull(boolean attachmentsDoneFull)`

  `void`

  `setAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord coord)`

  `void`

  `setAttachmentsState(int i,
  boolean value)`

  `void`

  `setBlendingDoneFull(boolean flag)`

  `void`

  `setBlendingDonePartial(boolean flag)`

  `void`

  `setBlendingModified(int i)`

  `void`

  `setCache()`

  `void`

  `setCacheIncludingNull()`

  `void`

  `setMinMaxLevel(int minLevel,
  int maxLevel)`

  `void`

  `setModifDepth(zombie.iso.worldgen.blending.BlendDirection dir,
  byte depth)`

  `void`

  `setModifDepth(zombie.iso.worldgen.blending.BlendDirection dir,
  int depth)`

  `void`

  `setRandomVehicleStoryToSpawnLater(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData spawnData)`

  `void`

  `setSquare(int x,
  int y,
  int z,
  IsoGridSquare square)`

  `private void`

  `spawnVehicleRandomAngle(IsoGridSquare sq,
  Zone zone,
  String zoneName)`

  `int`

  `squaresIndexOfLevel(int worldSquareZ)`

  `private void`

  `TryAddVehicle_TrafficJam(Zone zone,
  String zoneName,
  float spawnX,
  float spawnY,
  Vector2 vector2,
  float distanceToSpawnPoint,
  float zoneLength)`

  `private void`

  `unlinkSquares(zombie.iso.IsoChunkLevel chunkLevel)`

  `void`

  `update()`

  `void`

  `updateBuildings()`

  `void`

  `updatePhysicsForLevel(int z)`

  `static void`

  `updatePlayerInBullet()`

  `void`

  `updateSounds()`

  `void`

  `updateVehicleStory()`

  `private void`

  `writeFlags(ByteBuffer bb,
  boolean[] flags)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DIRECTIONS

    private static final [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] DIRECTIONS
  + ### delayedPhysicsShapeSet

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> delayedPhysicsShapeSet
  + ### doServerRequests

    public static boolean doServerRequests
  + ### wx

    public int wx
  + ### wy

    public int wy
  + ### squares

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[][] squares
  + ### corpseCount

    public zombie.iso.CorpseCount.ChunkData corpseCount
  + ### corpseData

    public zombie.FliesSound.ChunkData corpseData
  + ### renderLevels

    private final zombie.iso.fboRenderChunk.FBORenderLevels[] renderLevels
  + ### generatorsTouchingThisChunk

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.Location](../characters/IsoGameCharacter.Location.html "class in zombie.characters")> generatorsTouchingThisChunk
  + ### levels

    private zombie.iso.IsoChunkLevel[] levels
  + ### maxLevel

    public int maxLevel
  + ### minLevel

    public int minLevel
  + ### soundList

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WorldSoundManager.WorldSound](../WorldSoundManager.WorldSound.html "class in zombie")> soundList
  + ### treeCount

    private int treeCount
  + ### numberOfWaterTiles

    private int numberOfWaterTiles
  + ### lightingUpdateCounter

    public int lightingUpdateCounter
  + ### scavengeZone

    private [Zone](zones/Zone.html "class in zombie.iso.zones") scavengeZone
  + ### spawnedRooms

    private final gnu.trove.list.array.TLongArrayList spawnedRooms
  + ### next

    public [IsoChunk](IsoChunk.html "class in zombie.iso") next
  + ### collision

    public final zombie.pathfind.CollideWithObstaclesPoly.ChunkData collision
  + ### adjacentChunkLoadedCounter

    public int adjacentChunkLoadedCounter
  + ### vehicleStorySpawnData

    public zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData vehicleStorySpawnData
  + ### loadVehiclesObject

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") loadVehiclesObject
  + ### objectEmitterData

    public final zombie.audio.ObjectAmbientEmitters.ChunkData objectEmitterData
  + ### cutawayData

    public final zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelsData cutawayData
  + ### vispolyData

    public final zombie.vispoly.VisibilityPolygon2.ChunkData vispolyData
  + ### blendingDoneFull

    private boolean blendingDoneFull
  + ### blendingDonePartial

    private boolean blendingDonePartial
  + ### blendingModified

    private boolean[] blendingModified
  + ### blendingDepth

    private final byte[] blendingDepth
  + ### attachmentsDoneFull

    private boolean attachmentsDoneFull
  + ### attachmentsState

    private boolean[] attachmentsState
  + ### attachmentsPartial

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.utils.SquareCoord> attachmentsPartial
  + ### comparatorBool4

    private static final boolean[] comparatorBool4
  + ### comparatorBool5

    private static final boolean[] comparatorBool5
  + ### chunkGenerationStatus

    private [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<zombie.iso.enums.ChunkGenerationStatus> chunkGenerationStatus
  + ### doWorldgen

    public static boolean doWorldgen
  + ### doForaging

    public static boolean doForaging
  + ### doAttachments

    public static boolean doAttachments
  + ### loadedFrame

    public long loadedFrame
  + ### renderFrame

    public long renderFrame
  + ### frameDelay

    private static int frameDelay
  + ### maxFrameDelay

    private static final int maxFrameDelay

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.maxFrameDelay)
  + ### requiresHotSave

    public boolean requiresHotSave
  + ### preventHotSave

    public boolean preventHotSave
  + ### ignorePathfind

    private boolean ignorePathfind
  + ### jobType

    public [IsoChunk.JobType](IsoChunk.JobType.html "enum class in zombie.iso") jobType
  + ### lotheader

    public zombie.iso.LotHeader lotheader
  + ### floorBloodSplats

    public final zombie.core.utils.BoundedQueue<zombie.iso.IsoFloorBloodSplat> floorBloodSplats
  + ### floorBloodSplatsFade

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoFloorBloodSplat> floorBloodSplatsFade
  + ### MAX\_BLOOD\_SPLATS

    private static final int MAX\_BLOOD\_SPLATS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.MAX_BLOOD_SPLATS)
  + ### nextSplatIndex

    private int nextSplatIndex
  + ### renderByIndex

    public static final byte[][] renderByIndex
  + ### refs

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkMap](IsoChunkMap.html "class in zombie.iso")> refs
  + ### loaded

    public boolean loaded
  + ### blam

    private boolean blam
  + ### addZombies

    private boolean addZombies
  + ### proceduralZombieSquares

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> proceduralZombieSquares
  + ### fixed2x

    private boolean fixed2x
  + ### lightCheck

    public final boolean[] lightCheck
  + ### lightingNeverDone

    public final boolean[] lightingNeverDone
  + ### roomLights

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoRoomLight> roomLights
  + ### vehicles

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles")> vehicles
  + ### lootRespawnHour

    public int lootRespawnHour
  + ### LB\_PATHFIND

    public static final short LB\_PATHFIND

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.LB_PATHFIND)
  + ### loadedBits

    public short loadedBits
  + ### INVALID\_LOAD\_ID

    private static final short INVALID\_LOAD\_ID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.INVALID_LOAD_ID)
  + ### nextLoadID

    private static short nextLoadID
  + ### loadId

    private short loadId
  + ### objectsSyncCount

    public int objectsSyncCount
  + ### addVehiclesForTestVtype

    private static int addVehiclesForTestVtype
  + ### addVehiclesForTestVskin

    private static int addVehiclesForTestVskin
  + ### addVehiclesForTestVrot

    private static int addVehiclesForTestVrot
  + ### BaseVehicleCheckedVehicles

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles")> BaseVehicleCheckedVehicles
  + ### minLevelPhysics

    private int minLevelPhysics
  + ### maxLevelPhysics

    private int maxLevelPhysics
  + ### MAX\_SHAPES

    private static final int MAX\_SHAPES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.MAX_SHAPES)
  + ### shapes

    private final int[] shapes
  + ### bshapes

    private static final byte[] bshapes
  + ### chunkGetter

    private static final [IsoChunk.ChunkGetter](IsoChunk.ChunkGetter.html "class in zombie.iso") chunkGetter
  + ### newSquareList

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> newSquareList
  + ### loadedPhysics

    private boolean loadedPhysics
  + ### ragdollControllersForAddToWorld

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> ragdollControllersForAddToWorld
  + ### loadGridSquare

    public static final zombie.util.CappedConcurrentQueue<[IsoChunk](IsoChunk.html "class in zombie.iso")> loadGridSquare
  + ### BLOCK\_SIZE

    public static final int BLOCK\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunk.BLOCK_SIZE)
  + ### sliceBuffer

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") sliceBuffer
  + ### sliceBufferLoad

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") sliceBufferLoad
  + ### WriteLock

    public static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") WriteLock
  + ### tempRoomDefs

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> tempRoomDefs
  + ### tempBuildingDefs

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](BuildingDef.html "class in zombie.iso")> tempBuildingDefs
  + ### tempBuildings

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> tempBuildings
  + ### Locks

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso")> Locks
  + ### FreeLocks

    private static final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso")> FreeLocks
  + ### sanityCheck

    private static final [IsoChunk.SanityCheck](IsoChunk.SanityCheck.html "class in zombie.iso") sanityCheck
  + ### crcLoad

    private static final [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crcLoad
  + ### crcSave

    private static final [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crcSave
  + ### erosion

    private zombie.erosion.ErosionData.Chunk erosion
  + ### Fix2xMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> Fix2xMap
  + ### randomId

    public int randomId
  + ### revision

    public long revision
* Constructor Details
  -------------------

  + ### IsoChunk

    public IsoChunk([IsoCell](IsoCell.html "class in zombie.iso") cell)
  + ### IsoChunk

    public IsoChunk(zombie.iso.WorldReuserThread dummy)
* Method Details
  --------------

  + ### flagForHotSave

    public void flagForHotSave()
  + ### updateSounds

    public void updateSounds()
  + ### IsOnScreen

    public boolean IsOnScreen(boolean halfTileBorder)
  + ### checkLightingLater\_AllPlayers\_AllLevels

    public void checkLightingLater\_AllPlayers\_AllLevels()
  + ### checkLightingLater\_AllPlayers\_OneLevel

    public void checkLightingLater\_AllPlayers\_OneLevel(int level)
  + ### checkLightingLater\_OnePlayer\_AllLevels

    public void checkLightingLater\_OnePlayer\_AllLevels(int playerIndex)
  + ### checkLightingLater\_OnePlayer\_OneLevel

    public void checkLightingLater\_OnePlayer\_OneLevel(int playerIndex,
    int level)
  + ### addBloodSplat

    public void addBloodSplat(float x,
    float y,
    float z,
    int type)
  + ### AddCorpses

    public void AddCorpses(int wx,
    int wy)
  + ### AddBlood

    public void AddBlood(int wx,
    int wy)
  + ### checkVehiclePos

    private void checkVehiclePos([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### fixVehiclePos

    private boolean fixVehiclePos([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### isGoodVehiclePos

    private boolean isGoodVehiclePos([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### AddVehicles\_ForTest

    private void AddVehicles\_ForTest([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### AddVehicles\_OnZone

    private void AddVehicles\_OnZone([VehicleZone](zones/VehicleZone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### AddVehicles\_OnZonePolyline

    private void AddVehicles\_OnZonePolyline([VehicleZone](zones/VehicleZone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### removeFromCheckedVehicles

    public static void removeFromCheckedVehicles([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v)
  + ### addFromCheckedVehicles

    public static void addFromCheckedVehicles([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v)
  + ### Reset

    public static void Reset()
  + ### doSpawnedVehiclesInInvalidPosition

    public static boolean doSpawnedVehiclesInInvalidPosition([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v)
  + ### spawnVehicleRandomAngle

    private void spawnVehicleRandomAngle([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### RandomizeModel

    public boolean RandomizeModel([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v,
    [Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [VehicleType](../vehicles/VehicleType.html "class in zombie.vehicles") type)

    Randomize a model with his corresponding texture defined in VehicleType

    Parameters:
    :   `v` - vehicle
    :   `zone` - zone we're spawning on

    Returns:
    :   true if succed
  + ### AddVehicles\_TrafficJam\_W

    private void AddVehicles\_TrafficJam\_W([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### AddVehicles\_TrafficJam\_E

    private void AddVehicles\_TrafficJam\_E([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### AddVehicles\_TrafficJam\_S

    private void AddVehicles\_TrafficJam\_S([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### AddVehicles\_TrafficJam\_N

    private void AddVehicles\_TrafficJam\_N([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### AddVehicles\_TrafficJam\_Polyline

    private void AddVehicles\_TrafficJam\_Polyline([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### TryAddVehicle\_TrafficJam

    private void TryAddVehicle\_TrafficJam([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    float spawnX,
    float spawnY,
    [Vector2](Vector2.html "class in zombie.iso") vector2,
    float distanceToSpawnPoint,
    float zoneLength)
  + ### AddVehicles

    public void AddVehicles()
  + ### addSurvivorInHorde

    public void addSurvivorInHorde(boolean forced)
  + ### canAddSurvivorInHorde

    private boolean canAddSurvivorInHorde([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    boolean force)
  + ### addSurvivorInHorde

    private void addSurvivorInHorde([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### canAddRandomCarCrash

    public boolean canAddRandomCarCrash([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    boolean force)
  + ### addRandomCarCrash

    public void addRandomCarCrash([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    boolean addToWorld)
  + ### FileExists

    public static boolean FileExists(int wx,
    int wy)
  + ### checkPhysicsLater

    public void checkPhysicsLater(int level)
  + ### updatePhysicsForLevel

    public void updatePhysicsForLevel(int z)
  + ### addPhysicsShape

    private int addPhysicsShape([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    int[] shapes,
    int count,
    int shape)
  + ### addPhysicsShape

    private int addPhysicsShape([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    int[] shapes,
    int count,
    [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") shape)
  + ### calcPhysics

    private void calcPhysics(int x,
    int y,
    int z,
    int[] shapes)
  + ### setBlendingDoneFull

    public void setBlendingDoneFull(boolean flag)
  + ### isBlendingDoneFull

    public boolean isBlendingDoneFull()
  + ### setBlendingDonePartial

    public void setBlendingDonePartial(boolean flag)
  + ### isBlendingDonePartial

    public boolean isBlendingDonePartial()
  + ### setBlendingModified

    public void setBlendingModified(int i)
  + ### isBlendingDone

    public boolean isBlendingDone(int i)
  + ### setModifDepth

    public void setModifDepth(zombie.iso.worldgen.blending.BlendDirection dir,
    byte depth)
  + ### setModifDepth

    public void setModifDepth(zombie.iso.worldgen.blending.BlendDirection dir,
    int depth)
  + ### getModifDepth

    public byte getModifDepth(zombie.iso.worldgen.blending.BlendDirection dir)
  + ### setAttachmentsDoneFull

    public void setAttachmentsDoneFull(boolean attachmentsDoneFull)
  + ### isAttachmentsDoneFull

    public boolean isAttachmentsDoneFull()
  + ### setAttachmentsState

    public void setAttachmentsState(int i,
    boolean value)
  + ### isAttachmentsDone

    public boolean isAttachmentsDone(int i)
  + ### getAttachmentsState

    public boolean[] getAttachmentsState()
  + ### setAttachmentsPartial

    public void setAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord coord)
  + ### getAttachmentsPartial

    public zombie.iso.worldgen.utils.SquareCoord getAttachmentsPartial(int i)
  + ### hasAttachmentsPartial

    public boolean hasAttachmentsPartial(zombie.iso.worldgen.utils.SquareCoord coord)
  + ### attachmentsPartialSize

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") attachmentsPartialSize()
  + ### isModded

    public [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<zombie.iso.enums.ChunkGenerationStatus> isModded()
  + ### isModded

    public void isModded([EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<zombie.iso.enums.ChunkGenerationStatus> chunkGenerationStatus)
  + ### isModded

    public void isModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)
  + ### addModded

    public void addModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)
  + ### rmModded

    public void rmModded(zombie.iso.enums.ChunkGenerationStatus chunkGenerationStatus)
  + ### getFromPool

    private static [IsoChunk](IsoChunk.html "class in zombie.iso") getFromPool()
  + ### LoadBrandNew

    private boolean LoadBrandNew(int wx,
    int wy)
  + ### hasEmptySquaresOnLevelZero

    public boolean hasEmptySquaresOnLevelZero()
  + ### hasNonEmptySquareBelow

    private boolean hasNonEmptySquareBelow(int x,
    int y,
    int z)
  + ### LoadChunk

    public boolean LoadChunk(int wx,
    int wy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") fromServer)
  + ### LoadOrCreate

    private boolean LoadOrCreate(int wx,
    int wy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") fromServer)
  + ### LoadFromBuffer

    public boolean LoadFromBuffer(int wx,
    int wy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### assignRoom

    private void assignRoom([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### ensureNotNull3x3

    private void ensureNotNull3x3(int lx,
    int ly,
    int z)
  + ### ensureNotNull

    private void ensureNotNull(int lx,
    int ly,
    int z,
    int dx,
    int dy)
  + ### loadInWorldStreamerThread

    public void loadInWorldStreamerThread()
  + ### RecalcAllWithNeighbour

    private void RecalcAllWithNeighbour([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int dz)
  + ### EnsureSurroundNotNullX

    private void EnsureSurroundNotNullX(int x,
    int y,
    int z)
  + ### EnsureSurroundNotNullY

    private void EnsureSurroundNotNullY(int x,
    int y,
    int z)
  + ### EnsureSurroundNotNull

    private void EnsureSurroundNotNull(int x,
    int y,
    int z)
  + ### getMinLevelOf

    private static int getMinLevelOf(int minLevel,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### getMaxLevelOf

    private static int getMaxLevelOf(int maxLevel,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### loadInMainThread

    public void loadInMainThread()
  + ### fixObjectAmbientEmittersOnAdjacentChunks

    private void fixObjectAmbientEmittersOnAdjacentChunks([IsoChunk](IsoChunk.html "class in zombie.iso") chunkE,
    [IsoChunk](IsoChunk.html "class in zombie.iso") chunkS)
  + ### fixObjectAmbientEmittersOnSquare

    private void fixObjectAmbientEmittersOnSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    boolean north)
  + ### recalcNeighboursNow

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void recalcNeighboursNow()

    Deprecated.
  + ### updateBuildings

    public void updateBuildings()
  + ### updatePlayerInBullet

    public static void updatePlayerInBullet()
  + ### update

    public void update()
  + ### updateVehicleStory

    public void updateVehicleStory()
  + ### squaresIndexOfLevel

    public int squaresIndexOfLevel(int worldSquareZ)
  + ### getSquaresForLevel

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")[] getSquaresForLevel(int worldSquareZ)
  + ### doPathfind

    public void doPathfind()
  + ### ignorePathfind

    public void ignorePathfind()
  + ### setSquare

    public void setSquare(int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getMinLevel

    public int getMinLevel()
  + ### getMaxLevel

    public int getMaxLevel()
  + ### isValidLevel

    public boolean isValidLevel(int level)
  + ### setMinMaxLevel

    public void setMinMaxLevel(int minLevel,
    int maxLevel)
  + ### getLevelData

    public zombie.iso.IsoChunkLevel getLevelData(int level)
  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare(int chunkSquareX,
    int chunkSquareY,
    int worldSquareZ)
  + ### getRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getRoom(long roomID)
  + ### removeFromWorld

    public void removeFromWorld()
  + ### disconnectFromAdjacentChunks

    private void disconnectFromAdjacentChunks([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### doReuseGridsquares

    public void doReuseGridsquares()
  + ### bufferSize

    private static int bufferSize(int size)
  + ### ensureCapacity

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") ensureCapacity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int capacity)
  + ### ensureCapacity

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") ensureCapacity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### readFlags

    private boolean[] readFlags([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int nFlags)
  + ### writeFlags

    private void writeFlags([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    boolean[] flags)
  + ### LoadFromDisk

    public void LoadFromDisk()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### LoadFromDiskOrBuffer

    private void LoadFromDiskOrBuffer([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### LoadFromDiskOrBufferInternal

    private void LoadFromDiskOrBufferInternal([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### doLoadGridsquare

    public void doLoadGridsquare()
  + ### loadGridSquareIfNeeded

    private void loadGridSquareIfNeeded([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### addRatsAfterLoading

    private void addRatsAfterLoading([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### CheckGrassRegrowth

    private void CheckGrassRegrowth()
  + ### randomizeBuildingsEtc

    private void randomizeBuildingsEtc([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> buildings)
  + ### checkAdjacentChunks

    private void checkAdjacentChunks()
  + ### AddZombieZoneStory

    private void AddZombieZoneStory()
  + ### AddRanchAnimals

    private void AddRanchAnimals()
  + ### setCache

    public void setCache()
  + ### acquireLock

    private static [IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso") acquireLock(int wx,
    int wy)
  + ### releaseLock

    private static void releaseLock([IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso") lock)
  + ### setCacheIncludingNull

    public void setCacheIncludingNull()
  + ### Save

    public void Save(boolean bPreventChunkReuse)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### SafeWrite

    public static void SafeWrite(int wx,
    int wy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### SafeRead

    public static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") SafeRead(int wx,
    int wy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### SaveLoadedChunk

    public void SaveLoadedChunk(zombie.network.ClientChunkRequest.Chunk ccrc,
    [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crc32)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### IsDebugSave

    public static boolean IsDebugSave()
  + ### Save

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") Save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crc,
    boolean bHotSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveObjectState

    public boolean saveObjectState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadObjectState

    public void loadObjectState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Blam

    public void Blam(int wx,
    int wy)
  + ### BackupBlam

    private void BackupBlam(int wx,
    int wy,
    [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang") ex)
  + ### copyFile

    private static void copyFile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") sourceFile,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") destFile)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getErosionData

    public zombie.erosion.ErosionData.Chunk getErosionData()
  + ### newtiledefinitions

    private static int newtiledefinitions(int tilesetNumber,
    int tileID)
  + ### Fix2x

    public static int Fix2x([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int spriteID)
  + ### Fix2x

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Fix2x([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName)
  + ### addGeneratorPos

    public void addGeneratorPos(int x,
    int y,
    int z)
  + ### removeGeneratorPos

    public void removeGeneratorPos(int x,
    int y,
    int z)
  + ### isGeneratorPoweringSquare

    public boolean isGeneratorPoweringSquare(int x,
    int y,
    int z)
  + ### checkForMissingGenerators

    public void checkForMissingGenerators()
  + ### addObjectPoweredByGenerator

    public void addObjectPoweredByGenerator([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### removeObjectPoweredByGenerator

    public void removeObjectPoweredByGenerator([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### isNewChunk

    public boolean isNewChunk()
  + ### addSpawnedRoom

    public void addSpawnedRoom(long roomID)
  + ### isSpawnedRoom

    public boolean isSpawnedRoom(long roomID)
  + ### getScavengeZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getScavengeZone()
  + ### unlinkSquares

    private void unlinkSquares(zombie.iso.IsoChunkLevel chunkLevel)
  + ### resetForStore

    public void resetForStore()
  + ### getNumberOfWaterTiles

    public int getNumberOfWaterTiles()
  + ### setRandomVehicleStoryToSpawnLater

    public void setRandomVehicleStoryToSpawnLater(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData spawnData)
  + ### hasObjectAmbientEmitter

    public boolean hasObjectAmbientEmitter([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### addObjectAmbientEmitter

    public void addObjectAmbientEmitter([IsoObject](IsoObject.html "class in zombie.iso") object,
    zombie.audio.ObjectAmbientEmitters.PerObjectLogic logic)
  + ### removeObjectAmbientEmitter

    public void removeObjectAmbientEmitter([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### addItemOnGround

    private void addItemOnGround([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### assignLoadID

    public void assignLoadID()
  + ### getLoadID

    public short getLoadID()
  + ### containsPoint

    public boolean containsPoint(float x,
    float y)
  + ### getRenderLevels

    public zombie.iso.fboRenderChunk.FBORenderLevels getRenderLevels(int playerIndex)
  + ### invalidateRenderChunkLevel

    public void invalidateRenderChunkLevel(int level,
    long dirtyFlags)
  + ### invalidateRenderChunkLevels

    public void invalidateRenderChunkLevels(long dirtyFlags)
  + ### getCutawayData

    public zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelsData getCutawayData()
  + ### getCutawayDataForLevel

    public zombie.iso.fboRenderChunk.FBORenderCutaways.ChunkLevelData getCutawayDataForLevel(int z)
  + ### invalidateVispolyChunkLevel

    public void invalidateVispolyChunkLevel(int level)
  + ### getVispolyData

    public zombie.vispoly.VisibilityPolygon2.ChunkData getVispolyData()
  + ### getVispolyDataForLevel

    public zombie.vispoly.VisibilityPolygon2.ChunkLevelData getVispolyDataForLevel(int z)
  + ### hasWaterSquare

    public boolean hasWaterSquare()
  + ### addRagdollControllers

    private void addRagdollControllers()
  + ### checkForActiveRagdoll

    private boolean checkForActiveRagdoll([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") isoGridSquare)
  + ### checkPhysicsLaterForActiveRagdoll

    public void checkPhysicsLaterForActiveRagdoll(zombie.iso.IsoChunkLevel isoChunkLevel)
  + ### hasFence

    public boolean hasFence()