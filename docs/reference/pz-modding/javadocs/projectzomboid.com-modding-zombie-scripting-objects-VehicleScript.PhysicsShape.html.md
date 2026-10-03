[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [VehicleScript](VehicleScript.html)
3. [PhysicsShape](VehicleScript.PhysicsShape.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [offset](#offset)
   3. [rotate](#rotate)
   4. [extents](#extents)
   5. [radius](#radius)
   6. [physicsShapeScript](#physicsShapeScript)
6. [Constructor Details](#constructor-detail)
   1. [PhysicsShape()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getTypeString()](#getTypeString())
   2. [getOffset()](#getOffset())
   3. [getExtents()](#getExtents())
   4. [getRotate()](#getRotate())
   5. [getRadius()](#getRadius())
   6. [setRadius(float)](#setRadius(float))
   7. [getPhysicsShapeScript()](#getPhysicsShapeScript())
   8. [setPhysicsShapeScript(String)](#setPhysicsShapeScript(java.lang.String))
   9. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.PhysicsShape
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.PhysicsShape

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.PhysicsShape
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector3f`

  `extents`

  `final Vector3f`

  `offset`

  `String`

  `physicsShapeScript`

  `float`

  `radius`

  `final Vector3f`

  `rotate`

  `int`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PhysicsShape()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector3f`

  `getExtents()`

  `Vector3f`

  `getOffset()`

  `String`

  `getPhysicsShapeScript()`

  `float`

  `getRadius()`

  `Vector3f`

  `getRotate()`

  `String`

  `getTypeString()`

  `private VehicleScript.PhysicsShape`

  `makeCopy()`

  `void`

  `setPhysicsShapeScript(String scriptId)`

  `void`

  `setRadius(float radius)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    public int type
  + ### offset

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") offset
  + ### rotate

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### extents

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") extents
  + ### radius

    public float radius
  + ### physicsShapeScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") physicsShapeScript
* Constructor Details
  -------------------

  + ### PhysicsShape

    public PhysicsShape()
* Method Details
  --------------

  + ### getTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTypeString()
  + ### getOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getOffset()
  + ### getExtents

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getExtents()
  + ### getRotate

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getRotate()
  + ### getRadius

    public float getRadius()
  + ### setRadius

    public void setRadius(float radius)
  + ### getPhysicsShapeScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPhysicsShapeScript()
  + ### setPhysicsShapeScript

    public void setPhysicsShapeScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptId)
  + ### makeCopy

    private [VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects") makeCopy()