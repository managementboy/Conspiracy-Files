[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [CGlobalObjects](CGlobalObjects.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [systems](#systems)
   2. [initialState](#initialState)
6. [Constructor Details](#constructor-detail)
   1. [CGlobalObjects()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [noise(String)](#noise(java.lang.String))
   2. [registerSystem(String)](#registerSystem(java.lang.String))
   3. [newSystem(String)](#newSystem(java.lang.String))
   4. [getSystemCount()](#getSystemCount())
   5. [getSystemByIndex(int)](#getSystemByIndex(int))
   6. [getSystemByName(String)](#getSystemByName(java.lang.String))
   7. [initSystems()](#initSystems())
   8. [loadInitialState(ByteBufferReader)](#loadInitialState(zombie.core.network.ByteBufferReader))
   9. [receiveServerCommand(String, String, KahluaTable)](#receiveServerCommand(java.lang.String,java.lang.String,se.krka.kahlua.vm.KahluaTable))
   10. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CGlobalObjects
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.globalObjects.CGlobalObjects

---

public final class CGlobalObjects
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected static final HashMap<String, se.krka.kahlua.vm.KahluaTable>`

  `initialState`

  `protected static final ArrayList<CGlobalObjectSystem>`

  `systems`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CGlobalObjects()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CGlobalObjectSystem`

  `getSystemByIndex(int index)`

  `static CGlobalObjectSystem`

  `getSystemByName(String name)`

  `static int`

  `getSystemCount()`

  `static void`

  `initSystems()`

  `static void`

  `loadInitialState(zombie.core.network.ByteBufferReader bb)`

  `static CGlobalObjectSystem`

  `newSystem(String name)`

  `static void`

  `noise(String message)`

  `static boolean`

  `receiveServerCommand(String systemName,
  String command,
  se.krka.kahlua.vm.KahluaTable args)`

  `static CGlobalObjectSystem`

  `registerSystem(String name)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### systems

    protected static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CGlobalObjectSystem](CGlobalObjectSystem.html "class in zombie.globalObjects")> systems
  + ### initialState

    protected static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), se.krka.kahlua.vm.KahluaTable> initialState
* Constructor Details
  -------------------

  + ### CGlobalObjects

    public CGlobalObjects()
* Method Details
  --------------

  + ### noise

    public static void noise([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### registerSystem

    public static [CGlobalObjectSystem](CGlobalObjectSystem.html "class in zombie.globalObjects") registerSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### newSystem

    public static [CGlobalObjectSystem](CGlobalObjectSystem.html "class in zombie.globalObjects") newSystem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
    throws [IllegalStateException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalStateException.html "class or interface in java.lang")

    Throws:
    :   `IllegalStateException`
  + ### getSystemCount

    public static int getSystemCount()
  + ### getSystemByIndex

    public static [CGlobalObjectSystem](CGlobalObjectSystem.html "class in zombie.globalObjects") getSystemByIndex(int index)
  + ### getSystemByName

    public static [CGlobalObjectSystem](CGlobalObjectSystem.html "class in zombie.globalObjects") getSystemByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### initSystems

    public static void initSystems()
  + ### loadInitialState

    public static void loadInitialState(zombie.core.network.ByteBufferReader bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveServerCommand

    public static boolean receiveServerCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") systemName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    se.krka.kahlua.vm.KahluaTable args)
  + ### Reset

    public static void Reset()