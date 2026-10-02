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
3. [ScenePlayer](UI3DScene.ScenePlayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [ScenePlayer(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
6. [Method Details](#method-detail)
   1. [initAnimatedModel()](#initAnimatedModel())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ScenePlayer
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

[zombie.vehicles.UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.ScenePlayer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.ScenePlayer
extends [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles")

* Field Summary
  -------------

  ### Fields inherited from class [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html#field-summary "class in zombie.vehicles")

  `animatedModel, clearDepthBuffer, showBip01, showBones, useDeferredMovement`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ScenePlayer(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `initAnimatedModel()`

  ### Methods inherited from class [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html#method-summary "class in zombie.vehicles")

  `getAttachmentTransform, getBoneAxis, getBoneMatrix, getLocalTransform, hitTestBone, pickBone, renderMain`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getGlobalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ScenePlayer

    ScenePlayer([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### initAnimatedModel

    void initAnimatedModel()

    Specified by:
    :   `initAnimatedModel` in class `UI3DScene.SceneCharacter`