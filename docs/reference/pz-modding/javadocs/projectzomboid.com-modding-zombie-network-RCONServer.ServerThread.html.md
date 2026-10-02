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
3. [ServerThread](RCONServer.ServerThread.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [connections](#connections)
   2. [quit](#quit)
7. [Constructor Details](#constructor-detail)
   1. [ServerThread()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [run()](#run())
   2. [runInner()](#runInner())
   3. [quit()](#quit())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RCONServer.ServerThread
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang")

zombie.network.RCONServer.ServerThread

All Implemented Interfaces:
:   `Runnable`

Enclosing class:
:   `RCONServer`

---

private class RCONServer.ServerThread
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

  `private final ArrayList<RCONServer.ClientThread>`

  `connections`

  `boolean`

  `quit`

  ### Fields inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#field-summary "class or interface in java.lang")

  `MAX_PRIORITY, MIN_PRIORITY, NORM_PRIORITY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ServerThread()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

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

  + ### connections

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RCONServer.ClientThread](RCONServer.ClientThread.html "class in zombie.network")> connections
  + ### quit

    public boolean quit
* Constructor Details
  -------------------

  + ### ServerThread

    public ServerThread()
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
  + ### quit

    public void quit()