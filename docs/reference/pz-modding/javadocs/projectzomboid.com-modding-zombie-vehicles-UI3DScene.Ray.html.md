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
3. [Ray](UI3DScene.Ray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [origin](#origin)
   2. [direction](#direction)
   3. [t](#t)
6. [Constructor Details](#constructor-detail)
   1. [Ray()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(UI3DScene.Ray)](#set(zombie.vehicles.UI3DScene.Ray))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.Ray
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.Ray

Enclosing class:
:   `UI3DScene`

---

public static final class UI3DScene.Ray
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector3f`

  `direction`

  `final Vector3f`

  `origin`

  `float`

  `t`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Ray()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `UI3DScene.Ray`

  `set(UI3DScene.Ray rhs)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### origin

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") origin
  + ### direction

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") direction
  + ### t

    public float t
* Constructor Details
  -------------------

  + ### Ray

    public Ray()
* Method Details
  --------------

  + ### set

    public [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") set([UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") rhs)