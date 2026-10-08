[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [RCONServer](RCONServer.html)
3. [ClientThread](RCONServer.ClientThread.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [socket](#socket)
   2. [auth](#auth)
   3. [quit](#quit)
   4. [password](#password)
   5. [in](#in)
   6. [out](#out)
   7. [toThread](#toThread)
   8. [pendingCommands](#pendingCommands)
7. [Constructor Details](#constructor-detail)
   1. [ClientThread(Socket, String)](#%3Cinit%3E(java.net.Socket,java.lang.String))
8. [Method Details](#method-detail)
   1. [run()](#run())
   2. [runInner()](#runInner())
   3. [handlePacket(int, int, String)](#handlePacket(int,int,java.lang.String))
   4. [handleResponse(RCONServer.ExecCommand)](#handleResponse(zombie.network.RCONServer.ExecCommand))
   5. [checkAuth()](#checkAuth())
   6. [quit()](#quit())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RCONServer.ClientThread
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang")

zombie.network.RCONServer.ClientThread

All Implemented Interfaces:
:   `Runnable`

Enclosing class:
:   `RCONServer`

---

private static class RCONServer.ClientThread
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

  `boolean`

  `auth`

  `private InputStream`

  `in`

  `private OutputStream`

  `out`

  `private final String`

  `password`

  `private int`

  `pendingCommands`

  `boolean`

  `quit`

  `Socket`

  `socket`

  `private final ConcurrentLinkedQueue<RCONServer.ExecCommand>`

  `toThread`

  ### Fields inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#field-summary "class or interface in java.lang")

  `MAX_PRIORITY, MIN_PRIORITY, NORM_PRIORITY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClientThread(Socket socket,
  String password)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `checkAuth()`

  `private void`

  `handlePacket(int id,
  int type,
  String body)`

  `void`

  `handleResponse(RCONServer.ExecCommand command)`

  `void`

  `quit()`

  `void`

  `run()`

  `private void`

  `runInner()`

  ### Methods inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#method-summary "class or interface in java.lang")

  `activeCount, checkAccess, clone, currentThread, dumpStack, enumerate, getAllStackTraces, getContextClassLoader, getDefaultUncaughtExceptionHandler, getId, getName, getPriority, getStackTrace, getState, getThreadGroup, getUncaughtExceptionHandler, holdsLock, interrupt, interrupted, isAlive, isDaemon, isInterrupted, isVirtual, join, join, join, join, ofPlatform, ofVirtual, onSpinWait, setContextClassLoader, setDaemon, setDefaultUncaughtExceptionHandler, setName, setPriority, setUncaughtExceptionHandler, sleep, sleep, sleep, start, startVirtualThread, stop, threadId, toString, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### socket

    public [Socket](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/Socket.html "class or interface in java.net") socket
  + ### auth

    public boolean auth
  + ### quit

    public boolean quit
  + ### password

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password
  + ### in

    private [InputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/InputStream.html "class or interface in java.io") in
  + ### out

    private [OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io") out
  + ### toThread

    private final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[RCONServer.ExecCommand](RCONServer.ExecCommand.html "class in zombie.network")> toThread
  + ### pendingCommands

    private int pendingCommands
* Constructor Details
  -------------------

  + ### ClientThread

    public ClientThread([Socket](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/Socket.html "class or interface in java.net") socket,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password)
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
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### handlePacket

    private void handlePacket(int id,
    int type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### handleResponse

    public void handleResponse([RCONServer.ExecCommand](RCONServer.ExecCommand.html "class in zombie.network") command)
  + ### checkAuth

    private boolean checkAuth()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### quit

    public void quit()