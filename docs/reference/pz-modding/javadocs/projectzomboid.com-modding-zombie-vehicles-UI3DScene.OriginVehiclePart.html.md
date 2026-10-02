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
3. [OriginVehiclePart](UI3DScene.OriginVehiclePart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicle](#vehicle)
   2. [partId](#partId)
   3. [partModelId](#partModelId)
   4. [attachmentName](#attachmentName)
   5. [boneOnly](#boneOnly)
6. [Constructor Details](#constructor-detail)
   1. [OriginVehiclePart(UI3DScene)](#%3Cinit%3E(zombie.vehicles.UI3DScene))
7. [Method Details](#method-detail)
   1. [renderMain()](#renderMain())
   2. [getGlobalTransform(Matrix4f)](#getGlobalTransform(org.joml.Matrix4f))
   3. [getGlobalBoneTransform(Matrix4f)](#getGlobalBoneTransform(org.joml.Matrix4f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.OriginVehiclePart
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.OriginVehiclePart

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.OriginVehiclePart
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) String`

  `attachmentName`

  `(package private) boolean`

  `boneOnly`

  `(package private) String`

  `partId`

  `(package private) String`

  `partModelId`

  `(package private) UI3DScene.SceneVehicle`

  `vehicle`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OriginVehiclePart(UI3DScene scene)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) org.joml.Matrix4f`

  `getGlobalBoneTransform(org.joml.Matrix4f transform)`

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

  + ### vehicle

    [UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") vehicle
  + ### partId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId
  + ### partModelId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partModelId
  + ### attachmentName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName
  + ### boneOnly

    boolean boneOnly
* Constructor Details
  -------------------

  + ### OriginVehiclePart

    OriginVehiclePart([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene)
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
  + ### getGlobalBoneTransform

    org.joml.Matrix4f getGlobalBoneTransform(org.joml.Matrix4f transform)