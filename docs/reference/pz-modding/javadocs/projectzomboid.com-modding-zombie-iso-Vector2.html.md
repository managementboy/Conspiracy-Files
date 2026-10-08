[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [Vector2](Vector2.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
6. [Constructor Details](#constructor-detail)
   1. [Vector2()](#%3Cinit%3E())
   2. [Vector2(Vector2)](#%3Cinit%3E(zombie.iso.Vector2))
   3. [Vector2(float, float)](#%3Cinit%3E(float,float))
7. [Method Details](#method-detail)
   1. [fromLengthDirection(float, float)](#fromLengthDirection(float,float))
   2. [dot(float, float, float, float)](#dot(float,float,float,float))
   3. [addScaled(Vector2, Vector2, float, Vector2)](#addScaled(zombie.iso.Vector2,zombie.iso.Vector2,float,zombie.iso.Vector2))
   4. [rotate(float)](#rotate(float))
   5. [add(Vector2)](#add(zombie.iso.Vector2))
   6. [aimAt(Vector2)](#aimAt(zombie.iso.Vector2))
   7. [angleTo(Vector2)](#angleTo(zombie.iso.Vector2))
   8. [angleBetween(Vector2)](#angleBetween(zombie.iso.Vector2))
   9. [clone()](#clone())
   10. [distanceTo(Vector2)](#distanceTo(zombie.iso.Vector2))
   11. [dot(Vector2)](#dot(zombie.iso.Vector2))
   12. [dot(float, float)](#dot(float,float))
   13. [equals(Object)](#equals(java.lang.Object))
   14. [getDirection()](#getDirection())
   15. [getDirection(float, float)](#getDirection(float,float))
   16. [getDirectionNeg()](#getDirectionNeg())
   17. [setDirection(float)](#setDirection(float))
   18. [getLength()](#getLength())
   19. [getLengthSquared()](#getLengthSquared())
   20. [setLength(float)](#setLength(float))
   21. [setMaxLength(float)](#setMaxLength(float))
   22. [normalize()](#normalize())
   23. [set(Vector2)](#set(zombie.iso.Vector2))
   24. [set(float, float)](#set(float,float))
   25. [setLengthAndDirection(float, float)](#setLengthAndDirection(float,float))
   26. [mul(float)](#mul(float))
   27. [toString()](#toString())
   28. [getX()](#getX())
   29. [setX(float)](#setX(float))
   30. [getY()](#getY())
   31. [setY(float)](#setY(float))
   32. [floorX()](#floorX())
   33. [floorY()](#floorY())
   34. [tangent()](#tangent())
   35. [scale(float)](#scale(float))
   36. [scale(Vector2, float)](#scale(zombie.iso.Vector2,float))
   37. [moveTowards(Vector2, Vector2, float)](#moveTowards(zombie.iso.Vector2,zombie.iso.Vector2,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Vector2
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.Vector2

All Implemented Interfaces:
:   `Cloneable`

---

public final class Vector2
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
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector2()`

  `Vector2(float x,
  float y)`

  `Vector2(Vector2 other)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `Vector2`

  `add(Vector2 other)`

  `static Vector2`

  `addScaled(Vector2 a,
  Vector2 b,
  float scale,
  Vector2 result)`

  `Vector2`

  `aimAt(Vector2 other)`

  `float`

  `angleBetween(Vector2 other)`

  `float`

  `angleTo(Vector2 other)`

  `Vector2`

  `clone()`

  `float`

  `distanceTo(Vector2 other)`

  `float`

  `dot(float otherX,
  float otherY)`

  `static float`

  `dot(float x,
  float y,
  float tx,
  float ty)`

  `float`

  `dot(Vector2 other)`

  `boolean`

  `equals(Object other)`

  `int`

  `floorX()`

  `int`

  `floorY()`

  `static Vector2`

  `fromLengthDirection(float length,
  float direction)`

  `float`

  `getDirection()`

  `static float`

  `getDirection(float x,
  float y)`

  `float`

  `getDirectionNeg()`

  Deprecated.

  `float`

  `getLength()`

  `float`

  `getLengthSquared()`

  `float`

  `getX()`

  `float`

  `getY()`

  `static Vector2`

  `moveTowards(Vector2 currentVector,
  Vector2 targetVector,
  float maxDistanceDelta)`

  `Vector2`

  `mul(float m)`

  `float`

  `normalize()`

  `void`

  `rotate(float radians)`

  `void`

  `scale(float scale)`

  `static Vector2`

  `scale(Vector2 val,
  float scale)`

  `Vector2`

  `set(float x,
  float y)`

  `Vector2`

  `set(Vector2 other)`

  `Vector2`

  `setDirection(float directionRadians)`

  `Vector2`

  `setLength(float length)`

  `Vector2`

  `setLengthAndDirection(float direction,
  float length)`

  `float`

  `setMaxLength(float maxLength)`

  `void`

  `setX(float x)`

  `void`

  `setY(float y)`

  `void`

  `tangent()`

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
* Constructor Details
  -------------------

  + ### Vector2

    public Vector2()
  + ### Vector2

    public Vector2([Vector2](Vector2.html "class in zombie.iso") other)
  + ### Vector2

    public Vector2(float x,
    float y)
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
  + ### addScaled

    public static [Vector2](Vector2.html "class in zombie.iso") addScaled([Vector2](Vector2.html "class in zombie.iso") a,
    [Vector2](Vector2.html "class in zombie.iso") b,
    float scale,
    [Vector2](Vector2.html "class in zombie.iso") result)
  + ### rotate

    public void rotate(float radians)
  + ### add

    public [Vector2](Vector2.html "class in zombie.iso") add([Vector2](Vector2.html "class in zombie.iso") other)
  + ### aimAt

    public [Vector2](Vector2.html "class in zombie.iso") aimAt([Vector2](Vector2.html "class in zombie.iso") other)
  + ### angleTo

    public float angleTo([Vector2](Vector2.html "class in zombie.iso") other)
  + ### angleBetween

    public float angleBetween([Vector2](Vector2.html "class in zombie.iso") other)
  + ### clone

    public [Vector2](Vector2.html "class in zombie.iso") clone()

    Overrides:
    :   `clone` in class `Object`
  + ### distanceTo

    public float distanceTo([Vector2](Vector2.html "class in zombie.iso") other)
  + ### dot

    public float dot([Vector2](Vector2.html "class in zombie.iso") other)
  + ### dot

    public float dot(float otherX,
    float otherY)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`
  + ### getDirection

    public float getDirection()
  + ### getDirection

    public static float getDirection(float x,
    float y)
  + ### getDirectionNeg

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public float getDirectionNeg()

    Deprecated.
  + ### setDirection

    public [Vector2](Vector2.html "class in zombie.iso") setDirection(float directionRadians)
  + ### getLength

    public float getLength()
  + ### getLengthSquared

    public float getLengthSquared()
  + ### setLength

    public [Vector2](Vector2.html "class in zombie.iso") setLength(float length)
  + ### setMaxLength

    public float setMaxLength(float maxLength)
  + ### normalize

    public float normalize()
  + ### set

    public [Vector2](Vector2.html "class in zombie.iso") set([Vector2](Vector2.html "class in zombie.iso") other)
  + ### set

    public [Vector2](Vector2.html "class in zombie.iso") set(float x,
    float y)
  + ### setLengthAndDirection

    public [Vector2](Vector2.html "class in zombie.iso") setLengthAndDirection(float direction,
    float length)
  + ### mul

    public [Vector2](Vector2.html "class in zombie.iso") mul(float m)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getX

    public float getX()
  + ### setX

    public void setX(float x)
  + ### getY

    public float getY()
  + ### setY

    public void setY(float y)
  + ### floorX

    public int floorX()
  + ### floorY

    public int floorY()
  + ### tangent

    public void tangent()
  + ### scale

    public void scale(float scale)
  + ### scale

    public static [Vector2](Vector2.html "class in zombie.iso") scale([Vector2](Vector2.html "class in zombie.iso") val,
    float scale)
  + ### moveTowards

    public static [Vector2](Vector2.html "class in zombie.iso") moveTowards([Vector2](Vector2.html "class in zombie.iso") currentVector,
    [Vector2](Vector2.html "class in zombie.iso") targetVector,
    float maxDistanceDelta)