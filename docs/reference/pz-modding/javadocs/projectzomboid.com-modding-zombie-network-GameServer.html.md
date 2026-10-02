[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [GameServer](GameServer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_PLAYERS](#MAX_PLAYERS)
   2. [TimeLimitForProcessPackets](#TimeLimitForProcessPackets)
   3. [PacketsUpdateRate](#PacketsUpdateRate)
   4. [FPS](#FPS)
   5. [ccFilters](#ccFilters)
   6. [test](#test)
   7. [defaultPort](#defaultPort)
   8. [udpPort](#udpPort)
   9. [ipCommandline](#ipCommandline)
   10. [portCommandline](#portCommandline)
   11. [udpPortCommandline](#udpPortCommandline)
   12. [steamVacCommandline](#steamVacCommandline)
   13. [guiCommandline](#guiCommandline)
   14. [server](#server)
   15. [coop](#coop)
   16. [debug](#debug)
   17. [closed](#closed)
   18. [softReset](#softReset)
   19. [seed](#seed)
   20. [udpEngine](#udpEngine)
   21. [IDToAddressMap](#IDToAddressMap)
   22. [IDToPlayerMap](#IDToPlayerMap)
   23. [UserNameToPlayerMap](#UserNameToPlayerMap)
   24. [Players](#Players)
   25. [timeSinceKeepAlive](#timeSinceKeepAlive)
   26. [DebugPlayer](#DebugPlayer)
   27. [resetId](#resetId)
   28. [ServerMods](#ServerMods)
   29. [WorkshopItems](#WorkshopItems)
   30. [workshopInstallFolders](#workshopInstallFolders)
   31. [workshopTimeStamps](#workshopTimeStamps)
   32. [serverName](#serverName)
   33. [discordBot](#discordBot)
   34. [checksum](#checksum)
   35. [gameMap](#gameMap)
   36. [fastForward](#fastForward)
   37. [ip](#ip)
   38. [SlotToConnection](#SlotToConnection)
   39. [PlayerToAddressMap](#PlayerToAddressMap)
   40. [done](#done)
   41. [launched](#launched)
   42. [consoleCommands](#consoleCommands)
   43. [MainLoopPlayerUpdateQ](#MainLoopPlayerUpdateQ)
   44. [MainLoopNetDataHighPriorityQ](#MainLoopNetDataHighPriorityQ)
   45. [MainLoopNetDataQ](#MainLoopNetDataQ)
   46. [MainLoopNetData2](#MainLoopNetData2)
   47. [playerToCoordsMap](#playerToCoordsMap)
   48. [poisonousBerry](#poisonousBerry)
   49. [poisonousMushroom](#poisonousMushroom)
   50. [difficulty](#difficulty)
   51. [droppedPackets](#droppedPackets)
   52. [countOfDroppedPackets](#countOfDroppedPackets)
   53. [countOfDroppedConnections](#countOfDroppedConnections)
   54. [removeZombiesConnection](#removeZombiesConnection)
   55. [removeAnimalsConnection](#removeAnimalsConnection)
   56. [removeCorpsesConnection](#removeCorpsesConnection)
   57. [removeVehiclesConnection](#removeVehiclesConnection)
   58. [calcCountPlayersInRelevantPositionLimiter](#calcCountPlayersInRelevantPositionLimiter)
   59. [sendWorldMapPlayerPositionLimiter](#sendWorldMapPlayerPositionLimiter)
   60. [mainCycleExceptionLogCount](#mainCycleExceptionLogCount)
   61. [mainThread](#mainThread)
   62. [tempPlayers](#tempPlayers)
   63. [MainLoopDelayedDisconnectQ](#MainLoopDelayedDisconnectQ)
   64. [shutdownHook](#shutdownHook)
7. [Constructor Details](#constructor-detail)
   1. [GameServer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [parseIPFromCommandline(String[], int, String)](#parseIPFromCommandline(java.lang.String%5B%5D,int,java.lang.String))
   2. [parsePortFromCommandline(String[], int, String)](#parsePortFromCommandline(java.lang.String%5B%5D,int,java.lang.String))
   3. [parseBooleanFromCommandline(String[], int, String)](#parseBooleanFromCommandline(java.lang.String%5B%5D,int,java.lang.String))
   4. [setupCoop()](#setupCoop())
   5. [main(String[])](#main(java.lang.String%5B%5D))
   6. [setupSteamGameServer()](#setupSteamGameServer())
   7. [steamGetInternetServerDetails(GameServerDetails)](#steamGetInternetServerDetails(zombie.core.znet.GameServerDetails))
   8. [launchCommandHandler()](#launchCommandHandler())
   9. [rcon(String)](#rcon(java.lang.String))
   10. [handleServerCommand(String, UdpConnection)](#handleServerCommand(java.lang.String,zombie.core.raknet.UdpConnection))
   11. [sendTeleport(IsoPlayer, float, float, float)](#sendTeleport(zombie.characters.IsoPlayer,float,float,float))
   12. [sendPlayerExtraInfo(IsoPlayer, UdpConnection)](#sendPlayerExtraInfo(zombie.characters.IsoPlayer,zombie.core.raknet.UdpConnection))
   13. [sendPlayerExtraInfo(IsoPlayer, UdpConnection, boolean)](#sendPlayerExtraInfo(zombie.characters.IsoPlayer,zombie.core.raknet.UdpConnection,boolean))
   14. [canModifyPlayerStats(UdpConnection, IsoPlayer)](#canModifyPlayerStats(zombie.core.raknet.UdpConnection,zombie.characters.IsoPlayer))
   15. [receiveChangePlayerStats(ByteBufferReader, UdpConnection, short)](#receiveChangePlayerStats(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   16. [doMinimumInit()](#doMinimumInit())
   17. [startServer()](#startServer())
   18. [mainLoopDealWithNetData(ZomboidNetData)](#mainLoopDealWithNetData(zombie.network.ZomboidNetData))
   19. [receiveInvMngRemoveItem(ByteBufferReader, UdpConnection, short)](#receiveInvMngRemoveItem(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   20. [receiveInvMngGetItem(ByteBufferReader, UdpConnection, short)](#receiveInvMngGetItem(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   21. [receiveInvMngReqItem(ByteBufferReader, UdpConnection, short)](#receiveInvMngReqItem(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   22. [receiveInvMngUpdateItem(ByteBufferReader, UdpConnection, short)](#receiveInvMngUpdateItem(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   23. [receivePlayerStartPMChat(ByteBufferReader, UdpConnection, short)](#receivePlayerStartPMChat(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   24. [receiveSandboxOptions(ByteBufferReader, UdpConnection, short)](#receiveSandboxOptions(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   25. [receiveChangeTextColor(ByteBufferReader, UdpConnection, short)](#receiveChangeTextColor(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   26. [receiveSyncCompost(ByteBufferReader, UdpConnection, short)](#receiveSyncCompost(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   27. [sendCompost(IsoCompost, UdpConnection)](#sendCompost(zombie.iso.objects.IsoCompost,zombie.core.raknet.UdpConnection))
   28. [sendHelicopter(float, float, boolean)](#sendHelicopter(float,float,boolean))
   29. [open()](#open())
   30. [close()](#close())
   31. [sendZone(Zone)](#sendZone(zombie.iso.zones.Zone))
   32. [receiveConstructedZone(ByteBufferReader, UdpConnection, short)](#receiveConstructedZone(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   33. [addXp(IsoPlayer, PerkFactory.Perk, float)](#addXp(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float))
   34. [addXp(IsoPlayer, PerkFactory.Perk, float, boolean)](#addXp(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float,boolean))
   35. [addXp(IsoPlayer, PerkFactory.Perk, float, boolean, boolean)](#addXp(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float,boolean,boolean))
   36. [addXpMultiplier(IsoPlayer, PerkFactory.Perk, float, int, int)](#addXpMultiplier(zombie.characters.IsoPlayer,zombie.characters.skills.PerkFactory.Perk,float,int,int))
   37. [answerPing(ByteBufferReader, UdpConnection)](#answerPing(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   38. [receiveUpdateItemSprite(ByteBufferReader, UdpConnection, short)](#receiveUpdateItemSprite(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   39. [sendOptionsToClients()](#sendOptionsToClients())
   40. [sendCorpse(IsoDeadBody)](#sendCorpse(zombie.iso.objects.IsoDeadBody))
   41. [receiveChatMessageFromPlayer(ByteBufferReader, UdpConnection, short)](#receiveChatMessageFromPlayer(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   42. [loadModData(IsoGridSquare)](#loadModData(zombie.iso.IsoGridSquare))
   43. [receiveDrink(ByteBufferReader, UdpConnection, short)](#receiveDrink(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   44. [receiveReceiveCommand(ByteBufferReader, UdpConnection, short)](#receiveReceiveCommand(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   45. [handleClientCommand(String, UdpConnection)](#handleClientCommand(java.lang.String,zombie.core.raknet.UdpConnection))
   46. [PlayWorldSound(String, IsoGridSquare, float, int)](#PlayWorldSound(java.lang.String,zombie.iso.IsoGridSquare,float,int))
   47. [PlayWorldSoundServer(String, IsoGridSquare, float, int)](#PlayWorldSoundServer(java.lang.String,zombie.iso.IsoGridSquare,float,int))
   48. [PlayWorldSoundServer(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundServer(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   49. [PlayWorldSoundServer(IsoGameCharacter, String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundServer(zombie.characters.IsoGameCharacter,java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   50. [PlayWorldSoundWavServer(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWavServer(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   51. [PlaySoundAtEveryPlayer(String, int, int, int)](#PlaySoundAtEveryPlayer(java.lang.String,int,int,int))
   52. [PlaySoundAtEveryPlayer(String)](#PlaySoundAtEveryPlayer(java.lang.String))
   53. [PlaySoundAtEveryPlayer(String, int, int, int, boolean)](#PlaySoundAtEveryPlayer(java.lang.String,int,int,int,boolean))
   54. [sendCharacterSound(IsoGameCharacter, String, byte)](#sendCharacterSound(zombie.characters.IsoGameCharacter,java.lang.String,byte))
   55. [sendCharacterSound(IsoGameCharacter, String, byte, ParameterMeleeHitSurface.Material)](#sendCharacterSound(zombie.characters.IsoGameCharacter,java.lang.String,byte,zombie.audio.parameters.ParameterMeleeHitSurface.Material))
   56. [sendZombieSound(IsoZombie.ZombieSound, IsoZombie)](#sendZombieSound(zombie.characters.IsoZombie.ZombieSound,zombie.characters.IsoZombie))
   57. [initClientCommandFilter()](#initClientCommandFilter())
   58. [receiveClientCommand(ByteBufferReader, UdpConnection, short)](#receiveClientCommand(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   59. [receiveWorldMap(ByteBufferReader, UdpConnection, short)](#receiveWorldMap(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   60. [getAnyPlayerFromConnection(IConnection)](#getAnyPlayerFromConnection(zombie.network.IConnection))
   61. [getPlayerFromConnection(IConnection, int)](#getPlayerFromConnection(zombie.network.IConnection,int))
   62. [getPlayerByRealUserName(String)](#getPlayerByRealUserName(java.lang.String))
   63. [getPlayerByUserName(String)](#getPlayerByUserName(java.lang.String))
   64. [getPlayerByUserNameForCommand(String)](#getPlayerByUserNameForCommand(java.lang.String))
   65. [getConnectionByPlayerOnlineID(short)](#getConnectionByPlayerOnlineID(short))
   66. [getConnectionFromPlayer(IsoPlayer)](#getConnectionFromPlayer(zombie.characters.IsoPlayer))
   67. [getConnectionByIp(String)](#getConnectionByIp(java.lang.String))
   68. [sendAddItemToContainer(ItemContainer, InventoryItem)](#sendAddItemToContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   69. [sendAddItemsToContainer(ItemContainer, ArrayList)](#sendAddItemsToContainer(zombie.inventory.ItemContainer,java.util.ArrayList))
   70. [sendReplaceItemInContainer(ItemContainer, InventoryItem, InventoryItem)](#sendReplaceItemInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   71. [sendRemoveItemFromContainer(ItemContainer, InventoryItem)](#sendRemoveItemFromContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   72. [sendRemoveItemsFromContainer(ItemContainer, ArrayList)](#sendRemoveItemsFromContainer(zombie.inventory.ItemContainer,java.util.ArrayList))
   73. [sendSyncPlayerFields(IsoPlayer, byte)](#sendSyncPlayerFields(zombie.characters.IsoPlayer,byte))
   74. [sendSyncClothing(IsoPlayer, ItemBodyLocation, InventoryItem)](#sendSyncClothing(zombie.characters.IsoPlayer,zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   75. [syncVisuals(IsoPlayer)](#syncVisuals(zombie.characters.IsoPlayer))
   76. [syncHumanVisual(IsoPlayer)](#syncHumanVisual(zombie.characters.IsoPlayer))
   77. [syncClothingFields(IsoPlayer)](#syncClothingFields(zombie.characters.IsoPlayer))
   78. [sendItemsInContainer(IsoObject, ItemContainer)](#sendItemsInContainer(zombie.iso.IsoObject,zombie.inventory.ItemContainer))
   79. [addConnection(UdpConnection)](#addConnection(zombie.core.raknet.UdpConnection))
   80. [addDisconnect(UdpConnection)](#addDisconnect(zombie.core.raknet.UdpConnection))
   81. [addDelayedDisconnect(UdpConnection)](#addDelayedDisconnect(zombie.core.raknet.UdpConnection))
   82. [doDelayedDisconnect(IsoPlayer)](#doDelayedDisconnect(zombie.characters.IsoPlayer))
   83. [isDelayedDisconnect(UdpConnection)](#isDelayedDisconnect(zombie.core.raknet.UdpConnection))
   84. [isDelayedDisconnect(IsoPlayer)](#isDelayedDisconnect(zombie.characters.IsoPlayer))
   85. [disconnectPlayer(IsoPlayer, IConnection)](#disconnectPlayer(zombie.characters.IsoPlayer,zombie.network.IConnection))
   86. [getFreeSlot()](#getFreeSlot())
   87. [receiveClientConnect(UdpConnection, ServerWorldDatabase.LogonResult)](#receiveClientConnect(zombie.core.raknet.UdpConnection,zombie.network.ServerWorldDatabase.LogonResult))
   88. [sendMetaGrid(int, int, int, UdpConnection)](#sendMetaGrid(int,int,int,zombie.core.raknet.UdpConnection))
   89. [sendMetaGrid(int, int, int)](#sendMetaGrid(int,int,int))
   90. [preventIndoorZombies(int, int, int)](#preventIndoorZombies(int,int,int))
   91. [setCustomVariables(IsoPlayer, IConnection)](#setCustomVariables(zombie.characters.IsoPlayer,zombie.network.IConnection))
   92. [sendPlayerConnected(IsoPlayer, IConnection)](#sendPlayerConnected(zombie.characters.IsoPlayer,zombie.network.IConnection))
   93. [syncActivatedItems(IsoPlayer, IConnection)](#syncActivatedItems(zombie.characters.IsoPlayer,zombie.network.IConnection))
   94. [syncActivatedItem(IsoPlayer, InventoryItem, IConnection)](#syncActivatedItem(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem,zombie.network.IConnection))
   95. [receivePlayerConnect(ByteBufferReader, IConnection, String)](#receivePlayerConnect(zombie.core.network.ByteBufferReader,zombie.network.IConnection,java.lang.String))
   96. [sendInitialWorldState(IConnection)](#sendInitialWorldState(zombie.network.IConnection))
   97. [sendObjectModData(IsoObject)](#sendObjectModData(zombie.iso.IsoObject))
   98. [sendSlowFactor(IsoGameCharacter)](#sendSlowFactor(zombie.characters.IsoGameCharacter))
   99. [sendObjectChange(IsoObject, IsoObjectChange, KahluaTable)](#sendObjectChange(zombie.iso.IsoObject,zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable))
   100. [sendObjectChange(IsoObject, IsoObjectChange, Object...)](#sendObjectChange(zombie.iso.IsoObject,zombie.core.properties.IsoObjectChange,java.lang.Object...))
   101. [receiveSyncIsoObject(ByteBufferReader, UdpConnection, short)](#receiveSyncIsoObject(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   102. [RemoveItemFromMap(IsoObject)](#RemoveItemFromMap(zombie.iso.IsoObject))
   103. [sendBloodSplatter(HandWeapon, float, float, float, Vector2, boolean, boolean)](#sendBloodSplatter(zombie.inventory.types.HandWeapon,float,float,float,zombie.iso.Vector2,boolean,boolean))
   104. [connect(UdpConnection)](#connect(zombie.core.raknet.UdpConnection))
   105. [disconnect(UdpConnection, String)](#disconnect(zombie.core.raknet.UdpConnection,java.lang.String))
   106. [addIncoming(short, ByteBufferReader, UdpConnection)](#addIncoming(short,zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   107. [smashWindow(IsoWindow)](#smashWindow(zombie.iso.objects.IsoWindow))
   108. [removeBrokenGlass(IsoWindow)](#removeBrokenGlass(zombie.iso.objects.IsoWindow))
   109. [sendHitCharacter(HitCharacter, PacketTypes.PacketType, UdpConnection)](#sendHitCharacter(zombie.network.packets.hit.HitCharacter,zombie.network.PacketTypes.PacketType,zombie.core.raknet.UdpConnection))
   110. [sendCharacterDeath(IsoDeadBody)](#sendCharacterDeath(zombie.iso.objects.IsoDeadBody))
   111. [sendItemStats(InventoryItem)](#sendItemStats(zombie.inventory.InventoryItem))
   112. [sendSyncItemFields(InventoryItem)](#sendSyncItemFields(zombie.inventory.InventoryItem))
   113. [receiveEatBody(ByteBufferReader, UdpConnection, short)](#receiveEatBody(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   114. [receiveSyncRadioData(ByteBufferReader, UdpConnection, short)](#receiveSyncRadioData(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   115. [sendWorldSound(WorldSoundManager.WorldSound, UdpConnection)](#sendWorldSound(zombie.WorldSoundManager.WorldSound,zombie.core.raknet.UdpConnection))
   116. [kick(IConnection, String, String)](#kick(zombie.network.IConnection,java.lang.String,java.lang.String))
   117. [sendStartRain(IConnection)](#sendStartRain(zombie.network.IConnection))
   118. [startRain()](#startRain())
   119. [sendStopRain(UdpConnection)](#sendStopRain(zombie.core.raknet.UdpConnection))
   120. [stopRain()](#stopRain())
   121. [sendWeather(IConnection)](#sendWeather(zombie.network.IConnection))
   122. [sendWeather()](#sendWeather())
   123. [isInSameFaction(IsoPlayer, IsoPlayer)](#isInSameFaction(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   124. [isAnyPlayerInSameFaction(UdpConnection, IsoPlayer)](#isAnyPlayerInSameFaction(zombie.core.raknet.UdpConnection,zombie.characters.IsoPlayer))
   125. [isAnyPlayerInSameSafehouse(UdpConnection, IsoPlayer)](#isAnyPlayerInSameSafehouse(zombie.core.raknet.UdpConnection,zombie.characters.IsoPlayer))
   126. [shouldSendWorldMapPlayerPosition(UdpConnection, IsoPlayer)](#shouldSendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection,zombie.characters.IsoPlayer))
   127. [sendWorldMapPlayerPosition(UdpConnection)](#sendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection))
   128. [sendWorldMapPlayerPosition()](#sendWorldMapPlayerPosition())
   129. [receiveWorldMapPlayerPosition(ByteBufferReader, UdpConnection, short)](#receiveWorldMapPlayerPosition(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   130. [syncClock(UdpConnection)](#syncClock(zombie.core.raknet.UdpConnection))
   131. [syncClock()](#syncClock())
   132. [sendServerCommand(String, String, KahluaTable, UdpConnection)](#sendServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable,zombie.core.raknet.UdpConnection))
   133. [sendServerCommand(String, String, KahluaTable)](#sendServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   134. [sendServerCommandToRelevant(float, float, String, String, KahluaTable)](#sendServerCommandToRelevant(float,float,java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   135. [sendServerCommandV(String, String, Object...)](#sendServerCommandV(java.lang.String,java.lang.String,java.lang.Object...))
   136. [sendServerCommand(IsoPlayer, String, String, KahluaTable)](#sendServerCommand(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   137. [getPlayers(ArrayList)](#getPlayers(java.util.ArrayList))
   138. [getPlayers()](#getPlayers())
   139. [getPlayerCount()](#getPlayerCount())
   140. [addUser(String, String)](#addUser(java.lang.String,java.lang.String))
   141. [changeRole(String, UdpConnection, String, String)](#changeRole(java.lang.String,zombie.core.raknet.UdpConnection,java.lang.String,java.lang.String))
   142. [sendAmbient(String, int, int, int, float)](#sendAmbient(java.lang.String,int,int,int,float))
   143. [sendChangeSafety(Safety)](#sendChangeSafety(zombie.characters.Safety))
   144. [receivePing(ByteBufferReader, UdpConnection, short)](#receivePing(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   145. [updateOverlayForClients(IsoObject, String, float, float, float, float, UdpConnection)](#updateOverlayForClients(zombie.iso.IsoObject,java.lang.String,float,float,float,float,zombie.core.raknet.UdpConnection))
   146. [sendReanimatedZombieID(IsoPlayer, IsoZombie)](#sendReanimatedZombieID(zombie.characters.IsoPlayer,zombie.characters.IsoZombie))
   147. [receiveRadioServerData(ByteBufferReader, UdpConnection, short)](#receiveRadioServerData(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   148. [receiveRadioDeviceDataState(ByteBufferReader, UdpConnection, short)](#receiveRadioDeviceDataState(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   149. [sendIsoWaveSignal(long, int, int, int, String, String, String, float, float, float, int, boolean)](#sendIsoWaveSignal(long,int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   150. [receivePlayerListensChannel(ByteBufferReader, UdpConnection, short)](#receivePlayerListensChannel(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   151. [sendAlarm(int, int)](#sendAlarm(int,int))
   152. [sendToxicBuilding(int, int, boolean)](#sendToxicBuilding(int,int,boolean))
   153. [isSpawnBuilding(BuildingDef)](#isSpawnBuilding(zombie.iso.BuildingDef))
   154. [setFastForward(boolean)](#setFastForward(boolean))
   155. [receiveViewBannedIPs(ByteBufferReader, UdpConnection, short)](#receiveViewBannedIPs(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   156. [sendBannedIPs(UdpConnection)](#sendBannedIPs(zombie.core.raknet.UdpConnection))
   157. [receiveViewBannedSteamIDs(ByteBufferReader, UdpConnection, short)](#receiveViewBannedSteamIDs(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   158. [sendBannedSteamIDs(UdpConnection)](#sendBannedSteamIDs(zombie.core.raknet.UdpConnection))
   159. [sendTickets(String, UdpConnection)](#sendTickets(java.lang.String,zombie.core.raknet.UdpConnection))
   160. [sendItemListNet(UdpConnection, IsoPlayer, ArrayList, IsoPlayer, String, String)](#sendItemListNet(zombie.core.raknet.UdpConnection,zombie.characters.IsoPlayer,java.util.ArrayList,zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   161. [receiveSendItemListNet(ByteBufferReader, UdpConnection, short)](#receiveSendItemListNet(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   162. [receiveClimateManagerPacket(ByteBufferReader, UdpConnection, short)](#receiveClimateManagerPacket(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   163. [receiveIsoRegionClientRequestFullUpdate(ByteBufferReader, UdpConnection, short)](#receiveIsoRegionClientRequestFullUpdate(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   164. [isWorldVersionUnsupported()](#isWorldVersionUnsupported())
   165. [getPoisonousBerry()](#getPoisonousBerry())
   166. [setPoisonousBerry(String)](#setPoisonousBerry(java.lang.String))
   167. [getPoisonousMushroom()](#getPoisonousMushroom())
   168. [setPoisonousMushroom(String)](#setPoisonousMushroom(java.lang.String))
   169. [getDifficulty()](#getDifficulty())
   170. [setDifficulty(String)](#setDifficulty(java.lang.String))
   171. [transmitBrokenGlass(IsoGridSquare)](#transmitBrokenGlass(zombie.iso.IsoGridSquare))
   172. [transmitBigWaterSplash(int, int, float, float)](#transmitBigWaterSplash(int,int,float,float))
   173. [receiveBigWaterSplash(ByteBufferReader, UdpConnection, short)](#receiveBigWaterSplash(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   174. [transmitFishingData(int, int, TLongIntHashMap, TLongObjectHashMap)](#transmitFishingData(int,int,gnu.trove.map.hash.TLongIntHashMap,gnu.trove.map.hash.TLongObjectHashMap))
   175. [receiveFishingDataRequest(ByteBufferReader, UdpConnection, short)](#receiveFishingDataRequest(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   176. [isServerDropPackets()](#isServerDropPackets())
   177. [receiveSyncPerks(ByteBufferReader, UdpConnection, short)](#receiveSyncPerks(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   178. [receiveSyncEquippedRadioFreq(ByteBufferReader, UdpConnection, short)](#receiveSyncEquippedRadioFreq(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection,short))
   179. [sendRadioPostSilence()](#sendRadioPostSilence())
   180. [sendRadioPostSilence(UdpConnection)](#sendRadioPostSilence(zombie.core.raknet.UdpConnection))
   181. [sendSneezingCoughing(IsoPlayer, int, byte)](#sendSneezingCoughing(zombie.characters.IsoPlayer,int,byte))
   182. [isPlayerConnected(IsoPlayer)](#isPlayerConnected(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameServer
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.GameServer

---

public class GameServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `GameServer.CCFilter`

  `private static class`

  `GameServer.DelayedConnection`

  `static enum`

  `GameServer.MapRemotePlayerVisibility`

  `private static class`

  `GameServer.s_performance`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final zombie.core.utils.UpdateLimit`

  `calcCountPlayersInRelevantPositionLimiter`

  `private static final HashMap<String, GameServer.CCFilter>`

  `ccFilters`

  `static String`

  `checksum`

  `static boolean`

  `closed`

  `private static final ArrayList<String>`

  `consoleCommands`

  `static boolean`

  `coop`

  `static int`

  `countOfDroppedConnections`

  `private static int`

  `countOfDroppedPackets`

  `static boolean`

  `debug`

  `static final HashSet<zombie.core.raknet.UdpConnection>`

  `DebugPlayer`

  `static int`

  `defaultPort`

  `private String`

  `difficulty`

  `static final zombie.network.DiscordBot`

  `discordBot`

  `private static boolean`

  `done`

  `private static int`

  `droppedPackets`

  `static boolean`

  `fastForward`

  `static final int`

  `FPS`

  `static String`

  `gameMap`

  `static boolean`

  `guiCommandline`

  `static final HashMap<Short,Long>`

  `IDToAddressMap`

  `static final HashMap<Short, IsoPlayer>`

  `IDToPlayerMap`

  `static String`

  `ip`

  `static String`

  `ipCommandline`

  `private static boolean`

  `launched`

  `private static int`

  `mainCycleExceptionLogCount`

  `private static final ConcurrentHashMap<String, GameServer.DelayedConnection>`

  `MainLoopDelayedDisconnectQ`

  `private static final ArrayList<zombie.network.IZomboidPacket>`

  `MainLoopNetData2`

  `private static final ConcurrentLinkedQueue<zombie.network.IZomboidPacket>`

  `MainLoopNetDataHighPriorityQ`

  `private static final ConcurrentLinkedQueue<zombie.network.IZomboidPacket>`

  `MainLoopNetDataQ`

  `private static final ConcurrentLinkedQueue<zombie.network.IZomboidPacket>`

  `MainLoopPlayerUpdateQ`

  `static Thread`

  `mainThread`

  `static final int`

  `MAX_PLAYERS`

  `static final int`

  `PacketsUpdateRate`

  `static final ArrayList<IsoPlayer>`

  `Players`

  `static final HashMap<IsoPlayer, Long>`

  `PlayerToAddressMap`

  `static final HashMap<Short,Vector2>`

  `playerToCoordsMap`

  `private String`

  `poisonousBerry`

  `private String`

  `poisonousMushroom`

  `static int`

  `portCommandline`

  `static zombie.core.raknet.UdpConnection`

  `removeAnimalsConnection`

  `static zombie.core.raknet.UdpConnection`

  `removeCorpsesConnection`

  `static zombie.core.raknet.UdpConnection`

  `removeVehiclesConnection`

  `static zombie.core.raknet.UdpConnection`

  `removeZombiesConnection`

  `static int`

  `resetId`

  `static String`

  `seed`

  `private static final zombie.core.utils.UpdateLimit`

  `sendWorldMapPlayerPositionLimiter`

  `static boolean`

  `server`

  `static final ArrayList<String>`

  `ServerMods`

  `static String`

  `serverName`

  `private static final Thread`

  `shutdownHook`

  `static final zombie.core.raknet.UdpConnection[]`

  `SlotToConnection`

  `static boolean`

  `softReset`

  `static Boolean`

  `steamVacCommandline`

  `static final ArrayList<IsoPlayer>`

  `tempPlayers`

  `static int`

  `test`

  `static final int`

  `TimeLimitForProcessPackets`

  `static float`

  `timeSinceKeepAlive`

  `static zombie.core.raknet.UdpEngine`

  `udpEngine`

  `static int`

  `udpPort`

  `static int`

  `udpPortCommandline`

  `static final Map<String,Short>`

  `UserNameToPlayerMap`

  `static String[]`

  `workshopInstallFolders`

  `static final ArrayList<Long>`

  `WorkshopItems`

  `static long[]`

  `workshopTimeStamps`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addConnection(zombie.core.raknet.UdpConnection con)`

  `static void`

  `addDelayedDisconnect(zombie.core.raknet.UdpConnection con)`

  `static void`

  `addDisconnect(zombie.core.raknet.UdpConnection con)`

  `static void`

  `addIncoming(short id,
  zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `static String`

  `addUser(String newUsername,
  String newUserPassword)`

  `static void`

  `addXp(IsoPlayer p,
  PerkFactory.Perk perk,
  float xp)`

  `static void`

  `addXp(IsoPlayer p,
  PerkFactory.Perk perk,
  float xp,
  boolean noMultiplier)`

  `static void`

  `addXp(IsoPlayer player,
  PerkFactory.Perk perk,
  float xp,
  boolean noMultiplier,
  boolean showXp)`

  `static void`

  `addXpMultiplier(IsoPlayer p,
  PerkFactory.Perk perk,
  float multiplier,
  int minLevel,
  int maxLevel)`

  `private static void`

  `answerPing(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `static boolean`

  `canModifyPlayerStats(zombie.core.raknet.UdpConnection c,
  IsoPlayer player)`

  `static String`

  `changeRole(String adminName,
  zombie.core.raknet.UdpConnection adminConnection,
  String user,
  String newAccessLevelName)`

  `static void`

  `close()`

  `static void`

  `connect(zombie.core.raknet.UdpConnection connection)`

  `static void`

  `disconnect(zombie.core.raknet.UdpConnection connection,
  String description)`

  `static void`

  `disconnectPlayer(IsoPlayer player,
  zombie.network.IConnection connection)`

  `static void`

  `doDelayedDisconnect(IsoPlayer player)`

  `static void`

  `doMinimumInit()`

  `static IsoPlayer`

  `getAnyPlayerFromConnection(zombie.network.IConnection connection)`

  `static zombie.core.raknet.UdpConnection`

  `getConnectionByIp(String ip)`

  `static zombie.core.raknet.UdpConnection`

  `getConnectionByPlayerOnlineID(short onlineID)`

  `static zombie.core.raknet.UdpConnection`

  `getConnectionFromPlayer(IsoPlayer player)`

  `String`

  `getDifficulty()`

  `static short`

  `getFreeSlot()`

  `static IsoPlayer`

  `getPlayerByRealUserName(String username)`

  `static IsoPlayer`

  `getPlayerByUserName(String username)`

  `static IsoPlayer`

  `getPlayerByUserNameForCommand(String username)`

  `static int`

  `getPlayerCount()`

  `static IsoPlayer`

  `getPlayerFromConnection(zombie.network.IConnection connection,
  int playerIndex)`

  `static ArrayList<IsoPlayer>`

  `getPlayers()`

  `static ArrayList<IsoPlayer>`

  `getPlayers(ArrayList<IsoPlayer> players)`

  `String`

  `getPoisonousBerry()`

  `String`

  `getPoisonousMushroom()`

  `private static String`

  `handleClientCommand(String input,
  zombie.core.raknet.UdpConnection connection)`

  `private static String`

  `handleServerCommand(String input,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `initClientCommandFilter()`

  `private static boolean`

  `isAnyPlayerInSameFaction(zombie.core.raknet.UdpConnection c1,
  IsoPlayer player2)`

  `private static boolean`

  `isAnyPlayerInSameSafehouse(zombie.core.raknet.UdpConnection c1,
  IsoPlayer player2)`

  `static boolean`

  `isDelayedDisconnect(IsoPlayer player)`

  `static boolean`

  `isDelayedDisconnect(zombie.core.raknet.UdpConnection con)`

  `private static boolean`

  `isInSameFaction(IsoPlayer player1,
  IsoPlayer player2)`

  `static boolean`

  `isPlayerConnected(IsoPlayer player)`

  `static boolean`

  `isServerDropPackets()`

  `static boolean`

  `isSpawnBuilding(BuildingDef def)`

  `private static String`

  `isWorldVersionUnsupported()`

  `static void`

  `kick(zombie.network.IConnection connection,
  String description,
  String reason)`

  `private static void`

  `launchCommandHandler()`

  `static void`

  `loadModData(IsoGridSquare sq)`

  `static void`

  `main(String[] args)`

  `private static void`

  `mainLoopDealWithNetData(zombie.network.ZomboidNetData d)`

  `static void`

  `open()`

  `private static boolean`

  `parseBooleanFromCommandline(String[] args,
  int n,
  String option)`

  `private static String`

  `parseIPFromCommandline(String[] args,
  int n,
  String option)`

  `private static int`

  `parsePortFromCommandline(String[] args,
  int n,
  String option)`

  `static void`

  `PlaySoundAtEveryPlayer(String name)`

  `static void`

  `PlaySoundAtEveryPlayer(String name,
  int x,
  int y,
  int z)`

  `static void`

  `PlaySoundAtEveryPlayer(String name,
  int x,
  int y,
  int z,
  boolean usePlrCoords)`

  `private static void`

  `PlayWorldSound(String name,
  IsoGridSquare source,
  float radius,
  int index)`

  `static void`

  `PlayWorldSoundServer(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `static void`

  `PlayWorldSoundServer(String name,
  IsoGridSquare source,
  float radius,
  int index)`

  `static void`

  `PlayWorldSoundServer(IsoGameCharacter character,
  String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `static void`

  `PlayWorldSoundWavServer(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `private static void`

  `preventIndoorZombies(int x,
  int y,
  int z)`

  `static String`

  `rcon(String command)`

  `static void`

  `receiveBigWaterSplash(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveChangePlayerStats(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveChangeTextColor(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveChatMessageFromPlayer(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveClientCommand(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveClientConnect(zombie.core.raknet.UdpConnection connection,
  zombie.network.ServerWorldDatabase.LogonResult r)`

  `(package private) static void`

  `receiveClimateManagerPacket(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveConstructedZone(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveDrink(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveEatBody(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveFishingDataRequest(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection c,
  short packetType)`

  `(package private) static void`

  `receiveInvMngGetItem(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveInvMngRemoveItem(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveInvMngReqItem(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveInvMngUpdateItem(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveIsoRegionClientRequestFullUpdate(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receivePing(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receivePlayerConnect(zombie.core.network.ByteBufferReader bb,
  zombie.network.IConnection connection,
  String username)`

  `static void`

  `receivePlayerListensChannel(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receivePlayerStartPMChat(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveRadioDeviceDataState(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveRadioServerData(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveReceiveCommand(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSandboxOptions(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSendItemListNet(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSyncCompost(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSyncEquippedRadioFreq(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSyncIsoObject(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveSyncPerks(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveSyncRadioData(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveUpdateItemSprite(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveViewBannedIPs(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveViewBannedSteamIDs(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `(package private) static void`

  `receiveWorldMap(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `receiveWorldMapPlayerPosition(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection,
  short packetType)`

  `static void`

  `removeBrokenGlass(IsoWindow isoWindow)`

  `static int`

  `RemoveItemFromMap(IsoObject obj)`

  `static void`

  `sendAddItemsToContainer(ItemContainer container,
  ArrayList<InventoryItem> items)`

  `static void`

  `sendAddItemToContainer(ItemContainer container,
  InventoryItem item)`

  `static void`

  `sendAlarm(int x,
  int y)`

  `static void`

  `sendAmbient(String name,
  int x,
  int y,
  int radius,
  float volume)`

  `private static void`

  `sendBannedIPs(zombie.core.raknet.UdpConnection connection)`

  `private static void`

  `sendBannedSteamIDs(zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendBloodSplatter(HandWeapon weapon,
  float x,
  float y,
  float z,
  Vector2 hitDir,
  boolean closeKilled,
  boolean radial)`

  `static void`

  `sendChangeSafety(Safety safety)`

  `static void`

  `sendCharacterDeath(IsoDeadBody body)`

  `static void`

  `sendCharacterSound(IsoGameCharacter chr,
  String soundName,
  byte flags)`

  `static void`

  `sendCharacterSound(IsoGameCharacter chr,
  String soundName,
  byte flags,
  zombie.audio.parameters.ParameterMeleeHitSurface.Material material)`

  `static void`

  `sendCompost(IsoCompost compost,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendCorpse(IsoDeadBody body)`

  `static void`

  `sendHelicopter(float x,
  float y,
  boolean active)`

  `static void`

  `sendHitCharacter(zombie.network.packets.hit.HitCharacter packet,
  zombie.network.PacketTypes.PacketType packetType,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendInitialWorldState(zombie.network.IConnection c)`

  `static void`

  `sendIsoWaveSignal(long source,
  int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `static boolean`

  `sendItemListNet(zombie.core.raknet.UdpConnection ignore,
  IsoPlayer sender,
  ArrayList<InventoryItem> items,
  IsoPlayer receiver,
  String sessionID,
  String custom)`

  `static void`

  `sendItemsInContainer(IsoObject o,
  ItemContainer container)`

  `static void`

  `sendItemStats(InventoryItem item)`

  `static void`

  `sendMetaGrid(int cellX,
  int cellY,
  int roomID)`

  `static void`

  `sendMetaGrid(int cellX,
  int cellY,
  int roomID,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendObjectChange(IsoObject o,
  IsoObjectChange change,
  Object... objects)`

  `static void`

  `sendObjectChange(IsoObject o,
  IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl)`

  `static void`

  `sendObjectModData(IsoObject o)`

  `static void`

  `sendOptionsToClients()`

  `static void`

  `sendPlayerConnected(IsoPlayer p,
  zombie.network.IConnection c)`

  `static void`

  `sendPlayerExtraInfo(IsoPlayer p,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendPlayerExtraInfo(IsoPlayer p,
  zombie.core.raknet.UdpConnection connection,
  boolean isForced)`

  `static void`

  `sendRadioPostSilence()`

  `static void`

  `sendRadioPostSilence(zombie.core.raknet.UdpConnection c)`

  `static void`

  `sendReanimatedZombieID(IsoPlayer player,
  IsoZombie zombie)`

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

  `sendServerCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendServerCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args,
  zombie.core.raknet.UdpConnection c)`

  `static void`

  `sendServerCommand(IsoPlayer player,
  String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendServerCommandToRelevant(float x,
  float y,
  String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendServerCommandV(String module,
  String command,
  Object... objects)`

  `static void`

  `sendSlowFactor(IsoGameCharacter chr)`

  `static void`

  `sendSneezingCoughing(IsoPlayer player,
  int sneezingCoughing,
  byte sneezeVar)`

  `private static void`

  `sendStartRain(zombie.network.IConnection c)`

  `private static void`

  `sendStopRain(zombie.core.raknet.UdpConnection c)`

  `static void`

  `sendSyncClothing(IsoPlayer player,
  ItemBodyLocation location,
  InventoryItem item)`

  `static void`

  `sendSyncItemFields(InventoryItem item)`

  `static void`

  `sendSyncPlayerFields(IsoPlayer player,
  byte syncParams)`

  `static void`

  `sendTeleport(IsoPlayer player,
  float x,
  float y,
  float z)`

  `static void`

  `sendTickets(String author,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendToxicBuilding(int x,
  int y,
  boolean toxic)`

  `static void`

  `sendWeather()`

  `private static void`

  `sendWeather(zombie.network.IConnection c)`

  `static void`

  `sendWorldMapPlayerPosition()`

  `private static void`

  `sendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection c)`

  `static void`

  `sendWorldSound(WorldSoundManager.WorldSound sound,
  zombie.core.raknet.UdpConnection connection)`

  `static void`

  `sendZombieSound(IsoZombie.ZombieSound sound,
  IsoZombie zombie)`

  `static void`

  `sendZone(Zone zone)`

  `static void`

  `setCustomVariables(IsoPlayer p,
  zombie.network.IConnection c)`

  `void`

  `setDifficulty(String difficulty)`

  `private static void`

  `setFastForward(boolean fastForward)`

  `void`

  `setPoisonousBerry(String poisonousBerry)`

  `void`

  `setPoisonousMushroom(String poisonousMushroom)`

  `static void`

  `setupCoop()`

  `static void`

  `setupSteamGameServer()`

  `private static boolean`

  `shouldSendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection c,
  IsoPlayer player)`

  `static void`

  `smashWindow(IsoWindow isoWindow)`

  `static void`

  `startRain()`

  `static void`

  `startServer()`

  `static Server`

  `steamGetInternetServerDetails(zombie.core.znet.GameServerDetails steamServer)`

  `static void`

  `stopRain()`

  `private static void`

  `syncActivatedItem(IsoPlayer p,
  InventoryItem item,
  zombie.network.IConnection c)`

  `private static void`

  `syncActivatedItems(IsoPlayer p,
  zombie.network.IConnection c)`

  `static void`

  `syncClock()`

  `private static void`

  `syncClock(zombie.core.raknet.UdpConnection c)`

  `static void`

  `syncClothingFields(IsoPlayer player)`

  `static void`

  `syncHumanVisual(IsoPlayer player)`

  `static void`

  `syncVisuals(IsoPlayer player)`

  `static void`

  `transmitBigWaterSplash(int x,
  int y,
  float dx,
  float dy)`

  `static void`

  `transmitBrokenGlass(IsoGridSquare sq)`

  `static void`

  `transmitFishingData(int seed,
  int trashSeed,
  gnu.trove.map.hash.TLongIntHashMap noiseFishPointDisabler,
  gnu.trove.map.hash.TLongObjectHashMap<FishSchoolManager.ChumData> chumPoints)`

  `static void`

  `updateOverlayForClients(IsoObject object,
  String spriteName,
  float r,
  float g,
  float b,
  float a,
  zombie.core.raknet.UdpConnection playerConnection)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_PLAYERS

    public static final int MAX\_PLAYERS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.GameServer.MAX_PLAYERS)
  + ### TimeLimitForProcessPackets

    public static final int TimeLimitForProcessPackets

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.GameServer.TimeLimitForProcessPackets)
  + ### PacketsUpdateRate

    public static final int PacketsUpdateRate

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.GameServer.PacketsUpdateRate)
  + ### FPS

    public static final int FPS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.GameServer.FPS)
  + ### ccFilters

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [GameServer.CCFilter](GameServer.CCFilter.html "class in zombie.network")> ccFilters
  + ### test

    public static int test
  + ### defaultPort

    public static int defaultPort
  + ### udpPort

    public static int udpPort
  + ### ipCommandline

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ipCommandline
  + ### portCommandline

    public static int portCommandline
  + ### udpPortCommandline

    public static int udpPortCommandline
  + ### steamVacCommandline

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") steamVacCommandline
  + ### guiCommandline

    public static boolean guiCommandline
  + ### server

    public static boolean server
  + ### coop

    public static boolean coop
  + ### debug

    public static boolean debug
  + ### closed

    public static boolean closed
  + ### softReset

    public static boolean softReset
  + ### seed

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seed
  + ### udpEngine

    public static zombie.core.raknet.UdpEngine udpEngine
  + ### IDToAddressMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"),[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> IDToAddressMap
  + ### IDToPlayerMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"), [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> IDToPlayerMap
  + ### UserNameToPlayerMap

    public static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> UserNameToPlayerMap
  + ### Players

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> Players
  + ### timeSinceKeepAlive

    public static float timeSinceKeepAlive
  + ### DebugPlayer

    public static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<zombie.core.raknet.UdpConnection> DebugPlayer
  + ### resetId

    public static int resetId
  + ### ServerMods

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ServerMods
  + ### WorkshopItems

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> WorkshopItems
  + ### workshopInstallFolders

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] workshopInstallFolders
  + ### workshopTimeStamps

    public static long[] workshopTimeStamps
  + ### serverName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName
  + ### discordBot

    public static final zombie.network.DiscordBot discordBot
  + ### checksum

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checksum
  + ### gameMap

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMap
  + ### fastForward

    public static boolean fastForward
  + ### ip

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip
  + ### SlotToConnection

    public static final zombie.core.raknet.UdpConnection[] SlotToConnection
  + ### PlayerToAddressMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters"), [Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> PlayerToAddressMap
  + ### done

    private static boolean done
  + ### launched

    private static boolean launched
  + ### consoleCommands

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> consoleCommands
  + ### MainLoopPlayerUpdateQ

    private static final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<zombie.network.IZomboidPacket> MainLoopPlayerUpdateQ
  + ### MainLoopNetDataHighPriorityQ

    private static final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<zombie.network.IZomboidPacket> MainLoopNetDataHighPriorityQ
  + ### MainLoopNetDataQ

    private static final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<zombie.network.IZomboidPacket> MainLoopNetDataQ
  + ### MainLoopNetData2

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.network.IZomboidPacket> MainLoopNetData2
  + ### playerToCoordsMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"),[Vector2](../iso/Vector2.html "class in zombie.iso")> playerToCoordsMap
  + ### poisonousBerry

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousBerry
  + ### poisonousMushroom

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousMushroom
  + ### difficulty

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") difficulty
  + ### droppedPackets

    private static int droppedPackets
  + ### countOfDroppedPackets

    private static int countOfDroppedPackets
  + ### countOfDroppedConnections

    public static int countOfDroppedConnections
  + ### removeZombiesConnection

    public static zombie.core.raknet.UdpConnection removeZombiesConnection
  + ### removeAnimalsConnection

    public static zombie.core.raknet.UdpConnection removeAnimalsConnection
  + ### removeCorpsesConnection

    public static zombie.core.raknet.UdpConnection removeCorpsesConnection
  + ### removeVehiclesConnection

    public static zombie.core.raknet.UdpConnection removeVehiclesConnection
  + ### calcCountPlayersInRelevantPositionLimiter

    private static final zombie.core.utils.UpdateLimit calcCountPlayersInRelevantPositionLimiter
  + ### sendWorldMapPlayerPositionLimiter

    private static final zombie.core.utils.UpdateLimit sendWorldMapPlayerPositionLimiter
  + ### mainCycleExceptionLogCount

    private static int mainCycleExceptionLogCount
  + ### mainThread

    public static [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") mainThread
  + ### tempPlayers

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> tempPlayers
  + ### MainLoopDelayedDisconnectQ

    private static final [ConcurrentHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentHashMap.html "class or interface in java.util.concurrent")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [GameServer.DelayedConnection](GameServer.DelayedConnection.html "class in zombie.network")> MainLoopDelayedDisconnectQ
  + ### shutdownHook

    private static final [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") shutdownHook
* Constructor Details
  -------------------

  + ### GameServer

    public GameServer()
* Method Details
  --------------

  + ### parseIPFromCommandline

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parseIPFromCommandline([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") option)
  + ### parsePortFromCommandline

    private static int parsePortFromCommandline([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") option)
  + ### parseBooleanFromCommandline

    private static boolean parseBooleanFromCommandline([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") option)
  + ### setupCoop

    public static void setupCoop()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
  + ### main

    public static void main([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args)
  + ### setupSteamGameServer

    public static void setupSteamGameServer()
  + ### steamGetInternetServerDetails

    public static [Server](Server.html "class in zombie.network") steamGetInternetServerDetails(zombie.core.znet.GameServerDetails steamServer)
  + ### launchCommandHandler

    private static void launchCommandHandler()
  + ### rcon

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rcon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command)
  + ### handleServerCommand

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") handleServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    zombie.core.raknet.UdpConnection connection)
  + ### sendTeleport

    public static void sendTeleport([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    float x,
    float y,
    float z)
  + ### sendPlayerExtraInfo

    public static void sendPlayerExtraInfo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    zombie.core.raknet.UdpConnection connection)
  + ### sendPlayerExtraInfo

    public static void sendPlayerExtraInfo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    zombie.core.raknet.UdpConnection connection,
    boolean isForced)
  + ### canModifyPlayerStats

    public static boolean canModifyPlayerStats(zombie.core.raknet.UdpConnection c,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### receiveChangePlayerStats

    static void receiveChangePlayerStats(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### doMinimumInit

    public static void doMinimumInit()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### startServer

    public static void startServer()
    throws [ConnectException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/ConnectException.html "class or interface in java.net")

    Throws:
    :   `ConnectException`
  + ### mainLoopDealWithNetData

    private static void mainLoopDealWithNetData(zombie.network.ZomboidNetData d)
  + ### receiveInvMngRemoveItem

    static void receiveInvMngRemoveItem(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveInvMngGetItem

    static void receiveInvMngGetItem(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveInvMngReqItem

    static void receiveInvMngReqItem(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveInvMngUpdateItem

    static void receiveInvMngUpdateItem(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receivePlayerStartPMChat

    static void receivePlayerStartPMChat(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveSandboxOptions

    static void receiveSandboxOptions(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveChangeTextColor

    static void receiveChangeTextColor(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveSyncCompost

    static void receiveSyncCompost(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendCompost

    public static void sendCompost([IsoCompost](../iso/objects/IsoCompost.html "class in zombie.iso.objects") compost,
    zombie.core.raknet.UdpConnection connection)
  + ### sendHelicopter

    public static void sendHelicopter(float x,
    float y,
    boolean active)
  + ### open

    public static void open()
  + ### close

    public static void close()
  + ### sendZone

    public static void sendZone([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### receiveConstructedZone

    static void receiveConstructedZone(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### addXp

    public static void addXp([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float xp)
  + ### addXp

    public static void addXp([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float xp,
    boolean noMultiplier)
  + ### addXp

    public static void addXp([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float xp,
    boolean noMultiplier,
    boolean showXp)
  + ### addXpMultiplier

    public static void addXpMultiplier([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    [PerkFactory.Perk](../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    float multiplier,
    int minLevel,
    int maxLevel)
  + ### answerPing

    private static void answerPing(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### receiveUpdateItemSprite

    static void receiveUpdateItemSprite(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendOptionsToClients

    public static void sendOptionsToClients()
  + ### sendCorpse

    public static void sendCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### receiveChatMessageFromPlayer

    static void receiveChatMessageFromPlayer(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### loadModData

    public static void loadModData([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### receiveDrink

    static void receiveDrink(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveReceiveCommand

    static void receiveReceiveCommand(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### handleClientCommand

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") handleClientCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    zombie.core.raknet.UdpConnection connection)
  + ### PlayWorldSound

    private static void PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") source,
    float radius,
    int index)
  + ### PlayWorldSoundServer

    public static void PlayWorldSoundServer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") source,
    float radius,
    int index)
  + ### PlayWorldSoundServer

    public static void PlayWorldSoundServer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSoundServer

    public static void PlayWorldSoundServer([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSoundWavServer

    public static void PlayWorldSoundWavServer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlaySoundAtEveryPlayer

    public static void PlaySoundAtEveryPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int z)
  + ### PlaySoundAtEveryPlayer

    public static void PlaySoundAtEveryPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### PlaySoundAtEveryPlayer

    public static void PlaySoundAtEveryPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int z,
    boolean usePlrCoords)
  + ### sendCharacterSound

    public static void sendCharacterSound([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    byte flags)
  + ### sendCharacterSound

    public static void sendCharacterSound([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    byte flags,
    zombie.audio.parameters.ParameterMeleeHitSurface.Material material)
  + ### sendZombieSound

    public static void sendZombieSound([IsoZombie.ZombieSound](../characters/IsoZombie.ZombieSound.html "enum class in zombie.characters") sound,
    [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### initClientCommandFilter

    public static void initClientCommandFilter()
  + ### receiveClientCommand

    static void receiveClientCommand(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveWorldMap

    static void receiveWorldMap(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getAnyPlayerFromConnection

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getAnyPlayerFromConnection(zombie.network.IConnection connection)
  + ### getPlayerFromConnection

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerFromConnection(zombie.network.IConnection connection,
    int playerIndex)
  + ### getPlayerByRealUserName

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerByRealUserName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getPlayerByUserName

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerByUserName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getPlayerByUserNameForCommand

    public static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerByUserNameForCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getConnectionByPlayerOnlineID

    public static zombie.core.raknet.UdpConnection getConnectionByPlayerOnlineID(short onlineID)
  + ### getConnectionFromPlayer

    public static zombie.core.raknet.UdpConnection getConnectionFromPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getConnectionByIp

    public static zombie.core.raknet.UdpConnection getConnectionByIp([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip)
  + ### sendAddItemToContainer

    public static void sendAddItemToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendAddItemsToContainer

    public static void sendAddItemsToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
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
  + ### sendSyncPlayerFields

    public static void sendSyncPlayerFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    byte syncParams)
  + ### sendSyncClothing

    public static void sendSyncClothing([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncVisuals

    public static void syncVisuals([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### syncHumanVisual

    public static void syncHumanVisual([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### syncClothingFields

    public static void syncClothingFields([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendItemsInContainer

    public static void sendItemsInContainer([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### addConnection

    public static void addConnection(zombie.core.raknet.UdpConnection con)
  + ### addDisconnect

    public static void addDisconnect(zombie.core.raknet.UdpConnection con)
  + ### addDelayedDisconnect

    public static void addDelayedDisconnect(zombie.core.raknet.UdpConnection con)
  + ### doDelayedDisconnect

    public static void doDelayedDisconnect([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isDelayedDisconnect

    public static boolean isDelayedDisconnect(zombie.core.raknet.UdpConnection con)
  + ### isDelayedDisconnect

    public static boolean isDelayedDisconnect([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### disconnectPlayer

    public static void disconnectPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    zombie.network.IConnection connection)
  + ### getFreeSlot

    public static short getFreeSlot()
  + ### receiveClientConnect

    public static void receiveClientConnect(zombie.core.raknet.UdpConnection connection,
    zombie.network.ServerWorldDatabase.LogonResult r)
  + ### sendMetaGrid

    public static void sendMetaGrid(int cellX,
    int cellY,
    int roomID,
    zombie.core.raknet.UdpConnection connection)
  + ### sendMetaGrid

    public static void sendMetaGrid(int cellX,
    int cellY,
    int roomID)
  + ### preventIndoorZombies

    private static void preventIndoorZombies(int x,
    int y,
    int z)
  + ### setCustomVariables

    public static void setCustomVariables([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    zombie.network.IConnection c)
  + ### sendPlayerConnected

    public static void sendPlayerConnected([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    zombie.network.IConnection c)
  + ### syncActivatedItems

    private static void syncActivatedItems([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    zombie.network.IConnection c)
  + ### syncActivatedItem

    private static void syncActivatedItem([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") p,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    zombie.network.IConnection c)
  + ### receivePlayerConnect

    public static void receivePlayerConnect(zombie.core.network.ByteBufferReader bb,
    zombie.network.IConnection connection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### sendInitialWorldState

    public static void sendInitialWorldState(zombie.network.IConnection c)
  + ### sendObjectModData

    public static void sendObjectModData([IsoObject](../iso/IsoObject.html "class in zombie.iso") o)
  + ### sendSlowFactor

    public static void sendSlowFactor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### sendObjectChange

    public static void sendObjectChange([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl)
  + ### sendObjectChange

    public static void sendObjectChange([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... objects)
  + ### receiveSyncIsoObject

    static void receiveSyncIsoObject(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### RemoveItemFromMap

    public static int RemoveItemFromMap([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### sendBloodSplatter

    public static void sendBloodSplatter([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    float x,
    float y,
    float z,
    [Vector2](../iso/Vector2.html "class in zombie.iso") hitDir,
    boolean closeKilled,
    boolean radial)
  + ### connect

    public static void connect(zombie.core.raknet.UdpConnection connection)
  + ### disconnect

    public static void disconnect(zombie.core.raknet.UdpConnection connection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### addIncoming

    public static void addIncoming(short id,
    zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### smashWindow

    public static void smashWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") isoWindow)
  + ### removeBrokenGlass

    public static void removeBrokenGlass([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") isoWindow)
  + ### sendHitCharacter

    public static void sendHitCharacter(zombie.network.packets.hit.HitCharacter packet,
    zombie.network.PacketTypes.PacketType packetType,
    zombie.core.raknet.UdpConnection connection)
  + ### sendCharacterDeath

    public static void sendCharacterDeath([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### sendItemStats

    public static void sendItemStats([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sendSyncItemFields

    public static void sendSyncItemFields([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### receiveEatBody

    public static void receiveEatBody(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveSyncRadioData

    public static void receiveSyncRadioData(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendWorldSound

    public static void sendWorldSound([WorldSoundManager.WorldSound](../WorldSoundManager.WorldSound.html "class in zombie") sound,
    zombie.core.raknet.UdpConnection connection)
  + ### kick

    public static void kick(zombie.network.IConnection connection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reason)
  + ### sendStartRain

    private static void sendStartRain(zombie.network.IConnection c)
  + ### startRain

    public static void startRain()
  + ### sendStopRain

    private static void sendStopRain(zombie.core.raknet.UdpConnection c)
  + ### stopRain

    public static void stopRain()
  + ### sendWeather

    private static void sendWeather(zombie.network.IConnection c)
  + ### sendWeather

    public static void sendWeather()
  + ### isInSameFaction

    private static boolean isInSameFaction([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player1,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player2)
  + ### isAnyPlayerInSameFaction

    private static boolean isAnyPlayerInSameFaction(zombie.core.raknet.UdpConnection c1,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player2)
  + ### isAnyPlayerInSameSafehouse

    private static boolean isAnyPlayerInSameSafehouse(zombie.core.raknet.UdpConnection c1,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player2)
  + ### shouldSendWorldMapPlayerPosition

    private static boolean shouldSendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection c,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendWorldMapPlayerPosition

    private static void sendWorldMapPlayerPosition(zombie.core.raknet.UdpConnection c)
  + ### sendWorldMapPlayerPosition

    public static void sendWorldMapPlayerPosition()
  + ### receiveWorldMapPlayerPosition

    public static void receiveWorldMapPlayerPosition(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### syncClock

    private static void syncClock(zombie.core.raknet.UdpConnection c)
  + ### syncClock

    public static void syncClock()
  + ### sendServerCommand

    public static void sendServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args,
    zombie.core.raknet.UdpConnection c)
  + ### sendServerCommand

    public static void sendServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendServerCommandToRelevant

    public static void sendServerCommandToRelevant(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### sendServerCommandV

    public static void sendServerCommandV([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... objects)
  + ### sendServerCommand

    public static void sendServerCommand([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### getPlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> getPlayers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> players)
  + ### getPlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters")> getPlayers()
  + ### getPlayerCount

    public static int getPlayerCount()
  + ### addUser

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") addUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newUsername,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newUserPassword)
  + ### changeRole

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") changeRole([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") adminName,
    zombie.core.raknet.UdpConnection adminConnection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newAccessLevelName)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### sendAmbient

    public static void sendAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int radius,
    float volume)
  + ### sendChangeSafety

    public static void sendChangeSafety([Safety](../characters/Safety.html "class in zombie.characters") safety)
  + ### receivePing

    static void receivePing(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### updateOverlayForClients

    public static void updateOverlayForClients([IsoObject](../iso/IsoObject.html "class in zombie.iso") object,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    float r,
    float g,
    float b,
    float a,
    zombie.core.raknet.UdpConnection playerConnection)
  + ### sendReanimatedZombieID

    public static void sendReanimatedZombieID([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### receiveRadioServerData

    public static void receiveRadioServerData(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveRadioDeviceDataState

    public static void receiveRadioDeviceDataState(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendIsoWaveSignal

    public static void sendIsoWaveSignal(long source,
    int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### receivePlayerListensChannel

    public static void receivePlayerListensChannel(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendAlarm

    public static void sendAlarm(int x,
    int y)
  + ### sendToxicBuilding

    public static void sendToxicBuilding(int x,
    int y,
    boolean toxic)
  + ### isSpawnBuilding

    public static boolean isSpawnBuilding([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") def)
  + ### setFastForward

    private static void setFastForward(boolean fastForward)
  + ### receiveViewBannedIPs

    static void receiveViewBannedIPs(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### sendBannedIPs

    private static void sendBannedIPs(zombie.core.raknet.UdpConnection connection)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### receiveViewBannedSteamIDs

    static void receiveViewBannedSteamIDs(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### sendBannedSteamIDs

    private static void sendBannedSteamIDs(zombie.core.raknet.UdpConnection connection)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### sendTickets

    public static void sendTickets([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    zombie.core.raknet.UdpConnection connection)
    throws [SQLException](https://docs.oracle.com/en/java/javase/25/docs/api/java.sql/java/sql/SQLException.html "class or interface in java.sql")

    Throws:
    :   `SQLException`
  + ### sendItemListNet

    public static boolean sendItemListNet(zombie.core.raknet.UdpConnection ignore,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") sender,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") receiver,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sessionID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") custom)
  + ### receiveSendItemListNet

    static void receiveSendItemListNet(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveClimateManagerPacket

    static void receiveClimateManagerPacket(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveIsoRegionClientRequestFullUpdate

    static void receiveIsoRegionClientRequestFullUpdate(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### isWorldVersionUnsupported

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") isWorldVersionUnsupported()
  + ### getPoisonousBerry

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPoisonousBerry()
  + ### setPoisonousBerry

    public void setPoisonousBerry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousBerry)
  + ### getPoisonousMushroom

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPoisonousMushroom()
  + ### setPoisonousMushroom

    public void setPoisonousMushroom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousMushroom)
  + ### getDifficulty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDifficulty()
  + ### setDifficulty

    public void setDifficulty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") difficulty)
  + ### transmitBrokenGlass

    public static void transmitBrokenGlass([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### transmitBigWaterSplash

    public static void transmitBigWaterSplash(int x,
    int y,
    float dx,
    float dy)
  + ### receiveBigWaterSplash

    public static void receiveBigWaterSplash(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### transmitFishingData

    public static void transmitFishingData(int seed,
    int trashSeed,
    gnu.trove.map.hash.TLongIntHashMap noiseFishPointDisabler,
    gnu.trove.map.hash.TLongObjectHashMap<[FishSchoolManager.ChumData](../iso/FishSchoolManager.ChumData.html "class in zombie.iso")> chumPoints)
  + ### receiveFishingDataRequest

    static void receiveFishingDataRequest(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection c,
    short packetType)
  + ### isServerDropPackets

    public static boolean isServerDropPackets()
  + ### receiveSyncPerks

    static void receiveSyncPerks(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### receiveSyncEquippedRadioFreq

    static void receiveSyncEquippedRadioFreq(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection,
    short packetType)
  + ### sendRadioPostSilence

    public static void sendRadioPostSilence()
  + ### sendRadioPostSilence

    public static void sendRadioPostSilence(zombie.core.raknet.UdpConnection c)
  + ### sendSneezingCoughing

    public static void sendSneezingCoughing([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int sneezingCoughing,
    byte sneezeVar)
  + ### isPlayerConnected

    public static boolean isPlayerConnected([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)