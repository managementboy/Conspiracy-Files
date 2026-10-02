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
3. [Plane](UI3DScene.Plane.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [point](#point)
   2. [normal](#normal)
6. [Constructor Details](#constructor-detail)
   1. [Plane()](#%3Cinit%3E())
   2. [Plane(Vector3f, Vector3f)](#%3Cinit%3E(org.joml.Vector3f,org.joml.Vector3f))
7. [Method Details](#method-detail)
   1. [set(Vector3f, Vector3f)](#set(org.joml.Vector3f,org.joml.Vector3f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.Plane
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.Plane

Enclosing class:
:   `UI3DScene`

---

public static final class UI3DScene.Plane
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector3f`

  `normal`

  `final Vector3f`

  `point`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Plane()`

  `Plane(Vector3f normal,
  Vector3f point)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `UI3DScene.Plane`

  `set(Vector3f normal,
  Vector3f point)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### point

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") point
  + ### normal

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") normal
* Constructor Details
  -------------------

  + ### Plane

    public Plane()
  + ### Plane

    public Plane([Vector3f](../../org/joml/Vector3f.html "class in org.joml") normal,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") point)
* Method Details
  --------------

  + ### set

    public [UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles") set([Vector3f](../../org/joml/Vector3f.html "class in org.joml") normal,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") point)