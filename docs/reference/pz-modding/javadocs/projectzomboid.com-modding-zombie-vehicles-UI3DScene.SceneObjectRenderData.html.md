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
3. [SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [object](#object)
   2. [transform](#transform)
   3. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [SceneObjectRenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.SceneObject)](#init(zombie.vehicles.UI3DScene.SceneObject))
   2. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneObjectRenderData
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.SceneObjectRenderData

Direct Known Subclasses:
:   `UI3DScene.CharacterRenderData, UI3DScene.ModelRenderData, UI3DScene.ScenePolygonRenderData, UI3DScene.VehicleRenderData`

Enclosing class:
:   `UI3DScene`

---

private static class UI3DScene.SceneObjectRenderData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.SceneObject`

  `object`

  `private static final zombie.popman.ObjectPool<UI3DScene.SceneObjectRenderData>`

  `s_pool`

  `(package private) final org.joml.Matrix4f`

  `transform`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SceneObjectRenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SceneObjectRenderData`

  `init(UI3DScene.SceneObject sceneObject)`

  `(package private) void`

  `release()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### object

    [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") object
  + ### transform

    final org.joml.Matrix4f transform
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### SceneObjectRenderData

    private SceneObjectRenderData()
* Method Details
  --------------

  + ### init

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") init([UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") sceneObject)
  + ### release

    void release()