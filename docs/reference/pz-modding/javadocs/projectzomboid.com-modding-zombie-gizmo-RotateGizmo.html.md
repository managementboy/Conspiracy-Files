[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gizmo](package-summary.html)
2. [RotateGizmo](RotateGizmo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [trackAxis](#trackAxis)
   2. [snap](#snap)
   3. [trackCircle](#trackCircle)
   4. [startXfrm](#startXfrm)
   5. [startInvXfrm](#startInvXfrm)
   6. [startPointOnCircle](#startPointOnCircle)
   7. [startRotate](#startRotate)
   8. [currentPointOnCircle](#currentPointOnCircle)
   9. [circlePointsMain](#circlePointsMain)
   10. [circlePointsRender](#circlePointsRender)
6. [Constructor Details](#constructor-detail)
   1. [RotateGizmo(Scene)](#%3Cinit%3E(zombie.gizmo.Scene))
7. [Method Details](#method-detail)
   1. [hitTest(float, float)](#hitTest(float,float))
   2. [startTracking(float, float, Axis)](#startTracking(float,float,zombie.gizmo.Axis))
   3. [updateTracking(float, float)](#updateTracking(float,float))
   4. [stopTracking()](#stopTracking())
   5. [render()](#render())
   6. [getCircleSegments(Vector3f, float, Vector3f, Vector3f, ArrayList)](#getCircleSegments(org.joml.Vector3f,float,org.joml.Vector3f,org.joml.Vector3f,java.util.ArrayList))
   7. [hitTestCircle(UI3DScene.Ray, ArrayList, Vector2f)](#hitTestCircle(zombie.vehicles.UI3DScene.Ray,java.util.ArrayList,org.joml.Vector2f))
   8. [renderAxis(Matrix4f, float, float, float, float, float, UI3DScene.Ray)](#renderAxis(org.joml.Matrix4f,float,float,float,float,float,zombie.vehicles.UI3DScene.Ray))
   9. [renderAxis(Vector3f, float, Vector3f, Vector3f, float, float, float, UI3DScene.Ray)](#renderAxis(org.joml.Vector3f,float,org.joml.Vector3f,org.joml.Vector3f,float,float,float,zombie.vehicles.UI3DScene.Ray))
   10. [getPointOnAxis(float, float, Axis, UI3DScene.Circle, Matrix4f, Vector3f)](#getPointOnAxis(float,float,zombie.gizmo.Axis,zombie.vehicles.UI3DScene.Circle,org.joml.Matrix4f,org.joml.Vector3f))
   11. [calculateRotation(Vector3f, Vector3f, UI3DScene.Circle)](#calculateRotation(org.joml.Vector3f,org.joml.Vector3f,zombie.vehicles.UI3DScene.Circle))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RotateGizmo
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gizmo.Gizmo

zombie.gizmo.RotateGizmo

---

public class RotateGizmo
extends zombie.gizmo.Gizmo

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<Vector3f>`

  `circlePointsMain`

  `(package private) final ArrayList<Vector3f>`

  `circlePointsRender`

  `(package private) final Vector3f`

  `currentPointOnCircle`

  `(package private) boolean`

  `snap`

  `(package private) final org.joml.Matrix4f`

  `startInvXfrm`

  `(package private) final Vector3f`

  `startPointOnCircle`

  `(package private) final Vector3f`

  `startRotate`

  `(package private) final org.joml.Matrix4f`

  `startXfrm`

  `(package private) zombie.gizmo.Axis`

  `trackAxis`

  `(package private) final UI3DScene.Circle`

  `trackCircle`

  ### Fields inherited from class zombie.gizmo.Gizmo

  `gizmoAxisVisibleX, gizmoAxisVisibleY, gizmoAxisVisibleZ, gizmoChild, gizmoScale, gizmoWorldPos, LENGTH, originGeometry, reverseZAxis, scene, table, THICKNESS, transformMode, vboRenderer, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RotateGizmo(zombie.gizmo.Scene scene)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) float`

  `calculateRotation(Vector3f pp,
  Vector3f pc,
  UI3DScene.Circle circle)`

  `(package private) void`

  `getCircleSegments(Vector3f center,
  float radius,
  Vector3f orthoNormal1,
  Vector3f orthoNormal2,
  ArrayList<Vector3f> out)`

  `(package private) Vector3f`

  `getPointOnAxis(float uiX,
  float uiY,
  zombie.gizmo.Axis axis,
  UI3DScene.Circle circle,
  org.joml.Matrix4f gizmoXfrm,
  Vector3f out)`

  `(package private) zombie.gizmo.Axis`

  `hitTest(float uiX,
  float uiY)`

  `private float`

  `hitTestCircle(UI3DScene.Ray cameraRay,
  ArrayList<Vector3f> circlePoints,
  Vector2f closestPoint)`

  `(package private) void`

  `render()`

  `(package private) void`

  `renderAxis(org.joml.Matrix4f axisMatrix4f,
  float r,
  float c,
  float r1,
  float g1,
  float b1,
  UI3DScene.Ray cameraRay)`

  `(package private) void`

  `renderAxis(Vector3f center,
  float radius,
  Vector3f orthoNormal1,
  Vector3f orthoNormal2,
  float r,
  float g,
  float b,
  UI3DScene.Ray cameraRay)`

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

  + ### trackAxis

    zombie.gizmo.Axis trackAxis
  + ### snap

    boolean snap
  + ### trackCircle

    final [UI3DScene.Circle](../vehicles/UI3DScene.Circle.html "class in zombie.vehicles") trackCircle
  + ### startXfrm

    final org.joml.Matrix4f startXfrm
  + ### startInvXfrm

    final org.joml.Matrix4f startInvXfrm
  + ### startPointOnCircle

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") startPointOnCircle
  + ### startRotate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") startRotate
  + ### currentPointOnCircle

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") currentPointOnCircle
  + ### circlePointsMain

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> circlePointsMain
  + ### circlePointsRender

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> circlePointsRender
* Constructor Details
  -------------------

  + ### RotateGizmo

    RotateGizmo(zombie.gizmo.Scene scene)
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
  + ### getCircleSegments

    void getCircleSegments([Vector3f](../../org/joml/Vector3f.html "class in org.joml") center,
    float radius,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") orthoNormal1,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") orthoNormal2,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> out)
  + ### hitTestCircle

    private float hitTestCircle([UI3DScene.Ray](../vehicles/UI3DScene.Ray.html "class in zombie.vehicles") cameraRay,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector3f](../../org/joml/Vector3f.html "class in org.joml")> circlePoints,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closestPoint)
  + ### renderAxis

    void renderAxis(org.joml.Matrix4f axisMatrix4f,
    float r,
    float c,
    float r1,
    float g1,
    float b1,
    [UI3DScene.Ray](../vehicles/UI3DScene.Ray.html "class in zombie.vehicles") cameraRay)
  + ### renderAxis

    void renderAxis([Vector3f](../../org/joml/Vector3f.html "class in org.joml") center,
    float radius,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") orthoNormal1,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") orthoNormal2,
    float r,
    float g,
    float b,
    [UI3DScene.Ray](../vehicles/UI3DScene.Ray.html "class in zombie.vehicles") cameraRay)
  + ### getPointOnAxis

    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPointOnAxis(float uiX,
    float uiY,
    zombie.gizmo.Axis axis,
    [UI3DScene.Circle](../vehicles/UI3DScene.Circle.html "class in zombie.vehicles") circle,
    org.joml.Matrix4f gizmoXfrm,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### calculateRotation

    float calculateRotation([Vector3f](../../org/joml/Vector3f.html "class in org.joml") pp,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") pc,
    [UI3DScene.Circle](../vehicles/UI3DScene.Circle.html "class in zombie.vehicles") circle)