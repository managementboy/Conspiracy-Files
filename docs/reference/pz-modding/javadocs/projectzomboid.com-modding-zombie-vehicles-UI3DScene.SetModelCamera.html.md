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
3. [SetModelCamera](UI3DScene.SetModelCamera.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [camera](#camera)
   2. [renderData](#renderData)
6. [Constructor Details](#constructor-detail)
   1. [SetModelCamera()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.SceneModelCamera, UI3DScene.SceneObjectRenderData)](#init(zombie.vehicles.UI3DScene.SceneModelCamera,zombie.vehicles.UI3DScene.SceneObjectRenderData))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SetModelCamera
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.SetModelCamera

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SetModelCamera
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.SceneModelCamera`

  `camera`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SetModelCamera()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SetModelCamera`

  `init(UI3DScene.SceneModelCamera camera,
  UI3DScene.SceneObjectRenderData renderData)`

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

  + ### camera

    [UI3DScene.SceneModelCamera](UI3DScene.SceneModelCamera.html "class in zombie.vehicles") camera
  + ### renderData

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderData
* Constructor Details
  -------------------

  + ### SetModelCamera

    private SetModelCamera()
* Method Details
  --------------

  + ### init

    [UI3DScene.SetModelCamera](UI3DScene.SetModelCamera.html "class in zombie.vehicles") init([UI3DScene.SceneModelCamera](UI3DScene.SceneModelCamera.html "class in zombie.vehicles") camera,
    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderData)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`