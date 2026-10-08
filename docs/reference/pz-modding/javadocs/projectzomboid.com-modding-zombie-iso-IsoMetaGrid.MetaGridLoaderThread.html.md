[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMetaGrid](IsoMetaGrid.html)
3. [MetaGridLoaderThread](IsoMetaGrid.MetaGridLoaderThread.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [sharedStrings](#sharedStrings)
   2. [roomList](#roomList)
   3. [tempRooms](#tempRooms)
   4. [wY](#wY)
   5. [zombieIntensity](#zombieIntensity)
   6. [currentFile](#currentFile)
7. [Constructor Details](#constructor-detail)
   1. [MetaGridLoaderThread(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [run()](#run())
   2. [runInner()](#runInner())
   3. [loadCell(int, int)](#loadCell(int,int))
   4. [loadCell(MapFiles, int, int)](#loadCell(zombie.iso.MapFiles,int,int))
   5. [postLoad()](#postLoad())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMetaGrid.MetaGridLoaderThread
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang")

zombie.iso.IsoMetaGrid.MetaGridLoaderThread

All Implemented Interfaces:
:   `Runnable`

Enclosing class:
:   `IsoMetaGrid`

---

private final class IsoMetaGrid.MetaGridLoaderThread
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

  `(package private) String`

  `currentFile`

  `(package private) final ArrayList<RoomDef>`

  `roomList`

  `(package private) final zombie.util.SharedStrings`

  `sharedStrings`

  `(package private) final ArrayList<RoomDef>`

  `tempRooms`

  `(package private) int`

  `wY`

  `(package private) final byte[]`

  `zombieIntensity`

  ### Fields inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#field-summary "class or interface in java.lang")

  `MAX_PRIORITY, MIN_PRIORITY, NORM_PRIORITY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MetaGridLoaderThread(int wy)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `loadCell(int wX,
  int wY)`

  `(package private) void`

  `loadCell(zombie.iso.MapFiles mapFiles,
  int wX,
  int wY)`

  `(package private) void`

  `postLoad()`

  `void`

  `run()`

  `(package private) void`

  `runInner()`

  ### Methods inherited from class [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html#method-summary "class or interface in java.lang")

  `activeCount, checkAccess, clone, currentThread, dumpStack, enumerate, getAllStackTraces, getContextClassLoader, getDefaultUncaughtExceptionHandler, getId, getName, getPriority, getStackTrace, getState, getThreadGroup, getUncaughtExceptionHandler, holdsLock, interrupt, interrupted, isAlive, isDaemon, isInterrupted, isVirtual, join, join, join, join, ofPlatform, ofVirtual, onSpinWait, setContextClassLoader, setDaemon, setDefaultUncaughtExceptionHandler, setName, setPriority, setUncaughtExceptionHandler, sleep, sleep, sleep, start, startVirtualThread, stop, threadId, toString, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### sharedStrings

    final zombie.util.SharedStrings sharedStrings
  + ### roomList

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> roomList
  + ### tempRooms

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> tempRooms
  + ### wY

    int wY
  + ### zombieIntensity

    final byte[] zombieIntensity
  + ### currentFile

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentFile
* Constructor Details
  -------------------

  + ### MetaGridLoaderThread

    MetaGridLoaderThread(int wy)
* Method Details
  --------------

  + ### run

    public void run()

    Specified by:
    :   `run` in interface `Runnable`

    Overrides:
    :   `run` in class `Thread`
  + ### runInner

    void runInner()
  + ### loadCell

    void loadCell(int wX,
    int wY)
  + ### loadCell

    void loadCell(zombie.iso.MapFiles mapFiles,
    int wX,
    int wY)
  + ### postLoad

    void postLoad()