[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaManager](LuaManager.html)
3. [GlobalObject](LuaManager.GlobalObject.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [outStream](#outStream)
   2. [inStream](#inStream)
   3. [inFileReader](#inFileReader)
   4. [inBufferedReader](#inBufferedReader)
   5. [timeLastRefresh](#timeLastRefresh)
   6. [timSortComparator](#timSortComparator)
7. [Constructor Details](#constructor-detail)
   1. [GlobalObject()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [loadVehicleModel(String, String, String)](#loadVehicleModel(java.lang.String,java.lang.String,java.lang.String))
   2. [loadStaticZomboidModel(String, String, String)](#loadStaticZomboidModel(java.lang.String,java.lang.String,java.lang.String))
   3. [loadSkinnedZomboidModel(String, String, String)](#loadSkinnedZomboidModel(java.lang.String,java.lang.String,java.lang.String))
   4. [loadZomboidModel(String, String, String, String, boolean)](#loadZomboidModel(java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean))
   5. [setModelMetaData(String, String, String, String, boolean)](#setModelMetaData(java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean))
   6. [reloadModelsMatching(String)](#reloadModelsMatching(java.lang.String))
   7. [getSLSoundManager()](#getSLSoundManager())
   8. [getRadioAPI()](#getRadioAPI())
   9. [getBehaviourDebugPlayer()](#getBehaviourDebugPlayer())
   10. [setBehaviorStep(boolean)](#setBehaviorStep(boolean))
   11. [getPuddlesManager()](#getPuddlesManager())
   12. [getAllAnimalsDefinitions()](#getAllAnimalsDefinitions())
   13. [setPuddles(float)](#setPuddles(float))
   14. [fastfloor(float)](#fastfloor(float))
   15. [getZomboidRadio()](#getZomboidRadio())
   16. [getRandomUUID()](#getRandomUUID())
   17. [sendItemListNet(IsoPlayer, ArrayList, IsoPlayer, String, String)](#sendItemListNet(zombie.characters.IsoPlayer,java.util.ArrayList,zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   18. [convertToPZNetTable(KahluaTable)](#convertToPZNetTable(se.krka.kahlua.vm.KahluaTable))
   19. [instof(Object, String)](#instof(java.lang.Object,java.lang.String))
   20. [typeof(Object)](#typeof(java.lang.Object))
   21. [getClassSimpleName(Object)](#getClassSimpleName(java.lang.Object))
   22. [serverConnect(String, String, String, String, String, String, String, boolean, boolean, int, String)](#serverConnect(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean,boolean,int,java.lang.String))
   23. [serverConnectCoop(String)](#serverConnectCoop(java.lang.String))
   24. [sendPing()](#sendPing())
   25. [connectionManagerLog(String, String)](#connectionManagerLog(java.lang.String,java.lang.String))
   26. [forceDisconnect()](#forceDisconnect())
   27. [checkPermissions(IsoPlayer, Capability)](#checkPermissions(zombie.characters.IsoPlayer,zombie.characters.Capability))
   28. [backToSinglePlayer()](#backToSinglePlayer())
   29. [isIngameState()](#isIngameState())
   30. [getPerformanceLocal()](#getPerformanceLocal())
   31. [getNetworkLocal()](#getNetworkLocal())
   32. [getGameLocal()](#getGameLocal())
   33. [getPerformanceRemote()](#getPerformanceRemote())
   34. [getNetworkRemote()](#getNetworkRemote())
   35. [getGameRemote()](#getGameRemote())
   36. [toggleStatisticsTransmission()](#toggleStatisticsTransmission())
   37. [getMPStatus()](#getMPStatus())
   38. [canConnect()](#canConnect())
   39. [getReconnectCountdownTimer()](#getReconnectCountdownTimer())
   40. [sendAnimalGenome(IsoAnimal)](#sendAnimalGenome(zombie.characters.animals.IsoAnimal))
   41. [addAnimal(IsoCell, int, int, int, String, AnimalBreed, boolean)](#addAnimal(zombie.iso.IsoCell,int,int,int,java.lang.String,zombie.characters.animals.datas.AnimalBreed,boolean))
   42. [addAnimal(IsoCell, int, int, int, String, AnimalBreed)](#addAnimal(zombie.iso.IsoCell,int,int,int,java.lang.String,zombie.characters.animals.datas.AnimalBreed))
   43. [removeAnimal(int)](#removeAnimal(int))
   44. [getFakeAttacker()](#getFakeAttacker())
   45. [sendHitZombie(IsoPlayer)](#sendHitZombie(zombie.characters.IsoPlayer))
   46. [sendHitPlayer(IsoPlayer, String, String)](#sendHitPlayer(zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   47. [sendHitVehicle(IsoGameCharacter, String, boolean, String)](#sendHitVehicle(zombie.characters.IsoGameCharacter,java.lang.String,boolean,java.lang.String))
   48. [requestUsers()](#requestUsers())
   49. [requestPVPEvents()](#requestPVPEvents())
   50. [clearPVPEvents()](#clearPVPEvents())
   51. [getUsers()](#getUsers())
   52. [networkUserAction(String, String, String)](#networkUserAction(java.lang.String,java.lang.String,java.lang.String))
   53. [banUnbanUserAction(String, String, String)](#banUnbanUserAction(java.lang.String,java.lang.String,java.lang.String))
   54. [teleportUserAction(String, String, String)](#teleportUserAction(java.lang.String,java.lang.String,java.lang.String))
   55. [teleportToHimUserAction(String, String, String)](#teleportToHimUserAction(java.lang.String,java.lang.String,java.lang.String))
   56. [requestRoles()](#requestRoles())
   57. [getRoles()](#getRoles())
   58. [getCapabilities()](#getCapabilities())
   59. [addRole(String)](#addRole(java.lang.String))
   60. [setupRole(Role, String, Color, KahluaTable)](#setupRole(zombie.characters.Role,java.lang.String,zombie.core.Color,se.krka.kahlua.vm.KahluaTable))
   61. [deleteRole(String)](#deleteRole(java.lang.String))
   62. [setDefaultRoleFor(String, String)](#setDefaultRoleFor(java.lang.String,java.lang.String))
   63. [moveRole(byte, String)](#moveRole(byte,java.lang.String))
   64. [getWarNearest()](#getWarNearest())
   65. [getWars()](#getWars())
   66. [getHutch(int, int, int)](#getHutch(int,int,int))
   67. [getAnimal(int)](#getAnimal(int))
   68. [sendAddAnimalFromHandsInTrailer(IsoAnimal, IsoPlayer, BaseVehicle)](#sendAddAnimalFromHandsInTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   69. [sendAddAnimalFromHandsInTrailer(IsoDeadBody, IsoPlayer, BaseVehicle)](#sendAddAnimalFromHandsInTrailer(zombie.iso.objects.IsoDeadBody,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   70. [sendAddAnimalInTrailer(IsoAnimal, IsoPlayer, BaseVehicle)](#sendAddAnimalInTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   71. [sendAddAnimalInTrailer(IsoDeadBody, IsoPlayer, BaseVehicle)](#sendAddAnimalInTrailer(zombie.iso.objects.IsoDeadBody,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   72. [sendRemoveAnimalFromTrailer(IsoAnimal, IsoPlayer, BaseVehicle)](#sendRemoveAnimalFromTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   73. [sendRemoveAndGrabAnimalFromTrailer(IsoAnimal, IsoPlayer, BaseVehicle, InventoryItem)](#sendRemoveAndGrabAnimalFromTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle,zombie.inventory.InventoryItem))
   74. [sendRemoveAndGrabAnimalFromTrailer(IsoDeadBody, IsoPlayer, BaseVehicle, InventoryItem)](#sendRemoveAndGrabAnimalFromTrailer(zombie.iso.objects.IsoDeadBody,zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle,zombie.inventory.InventoryItem))
   75. [sendPickupAnimal(IsoAnimal, IsoPlayer, AnimalInventoryItem)](#sendPickupAnimal(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.inventory.types.AnimalInventoryItem))
   76. [sendPickupAnimalFromTrap(IsoAnimal, IsoPlayer, AnimalInventoryItem)](#sendPickupAnimalFromTrap(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.inventory.types.AnimalInventoryItem))
   77. [sendButcherAnimal(IsoDeadBody, IsoPlayer)](#sendButcherAnimal(zombie.iso.objects.IsoDeadBody,zombie.characters.IsoPlayer))
   78. [sendFeedAnimalFromHand(IsoAnimal, IsoPlayer, InventoryItem)](#sendFeedAnimalFromHand(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   79. [sendHutchGrabAnimal(IsoAnimal, IsoPlayer, IsoObject, InventoryItem)](#sendHutchGrabAnimal(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.iso.IsoObject,zombie.inventory.InventoryItem))
   80. [sendHutchGrabCorpseAction(IsoAnimal, IsoPlayer, IsoObject, InventoryItem)](#sendHutchGrabCorpseAction(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.iso.IsoObject,zombie.inventory.InventoryItem))
   81. [sendHutchRemoveAnimalAction(IsoAnimal, IsoPlayer, IsoObject)](#sendHutchRemoveAnimalAction(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer,zombie.iso.IsoObject))
   82. [sendCorpse(IsoDeadBody)](#sendCorpse(zombie.iso.objects.IsoDeadBody))
   83. [getAllItems()](#getAllItems())
   84. [scoreboardUpdate()](#scoreboardUpdate())
   85. [save(boolean)](#save(boolean))
   86. [saveGame()](#saveGame())
   87. [getAllRecipes()](#getAllRecipes())
   88. [requestUserlog(String)](#requestUserlog(java.lang.String))
   89. [addUserlog(String, String, String)](#addUserlog(java.lang.String,java.lang.String,java.lang.String))
   90. [removeUserlog(String, String, String)](#removeUserlog(java.lang.String,java.lang.String,java.lang.String))
   91. [tabToX(String, int)](#tabToX(java.lang.String,int))
   92. [isType(Object, String)](#isType(java.lang.Object,java.lang.String))
   93. [isoToScreenX(int, float, float, float)](#isoToScreenX(int,float,float,float))
   94. [isoToScreenY(int, float, float, float)](#isoToScreenY(int,float,float,float))
   95. [screenToIsoX(int, float, float, float)](#screenToIsoX(int,float,float,float))
   96. [screenToIsoY(int, float, float, float)](#screenToIsoY(int,float,float,float))
   97. [getAmbientStreamManager()](#getAmbientStreamManager())
   98. [getSleepingEvent()](#getSleepingEvent())
   99. [setPlayerButtonsActive(int, boolean)](#setPlayerButtonsActive(int,boolean))
   100. [setIgnoreInputsForDirection(int, boolean)](#setIgnoreInputsForDirection(int,boolean))
   101. [setJoypadIgnoreAim(int, boolean)](#setJoypadIgnoreAim(int,boolean))
   102. [setJoypadIgnoreAimUntilCentered(int, boolean)](#setJoypadIgnoreAimUntilCentered(int,boolean))
   103. [setActivePlayer(int)](#setActivePlayer(int))
   104. [getPlayer()](#getPlayer())
   105. [getNumActivePlayers()](#getNumActivePlayers())
   106. [playServerSound(String, IsoGridSquare)](#playServerSound(java.lang.String,zombie.iso.IsoGridSquare))
   107. [getMaxActivePlayers()](#getMaxActivePlayers())
   108. [getPlayerScreenLeft(int)](#getPlayerScreenLeft(int))
   109. [getPlayerScreenTop(int)](#getPlayerScreenTop(int))
   110. [getPlayerScreenWidth(int)](#getPlayerScreenWidth(int))
   111. [getPlayerScreenHeight(int)](#getPlayerScreenHeight(int))
   112. [getPlayerByOnlineID(int)](#getPlayerByOnlineID(int))
   113. [initUISystem()](#initUISystem())
   114. [getPerformance()](#getPerformance())
   115. [getWorldSoundManager()](#getWorldSoundManager())
   116. [getAnimalChunk(int, int)](#getAnimalChunk(int,int))
   117. [AddWorldSound(IsoPlayer, int, int)](#AddWorldSound(zombie.characters.IsoPlayer,int,int))
   118. [AddNoiseToken(IsoGridSquare, int)](#AddNoiseToken(zombie.iso.IsoGridSquare,int))
   119. [pauseSoundAndMusic()](#pauseSoundAndMusic())
   120. [resumeSoundAndMusic()](#resumeSoundAndMusic())
   121. [isDemo()](#isDemo())
   122. [getTimeInMillis()](#getTimeInMillis())
   123. [getCurrentCoroutine()](#getCurrentCoroutine())
   124. [reloadLuaFile(String)](#reloadLuaFile(java.lang.String))
   125. [reloadServerLuaFile(String)](#reloadServerLuaFile(java.lang.String))
   126. [setSpawnRegion(String)](#setSpawnRegion(java.lang.String))
   127. [getServerSpawnRegions()](#getServerSpawnRegions())
   128. [getServerOptions()](#getServerOptions())
   129. [getServerName()](#getServerName())
   130. [getServerIP()](#getServerIP())
   131. [getServerPort()](#getServerPort())
   132. [isShowConnectionInfo()](#isShowConnectionInfo())
   133. [setShowConnectionInfo(boolean)](#setShowConnectionInfo(boolean))
   134. [isShowServerInfo()](#isShowServerInfo())
   135. [setShowServerInfo(boolean)](#setShowServerInfo(boolean))
   136. [getSpecificPlayer(int)](#getSpecificPlayer(int))
   137. [getCameraOffX()](#getCameraOffX())
   138. [getLatestSave()](#getLatestSave())
   139. [isCurrentExecutionPoint(String, int)](#isCurrentExecutionPoint(java.lang.String,int))
   140. [toggleBreakOnChange(KahluaTable, Object)](#toggleBreakOnChange(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   141. [isDebugEnabled()](#isDebugEnabled())
   142. [toggleBreakOnRead(KahluaTable, Object)](#toggleBreakOnRead(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   143. [toggleBreakpoint(String, int)](#toggleBreakpoint(java.lang.String,int))
   144. [sendVisual(IsoPlayer)](#sendVisual(zombie.characters.IsoPlayer))
   145. [sendSyncPlayerFields(IsoPlayer, byte)](#sendSyncPlayerFields(zombie.characters.IsoPlayer,byte))
   146. [sendClothing(IsoPlayer, ItemBodyLocation, InventoryItem)](#sendClothing(zombie.characters.IsoPlayer,zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   147. [syncVisuals(IsoPlayer)](#syncVisuals(zombie.characters.IsoPlayer))
   148. [syncClothingFields(IsoPlayer)](#syncClothingFields(zombie.characters.IsoPlayer))
   149. [sendEquip(IsoPlayer)](#sendEquip(zombie.characters.IsoPlayer))
   150. [sendDamage(IsoPlayer)](#sendDamage(zombie.characters.IsoPlayer))
   151. [sendPlayerEffects(IsoPlayer)](#sendPlayerEffects(zombie.characters.IsoPlayer))
   152. [sendItemStats(InventoryItem)](#sendItemStats(zombie.inventory.InventoryItem))
   153. [hasDataReadBreakpoint(KahluaTable, Object)](#hasDataReadBreakpoint(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   154. [hasDataBreakpoint(KahluaTable, Object)](#hasDataBreakpoint(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   155. [hasBreakpoint(String, int)](#hasBreakpoint(java.lang.String,int))
   156. [getLoadedLuaCount()](#getLoadedLuaCount())
   157. [getLoadedLua(int)](#getLoadedLua(int))
   158. [isServer()](#isServer())
   159. [isServerSoftReset()](#isServerSoftReset())
   160. [isClient()](#isClient())
   161. [isMultiplayer()](#isMultiplayer())
   162. [canSeePlayerStats()](#canSeePlayerStats())
   163. [getAccessLevel()](#getAccessLevel())
   164. [haveAccess(String)](#haveAccess(java.lang.String))
   165. [getOnlinePlayers()](#getOnlinePlayers())
   166. [getDebug()](#getDebug())
   167. [getCameraOffY()](#getCameraOffY())
   168. [createRegionFile()](#createRegionFile())
   169. [getMapDirectoryTable()](#getMapDirectoryTable())
   170. [deleteDatabase(String)](#deleteDatabase(java.lang.String))
   171. [deleteSave(String)](#deleteSave(java.lang.String))
   172. [sendPlayerExtraInfo(IsoPlayer)](#sendPlayerExtraInfo(zombie.characters.IsoPlayer))
   173. [getServerAddressFromArgs()](#getServerAddressFromArgs())
   174. [getServerPasswordFromArgs()](#getServerPasswordFromArgs())
   175. [getServerListFile()](#getServerListFile())
   176. [addServerToAccountList(Server)](#addServerToAccountList(zombie.network.Server))
   177. [updateServerToAccountList(Server)](#updateServerToAccountList(zombie.network.Server))
   178. [deleteServerToAccountList(Server)](#deleteServerToAccountList(zombie.network.Server))
   179. [addAccountToAccountList(Server, Account)](#addAccountToAccountList(zombie.network.Server,zombie.network.Account))
   180. [updateAccountToAccountList(Account)](#updateAccountToAccountList(zombie.network.Account))
   181. [deleteAccountToAccountList(Account)](#deleteAccountToAccountList(zombie.network.Account))
   182. [getServerList()](#getServerList())
   183. [ping(String, String, String, String, boolean)](#ping(java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean))
   184. [getCustomizationData(String, String, String, String, String, String, boolean)](#getCustomizationData(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean))
   185. [getCombatConfig()](#getCombatConfig())
   186. [stopPing()](#stopPing())
   187. [transformIntoKahluaTable(HashMap)](#transformIntoKahluaTable(java.util.HashMap))
   188. [getSaveDirectory(String)](#getSaveDirectory(java.lang.String))
   189. [getFullSaveDirectoryTable()](#getFullSaveDirectoryTable())
   190. [getSaveName(File)](#getSaveName(java.io.File))
   191. [getSaveDirectoryTable()](#getSaveDirectoryTable())
   192. [getCurrentSaveName()](#getCurrentSaveName())
   193. [getMods()](#getMods())
   194. [doChallenge(KahluaTable)](#doChallenge(se.krka.kahlua.vm.KahluaTable))
   195. [doTutorial(KahluaTable)](#doTutorial(se.krka.kahlua.vm.KahluaTable))
   196. [setMinMaxZombiesPerChunk(float, float)](#setMinMaxZombiesPerChunk(float,float))
   197. [deleteAllGameModeSaves(String)](#deleteAllGameModeSaves(java.lang.String))
   198. [sledgeDestroy(IsoObject)](#sledgeDestroy(zombie.iso.IsoObject))
   199. [getBannedIPs()](#getBannedIPs())
   200. [getBannedSteamIDs()](#getBannedSteamIDs())
   201. [getTickets(String)](#getTickets(java.lang.String))
   202. [addTicket(String, String, int)](#addTicket(java.lang.String,java.lang.String,int))
   203. [viewedTicket(String, int)](#viewedTicket(java.lang.String,int))
   204. [removeTicket(int)](#removeTicket(int))
   205. [acceptFactionInvite(Faction, String, String, boolean)](#acceptFactionInvite(zombie.characters.Faction,java.lang.String,java.lang.String,boolean))
   206. [sendFactionChangeOwner(Faction, String)](#sendFactionChangeOwner(zombie.characters.Faction,java.lang.String))
   207. [sendFactionChangeTag(Faction)](#sendFactionChangeTag(zombie.characters.Faction))
   208. [sendFactionChangeTitle(Faction, String)](#sendFactionChangeTitle(zombie.characters.Faction,java.lang.String))
   209. [sendFactionCreate(String, String)](#sendFactionCreate(java.lang.String,java.lang.String))
   210. [sendFactionDisband(Faction)](#sendFactionDisband(zombie.characters.Faction))
   211. [sendFactionInvite(Faction, String, String)](#sendFactionInvite(zombie.characters.Faction,java.lang.String,java.lang.String))
   212. [sendFactionRemoveMember(Faction, String)](#sendFactionRemoveMember(zombie.characters.Faction,java.lang.String))
   213. [sendFactionStatsChange(IsoPlayer)](#sendFactionStatsChange(zombie.characters.IsoPlayer))
   214. [sendSafehouseInvite(SafeHouse, String, String)](#sendSafehouseInvite(zombie.iso.areas.SafeHouse,java.lang.String,java.lang.String))
   215. [acceptSafehouseInvite(SafeHouse, String, String, boolean)](#acceptSafehouseInvite(zombie.iso.areas.SafeHouse,java.lang.String,java.lang.String,boolean))
   216. [sendSafehouseChangeMember(SafeHouse, String)](#sendSafehouseChangeMember(zombie.iso.areas.SafeHouse,java.lang.String))
   217. [sendSafehouseChangeOwner(SafeHouse, String)](#sendSafehouseChangeOwner(zombie.iso.areas.SafeHouse,java.lang.String))
   218. [sendSafehouseChangeRespawn(SafeHouse, String, boolean)](#sendSafehouseChangeRespawn(zombie.iso.areas.SafeHouse,java.lang.String,boolean))
   219. [sendSafehouseChangeTitle(SafeHouse, String)](#sendSafehouseChangeTitle(zombie.iso.areas.SafeHouse,java.lang.String))
   220. [sendSafezoneClaim(String, int, int, int, int, String)](#sendSafezoneClaim(java.lang.String,int,int,int,int,java.lang.String))
   221. [sendSafehouseClaim(IsoGridSquare, IsoPlayer, String)](#sendSafehouseClaim(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer,java.lang.String))
   222. [sendSafehouseRelease(SafeHouse)](#sendSafehouseRelease(zombie.iso.areas.SafeHouse))
   223. [createHordeFromTo(float, float, float, float, int)](#createHordeFromTo(float,float,float,float,int))
   224. [createHordeInAreaTo(int, int, int, int, int, int, int)](#createHordeInAreaTo(int,int,int,int,int,int,int))
   225. [spawnHorde(float, float, float, float, float, int)](#spawnHorde(float,float,float,float,float,int))
   226. [createZombie(float, float, float, SurvivorDesc, int, IsoDirections)](#createZombie(float,float,float,zombie.characters.SurvivorDesc,int,zombie.iso.IsoDirections))
   227. [triggerEvent(String)](#triggerEvent(java.lang.String))
   228. [triggerEvent(String, Object)](#triggerEvent(java.lang.String,java.lang.Object))
   229. [triggerEvent(String, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object))
   230. [triggerEvent(String, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   231. [triggerEvent(String, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   232. [debugLuaTable(Object, int)](#debugLuaTable(java.lang.Object,int))
   233. [debugLuaTable(Object)](#debugLuaTable(java.lang.Object))
   234. [sendItemsInContainer(IsoObject, ItemContainer)](#sendItemsInContainer(zombie.iso.IsoObject,zombie.inventory.ItemContainer))
   235. [getModDirectoryTable()](#getModDirectoryTable())
   236. [getModInfoByID(String)](#getModInfoByID(java.lang.String))
   237. [getModInfo(String)](#getModInfo(java.lang.String))
   238. [getMapFoldersForMod(String)](#getMapFoldersForMod(java.lang.String))
   239. [spawnpointsExistsForMod(String, String)](#spawnpointsExistsForMod(java.lang.String,java.lang.String))
   240. [getFileSeparator()](#getFileSeparator())
   241. [getScriptManager()](#getScriptManager())
   242. [checkSaveFolderExists(String)](#checkSaveFolderExists(java.lang.String))
   243. [getAbsoluteSaveFolderName(String)](#getAbsoluteSaveFolderName(java.lang.String))
   244. [checkSaveFileExists(String)](#checkSaveFileExists(java.lang.String))
   245. [checkSavePlayerExists()](#checkSavePlayerExists())
   246. [cacheFileExists(String)](#cacheFileExists(java.lang.String))
   247. [fileExists(String)](#fileExists(java.lang.String))
   248. [serverFileExists(String)](#serverFileExists(java.lang.String))
   249. [takeScreenshot()](#takeScreenshot())
   250. [takeScreenshot(String)](#takeScreenshot(java.lang.String))
   251. [checkStringPattern(String)](#checkStringPattern(java.lang.String))
   252. [instanceItem(Item)](#instanceItem(zombie.scripting.objects.Item))
   253. [instanceItem(String)](#instanceItem(java.lang.String))
   254. [instanceItem(String, float)](#instanceItem(java.lang.String,float))
   255. [instanceItem(ItemKey)](#instanceItem(zombie.scripting.objects.ItemKey))
   256. [createNewScriptItem(String, String, String, String, String)](#createNewScriptItem(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   257. [cloneItemType(String, String)](#cloneItemType(java.lang.String,java.lang.String))
   258. [moduleDotType(String, String)](#moduleDotType(java.lang.String,java.lang.String))
   259. [require(String)](#require(java.lang.String))
   260. [getRenderer()](#getRenderer())
   261. [getGameTime()](#getGameTime())
   262. [getMaxPlayers()](#getMaxPlayers())
   263. [callLua(String, Object)](#callLua(java.lang.String,java.lang.Object))
   264. [callLuaReturn(String, ArrayList)](#callLuaReturn(java.lang.String,java.util.ArrayList))
   265. [callLuaBool(String, Object)](#callLuaBool(java.lang.String,java.lang.Object))
   266. [getWorld()](#getWorld())
   267. [getCell()](#getCell())
   268. [getCellSizeInChunks()](#getCellSizeInChunks())
   269. [getCellSizeInSquares()](#getCellSizeInSquares())
   270. [getChunkSizeInSquares()](#getChunkSizeInSquares())
   271. [getMinimumWorldLevel()](#getMinimumWorldLevel())
   272. [getMaximumWorldLevel()](#getMaximumWorldLevel())
   273. [getSandboxOptions()](#getSandboxOptions())
   274. [getFileOutput(String)](#getFileOutput(java.lang.String))
   275. [getLastStandPlayersDirectory()](#getLastStandPlayersDirectory())
   276. [getLastStandPlayerFileNames()](#getLastStandPlayerFileNames())
   277. [getAllSavedPlayers()](#getAllSavedPlayers())
   278. [getSandboxPresets()](#getSandboxPresets())
   279. [deleteSandboxPreset(String)](#deleteSandboxPreset(java.lang.String))
   280. [getFileReader(String, boolean)](#getFileReader(java.lang.String,boolean))
   281. [getModFileReader(String, String, boolean)](#getModFileReader(java.lang.String,java.lang.String,boolean))
   282. [listFilesInZomboidLuaDirectory(String)](#listFilesInZomboidLuaDirectory(java.lang.String))
   283. [listFilesInModDirectory(String, String)](#listFilesInModDirectory(java.lang.String,java.lang.String))
   284. [listFilesInDirectoryAux(String, ArrayList)](#listFilesInDirectoryAux(java.lang.String,java.util.ArrayList))
   285. [refreshAnimSets(boolean)](#refreshAnimSets(boolean))
   286. [reloadActionGroups()](#reloadActionGroups())
   287. [getModFileWriter(String, String, boolean, boolean)](#getModFileWriter(java.lang.String,java.lang.String,boolean,boolean))
   288. [updateFire()](#updateFire())
   289. [deletePlayerFromDatabase(String, String, String)](#deletePlayerFromDatabase(java.lang.String,java.lang.String,java.lang.String))
   290. [checkPlayerExistsInDatabase(String, String, String)](#checkPlayerExistsInDatabase(java.lang.String,java.lang.String,java.lang.String))
   291. [deletePlayerSave(String)](#deletePlayerSave(java.lang.String))
   292. [getControllerCount()](#getControllerCount())
   293. [isControllerConnected(int)](#isControllerConnected(int))
   294. [getControllerGUID(int)](#getControllerGUID(int))
   295. [getControllerName(int)](#getControllerName(int))
   296. [getControllerAxisValue(int, int)](#getControllerAxisValue(int,int))
   297. [getControllerDeadZone(int, int)](#getControllerDeadZone(int,int))
   298. [setControllerDeadZone(int, int, float)](#setControllerDeadZone(int,int,float))
   299. [saveControllerSettings(int)](#saveControllerSettings(int))
   300. [getControllerPovX(int)](#getControllerPovX(int))
   301. [getControllerPovY(int)](#getControllerPovY(int))
   302. [reloadControllerConfigFiles()](#reloadControllerConfigFiles())
   303. [isJoypadDown(int)](#isJoypadDown(int))
   304. [isJoypadLTPressed(int)](#isJoypadLTPressed(int))
   305. [isJoypadRTPressed(int)](#isJoypadRTPressed(int))
   306. [isJoypadLeftStickButtonPressed(int)](#isJoypadLeftStickButtonPressed(int))
   307. [isJoypadRightStickButtonPressed(int)](#isJoypadRightStickButtonPressed(int))
   308. [getJoypadAimingAxisX(int)](#getJoypadAimingAxisX(int))
   309. [getJoypadAimingAxisY(int)](#getJoypadAimingAxisY(int))
   310. [getJoypadMovementAxisX(int)](#getJoypadMovementAxisX(int))
   311. [getJoypadMovementAxisY(int)](#getJoypadMovementAxisY(int))
   312. [wasMouseActiveMoreRecentlyThanJoypad()](#wasMouseActiveMoreRecentlyThanJoypad())
   313. [activateJoypadOnSteamDeck()](#activateJoypadOnSteamDeck())
   314. [reactivateJoypadAfterResetLua()](#reactivateJoypadAfterResetLua())
   315. [isJoypadConnected(int)](#isJoypadConnected(int))
   316. [addPlayerToWorld(int, IsoPlayer, boolean)](#addPlayerToWorld(int,zombie.characters.IsoPlayer,boolean))
   317. [toInt(double)](#toInt(double))
   318. [getClientUsername()](#getClientUsername())
   319. [setPlayerJoypad(int, int, IsoPlayer, String, boolean)](#setPlayerJoypad(int,int,zombie.characters.IsoPlayer,java.lang.String,boolean))
   320. [setPlayerMouse(IsoPlayer)](#setPlayerMouse(zombie.characters.IsoPlayer))
   321. [revertToKeyboardAndMouse()](#revertToKeyboardAndMouse())
   322. [revertToKeyboardAndMouseFromMainMenu()](#revertToKeyboardAndMouseFromMainMenu())
   323. [isJoypadUp(int)](#isJoypadUp(int))
   324. [isJoypadLeft(int)](#isJoypadLeft(int))
   325. [isJoypadRight(int)](#isJoypadRight(int))
   326. [isJoypadLBPressed(int)](#isJoypadLBPressed(int))
   327. [isJoypadRBPressed(int)](#isJoypadRBPressed(int))
   328. [getButtonCount(int)](#getButtonCount(int))
   329. [setDebugToggleControllerPluggedIn(int)](#setDebugToggleControllerPluggedIn(int))
   330. [lineSeparator()](#lineSeparator())
   331. [getFileWriter(String, boolean, boolean)](#getFileWriter(java.lang.String,boolean,boolean))
   332. [createStory(String)](#createStory(java.lang.String))
   333. [createWorld(String)](#createWorld(java.lang.String))
   334. [sanitizeWorldName(String)](#sanitizeWorldName(java.lang.String))
   335. [forceChangeState(GameState)](#forceChangeState(zombie.gameStates.GameState))
   336. [endFileOutput()](#endFileOutput())
   337. [getFileInput(String)](#getFileInput(java.lang.String))
   338. [getGameFilesInput(String)](#getGameFilesInput(java.lang.String))
   339. [getGameFilesTextInput(String)](#getGameFilesTextInput(java.lang.String))
   340. [endTextFileInput()](#endTextFileInput())
   341. [endFileInput()](#endFileInput())
   342. [getFunctionsForFile(String)](#getFunctionsForFile(java.lang.String))
   343. [getLineNumber(LuaCallFrame)](#getLineNumber(se.krka.kahlua.vm.LuaCallFrame))
   344. [ZombRand(double)](#ZombRand(double))
   345. [ZombRandBetween(double, double)](#ZombRandBetween(double,double))
   346. [ZombRand(double, double)](#ZombRand(double,double))
   347. [ZombRandFloat(float, float)](#ZombRandFloat(float,float))
   348. [getShortenedFilename(String)](#getShortenedFilename(java.lang.String))
   349. [isKeyDown(int)](#isKeyDown(int))
   350. [isKeyDown(String)](#isKeyDown(java.lang.String))
   351. [wasKeyDown(int)](#wasKeyDown(int))
   352. [wasKeyDown(String)](#wasKeyDown(java.lang.String))
   353. [isKeyPressed(int)](#isKeyPressed(int))
   354. [isKeyPressed(String)](#isKeyPressed(java.lang.String))
   355. [getBaseSoundBank()](#getBaseSoundBank())
   356. [getFMODSoundBank()](#getFMODSoundBank())
   357. [isSoundPlaying(Object)](#isSoundPlaying(java.lang.Object))
   358. [stopSound(long)](#stopSound(long))
   359. [isShiftKeyDown()](#isShiftKeyDown())
   360. [isCtrlKeyDown()](#isCtrlKeyDown())
   361. [isAltKeyDown()](#isAltKeyDown())
   362. [isMetaKeyDown()](#isMetaKeyDown())
   363. [setZoomLevels(Double...)](#setZoomLevels(java.lang.Double...))
   364. [getCore()](#getCore())
   365. [isAnimationRecorderActive()](#isAnimationRecorderActive())
   366. [setAnimationRecorderActive(boolean)](#setAnimationRecorderActive(boolean))
   367. [getISUIStackTrace(int)](#getISUIStackTrace(int))
   368. [getGameVersion()](#getGameVersion())
   369. [getBreakModGameVersion()](#getBreakModGameVersion())
   370. [getSquare(double, double, double)](#getSquare(double,double,double))
   371. [getDebugOptions()](#getDebugOptions())
   372. [setShowPausedMessage(boolean)](#setShowPausedMessage(boolean))
   373. [getFilenameOfCallframe(LuaCallFrame)](#getFilenameOfCallframe(se.krka.kahlua.vm.LuaCallFrame))
   374. [getFilenameOfClosure(LuaClosure)](#getFilenameOfClosure(se.krka.kahlua.vm.LuaClosure))
   375. [getFirstLineOfClosure(LuaClosure)](#getFirstLineOfClosure(se.krka.kahlua.vm.LuaClosure))
   376. [getLocalVarCount(Coroutine)](#getLocalVarCount(se.krka.kahlua.vm.Coroutine))
   377. [getLocalVarCount(LuaCallFrame)](#getLocalVarCount(se.krka.kahlua.vm.LuaCallFrame))
   378. [isSystemLinux()](#isSystemLinux())
   379. [isSystemMacOS()](#isSystemMacOS())
   380. [isSystemWindows()](#isSystemWindows())
   381. [isModActive(ChooseGameInfo.Mod)](#isModActive(zombie.gameStates.ChooseGameInfo.Mod))
   382. [openURl(String)](#openURl(java.lang.String))
   383. [isDesktopOpenSupported()](#isDesktopOpenSupported())
   384. [showFolderInDesktop(String)](#showFolderInDesktop(java.lang.String))
   385. [getActivatedMods()](#getActivatedMods())
   386. [toggleModActive(ChooseGameInfo.Mod, boolean)](#toggleModActive(zombie.gameStates.ChooseGameInfo.Mod,boolean))
   387. [saveModsFile()](#saveModsFile())
   388. [deleteSavefileFilesMatching(File, String)](#deleteSavefileFilesMatching(java.io.File,java.lang.String))
   389. [deleteSavefileFilesMatchingInSubdirectories(File, String)](#deleteSavefileFilesMatchingInSubdirectories(java.io.File,java.lang.String))
   390. [manipulateSavefile(String, String)](#manipulateSavefile(java.lang.String,java.lang.String))
   391. [getLocalVarName(Coroutine, int)](#getLocalVarName(se.krka.kahlua.vm.Coroutine,int))
   392. [getLocalVarName(LuaCallFrame, int)](#getLocalVarName(se.krka.kahlua.vm.LuaCallFrame,int))
   393. [getLocalVarStack(Coroutine, int)](#getLocalVarStack(se.krka.kahlua.vm.Coroutine,int))
   394. [getLocalVarStackIndex(LuaCallFrame, int)](#getLocalVarStackIndex(se.krka.kahlua.vm.LuaCallFrame,int))
   395. [getCallframeTop(Coroutine)](#getCallframeTop(se.krka.kahlua.vm.Coroutine))
   396. [getCoroutineTop(Coroutine)](#getCoroutineTop(se.krka.kahlua.vm.Coroutine))
   397. [getCoroutineObjStack(Coroutine, int)](#getCoroutineObjStack(se.krka.kahlua.vm.Coroutine,int))
   398. [getCoroutineObjStackWithBase(Coroutine, int)](#getCoroutineObjStackWithBase(se.krka.kahlua.vm.Coroutine,int))
   399. [localVarName(Coroutine, int)](#localVarName(se.krka.kahlua.vm.Coroutine,int))
   400. [getCoroutineCallframeStack(Coroutine, int)](#getCoroutineCallframeStack(se.krka.kahlua.vm.Coroutine,int))
   401. [getLuaStackTrace()](#getLuaStackTrace())
   402. [createTile(String, IsoGridSquare)](#createTile(java.lang.String,zombie.iso.IsoGridSquare))
   403. [getNumClassFunctions(Object)](#getNumClassFunctions(java.lang.Object))
   404. [getClassFunction(Object, int)](#getClassFunction(java.lang.Object,int))
   405. [getNumClassFields(Object)](#getNumClassFields(java.lang.Object))
   406. [getClassField(Object, int)](#getClassField(java.lang.Object,int))
   407. [getDirectionTo(IsoGameCharacter, IsoObject)](#getDirectionTo(zombie.characters.IsoGameCharacter,zombie.iso.IsoObject))
   408. [translatePointXInOverheadMapToWindow(float, UIElement, float, float)](#translatePointXInOverheadMapToWindow(float,zombie.ui.UIElement,float,float))
   409. [translatePointYInOverheadMapToWindow(float, UIElement, float, float)](#translatePointYInOverheadMapToWindow(float,zombie.ui.UIElement,float,float))
   410. [translatePointXInOverheadMapToWorld(float, UIElement, float, float)](#translatePointXInOverheadMapToWorld(float,zombie.ui.UIElement,float,float))
   411. [translatePointYInOverheadMapToWorld(float, UIElement, float, float)](#translatePointYInOverheadMapToWorld(float,zombie.ui.UIElement,float,float))
   412. [drawOverheadMap(UIElement, int, float, float, float)](#drawOverheadMap(zombie.ui.UIElement,int,float,float,float))
   413. [assaultPlayer()](#assaultPlayer())
   414. [isoRegionsRenderer()](#isoRegionsRenderer())
   415. [zpopNewRenderer()](#zpopNewRenderer())
   416. [zpopSpawnTimeToZero(int, int)](#zpopSpawnTimeToZero(int,int))
   417. [zpopClearZombies(int, int)](#zpopClearZombies(int,int))
   418. [zpopSpawnNow(int, int)](#zpopSpawnNow(int,int))
   419. [addVirtualZombie(int, int)](#addVirtualZombie(int,int))
   420. [luaDebug()](#luaDebug())
   421. [setAggroTarget(int, int, int)](#setAggroTarget(int,int,int))
   422. [debugFullyStreamedIn(int, int)](#debugFullyStreamedIn(int,int))
   423. [getClassFieldVal(Object, Field)](#getClassFieldVal(java.lang.Object,java.lang.reflect.Field))
   424. [getMethodParameter(Method, int)](#getMethodParameter(java.lang.reflect.Method,int))
   425. [getMethodParameterCount(Method)](#getMethodParameterCount(java.lang.reflect.Method))
   426. [breakpoint()](#breakpoint())
   427. [getLuaDebuggerErrorCount()](#getLuaDebuggerErrorCount())
   428. [getLuaDebuggerErrors()](#getLuaDebuggerErrors())
   429. [doLuaDebuggerAction(String)](#doLuaDebuggerAction(java.lang.String))
   430. [isQuitCooldown()](#isQuitCooldown())
   431. [getGameSpeed()](#getGameSpeed())
   432. [setGameSpeed(int)](#setGameSpeed(int))
   433. [stepForward()](#stepForward())
   434. [isGamePaused()](#isGamePaused())
   435. [getMouseXScaled()](#getMouseXScaled())
   436. [getMouseYScaled()](#getMouseYScaled())
   437. [getMouseX()](#getMouseX())
   438. [setMouseXY(int, int)](#setMouseXY(int,int))
   439. [isMouseButtonDown(int)](#isMouseButtonDown(int))
   440. [isMouseButtonPressed(int)](#isMouseButtonPressed(int))
   441. [getMouseY()](#getMouseY())
   442. [getSoundManager()](#getSoundManager())
   443. [getLastPlayedDate(String)](#getLastPlayedDate(java.lang.String))
   444. [getTextureFromSaveDir(String, String)](#getTextureFromSaveDir(java.lang.String,java.lang.String))
   445. [getSaveInfo(String)](#getSaveInfo(java.lang.String))
   446. [renameSaveFile(String, String, String)](#renameSaveFile(java.lang.String,java.lang.String,java.lang.String))
   447. [isInvalidForRenameSavefile(String)](#isInvalidForRenameSavefile(java.lang.String))
   448. [setSavefilePlayer1(String, String, int)](#setSavefilePlayer1(java.lang.String,java.lang.String,int))
   449. [getServerSavedWorldVersion(String)](#getServerSavedWorldVersion(java.lang.String))
   450. [getZombieInfo(IsoZombie)](#getZombieInfo(zombie.characters.IsoZombie))
   451. [getPlayerInfo(IsoPlayer)](#getPlayerInfo(zombie.characters.IsoPlayer))
   452. [getMapInfo(String)](#getMapInfo(java.lang.String))
   453. [getVehicleInfo(BaseVehicle)](#getVehicleInfo(zombie.vehicles.BaseVehicle))
   454. [getLotDirectories()](#getLotDirectories())
   455. [useTextureFiltering(boolean)](#useTextureFiltering(boolean))
   456. [getTexture(String)](#getTexture(java.lang.String))
   457. [tryGetTexture(String)](#tryGetTexture(java.lang.String))
   458. [sendSecretKey(String, String, String, int, String, boolean, int, String)](#sendSecretKey(java.lang.String,java.lang.String,java.lang.String,int,java.lang.String,boolean,int,java.lang.String))
   459. [stopSendSecretKey()](#stopSendSecretKey())
   460. [generateSecretKey()](#generateSecretKey())
   461. [sendGoogleAuth(String, String)](#sendGoogleAuth(java.lang.String,java.lang.String))
   462. [createQRCodeTex(String, String)](#createQRCodeTex(java.lang.String,java.lang.String))
   463. [getVideo(String, int, int)](#getVideo(java.lang.String,int,int))
   464. [hasRelativePath(String)](#hasRelativePath(java.lang.String))
   465. [getTextManager()](#getTextManager())
   466. [setProgressBarValue(IsoPlayer, int)](#setProgressBarValue(zombie.characters.IsoPlayer,int))
   467. [getText(String, Object...)](#getText(java.lang.String,java.lang.Object...))
   468. [getTextOrNull(String, Object...)](#getTextOrNull(java.lang.String,java.lang.Object...))
   469. [getItemText(String)](#getItemText(java.lang.String))
   470. [getTextMediaEN(String)](#getTextMediaEN(java.lang.String))
   471. [getItemNameFromFullType(String)](#getItemNameFromFullType(java.lang.String))
   472. [getItem(String)](#getItem(java.lang.String))
   473. [getItemStaticModel(String)](#getItemStaticModel(java.lang.String))
   474. [isItemFood(String)](#isItemFood(java.lang.String))
   475. [getItemFoodType(String)](#getItemFoodType(java.lang.String))
   476. [isItemFresh(String, float)](#isItemFresh(java.lang.String,float))
   477. [getItemCount(String)](#getItemCount(java.lang.String))
   478. [getItemWeight(String)](#getItemWeight(java.lang.String))
   479. [getItemActualWeight(String)](#getItemActualWeight(java.lang.String))
   480. [getItemConditionMax(String)](#getItemConditionMax(java.lang.String))
   481. [getItemEvolvedRecipeName(String)](#getItemEvolvedRecipeName(java.lang.String))
   482. [hasItemTag(String, ItemTag)](#hasItemTag(java.lang.String,zombie.scripting.objects.ItemTag))
   483. [getItemDisplayName(String)](#getItemDisplayName(java.lang.String))
   484. [getItemName(String)](#getItemName(java.lang.String))
   485. [getItemTextureName(String)](#getItemTextureName(java.lang.String))
   486. [getItemTextureColor(Item, String)](#getItemTextureColor(zombie.scripting.objects.Item,java.lang.String))
   487. [getAndFindNearestTracks(IsoGameCharacter)](#getAndFindNearestTracks(zombie.characters.IsoGameCharacter))
   488. [getItemTex(String)](#getItemTex(java.lang.String))
   489. [getRecipeDisplayName(String)](#getRecipeDisplayName(java.lang.String))
   490. [getMyDocumentFolder()](#getMyDocumentFolder())
   491. [getSpriteManager(String)](#getSpriteManager(java.lang.String))
   492. [getSprite(String)](#getSprite(java.lang.String))
   493. [getServerModData()](#getServerModData())
   494. [isXBOXController()](#isXBOXController())
   495. [isPlaystationController(int)](#isPlaystationController(int))
   496. [sendClientCommand(String, String, KahluaTable)](#sendClientCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   497. [sendClientCommand(IsoPlayer, String, String, KahluaTable)](#sendClientCommand(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   498. [sendServerCommand(String, String, KahluaTable)](#sendServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   499. [sendServerCommand(IsoPlayer, String, String, KahluaTable)](#sendServerCommand(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   500. [sendServerCommandV(String, String, Object...)](#sendServerCommandV(java.lang.String,java.lang.String,java.lang.Object...))
   501. [sendClientCommandV(IsoPlayer, String, String, Object...)](#sendClientCommandV(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,java.lang.Object...))
   502. [addVariableToSyncList(String)](#addVariableToSyncList(java.lang.String))
   503. [getOnlineUsername()](#getOnlineUsername())
   504. [isValidUserName(String)](#isValidUserName(java.lang.String))
   505. [getHourMinute()](#getHourMinute())
   506. [SendCommandToServer(String)](#SendCommandToServer(java.lang.String))
   507. [isAdmin()](#isAdmin())
   508. [canModifyPlayerScoreboard()](#canModifyPlayerScoreboard())
   509. [isAccessLevel(String)](#isAccessLevel(java.lang.String))
   510. [sendHumanVisual(IsoPlayer)](#sendHumanVisual(zombie.characters.IsoPlayer))
   511. [stopFire(Object)](#stopFire(java.lang.Object))
   512. [sortBrowserList(KahluaTableImpl, String, boolean, KahluaTableImpl)](#sortBrowserList(se.krka.kahlua.j2se.KahluaTableImpl,java.lang.String,boolean,se.krka.kahlua.j2se.KahluaTableImpl))
   513. [getGameClient()](#getGameClient())
   514. [sendRequestInventory(int, String)](#sendRequestInventory(int,java.lang.String))
   515. [InvMngGetItem(long, String, int, String)](#InvMngGetItem(long,java.lang.String,int,java.lang.String))
   516. [InvMngRemoveItem(long, int, String)](#InvMngRemoveItem(long,int,java.lang.String))
   517. [InvMngUpdateItem(InventoryItem, int)](#InvMngUpdateItem(zombie.inventory.InventoryItem,int))
   518. [getConnectedPlayers()](#getConnectedPlayers())
   519. [getPlayerFromUsername(String)](#getPlayerFromUsername(java.lang.String))
   520. [isCoopHost()](#isCoopHost())
   521. [setAdmin()](#setAdmin())
   522. [addWarningPoint(String, String, int)](#addWarningPoint(java.lang.String,java.lang.String,int))
   523. [disconnect()](#disconnect())
   524. [writeLog(String, String)](#writeLog(java.lang.String,java.lang.String))
   525. [doKeyPress(boolean)](#doKeyPress(boolean))
   526. [getEvolvedRecipes()](#getEvolvedRecipes())
   527. [getZone(int, int, int)](#getZone(int,int,int))
   528. [getZones(int, int, int)](#getZones(int,int,int))
   529. [getVehicleZoneAt(int, int, int)](#getVehicleZoneAt(int,int,int))
   530. [getCellMinX()](#getCellMinX())
   531. [getCellMaxX()](#getCellMaxX())
   532. [getCellMinY()](#getCellMinY())
   533. [getCellMaxY()](#getCellMaxY())
   534. [replaceWith(String, String, String)](#replaceWith(java.lang.String,java.lang.String,java.lang.String))
   535. [getTimestamp()](#getTimestamp())
   536. [getTimestampMs()](#getTimestampMs())
   537. [forceSnowCheck()](#forceSnowCheck())
   538. [getGametimeTimestamp()](#getGametimeTimestamp())
   539. [canInviteFriends()](#canInviteFriends())
   540. [inviteFriend(String)](#inviteFriend(java.lang.String))
   541. [getFriendsList()](#getFriendsList())
   542. [getSteamModeActive()](#getSteamModeActive())
   543. [getStreamModeActive()](#getStreamModeActive())
   544. [getRemotePlayModeActive()](#getRemotePlayModeActive())
   545. [isValidSteamID(String)](#isValidSteamID(java.lang.String))
   546. [getCurrentUserSteamID()](#getCurrentUserSteamID())
   547. [getCurrentUserProfileName()](#getCurrentUserProfileName())
   548. [getSteamScoreboard()](#getSteamScoreboard())
   549. [isSteamOverlayEnabled()](#isSteamOverlayEnabled())
   550. [activateSteamOverlayToWorkshop()](#activateSteamOverlayToWorkshop())
   551. [activateSteamOverlayToWorkshopUser()](#activateSteamOverlayToWorkshopUser())
   552. [activateSteamOverlayToWorkshopItem(String)](#activateSteamOverlayToWorkshopItem(java.lang.String))
   553. [activateSteamOverlayToWebPage(String)](#activateSteamOverlayToWebPage(java.lang.String))
   554. [getSteamProfileNameFromSteamID(String)](#getSteamProfileNameFromSteamID(java.lang.String))
   555. [getSteamAvatarFromSteamID(String)](#getSteamAvatarFromSteamID(java.lang.String))
   556. [getSteamIDFromUsername(String)](#getSteamIDFromUsername(java.lang.String))
   557. [resetRegionFile()](#resetRegionFile())
   558. [getSteamProfileNameFromUsername(String)](#getSteamProfileNameFromUsername(java.lang.String))
   559. [getSteamAvatarFromUsername(String)](#getSteamAvatarFromUsername(java.lang.String))
   560. [getSteamWorkshopStagedItems()](#getSteamWorkshopStagedItems())
   561. [getSteamWorkshopItemIDs()](#getSteamWorkshopItemIDs())
   562. [getSteamWorkshopItemMods(String)](#getSteamWorkshopItemMods(java.lang.String))
   563. [isSteamRunningOnSteamDeck()](#isSteamRunningOnSteamDeck())
   564. [showSteamGamepadTextInput(boolean, boolean, String, int, String)](#showSteamGamepadTextInput(boolean,boolean,java.lang.String,int,java.lang.String))
   565. [showSteamFloatingGamepadTextInput(boolean, int, int, int, int)](#showSteamFloatingGamepadTextInput(boolean,int,int,int,int))
   566. [isFloatingGamepadTextInputVisible()](#isFloatingGamepadTextInputVisible())
   567. [sendPlayerStatsChange(IsoPlayer)](#sendPlayerStatsChange(zombie.characters.IsoPlayer))
   568. [sendPersonalColor(IsoPlayer)](#sendPersonalColor(zombie.characters.IsoPlayer))
   569. [requestTrading(IsoPlayer, IsoPlayer)](#requestTrading(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   570. [acceptTrading(IsoPlayer, IsoPlayer, boolean)](#acceptTrading(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer,boolean))
   571. [requestMedicalCheck(IsoPlayer, IsoPlayer)](#requestMedicalCheck(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   572. [acceptMedicalCheck(IsoPlayer, IsoPlayer)](#acceptMedicalCheck(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   573. [tradingUISendAddItem(IsoPlayer, IsoPlayer, InventoryItem)](#tradingUISendAddItem(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   574. [tradingUISendRemoveItem(IsoPlayer, IsoPlayer, InventoryItem)](#tradingUISendRemoveItem(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   575. [tradingUISendUpdateState(IsoPlayer, IsoPlayer, int)](#tradingUISendUpdateState(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer,int))
   576. [sendWarManagerUpdate(int, String, WarManager.State)](#sendWarManagerUpdate(int,java.lang.String,zombie.network.WarManager.State))
   577. [getTwoLetters(String)](#getTwoLetters(java.lang.String))
   578. [isPunctuation(char)](#isPunctuation(char))
   579. [findBestSplitPoint(String, int)](#findBestSplitPoint(java.lang.String,int))
   580. [splitString(String, int)](#splitString(java.lang.String,int))
   581. [querySteamWorkshopItemDetails(ArrayList, LuaClosure, Object)](#querySteamWorkshopItemDetails(java.util.ArrayList,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   582. [connectToServerStateCallback(String)](#connectToServerStateCallback(java.lang.String))
   583. [getPublicServersList()](#getPublicServersList())
   584. [steamRequestInternetServersList()](#steamRequestInternetServersList())
   585. [steamReleaseInternetServersRequest()](#steamReleaseInternetServersRequest())
   586. [steamRequestInternetServersCount()](#steamRequestInternetServersCount())
   587. [steamGetInternetServerDetails(int)](#steamGetInternetServerDetails(int))
   588. [steamRequestServerRules(String, int)](#steamRequestServerRules(java.lang.String,int))
   589. [getHostByName(String)](#getHostByName(java.lang.String))
   590. [steamRequestServerDetails(String, int)](#steamRequestServerDetails(java.lang.String,int))
   591. [isPublicServerListAllowed()](#isPublicServerListAllowed())
   592. [isSteamServerBrowserEnabled()](#isSteamServerBrowserEnabled())
   593. [testSound()](#testSound())
   594. [getFMODEventPathList()](#getFMODEventPathList())
   595. [debugSetRoomType(Double)](#debugSetRoomType(java.lang.Double))
   596. [copyTable(KahluaTable)](#copyTable(se.krka.kahlua.vm.KahluaTable))
   597. [mergeTable(KahluaTable...)](#mergeTable(se.krka.kahlua.vm.KahluaTable...))
   598. [copyTable(KahluaTable, KahluaTable)](#copyTable(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable))
   599. [renderIsoCircle(float, float, float, float, int, int, float, float, float, float)](#renderIsoCircle(float,float,float,float,int,int,float,float,float,float))
   600. [renderIsoRect(float, float, float, float, float, float, float, float, int)](#renderIsoRect(float,float,float,float,float,float,float,float,int))
   601. [renderLine(float, float, float, float, float, float, float, float, float, float)](#renderLine(float,float,float,float,float,float,float,float,float,float))
   602. [renderIsoLine(float, float, float, float, float, float, int, float, float, float, float)](#renderIsoLine(float,float,float,float,float,float,int,float,float,float,float))
   603. [configureLighting(float)](#configureLighting(float))
   604. [invalidateLighting()](#invalidateLighting())
   605. [testHelicopter()](#testHelicopter())
   606. [endHelicopter()](#endHelicopter())
   607. [getServerSettingsManager()](#getServerSettingsManager())
   608. [rainConfig(String, int)](#rainConfig(java.lang.String,int))
   609. [sendSwitchSeat(BaseVehicle, IsoGameCharacter, int, int)](#sendSwitchSeat(zombie.vehicles.BaseVehicle,zombie.characters.IsoGameCharacter,int,int))
   610. [getVehicleById(int)](#getVehicleById(int))
   611. [removeVehicle(IsoPlayer, BaseVehicle)](#removeVehicle(zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle))
   612. [removeAllVehicles(IsoPlayer)](#removeAllVehicles(zombie.characters.IsoPlayer))
   613. [addBloodSplat(IsoGridSquare, int)](#addBloodSplat(zombie.iso.IsoGridSquare,int))
   614. [addBloodSplat(IsoGridSquare, int, float, float)](#addBloodSplat(zombie.iso.IsoGridSquare,int,float,float))
   615. [addCarCrash()](#addCarCrash())
   616. [createRandomDeadBody(IsoGridSquare, int)](#createRandomDeadBody(zombie.iso.IsoGridSquare,int))
   617. [addZombieSitting(int, int, int)](#addZombieSitting(int,int,int))
   618. [addZombiesEating(int, int, int, int, boolean)](#addZombiesEating(int,int,int,int,boolean))
   619. [addZombiesInOutfitArea(int, int, int, int, int, int, String, Integer)](#addZombiesInOutfitArea(int,int,int,int,int,int,java.lang.String,java.lang.Integer))
   620. [addZombiesInOutfit(int, int, int, int, String, Integer)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer))
   621. [addZombiesInOutfit(int, int, int, int, String, Integer, boolean, boolean, boolean, boolean, boolean, boolean, float)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer,boolean,boolean,boolean,boolean,boolean,boolean,float))
   622. [addZombiesInOutfit(int, int, int, int, String, Integer, boolean, boolean, boolean, boolean, boolean, boolean, float, boolean)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer,boolean,boolean,boolean,boolean,boolean,boolean,float,boolean))
   623. [addZombiesInOutfit(int, int, int, int, String, Integer, boolean, boolean, boolean, boolean, boolean, boolean, float, boolean, float)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer,boolean,boolean,boolean,boolean,boolean,boolean,float,boolean,float))
   624. [addZombiesInOutfit(int, int, int, int, String, Integer, boolean, boolean, boolean, boolean, boolean, boolean, float, boolean, float, boolean)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer,boolean,boolean,boolean,boolean,boolean,boolean,float,boolean,float,boolean))
   625. [addZombiesInOutfit(int, int, int, int, String, Integer, boolean, boolean, boolean, boolean, boolean, boolean, float, boolean, float, boolean, boolean)](#addZombiesInOutfit(int,int,int,int,java.lang.String,java.lang.Integer,boolean,boolean,boolean,boolean,boolean,boolean,float,boolean,float,boolean,boolean))
   626. [addZombiesInBuilding(BuildingDef, int, String, RoomDef, Integer)](#addZombiesInBuilding(zombie.iso.BuildingDef,int,java.lang.String,zombie.iso.RoomDef,java.lang.Integer))
   627. [addVehicleDebug(String, IsoDirections, Integer, IsoGridSquare)](#addVehicleDebug(java.lang.String,zombie.iso.IsoDirections,java.lang.Integer,zombie.iso.IsoGridSquare))
   628. [addVehicle(String, int, int, int)](#addVehicle(java.lang.String,int,int,int))
   629. [attachTrailerToPlayerVehicle(int)](#attachTrailerToPlayerVehicle(int))
   630. [getKeyName(int)](#getKeyName(int))
   631. [getKeyCode(String)](#getKeyCode(java.lang.String))
   632. [queueCharEvent(String)](#queueCharEvent(java.lang.String))
   633. [queueKeyEvent(int)](#queueKeyEvent(int))
   634. [addAllVehicles()](#addAllVehicles())
   635. [addAllBurntVehicles()](#addAllBurntVehicles())
   636. [addAllSmashedVehicles()](#addAllSmashedVehicles())
   637. [addAllVehicles(Predicate)](#addAllVehicles(java.util.function.Predicate))
   638. [addPhysicsObject()](#addPhysicsObject())
   639. [toggleVehicleRenderToTexture()](#toggleVehicleRenderToTexture())
   640. [reloadSoundFiles()](#reloadSoundFiles())
   641. [getAnimationViewerState()](#getAnimationViewerState())
   642. [getAttachmentEditorState()](#getAttachmentEditorState())
   643. [getEditVehicleState()](#getEditVehicleState())
   644. [getSpriteModelEditorState()](#getSpriteModelEditorState())
   645. [showAnimationViewer()](#showAnimationViewer())
   646. [showAttachmentEditor()](#showAttachmentEditor())
   647. [showChunkDebugger()](#showChunkDebugger())
   648. [getTileGeometryState()](#getTileGeometryState())
   649. [showGlobalObjectDebugger()](#showGlobalObjectDebugger())
   650. [showSeamEditor()](#showSeamEditor())
   651. [getSeamEditorState()](#getSeamEditorState())
   652. [showSpriteModelEditor()](#showSpriteModelEditor())
   653. [showVehicleEditor(String)](#showVehicleEditor(java.lang.String))
   654. [showWorldMapEditor(String)](#showWorldMapEditor(java.lang.String))
   655. [reloadVehicles()](#reloadVehicles())
   656. [reloadEngineRPM()](#reloadEngineRPM())
   657. [reloadXui()](#reloadXui())
   658. [reloadScripts(ScriptType)](#reloadScripts(zombie.scripting.ScriptType))
   659. [reloadEntityScripts()](#reloadEntityScripts())
   660. [reloadEntitiesDebug()](#reloadEntitiesDebug())
   661. [reloadEntityDebug(GameEntity)](#reloadEntityDebug(zombie.entity.GameEntity))
   662. [reloadEntityFromScriptDebug(GameEntity)](#reloadEntityFromScriptDebug(zombie.entity.GameEntity))
   663. [getIsoEntitiesDebug()](#getIsoEntitiesDebug())
   664. [proceedPM(String)](#proceedPM(java.lang.String))
   665. [processSayMessage(String)](#processSayMessage(java.lang.String))
   666. [processGeneralMessage(String)](#processGeneralMessage(java.lang.String))
   667. [processShoutMessage(String)](#processShoutMessage(java.lang.String))
   668. [ProceedFactionMessage(String)](#ProceedFactionMessage(java.lang.String))
   669. [ProcessSafehouseMessage(String)](#ProcessSafehouseMessage(java.lang.String))
   670. [ProcessAdminChatMessage(String)](#ProcessAdminChatMessage(java.lang.String))
   671. [showWrongChatTabMessage(int, int, String)](#showWrongChatTabMessage(int,int,java.lang.String))
   672. [focusOnTab(Short)](#focusOnTab(java.lang.Short))
   673. [updateChatSettings(String, boolean, boolean)](#updateChatSettings(java.lang.String,boolean,boolean))
   674. [checkPlayerCanUseChat(String)](#checkPlayerCanUseChat(java.lang.String))
   675. [reloadVehicleTextures(String)](#reloadVehicleTextures(java.lang.String))
   676. [useStaticErosionRand(boolean)](#useStaticErosionRand(boolean))
   677. [getClimateManager()](#getClimateManager())
   678. [getClimateMoon()](#getClimateMoon())
   679. [getWorldMarkers()](#getWorldMarkers())
   680. [getIsoMarkers()](#getIsoMarkers())
   681. [getErosion()](#getErosion())
   682. [getAllOutfits(boolean)](#getAllOutfits(boolean))
   683. [getAllVehicles()](#getAllVehicles())
   684. [getAllHairStyles(boolean)](#getAllHairStyles(boolean))
   685. [getHairStylesInstance()](#getHairStylesInstance())
   686. [getBeardStylesInstance()](#getBeardStylesInstance())
   687. [getAllBeardStyles()](#getAllBeardStyles())
   688. [getVoiceStylesInstance()](#getVoiceStylesInstance())
   689. [getAllVoiceStyles()](#getAllVoiceStyles())
   690. [getAllItemsForBodyLocation(String)](#getAllItemsForBodyLocation(java.lang.String))
   691. [getAllDecalNamesForItem(InventoryItem)](#getAllDecalNamesForItem(zombie.inventory.InventoryItem))
   692. [screenZoomIn()](#screenZoomIn())
   693. [screenZoomOut()](#screenZoomOut())
   694. [addSound(IsoObject, int, int, int, int, int)](#addSound(zombie.iso.IsoObject,int,int,int,int,int))
   695. [sendPlaySound(String, boolean, IsoMovingObject)](#sendPlaySound(java.lang.String,boolean,zombie.iso.IsoMovingObject))
   696. [sendIconFound(IsoPlayer, String, float)](#sendIconFound(zombie.characters.IsoPlayer,java.lang.String,float))
   697. [sendForageRequestZone(IsoPlayer, String)](#sendForageRequestZone(zombie.characters.IsoPlayer,java.lang.String))
   698. [sendForagePool(IsoPlayer, String, KahluaTable)](#sendForagePool(zombie.characters.IsoPlayer,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   699. [sendForageSpot(IsoPlayer, String)](#sendForageSpot(zombie.characters.IsoPlayer,java.lang.String))
   700. [getLoosingXpValue()](#getLoosingXpValue())
   701. [getLoosingXpTick(Object)](#getLoosingXpTick(java.lang.Object))
   702. [addXpNoMultiplier(IsoPlayer, PerkFactory.Perk, float)](#addXpNoMultiplier(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float))
   703. [addXp(IsoPlayer, PerkFactory.Perk, float)](#addXp(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float))
   704. [addXpMultiplier(IsoPlayer, PerkFactory.Perk, float, int, int)](#addXpMultiplier(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float,int,int))
   705. [syncBodyPart(BodyPart, long)](#syncBodyPart(zombie.characters.BodyDamage.BodyPart,long))
   706. [syncPlayerStats(IsoPlayer, int)](#syncPlayerStats(zombie.characters.IsoPlayer,int))
   707. [sendPlayerStat(IsoPlayer, CharacterStat)](#sendPlayerStat(zombie.characters.IsoPlayer,zombie.characters.CharacterStat))
   708. [sendPlayerNutrition(IsoPlayer)](#sendPlayerNutrition(zombie.characters.IsoPlayer))
   709. [SyncXp(IsoPlayer)](#SyncXp(zombie.characters.IsoPlayer))
   710. [checkServerName(String)](#checkServerName(java.lang.String))
   711. [Render3DItem(InventoryItem, IsoGridSquare, float, float, float, float)](#Render3DItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float,float))
   712. [getContainerOverlays()](#getContainerOverlays())
   713. [getTileOverlays()](#getTileOverlays())
   714. [NewMapBinaryFile(String)](#NewMapBinaryFile(java.lang.String))
   715. [getAverageFSP()](#getAverageFSP())
   716. [getCPUTime()](#getCPUTime())
   717. [getGPUTime()](#getGPUTime())
   718. [getCPUWait()](#getCPUWait())
   719. [getGPUWait()](#getGPUWait())
   720. [getServerFPS()](#getServerFPS())
   721. [createItemTransaction(IsoPlayer, KahluaTableImpl, ItemContainer, ItemContainer)](#createItemTransaction(zombie.characters.IsoPlayer,se.krka.kahlua.j2se.KahluaTableImpl,zombie.inventory.ItemContainer,zombie.inventory.ItemContainer))
   722. [extractItems(KahluaTableImpl)](#extractItems(se.krka.kahlua.j2se.KahluaTableImpl))
   723. [removeItemTransaction(byte, boolean)](#removeItemTransaction(byte,boolean))
   724. [isItemTransactionConsistent(InventoryItem, ItemContainer, ItemContainer, String, IsoPlayer)](#isItemTransactionConsistent(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer,zombie.inventory.ItemContainer,java.lang.String,zombie.characters.IsoPlayer))
   725. [isItemTransactionDone(byte)](#isItemTransactionDone(byte))
   726. [isItemTransactionRejected(byte)](#isItemTransactionRejected(byte))
   727. [getItemTransactionDuration(byte)](#getItemTransactionDuration(byte))
   728. [isActionDone(byte)](#isActionDone(byte))
   729. [isActionRejected(byte)](#isActionRejected(byte))
   730. [getActionDuration(byte)](#getActionDuration(byte))
   731. [removeAction(byte, boolean)](#removeAction(byte,boolean))
   732. [emulateAnimEvent(NetTimedAction, long, String, String)](#emulateAnimEvent(zombie.core.NetTimedAction,long,java.lang.String,java.lang.String))
   733. [emulateAnimEventOnce(NetTimedAction, long, String, String)](#emulateAnimEventOnce(zombie.core.NetTimedAction,long,java.lang.String,java.lang.String))
   734. [detectBadWords(String)](#detectBadWords(java.lang.String))
   735. [profanityFilterCheck(String)](#profanityFilterCheck(java.lang.String))
   736. [showDebugInfoInChat(String)](#showDebugInfoInChat(java.lang.String))
   737. [createBuildAction(IsoPlayer, float, float, float, boolean, String, KahluaTable)](#createBuildAction(zombie.characters.IsoPlayer,float,float,float,boolean,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   738. [startFishingAction(IsoPlayer, InventoryItem, IsoGridSquare, KahluaTable)](#startFishingAction(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,se.krka.kahlua.vm.KahluaTable))
   739. [syncItemActivated(IsoPlayer, InventoryItem)](#syncItemActivated(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   740. [syncItemModData(IsoPlayer, InventoryItem)](#syncItemModData(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   741. [syncItemFields(IsoPlayer, InventoryItem)](#syncItemFields(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   742. [syncHandWeaponFields(IsoPlayer, HandWeapon)](#syncHandWeaponFields(zombie.characters.IsoPlayer,zombie.inventory.types.HandWeapon))
   743. [getPickedUpFish(IsoPlayer)](#getPickedUpFish(zombie.characters.IsoPlayer))
   744. [sendAddItemToContainer(ItemContainer, InventoryItem)](#sendAddItemToContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   745. [sendAddItemsToContainer(ItemContainer, ArrayList)](#sendAddItemsToContainer(zombie.inventory.ItemContainer,java.util.ArrayList))
   746. [sendAttachedItem(IsoGameCharacter, String, InventoryItem)](#sendAttachedItem(zombie.characters.IsoGameCharacter,java.lang.String,zombie.inventory.InventoryItem))
   747. [sendReplaceItemInContainer(ItemContainer, InventoryItem, InventoryItem)](#sendReplaceItemInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   748. [sendRemoveItemFromContainer(ItemContainer, InventoryItem)](#sendRemoveItemFromContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   749. [sendRemoveItemsFromContainer(ItemContainer, ArrayList)](#sendRemoveItemsFromContainer(zombie.inventory.ItemContainer,java.util.ArrayList))
   750. [replaceItemInContainer(ItemContainer, InventoryItem, InventoryItem)](#replaceItemInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   751. [log(DebugType, String)](#log(zombie.debug.DebugType,java.lang.String))
   752. [teleportPlayers(IsoPlayer)](#teleportPlayers(zombie.characters.IsoPlayer))
   753. [checkModsNeedUpdate(UdpConnection)](#checkModsNeedUpdate(zombie.core.raknet.UdpConnection))
   754. [getSearchMode()](#getSearchMode())
   755. [transmitBigWaterSplash(int, int, float, float)](#transmitBigWaterSplash(int,int,float,float))
   756. [addAreaHighlight(int, int, int, int, int, float, float, float, float)](#addAreaHighlight(int,int,int,int,int,float,float,float,float))
   757. [addAreaHighlightForPlayer(int, int, int, int, int, int, float, float, float, float)](#addAreaHighlightForPlayer(int,int,int,int,int,int,float,float,float,float))
   758. [configRoomFade(float, float)](#configRoomFade(float,float))
   759. [timSort(KahluaTable, Object)](#timSort(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   760. [javaListRemoveAt(List, int)](#javaListRemoveAt(java.util.List,int))
   761. [sendDebugStory(IsoGridSquare, int, String)](#sendDebugStory(zombie.iso.IsoGridSquare,int,java.lang.String))
   762. [displayLUATable(KahluaTable)](#displayLUATable(se.krka.kahlua.vm.KahluaTable))
   763. [showTimers(String)](#showTimers(java.lang.String))
   764. [showTimersTotal(String)](#showTimersTotal(java.lang.String))
   765. [resetTimers(String)](#resetTimers(java.lang.String))
   766. [getTimerKept(String, String)](#getTimerKept(java.lang.String,java.lang.String))
   767. [getCheatTypes()](#getCheatTypes())
   768. [getStreets(WorldMapStreets)](#getStreets(zombie.worldMap.streets.WorldMapStreets))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.GlobalObject
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager.GlobalObject

Enclosing class:
:   `LuaManager`

---

public static class LuaManager.GlobalObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `LuaManager.GlobalObject.ItemQuery`

  `private static final class`

  `LuaManager.GlobalObject.ItemQueryJava`

  `static final class`

  `LuaManager.GlobalObject.LuaFileWriter`

  `private static final class`

  `LuaManager.GlobalObject.TimSortComparator`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static BufferedReader`

  `inBufferedReader`

  `private static FileReader`

  `inFileReader`

  `private static FileInputStream`

  `inStream`

  `private static FileOutputStream`

  `outStream`

  `private static long`

  `timeLastRefresh`

  `private static final LuaManager.GlobalObject.TimSortComparator`

  `timSortComparator`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GlobalObject()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `static void`

  `acceptFactionInvite(Faction faction,
  String host,
  String invited,
  boolean isAccepted)`

  `static void`

  `acceptMedicalCheck(IsoPlayer target,
  IsoPlayer requester)`

  `static void`

  `acceptSafehouseInvite(SafeHouse safehouse,
  String host,
  String invited,
  boolean isAccepted)`

  `static void`

  `acceptTrading(IsoPlayer you,
  IsoPlayer other,
  boolean accept)`

  `static void`

  `activateJoypadOnSteamDeck()`

  `static void`

  `activateSteamOverlayToWebPage(String url)`

  `static void`

  `activateSteamOverlayToWorkshop()`

  `static void`

  `activateSteamOverlayToWorkshopItem(String itemID)`

  `static void`

  `activateSteamOverlayToWorkshopUser()`

  `static void`

  `addAccountToAccountList(Server server,
  Account account)`

  `static void`

  `addAllBurntVehicles()`

  `static void`

  `addAllSmashedVehicles()`

  `static void`

  `addAllVehicles()`

  `static void`

  `addAllVehicles(Predicate<VehicleScript> predicate)`

  `static IsoAnimal`

  `addAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String animalType,
  AnimalBreed breed)`

  `static IsoAnimal`

  `addAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String animalType,
  AnimalBreed breed,
  boolean skeleton)`

  `static void`

  `addAreaHighlight(int x1,
  int y1,
  int x2,
  int y2,
  int z,
  float r,
  float g,
  float b,
  float a)`

  `static void`

  `addAreaHighlightForPlayer(int playerIndex,
  int x1,
  int y1,
  int x2,
  int y2,
  int z,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `addBloodSplat(IsoGridSquare sq,
  int nbr)`

  `void`

  `addBloodSplat(IsoGridSquare sq,
  int nbr,
  float xoffset,
  float yoffset)`

  `static void`

  `addCarCrash()`

  `static void`

  `AddNoiseToken(IsoGridSquare sq,
  int radius)`

  `static BaseVehicle`

  `addPhysicsObject()`

  `private static void`

  `addPlayerToWorld(int player,
  IsoPlayer playerObj,
  boolean newPlayer)`

  `static void`

  `addRole(String name)`

  `static void`

  `addServerToAccountList(Server server)`

  `void`

  `addSound(IsoObject source,
  int x,
  int y,
  int z,
  int radius,
  int volume)`

  `static void`

  `addTicket(String author,
  String message,
  int ticketID)`

  `static void`

  `addUserlog(String user,
  String type,
  String text)`

  `static void`

  `addVariableToSyncList(String key)`

  `static BaseVehicle`

  `addVehicle(String script,
  int x,
  int y,
  int z)`

  `static BaseVehicle`

  `addVehicleDebug(String scriptName,
  IsoDirections dir,
  Integer skinIndex,
  IsoGridSquare sq)`

  `static void`

  `addVirtualZombie(int x,
  int y)`

  `static void`

  `addWarningPoint(String user,
  String reason,
  int amount)`

  `static void`

  `AddWorldSound(IsoPlayer player,
  int radius,
  int volume)`

  `void`

  `addXp(IsoPlayer player,
  PerkFactory.Perk perk,
  float amount)`

  `void`

  `addXpMultiplier(IsoPlayer player,
  PerkFactory.Perk perk,
  float multiplier,
  int minLevel,
  int maxLevel)`

  `void`

  `addXpNoMultiplier(IsoPlayer player,
  PerkFactory.Perk perk,
  float amount)`

  `void`

  `addZombiesEating(int x,
  int y,
  int z,
  int totalZombies,
  boolean skeletonBody)`

  `ArrayList<IsoZombie>`

  `addZombiesInBuilding(BuildingDef def,
  int totalZombies,
  String outfit,
  RoomDef room,
  Integer femaleChance)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  boolean isCrawler,
  boolean isFallOnFront,
  boolean isFakeDead,
  boolean isKnockedDown,
  boolean isInvulnerable,
  boolean isSitting,
  float health)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  boolean isCrawler,
  boolean isFallOnFront,
  boolean isFakeDead,
  boolean isKnockedDown,
  boolean isInvulnerable,
  boolean isSitting,
  float health,
  boolean isAnimRecording)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  boolean isCrawler,
  boolean isFallOnFront,
  boolean isFakeDead,
  boolean isKnockedDown,
  boolean isInvulnerable,
  boolean isSitting,
  float health,
  boolean isAnimRecording,
  float heightOffset)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  boolean isCrawler,
  boolean isFallOnFront,
  boolean isFakeDead,
  boolean isKnockedDown,
  boolean isInvulnerable,
  boolean isSitting,
  float health,
  boolean isAnimRecording,
  float heightOffset,
  boolean isRagdolling)`

  `static ArrayList<IsoZombie>`

  `addZombiesInOutfit(int x,
  int y,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  boolean isCrawler,
  boolean isFallOnFront,
  boolean isFakeDead,
  boolean isKnockedDown,
  boolean isInvulnerable,
  boolean isSitting,
  float health,
  boolean isAnimRecording,
  float heightOffset,
  boolean isRagdolling,
  boolean onFire)`

  `ArrayList<IsoZombie>`

  `addZombiesInOutfitArea(int x1,
  int y1,
  int x2,
  int y2,
  int z,
  int totalZombies,
  String outfit,
  Integer femaleChance)`

  `void`

  `addZombieSitting(int x,
  int y,
  int z)`

  `static void`

  `assaultPlayer()`

  `static void`

  `attachTrailerToPlayerVehicle(int playerIndex)`

  `static void`

  `backToSinglePlayer()`

  `static void`

  `banUnbanUserAction(String action,
  String username,
  String additionArgument)`

  `static void`

  `breakpoint()`

  `static boolean`

  `cacheFileExists(String filename)`

  `static void`

  `callLua(String func,
  Object param1)`

  `static Boolean`

  `callLuaBool(String func,
  Object params)`

  `static ArrayList<Object>`

  `callLuaReturn(String func,
  ArrayList<Object> params)`

  `static boolean`

  `canConnect()`

  `static boolean`

  `canInviteFriends()`

  `static boolean`

  `canModifyPlayerScoreboard()`

  Deprecated.

  `static boolean`

  `canSeePlayerStats()`

  `static void`

  `checkModsNeedUpdate(zombie.core.raknet.UdpConnection connection)`

  `static boolean`

  `checkPermissions(IsoPlayer player,
  Capability capability)`

  `static Boolean`

  `checkPlayerCanUseChat(String chatCommand)`

  `static boolean`

  `checkPlayerExistsInDatabase(String savedir,
  String player,
  String world)`

  `static boolean`

  `checkSaveFileExists(String f)`

  `static boolean`

  `checkSaveFolderExists(String f)`

  `static boolean`

  `checkSavePlayerExists()`

  `String`

  `checkServerName(String name)`

  `static boolean`

  `checkStringPattern(String pattern)`

  `static void`

  `clearPVPEvents()`

  `static Item`

  `cloneItemType(String newName,
  String oldName)`

  `static void`

  `configRoomFade(float seconds,
  float percent)`

  `static void`

  `configureLighting(float darkStep)`

  `static void`

  `connectionManagerLog(String event,
  String message)`

  `static void`

  `connectToServerStateCallback(String button)`

  `static se.krka.kahlua.vm.KahluaTable`

  `convertToPZNetTable(se.krka.kahlua.vm.KahluaTable table)`

  `static se.krka.kahlua.vm.KahluaTable`

  `copyTable(se.krka.kahlua.vm.KahluaTable table)`

  `static se.krka.kahlua.vm.KahluaTable`

  `copyTable(se.krka.kahlua.vm.KahluaTable to,
  se.krka.kahlua.vm.KahluaTable from)`

  `static byte`

  `createBuildAction(IsoPlayer player,
  float x,
  float y,
  float z,
  boolean north,
  String spriteName,
  se.krka.kahlua.vm.KahluaTable item)`

  `static void`

  `createHordeFromTo(float spawnX,
  float spawnY,
  float targetX,
  float targetY,
  int count)`

  `static void`

  `createHordeInAreaTo(int spawnX,
  int spawnY,
  int spawnW,
  int spawnH,
  int targetX,
  int targetY,
  int count)`

  `static byte`

  `createItemTransaction(IsoPlayer player,
  se.krka.kahlua.j2se.KahluaTableImpl table,
  ItemContainer src,
  ItemContainer dst)`

  `static Item`

  `createNewScriptItem(String base,
  String name,
  String display,
  String type,
  String icon)`

  `static Texture`

  `createQRCodeTex(String user,
  String key)`

  `static IsoDeadBody`

  `createRandomDeadBody(IsoGridSquare square,
  int blood)`

  `static se.krka.kahlua.vm.KahluaTable`

  `createRegionFile()`

  Create a dynamic table containing all spawnpoints.lua we find in vanilla
  folder + in loaded mods

  `static void`

  `createStory(String storyName)`

  `static void`

  `createTile(String tile,
  IsoGridSquare square)`

  `static void`

  `createWorld(String worldName)`

  `static IsoZombie`

  `createZombie(float x,
  float y,
  float z,
  SurvivorDesc desc,
  int palette,
  IsoDirections dir)`

  `static void`

  `debugFullyStreamedIn(int x,
  int y)`

  `static void`

  `debugLuaTable(Object param)`

  `static void`

  `debugLuaTable(Object param,
  int depth)`

  `static void`

  `debugSetRoomType(Double roomType)`

  `static void`

  `deleteAccountToAccountList(Account account)`

  `static void`

  `deleteAllGameModeSaves(String gameMode)`

  `static void`

  `deleteDatabase(String folder)`

  `static void`

  `deletePlayerFromDatabase(String savedir,
  String player,
  String world)`

  `static void`

  `deletePlayerSave(String fileName)`

  `static void`

  `deleteRole(String name)`

  `static void`

  `deleteSandboxPreset(String name)`

  `static void`

  `deleteSave(String folder)`

  `private static void`

  `deleteSavefileFilesMatching(File folder,
  String regex)`

  `private static void`

  `deleteSavefileFilesMatchingInSubdirectories(File folder,
  String regex)`

  `static void`

  `deleteServerToAccountList(Server server)`

  `static boolean`

  `detectBadWords(String text)`

  `static void`

  `disconnect()`

  `static void`

  `displayLUATable(se.krka.kahlua.vm.KahluaTable table)`

  `static void`

  `doChallenge(se.krka.kahlua.vm.KahluaTable challenge)`

  `static void`

  `doKeyPress(boolean doIt)`

  `static void`

  `doLuaDebuggerAction(String action)`

  `static void`

  `doTutorial(se.krka.kahlua.vm.KahluaTable tutorial)`

  `static void`

  `drawOverheadMap(UIElement ui,
  int level,
  float zoom,
  float xpos,
  float ypos)`

  `static void`

  `emulateAnimEvent(NetTimedAction action,
  long duration,
  String event,
  String parameter)`

  `static void`

  `emulateAnimEventOnce(NetTimedAction action,
  long duration,
  String event,
  String parameter)`

  `static void`

  `endFileInput()`

  `static void`

  `endFileOutput()`

  `static void`

  `endHelicopter()`

  `static void`

  `endTextFileInput()`

  `private static List<InventoryItem>`

  `extractItems(se.krka.kahlua.j2se.KahluaTableImpl table)`

  `static float`

  `fastfloor(float coord)`

  `static boolean`

  `fileExists(String filename)`

  `private static int`

  `findBestSplitPoint(String input,
  int maxSize)`

  `static void`

  `focusOnTab(Short id)`

  `static void`

  `forceChangeState(zombie.gameStates.GameState state)`

  `static void`

  `forceDisconnect()`

  `static void`

  `forceSnowCheck()`

  `static String`

  `generateSecretKey()`

  `static String`

  `getAbsoluteSaveFolderName(String f)`

  `static String`

  `getAccessLevel()`

  Deprecated.

  `static int`

  `getActionDuration(byte id)`

  `static ArrayList<String>`

  `getActivatedMods()`

  `static ArrayList<AnimalDefinitions>`

  `getAllAnimalsDefinitions()`

  `static ArrayList<String>`

  `getAllBeardStyles()`

  `static ArrayList<String>`

  `getAllDecalNamesForItem(InventoryItem item)`

  `static ArrayList<String>`

  `getAllHairStyles(boolean female)`

  `static ArrayList<Item>`

  `getAllItems()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getAllItemsForBodyLocation(String bodyLocation)`

  `static ArrayList<String>`

  `getAllOutfits(boolean female)`

  `static ArrayList<Recipe>`

  `getAllRecipes()`

  `static List<BufferedReader>`

  `getAllSavedPlayers()`

  Deprecated.

  `static ArrayList<String>`

  `getAllVehicles()`

  `static ArrayList<VoiceStyle>`

  `getAllVoiceStyles()`

  `static BaseAmbientStreamManager`

  `getAmbientStreamManager()`

  `static ArrayList<AnimalTracks>`

  `getAndFindNearestTracks(IsoGameCharacter chr)`

  `static IsoAnimal`

  `getAnimal(int id)`

  `static AnimalChunk`

  `getAnimalChunk(int x,
  int y)`

  `static AnimationViewerState`

  `getAnimationViewerState()`

  `static AttachmentEditorState`

  `getAttachmentEditorState()`

  `Double`

  `getAverageFSP()`

  `static void`

  `getBannedIPs()`

  `static void`

  `getBannedSteamIDs()`

  `static zombie.audio.BaseSoundBank`

  `getBaseSoundBank()`

  `static BeardStyles`

  `getBeardStylesInstance()`

  `static IsoGameCharacter`

  `getBehaviourDebugPlayer()`

  `static GameVersion`

  `getBreakModGameVersion()`

  `static int`

  `getButtonCount(int joypad)`

  `static int`

  `getCallframeTop(Coroutine c)`

  `static float`

  `getCameraOffX()`

  `static float`

  `getCameraOffY()`

  `static ArrayList<Capability>`

  `getCapabilities()`

  `static IsoCell`

  `getCell()`

  `static int`

  `getCellMaxX()`

  `static int`

  `getCellMaxY()`

  `static int`

  `getCellMinX()`

  `static int`

  `getCellMinY()`

  `static Double`

  `getCellSizeInChunks()`

  `static Double`

  `getCellSizeInSquares()`

  `static List<CheatType>`

  `getCheatTypes()`

  `static Double`

  `getChunkSizeInSquares()`

  `static Field`

  `getClassField(Object o,
  int i)`

  `static Object`

  `getClassFieldVal(Object o,
  Field field)`

  `static Method`

  `getClassFunction(Object o,
  int i)`

  `static String`

  `getClassSimpleName(Object object)`

  `static String`

  `getClientUsername()`

  `static ClimateManager`

  `getClimateManager()`

  `static ClimateMoon`

  `getClimateMoon()`

  `static CombatConfig`

  `getCombatConfig()`

  `static ArrayList<IsoPlayer>`

  `getConnectedPlayers()`

  `ContainerOverlays`

  `getContainerOverlays()`

  `static float`

  `getControllerAxisValue(int c,
  int axis)`

  `static int`

  `getControllerCount()`

  `static float`

  `getControllerDeadZone(int c,
  int axis)`

  `static String`

  `getControllerGUID(int joypad)`

  `static String`

  `getControllerName(int joypad)`

  `static float`

  `getControllerPovX(int c)`

  `static float`

  `getControllerPovY(int c)`

  `static Core`

  `getCore()`

  `static se.krka.kahlua.vm.LuaCallFrame`

  `getCoroutineCallframeStack(Coroutine c,
  int n)`

  `static Object`

  `getCoroutineObjStack(Coroutine c,
  int n)`

  `static Object`

  `getCoroutineObjStackWithBase(Coroutine c,
  int n)`

  `static int`

  `getCoroutineTop(Coroutine c)`

  `long`

  `getCPUTime()`

  `long`

  `getCPUWait()`

  `static Coroutine`

  `getCurrentCoroutine()`

  `static String`

  `getCurrentSaveName()`

  `static String`

  `getCurrentUserProfileName()`

  `static String`

  `getCurrentUserSteamID()`

  `static void`

  `getCustomizationData(String username,
  String pwd,
  String ip,
  String port,
  String serverPassword,
  String serverName,
  boolean doHash)`

  `static boolean`

  `getDebug()`

  `static DebugOptions`

  `getDebugOptions()`

  `static IsoDirections`

  `getDirectionTo(IsoGameCharacter chara,
  IsoObject objTarget)`

  `static EditVehicleState`

  `getEditVehicleState()`

  `static ErosionMain`

  `getErosion()`

  `static Stack<EvolvedRecipe>`

  `getEvolvedRecipes()`

  `static IsoGameCharacter`

  `getFakeAttacker()`

  `static DataInputStream`

  `getFileInput(String filename)`

  `static String`

  `getFilenameOfCallframe(se.krka.kahlua.vm.LuaCallFrame c)`

  `static String`

  `getFilenameOfClosure(se.krka.kahlua.vm.LuaClosure c)`

  `static DataOutputStream`

  `getFileOutput(String filename)`

  `static BufferedReader`

  `getFileReader(String filename,
  boolean createIfNull)`

  `static String`

  `getFileSeparator()`

  `static LuaManager.GlobalObject.LuaFileWriter`

  `getFileWriter(String filename,
  boolean createIfNull,
  boolean append)`

  `static int`

  `getFirstLineOfClosure(se.krka.kahlua.vm.LuaClosure c)`

  `static ArrayList<String>`

  `getFMODEventPathList()`

  `static zombie.audio.BaseSoundBank`

  `getFMODSoundBank()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getFriendsList()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getFullSaveDirectoryTable()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getFunctionsForFile(String filename)`

  `static zombie.network.GameClient`

  `getGameClient()`

  `static DataInputStream`

  `getGameFilesInput(String filename)`

  `static BufferedReader`

  `getGameFilesTextInput(String filename)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getGameLocal()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getGameRemote()`

  `static int`

  `getGameSpeed()`

  `static GameTime`

  `getGameTime()`

  `static long`

  `getGametimeTimestamp()`

  `static String`

  `getGameVersion()`

  `long`

  `getGPUTime()`

  `long`

  `getGPUWait()`

  `static HairStyles`

  `getHairStylesInstance()`

  `static String`

  `getHostByName(String hostname)`

  `static String`

  `getHourMinute()`

  `static IsoHutch`

  `getHutch(int x,
  int y,
  int z)`

  `static ArrayList<GameEntity>`

  `getIsoEntitiesDebug()`

  `static IsoMarkers`

  `getIsoMarkers()`

  `static String`

  `getISUIStackTrace(int maxDepth)`

  `static Item`

  `getItem(String itemType)`

  `static float`

  `getItemActualWeight(String itemType)`

  `static int`

  `getItemConditionMax(String itemType)`

  `static int`

  `getItemCount(String itemType)`

  `static String`

  `getItemDisplayName(String itemType)`

  `static String`

  `getItemEvolvedRecipeName(String itemType)`

  `static String`

  `getItemFoodType(String itemType)`

  `static String`

  `getItemName(String itemType)`

  `static String`

  `getItemNameFromFullType(String fullType)`

  `static String`

  `getItemStaticModel(String itemType)`

  `static Texture`

  `getItemTex(String itemType)`

  `static String`

  `getItemText(String txt)`

  `private static String`

  `getItemTextureColor(Item item,
  String param)`

  `static String`

  `getItemTextureName(String itemType)`

  `static int`

  `getItemTransactionDuration(byte id)`

  `static float`

  `getItemWeight(String itemType)`

  `static float`

  `getJoypadAimingAxisX(int joypad)`

  `static float`

  `getJoypadAimingAxisY(int joypad)`

  `static float`

  `getJoypadMovementAxisX(int joypad)`

  `static float`

  `getJoypadMovementAxisY(int joypad)`

  `static int`

  `getKeyCode(String keyName)`

  `static String`

  `getKeyName(int key)`

  `static String`

  `getLastPlayedDate(String filename)`

  `static List<String>`

  `getLastStandPlayerFileNames()`

  `static String`

  `getLastStandPlayersDirectory()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getLatestSave()`

  `static int`

  `getLineNumber(se.krka.kahlua.vm.LuaCallFrame c)`

  `static String`

  `getLoadedLua(int n)`

  `static int`

  `getLoadedLuaCount()`

  `static int`

  `getLocalVarCount(Coroutine c)`

  `static int`

  `getLocalVarCount(se.krka.kahlua.vm.LuaCallFrame callFrame)`

  `static String`

  `getLocalVarName(Coroutine c,
  int n)`

  `static String`

  `getLocalVarName(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n)`

  `static int`

  `getLocalVarStack(Coroutine c,
  int n)`

  `static int`

  `getLocalVarStackIndex(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n)`

  `int`

  `getLoosingXpTick(Object timer)`

  `int`

  `getLoosingXpValue()`

  `static ArrayList<String>`

  `getLotDirectories()`

  `static int`

  `getLuaDebuggerErrorCount()`

  `static ArrayList<String>`

  `getLuaDebuggerErrors()`

  `static ArrayList<String>`

  `getLuaStackTrace()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getMapDirectoryTable()`

  `static ArrayList<String>`

  `getMapFoldersForMod(String modID)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getMapInfo(String mapDir)`

  `static int`

  `getMaxActivePlayers()`

  `static Double`

  `getMaximumWorldLevel()`

  `static Double`

  `getMaxPlayers()`

  `static String`

  `getMethodParameter(Method o,
  int i)`

  `static int`

  `getMethodParameterCount(Method o)`

  `static Double`

  `getMinimumWorldLevel()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getModDirectoryTable()`

  `static BufferedReader`

  `getModFileReader(String modId,
  String filename,
  boolean createIfNull)`

  `static LuaManager.GlobalObject.LuaFileWriter`

  `getModFileWriter(String modId,
  String filename,
  boolean createIfNull,
  boolean append)`

  `static ChooseGameInfo.Mod`

  `getModInfo(String modDir)`

  `static ChooseGameInfo.Mod`

  `getModInfoByID(String modID)`

  `static List<String>`

  `getMods()`

  `static int`

  `getMouseX()`

  `static int`

  `getMouseXScaled()`

  `static int`

  `getMouseY()`

  `static int`

  `getMouseYScaled()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getMPStatus()`

  `static String`

  `getMyDocumentFolder()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getNetworkLocal()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getNetworkRemote()`

  `static int`

  `getNumActivePlayers()`

  `static int`

  `getNumClassFields(Object o)`

  `static int`

  `getNumClassFunctions(Object o)`

  `static ArrayList<IsoPlayer>`

  `getOnlinePlayers()`

  `static String`

  `getOnlineUsername()`

  `static PerformanceSettings`

  `getPerformance()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getPerformanceLocal()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getPerformanceRemote()`

  `InventoryItem`

  `getPickedUpFish(IsoPlayer player)`

  `static IsoPlayer`

  `getPlayer()`

  `static IsoPlayer`

  `getPlayerByOnlineID(int id)`

  `static IsoPlayer`

  `getPlayerFromUsername(String username)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getPlayerInfo(IsoPlayer player)`

  `static int`

  `getPlayerScreenHeight(int player)`

  `static int`

  `getPlayerScreenLeft(int player)`

  `static int`

  `getPlayerScreenTop(int player)`

  `static int`

  `getPlayerScreenWidth(int player)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getPublicServersList()`

  `static IsoPuddles`

  `getPuddlesManager()`

  `static RadioAPI`

  `getRadioAPI()`

  `static String`

  `getRandomUUID()`

  `static String`

  `getRecipeDisplayName(String name)`

  `static String`

  `getReconnectCountdownTimer()`

  `static Boolean`

  `getRemotePlayModeActive()`

  `static SpriteRenderer`

  `getRenderer()`

  `static ArrayList<Role>`

  `getRoles()`

  `static SandboxOptions`

  `getSandboxOptions()`

  `static List<String>`

  `getSandboxPresets()`

  `static ArrayList<File>`

  `getSaveDirectory(String folder)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getSaveDirectoryTable()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getSaveInfo(String saveDir)`

  `static String`

  `getSaveName(File file)`

  `static ScriptManager`

  `getScriptManager()`

  `static SeamEditorState`

  `getSeamEditorState()`

  `static SearchMode`

  `getSearchMode()`

  `static String`

  `getServerAddressFromArgs()`

  `int`

  `getServerFPS()`

  `static String`

  `getServerIP()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getServerList()`

  `static String`

  `getServerListFile()`

  Deprecated.

  `static void`

  `getServerModData()`

  `static String`

  `getServerName()`

  `static ServerOptions`

  `getServerOptions()`

  `static String`

  `getServerPasswordFromArgs()`

  `static String`

  `getServerPort()`

  `static int`

  `getServerSavedWorldVersion(String saveFolder)`

  `static ServerSettingsManager`

  `getServerSettingsManager()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getServerSpawnRegions()`

  `static String`

  `getShortenedFilename(String str)`

  `static SleepingEvent`

  `getSleepingEvent()`

  `static SLSoundManager`

  `getSLSoundManager()`

  `static BaseSoundManager`

  `getSoundManager()`

  `static IsoPlayer`

  `getSpecificPlayer(int player)`

  `static IsoSprite`

  `getSprite(String sprite)`

  `static IsoSpriteManager`

  `getSpriteManager(String sprite)`

  `static SpriteModelEditorState`

  `getSpriteModelEditorState()`

  `static IsoGridSquare`

  `getSquare(double x,
  double y,
  double z)`

  `static Texture`

  `getSteamAvatarFromSteamID(String steamID)`

  `static Texture`

  `getSteamAvatarFromUsername(String username)`

  `static String`

  `getSteamIDFromUsername(String username)`

  `static Boolean`

  `getSteamModeActive()`

  `static String`

  `getSteamProfileNameFromSteamID(String steamID)`

  `static String`

  `getSteamProfileNameFromUsername(String username)`

  `static boolean`

  `getSteamScoreboard()`

  `static ArrayList<String>`

  `getSteamWorkshopItemIDs()`

  `static ArrayList<ChooseGameInfo.Mod>`

  `getSteamWorkshopItemMods(String itemIDStr)`

  `static ArrayList<SteamWorkshopItem>`

  `getSteamWorkshopStagedItems()`

  `static Boolean`

  `getStreamModeActive()`

  `static List<WorldMapStreet>`

  `getStreets(zombie.worldMap.streets.WorldMapStreets worldMapStreets)`

  `static String`

  `getText(String txt,
  Object... args)`

  `static TextManager`

  `getTextManager()`

  `static String`

  `getTextMediaEN(String txt)`

  `static String`

  `getTextOrNull(String txt,
  Object... args)`

  `static Texture`

  `getTexture(String filename)`

  `static Texture`

  `getTextureFromSaveDir(String filename,
  String saveName)`

  `static void`

  `getTickets(String author)`

  `static TileGeometryState`

  `getTileGeometryState()`

  `TileOverlays`

  `getTileOverlays()`

  `static long`

  `getTimeInMillis()`

  `static void`

  `getTimerKept(String clazzStr,
  String field)`

  `static long`

  `getTimestamp()`

  `static long`

  `getTimestampMs()`

  `static String`

  `getTwoLetters(String input)`

  `static ArrayList<NetworkUser>`

  `getUsers()`

  `static BaseVehicle`

  `getVehicleById(int id)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getVehicleInfo(BaseVehicle vehicle)`

  `static VehicleZone`

  `getVehicleZoneAt(int x,
  int y,
  int z)`

  `static VideoTexture`

  `getVideo(String filename,
  int width,
  int height)`

  `static VoiceStyles`

  `getVoiceStylesInstance()`

  `static WarManager.War`

  `getWarNearest()`

  `static ArrayList<WarManager.War>`

  `getWars()`

  `static IsoWorld`

  `getWorld()`

  `static WorldMarkers`

  `getWorldMarkers()`

  `static WorldSoundManager`

  `getWorldSoundManager()`

  `static se.krka.kahlua.vm.KahluaTable`

  `getZombieInfo(IsoZombie zombie)`

  `static ZomboidRadio`

  `getZomboidRadio()`

  `static Zone`

  `getZone(int x,
  int y,
  int z)`

  `static ArrayList<Zone>`

  `getZones(int x,
  int y,
  int z)`

  `static boolean`

  `hasBreakpoint(String file,
  int line)`

  `static boolean`

  `hasDataBreakpoint(se.krka.kahlua.vm.KahluaTable table,
  Object key)`

  `static boolean`

  `hasDataReadBreakpoint(se.krka.kahlua.vm.KahluaTable table,
  Object key)`

  `static boolean`

  `hasItemTag(String itemType,
  ItemTag itemTag)`

  `private static boolean`

  `hasRelativePath(String path)`

  `static boolean`

  `haveAccess(String access)`

  Deprecated.

  `static void`

  `initUISystem()`

  `static InventoryItem`

  `instanceItem(String item)`

  `static InventoryItem`

  `instanceItem(String item,
  float useDelta)`

  `static InventoryItem`

  `instanceItem(Item item)`

  `static InventoryItem`

  `instanceItem(ItemKey item)`

  `static boolean`

  `instof(Object obj,
  String name)`

  `static void`

  `invalidateLighting()`

  `static void`

  `inviteFriend(String steamID)`

  `static void`

  `InvMngGetItem(long itemId,
  String itemType,
  int playerID,
  String username)`

  `static void`

  `InvMngRemoveItem(long itemId,
  int playerID,
  String username)`

  `static void`

  `InvMngUpdateItem(InventoryItem item,
  int playerID)`

  `static boolean`

  `isAccessLevel(String accessLevel)`

  Deprecated.

  `static boolean`

  `isActionDone(byte id)`

  `static boolean`

  `isActionRejected(byte id)`

  `static boolean`

  `isAdmin()`

  `static boolean`

  `isAltKeyDown()`

  `static boolean`

  `isAnimationRecorderActive()`

  `static boolean`

  `isClient()`

  `static boolean`

  `isControllerConnected(int index)`

  `static boolean`

  `isCoopHost()`

  `static boolean`

  `isCtrlKeyDown()`

  `static boolean`

  `isCurrentExecutionPoint(String file,
  int line)`

  `static boolean`

  `isDebugEnabled()`

  `static boolean`

  `isDemo()`

  `static boolean`

  `isDesktopOpenSupported()`

  `static boolean`

  `isFloatingGamepadTextInputVisible()`

  `static boolean`

  `isGamePaused()`

  `static boolean`

  `isIngameState()`

  `private static boolean`

  `isInvalidForRenameSavefile(String path)`

  `static boolean`

  `isItemFood(String itemType)`

  `static boolean`

  `isItemFresh(String itemType,
  float age)`

  `static boolean`

  `isItemTransactionConsistent(InventoryItem item,
  ItemContainer src,
  ItemContainer dst,
  String extra,
  IsoPlayer player)`

  `static boolean`

  `isItemTransactionDone(byte id)`

  `static boolean`

  `isItemTransactionRejected(byte id)`

  `static boolean`

  `isJoypadConnected(int index)`

  `static boolean`

  `isJoypadDown(int joypad)`

  `static boolean`

  `isJoypadLBPressed(int joypad)`

  `static boolean`

  `isJoypadLeft(int joypad)`

  `static boolean`

  `isJoypadLeftStickButtonPressed(int joypad)`

  `static boolean`

  `isJoypadLTPressed(int joypad)`

  `static boolean`

  `isJoypadRBPressed(int joypad)`

  `static boolean`

  `isJoypadRight(int joypad)`

  `static boolean`

  `isJoypadRightStickButtonPressed(int joypad)`

  `static boolean`

  `isJoypadRTPressed(int joypad)`

  `static boolean`

  `isJoypadUp(int joypad)`

  `static boolean`

  `isKeyDown(int key)`

  `static boolean`

  `isKeyDown(String keyName)`

  `static boolean`

  `isKeyPressed(int key)`

  `static boolean`

  `isKeyPressed(String keyName)`

  `static boolean`

  `isMetaKeyDown()`

  `static boolean`

  `isModActive(ChooseGameInfo.Mod mod)`

  `static boolean`

  `isMouseButtonDown(int number)`

  `static boolean`

  `isMouseButtonPressed(int number)`

  `static boolean`

  `isMultiplayer()`

  `static IsoRegionsRenderer`

  `isoRegionsRenderer()`

  `static float`

  `isoToScreenX(int player,
  float x,
  float y,
  float z)`

  `static float`

  `isoToScreenY(int player,
  float x,
  float y,
  float z)`

  `static boolean`

  `isPlaystationController(int id)`

  `static boolean`

  `isPublicServerListAllowed()`

  `private static boolean`

  `isPunctuation(char c)`

  `static boolean`

  `isQuitCooldown()`

  `static boolean`

  `isServer()`

  `static boolean`

  `isServerSoftReset()`

  `static boolean`

  `isShiftKeyDown()`

  `static boolean`

  `isShowConnectionInfo()`

  `static boolean`

  `isShowServerInfo()`

  `static boolean`

  `isSoundPlaying(Object sound)`

  `static boolean`

  `isSteamOverlayEnabled()`

  `static boolean`

  `isSteamRunningOnSteamDeck()`

  `static boolean`

  `isSteamServerBrowserEnabled()`

  `static boolean`

  `isSystemLinux()`

  `static boolean`

  `isSystemMacOS()`

  `static boolean`

  `isSystemWindows()`

  `static boolean`

  `isType(Object obj,
  String name)`

  `static boolean`

  `isValidSteamID(String s)`

  `static boolean`

  `isValidUserName(String user)`

  `static boolean`

  `isXBOXController()`

  `static Object`

  `javaListRemoveAt(List<?> javaList,
  int index)`

  `static String`

  `lineSeparator()`

  `private static void`

  `listFilesInDirectoryAux(String absPath,
  ArrayList<String> result)`

  `static ArrayList<String>`

  `listFilesInModDirectory(String modID,
  String directory)`

  `static ArrayList<String>`

  `listFilesInZomboidLuaDirectory(String directory)`

  `static zombie.core.skinnedmodel.model.Model`

  `loadSkinnedZomboidModel(String name,
  String loc,
  String tex)`

  `static zombie.core.skinnedmodel.model.Model`

  `loadStaticZomboidModel(String name,
  String loc,
  String tex)`

  `static zombie.core.skinnedmodel.model.Model`

  `loadVehicleModel(String name,
  String loc,
  String tex)`

  `static zombie.core.skinnedmodel.model.Model`

  `loadZomboidModel(String name,
  String mesh,
  String tex,
  String shader,
  boolean bStatic)`

  `static String`

  `localVarName(Coroutine c,
  int n)`

  `static void`

  `log(DebugType type,
  String message)`

  `static void`

  `luaDebug()`

  `static void`

  `manipulateSavefile(String folder,
  String action)`

  `static se.krka.kahlua.vm.KahluaTable`

  `mergeTable(se.krka.kahlua.vm.KahluaTable... tables)`

  `static String`

  `moduleDotType(String module,
  String type)`

  `static void`

  `moveRole(byte dir,
  String roleName)`

  `static void`

  `networkUserAction(String action,
  String username,
  String additionArgument)`

  `void`

  `NewMapBinaryFile(String cmd)`

  `static void`

  `openURl(String url)`

  `static void`

  `pauseSoundAndMusic()`

  `static void`

  `ping(String username,
  String pwd,
  String ip,
  String port,
  boolean doHash)`

  `static void`

  `playServerSound(String sound,
  IsoGridSquare sq)`

  `static void`

  `ProceedFactionMessage(String message)`

  `static String`

  `proceedPM(String command)`

  `static void`

  `ProcessAdminChatMessage(String message)`

  `static void`

  `processGeneralMessage(String message)`

  `static void`

  `ProcessSafehouseMessage(String message)`

  `static void`

  `processSayMessage(String message)`

  `static void`

  `processShoutMessage(String message)`

  `static boolean`

  `profanityFilterCheck(String text)`

  Return true if a profanity was found

  `static void`

  `querySteamWorkshopItemDetails(ArrayList<String> itemIDs,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg1)`

  `static void`

  `queueCharEvent(String eventChar)`

  `static void`

  `queueKeyEvent(int lwjglKeyCode)`

  `static void`

  `rainConfig(String cmd,
  int arg)`

  `static boolean`

  `reactivateJoypadAfterResetLua()`

  `static void`

  `refreshAnimSets(boolean reload)`

  `static void`

  `reloadActionGroups()`

  `static void`

  `reloadControllerConfigFiles()`

  `static void`

  `reloadEngineRPM()`

  `static void`

  `reloadEntitiesDebug()`

  `static void`

  `reloadEntityDebug(GameEntity entity)`

  `static void`

  `reloadEntityFromScriptDebug(GameEntity entity)`

  `static void`

  `reloadEntityScripts()`

  `static Object`

  `reloadLuaFile(String filename)`

  `static void`

  `reloadModelsMatching(String meshName)`

  `static void`

  `reloadScripts(ScriptType type)`

  `static Object`

  `reloadServerLuaFile(String filename)`

  `static void`

  `reloadSoundFiles()`

  `static void`

  `reloadVehicles()`

  `static void`

  `reloadVehicleTextures(String scriptName)`

  `static void`

  `reloadXui()`

  `static void`

  `removeAction(byte id,
  boolean isCanceled)`

  `static void`

  `removeAllVehicles(IsoPlayer player)`

  `static void`

  `removeAnimal(int id)`

  `static void`

  `removeItemTransaction(byte id,
  boolean isCanceled)`

  `static void`

  `removeTicket(int ticketID)`

  `static void`

  `removeUserlog(String user,
  String type,
  String text)`

  `static void`

  `removeVehicle(IsoPlayer player,
  BaseVehicle baseVehicle)`

  `static boolean`

  `renameSaveFile(String gameMode,
  String oldName,
  String newName)`

  `void`

  `Render3DItem(InventoryItem item,
  IsoGridSquare sq,
  float xoffset,
  float yoffset,
  float zoffset,
  float rotation)`

  `static void`

  `renderIsoCircle(float x,
  float y,
  float z,
  float radius,
  int segments,
  int thickness,
  float r,
  float g,
  float b,
  float a)`

  `static void`

  `renderIsoLine(float x,
  float y,
  float z,
  float tx,
  float ty,
  float tz,
  int thickness,
  float r,
  float g,
  float b,
  float a)`

  `static void`

  `renderIsoRect(float x,
  float y,
  float z,
  float radius,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `static void`

  `renderLine(float x,
  float y,
  float z,
  float tx,
  float ty,
  float tz,
  float r,
  float g,
  float b,
  float a)`

  `static void`

  `replaceItemInContainer(ItemContainer container,
  InventoryItem oldItem,
  InventoryItem newItem)`

  `static String`

  `replaceWith(String toReplace,
  String regex,
  String by)`

  `static void`

  `requestMedicalCheck(IsoPlayer target,
  IsoPlayer requester)`

  `static void`

  `requestPVPEvents()`

  `static void`

  `requestRoles()`

  `static void`

  `requestTrading(IsoPlayer you,
  IsoPlayer other)`

  `static void`

  `requestUserlog(String user)`

  `static void`

  `requestUsers()`

  `static Object`

  `require(String f)`

  `static void`

  `resetRegionFile()`

  `static void`

  `resetTimers(String clazzStr)`

  `static void`

  `resumeSoundAndMusic()`

  `static void`

  `revertToKeyboardAndMouse()`

  `static void`

  `revertToKeyboardAndMouseFromMainMenu()`

  `static String`

  `sanitizeWorldName(String worldName)`

  `static void`

  `save(boolean doCharacter)`

  `static void`

  `saveControllerSettings(int c)`

  `static void`

  `saveGame()`

  `static void`

  `saveModsFile()`

  `static void`

  `scoreboardUpdate()`

  `static float`

  `screenToIsoX(int player,
  float x,
  float y,
  float z)`

  `static float`

  `screenToIsoY(int player,
  float x,
  float y,
  float z)`

  `void`

  `screenZoomIn()`

  `void`

  `screenZoomOut()`

  `static void`

  `sendAddAnimalFromHandsInTrailer(IsoAnimal animal,
  IsoPlayer player,
  BaseVehicle vehicle)`

  `static void`

  `sendAddAnimalFromHandsInTrailer(IsoDeadBody animal,
  IsoPlayer player,
  BaseVehicle vehicle)`

  `static void`

  `sendAddAnimalInTrailer(IsoAnimal animal,
  IsoPlayer player,
  BaseVehicle vehicle)`

  `static void`

  `sendAddAnimalInTrailer(IsoDeadBody animal,
  IsoPlayer player,
  BaseVehicle vehicle)`

  `static void`

  `sendAddItemsToContainer(ItemContainer container,
  ArrayList<InventoryItem> items)`

  `static void`

  `sendAddItemToContainer(ItemContainer container,
  InventoryItem item)`

  `static void`

  `sendAnimalGenome(IsoAnimal animal)`

  `static void`

  `sendAttachedItem(IsoGameCharacter character,
  String location,
  InventoryItem item)`

  `static void`

  `sendButcherAnimal(IsoDeadBody body,
  IsoPlayer player)`

  `static void`

  `sendClientCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendClientCommand(IsoPlayer player,
  String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `sendClientCommandV(IsoPlayer player,
  String module,
  String command,
  Object... values)`

  `static void`

  `sendClothing(IsoPlayer player,
  ItemBodyLocation location,
  InventoryItem item)`

  `static void`

  `SendCommandToServer(String command)`

  `static void`

  `sendCorpse(IsoDeadBody body)`

  `static void`

  `sendDamage(IsoPlayer player)`

  `static void`

  `sendDebugStory(IsoGridSquare square,
  int type,
  String name)`

  `static void`

  `sendEquip(IsoPlayer player)`

  `static void`

  `sendFactionChangeOwner(Faction faction,
  String username)`

  `static void`

  `sendFactionChangeTag(Faction faction)`

  `static void`

  `sendFactionChangeTitle(Faction faction,
  String title)`

  `static void`

  `sendFactionCreate(String title,
  String host)`

  `static void`

  `sendFactionDisband(Faction faction)`

  `static void`

  `sendFactionInvite(Faction faction,
  String host,
  String invited)`

  `static void`

  `sendFactionRemoveMember(Faction faction,
  String username)`

  `static void`

  `sendFactionStatsChange(IsoPlayer player)`

  `static void`

  `sendFeedAnimalFromHand(IsoAnimal animal,
  IsoPlayer player,
  InventoryItem item)`

  `void`

  `sendForagePool(IsoPlayer player,
  String zoneId,
  se.krka.kahlua.vm.KahluaTable icons)`

  `void`

  `sendForageRequestZone(IsoPlayer player,
  String focus)`

  `void`

  `sendForageSpot(IsoPlayer player,
  String iconID)`

  `static void`

  `sendGoogleAuth(String username,
  String code)`

  `static void`

  `sendHitPlayer(IsoPlayer target,
  String damage,
  String range)`

  Deprecated.

  `static void`

  `sendHitVehicle(IsoGameCharacter target,
  String damage,
  boolean isTargetHitFromBehind,
  String vehicleSpeed)`

  Deprecated.

  `static void`

  `sendHitZombie(IsoPlayer target)`

  Deprecated.

  `static void`

  `sendHumanVisual(IsoPlayer player)`

  `static void`

  `sendHutchGrabAnimal(IsoAnimal animal,
  IsoPlayer player,
  IsoObject object,
  InventoryItem item)`

  `static void`

  `sendHutchGrabCorpseAction(IsoAnimal animal,
  IsoPlayer player,
  IsoObject object,
  InventoryItem item)`

  `static void`

  `sendHutchRemoveAnimalAction(IsoAnimal animal,
  IsoPlayer player,
  IsoObject object)`

  `void`

  `sendIconFound(IsoPlayer player,
  String type,
  float distanceTraveled)`

  `static boolean`

  `sendItemListNet(IsoPlayer sender,
  ArrayList<InventoryItem> items,
  IsoPlayer receiver,
  String transferID,
  String custom)`

  `static void`

  `sendItemsInContainer(IsoObject obj,
  ItemContainer container)`

  `static void`

  `sendItemStats(InventoryItem item)`

  `static void`

  `sendPersonalColor(IsoPlayer player)`

  `static void`

  `sendPickupAnimal(IsoAnimal animal,
  IsoPlayer player,
  AnimalInventoryItem item)`

  `static void`

  `sendPickupAnimalFromTrap(IsoAnimal animal,
  IsoPlayer player,
  AnimalInventoryItem item)`

  `static void`

  `sendPing()`

  `static void`

  `sendPlayerEffects(IsoPlayer player)`

  `static void`

  `sendPlayerExtraInfo(IsoPlayer p)`

  `void`

  `sendPlayerNutrition(IsoPlayer player)`

  `void`

  `sendPlayerStat(IsoPlayer player,
  CharacterStat stat)`

  `static void`

  `sendPlayerStatsChange(IsoPlayer player)`

  `void`

  `sendPlaySound(String sound,
  boolean loop,
  IsoMovingObject object)`

  `static void`

  `sendRemoveAndGrabAnimalFromTrailer(IsoAnimal animal,
  IsoPlayer player,
  BaseVehicle vehicle,
  InventoryItem item)`

  `static void`

  `sendRemoveAndGrabAnimalFromTrailer(IsoDeadBody animal,
  IsoPlayer player,
  BaseVehicle vehicle,
  InventoryItem item)`

  `static void`

  `sendRemoveAnimalFromTrailer(IsoAnimal animal,
  IsoPlayer player,
  BaseVehicle vehicle)`

  `static void`

  `sendRemoveItemFromContainer(ItemContainer container,
  InventoryItem item)`

  `static void`

  `sendRemoveItemsFromContainer(ItemContainer container,
  ArrayList<InventoryItem> items)`

  `static void`

  `sendReplaceItemInContainer(ItemContainer container,
  InventoryItem oldItem,
  InventoryItem newItem)`

  `static void`

  `sendRequestInventory(int id,
  String username)`

  `static void`

  `sendSafehouseChangeMember(SafeHouse safehouse,
  String player)`

  `static void`

  `sendSafehouseChangeOwner(SafeHouse safehouse,
  String username)`

  `static void`

  `sendSafehouseChangeRespawn(SafeHouse safehouse,
  String player,
  boolean doRemove)`

  `static void`

  `sendSafehouseChangeTitle(SafeHouse safehouse,
  String title)`

  `static void`

  `sendSafehouseClaim(IsoGridSquare square,
  IsoPlayer player,
  String title)`

  `static void`

  `sendSafehouseInvite(SafeHouse safehouse,
  String host,
  String invited)`

  `static void`

  `sendSafehouseRelease(SafeHouse safehouse)`

  `static void`

  `sendSafezoneClaim(String username,
  int x,
  int y,
  int h,
  int w,
  String title)`

  `static void`

  `sendSecretKey(String username,
  String pwd,
  String ip,
  int port,
  String serverPassword,
  boolean doHash,
  int authType,
  String secretKey)`

  `static void`

  `sendServerCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendServerCommand(IsoPlayer player,
  String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `sendServerCommandV(String module,
  String command,
  Object... values)`

  `static void`

  `sendSwitchSeat(BaseVehicle vehicle,
  IsoGameCharacter chr,
  int seatFrom,
  int seatTo)`

  `static void`

  `sendSyncPlayerFields(IsoPlayer player,
  byte syncParams)`

  `static void`

  `sendVisual(IsoPlayer player)`

  `static void`

  `sendWarManagerUpdate(int onlineID,
  String attacker,
  WarManager.State state)`

  `static void`

  `serverConnect(String user,
  String pass,
  String server,
  String localIP,
  String port,
  String serverPassword,
  String serverName,
  boolean useSteamRelay,
  boolean doHash,
  int authtype,
  String secretKey)`

  `static void`

  `serverConnectCoop(String serverSteamID)`

  `static boolean`

  `serverFileExists(String filename)`

  `static void`

  `setActivePlayer(int id)`

  `static void`

  `setAdmin()`

  `static void`

  `setAggroTarget(int id,
  int x,
  int y)`

  `static void`

  `setAnimationRecorderActive(boolean setActive)`

  `static void`

  `setBehaviorStep(boolean b)`

  `static void`

  `setControllerDeadZone(int c,
  int axis,
  float value)`

  `static void`

  `setDebugToggleControllerPluggedIn(int index)`

  `static void`

  `setDefaultRoleFor(String defaultId,
  String roleName)`

  `static void`

  `setGameSpeed(int newSpeed)`

  `static void`

  `setIgnoreInputsForDirection(int id,
  boolean bActive)`

  `static void`

  `setJoypadIgnoreAim(int id,
  boolean bActive)`

  `static void`

  `setJoypadIgnoreAimUntilCentered(int id,
  boolean bActive)`

  `static void`

  `setMinMaxZombiesPerChunk(float min,
  float max)`

  `static void`

  `setModelMetaData(String name,
  String mesh,
  String tex,
  String shader,
  boolean bStatic)`

  `static void`

  `setMouseXY(int x,
  int y)`

  `static void`

  `setPlayerButtonsActive(int id,
  boolean bActive)`

  `static void`

  `setPlayerJoypad(int player,
  int joypad,
  IsoPlayer playerObj,
  String username,
  boolean allowNewPlayer)`

  `static void`

  `setPlayerMouse(IsoPlayer playerObj)`

  `static void`

  `setProgressBarValue(IsoPlayer player,
  int value)`

  `static void`

  `setPuddles(float initialPuddles)`

  `static void`

  `setSavefilePlayer1(String gameMode,
  String saveDir,
  int sqlID)`

  `static void`

  `setShowConnectionInfo(boolean enabled)`

  `static void`

  `setShowPausedMessage(boolean b)`

  `static void`

  `setShowServerInfo(boolean enabled)`

  `static void`

  `setSpawnRegion(String spawnRegionName)`

  `static void`

  `setupRole(Role role,
  String description,
  Color color,
  se.krka.kahlua.vm.KahluaTable capabilitiesRaw)`

  `static void`

  `setZoomLevels(Double... zooms)`

  `static void`

  `showAnimationViewer()`

  `static void`

  `showAttachmentEditor()`

  `static void`

  `showChunkDebugger()`

  `static void`

  `showDebugInfoInChat(String msg)`

  `static void`

  `showFolderInDesktop(String folder)`

  `static void`

  `showGlobalObjectDebugger()`

  `static void`

  `showSeamEditor()`

  `static void`

  `showSpriteModelEditor()`

  `static boolean`

  `showSteamFloatingGamepadTextInput(boolean multiLine,
  int x,
  int y,
  int width,
  int height)`

  `static boolean`

  `showSteamGamepadTextInput(boolean password,
  boolean multiLine,
  String description,
  int maxChars,
  String existingText)`

  `static void`

  `showTimers(String clazzStr)`

  `static void`

  `showTimersTotal(String clazzStr)`

  `static void`

  `showVehicleEditor(String scriptName)`

  `static void`

  `showWorldMapEditor(String value)`

  `static void`

  `showWrongChatTabMessage(int actualTabID,
  int rightTabID,
  String chatCommand)`

  `static void`

  `sledgeDestroy(IsoObject object)`

  `static se.krka.kahlua.vm.KahluaTable`

  `sortBrowserList(se.krka.kahlua.j2se.KahluaTableImpl table,
  String sortType,
  boolean sortDown,
  se.krka.kahlua.j2se.KahluaTableImpl filterTable)`

  `static void`

  `spawnHorde(float x,
  float y,
  float x2,
  float y2,
  float z,
  int count)`

  `static boolean`

  `spawnpointsExistsForMod(String modID,
  String mapFolder)`

  `static se.krka.kahlua.vm.KahluaTable`

  `splitString(String input,
  int maxSize)`

  `static byte`

  `startFishingAction(IsoPlayer player,
  InventoryItem item,
  IsoGridSquare sq,
  se.krka.kahlua.vm.KahluaTable bobber)`

  `static Server`

  `steamGetInternetServerDetails(int index)`

  `static void`

  `steamReleaseInternetServersRequest()`

  `static int`

  `steamRequestInternetServersCount()`

  `static void`

  `steamRequestInternetServersList()`

  `static boolean`

  `steamRequestServerDetails(String host,
  int port)`

  `static boolean`

  `steamRequestServerRules(String host,
  int port)`

  `static void`

  `stepForward()`

  `static void`

  `stopFire(Object obj)`

  `static void`

  `stopPing()`

  `static void`

  `stopSendSecretKey()`

  `static void`

  `stopSound(long sound)`

  `void`

  `syncBodyPart(BodyPart bodyPart,
  long syncParams)`

  `static void`

  `syncClothingFields(IsoPlayer player)`

  `void`

  `syncHandWeaponFields(IsoPlayer player,
  HandWeapon item)`

  `static void`

  `syncItemActivated(IsoPlayer player,
  InventoryItem item)`

  `void`

  `syncItemFields(IsoPlayer player,
  InventoryItem item)`

  `void`

  `syncItemModData(IsoPlayer player,
  InventoryItem item)`

  `void`

  `syncPlayerStats(IsoPlayer player,
  int syncParams)`

  `static void`

  `syncVisuals(IsoPlayer player)`

  `void`

  `SyncXp(IsoPlayer player)`

  `static String`

  `tabToX(String a,
  int tabX)`

  `static void`

  `takeScreenshot()`

  `static void`

  `takeScreenshot(String fileName)`

  `static void`

  `teleportPlayers(IsoPlayer player)`

  `static void`

  `teleportToHimUserAction(String action,
  String username,
  String additionArgument)`

  `static void`

  `teleportUserAction(String action,
  String username,
  String additionArgument)`

  `static void`

  `testHelicopter()`

  `static void`

  `testSound()`

  `static void`

  `timSort(se.krka.kahlua.vm.KahluaTable table,
  Object functionObject)`

  `static void`

  `toggleBreakOnChange(se.krka.kahlua.vm.KahluaTable table,
  Object key)`

  `static void`

  `toggleBreakOnRead(se.krka.kahlua.vm.KahluaTable table,
  Object key)`

  `static void`

  `toggleBreakpoint(String file,
  int line)`

  `static void`

  `toggleModActive(ChooseGameInfo.Mod mod,
  boolean active)`

  `static void`

  `toggleStatisticsTransmission()`

  `static void`

  `toggleVehicleRenderToTexture()`

  `static int`

  `toInt(double val)`

  `static void`

  `tradingUISendAddItem(IsoPlayer you,
  IsoPlayer other,
  InventoryItem item)`

  `static void`

  `tradingUISendRemoveItem(IsoPlayer you,
  IsoPlayer other,
  InventoryItem item)`

  `static void`

  `tradingUISendUpdateState(IsoPlayer you,
  IsoPlayer other,
  int state)`

  `static se.krka.kahlua.vm.KahluaTable`

  `transformIntoKahluaTable(HashMap<Object,Object> map)`

  `static float`

  `translatePointXInOverheadMapToWindow(float x,
  UIElement ui,
  float zoom,
  float xpos)`

  `static float`

  `translatePointXInOverheadMapToWorld(float x,
  UIElement ui,
  float zoom,
  float xpos)`

  `static float`

  `translatePointYInOverheadMapToWindow(float y,
  UIElement ui,
  float zoom,
  float ypos)`

  `static float`

  `translatePointYInOverheadMapToWorld(float y,
  UIElement ui,
  float zoom,
  float ypos)`

  `static void`

  `transmitBigWaterSplash(int x,
  int y,
  float dx,
  float dy)`

  `static void`

  `triggerEvent(String event)`

  `static void`

  `triggerEvent(String event,
  Object param)`

  `static void`

  `triggerEvent(String event,
  Object param,
  Object param2)`

  `static void`

  `triggerEvent(String event,
  Object param,
  Object param2,
  Object param3)`

  `static void`

  `triggerEvent(String event,
  Object param,
  Object param2,
  Object param3,
  Object param4)`

  `static Texture`

  `tryGetTexture(String filename)`

  `static String`

  `typeof(Object o)`

  `static void`

  `updateAccountToAccountList(Account account)`

  `static void`

  `updateChatSettings(String fontSize,
  boolean showTimestamp,
  boolean showTitle)`

  `static void`

  `updateFire()`

  `static void`

  `updateServerToAccountList(Server server)`

  `static void`

  `useStaticErosionRand(boolean use)`

  `static void`

  `useTextureFiltering(boolean bUse)`

  `static void`

  `viewedTicket(String author,
  int ticketID)`

  `static boolean`

  `wasKeyDown(int key)`

  `static boolean`

  `wasKeyDown(String keyName)`

  `static boolean`

  `wasMouseActiveMoreRecentlyThanJoypad()`

  `static void`

  `writeLog(String loggerName,
  String logs)`

  `static double`

  `ZombRand(double max)`

  `static double`

  `ZombRand(double min,
  double max)`

  `static double`

  `ZombRandBetween(double min,
  double max)`

  `static float`

  `ZombRandFloat(float min,
  float max)`

  `static void`

  `zpopClearZombies(int cellX,
  int cellY)`

  `static ZombiePopulationRenderer`

  `zpopNewRenderer()`

  `static void`

  `zpopSpawnNow(int cellX,
  int cellY)`

  `static void`

  `zpopSpawnTimeToZero(int cellX,
  int cellY)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### outStream

    private static [FileOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileOutputStream.html "class or interface in java.io") outStream
  + ### inStream

    private static [FileInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileInputStream.html "class or interface in java.io") inStream
  + ### inFileReader

    private static [FileReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileReader.html "class or interface in java.io") inFileReader
  + ### inBufferedReader

    private static [BufferedReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedReader.html "class or interface in java.io") inBufferedReader
  + ### timeLastRefresh

    private static long timeLastRefresh
  + ### timSortComparator

    private static final [LuaManager.GlobalObject.TimSortComparator](LuaManager.GlobalObject.TimSortComparator.html "class in zombie.Lua") timSortComparator
* Constructor Details
  -------------------

  + ### GlobalObject

    public GlobalObject()
* Method Details
  --------------

  + ### loadVehicleModel

    public static zombie.core.skinnedmodel.model.Model loadVehicleModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loc,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### loadStaticZomboidModel

    public static zombie.core.skinnedmodel.model.Model loadStaticZomboidModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loc,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### loadSkinnedZomboidModel

    public static zombie.core.skinnedmodel.model.Model loadSkinnedZomboidModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loc,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### loadZomboidModel

    public static zombie.core.skinnedmodel.model.Model loadZomboidModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mesh,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shader,
    boolean bStatic)
  + ### setModelMetaData

    public static void setModelMetaData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mesh,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shader,
    boolean bStatic)
  + ### reloadModelsMatching

    public static void reloadModelsMatching([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") meshName)
  + ### getSLSoundManager

    public static [SLSoundManager](../radio/StorySounds/SLSoundManager.html "class in zombie.radio.StorySounds") getSLSoundManager()
  + ### getRadioAPI

    public static [RadioAPI](../radio/RadioAPI.html "class in zombie.radio") getRadioAPI()
  + ### getBehaviourDebugPlayer

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getBehaviourDebugPlayer()
  + ### setBehaviorStep

    public static void setBehaviorStep(boolean b)
  + ### getPuddlesManager

    public static [IsoPuddles](../iso/IsoPuddles.html "class in zombie.iso") getPuddlesManager()
  + ### getAllAnimalsDefinitions

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalDefinitions](../characters/animals/AnimalDefinitions.html "class in zombie.characters.animals")> getAllAnimalsDefinitions()
  + ### setPuddles

    public static void setPuddles(float initialPuddles)
  + ### fastfloor

    public static float fastfloor(float coord)
  + ### getZomboidRadio

    public static [ZomboidRadio](../radio/ZomboidRadio.html "class in zombie.radio") getZomboidRadio()
  + ### getRandomUUID

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomUUID()
  + ### sendItemListNet

    public static boolean sendItemListNet([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") sender,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") receiver,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") transferID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") custom)
  + ### convertToPZNetTable

    public static se.krka.kahlua.vm.KahluaTable convertToPZNetTable(se.krka.kahlua.vm.KahluaTable table)
  + ### instof

    public static boolean instof([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### typeof

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") typeof([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### getClassSimpleName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClassSimpleName([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") object)
  + ### serverConnect

    public static void serverConnect([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") server,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") localIP,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") port,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverPassword,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName,
    boolean useSteamRelay,
    boolean doHash,
    int authtype,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") secretKey)
  + ### serverConnectCoop

    public static void serverConnectCoop([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverSteamID)
  + ### sendPing

    public static void sendPing()
  + ### connectionManagerLog

    public static void connectionManagerLog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### forceDisconnect

    public static void forceDisconnect()
  + ### checkPermissions

    public static boolean checkPermissions([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [Capability](../characters/Capability.html "enum class in zombie.characters") capability)
  + ### backToSinglePlayer

    public static void backToSinglePlayer()
  + ### isIngameState

    public static boolean isIngameState()
  + ### getPerformanceLocal

    public static se.krka.kahlua.vm.KahluaTable getPerformanceLocal()
  + ### getNetworkLocal

    public static se.krka.kahlua.vm.KahluaTable getNetworkLocal()
  + ### getGameLocal

    public static se.krka.kahlua.vm.KahluaTable getGameLocal()
  + ### getPerformanceRemote

    public static se.krka.kahlua.vm.KahluaTable getPerformanceRemote()
  + ### getNetworkRemote

    public static se.krka.kahlua.vm.KahluaTable getNetworkRemote()
  + ### getGameRemote

    public static se.krka.kahlua.vm.KahluaTable getGameRemote()
  + ### toggleStatisticsTransmission

    public static void toggleStatisticsTransmission()
  + ### getMPStatus

    public static se.krka.kahlua.vm.KahluaTable getMPStatus()
  + ### canConnect

    public static boolean canConnect()
  + ### getReconnectCountdownTimer

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReconnectCountdownTimer()
  + ### sendAnimalGenome

    public static void sendAnimalGenome([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### addAnimal

    public static [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") addAnimal([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType,
    [AnimalBreed](../characters/animals/datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed,
    boolean skeleton)
  + ### addAnimal

    public static [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") addAnimal([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType,
    [AnimalBreed](../characters/animals/datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### removeAnimal

    public static void removeAnimal(int id)
  + ### getFakeAttacker

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getFakeAttacker()
  + ### sendHitZombie

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static void sendHitZombie([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target)

    Deprecated.
  + ### sendHitPlayer

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static void sendHitPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") damage,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") range)

    Deprecated.
  + ### sendHitVehicle

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static void sendHitVehicle([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") damage,
    boolean isTargetHitFromBehind,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleSpeed)

    Deprecated.
  + ### requestUsers

    public static void requestUsers()
  + ### requestPVPEvents

    public static void requestPVPEvents()
  + ### clearPVPEvents

    public static void clearPVPEvents()
  + ### getUsers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[NetworkUser](../characters/NetworkUser.html "class in zombie.characters")> getUsers()
  + ### networkUserAction

    public static void networkUserAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") additionArgument)
  + ### banUnbanUserAction

    public static void banUnbanUserAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") additionArgument)
  + ### teleportUserAction

    public static void teleportUserAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") additionArgument)
  + ### teleportToHimUserAction

    public static void teleportToHimUserAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") additionArgument)
  + ### requestRoles

    public static void requestRoles()
  + ### getRoles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Role](../characters/Role.html "class in zombie.characters")> getRoles()
  + ### getCapabilities

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Capability](../characters/Capability.html "enum class in zombie.characters")> getCapabilities()
  + ### addRole

    public static void addRole([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setupRole

    public static void setupRole([Role](../characters/Role.html "class in zombie.characters") role,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    [Color](../core/Color.html "class in zombie.core") color,
    se.krka.kahlua.vm.KahluaTable capabilitiesRaw)
  + ### deleteRole

    public static void deleteRole([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setDefaultRoleFor

    public static void setDefaultRoleFor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roleName)
  + ### moveRole

    public static void moveRole(byte dir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roleName)
  + ### getWarNearest

    public static [WarManager.War](../network/WarManager.War.html "class in zombie.network") getWarNearest()
  + ### getWars

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WarManager.War](../network/WarManager.War.html "class in zombie.network")> getWars()
  + ### getHutch

    public static [IsoHutch](../iso/objects/IsoHutch.html "class in zombie.iso.objects") getHutch(int x,
    int y,
    int z)
  + ### getAnimal

    public static [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") getAnimal(int id)
  + ### sendAddAnimalFromHandsInTrailer

    public static void sendAddAnimalFromHandsInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### sendAddAnimalFromHandsInTrailer

    public static void sendAddAnimalFromHandsInTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### sendAddAnimalInTrailer

    public static void sendAddAnimalInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### sendAddAnimalInTrailer

    public static void sendAddAnimalInTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### sendRemoveAnimalFromTrailer

    public static void sendRemoveAnimalFromTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### sendRemoveAndGrabAnimalFromTrailer

    public static void sendRemoveAndGrabAnimalFromTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendRemoveAndGrabAnimalFromTrailer

    public static void sendRemoveAndGrabAnimalFromTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendPickupAnimal

    public static void sendPickupAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [AnimalInventoryItem](../inventory/types/AnimalInventoryItem.html "class in zombie.inventory.types") item)
  + ### sendPickupAnimalFromTrap

    public static void sendPickupAnimalFromTrap([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [AnimalInventoryItem](../inventory/types/AnimalInventoryItem.html "class in zombie.inventory.types") item)
  + ### sendButcherAnimal

    public static void sendButcherAnimal([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendFeedAnimalFromHand

    public static void sendFeedAnimalFromHand([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendHutchGrabAnimal

    public static void sendHutchGrabAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendHutchGrabCorpseAction

    public static void sendHutchGrabCorpseAction([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendHutchRemoveAnimalAction

    public static void sendHutchRemoveAnimalAction([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### sendCorpse

    public static void sendCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### getAllItems

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../scripting/objects/Item.html "class in zombie.scripting.objects")> getAllItems()
  + ### scoreboardUpdate

    public static void scoreboardUpdate()
  + ### save

    public static void save(boolean doCharacter)
  + ### saveGame

    public static void saveGame()
  + ### getAllRecipes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects")> getAllRecipes()
  + ### requestUserlog

    public static void requestUserlog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user)
  + ### addUserlog

    public static void addUserlog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### removeUserlog

    public static void removeUserlog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### tabToX

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tabToX([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") a,
    int tabX)
  + ### isType

    public static boolean isType([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isoToScreenX

    public static float isoToScreenX(int player,
    float x,
    float y,
    float z)
  + ### isoToScreenY

    public static float isoToScreenY(int player,
    float x,
    float y,
    float z)
  + ### screenToIsoX

    public static float screenToIsoX(int player,
    float x,
    float y,
    float z)
  + ### screenToIsoY

    public static float screenToIsoY(int player,
    float x,
    float y,
    float z)
  + ### getAmbientStreamManager

    public static [BaseAmbientStreamManager](../BaseAmbientStreamManager.html "class in zombie") getAmbientStreamManager()
  + ### getSleepingEvent

    public static [SleepingEvent](../ai/sadisticAIDirector/SleepingEvent.html "class in zombie.ai.sadisticAIDirector") getSleepingEvent()
  + ### setPlayerButtonsActive

    public static void setPlayerButtonsActive(int id,
    boolean bActive)
  + ### setIgnoreInputsForDirection

    public static void setIgnoreInputsForDirection(int id,
    boolean bActive)
  + ### setJoypadIgnoreAim

    public static void setJoypadIgnoreAim(int id,
    boolean bActive)
  + ### setJoypadIgnoreAimUntilCentered

    public static void setJoypadIgnoreAimUntilCentered(int id,
    boolean bActive)
  + ### setActivePlayer

    public static void setActivePlayer(int id)
  + ### getPlayer

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayer()
  + ### getNumActivePlayers

    public static int getNumActivePlayers()
  + ### playServerSound

    public static void playServerSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getMaxActivePlayers

    public static int getMaxActivePlayers()
  + ### getPlayerScreenLeft

    public static int getPlayerScreenLeft(int player)
  + ### getPlayerScreenTop

    public static int getPlayerScreenTop(int player)
  + ### getPlayerScreenWidth

    public static int getPlayerScreenWidth(int player)
  + ### getPlayerScreenHeight

    public static int getPlayerScreenHeight(int player)
  + ### getPlayerByOnlineID

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerByOnlineID(int id)
  + ### initUISystem

    public static void initUISystem()
  + ### getPerformance

    public static [PerformanceSettings](../core/PerformanceSettings.html "class in zombie.core") getPerformance()
  + ### getWorldSoundManager

    public static [WorldSoundManager](../WorldSoundManager.html "class in zombie") getWorldSoundManager()
  + ### getAnimalChunk

    public static [AnimalChunk](../characters/animals/AnimalChunk.html "class in zombie.characters.animals") getAnimalChunk(int x,
    int y)
  + ### AddWorldSound

    public static void AddWorldSound([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int radius,
    int volume)
  + ### AddNoiseToken

    public static void AddNoiseToken([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int radius)
  + ### pauseSoundAndMusic

    public static void pauseSoundAndMusic()
  + ### resumeSoundAndMusic

    public static void resumeSoundAndMusic()
  + ### isDemo

    public static boolean isDemo()
  + ### getTimeInMillis

    public static long getTimeInMillis()
  + ### getCurrentCoroutine

    public static [Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") getCurrentCoroutine()
  + ### reloadLuaFile

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") reloadLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### reloadServerLuaFile

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") reloadServerLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### setSpawnRegion

    public static void setSpawnRegion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spawnRegionName)
  + ### getServerSpawnRegions

    public static se.krka.kahlua.vm.KahluaTable getServerSpawnRegions()
  + ### getServerOptions

    public static [ServerOptions](../network/ServerOptions.html "class in zombie.network") getServerOptions()
  + ### getServerName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerName()
  + ### getServerIP

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerIP()
  + ### getServerPort

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerPort()
  + ### isShowConnectionInfo

    public static boolean isShowConnectionInfo()
  + ### setShowConnectionInfo

    public static void setShowConnectionInfo(boolean enabled)
  + ### isShowServerInfo

    public static boolean isShowServerInfo()
  + ### setShowServerInfo

    public static void setShowServerInfo(boolean enabled)
  + ### getSpecificPlayer

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getSpecificPlayer(int player)
  + ### getCameraOffX

    public static float getCameraOffX()
  + ### getLatestSave

    public static se.krka.kahlua.vm.KahluaTable getLatestSave()
  + ### isCurrentExecutionPoint

    public static boolean isCurrentExecutionPoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int line)
  + ### toggleBreakOnChange

    public static void toggleBreakOnChange(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### isDebugEnabled

    public static boolean isDebugEnabled()
  + ### toggleBreakOnRead

    public static void toggleBreakOnRead(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### toggleBreakpoint

    public static void toggleBreakpoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int line)
  + ### sendVisual

    public static void sendVisual([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendSyncPlayerFields

    public static void sendSyncPlayerFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    byte syncParams)
  + ### sendClothing

    public static void sendClothing([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncVisuals

    public static void syncVisuals([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### syncClothingFields

    public static void syncClothingFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendEquip

    public static void sendEquip([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendDamage

    public static void sendDamage([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendPlayerEffects

    public static void sendPlayerEffects([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendItemStats

    public static void sendItemStats([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### hasDataReadBreakpoint

    public static boolean hasDataReadBreakpoint(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### hasDataBreakpoint

    public static boolean hasDataBreakpoint(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### hasBreakpoint

    public static boolean hasBreakpoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int line)
  + ### getLoadedLuaCount

    public static int getLoadedLuaCount()
  + ### getLoadedLua

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLoadedLua(int n)
  + ### isServer

    public static boolean isServer()
  + ### isServerSoftReset

    public static boolean isServerSoftReset()
  + ### isClient

    public static boolean isClient()
  + ### isMultiplayer

    public static boolean isMultiplayer()
  + ### canSeePlayerStats

    public static boolean canSeePlayerStats()
  + ### getAccessLevel

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAccessLevel()

    Deprecated.
  + ### haveAccess

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean haveAccess([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") access)

    Deprecated.
  + ### getOnlinePlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> getOnlinePlayers()
  + ### getDebug

    public static boolean getDebug()
  + ### getCameraOffY

    public static float getCameraOffY()
  + ### createRegionFile

    public static se.krka.kahlua.vm.KahluaTable createRegionFile()

    Create a dynamic table containing all spawnpoints.lua we find in vanilla
    folder + in loaded mods
  + ### getMapDirectoryTable

    public static se.krka.kahlua.vm.KahluaTable getMapDirectoryTable()
  + ### deleteDatabase

    public static void deleteDatabase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder)
  + ### deleteSave

    public static void deleteSave([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder)
  + ### sendPlayerExtraInfo

    public static void sendPlayerExtraInfo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p)
  + ### getServerAddressFromArgs

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerAddressFromArgs()
  + ### getServerPasswordFromArgs

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerPasswordFromArgs()
  + ### getServerListFile

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerListFile()

    Deprecated.
  + ### addServerToAccountList

    public static void addServerToAccountList([Server](../network/Server.html "class in zombie.network") server)
  + ### updateServerToAccountList

    public static void updateServerToAccountList([Server](../network/Server.html "class in zombie.network") server)
  + ### deleteServerToAccountList

    public static void deleteServerToAccountList([Server](../network/Server.html "class in zombie.network") server)
  + ### addAccountToAccountList

    public static void addAccountToAccountList([Server](../network/Server.html "class in zombie.network") server,
    [Account](../network/Account.html "class in zombie.network") account)
  + ### updateAccountToAccountList

    public static void updateAccountToAccountList([Account](../network/Account.html "class in zombie.network") account)
  + ### deleteAccountToAccountList

    public static void deleteAccountToAccountList([Account](../network/Account.html "class in zombie.network") account)
  + ### getServerList

    public static se.krka.kahlua.vm.KahluaTable getServerList()
  + ### ping

    public static void ping([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") port,
    boolean doHash)
  + ### getCustomizationData

    public static void getCustomizationData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") port,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverPassword,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName,
    boolean doHash)
  + ### getCombatConfig

    public static [CombatConfig](../combat/CombatConfig.html "class in zombie.combat") getCombatConfig()
  + ### stopPing

    public static void stopPing()
  + ### transformIntoKahluaTable

    public static se.krka.kahlua.vm.KahluaTable transformIntoKahluaTable([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> map)
  + ### getSaveDirectory

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io")> getSaveDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder)
  + ### getFullSaveDirectoryTable

    public static se.krka.kahlua.vm.KahluaTable getFullSaveDirectoryTable()
  + ### getSaveName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSaveName([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file)
  + ### getSaveDirectoryTable

    public static se.krka.kahlua.vm.KahluaTable getSaveDirectoryTable()
  + ### getCurrentSaveName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentSaveName()
  + ### getMods

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMods()
  + ### doChallenge

    public static void doChallenge(se.krka.kahlua.vm.KahluaTable challenge)
  + ### doTutorial

    public static void doTutorial(se.krka.kahlua.vm.KahluaTable tutorial)
  + ### setMinMaxZombiesPerChunk

    public static void setMinMaxZombiesPerChunk(float min,
    float max)
  + ### deleteAllGameModeSaves

    public static void deleteAllGameModeSaves([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMode)
  + ### sledgeDestroy

    public static void sledgeDestroy([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### getBannedIPs

    public static void getBannedIPs()
  + ### getBannedSteamIDs

    public static void getBannedSteamIDs()
  + ### getTickets

    public static void getTickets([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### addTicket

    public static void addTicket([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message,
    int ticketID)
  + ### viewedTicket

    public static void viewedTicket([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    int ticketID)
  + ### removeTicket

    public static void removeTicket(int ticketID)
  + ### acceptFactionInvite

    public static void acceptFactionInvite([Faction](../characters/Faction.html "class in zombie.characters") faction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invited,
    boolean isAccepted)
  + ### sendFactionChangeOwner

    public static void sendFactionChangeOwner([Faction](../characters/Faction.html "class in zombie.characters") faction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### sendFactionChangeTag

    public static void sendFactionChangeTag([Faction](../characters/Faction.html "class in zombie.characters") faction)
  + ### sendFactionChangeTitle

    public static void sendFactionChangeTitle([Faction](../characters/Faction.html "class in zombie.characters") faction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### sendFactionCreate

    public static void sendFactionCreate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host)
  + ### sendFactionDisband

    public static void sendFactionDisband([Faction](../characters/Faction.html "class in zombie.characters") faction)
  + ### sendFactionInvite

    public static void sendFactionInvite([Faction](../characters/Faction.html "class in zombie.characters") faction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invited)
  + ### sendFactionRemoveMember

    public static void sendFactionRemoveMember([Faction](../characters/Faction.html "class in zombie.characters") faction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### sendFactionStatsChange

    public static void sendFactionStatsChange([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendSafehouseInvite

    public static void sendSafehouseInvite([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invited)
  + ### acceptSafehouseInvite

    public static void acceptSafehouseInvite([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invited,
    boolean isAccepted)
  + ### sendSafehouseChangeMember

    public static void sendSafehouseChangeMember([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
  + ### sendSafehouseChangeOwner

    public static void sendSafehouseChangeOwner([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### sendSafehouseChangeRespawn

    public static void sendSafehouseChangeRespawn([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player,
    boolean doRemove)
  + ### sendSafehouseChangeTitle

    public static void sendSafehouseChangeTitle([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### sendSafezoneClaim

    public static void sendSafezoneClaim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    int x,
    int y,
    int h,
    int w,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### sendSafehouseClaim

    public static void sendSafehouseClaim([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### sendSafehouseRelease

    public static void sendSafehouseRelease([SafeHouse](../iso/areas/SafeHouse.html "class in zombie.iso.areas") safehouse)
  + ### createHordeFromTo

    public static void createHordeFromTo(float spawnX,
    float spawnY,
    float targetX,
    float targetY,
    int count)
  + ### createHordeInAreaTo

    public static void createHordeInAreaTo(int spawnX,
    int spawnY,
    int spawnW,
    int spawnH,
    int targetX,
    int targetY,
    int count)
  + ### spawnHorde

    public static void spawnHorde(float x,
    float y,
    float x2,
    float y2,
    float z,
    int count)
  + ### createZombie

    public static [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") createZombie(float x,
    float y,
    float z,
    [SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc,
    int palette,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4)
  + ### debugLuaTable

    public static void debugLuaTable([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param,
    int depth)
  + ### debugLuaTable

    public static void debugLuaTable([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param)
  + ### sendItemsInContainer

    public static void sendItemsInContainer([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getModDirectoryTable

    public static se.krka.kahlua.vm.KahluaTable getModDirectoryTable()
  + ### getModInfoByID

    public static [ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") getModInfoByID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### getModInfo

    public static [ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") getModInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDir)
  + ### getMapFoldersForMod

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMapFoldersForMod([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### spawnpointsExistsForMod

    public static boolean spawnpointsExistsForMod([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapFolder)
  + ### getFileSeparator

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileSeparator()
  + ### getScriptManager

    public static [ScriptManager](../scripting/ScriptManager.html "class in zombie.scripting") getScriptManager()
  + ### checkSaveFolderExists

    public static boolean checkSaveFolderExists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") f)
  + ### getAbsoluteSaveFolderName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAbsoluteSaveFolderName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") f)
  + ### checkSaveFileExists

    public static boolean checkSaveFileExists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") f)
  + ### checkSavePlayerExists

    public static boolean checkSavePlayerExists()
  + ### cacheFileExists

    public static boolean cacheFileExists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### fileExists

    public static boolean fileExists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### serverFileExists

    public static boolean serverFileExists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### takeScreenshot

    public static void takeScreenshot()
  + ### takeScreenshot

    public static void takeScreenshot([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### checkStringPattern

    public static boolean checkStringPattern([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pattern)
  + ### instanceItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") instanceItem([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### instanceItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") instanceItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### instanceItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") instanceItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    float useDelta)
  + ### instanceItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") instanceItem([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") item)
  + ### createNewScriptItem

    public static [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") createNewScriptItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") base,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") display,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") icon)
  + ### cloneItemType

    public static [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") cloneItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") oldName)
  + ### moduleDotType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moduleDotType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### require

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") require([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") f)
  + ### getRenderer

    public static [SpriteRenderer](../core/SpriteRenderer.html "class in zombie.core") getRenderer()
  + ### getGameTime

    public static [GameTime](../GameTime.html "class in zombie") getGameTime()
  + ### getMaxPlayers

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMaxPlayers()
  + ### callLua

    public static void callLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)
  + ### callLuaReturn

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> callLuaReturn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> params)
  + ### callLuaBool

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") callLuaBool([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params)
  + ### getWorld

    public static [IsoWorld](../iso/IsoWorld.html "class in zombie.iso") getWorld()
  + ### getCell

    public static [IsoCell](../iso/IsoCell.html "class in zombie.iso") getCell()
  + ### getCellSizeInChunks

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getCellSizeInChunks()
  + ### getCellSizeInSquares

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getCellSizeInSquares()
  + ### getChunkSizeInSquares

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getChunkSizeInSquares()
  + ### getMinimumWorldLevel

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMinimumWorldLevel()
  + ### getMaximumWorldLevel

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMaximumWorldLevel()
  + ### getSandboxOptions

    public static [SandboxOptions](../SandboxOptions.html "class in zombie") getSandboxOptions()
  + ### getFileOutput

    public static [DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") getFileOutput([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getLastStandPlayersDirectory

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastStandPlayersDirectory()
  + ### getLastStandPlayerFileNames

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLastStandPlayerFileNames()
  + ### getAllSavedPlayers

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BufferedReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedReader.html "class or interface in java.io")> getAllSavedPlayers()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Deprecated.

    Throws:
    :   `IOException`
  + ### getSandboxPresets

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSandboxPresets()
  + ### deleteSandboxPreset

    public static void deleteSandboxPreset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getFileReader

    public static [BufferedReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedReader.html "class or interface in java.io") getFileReader([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean createIfNull)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getModFileReader

    public static [BufferedReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedReader.html "class or interface in java.io") getModFileReader([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean createIfNull)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### listFilesInZomboidLuaDirectory

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> listFilesInZomboidLuaDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directory)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### listFilesInModDirectory

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> listFilesInModDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directory)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### listFilesInDirectoryAux

    private static void listFilesInDirectoryAux([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") absPath,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> result)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### refreshAnimSets

    public static void refreshAnimSets(boolean reload)
  + ### reloadActionGroups

    public static void reloadActionGroups()
  + ### getModFileWriter

    public static [LuaManager.GlobalObject.LuaFileWriter](LuaManager.GlobalObject.LuaFileWriter.html "class in zombie.Lua") getModFileWriter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean createIfNull,
    boolean append)
  + ### updateFire

    public static void updateFire()
  + ### deletePlayerFromDatabase

    public static void deletePlayerFromDatabase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") savedir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world)
  + ### checkPlayerExistsInDatabase

    public static boolean checkPlayerExistsInDatabase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") savedir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world)
  + ### deletePlayerSave

    public static void deletePlayerSave([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### getControllerCount

    public static int getControllerCount()
  + ### isControllerConnected

    public static boolean isControllerConnected(int index)
  + ### getControllerGUID

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getControllerGUID(int joypad)
  + ### getControllerName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getControllerName(int joypad)
  + ### getControllerAxisValue

    public static float getControllerAxisValue(int c,
    int axis)
  + ### getControllerDeadZone

    public static float getControllerDeadZone(int c,
    int axis)
  + ### setControllerDeadZone

    public static void setControllerDeadZone(int c,
    int axis,
    float value)
  + ### saveControllerSettings

    public static void saveControllerSettings(int c)
  + ### getControllerPovX

    public static float getControllerPovX(int c)
  + ### getControllerPovY

    public static float getControllerPovY(int c)
  + ### reloadControllerConfigFiles

    public static void reloadControllerConfigFiles()
  + ### isJoypadDown

    public static boolean isJoypadDown(int joypad)
  + ### isJoypadLTPressed

    public static boolean isJoypadLTPressed(int joypad)
  + ### isJoypadRTPressed

    public static boolean isJoypadRTPressed(int joypad)
  + ### isJoypadLeftStickButtonPressed

    public static boolean isJoypadLeftStickButtonPressed(int joypad)
  + ### isJoypadRightStickButtonPressed

    public static boolean isJoypadRightStickButtonPressed(int joypad)
  + ### getJoypadAimingAxisX

    public static float getJoypadAimingAxisX(int joypad)
  + ### getJoypadAimingAxisY

    public static float getJoypadAimingAxisY(int joypad)
  + ### getJoypadMovementAxisX

    public static float getJoypadMovementAxisX(int joypad)
  + ### getJoypadMovementAxisY

    public static float getJoypadMovementAxisY(int joypad)
  + ### wasMouseActiveMoreRecentlyThanJoypad

    public static boolean wasMouseActiveMoreRecentlyThanJoypad()
  + ### activateJoypadOnSteamDeck

    public static void activateJoypadOnSteamDeck()
  + ### reactivateJoypadAfterResetLua

    public static boolean reactivateJoypadAfterResetLua()
  + ### isJoypadConnected

    public static boolean isJoypadConnected(int index)
  + ### addPlayerToWorld

    private static void addPlayerToWorld(int player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    boolean newPlayer)
  + ### toInt

    public static int toInt(double val)
  + ### getClientUsername

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClientUsername()
  + ### setPlayerJoypad

    public static void setPlayerJoypad(int player,
    int joypad,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    boolean allowNewPlayer)
  + ### setPlayerMouse

    public static void setPlayerMouse([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### revertToKeyboardAndMouse

    public static void revertToKeyboardAndMouse()
  + ### revertToKeyboardAndMouseFromMainMenu

    public static void revertToKeyboardAndMouseFromMainMenu()
  + ### isJoypadUp

    public static boolean isJoypadUp(int joypad)
  + ### isJoypadLeft

    public static boolean isJoypadLeft(int joypad)
  + ### isJoypadRight

    public static boolean isJoypadRight(int joypad)
  + ### isJoypadLBPressed

    public static boolean isJoypadLBPressed(int joypad)
  + ### isJoypadRBPressed

    public static boolean isJoypadRBPressed(int joypad)
  + ### getButtonCount

    public static int getButtonCount(int joypad)
  + ### setDebugToggleControllerPluggedIn

    public static void setDebugToggleControllerPluggedIn(int index)
  + ### lineSeparator

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lineSeparator()
  + ### getFileWriter

    public static [LuaManager.GlobalObject.LuaFileWriter](LuaManager.GlobalObject.LuaFileWriter.html "class in zombie.Lua") getFileWriter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean createIfNull,
    boolean append)
  + ### createStory

    public static void createStory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") storyName)
  + ### createWorld

    public static void createWorld([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldName)
  + ### sanitizeWorldName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sanitizeWorldName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldName)
  + ### forceChangeState

    public static void forceChangeState(zombie.gameStates.GameState state)
  + ### endFileOutput

    public static void endFileOutput()
  + ### getFileInput

    public static [DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") getFileInput([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getGameFilesInput

    public static [DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") getGameFilesInput([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getGameFilesTextInput

    public static [BufferedReader](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedReader.html "class or interface in java.io") getGameFilesTextInput([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### endTextFileInput

    public static void endTextFileInput()
  + ### endFileInput

    public static void endFileInput()
  + ### getFunctionsForFile

    public static se.krka.kahlua.vm.KahluaTable getFunctionsForFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getLineNumber

    public static int getLineNumber(se.krka.kahlua.vm.LuaCallFrame c)
  + ### ZombRand

    public static double ZombRand(double max)
  + ### ZombRandBetween

    public static double ZombRandBetween(double min,
    double max)
  + ### ZombRand

    public static double ZombRand(double min,
    double max)
  + ### ZombRandFloat

    public static float ZombRandFloat(float min,
    float max)
  + ### getShortenedFilename

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShortenedFilename([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### isKeyDown

    public static boolean isKeyDown(int key)
  + ### isKeyDown

    public static boolean isKeyDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### wasKeyDown

    public static boolean wasKeyDown(int key)
  + ### wasKeyDown

    public static boolean wasKeyDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### isKeyPressed

    public static boolean isKeyPressed(int key)
  + ### isKeyPressed

    public static boolean isKeyPressed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### getBaseSoundBank

    public static zombie.audio.BaseSoundBank getBaseSoundBank()
  + ### getFMODSoundBank

    public static zombie.audio.BaseSoundBank getFMODSoundBank()
  + ### isSoundPlaying

    public static boolean isSoundPlaying([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") sound)
  + ### stopSound

    public static void stopSound(long sound)
  + ### isShiftKeyDown

    public static boolean isShiftKeyDown()
  + ### isCtrlKeyDown

    public static boolean isCtrlKeyDown()
  + ### isAltKeyDown

    public static boolean isAltKeyDown()
  + ### isMetaKeyDown

    public static boolean isMetaKeyDown()
  + ### setZoomLevels

    public static void setZoomLevels([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")... zooms)
  + ### getCore

    public static [Core](../core/Core.html "class in zombie.core") getCore()
  + ### isAnimationRecorderActive

    public static boolean isAnimationRecorderActive()
  + ### setAnimationRecorderActive

    public static void setAnimationRecorderActive(boolean setActive)
  + ### getISUIStackTrace

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getISUIStackTrace(int maxDepth)
  + ### getGameVersion

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGameVersion()
  + ### getBreakModGameVersion

    public static [GameVersion](../core/GameVersion.html "class in zombie.core") getBreakModGameVersion()
  + ### getSquare

    public static [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare(double x,
    double y,
    double z)
  + ### getDebugOptions

    public static [DebugOptions](../debug/DebugOptions.html "class in zombie.debug") getDebugOptions()
  + ### setShowPausedMessage

    public static void setShowPausedMessage(boolean b)
  + ### getFilenameOfCallframe

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilenameOfCallframe(se.krka.kahlua.vm.LuaCallFrame c)
  + ### getFilenameOfClosure

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilenameOfClosure(se.krka.kahlua.vm.LuaClosure c)
  + ### getFirstLineOfClosure

    public static int getFirstLineOfClosure(se.krka.kahlua.vm.LuaClosure c)
  + ### getLocalVarCount

    public static int getLocalVarCount([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c)
  + ### getLocalVarCount

    public static int getLocalVarCount(se.krka.kahlua.vm.LuaCallFrame callFrame)
  + ### isSystemLinux

    public static boolean isSystemLinux()
  + ### isSystemMacOS

    public static boolean isSystemMacOS()
  + ### isSystemWindows

    public static boolean isSystemWindows()
  + ### isModActive

    public static boolean isModActive([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### openURl

    public static void openURl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") url)
  + ### isDesktopOpenSupported

    public static boolean isDesktopOpenSupported()
  + ### showFolderInDesktop

    public static void showFolderInDesktop([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder)
  + ### getActivatedMods

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getActivatedMods()
  + ### toggleModActive

    public static void toggleModActive([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod,
    boolean active)
  + ### saveModsFile

    public static void saveModsFile()
  + ### deleteSavefileFilesMatching

    private static void deleteSavefileFilesMatching([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") folder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") regex)
  + ### deleteSavefileFilesMatchingInSubdirectories

    private static void deleteSavefileFilesMatchingInSubdirectories([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") folder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") regex)
  + ### manipulateSavefile

    public static void manipulateSavefile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action)
  + ### getLocalVarName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocalVarName([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### getLocalVarName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocalVarName(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n)
  + ### getLocalVarStack

    public static int getLocalVarStack([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### getLocalVarStackIndex

    public static int getLocalVarStackIndex(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n)
  + ### getCallframeTop

    public static int getCallframeTop([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c)
  + ### getCoroutineTop

    public static int getCoroutineTop([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c)
  + ### getCoroutineObjStack

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getCoroutineObjStack([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### getCoroutineObjStackWithBase

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getCoroutineObjStackWithBase([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### localVarName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") localVarName([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### getCoroutineCallframeStack

    public static se.krka.kahlua.vm.LuaCallFrame getCoroutineCallframeStack([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") c,
    int n)
  + ### getLuaStackTrace

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLuaStackTrace()
  + ### createTile

    public static void createTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getNumClassFunctions

    public static int getNumClassFunctions([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### getClassFunction

    public static [Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") getClassFunction([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int i)
  + ### getNumClassFields

    public static int getNumClassFields([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### getClassField

    public static [Field](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Field.html "class or interface in java.lang.reflect") getClassField([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int i)
  + ### getDirectionTo

    public static [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getDirectionTo([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chara,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") objTarget)
  + ### translatePointXInOverheadMapToWindow

    public static float translatePointXInOverheadMapToWindow(float x,
    [UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xpos)
  + ### translatePointYInOverheadMapToWindow

    public static float translatePointYInOverheadMapToWindow(float y,
    [UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float ypos)
  + ### translatePointXInOverheadMapToWorld

    public static float translatePointXInOverheadMapToWorld(float x,
    [UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xpos)
  + ### translatePointYInOverheadMapToWorld

    public static float translatePointYInOverheadMapToWorld(float y,
    [UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float ypos)
  + ### drawOverheadMap

    public static void drawOverheadMap([UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    int level,
    float zoom,
    float xpos,
    float ypos)
  + ### assaultPlayer

    public static void assaultPlayer()
  + ### isoRegionsRenderer

    public static [IsoRegionsRenderer](../iso/areas/isoregion/IsoRegionsRenderer.html "class in zombie.iso.areas.isoregion") isoRegionsRenderer()
  + ### zpopNewRenderer

    public static [ZombiePopulationRenderer](../popman/ZombiePopulationRenderer.html "class in zombie.popman") zpopNewRenderer()
  + ### zpopSpawnTimeToZero

    public static void zpopSpawnTimeToZero(int cellX,
    int cellY)
  + ### zpopClearZombies

    public static void zpopClearZombies(int cellX,
    int cellY)
  + ### zpopSpawnNow

    public static void zpopSpawnNow(int cellX,
    int cellY)
  + ### addVirtualZombie

    public static void addVirtualZombie(int x,
    int y)
  + ### luaDebug

    public static void luaDebug()
  + ### setAggroTarget

    public static void setAggroTarget(int id,
    int x,
    int y)
  + ### debugFullyStreamedIn

    public static void debugFullyStreamedIn(int x,
    int y)
  + ### getClassFieldVal

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getClassFieldVal([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    [Field](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Field.html "class or interface in java.lang.reflect") field)
  + ### getMethodParameter

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMethodParameter([Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") o,
    int i)
  + ### getMethodParameterCount

    public static int getMethodParameterCount([Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") o)
  + ### breakpoint

    public static void breakpoint()
  + ### getLuaDebuggerErrorCount

    public static int getLuaDebuggerErrorCount()
  + ### getLuaDebuggerErrors

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLuaDebuggerErrors()
  + ### doLuaDebuggerAction

    public static void doLuaDebuggerAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action)
  + ### isQuitCooldown

    public static boolean isQuitCooldown()
  + ### getGameSpeed

    public static int getGameSpeed()
  + ### setGameSpeed

    public static void setGameSpeed(int newSpeed)
  + ### stepForward

    public static void stepForward()
  + ### isGamePaused

    public static boolean isGamePaused()
  + ### getMouseXScaled

    public static int getMouseXScaled()
  + ### getMouseYScaled

    public static int getMouseYScaled()
  + ### getMouseX

    public static int getMouseX()
  + ### setMouseXY

    public static void setMouseXY(int x,
    int y)
  + ### isMouseButtonDown

    public static boolean isMouseButtonDown(int number)
  + ### isMouseButtonPressed

    public static boolean isMouseButtonPressed(int number)
  + ### getMouseY

    public static int getMouseY()
  + ### getSoundManager

    public static [BaseSoundManager](../BaseSoundManager.html "class in zombie") getSoundManager()
  + ### getLastPlayedDate

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastPlayedDate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getTextureFromSaveDir

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTextureFromSaveDir([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveName)
  + ### getSaveInfo

    public static se.krka.kahlua.vm.KahluaTable getSaveInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveDir)
  + ### renameSaveFile

    public static boolean renameSaveFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") oldName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName)
  + ### isInvalidForRenameSavefile

    private static boolean isInvalidForRenameSavefile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### setSavefilePlayer1

    public static void setSavefilePlayer1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveDir,
    int sqlID)
  + ### getServerSavedWorldVersion

    public static int getServerSavedWorldVersion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveFolder)
  + ### getZombieInfo

    public static se.krka.kahlua.vm.KahluaTable getZombieInfo([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### getPlayerInfo

    public static se.krka.kahlua.vm.KahluaTable getPlayerInfo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getMapInfo

    public static se.krka.kahlua.vm.KahluaTable getMapInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapDir)
  + ### getVehicleInfo

    public static se.krka.kahlua.vm.KahluaTable getVehicleInfo([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### getLotDirectories

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLotDirectories()
  + ### useTextureFiltering

    public static void useTextureFiltering(boolean bUse)
  + ### getTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### tryGetTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") tryGetTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### sendSecretKey

    public static void sendSecretKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip,
    int port,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverPassword,
    boolean doHash,
    int authType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") secretKey)
  + ### stopSendSecretKey

    public static void stopSendSecretKey()
  + ### generateSecretKey

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateSecretKey()
  + ### sendGoogleAuth

    public static void sendGoogleAuth([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") code)
  + ### createQRCodeTex

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") createQRCodeTex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
    throws com.google.zxing.WriterException,
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `com.google.zxing.WriterException`
    :   `IOException`
  + ### getVideo

    public static [VideoTexture](../core/textures/VideoTexture.html "class in zombie.core.textures") getVideo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    int width,
    int height)
  + ### hasRelativePath

    private static boolean hasRelativePath([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### getTextManager

    public static [TextManager](../ui/TextManager.html "class in zombie.ui") getTextManager()
  + ### setProgressBarValue

    public static void setProgressBarValue([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int value)
  + ### getText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### getTextOrNull

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextOrNull([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### getItemText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt)
  + ### getTextMediaEN

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextMediaEN([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt)
  + ### getItemNameFromFullType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemNameFromFullType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)
  + ### getItem

    public static [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemStaticModel

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemStaticModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### isItemFood

    public static boolean isItemFood([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemFoodType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemFoodType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### isItemFresh

    public static boolean isItemFresh([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    float age)
  + ### getItemCount

    public static int getItemCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemWeight

    public static float getItemWeight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemActualWeight

    public static float getItemActualWeight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemConditionMax

    public static int getItemConditionMax([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemEvolvedRecipeName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemEvolvedRecipeName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### hasItemTag

    public static boolean hasItemTag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getItemDisplayName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemDisplayName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemTextureName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemTextureName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemTextureColor

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemTextureColor([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") param)
  + ### getAndFindNearestTracks

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalTracks](../characters/animals/AnimalTracks.html "class in zombie.characters.animals")> getAndFindNearestTracks([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getItemTex

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getItemTex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getRecipeDisplayName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeDisplayName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getMyDocumentFolder

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMyDocumentFolder()
  + ### getSpriteManager

    public static [IsoSpriteManager](../iso/sprite/IsoSpriteManager.html "class in zombie.iso.sprite") getSpriteManager([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### getSprite

    public static [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") getSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### getServerModData

    public static void getServerModData()
  + ### isXBOXController

    public static boolean isXBOXController()
  + ### isPlaystationController

    public static boolean isPlaystationController(int id)
  + ### sendClientCommand

    public static void sendClientCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendClientCommand

    public static void sendClientCommand([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendServerCommand

    public static void sendServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendServerCommand

    public static void sendServerCommand([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendServerCommandV

    public void sendServerCommandV([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)
  + ### sendClientCommandV

    public void sendClientCommandV([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)
  + ### addVariableToSyncList

    public static void addVariableToSyncList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getOnlineUsername

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnlineUsername()
  + ### isValidUserName

    public static boolean isValidUserName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user)
  + ### getHourMinute

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHourMinute()
  + ### SendCommandToServer

    public static void SendCommandToServer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command)
  + ### isAdmin

    public static boolean isAdmin()
  + ### canModifyPlayerScoreboard

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean canModifyPlayerScoreboard()

    Deprecated.
  + ### isAccessLevel

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean isAccessLevel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") accessLevel)

    Deprecated.
  + ### sendHumanVisual

    public static void sendHumanVisual([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### stopFire

    public static void stopFire([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)
  + ### sortBrowserList

    public static se.krka.kahlua.vm.KahluaTable sortBrowserList(se.krka.kahlua.j2se.KahluaTableImpl table,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortType,
    boolean sortDown,
    se.krka.kahlua.j2se.KahluaTableImpl filterTable)
  + ### getGameClient

    public static zombie.network.GameClient getGameClient()
  + ### sendRequestInventory

    public static void sendRequestInventory(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### InvMngGetItem

    public static void InvMngGetItem(long itemId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    int playerID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### InvMngRemoveItem

    public static void InvMngRemoveItem(long itemId,
    int playerID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### InvMngUpdateItem

    public static void InvMngUpdateItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    int playerID)
  + ### getConnectedPlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> getConnectedPlayers()
  + ### getPlayerFromUsername

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerFromUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isCoopHost

    public static boolean isCoopHost()
  + ### setAdmin

    public static void setAdmin()
  + ### addWarningPoint

    public static void addWarningPoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reason,
    int amount)
  + ### disconnect

    public static void disconnect()
  + ### writeLog

    public static void writeLog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loggerName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logs)
  + ### doKeyPress

    public static void doKeyPress(boolean doIt)
  + ### getEvolvedRecipes

    public static [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[EvolvedRecipe](../scripting/objects/EvolvedRecipe.html "class in zombie.scripting.objects")> getEvolvedRecipes()
  + ### getZone

    public static [Zone](../iso/zones/Zone.html "class in zombie.iso.zones") getZone(int x,
    int y,
    int z)
  + ### getZones

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](../iso/zones/Zone.html "class in zombie.iso.zones")> getZones(int x,
    int y,
    int z)
  + ### getVehicleZoneAt

    public static [VehicleZone](../iso/zones/VehicleZone.html "class in zombie.iso.zones") getVehicleZoneAt(int x,
    int y,
    int z)
  + ### getCellMinX

    public static int getCellMinX()
  + ### getCellMaxX

    public static int getCellMaxX()
  + ### getCellMinY

    public static int getCellMinY()
  + ### getCellMaxY

    public static int getCellMaxY()
  + ### replaceWith

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceWith([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toReplace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") regex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") by)
  + ### getTimestamp

    public static long getTimestamp()
  + ### getTimestampMs

    public static long getTimestampMs()
  + ### forceSnowCheck

    public static void forceSnowCheck()
  + ### getGametimeTimestamp

    public static long getGametimeTimestamp()
  + ### canInviteFriends

    public static boolean canInviteFriends()
  + ### inviteFriend

    public static void inviteFriend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamID)
  + ### getFriendsList

    public static se.krka.kahlua.vm.KahluaTable getFriendsList()
  + ### getSteamModeActive

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getSteamModeActive()
  + ### getStreamModeActive

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getStreamModeActive()
  + ### getRemotePlayModeActive

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getRemotePlayModeActive()
  + ### isValidSteamID

    public static boolean isValidSteamID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getCurrentUserSteamID

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentUserSteamID()
  + ### getCurrentUserProfileName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentUserProfileName()
  + ### getSteamScoreboard

    public static boolean getSteamScoreboard()
  + ### isSteamOverlayEnabled

    public static boolean isSteamOverlayEnabled()
  + ### activateSteamOverlayToWorkshop

    public static void activateSteamOverlayToWorkshop()
  + ### activateSteamOverlayToWorkshopUser

    public static void activateSteamOverlayToWorkshopUser()
  + ### activateSteamOverlayToWorkshopItem

    public static void activateSteamOverlayToWorkshopItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemID)
  + ### activateSteamOverlayToWebPage

    public static void activateSteamOverlayToWebPage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") url)
  + ### getSteamProfileNameFromSteamID

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamProfileNameFromSteamID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamID)
  + ### getSteamAvatarFromSteamID

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getSteamAvatarFromSteamID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamID)
  + ### getSteamIDFromUsername

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamIDFromUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### resetRegionFile

    public static void resetRegionFile()
  + ### getSteamProfileNameFromUsername

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamProfileNameFromUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getSteamAvatarFromUsername

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getSteamAvatarFromUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getSteamWorkshopStagedItems

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SteamWorkshopItem](../core/znet/SteamWorkshopItem.html "class in zombie.core.znet")> getSteamWorkshopStagedItems()
  + ### getSteamWorkshopItemIDs

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSteamWorkshopItemIDs()
  + ### getSteamWorkshopItemMods

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates")> getSteamWorkshopItemMods([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemIDStr)
  + ### isSteamRunningOnSteamDeck

    public static boolean isSteamRunningOnSteamDeck()
  + ### showSteamGamepadTextInput

    public static boolean showSteamGamepadTextInput(boolean password,
    boolean multiLine,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    int maxChars,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") existingText)
  + ### showSteamFloatingGamepadTextInput

    public static boolean showSteamFloatingGamepadTextInput(boolean multiLine,
    int x,
    int y,
    int width,
    int height)
  + ### isFloatingGamepadTextInputVisible

    public static boolean isFloatingGamepadTextInputVisible()
  + ### sendPlayerStatsChange

    public static void sendPlayerStatsChange([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendPersonalColor

    public static void sendPersonalColor([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### requestTrading

    public static void requestTrading([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") you,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") other)
  + ### acceptTrading

    public static void acceptTrading([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") you,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") other,
    boolean accept)
  + ### requestMedicalCheck

    public static void requestMedicalCheck([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") requester)
  + ### acceptMedicalCheck

    public static void acceptMedicalCheck([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") requester)
  + ### tradingUISendAddItem

    public static void tradingUISendAddItem([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") you,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") other,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### tradingUISendRemoveItem

    public static void tradingUISendRemoveItem([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") you,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") other,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### tradingUISendUpdateState

    public static void tradingUISendUpdateState([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") you,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") other,
    int state)
  + ### sendWarManagerUpdate

    public static void sendWarManagerUpdate(int onlineID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker,
    [WarManager.State](../network/WarManager.State.html "enum class in zombie.network") state)
  + ### getTwoLetters

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTwoLetters([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)
  + ### isPunctuation

    private static boolean isPunctuation(char c)
  + ### findBestSplitPoint

    private static int findBestSplitPoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    int maxSize)
  + ### splitString

    public static se.krka.kahlua.vm.KahluaTable splitString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    int maxSize)
  + ### querySteamWorkshopItemDetails

    public static void querySteamWorkshopItemDetails([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemIDs,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
  + ### connectToServerStateCallback

    public static void connectToServerStateCallback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") button)
  + ### getPublicServersList

    public static se.krka.kahlua.vm.KahluaTable getPublicServersList()
  + ### steamRequestInternetServersList

    public static void steamRequestInternetServersList()
  + ### steamReleaseInternetServersRequest

    public static void steamReleaseInternetServersRequest()
  + ### steamRequestInternetServersCount

    public static int steamRequestInternetServersCount()
  + ### steamGetInternetServerDetails

    public static [Server](../network/Server.html "class in zombie.network") steamGetInternetServerDetails(int index)
  + ### steamRequestServerRules

    public static boolean steamRequestServerRules([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    int port)
  + ### getHostByName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHostByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hostname)
  + ### steamRequestServerDetails

    public static boolean steamRequestServerDetails([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host,
    int port)
  + ### isPublicServerListAllowed

    public static boolean isPublicServerListAllowed()
  + ### isSteamServerBrowserEnabled

    public static boolean isSteamServerBrowserEnabled()
  + ### testSound

    public static void testSound()
  + ### getFMODEventPathList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFMODEventPathList()
  + ### debugSetRoomType

    public static void debugSetRoomType([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") roomType)
  + ### copyTable

    public static se.krka.kahlua.vm.KahluaTable copyTable(se.krka.kahlua.vm.KahluaTable table)
  + ### mergeTable

    public static se.krka.kahlua.vm.KahluaTable mergeTable(se.krka.kahlua.vm.KahluaTable... tables)
  + ### copyTable

    public static se.krka.kahlua.vm.KahluaTable copyTable(se.krka.kahlua.vm.KahluaTable to,
    se.krka.kahlua.vm.KahluaTable from)
  + ### renderIsoCircle

    public static void renderIsoCircle(float x,
    float y,
    float z,
    float radius,
    int segments,
    int thickness,
    float r,
    float g,
    float b,
    float a)
  + ### renderIsoRect

    public static void renderIsoRect(float x,
    float y,
    float z,
    float radius,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### renderLine

    public static void renderLine(float x,
    float y,
    float z,
    float tx,
    float ty,
    float tz,
    float r,
    float g,
    float b,
    float a)
  + ### renderIsoLine

    public static void renderIsoLine(float x,
    float y,
    float z,
    float tx,
    float ty,
    float tz,
    int thickness,
    float r,
    float g,
    float b,
    float a)
  + ### configureLighting

    public static void configureLighting(float darkStep)
  + ### invalidateLighting

    public static void invalidateLighting()
  + ### testHelicopter

    public static void testHelicopter()
  + ### endHelicopter

    public static void endHelicopter()
  + ### getServerSettingsManager

    public static [ServerSettingsManager](../network/ServerSettingsManager.html "class in zombie.network") getServerSettingsManager()
  + ### rainConfig

    public static void rainConfig([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cmd,
    int arg)
  + ### sendSwitchSeat

    public static void sendSwitchSeat([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seatFrom,
    int seatTo)
  + ### getVehicleById

    public static [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getVehicleById(int id)
  + ### removeVehicle

    public static void removeVehicle([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") baseVehicle)
  + ### removeAllVehicles

    public static void removeAllVehicles([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### addBloodSplat

    public void addBloodSplat([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int nbr)
  + ### addBloodSplat

    public void addBloodSplat([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int nbr,
    float xoffset,
    float yoffset)
  + ### addCarCrash

    public static void addCarCrash()
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    int blood)
  + ### addZombieSitting

    public void addZombieSitting(int x,
    int y,
    int z)
  + ### addZombiesEating

    public void addZombiesEating(int x,
    int y,
    int z,
    int totalZombies,
    boolean skeletonBody)
  + ### addZombiesInOutfitArea

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfitArea(int x1,
    int y1,
    int x2,
    int y2,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    boolean isCrawler,
    boolean isFallOnFront,
    boolean isFakeDead,
    boolean isKnockedDown,
    boolean isInvulnerable,
    boolean isSitting,
    float health)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    boolean isCrawler,
    boolean isFallOnFront,
    boolean isFakeDead,
    boolean isKnockedDown,
    boolean isInvulnerable,
    boolean isSitting,
    float health,
    boolean isAnimRecording)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    boolean isCrawler,
    boolean isFallOnFront,
    boolean isFakeDead,
    boolean isKnockedDown,
    boolean isInvulnerable,
    boolean isSitting,
    float health,
    boolean isAnimRecording,
    float heightOffset)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    boolean isCrawler,
    boolean isFallOnFront,
    boolean isFakeDead,
    boolean isKnockedDown,
    boolean isInvulnerable,
    boolean isSitting,
    float health,
    boolean isAnimRecording,
    float heightOffset,
    boolean isRagdolling)
  + ### addZombiesInOutfit

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInOutfit(int x,
    int y,
    int z,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    boolean isCrawler,
    boolean isFallOnFront,
    boolean isFakeDead,
    boolean isKnockedDown,
    boolean isInvulnerable,
    boolean isSitting,
    float health,
    boolean isAnimRecording,
    float heightOffset,
    boolean isRagdolling,
    boolean onFire)
  + ### addZombiesInBuilding

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesInBuilding([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") def,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [RoomDef](../iso/RoomDef.html "class in zombie.iso") room,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance)
  + ### addVehicleDebug

    public static [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicleDebug([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addVehicle

    public static [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") script,
    int x,
    int y,
    int z)
  + ### attachTrailerToPlayerVehicle

    public static void attachTrailerToPlayerVehicle(int playerIndex)
  + ### getKeyName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKeyName(int key)
  + ### getKeyCode

    public static int getKeyCode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### queueCharEvent

    public static void queueCharEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventChar)
  + ### queueKeyEvent

    public static void queueKeyEvent(int lwjglKeyCode)
  + ### addAllVehicles

    public static void addAllVehicles()
  + ### addAllBurntVehicles

    public static void addAllBurntVehicles()
  + ### addAllSmashedVehicles

    public static void addAllSmashedVehicles()
  + ### addAllVehicles

    public static void addAllVehicles([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects")> predicate)
  + ### addPhysicsObject

    public static [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addPhysicsObject()
  + ### toggleVehicleRenderToTexture

    public static void toggleVehicleRenderToTexture()
  + ### reloadSoundFiles

    public static void reloadSoundFiles()
  + ### getAnimationViewerState

    public static [AnimationViewerState](../gameStates/AnimationViewerState.html "class in zombie.gameStates") getAnimationViewerState()
  + ### getAttachmentEditorState

    public static [AttachmentEditorState](../gameStates/AttachmentEditorState.html "class in zombie.gameStates") getAttachmentEditorState()
  + ### getEditVehicleState

    public static [EditVehicleState](../vehicles/EditVehicleState.html "class in zombie.vehicles") getEditVehicleState()
  + ### getSpriteModelEditorState

    public static [SpriteModelEditorState](../gameStates/SpriteModelEditorState.html "class in zombie.gameStates") getSpriteModelEditorState()
  + ### showAnimationViewer

    public static void showAnimationViewer()
  + ### showAttachmentEditor

    public static void showAttachmentEditor()
  + ### showChunkDebugger

    public static void showChunkDebugger()
  + ### getTileGeometryState

    public static [TileGeometryState](../gameStates/TileGeometryState.html "class in zombie.gameStates") getTileGeometryState()
  + ### showGlobalObjectDebugger

    public static void showGlobalObjectDebugger()
  + ### showSeamEditor

    public static void showSeamEditor()
  + ### getSeamEditorState

    public static [SeamEditorState](../gameStates/SeamEditorState.html "class in zombie.gameStates") getSeamEditorState()
  + ### showSpriteModelEditor

    public static void showSpriteModelEditor()
  + ### showVehicleEditor

    public static void showVehicleEditor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### showWorldMapEditor

    public static void showWorldMapEditor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### reloadVehicles

    public static void reloadVehicles()
  + ### reloadEngineRPM

    public static void reloadEngineRPM()
  + ### reloadXui

    public static void reloadXui()
  + ### reloadScripts

    public static void reloadScripts([ScriptType](../scripting/ScriptType.html "enum class in zombie.scripting") type)
  + ### reloadEntityScripts

    public static void reloadEntityScripts()
  + ### reloadEntitiesDebug

    public static void reloadEntitiesDebug()
  + ### reloadEntityDebug

    public static void reloadEntityDebug([GameEntity](../entity/GameEntity.html "class in zombie.entity") entity)
  + ### reloadEntityFromScriptDebug

    public static void reloadEntityFromScriptDebug([GameEntity](../entity/GameEntity.html "class in zombie.entity") entity)
  + ### getIsoEntitiesDebug

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameEntity](../entity/GameEntity.html "class in zombie.entity")> getIsoEntitiesDebug()
  + ### proceedPM

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") proceedPM([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command)
  + ### processSayMessage

    public static void processSayMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### processGeneralMessage

    public static void processGeneralMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### processShoutMessage

    public static void processShoutMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### ProceedFactionMessage

    public static void ProceedFactionMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### ProcessSafehouseMessage

    public static void ProcessSafehouseMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### ProcessAdminChatMessage

    public static void ProcessAdminChatMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### showWrongChatTabMessage

    public static void showWrongChatTabMessage(int actualTabID,
    int rightTabID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") chatCommand)
  + ### focusOnTab

    public static void focusOnTab([Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang") id)
  + ### updateChatSettings

    public static void updateChatSettings([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fontSize,
    boolean showTimestamp,
    boolean showTitle)
  + ### checkPlayerCanUseChat

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") checkPlayerCanUseChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") chatCommand)
  + ### reloadVehicleTextures

    public static void reloadVehicleTextures([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### useStaticErosionRand

    public static void useStaticErosionRand(boolean use)
  + ### getClimateManager

    public static [ClimateManager](../iso/weather/ClimateManager.html "class in zombie.iso.weather") getClimateManager()
  + ### getClimateMoon

    public static [ClimateMoon](../iso/weather/ClimateMoon.html "class in zombie.iso.weather") getClimateMoon()
  + ### getWorldMarkers

    public static [WorldMarkers](../iso/WorldMarkers.html "class in zombie.iso") getWorldMarkers()
  + ### getIsoMarkers

    public static [IsoMarkers](../iso/IsoMarkers.html "class in zombie.iso") getIsoMarkers()
  + ### getErosion

    public static [ErosionMain](../erosion/ErosionMain.html "class in zombie.erosion") getErosion()
  + ### getAllOutfits

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllOutfits(boolean female)
  + ### getAllVehicles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllVehicles()
  + ### getAllHairStyles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllHairStyles(boolean female)
  + ### getHairStylesInstance

    public static [HairStyles](../core/skinnedmodel/population/HairStyles.html "class in zombie.core.skinnedmodel.population") getHairStylesInstance()
  + ### getBeardStylesInstance

    public static [BeardStyles](../core/skinnedmodel/population/BeardStyles.html "class in zombie.core.skinnedmodel.population") getBeardStylesInstance()
  + ### getAllBeardStyles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllBeardStyles()
  + ### getVoiceStylesInstance

    public static [VoiceStyles](../core/skinnedmodel/population/VoiceStyles.html "class in zombie.core.skinnedmodel.population") getVoiceStylesInstance()
  + ### getAllVoiceStyles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VoiceStyle](../core/skinnedmodel/population/VoiceStyle.html "class in zombie.core.skinnedmodel.population")> getAllVoiceStyles()
  + ### getAllItemsForBodyLocation

    public static se.krka.kahlua.vm.KahluaTable getAllItemsForBodyLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyLocation)
  + ### getAllDecalNamesForItem

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllDecalNamesForItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### screenZoomIn

    public void screenZoomIn()
  + ### screenZoomOut

    public void screenZoomOut()
  + ### addSound

    public void addSound([IsoObject](../iso/IsoObject.html "class in zombie.iso") source,
    int x,
    int y,
    int z,
    int radius,
    int volume)
  + ### sendPlaySound

    public void sendPlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound,
    boolean loop,
    [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") object)
  + ### sendIconFound

    public void sendIconFound([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    float distanceTraveled)
  + ### sendForageRequestZone

    public void sendForageRequestZone([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") focus)
  + ### sendForagePool

    public void sendForagePool([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneId,
    se.krka.kahlua.vm.KahluaTable icons)
  + ### sendForageSpot

    public void sendForageSpot([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconID)
  + ### getLoosingXpValue

    public int getLoosingXpValue()
  + ### getLoosingXpTick

    public int getLoosingXpTick([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") timer)
  + ### addXpNoMultiplier

    public void addXpNoMultiplier([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float amount)
  + ### addXp

    public void addXp([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float amount)
  + ### addXpMultiplier

    public void addXpMultiplier([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float multiplier,
    int minLevel,
    int maxLevel)
  + ### syncBodyPart

    public void syncBodyPart([BodyPart](../characters/BodyDamage/BodyPart.html "class in zombie.characters.BodyDamage") bodyPart,
    long syncParams)
  + ### syncPlayerStats

    public void syncPlayerStats([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int syncParams)
  + ### sendPlayerStat

    public void sendPlayerStat([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [CharacterStat](../characters/CharacterStat.html "class in zombie.characters") stat)
  + ### sendPlayerNutrition

    public void sendPlayerNutrition([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### SyncXp

    public void SyncXp([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### checkServerName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkServerName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### Render3DItem

    public void Render3DItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    float xoffset,
    float yoffset,
    float zoffset,
    float rotation)
  + ### getContainerOverlays

    public [ContainerOverlays](../iso/ContainerOverlays.html "class in zombie.iso") getContainerOverlays()
  + ### getTileOverlays

    public [TileOverlays](../iso/TileOverlays.html "class in zombie.iso") getTileOverlays()
  + ### NewMapBinaryFile

    public void NewMapBinaryFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cmd)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getAverageFSP

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getAverageFSP()
  + ### getCPUTime

    public long getCPUTime()
  + ### getGPUTime

    public long getGPUTime()
  + ### getCPUWait

    public long getCPUWait()
  + ### getGPUWait

    public long getGPUWait()
  + ### getServerFPS

    public int getServerFPS()
  + ### createItemTransaction

    public static byte createItemTransaction([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    se.krka.kahlua.j2se.KahluaTableImpl table,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") src,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") dst)
  + ### extractItems

    private static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> extractItems(se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### removeItemTransaction

    public static void removeItemTransaction(byte id,
    boolean isCanceled)
  + ### isItemTransactionConsistent

    public static boolean isItemTransactionConsistent([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") src,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") dst,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extra,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isItemTransactionDone

    public static boolean isItemTransactionDone(byte id)
  + ### isItemTransactionRejected

    public static boolean isItemTransactionRejected(byte id)
  + ### getItemTransactionDuration

    public static int getItemTransactionDuration(byte id)
  + ### isActionDone

    public static boolean isActionDone(byte id)
  + ### isActionRejected

    public static boolean isActionRejected(byte id)
  + ### getActionDuration

    public static int getActionDuration(byte id)
  + ### removeAction

    public static void removeAction(byte id,
    boolean isCanceled)
  + ### emulateAnimEvent

    public static void emulateAnimEvent([NetTimedAction](../core/NetTimedAction.html "class in zombie.core") action,
    long duration,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameter)
  + ### emulateAnimEventOnce

    public static void emulateAnimEventOnce([NetTimedAction](../core/NetTimedAction.html "class in zombie.core") action,
    long duration,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameter)
  + ### detectBadWords

    public static boolean detectBadWords([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### profanityFilterCheck

    public static boolean profanityFilterCheck([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Return true if a profanity was found
  + ### showDebugInfoInChat

    public static void showDebugInfoInChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### createBuildAction

    public static byte createBuildAction([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    float x,
    float y,
    float z,
    boolean north,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    se.krka.kahlua.vm.KahluaTable item)
  + ### startFishingAction

    public static byte startFishingAction([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    se.krka.kahlua.vm.KahluaTable bobber)
  + ### syncItemActivated

    public static void syncItemActivated([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncItemModData

    public void syncItemModData([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncItemFields

    public void syncItemFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncHandWeaponFields

    public void syncHandWeaponFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") item)
  + ### getPickedUpFish

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getPickedUpFish([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendAddItemToContainer

    public static void sendAddItemToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendAddItemsToContainer

    public static void sendAddItemsToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### sendAttachedItem

    public static void sendAttachedItem([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendReplaceItemInContainer

    public static void sendReplaceItemInContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") oldItem,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newItem)
  + ### sendRemoveItemFromContainer

    public static void sendRemoveItemFromContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendRemoveItemsFromContainer

    public static void sendRemoveItemsFromContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### replaceItemInContainer

    public static void replaceItemInContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") oldItem,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newItem)
  + ### log

    public static void log([DebugType](../debug/DebugType.html "enum class in zombie.debug") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### teleportPlayers

    public static void teleportPlayers([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### checkModsNeedUpdate

    public static void checkModsNeedUpdate(zombie.core.raknet.UdpConnection connection)
  + ### getSearchMode

    public static [SearchMode](../iso/SearchMode.html "class in zombie.iso") getSearchMode()
  + ### transmitBigWaterSplash

    public static void transmitBigWaterSplash(int x,
    int y,
    float dx,
    float dy)
  + ### addAreaHighlight

    public static void addAreaHighlight(int x1,
    int y1,
    int x2,
    int y2,
    int z,
    float r,
    float g,
    float b,
    float a)
  + ### addAreaHighlightForPlayer

    public static void addAreaHighlightForPlayer(int playerIndex,
    int x1,
    int y1,
    int x2,
    int y2,
    int z,
    float r,
    float g,
    float b,
    float a)
  + ### configRoomFade

    public static void configRoomFade(float seconds,
    float percent)
  + ### timSort

    public static void timSort(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") functionObject)
  + ### javaListRemoveAt

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") javaListRemoveAt([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<?> javaList,
    int index)
  + ### sendDebugStory

    public static void sendDebugStory([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    int type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### displayLUATable

    public static void displayLUATable(se.krka.kahlua.vm.KahluaTable table)
  + ### showTimers

    public static void showTimers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### showTimersTotal

    public static void showTimersTotal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### resetTimers

    public static void resetTimers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### getTimerKept

    public static void getTimerKept([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") field)
  + ### getCheatTypes

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CheatType](../characters/CheatType.html "enum class in zombie.characters")> getCheatTypes()
  + ### getStreets

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WorldMapStreet](../worldMap/streets/WorldMapStreet.html "class in zombie.worldMap.streets")> getStreets(zombie.worldMap.streets.WorldMapStreets worldMapStreets)