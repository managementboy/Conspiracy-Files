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
3. [s\_performance](IsoCell.s_performance.html)
4. [renderTiles](IsoCell.s_performance.renderTiles.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [performRenderTiles](#performRenderTiles)
   2. [recalculateAnyGridStacks](#recalculateAnyGridStacks)
   3. [flattenAnyFoliage](#flattenAnyFoliage)
   4. [renderDebugPhysics](#renderDebugPhysics)
   5. [renderDebugLighting](#renderDebugLighting)
   6. [performRenderTilesLayers](#performRenderTilesLayers)
7. [Constructor Details](#constructor-detail)
   1. [renderTiles()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell.s\_performance.renderTiles
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCell.s\_performance.renderTiles

Enclosing class:
:   `IsoCell.s_performance`

---

public static class IsoCell.s\_performance.renderTiles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static class`

  `IsoCell.s_performance.renderTiles.PerformRenderTilesLayer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `flattenAnyFoliage`

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `performRenderTiles`

  `(package private) static zombie.core.profiling.PerformanceProfileProbeList<IsoCell.s_performance.renderTiles.PerformRenderTilesLayer>`

  `performRenderTilesLayers`

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `recalculateAnyGridStacks`

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `renderDebugLighting`

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `renderDebugPhysics`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `renderTiles()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### performRenderTiles

    public static final zombie.core.profiling.PerformanceProfileProbe performRenderTiles
  + ### recalculateAnyGridStacks

    public static final zombie.core.profiling.PerformanceProfileProbe recalculateAnyGridStacks
  + ### flattenAnyFoliage

    public static final zombie.core.profiling.PerformanceProfileProbe flattenAnyFoliage
  + ### renderDebugPhysics

    public static final zombie.core.profiling.PerformanceProfileProbe renderDebugPhysics
  + ### renderDebugLighting

    public static final zombie.core.profiling.PerformanceProfileProbe renderDebugLighting
  + ### performRenderTilesLayers

    static zombie.core.profiling.PerformanceProfileProbeList<[IsoCell.s\_performance.renderTiles.PerformRenderTilesLayer](IsoCell.s_performance.renderTiles.PerformRenderTilesLayer.html "class in zombie.iso")> performRenderTilesLayers
* Constructor Details
  -------------------

  + ### renderTiles

    public renderTiles()