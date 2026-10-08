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
3. [PositionRotation](UI3DScene.PositionRotation.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pos](#pos)
   2. [rot](#rot)
   3. [relativeToOrigin](#relativeToOrigin)
6. [Constructor Details](#constructor-detail)
   1. [PositionRotation()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(UI3DScene.PositionRotation)](#set(zombie.vehicles.UI3DScene.PositionRotation))
   2. [set(float, float, float)](#set(float,float,float))
   3. [set(float, float, float, float, float, float)](#set(float,float,float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.PositionRotation
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.PositionRotation

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.PositionRotation
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final Vector3f`

  `pos`

  `(package private) boolean`

  `relativeToOrigin`

  `(package private) final Vector3f`

  `rot`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PositionRotation()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.PositionRotation`

  `set(float x,
  float y,
  float z)`

  `(package private) UI3DScene.PositionRotation`

  `set(float x,
  float y,
  float z,
  float rx,
  float ry,
  float rz)`

  `(package private) UI3DScene.PositionRotation`

  `set(UI3DScene.PositionRotation rhs)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pos

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") pos
  + ### rot

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rot
  + ### relativeToOrigin

    boolean relativeToOrigin
* Constructor Details
  -------------------

  + ### PositionRotation

    private PositionRotation()
* Method Details
  --------------

  + ### set

    [UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") set([UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") rhs)
  + ### set

    [UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") set(float x,
    float y,
    float z)
  + ### set

    [UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") set(float x,
    float y,
    float z,
    float rx,
    float ry,
    float rz)