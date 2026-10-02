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
3. [Gizmo](UI3DScene.Gizmo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [LENGTH](#LENGTH)
   2. [THICKNESS](#THICKNESS)
   3. [visible](#visible)
6. [Constructor Details](#constructor-detail)
   1. [Gizmo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [hitTest(float, float)](#hitTest(float,float))
   2. [startTracking(float, float, UI3DScene.Axis)](#startTracking(float,float,zombie.vehicles.UI3DScene.Axis))
   3. [updateTracking(float, float)](#updateTracking(float,float))
   4. [stopTracking()](#stopTracking())
   5. [render()](#render())
   6. [getPointOnAxis(float, float, UI3DScene.Axis, Matrix4f, Vector3f)](#getPointOnAxis(float,float,zombie.vehicles.UI3DScene.Axis,org.joml.Matrix4f,org.joml.Vector3f))
   7. [hitTestRect(float, float, float, float, float, float, float, float)](#hitTestRect(float,float,float,float,float,float,float,float))
   8. [getPointOnDualAxis(float, float, UI3DScene.Axis, Matrix4f, Vector3f, Vector2f)](#getPointOnDualAxis(float,float,zombie.vehicles.UI3DScene.Axis,org.joml.Matrix4f,org.joml.Vector3f,org.joml.Vector2f))
   9. [renderLineToOrigin()](#renderLineToOrigin())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.Gizmo
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.Gizmo

Direct Known Subclasses:
:   `UI3DScene.RotateGizmo, UI3DScene.ScaleGizmo, UI3DScene.TranslateGizmo`

Enclosing class:
:   `UI3DScene`

---

private abstract class UI3DScene.Gizmo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static final float`

  `LENGTH`

  `(package private) static final float`

  `THICKNESS`

  `(package private) boolean`

  `visible`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Gizmo()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) Vector3f`

  `getPointOnAxis(float uiX,
  float uiY,
  UI3DScene.Axis axis1,
  org.joml.Matrix4f gizmoXfrm,
  Vector3f out)`

  `(package private) boolean`

  `getPointOnDualAxis(float uiX,
  float uiY,
  UI3DScene.Axis axis,
  org.joml.Matrix4f gizmoXfrm,
  Vector3f pointOnPlane3D,
  Vector2f pointOnPlane2D)`

  `(package private) abstract UI3DScene.Axis`

  `hitTest(float uiX,
  float uiY)`

  `(package private) boolean`

  `hitTestRect(float uiX,
  float uiY,
  float x0,
  float y0,
  float z0,
  float x1,
  float y1,
  float z1)`

  `(package private) abstract void`

  `render()`

  `(package private) void`

  `renderLineToOrigin()`

  `(package private) abstract void`

  `startTracking(float uiX,
  float uiY,
  UI3DScene.Axis axis)`

  `(package private) abstract void`

  `stopTracking()`

  `(package private) abstract void`

  `updateTracking(float uiX,
  float uiY)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### LENGTH

    static final float LENGTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.Gizmo.LENGTH)
  + ### THICKNESS

    static final float THICKNESS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.Gizmo.THICKNESS)
  + ### visible

    boolean visible
* Constructor Details
  -------------------

  + ### Gizmo

    private Gizmo()
* Method Details
  --------------

  + ### hitTest

    abstract [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") hitTest(float uiX,
    float uiY)
  + ### startTracking

    abstract void startTracking(float uiX,
    float uiY,
    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") axis)
  + ### updateTracking

    abstract void updateTracking(float uiX,
    float uiY)
  + ### stopTracking

    abstract void stopTracking()
  + ### render

    abstract void render()
  + ### getPointOnAxis

    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPointOnAxis(float uiX,
    float uiY,
    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") axis1,
    org.joml.Matrix4f gizmoXfrm,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### hitTestRect

    boolean hitTestRect(float uiX,
    float uiY,
    float x0,
    float y0,
    float z0,
    float x1,
    float y1,
    float z1)
  + ### getPointOnDualAxis

    boolean getPointOnDualAxis(float uiX,
    float uiY,
    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") axis,
    org.joml.Matrix4f gizmoXfrm,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") pointOnPlane3D,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") pointOnPlane2D)
  + ### renderLineToOrigin

    void renderLineToOrigin()