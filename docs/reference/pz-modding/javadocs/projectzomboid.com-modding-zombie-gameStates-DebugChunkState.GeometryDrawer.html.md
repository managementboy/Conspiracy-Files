[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [DebugChunkState](DebugChunkState.html)
3. [GeometryDrawer](DebugChunkState.GeometryDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [object](#object)
   2. [levels](#levels)
   3. [scale](#scale)
   4. [width](#width)
   5. [playerX](#playerX)
   6. [playerY](#playerY)
   7. [x](#x)
   8. [y](#y)
   9. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [GeometryDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [renderMain()](#renderMain())
   2. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugChunkState.GeometryDrawer
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.gameStates.DebugChunkState.GeometryDrawer

Enclosing class:
:   `DebugChunkState`

---

private static final class DebugChunkState.GeometryDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `levels`

  `(package private) String`

  `object`

  `(package private) float`

  `playerX`

  `(package private) float`

  `playerY`

  `(package private) float`

  `scale`

  `(package private) float`

  `width`

  `(package private) float`

  `x`

  `(package private) float`

  `y`

  `(package private) float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `GeometryDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `render()`

  `void`

  `renderMain()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `postRender, render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### object

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") object
  + ### levels

    int levels
  + ### scale

    float scale
  + ### width

    float width
  + ### playerX

    float playerX
  + ### playerY

    float playerY
  + ### x

    float x
  + ### y

    float y
  + ### z

    float z
* Constructor Details
  -------------------

  + ### GeometryDrawer

    private GeometryDrawer()
* Method Details
  --------------

  + ### renderMain

    public void renderMain()
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`