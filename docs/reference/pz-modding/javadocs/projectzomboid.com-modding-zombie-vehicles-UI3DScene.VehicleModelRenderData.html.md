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
3. [VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [model](#model)
   2. [tex](#tex)
   3. [xfrm](#xfrm)
   4. [matrixPalette](#matrixPalette)
   5. [boneCoords](#boneCoords)
   6. [boneMatrices](#boneMatrices)
   7. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [VehicleModelRenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initSkeleton(UI3DScene.SceneVehicleModelInfo)](#initSkeleton(zombie.vehicles.UI3DScene.SceneVehicleModelInfo))
   2. [initSkeleton(AnimationPlayer)](#initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer))
   3. [initSkeleton(AnimationPlayer, int)](#initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer,int))
   4. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.VehicleModelRenderData
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.VehicleModelRenderData

Enclosing class:
:   `UI3DScene`

---

private static class UI3DScene.VehicleModelRenderData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final gnu.trove.list.array.TFloatArrayList`

  `boneCoords`

  `private final ArrayList<org.lwjgl.util.vector.Matrix4f>`

  `boneMatrices`

  `FloatBuffer`

  `matrixPalette`

  `zombie.core.skinnedmodel.model.Model`

  `model`

  `private static final zombie.popman.ObjectPool<UI3DScene.VehicleModelRenderData>`

  `s_pool`

  `Texture`

  `tex`

  `final org.joml.Matrix4f`

  `xfrm`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleModelRenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)`

  `private void`

  `initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
  int boneIndex)`

  `(package private) void`

  `initSkeleton(UI3DScene.SceneVehicleModelInfo modelInfo)`

  `(package private) void`

  `release()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### model

    public zombie.core.skinnedmodel.model.Model model
  + ### tex

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### xfrm

    public final org.joml.Matrix4f xfrm
  + ### matrixPalette

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") matrixPalette
  + ### boneCoords

    private final gnu.trove.list.array.TFloatArrayList boneCoords
  + ### boneMatrices

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<org.lwjgl.util.vector.Matrix4f> boneMatrices
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.VehicleModelRenderData](UI3DScene.VehicleModelRenderData.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### VehicleModelRenderData

    private VehicleModelRenderData()
* Method Details
  --------------

  + ### initSkeleton

    void initSkeleton([UI3DScene.SceneVehicleModelInfo](UI3DScene.SceneVehicleModelInfo.html "class in zombie.vehicles") modelInfo)
  + ### initSkeleton

    private void initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)
  + ### initSkeleton

    private void initSkeleton(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
    int boneIndex)
  + ### release

    void release()