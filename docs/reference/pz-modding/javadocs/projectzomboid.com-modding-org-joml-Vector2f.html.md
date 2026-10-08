[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [org.joml](package-summary.html)
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
   2. [Vector2f(float)](#%3Cinit%3E(float))
   3. [Vector2f(float, float)](#%3Cinit%3E(float,float))
   4. [Vector2f(Vector2fc)](#%3Cinit%3E(org.joml.Vector2fc))
   5. [Vector2f(Vector2ic)](#%3Cinit%3E(org.joml.Vector2ic))
   6. [Vector2f(float[])](#%3Cinit%3E(float%5B%5D))
   7. [Vector2f(ByteBuffer)](#%3Cinit%3E(java.nio.ByteBuffer))
   8. [Vector2f(int, ByteBuffer)](#%3Cinit%3E(int,java.nio.ByteBuffer))
   9. [Vector2f(FloatBuffer)](#%3Cinit%3E(java.nio.FloatBuffer))
   10. [Vector2f(int, FloatBuffer)](#%3Cinit%3E(int,java.nio.FloatBuffer))
7. [Method Details](#method-detail)
   1. [x()](#x())
   2. [y()](#y())
   3. [set(float)](#set(float))
   4. [set(float, float)](#set(float,float))
   5. [set(double)](#set(double))
   6. [set(double, double)](#set(double,double))
   7. [set(Vector2fc)](#set(org.joml.Vector2fc))
   8. [set(Vector2ic)](#set(org.joml.Vector2ic))
   9. [set(Vector2dc)](#set(org.joml.Vector2dc))
   10. [set(float[])](#set(float%5B%5D))
   11. [set(ByteBuffer)](#set(java.nio.ByteBuffer))
   12. [set(int, ByteBuffer)](#set(int,java.nio.ByteBuffer))
   13. [set(FloatBuffer)](#set(java.nio.FloatBuffer))
   14. [set(int, FloatBuffer)](#set(int,java.nio.FloatBuffer))
   15. [setFromAddress(long)](#setFromAddress(long))
   16. [get(int)](#get(int))
   17. [get(int, Vector2i)](#get(int,org.joml.Vector2i))
   18. [get(Vector2f)](#get(org.joml.Vector2f))
   19. [get(Vector2d)](#get(org.joml.Vector2d))
   20. [setComponent(int, float)](#setComponent(int,float))
   21. [get(ByteBuffer)](#get(java.nio.ByteBuffer))
   22. [get(int, ByteBuffer)](#get(int,java.nio.ByteBuffer))
   23. [get(FloatBuffer)](#get(java.nio.FloatBuffer))
   24. [get(int, FloatBuffer)](#get(int,java.nio.FloatBuffer))
   25. [getToAddress(long)](#getToAddress(long))
   26. [perpendicular()](#perpendicular())
   27. [sub(Vector2fc)](#sub(org.joml.Vector2fc))
   28. [sub(Vector2fc, Vector2f)](#sub(org.joml.Vector2fc,org.joml.Vector2f))
   29. [sub(float, float)](#sub(float,float))
   30. [sub(float, float, Vector2f)](#sub(float,float,org.joml.Vector2f))
   31. [dot(Vector2fc)](#dot(org.joml.Vector2fc))
   32. [angle(Vector2fc)](#angle(org.joml.Vector2fc))
   33. [lengthSquared()](#lengthSquared())
   34. [lengthSquared(float, float)](#lengthSquared(float,float))
   35. [length()](#length())
   36. [length(float, float)](#length(float,float))
   37. [distance(Vector2fc)](#distance(org.joml.Vector2fc))
   38. [distanceSquared(Vector2fc)](#distanceSquared(org.joml.Vector2fc))
   39. [distance(float, float)](#distance(float,float))
   40. [distanceSquared(float, float)](#distanceSquared(float,float))
   41. [distance(float, float, float, float)](#distance(float,float,float,float))
   42. [distanceSquared(float, float, float, float)](#distanceSquared(float,float,float,float))
   43. [normalize()](#normalize())
   44. [normalize(Vector2f)](#normalize(org.joml.Vector2f))
   45. [normalize(float)](#normalize(float))
   46. [normalize(float, Vector2f)](#normalize(float,org.joml.Vector2f))
   47. [add(Vector2fc)](#add(org.joml.Vector2fc))
   48. [add(Vector2fc, Vector2f)](#add(org.joml.Vector2fc,org.joml.Vector2f))
   49. [add(float, float)](#add(float,float))
   50. [add(float, float, Vector2f)](#add(float,float,org.joml.Vector2f))
   51. [zero()](#zero())
   52. [writeExternal(ObjectOutput)](#writeExternal(java.io.ObjectOutput))
   53. [readExternal(ObjectInput)](#readExternal(java.io.ObjectInput))
   54. [negate()](#negate())
   55. [negate(Vector2f)](#negate(org.joml.Vector2f))
   56. [mul(float)](#mul(float))
   57. [mul(float, Vector2f)](#mul(float,org.joml.Vector2f))
   58. [mul(float, float)](#mul(float,float))
   59. [mul(float, float, Vector2f)](#mul(float,float,org.joml.Vector2f))
   60. [mul(Vector2fc)](#mul(org.joml.Vector2fc))
   61. [mul(Vector2fc, Vector2f)](#mul(org.joml.Vector2fc,org.joml.Vector2f))
   62. [div(Vector2fc)](#div(org.joml.Vector2fc))
   63. [div(Vector2fc, Vector2f)](#div(org.joml.Vector2fc,org.joml.Vector2f))
   64. [div(float)](#div(float))
   65. [div(float, Vector2f)](#div(float,org.joml.Vector2f))
   66. [div(float, float)](#div(float,float))
   67. [div(float, float, Vector2f)](#div(float,float,org.joml.Vector2f))
   68. [mul(Matrix2fc)](#mul(org.joml.Matrix2fc))
   69. [mul(Matrix2fc, Vector2f)](#mul(org.joml.Matrix2fc,org.joml.Vector2f))
   70. [mul(Matrix2dc)](#mul(org.joml.Matrix2dc))
   71. [mul(Matrix2dc, Vector2f)](#mul(org.joml.Matrix2dc,org.joml.Vector2f))
   72. [mulTranspose(Matrix2fc)](#mulTranspose(org.joml.Matrix2fc))
   73. [mulTranspose(Matrix2fc, Vector2f)](#mulTranspose(org.joml.Matrix2fc,org.joml.Vector2f))
   74. [mulPosition(Matrix3x2fc)](#mulPosition(org.joml.Matrix3x2fc))
   75. [mulPosition(Matrix3x2fc, Vector2f)](#mulPosition(org.joml.Matrix3x2fc,org.joml.Vector2f))
   76. [mulDirection(Matrix3x2fc)](#mulDirection(org.joml.Matrix3x2fc))
   77. [mulDirection(Matrix3x2fc, Vector2f)](#mulDirection(org.joml.Matrix3x2fc,org.joml.Vector2f))
   78. [lerp(Vector2fc, float)](#lerp(org.joml.Vector2fc,float))
   79. [lerp(Vector2fc, float, Vector2f)](#lerp(org.joml.Vector2fc,float,org.joml.Vector2f))
   80. [hashCode()](#hashCode())
   81. [equals(Object)](#equals(java.lang.Object))
   82. [equals(Vector2fc, float)](#equals(org.joml.Vector2fc,float))
   83. [equals(float, float)](#equals(float,float))
   84. [toString()](#toString())
   85. [toString(NumberFormat)](#toString(java.text.NumberFormat))
   86. [fma(Vector2fc, Vector2fc)](#fma(org.joml.Vector2fc,org.joml.Vector2fc))
   87. [fma(float, Vector2fc)](#fma(float,org.joml.Vector2fc))
   88. [fma(Vector2fc, Vector2fc, Vector2f)](#fma(org.joml.Vector2fc,org.joml.Vector2fc,org.joml.Vector2f))
   89. [fma(float, Vector2fc, Vector2f)](#fma(float,org.joml.Vector2fc,org.joml.Vector2f))
   90. [min(Vector2fc)](#min(org.joml.Vector2fc))
   91. [min(Vector2fc, Vector2f)](#min(org.joml.Vector2fc,org.joml.Vector2f))
   92. [max(Vector2fc)](#max(org.joml.Vector2fc))
   93. [max(Vector2fc, Vector2f)](#max(org.joml.Vector2fc,org.joml.Vector2f))
   94. [maxComponent()](#maxComponent())
   95. [minComponent()](#minComponent())
   96. [floor()](#floor())
   97. [floor(Vector2f)](#floor(org.joml.Vector2f))
   98. [ceil()](#ceil())
   99. [ceil(Vector2f)](#ceil(org.joml.Vector2f))
   100. [round()](#round())
   101. [round(Vector2f)](#round(org.joml.Vector2f))
   102. [isFinite()](#isFinite())
   103. [absolute()](#absolute())
   104. [absolute(Vector2f)](#absolute(org.joml.Vector2f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Vector2f
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.joml.Vector2f

All Implemented Interfaces:
:   `Externalizable, Serializable, org.joml.Vector2fc`

---

public class Vector2f
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Externalizable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Externalizable.html "class or interface in java.io"), org.joml.Vector2fc

Represents a 2D vector with single-precision.

See Also:
:   * [Serialized Form](../../serialized-form.html#org.joml.Vector2f)

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

  The x component of the vector.

  `float`

  `y`

  The y component of the vector.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector2f()`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to zero.

  `Vector2f(float d)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize both of its components with the given value.

  `Vector2f(float[] xy)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its two components from the first
  two elements of the given array.

  `Vector2f(float x,
  float y)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the given values.

  `Vector2f(int index,
  ByteBuffer buffer)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
  starting at the specified absolute buffer position/index.

  `Vector2f(int index,
  FloatBuffer buffer)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
  starting at the specified absolute buffer position/index.

  `Vector2f(ByteBuffer buffer)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
  at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector2f(FloatBuffer buffer)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
  at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector2f(org.joml.Vector2fc v)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the one of the given vector.

  `Vector2f(org.joml.Vector2ic v)`

  Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the one of the given vector.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector2f`

  `absolute()`

  Set `this` vector's components to their respective absolute values.

  `Vector2f`

  `absolute(Vector2f dest)`

  Compute the absolute of each of this vector's components
  and store the result into `dest`.

  `Vector2f`

  `add(float x,
  float y)`

  Increment the components of this vector by the given values.

  `Vector2f`

  `add(float x,
  float y,
  Vector2f dest)`

  Increment the components of this vector by the given values and store the result in `dest`.

  `Vector2f`

  `add(org.joml.Vector2fc v)`

  Add `v` to this vector.

  `Vector2f`

  `add(org.joml.Vector2fc v,
  Vector2f dest)`

  Add the supplied vector to this one and store the result in
  `dest`.

  `float`

  `angle(org.joml.Vector2fc v)`

  Return the angle between this vector and the supplied vector.

  `Vector2f`

  `ceil()`

  Ceil each component of this vector

  `Vector2f`

  `ceil(Vector2f dest)`

  Compute for each component of this vector the smallest (closest to negative
  infinity) `float` value that is greater than or equal to that
  component and is equal to a mathematical integer and store the result in
  `dest`.

  `float`

  `distance(float x,
  float y)`

  Return the distance between `this` vector and `(x, y)`.

  `static float`

  `distance(float x1,
  float y1,
  float x2,
  float y2)`

  Return the distance between `(x1, y1)` and `(x2, y2)`.

  `float`

  `distance(org.joml.Vector2fc v)`

  Return the distance between this and `v`.

  `float`

  `distanceSquared(float x,
  float y)`

  Return the distance squared between `this` vector and `(x, y)`.

  `static float`

  `distanceSquared(float x1,
  float y1,
  float x2,
  float y2)`

  Return the squared distance between `(x1, y1)` and `(x2, y2)`.

  `float`

  `distanceSquared(org.joml.Vector2fc v)`

  Return the distance squared between this and `v`.

  `Vector2f`

  `div(float scalar)`

  Divide all components of this [`Vector2f`](Vector2f.html "class in org.joml") by the given scalar
  value.

  `Vector2f`

  `div(float x,
  float y)`

  Divide the components of this Vector2f by the given scalar values and store the result in `this`.

  `Vector2f`

  `div(float x,
  float y,
  Vector2f dest)`

  Divide the components of this Vector2f by the given scalar values and store the result in `dest`.

  `Vector2f`

  `div(float scalar,
  Vector2f dest)`

  Divide all components of this [`Vector2f`](Vector2f.html "class in org.joml") by the given scalar
  value and store the result in `dest`.

  `Vector2f`

  `div(org.joml.Vector2fc v)`

  Divide this Vector2f component-wise by another Vector2fc.

  `Vector2f`

  `div(org.joml.Vector2fc v,
  Vector2f dest)`

  Divide this Vector2f component-wise by another Vector2fc
  and store the result in `dest`.

  `float`

  `dot(org.joml.Vector2fc v)`

  Return the dot product of this vector and `v`.

  `boolean`

  `equals(float x,
  float y)`

  Compare the vector components of `this` vector with the given `(x, y)`
  and return whether all of them are equal.

  `boolean`

  `equals(Object obj)`

  `boolean`

  `equals(org.joml.Vector2fc v,
  float delta)`

  Compare the vector components of `this` vector with the given vector using the given `delta`
  and return whether all of them are equal within a maximum difference of `delta`.

  `Vector2f`

  `floor()`

  Set each component of this vector to the largest (closest to positive
  infinity) `float` value that is less than or equal to that
  component and is equal to a mathematical integer.

  `Vector2f`

  `floor(Vector2f dest)`

  Compute for each component of this vector the largest (closest to positive
  infinity) `float` value that is less than or equal to that
  component and is equal to a mathematical integer and store the result in
  `dest`.

  `Vector2f`

  `fma(float a,
  org.joml.Vector2fc b)`

  Add the component-wise multiplication of `a * b` to this vector.

  `Vector2f`

  `fma(float a,
  org.joml.Vector2fc b,
  Vector2f dest)`

  Add the component-wise multiplication of `a * b` to this vector
  and store the result in `dest`.

  `Vector2f`

  `fma(org.joml.Vector2fc a,
  org.joml.Vector2fc b)`

  Add the component-wise multiplication of `a * b` to this vector.

  `Vector2f`

  `fma(org.joml.Vector2fc a,
  org.joml.Vector2fc b,
  Vector2f dest)`

  Add the component-wise multiplication of `a * b` to this vector
  and store the result in `dest`.

  `float`

  `get(int component)`

  Get the value of the specified component of this vector.

  `ByteBuffer`

  `get(int index,
  ByteBuffer buffer)`

  Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `FloatBuffer`

  `get(int index,
  FloatBuffer buffer)`

  Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `org.joml.Vector2i`

  `get(int mode,
  org.joml.Vector2i dest)`

  Set the components of the given vector `dest` to those of `this` vector
  using the given `RoundingMode`.

  `ByteBuffer`

  `get(ByteBuffer buffer)`

  Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `FloatBuffer`

  `get(FloatBuffer buffer)`

  Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `org.joml.Vector2d`

  `get(org.joml.Vector2d dest)`

  Set the components of the given vector `dest` to those of `this` vector.

  `Vector2f`

  `get(Vector2f dest)`

  Set the components of the given vector `dest` to those of `this` vector.

  `org.joml.Vector2fc`

  `getToAddress(long address)`

  Store this vector at the given off-heap memory address.

  `int`

  `hashCode()`

  `boolean`

  `isFinite()`

  Determine whether all components are finite floating-point values, that
  is, they are not [`NaN`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isNaN() "class or interface in java.lang") and not
  [`infinity`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isInfinite() "class or interface in java.lang").

  `float`

  `length()`

  Return the length of this vector.

  `static float`

  `length(float x,
  float y)`

  Get the length of a 2-dimensional single-precision vector.

  `float`

  `lengthSquared()`

  Return the length squared of this vector.

  `static float`

  `lengthSquared(float x,
  float y)`

  Get the length squared of a 2-dimensional single-precision vector.

  `Vector2f`

  `lerp(org.joml.Vector2fc other,
  float t)`

  Linearly interpolate `this` and `other` using the given interpolation factor `t`
  and store the result in `this`.

  `Vector2f`

  `lerp(org.joml.Vector2fc other,
  float t,
  Vector2f dest)`

  Linearly interpolate `this` and `other` using the given interpolation factor `t`
  and store the result in `dest`.

  `Vector2f`

  `max(org.joml.Vector2fc v)`

  Set the components of this vector to be the component-wise maximum of this and the other vector.

  `Vector2f`

  `max(org.joml.Vector2fc v,
  Vector2f dest)`

  Set the components of `dest` to be the component-wise maximum of this and the other vector.

  `int`

  `maxComponent()`

  Determine the component with the biggest absolute value.

  `Vector2f`

  `min(org.joml.Vector2fc v)`

  Set the components of this vector to be the component-wise minimum of this and the other vector.

  `Vector2f`

  `min(org.joml.Vector2fc v,
  Vector2f dest)`

  Set the components of `dest` to be the component-wise minimum of this and the other vector.

  `int`

  `minComponent()`

  Determine the component with the smallest (towards zero) absolute value.

  `Vector2f`

  `mul(float scalar)`

  Multiply the components of this vector by the given scalar.

  `Vector2f`

  `mul(float x,
  float y)`

  Multiply the components of this Vector2f by the given scalar values and store the result in `this`.

  `Vector2f`

  `mul(float x,
  float y,
  Vector2f dest)`

  Multiply the components of this Vector2f by the given scalar values and store the result in `dest`.

  `Vector2f`

  `mul(float scalar,
  Vector2f dest)`

  Multiply the components of this vector by the given scalar and store the result in `dest`.

  `Vector2f`

  `mul(org.joml.Matrix2dc mat)`

  Multiply the given matrix with this Vector2f and store the result in `this`.

  `Vector2f`

  `mul(org.joml.Matrix2dc mat,
  Vector2f dest)`

  Multiply the given matrix with this Vector2f and store the result in `dest`.

  `Vector2f`

  `mul(org.joml.Matrix2fc mat)`

  Multiply the given matrix with this Vector2f and store the result in `this`.

  `Vector2f`

  `mul(org.joml.Matrix2fc mat,
  Vector2f dest)`

  Multiply the given matrix with this Vector2f and store the result in `dest`.

  `Vector2f`

  `mul(org.joml.Vector2fc v)`

  Multiply this Vector2f component-wise by another Vector2f.

  `Vector2f`

  `mul(org.joml.Vector2fc v,
  Vector2f dest)`

  Multiply this Vector2f component-wise by another Vector2f and store the result in `dest`.

  `Vector2f`

  `mulDirection(org.joml.Matrix3x2fc mat)`

  Multiply the given 3x2 matrix `mat` with `this`.

  `Vector2f`

  `mulDirection(org.joml.Matrix3x2fc mat,
  Vector2f dest)`

  Multiply the given 3x2 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector2f`

  `mulPosition(org.joml.Matrix3x2fc mat)`

  Multiply the given 3x2 matrix `mat` with `this`.

  `Vector2f`

  `mulPosition(org.joml.Matrix3x2fc mat,
  Vector2f dest)`

  Multiply the given 3x2 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector2f`

  `mulTranspose(org.joml.Matrix2fc mat)`

  Multiply the transpose of the given matrix with this Vector2f store the result in `this`.

  `Vector2f`

  `mulTranspose(org.joml.Matrix2fc mat,
  Vector2f dest)`

  Multiply the transpose of the given matrix with this Vector3f and store the result in `dest`.

  `Vector2f`

  `negate()`

  Negate this vector.

  `Vector2f`

  `negate(Vector2f dest)`

  Negate this vector and store the result in `dest`.

  `Vector2f`

  `normalize()`

  Normalize this vector.

  `Vector2f`

  `normalize(float length)`

  Scale this vector to have the given length.

  `Vector2f`

  `normalize(float length,
  Vector2f dest)`

  Scale this vector to have the given length and store the result in `dest`.

  `Vector2f`

  `normalize(Vector2f dest)`

  Normalize this vector and store the result in `dest`.

  `Vector2f`

  `perpendicular()`

  Set this vector to be one of its perpendicular vectors.

  `void`

  `readExternal(ObjectInput in)`

  `Vector2f`

  `round()`

  Set each component of this vector to the closest float that is equal to
  a mathematical integer, with ties rounding to positive infinity.

  `Vector2f`

  `round(Vector2f dest)`

  Compute for each component of this vector the closest float that is equal to
  a mathematical integer, with ties rounding to positive infinity and store
  the result in `dest`.

  `Vector2f`

  `set(double d)`

  Set the x and y components to the supplied value.

  `Vector2f`

  `set(double x,
  double y)`

  Set the x and y components to the supplied values.

  `Vector2f`

  `set(float d)`

  Set the x and y components to the supplied value.

  `Vector2f`

  `set(float[] xy)`

  Set the two components of this vector to the first two elements of the given array.

  `Vector2f`

  `set(float x,
  float y)`

  Set the x and y components to the supplied values.

  `Vector2f`

  `set(int index,
  ByteBuffer buffer)`

  Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `Vector2f`

  `set(int index,
  FloatBuffer buffer)`

  Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `Vector2f`

  `set(ByteBuffer buffer)`

  Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector2f`

  `set(FloatBuffer buffer)`

  Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector2f`

  `set(org.joml.Vector2dc v)`

  Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

  `Vector2f`

  `set(org.joml.Vector2fc v)`

  Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

  `Vector2f`

  `set(org.joml.Vector2ic v)`

  Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

  `Vector2f`

  `setComponent(int component,
  float value)`

  Set the value of the specified component of this vector.

  `Vector2f`

  `setFromAddress(long address)`

  Set the values of this vector by reading 2 float values from off-heap memory,
  starting at the given address.

  `Vector2f`

  `sub(float x,
  float y)`

  Subtract `(x, y)` from this vector.

  `Vector2f`

  `sub(float x,
  float y,
  Vector2f dest)`

  Subtract `(x, y)` from this vector and store the result in `dest`.

  `Vector2f`

  `sub(org.joml.Vector2fc v)`

  Subtract `v` from this vector.

  `Vector2f`

  `sub(org.joml.Vector2fc v,
  Vector2f dest)`

  Subtract `v` from `this` vector and store the result in `dest`.

  `String`

  `toString()`

  Return a string representation of this vector.

  `String`

  `toString(NumberFormat formatter)`

  Return a string representation of this vector by formatting the vector components with the given [`NumberFormat`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/NumberFormat.html "class or interface in java.text").

  `void`

  `writeExternal(ObjectOutput out)`

  `float`

  `x()`

  `float`

  `y()`

  `Vector2f`

  `zero()`

  Set all components to zero.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### serialVersionUID

    private static final long serialVersionUID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Vector2f.serialVersionUID)
  + ### x

    public float x

    The x component of the vector.
  + ### y

    public float y

    The y component of the vector.
* Constructor Details
  -------------------

  + ### Vector2f

    public Vector2f()

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to zero.
  + ### Vector2f

    public Vector2f(float d)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize both of its components with the given value.

    Parameters:
    :   `d` - the value of both components
  + ### Vector2f

    public Vector2f(float x,
    float y)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the given values.

    Parameters:
    :   `x` - the x component
    :   `y` - the y component
  + ### Vector2f

    public Vector2f(org.joml.Vector2fc v)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the one of the given vector.

    Parameters:
    :   `v` - the `Vector2fc` to copy the values from
  + ### Vector2f

    public Vector2f(org.joml.Vector2ic v)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its components to the one of the given vector.

    Parameters:
    :   `v` - the `Vector2ic` to copy the values from
  + ### Vector2f

    public Vector2f(float[] xy)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and initialize its two components from the first
    two elements of the given array.

    Parameters:
    :   `xy` - the array containing at least two elements
  + ### Vector2f

    public Vector2f([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
    at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is read, use [`Vector2f(int, ByteBuffer)`](#%3Cinit%3E(int,java.nio.ByteBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y` order

    See Also:
    :   - [`Vector2f(int, ByteBuffer)`](#%3Cinit%3E(int,java.nio.ByteBuffer))
  + ### Vector2f

    public Vector2f(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
    starting at the specified absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - values will be read in `x, y` order
  + ### Vector2f

    public Vector2f([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
    at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is read, use [`Vector2f(int, FloatBuffer)`](#%3Cinit%3E(int,java.nio.FloatBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y` order

    See Also:
    :   - [`Vector2f(int, FloatBuffer)`](#%3Cinit%3E(int,java.nio.FloatBuffer))
  + ### Vector2f

    public Vector2f(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector2f`](Vector2f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
    starting at the specified absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - values will be read in `x, y` order
* Method Details
  --------------

  + ### x

    public float x()

    Specified by:
    :   `x` in interface `org.joml.Vector2fc`

    Returns:
    :   the value of the x component
  + ### y

    public float y()

    Specified by:
    :   `y` in interface `org.joml.Vector2fc`

    Returns:
    :   the value of the y component
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(float d)

    Set the x and y components to the supplied value.

    Parameters:
    :   `d` - the value of both components

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(float x,
    float y)

    Set the x and y components to the supplied values.

    Parameters:
    :   `x` - the x component
    :   `y` - the y component

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(double d)

    Set the x and y components to the supplied value.

    Parameters:
    :   `d` - the value of both components

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(double x,
    double y)

    Set the x and y components to the supplied values.

    Parameters:
    :   `x` - the x component
    :   `y` - the y component

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(org.joml.Vector2fc v)

    Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

    Parameters:
    :   `v` - the vector to copy from

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(org.joml.Vector2ic v)

    Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

    Parameters:
    :   `v` - the vector to copy from

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(org.joml.Vector2dc v)

    Set this [`Vector2f`](Vector2f.html "class in org.joml") to the values of v.

    Note that due to the given vector `v` storing the components in double-precision,
    there is the possibility to lose precision.

    Parameters:
    :   `v` - the vector to copy from

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(float[] xy)

    Set the two components of this vector to the first two elements of the given array.

    Parameters:
    :   `xy` - the array containing at least two elements

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is read, use [`set(int, ByteBuffer)`](#set(int,java.nio.ByteBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y` order

    Returns:
    :   this

    See Also:
    :   - [`set(int, ByteBuffer)`](#set(int,java.nio.ByteBuffer))
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - values will be read in `x, y` order

    Returns:
    :   this
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is read, use [`set(int, FloatBuffer)`](#set(int,java.nio.FloatBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y` order

    Returns:
    :   this

    See Also:
    :   - [`set(int, FloatBuffer)`](#set(int,java.nio.FloatBuffer))
  + ### set

    public [Vector2f](Vector2f.html "class in org.joml") set(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - values will be read in `x, y` order

    Returns:
    :   this
  + ### setFromAddress

    public [Vector2f](Vector2f.html "class in org.joml") setFromAddress(long address)

    Set the values of this vector by reading 2 float values from off-heap memory,
    starting at the given address.

    This method will throw an [`UnsupportedOperationException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/UnsupportedOperationException.html "class or interface in java.lang") when JOML is used with `-Djoml.nounsafe`.

    *This method is unsafe as it can result in a crash of the JVM process when the specified address range does not belong to this process.*

    Parameters:
    :   `address` - the off-heap memory address to read the vector values from

    Returns:
    :   this
  + ### get

    public float get(int component)
    throws [IllegalArgumentException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html "class or interface in java.lang")

    Description copied from interface: `org.joml.Vector2fc`

    Get the value of the specified component of this vector.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `component` - the component, within `[0..1]`

    Returns:
    :   the value

    Throws:
    :   `IllegalArgumentException` - if `component` is not within `[0..1]`
  + ### get

    public org.joml.Vector2i get(int mode,
    org.joml.Vector2i dest)

    Description copied from interface: `org.joml.Vector2fc`

    Set the components of the given vector `dest` to those of `this` vector
    using the given `RoundingMode`.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mode` - the `RoundingMode` to use
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### get

    public [Vector2f](Vector2f.html "class in org.joml") get([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Set the components of the given vector `dest` to those of `this` vector.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### get

    public org.joml.Vector2d get(org.joml.Vector2d dest)

    Description copied from interface: `org.joml.Vector2fc`

    Set the components of the given vector `dest` to those of `this` vector.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### setComponent

    public [Vector2f](Vector2f.html "class in org.joml") setComponent(int component,
    float value)
    throws [IllegalArgumentException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html "class or interface in java.lang")

    Set the value of the specified component of this vector.

    Parameters:
    :   `component` - the component whose value to set, within `[0..1]`
    :   `value` - the value to set

    Returns:
    :   this

    Throws:
    :   `IllegalArgumentException` - if `component` is not within `[0..1]`
  + ### get

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") get([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector2fc`

    Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is stored, use `Vector2fc.get(int, ByteBuffer)`, taking
    the absolute position as parameter.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `buffer` - will receive the values of this vector in `x, y` order

    Returns:
    :   the passed in buffer

    See Also:
    :   - `Vector2fc.get(int, ByteBuffer)`
  + ### get

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") get(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector2fc`

    Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - will receive the values of this vector in `x, y` order

    Returns:
    :   the passed in buffer
  + ### get

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") get([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector2fc`

    Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is stored, use `Vector2fc.get(int, FloatBuffer)`, taking
    the absolute position as parameter.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `buffer` - will receive the values of this vector in `x, y` order

    Returns:
    :   the passed in buffer

    See Also:
    :   - `Vector2fc.get(int, FloatBuffer)`
  + ### get

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") get(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector2fc`

    Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Specified by:
    :   `get` in interface `org.joml.Vector2fc`

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - will receive the values of this vector in `x, y` order

    Returns:
    :   the passed in buffer
  + ### getToAddress

    public org.joml.Vector2fc getToAddress(long address)

    Description copied from interface: `org.joml.Vector2fc`

    Store this vector at the given off-heap memory address.

    This method will throw an [`UnsupportedOperationException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/UnsupportedOperationException.html "class or interface in java.lang") when JOML is used with `-Djoml.nounsafe`.

    *This method is unsafe as it can result in a crash of the JVM process when the specified address range does not belong to this process.*

    Specified by:
    :   `getToAddress` in interface `org.joml.Vector2fc`

    Parameters:
    :   `address` - the off-heap address where to store this vector

    Returns:
    :   this
  + ### perpendicular

    public [Vector2f](Vector2f.html "class in org.joml") perpendicular()

    Set this vector to be one of its perpendicular vectors.

    Returns:
    :   this
  + ### sub

    public [Vector2f](Vector2f.html "class in org.joml") sub(org.joml.Vector2fc v)

    Subtract `v` from this vector.

    Parameters:
    :   `v` - the vector to subtract

    Returns:
    :   this
  + ### sub

    public [Vector2f](Vector2f.html "class in org.joml") sub(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Subtract `v` from `this` vector and store the result in `dest`.

    Specified by:
    :   `sub` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the vector to subtract
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### sub

    public [Vector2f](Vector2f.html "class in org.joml") sub(float x,
    float y)

    Subtract `(x, y)` from this vector.

    Parameters:
    :   `x` - the x component to subtract
    :   `y` - the y component to subtract

    Returns:
    :   this
  + ### sub

    public [Vector2f](Vector2f.html "class in org.joml") sub(float x,
    float y,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Subtract `(x, y)` from this vector and store the result in `dest`.

    Specified by:
    :   `sub` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component to subtract
    :   `y` - the y component to subtract
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### dot

    public float dot(org.joml.Vector2fc v)

    Description copied from interface: `org.joml.Vector2fc`

    Return the dot product of this vector and `v`.

    Specified by:
    :   `dot` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the dot product
  + ### angle

    public float angle(org.joml.Vector2fc v)

    Description copied from interface: `org.joml.Vector2fc`

    Return the angle between this vector and the supplied vector.

    Specified by:
    :   `angle` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the angle, in radians
  + ### lengthSquared

    public float lengthSquared()

    Description copied from interface: `org.joml.Vector2fc`

    Return the length squared of this vector.

    Specified by:
    :   `lengthSquared` in interface `org.joml.Vector2fc`

    Returns:
    :   the length squared
  + ### lengthSquared

    public static float lengthSquared(float x,
    float y)

    Get the length squared of a 2-dimensional single-precision vector.

    Parameters:
    :   `x` - The vector's x component
    :   `y` - The vector's y component

    Returns:
    :   the length squared of the given vector
  + ### length

    public float length()

    Description copied from interface: `org.joml.Vector2fc`

    Return the length of this vector.

    Specified by:
    :   `length` in interface `org.joml.Vector2fc`

    Returns:
    :   the length
  + ### length

    public static float length(float x,
    float y)

    Get the length of a 2-dimensional single-precision vector.

    Parameters:
    :   `x` - The vector's x component
    :   `y` - The vector's y component

    Returns:
    :   the length of the given vector
  + ### distance

    public float distance(org.joml.Vector2fc v)

    Description copied from interface: `org.joml.Vector2fc`

    Return the distance between this and `v`.

    Specified by:
    :   `distance` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the distance
  + ### distanceSquared

    public float distanceSquared(org.joml.Vector2fc v)

    Description copied from interface: `org.joml.Vector2fc`

    Return the distance squared between this and `v`.

    Specified by:
    :   `distanceSquared` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the distance squared
  + ### distance

    public float distance(float x,
    float y)

    Description copied from interface: `org.joml.Vector2fc`

    Return the distance between `this` vector and `(x, y)`.

    Specified by:
    :   `distance` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector

    Returns:
    :   the euclidean distance
  + ### distanceSquared

    public float distanceSquared(float x,
    float y)

    Description copied from interface: `org.joml.Vector2fc`

    Return the distance squared between `this` vector and `(x, y)`.

    Specified by:
    :   `distanceSquared` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector

    Returns:
    :   the euclidean distance squared
  + ### distance

    public static float distance(float x1,
    float y1,
    float x2,
    float y2)

    Return the distance between `(x1, y1)` and `(x2, y2)`.

    Parameters:
    :   `x1` - the x component of the first vector
    :   `y1` - the y component of the first vector
    :   `x2` - the x component of the second vector
    :   `y2` - the y component of the second vector

    Returns:
    :   the euclidean distance
  + ### distanceSquared

    public static float distanceSquared(float x1,
    float y1,
    float x2,
    float y2)

    Return the squared distance between `(x1, y1)` and `(x2, y2)`.

    Parameters:
    :   `x1` - the x component of the first vector
    :   `y1` - the y component of the first vector
    :   `x2` - the x component of the second vector
    :   `y2` - the y component of the second vector

    Returns:
    :   the euclidean distance squared
  + ### normalize

    public [Vector2f](Vector2f.html "class in org.joml") normalize()

    Normalize this vector.

    Returns:
    :   this
  + ### normalize

    public [Vector2f](Vector2f.html "class in org.joml") normalize([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Normalize this vector and store the result in `dest`.

    Specified by:
    :   `normalize` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### normalize

    public [Vector2f](Vector2f.html "class in org.joml") normalize(float length)

    Scale this vector to have the given length.

    Parameters:
    :   `length` - the desired length

    Returns:
    :   this
  + ### normalize

    public [Vector2f](Vector2f.html "class in org.joml") normalize(float length,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Scale this vector to have the given length and store the result in `dest`.

    Specified by:
    :   `normalize` in interface `org.joml.Vector2fc`

    Parameters:
    :   `length` - the desired length
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### add

    public [Vector2f](Vector2f.html "class in org.joml") add(org.joml.Vector2fc v)

    Add `v` to this vector.

    Parameters:
    :   `v` - the vector to add

    Returns:
    :   this
  + ### add

    public [Vector2f](Vector2f.html "class in org.joml") add(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Add the supplied vector to this one and store the result in
    `dest`.

    Specified by:
    :   `add` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the vector to add
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### add

    public [Vector2f](Vector2f.html "class in org.joml") add(float x,
    float y)

    Increment the components of this vector by the given values.

    Parameters:
    :   `x` - the x component to add
    :   `y` - the y component to add

    Returns:
    :   this
  + ### add

    public [Vector2f](Vector2f.html "class in org.joml") add(float x,
    float y,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Increment the components of this vector by the given values and store the result in `dest`.

    Specified by:
    :   `add` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component to add
    :   `y` - the y component to add
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### zero

    public [Vector2f](Vector2f.html "class in org.joml") zero()

    Set all components to zero.

    Returns:
    :   this
  + ### writeExternal

    public void writeExternal([ObjectOutput](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/ObjectOutput.html "class or interface in java.io") out)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `writeExternal` in interface `Externalizable`

    Throws:
    :   `IOException`
  + ### readExternal

    public void readExternal([ObjectInput](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/ObjectInput.html "class or interface in java.io") in)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io"),
    [ClassNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ClassNotFoundException.html "class or interface in java.lang")

    Specified by:
    :   `readExternal` in interface `Externalizable`

    Throws:
    :   `IOException`
    :   `ClassNotFoundException`
  + ### negate

    public [Vector2f](Vector2f.html "class in org.joml") negate()

    Negate this vector.

    Returns:
    :   this
  + ### negate

    public [Vector2f](Vector2f.html "class in org.joml") negate([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Negate this vector and store the result in `dest`.

    Specified by:
    :   `negate` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(float scalar)

    Multiply the components of this vector by the given scalar.

    Parameters:
    :   `scalar` - the value to multiply this vector's components by

    Returns:
    :   this
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(float scalar,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the components of this vector by the given scalar and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector2fc`

    Parameters:
    :   `scalar` - the value to multiply this vector's components by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(float x,
    float y)

    Multiply the components of this Vector2f by the given scalar values and store the result in `this`.

    Parameters:
    :   `x` - the x component to multiply this vector by
    :   `y` - the y component to multiply this vector by

    Returns:
    :   this
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(float x,
    float y,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the components of this Vector2f by the given scalar values and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component to multiply this vector by
    :   `y` - the y component to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Vector2fc v)

    Multiply this Vector2f component-wise by another Vector2f.

    Parameters:
    :   `v` - the vector to multiply by

    Returns:
    :   this
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply this Vector2f component-wise by another Vector2f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the vector to multiply by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(org.joml.Vector2fc v)

    Divide this Vector2f component-wise by another Vector2fc.

    Parameters:
    :   `v` - the vector to divide by

    Returns:
    :   this
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Divide this Vector2f component-wise by another Vector2fc
    and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the vector to divide by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(float scalar)

    Divide all components of this [`Vector2f`](Vector2f.html "class in org.joml") by the given scalar
    value.

    Parameters:
    :   `scalar` - the scalar to divide by

    Returns:
    :   this
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(float scalar,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Divide all components of this [`Vector2f`](Vector2f.html "class in org.joml") by the given scalar
    value and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector2fc`

    Parameters:
    :   `scalar` - the scalar to divide by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(float x,
    float y)

    Divide the components of this Vector2f by the given scalar values and store the result in `this`.

    Parameters:
    :   `x` - the x component to divide this vector by
    :   `y` - the y component to divide this vector by

    Returns:
    :   this
  + ### div

    public [Vector2f](Vector2f.html "class in org.joml") div(float x,
    float y,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Divide the components of this Vector2f by the given scalar values and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component to divide this vector by
    :   `y` - the y component to divide this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Matrix2fc mat)

    Multiply the given matrix with this Vector2f and store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Matrix2fc mat,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the given matrix with this Vector2f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Matrix2dc mat)

    Multiply the given matrix with this Vector2f and store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mul

    public [Vector2f](Vector2f.html "class in org.joml") mul(org.joml.Matrix2dc mat,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the given matrix with this Vector2f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulTranspose

    public [Vector2f](Vector2f.html "class in org.joml") mulTranspose(org.joml.Matrix2fc mat)

    Multiply the transpose of the given matrix with this Vector2f store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mulTranspose

    public [Vector2f](Vector2f.html "class in org.joml") mulTranspose(org.joml.Matrix2fc mat,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the transpose of the given matrix with this Vector3f and store the result in `dest`.

    Specified by:
    :   `mulTranspose` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulPosition

    public [Vector2f](Vector2f.html "class in org.joml") mulPosition(org.joml.Matrix3x2fc mat)

    Multiply the given 3x2 matrix `mat` with `this`.

    This method assumes the `z` component of `this` to be `1.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulPosition

    public [Vector2f](Vector2f.html "class in org.joml") mulPosition(org.joml.Matrix3x2fc mat,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the given 3x2 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `z` component of `this` to be `1.0`.

    Specified by:
    :   `mulPosition` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulDirection

    public [Vector2f](Vector2f.html "class in org.joml") mulDirection(org.joml.Matrix3x2fc mat)

    Multiply the given 3x2 matrix `mat` with `this`.

    This method assumes the `z` component of `this` to be `0.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulDirection

    public [Vector2f](Vector2f.html "class in org.joml") mulDirection(org.joml.Matrix3x2fc mat,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Multiply the given 3x2 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `z` component of `this` to be `0.0`.

    Specified by:
    :   `mulDirection` in interface `org.joml.Vector2fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### lerp

    public [Vector2f](Vector2f.html "class in org.joml") lerp(org.joml.Vector2fc other,
    float t)

    Linearly interpolate `this` and `other` using the given interpolation factor `t`
    and store the result in `this`.

    If `t` is `0.0` then the result is `this`. If the interpolation factor is `1.0`
    then the result is `other`.

    Parameters:
    :   `other` - the other vector
    :   `t` - the interpolation factor between 0.0 and 1.0

    Returns:
    :   this
  + ### lerp

    public [Vector2f](Vector2f.html "class in org.joml") lerp(org.joml.Vector2fc other,
    float t,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Linearly interpolate `this` and `other` using the given interpolation factor `t`
    and store the result in `dest`.

    If `t` is `0.0` then the result is `this`. If the interpolation factor is `1.0`
    then the result is `other`.

    Specified by:
    :   `lerp` in interface `org.joml.Vector2fc`

    Parameters:
    :   `other` - the other vector
    :   `t` - the interpolation factor between 0.0 and 1.0
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`
  + ### equals

    public boolean equals(org.joml.Vector2fc v,
    float delta)

    Description copied from interface: `org.joml.Vector2fc`

    Compare the vector components of `this` vector with the given vector using the given `delta`
    and return whether all of them are equal within a maximum difference of `delta`.

    Please note that this method is not used by any data structure such as [`ArrayList`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util") [`HashSet`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util") or [`HashMap`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")
    and their operations, such as [`ArrayList.contains(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html#contains(java.lang.Object) "class or interface in java.util") or [`HashSet.remove(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html#remove(java.lang.Object) "class or interface in java.util"), since those
    data structures only use the [`Object.equals(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#equals(java.lang.Object) "class or interface in java.lang") and [`Object.hashCode()`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#hashCode() "class or interface in java.lang") methods.

    Specified by:
    :   `equals` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector
    :   `delta` - the allowed maximum difference

    Returns:
    :   `true` whether all of the vector components are equal; `false` otherwise
  + ### equals

    public boolean equals(float x,
    float y)

    Description copied from interface: `org.joml.Vector2fc`

    Compare the vector components of `this` vector with the given `(x, y)`
    and return whether all of them are equal.

    Specified by:
    :   `equals` in interface `org.joml.Vector2fc`

    Parameters:
    :   `x` - the x component to compare to
    :   `y` - the y component to compare to

    Returns:
    :   `true` if all the vector components are equal
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Return a string representation of this vector.

    This method creates a new [`DecimalFormat`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") on every invocation with the format string "`0.000E0;-`".

    Overrides:
    :   `toString` in class `Object`

    Returns:
    :   the string representation
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString([NumberFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/NumberFormat.html "class or interface in java.text") formatter)

    Return a string representation of this vector by formatting the vector components with the given [`NumberFormat`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/NumberFormat.html "class or interface in java.text").

    Parameters:
    :   `formatter` - the [`NumberFormat`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/NumberFormat.html "class or interface in java.text") used to format the vector components with

    Returns:
    :   the string representation
  + ### fma

    public [Vector2f](Vector2f.html "class in org.joml") fma(org.joml.Vector2fc a,
    org.joml.Vector2fc b)

    Add the component-wise multiplication of `a * b` to this vector.

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand

    Returns:
    :   this
  + ### fma

    public [Vector2f](Vector2f.html "class in org.joml") fma(float a,
    org.joml.Vector2fc b)

    Add the component-wise multiplication of `a * b` to this vector.

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand

    Returns:
    :   this
  + ### fma

    public [Vector2f](Vector2f.html "class in org.joml") fma(org.joml.Vector2fc a,
    org.joml.Vector2fc b,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Add the component-wise multiplication of `a * b` to this vector
    and store the result in `dest`.

    Specified by:
    :   `fma` in interface `org.joml.Vector2fc`

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### fma

    public [Vector2f](Vector2f.html "class in org.joml") fma(float a,
    org.joml.Vector2fc b,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Add the component-wise multiplication of `a * b` to this vector
    and store the result in `dest`.

    Specified by:
    :   `fma` in interface `org.joml.Vector2fc`

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### min

    public [Vector2f](Vector2f.html "class in org.joml") min(org.joml.Vector2fc v)

    Set the components of this vector to be the component-wise minimum of this and the other vector.

    Parameters:
    :   `v` - the other vector

    Returns:
    :   this
  + ### min

    public [Vector2f](Vector2f.html "class in org.joml") min(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Set the components of `dest` to be the component-wise minimum of this and the other vector.

    Specified by:
    :   `min` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### max

    public [Vector2f](Vector2f.html "class in org.joml") max(org.joml.Vector2fc v)

    Set the components of this vector to be the component-wise maximum of this and the other vector.

    Parameters:
    :   `v` - the other vector

    Returns:
    :   this
  + ### max

    public [Vector2f](Vector2f.html "class in org.joml") max(org.joml.Vector2fc v,
    [Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Set the components of `dest` to be the component-wise maximum of this and the other vector.

    Specified by:
    :   `max` in interface `org.joml.Vector2fc`

    Parameters:
    :   `v` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### maxComponent

    public int maxComponent()

    Description copied from interface: `org.joml.Vector2fc`

    Determine the component with the biggest absolute value.

    Specified by:
    :   `maxComponent` in interface `org.joml.Vector2fc`

    Returns:
    :   the component index, within `[0..1]`
  + ### minComponent

    public int minComponent()

    Description copied from interface: `org.joml.Vector2fc`

    Determine the component with the smallest (towards zero) absolute value.

    Specified by:
    :   `minComponent` in interface `org.joml.Vector2fc`

    Returns:
    :   the component index, within `[0..1]`
  + ### floor

    public [Vector2f](Vector2f.html "class in org.joml") floor()

    Set each component of this vector to the largest (closest to positive
    infinity) `float` value that is less than or equal to that
    component and is equal to a mathematical integer.

    Returns:
    :   this
  + ### floor

    public [Vector2f](Vector2f.html "class in org.joml") floor([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Compute for each component of this vector the largest (closest to positive
    infinity) `float` value that is less than or equal to that
    component and is equal to a mathematical integer and store the result in
    `dest`.

    Specified by:
    :   `floor` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### ceil

    public [Vector2f](Vector2f.html "class in org.joml") ceil()

    Ceil each component of this vector

    Returns:
    :   this
  + ### ceil

    public [Vector2f](Vector2f.html "class in org.joml") ceil([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Compute for each component of this vector the smallest (closest to negative
    infinity) `float` value that is greater than or equal to that
    component and is equal to a mathematical integer and store the result in
    `dest`.

    Specified by:
    :   `ceil` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### round

    public [Vector2f](Vector2f.html "class in org.joml") round()

    Set each component of this vector to the closest float that is equal to
    a mathematical integer, with ties rounding to positive infinity.

    Returns:
    :   this
  + ### round

    public [Vector2f](Vector2f.html "class in org.joml") round([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Compute for each component of this vector the closest float that is equal to
    a mathematical integer, with ties rounding to positive infinity and store
    the result in `dest`.

    Specified by:
    :   `round` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### isFinite

    public boolean isFinite()

    Description copied from interface: `org.joml.Vector2fc`

    Determine whether all components are finite floating-point values, that
    is, they are not [`NaN`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isNaN() "class or interface in java.lang") and not
    [`infinity`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isInfinite() "class or interface in java.lang").

    Specified by:
    :   `isFinite` in interface `org.joml.Vector2fc`

    Returns:
    :   `true` if all components are finite floating-point values;
        `false` otherwise
  + ### absolute

    public [Vector2f](Vector2f.html "class in org.joml") absolute()

    Set `this` vector's components to their respective absolute values.

    Returns:
    :   this
  + ### absolute

    public [Vector2f](Vector2f.html "class in org.joml") absolute([Vector2f](Vector2f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector2fc`

    Compute the absolute of each of this vector's components
    and store the result into `dest`.

    Specified by:
    :   `absolute` in interface `org.joml.Vector2fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest