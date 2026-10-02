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
3. [WorkerThread](PlayerDownloadServer.WorkerThread.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [quit](#quit)
   2. [ready](#ready)
   3. [commandQ](#commandQ)
   4. [freeRequests](#freeRequests)
   5. [cancelQ](#cancelQ)
   6. [cancelled](#cancelled)
   7. [crcMaker](#crcMaker)
   8. [inMemoryZip](#inMemoryZip)
   9. [compressor](#compressor)
7. [Constructor Details](#constructor-detail)
   1. [WorkerThread()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [run()](#run())
   2. [runInner()](#runInner())
   3. [putCommand(PlayerDownloadServer.EThreadCommand, ClientChunkRequest)](#putCommand(zombie.network.PlayerDownloadServer.EThreadCommand,zombie.network.ClientChunkRequest))
   4. [compressChunk(ClientChunkRequest.Chunk)](#compressChunk(zombie.network.ClientChunkRequest.Chunk))
   5. [sendChunk(ClientChunkRequest.Chunk)](#sendChunk(zombie.network.ClientChunkRequest.Chunk))
   6. [sendNotRequired(int, boolean)](#sendNotRequired(int,boolean))
   7. [sendLargeArea(ClientChunkRequest)](#sendLargeArea(zombie.network.ClientChunkRequest))
   8. [sendArray(ClientChunkRequest)](#sendArray(zombie.network.ClientChunkRequest))
   9. [isRequestCancelled(int)](#isRequestCancelled(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PlayerDownloadServer.WorkerThread
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang")

zombie.network.PlayerDownloadServer.WorkerThread

All Implemented Interfaces:
:   `Runnable`

Enclosing class:
:   `PlayerDownloadServer`

---

public final class PlayerDownloadServer.WorkerThread
extends [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#nested-class-summary "class or interface in java.lang")

  `Thread.Builder, Thread.State, Thread.UncaughtExceptionHandler`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final HashSet<Integer>`

  `cancelled`

  `final ConcurrentLinkedQueue<Integer>`

  `cancelQ`

  `(package private) final LinkedBlockingQueue<PlayerDownloadServer.WorkerThreadCommand>`

  `commandQ`

  `(package private) final Deflater`

  `compressor`

  `(package private) final CRC32`

  `crcMaker`

  `(package private) final ConcurrentLinkedQueue<zombie.network.ClientChunkRequest>`

  `freeRequests`

  `(package private) byte[]`

  `inMemoryZip`

  `(package private) boolean`

  `quit`

  `(package private) boolean`

  `ready`

  ### Fields inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#field-summary "class or interface in java.lang")

  `MAX_PRIORITY, MIN_PRIORITY, NORM_PRIORITY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorkerThread()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compressChunk(zombie.network.ClientChunkRequest.Chunk chunk)`

  `private boolean`

  `isRequestCancelled(int requestNumber)`

  `(package private) void`

  `putCommand(PlayerDownloadServer.EThreadCommand e,
  zombie.network.ClientChunkRequest ccr)`

  `void`

  `run()`

  `private void`

  `runInner()`

  `private void`

  `sendArray(zombie.network.ClientChunkRequest ccr)`

  `private void`

  `sendChunk(zombie.network.ClientChunkRequest.Chunk chunk)`

  `private void`

  `sendLargeArea(zombie.network.ClientChunkRequest ccr)`

  `private void`

  `sendNotRequired(int requestNumber,
  boolean sameOnServer)`

  ### Methods inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#method-summary "class or interface in java.lang")

  `activeCount, checkAccess, clone, currentThread, dumpStack, enumerate, getAllStackTraces, getContextClassLoader, getDefaultUncaughtExceptionHandler, getId, getName, getPriority, getStackTrace, getState, getThreadGroup, getUncaughtExceptionHandler, holdsLock, interrupt, interrupted, isAlive, isDaemon, isInterrupted, isVirtual, join, join, join, join, ofPlatform, ofVirtual, onSpinWait, setContextClassLoader, setDaemon, setDefaultUncaughtExceptionHandler, setName, setPriority, setUncaughtExceptionHandler, sleep, sleep, sleep, start, startVirtualThread, stop, threadId, toString, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### quit

    boolean quit
  + ### ready

    volatile boolean ready
  + ### commandQ

    final [LinkedBlockingQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/LinkedBlockingQueue.html "class or interface in java.util.concurrent")<[PlayerDownloadServer.WorkerThreadCommand](PlayerDownloadServer.WorkerThreadCommand.html "class in zombie.network")> commandQ
  + ### freeRequests

    final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<zombie.network.ClientChunkRequest> freeRequests
  + ### cancelQ

    public final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> cancelQ
  + ### cancelled

    final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> cancelled
  + ### crcMaker

    final [CRC32](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/CRC32.html "class or interface in java.util.zip") crcMaker
  + ### inMemoryZip

    byte[] inMemoryZip
  + ### compressor

    final [Deflater](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/zip/Deflater.html "class or interface in java.util.zip") compressor
* Constructor Details
  -------------------

  + ### WorkerThread

    public WorkerThread()
* Method Details
  --------------

  + ### run

    public void run()

    Specified by:
    :   `run` in interface `Runnable`

    Overrides:
    :   `run` in class `Thread`
  + ### runInner

    private void runInner()
    throws [InterruptedException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/InterruptedException.html "class or interface in java.lang"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `InterruptedException`
    :   `IOException`
  + ### putCommand

    void putCommand([PlayerDownloadServer.EThreadCommand](PlayerDownloadServer.EThreadCommand.html "enum class in zombie.network") e,
    zombie.network.ClientChunkRequest ccr)
  + ### compressChunk

    public int compressChunk(zombie.network.ClientChunkRequest.Chunk chunk)
  + ### sendChunk

    private void sendChunk(zombie.network.ClientChunkRequest.Chunk chunk)
  + ### sendNotRequired

    private void sendNotRequired(int requestNumber,
    boolean sameOnServer)
  + ### sendLargeArea

    private void sendLargeArea(zombie.network.ClientChunkRequest ccr)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### sendArray

    private void sendArray(zombie.network.ClientChunkRequest ccr)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isRequestCancelled

    private boolean isRequestCancelled(int requestNumber)