[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.skinnedmodel](package-summary.html)
2. [Vector3](Vector3.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [Vector3()](#%3Cinit%3E())
   2. [Vector3(float, float, float)](#%3Cinit%3E(float,float,float))
   3. [Vector3(Vector3)](#%3Cinit%3E(zombie.core.skinnedmodel.Vector3))
7. [Method Details](#method-detail)
   1. [x()](#x())
   2. [x(float)](#x(float))
   3. [y()](#y())
   4. [y(float)](#y(float))
   5. [z()](#z())
   6. [z(float)](#z(float))
   7. [set(float, float, float)](#set(float,float,float))
   8. [set(Vector3)](#set(zombie.core.skinnedmodel.Vector3))
   9. [reset()](#reset())
   10. [length()](#length())
   11. [normalize()](#normalize())
   12. [dot(Vector3)](#dot(zombie.core.skinnedmodel.Vector3))
   13. [cross(Vector3)](#cross(zombie.core.skinnedmodel.Vector3))
   14. [add(float, float, float)](#add(float,float,float))
   15. [add(Vector3)](#add(zombie.core.skinnedmodel.Vector3))
   16. [sub(float, float, float)](#sub(float,float,float))
   17. [sub(Vector3)](#sub(zombie.core.skinnedmodel.Vector3))
   18. [mul(float)](#mul(float))
   19. [mul(float, float, float)](#mul(float,float,float))
   20. [mul(Vector3)](#mul(zombie.core.skinnedmodel.Vector3))
   21. [get(int)](#get(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Vector3
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.Vector3

---

public final class Vector3
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector3()`

  `Vector3(float x,
  float y,
  float z)`

  `Vector3(Vector3 vec)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector3`

  `add(float x,
  float y,
  float z)`

  `Vector3`

  `add(Vector3 vec)`

  `Vector3`

  `cross(Vector3 vec)`

  `float`

  `dot(Vector3 vec)`

  `float`

  `get(int component)`

  `float`

  `length()`

  `Vector3`

  `mul(float f)`

  `Vector3`

  `mul(float x,
  float y,
  float z)`

  `Vector3`

  `mul(Vector3 vec)`

  `Vector3`

  `normalize()`

  `Vector3`

  `reset()`

  `Vector3`

  `set(float x,
  float y,
  float z)`

  `Vector3`

  `set(Vector3 vec)`

  `Vector3`

  `sub(float x,
  float y,
  float z)`

  `Vector3`

  `sub(Vector3 vec)`

  `float`

  `x()`

  `Vector3`

  `x(float x)`

  `float`

  `y()`

  `Vector3`

  `y(float y)`

  `float`

  `z()`

  `Vector3`

  `z(float z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
* Constructor Details
  -------------------

  + ### Vector3

    public Vector3()
  + ### Vector3

    public Vector3(float x,
    float y,
    float z)
  + ### Vector3

    public Vector3([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
* Method Details
  --------------

  + ### x

    public float x()
  + ### x

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") x(float x)
  + ### y

    public float y()
  + ### y

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") y(float y)
  + ### z

    public float z()
  + ### z

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") z(float z)
  + ### set

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") set(float x,
    float y,
    float z)
  + ### set

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") set([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### reset

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") reset()
  + ### length

    public float length()
  + ### normalize

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") normalize()
  + ### dot

    public float dot([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### cross

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") cross([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### add

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") add(float x,
    float y,
    float z)
  + ### add

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") add([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### sub

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") sub(float x,
    float y,
    float z)
  + ### sub

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") sub([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### mul

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") mul(float f)
  + ### mul

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") mul(float x,
    float y,
    float z)
  + ### mul

    public [Vector3](Vector3.html "class in zombie.core.skinnedmodel") mul([Vector3](Vector3.html "class in zombie.core.skinnedmodel") vec)
  + ### get

    public float get(int component)
    throws [IllegalArgumentException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html "class or interface in java.lang")

    Throws:
    :   `IllegalArgumentException`