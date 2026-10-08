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
3. [SceneObject](UI3DScene.SceneObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scene](#scene)
   2. [id](#id)
   3. [visible](#visible)
   4. [translate](#translate)
   5. [rotate](#rotate)
   6. [scale](#scale)
   7. [parent](#parent)
   8. [attachment](#attachment)
   9. [parentAttachment](#parentAttachment)
   10. [autoRotate](#autoRotate)
   11. [autoRotateAngle](#autoRotateAngle)
   12. [parentVehiclePart](#parentVehiclePart)
6. [Constructor Details](#constructor-detail)
   1. [SceneObject(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [initClone(UI3DScene.SceneObject)](#initClone(zombie.vehicles.UI3DScene.SceneObject))
   2. [clone(String)](#clone(java.lang.String))
   3. [renderMain()](#renderMain())
   4. [getLocalTransform(Matrix4f)](#getLocalTransform(org.joml.Matrix4f))
   5. [getGlobalTransform(Matrix4f)](#getGlobalTransform(org.joml.Matrix4f))
   6. [getAttachmentTransform(String, Matrix4f)](#getAttachmentTransform(java.lang.String,org.joml.Matrix4f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneObject
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.SceneObject

Direct Known Subclasses:
:   `UI3DScene.OriginAttachment, UI3DScene.OriginBone, UI3DScene.OriginGeometry, UI3DScene.OriginGizmo, UI3DScene.OriginVehiclePart, UI3DScene.SceneCharacter, UI3DScene.SceneDepthTexture, UI3DScene.SceneGeometry, UI3DScene.SceneModel, UI3DScene.SceneVehicle`

Enclosing class:
:   `UI3DScene`

---

private abstract static class UI3DScene.SceneObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) String`

  `attachment`

  `(package private) boolean`

  `autoRotate`

  `(package private) float`

  `autoRotateAngle`

  `(package private) final String`

  `id`

  `(package private) UI3DScene.SceneObject`

  `parent`

  `(package private) String`

  `parentAttachment`

  `(package private) UI3DScene.ParentVehiclePart`

  `parentVehiclePart`

  `(package private) final Vector3f`

  `rotate`

  `(package private) final Vector3f`

  `scale`

  `(package private) final UI3DScene`

  `scene`

  `(package private) final Vector3f`

  `translate`

  `(package private) boolean`

  `visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneObject(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SceneObject`

  `clone(String id)`

  `(package private) org.joml.Matrix4f`

  `getAttachmentTransform(String attachmentName,
  org.joml.Matrix4f transform)`

  `(package private) org.joml.Matrix4f`

  `getGlobalTransform(org.joml.Matrix4f transform)`

  `(package private) org.joml.Matrix4f`

  `getLocalTransform(org.joml.Matrix4f transform)`

  `(package private) void`

  `initClone(UI3DScene.SceneObject clone)`

  `(package private) abstract UI3DScene.SceneObjectRenderData`

  `renderMain()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### scene

    final [UI3DScene](UI3DScene.html "class in zombie.vehicles") scene
  + ### id

    final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### visible

    boolean visible
  + ### translate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") translate
  + ### rotate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### scale

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") scale
  + ### parent

    [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") parent
  + ### attachment

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachment
  + ### parentAttachment

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parentAttachment
  + ### autoRotate

    boolean autoRotate
  + ### autoRotateAngle

    float autoRotateAngle
  + ### parentVehiclePart

    [UI3DScene.ParentVehiclePart](UI3DScene.ParentVehiclePart.html "class in zombie.vehicles") parentVehiclePart
* Constructor Details
  -------------------

  + ### SceneObject

    SceneObject([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### initClone

    void initClone([UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") clone)
  + ### clone

    [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") clone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### renderMain

    abstract [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()
  + ### getLocalTransform

    org.joml.Matrix4f getLocalTransform(org.joml.Matrix4f transform)
  + ### getGlobalTransform

    org.joml.Matrix4f getGlobalTransform(org.joml.Matrix4f transform)
  + ### getAttachmentTransform

    org.joml.Matrix4f getAttachmentTransform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    org.joml.Matrix4f transform)