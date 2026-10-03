[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.packets](package-summary.html)
2. [SyncPlayerStatsPacket](SyncPlayerStatsPacket.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [playerId](#playerId)
   2. [syncParams](#syncParams)
6. [Constructor Details](#constructor-detail)
   1. [SyncPlayerStatsPacket()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getBitMaskForStat(CharacterStat)](#getBitMaskForStat(zombie.characters.CharacterStat))
   2. [setData(Object...)](#setData(java.lang.Object...))
   3. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   4. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SyncPlayerStatsPacket
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.packets.SyncPlayerStatsPacket

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor, zombie.network.packets.INetworkPacket`

---

public class SyncPlayerStatsPacket
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.network.packets.INetworkPacket

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.network.fields.character.PlayerID`

  `playerId`

  `private int`

  `syncParams`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SyncPlayerStatsPacket()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static int`

  `getBitMaskForStat(CharacterStat stat)`

  `void`

  `parse(zombie.core.network.ByteBufferReader b,
  zombie.network.IConnection connection)`

  `void`

  `setData(Object... values)`

  This methods sets the packet data from varargs

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.packets.INetworkPacket

  `isPostponed, logInconsistentPacket, parseClient, parseClientLoading, parseServer, postpone, processClient, processClientLoading, processServer, sendToClient, sendToClient, sendToClients, sendToRelativeClients, sendToServer, shouldInstantiate, sync`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes, isConsistent`

* Field Details
  -------------

  + ### playerId

    private final zombie.network.fields.character.PlayerID playerId
  + ### syncParams

    private int syncParams
* Constructor Details
  -------------------

  + ### SyncPlayerStatsPacket

    public SyncPlayerStatsPacket()
* Method Details
  --------------

  + ### getBitMaskForStat

    public static int getBitMaskForStat([CharacterStat](../../characters/CharacterStat.html "class in zombie.characters") stat)
  + ### setData

    public void setData([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)

    Description copied from interface: `zombie.network.packets.INetworkPacket`

    This methods sets the packet data from varargs

    Specified by:
    :   `setData` in interface `zombie.network.packets.INetworkPacket`

    Parameters:
    :   `values` - varargs packet data
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader b,
    zombie.network.IConnection connection)

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`