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
3. [SceneModelCamera](UI3DScene.SceneModelCamera.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderData](#renderData)
6. [Constructor Details](#constructor-detail)
   1. [SceneModelCamera()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneModelCamera
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.ModelCamera

zombie.vehicles.UI3DScene.SceneModelCamera

All Implemented Interfaces:
:   `zombie.core.opengl.IModelCamera`

Direct Known Subclasses:
:   `UI3DScene.CharacterSceneModelCamera, UI3DScene.VehicleSceneModelCamera`

Enclosing class:
:   `UI3DScene`

---

private abstract class UI3DScene.SceneModelCamera
extends zombie.core.skinnedmodel.ModelCamera

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderData`

  ### Fields inherited from class zombie.core.skinnedmodel.ModelCamera

  `depthMask, instance, inVehicle, useAngle, useWorldIso, x, y, z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SceneModelCamera()`
* Method Summary
  --------------

  ### Methods inherited from class zombie.core.skinnedmodel.ModelCamera

  `BeginImposter, EndImposter`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.opengl.IModelCamera

  `Begin, End`

* Field Details
  -------------

  + ### renderData

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderData
* Constructor Details
  -------------------

  + ### SceneModelCamera

    private SceneModelCamera()