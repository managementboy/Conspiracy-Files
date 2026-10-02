[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [NetTimedAction](NetTimedAction.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [name](#name)
   3. [action](#action)
   4. [actionArgs](#actionArgs)
   5. [isUsingTimeout](#isUsingTimeout)
   6. [timeoutForInfinitiveActions](#timeoutForInfinitiveActions)
   7. [lastId](#lastId)
   8. [id](#id)
   9. [state](#state)
   10. [playerId](#playerId)
   11. [duration](#duration)
   12. [startTime](#startTime)
   13. [endTime](#endTime)
6. [Constructor Details](#constructor-detail)
   1. [NetTimedAction()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(IsoPlayer, KahluaTable)](#set(zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   2. [copyFrom(NetTimedAction)](#copyFrom(zombie.core.NetTimedAction))
   3. [getDuration()](#getDuration())
   4. [getAdjustedDuration(float)](#getAdjustedDuration(float))
   5. [start()](#start())
   6. [stop()](#stop())
   7. [isValid()](#isValid())
   8. [isUsingTimeout()](#isUsingTimeout())
   9. [update()](#update())
   10. [perform()](#perform())
   11. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   12. [forceComplete()](#forceComplete())
   13. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))
   14. [animEvent(String, String)](#animEvent(java.lang.String,java.lang.String))
   15. [setState(Transaction.TransactionState)](#setState(zombie.core.Transaction.TransactionState))
   16. [setTimeData()](#setTimeData())
   17. [set(IsoPlayer)](#set(zombie.characters.IsoPlayer))
   18. [copyFrom(Action)](#copyFrom(zombie.core.Action))
   19. [setDuration(long)](#setDuration(long))
   20. [isConsistent(IConnection)](#isConsistent(zombie.network.IConnection))
   21. [getProgress()](#getProgress())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class NetTimedAction
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.NetTimedAction

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor`

Direct Known Subclasses:
:   `NetTimedActionPacket`

---

public class NetTimedAction
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `se.krka.kahlua.vm.KahluaTable`

  `action`

  `(package private) zombie.network.PZNetKahluaTableImpl`

  `actionArgs`

  `long`

  `duration`

  `protected long`

  `endTime`

  `protected byte`

  `id`

  `(package private) boolean`

  `isUsingTimeout`

  `protected static byte`

  `lastId`

  `String`

  `name`

  `protected final zombie.network.fields.character.PlayerID`

  `playerId`

  `protected long`

  `startTime`

  `protected zombie.core.Transaction.TransactionState`

  `state`

  `protected static int`

  `timeoutForInfinitiveActions`

  `String`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetTimedAction()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `animEvent(String event,
  String parameter)`

  `void`

  `copyFrom(zombie.core.Action act)`

  `void`

  `copyFrom(NetTimedAction act)`

  `void`

  `forceComplete()`

  `private float`

  `getAdjustedDuration(float initialValue)`

  `(package private) float`

  `getDuration()`

  `float`

  `getProgress()`

  `boolean`

  `isConsistent(zombie.network.IConnection connection)`

  `(package private) boolean`

  `isUsingTimeout()`

  `(package private) boolean`

  `isValid()`

  `void`

  `parse(zombie.core.network.ByteBufferReader b,
  zombie.network.IConnection connection)`

  `(package private) boolean`

  `perform()`

  `void`

  `set(IsoPlayer player)`

  `void`

  `set(IsoPlayer player,
  se.krka.kahlua.vm.KahluaTable action)`

  `void`

  `setDuration(long duration)`

  `void`

  `setState(zombie.core.Transaction.TransactionState state)`

  `void`

  `setTimeData()`

  `(package private) void`

  `start()`

  `(package private) void`

  `stop()`

  `(package private) void`

  `update()`

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes`

* Field Details
  -------------

  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### action

    public se.krka.kahlua.vm.KahluaTable action
  + ### actionArgs

    zombie.network.PZNetKahluaTableImpl actionArgs
  + ### isUsingTimeout

    boolean isUsingTimeout
  + ### timeoutForInfinitiveActions

    protected static int timeoutForInfinitiveActions
  + ### lastId

    protected static byte lastId
  + ### id

    protected byte id
  + ### state

    protected zombie.core.Transaction.TransactionState state
  + ### playerId

    protected final zombie.network.fields.character.PlayerID playerId
  + ### duration

    public long duration
  + ### startTime

    protected long startTime
  + ### endTime

    protected long endTime
* Constructor Details
  -------------------

  + ### NetTimedAction

    public NetTimedAction()
* Method Details
  --------------

  + ### set

    public void set([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    se.krka.kahlua.vm.KahluaTable action)
  + ### copyFrom

    public void copyFrom([NetTimedAction](NetTimedAction.html "class in zombie.core") act)
  + ### getDuration

    float getDuration()
  + ### getAdjustedDuration

    private float getAdjustedDuration(float initialValue)
  + ### start

    void start()
  + ### stop

    void stop()
  + ### isValid

    boolean isValid()
  + ### isUsingTimeout

    boolean isUsingTimeout()
  + ### update

    void update()
  + ### perform

    boolean perform()
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader b,
    zombie.network.IConnection connection)

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`
  + ### forceComplete

    public void forceComplete()
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`
  + ### animEvent

    public void animEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameter)
  + ### setState

    public void setState(zombie.core.Transaction.TransactionState state)
  + ### setTimeData

    public void setTimeData()
  + ### set

    public void set([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### copyFrom

    public void copyFrom(zombie.core.Action act)
  + ### setDuration

    public void setDuration(long duration)
  + ### isConsistent

    public boolean isConsistent(zombie.network.IConnection connection)

    Specified by:
    :   `isConsistent` in interface `zombie.network.fields.INetworkPacketField`
  + ### getProgress

    public float getProgress()