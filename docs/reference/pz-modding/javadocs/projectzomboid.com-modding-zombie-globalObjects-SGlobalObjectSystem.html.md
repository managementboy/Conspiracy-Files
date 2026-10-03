[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [SGlobalObjectSystem](SGlobalObjectSystem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempTable](#tempTable)
   2. [loadedWorldVersion](#loadedWorldVersion)
   3. [modDataKeys](#modDataKeys)
   4. [objectModDataKeys](#objectModDataKeys)
   5. [objectSyncKeys](#objectSyncKeys)
6. [Constructor Details](#constructor-detail)
   1. [SGlobalObjectSystem(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [makeObject(int, int, int)](#makeObject(int,int,int))
   2. [setModDataKeys(KahluaTable)](#setModDataKeys(se.krka.kahlua.vm.KahluaTable))
   3. [setObjectModDataKeys(KahluaTable)](#setObjectModDataKeys(se.krka.kahlua.vm.KahluaTable))
   4. [setObjectSyncKeys(KahluaTable)](#setObjectSyncKeys(se.krka.kahlua.vm.KahluaTable))
   5. [update()](#update())
   6. [chunkLoaded(int, int)](#chunkLoaded(int,int))
   7. [sendCommand(String, KahluaTable)](#sendCommand(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   8. [receiveClientCommand(String, IsoPlayer, KahluaTable)](#receiveClientCommand(java.lang.String,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   9. [addGlobalObjectOnClient(SGlobalObject)](#addGlobalObjectOnClient(zombie.globalObjects.SGlobalObject))
   10. [removeGlobalObjectOnClient(SGlobalObject)](#removeGlobalObjectOnClient(zombie.globalObjects.SGlobalObject))
   11. [updateGlobalObjectOnClient(SGlobalObject)](#updateGlobalObjectOnClient(zombie.globalObjects.SGlobalObject))
   12. [getFileName()](#getFileName())
   13. [getInitialStateForClient()](#getInitialStateForClient())
   14. [OnIsoObjectChangedItself(IsoObject)](#OnIsoObjectChangedItself(zombie.iso.IsoObject))
   15. [OnModDataChangeItself(IsoObject)](#OnModDataChangeItself(zombie.iso.IsoObject))
   16. [loadedWorldVersion()](#loadedWorldVersion())
   17. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   18. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   19. [load()](#load())
   20. [save()](#save())
   21. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SGlobalObjectSystem
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.globalObjects.GlobalObjectSystem

zombie.globalObjects.SGlobalObjectSystem

---

public final class SGlobalObjectSystem
extends zombie.globalObjects.GlobalObjectSystem

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected int`

  `loadedWorldVersion`

  `protected final HashSet<String>`

  `modDataKeys`

  `protected final HashSet<String>`

  `objectModDataKeys`

  `protected final HashSet<String>`

  `objectSyncKeys`

  `private static se.krka.kahlua.vm.KahluaTable`

  `tempTable`

  ### Fields inherited from class zombie.globalObjects.GlobalObjectSystem

  `lookup, modData, name, objects`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SGlobalObjectSystem(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addGlobalObjectOnClient(SGlobalObject globalObject)`

  `void`

  `chunkLoaded(int wx,
  int wy)`

  `private String`

  `getFileName()`

  `se.krka.kahlua.vm.KahluaTable`

  `getInitialStateForClient()`

  `void`

  `load()`

  `void`

  `load(ByteBuffer bb,
  int worldVersion)`

  `int`

  `loadedWorldVersion()`

  `protected GlobalObject`

  `makeObject(int x,
  int y,
  int z)`

  `void`

  `OnIsoObjectChangedItself(IsoObject isoObject)`

  `void`

  `OnModDataChangeItself(IsoObject isoObject)`

  `void`

  `receiveClientCommand(String command,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `removeGlobalObjectOnClient(SGlobalObject globalObject)`

  `void`

  `Reset()`

  `void`

  `save()`

  `void`

  `save(ByteBuffer bb)`

  `void`

  `sendCommand(String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `setModDataKeys(se.krka.kahlua.vm.KahluaTable keys)`

  `void`

  `setObjectModDataKeys(se.krka.kahlua.vm.KahluaTable keys)`

  `void`

  `setObjectSyncKeys(se.krka.kahlua.vm.KahluaTable keys)`

  `void`

  `update()`

  `void`

  `updateGlobalObjectOnClient(SGlobalObject globalObject)`

  ### Methods inherited from class zombie.globalObjects.GlobalObjectSystem

  `allocList, finishedWithList, getModData, getName, getObjectAt, getObjectAt, getObjectByIndex, getObjectCount, getObjectsAdjacentTo, getObjectsInChunk, hasObjectsInChunk, newObject, removeObject`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempTable

    private static se.krka.kahlua.vm.KahluaTable tempTable
  + ### loadedWorldVersion

    protected int loadedWorldVersion
  + ### modDataKeys

    protected final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> modDataKeys
  + ### objectModDataKeys

    protected final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> objectModDataKeys
  + ### objectSyncKeys

    protected final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> objectSyncKeys
* Constructor Details
  -------------------

  + ### SGlobalObjectSystem

    public SGlobalObjectSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### makeObject

    protected [GlobalObject](GlobalObject.html "class in zombie.globalObjects") makeObject(int x,
    int y,
    int z)

    Specified by:
    :   `makeObject` in class `zombie.globalObjects.GlobalObjectSystem`
  + ### setModDataKeys

    public void setModDataKeys(se.krka.kahlua.vm.KahluaTable keys)
  + ### setObjectModDataKeys

    public void setObjectModDataKeys(se.krka.kahlua.vm.KahluaTable keys)
  + ### setObjectSyncKeys

    public void setObjectSyncKeys(se.krka.kahlua.vm.KahluaTable keys)
  + ### update

    public void update()
  + ### chunkLoaded

    public void chunkLoaded(int wx,
    int wy)
  + ### sendCommand

    public void sendCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### receiveClientCommand

    public void receiveClientCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable args)
  + ### addGlobalObjectOnClient

    public void addGlobalObjectOnClient([SGlobalObject](SGlobalObject.html "class in zombie.globalObjects") globalObject)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### removeGlobalObjectOnClient

    public void removeGlobalObjectOnClient([SGlobalObject](SGlobalObject.html "class in zombie.globalObjects") globalObject)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### updateGlobalObjectOnClient

    public void updateGlobalObjectOnClient([SGlobalObject](SGlobalObject.html "class in zombie.globalObjects") globalObject)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getFileName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileName()
  + ### getInitialStateForClient

    public se.krka.kahlua.vm.KahluaTable getInitialStateForClient()
  + ### OnIsoObjectChangedItself

    public void OnIsoObjectChangedItself([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### OnModDataChangeItself

    public void OnModDataChangeItself([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### loadedWorldVersion

    public int loadedWorldVersion()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load()
  + ### save

    public void save()
  + ### Reset

    public void Reset()

    Overrides:
    :   `Reset` in class `zombie.globalObjects.GlobalObjectSystem`