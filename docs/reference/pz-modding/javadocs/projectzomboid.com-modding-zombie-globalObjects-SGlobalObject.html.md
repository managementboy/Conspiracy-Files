[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.globalObjects](package-summary.html)
2. [SGlobalObject](SGlobalObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempTable](#tempTable)
6. [Constructor Details](#constructor-detail)
   1. [SGlobalObject(SGlobalObjectSystem, int, int, int)](#%3Cinit%3E(zombie.globalObjects.SGlobalObjectSystem,int,int,int))
7. [Method Details](#method-detail)
   1. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   2. [save(ByteBuffer)](#save(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SGlobalObject
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.globalObjects.GlobalObject](GlobalObject.html "class in zombie.globalObjects")

zombie.globalObjects.SGlobalObject

---

public final class SGlobalObject
extends [GlobalObject](GlobalObject.html "class in zombie.globalObjects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static se.krka.kahlua.vm.KahluaTable`

  `tempTable`

  ### Fields inherited from class [GlobalObject](GlobalObject.html#field-summary "class in zombie.globalObjects")

  `modData, system, x, y, z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SGlobalObject(SGlobalObjectSystem system,
  int x,
  int y,
  int z)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `load(ByteBuffer bb,
  int worldVersion)`

  `void`

  `save(ByteBuffer bb)`

  ### Methods inherited from class [GlobalObject](GlobalObject.html#method-summary "class in zombie.globalObjects")

  `destroyThisObject, getIsoObject, getModData, getSquare, getSystem, getX, getY, getZ, isValidIsoObject, Reset, setLocation`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempTable

    private static se.krka.kahlua.vm.KahluaTable tempTable
* Constructor Details
  -------------------

  + ### SGlobalObject

    SGlobalObject([SGlobalObjectSystem](SGlobalObjectSystem.html "class in zombie.globalObjects") system,
    int x,
    int y,
    int z)
* Method Details
  --------------

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