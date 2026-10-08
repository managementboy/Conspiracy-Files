[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.weather.fog](package-summary.html)
2. [ImprovedFog](ImprovedFog.html)
3. [RectangleIterator](ImprovedFog.RectangleIterator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [curX](#curX)
   2. [curY](#curY)
   3. [sX](#sX)
   4. [sY](#sY)
   5. [rowLen](#rowLen)
   6. [altRow](#altRow)
   7. [curRow](#curRow)
   8. [rowIndex](#rowIndex)
   9. [maxRows](#maxRows)
6. [Constructor Details](#constructor-detail)
   1. [RectangleIterator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset(int, int)](#reset(int,int))
   2. [next(Vector2i)](#next(org.joml.Vector2i))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ImprovedFog.RectangleIterator
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.fog.ImprovedFog.RectangleIterator

Enclosing class:
:   `ImprovedFog`

---

private static class ImprovedFog.RectangleIterator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Similar as diamond matrix iterator but instead does a rectangle.
Where the alt rows are one wider as starting row, example:
1 1 1 1
2 2 2 2 2
3 3 3 3

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `altRow`

  `private int`

  `curRow`

  `private int`

  `curX`

  `private int`

  `curY`

  `private int`

  `maxRows`

  `private int`

  `rowIndex`

  `private int`

  `rowLen`

  `private int`

  `sX`

  `private int`

  `sY`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RectangleIterator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `next(org.joml.Vector2i vec)`

  `void`

  `reset(int rows,
  int rowlen)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### curX

    private int curX
  + ### curY

    private int curY
  + ### sX

    private int sX
  + ### sY

    private int sY
  + ### rowLen

    private int rowLen
  + ### altRow

    private boolean altRow
  + ### curRow

    private int curRow
  + ### rowIndex

    private int rowIndex
  + ### maxRows

    private int maxRows
* Constructor Details
  -------------------

  + ### RectangleIterator

    private RectangleIterator()
* Method Details
  --------------

  + ### reset

    public void reset(int rows,
    int rowlen)
  + ### next

    public boolean next(org.joml.Vector2i vec)