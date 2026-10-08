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
3. [PolygonEditor](UI3DScene.PolygonEditor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scene](#scene)
   2. [plane](#plane)
   3. [rotate](#rotate)
   4. [gridPlane](#gridPlane)
6. [Constructor Details](#constructor-detail)
   1. [PolygonEditor(UI3DScene)](#%3Cinit%3E(zombie.vehicles.UI3DScene))
7. [Method Details](#method-detail)
   1. [setPlane(Vector3f, Vector3f, UI3DScene.GridPlane)](#setPlane(org.joml.Vector3f,org.joml.Vector3f,zombie.vehicles.UI3DScene.GridPlane))
   2. [uiToPlane3D(float, float, Vector3f)](#uiToPlane3D(float,float,org.joml.Vector3f))
   3. [uiToPlane2D(float, float, Vector2f)](#uiToPlane2D(float,float,org.joml.Vector2f))
   4. [planeTo3D(Vector2f, Vector3f)](#planeTo3D(org.joml.Vector2f,org.joml.Vector3f))
   5. [planeToUI(Vector2f, Vector2f)](#planeToUI(org.joml.Vector2f,org.joml.Vector2f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.PolygonEditor
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.PolygonEditor

Enclosing class:
:   `UI3DScene`

---

public static final class UI3DScene.PolygonEditor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.GridPlane`

  `gridPlane`

  `(package private) final UI3DScene.Plane`

  `plane`

  `(package private) final Vector3f`

  `rotate`

  `(package private) final UI3DScene`

  `scene`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PolygonEditor(UI3DScene scene)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) Vector3f`

  `planeTo3D(Vector2f pointOnPlane,
  Vector3f result)`

  `(package private) Vector2f`

  `planeToUI(Vector2f pointOnPlane,
  Vector2f result)`

  `(package private) void`

  `setPlane(Vector3f translate,
  Vector3f rotate,
  UI3DScene.GridPlane gridPlane)`

  `(package private) boolean`

  `uiToPlane2D(float uiX,
  float uiY,
  Vector2f result)`

  `(package private) boolean`

  `uiToPlane3D(float uiX,
  float uiY,
  Vector3f result)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### scene

    final [UI3DScene](UI3DScene.html "class in zombie.vehicles") scene
  + ### plane

    final [UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles") plane
  + ### rotate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### gridPlane

    [UI3DScene.GridPlane](UI3DScene.GridPlane.html "enum class in zombie.vehicles") gridPlane
* Constructor Details
  -------------------

  + ### PolygonEditor

    PolygonEditor([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene)
* Method Details
  --------------

  + ### setPlane

    void setPlane([Vector3f](../../org/joml/Vector3f.html "class in org.joml") translate,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rotate,
    [UI3DScene.GridPlane](UI3DScene.GridPlane.html "enum class in zombie.vehicles") gridPlane)
  + ### uiToPlane3D

    boolean uiToPlane3D(float uiX,
    float uiY,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") result)
  + ### uiToPlane2D

    boolean uiToPlane2D(float uiX,
    float uiY,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") result)
  + ### planeTo3D

    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") planeTo3D([Vector2f](../../org/joml/Vector2f.html "class in org.joml") pointOnPlane,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") result)
  + ### planeToUI

    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") planeToUI([Vector2f](../../org/joml/Vector2f.html "class in org.joml") pointOnPlane,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") result)