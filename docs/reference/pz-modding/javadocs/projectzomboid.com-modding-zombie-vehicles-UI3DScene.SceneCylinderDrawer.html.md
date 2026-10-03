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
3. [SceneCylinderDrawer](UI3DScene.SceneCylinderDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sceneObject](#sceneObject)
   2. [radiusBase](#radiusBase)
   3. [radiusTop](#radiusTop)
   4. [length](#length)
   5. [slices](#slices)
   6. [stacks](#stacks)
   7. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [SceneCylinderDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneCylinderDrawer
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.SceneCylinderDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneCylinderDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `length`

  `(package private) float`

  `radiusBase`

  `(package private) float`

  `radiusTop`

  `private static final zombie.popman.ObjectPool<UI3DScene.SceneCylinderDrawer>`

  `s_pool`

  `(package private) UI3DScene.SceneCylinder`

  `sceneObject`

  `(package private) int`

  `slices`

  `(package private) int`

  `stacks`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SceneCylinderDrawer()`
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

  + ### sceneObject

    [UI3DScene.SceneCylinder](UI3DScene.SceneCylinder.html "class in zombie.vehicles") sceneObject
  + ### radiusBase

    float radiusBase
  + ### radiusTop

    float radiusTop
  + ### length

    float length
  + ### slices

    int slices
  + ### stacks

    int stacks
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.SceneCylinderDrawer](UI3DScene.SceneCylinderDrawer.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### SceneCylinderDrawer

    private SceneCylinderDrawer()
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