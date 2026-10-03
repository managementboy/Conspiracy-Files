[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.spnetwork](package-summary.html)
2. [SinglePlayerServer](SinglePlayerServer.html)
3. [UdpEngineServer](SinglePlayerServer.UdpEngineServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [connections](#connections)
6. [Constructor Details](#constructor-detail)
   1. [UdpEngineServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Send(ByteBuffer)](#Send(java.nio.ByteBuffer))
   2. [Receive(ByteBuffer)](#Receive(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SinglePlayerServer.UdpEngineServer
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.spnetwork.UdpEngine

zombie.spnetwork.SinglePlayerServer.UdpEngineServer

Enclosing class:
:   `SinglePlayerServer`

---

public static final class SinglePlayerServer.UdpEngineServer
extends zombie.spnetwork.UdpEngine

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<zombie.spnetwork.UdpConnection>`

  `connections`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UdpEngineServer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Receive(ByteBuffer bb)`

  `void`

  `Send(ByteBuffer bb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### connections

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.spnetwork.UdpConnection> connections
* Constructor Details
  -------------------

  + ### UdpEngineServer

    UdpEngineServer()
* Method Details
  --------------

  + ### Send

    public void Send([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)

    Specified by:
    :   `Send` in class `zombie.spnetwork.UdpEngine`
  + ### Receive

    public void Receive([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)

    Specified by:
    :   `Receive` in class `zombie.spnetwork.UdpEngine`