[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [NetworkUser](NetworkUser.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [inWhitelist](#inWhitelist)
   2. [ipBanned](#ipBanned)
   3. [steamIdBanned](#steamIdBanned)
   4. [world](#world)
   5. [username](#username)
   6. [lastConnection](#lastConnection)
   7. [role](#role)
   8. [authType](#authType)
   9. [steamid](#steamid)
   10. [displayName](#displayName)
   11. [online](#online)
   12. [connectionType](#connectionType)
   13. [warningPoints](#warningPoints)
   14. [suspicionPoints](#suspicionPoints)
   15. [kicks](#kicks)
   16. [ping](#ping)
7. [Constructor Details](#constructor-detail)
   1. [NetworkUser()](#%3Cinit%3E())
   2. [NetworkUser(String, String, String, Role, int, String, String, boolean)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.characters.Role,int,java.lang.String,java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getFirstBannedIPForUser(String)](#getFirstBannedIPForUser(java.lang.String))
   2. [isSteamIdBanned(String)](#isSteamIdBanned(java.lang.String))
   3. [getSteamIdBanned()](#getSteamIdBanned())
   4. [getIpBanned()](#getIpBanned())
   5. [getWorld()](#getWorld())
   6. [getUsername()](#getUsername())
   7. [getLastConnection()](#getLastConnection())
   8. [getRole()](#getRole())
   9. [getAuthType()](#getAuthType())
   10. [getAuthTypeName()](#getAuthTypeName())
   11. [getSteamid()](#getSteamid())
   12. [getDisplayName()](#getDisplayName())
   13. [isOnline()](#isOnline())
   14. [getConnectionType()](#getConnectionType())
   15. [setConnectionType(UdpConnection.ConnectionType)](#setConnectionType(zombie.core.raknet.UdpConnection.ConnectionType))
   16. [isConnectedDirectly()](#isConnectedDirectly())
   17. [setWarningPoints(int)](#setWarningPoints(int))
   18. [getWarningPoints()](#getWarningPoints())
   19. [setSuspicionPoints(int)](#setSuspicionPoints(int))
   20. [getSuspicionPoints()](#getSuspicionPoints())
   21. [setKicks(int)](#setKicks(int))
   22. [getKicks()](#getKicks())
   23. [setInWhitelist(boolean)](#setInWhitelist(boolean))
   24. [isInWhitelist()](#isInWhitelist())
   25. [setPing(short)](#setPing(short))
   26. [getPing()](#getPing())
   27. [send(ByteBufferWriter)](#send(zombie.core.network.ByteBufferWriter))
   28. [parse(ByteBufferReader)](#parse(zombie.core.network.ByteBufferReader))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class NetworkUser
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.NetworkUser

---

public class NetworkUser
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `NetworkUser.AuthType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `NetworkUser.AuthType`

  `authType`

  `private zombie.core.raknet.UdpConnection.ConnectionType`

  `connectionType`

  `String`

  `displayName`

  `boolean`

  `inWhitelist`

  `String`

  `ipBanned`

  `int`

  `kicks`

  `String`

  `lastConnection`

  `boolean`

  `online`

  `short`

  `ping`

  `Role`

  `role`

  `String`

  `steamid`

  `String`

  `steamIdBanned`

  `int`

  `suspicionPoints`

  `String`

  `username`

  `int`

  `warningPoints`

  `String`

  `world`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetworkUser()`

  `NetworkUser(String world,
  String username,
  String lastConnection,
  Role role,
  int authType,
  String steamid,
  String displayName,
  boolean online)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `NetworkUser.AuthType`

  `getAuthType()`

  `String`

  `getAuthTypeName()`

  `zombie.core.raknet.UdpConnection.ConnectionType`

  `getConnectionType()`

  `String`

  `getDisplayName()`

  `String`

  `getFirstBannedIPForUser(String username)`

  `String`

  `getIpBanned()`

  `int`

  `getKicks()`

  `String`

  `getLastConnection()`

  `short`

  `getPing()`

  `Role`

  `getRole()`

  `String`

  `getSteamid()`

  `String`

  `getSteamIdBanned()`

  `int`

  `getSuspicionPoints()`

  `String`

  `getUsername()`

  `int`

  `getWarningPoints()`

  `String`

  `getWorld()`

  `boolean`

  `isConnectedDirectly()`

  `boolean`

  `isInWhitelist()`

  `boolean`

  `isOnline()`

  `String`

  `isSteamIdBanned(String steamId)`

  `void`

  `parse(zombie.core.network.ByteBufferReader input)`

  `void`

  `send(zombie.core.network.ByteBufferWriter output)`

  `void`

  `setConnectionType(zombie.core.raknet.UdpConnection.ConnectionType connectionType)`

  `void`

  `setInWhitelist(boolean inWhitelist)`

  `void`

  `setKicks(int kicks)`

  `void`

  `setPing(short ping)`

  `void`

  `setSuspicionPoints(int suspicionPoints)`

  `void`

  `setWarningPoints(int warningPoints)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### inWhitelist

    public boolean inWhitelist
  + ### ipBanned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ipBanned
  + ### steamIdBanned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamIdBanned
  + ### world

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world
  + ### username

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username
  + ### lastConnection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastConnection
  + ### role

    public [Role](Role.html "class in zombie.characters") role
  + ### authType

    public [NetworkUser.AuthType](NetworkUser.AuthType.html "enum class in zombie.characters") authType
  + ### steamid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamid
  + ### displayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### online

    public boolean online
  + ### connectionType

    private zombie.core.raknet.UdpConnection.ConnectionType connectionType
  + ### warningPoints

    public int warningPoints
  + ### suspicionPoints

    public int suspicionPoints
  + ### kicks

    public int kicks
  + ### ping

    public short ping
* Constructor Details
  -------------------

  + ### NetworkUser

    public NetworkUser()
  + ### NetworkUser

    public NetworkUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") world,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastConnection,
    [Role](Role.html "class in zombie.characters") role,
    int authType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName,
    boolean online)
* Method Details
  --------------

  + ### getFirstBannedIPForUser

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFirstBannedIPForUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isSteamIdBanned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") isSteamIdBanned([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamId)
  + ### getSteamIdBanned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamIdBanned()
  + ### getIpBanned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIpBanned()
  + ### getWorld

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorld()
  + ### getUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUsername()
  + ### getLastConnection

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastConnection()
  + ### getRole

    public [Role](Role.html "class in zombie.characters") getRole()
  + ### getAuthType

    public [NetworkUser.AuthType](NetworkUser.AuthType.html "enum class in zombie.characters") getAuthType()
  + ### getAuthTypeName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthTypeName()
  + ### getSteamid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamid()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### isOnline

    public boolean isOnline()
  + ### getConnectionType

    public zombie.core.raknet.UdpConnection.ConnectionType getConnectionType()
  + ### setConnectionType

    public void setConnectionType(zombie.core.raknet.UdpConnection.ConnectionType connectionType)
  + ### isConnectedDirectly

    public boolean isConnectedDirectly()
  + ### setWarningPoints

    public void setWarningPoints(int warningPoints)
  + ### getWarningPoints

    public int getWarningPoints()
  + ### setSuspicionPoints

    public void setSuspicionPoints(int suspicionPoints)
  + ### getSuspicionPoints

    public int getSuspicionPoints()
  + ### setKicks

    public void setKicks(int kicks)
  + ### getKicks

    public int getKicks()
  + ### setInWhitelist

    public void setInWhitelist(boolean inWhitelist)
  + ### isInWhitelist

    public boolean isInWhitelist()
  + ### setPing

    public void setPing(short ping)
  + ### getPing

    public short getPing()
  + ### send

    public void send(zombie.core.network.ByteBufferWriter output)
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader input)