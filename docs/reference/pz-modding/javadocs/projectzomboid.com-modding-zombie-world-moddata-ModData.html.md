[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.world.moddata](package-summary.html)
2. [ModData](ModData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [temp\_list](#temp_list)
6. [Constructor Details](#constructor-detail)
   1. [ModData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getTableNames()](#getTableNames())
   2. [exists(String)](#exists(java.lang.String))
   3. [getOrCreate(String)](#getOrCreate(java.lang.String))
   4. [get(String)](#get(java.lang.String))
   5. [create()](#create())
   6. [create(String)](#create(java.lang.String))
   7. [remove(String)](#remove(java.lang.String))
   8. [add(String, KahluaTable)](#add(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   9. [transmit(String)](#transmit(java.lang.String))
   10. [request(String)](#request(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ModData
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.world.moddata.ModData

---

public final class ModData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<String>`

  `temp_list`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ModData()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `add(String tag,
  se.krka.kahlua.vm.KahluaTable table)`

  `static String`

  `create()`

  `static se.krka.kahlua.vm.KahluaTable`

  `create(String tag)`

  `static boolean`

  `exists(String tag)`

  `static se.krka.kahlua.vm.KahluaTable`

  `get(String tag)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getOrCreate(String tag)`

  `static ArrayList<String>`

  `getTableNames()`

  `static se.krka.kahlua.vm.KahluaTable`

  `remove(String tag)`

  `static void`

  `request(String tag)`

  `static void`

  `transmit(String tag)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### temp\_list

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> temp\_list
* Constructor Details
  -------------------

  + ### ModData

    public ModData()
* Method Details
  --------------

  + ### getTableNames

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTableNames()
  + ### exists

    public static boolean exists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### getOrCreate

    public static se.krka.kahlua.vm.KahluaTable getOrCreate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### get

    public static se.krka.kahlua.vm.KahluaTable get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### create

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") create()
  + ### create

    public static se.krka.kahlua.vm.KahluaTable create([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### remove

    public static se.krka.kahlua.vm.KahluaTable remove([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### add

    public static void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    se.krka.kahlua.vm.KahluaTable table)
  + ### transmit

    public static void transmit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### request

    public static void request([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)