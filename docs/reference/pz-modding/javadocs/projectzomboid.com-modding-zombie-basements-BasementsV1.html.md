[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.basements](package-summary.html)
2. [BasementsV1](BasementsV1.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [BasementsV1()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [addAccessDefinitions(String, KahluaTable)](#addAccessDefinitions(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   2. [addBasementDefinitions(String, KahluaTable)](#addBasementDefinitions(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   3. [addSpawnLocations(String, KahluaTable)](#addSpawnLocations(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   4. [registerBasementSpawnLocation(String, String, String, int, int, int, int, int, KahluaTable)](#registerBasementSpawnLocation(java.lang.String,java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BasementsV1
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.basements.BasementsV1

---

public class BasementsV1
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BasementsV1()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAccessDefinitions(String mapID,
  se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `addBasementDefinitions(String mapID,
  se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `addSpawnLocations(String mapID,
  se.krka.kahlua.vm.KahluaTable table)`

  `zombie.basements.BasementSpawnLocation`

  `registerBasementSpawnLocation(String mapID,
  String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### BasementsV1

    public BasementsV1()
* Method Details
  --------------

  + ### addAccessDefinitions

    public void addAccessDefinitions([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    se.krka.kahlua.vm.KahluaTable table)
  + ### addBasementDefinitions

    public void addBasementDefinitions([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    se.krka.kahlua.vm.KahluaTable table)
  + ### addSpawnLocations

    public void addSpawnLocations([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    se.krka.kahlua.vm.KahluaTable table)
  + ### registerBasementSpawnLocation

    public zombie.basements.BasementSpawnLocation registerBasementSpawnLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)