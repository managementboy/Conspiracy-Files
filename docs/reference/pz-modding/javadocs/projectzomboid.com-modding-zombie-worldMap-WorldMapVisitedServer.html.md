[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.worldMap](package-summary.html)
2. [WorldMapVisitedServer](WorldMapVisitedServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [dictionary](#dictionary)
6. [Constructor Details](#constructor-detail)
   1. [WorldMapVisitedServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [init()](#init())
   3. [update()](#update())
   4. [setKnownInSquares(IsoPlayer, int, int, int, int)](#setKnownInSquares(zombie.characters.IsoPlayer,int,int,int,int))
   5. [forget(IsoPlayer)](#forget(zombie.characters.IsoPlayer))
   6. [loadUser(IConnection)](#loadUser(zombie.network.IConnection))
   7. [sendRequestData(IConnection, ByteBufferWriter)](#sendRequestData(zombie.network.IConnection,zombie.core.network.ByteBufferWriter))
   8. [saveUser(String)](#saveUser(java.lang.String))
   9. [unloadUser(String)](#unloadUser(java.lang.String))
   10. [deleteUser(String)](#deleteUser(java.lang.String))
   11. [save()](#save())
   12. [getFolderName()](#getFolderName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMapVisitedServer
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.worldMap.WorldMapVisitedServer

---

public class WorldMapVisitedServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<String,byte[]>`

  `dictionary`

  `private static WorldMapVisitedServer`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldMapVisitedServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `deleteUser(String user)`

  `void`

  `forget(IsoPlayer player)`

  `private String`

  `getFolderName()`

  `static WorldMapVisitedServer`

  `getInstance()`

  `private void`

  `init()`

  `void`

  `loadUser(zombie.network.IConnection connection)`

  `void`

  `save()`

  `private void`

  `saveUser(String user)`

  `void`

  `sendRequestData(zombie.network.IConnection connection,
  zombie.core.network.ByteBufferWriter b)`

  `void`

  `setKnownInSquares(IsoPlayer player,
  int minX,
  int minY,
  int maxX,
  int maxY)`

  `void`

  `unloadUser(String user)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [WorldMapVisitedServer](WorldMapVisitedServer.html "class in zombie.worldMap") instance
  + ### dictionary

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),byte[]> dictionary
* Constructor Details
  -------------------

  + ### WorldMapVisitedServer

    public WorldMapVisitedServer()
* Method Details
  --------------

  + ### getInstance

    public static [WorldMapVisitedServer](WorldMapVisitedServer.html "class in zombie.worldMap") getInstance()
  + ### init

    private void init()
  + ### update

    public void update()
  + ### setKnownInSquares

    public void setKnownInSquares([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int minX,
    int minY,
    int maxX,
    int maxY)
  + ### forget

    public void forget([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### loadUser

    public void loadUser(zombie.network.IConnection connection)
  + ### sendRequestData

    public void sendRequestData(zombie.network.IConnection connection,
    zombie.core.network.ByteBufferWriter b)
  + ### saveUser

    private void saveUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user)
  + ### unloadUser

    public void unloadUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user)
  + ### deleteUser

    public void deleteUser([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") user)
  + ### save

    public void save()
  + ### getFolderName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFolderName()