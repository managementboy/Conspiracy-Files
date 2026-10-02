[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.worldMap.network](package-summary.html)
2. [WorldMapServer](WorldMapServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [SAVEFILE\_VERSION](#SAVEFILE_VERSION)
   3. [FILE\_MAGIC](#FILE_MAGIC)
   4. [PACKET\_AddMarker](#PACKET_AddMarker)
   5. [PACKET\_RemoveMarker](#PACKET_RemoveMarker)
   6. [PACKET\_AddSymbol](#PACKET_AddSymbol)
   7. [PACKET\_RemoveSymbol](#PACKET_RemoveSymbol)
   8. [PACKET\_ModifySymbol](#PACKET_ModifySymbol)
   9. [PACKET\_SetPrivateSymbol](#PACKET_SetPrivateSymbol)
   10. [PACKET\_ModifySharing](#PACKET_ModifySharing)
   11. [BYTE\_BUFFER](#BYTE_BUFFER)
   12. [BYTE\_BUFFER\_WRITER](#BYTE_BUFFER_WRITER)
   13. [symbols](#symbols)
   14. [nextElementId](#nextElementId)
   15. [symbolById](#symbolById)
6. [Constructor Details](#constructor-detail)
   1. [WorldMapServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [receive(ByteBufferReader, UdpConnection)](#receive(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   2. [receiveAddMarker(ByteBufferReader, UdpConnection)](#receiveAddMarker(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   3. [receiveRemoveMarker(ByteBufferReader, UdpConnection)](#receiveRemoveMarker(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   4. [receiveAddSymbol(ByteBufferReader, UdpConnection)](#receiveAddSymbol(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   5. [receiveRemoveSymbol(ByteBufferReader, UdpConnection)](#receiveRemoveSymbol(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   6. [receiveModifySymbol(ByteBufferReader, UdpConnection)](#receiveModifySymbol(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   7. [receiveSetPrivateSymbol(ByteBufferReader, UdpConnection)](#receiveSetPrivateSymbol(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   8. [receiveModifySharing(ByteBufferReader, UdpConnection)](#receiveModifySharing(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   9. [canClientModify(WorldMapSymbolNetworkInfo, UdpConnection)](#canClientModify(zombie.worldMap.network.WorldMapSymbolNetworkInfo,zombie.core.raknet.UdpConnection))
   10. [sendPacket(ByteBuffer)](#sendPacket(java.nio.ByteBuffer))
   11. [addMarkerOnClient(WorldMapBaseSymbol)](#addMarkerOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol))
   12. [removeMarkerOnClient(int)](#removeMarkerOnClient(int))
   13. [addSymbolOnClient(WorldMapBaseSymbol)](#addSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol))
   14. [removeSymbolOnClient(int)](#removeSymbolOnClient(int))
   15. [modifySymbolOnClient(WorldMapBaseSymbol)](#modifySymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol))
   16. [setPrivateSymbolOnClient(WorldMapBaseSymbol)](#setPrivateSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol))
   17. [sendRequestData(ByteBuffer)](#sendRequestData(java.nio.ByteBuffer))
   18. [writeSavefile()](#writeSavefile())
   19. [writeSavefile(ByteBuffer)](#writeSavefile(java.nio.ByteBuffer))
   20. [readSavefile()](#readSavefile())
   21. [readSavefile(ByteBuffer, int, int)](#readSavefile(java.nio.ByteBuffer,int,int))
   22. [removeAllSymbolsForUser(String)](#removeAllSymbolsForUser(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldMapServer
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.worldMap.network.WorldMapServer

---

public final class WorldMapServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ByteBuffer`

  `BYTE_BUFFER`

  `private static final zombie.core.network.ByteBufferWriter`

  `BYTE_BUFFER_WRITER`

  `private static final byte[]`

  `FILE_MAGIC`

  `static final WorldMapServer`

  `instance`

  `private int`

  `nextElementId`

  `static final byte`

  `PACKET_AddMarker`

  `static final byte`

  `PACKET_AddSymbol`

  `static final byte`

  `PACKET_ModifySharing`

  `static final byte`

  `PACKET_ModifySymbol`

  `static final byte`

  `PACKET_RemoveMarker`

  `static final byte`

  `PACKET_RemoveSymbol`

  `static final byte`

  `PACKET_SetPrivateSymbol`

  `static final int`

  `SAVEFILE_VERSION`

  `private final gnu.trove.map.hash.TIntObjectHashMap<zombie.worldMap.symbols.WorldMapBaseSymbol>`

  `symbolById`

  `private final zombie.worldMap.symbols.WorldMapSymbols`

  `symbols`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldMapServer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addMarkerOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)`

  `void`

  `addSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)`

  `private boolean`

  `canClientModify(zombie.worldMap.network.WorldMapSymbolNetworkInfo networkInfo,
  zombie.core.raknet.UdpConnection connection)`

  `void`

  `modifySymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)`

  `void`

  `readSavefile()`

  `private void`

  `readSavefile(ByteBuffer bb,
  int worldVersion,
  int symbolsVersion)`

  `void`

  `receive(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveAddMarker(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveAddSymbol(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveModifySharing(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveModifySymbol(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveRemoveMarker(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveRemoveSymbol(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `private void`

  `receiveSetPrivateSymbol(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `int`

  `removeAllSymbolsForUser(String userName)`

  `void`

  `removeMarkerOnClient(int id)`

  `void`

  `removeSymbolOnClient(int id)`

  `private void`

  `sendPacket(ByteBuffer bb)`

  `void`

  `sendRequestData(ByteBuffer bb)`

  `void`

  `setPrivateSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)`

  `void`

  `writeSavefile()`

  `private void`

  `writeSavefile(ByteBuffer bb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [WorldMapServer](WorldMapServer.html "class in zombie.worldMap.network") instance
  + ### SAVEFILE\_VERSION

    public static final int SAVEFILE\_VERSION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.SAVEFILE_VERSION)
  + ### FILE\_MAGIC

    private static final byte[] FILE\_MAGIC
  + ### PACKET\_AddMarker

    public static final byte PACKET\_AddMarker

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_AddMarker)
  + ### PACKET\_RemoveMarker

    public static final byte PACKET\_RemoveMarker

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_RemoveMarker)
  + ### PACKET\_AddSymbol

    public static final byte PACKET\_AddSymbol

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_AddSymbol)
  + ### PACKET\_RemoveSymbol

    public static final byte PACKET\_RemoveSymbol

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_RemoveSymbol)
  + ### PACKET\_ModifySymbol

    public static final byte PACKET\_ModifySymbol

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_ModifySymbol)
  + ### PACKET\_SetPrivateSymbol

    public static final byte PACKET\_SetPrivateSymbol

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_SetPrivateSymbol)
  + ### PACKET\_ModifySharing

    public static final byte PACKET\_ModifySharing

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.network.WorldMapServer.PACKET_ModifySharing)
  + ### BYTE\_BUFFER

    private static final [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") BYTE\_BUFFER
  + ### BYTE\_BUFFER\_WRITER

    private static final zombie.core.network.ByteBufferWriter BYTE\_BUFFER\_WRITER
  + ### symbols

    private final zombie.worldMap.symbols.WorldMapSymbols symbols
  + ### nextElementId

    private int nextElementId
  + ### symbolById

    private final gnu.trove.map.hash.TIntObjectHashMap<zombie.worldMap.symbols.WorldMapBaseSymbol> symbolById
* Constructor Details
  -------------------

  + ### WorldMapServer

    public WorldMapServer()
* Method Details
  --------------

  + ### receive

    public void receive(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveAddMarker

    private void receiveAddMarker(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### receiveRemoveMarker

    private void receiveRemoveMarker(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### receiveAddSymbol

    private void receiveAddSymbol(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveRemoveSymbol

    private void receiveRemoveSymbol(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### receiveModifySymbol

    private void receiveModifySymbol(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveSetPrivateSymbol

    private void receiveSetPrivateSymbol(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveModifySharing

    private void receiveModifySharing(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### canClientModify

    private boolean canClientModify(zombie.worldMap.network.WorldMapSymbolNetworkInfo networkInfo,
    zombie.core.raknet.UdpConnection connection)
  + ### sendPacket

    private void sendPacket([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### addMarkerOnClient

    public void addMarkerOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### removeMarkerOnClient

    public void removeMarkerOnClient(int id)
  + ### addSymbolOnClient

    public void addSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### removeSymbolOnClient

    public void removeSymbolOnClient(int id)
  + ### modifySymbolOnClient

    public void modifySymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### setPrivateSymbolOnClient

    public void setPrivateSymbolOnClient(zombie.worldMap.symbols.WorldMapBaseSymbol symbol)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### sendRequestData

    public void sendRequestData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### writeSavefile

    public void writeSavefile()
  + ### writeSavefile

    private void writeSavefile([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readSavefile

    public void readSavefile()
  + ### readSavefile

    private void readSavefile([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion,
    int symbolsVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### removeAllSymbolsForUser

    public int removeAllSymbolsForUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") userName)