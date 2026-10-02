[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [ServerOptions](ServerOptions.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [publicOptions](#publicOptions)
   3. [clientOptionsList](#clientOptionsList)
   4. [MAX\_PORT](#MAX_PORT)
   5. [options](#options)
   6. [optionByName](#optionByName)
   7. [pvp](#pvp)
   8. [pvpLogToolChat](#pvpLogToolChat)
   9. [pvpLogToolFile](#pvpLogToolFile)
   10. [pauseEmpty](#pauseEmpty)
   11. [globalChat](#globalChat)
   12. [chatStreams](#chatStreams)
   13. [open](#open)
   14. [serverWelcomeMessage](#serverWelcomeMessage)
   15. [displayUserName](#displayUserName)
   16. [showFirstAndLastName](#showFirstAndLastName)
   17. [usernameDisguises](#usernameDisguises)
   18. [hideDisguisedUserName](#hideDisguisedUserName)
   19. [switchZombiesOwnershipEachUpdate](#switchZombiesOwnershipEachUpdate)
   20. [spawnPoint](#spawnPoint)
   21. [safetySystem](#safetySystem)
   22. [showSafety](#showSafety)
   23. [safetyToggleTimer](#safetyToggleTimer)
   24. [safetyCooldownTimer](#safetyCooldownTimer)
   25. [safetyDisconnectDelay](#safetyDisconnectDelay)
   26. [spawnItems](#spawnItems)
   27. [defaultPort](#defaultPort)
   28. [udpPort](#udpPort)
   29. [resetId](#resetId)
   30. [mods](#mods)
   31. [map](#map)
   32. [doLuaChecksum](#doLuaChecksum)
   33. [denyLoginOnOverloadedServer](#denyLoginOnOverloadedServer)
   34. [isPublic](#isPublic)
   35. [publicName](#publicName)
   36. [publicDescription](#publicDescription)
   37. [maxPlayers](#maxPlayers)
   38. [pingLimit](#pingLimit)
   39. [safehousePreventsLootRespawn](#safehousePreventsLootRespawn)
   40. [dropOffWhiteListAfterDeath](#dropOffWhiteListAfterDeath)
   41. [noFire](#noFire)
   42. [announceDeath](#announceDeath)
   43. [announceAnimalDeath](#announceAnimalDeath)
   44. [saveWorldEveryMinutes](#saveWorldEveryMinutes)
   45. [playerSafehouse](#playerSafehouse)
   46. [adminSafehouse](#adminSafehouse)
   47. [safehouseAllowTrepass](#safehouseAllowTrepass)
   48. [safehouseAllowFire](#safehouseAllowFire)
   49. [safehouseAllowLoot](#safehouseAllowLoot)
   50. [safehouseAllowRespawn](#safehouseAllowRespawn)
   51. [safehouseDaySurvivedToClaim](#safehouseDaySurvivedToClaim)
   52. [safeHouseRemovalTime](#safeHouseRemovalTime)
   53. [safehouseAllowNonResidential](#safehouseAllowNonResidential)
   54. [safehouseDisableDisguises](#safehouseDisableDisguises)
   55. [maxSafezoneSize](#maxSafezoneSize)
   56. [allowDestructionBySledgehammer](#allowDestructionBySledgehammer)
   57. [sledgehammerOnlyInSafehouse](#sledgehammerOnlyInSafehouse)
   58. [war](#war)
   59. [warStartDelay](#warStartDelay)
   60. [warDuration](#warDuration)
   61. [warSafehouseHitPoints](#warSafehouseHitPoints)
   62. [serverPlayerId](#serverPlayerId)
   63. [rconPort](#rconPort)
   64. [rconPassword](#rconPassword)
   65. [discordEnable](#discordEnable)
   66. [discordToken](#discordToken)
   67. [discordChatChannel](#discordChatChannel)
   68. [discordLogChannel](#discordLogChannel)
   69. [discordCommandChannel](#discordCommandChannel)
   70. [webhookAddress](#webhookAddress)
   71. [password](#password)
   72. [maxAccountsPerUser](#maxAccountsPerUser)
   73. [allowCoop](#allowCoop)
   74. [sleepAllowed](#sleepAllowed)
   75. [sleepNeeded](#sleepNeeded)
   76. [knockedDownAllowed](#knockedDownAllowed)
   77. [sneakModeHideFromOtherPlayers](#sneakModeHideFromOtherPlayers)
   78. [ultraSpeedDoesnotAffectToAnimals](#ultraSpeedDoesnotAffectToAnimals)
   79. [workshopItems](#workshopItems)
   80. [steamScoreboard](#steamScoreboard)
   81. [steamVac](#steamVac)
   82. [uPnp](#uPnp)
   83. [voiceEnable](#voiceEnable)
   84. [voiceMinDistance](#voiceMinDistance)
   85. [voiceMaxDistance](#voiceMaxDistance)
   86. [voice3d](#voice3d)
   87. [speedLimit](#speedLimit)
   88. [loginQueueEnabled](#loginQueueEnabled)
   89. [loginQueueConnectTimeout](#loginQueueConnectTimeout)
   90. [serverBrowserAnnouncedIp](#serverBrowserAnnouncedIp)
   91. [playerRespawnWithSelf](#playerRespawnWithSelf)
   92. [playerRespawnWithOther](#playerRespawnWithOther)
   93. [fastForwardMultiplier](#fastForwardMultiplier)
   94. [disableSafehouseWhenOwnerConnected](#disableSafehouseWhenOwnerConnected)
   95. [faction](#faction)
   96. [factionDaySurvivedToCreate](#factionDaySurvivedToCreate)
   97. [factionPlayersRequiredForTag](#factionPlayersRequiredForTag)
   98. [disableRadioStaff](#disableRadioStaff)
   99. [disableRadioAdmin](#disableRadioAdmin)
   100. [disableRadioGm](#disableRadioGm)
   101. [disableRadioOverseer](#disableRadioOverseer)
   102. [disableRadioModerator](#disableRadioModerator)
   103. [disableRadioInvisible](#disableRadioInvisible)
   104. [clientCommandFilter](#clientCommandFilter)
   105. [clientActionLogs](#clientActionLogs)
   106. [perkLogs](#perkLogs)
   107. [itemNumbersLimitPerContainer](#itemNumbersLimitPerContainer)
   108. [bloodSplatLifespanDays](#bloodSplatLifespanDays)
   109. [allowNonAsciiUsername](#allowNonAsciiUsername)
   110. [banKickGlobalSound](#banKickGlobalSound)
   111. [removePlayerCorpsesOnCorpseRemoval](#removePlayerCorpsesOnCorpseRemoval)
   112. [trashDeleteAll](#trashDeleteAll)
   113. [pvpMeleeWhileHitReaction](#pvpMeleeWhileHitReaction)
   114. [mouseOverToSeeDisplayName](#mouseOverToSeeDisplayName)
   115. [hidePlayersBehindYou](#hidePlayersBehindYou)
   116. [pvpMeleeDamageModifier](#pvpMeleeDamageModifier)
   117. [pvpFirearmDamageModifier](#pvpFirearmDamageModifier)
   118. [carEngineAttractionModifier](#carEngineAttractionModifier)
   119. [playerBumpPlayer](#playerBumpPlayer)
   120. [mapRemotePlayerVisibility](#mapRemotePlayerVisibility)
   121. [backupsCount](#backupsCount)
   122. [backupsOnStart](#backupsOnStart)
   123. [backupsOnVersionChange](#backupsOnVersionChange)
   124. [backupsPeriod](#backupsPeriod)
   125. [disableVehicleTowing](#disableVehicleTowing)
   126. [disableTrailerTowing](#disableTrailerTowing)
   127. [disableBurntTowing](#disableBurntTowing)
   128. [badWordListFile](#badWordListFile)
   129. [goodWordListFile](#goodWordListFile)
   130. [badWordPolicy](#badWordPolicy)
   131. [badWordReplacement](#badWordReplacement)
   132. [antiCheatSafety](#antiCheatSafety)
   133. [antiCheatSpeed](#antiCheatSpeed)
   134. [antiCheatNoClip](#antiCheatNoClip)
   135. [antiCheatHit](#antiCheatHit)
   136. [antiCheatPacketException](#antiCheatPacketException)
   137. [antiCheatPermission](#antiCheatPermission)
   138. [antiCheatXp](#antiCheatXp)
   139. [antiCheatSafeHouse](#antiCheatSafeHouse)
   140. [antiCheatPlayer](#antiCheatPlayer)
   141. [antiCheatChecksum](#antiCheatChecksum)
   142. [multiplayerStatisticsPeriod](#multiplayerStatisticsPeriod)
   143. [disableScoreboard](#disableScoreboard)
   144. [hideAdminsInPlayerList](#hideAdminsInPlayerList)
   145. [maxPacketsPerSecond](#maxPacketsPerSecond)
   146. [showCoordinates](#showCoordinates)
   147. [seed](#seed)
   148. [usePhysicsHitReaction](#usePhysicsHitReaction)
   149. [chatMessageCharacterLimit](#chatMessageCharacterLimit)
   150. [chatMessageSlowModeTime](#chatMessageSlowModeTime)
   151. [cardList](#cardList)
7. [Constructor Details](#constructor-detail)
   1. [ServerOptions()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [initOptions()](#initOptions())
   2. [getPublicOptions()](#getPublicOptions())
   3. [getOptions()](#getOptions())
   4. [initClientCommandsHelp()](#initClientCommandsHelp())
   5. [init()](#init())
   6. [resetRegionFile()](#resetRegionFile())
   7. [tryInitSpawnRegionsFile()](#tryInitSpawnRegionsFile())
   8. [getOption(String)](#getOption(java.lang.String))
   9. [getBoolean(String)](#getBoolean(java.lang.String))
   10. [getFloat(String)](#getFloat(java.lang.String))
   11. [getDouble(String)](#getDouble(java.lang.String))
   12. [getInteger(String)](#getInteger(java.lang.String))
   13. [putOption(String, String)](#putOption(java.lang.String,java.lang.String))
   14. [putSaveOption(String, String)](#putSaveOption(java.lang.String,java.lang.String))
   15. [changeOption(String, String)](#changeOption(java.lang.String,java.lang.String))
   16. [getInstance()](#getInstance())
   17. [getClientCommandList(boolean)](#getClientCommandList(boolean))
   18. [getRandomCard()](#getRandomCard())
   19. [addOption(ServerOptions.ServerOption)](#addOption(zombie.network.ServerOptions.ServerOption))
   20. [getNumOptions()](#getNumOptions())
   21. [getOptionByIndex(int)](#getOptionByIndex(int))
   22. [getOptionByName(String)](#getOptionByName(java.lang.String))
   23. [loadServerTextFile(String)](#loadServerTextFile(java.lang.String))
   24. [saveServerTextFile(String)](#saveServerTextFile(java.lang.String))
   25. [getMaxPlayers()](#getMaxPlayers())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerOptions
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.ServerOptions

---

public class ServerOptions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ServerOptions.BooleanServerOption`

  `static class`

  `ServerOptions.DoubleServerOption`

  `static class`

  `ServerOptions.EnumServerOption`

  `static class`

  `ServerOptions.IntegerServerOption`

  `static interface`

  `ServerOptions.ServerOption`

  `static class`

  `ServerOptions.StringServerOption`

  `static class`

  `ServerOptions.TextServerOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ServerOptions.BooleanServerOption`

  `adminSafehouse`

  `ServerOptions.BooleanServerOption`

  `allowCoop`

  `ServerOptions.BooleanServerOption`

  `allowDestructionBySledgehammer`

  `ServerOptions.BooleanServerOption`

  `allowNonAsciiUsername`

  `ServerOptions.BooleanServerOption`

  `announceAnimalDeath`

  `ServerOptions.BooleanServerOption`

  `announceDeath`

  `ServerOptions.EnumServerOption`

  `antiCheatChecksum`

  `ServerOptions.EnumServerOption`

  `antiCheatHit`

  `ServerOptions.EnumServerOption`

  `antiCheatNoClip`

  `ServerOptions.EnumServerOption`

  `antiCheatPacketException`

  `ServerOptions.EnumServerOption`

  `antiCheatPermission`

  `ServerOptions.EnumServerOption`

  `antiCheatPlayer`

  `ServerOptions.EnumServerOption`

  `antiCheatSafeHouse`

  `ServerOptions.EnumServerOption`

  `antiCheatSafety`

  `ServerOptions.EnumServerOption`

  `antiCheatSpeed`

  `ServerOptions.EnumServerOption`

  `antiCheatXp`

  `ServerOptions.IntegerServerOption`

  `backupsCount`

  `ServerOptions.BooleanServerOption`

  `backupsOnStart`

  `ServerOptions.BooleanServerOption`

  `backupsOnVersionChange`

  `ServerOptions.IntegerServerOption`

  `backupsPeriod`

  `ServerOptions.StringServerOption`

  `badWordListFile`

  `ServerOptions.EnumServerOption`

  `badWordPolicy`

  `ServerOptions.StringServerOption`

  `badWordReplacement`

  `ServerOptions.BooleanServerOption`

  `banKickGlobalSound`

  `ServerOptions.IntegerServerOption`

  `bloodSplatLifespanDays`

  `static ArrayList<String>`

  `cardList`

  `ServerOptions.DoubleServerOption`

  `carEngineAttractionModifier`

  `ServerOptions.IntegerServerOption`

  `chatMessageCharacterLimit`

  `ServerOptions.IntegerServerOption`

  `chatMessageSlowModeTime`

  `ServerOptions.StringServerOption`

  `chatStreams`

  `ServerOptions.StringServerOption`

  `clientActionLogs`

  `ServerOptions.StringServerOption`

  `clientCommandFilter`

  `static HashMap<String,String>`

  `clientOptionsList`

  `ServerOptions.IntegerServerOption`

  `defaultPort`

  `ServerOptions.BooleanServerOption`

  `denyLoginOnOverloadedServer`

  `ServerOptions.BooleanServerOption`

  `disableBurntTowing`

  `ServerOptions.BooleanServerOption`

  `disableRadioAdmin`

  `ServerOptions.BooleanServerOption`

  `disableRadioGm`

  `ServerOptions.BooleanServerOption`

  `disableRadioInvisible`

  `ServerOptions.BooleanServerOption`

  `disableRadioModerator`

  `ServerOptions.BooleanServerOption`

  `disableRadioOverseer`

  `ServerOptions.BooleanServerOption`

  `disableRadioStaff`

  `ServerOptions.BooleanServerOption`

  `disableSafehouseWhenOwnerConnected`

  `ServerOptions.BooleanServerOption`

  `disableScoreboard`

  `ServerOptions.BooleanServerOption`

  `disableTrailerTowing`

  `ServerOptions.BooleanServerOption`

  `disableVehicleTowing`

  `ServerOptions.StringServerOption`

  `discordChatChannel`

  `ServerOptions.StringServerOption`

  `discordCommandChannel`

  `ServerOptions.BooleanServerOption`

  `discordEnable`

  `ServerOptions.StringServerOption`

  `discordLogChannel`

  `ServerOptions.StringServerOption`

  `discordToken`

  `ServerOptions.BooleanServerOption`

  `displayUserName`

  `ServerOptions.BooleanServerOption`

  `doLuaChecksum`

  `ServerOptions.BooleanServerOption`

  `dropOffWhiteListAfterDeath`

  `ServerOptions.BooleanServerOption`

  `faction`

  `ServerOptions.IntegerServerOption`

  `factionDaySurvivedToCreate`

  `ServerOptions.IntegerServerOption`

  `factionPlayersRequiredForTag`

  `ServerOptions.DoubleServerOption`

  `fastForwardMultiplier`

  `ServerOptions.BooleanServerOption`

  `globalChat`

  `ServerOptions.StringServerOption`

  `goodWordListFile`

  `ServerOptions.BooleanServerOption`

  `hideAdminsInPlayerList`

  `ServerOptions.BooleanServerOption`

  `hideDisguisedUserName`

  `ServerOptions.BooleanServerOption`

  `hidePlayersBehindYou`

  `static final ServerOptions`

  `instance`

  `ServerOptions.BooleanServerOption`

  `isPublic`

  `ServerOptions.IntegerServerOption`

  `itemNumbersLimitPerContainer`

  `ServerOptions.BooleanServerOption`

  `knockedDownAllowed`

  `ServerOptions.IntegerServerOption`

  `loginQueueConnectTimeout`

  `ServerOptions.BooleanServerOption`

  `loginQueueEnabled`

  `ServerOptions.StringServerOption`

  `map`

  `ServerOptions.IntegerServerOption`

  `mapRemotePlayerVisibility`

  `static final int`

  `MAX_PORT`

  `ServerOptions.IntegerServerOption`

  `maxAccountsPerUser`

  `ServerOptions.IntegerServerOption`

  `maxPacketsPerSecond`

  `ServerOptions.IntegerServerOption`

  `maxPlayers`

  `ServerOptions.IntegerServerOption`

  `maxSafezoneSize`

  `ServerOptions.StringServerOption`

  `mods`

  `ServerOptions.BooleanServerOption`

  `mouseOverToSeeDisplayName`

  `ServerOptions.IntegerServerOption`

  `multiplayerStatisticsPeriod`

  `ServerOptions.BooleanServerOption`

  `noFire`

  `ServerOptions.BooleanServerOption`

  `open`

  `private final HashMap<String, ServerOptions.ServerOption>`

  `optionByName`

  `private final ArrayList<ServerOptions.ServerOption>`

  `options`

  `ServerOptions.StringServerOption`

  `password`

  `ServerOptions.BooleanServerOption`

  `pauseEmpty`

  `ServerOptions.BooleanServerOption`

  `perkLogs`

  `ServerOptions.IntegerServerOption`

  `pingLimit`

  `ServerOptions.BooleanServerOption`

  `playerBumpPlayer`

  `ServerOptions.BooleanServerOption`

  `playerRespawnWithOther`

  `ServerOptions.BooleanServerOption`

  `playerRespawnWithSelf`

  `ServerOptions.BooleanServerOption`

  `playerSafehouse`

  `ServerOptions.TextServerOption`

  `publicDescription`

  `ServerOptions.StringServerOption`

  `publicName`

  `private final ArrayList<String>`

  `publicOptions`

  `ServerOptions.BooleanServerOption`

  `pvp`

  `ServerOptions.DoubleServerOption`

  `pvpFirearmDamageModifier`

  `ServerOptions.BooleanServerOption`

  `pvpLogToolChat`

  `ServerOptions.BooleanServerOption`

  `pvpLogToolFile`

  `ServerOptions.DoubleServerOption`

  `pvpMeleeDamageModifier`

  `ServerOptions.BooleanServerOption`

  `pvpMeleeWhileHitReaction`

  `ServerOptions.StringServerOption`

  `rconPassword`

  `ServerOptions.IntegerServerOption`

  `rconPort`

  `ServerOptions.BooleanServerOption`

  `removePlayerCorpsesOnCorpseRemoval`

  `ServerOptions.IntegerServerOption`

  `resetId`

  `ServerOptions.BooleanServerOption`

  `safehouseAllowFire`

  `ServerOptions.BooleanServerOption`

  `safehouseAllowLoot`

  `ServerOptions.BooleanServerOption`

  `safehouseAllowNonResidential`

  `ServerOptions.BooleanServerOption`

  `safehouseAllowRespawn`

  `ServerOptions.BooleanServerOption`

  `safehouseAllowTrepass`

  `ServerOptions.IntegerServerOption`

  `safehouseDaySurvivedToClaim`

  `ServerOptions.BooleanServerOption`

  `safehouseDisableDisguises`

  `ServerOptions.BooleanServerOption`

  `safehousePreventsLootRespawn`

  `ServerOptions.IntegerServerOption`

  `safeHouseRemovalTime`

  `ServerOptions.IntegerServerOption`

  `safetyCooldownTimer`

  `ServerOptions.IntegerServerOption`

  `safetyDisconnectDelay`

  `ServerOptions.BooleanServerOption`

  `safetySystem`

  `ServerOptions.IntegerServerOption`

  `safetyToggleTimer`

  `ServerOptions.IntegerServerOption`

  `saveWorldEveryMinutes`

  `ServerOptions.StringServerOption`

  `seed`

  `ServerOptions.StringServerOption`

  `serverBrowserAnnouncedIp`

  `ServerOptions.StringServerOption`

  `serverPlayerId`

  `ServerOptions.TextServerOption`

  `serverWelcomeMessage`

  `ServerOptions.BooleanServerOption`

  `showCoordinates`

  `ServerOptions.BooleanServerOption`

  `showFirstAndLastName`

  `ServerOptions.BooleanServerOption`

  `showSafety`

  `ServerOptions.BooleanServerOption`

  `sledgehammerOnlyInSafehouse`

  `ServerOptions.BooleanServerOption`

  `sleepAllowed`

  `ServerOptions.BooleanServerOption`

  `sleepNeeded`

  `ServerOptions.BooleanServerOption`

  `sneakModeHideFromOtherPlayers`

  `ServerOptions.StringServerOption`

  `spawnItems`

  `ServerOptions.StringServerOption`

  `spawnPoint`

  `ServerOptions.DoubleServerOption`

  `speedLimit`

  `ServerOptions.BooleanServerOption`

  `steamScoreboard`

  `ServerOptions.BooleanServerOption`

  `steamVac`

  `ServerOptions.BooleanServerOption`

  `switchZombiesOwnershipEachUpdate`

  `ServerOptions.BooleanServerOption`

  `trashDeleteAll`

  `ServerOptions.IntegerServerOption`

  `udpPort`

  `ServerOptions.BooleanServerOption`

  `ultraSpeedDoesnotAffectToAnimals`

  `ServerOptions.BooleanServerOption`

  `uPnp`

  `ServerOptions.BooleanServerOption`

  `usePhysicsHitReaction`

  `ServerOptions.BooleanServerOption`

  `usernameDisguises`

  `ServerOptions.BooleanServerOption`

  `voice3d`

  `ServerOptions.BooleanServerOption`

  `voiceEnable`

  `ServerOptions.DoubleServerOption`

  `voiceMaxDistance`

  `ServerOptions.DoubleServerOption`

  `voiceMinDistance`

  `ServerOptions.BooleanServerOption`

  `war`

  `ServerOptions.IntegerServerOption`

  `warDuration`

  `ServerOptions.IntegerServerOption`

  `warSafehouseHitPoints`

  `ServerOptions.IntegerServerOption`

  `warStartDelay`

  `ServerOptions.StringServerOption`

  `webhookAddress`

  `ServerOptions.StringServerOption`

  `workshopItems`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ServerOptions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOption(ServerOptions.ServerOption option)`

  `String`

  `changeOption(String key,
  String value)`

  `Boolean`

  `getBoolean(String key)`

  `static ArrayList<String>`

  `getClientCommandList(boolean doLine)`

  `Double`

  `getDouble(String key)`

  `Float`

  `getFloat(String key)`

  `static ServerOptions`

  `getInstance()`

  `Integer`

  `getInteger(String key)`

  `int`

  `getMaxPlayers()`

  `int`

  `getNumOptions()`

  `String`

  `getOption(String key)`

  `ServerOptions.ServerOption`

  `getOptionByIndex(int index)`

  `ServerOptions.ServerOption`

  `getOptionByName(String name)`

  `ArrayList<ServerOptions.ServerOption>`

  `getOptions()`

  `ArrayList<String>`

  `getPublicOptions()`

  `static String`

  `getRandomCard()`

  `void`

  `init()`

  `static void`

  `initClientCommandsHelp()`

  `private void`

  `initOptions()`

  `boolean`

  `loadServerTextFile(String serverName)`

  `void`

  `putOption(String key,
  String value)`

  `void`

  `putSaveOption(String key,
  String value)`

  `void`

  `resetRegionFile()`

  `boolean`

  `saveServerTextFile(String serverName)`

  `private static void`

  `tryInitSpawnRegionsFile()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [ServerOptions](ServerOptions.html "class in zombie.network") instance
  + ### publicOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> publicOptions
  + ### clientOptionsList

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clientOptionsList
  + ### MAX\_PORT

    public static final int MAX\_PORT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.ServerOptions.MAX_PORT)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network")> options
  + ### optionByName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network")> optionByName
  + ### pvp

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") pvp
  + ### pvpLogToolChat

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") pvpLogToolChat
  + ### pvpLogToolFile

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") pvpLogToolFile
  + ### pauseEmpty

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") pauseEmpty
  + ### globalChat

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") globalChat
  + ### chatStreams

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") chatStreams
  + ### open

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") open
  + ### serverWelcomeMessage

    public [ServerOptions.TextServerOption](ServerOptions.TextServerOption.html "class in zombie.network") serverWelcomeMessage
  + ### displayUserName

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") displayUserName
  + ### showFirstAndLastName

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") showFirstAndLastName
  + ### usernameDisguises

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") usernameDisguises
  + ### hideDisguisedUserName

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") hideDisguisedUserName
  + ### switchZombiesOwnershipEachUpdate

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") switchZombiesOwnershipEachUpdate
  + ### spawnPoint

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") spawnPoint
  + ### safetySystem

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safetySystem
  + ### showSafety

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") showSafety
  + ### safetyToggleTimer

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") safetyToggleTimer
  + ### safetyCooldownTimer

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") safetyCooldownTimer
  + ### safetyDisconnectDelay

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") safetyDisconnectDelay
  + ### spawnItems

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") spawnItems
  + ### defaultPort

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") defaultPort
  + ### udpPort

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") udpPort
  + ### resetId

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") resetId
  + ### mods

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") mods
  + ### map

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") map
  + ### doLuaChecksum

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") doLuaChecksum
  + ### denyLoginOnOverloadedServer

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") denyLoginOnOverloadedServer
  + ### isPublic

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") isPublic
  + ### publicName

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") publicName
  + ### publicDescription

    public [ServerOptions.TextServerOption](ServerOptions.TextServerOption.html "class in zombie.network") publicDescription
  + ### maxPlayers

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") maxPlayers
  + ### pingLimit

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") pingLimit
  + ### safehousePreventsLootRespawn

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehousePreventsLootRespawn
  + ### dropOffWhiteListAfterDeath

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") dropOffWhiteListAfterDeath
  + ### noFire

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") noFire
  + ### announceDeath

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") announceDeath
  + ### announceAnimalDeath

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") announceAnimalDeath
  + ### saveWorldEveryMinutes

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") saveWorldEveryMinutes
  + ### playerSafehouse

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") playerSafehouse
  + ### adminSafehouse

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") adminSafehouse
  + ### safehouseAllowTrepass

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseAllowTrepass
  + ### safehouseAllowFire

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseAllowFire
  + ### safehouseAllowLoot

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseAllowLoot
  + ### safehouseAllowRespawn

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseAllowRespawn
  + ### safehouseDaySurvivedToClaim

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") safehouseDaySurvivedToClaim
  + ### safeHouseRemovalTime

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") safeHouseRemovalTime
  + ### safehouseAllowNonResidential

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseAllowNonResidential
  + ### safehouseDisableDisguises

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") safehouseDisableDisguises
  + ### maxSafezoneSize

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") maxSafezoneSize
  + ### allowDestructionBySledgehammer

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") allowDestructionBySledgehammer
  + ### sledgehammerOnlyInSafehouse

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") sledgehammerOnlyInSafehouse
  + ### war

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") war
  + ### warStartDelay

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") warStartDelay
  + ### warDuration

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") warDuration
  + ### warSafehouseHitPoints

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") warSafehouseHitPoints
  + ### serverPlayerId

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") serverPlayerId
  + ### rconPort

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") rconPort
  + ### rconPassword

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") rconPassword
  + ### discordEnable

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") discordEnable
  + ### discordToken

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") discordToken
  + ### discordChatChannel

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") discordChatChannel
  + ### discordLogChannel

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") discordLogChannel
  + ### discordCommandChannel

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") discordCommandChannel
  + ### webhookAddress

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") webhookAddress
  + ### password

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") password
  + ### maxAccountsPerUser

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") maxAccountsPerUser
  + ### allowCoop

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") allowCoop
  + ### sleepAllowed

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") sleepAllowed
  + ### sleepNeeded

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") sleepNeeded
  + ### knockedDownAllowed

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") knockedDownAllowed
  + ### sneakModeHideFromOtherPlayers

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") sneakModeHideFromOtherPlayers
  + ### ultraSpeedDoesnotAffectToAnimals

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") ultraSpeedDoesnotAffectToAnimals
  + ### workshopItems

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") workshopItems
  + ### steamScoreboard

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") steamScoreboard
  + ### steamVac

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") steamVac
  + ### uPnp

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") uPnp
  + ### voiceEnable

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") voiceEnable
  + ### voiceMinDistance

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") voiceMinDistance
  + ### voiceMaxDistance

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") voiceMaxDistance
  + ### voice3d

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") voice3d
  + ### speedLimit

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") speedLimit
  + ### loginQueueEnabled

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") loginQueueEnabled
  + ### loginQueueConnectTimeout

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") loginQueueConnectTimeout
  + ### serverBrowserAnnouncedIp

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") serverBrowserAnnouncedIp
  + ### playerRespawnWithSelf

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") playerRespawnWithSelf
  + ### playerRespawnWithOther

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") playerRespawnWithOther
  + ### fastForwardMultiplier

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") fastForwardMultiplier
  + ### disableSafehouseWhenOwnerConnected

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableSafehouseWhenOwnerConnected
  + ### faction

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") faction
  + ### factionDaySurvivedToCreate

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") factionDaySurvivedToCreate
  + ### factionPlayersRequiredForTag

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") factionPlayersRequiredForTag
  + ### disableRadioStaff

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioStaff
  + ### disableRadioAdmin

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioAdmin
  + ### disableRadioGm

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioGm
  + ### disableRadioOverseer

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioOverseer
  + ### disableRadioModerator

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioModerator
  + ### disableRadioInvisible

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableRadioInvisible
  + ### clientCommandFilter

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") clientCommandFilter
  + ### clientActionLogs

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") clientActionLogs
  + ### perkLogs

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") perkLogs
  + ### itemNumbersLimitPerContainer

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") itemNumbersLimitPerContainer
  + ### bloodSplatLifespanDays

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") bloodSplatLifespanDays
  + ### allowNonAsciiUsername

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") allowNonAsciiUsername
  + ### banKickGlobalSound

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") banKickGlobalSound
  + ### removePlayerCorpsesOnCorpseRemoval

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") removePlayerCorpsesOnCorpseRemoval
  + ### trashDeleteAll

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") trashDeleteAll
  + ### pvpMeleeWhileHitReaction

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") pvpMeleeWhileHitReaction
  + ### mouseOverToSeeDisplayName

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") mouseOverToSeeDisplayName
  + ### hidePlayersBehindYou

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") hidePlayersBehindYou
  + ### pvpMeleeDamageModifier

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") pvpMeleeDamageModifier
  + ### pvpFirearmDamageModifier

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") pvpFirearmDamageModifier
  + ### carEngineAttractionModifier

    public [ServerOptions.DoubleServerOption](ServerOptions.DoubleServerOption.html "class in zombie.network") carEngineAttractionModifier
  + ### playerBumpPlayer

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") playerBumpPlayer
  + ### mapRemotePlayerVisibility

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") mapRemotePlayerVisibility
  + ### backupsCount

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") backupsCount
  + ### backupsOnStart

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") backupsOnStart
  + ### backupsOnVersionChange

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") backupsOnVersionChange
  + ### backupsPeriod

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") backupsPeriod
  + ### disableVehicleTowing

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableVehicleTowing
  + ### disableTrailerTowing

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableTrailerTowing
  + ### disableBurntTowing

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableBurntTowing
  + ### badWordListFile

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") badWordListFile
  + ### goodWordListFile

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") goodWordListFile
  + ### badWordPolicy

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") badWordPolicy
  + ### badWordReplacement

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") badWordReplacement
  + ### antiCheatSafety

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatSafety
  + ### antiCheatSpeed

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatSpeed
  + ### antiCheatNoClip

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatNoClip
  + ### antiCheatHit

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatHit
  + ### antiCheatPacketException

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatPacketException
  + ### antiCheatPermission

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatPermission
  + ### antiCheatXp

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatXp
  + ### antiCheatSafeHouse

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatSafeHouse
  + ### antiCheatPlayer

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatPlayer
  + ### antiCheatChecksum

    public [ServerOptions.EnumServerOption](ServerOptions.EnumServerOption.html "class in zombie.network") antiCheatChecksum
  + ### multiplayerStatisticsPeriod

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") multiplayerStatisticsPeriod
  + ### disableScoreboard

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") disableScoreboard
  + ### hideAdminsInPlayerList

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") hideAdminsInPlayerList
  + ### maxPacketsPerSecond

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") maxPacketsPerSecond
  + ### showCoordinates

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") showCoordinates
  + ### seed

    public [ServerOptions.StringServerOption](ServerOptions.StringServerOption.html "class in zombie.network") seed
  + ### usePhysicsHitReaction

    public [ServerOptions.BooleanServerOption](ServerOptions.BooleanServerOption.html "class in zombie.network") usePhysicsHitReaction
  + ### chatMessageCharacterLimit

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") chatMessageCharacterLimit
  + ### chatMessageSlowModeTime

    public [ServerOptions.IntegerServerOption](ServerOptions.IntegerServerOption.html "class in zombie.network") chatMessageSlowModeTime
  + ### cardList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> cardList
* Constructor Details
  -------------------

  + ### ServerOptions

    public ServerOptions()
* Method Details
  --------------

  + ### initOptions

    private void initOptions()
  + ### getPublicOptions

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPublicOptions()
  + ### getOptions

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network")> getOptions()
  + ### initClientCommandsHelp

    public static void initClientCommandsHelp()
  + ### init

    public void init()
  + ### resetRegionFile

    public void resetRegionFile()
  + ### tryInitSpawnRegionsFile

    private static void tryInitSpawnRegionsFile()
  + ### getOption

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getBoolean

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getFloat

    public [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") getFloat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getDouble

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getDouble([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getInteger

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") getInteger([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### putOption

    public void putOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### putSaveOption

    public void putSaveOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### changeOption

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") changeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### getInstance

    public static [ServerOptions](ServerOptions.html "class in zombie.network") getInstance()
  + ### getClientCommandList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClientCommandList(boolean doLine)
  + ### getRandomCard

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomCard()
  + ### addOption

    public void addOption([ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network") option)
  + ### getNumOptions

    public int getNumOptions()
  + ### getOptionByIndex

    public [ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network") getOptionByIndex(int index)
  + ### getOptionByName

    public [ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### loadServerTextFile

    public boolean loadServerTextFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### saveServerTextFile

    public boolean saveServerTextFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### getMaxPlayers

    public int getMaxPlayers()