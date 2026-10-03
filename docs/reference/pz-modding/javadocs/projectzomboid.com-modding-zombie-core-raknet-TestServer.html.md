[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.raknet](package-summary.html)
2. [TestServer](TestServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [server](#server)
   2. [buf](#buf)
6. [Constructor Details](#constructor-detail)
   1. [TestServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [main(String[])](#main(java.lang.String%5B%5D))
   2. [decode(ByteBuffer)](#decode(java.nio.ByteBuffer))
   3. [Receive()](#Receive())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class TestServer
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.raknet.TestServer

---

public class TestServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static ByteBuffer`

  `buf`

  `(package private) static zombie.core.raknet.RakNetPeerInterface`

  `server`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TestServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `decode(ByteBuffer buf)`

  `(package private) static void`

  `main(String[] args)`

  `static ByteBuffer`

  `Receive()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### server

    static zombie.core.raknet.RakNetPeerInterface server
  + ### buf

    static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buf
* Constructor Details
  -------------------

  + ### TestServer

    public TestServer()
* Method Details
  --------------

  + ### main

    static void main([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args)
  + ### decode

    private static void decode([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buf)
  + ### Receive

    public static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") Receive()