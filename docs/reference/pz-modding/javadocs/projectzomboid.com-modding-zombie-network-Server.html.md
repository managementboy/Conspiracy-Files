[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [Server](Server.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [name](#name)
   3. [ip](#ip)
   4. [host](#host)
   5. [localIp](#localIp)
   6. [port](#port)
   7. [serverpwd](#serverpwd)
   8. [description](#description)
   9. [lastUpdate](#lastUpdate)
   10. [players](#players)
   11. [maxPlayers](#maxPlayers)
   12. [open](#open)
   13. [isPublic](#isPublic)
   14. [version](#version)
   15. [mods](#mods)
   16. [passwordProtected](#passwordProtected)
   17. [steamId](#steamId)
   18. [ping](#ping)
   19. [hosted](#hosted)
   20. [needSave](#needSave)
   21. [mapName](#mapName)
   22. [lastOnline](#lastOnline)
   23. [lastDataUpdate](#lastDataUpdate)
   24. [accounts](#accounts)
   25. [serverIcon](#serverIcon)
   26. [serverLoginScreen](#serverLoginScreen)
   27. [serverLoadingScreen](#serverLoadingScreen)
   28. [serverCustomizationLastUpdate](#serverCustomizationLastUpdate)
   29. [isFeatured](#isFeatured)
   30. [isResponded](#isResponded)
6. [Constructor Details](#constructor-detail)
   1. [Server()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [setID(int)](#setID(int))
   3. [getNeedSave()](#getNeedSave())
   4. [setNeedSave(boolean)](#setNeedSave(boolean))
   5. [getPort()](#getPort())
   6. [setPort(int)](#setPort(int))
   7. [getIp2()](#getIp2())
   8. [getIp()](#getIp())
   9. [setIp(String)](#setIp(java.lang.String))
   10. [getDisplayAddress()](#getDisplayAddress())
   11. [getDisplayIp()](#getDisplayIp())
   12. [getDisplayPort()](#getDisplayPort())
   13. [isShowAddressInfoAllowed()](#isShowAddressInfoAllowed())
   14. [getLocalIP()](#getLocalIP())
   15. [setLocalIP(String)](#setLocalIP(java.lang.String))
   16. [getServerPassword()](#getServerPassword())
   17. [setServerPassword(String)](#setServerPassword(java.lang.String))
   18. [getDescription()](#getDescription())
   19. [setDescription(String)](#setDescription(java.lang.String))
   20. [getLastOnline()](#getLastOnline())
   21. [setLastOnline(LocalDateTime)](#setLastOnline(java.time.LocalDateTime))
   22. [setLastOnlineNow()](#setLastOnlineNow())
   23. [getLastDataUpdate()](#getLastDataUpdate())
   24. [setLastDataUpdate(LocalDateTime)](#setLastDataUpdate(java.time.LocalDateTime))
   25. [setLastDataUpdateNow()](#setLastDataUpdateNow())
   26. [getAccounts()](#getAccounts())
   27. [addAccount(Account)](#addAccount(zombie.network.Account))
   28. [addAccount(String, String, boolean, boolean, int)](#addAccount(java.lang.String,java.lang.String,boolean,boolean,int))
   29. [removeAccount(Account)](#removeAccount(zombie.network.Account))
   30. [getUserName()](#getUserName())
   31. [setUserName(String)](#setUserName(java.lang.String))
   32. [getPwd()](#getPwd())
   33. [setPwd(String)](#setPwd(java.lang.String))
   34. [setPwd(String, boolean)](#setPwd(java.lang.String,boolean))
   35. [getUseSteamRelay()](#getUseSteamRelay())
   36. [setUseSteamRelay(boolean)](#setUseSteamRelay(boolean))
   37. [getLastUpdate()](#getLastUpdate())
   38. [setLastUpdate(int)](#setLastUpdate(int))
   39. [getPlayers()](#getPlayers())
   40. [setPlayers(String)](#setPlayers(java.lang.String))
   41. [isOpen()](#isOpen())
   42. [setOpen(boolean)](#setOpen(boolean))
   43. [isPublic()](#isPublic())
   44. [setPublic(boolean)](#setPublic(boolean))
   45. [getVersion()](#getVersion())
   46. [setVersion(String)](#setVersion(java.lang.String))
   47. [getMaxPlayers()](#getMaxPlayers())
   48. [setMaxPlayers(String)](#setMaxPlayers(java.lang.String))
   49. [getMods()](#getMods())
   50. [setMods(String)](#setMods(java.lang.String))
   51. [getName()](#getName())
   52. [setName(String)](#setName(java.lang.String))
   53. [getPing()](#getPing())
   54. [setPing(String)](#setPing(java.lang.String))
   55. [isPasswordProtected()](#isPasswordProtected())
   56. [setPasswordProtected(boolean)](#setPasswordProtected(boolean))
   57. [getSteamId()](#getSteamId())
   58. [setSteamId(String)](#setSteamId(java.lang.String))
   59. [isHosted()](#isHosted())
   60. [setHosted(boolean)](#setHosted(boolean))
   61. [isSavePwd()](#isSavePwd())
   62. [setSavePwd(boolean)](#setSavePwd(boolean))
   63. [getAuthType()](#getAuthType())
   64. [setAuthType(int)](#setAuthType(int))
   65. [setServerIcon(Texture)](#setServerIcon(zombie.core.textures.Texture))
   66. [setServerLoadingScreen(Texture)](#setServerLoadingScreen(zombie.core.textures.Texture))
   67. [setServerLoginScreen(Texture)](#setServerLoginScreen(zombie.core.textures.Texture))
   68. [getMapName()](#getMapName())
   69. [setMapName(String)](#setMapName(java.lang.String))
   70. [getServerIcon()](#getServerIcon())
   71. [getServerLoadingScreen()](#getServerLoadingScreen())
   72. [getServerLoginScreen()](#getServerLoginScreen())
   73. [getServerCustomizationLastUpdate()](#getServerCustomizationLastUpdate())
   74. [getTimeFromServerCustomizationLastUpdate()](#getTimeFromServerCustomizationLastUpdate())
   75. [setServerCustomizationLastUpdate(int)](#setServerCustomizationLastUpdate(int))
   76. [updateServerCustomizationLastUpdate()](#updateServerCustomizationLastUpdate())
   77. [isFeatured()](#isFeatured())
   78. [setFeatured(boolean)](#setFeatured(boolean))
   79. [isResponded()](#isResponded())
   80. [setResponded(boolean)](#setResponded(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Server
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.Server

---

public class Server
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<Account>`

  `accounts`

  `private String`

  `description`

  `private String`

  `host`

  `private boolean`

  `hosted`

  `private int`

  `id`

  `private String`

  `ip`

  `private boolean`

  `isFeatured`

  `private boolean`

  `isPublic`

  `private boolean`

  `isResponded`

  `private LocalDateTime`

  `lastDataUpdate`

  `private LocalDateTime`

  `lastOnline`

  `private int`

  `lastUpdate`

  `private String`

  `localIp`

  `private String`

  `mapName`

  `private String`

  `maxPlayers`

  `private String`

  `mods`

  `private String`

  `name`

  `private boolean`

  `needSave`

  `private boolean`

  `open`

  `private boolean`

  `passwordProtected`

  `private String`

  `ping`

  `private String`

  `players`

  `private int`

  `port`

  `private int`

  `serverCustomizationLastUpdate`

  `private Texture`

  `serverIcon`

  `private Texture`

  `serverLoadingScreen`

  `private Texture`

  `serverLoginScreen`

  `private String`

  `serverpwd`

  `private String`

  `steamId`

  `private String`

  `version`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Server()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAccount(String username,
  String password,
  boolean savePwd,
  boolean userSteamRelay,
  int authType)`

  `void`

  `addAccount(Account account)`

  `ArrayList<Account>`

  `getAccounts()`

  `int`

  `getAuthType()`

  Deprecated.

  `String`

  `getDescription()`

  `String`

  `getDisplayAddress()`

  `String`

  `getDisplayIp()`

  `String`

  `getDisplayPort()`

  `int`

  `getID()`

  `String`

  `getIp()`

  `String`

  `getIp2()`

  `LocalDateTime`

  `getLastDataUpdate()`

  `LocalDateTime`

  `getLastOnline()`

  `int`

  `getLastUpdate()`

  `String`

  `getLocalIP()`

  `String`

  `getMapName()`

  `String`

  `getMaxPlayers()`

  `String`

  `getMods()`

  `String`

  `getName()`

  `boolean`

  `getNeedSave()`

  `String`

  `getPing()`

  `String`

  `getPlayers()`

  `int`

  `getPort()`

  `String`

  `getPwd()`

  Deprecated.

  `int`

  `getServerCustomizationLastUpdate()`

  `Texture`

  `getServerIcon()`

  `Texture`

  `getServerLoadingScreen()`

  `Texture`

  `getServerLoginScreen()`

  `String`

  `getServerPassword()`

  `String`

  `getSteamId()`

  `int`

  `getTimeFromServerCustomizationLastUpdate()`

  `String`

  `getUserName()`

  Deprecated.

  `boolean`

  `getUseSteamRelay()`

  Deprecated.

  `String`

  `getVersion()`

  `boolean`

  `isFeatured()`

  `boolean`

  `isHosted()`

  `boolean`

  `isOpen()`

  `boolean`

  `isPasswordProtected()`

  `boolean`

  `isPublic()`

  `boolean`

  `isResponded()`

  `boolean`

  `isSavePwd()`

  Deprecated.

  `private boolean`

  `isShowAddressInfoAllowed()`

  `void`

  `removeAccount(Account account)`

  `void`

  `setAuthType(int authType)`

  Deprecated.

  `void`

  `setDescription(String description)`

  `void`

  `setFeatured(boolean featured)`

  `void`

  `setHosted(boolean hosted)`

  `void`

  `setID(int id)`

  `void`

  `setIp(String ip)`

  `void`

  `setLastDataUpdate(LocalDateTime lastDataUpdate)`

  `void`

  `setLastDataUpdateNow()`

  `void`

  `setLastOnline(LocalDateTime lastOnline)`

  `void`

  `setLastOnlineNow()`

  `void`

  `setLastUpdate(int lastUpdate)`

  `void`

  `setLocalIP(String ip)`

  `void`

  `setMapName(String mapName)`

  `void`

  `setMaxPlayers(String maxPlayers)`

  `void`

  `setMods(String mods)`

  `void`

  `setName(String name)`

  `void`

  `setNeedSave(boolean needSave)`

  `void`

  `setOpen(boolean open)`

  `void`

  `setPasswordProtected(boolean pp)`

  `void`

  `setPing(String ping)`

  `void`

  `setPlayers(String players)`

  `void`

  `setPort(int port)`

  `void`

  `setPublic(boolean bPublic)`

  `void`

  `setPwd(String pwd)`

  Deprecated.

  `void`

  `setPwd(String pwd,
  boolean hashed)`

  `void`

  `setResponded(boolean responded)`

  `void`

  `setSavePwd(boolean savePwd)`

  Deprecated.

  `void`

  `setServerCustomizationLastUpdate(int serverCustomizationLastUpdate)`

  `void`

  `setServerIcon(Texture serverIcon)`

  `void`

  `setServerLoadingScreen(Texture serverLoadingScreen)`

  `void`

  `setServerLoginScreen(Texture serverLoginScreen)`

  `void`

  `setServerPassword(String pwd)`

  `void`

  `setSteamId(String steamId)`

  `void`

  `setUserName(String userName)`

  Deprecated.

  `void`

  `setUseSteamRelay(boolean useSteamRelay)`

  Deprecated.

  `void`

  `setVersion(String version)`

  `void`

  `updateServerCustomizationLastUpdate()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### ip

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip
  + ### host

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") host
  + ### localIp

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") localIp
  + ### port

    private int port
  + ### serverpwd

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverpwd
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### lastUpdate

    private int lastUpdate
  + ### players

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") players
  + ### maxPlayers

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maxPlayers
  + ### open

    private boolean open
  + ### isPublic

    private boolean isPublic
  + ### version

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") version
  + ### mods

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mods
  + ### passwordProtected

    private boolean passwordProtected
  + ### steamId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamId
  + ### ping

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ping
  + ### hosted

    private boolean hosted
  + ### needSave

    private boolean needSave
  + ### mapName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName
  + ### lastOnline

    private [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastOnline
  + ### lastDataUpdate

    private [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastDataUpdate
  + ### accounts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Account](Account.html "class in zombie.network")> accounts
  + ### serverIcon

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") serverIcon
  + ### serverLoginScreen

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") serverLoginScreen
  + ### serverLoadingScreen

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") serverLoadingScreen
  + ### serverCustomizationLastUpdate

    private int serverCustomizationLastUpdate
  + ### isFeatured

    private boolean isFeatured
  + ### isResponded

    private boolean isResponded
* Constructor Details
  -------------------

  + ### Server

    public Server()
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### setID

    public void setID(int id)
  + ### getNeedSave

    public boolean getNeedSave()
  + ### setNeedSave

    public void setNeedSave(boolean needSave)
  + ### getPort

    public int getPort()
  + ### setPort

    public void setPort(int port)
  + ### getIp2

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIp2()
  + ### getIp

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIp()
  + ### setIp

    public void setIp([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip)
  + ### getDisplayAddress

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayAddress()
  + ### getDisplayIp

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayIp()
  + ### getDisplayPort

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayPort()
  + ### isShowAddressInfoAllowed

    private boolean isShowAddressInfoAllowed()
  + ### getLocalIP

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocalIP()
  + ### setLocalIP

    public void setLocalIP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ip)
  + ### getServerPassword

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getServerPassword()
  + ### setServerPassword

    public void setServerPassword([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### getLastOnline

    public [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") getLastOnline()
  + ### setLastOnline

    public void setLastOnline([LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastOnline)
  + ### setLastOnlineNow

    public void setLastOnlineNow()
  + ### getLastDataUpdate

    public [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") getLastDataUpdate()
  + ### setLastDataUpdate

    public void setLastDataUpdate([LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastDataUpdate)
  + ### setLastDataUpdateNow

    public void setLastDataUpdateNow()
  + ### getAccounts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Account](Account.html "class in zombie.network")> getAccounts()
  + ### addAccount

    public void addAccount([Account](Account.html "class in zombie.network") account)
  + ### addAccount

    public void addAccount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password,
    boolean savePwd,
    boolean userSteamRelay,
    int authType)
  + ### removeAccount

    public void removeAccount([Account](Account.html "class in zombie.network") account)
  + ### getUserName

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUserName()

    Deprecated.
  + ### setUserName

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setUserName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") userName)

    Deprecated.
  + ### getPwd

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPwd()

    Deprecated.
  + ### setPwd

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setPwd([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd)

    Deprecated.
  + ### setPwd

    public void setPwd([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd,
    boolean hashed)
  + ### getUseSteamRelay

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean getUseSteamRelay()

    Deprecated.
  + ### setUseSteamRelay

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setUseSteamRelay(boolean useSteamRelay)

    Deprecated.
  + ### getLastUpdate

    public int getLastUpdate()
  + ### setLastUpdate

    public void setLastUpdate(int lastUpdate)
  + ### getPlayers

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlayers()
  + ### setPlayers

    public void setPlayers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") players)
  + ### isOpen

    public boolean isOpen()
  + ### setOpen

    public void setOpen(boolean open)
  + ### isPublic

    public boolean isPublic()
  + ### setPublic

    public void setPublic(boolean bPublic)
  + ### getVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVersion()
  + ### setVersion

    public void setVersion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") version)
  + ### getMaxPlayers

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMaxPlayers()
  + ### setMaxPlayers

    public void setMaxPlayers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maxPlayers)
  + ### getMods

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMods()
  + ### setMods

    public void setMods([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mods)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPing

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPing()
  + ### setPing

    public void setPing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ping)
  + ### isPasswordProtected

    public boolean isPasswordProtected()
  + ### setPasswordProtected

    public void setPasswordProtected(boolean pp)
  + ### getSteamId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamId()
  + ### setSteamId

    public void setSteamId([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamId)
  + ### isHosted

    public boolean isHosted()
  + ### setHosted

    public void setHosted(boolean hosted)
  + ### isSavePwd

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isSavePwd()

    Deprecated.
  + ### setSavePwd

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setSavePwd(boolean savePwd)

    Deprecated.
  + ### getAuthType

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getAuthType()

    Deprecated.
  + ### setAuthType

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setAuthType(int authType)

    Deprecated.
  + ### setServerIcon

    public void setServerIcon([Texture](../core/textures/Texture.html "class in zombie.core.textures") serverIcon)
  + ### setServerLoadingScreen

    public void setServerLoadingScreen([Texture](../core/textures/Texture.html "class in zombie.core.textures") serverLoadingScreen)
  + ### setServerLoginScreen

    public void setServerLoginScreen([Texture](../core/textures/Texture.html "class in zombie.core.textures") serverLoginScreen)
  + ### getMapName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMapName()
  + ### setMapName

    public void setMapName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName)
  + ### getServerIcon

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getServerIcon()
  + ### getServerLoadingScreen

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getServerLoadingScreen()
  + ### getServerLoginScreen

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getServerLoginScreen()
  + ### getServerCustomizationLastUpdate

    public int getServerCustomizationLastUpdate()
  + ### getTimeFromServerCustomizationLastUpdate

    public int getTimeFromServerCustomizationLastUpdate()
  + ### setServerCustomizationLastUpdate

    public void setServerCustomizationLastUpdate(int serverCustomizationLastUpdate)
  + ### updateServerCustomizationLastUpdate

    public void updateServerCustomizationLastUpdate()
  + ### isFeatured

    public boolean isFeatured()
  + ### setFeatured

    public void setFeatured(boolean featured)
  + ### isResponded

    public boolean isResponded()
  + ### setResponded

    public void setResponded(boolean responded)