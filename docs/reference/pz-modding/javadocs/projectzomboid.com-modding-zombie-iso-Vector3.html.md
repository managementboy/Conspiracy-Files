[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
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
   2. [Vector3(Vector3)](#%3Cinit%3E(zombie.iso.Vector3))
   3. [Vector3(float, float, float)](#%3Cinit%3E(float,float,float))
7. [Method Details](#method-detail)
   1. [fromLengthDirection(float, float)](#fromLengthDirection(float,float))
   2. [dot(float, float, float, float)](#dot(float,float,float,float))
   3. [rotate(float)](#rotate(float))
   4. [rotatey(float)](#rotatey(float))
   5. [add(Vector2)](#add(zombie.iso.Vector2))
   6. [addToThis(Vector2)](#addToThis(zombie.iso.Vector2))
   7. [addToThis(Vector3)](#addToThis(zombie.iso.Vector3))
   8. [div(float)](#div(float))
   9. [aimAt(Vector2)](#aimAt(zombie.iso.Vector2))
   10. [angleTo(Vector2)](#angleTo(zombie.iso.Vector2))
   11. [clone()](#clone())
   12. [distanceTo(Vector2)](#distanceTo(zombie.iso.Vector2))
   13. [distanceTo(Vector3)](#distanceTo(zombie.iso.Vector3))
   14. [distanceTo(float, float, float)](#distanceTo(float,float,float))
   15. [dot(Vector2)](#dot(zombie.iso.Vector2))
   16. [dot3d(Vector3)](#dot3d(zombie.iso.Vector3))
   17. [equals(Object)](#equals(java.lang.Object))
   18. [getDirection()](#getDirection())
   19. [setDirection(float)](#setDirection(float))
   20. [getLength()](#getLength())
   21. [getLengthSq()](#getLengthSq())
   22. [setLength(float)](#setLength(float))
   23. [normalize()](#normalize())
   24. [set(Vector3)](#set(zombie.iso.Vector3))
   25. [set(float, float, float)](#set(float,float,float))
   26. [setLengthAndDirection(float, float)](#setLengthAndDirection(float,float))
   27. [toString()](#toString())
   28. [sub(Vector3, Vector3)](#sub(zombie.iso.Vector3,zombie.iso.Vector3))
   29. [sub(Vector3, Vector3, Vector3)](#sub(zombie.iso.Vector3,zombie.iso.Vector3,zombie.iso.Vector3))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Vector3
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.Vector3

All Implemented Interfaces:
:   `Cloneable`

---

public final class Vector3
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Cloneable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Cloneable.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `x`

  `float`

  `y`

  `float`

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

  `Vector3(Vector3 other)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector2`

  `add(Vector2 other)`

  `Vector3`

  `addToThis(Vector2 other)`

  `Vector3`

  `addToThis(Vector3 other)`

  `Vector3`

  `aimAt(Vector2 other)`

  `float`

  `angleTo(Vector2 other)`

  `Vector3`

  `clone()`

  `float`

  `distanceTo(float x,
  float y,
  float z)`

  `float`

  `distanceTo(Vector2 other)`

  `float`

  `distanceTo(Vector3 other)`

  `Vector3`

  `div(float scalar)`

  `static float`

  `dot(float x,
  float y,
  float tx,
  float ty)`

  `float`

  `dot(Vector2 other)`

  `float`

  `dot3d(Vector3 other)`

  `boolean`

  `equals(Object other)`

  `static Vector2`

  `fromLengthDirection(float length,
  float direction)`

  `float`

  `getDirection()`

  `float`

  `getLength()`

  `float`

  `getLengthSq()`

  `void`

  `normalize()`

  `void`

  `rotate(float rad)`

  `void`

  `rotatey(float rad)`

  `Vector3`

  `set(float x,
  float y,
  float z)`

  `Vector3`

  `set(Vector3 other)`

  `Vector3`

  `setDirection(float direction)`

  `Vector3`

  `setLength(float length)`

  `Vector3`

  `setLengthAndDirection(float direction,
  float length)`

  `Vector3`

  `sub(Vector3 val,
  Vector3 out)`

  `static Vector3`

  `sub(Vector3 a,
  Vector3 b,
  Vector3 out)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
* Constructor Details
  -------------------

  + ### Vector3

    public Vector3()
  + ### Vector3

    public Vector3([Vector3](Vector3.html "class in zombie.iso") other)
  + ### Vector3

    public Vector3(float x,
    float y,
    float z)
* Method Details
  --------------

  + ### fromLengthDirection

    public static [Vector2](Vector2.html "class in zombie.iso") fromLengthDirection(float length,
    float direction)
  + ### dot

    public static float dot(float x,
    float y,
    float tx,
    float ty)
  + ### rotate

    public void rotate(float rad)
  + ### rotatey

    public void rotatey(float rad)
  + ### add

    public [Vector2](Vector2.html "class in zombie.iso") add([Vector2](Vector2.html "class in zombie.iso") other)
  + ### addToThis

    public [Vector3](Vector3.html "class in zombie.iso") addToThis([Vector2](Vector2.html "class in zombie.iso") other)
  + ### addToThis

    public [Vector3](Vector3.html "class in zombie.iso") addToThis([Vector3](Vector3.html "class in zombie.iso") other)
  + ### div

    public [Vector3](Vector3.html "class in zombie.iso") div(float scalar)
  + ### aimAt

    public [Vector3](Vector3.html "class in zombie.iso") aimAt([Vector2](Vector2.html "class in zombie.iso") other)
  + ### angleTo

    public float angleTo([Vector2](Vector2.html "class in zombie.iso") other)
  + ### clone

    public [Vector3](Vector3.html "class in zombie.iso") clone()

    Overrides:
    :   `clone` in class `Object`
  + ### distanceTo

    public float distanceTo([Vector2](Vector2.html "class in zombie.iso") other)
  + ### distanceTo

    public float distanceTo([Vector3](Vector3.html "class in zombie.iso") other)
  + ### distanceTo

    public float distanceTo(float x,
    float y,
    float z)
  + ### dot

    public float dot([Vector2](Vector2.html "class in zombie.iso") other)
  + ### dot3d

    public float dot3d([Vector3](Vector3.html "class in zombie.iso") other)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`
  + ### getDirection

    public float getDirection()
  + ### setDirection

    public [Vector3](Vector3.html "class in zombie.iso") setDirection(float direction)
  + ### getLength

    public float getLength()
  + ### getLengthSq

    public float getLengthSq()
  + ### setLength

    public [Vector3](Vector3.html "class in zombie.iso") setLength(float length)
  + ### normalize

    public void normalize()
  + ### set

    public [Vector3](Vector3.html "class in zombie.iso") set([Vector3](Vector3.html "class in zombie.iso") other)
  + ### set

    public [Vector3](Vector3.html "class in zombie.iso") set(float x,
    float y,
    float z)
  + ### setLengthAndDirection

    public [Vector3](Vector3.html "class in zombie.iso") setLengthAndDirection(float direction,
    float length)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### sub

    public [Vector3](Vector3.html "class in zombie.iso") sub([Vector3](Vector3.html "class in zombie.iso") val,
    [Vector3](Vector3.html "class in zombie.iso") out)
  + ### sub

    public static [Vector3](Vector3.html "class in zombie.iso") sub([Vector3](Vector3.html "class in zombie.iso") a,
    [Vector3](Vector3.html "class in zombie.iso") b,
    [Vector3](Vector3.html "class in zombie.iso") out)