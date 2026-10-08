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
3. [SceneVehicle](UI3DScene.SceneVehicle.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scriptName](#scriptName)
   2. [script](#script)
   3. [modelInfo](#modelInfo)
   4. [showBonesPartId](#showBonesPartId)
   5. [showBonesModelId](#showBonesModelId)
   6. [init](#init)
6. [Constructor Details](#constructor-detail)
   1. [SceneVehicle(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [renderMain()](#renderMain())
   2. [getAttachmentTransform(String, Matrix4f)](#getAttachmentTransform(java.lang.String,org.joml.Matrix4f))
   3. [getBoneMatrix(String, Matrix4f)](#getBoneMatrix(java.lang.String,org.joml.Matrix4f))
   4. [getTransformForPart(String, String, String, boolean, Matrix4f)](#getTransformForPart(java.lang.String,java.lang.String,java.lang.String,boolean,org.joml.Matrix4f))
   5. [getBoneMatrix(VehicleScript.Part, ModelAttachment, Matrix4f)](#getBoneMatrix(zombie.scripting.objects.VehicleScript.Part,zombie.scripting.objects.ModelAttachment,org.joml.Matrix4f))
   6. [hitTestBone(int, UI3DScene.Ray, UI3DScene.Ray, AnimationPlayer, Matrix4f, Vector2f)](#hitTestBone(int,zombie.vehicles.UI3DScene.Ray,zombie.vehicles.UI3DScene.Ray,zombie.core.skinnedmodel.animation.AnimationPlayer,org.joml.Matrix4f,org.joml.Vector2f))
   7. [pickBone(VehicleScript.Part, VehicleScript.Model, float, float)](#pickBone(zombie.scripting.objects.VehicleScript.Part,zombie.scripting.objects.VehicleScript.Model,float,float))
   8. [setScriptName(String)](#setScriptName(java.lang.String))
   9. [getModelInfoForPart(String)](#getModelInfoForPart(java.lang.String))
   10. [getModelInfoForPart(String, String)](#getModelInfoForPart(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneVehicle
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneVehicle

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneVehicle
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `init`

  `(package private) final ArrayList<UI3DScene.SceneVehicleModelInfo>`

  `modelInfo`

  `(package private) VehicleScript`

  `script`

  `(package private) String`

  `scriptName`

  `(package private) String`

  `showBonesModelId`

  `(package private) String`

  `showBonesPartId`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneVehicle(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

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

  `getBoneMatrix(VehicleScript.Part part,
  ModelAttachment attachment,
  org.joml.Matrix4f mat)`

  `(package private) UI3DScene.SceneVehicleModelInfo`

  `getModelInfoForPart(String partId)`

  `(package private) UI3DScene.SceneVehicleModelInfo`

  `getModelInfoForPart(String partId,
  String partModelId)`

  `(package private) org.joml.Matrix4f`

  `getTransformForPart(String partId,
  String partModelId,
  String attachmentName,
  boolean bBoneOnly,
  org.joml.Matrix4f transform)`

  `(package private) int`

  `hitTestBone(int boneIndex,
  UI3DScene.Ray boneRay,
  UI3DScene.Ray cameraRay,
  zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
  org.joml.Matrix4f modelMatrix,
  Vector2f out)`

  `(package private) String`

  `pickBone(VehicleScript.Part part,
  VehicleScript.Model model,
  float uiX,
  float uiY)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  `(package private) void`

  `setScriptName(String scriptName)`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getGlobalTransform, getLocalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### scriptName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName
  + ### script

    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script
  + ### modelInfo

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html "class in zombie.vehicles")> modelInfo
  + ### showBonesPartId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") showBonesPartId
  + ### showBonesModelId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") showBonesModelId
  + ### init

    boolean init
* Constructor Details
  -------------------

  + ### SceneVehicle

    SceneVehicle([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### renderMain

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()

    Specified by:
    :   `renderMain` in class `UI3DScene.SceneObject`
  + ### getAttachmentTransform

    org.joml.Matrix4f getAttachmentTransform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    org.joml.Matrix4f transform)

    Overrides:
    :   `getAttachmentTransform` in class `UI3DScene.SceneObject`
  + ### getBoneMatrix

    org.joml.Matrix4f getBoneMatrix([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") boneName,
    org.joml.Matrix4f mat)
  + ### getTransformForPart

    org.joml.Matrix4f getTransformForPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partModelId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    boolean bBoneOnly,
    org.joml.Matrix4f transform)
  + ### getBoneMatrix

    org.joml.Matrix4f getBoneMatrix([VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") part,
    [ModelAttachment](../scripting/objects/ModelAttachment.html "class in zombie.scripting.objects") attachment,
    org.joml.Matrix4f mat)
  + ### hitTestBone

    int hitTestBone(int boneIndex,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") boneRay,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") cameraRay,
    zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
    org.joml.Matrix4f modelMatrix,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") out)
  + ### pickBone

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickBone([VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") part,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") model,
    float uiX,
    float uiY)
  + ### setScriptName

    void setScriptName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### getModelInfoForPart

    [UI3DScene.SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html "class in zombie.vehicles") getModelInfoForPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId)
  + ### getModelInfoForPart

    [UI3DScene.SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html "class in zombie.vehicles") getModelInfoForPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partModelId)