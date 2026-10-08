[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [ModelInfo](BaseVehicle.ModelInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [part](#part)
   2. [scriptModel](#scriptModel)
   3. [modelScript](#modelScript)
   4. [wheelIndex](#wheelIndex)
   5. [renderTransform](#renderTransform)
   6. [modelInstance](#modelInstance)
   7. [animPlayer](#animPlayer)
   8. [track](#track)
6. [Constructor Details](#constructor-detail)
   1. [ModelInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getAnimationPlayer()](#getAnimationPlayer())
   2. [releaseAnimationPlayer()](#releaseAnimationPlayer())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.ModelInfo
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.BaseVehicle.ModelInfo

Enclosing class:
:   `BaseVehicle`

---

public static final class BaseVehicle.ModelInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animPlayer`

  `zombie.core.skinnedmodel.model.VehicleSubModelInstance`

  `modelInstance`

  `ModelScript`

  `modelScript`

  `VehiclePart`

  `part`

  `final org.joml.Matrix4f`

  `renderTransform`

  `VehicleScript.Model`

  `scriptModel`

  `zombie.core.skinnedmodel.animation.AnimationTrack`

  `track`

  `int`

  `wheelIndex`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ModelInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `getAnimationPlayer()`

  `void`

  `releaseAnimationPlayer()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### part

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") part
  + ### scriptModel

    public [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel
  + ### modelScript

    public [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript
  + ### wheelIndex

    public int wheelIndex
  + ### renderTransform

    public final org.joml.Matrix4f renderTransform
  + ### modelInstance

    public zombie.core.skinnedmodel.model.VehicleSubModelInstance modelInstance
  + ### animPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer
  + ### track

    public zombie.core.skinnedmodel.animation.AnimationTrack track
* Constructor Details
  -------------------

  + ### ModelInfo

    public ModelInfo()
* Method Details
  --------------

  + ### getAnimationPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer getAnimationPlayer()
  + ### releaseAnimationPlayer

    public void releaseAnimationPlayer()