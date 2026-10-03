[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [PlayerDownloadServer](PlayerDownloadServer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [CHUNK\_GENERATION\_TIMEOUT\_MS](#CHUNK_GENERATION_TIMEOUT_MS)
   2. [OUT\_OF\_RANGE\_GRACE\_MS](#OUT_OF_RANGE_GRACE_MS)
   3. [OUT\_OF\_RANGE\_GRID\_FACTOR](#OUT_OF_RANGE_GRID_FACTOR)
   4. [MAX\_PENDING\_CHUNKS](#MAX_PENDING_CHUNKS)
   5. [MAX\_OUT\_OF\_RANGE\_REQUESTS](#MAX_OUT_OF_RANGE_REQUESTS)
   6. [workerThread](#workerThread)
   7. [connection](#connection)
   8. [networkFileDebug](#networkFileDebug)
   9. [crc32](#crc32)
   10. [bb](#bb)
   11. [sb](#sb)
   12. [bbw](#bbw)
   13. [queuedByWorker](#queuedByWorker)
   14. [outOfRangeRequests](#outOfRangeRequests)
   15. [pendingChunks](#pendingChunks)
   16. [ccrWaiting](#ccrWaiting)
7. [Constructor Details](#constructor-detail)
   1. [PlayerDownloadServer(UdpConnection)](#%3Cinit%3E(zombie.core.raknet.UdpConnection))
8. [Method Details](#method-detail)
   1. [destroy()](#destroy())
   2. [chunkKey(int, int)](#chunkKey(int,int))
   3. [queueUntilGenerated(int, int, int)](#queueUntilGenerated(int,int,int))
   4. [isRequestInRange(int, int)](#isRequestInRange(int,int))
   5. [addPendingChunk(PlayerDownloadServer.QueuedRequest)](#addPendingChunk(zombie.network.PlayerDownloadServer.QueuedRequest))
   6. [updateOutOfRangeRequests()](#updateOutOfRangeRequests())
   7. [updatePendingChunks()](#updatePendingChunks())
   8. [getClientChunkRequest(boolean)](#getClientChunkRequest(boolean))
   9. [getWaitingRequests()](#getWaitingRequests())
   10. [update()](#update())
   11. [removeOlderDuplicateRequests()](#removeOlderDuplicateRequests())
   12. [cancelDuplicateChunk(ClientChunkRequest, int, int)](#cancelDuplicateChunk(zombie.network.ClientChunkRequest,int,int))
   13. [sendPacket(PacketTypes.PacketType)](#sendPacket(zombie.network.PacketTypes.PacketType))
   14. [startPacket()](#startPacket())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PlayerDownloadServer
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.PlayerDownloadServer

---

public final class PlayerDownloadServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `PlayerDownloadServer.EThreadCommand`

  `private static final class`

  `PlayerDownloadServer.OutOfRangeRequest`

  `private static final class`

  `PlayerDownloadServer.PendingChunk`

  `private static final class`

  `PlayerDownloadServer.QueuedRequest`

  `final class`

  `PlayerDownloadServer.WorkerThread`

  `private static final class`

  `PlayerDownloadServer.WorkerThreadCommand`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ByteBuffer`

  `bb`

  `private final zombie.core.network.ByteBufferWriter`

  `bbw`

  `final List<zombie.network.ClientChunkRequest>`

  `ccrWaiting`

  `private static final long`

  `CHUNK_GENERATION_TIMEOUT_MS`

  `private final zombie.core.raknet.UdpConnection`

  `connection`

  `private final CRC32`

  `crc32`

  `private static final int`

  `MAX_OUT_OF_RANGE_REQUESTS`

  `private static final int`

  `MAX_PENDING_CHUNKS`

  `private boolean`

  `networkFileDebug`

  `private static final long`

  `OUT_OF_RANGE_GRACE_MS`

  `private static final int`

  `OUT_OF_RANGE_GRID_FACTOR`

  `private final List<PlayerDownloadServer.OutOfRangeRequest>`

  `outOfRangeRequests`

  `private final LinkedHashMap<Integer, PlayerDownloadServer.PendingChunk>`

  `pendingChunks`

  `private final ConcurrentLinkedQueue<PlayerDownloadServer.QueuedRequest>`

  `queuedByWorker`

  `private final ByteBuffer`

  `sb`

  `PlayerDownloadServer.WorkerThread`

  `workerThread`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerDownloadServer(zombie.core.raknet.UdpConnection connection)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addPendingChunk(PlayerDownloadServer.QueuedRequest queued)`

  `private boolean`

  `cancelDuplicateChunk(zombie.network.ClientChunkRequest ccr,
  int wx,
  int wy)`

  `private static int`

  `chunkKey(int wx,
  int wy)`

  `void`

  `destroy()`

  `zombie.network.ClientChunkRequest`

  `getClientChunkRequest(boolean isLargeArea)`

  `final int`

  `getWaitingRequests()`

  `private boolean`

  `isRequestInRange(int wx,
  int wy)`

  `(package private) void`

  `queueUntilGenerated(int requestNumber,
  int wx,
  int wy)`

  `private void`

  `removeOlderDuplicateRequests()`

  `private void`

  `sendPacket(zombie.network.PacketTypes.PacketType packetType)`

  `private zombie.core.network.ByteBufferWriter`

  `startPacket()`

  `void`

  `update()`

  `private void`

  `updateOutOfRangeRequests()`

  `private void`

  `updatePendingChunks()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### CHUNK\_GENERATION\_TIMEOUT\_MS

    private static final long CHUNK\_GENERATION\_TIMEOUT\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PlayerDownloadServer.CHUNK_GENERATION_TIMEOUT_MS)
  + ### OUT\_OF\_RANGE\_GRACE\_MS

    private static final long OUT\_OF\_RANGE\_GRACE\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PlayerDownloadServer.OUT_OF_RANGE_GRACE_MS)
  + ### OUT\_OF\_RANGE\_GRID\_FACTOR

    private static final int OUT\_OF\_RANGE\_GRID\_FACTOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PlayerDownloadServer.OUT_OF_RANGE_GRID_FACTOR)
  + ### MAX\_PENDING\_CHUNKS

    private static final int MAX\_PENDING\_CHUNKS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PlayerDownloadServer.MAX_PENDING_CHUNKS)
  + ### MAX\_OUT\_OF\_RANGE\_REQUESTS

    private static final int MAX\_OUT\_OF\_RANGE\_REQUESTS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PlayerDownloadServer.MAX_OUT_OF_RANGE_REQUESTS)
  + ### workerThread

    public [PlayerDownloadServer.WorkerThread](PlayerDownloadServer.WorkerThread.html "class in zombie.network") workerThread
  + ### connection

    private final zombie.core.raknet.UdpConnection connection
  + ### networkFileDebug

    private boolean networkFileDebug
  + ### crc32

    private final [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crc32
  + ### bb

    private final [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb
  + ### sb

    private final [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") sb
  + ### bbw

    private final zombie.core.network.ByteBufferWriter bbw
  + ### queuedByWorker

    private final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[PlayerDownloadServer.QueuedRequest](PlayerDownloadServer.QueuedRequest.html "class in zombie.network")> queuedByWorker
  + ### outOfRangeRequests

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[PlayerDownloadServer.OutOfRangeRequest](PlayerDownloadServer.OutOfRangeRequest.html "class in zombie.network")> outOfRangeRequests
  + ### pendingChunks

    private final [LinkedHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedHashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [PlayerDownloadServer.PendingChunk](PlayerDownloadServer.PendingChunk.html "class in zombie.network")> pendingChunks
  + ### ccrWaiting

    public final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.network.ClientChunkRequest> ccrWaiting
* Constructor Details
  -------------------

  + ### PlayerDownloadServer

    public PlayerDownloadServer(zombie.core.raknet.UdpConnection connection)
* Method Details
  --------------

  + ### destroy

    public void destroy()
  + ### chunkKey

    private static int chunkKey(int wx,
    int wy)
  + ### queueUntilGenerated

    void queueUntilGenerated(int requestNumber,
    int wx,
    int wy)
  + ### isRequestInRange

    private boolean isRequestInRange(int wx,
    int wy)
  + ### addPendingChunk

    private void addPendingChunk([PlayerDownloadServer.QueuedRequest](PlayerDownloadServer.QueuedRequest.html "class in zombie.network") queued)
  + ### updateOutOfRangeRequests

    private void updateOutOfRangeRequests()
  + ### updatePendingChunks

    private void updatePendingChunks()
  + ### getClientChunkRequest

    public zombie.network.ClientChunkRequest getClientChunkRequest(boolean isLargeArea)
  + ### getWaitingRequests

    public final int getWaitingRequests()
  + ### update

    public void update()
  + ### removeOlderDuplicateRequests

    private void removeOlderDuplicateRequests()
  + ### cancelDuplicateChunk

    private boolean cancelDuplicateChunk(zombie.network.ClientChunkRequest ccr,
    int wx,
    int wy)
  + ### sendPacket

    private void sendPacket(zombie.network.PacketTypes.PacketType packetType)
  + ### startPacket

    private zombie.core.network.ByteBufferWriter startPacket()