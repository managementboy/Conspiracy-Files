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
3. [War](WarManager.War.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [transitions](#transitions)
   2. [onlineId](#onlineId)
   3. [attacker](#attacker)
   4. [state](#state)
   5. [timestamp](#timestamp)
6. [Constructor Details](#constructor-detail)
   1. [War(int, String, WarManager.State, long)](#%3Cinit%3E(int,java.lang.String,zombie.network.WarManager.State,long))
7. [Method Details](#method-detail)
   1. [getOnlineID()](#getOnlineID())
   2. [getAttacker()](#getAttacker())
   3. [getDefender()](#getDefender())
   4. [getState()](#getState())
   5. [isValidState(WarManager.State)](#isValidState(zombie.network.WarManager.State))
   6. [setState(WarManager.State)](#setState(zombie.network.WarManager.State))
   7. [getTimestamp()](#getTimestamp())
   8. [setTimestamp(long)](#setTimestamp(long))
   9. [getTime()](#getTime())
   10. [isRelevant(String)](#isRelevant(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WarManager.War
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.WarManager.War

Enclosing class:
:   `WarManager`

---

public static class WarManager.War
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `attacker`

  `private final int`

  `onlineId`

  `private WarManager.State`

  `state`

  `private long`

  `timestamp`

  `private static final HashMap<WarManager.State, WarManager.State>`

  `transitions`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `War(int onlineId,
  String attacker,
  WarManager.State state,
  long timestamp)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getAttacker()`

  `String`

  `getDefender()`

  `int`

  `getOnlineID()`

  `WarManager.State`

  `getState()`

  `String`

  `getTime()`

  `long`

  `getTimestamp()`

  `private boolean`

  `isRelevant(String username)`

  Checks if player participates in this war.

  `boolean`

  `isValidState(WarManager.State state)`

  `void`

  `setState(WarManager.State state)`

  `void`

  `setTimestamp(long timestamp)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### transitions

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[WarManager.State](WarManager.State.html "enum class in zombie.network"), [WarManager.State](WarManager.State.html "enum class in zombie.network")> transitions
  + ### onlineId

    private final int onlineId
  + ### attacker

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker
  + ### state

    private [WarManager.State](WarManager.State.html "enum class in zombie.network") state
  + ### timestamp

    private long timestamp
* Constructor Details
  -------------------

  + ### War

    public War(int onlineId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attacker,
    [WarManager.State](WarManager.State.html "enum class in zombie.network") state,
    long timestamp)
* Method Details
  --------------

  + ### getOnlineID

    public int getOnlineID()
  + ### getAttacker

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttacker()
  + ### getDefender

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDefender()
  + ### getState

    public [WarManager.State](WarManager.State.html "enum class in zombie.network") getState()
  + ### isValidState

    public boolean isValidState([WarManager.State](WarManager.State.html "enum class in zombie.network") state)
  + ### setState

    public void setState([WarManager.State](WarManager.State.html "enum class in zombie.network") state)
  + ### getTimestamp

    public long getTimestamp()
  + ### setTimestamp

    public void setTimestamp(long timestamp)
  + ### getTime

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTime()
  + ### isRelevant

    private boolean isRelevant([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)

    Checks if player participates in this war.

    There are several cases when player participates in the war: war claimer, war claimer faction memeber,
    safehouse owner, safehouse owner faction memeber, safehouse member.
    War caould be canceled. In this case war is irrelevant for any player.

    Parameters:
    :   `username` - player username

    Returns:
    :   true if player participates in this war or false otherwise