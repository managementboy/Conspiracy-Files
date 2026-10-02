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
3. [ScenePolygonDrawer](UI3DScene.ScenePolygonDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderData](#renderData)
6. [Constructor Details](#constructor-detail)
   1. [ScenePolygonDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.ScenePolygonRenderData)](#init(zombie.vehicles.UI3DScene.ScenePolygonRenderData))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ScenePolygonDrawer
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.ScenePolygonDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.ScenePolygonDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.ScenePolygonRenderData`

  `renderData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ScenePolygonDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init(UI3DScene.ScenePolygonRenderData renderData)`

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

  + ### renderData

    [UI3DScene.ScenePolygonRenderData](UI3DScene.ScenePolygonRenderData.html "class in zombie.vehicles") renderData
* Constructor Details
  -------------------

  + ### ScenePolygonDrawer

    private ScenePolygonDrawer()
* Method Details
  --------------

  + ### init

    public void init([UI3DScene.ScenePolygonRenderData](UI3DScene.ScenePolygonRenderData.html "class in zombie.vehicles") renderData)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`