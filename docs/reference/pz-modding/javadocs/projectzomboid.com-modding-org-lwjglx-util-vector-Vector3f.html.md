[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [org.lwjglx.util.vector](package-summary.html)
2. [Vector3f](Vector3f.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [serialVersionUID](#serialVersionUID)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [Vector3f()](#%3Cinit%3E())
   2. [Vector3f(ReadableVector3f)](#%3Cinit%3E(org.lwjglx.util.vector.ReadableVector3f))
   3. [Vector3f(float, float, float)](#%3Cinit%3E(float,float,float))
7. [Method Details](#method-detail)
   1. [set(float, float)](#set(float,float))
   2. [set(float, float, float)](#set(float,float,float))
   3. [set(ReadableVector3f)](#set(org.lwjglx.util.vector.ReadableVector3f))
   4. [lengthSquared()](#lengthSquared())
   5. [translate(float, float, float)](#translate(float,float,float))
   6. [add(Vector3f, Vector3f, Vector3f)](#add(org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f))
   7. [sub(Vector3f, Vector3f, Vector3f)](#sub(org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f))
   8. [cross(Vector3f, Vector3f, Vector3f)](#cross(org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f))
   9. [negate()](#negate())
   10. [negate(Vector3f)](#negate(org.lwjglx.util.vector.Vector3f))
   11. [normalise(Vector3f)](#normalise(org.lwjglx.util.vector.Vector3f))
   12. [dot(Vector3f, Vector3f)](#dot(org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f))
   13. [angle(Vector3f, Vector3f)](#angle(org.lwjglx.util.vector.Vector3f,org.lwjglx.util.vector.Vector3f))
   14. [load(FloatBuffer)](#load(java.nio.FloatBuffer))
   15. [scale(float)](#scale(float))
   16. [store(FloatBuffer)](#store(java.nio.FloatBuffer))
   17. [toString()](#toString())
   18. [getX()](#getX())
   19. [getY()](#getY())
   20. [setX(float)](#setX(float))
   21. [setY(float)](#setY(float))
   22. [setZ(float)](#setZ(float))
   23. [getZ()](#getZ())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Vector3f
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[org.lwjglx.util.vector.Vector](Vector.html "class in org.lwjglx.util.vector")

org.lwjglx.util.vector.Vector3f

All Implemented Interfaces:
:   `Serializable, ReadableVector, ReadableVector2f, ReadableVector3f, WritableVector2f, WritableVector3f`

---

public final class Vector3f
extends [Vector](Vector.html "class in org.lwjglx.util.vector")
implements [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), [ReadableVector3f](ReadableVector3f.html "interface in org.lwjglx.util.vector"), [WritableVector3f](WritableVector3f.html "interface in org.lwjglx.util.vector")

Holds a 3-tuple vector.

See Also:
:   * [Serialized Form](../../../../serialized-form.html#org.lwjglx.util.vector.Vector3f)

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

  `float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector3f()`

  Constructor for Vector3f.

  `Vector3f(float x,
  float y,
  float z)`

  Constructor

  `Vector3f(ReadableVector3f src)`

  Constructor
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Vector3f`

  `add(Vector3f left,
  Vector3f right,
  Vector3f dest)`

  Add a vector to another vector and place the result in a destination
  vector.

  `static float`

  `angle(Vector3f a,
  Vector3f b)`

  Calculate the angle between two vectors, in radians

  `static Vector3f`

  `cross(Vector3f left,
  Vector3f right,
  Vector3f dest)`

  The cross product of two vectors.

  `static float`

  `dot(Vector3f left,
  Vector3f right)`

  The dot product of two vectors is calculated as
  v1.x \* v2.x + v1.y \* v2.y + v1.z \* v2.z

  `final float`

  `getX()`

  `final float`

  `getY()`

  `float`

  `getZ()`

  `float`

  `lengthSquared()`

  `Vector`

  `load(FloatBuffer buf)`

  Load this vector from a FloatBuffer

  `Vector`

  `negate()`

  Negate a vector

  `Vector3f`

  `negate(Vector3f dest)`

  Negate a vector and place the result in a destination vector.

  `Vector3f`

  `normalise(Vector3f dest)`

  Normalise this vector and place the result in another vector.

  `Vector`

  `scale(float scale)`

  Scale this vector

  `void`

  `set(float x,
  float y)`

  Set the X,Y values

  `void`

  `set(float x,
  float y,
  float z)`

  Set the X,Y,Z values

  `Vector3f`

  `set(ReadableVector3f src)`

  Load from another Vector3f

  `final void`

  `setX(float x)`

  Set X

  `final void`

  `setY(float y)`

  Set Y

  `void`

  `setZ(float z)`

  Set Z

  `Vector`

  `store(FloatBuffer buf)`

  Store this vector in a FloatBuffer

  `static Vector3f`

  `sub(Vector3f left,
  Vector3f right,
  Vector3f dest)`

  Subtract a vector from another vector and place the result in a destination
  vector.

  `String`

  `toString()`

  `Vector3f`

  `translate(float x,
  float y,
  float z)`

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
    :   - [Constant Field Values](../../../../constant-values.html#org.lwjglx.util.vector.Vector3f.serialVersionUID)
  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
* Constructor Details
  -------------------

  + ### Vector3f

    public Vector3f()

    Constructor for Vector3f.
  + ### Vector3f

    public Vector3f([ReadableVector3f](ReadableVector3f.html "interface in org.lwjglx.util.vector") src)

    Constructor
  + ### Vector3f

    public Vector3f(float x,
    float y,
    float z)

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

    public void set(float x,
    float y,
    float z)

    Description copied from interface: `WritableVector3f`

    Set the X,Y,Z values

    Specified by:
    :   `set` in interface `WritableVector3f`
  + ### set

    public [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") set([ReadableVector3f](ReadableVector3f.html "interface in org.lwjglx.util.vector") src)

    Load from another Vector3f

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

    public [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") translate(float x,
    float y,
    float z)

    Translate a vector

    Parameters:
    :   `x` - The translation in x
    :   `y` - the translation in y

    Returns:
    :   this
  + ### add

    public static [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") add([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") left,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") right,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") dest)

    Add a vector to another vector and place the result in a destination
    vector.

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   the sum of left and right in dest
  + ### sub

    public static [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") sub([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") left,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") right,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") dest)

    Subtract a vector from another vector and place the result in a destination
    vector.

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   left minus right in dest
  + ### cross

    public static [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") cross([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") left,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") right,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") dest)

    The cross product of two vectors.

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector
    :   `dest` - The destination result, or null if a new vector is to be created

    Returns:
    :   left cross right
  + ### negate

    public [Vector](Vector.html "class in org.lwjglx.util.vector") negate()

    Negate a vector

    Specified by:
    :   `negate` in class `Vector`

    Returns:
    :   this
  + ### negate

    public [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") negate([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") dest)

    Negate a vector and place the result in a destination vector.

    Parameters:
    :   `dest` - The destination vector or null if a new vector is to be created

    Returns:
    :   the negated vector
  + ### normalise

    public [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") normalise([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") dest)

    Normalise this vector and place the result in another vector.

    Parameters:
    :   `dest` - The destination vector, or null if a new vector is to be created

    Returns:
    :   the normalised vector
  + ### dot

    public static float dot([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") left,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") right)

    The dot product of two vectors is calculated as
    v1.x \* v2.x + v1.y \* v2.y + v1.z \* v2.z

    Parameters:
    :   `left` - The LHS vector
    :   `right` - The RHS vector

    Returns:
    :   left dot right
  + ### angle

    public static float angle([Vector3f](Vector3f.html "class in org.lwjglx.util.vector") a,
    [Vector3f](Vector3f.html "class in org.lwjglx.util.vector") b)

    Calculate the angle between two vectors, in radians

    Parameters:
    :   `a` - A vector
    :   `b` - The other vector

    Returns:
    :   the angle between the two vectors, in radians
  + ### load

    public [Vector](Vector.html "class in org.lwjglx.util.vector") load([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Description copied from class: `Vector`

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
  + ### store

    public [Vector](Vector.html "class in org.lwjglx.util.vector") store([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Description copied from class: `Vector`

    Store this vector in a FloatBuffer

    Specified by:
    :   `store` in interface `ReadableVector`

    Specified by:
    :   `store` in class `Vector`

    Parameters:
    :   `buf` - The buffer to store it in, at the current position

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
  + ### setZ

    public void setZ(float z)

    Set Z

    Specified by:
    :   `setZ` in interface `WritableVector3f`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in interface `ReadableVector3f`