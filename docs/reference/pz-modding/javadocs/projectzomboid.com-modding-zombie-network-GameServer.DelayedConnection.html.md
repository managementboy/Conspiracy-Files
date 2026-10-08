[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [GameServer](GameServer.html)
3. [DelayedConnection](GameServer.DelayedConnection.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [connection](#connection)
   2. [connect](#connect)
   3. [hostString](#hostString)
   4. [timestamp](#timestamp)
6. [Constructor Details](#constructor-detail)
   1. [DelayedConnection(UdpConnection, boolean)](#%3Cinit%3E(zombie.core.raknet.UdpConnection,boolean))
7. [Method Details](#method-detail)
   1. [isConnect()](#isConnect())
   2. [isDisconnect()](#isDisconnect())
   3. [isCooldown()](#isCooldown())
   4. [connect()](#connect())
   5. [disconnect()](#disconnect())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameServer.DelayedConnection
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.GameServer.DelayedConnection

All Implemented Interfaces:
:   `zombie.network.IZomboidPacket`

Enclosing class:
:   `GameServer`

---

private static class GameServer.DelayedConnection
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.network.IZomboidPacket

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `connect`

  `zombie.core.raknet.UdpConnection`

  `connection`

  `String`

  `hostString`

  `long`

  `timestamp`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DelayedConnection(zombie.core.raknet.UdpConnection connection,
  boolean connect)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `connect()`

  `void`

  `disconnect()`

  `boolean`

  `isConnect()`

  `boolean`

  `isCooldown()`

  `boolean`

  `isDisconnect()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### connection

    public zombie.core.raknet.UdpConnection connection
  + ### connect

    public boolean connect
  + ### hostString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hostString
  + ### timestamp

    public long timestamp
* Constructor Details
  -------------------

  + ### DelayedConnection

    public DelayedConnection(zombie.core.raknet.UdpConnection connection,
    boolean connect)
* Method Details
  --------------

  + ### isConnect

    public boolean isConnect()

    Specified by:
    :   `isConnect` in interface `zombie.network.IZomboidPacket`
  + ### isDisconnect

    public boolean isDisconnect()

    Specified by:
    :   `isDisconnect` in interface `zombie.network.IZomboidPacket`
  + ### isCooldown

    public boolean isCooldown()
  + ### connect

    public void connect()
  + ### disconnect

    public void disconnect()