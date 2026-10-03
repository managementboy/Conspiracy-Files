[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoCell](IsoCell.html)
3. [PerPlayerRender](IsoCell.PerPlayerRender.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [gridStacks](#gridStacks)
   2. [visiOccludedFlags](#visiOccludedFlags)
   3. [visiCulledFlags](#visiCulledFlags)
   4. [flattenGrassEtc](#flattenGrassEtc)
   5. [minX](#minX)
   6. [minY](#minY)
   7. [maxX](#maxX)
   8. [maxY](#maxY)
6. [Constructor Details](#constructor-detail)
   1. [PerPlayerRender()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setSize(int, int)](#setSize(int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell.PerPlayerRender
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCell.PerPlayerRender

Enclosing class:
:   `IsoCell`

---

public static final class IsoCell.PerPlayerRender
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean[][]`

  `flattenGrassEtc`

  `final zombie.iso.IsoGridStack`

  `gridStacks`

  `int`

  `maxX`

  `int`

  `maxY`

  `int`

  `minX`

  `int`

  `minY`

  `boolean[][]`

  `visiCulledFlags`

  `boolean[][][]`

  `visiOccludedFlags`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PerPlayerRender()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `setSize(int w,
  int h)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### gridStacks

    public final zombie.iso.IsoGridStack gridStacks
  + ### visiOccludedFlags

    public boolean[][][] visiOccludedFlags
  + ### visiCulledFlags

    public boolean[][] visiCulledFlags
  + ### flattenGrassEtc

    public boolean[][] flattenGrassEtc
  + ### minX

    public int minX
  + ### minY

    public int minY
  + ### maxX

    public int maxX
  + ### maxY

    public int maxY
* Constructor Details
  -------------------

  + ### PerPlayerRender

    public PerPlayerRender()
* Method Details
  --------------

  + ### setSize

    public void setSize(int w,
    int h)