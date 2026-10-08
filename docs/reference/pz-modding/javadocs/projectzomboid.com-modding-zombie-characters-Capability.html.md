[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [Capability](Capability.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [LoginOnServer](#LoginOnServer)
   3. [PriorityLogin](#PriorityLogin)
   4. [CantBeKickedIfTooLaggy](#CantBeKickedIfTooLaggy)
   5. [ToggleGodModHimself](#ToggleGodModHimself)
   6. [ToggleInvisibleHimself](#ToggleInvisibleHimself)
   7. [ToggleInvincibleHimself](#ToggleInvincibleHimself)
   8. [ToggleNoclipHimself](#ToggleNoclipHimself)
   9. [SeePlayersConnected](#SeePlayersConnected)
   10. [TeleportToPlayer](#TeleportToPlayer)
   11. [TeleportToCoordinates](#TeleportToCoordinates)
   12. [SeePublicServerOptions](#SeePublicServerOptions)
   13. [CanOpenLockedDoors](#CanOpenLockedDoors)
   14. [CanGoInsideSafehouses](#CanGoInsideSafehouses)
   15. [CanAlwaysJoinServer](#CanAlwaysJoinServer)
   16. [SeesInvisiblePlayers](#SeesInvisiblePlayers)
   17. [CanSeeMessageForAdmin](#CanSeeMessageForAdmin)
   18. [PVPLogTool](#PVPLogTool)
   19. [CanSeePlayersStats](#CanSeePlayersStats)
   20. [CantBeKickedByAnticheat](#CantBeKickedByAnticheat)
   21. [CantBeKickedByUser](#CantBeKickedByUser)
   22. [CantBeBannedByAnticheat](#CantBeBannedByAnticheat)
   23. [CantBeBannedByUser](#CantBeBannedByUser)
   24. [SeeWorldMap](#SeeWorldMap)
   25. [CanMedicalCheat](#CanMedicalCheat)
   26. [UIManagerProcessCommands](#UIManagerProcessCommands)
   27. [UseDebugContextMenu](#UseDebugContextMenu)
   28. [ToggleGodModEveryone](#ToggleGodModEveryone)
   29. [ToggleInvisibleEveryone](#ToggleInvisibleEveryone)
   30. [ToggleNoclipEveryone](#ToggleNoclipEveryone)
   31. [TeleportPlayerToAnotherPlayer](#TeleportPlayerToAnotherPlayer)
   32. [MakeEventsAlarmGunshot](#MakeEventsAlarmGunshot)
   33. [StartStopRain](#StartStopRain)
   34. [AddItem](#AddItem)
   35. [AddXP](#AddXP)
   36. [SeeNetworkUsers](#SeeNetworkUsers)
   37. [UseLootZed](#UseLootZed)
   38. [UseLootLog](#UseLootLog)
   39. [CreateHorde](#CreateHorde)
   40. [CreateStory](#CreateStory)
   41. [KickUser](#KickUser)
   42. [DisplayServerMessage](#DisplayServerMessage)
   43. [CanModifyPlayerStatsInThePlayerStatsUI](#CanModifyPlayerStatsInThePlayerStatsUI)
   44. [CanModifyBodyStats](#CanModifyBodyStats)
   45. [AdminChat](#AdminChat)
   46. [HideFromSteamUserList](#HideFromSteamUserList)
   47. [ToggleWriteRoleNameAbove](#ToggleWriteRoleNameAbove)
   48. [BanUnbanUser](#BanUnbanUser)
   49. [EditMapSymbols](#EditMapSymbols)
   50. [ManipulateWhitelist](#ManipulateWhitelist)
   51. [ChangeAccessLevel](#ChangeAccessLevel)
   52. [CanSetupSafehouses](#CanSetupSafehouses)
   53. [CanSetupNonPVPZone](#CanSetupNonPVPZone)
   54. [FactionCheat](#FactionCheat)
   55. [AnswerTickets](#AnswerTickets)
   56. [RolesRead](#RolesRead)
   57. [ToggleUnlimitedEndurance](#ToggleUnlimitedEndurance)
   58. [ToggleKnowAllRecipes](#ToggleKnowAllRecipes)
   59. [ToggleUnlimitedAmmo](#ToggleUnlimitedAmmo)
   60. [ToggleUnlimitedCarry](#ToggleUnlimitedCarry)
   61. [UseMovablesCheat](#UseMovablesCheat)
   62. [UseFastMoveCheat](#UseFastMoveCheat)
   63. [UseBuildCheat](#UseBuildCheat)
   64. [UseFarmingCheat](#UseFarmingCheat)
   65. [UseFishingCheat](#UseFishingCheat)
   66. [UseHealthCheat](#UseHealthCheat)
   67. [UseMechanicsCheat](#UseMechanicsCheat)
   68. [UseTimedActionInstantCheat](#UseTimedActionInstantCheat)
   69. [UseZombieDontAttackCheat](#UseZombieDontAttackCheat)
   70. [GeneralCheats](#GeneralCheats)
   71. [ModifyNetworkUsers](#ModifyNetworkUsers)
   72. [EditItem](#EditItem)
   73. [GetSteamScoreboard](#GetSteamScoreboard)
   74. [GetStatistic](#GetStatistic)
   75. [SandboxOptions](#SandboxOptions)
   76. [ReadUserLog](#ReadUserLog)
   77. [AddUserlog](#AddUserlog)
   78. [WorkWithUserlog](#WorkWithUserlog)
   79. [ClimateManager](#ClimateManager)
   80. [InspectPlayerInventory](#InspectPlayerInventory)
   81. [AnimalCheats](#AnimalCheats)
   82. [DebugConsole](#DebugConsole)
   83. [PopmanManage](#PopmanManage)
   84. [ManipulateVehicle](#ManipulateVehicle)
   85. [ManipulateMods](#ManipulateMods)
   86. [ManipulateZombie](#ManipulateZombie)
   87. [CanSeeAll](#CanSeeAll)
   88. [CanHearAll](#CanHearAll)
   89. [UseBrushToolManager](#UseBrushToolManager)
   90. [IgnoreChatSlowMode](#IgnoreChatSlowMode)
   91. [EmptyLinesInChat](#EmptyLinesInChat)
   92. [SaveWorld](#SaveWorld)
   93. [QuitWorld](#QuitWorld)
   94. [ChangeAndReloadServerOptions](#ChangeAndReloadServerOptions)
   95. [ReloadLuaFiles](#ReloadLuaFiles)
   96. [BypassLuaChecksum](#BypassLuaChecksum)
   97. [RolesWrite](#RolesWrite)
   98. [ConnectWithDebug](#ConnectWithDebug)
7. [Constructor Details](#constructor-detail)
   1. [Capability()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class Capability
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Capability](Capability.html "enum class in zombie.characters")>

zombie.characters.Capability

All Implemented Interfaces:
:   `Serializable, Comparable<Capability>, Constable`

---

public enum Capability
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Capability](Capability.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AddItem`

  `AddUserlog`

  `AddXP`

  `AdminChat`

  `AnimalCheats`

  `AnswerTickets`

  `BanUnbanUser`

  `BypassLuaChecksum`

  `CanAlwaysJoinServer`

  `CanGoInsideSafehouses`

  `CanHearAll`

  `CanMedicalCheat`

  `CanModifyBodyStats`

  `CanModifyPlayerStatsInThePlayerStatsUI`

  `CanOpenLockedDoors`

  `CanSeeAll`

  `CanSeeMessageForAdmin`

  `CanSeePlayersStats`

  `CanSetupNonPVPZone`

  `CanSetupSafehouses`

  `CantBeBannedByAnticheat`

  `CantBeBannedByUser`

  `CantBeKickedByAnticheat`

  `CantBeKickedByUser`

  `CantBeKickedIfTooLaggy`

  `ChangeAccessLevel`

  `ChangeAndReloadServerOptions`

  `ClimateManager`

  `ConnectWithDebug`

  `CreateHorde`

  `CreateStory`

  `DebugConsole`

  `DisplayServerMessage`

  `EditItem`

  `EditMapSymbols`

  `EmptyLinesInChat`

  `FactionCheat`

  `GeneralCheats`

  `GetStatistic`

  `GetSteamScoreboard`

  `HideFromSteamUserList`

  `IgnoreChatSlowMode`

  `InspectPlayerInventory`

  `KickUser`

  `LoginOnServer`

  `MakeEventsAlarmGunshot`

  `ManipulateMods`

  `ManipulateVehicle`

  `ManipulateWhitelist`

  `ManipulateZombie`

  `ModifyNetworkUsers`

  `None`

  `PopmanManage`

  `PriorityLogin`

  `PVPLogTool`

  `QuitWorld`

  `ReadUserLog`

  `ReloadLuaFiles`

  `RolesRead`

  `RolesWrite`

  `SandboxOptions`

  `SaveWorld`

  `SeeNetworkUsers`

  `SeePlayersConnected`

  `SeePublicServerOptions`

  `SeesInvisiblePlayers`

  `SeeWorldMap`

  `StartStopRain`

  `TeleportPlayerToAnotherPlayer`

  `TeleportToCoordinates`

  `TeleportToPlayer`

  `ToggleGodModEveryone`

  `ToggleGodModHimself`

  `ToggleInvincibleHimself`

  `ToggleInvisibleEveryone`

  `ToggleInvisibleHimself`

  `ToggleKnowAllRecipes`

  `ToggleNoclipEveryone`

  `ToggleNoclipHimself`

  `ToggleUnlimitedAmmo`

  `ToggleUnlimitedCarry`

  `ToggleUnlimitedEndurance`

  `ToggleWriteRoleNameAbove`

  `UIManagerProcessCommands`

  `UseBrushToolManager`

  `UseBuildCheat`

  `UseDebugContextMenu`

  `UseFarmingCheat`

  `UseFastMoveCheat`

  `UseFishingCheat`

  `UseHealthCheat`

  `UseLootLog`

  `UseLootZed`

  `UseMechanicsCheat`

  `UseMovablesCheat`

  `UseTimedActionInstantCheat`

  `UseZombieDontAttackCheat`

  `WorkWithUserlog`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Capability()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Capability`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Capability[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### None

    public static final [Capability](Capability.html "enum class in zombie.characters") None
  + ### LoginOnServer

    public static final [Capability](Capability.html "enum class in zombie.characters") LoginOnServer
  + ### PriorityLogin

    public static final [Capability](Capability.html "enum class in zombie.characters") PriorityLogin
  + ### CantBeKickedIfTooLaggy

    public static final [Capability](Capability.html "enum class in zombie.characters") CantBeKickedIfTooLaggy
  + ### ToggleGodModHimself

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleGodModHimself
  + ### ToggleInvisibleHimself

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleInvisibleHimself
  + ### ToggleInvincibleHimself

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleInvincibleHimself
  + ### ToggleNoclipHimself

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleNoclipHimself
  + ### SeePlayersConnected

    public static final [Capability](Capability.html "enum class in zombie.characters") SeePlayersConnected
  + ### TeleportToPlayer

    public static final [Capability](Capability.html "enum class in zombie.characters") TeleportToPlayer
  + ### TeleportToCoordinates

    public static final [Capability](Capability.html "enum class in zombie.characters") TeleportToCoordinates
  + ### SeePublicServerOptions

    public static final [Capability](Capability.html "enum class in zombie.characters") SeePublicServerOptions
  + ### CanOpenLockedDoors

    public static final [Capability](Capability.html "enum class in zombie.characters") CanOpenLockedDoors
  + ### CanGoInsideSafehouses

    public static final [Capability](Capability.html "enum class in zombie.characters") CanGoInsideSafehouses
  + ### CanAlwaysJoinServer

    public static final [Capability](Capability.html "enum class in zombie.characters") CanAlwaysJoinServer
  + ### SeesInvisiblePlayers

    public static final [Capability](Capability.html "enum class in zombie.characters") SeesInvisiblePlayers
  + ### CanSeeMessageForAdmin

    public static final [Capability](Capability.html "enum class in zombie.characters") CanSeeMessageForAdmin
  + ### PVPLogTool

    public static final [Capability](Capability.html "enum class in zombie.characters") PVPLogTool
  + ### CanSeePlayersStats

    public static final [Capability](Capability.html "enum class in zombie.characters") CanSeePlayersStats
  + ### CantBeKickedByAnticheat

    public static final [Capability](Capability.html "enum class in zombie.characters") CantBeKickedByAnticheat
  + ### CantBeKickedByUser

    public static final [Capability](Capability.html "enum class in zombie.characters") CantBeKickedByUser
  + ### CantBeBannedByAnticheat

    public static final [Capability](Capability.html "enum class in zombie.characters") CantBeBannedByAnticheat
  + ### CantBeBannedByUser

    public static final [Capability](Capability.html "enum class in zombie.characters") CantBeBannedByUser
  + ### SeeWorldMap

    public static final [Capability](Capability.html "enum class in zombie.characters") SeeWorldMap
  + ### CanMedicalCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") CanMedicalCheat
  + ### UIManagerProcessCommands

    public static final [Capability](Capability.html "enum class in zombie.characters") UIManagerProcessCommands
  + ### UseDebugContextMenu

    public static final [Capability](Capability.html "enum class in zombie.characters") UseDebugContextMenu
  + ### ToggleGodModEveryone

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleGodModEveryone
  + ### ToggleInvisibleEveryone

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleInvisibleEveryone
  + ### ToggleNoclipEveryone

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleNoclipEveryone
  + ### TeleportPlayerToAnotherPlayer

    public static final [Capability](Capability.html "enum class in zombie.characters") TeleportPlayerToAnotherPlayer
  + ### MakeEventsAlarmGunshot

    public static final [Capability](Capability.html "enum class in zombie.characters") MakeEventsAlarmGunshot
  + ### StartStopRain

    public static final [Capability](Capability.html "enum class in zombie.characters") StartStopRain
  + ### AddItem

    public static final [Capability](Capability.html "enum class in zombie.characters") AddItem
  + ### AddXP

    public static final [Capability](Capability.html "enum class in zombie.characters") AddXP
  + ### SeeNetworkUsers

    public static final [Capability](Capability.html "enum class in zombie.characters") SeeNetworkUsers
  + ### UseLootZed

    public static final [Capability](Capability.html "enum class in zombie.characters") UseLootZed
  + ### UseLootLog

    public static final [Capability](Capability.html "enum class in zombie.characters") UseLootLog
  + ### CreateHorde

    public static final [Capability](Capability.html "enum class in zombie.characters") CreateHorde
  + ### CreateStory

    public static final [Capability](Capability.html "enum class in zombie.characters") CreateStory
  + ### KickUser

    public static final [Capability](Capability.html "enum class in zombie.characters") KickUser
  + ### DisplayServerMessage

    public static final [Capability](Capability.html "enum class in zombie.characters") DisplayServerMessage
  + ### CanModifyPlayerStatsInThePlayerStatsUI

    public static final [Capability](Capability.html "enum class in zombie.characters") CanModifyPlayerStatsInThePlayerStatsUI
  + ### CanModifyBodyStats

    public static final [Capability](Capability.html "enum class in zombie.characters") CanModifyBodyStats
  + ### AdminChat

    public static final [Capability](Capability.html "enum class in zombie.characters") AdminChat
  + ### HideFromSteamUserList

    public static final [Capability](Capability.html "enum class in zombie.characters") HideFromSteamUserList
  + ### ToggleWriteRoleNameAbove

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleWriteRoleNameAbove
  + ### BanUnbanUser

    public static final [Capability](Capability.html "enum class in zombie.characters") BanUnbanUser
  + ### EditMapSymbols

    public static final [Capability](Capability.html "enum class in zombie.characters") EditMapSymbols
  + ### ManipulateWhitelist

    public static final [Capability](Capability.html "enum class in zombie.characters") ManipulateWhitelist
  + ### ChangeAccessLevel

    public static final [Capability](Capability.html "enum class in zombie.characters") ChangeAccessLevel
  + ### CanSetupSafehouses

    public static final [Capability](Capability.html "enum class in zombie.characters") CanSetupSafehouses
  + ### CanSetupNonPVPZone

    public static final [Capability](Capability.html "enum class in zombie.characters") CanSetupNonPVPZone
  + ### FactionCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") FactionCheat
  + ### AnswerTickets

    public static final [Capability](Capability.html "enum class in zombie.characters") AnswerTickets
  + ### RolesRead

    public static final [Capability](Capability.html "enum class in zombie.characters") RolesRead
  + ### ToggleUnlimitedEndurance

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleUnlimitedEndurance
  + ### ToggleKnowAllRecipes

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleKnowAllRecipes
  + ### ToggleUnlimitedAmmo

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleUnlimitedAmmo
  + ### ToggleUnlimitedCarry

    public static final [Capability](Capability.html "enum class in zombie.characters") ToggleUnlimitedCarry
  + ### UseMovablesCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseMovablesCheat
  + ### UseFastMoveCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseFastMoveCheat
  + ### UseBuildCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseBuildCheat
  + ### UseFarmingCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseFarmingCheat
  + ### UseFishingCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseFishingCheat
  + ### UseHealthCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseHealthCheat
  + ### UseMechanicsCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseMechanicsCheat
  + ### UseTimedActionInstantCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseTimedActionInstantCheat
  + ### UseZombieDontAttackCheat

    public static final [Capability](Capability.html "enum class in zombie.characters") UseZombieDontAttackCheat
  + ### GeneralCheats

    public static final [Capability](Capability.html "enum class in zombie.characters") GeneralCheats
  + ### ModifyNetworkUsers

    public static final [Capability](Capability.html "enum class in zombie.characters") ModifyNetworkUsers
  + ### EditItem

    public static final [Capability](Capability.html "enum class in zombie.characters") EditItem
  + ### GetSteamScoreboard

    public static final [Capability](Capability.html "enum class in zombie.characters") GetSteamScoreboard
  + ### GetStatistic

    public static final [Capability](Capability.html "enum class in zombie.characters") GetStatistic
  + ### SandboxOptions

    public static final [Capability](Capability.html "enum class in zombie.characters") SandboxOptions
  + ### ReadUserLog

    public static final [Capability](Capability.html "enum class in zombie.characters") ReadUserLog
  + ### AddUserlog

    public static final [Capability](Capability.html "enum class in zombie.characters") AddUserlog
  + ### WorkWithUserlog

    public static final [Capability](Capability.html "enum class in zombie.characters") WorkWithUserlog
  + ### ClimateManager

    public static final [Capability](Capability.html "enum class in zombie.characters") ClimateManager
  + ### InspectPlayerInventory

    public static final [Capability](Capability.html "enum class in zombie.characters") InspectPlayerInventory
  + ### AnimalCheats

    public static final [Capability](Capability.html "enum class in zombie.characters") AnimalCheats
  + ### DebugConsole

    public static final [Capability](Capability.html "enum class in zombie.characters") DebugConsole
  + ### PopmanManage

    public static final [Capability](Capability.html "enum class in zombie.characters") PopmanManage
  + ### ManipulateVehicle

    public static final [Capability](Capability.html "enum class in zombie.characters") ManipulateVehicle
  + ### ManipulateMods

    public static final [Capability](Capability.html "enum class in zombie.characters") ManipulateMods
  + ### ManipulateZombie

    public static final [Capability](Capability.html "enum class in zombie.characters") ManipulateZombie
  + ### CanSeeAll

    public static final [Capability](Capability.html "enum class in zombie.characters") CanSeeAll
  + ### CanHearAll

    public static final [Capability](Capability.html "enum class in zombie.characters") CanHearAll
  + ### UseBrushToolManager

    public static final [Capability](Capability.html "enum class in zombie.characters") UseBrushToolManager
  + ### IgnoreChatSlowMode

    public static final [Capability](Capability.html "enum class in zombie.characters") IgnoreChatSlowMode
  + ### EmptyLinesInChat

    public static final [Capability](Capability.html "enum class in zombie.characters") EmptyLinesInChat
  + ### SaveWorld

    public static final [Capability](Capability.html "enum class in zombie.characters") SaveWorld
  + ### QuitWorld

    public static final [Capability](Capability.html "enum class in zombie.characters") QuitWorld
  + ### ChangeAndReloadServerOptions

    public static final [Capability](Capability.html "enum class in zombie.characters") ChangeAndReloadServerOptions
  + ### ReloadLuaFiles

    public static final [Capability](Capability.html "enum class in zombie.characters") ReloadLuaFiles
  + ### BypassLuaChecksum

    public static final [Capability](Capability.html "enum class in zombie.characters") BypassLuaChecksum
  + ### RolesWrite

    public static final [Capability](Capability.html "enum class in zombie.characters") RolesWrite
  + ### ConnectWithDebug

    public static final [Capability](Capability.html "enum class in zombie.characters") ConnectWithDebug
* Constructor Details
  -------------------

  + ### Capability

    private Capability()
* Method Details
  --------------

  + ### values

    public static [Capability](Capability.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Capability](Capability.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null