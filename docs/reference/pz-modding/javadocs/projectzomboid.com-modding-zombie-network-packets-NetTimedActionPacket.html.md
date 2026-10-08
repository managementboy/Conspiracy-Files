[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.packets](package-summary.html)
2. [NetTimedActionPacket](NetTimedActionPacket.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [timeoutForInfinitiveActions](#timeoutForInfinitiveActions)
   2. [lastId](#lastId)
   3. [id](#id)
   4. [state](#state)
   5. [playerId](#playerId)
   6. [duration](#duration)
   7. [startTime](#startTime)
   8. [endTime](#endTime)
6. [Constructor Details](#constructor-detail)
   1. [NetTimedActionPacket()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [createNewAndSend(String, IsoPlayer, Object...)](#createNewAndSend(java.lang.String,zombie.characters.IsoPlayer,java.lang.Object...))
   2. [setData(Object...)](#setData(java.lang.Object...))
   3. [processClient(UdpConnection)](#processClient(zombie.core.raknet.UdpConnection))
   4. [getAction()](#getAction())
   5. [processServer(PacketTypes.PacketType, UdpConnection)](#processServer(zombie.network.PacketTypes.PacketType,zombie.core.raknet.UdpConnection))
   6. [setTimeData()](#setTimeData())
   7. [set(IsoPlayer)](#set(zombie.characters.IsoPlayer))
   8. [copyFrom(Action)](#copyFrom(zombie.core.Action))
   9. [setDuration(long)](#setDuration(long))
   10. [isConsistent(IConnection)](#isConsistent(zombie.network.IConnection))
   11. [getProgress()](#getProgress())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NetTimedActionPacket
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.core.NetTimedAction](../../core/NetTimedAction.html "class in zombie.core")

zombie.network.packets.NetTimedActionPacket

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor, zombie.network.packets.INetworkPacket`

---

public class NetTimedActionPacket
extends [NetTimedAction](../../core/NetTimedAction.html "class in zombie.core")
implements zombie.network.packets.INetworkPacket

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `long`

  `duration`

  `protected long`

  `endTime`

  `protected byte`

  `id`

  `protected static byte`

  `lastId`

  `protected final zombie.network.fields.character.PlayerID`

  `playerId`

  `protected long`

  `startTime`

  `protected zombie.core.Transaction.TransactionState`

  `state`

  `protected static int`

  `timeoutForInfinitiveActions`

  ### Fields inherited from class [NetTimedAction](../../core/NetTimedAction.html#field-summary "class in zombie.core")

  `action, name, type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetTimedActionPacket()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `copyFrom(zombie.core.Action act)`

  `static void`

  `createNewAndSend(String actionName,
  IsoPlayer owner,
  Object... values)`

  `private NetTimedAction`

  `getAction()`

  `float`

  `getProgress()`

  `boolean`

  `isConsistent(zombie.network.IConnection connection)`

  `void`

  `processClient(zombie.core.raknet.UdpConnection connection)`

  This method is called on the client after loading to handle the packet and usually implements packet handling logic.

  `void`

  `processServer(zombie.network.PacketTypes.PacketType packetType,
  zombie.core.raknet.UdpConnection connection)`

  This method is called on the server to handle the packet and usually implements packet handling logic.

  `void`

  `set(IsoPlayer player)`

  `void`

  `setData(Object... values)`

  This methods sets the packet data from varargs

  `void`

  `setDuration(long duration)`

  `void`

  `setTimeData()`

  ### Methods inherited from class [NetTimedAction](../../core/NetTimedAction.html#method-summary "class in zombie.core")

  `animEvent, copyFrom, forceComplete, parse, set, setState, write`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.packets.INetworkPacket

  `isPostponed, logInconsistentPacket, parseClient, parseClientLoading, parseServer, postpone, processClientLoading, sendToClient, sendToClient, sendToClients, sendToRelativeClients, sendToServer, shouldInstantiate, sync`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes, isConsistent, parse, write`

* Field Details
  -------------

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

  + ### NetTimedActionPacket

    public NetTimedActionPacket()
* Method Details
  --------------

  + ### createNewAndSend

    public static void createNewAndSend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") actionName,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") owner,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)
  + ### setData

    public void setData([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)

    Description copied from interface: `zombie.network.packets.INetworkPacket`

    This methods sets the packet data from varargs

    Specified by:
    :   `setData` in interface `zombie.network.packets.INetworkPacket`

    Parameters:
    :   `values` - varargs packet data
  + ### processClient

    public void processClient(zombie.core.raknet.UdpConnection connection)

    Description copied from interface: `zombie.network.packets.INetworkPacket`

    This method is called on the client after loading to handle the packet and usually implements packet handling logic.
    It should be overridden to handle packet on the client after loading.

    Specified by:
    :   `processClient` in interface `zombie.network.packets.INetworkPacket`

    Parameters:
    :   `connection` - UdpConnection instance
  + ### getAction

    private [NetTimedAction](../../core/NetTimedAction.html "class in zombie.core") getAction()
  + ### processServer

    public void processServer(zombie.network.PacketTypes.PacketType packetType,
    zombie.core.raknet.UdpConnection connection)

    Description copied from interface: `zombie.network.packets.INetworkPacket`

    This method is called on the server to handle the packet and usually implements packet handling logic.
    It should be overridden to handle packet on the server.

    Specified by:
    :   `processServer` in interface `zombie.network.packets.INetworkPacket`

    Parameters:
    :   `connection` - UdpConnection instance
  + ### setTimeData

    public void setTimeData()
  + ### set

    public void set([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
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