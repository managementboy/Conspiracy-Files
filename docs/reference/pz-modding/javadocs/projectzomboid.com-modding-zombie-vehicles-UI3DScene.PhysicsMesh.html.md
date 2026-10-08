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
3. [PhysicsMesh](UI3DScene.PhysicsMesh.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [rx](#rx)
   5. [ry](#ry)
   6. [rz](#rz)
   7. [r](#r)
   8. [g](#g)
   9. [b](#b)
   10. [physicsShapeScript](#physicsShapeScript)
   11. [scale](#scale)
   12. [points](#points)
6. [Constructor Details](#constructor-detail)
   1. [PhysicsMesh()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(Vector3f, Vector3f, float, String, float, float, float)](#set(org.joml.Vector3f,org.joml.Vector3f,float,java.lang.String,float,float,float))
   2. [set(UI3DScene.PhysicsMesh)](#set(zombie.vehicles.UI3DScene.PhysicsMesh))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.PhysicsMesh
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.PhysicsMesh

Enclosing class:
:   `UI3DScene`

---

public static final class UI3DScene.PhysicsMesh
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `b`

  `(package private) float`

  `g`

  `(package private) String`

  `physicsShapeScript`

  `(package private) float[]`

  `points`

  `(package private) float`

  `r`

  `(package private) float`

  `rx`

  `(package private) float`

  `ry`

  `(package private) float`

  `rz`

  `(package private) float`

  `scale`

  `(package private) float`

  `x`

  `(package private) float`

  `y`

  `(package private) float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PhysicsMesh()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.PhysicsMesh`

  `set(Vector3f translate,
  Vector3f rotate,
  float scale,
  String physicsShapeScript,
  float r,
  float g,
  float b)`

  `(package private) UI3DScene.PhysicsMesh`

  `set(UI3DScene.PhysicsMesh rhs)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    float x
  + ### y

    float y
  + ### z

    float z
  + ### rx

    float rx
  + ### ry

    float ry
  + ### rz

    float rz
  + ### r

    float r
  + ### g

    float g
  + ### b

    float b
  + ### physicsShapeScript

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") physicsShapeScript
  + ### scale

    float scale
  + ### points

    float[] points
* Constructor Details
  -------------------

  + ### PhysicsMesh

    public PhysicsMesh()
* Method Details
  --------------

  + ### set

    [UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles") set([Vector3f](../../org/joml/Vector3f.html "class in org.joml") translate,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rotate,
    float scale,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") physicsShapeScript,
    float r,
    float g,
    float b)
  + ### set

    [UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles") set([UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles") rhs)