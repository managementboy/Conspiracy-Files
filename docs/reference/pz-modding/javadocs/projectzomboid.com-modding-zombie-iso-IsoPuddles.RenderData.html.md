[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoPuddles](IsoPuddles.html)
3. [RenderData](IsoPuddles.RenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [squaresPerLevel](#squaresPerLevel)
   2. [numSquares](#numSquares)
   3. [capacity](#capacity)
   4. [data](#data)
6. [Constructor Details](#constructor-detail)
   1. [RenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [clear()](#clear())
   2. [addSquare(int, IsoPuddlesGeometry, TileSeamManager.Tiles)](#addSquare(int,zombie.iso.IsoPuddlesGeometry,zombie.tileDepth.TileSeamManager.Tiles))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPuddles.RenderData
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoPuddles.RenderData

Enclosing class:
:   `IsoPuddles`

---

private static final class IsoPuddles.RenderData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `capacity`

  `(package private) float[]`

  `data`

  `(package private) int`

  `numSquares`

  `(package private) final int[]`

  `squaresPerLevel`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `addSquare(int z,
  zombie.iso.IsoPuddlesGeometry pg,
  TileSeamManager.Tiles seamFix2)`

  `(package private) void`

  `clear()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### squaresPerLevel

    final int[] squaresPerLevel
  + ### numSquares

    int numSquares
  + ### capacity

    int capacity
  + ### data

    float[] data
* Constructor Details
  -------------------

  + ### RenderData

    RenderData()
* Method Details
  --------------

  + ### clear

    void clear()
  + ### addSquare

    void addSquare(int z,
    zombie.iso.IsoPuddlesGeometry pg,
    [TileSeamManager.Tiles](../tileDepth/TileSeamManager.Tiles.html "enum class in zombie.tileDepth") seamFix2)