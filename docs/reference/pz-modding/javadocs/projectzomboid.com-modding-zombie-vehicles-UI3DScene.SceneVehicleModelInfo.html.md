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
3. [SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sceneVehicle](#sceneVehicle)
   2. [part](#part)
   3. [scriptModel](#scriptModel)
   4. [modelScript](#modelScript)
   5. [wheelIndex](#wheelIndex)
   6. [model](#model)
   7. [tex](#tex)
   8. [animPlayer](#animPlayer)
   9. [track](#track)
   10. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [SceneVehicleModelInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getAnimationPlayer()](#getAnimationPlayer())
   2. [releaseAnimationPlayer()](#releaseAnimationPlayer())
   3. [playPartAnim(String)](#playPartAnim(java.lang.String))
   4. [updateAnimationPlayer()](#updateAnimationPlayer())
   5. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneVehicleModelInfo
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.SceneVehicleModelInfo

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneVehicleModelInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animPlayer`

  `(package private) zombie.core.skinnedmodel.model.Model`

  `model`

  `(package private) ModelScript`

  `modelScript`

  `(package private) VehicleScript.Part`

  `part`

  `private static final zombie.popman.ObjectPool<UI3DScene.SceneVehicleModelInfo>`

  `s_pool`

  `(package private) UI3DScene.SceneVehicle`

  `sceneVehicle`

  `(package private) VehicleScript.Model`

  `scriptModel`

  `(package private) Texture`

  `tex`

  `(package private) zombie.core.skinnedmodel.animation.AnimationTrack`

  `track`

  `(package private) int`

  `wheelIndex`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SceneVehicleModelInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `getAnimationPlayer()`

  `void`

  `playPartAnim(String animId)`

  `(package private) void`

  `release()`

  `void`

  `releaseAnimationPlayer()`

  `protected void`

  `updateAnimationPlayer()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sceneVehicle

    [UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") sceneVehicle
  + ### part

    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") part
  + ### scriptModel

    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel
  + ### modelScript

    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript
  + ### wheelIndex

    int wheelIndex
  + ### model

    zombie.core.skinnedmodel.model.Model model
  + ### tex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### animPlayer

    zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer
  + ### track

    zombie.core.skinnedmodel.animation.AnimationTrack track
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### SceneVehicleModelInfo

    private SceneVehicleModelInfo()
* Method Details
  --------------

  + ### getAnimationPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer getAnimationPlayer()
  + ### releaseAnimationPlayer

    public void releaseAnimationPlayer()
  + ### playPartAnim

    public void playPartAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### updateAnimationPlayer

    protected void updateAnimationPlayer()
  + ### release

    void release()