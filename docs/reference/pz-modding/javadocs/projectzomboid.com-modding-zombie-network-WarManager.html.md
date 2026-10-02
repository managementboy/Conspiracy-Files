[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [WarManager](WarManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [wars](#wars)
   2. [temp](#temp)
7. [Constructor Details](#constructor-detail)
   1. [WarManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getWarRelevent(IsoPlayer)](#getWarRelevent(zombie.characters.IsoPlayer))
   2. [getWarNearest(IsoPlayer)](#getWarNearest(zombie.characters.IsoPlayer))
   3. [getWar(int, String)](#getWar(int,java.lang.String))
   4. [isWarClaimed(int)](#isWarClaimed(int))
   5. [isWarClaimed(String)](#isWarClaimed(java.lang.String))
   6. [isWarStarted(int, String)](#isWarStarted(int,java.lang.String))
   7. [removeWar(int, String)](#removeWar(int,java.lang.String))
   8. [clear()](#clear())
   9. [sendWarToPlayer(IsoPlayer)](#sendWarToPlayer(zombie.characters.IsoPlayer))
   10. [updateWar(int, String, WarManager.State, long)](#updateWar(int,java.lang.String,zombie.network.WarManager.State,long))
   11. [update()](#update())
   12. [getWarDuration()](#getWarDuration())
   13. [getStartDelay()](#getStartDelay())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WarManager
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.WarManager

---

public final class WarManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `WarManager.State`

  `static class`

  `WarManager.War`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<WarManager.War>`

  `temp`

  `private static final ArrayList<WarManager.War>`

  `wars`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WarManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `clear()`

  Removes all wars.

  `static long`

  `getStartDelay()`

  `static WarManager.War`

  `getWar(int onlineID,
  String attacker)`

  Gets war by id and player.

  `static long`

  `getWarDuration()`

  `static WarManager.War`

  `getWarNearest(IsoPlayer player)`

  Returns the nearest war for the player.

  `static ArrayList<WarManager.War>`

  `getWarRelevent(IsoPlayer player)`

  Returns list of wars for the player.

  `static boolean`

  `isWarClaimed(int onlineID)`

  Checks if safehouse already claimed for a war.

  `static boolean`

  `isWarClaimed(String username)`

  Checks if player already claimed a war.

  `static boolean`

  `isWarStarted(int onlineID,
  String username)`

  Checks if war is started for safehouse and player.

  `static void`

  `removeWar(int onlineID,
  String attacker)`

  Removes war.

  `static void`

  `sendWarToPlayer(IsoPlayer player)`

  Sends all wars to the player.

  `static void`

  `update()`

  Performs wars state transitions.

  `static void`

  `updateWar(int onlineId,
  String attacker,
  WarManager.State state,
  long timestamp)`

  Updates war.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### wars

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WarManager.War](WarManager.War.html "class in zombie.network")> wars
  + ### temp

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WarManager.War](WarManager.War.html "class in zombie.network")> temp
* Constructor Details
  -------------------

  + ### WarManager

    private WarManager()
* Method Details
  --------------

  + ### getWarRelevent

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WarManager.War](WarManager.War.html "class in zombie.network")> getWarRelevent([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)

    Returns list of wars for the player.

    Player has only relevant wars in UI or all if role has appropriate capability.

    Parameters:
    :   `player` - player

    Returns:
    :   list of wars
  + ### getWarNearest

    public static [WarManager.War](WarManager.War.html "class in zombie.network") getWarNearest([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)

    Returns the nearest war for the player.

    Player could have several wars, because he could be in a faction. Nearest war is used for UI icon state and time.

    Parameters:
    :   `player` - player

    Returns:
    :   nearest war if any exists or null otherwise
  + ### getWar

    public static [WarManager.War](WarManager.War.html "class in zombie.network") getWar(int onlineID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker)

    Gets war by id and player.

    Parameters:
    :   `onlineID` - id
    :   `attacker` - plyer username

    Returns:
    :   war if found or null otherwise
  + ### isWarClaimed

    public static boolean isWarClaimed(int onlineID)

    Checks if safehouse already claimed for a war.

    Parameters:
    :   `onlineID` - id

    Returns:
    :   true if safehouse already claimed for a war or false otherwise
  + ### isWarClaimed

    public static boolean isWarClaimed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)

    Checks if player already claimed a war.

    Parameters:
    :   `username` - player username

    Returns:
    :   true if player already claimed a war or false otherwise
  + ### isWarStarted

    public static boolean isWarStarted(int onlineID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)

    Checks if war is started for safehouse and player.

    War participant can trepass safehouse during a war.

    Parameters:
    :   `onlineID` - id
    :   `username` - player username

    Returns:
    :   true if started war exists for safehouse and player or false otherwise
  + ### removeWar

    public static void removeWar(int onlineID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker)

    Removes war.

    Parameters:
    :   `onlineID` - id
    :   `attacker` - player username
  + ### clear

    public static void clear()

    Removes all wars.
  + ### sendWarToPlayer

    public static void sendWarToPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)

    Sends all wars to the player.

    Parameters:
    :   `player` - player
  + ### updateWar

    public static void updateWar(int onlineId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker,
    [WarManager.State](WarManager.State.html "enum class in zombie.network") state,
    long timestamp)

    Updates war.

    The client and the server create war if it does not exist.
    The client updates states and timestamps only by the server.
    The server updates only state and only by a player command (accept, refuse, and cancel).

    Parameters:
    :   `onlineId` - id
    :   `attacker` - player username
    :   `state` - war state
    :   `timestamp` - timestamp
  + ### update

    public static void update()

    Performs wars state transitions.

    The server compares current time with war timestamp to check if state should be changed on the next state.
  + ### getWarDuration

    public static long getWarDuration()
  + ### getStartDelay

    public static long getStartDelay()