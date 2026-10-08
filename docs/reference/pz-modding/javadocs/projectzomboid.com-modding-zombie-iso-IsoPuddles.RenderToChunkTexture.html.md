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
3. [RenderToChunkTexture](IsoPuddles.RenderToChunkTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderChunkX](#renderChunkX)
   2. [renderChunkY](#renderChunkY)
   3. [renderChunkWidth](#renderChunkWidth)
   4. [renderChunkHeight](#renderChunkHeight)
   5. [renderChunkBottom](#renderChunkBottom)
   6. [renderChunkMinZ](#renderChunkMinZ)
   7. [highRes](#highRes)
   8. [playerIndex](#playerIndex)
   9. [z](#z)
   10. [firstSquare](#firstSquare)
   11. [numSquares](#numSquares)
6. [Constructor Details](#constructor-detail)
   1. [RenderToChunkTexture()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPuddles.RenderToChunkTexture
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.iso.IsoPuddles.RenderToChunkTexture

Enclosing class:
:   `IsoPuddles`

---

private static final class IsoPuddles.RenderToChunkTexture
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `firstSquare`

  `(package private) boolean`

  `highRes`

  `(package private) int`

  `numSquares`

  `(package private) int`

  `playerIndex`

  `(package private) int`

  `renderChunkBottom`

  `(package private) int`

  `renderChunkHeight`

  `(package private) int`

  `renderChunkMinZ`

  `(package private) int`

  `renderChunkWidth`

  `(package private) float`

  `renderChunkX`

  `(package private) float`

  `renderChunkY`

  `(package private) int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RenderToChunkTexture()`
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

  + ### renderChunkX

    float renderChunkX
  + ### renderChunkY

    float renderChunkY
  + ### renderChunkWidth

    int renderChunkWidth
  + ### renderChunkHeight

    int renderChunkHeight
  + ### renderChunkBottom

    int renderChunkBottom
  + ### renderChunkMinZ

    int renderChunkMinZ
  + ### highRes

    boolean highRes
  + ### playerIndex

    int playerIndex
  + ### z

    int z
  + ### firstSquare

    int firstSquare
  + ### numSquares

    int numSquares
* Constructor Details
  -------------------

  + ### RenderToChunkTexture

    private RenderToChunkTexture()
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