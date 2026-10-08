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
3. [Position](VehicleScript.Position.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [offset](#offset)
   3. [rotate](#rotate)
   4. [area](#area)
6. [Constructor Details](#constructor-detail)
   1. [Position()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getOffset()](#getOffset())
   3. [getRotate()](#getRotate())
   4. [getArea()](#getArea())
   5. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Position
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Position

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Position
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `area`

  `String`

  `id`

  `final Vector3f`

  `offset`

  `final Vector3f`

  `rotate`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Position()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getArea()`

  `String`

  `getId()`

  `Vector3f`

  `getOffset()`

  `Vector3f`

  `getRotate()`

  `private VehicleScript.Position`

  `makeCopy()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### offset

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") offset
  + ### rotate

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### area

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") area
* Constructor Details
  -------------------

  + ### Position

    public Position()
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getOffset()
  + ### getRotate

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getRotate()
  + ### getArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getArea()
  + ### makeCopy

    private [VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects") makeCopy()