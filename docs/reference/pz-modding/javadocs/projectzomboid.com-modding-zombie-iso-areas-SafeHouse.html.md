[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [SafeHouse](SafeHouse.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [HOUR\_IN\_MILLISECONDS](#HOUR_IN_MILLISECONDS)
   2. [updateLimit](#updateLimit)
   3. [x](#x)
   4. [y](#y)
   5. [w](#w)
   6. [h](#h)
   7. [diffError](#diffError)
   8. [owner](#owner)
   9. [lastVisited](#lastVisited)
   10. [datetimeCreated](#datetimeCreated)
   11. [location](#location)
   12. [title](#title)
   13. [playerConnected](#playerConnected)
   14. [openTimer](#openTimer)
   15. [hitPoints](#hitPoints)
   16. [id](#id)
   17. [players](#players)
   18. [playersRespawn](#playersRespawn)
   19. [safehouseList](#safehouseList)
   20. [onlineId](#onlineId)
6. [Constructor Details](#constructor-detail)
   1. [SafeHouse(int, int, int, int, String)](#%3Cinit%3E(int,int,int,int,java.lang.String))
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [addSafeHouse(int, int, int, int, String)](#addSafeHouse(int,int,int,int,java.lang.String))
   3. [addSafeHouse(IsoGridSquare, IsoPlayer)](#addSafeHouse(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   4. [hasSafehouse(String)](#hasSafehouse(java.lang.String))
   5. [getSafehouseByOwner(String)](#getSafehouseByOwner(java.lang.String))
   6. [hasSafehouse(IsoPlayer)](#hasSafehouse(zombie.characters.IsoPlayer))
   7. [updateSafehousePlayersConnected()](#updateSafehousePlayersConnected())
   8. [updatePlayersConnected()](#updatePlayersConnected())
   9. [findSafeHouse(IsoGridSquare)](#findSafeHouse(zombie.iso.IsoGridSquare))
   10. [getSafeHouse(IsoGridSquare)](#getSafeHouse(zombie.iso.IsoGridSquare))
   11. [getSafeHouse(String)](#getSafeHouse(java.lang.String))
   12. [getSafeHouse(int, int, int, int)](#getSafeHouse(int,int,int,int))
   13. [getSafehouseOverlapping(int, int, int, int)](#getSafehouseOverlapping(int,int,int,int))
   14. [getSafehouseOverlapping(int, int, int, int, SafeHouse)](#getSafehouseOverlapping(int,int,int,int,zombie.iso.areas.SafeHouse))
   15. [isSafeHouse(IsoGridSquare, String, boolean)](#isSafeHouse(zombie.iso.IsoGridSquare,java.lang.String,boolean))
   16. [isSafehouseAllowTrepass(IsoGridSquare, IsoPlayer)](#isSafehouseAllowTrepass(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   17. [isSafehouseAllowInteract(IsoGridSquare, IsoPlayer)](#isSafehouseAllowInteract(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   18. [isSafehouseAllowLoot(IsoGridSquare, IsoPlayer)](#isSafehouseAllowLoot(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   19. [isSafehouseAllowClaimWar(SafeHouse, IsoPlayer)](#isSafehouseAllowClaimWar(zombie.iso.areas.SafeHouse,zombie.characters.IsoPlayer))
   20. [clearSafehouseList()](#clearSafehouseList())
   21. [playerAllowed(IsoPlayer)](#playerAllowed(zombie.characters.IsoPlayer))
   22. [playerAllowed(String)](#playerAllowed(java.lang.String))
   23. [addPlayer(String)](#addPlayer(java.lang.String))
   24. [removePlayer(String)](#removePlayer(java.lang.String))
   25. [removeSafeHouse(SafeHouse)](#removeSafeHouse(zombie.iso.areas.SafeHouse))
   26. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   27. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   28. [canBeSafehouse(IsoGridSquare, IsoPlayer)](#canBeSafehouse(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   29. [checkTrespass(IsoPlayer)](#checkTrespass(zombie.characters.IsoPlayer))
   30. [alreadyHaveSafehouse(String)](#alreadyHaveSafehouse(java.lang.String))
   31. [alreadyHaveSafehouse(IsoPlayer)](#alreadyHaveSafehouse(zombie.characters.IsoPlayer))
   32. [allowSafeHouse(IsoPlayer)](#allowSafeHouse(zombie.characters.IsoPlayer))
   33. [getOnlineID(int, int)](#getOnlineID(int,int))
   34. [getId()](#getId())
   35. [getX()](#getX())
   36. [setX(int)](#setX(int))
   37. [getY()](#getY())
   38. [setY(int)](#setY(int))
   39. [getW()](#getW())
   40. [setW(int)](#setW(int))
   41. [getH()](#getH())
   42. [setH(int)](#setH(int))
   43. [getX2()](#getX2())
   44. [getY2()](#getY2())
   45. [containsLocation(float, float)](#containsLocation(float,float))
   46. [getPlayers()](#getPlayers())
   47. [setPlayers(ArrayList)](#setPlayers(java.util.ArrayList))
   48. [getPlayersRespawn()](#getPlayersRespawn())
   49. [getSafehouseList()](#getSafehouseList())
   50. [getOwner()](#getOwner())
   51. [setOwner(String)](#setOwner(java.lang.String))
   52. [isOwner(IsoPlayer)](#isOwner(zombie.characters.IsoPlayer))
   53. [isOwner(String)](#isOwner(java.lang.String))
   54. [getLastVisited()](#getLastVisited())
   55. [setLastVisited(long)](#setLastVisited(long))
   56. [getDatetimeCreated()](#getDatetimeCreated())
   57. [getDatetimeCreatedStr()](#getDatetimeCreatedStr())
   58. [setDatetimeCreated(long)](#setDatetimeCreated(long))
   59. [getLocation()](#getLocation())
   60. [setLocation(String)](#setLocation(java.lang.String))
   61. [getTitle()](#getTitle())
   62. [setTitle(String)](#setTitle(java.lang.String))
   63. [getPlayerConnected()](#getPlayerConnected())
   64. [setPlayerConnected(int)](#setPlayerConnected(int))
   65. [getOpenTimer()](#getOpenTimer())
   66. [setOpenTimer(int)](#setOpenTimer(int))
   67. [getHitPoints()](#getHitPoints())
   68. [setHitPoints(int)](#setHitPoints(int))
   69. [setRespawnInSafehouse(boolean, String)](#setRespawnInSafehouse(boolean,java.lang.String))
   70. [isRespawnInSafehouse(String)](#isRespawnInSafehouse(java.lang.String))
   71. [isPlayerAllowedOnSquare(IsoPlayer, IsoGridSquare)](#isPlayerAllowedOnSquare(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   72. [getOnlineID()](#getOnlineID())
   73. [setOnlineID(int)](#setOnlineID(int))
   74. [getSafeHouse(int)](#getSafeHouse(int))
   75. [isInSameSafehouse(String, String)](#isInSameSafehouse(java.lang.String,java.lang.String))
   76. [intersects(int, int, int, int)](#intersects(int,int,int,int))
   77. [hitPoint(int)](#hitPoint(int))
   78. [kickUserFromSafehouse(SafeHouse, String)](#kickUserFromSafehouse(zombie.iso.areas.SafeHouse,java.lang.String))
   79. [hasNotSurvivedEnoughToClaim(IsoPlayer)](#hasNotSurvivedEnoughToClaim(zombie.characters.IsoPlayer))
   80. [isSafeHouseExpired(SafeHouse, long, long)](#isSafeHouseExpired(zombie.iso.areas.SafeHouse,long,long))
   81. [update()](#update())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SafeHouse
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Invite

zombie.iso.areas.SafeHouse

---

public class SafeHouse
extends zombie.characters.Invite

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private long`

  `datetimeCreated`

  `private static final int`

  `diffError`

  `private int`

  `h`

  `private int`

  `hitPoints`

  `private static final long`

  `HOUR_IN_MILLISECONDS`

  `private final String`

  `id`

  `private long`

  `lastVisited`

  `private String`

  `location`

  `private int`

  `onlineId`

  `private int`

  `openTimer`

  `private String`

  `owner`

  `private int`

  `playerConnected`

  `private ArrayList<String>`

  `players`

  `private final ArrayList<String>`

  `playersRespawn`

  `private static final ArrayList<SafeHouse>`

  `safehouseList`

  `private String`

  `title`

  `private static final zombie.core.utils.UpdateLimit`

  `updateLimit`

  `private int`

  `w`

  `private int`

  `x`

  `private int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SafeHouse(int x,
  int y,
  int w,
  int h,
  String player)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPlayer(String player)`

  `static SafeHouse`

  `addSafeHouse(int x,
  int y,
  int w,
  int h,
  String player)`

  `static SafeHouse`

  `addSafeHouse(IsoGridSquare square,
  IsoPlayer player)`

  `static boolean`

  `allowSafeHouse(IsoPlayer player)`

  `SafeHouse`

  `alreadyHaveSafehouse(String username)`

  `SafeHouse`

  `alreadyHaveSafehouse(IsoPlayer player)`

  `static String`

  `canBeSafehouse(IsoGridSquare clickedSquare,
  IsoPlayer player)`

  `void`

  `checkTrespass(IsoPlayer player)`

  `static void`

  `clearSafehouseList()`

  `boolean`

  `containsLocation(float x,
  float y)`

  `private static SafeHouse`

  `findSafeHouse(IsoGridSquare square)`

  `long`

  `getDatetimeCreated()`

  `String`

  `getDatetimeCreatedStr()`

  `int`

  `getH()`

  `int`

  `getHitPoints()`

  `String`

  `getId()`

  `long`

  `getLastVisited()`

  `String`

  `getLocation()`

  `int`

  `getOnlineID()`

  `static int`

  `getOnlineID(int x,
  int y)`

  `int`

  `getOpenTimer()`

  `String`

  `getOwner()`

  `int`

  `getPlayerConnected()`

  `ArrayList<String>`

  `getPlayers()`

  `ArrayList<String>`

  `getPlayersRespawn()`

  `static SafeHouse`

  `getSafeHouse(int onlineID)`

  `static SafeHouse`

  `getSafeHouse(int x,
  int y,
  int w,
  int h)`

  `static SafeHouse`

  `getSafeHouse(String title)`

  `static SafeHouse`

  `getSafeHouse(IsoGridSquare square)`

  `static SafeHouse`

  `getSafehouseByOwner(String username)`

  `static ArrayList<SafeHouse>`

  `getSafehouseList()`

  `static SafeHouse`

  `getSafehouseOverlapping(int x1,
  int y1,
  int x2,
  int y2)`

  `static SafeHouse`

  `getSafehouseOverlapping(int x1,
  int y1,
  int x2,
  int y2,
  SafeHouse ignore)`

  `String`

  `getTitle()`

  `int`

  `getW()`

  `int`

  `getX()`

  `int`

  `getX2()`

  `int`

  `getY()`

  `int`

  `getY2()`

  `static boolean`

  `hasNotSurvivedEnoughToClaim(IsoPlayer player)`

  `static SafeHouse`

  `hasSafehouse(String username)`

  `static SafeHouse`

  `hasSafehouse(IsoPlayer player)`

  `static void`

  `hitPoint(int onlineID)`

  `static void`

  `init()`

  `static boolean`

  `intersects(int startX,
  int startY,
  int endX,
  int endY)`

  `static boolean`

  `isInSameSafehouse(String player1,
  String player2)`

  `boolean`

  `isOwner(String username)`

  `boolean`

  `isOwner(IsoPlayer player)`

  `static boolean`

  `isPlayerAllowedOnSquare(IsoPlayer player,
  IsoGridSquare sq)`

  `boolean`

  `isRespawnInSafehouse(String username)`

  `static SafeHouse`

  `isSafeHouse(IsoGridSquare square,
  String username,
  boolean doDisableSafehouse)`

  Return if the square is a safehouse non allowed for the player You need to be
  on a safehouse AND not be allowed to return the safe If you're allowed,
  you'll have null in return If username is null, you basically just return if
  there's a safehouse here

  `static boolean`

  `isSafehouseAllowClaimWar(SafeHouse safehouse,
  IsoPlayer player)`

  Checks if player can claim war for safehouse.

  `static boolean`

  `isSafehouseAllowInteract(IsoGridSquare square,
  IsoPlayer player)`

  Checks if player can interact with objects in safehouse.

  `static boolean`

  `isSafehouseAllowLoot(IsoGridSquare square,
  IsoPlayer player)`

  Checks if player can loot objects in safehouse.

  `static boolean`

  `isSafehouseAllowTrepass(IsoGridSquare square,
  IsoPlayer player)`

  Checks if player can enter safehouse.

  `private static boolean`

  `isSafeHouseExpired(SafeHouse safeHouse,
  long currentTime,
  long removalTime)`

  `static void`

  `kickUserFromSafehouse(SafeHouse safeHouse,
  String username)`

  `static SafeHouse`

  `load(ByteBuffer bb,
  int worldVersion)`

  `boolean`

  `playerAllowed(String name)`

  `boolean`

  `playerAllowed(IsoPlayer player)`

  `void`

  `removePlayer(String player)`

  `static void`

  `removeSafeHouse(SafeHouse safeHouse)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setDatetimeCreated(long datetimeCreated)`

  `void`

  `setH(int h)`

  `void`

  `setHitPoints(int hitPoints)`

  `void`

  `setLastVisited(long lastVisited)`

  `void`

  `setLocation(String location)`

  `void`

  `setOnlineID(int value)`

  `void`

  `setOpenTimer(int openTimer)`

  `void`

  `setOwner(String owner)`

  `void`

  `setPlayerConnected(int playerConnected)`

  `void`

  `setPlayers(ArrayList<String> players)`

  `void`

  `setRespawnInSafehouse(boolean b,
  String username)`

  `void`

  `setTitle(String title)`

  `void`

  `setW(int w)`

  `void`

  `setX(int x)`

  `void`

  `setY(int y)`

  `static void`

  `update()`

  `void`

  `updatePlayersConnected()`

  `static void`

  `updateSafehousePlayersConnected()`

  ### Methods inherited from class zombie.characters.Invite

  `addInvite, hasInvite, removeInvite`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### HOUR\_IN\_MILLISECONDS

    private static final long HOUR\_IN\_MILLISECONDS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.SafeHouse.HOUR_IN_MILLISECONDS)
  + ### updateLimit

    private static final zombie.core.utils.UpdateLimit updateLimit
  + ### x

    private int x
  + ### y

    private int y
  + ### w

    private int w
  + ### h

    private int h
  + ### diffError

    private static final int diffError

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.SafeHouse.diffError)
  + ### owner

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") owner
  + ### lastVisited

    private long lastVisited
  + ### datetimeCreated

    private long datetimeCreated
  + ### location

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location
  + ### title

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### playerConnected

    private int playerConnected
  + ### openTimer

    private int openTimer
  + ### hitPoints

    private int hitPoints
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### players

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players
  + ### playersRespawn

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> playersRespawn
  + ### safehouseList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SafeHouse](SafeHouse.html "class in zombie.iso.areas")> safehouseList
  + ### onlineId

    private int onlineId
* Constructor Details
  -------------------

  + ### SafeHouse

    public SafeHouse(int x,
    int y,
    int w,
    int h,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
* Method Details
  --------------

  + ### init

    public static void init()
  + ### addSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") addSafeHouse(int x,
    int y,
    int w,
    int h,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
  + ### addSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") addSafeHouse([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### hasSafehouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") hasSafehouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getSafehouseByOwner

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafehouseByOwner([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### hasSafehouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") hasSafehouse([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### updateSafehousePlayersConnected

    public static void updateSafehousePlayersConnected()
  + ### updatePlayersConnected

    public void updatePlayersConnected()
  + ### findSafeHouse

    private static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") findSafeHouse([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### getSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafeHouse([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### getSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafeHouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafeHouse(int x,
    int y,
    int w,
    int h)
  + ### getSafehouseOverlapping

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafehouseOverlapping(int x1,
    int y1,
    int x2,
    int y2)
  + ### getSafehouseOverlapping

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafehouseOverlapping(int x1,
    int y1,
    int x2,
    int y2,
    [SafeHouse](SafeHouse.html "class in zombie.iso.areas") ignore)
  + ### isSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") isSafeHouse([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    boolean doDisableSafehouse)

    Return if the square is a safehouse non allowed for the player You need to be
    on a safehouse AND not be allowed to return the safe If you're allowed,
    you'll have null in return If username is null, you basically just return if
    there's a safehouse here
  + ### isSafehouseAllowTrepass

    public static boolean isSafehouseAllowTrepass([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Checks if player can enter safehouse.

    Parameters:
    :   `square` - IsoGridSquare square of safehouse
    :   `player` - IsoPlayer instance

    Returns:
    :   true if player can enter safehouse otherwise false
  + ### isSafehouseAllowInteract

    public static boolean isSafehouseAllowInteract([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Checks if player can interact with objects in safehouse.

    Parameters:
    :   `square` - IsoGridSquare square of safehouse
    :   `player` - IsoPlayer instance

    Returns:
    :   true if player can interact with objects in safehouse otherwise false
  + ### isSafehouseAllowLoot

    public static boolean isSafehouseAllowLoot([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Checks if player can loot objects in safehouse.

    Parameters:
    :   `square` - IsoGridSquare square of safehouse
    :   `player` - IsoPlayer instance

    Returns:
    :   true if player can loot objects in safehouse otherwise false
  + ### isSafehouseAllowClaimWar

    public static boolean isSafehouseAllowClaimWar([SafeHouse](SafeHouse.html "class in zombie.iso.areas") safehouse,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Checks if player can claim war for safehouse.

    Parameters:
    :   `safehouse` - SafeHouse safehouse
    :   `player` - IsoPlayer instance

    Returns:
    :   true if player can claim war for safehouse otherwise false
  + ### clearSafehouseList

    public static void clearSafehouseList()
  + ### playerAllowed

    public boolean playerAllowed([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### playerAllowed

    public boolean playerAllowed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### addPlayer

    public void addPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
  + ### removePlayer

    public void removePlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
  + ### removeSafeHouse

    public static void removeSafeHouse([SafeHouse](SafeHouse.html "class in zombie.iso.areas") safeHouse)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)
  + ### canBeSafehouse

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") canBeSafehouse([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") clickedSquare,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### checkTrespass

    public void checkTrespass([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### alreadyHaveSafehouse

    public [SafeHouse](SafeHouse.html "class in zombie.iso.areas") alreadyHaveSafehouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### alreadyHaveSafehouse

    public [SafeHouse](SafeHouse.html "class in zombie.iso.areas") alreadyHaveSafehouse([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### allowSafeHouse

    public static boolean allowSafeHouse([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getOnlineID

    public static int getOnlineID(int x,
    int y)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getX

    public int getX()
  + ### setX

    public void setX(int x)
  + ### getY

    public int getY()
  + ### setY

    public void setY(int y)
  + ### getW

    public int getW()
  + ### setW

    public void setW(int w)
  + ### getH

    public int getH()
  + ### setH

    public void setH(int h)
  + ### getX2

    public int getX2()
  + ### getY2

    public int getY2()
  + ### containsLocation

    public boolean containsLocation(float x,
    float y)
  + ### getPlayers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPlayers()
  + ### setPlayers

    public void setPlayers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players)
  + ### getPlayersRespawn

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPlayersRespawn()
  + ### getSafehouseList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SafeHouse](SafeHouse.html "class in zombie.iso.areas")> getSafehouseList()
  + ### getOwner

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOwner()
  + ### setOwner

    public void setOwner([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") owner)
  + ### isOwner

    public boolean isOwner([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isOwner

    public boolean isOwner([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getLastVisited

    public long getLastVisited()
  + ### setLastVisited

    public void setLastVisited(long lastVisited)
  + ### getDatetimeCreated

    public long getDatetimeCreated()
  + ### getDatetimeCreatedStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDatetimeCreatedStr()
  + ### setDatetimeCreated

    public void setDatetimeCreated(long datetimeCreated)
  + ### getLocation

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocation()
  + ### setLocation

    public void setLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### setTitle

    public void setTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getPlayerConnected

    public int getPlayerConnected()
  + ### setPlayerConnected

    public void setPlayerConnected(int playerConnected)
  + ### getOpenTimer

    public int getOpenTimer()
  + ### setOpenTimer

    public void setOpenTimer(int openTimer)
  + ### getHitPoints

    public int getHitPoints()
  + ### setHitPoints

    public void setHitPoints(int hitPoints)
  + ### setRespawnInSafehouse

    public void setRespawnInSafehouse(boolean b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isRespawnInSafehouse

    public boolean isRespawnInSafehouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isPlayerAllowedOnSquare

    public static boolean isPlayerAllowedOnSquare([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### getOnlineID

    public int getOnlineID()
  + ### setOnlineID

    public void setOnlineID(int value)
  + ### getSafeHouse

    public static [SafeHouse](SafeHouse.html "class in zombie.iso.areas") getSafeHouse(int onlineID)
  + ### isInSameSafehouse

    public static boolean isInSameSafehouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player2)
  + ### intersects

    public static boolean intersects(int startX,
    int startY,
    int endX,
    int endY)
  + ### hitPoint

    public static void hitPoint(int onlineID)
  + ### kickUserFromSafehouse

    public static void kickUserFromSafehouse([SafeHouse](SafeHouse.html "class in zombie.iso.areas") safeHouse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### hasNotSurvivedEnoughToClaim

    public static boolean hasNotSurvivedEnoughToClaim([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isSafeHouseExpired

    private static boolean isSafeHouseExpired([SafeHouse](SafeHouse.html "class in zombie.iso.areas") safeHouse,
    long currentTime,
    long removalTime)
  + ### update

    public static void update()