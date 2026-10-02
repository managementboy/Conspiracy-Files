[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [SGlobalObjects](SGlobalObjects.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [systems](#systems)
6. [Constructor Details](#constructor-detail)
   1. [SGlobalObjects()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [noise(String)](#noise(java.lang.String))
   2. [registerSystem(String)](#registerSystem(java.lang.String))
   3. [newSystem(String)](#newSystem(java.lang.String))
   4. [getSystemCount()](#getSystemCount())
   5. [getSystemByIndex(int)](#getSystemByIndex(int))
   6. [getSystemByName(String)](#getSystemByName(java.lang.String))
   7. [update()](#update())
   8. [chunkLoaded(int, int)](#chunkLoaded(int,int))
   9. [initSystems()](#initSystems())
   10. [saveInitialStateForClient(ByteBufferWriter)](#saveInitialStateForClient(zombie.core.network.ByteBufferWriter))
   11. [receiveClientCommand(String, String, IsoPlayer, KahluaTable)](#receiveClientCommand(java.lang.String,java.lang.String,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   12. [load()](#load())
   13. [save()](#save())
   14. [OnIsoObjectChangedItself(String, IsoObject)](#OnIsoObjectChangedItself(java.lang.String,zombie.iso.IsoObject))
   15. [OnModDataChangeItself(String, IsoObject)](#OnModDataChangeItself(java.lang.String,zombie.iso.IsoObject))
   16. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SGlobalObjects
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.globalObjects.SGlobalObjects

---

public final class SGlobalObjects
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected static final ArrayList<SGlobalObjectSystem>`

  `systems`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SGlobalObjects()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `chunkLoaded(int wx,
  int wy)`

  `static SGlobalObjectSystem`

  `getSystemByIndex(int index)`

  `static SGlobalObjectSystem`

  `getSystemByName(String name)`

  `static int`

  `getSystemCount()`

  `static void`

  `initSystems()`

  `static void`

  `load()`

  `static SGlobalObjectSystem`

  `newSystem(String name)`

  `static void`

  `noise(String message)`

  `static void`

  `OnIsoObjectChangedItself(String systemName,
  IsoObject isoObject)`

  `static void`

  `OnModDataChangeItself(String systemName,
  IsoObject isoObject)`

  `static boolean`

  `receiveClientCommand(String systemName,
  String command,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable args)`

  `static SGlobalObjectSystem`

  `registerSystem(String name)`

  `static void`

  `Reset()`

  `static void`

  `save()`

  `static void`

  `saveInitialStateForClient(zombie.core.network.ByteBufferWriter bb)`

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### systems

    protected static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects")> systems
* Constructor Details
  -------------------

  + ### SGlobalObjects

    public SGlobalObjects()
* Method Details
  --------------

  + ### noise

    public static void noise([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### registerSystem

    public static [SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects") registerSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### newSystem

    public static [SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects") newSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
    throws [IllegalStateException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalStateException.html "class or interface in java.lang")

    Throws:
    :   `IllegalStateException`
  + ### getSystemCount

    public static int getSystemCount()
  + ### getSystemByIndex

    public static [SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects") getSystemByIndex(int index)
  + ### getSystemByName

    public static [SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects") getSystemByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### update

    public static void update()
  + ### chunkLoaded

    public static void chunkLoaded(int wx,
    int wy)
  + ### initSystems

    public static void initSystems()
  + ### saveInitialStateForClient

    public static void saveInitialStateForClient(zombie.core.network.ByteBufferWriter bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveClientCommand

    public static boolean receiveClientCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") systemName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable args)
  + ### load

    public static void load()
  + ### save

    public static void save()
  + ### OnIsoObjectChangedItself

    public static void OnIsoObjectChangedItself([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") systemName,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### OnModDataChangeItself

    public static void OnModDataChangeItself([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") systemName,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### Reset

    public static void Reset()