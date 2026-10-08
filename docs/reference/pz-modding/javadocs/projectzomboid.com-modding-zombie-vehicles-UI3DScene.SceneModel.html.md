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
3. [SceneModel](UI3DScene.SceneModel.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [spriteModel](#spriteModel)
   2. [modelScript](#modelScript)
   3. [model](#model)
   4. [texture](#texture)
   5. [useWorldAttachment](#useWorldAttachment)
   6. [weaponRotationHack](#weaponRotationHack)
   7. [ignoreVehicleScale](#ignoreVehicleScale)
   8. [spriteModelEditor](#spriteModelEditor)
   9. [animationPlayer](#animationPlayer)
6. [Constructor Details](#constructor-detail)
   1. [SceneModel(UI3DScene, String, ModelScript, Model)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String,zombie.scripting.objects.ModelScript,zombie.core.skinnedmodel.model.Model))
7. [Method Details](#method-detail)
   1. [setSpriteModel(SpriteModel)](#setSpriteModel(zombie.iso.SpriteModel))
   2. [renderMain()](#renderMain())
   3. [getLocalTransform(Matrix4f)](#getLocalTransform(org.joml.Matrix4f))
   4. [getAttachmentTransform(String, Matrix4f)](#getAttachmentTransform(java.lang.String,org.joml.Matrix4f))
   5. [initAnimationPlayer(Model)](#initAnimationPlayer(zombie.core.skinnedmodel.model.Model))
   6. [hitTestBone(int, UI3DScene.Ray, UI3DScene.Ray, Matrix4f, Vector2f)](#hitTestBone(int,zombie.vehicles.UI3DScene.Ray,zombie.vehicles.UI3DScene.Ray,org.joml.Matrix4f,org.joml.Vector2f))
   7. [pickBone(float, float)](#pickBone(float,float))
   8. [getBoneMatrix(String, Matrix4f)](#getBoneMatrix(java.lang.String,org.joml.Matrix4f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneModel
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneModel

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneModel
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animationPlayer`

  `(package private) boolean`

  `ignoreVehicleScale`

  `(package private) zombie.core.skinnedmodel.model.Model`

  `model`

  `(package private) ModelScript`

  `modelScript`

  `(package private) SpriteModel`

  `spriteModel`

  `(package private) boolean`

  `spriteModelEditor`

  `(package private) Texture`

  `texture`

  `(package private) boolean`

  `useWorldAttachment`

  `(package private) boolean`

  `weaponRotationHack`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneModel(UI3DScene scene,
  String id,
  ModelScript modelScript,
  zombie.core.skinnedmodel.model.Model model)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) org.joml.Matrix4f`

  `getAttachmentTransform(String attachmentName,
  org.joml.Matrix4f transform)`

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

  `(package private) static zombie.core.skinnedmodel.animation.AnimationPlayer`

  `initAnimationPlayer(zombie.core.skinnedmodel.model.Model model)`

  `(package private) String`

  `pickBone(float uiX,
  float uiY)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  `(package private) void`

  `setSpriteModel(SpriteModel spriteModel)`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getGlobalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### spriteModel

    [SpriteModel](../iso/SpriteModel.html "class in zombie.iso") spriteModel
  + ### modelScript

    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript
  + ### model

    zombie.core.skinnedmodel.model.Model model
  + ### texture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### useWorldAttachment

    boolean useWorldAttachment
  + ### weaponRotationHack

    boolean weaponRotationHack
  + ### ignoreVehicleScale

    boolean ignoreVehicleScale
  + ### spriteModelEditor

    boolean spriteModelEditor
  + ### animationPlayer

    static zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer
* Constructor Details
  -------------------

  + ### SceneModel

    SceneModel([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript,
    zombie.core.skinnedmodel.model.Model model)
* Method Details
  --------------

  + ### setSpriteModel

    void setSpriteModel([SpriteModel](../iso/SpriteModel.html "class in zombie.iso") spriteModel)
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
  + ### initAnimationPlayer

    static zombie.core.skinnedmodel.animation.AnimationPlayer initAnimationPlayer(zombie.core.skinnedmodel.model.Model model)
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