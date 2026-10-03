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
3. [VehicleDrawer](UI3DScene.VehicleDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicle](#vehicle)
   2. [renderData](#renderData)
   3. [rendered](#rendered)
   4. [fzeroes](#fzeroes)
   5. [paintColor](#paintColor)
   6. [IDENTITY](#IDENTITY)
6. [Constructor Details](#constructor-detail)
   1. [VehicleDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.SceneVehicle, UI3DScene.VehicleRenderData)](#init(zombie.vehicles.UI3DScene.SceneVehicle,zombie.vehicles.UI3DScene.VehicleRenderData))
   2. [render()](#render())
   3. [render(int)](#render(int))
   4. [renderSkeleton(UI3DScene.VehicleModelRenderData)](#renderSkeleton(zombie.vehicles.UI3DScene.VehicleModelRenderData))
   5. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.VehicleDrawer
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.VehicleDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.VehicleDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final float[]`

  `fzeroes`

  `(package private) static final org.joml.Matrix4f`

  `IDENTITY`

  `(package private) final Vector3f`

  `paintColor`

  `(package private) UI3DScene.VehicleRenderData`

  `renderData`

  `(package private) boolean`

  `rendered`

  `(package private) UI3DScene.SceneVehicle`

  `vehicle`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init(UI3DScene.SceneVehicle sceneVehicle,
  UI3DScene.VehicleRenderData renderData)`

  `void`

  `postRender()`

  `void`

  `render()`

  `private void`

  `render(int modelIndex)`

  `private void`

  `renderSkeleton(UI3DScene.VehicleModelRenderData renderData)`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vehicle

    [UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") vehicle
  + ### renderData

    [UI3DScene.VehicleRenderData](UI3DScene.VehicleRenderData.html "class in zombie.vehicles") renderData
  + ### rendered

    boolean rendered
  + ### fzeroes

    final float[] fzeroes
  + ### paintColor

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") paintColor
  + ### IDENTITY

    static final org.joml.Matrix4f IDENTITY
* Constructor Details
  -------------------

  + ### VehicleDrawer

    private VehicleDrawer()
* Method Details
  --------------

  + ### init

    public void init([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    [UI3DScene.VehicleRenderData](UI3DScene.VehicleRenderData.html "class in zombie.vehicles") renderData)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### render

    private void render(int modelIndex)
  + ### renderSkeleton

    private void renderSkeleton([UI3DScene.VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html "class in zombie.vehicles") renderData)
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`