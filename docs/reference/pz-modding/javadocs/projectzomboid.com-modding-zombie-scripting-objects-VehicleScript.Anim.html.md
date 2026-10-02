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
3. [Anim](VehicleScript.Anim.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [anim](#anim)
   3. [rate](#rate)
   4. [animate](#animate)
   5. [loop](#loop)
   6. [reverse](#reverse)
   7. [offset](#offset)
   8. [angle](#angle)
   9. [sound](#sound)
6. [Constructor Details](#constructor-detail)
   1. [Anim()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Anim
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Anim

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Anim
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector3f`

  `angle`

  `String`

  `anim`

  `boolean`

  `animate`

  `String`

  `id`

  `boolean`

  `loop`

  `final Vector3f`

  `offset`

  `float`

  `rate`

  `boolean`

  `reverse`

  `String`

  `sound`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Anim()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private VehicleScript.Anim`

  `makeCopy()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### anim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") anim
  + ### rate

    public float rate
  + ### animate

    public boolean animate
  + ### loop

    public boolean loop
  + ### reverse

    public boolean reverse
  + ### offset

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") offset
  + ### angle

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") angle
  + ### sound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound
* Constructor Details
  -------------------

  + ### Anim

    public Anim()
* Method Details
  --------------

  + ### makeCopy

    private [VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects") makeCopy()