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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SERVERDATA\_RESPONSE\_VALUE](#SERVERDATA_RESPONSE_VALUE)
   2. [SERVERDATA\_AUTH\_RESPONSE](#SERVERDATA_AUTH_RESPONSE)
   3. [SERVERDATA\_EXECCOMMAND](#SERVERDATA_EXECCOMMAND)
   4. [SERVERDATA\_AUTH](#SERVERDATA_AUTH)
   5. [instance](#instance)
   6. [welcomeSocket](#welcomeSocket)
   7. [thread](#thread)
   8. [password](#password)
   9. [MAX\_PACKET\_SIZE](#MAX_PACKET_SIZE)
   10. [toMain](#toMain)
7. [Constructor Details](#constructor-detail)
   1. [RCONServer(int, String, boolean)](#%3Cinit%3E(int,java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [updateMain()](#updateMain())
   2. [quit()](#quit())
   3. [init(int, String, boolean)](#init(int,java.lang.String,boolean))
   4. [update()](#update())
   5. [shutdown()](#shutdown())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RCONServer
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.RCONServer

---

public class RCONServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `RCONServer.ClientThread`

  `private static class`

  `RCONServer.ExecCommand`

  `private class`

  `RCONServer.ServerThread`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static RCONServer`

  `instance`

  `private static final int`

  `MAX_PACKET_SIZE`

  `private final String`

  `password`

  `static final int`

  `SERVERDATA_AUTH`

  `static final int`

  `SERVERDATA_AUTH_RESPONSE`

  `static final int`

  `SERVERDATA_EXECCOMMAND`

  `static final int`

  `SERVERDATA_RESPONSE_VALUE`

  `private RCONServer.ServerThread`

  `thread`

  `private final ConcurrentLinkedQueue<RCONServer.ExecCommand>`

  `toMain`

  `private ServerSocket`

  `welcomeSocket`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RCONServer(int port,
  String password,
  boolean isLocal)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `init(int port,
  String password,
  boolean isLocal)`

  `void`

  `quit()`

  `static void`

  `shutdown()`

  `static void`

  `update()`

  `private void`

  `updateMain()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SERVERDATA\_RESPONSE\_VALUE

    public static final int SERVERDATA\_RESPONSE\_VALUE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.RCONServer.SERVERDATA_RESPONSE_VALUE)
  + ### SERVERDATA\_AUTH\_RESPONSE

    public static final int SERVERDATA\_AUTH\_RESPONSE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.RCONServer.SERVERDATA_AUTH_RESPONSE)
  + ### SERVERDATA\_EXECCOMMAND

    public static final int SERVERDATA\_EXECCOMMAND

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.RCONServer.SERVERDATA_EXECCOMMAND)
  + ### SERVERDATA\_AUTH

    public static final int SERVERDATA\_AUTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.RCONServer.SERVERDATA_AUTH)
  + ### instance

    private static [RCONServer](RCONServer.html "class in zombie.network") instance
  + ### welcomeSocket

    private [ServerSocket](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/ServerSocket.html "class or interface in java.net") welcomeSocket
  + ### thread

    private [RCONServer.ServerThread](RCONServer.ServerThread.html "class in zombie.network") thread
  + ### password

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password
  + ### MAX\_PACKET\_SIZE

    private static final int MAX\_PACKET\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.RCONServer.MAX_PACKET_SIZE)
  + ### toMain

    private final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[RCONServer.ExecCommand](RCONServer.ExecCommand.html "class in zombie.network")> toMain
* Constructor Details
  -------------------

  + ### RCONServer

    private RCONServer(int port,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password,
    boolean isLocal)
* Method Details
  --------------

  + ### updateMain

    private void updateMain()
  + ### quit

    public void quit()
  + ### init

    public static void init(int port,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") password,
    boolean isLocal)
  + ### update

    public static void update()
  + ### shutdown

    public static void shutdown()