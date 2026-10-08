[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoChunk](IsoChunk.html)
3. [ChunkLock](IsoChunk.ChunkLock.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [wx](#wx)
   2. [wy](#wy)
   3. [count](#count)
   4. [rw](#rw)
6. [Constructor Details](#constructor-detail)
   1. [ChunkLock(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [set(int, int)](#set(int,int))
   2. [ref()](#ref())
   3. [deref()](#deref())
   4. [lockForReading()](#lockForReading())
   5. [unlockForReading()](#unlockForReading())
   6. [lockForWriting()](#lockForWriting())
   7. [unlockForWriting()](#unlockForWriting())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoChunk.ChunkLock
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoChunk.ChunkLock

Enclosing class:
:   `IsoChunk`

---

private static class IsoChunk.ChunkLock
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `count`

  `ReentrantReadWriteLock`

  `rw`

  `int`

  `wx`

  `int`

  `wy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ChunkLock(int wx,
  int wy)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `deref()`

  `void`

  `lockForReading()`

  `void`

  `lockForWriting()`

  `IsoChunk.ChunkLock`

  `ref()`

  `IsoChunk.ChunkLock`

  `set(int wx,
  int wy)`

  `void`

  `unlockForReading()`

  `void`

  `unlockForWriting()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### wx

    public int wx
  + ### wy

    public int wy
  + ### count

    public int count
  + ### rw

    public [ReentrantReadWriteLock](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/locks/ReentrantReadWriteLock.html "class or interface in java.util.concurrent.locks") rw
* Constructor Details
  -------------------

  + ### ChunkLock

    public ChunkLock(int wx,
    int wy)
* Method Details
  --------------

  + ### set

    public [IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso") set(int wx,
    int wy)
  + ### ref

    public [IsoChunk.ChunkLock](IsoChunk.ChunkLock.html "class in zombie.iso") ref()
  + ### deref

    public int deref()
  + ### lockForReading

    public void lockForReading()
  + ### unlockForReading

    public void unlockForReading()
  + ### lockForWriting

    public void lockForWriting()
  + ### unlockForWriting

    public void unlockForWriting()