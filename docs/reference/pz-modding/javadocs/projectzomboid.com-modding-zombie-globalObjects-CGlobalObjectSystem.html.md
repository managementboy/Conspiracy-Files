[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [CGlobalObjectSystem](CGlobalObjectSystem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [CGlobalObjectSystem(String)](#%3Cinit%3E(java.lang.String))
6. [Method Details](#method-detail)
   1. [makeObject(int, int, int)](#makeObject(int,int,int))
   2. [sendCommand(String, IsoPlayer, KahluaTable)](#sendCommand(java.lang.String,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   3. [receiveServerCommand(String, KahluaTable)](#receiveServerCommand(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   4. [receiveNewLuaObjectAt(int, int, int, KahluaTable)](#receiveNewLuaObjectAt(int,int,int,se.krka.kahlua.vm.KahluaTable))
   5. [receiveRemoveLuaObjectAt(int, int, int)](#receiveRemoveLuaObjectAt(int,int,int))
   6. [receiveUpdateLuaObjectAt(int, int, int, KahluaTable)](#receiveUpdateLuaObjectAt(int,int,int,se.krka.kahlua.vm.KahluaTable))
   7. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CGlobalObjectSystem
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.globalObjects.GlobalObjectSystem

zombie.globalObjects.CGlobalObjectSystem

---

public final class CGlobalObjectSystem
extends zombie.globalObjects.GlobalObjectSystem

* Field Summary
  -------------

  ### Fields inherited from class zombie.globalObjects.GlobalObjectSystem

  `lookup, modData, name, objects`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CGlobalObjectSystem(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected GlobalObject`

  `makeObject(int x,
  int y,
  int z)`

  `void`

  `receiveNewLuaObjectAt(int x,
  int y,
  int z,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `receiveRemoveLuaObjectAt(int x,
  int y,
  int z)`

  `void`

  `receiveServerCommand(String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `receiveUpdateLuaObjectAt(int x,
  int y,
  int z,
  se.krka.kahlua.vm.KahluaTable args)`

  `void`

  `Reset()`

  `void`

  `sendCommand(String command,
  IsoPlayer player,
  se.krka.kahlua.vm.KahluaTable args)`

  ### Methods inherited from class zombie.globalObjects.GlobalObjectSystem

  `allocList, finishedWithList, getModData, getName, getObjectAt, getObjectAt, getObjectByIndex, getObjectCount, getObjectsAdjacentTo, getObjectsInChunk, hasObjectsInChunk, newObject, removeObject`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### CGlobalObjectSystem

    public CGlobalObjectSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### makeObject

    protected [GlobalObject](GlobalObject.html "class in zombie.globalObjects") makeObject(int x,
    int y,
    int z)

    Specified by:
    :   `makeObject` in class `zombie.globalObjects.GlobalObjectSystem`
  + ### sendCommand

    public void sendCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    se.krka.kahlua.vm.KahluaTable args)
  + ### receiveServerCommand

    public void receiveServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### receiveNewLuaObjectAt

    public void receiveNewLuaObjectAt(int x,
    int y,
    int z,
    se.krka.kahlua.vm.KahluaTable args)
  + ### receiveRemoveLuaObjectAt

    public void receiveRemoveLuaObjectAt(int x,
    int y,
    int z)
  + ### receiveUpdateLuaObjectAt

    public void receiveUpdateLuaObjectAt(int x,
    int y,
    int z,
    se.krka.kahlua.vm.KahluaTable args)
  + ### Reset

    public void Reset()

    Overrides:
    :   `Reset` in class `zombie.globalObjects.GlobalObjectSystem`