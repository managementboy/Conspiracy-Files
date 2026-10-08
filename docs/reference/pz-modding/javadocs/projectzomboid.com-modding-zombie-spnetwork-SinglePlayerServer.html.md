[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.spnetwork](package-summary.html)
2. [SinglePlayerServer](SinglePlayerServer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MainLoopNetData](#MainLoopNetData)
   2. [udpEngine](#udpEngine)
7. [Constructor Details](#constructor-detail)
   1. [SinglePlayerServer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addIncoming(short, ByteBuffer, UdpConnection)](#addIncoming(short,java.nio.ByteBuffer,zombie.spnetwork.UdpConnection))
   2. [sendObjectChange(IsoObject, IsoObjectChange, KahluaTable, UdpConnection)](#sendObjectChange(zombie.iso.IsoObject,zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.spnetwork.UdpConnection))
   3. [sendObjectChange(IsoObject, IsoObjectChange, KahluaTable)](#sendObjectChange(zombie.iso.IsoObject,zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable))
   4. [sendObjectChange(IsoObject, IsoObjectChange, Object...)](#sendObjectChange(zombie.iso.IsoObject,zombie.core.properties.IsoObjectChange,java.lang.Object...))
   5. [sendServerCommand(String, String, KahluaTable, UdpConnection)](#sendServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable,zombie.spnetwork.UdpConnection))
   6. [sendServerCommand(String, String, KahluaTable)](#sendServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   7. [update()](#update())
   8. [mainLoopDealWithNetData(ZomboidNetData)](#mainLoopDealWithNetData(zombie.spnetwork.ZomboidNetData))
   9. [getAnyPlayerFromConnection(UdpConnection)](#getAnyPlayerFromConnection(zombie.spnetwork.UdpConnection))
   10. [getPlayerFromConnection(UdpConnection, int)](#getPlayerFromConnection(zombie.spnetwork.UdpConnection,int))
   11. [receiveClientCommand(ByteBufferReader, UdpConnection)](#receiveClientCommand(zombie.core.network.ByteBufferReader,zombie.spnetwork.UdpConnection))
   12. [receiveGlobalObjects(ByteBufferReader, UdpConnection)](#receiveGlobalObjects(zombie.core.network.ByteBufferReader,zombie.spnetwork.UdpConnection))
   13. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SinglePlayerServer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.spnetwork.SinglePlayerServer

---

public final class SinglePlayerServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `SinglePlayerServer.UdpEngineServer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<zombie.spnetwork.ZomboidNetData>`

  `MainLoopNetData`

  `static final SinglePlayerServer.UdpEngineServer`

  `udpEngine`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SinglePlayerServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addIncoming(short id,
  ByteBuffer bb,
  zombie.spnetwork.UdpConnection connection)`

  `private static IsoPlayer`

  `getAnyPlayerFromConnection(zombie.spnetwork.UdpConnection connection)`

  `private static IsoPlayer`

  `getPlayerFromConnection(zombie.spnetwork.UdpConnection connection,
  int playerIndex)`

  `private static void`

  `mainLoopDealWithNetData(zombie.spnetwork.ZomboidNetData d)`

  `private static void`

  `receiveClientCommand(zombie.core.network.ByteBufferReader bb,
  zombie.spnetwork.UdpConnection connection)`

  `private static void`

  `receiveGlobalObjects(zombie.core.network.ByteBufferReader bb,
  zombie.spnetwork.UdpConnection connection)`

  `static void`

  `Reset()`

  `static void`

  `sendObjectChange(IsoObject o,
  IsoObjectChange change,
  Object... objects)`

  `static void`

  `sendObjectChange(IsoObject o,
  IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl)`

  `private static void`

  `sendObjectChange(IsoObject o,
  IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.spnetwork.UdpConnection c)`

  `static void`

  `sendServerCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static void`

  `sendServerCommand(String module,
  String command,
  se.krka.kahlua.vm.KahluaTable args,
  zombie.spnetwork.UdpConnection c)`

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MainLoopNetData

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.spnetwork.ZomboidNetData> MainLoopNetData
  + ### udpEngine

    public static final [SinglePlayerServer.UdpEngineServer](SinglePlayerServer.UdpEngineServer.html "class in zombie.spnetwork") udpEngine
* Constructor Details
  -------------------

  + ### SinglePlayerServer

    public SinglePlayerServer()
* Method Details
  --------------

  + ### addIncoming

    public static void addIncoming(short id,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    zombie.spnetwork.UdpConnection connection)
  + ### sendObjectChange

    private static void sendObjectChange([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl,
    zombie.spnetwork.UdpConnection c)
  + ### sendObjectChange

    public static void sendObjectChange([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl)
  + ### sendObjectChange

    public static void sendObjectChange([IsoObject](../iso/IsoObject.html "class in zombie.iso") o,
    [IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... objects)
  + ### sendServerCommand

    public static void sendServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args,
    zombie.spnetwork.UdpConnection c)
  + ### sendServerCommand

    public static void sendServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### update

    public static void update()
  + ### mainLoopDealWithNetData

    private static void mainLoopDealWithNetData(zombie.spnetwork.ZomboidNetData d)
  + ### getAnyPlayerFromConnection

    private static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getAnyPlayerFromConnection(zombie.spnetwork.UdpConnection connection)
  + ### getPlayerFromConnection

    private static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayerFromConnection(zombie.spnetwork.UdpConnection connection,
    int playerIndex)
  + ### receiveClientCommand

    private static void receiveClientCommand(zombie.core.network.ByteBufferReader bb,
    zombie.spnetwork.UdpConnection connection)
  + ### receiveGlobalObjects

    private static void receiveGlobalObjects(zombie.core.network.ByteBufferReader bb,
    zombie.spnetwork.UdpConnection connection)
  + ### Reset

    public static void Reset()