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
3. [ModelDrawer](UI3DScene.ModelDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [model](#model)
   2. [renderData](#renderData)
   3. [rendered](#rendered)
   4. [matrixPalette](#matrixPalette)
   5. [boneCoords](#boneCoords)
   6. [texture](#texture)
6. [Constructor Details](#constructor-detail)
   1. [ModelDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.SceneModel, UI3DScene.ModelRenderData)](#init(zombie.vehicles.UI3DScene.SceneModel,zombie.vehicles.UI3DScene.ModelRenderData))
   2. [render()](#render())
   3. [postRender()](#postRender())
   4. [renderSkeleton()](#renderSkeleton())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ModelDrawer
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.ModelDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.ModelDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) gnu.trove.list.array.TFloatArrayList`

  `boneCoords`

  `(package private) FloatBuffer`

  `matrixPalette`

  `(package private) UI3DScene.SceneModel`

  `model`

  `(package private) UI3DScene.ModelRenderData`

  `renderData`

  `(package private) boolean`

  `rendered`

  `(package private) Texture`

  `texture`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ModelDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init(UI3DScene.SceneModel model,
  UI3DScene.ModelRenderData renderData)`

  `void`

  `postRender()`

  `void`

  `render()`

  `private void`

  `renderSkeleton()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### model

    [UI3DScene.SceneModel](UI3DScene.SceneModel.html "class in zombie.vehicles") model
  + ### renderData

    [UI3DScene.ModelRenderData](UI3DScene.ModelRenderData.html "class in zombie.vehicles") renderData
  + ### rendered

    boolean rendered
  + ### matrixPalette

    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") matrixPalette
  + ### boneCoords

    gnu.trove.list.array.TFloatArrayList boneCoords
  + ### texture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
* Constructor Details
  -------------------

  + ### ModelDrawer

    private ModelDrawer()
* Method Details
  --------------

  + ### init

    public void init([UI3DScene.SceneModel](UI3DScene.SceneModel.html "class in zombie.vehicles") model,
    [UI3DScene.ModelRenderData](UI3DScene.ModelRenderData.html "class in zombie.vehicles") renderData)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### renderSkeleton

    private void renderSkeleton()