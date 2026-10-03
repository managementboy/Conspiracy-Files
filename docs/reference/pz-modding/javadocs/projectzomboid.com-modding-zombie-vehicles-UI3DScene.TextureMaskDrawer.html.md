[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [UI3DScene](UI3DScene.html)
3. [TextureMaskDrawer](UI3DScene.TextureMaskDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scene](#scene)
   2. [texture](#texture)
   3. [sx](#sx)
   4. [sy](#sy)
   5. [sx2](#sx2)
   6. [sy2](#sy2)
   7. [pixelSize](#pixelSize)
   8. [r](#r)
   9. [g](#g)
   10. [b](#b)
   11. [a](#a)
6. [Constructor Details](#constructor-detail)
   1. [TextureMaskDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.TextureMaskDrawer
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.TextureMaskDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.TextureMaskDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `a`

  `(package private) float`

  `b`

  `(package private) float`

  `g`

  `(package private) float`

  `pixelSize`

  `(package private) float`

  `r`

  `(package private) UI3DScene`

  `scene`

  `(package private) float`

  `sx`

  `(package private) float`

  `sx2`

  `(package private) float`

  `sy`

  `(package private) float`

  `sy2`

  `(package private) Texture`

  `texture`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TextureMaskDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `render()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `postRender, render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### scene

    [UI3DScene](UI3DScene.html "class in zombie.vehicles") scene
  + ### texture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### sx

    float sx
  + ### sy

    float sy
  + ### sx2

    float sx2
  + ### sy2

    float sy2
  + ### pixelSize

    float pixelSize
  + ### r

    float r
  + ### g

    float g
  + ### b

    float b
  + ### a

    float a
* Constructor Details
  -------------------

  + ### TextureMaskDrawer

    private TextureMaskDrawer()
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`