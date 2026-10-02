[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [MapObjects](MapObjects.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [onNew](#onNew)
   2. [onLoad](#onLoad)
   3. [tempObjects](#tempObjects)
   4. [params](#params)
7. [Constructor Details](#constructor-detail)
   1. [MapObjects()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getOnNew(String)](#getOnNew(java.lang.String))
   2. [OnNewWithSprite(String, LuaClosure, int)](#OnNewWithSprite(java.lang.String,se.krka.kahlua.vm.LuaClosure,int))
   3. [OnNewWithSprite(KahluaTable, LuaClosure, int)](#OnNewWithSprite(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.LuaClosure,int))
   4. [newGridSquare(IsoGridSquare)](#newGridSquare(zombie.iso.IsoGridSquare))
   5. [getOnLoad(String)](#getOnLoad(java.lang.String))
   6. [OnLoadWithSprite(String, LuaClosure, int)](#OnLoadWithSprite(java.lang.String,se.krka.kahlua.vm.LuaClosure,int))
   7. [OnLoadWithSprite(KahluaTable, LuaClosure, int)](#OnLoadWithSprite(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.LuaClosure,int))
   8. [loadGridSquare(IsoGridSquare)](#loadGridSquare(zombie.iso.IsoGridSquare))
   9. [debugNewSquare(int, int, int)](#debugNewSquare(int,int,int))
   10. [debugLoadSquare(int, int, int)](#debugLoadSquare(int,int,int))
   11. [debugLoadChunk(int, int)](#debugLoadChunk(int,int))
   12. [reroute(Prototype, LuaClosure)](#reroute(se.krka.kahlua.vm.Prototype,se.krka.kahlua.vm.LuaClosure))
   13. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MapObjects
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.MapObjects

---

public final class MapObjects
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `MapObjects.Callback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<String, MapObjects.Callback>`

  `onLoad`

  `private static final HashMap<String, MapObjects.Callback>`

  `onNew`

  `private static final Object[]`

  `params`

  `private static final ArrayList<IsoObject>`

  `tempObjects`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MapObjects()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `debugLoadChunk(int wx,
  int wy)`

  `static void`

  `debugLoadSquare(int x,
  int y,
  int z)`

  `static void`

  `debugNewSquare(int x,
  int y,
  int z)`

  `private static MapObjects.Callback`

  `getOnLoad(String spriteName)`

  `private static MapObjects.Callback`

  `getOnNew(String spriteName)`

  `static void`

  `loadGridSquare(IsoGridSquare square)`

  `static void`

  `newGridSquare(IsoGridSquare square)`

  `static void`

  `OnLoadWithSprite(String spriteName,
  se.krka.kahlua.vm.LuaClosure function,
  int priority)`

  `static void`

  `OnLoadWithSprite(se.krka.kahlua.vm.KahluaTable spriteNames,
  se.krka.kahlua.vm.LuaClosure function,
  int priority)`

  `static void`

  `OnNewWithSprite(String spriteName,
  se.krka.kahlua.vm.LuaClosure function,
  int priority)`

  `static void`

  `OnNewWithSprite(se.krka.kahlua.vm.KahluaTable spriteNames,
  se.krka.kahlua.vm.LuaClosure function,
  int priority)`

  `static void`

  `reroute(se.krka.kahlua.vm.Prototype prototype,
  se.krka.kahlua.vm.LuaClosure luaClosure)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### onNew

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [MapObjects.Callback](MapObjects.Callback.html "class in zombie.Lua")> onNew
  + ### onLoad

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [MapObjects.Callback](MapObjects.Callback.html "class in zombie.Lua")> onLoad
  + ### tempObjects

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")> tempObjects
  + ### params

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] params
* Constructor Details
  -------------------

  + ### MapObjects

    public MapObjects()
* Method Details
  --------------

  + ### getOnNew

    private static [MapObjects.Callback](MapObjects.Callback.html "class in zombie.Lua") getOnNew([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### OnNewWithSprite

    public static void OnNewWithSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    se.krka.kahlua.vm.LuaClosure function,
    int priority)
  + ### OnNewWithSprite

    public static void OnNewWithSprite(se.krka.kahlua.vm.KahluaTable spriteNames,
    se.krka.kahlua.vm.LuaClosure function,
    int priority)
  + ### newGridSquare

    public static void newGridSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getOnLoad

    private static [MapObjects.Callback](MapObjects.Callback.html "class in zombie.Lua") getOnLoad([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### OnLoadWithSprite

    public static void OnLoadWithSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    se.krka.kahlua.vm.LuaClosure function,
    int priority)
  + ### OnLoadWithSprite

    public static void OnLoadWithSprite(se.krka.kahlua.vm.KahluaTable spriteNames,
    se.krka.kahlua.vm.LuaClosure function,
    int priority)
  + ### loadGridSquare

    public static void loadGridSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### debugNewSquare

    public static void debugNewSquare(int x,
    int y,
    int z)
  + ### debugLoadSquare

    public static void debugLoadSquare(int x,
    int y,
    int z)
  + ### debugLoadChunk

    public static void debugLoadChunk(int wx,
    int wy)
  + ### reroute

    public static void reroute(se.krka.kahlua.vm.Prototype prototype,
    se.krka.kahlua.vm.LuaClosure luaClosure)
  + ### Reset

    public static void Reset()