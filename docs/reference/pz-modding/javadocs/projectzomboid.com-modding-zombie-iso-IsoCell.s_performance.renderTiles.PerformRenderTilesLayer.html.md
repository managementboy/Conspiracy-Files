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
5. [PerformRenderTilesLayer](IsoCell.s_performance.renderTiles.PerformRenderTilesLayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderIsoWater](#renderIsoWater)
   2. [renderFloor](#renderFloor)
   3. [renderPuddles](#renderPuddles)
   4. [renderShore](#renderShore)
   5. [renderSnow](#renderSnow)
   6. [renderBlood](#renderBlood)
   7. [vegetationCorpses](#vegetationCorpses)
   8. [renderFloorShading](#renderFloorShading)
   9. [renderShadows](#renderShadows)
   10. [luaOnPostFloorLayerDraw](#luaOnPostFloorLayerDraw)
   11. [minusFloorCharacters](#minusFloorCharacters)
6. [Constructor Details](#constructor-detail)
   1. [PerformRenderTilesLayer(String)](#%3Cinit%3E(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell.s\_performance.renderTiles.PerformRenderTilesLayer
================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.profiling.AbstractPerformanceProfileProbe

zombie.core.profiling.PerformanceProfileProbe

zombie.iso.IsoCell.s\_performance.renderTiles.PerformRenderTilesLayer

All Implemented Interfaces:
:   `AutoCloseable, zombie.core.profiling.IPerformanceProbe`

Enclosing class:
:   `IsoCell.s_performance.renderTiles`

---

static class IsoCell.s\_performance.renderTiles.PerformRenderTilesLayer
extends zombie.core.profiling.PerformanceProfileProbe

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `luaOnPostFloorLayerDraw`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `minusFloorCharacters`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderBlood`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderFloor`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderFloorShading`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderIsoWater`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderPuddles`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderShadows`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderShore`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `renderSnow`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `vegetationCorpses`

  ### Fields inherited from class zombie.core.profiling.AbstractPerformanceProfileProbe

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PerformRenderTilesLayer(String title)`
* Method Summary
  --------------

  ### Methods inherited from class zombie.core.profiling.PerformanceProfileProbe

  `onEnd, onStart`

  ### Methods inherited from class zombie.core.profiling.AbstractPerformanceProfileProbe

  `close, end, isEnabled, profile, setEnabled, start`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.profiling.IPerformanceProbe

  `isProbeEnabled`

* Field Details
  -------------

  + ### renderIsoWater

    final zombie.core.profiling.PerformanceProfileProbe renderIsoWater
  + ### renderFloor

    final zombie.core.profiling.PerformanceProfileProbe renderFloor
  + ### renderPuddles

    final zombie.core.profiling.PerformanceProfileProbe renderPuddles
  + ### renderShore

    final zombie.core.profiling.PerformanceProfileProbe renderShore
  + ### renderSnow

    final zombie.core.profiling.PerformanceProfileProbe renderSnow
  + ### renderBlood

    final zombie.core.profiling.PerformanceProfileProbe renderBlood
  + ### vegetationCorpses

    final zombie.core.profiling.PerformanceProfileProbe vegetationCorpses
  + ### renderFloorShading

    final zombie.core.profiling.PerformanceProfileProbe renderFloorShading
  + ### renderShadows

    final zombie.core.profiling.PerformanceProfileProbe renderShadows
  + ### luaOnPostFloorLayerDraw

    final zombie.core.profiling.PerformanceProfileProbe luaOnPostFloorLayerDraw
  + ### minusFloorCharacters

    final zombie.core.profiling.PerformanceProfileProbe minusFloorCharacters
* Constructor Details
  -------------------

  + ### PerformRenderTilesLayer

    PerformRenderTilesLayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)