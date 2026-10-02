[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [org.lwjglx.util.vector](package-summary.html)
2. [Vector](Vector.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [Vector()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [length()](#length())
   2. [lengthSquared()](#lengthSquared())
   3. [load(FloatBuffer)](#load(java.nio.FloatBuffer))
   4. [negate()](#negate())
   5. [normalise()](#normalise())
   6. [store(FloatBuffer)](#store(java.nio.FloatBuffer))
   7. [scale(float)](#scale(float))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Vector
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.lwjglx.util.vector.Vector

All Implemented Interfaces:
:   `Serializable, ReadableVector`

Direct Known Subclasses:
:   `Vector2f, Vector3f`

---

public abstract class Vector
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), [ReadableVector](ReadableVector.html "interface in org.lwjglx.util.vector")

Base class for vectors.

See Also:
:   * [Serialized Form](../../../../serialized-form.html#org.lwjglx.util.vector.Vector)

* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Vector()`

  Constructor for Vector.
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final float`

  `length()`

  `abstract float`

  `lengthSquared()`

  `abstract Vector`

  `load(FloatBuffer buf)`

  Load this vector from a FloatBuffer

  `abstract Vector`

  `negate()`

  Negate a vector

  `final Vector`

  `normalise()`

  Normalise this vector

  `abstract Vector`

  `scale(float scale)`

  Scale this vector

  `abstract Vector`

  `store(FloatBuffer buf)`

  Store this vector in a FloatBuffer

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### Vector

    protected Vector()

    Constructor for Vector.
* Method Details
  --------------

  + ### length

    public final float length()

    Specified by:
    :   `length` in interface `ReadableVector`

    Returns:
    :   the length of the vector
  + ### lengthSquared

    public abstract float lengthSquared()

    Specified by:
    :   `lengthSquared` in interface `ReadableVector`

    Returns:
    :   the length squared of the vector
  + ### load

    public abstract [Vector](Vector.html "class in org.lwjglx.util.vector") load([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Load this vector from a FloatBuffer

    Parameters:
    :   `buf` - The buffer to load it from, at the current position

    Returns:
    :   this
  + ### negate

    public abstract [Vector](Vector.html "class in org.lwjglx.util.vector") negate()

    Negate a vector

    Returns:
    :   this
  + ### normalise

    public final [Vector](Vector.html "class in org.lwjglx.util.vector") normalise()

    Normalise this vector

    Returns:
    :   this
  + ### store

    public abstract [Vector](Vector.html "class in org.lwjglx.util.vector") store([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buf)

    Store this vector in a FloatBuffer

    Specified by:
    :   `store` in interface `ReadableVector`

    Parameters:
    :   `buf` - The buffer to store it in, at the current position

    Returns:
    :   this
  + ### scale

    public abstract [Vector](Vector.html "class in org.lwjglx.util.vector") scale(float scale)

    Scale this vector

    Parameters:
    :   `scale` - The scale factor

    Returns:
    :   this