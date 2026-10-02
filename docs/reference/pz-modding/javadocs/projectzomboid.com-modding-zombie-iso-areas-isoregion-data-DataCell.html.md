[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion.data](package-summary.html)
2. [DataCell](DataCell.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dataRoot](#dataRoot)
   2. [dataChunks](#dataChunks)
6. [Constructor Details](#constructor-detail)
   1. [DataCell(DataRoot)](#%3Cinit%3E(zombie.iso.areas.isoregion.data.DataRoot))
7. [Method Details](#method-detail)
   1. [getDataRoot()](#getDataRoot())
   2. [getChunk(int)](#getChunk(int))
   3. [addChunk(int, int, int)](#addChunk(int,int,int))
   4. [setChunk(DataChunk)](#setChunk(zombie.iso.areas.isoregion.data.DataChunk))
   5. [getAllChunks(List)](#getAllChunks(java.util.List))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class DataCell
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.data.DataCell

---

public final class DataCell
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final Map<Integer, DataChunk>`

  `dataChunks`

  `final zombie.iso.areas.isoregion.data.DataRoot`

  `dataRoot`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DataCell(zombie.iso.areas.isoregion.data.DataRoot dataRoot)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) DataChunk`

  `addChunk(int chunkX,
  int chunkY,
  int chunkID)`

  `(package private) void`

  `getAllChunks(List<DataChunk> list)`

  `(package private) DataChunk`

  `getChunk(int chunkID)`

  `private zombie.iso.areas.isoregion.data.DataRoot`

  `getDataRoot()`

  `(package private) void`

  `setChunk(DataChunk chunk)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dataRoot

    public final zombie.iso.areas.isoregion.data.DataRoot dataRoot
  + ### dataChunks

    final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data")> dataChunks
* Constructor Details
  -------------------

  + ### DataCell

    DataCell(zombie.iso.areas.isoregion.data.DataRoot dataRoot)
* Method Details
  --------------

  + ### getDataRoot

    private zombie.iso.areas.isoregion.data.DataRoot getDataRoot()
  + ### getChunk

    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") getChunk(int chunkID)
  + ### addChunk

    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") addChunk(int chunkX,
    int chunkY,
    int chunkID)
  + ### setChunk

    void setChunk([DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") chunk)
  + ### getAllChunks

    void getAllChunks([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data")> list)