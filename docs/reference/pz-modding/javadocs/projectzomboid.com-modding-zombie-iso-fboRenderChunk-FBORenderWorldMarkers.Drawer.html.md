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
3. [Drawer](FBORenderWorldMarkers.Drawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [highlights](#highlights)
   2. [playerIndex](#playerIndex)
6. [Constructor Details](#constructor-detail)
   1. [Drawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderWorldMarkers.Drawer
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.iso.fboRenderChunk.FBORenderWorldMarkers.Drawer

Enclosing class:
:   `FBORenderWorldMarkers`

---

private static final class FBORenderWorldMarkers.Drawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<FBORenderWorldMarkers.Marker>`

  `highlights`

  `(package private) int`

  `playerIndex`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Drawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `postRender()`

  `void`

  `render()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### highlights

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk")> highlights
  + ### playerIndex

    int playerIndex
* Constructor Details
  -------------------

  + ### Drawer

    private Drawer()
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`