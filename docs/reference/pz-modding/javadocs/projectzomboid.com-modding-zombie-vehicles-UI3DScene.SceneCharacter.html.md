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
3. [SceneCharacter](UI3DScene.SceneCharacter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [animatedModel](#animatedModel)
   2. [showBones](#showBones)
   3. [showBip01](#showBip01)
   4. [clearDepthBuffer](#clearDepthBuffer)
   5. [useDeferredMovement](#useDeferredMovement)
6. [Constructor Details](#constructor-detail)
   1. [SceneCharacter(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [initAnimatedModel()](#initAnimatedModel())
   2. [renderMain()](#renderMain())
   3. [getLocalTransform(Matrix4f)](#getLocalTransform(org.joml.Matrix4f))
   4. [getAttachmentTransform(String, Matrix4f)](#getAttachmentTransform(java.lang.String,org.joml.Matrix4f))
   5. [hitTestBone(int, UI3DScene.Ray, UI3DScene.Ray, Matrix4f, Vector2f)](#hitTestBone(int,zombie.vehicles.UI3DScene.Ray,zombie.vehicles.UI3DScene.Ray,org.joml.Matrix4f,org.joml.Vector2f))
   6. [pickBone(float, float)](#pickBone(float,float))
   7. [getBoneMatrix(String, Matrix4f)](#getBoneMatrix(java.lang.String,org.joml.Matrix4f))
   8. [getBoneAxis(String, UI3DScene.PositionRotation)](#getBoneAxis(java.lang.String,zombie.vehicles.UI3DScene.PositionRotation))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneCharacter
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneCharacter

Direct Known Subclasses:
:   `UI3DScene.SceneAnimal, UI3DScene.ScenePlayer`

Enclosing class:
:   `UI3DScene`

---

private abstract static class UI3DScene.SceneCharacter
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final zombie.core.skinnedmodel.advancedanimation.AnimatedModel`

  `animatedModel`

  `(package private) boolean`

  `clearDepthBuffer`

  `(package private) boolean`

  `showBip01`

  `(package private) boolean`

  `showBones`

  `(package private) boolean`

  `useDeferredMovement`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneCharacter(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) org.joml.Matrix4f`

  `getAttachmentTransform(String attachmentName,
  org.joml.Matrix4f transform)`

  `(package private) UI3DScene.PositionRotation`

  `getBoneAxis(String boneName,
  UI3DScene.PositionRotation axis)`

  `(package private) org.joml.Matrix4f`

  `getBoneMatrix(String boneName,
  org.joml.Matrix4f mat)`

  `(package private) org.joml.Matrix4f`

  `getLocalTransform(org.joml.Matrix4f transform)`

  `(package private) int`

  `hitTestBone(int boneIndex,
  UI3DScene.Ray boneRay,
  UI3DScene.Ray cameraRay,
  org.joml.Matrix4f characterMatrix,
  Vector2f out)`

  `(package private) abstract void`

  `initAnimatedModel()`

  `(package private) String`

  `pickBone(float uiX,
  float uiY)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getGlobalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### animatedModel

    final zombie.core.skinnedmodel.advancedanimation.AnimatedModel animatedModel
  + ### showBones

    boolean showBones
  + ### showBip01

    boolean showBip01
  + ### clearDepthBuffer

    boolean clearDepthBuffer
  + ### useDeferredMovement

    boolean useDeferredMovement
* Constructor Details
  -------------------

  + ### SceneCharacter

    SceneCharacter([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### initAnimatedModel

    abstract void initAnimatedModel()
  + ### renderMain

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()

    Specified by:
    :   `renderMain` in class `UI3DScene.SceneObject`
  + ### getLocalTransform

    org.joml.Matrix4f getLocalTransform(org.joml.Matrix4f transform)

    Overrides:
    :   `getLocalTransform` in class `UI3DScene.SceneObject`
  + ### getAttachmentTransform

    org.joml.Matrix4f getAttachmentTransform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    org.joml.Matrix4f transform)

    Overrides:
    :   `getAttachmentTransform` in class `UI3DScene.SceneObject`
  + ### hitTestBone

    int hitTestBone(int boneIndex,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") boneRay,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") cameraRay,
    org.joml.Matrix4f characterMatrix,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") out)
  + ### pickBone

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickBone(float uiX,
    float uiY)
  + ### getBoneMatrix

    org.joml.Matrix4f getBoneMatrix([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") boneName,
    org.joml.Matrix4f mat)
  + ### getBoneAxis

    [UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") getBoneAxis([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") boneName,
    [UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") axis)