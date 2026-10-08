[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoWorld](IsoWorld.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [TILESETS\_PER\_FILE\_1](#TILESETS_PER_FILE_1)
   2. [TILES\_PER\_TILESET\_1](#TILES_PER_TILESET_1)
   3. [TILES\_PER\_FILE\_1](#TILES_PER_FILE_1)
   4. [TILESETS\_PER\_FILE\_OTHER](#TILESETS_PER_FILE_OTHER)
   5. [TILES\_PER\_TILESET\_OTHER](#TILES_PER_TILESET_OTHER)
   6. [TILES\_PER\_FILE\_OTHER](#TILES_PER_FILE_OTHER)
   7. [NUM\_TDEF\_FILES\_GT\_1](#NUM_TDEF_FILES_GT_1)
   8. [MIN\_TDEF\_FILE\_NUMBER\_FOR\_MODS](#MIN_TDEF_FILE_NUMBER_FOR_MODS)
   9. [MAX\_TDEF\_FILE\_NUMBER\_FOR\_MODS](#MAX_TDEF_FILE_NUMBER_FOR_MODS)
   10. [TDEF\_VERSION1](#TDEF_VERSION1)
   11. [TDEF\_VERSION\_LATEST](#TDEF_VERSION_LATEST)
   12. [TDEF\_FILE\_MAGIC](#TDEF_FILE_MAGIC)
   13. [LUA\_CHECKSUM\_TIMEOUT\_MS](#LUA_CHECKSUM_TIMEOUT_MS)
   14. [weather](#weather)
   15. [metaGrid](#metaGrid)
   16. [randomizedBuildingList](#randomizedBuildingList)
   17. [randomizedZoneList](#randomizedZoneList)
   18. [randomizedVehicleStoryList](#randomizedVehicleStoryList)
   19. [rbBasic](#rbBasic)
   20. [randomizedWorldBase](#randomizedWorldBase)
   21. [spawnedZombieZone](#spawnedZombieZone)
   22. [allTiles](#allTiles)
   23. [tileImages](#tileImages)
   24. [flashIsoCursorA](#flashIsoCursorA)
   25. [flashIsoCursorInc](#flashIsoCursorInc)
   26. [sky](#sky)
   27. [timeSinceLastSurvivorInHorde](#timeSinceLastSurvivorInHorde)
   28. [frameNo](#frameNo)
   29. [helicopter](#helicopter)
   30. [hydroPowerOn](#hydroPowerOn)
   31. [characters](#characters)
   32. [freeEmitters](#freeEmitters)
   33. [currentEmitters](#currentEmitters)
   34. [emitterOwners](#emitterOwners)
   35. [x](#x)
   36. [y](#y)
   37. [currentCell](#currentCell)
   38. [instance](#instance)
   39. [totalSurvivorsDead](#totalSurvivorsDead)
   40. [totalSurvivorNights](#totalSurvivorNights)
   41. [survivorSurvivalRecord](#survivorSurvivalRecord)
   42. [survivorDescriptors](#survivorDescriptors)
   43. [addCoopPlayers](#addCoopPlayers)
   44. [compScoreToPlayer](#compScoreToPlayer)
   45. [mapPath](#mapPath)
   46. [mapUseJar](#mapUseJar)
   47. [loaded](#loaded)
   48. [PropertyValueMap](#PropertyValueMap)
   49. [JUMBO\_TRUNK\_VARIANT\_COUNT](#JUMBO_TRUNK_VARIANT_COUNT)
   50. [FAKE\_JUMBO\_TREE\_TILESET\_INDEX](#FAKE_JUMBO_TREE_TILESET_INDEX)
   51. [worldX](#worldX)
   52. [worldY](#worldY)
   53. [luaDesc](#luaDesc)
   54. [luatraits](#luatraits)
   55. [luaPosX](#luaPosX)
   56. [luaPosY](#luaPosY)
   57. [luaPosZ](#luaPosZ)
   58. [spawnRegionName](#spawnRegionName)
   59. [WorldVersion](#WorldVersion)
   60. [WorldVersion\_PreviouslyMoved](#WorldVersion_PreviouslyMoved)
   61. [WorldVersion\_DesignationZone](#WorldVersion_DesignationZone)
   62. [WorldVersion\_PlayerExtraInfoFlags](#WorldVersion_PlayerExtraInfoFlags)
   63. [WorldVersion\_ObjectID](#WorldVersion_ObjectID)
   64. [WorldVersion\_CraftUpdateFoundations](#WorldVersion_CraftUpdateFoundations)
   65. [WorldVersion\_AlarmDecay](#WorldVersion_AlarmDecay)
   66. [WorldVersion\_FishingCheat](#WorldVersion_FishingCheat)
   67. [WorldVersion\_CharacterVoiceType](#WorldVersion_CharacterVoiceType)
   68. [WorldVersion\_AnimalHutch](#WorldVersion_AnimalHutch)
   69. [WorldVersion\_AlarmClock](#WorldVersion_AlarmClock)
   70. [WorldVersion\_VariableHeight](#WorldVersion_VariableHeight)
   71. [WorldVersion\_EnableWorldgen](#WorldVersion_EnableWorldgen)
   72. [WorldVersion\_CharacterVoiceOptions](#WorldVersion_CharacterVoiceOptions)
   73. [WorldVersion\_ChunksWorldGeneratedBoolean](#WorldVersion_ChunksWorldGeneratedBoolean)
   74. [WorldVersion\_ChunksWorldModifiedBoolean](#WorldVersion_ChunksWorldModifiedBoolean)
   75. [WorldVersion\_CharacterDiscomfort](#WorldVersion_CharacterDiscomfort)
   76. [WorldVersion\_HutchAndVehicleAnimalFormat](#WorldVersion_HutchAndVehicleAnimalFormat)
   77. [WorldVersion\_IsoCompostHealthValues](#WorldVersion_IsoCompostHealthValues)
   78. [WorldVersion\_ChunksAttachmentsState](#WorldVersion_ChunksAttachmentsState)
   79. [WorldVersion\_ZoneIDisUUID](#WorldVersion_ZoneIDisUUID)
   80. [WorldVersion\_SafeHouseHitPoints](#WorldVersion_SafeHouseHitPoints)
   81. [WorldVersion\_FastMoveCheat](#WorldVersion_FastMoveCheat)
   82. [WorldVersion\_SquareSeen](#WorldVersion_SquareSeen)
   83. [WorldVersion\_TrapExplosionDuration](#WorldVersion_TrapExplosionDuration)
   84. [WorldVersion\_InventoryItemUsesInteger](#WorldVersion_InventoryItemUsesInteger)
   85. [WorldVersion\_ChunksAttachmentsPartial](#WorldVersion_ChunksAttachmentsPartial)
   86. [WorldVersion\_PrintMediaRottingCorpsesBodyDamage](#WorldVersion_PrintMediaRottingCorpsesBodyDamage)
   87. [WorldVersion\_SafeHouseCreatedTimeAndLocation](#WorldVersion_SafeHouseCreatedTimeAndLocation)
   88. [WorldVersion\_Stats\_Idleness](#WorldVersion_Stats_Idleness)
   89. [WorldVersion\_AnimalRottingTexture](#WorldVersion_AnimalRottingTexture)
   90. [WorldVersion\_LearnedRecipes](#WorldVersion_LearnedRecipes)
   91. [WorldVersion\_BodyDamageSavePoulticeValues](#WorldVersion_BodyDamageSavePoulticeValues)
   92. [WorldVersion\_PlayerSaveCraftingHistory](#WorldVersion_PlayerSaveCraftingHistory)
   93. [WorldVersion\_VehicleAlarm](#WorldVersion_VehicleAlarm)
   94. [WorldVersion\_RecipesAndAmmoCheats](#WorldVersion_RecipesAndAmmoCheats)
   95. [WorldVersion\_SavePlayerCheats](#WorldVersion_SavePlayerCheats)
   96. [WorldVersion\_ItemWorldRotationFloats](#WorldVersion_ItemWorldRotationFloats)
   97. [WorldVersion\_MetaEntityOutsideAware](#WorldVersion_MetaEntityOutsideAware)
   98. [WorldVersion\_VisitedFileVersion](#WorldVersion_VisitedFileVersion)
   99. [WorldVersion\_VariableCraftInputCounts](#WorldVersion_VariableCraftInputCounts)
   100. [WorldVersion\_AnimalPetTime](#WorldVersion_AnimalPetTime)
   101. [WorldVersion\_RootLocale](#WorldVersion_RootLocale)
   102. [WorldVersion\_CraftLogicParallelCrafting](#WorldVersion_CraftLogicParallelCrafting)
   103. [WorldVersion\_PlayerAutoDrink](#WorldVersion_PlayerAutoDrink)
   104. [WorldVersion\_42\_13](#WorldVersion_42_13)
   105. [WorldVersion\_PlayerInsulation](#WorldVersion_PlayerInsulation)
   106. [WorldVersion\_SaveFireTimer](#WorldVersion_SaveFireTimer)
   107. [WorldVersion\_BodyDamageStatusesSync](#WorldVersion_BodyDamageStatusesSync)
   108. [WorldVersion\_RemoveDifficulty](#WorldVersion_RemoveDifficulty)
   109. [WorldVersion\_AnimalWild](#WorldVersion_AnimalWild)
   110. [WorldVersion\_DeadBodyAnimalGenetics](#WorldVersion_DeadBodyAnimalGenetics)
   111. [WorldVersion\_AnimalOnlineId](#WorldVersion_AnimalOnlineId)
   112. [WorldVersion\_BuildMaterials](#WorldVersion_BuildMaterials)
   113. [WorldVersion\_ThermalDuration](#WorldVersion_ThermalDuration)
   114. [savedWorldVersion](#savedWorldVersion)
   115. [drawWorld](#drawWorld)
   116. [zombieWithModel](#zombieWithModel)
   117. [zombieWithoutModel](#zombieWithoutModel)
   118. [timSort](#timSort)
   119. [animalWithModel](#animalWithModel)
   120. [animalWithoutModel](#animalWithoutModel)
   121. [coneTempo1](#coneTempo1)
   122. [coneTempo2](#coneTempo2)
   123. [coneTempo3](#coneTempo3)
   124. [noZombies](#noZombies)
   125. [totalWorldVersion](#totalWorldVersion)
   126. [saveoffsetx](#saveoffsetx)
   127. [saveoffsety](#saveoffsety)
   128. [doChunkMapUpdate](#doChunkMapUpdate)
   129. [emitterUpdateMs](#emitterUpdateMs)
   130. [emitterUpdate](#emitterUpdate)
   131. [updateSafehousePlayers](#updateSafehousePlayers)
   132. [animationThread](#animationThread)
   133. [rules](#rules)
   134. [wgChunk](#wgChunk)
   135. [blending](#blending)
   136. [attachmentsHandler](#attachmentsHandler)
   137. [zoneGenerator](#zoneGenerator)
   138. [biomeMap](#biomeMap)
   139. [zombieVoronois](#zombieVoronois)
7. [Constructor Details](#constructor-detail)
   1. [IsoWorld()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getMetaGrid()](#getMetaGrid())
   2. [registerZone(String, String, int, int, int, int, int)](#registerZone(java.lang.String,java.lang.String,int,int,int,int,int))
   3. [registerNavZones()](#registerNavZones())
   4. [registerZoneNoOverlap(String, String, int, int, int, int, int)](#registerZoneNoOverlap(java.lang.String,java.lang.String,int,int,int,int,int))
   5. [removeZonesForLotDirectory(String)](#removeZonesForLotDirectory(java.lang.String))
   6. [getFreeEmitter()](#getFreeEmitter())
   7. [getFreeEmitter(float, float, float)](#getFreeEmitter(float,float,float))
   8. [takeOwnershipOfEmitter(BaseSoundEmitter)](#takeOwnershipOfEmitter(zombie.audio.BaseSoundEmitter))
   9. [setEmitterOwner(BaseSoundEmitter, IsoObject)](#setEmitterOwner(zombie.audio.BaseSoundEmitter,zombie.iso.IsoObject))
   10. [returnOwnershipOfEmitter(BaseSoundEmitter)](#returnOwnershipOfEmitter(zombie.audio.BaseSoundEmitter))
   11. [registerVehiclesZone(String, String, int, int, int, int, int, KahluaTable)](#registerVehiclesZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   12. [registerMannequinZone(String, String, int, int, int, int, int, KahluaTable)](#registerMannequinZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   13. [registerRoomTone(String, String, int, int, int, int, int, KahluaTable)](#registerRoomTone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   14. [registerSpawnOrigin(int, int, int, int, KahluaTable)](#registerSpawnOrigin(int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   15. [registerWaterFlow(float, float, float, float)](#registerWaterFlow(float,float,float,float))
   16. [registerWaterZone(float, float, float, float, float, float)](#registerWaterZone(float,float,float,float,float,float))
   17. [checkVehiclesZones()](#checkVehiclesZones())
   18. [setGameMode(String)](#setGameMode(java.lang.String))
   19. [getGameMode()](#getGameMode())
   20. [setPreset(String)](#setPreset(java.lang.String))
   21. [getPreset()](#getPreset())
   22. [setWorld(String)](#setWorld(java.lang.String))
   23. [setMap(String)](#setMap(java.lang.String))
   24. [getMap()](#getMap())
   25. [renderTerrain()](#renderTerrain())
   26. [getFrameNo()](#getFrameNo())
   27. [CreateRandomSurvivor(SurvivorDesc, IsoGridSquare, IsoPlayer)](#CreateRandomSurvivor(zombie.characters.SurvivorDesc,zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   28. [CreateSwarm(int, int, int, int, int)](#CreateSwarm(int,int,int,int,int))
   29. [ForceKillAllZombies()](#ForceKillAllZombies())
   30. [readInt(RandomAccessFile)](#readInt(java.io.RandomAccessFile))
   31. [readString(RandomAccessFile)](#readString(java.io.RandomAccessFile))
   32. [readInt(InputStream)](#readInt(java.io.InputStream))
   33. [readString(InputStream, StringBuilder)](#readString(java.io.InputStream,java.lang.StringBuilder))
   34. [getSpriteID(int, int, int)](#getSpriteID(int,int,int))
   35. [LoadTileDefinitions(IsoSpriteManager, String, int)](#LoadTileDefinitions(zombie.iso.sprite.IsoSpriteManager,java.lang.String,int))
   36. [GenerateTilePropertyLookupTables()](#GenerateTilePropertyLookupTables())
   37. [LoadTileDefinitionsPropertyStrings(IsoSpriteManager, String, int)](#LoadTileDefinitionsPropertyStrings(zombie.iso.sprite.IsoSpriteManager,java.lang.String,int))
   38. [SetCustomPropertyValues()](#SetCustomPropertyValues())
   39. [setOpenDoorProperties(String, ArrayList)](#setOpenDoorProperties(java.lang.String,java.util.ArrayList))
   40. [saveMovableStats(Map, int, int, int, int, int)](#saveMovableStats(java.util.Map,int,int,int,int,int))
   41. [addJumboTreeTileset(IsoSpriteManager, int, String, String, int, int, int, int)](#addJumboTreeTileset(zombie.iso.sprite.IsoSpriteManager,int,java.lang.String,java.lang.String,int,int,int,int))
   42. [addJumboTrunkTileset(IsoSpriteManager, int, String, int)](#addJumboTrunkTileset(zombie.iso.sprite.IsoSpriteManager,int,java.lang.String,int))
   43. [registerFakeJumboTree(IsoSpriteManager, int)](#registerFakeJumboTree(zombie.iso.sprite.IsoSpriteManager,int))
   44. [loadedTileDefinitions()](#loadedTileDefinitions())
   45. [LoadPlayerForInfo()](#LoadPlayerForInfo())
   46. [init()](#init())
   47. [setBasementAllExplored(IsoBuilding)](#setBasementAllExplored(zombie.iso.areas.IsoBuilding))
   48. [readWorldVersion()](#readWorldVersion())
   49. [getLuaTraits()](#getLuaTraits())
   50. [addLuaTrait(CharacterTrait)](#addLuaTrait(zombie.scripting.objects.CharacterTrait))
   51. [getLuaPlayerDesc()](#getLuaPlayerDesc())
   52. [setLuaPlayerDesc(SurvivorDesc)](#setLuaPlayerDesc(zombie.characters.SurvivorDesc))
   53. [KillCell()](#KillCell())
   54. [setDrawWorld(boolean)](#setDrawWorld(boolean))
   55. [sceneCullZombies()](#sceneCullZombies())
   56. [sceneCullAnimals()](#sceneCullAnimals())
   57. [render()](#render())
   58. [renderInternal()](#renderInternal())
   59. [renderPathfinding()](#renderPathfinding())
   60. [renderVocals()](#renderVocals())
   61. [renderWeatherFX()](#renderWeatherFX())
   62. [DrawPlayerCone()](#DrawPlayerCone())
   63. [DrawPlayerCone2()](#DrawPlayerCone2())
   64. [DrawIsoCursorHelper()](#DrawIsoCursorHelper())
   65. [updateWorld()](#updateWorld())
   66. [FinishAnimation()](#FinishAnimation())
   67. [update()](#update())
   68. [updateInternal()](#updateInternal())
   69. [updateThread()](#updateThread())
   70. [updateBuildings()](#updateBuildings())
   71. [updateDBs()](#updateDBs())
   72. [getCell()](#getCell())
   73. [PopulateCellWithSurvivors()](#PopulateCellWithSurvivors())
   74. [getWorldSquareY()](#getWorldSquareY())
   75. [getWorldSquareX()](#getWorldSquareX())
   76. [getMetaChunk(int, int)](#getMetaChunk(int,int))
   77. [getMetaChunkFromTile(int, int)](#getMetaChunkFromTile(int,int))
   78. [getGlobalTemperature()](#getGlobalTemperature())
   79. [getWeather()](#getWeather())
   80. [setWeather(String)](#setWeather(java.lang.String))
   81. [getLuaSpawnCellX()](#getLuaSpawnCellX())
   82. [setLuaSpawnCellX(int)](#setLuaSpawnCellX(int))
   83. [getLuaSpawnCellY()](#getLuaSpawnCellY())
   84. [setLuaSpawnCellY(int)](#setLuaSpawnCellY(int))
   85. [getLuaPosX()](#getLuaPosX())
   86. [setLuaPosX(int)](#setLuaPosX(int))
   87. [getLuaPosY()](#getLuaPosY())
   88. [setLuaPosY(int)](#setLuaPosY(int))
   89. [getLuaPosZ()](#getLuaPosZ())
   90. [setLuaPosZ(int)](#setLuaPosZ(int))
   91. [setSpawnRegion(String)](#setSpawnRegion(java.lang.String))
   92. [getSpawnRegion()](#getSpawnRegion())
   93. [getWorld()](#getWorld())
   94. [transmitWeather()](#transmitWeather())
   95. [isValidSquare(int, int, int)](#isValidSquare(int,int,int))
   96. [getRandomizedZoneList()](#getRandomizedZoneList())
   97. [getRandomizedZoneStoryByName(String)](#getRandomizedZoneStoryByName(java.lang.String))
   98. [getRandomizedBuildingList()](#getRandomizedBuildingList())
   99. [getRandomizedVehicleStoryList()](#getRandomizedVehicleStoryList())
   100. [getRandomizedVehicleStoryByName(String)](#getRandomizedVehicleStoryByName(java.lang.String))
   101. [getRBBasic()](#getRBBasic())
   102. [getRandomizedWorldBase()](#getRandomizedWorldBase())
   103. [getZombiesDisabled()](#getZombiesDisabled())
   104. [getZombiesEnabled()](#getZombiesEnabled())
   105. [getClimateManager()](#getClimateManager())
   106. [getPuddlesManager()](#getPuddlesManager())
   107. [getWorldVersion()](#getWorldVersion())
   108. [getSpawnedZombieZone()](#getSpawnedZombieZone())
   109. [getTimeSinceLastSurvivorInHorde()](#getTimeSinceLastSurvivorInHorde())
   110. [setTimeSinceLastSurvivorInHorde(int)](#setTimeSinceLastSurvivorInHorde(int))
   111. [getWorldAgeDays()](#getWorldAgeDays())
   112. [getAllTiles()](#getAllTiles())
   113. [getAllTilesName()](#getAllTilesName())
   114. [getAllTiles(String)](#getAllTiles(java.lang.String))
   115. [isHydroPowerOn()](#isHydroPowerOn())
   116. [setHydroPowerOn(boolean)](#setHydroPowerOn(boolean))
   117. [getTileImageNames()](#getTileImageNames())
   118. [parseDistributions()](#parseDistributions())
   119. [setRules(Rules)](#setRules(zombie.iso.worldgen.rules.Rules))
   120. [getRules()](#getRules())
   121. [setWgChunk(WorldGenChunk)](#setWgChunk(zombie.iso.worldgen.WorldGenChunk))
   122. [getWgChunk()](#getWgChunk())
   123. [setBlending(Blending)](#setBlending(zombie.iso.worldgen.blending.Blending))
   124. [getBlending()](#getBlending())
   125. [setAttachmentsHandler(AttachmentsHandler)](#setAttachmentsHandler(zombie.iso.worldgen.attachments.AttachmentsHandler))
   126. [getAttachmentsHandler()](#getAttachmentsHandler())
   127. [setZoneGenerator(ZoneGenerator)](#setZoneGenerator(zombie.iso.worldgen.zones.ZoneGenerator))
   128. [getZoneGenerator()](#getZoneGenerator())
   129. [setBiomeMap(BiomeMap)](#setBiomeMap(zombie.iso.worldgen.maps.BiomeMap))
   130. [getBiomeMap()](#getBiomeMap())
   131. [setZombieVoronois(List)](#setZombieVoronois(java.util.List))
   132. [getZombieVoronois()](#getZombieVoronois())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoWorld
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoWorld

---

public final class IsoWorld
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `IsoWorld.CompDistToPlayer`

  `private static class`

  `IsoWorld.CompScoreToPlayer`

  `class`

  `IsoWorld.Frame`

  `static class`

  `IsoWorld.MetaCell`

  `private static class`

  `IsoWorld.s_performance`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ArrayList<zombie.util.AddCoopPlayer>`

  `addCoopPlayers`

  `private final HashMap<String, ArrayList<String>>`

  `allTiles`

  `private final ArrayList<IsoAnimal>`

  `animalWithModel`

  `private final ArrayList<IsoAnimal>`

  `animalWithoutModel`

  `static CompletableFuture<Void>`

  `animationThread`

  `private zombie.iso.worldgen.attachments.AttachmentsHandler`

  `attachmentsHandler`

  `private zombie.iso.worldgen.maps.BiomeMap`

  `biomeMap`

  `private zombie.iso.worldgen.blending.Blending`

  `blending`

  `final ArrayList<IsoGameCharacter>`

  `characters`

  `private static final IsoWorld.CompScoreToPlayer`

  `compScoreToPlayer`

  `private final Vector2`

  `coneTempo1`

  `private final Vector2`

  `coneTempo2`

  `private final Vector2`

  `coneTempo3`

  `IsoCell`

  `currentCell`

  `private final ArrayList<BaseSoundEmitter>`

  `currentEmitters`

  `boolean`

  `doChunkMapUpdate`

  `private boolean`

  `drawWorld`

  `private final HashMap<BaseSoundEmitter, IsoObject>`

  `emitterOwners`

  `boolean`

  `emitterUpdate`

  `private long`

  `emitterUpdateMs`

  `private static final int`

  `FAKE_JUMBO_TREE_TILESET_INDEX`

  `private float`

  `flashIsoCursorA`

  `private boolean`

  `flashIsoCursorInc`

  `private int`

  `frameNo`

  `private final ArrayDeque<BaseSoundEmitter>`

  `freeEmitters`

  `final zombie.iso.Helicopter`

  `helicopter`

  `private boolean`

  `hydroPowerOn`

  `static IsoWorld`

  `instance`

  `private static final int`

  `JUMBO_TRUNK_VARIANT_COUNT`

  `private final boolean`

  `loaded`

  `static final long`

  `LUA_CHECKSUM_TIMEOUT_MS`

  `private SurvivorDesc`

  `luaDesc`

  `private int`

  `luaPosX`

  `private int`

  `luaPosY`

  `private int`

  `luaPosZ`

  `private final List<CharacterTrait>`

  `luatraits`

  `static String`

  `mapPath`

  `static boolean`

  `mapUseJar`

  `static final int`

  `MAX_TDEF_FILE_NUMBER_FOR_MODS`

  `final IsoMetaGrid`

  `metaGrid`

  `static final int`

  `MIN_TDEF_FILE_NUMBER_FOR_MODS`

  `static boolean`

  `noZombies`

  `private static final int`

  `NUM_TDEF_FILES_GT_1`

  `static final HashMap<String, ArrayList<String>>`

  `PropertyValueMap`

  `private final ArrayList<RandomizedBuildingBase>`

  `randomizedBuildingList`

  `private final ArrayList<RandomizedVehicleStoryBase>`

  `randomizedVehicleStoryList`

  `private final RandomizedWorldBase`

  `randomizedWorldBase`

  `private final ArrayList<RandomizedZoneStoryBase>`

  `randomizedZoneList`

  `private final RandomizedBuildingBase`

  `rbBasic`

  `private zombie.iso.worldgen.rules.Rules`

  `rules`

  `static int`

  `savedWorldVersion`

  `static int`

  `saveoffsetx`

  `static int`

  `saveoffsety`

  `zombie.iso.sprite.SkyBox`

  `sky`

  `private final HashMap<String, ArrayList<UUID>>`

  `spawnedZombieZone`

  `private String`

  `spawnRegionName`

  `HashMap<Integer, SurvivorDesc>`

  `survivorDescriptors`

  `int`

  `survivorSurvivalRecord`

  `private static final byte[]`

  `TDEF_FILE_MAGIC`

  `private static final int`

  `TDEF_VERSION_LATEST`

  `private static final int`

  `TDEF_VERSION1`

  `private final ArrayList<String>`

  `tileImages`

  `private static final int`

  `TILES_PER_FILE_1`

  `private static final int`

  `TILES_PER_FILE_OTHER`

  `private static final int`

  `TILES_PER_TILESET_1`

  `private static final int`

  `TILES_PER_TILESET_OTHER`

  `private static final int`

  `TILESETS_PER_FILE_1`

  `private static final int`

  `TILESETS_PER_FILE_OTHER`

  `private int`

  `timeSinceLastSurvivorInHorde`

  `private final zombie.entity.util.TimSort`

  `timSort`

  `int`

  `totalSurvivorNights`

  `int`

  `totalSurvivorsDead`

  `static int`

  `totalWorldVersion`

  `private int`

  `updateSafehousePlayers`

  `private String`

  `weather`

  `private zombie.iso.worldgen.WorldGenChunk`

  `wgChunk`

  `static final int`

  `WorldVersion`

  `static final int`

  `WorldVersion_42_13`

  `static final int`

  `WorldVersion_AlarmClock`

  `static final int`

  `WorldVersion_AlarmDecay`

  `static final int`

  `WorldVersion_AnimalHutch`

  `static final int`

  `WorldVersion_AnimalOnlineId`

  `static final int`

  `WorldVersion_AnimalPetTime`

  `static final int`

  `WorldVersion_AnimalRottingTexture`

  `static final int`

  `WorldVersion_AnimalWild`

  `static final int`

  `WorldVersion_BodyDamageSavePoulticeValues`

  `static final int`

  `WorldVersion_BodyDamageStatusesSync`

  `static final int`

  `WorldVersion_BuildMaterials`

  `static final int`

  `WorldVersion_CharacterDiscomfort`

  `static final int`

  `WorldVersion_CharacterVoiceOptions`

  `static final int`

  `WorldVersion_CharacterVoiceType`

  `static final int`

  `WorldVersion_ChunksAttachmentsPartial`

  `static final int`

  `WorldVersion_ChunksAttachmentsState`

  `static final int`

  `WorldVersion_ChunksWorldGeneratedBoolean`

  `static final int`

  `WorldVersion_ChunksWorldModifiedBoolean`

  `static final int`

  `WorldVersion_CraftLogicParallelCrafting`

  `static final int`

  `WorldVersion_CraftUpdateFoundations`

  `static final int`

  `WorldVersion_DeadBodyAnimalGenetics`

  `static final int`

  `WorldVersion_DesignationZone`

  `static final int`

  `WorldVersion_EnableWorldgen`

  `static final int`

  `WorldVersion_FastMoveCheat`

  `static final int`

  `WorldVersion_FishingCheat`

  `static final int`

  `WorldVersion_HutchAndVehicleAnimalFormat`

  `static final int`

  `WorldVersion_InventoryItemUsesInteger`

  `static final int`

  `WorldVersion_IsoCompostHealthValues`

  `static final int`

  `WorldVersion_ItemWorldRotationFloats`

  `static final int`

  `WorldVersion_LearnedRecipes`

  `static final int`

  `WorldVersion_MetaEntityOutsideAware`

  `static final int`

  `WorldVersion_ObjectID`

  `static final int`

  `WorldVersion_PlayerAutoDrink`

  `static final int`

  `WorldVersion_PlayerExtraInfoFlags`

  `static final int`

  `WorldVersion_PlayerInsulation`

  `static final int`

  `WorldVersion_PlayerSaveCraftingHistory`

  `static final int`

  `WorldVersion_PreviouslyMoved`

  `static final int`

  `WorldVersion_PrintMediaRottingCorpsesBodyDamage`

  `static final int`

  `WorldVersion_RecipesAndAmmoCheats`

  `static final int`

  `WorldVersion_RemoveDifficulty`

  `static final int`

  `WorldVersion_RootLocale`

  `static final int`

  `WorldVersion_SafeHouseCreatedTimeAndLocation`

  `static final int`

  `WorldVersion_SafeHouseHitPoints`

  `static final int`

  `WorldVersion_SaveFireTimer`

  `static final int`

  `WorldVersion_SavePlayerCheats`

  `static final int`

  `WorldVersion_SquareSeen`

  `static final int`

  `WorldVersion_Stats_Idleness`

  `static final int`

  `WorldVersion_ThermalDuration`

  `static final int`

  `WorldVersion_TrapExplosionDuration`

  `static final int`

  `WorldVersion_VariableCraftInputCounts`

  `static final int`

  `WorldVersion_VariableHeight`

  `static final int`

  `WorldVersion_VehicleAlarm`

  `static final int`

  `WorldVersion_VisitedFileVersion`

  `static final int`

  `WorldVersion_ZoneIDisUUID`

  `private static int`

  `worldX`

  `private static int`

  `worldY`

  `int`

  `x`

  `int`

  `y`

  `private List<zombie.iso.worldgen.zombie.ZombieVoronoi>`

  `zombieVoronois`

  `private final PZArrayList<IsoZombie>`

  `zombieWithModel`

  `private final PZArrayList<IsoZombie>`

  `zombieWithoutModel`

  `private zombie.iso.worldgen.zones.ZoneGenerator`

  `zoneGenerator`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWorld()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addJumboTreeTileset(IsoSpriteManager sprMan,
  int fileNumber,
  String type,
  String name,
  int tilesetNumber,
  int rows,
  int columns,
  int windType)`

  `private void`

  `addJumboTrunkTileset(IsoSpriteManager sprMan,
  int fileNumber,
  String type,
  int tilesetNumber)`

  `void`

  `addLuaTrait(CharacterTrait trait)`

  `void`

  `checkVehiclesZones()`

  `IsoSurvivor`

  `CreateRandomSurvivor(SurvivorDesc desc,
  IsoGridSquare sq,
  IsoPlayer player)`

  `void`

  `CreateSwarm(int num,
  int x1,
  int y1,
  int x2,
  int y2)`

  `private void`

  `DrawIsoCursorHelper()`

  Only draws when offScreenBuffer is off.

  `void`

  `DrawPlayerCone()`

  `void`

  `DrawPlayerCone2()`

  `void`

  `FinishAnimation()`

  `void`

  `ForceKillAllZombies()`

  `private void`

  `GenerateTilePropertyLookupTables()`

  `HashMap<String, ArrayList<String>>`

  `getAllTiles()`

  `ArrayList<String>`

  `getAllTiles(String filename)`

  `ArrayList<String>`

  `getAllTilesName()`

  `zombie.iso.worldgen.attachments.AttachmentsHandler`

  `getAttachmentsHandler()`

  `zombie.iso.worldgen.maps.BiomeMap`

  `getBiomeMap()`

  `zombie.iso.worldgen.blending.Blending`

  `getBlending()`

  `IsoCell`

  `getCell()`

  `ClimateManager`

  `getClimateManager()`

  `int`

  `getFrameNo()`

  `BaseSoundEmitter`

  `getFreeEmitter()`

  `BaseSoundEmitter`

  `getFreeEmitter(float x,
  float y,
  float z)`

  `String`

  `getGameMode()`

  `float`

  `getGlobalTemperature()`

  `SurvivorDesc`

  `getLuaPlayerDesc()`

  `int`

  `getLuaPosX()`

  `int`

  `getLuaPosY()`

  `int`

  `getLuaPosZ()`

  `int`

  `getLuaSpawnCellX()`

  `int`

  `getLuaSpawnCellY()`

  `List<CharacterTrait>`

  `getLuaTraits()`

  `String`

  `getMap()`

  `IsoMetaChunk`

  `getMetaChunk(int wx,
  int wy)`

  `IsoMetaChunk`

  `getMetaChunkFromTile(int wx,
  int wy)`

  `IsoMetaGrid`

  `getMetaGrid()`

  `String`

  `getPreset()`

  `IsoPuddles`

  `getPuddlesManager()`

  `ArrayList<RandomizedBuildingBase>`

  `getRandomizedBuildingList()`

  `RandomizedVehicleStoryBase`

  `getRandomizedVehicleStoryByName(String name)`

  `ArrayList<RandomizedVehicleStoryBase>`

  `getRandomizedVehicleStoryList()`

  `RandomizedWorldBase`

  `getRandomizedWorldBase()`

  `ArrayList<RandomizedZoneStoryBase>`

  `getRandomizedZoneList()`

  `RandomizedZoneStoryBase`

  `getRandomizedZoneStoryByName(String name)`

  `RandomizedBuildingBase`

  `getRBBasic()`

  `zombie.iso.worldgen.rules.Rules`

  `getRules()`

  `HashMap<String, ArrayList<UUID>>`

  `getSpawnedZombieZone()`

  `String`

  `getSpawnRegion()`

  `private int`

  `getSpriteID(int fileNumber,
  int tilesetNumber,
  int tileIndex)`

  `ArrayList<String>`

  `getTileImageNames()`

  `int`

  `getTimeSinceLastSurvivorInHorde()`

  `String`

  `getWeather()`

  `zombie.iso.worldgen.WorldGenChunk`

  `getWgChunk()`

  `String`

  `getWorld()`

  `float`

  `getWorldAgeDays()`

  `int`

  `getWorldSquareX()`

  `int`

  `getWorldSquareY()`

  `static int`

  `getWorldVersion()`

  `static boolean`

  `getZombiesDisabled()`

  `static boolean`

  `getZombiesEnabled()`

  `List<zombie.iso.worldgen.zombie.ZombieVoronoi>`

  `getZombieVoronois()`

  `zombie.iso.worldgen.zones.ZoneGenerator`

  `getZoneGenerator()`

  `void`

  `init()`

  `boolean`

  `isHydroPowerOn()`

  `boolean`

  `isValidSquare(int x,
  int y,
  int z)`

  `void`

  `KillCell()`

  `private void`

  `loadedTileDefinitions()`

  `boolean`

  `LoadPlayerForInfo()`

  `void`

  `LoadTileDefinitions(IsoSpriteManager sprMan,
  String filename,
  int fileNumber)`

  `void`

  `LoadTileDefinitionsPropertyStrings(IsoSpriteManager sprMan,
  String filename,
  int fileNumber)`

  `static void`

  `parseDistributions()`

  `private void`

  `PopulateCellWithSurvivors()`

  `static int`

  `readInt(InputStream in)`

  `static int`

  `readInt(RandomAccessFile in)`

  `static String`

  `readString(InputStream in,
  StringBuilder input)`

  `static String`

  `readString(RandomAccessFile in)`

  `(package private) int`

  `readWorldVersion()`

  `private void`

  `registerFakeJumboTree(IsoSpriteManager sprMan,
  int fileNumber)`

  `Zone`

  `registerMannequinZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `void`

  `registerNavZones()`

  `void`

  `registerRoomTone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `void`

  `registerSpawnOrigin(int x,
  int y,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerVehiclesZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `void`

  `registerWaterFlow(float x,
  float y,
  float flow,
  float speed)`

  `void`

  `registerWaterZone(float x1,
  float y1,
  float x2,
  float y2,
  float shore,
  float waterGround)`

  `Zone`

  `registerZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height)`

  `Zone`

  `registerZoneNoOverlap(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height)`

  Deprecated.

  `void`

  `removeZonesForLotDirectory(String lotDir)`

  `void`

  `render()`

  `private void`

  `renderInternal()`

  `private void`

  `renderPathfinding()`

  `void`

  `renderTerrain()`

  `private void`

  `renderVocals()`

  `private void`

  `renderWeatherFX()`

  `void`

  `returnOwnershipOfEmitter(BaseSoundEmitter emitter)`

  `private void`

  `saveMovableStats(Map<String, ArrayList<String>> names,
  int num,
  int onesprites,
  int singles,
  int multies,
  int totalsprites)`

  `void`

  `sceneCullAnimals()`

  `void`

  `sceneCullZombies()`

  `void`

  `setAttachmentsHandler(zombie.iso.worldgen.attachments.AttachmentsHandler attachmentsHandler)`

  `private void`

  `setBasementAllExplored(IsoBuilding spawnBuilding)`

  `void`

  `setBiomeMap(zombie.iso.worldgen.maps.BiomeMap biomeMap)`

  `void`

  `setBlending(zombie.iso.worldgen.blending.Blending blending)`

  `private void`

  `SetCustomPropertyValues()`

  `void`

  `setDrawWorld(boolean b)`

  `void`

  `setEmitterOwner(BaseSoundEmitter emitter,
  IsoObject object)`

  `void`

  `setGameMode(String mode)`

  `void`

  `setHydroPowerOn(boolean on)`

  `void`

  `setLuaPlayerDesc(SurvivorDesc desc)`

  `void`

  `setLuaPosX(int luaPosX)`

  `void`

  `setLuaPosY(int luaPosY)`

  `void`

  `setLuaPosZ(int luaPosZ)`

  `void`

  `setLuaSpawnCellX(int luaSpawnCellX)`

  Deprecated.

  `void`

  `setLuaSpawnCellY(int luaSpawnCellY)`

  Deprecated.

  `void`

  `setMap(String world)`

  `private void`

  `setOpenDoorProperties(String tilesheetName,
  ArrayList<IsoSprite> sprites)`

  `void`

  `setPreset(String mode)`

  `void`

  `setRules(zombie.iso.worldgen.rules.Rules rules)`

  `void`

  `setSpawnRegion(String spawnRegionName)`

  `void`

  `setTimeSinceLastSurvivorInHorde(int timeSinceLastSurvivorInHorde)`

  `void`

  `setWeather(String weather)`

  `void`

  `setWgChunk(zombie.iso.worldgen.WorldGenChunk wgChunk)`

  `void`

  `setWorld(String world)`

  `void`

  `setZombieVoronois(List<zombie.iso.worldgen.zombie.ZombieVoronoi> zombieVoronois)`

  `void`

  `setZoneGenerator(zombie.iso.worldgen.zones.ZoneGenerator zoneGenerator)`

  `void`

  `takeOwnershipOfEmitter(BaseSoundEmitter emitter)`

  `void`

  `transmitWeather()`

  `void`

  `update()`

  `private void`

  `updateBuildings()`

  `private void`

  `updateDBs()`

  `private void`

  `updateInternal()`

  `private void`

  `updateThread()`

  `private void`

  `updateWorld()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### TILESETS\_PER\_FILE\_1

    private static final int TILESETS\_PER\_FILE\_1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILESETS_PER_FILE_1)
  + ### TILES\_PER\_TILESET\_1

    private static final int TILES\_PER\_TILESET\_1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILES_PER_TILESET_1)
  + ### TILES\_PER\_FILE\_1

    private static final int TILES\_PER\_FILE\_1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILES_PER_FILE_1)
  + ### TILESETS\_PER\_FILE\_OTHER

    private static final int TILESETS\_PER\_FILE\_OTHER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILESETS_PER_FILE_OTHER)
  + ### TILES\_PER\_TILESET\_OTHER

    private static final int TILES\_PER\_TILESET\_OTHER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILES_PER_TILESET_OTHER)
  + ### TILES\_PER\_FILE\_OTHER

    private static final int TILES\_PER\_FILE\_OTHER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TILES_PER_FILE_OTHER)
  + ### NUM\_TDEF\_FILES\_GT\_1

    private static final int NUM\_TDEF\_FILES\_GT\_1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.NUM_TDEF_FILES_GT_1)
  + ### MIN\_TDEF\_FILE\_NUMBER\_FOR\_MODS

    public static final int MIN\_TDEF\_FILE\_NUMBER\_FOR\_MODS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.MIN_TDEF_FILE_NUMBER_FOR_MODS)
  + ### MAX\_TDEF\_FILE\_NUMBER\_FOR\_MODS

    public static final int MAX\_TDEF\_FILE\_NUMBER\_FOR\_MODS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.MAX_TDEF_FILE_NUMBER_FOR_MODS)
  + ### TDEF\_VERSION1

    private static final int TDEF\_VERSION1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TDEF_VERSION1)
  + ### TDEF\_VERSION\_LATEST

    private static final int TDEF\_VERSION\_LATEST

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.TDEF_VERSION_LATEST)
  + ### TDEF\_FILE\_MAGIC

    private static final byte[] TDEF\_FILE\_MAGIC
  + ### LUA\_CHECKSUM\_TIMEOUT\_MS

    public static final long LUA\_CHECKSUM\_TIMEOUT\_MS
  + ### weather

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weather
  + ### metaGrid

    public final [IsoMetaGrid](IsoMetaGrid.html "class in zombie.iso") metaGrid
  + ### randomizedBuildingList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedBuildingBase](../randomizedWorld/randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")> randomizedBuildingList
  + ### randomizedZoneList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedZoneStoryBase](../randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory")> randomizedZoneList
  + ### randomizedVehicleStoryList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedVehicleStoryBase](../randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory")> randomizedVehicleStoryList
  + ### rbBasic

    private final [RandomizedBuildingBase](../randomizedWorld/randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding") rbBasic
  + ### randomizedWorldBase

    private final [RandomizedWorldBase](../randomizedWorld/RandomizedWorldBase.html "class in zombie.randomizedWorld") randomizedWorldBase
  + ### spawnedZombieZone

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UUID](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/UUID.html "class or interface in java.util")>> spawnedZombieZone
  + ### allTiles

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> allTiles
  + ### tileImages

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tileImages
  + ### flashIsoCursorA

    private float flashIsoCursorA
  + ### flashIsoCursorInc

    private boolean flashIsoCursorInc
  + ### sky

    public zombie.iso.sprite.SkyBox sky
  + ### timeSinceLastSurvivorInHorde

    private int timeSinceLastSurvivorInHorde
  + ### frameNo

    private int frameNo
  + ### helicopter

    public final zombie.iso.Helicopter helicopter
  + ### hydroPowerOn

    private boolean hydroPowerOn
  + ### characters

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> characters
  + ### freeEmitters

    private final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio")> freeEmitters
  + ### currentEmitters

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio")> currentEmitters
  + ### emitterOwners

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio"), [IsoObject](IsoObject.html "class in zombie.iso")> emitterOwners
  + ### x

    public int x
  + ### y

    public int y
  + ### currentCell

    public [IsoCell](IsoCell.html "class in zombie.iso") currentCell
  + ### instance

    public static [IsoWorld](IsoWorld.html "class in zombie.iso") instance
  + ### totalSurvivorsDead

    public int totalSurvivorsDead
  + ### totalSurvivorNights

    public int totalSurvivorNights
  + ### survivorSurvivalRecord

    public int survivorSurvivalRecord
  + ### survivorDescriptors

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters")> survivorDescriptors
  + ### addCoopPlayers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.util.AddCoopPlayer> addCoopPlayers
  + ### compScoreToPlayer

    private static final [IsoWorld.CompScoreToPlayer](IsoWorld.CompScoreToPlayer.html "class in zombie.iso") compScoreToPlayer
  + ### mapPath

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapPath
  + ### mapUseJar

    public static boolean mapUseJar
  + ### loaded

    private final boolean loaded

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.loaded)
  + ### PropertyValueMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> PropertyValueMap
  + ### JUMBO\_TRUNK\_VARIANT\_COUNT

    private static final int JUMBO\_TRUNK\_VARIANT\_COUNT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.JUMBO_TRUNK_VARIANT_COUNT)
  + ### FAKE\_JUMBO\_TREE\_TILESET\_INDEX

    private static final int FAKE\_JUMBO\_TREE\_TILESET\_INDEX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.FAKE_JUMBO_TREE_TILESET_INDEX)
  + ### worldX

    private static int worldX
  + ### worldY

    private static int worldY
  + ### luaDesc

    private [SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") luaDesc
  + ### luatraits

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> luatraits
  + ### luaPosX

    private int luaPosX
  + ### luaPosY

    private int luaPosY
  + ### luaPosZ

    private int luaPosZ
  + ### spawnRegionName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spawnRegionName
  + ### WorldVersion

    public static final int WorldVersion

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion)
  + ### WorldVersion\_PreviouslyMoved

    public static final int WorldVersion\_PreviouslyMoved

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PreviouslyMoved)
  + ### WorldVersion\_DesignationZone

    public static final int WorldVersion\_DesignationZone

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_DesignationZone)
  + ### WorldVersion\_PlayerExtraInfoFlags

    public static final int WorldVersion\_PlayerExtraInfoFlags

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PlayerExtraInfoFlags)
  + ### WorldVersion\_ObjectID

    public static final int WorldVersion\_ObjectID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ObjectID)
  + ### WorldVersion\_CraftUpdateFoundations

    public static final int WorldVersion\_CraftUpdateFoundations

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_CraftUpdateFoundations)
  + ### WorldVersion\_AlarmDecay

    public static final int WorldVersion\_AlarmDecay

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AlarmDecay)
  + ### WorldVersion\_FishingCheat

    public static final int WorldVersion\_FishingCheat

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_FishingCheat)
  + ### WorldVersion\_CharacterVoiceType

    public static final int WorldVersion\_CharacterVoiceType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_CharacterVoiceType)
  + ### WorldVersion\_AnimalHutch

    public static final int WorldVersion\_AnimalHutch

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AnimalHutch)
  + ### WorldVersion\_AlarmClock

    public static final int WorldVersion\_AlarmClock

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AlarmClock)
  + ### WorldVersion\_VariableHeight

    public static final int WorldVersion\_VariableHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_VariableHeight)
  + ### WorldVersion\_EnableWorldgen

    public static final int WorldVersion\_EnableWorldgen

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_EnableWorldgen)
  + ### WorldVersion\_CharacterVoiceOptions

    public static final int WorldVersion\_CharacterVoiceOptions

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_CharacterVoiceOptions)
  + ### WorldVersion\_ChunksWorldGeneratedBoolean

    public static final int WorldVersion\_ChunksWorldGeneratedBoolean

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ChunksWorldGeneratedBoolean)
  + ### WorldVersion\_ChunksWorldModifiedBoolean

    public static final int WorldVersion\_ChunksWorldModifiedBoolean

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ChunksWorldModifiedBoolean)
  + ### WorldVersion\_CharacterDiscomfort

    public static final int WorldVersion\_CharacterDiscomfort

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_CharacterDiscomfort)
  + ### WorldVersion\_HutchAndVehicleAnimalFormat

    public static final int WorldVersion\_HutchAndVehicleAnimalFormat

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_HutchAndVehicleAnimalFormat)
  + ### WorldVersion\_IsoCompostHealthValues

    public static final int WorldVersion\_IsoCompostHealthValues

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_IsoCompostHealthValues)
  + ### WorldVersion\_ChunksAttachmentsState

    public static final int WorldVersion\_ChunksAttachmentsState

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ChunksAttachmentsState)
  + ### WorldVersion\_ZoneIDisUUID

    public static final int WorldVersion\_ZoneIDisUUID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ZoneIDisUUID)
  + ### WorldVersion\_SafeHouseHitPoints

    public static final int WorldVersion\_SafeHouseHitPoints

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_SafeHouseHitPoints)
  + ### WorldVersion\_FastMoveCheat

    public static final int WorldVersion\_FastMoveCheat

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_FastMoveCheat)
  + ### WorldVersion\_SquareSeen

    public static final int WorldVersion\_SquareSeen

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_SquareSeen)
  + ### WorldVersion\_TrapExplosionDuration

    public static final int WorldVersion\_TrapExplosionDuration

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_TrapExplosionDuration)
  + ### WorldVersion\_InventoryItemUsesInteger

    public static final int WorldVersion\_InventoryItemUsesInteger

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_InventoryItemUsesInteger)
  + ### WorldVersion\_ChunksAttachmentsPartial

    public static final int WorldVersion\_ChunksAttachmentsPartial

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ChunksAttachmentsPartial)
  + ### WorldVersion\_PrintMediaRottingCorpsesBodyDamage

    public static final int WorldVersion\_PrintMediaRottingCorpsesBodyDamage

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PrintMediaRottingCorpsesBodyDamage)
  + ### WorldVersion\_SafeHouseCreatedTimeAndLocation

    public static final int WorldVersion\_SafeHouseCreatedTimeAndLocation

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_SafeHouseCreatedTimeAndLocation)
  + ### WorldVersion\_Stats\_Idleness

    public static final int WorldVersion\_Stats\_Idleness

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_Stats_Idleness)
  + ### WorldVersion\_AnimalRottingTexture

    public static final int WorldVersion\_AnimalRottingTexture

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AnimalRottingTexture)
  + ### WorldVersion\_LearnedRecipes

    public static final int WorldVersion\_LearnedRecipes

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_LearnedRecipes)
  + ### WorldVersion\_BodyDamageSavePoulticeValues

    public static final int WorldVersion\_BodyDamageSavePoulticeValues

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_BodyDamageSavePoulticeValues)
  + ### WorldVersion\_PlayerSaveCraftingHistory

    public static final int WorldVersion\_PlayerSaveCraftingHistory

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PlayerSaveCraftingHistory)
  + ### WorldVersion\_VehicleAlarm

    public static final int WorldVersion\_VehicleAlarm

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_VehicleAlarm)
  + ### WorldVersion\_RecipesAndAmmoCheats

    public static final int WorldVersion\_RecipesAndAmmoCheats

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_RecipesAndAmmoCheats)
  + ### WorldVersion\_SavePlayerCheats

    public static final int WorldVersion\_SavePlayerCheats

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_SavePlayerCheats)
  + ### WorldVersion\_ItemWorldRotationFloats

    public static final int WorldVersion\_ItemWorldRotationFloats

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ItemWorldRotationFloats)
  + ### WorldVersion\_MetaEntityOutsideAware

    public static final int WorldVersion\_MetaEntityOutsideAware

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_MetaEntityOutsideAware)
  + ### WorldVersion\_VisitedFileVersion

    public static final int WorldVersion\_VisitedFileVersion

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_VisitedFileVersion)
  + ### WorldVersion\_VariableCraftInputCounts

    public static final int WorldVersion\_VariableCraftInputCounts

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_VariableCraftInputCounts)
  + ### WorldVersion\_AnimalPetTime

    public static final int WorldVersion\_AnimalPetTime

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AnimalPetTime)
  + ### WorldVersion\_RootLocale

    public static final int WorldVersion\_RootLocale

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_RootLocale)
  + ### WorldVersion\_CraftLogicParallelCrafting

    public static final int WorldVersion\_CraftLogicParallelCrafting

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_CraftLogicParallelCrafting)
  + ### WorldVersion\_PlayerAutoDrink

    public static final int WorldVersion\_PlayerAutoDrink

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PlayerAutoDrink)
  + ### WorldVersion\_42\_13

    public static final int WorldVersion\_42\_13

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_42_13)
  + ### WorldVersion\_PlayerInsulation

    public static final int WorldVersion\_PlayerInsulation

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_PlayerInsulation)
  + ### WorldVersion\_SaveFireTimer

    public static final int WorldVersion\_SaveFireTimer

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_SaveFireTimer)
  + ### WorldVersion\_BodyDamageStatusesSync

    public static final int WorldVersion\_BodyDamageStatusesSync

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_BodyDamageStatusesSync)
  + ### WorldVersion\_RemoveDifficulty

    public static final int WorldVersion\_RemoveDifficulty

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_RemoveDifficulty)
  + ### WorldVersion\_AnimalWild

    public static final int WorldVersion\_AnimalWild

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AnimalWild)
  + ### WorldVersion\_DeadBodyAnimalGenetics

    public static final int WorldVersion\_DeadBodyAnimalGenetics

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_DeadBodyAnimalGenetics)
  + ### WorldVersion\_AnimalOnlineId

    public static final int WorldVersion\_AnimalOnlineId

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_AnimalOnlineId)
  + ### WorldVersion\_BuildMaterials

    public static final int WorldVersion\_BuildMaterials

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_BuildMaterials)
  + ### WorldVersion\_ThermalDuration

    public static final int WorldVersion\_ThermalDuration

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoWorld.WorldVersion_ThermalDuration)
  + ### savedWorldVersion

    public static int savedWorldVersion
  + ### drawWorld

    private boolean drawWorld
  + ### zombieWithModel

    private final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> zombieWithModel
  + ### zombieWithoutModel

    private final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> zombieWithoutModel
  + ### timSort

    private final zombie.entity.util.TimSort timSort
  + ### animalWithModel

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animalWithModel
  + ### animalWithoutModel

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animalWithoutModel
  + ### coneTempo1

    private final [Vector2](Vector2.html "class in zombie.iso") coneTempo1
  + ### coneTempo2

    private final [Vector2](Vector2.html "class in zombie.iso") coneTempo2
  + ### coneTempo3

    private final [Vector2](Vector2.html "class in zombie.iso") coneTempo3
  + ### noZombies

    public static boolean noZombies
  + ### totalWorldVersion

    public static int totalWorldVersion
  + ### saveoffsetx

    public static int saveoffsetx
  + ### saveoffsety

    public static int saveoffsety
  + ### doChunkMapUpdate

    public boolean doChunkMapUpdate
  + ### emitterUpdateMs

    private long emitterUpdateMs
  + ### emitterUpdate

    public boolean emitterUpdate
  + ### updateSafehousePlayers

    private int updateSafehousePlayers
  + ### animationThread

    public static [CompletableFuture](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/CompletableFuture.html "class or interface in java.util.concurrent")<[Void](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Void.html "class or interface in java.lang")> animationThread
  + ### rules

    private zombie.iso.worldgen.rules.Rules rules
  + ### wgChunk

    private zombie.iso.worldgen.WorldGenChunk wgChunk
  + ### blending

    private zombie.iso.worldgen.blending.Blending blending
  + ### attachmentsHandler

    private zombie.iso.worldgen.attachments.AttachmentsHandler attachmentsHandler
  + ### zoneGenerator

    private zombie.iso.worldgen.zones.ZoneGenerator zoneGenerator
  + ### biomeMap

    private zombie.iso.worldgen.maps.BiomeMap biomeMap
  + ### zombieVoronois

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.zombie.ZombieVoronoi> zombieVoronois
* Constructor Details
  -------------------

  + ### IsoWorld

    public IsoWorld()
* Method Details
  --------------

  + ### getMetaGrid

    public [IsoMetaGrid](IsoMetaGrid.html "class in zombie.iso") getMetaGrid()
  + ### registerZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height)
  + ### registerNavZones

    public void registerNavZones()
  + ### registerZoneNoOverlap

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZoneNoOverlap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height)

    Deprecated.
  + ### removeZonesForLotDirectory

    public void removeZonesForLotDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lotDir)
  + ### getFreeEmitter

    public [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") getFreeEmitter()
  + ### getFreeEmitter

    public [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") getFreeEmitter(float x,
    float y,
    float z)
  + ### takeOwnershipOfEmitter

    public void takeOwnershipOfEmitter([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### setEmitterOwner

    public void setEmitterOwner([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter,
    [IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### returnOwnershipOfEmitter

    public void returnOwnershipOfEmitter([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### registerVehiclesZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerVehiclesZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerMannequinZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerMannequinZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerRoomTone

    public void registerRoomTone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerSpawnOrigin

    public void registerSpawnOrigin(int x,
    int y,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerWaterFlow

    public void registerWaterFlow(float x,
    float y,
    float flow,
    float speed)
  + ### registerWaterZone

    public void registerWaterZone(float x1,
    float y1,
    float x2,
    float y2,
    float shore,
    float waterGround)
  + ### checkVehiclesZones

    public void checkVehiclesZones()
  + ### setGameMode

    public void setGameMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mode)
  + ### getGameMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGameMode()
  + ### setPreset

    public void setPreset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mode)
  + ### getPreset

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPreset()
  + ### setWorld

    public void setWorld([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world)
  + ### setMap

    public void setMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world)
  + ### getMap

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMap()
  + ### renderTerrain

    public void renderTerrain()
  + ### getFrameNo

    public int getFrameNo()
  + ### CreateRandomSurvivor

    public [IsoSurvivor](../characters/IsoSurvivor.html "class in zombie.characters") CreateRandomSurvivor([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### CreateSwarm

    public void CreateSwarm(int num,
    int x1,
    int y1,
    int x2,
    int y2)
  + ### ForceKillAllZombies

    public void ForceKillAllZombies()
  + ### readInt

    public static int readInt([RandomAccessFile](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/RandomAccessFile.html "class or interface in java.io") in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### readString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") readString([RandomAccessFile](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/RandomAccessFile.html "class or interface in java.io") in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### readInt

    public static int readInt([InputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/InputStream.html "class or interface in java.io") in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### readString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") readString([InputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/InputStream.html "class or interface in java.io") in,
    [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getSpriteID

    private int getSpriteID(int fileNumber,
    int tilesetNumber,
    int tileIndex)
  + ### LoadTileDefinitions

    public void LoadTileDefinitions([IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMan,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int fileNumber)
  + ### GenerateTilePropertyLookupTables

    private void GenerateTilePropertyLookupTables()
  + ### LoadTileDefinitionsPropertyStrings

    public void LoadTileDefinitionsPropertyStrings([IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMan,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int fileNumber)
  + ### SetCustomPropertyValues

    private void SetCustomPropertyValues()
  + ### setOpenDoorProperties

    private void setOpenDoorProperties([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesheetName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite")> sprites)
  + ### saveMovableStats

    private void saveMovableStats([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> names,
    int num,
    int onesprites,
    int singles,
    int multies,
    int totalsprites)
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
  + ### addJumboTreeTileset

    private void addJumboTreeTileset([IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMan,
    int fileNumber,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int tilesetNumber,
    int rows,
    int columns,
    int windType)
  + ### addJumboTrunkTileset

    private void addJumboTrunkTileset([IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMan,
    int fileNumber,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int tilesetNumber)
  + ### registerFakeJumboTree

    private void registerFakeJumboTree([IsoSpriteManager](sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMan,
    int fileNumber)
  + ### loadedTileDefinitions

    private void loadedTileDefinitions()
  + ### LoadPlayerForInfo

    public boolean LoadPlayerForInfo()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
  + ### init

    public void init()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io"),
    zombie.world.WorldDictionaryException

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
    :   `zombie.world.WorldDictionaryException`
  + ### setBasementAllExplored

    private void setBasementAllExplored([IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") spawnBuilding)
  + ### readWorldVersion

    int readWorldVersion()
  + ### getLuaTraits

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> getLuaTraits()
  + ### addLuaTrait

    public void addLuaTrait([CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") trait)
  + ### getLuaPlayerDesc

    public [SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") getLuaPlayerDesc()
  + ### setLuaPlayerDesc

    public void setLuaPlayerDesc([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### KillCell

    public void KillCell()
  + ### setDrawWorld

    public void setDrawWorld(boolean b)
  + ### sceneCullZombies

    public void sceneCullZombies()
  + ### sceneCullAnimals

    public void sceneCullAnimals()
  + ### render

    public void render()
  + ### renderInternal

    private void renderInternal()
  + ### renderPathfinding

    private void renderPathfinding()
  + ### renderVocals

    private void renderVocals()
  + ### renderWeatherFX

    private void renderWeatherFX()
  + ### DrawPlayerCone

    public void DrawPlayerCone()
  + ### DrawPlayerCone2

    public void DrawPlayerCone2()
  + ### DrawIsoCursorHelper

    private void DrawIsoCursorHelper()

    Only draws when offScreenBuffer is off. The flat circle with vertical line.
    |
    o
  + ### updateWorld

    private void updateWorld()
  + ### FinishAnimation

    public void FinishAnimation()
  + ### update

    public void update()
  + ### updateInternal

    private void updateInternal()
  + ### updateThread

    private void updateThread()
  + ### updateBuildings

    private void updateBuildings()
  + ### updateDBs

    private void updateDBs()
  + ### getCell

    public [IsoCell](IsoCell.html "class in zombie.iso") getCell()
  + ### PopulateCellWithSurvivors

    private void PopulateCellWithSurvivors()
  + ### getWorldSquareY

    public int getWorldSquareY()
  + ### getWorldSquareX

    public int getWorldSquareX()
  + ### getMetaChunk

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getMetaChunk(int wx,
    int wy)
  + ### getMetaChunkFromTile

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getMetaChunkFromTile(int wx,
    int wy)
  + ### getGlobalTemperature

    public float getGlobalTemperature()
  + ### getWeather

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWeather()
  + ### setWeather

    public void setWeather([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weather)
  + ### getLuaSpawnCellX

    public int getLuaSpawnCellX()
  + ### setLuaSpawnCellX

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setLuaSpawnCellX(int luaSpawnCellX)

    Deprecated.
  + ### getLuaSpawnCellY

    public int getLuaSpawnCellY()
  + ### setLuaSpawnCellY

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setLuaSpawnCellY(int luaSpawnCellY)

    Deprecated.
  + ### getLuaPosX

    public int getLuaPosX()
  + ### setLuaPosX

    public void setLuaPosX(int luaPosX)
  + ### getLuaPosY

    public int getLuaPosY()
  + ### setLuaPosY

    public void setLuaPosY(int luaPosY)
  + ### getLuaPosZ

    public int getLuaPosZ()
  + ### setLuaPosZ

    public void setLuaPosZ(int luaPosZ)
  + ### setSpawnRegion

    public void setSpawnRegion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spawnRegionName)
  + ### getSpawnRegion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpawnRegion()
  + ### getWorld

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorld()
  + ### transmitWeather

    public void transmitWeather()
  + ### isValidSquare

    public boolean isValidSquare(int x,
    int y,
    int z)
  + ### getRandomizedZoneList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedZoneStoryBase](../randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory")> getRandomizedZoneList()
  + ### getRandomizedZoneStoryByName

    public [RandomizedZoneStoryBase](../randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") getRandomizedZoneStoryByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRandomizedBuildingList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedBuildingBase](../randomizedWorld/randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")> getRandomizedBuildingList()
  + ### getRandomizedVehicleStoryList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedVehicleStoryBase](../randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory")> getRandomizedVehicleStoryList()
  + ### getRandomizedVehicleStoryByName

    public [RandomizedVehicleStoryBase](../randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory") getRandomizedVehicleStoryByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRBBasic

    public [RandomizedBuildingBase](../randomizedWorld/randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding") getRBBasic()
  + ### getRandomizedWorldBase

    public [RandomizedWorldBase](../randomizedWorld/RandomizedWorldBase.html "class in zombie.randomizedWorld") getRandomizedWorldBase()
  + ### getZombiesDisabled

    public static boolean getZombiesDisabled()
  + ### getZombiesEnabled

    public static boolean getZombiesEnabled()
  + ### getClimateManager

    public [ClimateManager](weather/ClimateManager.html "class in zombie.iso.weather") getClimateManager()
  + ### getPuddlesManager

    public [IsoPuddles](IsoPuddles.html "class in zombie.iso") getPuddlesManager()
  + ### getWorldVersion

    public static int getWorldVersion()
  + ### getSpawnedZombieZone

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UUID](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/UUID.html "class or interface in java.util")>> getSpawnedZombieZone()
  + ### getTimeSinceLastSurvivorInHorde

    public int getTimeSinceLastSurvivorInHorde()
  + ### setTimeSinceLastSurvivorInHorde

    public void setTimeSinceLastSurvivorInHorde(int timeSinceLastSurvivorInHorde)
  + ### getWorldAgeDays

    public float getWorldAgeDays()
  + ### getAllTiles

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> getAllTiles()
  + ### getAllTilesName

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllTilesName()
  + ### getAllTiles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllTiles([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### isHydroPowerOn

    public boolean isHydroPowerOn()
  + ### setHydroPowerOn

    public void setHydroPowerOn(boolean on)
  + ### getTileImageNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTileImageNames()
  + ### parseDistributions

    public static void parseDistributions()
  + ### setRules

    public void setRules(zombie.iso.worldgen.rules.Rules rules)
  + ### getRules

    public zombie.iso.worldgen.rules.Rules getRules()
  + ### setWgChunk

    public void setWgChunk(zombie.iso.worldgen.WorldGenChunk wgChunk)
  + ### getWgChunk

    public zombie.iso.worldgen.WorldGenChunk getWgChunk()
  + ### setBlending

    public void setBlending(zombie.iso.worldgen.blending.Blending blending)
  + ### getBlending

    public zombie.iso.worldgen.blending.Blending getBlending()
  + ### setAttachmentsHandler

    public void setAttachmentsHandler(zombie.iso.worldgen.attachments.AttachmentsHandler attachmentsHandler)
  + ### getAttachmentsHandler

    public zombie.iso.worldgen.attachments.AttachmentsHandler getAttachmentsHandler()
  + ### setZoneGenerator

    public void setZoneGenerator(zombie.iso.worldgen.zones.ZoneGenerator zoneGenerator)
  + ### getZoneGenerator

    public zombie.iso.worldgen.zones.ZoneGenerator getZoneGenerator()
  + ### setBiomeMap

    public void setBiomeMap(zombie.iso.worldgen.maps.BiomeMap biomeMap)
  + ### getBiomeMap

    public zombie.iso.worldgen.maps.BiomeMap getBiomeMap()
  + ### setZombieVoronois

    public void setZombieVoronois([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.zombie.ZombieVoronoi> zombieVoronois)
  + ### getZombieVoronois

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.zombie.ZombieVoronoi> getZombieVoronois()