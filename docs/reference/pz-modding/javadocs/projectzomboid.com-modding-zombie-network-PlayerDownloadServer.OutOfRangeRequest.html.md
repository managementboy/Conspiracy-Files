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
3. [OutOfRangeRequest](PlayerDownloadServer.OutOfRangeRequest.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [request](#request)
   2. [receivedMs](#receivedMs)
6. [Constructor Details](#constructor-detail)
   1. [OutOfRangeRequest(PlayerDownloadServer.QueuedRequest, long)](#%3Cinit%3E(zombie.network.PlayerDownloadServer.QueuedRequest,long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PlayerDownloadServer.OutOfRangeRequest
============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.PlayerDownloadServer.OutOfRangeRequest

Enclosing class:
:   `PlayerDownloadServer`

---

private static final class PlayerDownloadServer.OutOfRangeRequest
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final long`

  `receivedMs`

  `(package private) final PlayerDownloadServer.QueuedRequest`

  `request`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OutOfRangeRequest(PlayerDownloadServer.QueuedRequest request,
  long receivedMs)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### request

    final [PlayerDownloadServer.QueuedRequest](PlayerDownloadServer.QueuedRequest.html "class in zombie.network") request
  + ### receivedMs

    final long receivedMs
* Constructor Details
  -------------------

  + ### OutOfRangeRequest

    OutOfRangeRequest([PlayerDownloadServer.QueuedRequest](PlayerDownloadServer.QueuedRequest.html "class in zombie.network") request,
    long receivedMs)