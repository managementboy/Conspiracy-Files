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
3. [OriginGeometry](UI3DScene.OriginGeometry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sceneGeometry](#sceneGeometry)
   2. [originHint](#originHint)
6. [Constructor Details](#constructor-detail)
   1. [OriginGeometry(UI3DScene)](#%3Cinit%3E(zombie.vehicles.UI3DScene))
7. [Method Details](#method-detail)
   1. [renderMain()](#renderMain())
   2. [getGlobalTransform(Matrix4f)](#getGlobalTransform(org.joml.Matrix4f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.OriginGeometry
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.OriginGeometry

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.OriginGeometry
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) String`

  `originHint`

  `(package private) UI3DScene.SceneGeometry`

  `sceneGeometry`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OriginGeometry(UI3DScene scene)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) org.joml.Matrix4f`

  `getGlobalTransform(org.joml.Matrix4f transform)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getAttachmentTransform, getLocalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sceneGeometry

    [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html "class in zombie.vehicles") sceneGeometry
  + ### originHint

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originHint
* Constructor Details
  -------------------

  + ### OriginGeometry

    OriginGeometry([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene)
* Method Details
  --------------

  + ### renderMain

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()

    Specified by:
    :   `renderMain` in class `UI3DScene.SceneObject`
  + ### getGlobalTransform

    org.joml.Matrix4f getGlobalTransform(org.joml.Matrix4f transform)

    Overrides:
    :   `getGlobalTransform` in class `UI3DScene.SceneObject`