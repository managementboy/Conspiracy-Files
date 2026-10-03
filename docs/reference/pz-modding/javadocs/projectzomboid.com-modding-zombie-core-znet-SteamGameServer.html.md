[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.znet](package-summary.html)
2. [SteamGameServer](SteamGameServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [STEAM\_SERVERS\_DISCONNECTED](#STEAM_SERVERS_DISCONNECTED)
   2. [STEAM\_SERVERS\_CONNECTED](#STEAM_SERVERS_CONNECTED)
   3. [STEAM\_SERVERS\_CONNECTFAILURE](#STEAM_SERVERS_CONNECTFAILURE)
6. [Constructor Details](#constructor-detail)
   1. [SteamGameServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Init(String, int, int, int, String)](#Init(java.lang.String,int,int,int,java.lang.String))
   2. [SetProduct(String)](#SetProduct(java.lang.String))
   3. [SetGameDescription(String)](#SetGameDescription(java.lang.String))
   4. [SetModDir(String)](#SetModDir(java.lang.String))
   5. [SetDedicatedServer(boolean)](#SetDedicatedServer(boolean))
   6. [LogOnAnonymous()](#LogOnAnonymous())
   7. [EnableHeartBeats(boolean)](#EnableHeartBeats(boolean))
   8. [SetMaxPlayerCount(int)](#SetMaxPlayerCount(int))
   9. [SetServerName(String)](#SetServerName(java.lang.String))
   10. [SetMapName(String)](#SetMapName(java.lang.String))
   11. [SetKeyValue(String, String)](#SetKeyValue(java.lang.String,java.lang.String))
   12. [SetGameTags(String)](#SetGameTags(java.lang.String))
   13. [SetRegion(String)](#SetRegion(java.lang.String))
   14. [BUpdateUserData(long, String, int)](#BUpdateUserData(long,java.lang.String,int))
   15. [GetSteamServersConnectState()](#GetSteamServersConnectState())
   16. [GetSteamID()](#GetSteamID())
   17. [AddPlayer(short, String, int)](#AddPlayer(short,java.lang.String,int))
   18. [RemovePlayer(short)](#RemovePlayer(short))
   19. [UpdatePlayer(short, int)](#UpdatePlayer(short,int))
   20. [AddPlayer(IsoPlayer)](#AddPlayer(zombie.characters.IsoPlayer))
   21. [RemovePlayer(IsoPlayer)](#RemovePlayer(zombie.characters.IsoPlayer))
   22. [UpdatePlayer(IsoPlayer)](#UpdatePlayer(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SteamGameServer
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.znet.SteamGameServer

---

public class SteamGameServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `STEAM_SERVERS_CONNECTED`

  `static final int`

  `STEAM_SERVERS_CONNECTFAILURE`

  `static final int`

  `STEAM_SERVERS_DISCONNECTED`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SteamGameServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `AddPlayer(short playerID,
  String playerName,
  int score)`

  `static void`

  `AddPlayer(IsoPlayer player)`

  `static boolean`

  `BUpdateUserData(long steamID,
  String playerName,
  int score)`

  `static void`

  `EnableHeartBeats(boolean bActive)`

  `static long`

  `GetSteamID()`

  `static int`

  `GetSteamServersConnectState()`

  `static boolean`

  `Init(String ip,
  int gamePort,
  int udpPort,
  int serverMode,
  String version)`

  `static void`

  `LogOnAnonymous()`

  `private static void`

  `RemovePlayer(short playerID)`

  `static void`

  `RemovePlayer(IsoPlayer player)`

  `static void`

  `SetDedicatedServer(boolean dedicated)`

  `static void`

  `SetGameDescription(String description)`

  `static void`

  `SetGameTags(String gameTags)`

  `static void`

  `SetKeyValue(String key,
  String value)`

  `static void`

  `SetMapName(String mapName)`

  `static void`

  `SetMaxPlayerCount(int playersMax)`

  `static void`

  `SetModDir(String modDir)`

  `static void`

  `SetProduct(String product)`

  `static void`

  `SetRegion(String region)`

  `static void`

  `SetServerName(String serverName)`

  `private static void`

  `UpdatePlayer(short playerID,
  int score)`

  `static void`

  `UpdatePlayer(IsoPlayer player)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### STEAM\_SERVERS\_DISCONNECTED

    public static final int STEAM\_SERVERS\_DISCONNECTED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.znet.SteamGameServer.STEAM_SERVERS_DISCONNECTED)
  + ### STEAM\_SERVERS\_CONNECTED

    public static final int STEAM\_SERVERS\_CONNECTED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.znet.SteamGameServer.STEAM_SERVERS_CONNECTED)
  + ### STEAM\_SERVERS\_CONNECTFAILURE

    public static final int STEAM\_SERVERS\_CONNECTFAILURE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.znet.SteamGameServer.STEAM_SERVERS_CONNECTFAILURE)
* Constructor Details
  -------------------

  + ### SteamGameServer

    public SteamGameServer()
* Method Details
  --------------

  + ### Init

    public static boolean Init([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip,
    int gamePort,
    int udpPort,
    int serverMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") version)
  + ### SetProduct

    public static void SetProduct([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") product)
  + ### SetGameDescription

    public static void SetGameDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### SetModDir

    public static void SetModDir([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDir)
  + ### SetDedicatedServer

    public static void SetDedicatedServer(boolean dedicated)
  + ### LogOnAnonymous

    public static void LogOnAnonymous()
  + ### EnableHeartBeats

    public static void EnableHeartBeats(boolean bActive)
  + ### SetMaxPlayerCount

    public static void SetMaxPlayerCount(int playersMax)
  + ### SetServerName

    public static void SetServerName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### SetMapName

    public static void SetMapName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName)
  + ### SetKeyValue

    public static void SetKeyValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### SetGameTags

    public static void SetGameTags([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameTags)
  + ### SetRegion

    public static void SetRegion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") region)
  + ### BUpdateUserData

    public static boolean BUpdateUserData(long steamID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") playerName,
    int score)
  + ### GetSteamServersConnectState

    public static int GetSteamServersConnectState()
  + ### GetSteamID

    public static long GetSteamID()
  + ### AddPlayer

    private static void AddPlayer(short playerID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") playerName,
    int score)
  + ### RemovePlayer

    private static void RemovePlayer(short playerID)
  + ### UpdatePlayer

    private static void UpdatePlayer(short playerID,
    int score)
  + ### AddPlayer

    public static void AddPlayer([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### RemovePlayer

    public static void RemovePlayer([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### UpdatePlayer

    public static void UpdatePlayer([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)