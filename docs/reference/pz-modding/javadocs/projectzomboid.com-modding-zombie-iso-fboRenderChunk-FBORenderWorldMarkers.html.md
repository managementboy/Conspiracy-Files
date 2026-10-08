[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderWorldMarkers](FBORenderWorldMarkers.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [highlights](#highlights)
   3. [highlightPool](#highlightPool)
   4. [drawerPool](#drawerPool)
   5. [outline](#outline)
   6. [outlineR](#outlineR)
   7. [outlineG](#outlineG)
   8. [outlineB](#outlineB)
   9. [useGroundDepth](#useGroundDepth)
7. [Constructor Details](#constructor-detail)
   1. [FBORenderWorldMarkers()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [render(int, List)](#render(int,java.util.List))
   3. [renderOutline(FBORenderWorldMarkers.Marker)](#renderOutline(zombie.iso.fboRenderChunk.FBORenderWorldMarkers.Marker))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderWorldMarkers
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.fboRenderChunk.FBORenderWorldMarkers

---

public class FBORenderWorldMarkers
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `FBORenderWorldMarkers.Drawer`

  `private static final class`

  `FBORenderWorldMarkers.Marker`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.popman.ObjectPool<FBORenderWorldMarkers.Drawer>`

  `drawerPool`

  `private final zombie.popman.ObjectPool<FBORenderWorldMarkers.Marker>`

  `highlightPool`

  `private final ArrayList<FBORenderWorldMarkers.Marker>`

  `highlights`

  `private static FBORenderWorldMarkers`

  `instance`

  `private final boolean`

  `outline`

  `private final float`

  `outlineB`

  `private final float`

  `outlineG`

  `private final float`

  `outlineR`

  `private final boolean`

  `useGroundDepth`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FBORenderWorldMarkers()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static FBORenderWorldMarkers`

  `getInstance()`

  `void`

  `render(int z,
  List<WorldMarkers.GridSquareMarker> markerList)`

  `private void`

  `renderOutline(FBORenderWorldMarkers.Marker ah)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [FBORenderWorldMarkers](FBORenderWorldMarkers.html "class in zombie.iso.fboRenderChunk") instance
  + ### highlights

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk")> highlights
  + ### highlightPool

    private final zombie.popman.ObjectPool<[FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk")> highlightPool
  + ### drawerPool

    private final zombie.popman.ObjectPool<[FBORenderWorldMarkers.Drawer](FBORenderWorldMarkers.Drawer.html "class in zombie.iso.fboRenderChunk")> drawerPool
  + ### outline

    private final boolean outline

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderWorldMarkers.outline)
  + ### outlineR

    private final float outlineR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderWorldMarkers.outlineR)
  + ### outlineG

    private final float outlineG

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderWorldMarkers.outlineG)
  + ### outlineB

    private final float outlineB

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderWorldMarkers.outlineB)
  + ### useGroundDepth

    private final boolean useGroundDepth

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderWorldMarkers.useGroundDepth)
* Constructor Details
  -------------------

  + ### FBORenderWorldMarkers

    public FBORenderWorldMarkers()
* Method Details
  --------------

  + ### getInstance

    public static [FBORenderWorldMarkers](FBORenderWorldMarkers.html "class in zombie.iso.fboRenderChunk") getInstance()
  + ### render

    public void render(int z,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WorldMarkers.GridSquareMarker](../WorldMarkers.GridSquareMarker.html "class in zombie.iso")> markerList)
  + ### renderOutline

    private void renderOutline([FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk") ah)