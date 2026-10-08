[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gizmo](package-summary.html)
2. [TranslateGizmo](TranslateGizmo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [startXfrm](#startXfrm)
   2. [startInvXfrm](#startInvXfrm)
   3. [startPos](#startPos)
   4. [currentPos](#currentPos)
   5. [trackAxis](#trackAxis)
   6. [doubleAxis](#doubleAxis)
   7. [disk](#disk)
   8. [startTranslate](#startTranslate)
6. [Constructor Details](#constructor-detail)
   1. [TranslateGizmo(Scene)](#%3Cinit%3E(zombie.gizmo.Scene))
7. [Method Details](#method-detail)
   1. [hitTest(float, float)](#hitTest(float,float))
   2. [startTracking(float, float, Axis)](#startTracking(float,float,zombie.gizmo.Axis))
   3. [updateTracking(float, float)](#updateTracking(float,float))
   4. [stopTracking()](#stopTracking())
   5. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TranslateGizmo
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gizmo.Gizmo

zombie.gizmo.TranslateGizmo

---

public class TranslateGizmo
extends zombie.gizmo.Gizmo

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final Vector3f`

  `currentPos`

  `(package private) final org.lwjglx.util.glu.PartialDisk`

  `disk`

  `(package private) boolean`

  `doubleAxis`

  `(package private) final org.joml.Matrix4f`

  `startInvXfrm`

  `(package private) final Vector3f`

  `startPos`

  `(package private) final Vector3f`

  `startTranslate`

  `(package private) final org.joml.Matrix4f`

  `startXfrm`

  `(package private) zombie.gizmo.Axis`

  `trackAxis`

  ### Fields inherited from class zombie.gizmo.Gizmo

  `gizmoAxisVisibleX, gizmoAxisVisibleY, gizmoAxisVisibleZ, gizmoChild, gizmoScale, gizmoWorldPos, LENGTH, originGeometry, reverseZAxis, scene, table, THICKNESS, transformMode, vboRenderer, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TranslateGizmo(zombie.gizmo.Scene scene)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) zombie.gizmo.Axis`

  `hitTest(float uiX,
  float uiY)`

  `(package private) void`

  `render()`

  `(package private) void`

  `startTracking(float uiX,
  float uiY,
  zombie.gizmo.Axis axis)`

  `(package private) void`

  `stopTracking()`

  `(package private) void`

  `updateTracking(float uiX,
  float uiY)`

  ### Methods inherited from class zombie.gizmo.Gizmo

  `allocMatrix4f, allocPlane, allocQuaternionf, allocRay, allocVector2f, allocVector3f, getChild, getOrigin, getParent, getPointOnAxis, getPointOnDualAxis, getRotation, getScale, getTable, getTransformMode, getWorldPosition, isVisible, releaseMatrix4f, releasePlane, releaseQuaternionf, releaseRay, releaseVector2f, releaseVector3f, renderLineToOrigin, setRotation, setTable, setTransformMode, setVisible, setWorldPosition`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### startXfrm

    final org.joml.Matrix4f startXfrm
  + ### startInvXfrm

    final org.joml.Matrix4f startInvXfrm
  + ### startPos

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") startPos
  + ### currentPos

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") currentPos
  + ### trackAxis

    zombie.gizmo.Axis trackAxis
  + ### doubleAxis

    boolean doubleAxis
  + ### disk

    final org.lwjglx.util.glu.PartialDisk disk
  + ### startTranslate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") startTranslate
* Constructor Details
  -------------------

  + ### TranslateGizmo

    TranslateGizmo(zombie.gizmo.Scene scene)
* Method Details
  --------------

  + ### hitTest

    zombie.gizmo.Axis hitTest(float uiX,
    float uiY)

    Specified by:
    :   `hitTest` in class `zombie.gizmo.Gizmo`
  + ### startTracking

    void startTracking(float uiX,
    float uiY,
    zombie.gizmo.Axis axis)

    Specified by:
    :   `startTracking` in class `zombie.gizmo.Gizmo`
  + ### updateTracking

    void updateTracking(float uiX,
    float uiY)

    Specified by:
    :   `updateTracking` in class `zombie.gizmo.Gizmo`
  + ### stopTracking

    void stopTracking()

    Specified by:
    :   `stopTracking` in class `zombie.gizmo.Gizmo`
  + ### render

    void render()

    Specified by:
    :   `render` in class `zombie.gizmo.Gizmo`