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
3. [ChunkGetter](IsoChunk.ChunkGetter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [chunk](#chunk)
6. [Constructor Details](#constructor-detail)
   1. [ChunkGetter()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getGridSquare(int, int, int)](#getGridSquare(int,int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoChunk.ChunkGetter
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoChunk.ChunkGetter

All Implemented Interfaces:
:   `IsoGridSquare.GetSquare`

Enclosing class:
:   `IsoChunk`

---

private static class IsoChunk.ChunkGetter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IsoGridSquare.GetSquare](IsoGridSquare.GetSquare.html "interface in zombie.iso")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoChunk`

  `chunk`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ChunkGetter()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoGridSquare`

  `getGridSquare(int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### chunk

    private [IsoChunk](IsoChunk.html "class in zombie.iso") chunk
* Constructor Details
  -------------------

  + ### ChunkGetter

    private ChunkGetter()
* Method Details
  --------------

  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare(int x,
    int y,
    int z)

    Specified by:
    :   `getGridSquare` in interface `IsoGridSquare.GetSquare`