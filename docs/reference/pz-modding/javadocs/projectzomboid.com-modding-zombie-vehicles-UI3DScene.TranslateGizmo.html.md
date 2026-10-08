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
3. [TranslateGizmo](UI3DScene.TranslateGizmo.html)

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
6. [Constructor Details](#constructor-detail)
   1. [TranslateGizmo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [hitTest(float, float)](#hitTest(float,float))
   2. [startTracking(float, float, UI3DScene.Axis)](#startTracking(float,float,zombie.vehicles.UI3DScene.Axis))
   3. [updateTracking(float, float)](#updateTracking(float,float))
   4. [stopTracking()](#stopTracking())
   5. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.TranslateGizmo
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.Gizmo](UI3DScene.Gizmo.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.TranslateGizmo

Enclosing class:
:   `UI3DScene`

---

private final class UI3DScene.TranslateGizmo
extends [UI3DScene.Gizmo](UI3DScene.Gizmo.html "class in zombie.vehicles")

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

  `(package private) final org.joml.Matrix4f`

  `startXfrm`

  `(package private) UI3DScene.Axis`

  `trackAxis`

  ### Fields inherited from class [UI3DScene.Gizmo](UI3DScene.Gizmo.html#field-summary "class in zombie.vehicles")

  `LENGTH, THICKNESS, visible`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TranslateGizmo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.Axis`

  `hitTest(float uiX,
  float uiY)`

  `(package private) void`

  `render()`

  `(package private) void`

  `startTracking(float uiX,
  float uiY,
  UI3DScene.Axis axis)`

  `(package private) void`

  `stopTracking()`

  `(package private) void`

  `updateTracking(float uiX,
  float uiY)`

  ### Methods inherited from class [UI3DScene.Gizmo](UI3DScene.Gizmo.html#method-summary "class in zombie.vehicles")

  `getPointOnAxis, getPointOnDualAxis, hitTestRect, renderLineToOrigin`

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

    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") trackAxis
  + ### doubleAxis

    boolean doubleAxis
  + ### disk

    final org.lwjglx.util.glu.PartialDisk disk
* Constructor Details
  -------------------

  + ### TranslateGizmo

    private TranslateGizmo()
* Method Details
  --------------

  + ### hitTest

    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") hitTest(float uiX,
    float uiY)

    Specified by:
    :   `hitTest` in class `UI3DScene.Gizmo`
  + ### startTracking

    void startTracking(float uiX,
    float uiY,
    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") axis)

    Specified by:
    :   `startTracking` in class `UI3DScene.Gizmo`
  + ### updateTracking

    void updateTracking(float uiX,
    float uiY)

    Specified by:
    :   `updateTracking` in class `UI3DScene.Gizmo`
  + ### stopTracking

    void stopTracking()

    Specified by:
    :   `stopTracking` in class `UI3DScene.Gizmo`
  + ### render

    void render()

    Specified by:
    :   `render` in class `UI3DScene.Gizmo`