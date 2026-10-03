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
3. [ScenePolygonRenderData](UI3DScene.ScenePolygonRenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [drawer](#drawer)
   2. [polygon](#polygon)
   3. [points](#points)
   4. [triangles](#triangles)
   5. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [ScenePolygonRenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initPolygon(UI3DScene.ScenePolygon)](#initPolygon(zombie.vehicles.UI3DScene.ScenePolygon))
   2. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ScenePolygonRenderData
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.ScenePolygonRenderData

Enclosing class:
:   `UI3DScene`

---

private static class UI3DScene.ScenePolygonRenderData
extends [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final UI3DScene.ScenePolygonDrawer`

  `drawer`

  `(package private) final ArrayList<Vector3f>`

  `points`

  `(package private) UI3DScene.ScenePolygon`

  `polygon`

  `private static final zombie.popman.ObjectPool<UI3DScene.ScenePolygonRenderData>`

  `s_pool`

  `(package private) final ArrayList<Vector3f>`

  `triangles`

  ### Fields inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#field-summary "class in zombie.vehicles")

  `object, transform`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ScenePolygonRenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SceneObjectRenderData`

  `initPolygon(UI3DScene.ScenePolygon scenePolygon)`

  `(package private) void`

  `release()`

  ### Methods inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#method-summary "class in zombie.vehicles")

  `init`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### drawer

    final [UI3DScene.ScenePolygonDrawer](UI3DScene.ScenePolygonDrawer.html "class in zombie.vehicles") drawer
  + ### polygon

    [UI3DScene.ScenePolygon](UI3DScene.ScenePolygon.html "class in zombie.vehicles") polygon
  + ### points

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> points
  + ### triangles

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> triangles
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.ScenePolygonRenderData](UI3DScene.ScenePolygonRenderData.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### ScenePolygonRenderData

    private ScenePolygonRenderData()
* Method Details
  --------------

  + ### initPolygon

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") initPolygon([UI3DScene.ScenePolygon](UI3DScene.ScenePolygon.html "class in zombie.vehicles") scenePolygon)
  + ### release

    void release()

    Overrides:
    :   `release` in class `UI3DScene.SceneObjectRenderData`