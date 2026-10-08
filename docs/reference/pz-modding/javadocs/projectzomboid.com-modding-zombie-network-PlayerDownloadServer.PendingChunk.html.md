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
3. [PendingChunk](PlayerDownloadServer.PendingChunk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [wx](#wx)
   2. [wy](#wy)
   3. [firstRequestedMs](#firstRequestedMs)
   4. [requestNumbers](#requestNumbers)
6. [Constructor Details](#constructor-detail)
   1. [PendingChunk(int, int, long)](#%3Cinit%3E(int,int,long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PlayerDownloadServer.PendingChunk
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.PlayerDownloadServer.PendingChunk

Enclosing class:
:   `PlayerDownloadServer`

---

private static final class PlayerDownloadServer.PendingChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final long`

  `firstRequestedMs`

  `(package private) final List<Integer>`

  `requestNumbers`

  `(package private) final int`

  `wx`

  `(package private) final int`

  `wy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PendingChunk(int wx,
  int wy,
  long firstRequestedMs)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### wx

    final int wx
  + ### wy

    final int wy
  + ### firstRequestedMs

    final long firstRequestedMs
  + ### requestNumbers

    final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> requestNumbers
* Constructor Details
  -------------------

  + ### PendingChunk

    PendingChunk(int wx,
    int wy,
    long firstRequestedMs)