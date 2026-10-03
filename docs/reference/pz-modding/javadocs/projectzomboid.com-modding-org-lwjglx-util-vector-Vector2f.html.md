[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [org.lwjglx.util.vector](package-summary.html)
2. [Vector2f](Vector2f.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [serialVersionUID](#serialVersionUID)
   2. [x](#x)
   3. [y](#y)
6. [Constructor Details](#constructor-detail)
   1. [Vector2f()](#%3Cinit%3E())
   2. [Vector2f(ReadableVector2f)](#%3Cinit%3E(org.lwjglx.util.vector.ReadableVector2f))
   3. [Vector2f(float, float)](#%3Cinit%3E(float,float))
7. [Method Details](#method-detail)
   1. [set(float, float)](#set(float,float))
   2. [set(ReadableVector2f)](#set(org.lwjglx.util.vector.ReadableVector2f))
   3. [lengthSquared()](#lengthSquared())
   4. [translate(float, float)](#translate(float,float))
   5. [negate()](#negate())
   6. [negate(Vector2f)](#negate(org.lwjglx.util.vector.Vector2f))
   7. [normalise(Vector2f)](#normalise(org.lwjglx.util.vector.Vector2f))
   8. [dot(Vector2f, Vector2f)](#dot(org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f))
   9. [angle(Vector2f, Vector2f)](#angle(org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f))
   10. [add(Vector2f, Vector2f, Vector2f)](#add(org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f))
   11. [sub(Vector2f, Vector2f, Vector2f)](#sub(org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f,org.lwjglx.util.vector.Vector2f))
   12. [store(FloatBuffer)](#store(java.nio.FloatBuffer))
   13. [load(FloatBuffer)](#load(java.nio.FloatBuffer))
   14. [scale(float)](#scale(float))
   15. [toString()](#toString())
   16. [getX()](#getX())
   17. [getY()](#getY())
   18. [setX(float)](#setX(float))
   19. [setY(float)](#setY(float))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Vector2f
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[org.lwjglx.util.vector.Vector](Vector.html "class in org.lwjglx.util.vector")

org.lwjglx.util.vector.Vector2f

All Implemented Interfaces:
:   `Serializable, ReadableVector, ReadableVector2f, WritableVector2f`

---

public final class Vector2f
extends [Vector](Vector.html "class in org.lwjglx.util.vector")
implements [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), [ReadableVector2f](ReadableVector2f.html "interface in org.lwjglx.util.vector"), [WritableVector2f](WritableVector2f.html "interface in org.lwjglx.util.vector")

Holds a 2-tuple vector.

See Also:
:   * [Serialized Form](../../../../serialized-form.html#org.lwjglx.util.vector.Vector2f)

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final long`

  `serialVersionUID`

  `float`

  `x`

  `float`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector2f()`

  Constructor for Vector3f.

  `Vector2f(float x,
  float y)`

  Constructor

  `Vector2f(ReadableVector2f src)`

  Constructor
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Vector2f`

  `add(Vector2f left,
  Vector2f right,
  Vector2f dest)`

  Add a vector to another vector and place the result in a destination
  vector.

  `static float`

  `angle(Vector2f a,
  Vector2f b)`

  Calculate the angle between two vectors, in radians

  `static float`

  `dot(Vector2f left,
  Vector2f right)`

  The dot product of two vectors is calculated as
  v1.x \* v2.x + v1.y \* v2.y + v1.z \* v2.z

  `final float`

  `getX()`

  `final float`

  `getY()`

  `float`

  `lengthSquared()`

  `Vector`

  `load(FloatBuffer buf)`

  Load this vector from a FloatBuffer

  `Vector`

  `negate()`

  Negate a vector

  `Vector2f`

  `negate(Vector2f dest)`

  Negate a vector and place the result in a destination vector.

  `Vector2f`

  `normalise(Vector2f dest)`

  Normalise this vector and place the result in another vector.

  `Vector`

  `scale(float scale)`

  Scale this vector

  `void`

  `set(float x,
  float y)`

  Set the X,Y values

  `Vector2f`

  `set(ReadableVector2f src)`

  Load from another Vector2f

  `final void`

  `setX(float x)`

  Set X

  `final void`

  `setY(float y)`

  Set Y

  `Vector`

  `store(FloatBuffer buf)`

  Store this vector in a FloatBuffer

  `static Vector2f`

  `sub(Vector2f left,
  Vector2f right,
  Vector2f dest)`

  Subtract a vector from another vector and place the result in a destination
  vector.

  `String`

  `toString()`

  `Vector2f`

  `translate(float x,
  float y)`

  Translate a vector

  ### Methods inherited from class [Vector](Vector.html#method-summary "class in org.lwjglx.util.vector")

  `length, normalise`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [ReadableVector](ReadableVector.html#method-summary "interface in org.lwjglx.util.vector")

  `length`

* Field Details
  -------------

  + ### serialVersionUID

    private static final long serialVersionUID

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#org.lwjglx.util.vector.Vector2f.serialVersionUID)
  + ### x

    public float x
  + ### y

    public float y
* Constructor Details
  -------------------

  + ### Vector2f

    public Vector2f()

    Constructor for Vector3f.
  + ### Vector2f

    public Vector2f([ReadableVector2f](ReadableVector2f.html "interface in org.lwjglx.util.vector") src)

    Constructor
  + ### Vector2f

    public Vector2f(float x,
    float y)

    Constructor
* Method Details
  --------------

  + ### set

    public void set(float x,
    float y)

    Description copied from interface: `WritableVector2f`

    Set the X,Y values

    Specified by:
    :   `set` in interface `WritableVector2f`
  + ### set

    public [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") set([ReadableVector2f](ReadableVector2f.html "interface in org.lwjglx.util.vector") src)

    Load from another Vector2f

    Parameters:
    :   `src` - The source vector

    Returns:
    :   this
  + ### lengthSquared

    public float lengthSquared()

    Specified by:
    :   `lengthSquared` in interface `ReadableVector`

    Specified by:
    :   `lengthSquared` in class `Vector`

    Returns:
    :   the length squared of the vector
  + ### translate

    public [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") translate(float x,
    float y)

    Translate a vector

    Parameters:
    :   `x` - The translation in x
    :   `y` - the translation in y

    Returns:
    :   this
  + ### negate

    public [Vector](Vector.html "class in org.lwjglx.util.vector") negate()

    Negate a vector

    Specified by:
    :   `negate` in class `Vector`

    Returns:
    :   this
  + ### negate

    public [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") negate([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") dest)

    Negate a vector and place the result in a destination vector.

    Parameters:
    :   `dest` - The destination vector or null if a new vector is to be created

    Returns:
    :   the negated vector
  + ### normalise

    public [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") normalise([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") dest)

    Normalise this vector and place the result in another vector.

    Parameters:
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   the normalised vector
  + ### dot

    public static float dot([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") left,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") right)

    The dot product of two vectors is calculated as
    v1.x \* v2.x + v1.y \* v2.y + v1.z \* v2.z

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector

    Returns:
    :   left dot right
  + ### angle

    public static float angle([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") a,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") b)

    Calculate the angle between two vectors, in radians

    Parameters:
    :   `a` - A vector
    :   `b` - The other vector

    Returns:
    :   the angle between the two vectors, in radians
  + ### add

    public static [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") add([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") left,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") right,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") dest)

    Add a vector to another vector and place the result in a destination
    vector.

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   the sum of left and right in dest
  + ### sub

    public static [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") sub([Vector2f](Vector2f.html "class in org.lwjglx.util.vector") left,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") right,
    [Vector2f](Vector2f.html "class in org.lwjglx.util.vector") dest)

    Subtract a vector from another vector and place the result in a destination
    vector.

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   left minus right in dest
  + ### store

    public [Vector](Vector.html "class in org.lwjglx.util.vector") store([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Store this vector in a FloatBuffer

    Specified by:
    :   `store` in interface `ReadableVector`

    Specified by:
    :   `store` in class `Vector`

    Parameters:
    :   `buf` - The buffer to store it in, at the current position

    Returns:
    :   this
  + ### load

    public [Vector](Vector.html "class in org.lwjglx.util.vector") load([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Load this vector from a FloatBuffer

    Specified by:
    :   `load` in class `Vector`

    Parameters:
    :   `buf` - The buffer to load it from, at the current position

    Returns:
    :   this
  + ### scale

    public [Vector](Vector.html "class in org.lwjglx.util.vector") scale(float scale)

    Description copied from class: `Vector`

    Scale this vector

    Specified by:
    :   `scale` in class `Vector`

    Parameters:
    :   `scale` - The scale factor

    Returns:
    :   this
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getX

    public final float getX()

    Specified by:
    :   `getX` in interface `ReadableVector2f`

    Returns:
    :   x
  + ### getY

    public final float getY()

    Specified by:
    :   `getY` in interface `ReadableVector2f`

    Returns:
    :   y
  + ### setX

    public final void setX(float x)

    Set X

    Specified by:
    :   `setX` in interface `WritableVector2f`
  + ### setY

    public final void setY(float y)

    Set Y

    Specified by:
    :   `setY` in interface `WritableVector2f`