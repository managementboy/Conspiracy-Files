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
3. [VehicleRenderData](UI3DScene.VehicleRenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [models](#models)
   2. [partToRenderData](#partToRenderData)
   3. [drawer](#drawer)
   4. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [VehicleRenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initVehicle(UI3DScene.SceneVehicle)](#initVehicle(zombie.vehicles.UI3DScene.SceneVehicle))
   2. [initVehicleModel(UI3DScene.SceneVehicle)](#initVehicleModel(zombie.vehicles.UI3DScene.SceneVehicle))
   3. [initWheelModel(UI3DScene.SceneVehicle, VehicleScript.Part, Matrix4f)](#initWheelModel(zombie.vehicles.UI3DScene.SceneVehicle,zombie.scripting.objects.VehicleScript.Part,org.joml.Matrix4f))
   4. [initPartModels(UI3DScene.SceneVehicle, VehicleScript.Part, Matrix4f)](#initPartModels(zombie.vehicles.UI3DScene.SceneVehicle,zombie.scripting.objects.VehicleScript.Part,org.joml.Matrix4f))
   5. [initPartModel(UI3DScene.SceneVehicle, VehicleScript.Part, VehicleScript.Model, Matrix4f)](#initPartModel(zombie.vehicles.UI3DScene.SceneVehicle,zombie.scripting.objects.VehicleScript.Part,zombie.scripting.objects.VehicleScript.Model,org.joml.Matrix4f))
   6. [initChildPartModel(UI3DScene.SceneVehicle, UI3DScene.VehicleModelRenderData, VehicleScript.Part, VehicleScript.Model)](#initChildPartModel(zombie.vehicles.UI3DScene.SceneVehicle,zombie.vehicles.UI3DScene.VehicleModelRenderData,zombie.scripting.objects.VehicleScript.Part,zombie.scripting.objects.VehicleScript.Model))
   7. [initTransform(UI3DScene.SceneVehicle, AnimationPlayer, ModelScript, ModelScript, String, String, Matrix4f)](#initTransform(zombie.vehicles.UI3DScene.SceneVehicle,zombie.core.skinnedmodel.animation.AnimationPlayer,zombie.scripting.objects.ModelScript,zombie.scripting.objects.ModelScript,java.lang.String,java.lang.String,org.joml.Matrix4f))
   8. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.VehicleRenderData
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.VehicleRenderData

Enclosing class:
:   `UI3DScene`

---

private static class UI3DScene.VehicleRenderData
extends [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final UI3DScene.VehicleDrawer`

  `drawer`

  `(package private) final ArrayList<UI3DScene.VehicleModelRenderData>`

  `models`

  `(package private) final HashMap<String, UI3DScene.VehicleModelRenderData>`

  `partToRenderData`

  `private static final zombie.popman.ObjectPool<UI3DScene.VehicleRenderData>`

  `s_pool`

  ### Fields inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#field-summary "class in zombie.vehicles")

  `object, transform`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleRenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `initChildPartModel(UI3DScene.SceneVehicle sceneVehicle,
  UI3DScene.VehicleModelRenderData parentRenderData,
  VehicleScript.Part scriptPart,
  VehicleScript.Model scriptModel)`

  `private void`

  `initPartModel(UI3DScene.SceneVehicle sceneVehicle,
  VehicleScript.Part scriptPart,
  VehicleScript.Model scriptModel,
  org.joml.Matrix4f vehicleTransform)`

  `private void`

  `initPartModels(UI3DScene.SceneVehicle sceneVehicle,
  VehicleScript.Part scriptPart,
  org.joml.Matrix4f vehicleTransform)`

  `(package private) void`

  `initTransform(UI3DScene.SceneVehicle sceneVehicle,
  zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer,
  ModelScript parentModelScript,
  ModelScript modelScript,
  String attachmentNameParent,
  String attachmentNameSelf,
  org.joml.Matrix4f transform)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `initVehicle(UI3DScene.SceneVehicle sceneVehicle)`

  `private void`

  `initVehicleModel(UI3DScene.SceneVehicle sceneVehicle)`

  `private void`

  `initWheelModel(UI3DScene.SceneVehicle sceneVehicle,
  VehicleScript.Part scriptPart,
  org.joml.Matrix4f vehicleTransform)`

  `(package private) void`

  `release()`

  ### Methods inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#method-summary "class in zombie.vehicles")

  `init`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### models

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html "class in zombie.vehicles")> models
  + ### partToRenderData

    final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [UI3DScene.VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html "class in zombie.vehicles")> partToRenderData
  + ### drawer

    final [UI3DScene.VehicleDrawer](UI3DScene.VehicleDrawer.html "class in zombie.vehicles") drawer
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.VehicleRenderData](UI3DScene.VehicleRenderData.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### VehicleRenderData

    private VehicleRenderData()
* Method Details
  --------------

  + ### initVehicle

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") initVehicle([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle)
  + ### initVehicleModel

    private void initVehicleModel([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle)
  + ### initWheelModel

    private void initWheelModel([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart,
    org.joml.Matrix4f vehicleTransform)
  + ### initPartModels

    private void initPartModels([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart,
    org.joml.Matrix4f vehicleTransform)
  + ### initPartModel

    private void initPartModel([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel,
    org.joml.Matrix4f vehicleTransform)
  + ### initChildPartModel

    void initChildPartModel([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    [UI3DScene.VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html "class in zombie.vehicles") parentRenderData,
    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel)
  + ### initTransform

    void initTransform([UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle,
    zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") parentModelScript,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameParent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameSelf,
    org.joml.Matrix4f transform)
  + ### release

    void release()

    Overrides:
    :   `release` in class `UI3DScene.SceneObjectRenderData`