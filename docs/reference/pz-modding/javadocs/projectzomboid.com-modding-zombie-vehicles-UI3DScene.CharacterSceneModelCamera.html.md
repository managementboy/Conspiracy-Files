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
3. [CharacterSceneModelCamera](UI3DScene.CharacterSceneModelCamera.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [CharacterSceneModelCamera()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [Begin()](#Begin())
   2. [End()](#End())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.CharacterSceneModelCamera
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.ModelCamera

[zombie.vehicles.UI3DScene.SceneModelCamera](UI3DScene.SceneModelCamera.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.CharacterSceneModelCamera

All Implemented Interfaces:
:   `zombie.core.opengl.IModelCamera`

Enclosing class:
:   `UI3DScene`

---

private final class UI3DScene.CharacterSceneModelCamera
extends [UI3DScene.SceneModelCamera](UI3DScene.SceneModelCamera.html "class in zombie.vehicles")

* Field Summary
  -------------

  ### Fields inherited from class [UI3DScene.SceneModelCamera](UI3DScene.SceneModelCamera.html#field-summary "class in zombie.vehicles")

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

  `CharacterSceneModelCamera()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Begin()`

  `void`

  `End()`

  ### Methods inherited from class zombie.core.skinnedmodel.ModelCamera

  `BeginImposter, EndImposter`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### CharacterSceneModelCamera

    private CharacterSceneModelCamera()
* Method Details
  --------------

  + ### Begin

    public void Begin()
  + ### End

    public void End()