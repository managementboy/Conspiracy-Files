[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [org.joml](package-summary.html)
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
   2. [Vector3f(float)](#%3Cinit%3E(float))
   3. [Vector3f(float, float, float)](#%3Cinit%3E(float,float,float))
   4. [Vector3f(Vector3fc)](#%3Cinit%3E(org.joml.Vector3fc))
   5. [Vector3f(Vector3ic)](#%3Cinit%3E(org.joml.Vector3ic))
   6. [Vector3f(Vector2fc, float)](#%3Cinit%3E(org.joml.Vector2fc,float))
   7. [Vector3f(Vector2ic, float)](#%3Cinit%3E(org.joml.Vector2ic,float))
   8. [Vector3f(float[])](#%3Cinit%3E(float%5B%5D))
   9. [Vector3f(ByteBuffer)](#%3Cinit%3E(java.nio.ByteBuffer))
   10. [Vector3f(int, ByteBuffer)](#%3Cinit%3E(int,java.nio.ByteBuffer))
   11. [Vector3f(FloatBuffer)](#%3Cinit%3E(java.nio.FloatBuffer))
   12. [Vector3f(int, FloatBuffer)](#%3Cinit%3E(int,java.nio.FloatBuffer))
7. [Method Details](#method-detail)
   1. [x()](#x())
   2. [y()](#y())
   3. [z()](#z())
   4. [set(Vector3fc)](#set(org.joml.Vector3fc))
   5. [set(Vector3dc)](#set(org.joml.Vector3dc))
   6. [set(Vector3ic)](#set(org.joml.Vector3ic))
   7. [set(Vector2fc, float)](#set(org.joml.Vector2fc,float))
   8. [set(Vector2dc, float)](#set(org.joml.Vector2dc,float))
   9. [set(Vector2ic, float)](#set(org.joml.Vector2ic,float))
   10. [set(float)](#set(float))
   11. [set(float, float, float)](#set(float,float,float))
   12. [set(double)](#set(double))
   13. [set(double, double, double)](#set(double,double,double))
   14. [set(float[])](#set(float%5B%5D))
   15. [set(ByteBuffer)](#set(java.nio.ByteBuffer))
   16. [set(int, ByteBuffer)](#set(int,java.nio.ByteBuffer))
   17. [set(FloatBuffer)](#set(java.nio.FloatBuffer))
   18. [set(int, FloatBuffer)](#set(int,java.nio.FloatBuffer))
   19. [setFromAddress(long)](#setFromAddress(long))
   20. [setComponent(int, float)](#setComponent(int,float))
   21. [get(FloatBuffer)](#get(java.nio.FloatBuffer))
   22. [get(int, FloatBuffer)](#get(int,java.nio.FloatBuffer))
   23. [get(ByteBuffer)](#get(java.nio.ByteBuffer))
   24. [get(int, ByteBuffer)](#get(int,java.nio.ByteBuffer))
   25. [getToAddress(long)](#getToAddress(long))
   26. [sub(Vector3fc)](#sub(org.joml.Vector3fc))
   27. [sub(Vector3fc, Vector3f)](#sub(org.joml.Vector3fc,org.joml.Vector3f))
   28. [sub(float, float, float)](#sub(float,float,float))
   29. [sub(float, float, float, Vector3f)](#sub(float,float,float,org.joml.Vector3f))
   30. [add(Vector3fc)](#add(org.joml.Vector3fc))
   31. [add(Vector3fc, Vector3f)](#add(org.joml.Vector3fc,org.joml.Vector3f))
   32. [add(float, float, float)](#add(float,float,float))
   33. [add(float, float, float, Vector3f)](#add(float,float,float,org.joml.Vector3f))
   34. [fma(Vector3fc, Vector3fc)](#fma(org.joml.Vector3fc,org.joml.Vector3fc))
   35. [fma(float, Vector3fc)](#fma(float,org.joml.Vector3fc))
   36. [fma(Vector3fc, Vector3fc, Vector3f)](#fma(org.joml.Vector3fc,org.joml.Vector3fc,org.joml.Vector3f))
   37. [fma(float, Vector3fc, Vector3f)](#fma(float,org.joml.Vector3fc,org.joml.Vector3f))
   38. [mulAdd(Vector3fc, Vector3fc)](#mulAdd(org.joml.Vector3fc,org.joml.Vector3fc))
   39. [mulAdd(float, Vector3fc)](#mulAdd(float,org.joml.Vector3fc))
   40. [mulAdd(Vector3fc, Vector3fc, Vector3f)](#mulAdd(org.joml.Vector3fc,org.joml.Vector3fc,org.joml.Vector3f))
   41. [mulAdd(float, Vector3fc, Vector3f)](#mulAdd(float,org.joml.Vector3fc,org.joml.Vector3f))
   42. [mul(Vector3fc)](#mul(org.joml.Vector3fc))
   43. [mul(Vector3fc, Vector3f)](#mul(org.joml.Vector3fc,org.joml.Vector3f))
   44. [div(Vector3fc)](#div(org.joml.Vector3fc))
   45. [div(Vector3fc, Vector3f)](#div(org.joml.Vector3fc,org.joml.Vector3f))
   46. [mulProject(Matrix4fc, Vector3f)](#mulProject(org.joml.Matrix4fc,org.joml.Vector3f))
   47. [mulProject(Matrix4fc, float, Vector3f)](#mulProject(org.joml.Matrix4fc,float,org.joml.Vector3f))
   48. [mulProject(Matrix4fc)](#mulProject(org.joml.Matrix4fc))
   49. [mul(Matrix3fc)](#mul(org.joml.Matrix3fc))
   50. [mul(Matrix3fc, Vector3f)](#mul(org.joml.Matrix3fc,org.joml.Vector3f))
   51. [mul(Matrix3dc)](#mul(org.joml.Matrix3dc))
   52. [mul(Matrix3dc, Vector3f)](#mul(org.joml.Matrix3dc,org.joml.Vector3f))
   53. [mul(Matrix3x2fc)](#mul(org.joml.Matrix3x2fc))
   54. [mul(Matrix3x2fc, Vector3f)](#mul(org.joml.Matrix3x2fc,org.joml.Vector3f))
   55. [mulTranspose(Matrix3fc)](#mulTranspose(org.joml.Matrix3fc))
   56. [mulTranspose(Matrix3fc, Vector3f)](#mulTranspose(org.joml.Matrix3fc,org.joml.Vector3f))
   57. [mulPosition(Matrix4fc)](#mulPosition(org.joml.Matrix4fc))
   58. [mulPosition(Matrix4x3fc)](#mulPosition(org.joml.Matrix4x3fc))
   59. [mulPosition(Matrix4fc, Vector3f)](#mulPosition(org.joml.Matrix4fc,org.joml.Vector3f))
   60. [mulPosition(Matrix4x3fc, Vector3f)](#mulPosition(org.joml.Matrix4x3fc,org.joml.Vector3f))
   61. [mulTransposePosition(Matrix4fc)](#mulTransposePosition(org.joml.Matrix4fc))
   62. [mulTransposePosition(Matrix4fc, Vector3f)](#mulTransposePosition(org.joml.Matrix4fc,org.joml.Vector3f))
   63. [mulPositionW(Matrix4fc)](#mulPositionW(org.joml.Matrix4fc))
   64. [mulPositionW(Matrix4fc, Vector3f)](#mulPositionW(org.joml.Matrix4fc,org.joml.Vector3f))
   65. [mulDirection(Matrix4dc)](#mulDirection(org.joml.Matrix4dc))
   66. [mulDirection(Matrix4fc)](#mulDirection(org.joml.Matrix4fc))
   67. [mulDirection(Matrix4x3fc)](#mulDirection(org.joml.Matrix4x3fc))
   68. [mulDirection(Matrix4dc, Vector3f)](#mulDirection(org.joml.Matrix4dc,org.joml.Vector3f))
   69. [mulDirection(Matrix4fc, Vector3f)](#mulDirection(org.joml.Matrix4fc,org.joml.Vector3f))
   70. [mulDirection(Matrix4x3fc, Vector3f)](#mulDirection(org.joml.Matrix4x3fc,org.joml.Vector3f))
   71. [mulTransposeDirection(Matrix4fc)](#mulTransposeDirection(org.joml.Matrix4fc))
   72. [mulTransposeDirection(Matrix4fc, Vector3f)](#mulTransposeDirection(org.joml.Matrix4fc,org.joml.Vector3f))
   73. [mul(float)](#mul(float))
   74. [mul(float, Vector3f)](#mul(float,org.joml.Vector3f))
   75. [mul(float, float, float)](#mul(float,float,float))
   76. [mul(float, float, float, Vector3f)](#mul(float,float,float,org.joml.Vector3f))
   77. [div(float)](#div(float))
   78. [div(float, Vector3f)](#div(float,org.joml.Vector3f))
   79. [div(float, float, float)](#div(float,float,float))
   80. [div(float, float, float, Vector3f)](#div(float,float,float,org.joml.Vector3f))
   81. [rotate(Quaternionfc)](#rotate(org.joml.Quaternionfc))
   82. [rotate(Quaternionfc, Vector3f)](#rotate(org.joml.Quaternionfc,org.joml.Vector3f))
   83. [rotationTo(Vector3fc, Quaternionf)](#rotationTo(org.joml.Vector3fc,org.joml.Quaternionf))
   84. [rotationTo(float, float, float, Quaternionf)](#rotationTo(float,float,float,org.joml.Quaternionf))
   85. [rotateAxis(float, float, float, float)](#rotateAxis(float,float,float,float))
   86. [rotateAxis(float, float, float, float, Vector3f)](#rotateAxis(float,float,float,float,org.joml.Vector3f))
   87. [rotateAxisInternal(float, float, float, float, Vector3f)](#rotateAxisInternal(float,float,float,float,org.joml.Vector3f))
   88. [rotateX(float)](#rotateX(float))
   89. [rotateX(float, Vector3f)](#rotateX(float,org.joml.Vector3f))
   90. [rotateY(float)](#rotateY(float))
   91. [rotateY(float, Vector3f)](#rotateY(float,org.joml.Vector3f))
   92. [rotateZ(float)](#rotateZ(float))
   93. [rotateZ(float, Vector3f)](#rotateZ(float,org.joml.Vector3f))
   94. [lengthSquared()](#lengthSquared())
   95. [lengthSquared(float, float, float)](#lengthSquared(float,float,float))
   96. [length()](#length())
   97. [length(float, float, float)](#length(float,float,float))
   98. [normalize()](#normalize())
   99. [normalize(Vector3f)](#normalize(org.joml.Vector3f))
   100. [normalize(float)](#normalize(float))
   101. [normalize(float, Vector3f)](#normalize(float,org.joml.Vector3f))
   102. [cross(Vector3fc)](#cross(org.joml.Vector3fc))
   103. [cross(float, float, float)](#cross(float,float,float))
   104. [cross(Vector3fc, Vector3f)](#cross(org.joml.Vector3fc,org.joml.Vector3f))
   105. [cross(float, float, float, Vector3f)](#cross(float,float,float,org.joml.Vector3f))
   106. [distance(Vector3fc)](#distance(org.joml.Vector3fc))
   107. [distance(float, float, float)](#distance(float,float,float))
   108. [distanceSquared(Vector3fc)](#distanceSquared(org.joml.Vector3fc))
   109. [distanceSquared(float, float, float)](#distanceSquared(float,float,float))
   110. [distance(float, float, float, float, float, float)](#distance(float,float,float,float,float,float))
   111. [distanceSquared(float, float, float, float, float, float)](#distanceSquared(float,float,float,float,float,float))
   112. [dot(Vector3fc)](#dot(org.joml.Vector3fc))
   113. [dot(float, float, float)](#dot(float,float,float))
   114. [angleCos(Vector3fc)](#angleCos(org.joml.Vector3fc))
   115. [angle(Vector3fc)](#angle(org.joml.Vector3fc))
   116. [angleSigned(Vector3fc, Vector3fc)](#angleSigned(org.joml.Vector3fc,org.joml.Vector3fc))
   117. [angleSigned(float, float, float, float, float, float)](#angleSigned(float,float,float,float,float,float))
   118. [min(Vector3fc)](#min(org.joml.Vector3fc))
   119. [min(Vector3fc, Vector3f)](#min(org.joml.Vector3fc,org.joml.Vector3f))
   120. [max(Vector3fc)](#max(org.joml.Vector3fc))
   121. [max(Vector3fc, Vector3f)](#max(org.joml.Vector3fc,org.joml.Vector3f))
   122. [zero()](#zero())
   123. [toString()](#toString())
   124. [toString(NumberFormat)](#toString(java.text.NumberFormat))
   125. [writeExternal(ObjectOutput)](#writeExternal(java.io.ObjectOutput))
   126. [readExternal(ObjectInput)](#readExternal(java.io.ObjectInput))
   127. [negate()](#negate())
   128. [negate(Vector3f)](#negate(org.joml.Vector3f))
   129. [absolute()](#absolute())
   130. [absolute(Vector3f)](#absolute(org.joml.Vector3f))
   131. [hashCode()](#hashCode())
   132. [equals(Object)](#equals(java.lang.Object))
   133. [equals(Vector3fc, float)](#equals(org.joml.Vector3fc,float))
   134. [equals(float, float, float)](#equals(float,float,float))
   135. [reflect(Vector3fc)](#reflect(org.joml.Vector3fc))
   136. [reflect(float, float, float)](#reflect(float,float,float))
   137. [reflect(Vector3fc, Vector3f)](#reflect(org.joml.Vector3fc,org.joml.Vector3f))
   138. [reflect(float, float, float, Vector3f)](#reflect(float,float,float,org.joml.Vector3f))
   139. [half(Vector3fc)](#half(org.joml.Vector3fc))
   140. [half(float, float, float)](#half(float,float,float))
   141. [half(Vector3fc, Vector3f)](#half(org.joml.Vector3fc,org.joml.Vector3f))
   142. [half(float, float, float, Vector3f)](#half(float,float,float,org.joml.Vector3f))
   143. [smoothStep(Vector3fc, float, Vector3f)](#smoothStep(org.joml.Vector3fc,float,org.joml.Vector3f))
   144. [hermite(Vector3fc, Vector3fc, Vector3fc, float, Vector3f)](#hermite(org.joml.Vector3fc,org.joml.Vector3fc,org.joml.Vector3fc,float,org.joml.Vector3f))
   145. [lerp(Vector3fc, float)](#lerp(org.joml.Vector3fc,float))
   146. [lerp(Vector3fc, float, Vector3f)](#lerp(org.joml.Vector3fc,float,org.joml.Vector3f))
   147. [get(int)](#get(int))
   148. [get(int, Vector3i)](#get(int,org.joml.Vector3i))
   149. [get(Vector3f)](#get(org.joml.Vector3f))
   150. [get(Vector3d)](#get(org.joml.Vector3d))
   151. [maxComponent()](#maxComponent())
   152. [minComponent()](#minComponent())
   153. [orthogonalize(Vector3fc, Vector3f)](#orthogonalize(org.joml.Vector3fc,org.joml.Vector3f))
   154. [orthogonalize(Vector3fc)](#orthogonalize(org.joml.Vector3fc))
   155. [orthogonalizeUnit(Vector3fc, Vector3f)](#orthogonalizeUnit(org.joml.Vector3fc,org.joml.Vector3f))
   156. [orthogonalizeUnit(Vector3fc)](#orthogonalizeUnit(org.joml.Vector3fc))
   157. [floor()](#floor())
   158. [floor(Vector3f)](#floor(org.joml.Vector3f))
   159. [ceil()](#ceil())
   160. [ceil(Vector3f)](#ceil(org.joml.Vector3f))
   161. [round()](#round())
   162. [round(Vector3f)](#round(org.joml.Vector3f))
   163. [isFinite()](#isFinite())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Vector3f
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.joml.Vector3f

All Implemented Interfaces:
:   `Externalizable, Serializable, org.joml.Vector3fc`

---

public class Vector3f
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Externalizable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Externalizable.html "class or interface in java.io"), org.joml.Vector3fc

Contains the definition of a Vector comprising 3 floats and associated
transformations.

See Also:
:   * [Serialized Form](../../serialized-form.html#org.joml.Vector3f)

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

  `float`

  `z`

  The z component of the vector.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Vector3f()`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") of `(0, 0, 0)`.

  `Vector3f(float d)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and initialize all three components with the given value.

  `Vector3f(float[] xyz)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and initialize its three components from the first
  three elements of the given array.

  `Vector3f(float x,
  float y,
  float z)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the given component values.

  `Vector3f(int index,
  ByteBuffer buffer)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
  starting at the specified absolute buffer position/index.

  `Vector3f(int index,
  FloatBuffer buffer)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
  starting at the specified absolute buffer position/index.

  `Vector3f(ByteBuffer buffer)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
  at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector3f(FloatBuffer buffer)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
  at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector3f(org.joml.Vector2fc v,
  float z)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the first two components from the
  given `v` and the given `z`

  `Vector3f(org.joml.Vector2ic v,
  float z)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the first two components from the
  given `v` and the given `z`

  `Vector3f(org.joml.Vector3fc v)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the same values as `v`.

  `Vector3f(org.joml.Vector3ic v)`

  Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the same values as `v`.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector3f`

  `absolute()`

  Set `this` vector's components to their respective absolute values.

  `Vector3f`

  `absolute(Vector3f dest)`

  Compute the absolute values of the individual components of `this` and store the result in `dest`.

  `Vector3f`

  `add(float x,
  float y,
  float z)`

  Increment the components of this vector by the given values.

  `Vector3f`

  `add(float x,
  float y,
  float z,
  Vector3f dest)`

  Increment the components of this vector by the given values and store the result in `dest`.

  `Vector3f`

  `add(org.joml.Vector3fc v)`

  Add the supplied vector to this one.

  `Vector3f`

  `add(org.joml.Vector3fc v,
  Vector3f dest)`

  Add the supplied vector to this one and store the result in `dest`.

  `float`

  `angle(org.joml.Vector3fc v)`

  Return the angle between this vector and the supplied vector.

  `float`

  `angleCos(org.joml.Vector3fc v)`

  Return the cosine of the angle between this vector and the supplied vector.

  `float`

  `angleSigned(float x,
  float y,
  float z,
  float nx,
  float ny,
  float nz)`

  Return the signed angle between this vector and the supplied vector with
  respect to the plane with the given normal vector `(nx, ny, nz)`.

  `float`

  `angleSigned(org.joml.Vector3fc v,
  org.joml.Vector3fc n)`

  Return the signed angle between this vector and the supplied vector with
  respect to the plane with the given normal vector `n`.

  `Vector3f`

  `ceil()`

  Set each component of this vector to the smallest (closest to negative
  infinity) `float` value that is greater than or equal to that
  component and is equal to a mathematical integer.

  `Vector3f`

  `ceil(Vector3f dest)`

  Compute for each component of this vector the smallest (closest to negative
  infinity) `float` value that is greater than or equal to that
  component and is equal to a mathematical integer and store the result in
  `dest`.

  `Vector3f`

  `cross(float x,
  float y,
  float z)`

  Set this vector to be the cross product of itself and `(x, y, z)`.

  `Vector3f`

  `cross(float x,
  float y,
  float z,
  Vector3f dest)`

  Compute the cross product of this vector and `(x, y, z)` and store the result in `dest`.

  `Vector3f`

  `cross(org.joml.Vector3fc v)`

  Set this vector to be the cross product of itself and `v`.

  `Vector3f`

  `cross(org.joml.Vector3fc v,
  Vector3f dest)`

  Compute the cross product of this vector and `v` and store the result in `dest`.

  `float`

  `distance(float x,
  float y,
  float z)`

  Return the distance between `this` vector and `(x, y, z)`.

  `static float`

  `distance(float x1,
  float y1,
  float z1,
  float x2,
  float y2,
  float z2)`

  Return the distance between `(x1, y1, z1)` and `(x2, y2, z2)`.

  `float`

  `distance(org.joml.Vector3fc v)`

  Return the distance between this Vector and `v`.

  `float`

  `distanceSquared(float x,
  float y,
  float z)`

  Return the square of the distance between `this` vector and `(x, y, z)`.

  `static float`

  `distanceSquared(float x1,
  float y1,
  float z1,
  float x2,
  float y2,
  float z2)`

  Return the squared distance between `(x1, y1, z1)` and `(x2, y2, z2)`.

  `float`

  `distanceSquared(org.joml.Vector3fc v)`

  Return the square of the distance between this vector and `v`.

  `Vector3f`

  `div(float scalar)`

  Divide all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
  value.

  `Vector3f`

  `div(float x,
  float y,
  float z)`

  Divide the components of this Vector3f by the given scalar values and store the result in `this`.

  `Vector3f`

  `div(float x,
  float y,
  float z,
  Vector3f dest)`

  Divide the components of this Vector3f by the given scalar values and store the result in `dest`.

  `Vector3f`

  `div(float scalar,
  Vector3f dest)`

  Divide all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
  value and store the result in `dest`.

  `Vector3f`

  `div(org.joml.Vector3fc v)`

  Divide this Vector3f component-wise by another Vector3fc.

  `Vector3f`

  `div(org.joml.Vector3fc v,
  Vector3f dest)`

  Divide this Vector3f component-wise by another Vector3f and store the result in `dest`.

  `float`

  `dot(float x,
  float y,
  float z)`

  Return the dot product of this vector and the vector `(x, y, z)`.

  `float`

  `dot(org.joml.Vector3fc v)`

  Return the dot product of this vector and the supplied vector.

  `boolean`

  `equals(float x,
  float y,
  float z)`

  Compare the vector components of `this` vector with the given `(x, y, z)`
  and return whether all of them are equal.

  `boolean`

  `equals(Object obj)`

  `boolean`

  `equals(org.joml.Vector3fc v,
  float delta)`

  Compare the vector components of `this` vector with the given vector using the given `delta`
  and return whether all of them are equal within a maximum difference of `delta`.

  `Vector3f`

  `floor()`

  Set each component of this vector to the largest (closest to positive
  infinity) `float` value that is less than or equal to that
  component and is equal to a mathematical integer.

  `Vector3f`

  `floor(Vector3f dest)`

  Compute for each component of this vector the largest (closest to positive
  infinity) `float` value that is less than or equal to that
  component and is equal to a mathematical integer and store the result in
  `dest`.

  `Vector3f`

  `fma(float a,
  org.joml.Vector3fc b)`

  Add the component-wise multiplication of `a * b` to this vector.

  `Vector3f`

  `fma(float a,
  org.joml.Vector3fc b,
  Vector3f dest)`

  Add the component-wise multiplication of `a * b` to this vector
  and store the result in `dest`.

  `Vector3f`

  `fma(org.joml.Vector3fc a,
  org.joml.Vector3fc b)`

  Add the component-wise multiplication of `a * b` to this vector.

  `Vector3f`

  `fma(org.joml.Vector3fc a,
  org.joml.Vector3fc b,
  Vector3f dest)`

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

  `org.joml.Vector3i`

  `get(int mode,
  org.joml.Vector3i dest)`

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

  `org.joml.Vector3d`

  `get(org.joml.Vector3d dest)`

  Set the components of the given vector `dest` to those of `this` vector.

  `Vector3f`

  `get(Vector3f dest)`

  Set the components of the given vector `dest` to those of `this` vector.

  `org.joml.Vector3fc`

  `getToAddress(long address)`

  Store this vector at the given off-heap memory address.

  `Vector3f`

  `half(float x,
  float y,
  float z)`

  Compute the half vector between this and the vector `(x, y, z)`.

  `Vector3f`

  `half(float x,
  float y,
  float z,
  Vector3f dest)`

  Compute the half vector between this and the vector `(x, y, z)`
  and store the result in `dest`.

  `Vector3f`

  `half(org.joml.Vector3fc other)`

  Compute the half vector between this and the other vector.

  `Vector3f`

  `half(org.joml.Vector3fc other,
  Vector3f dest)`

  Compute the half vector between this and the other vector and store the result in `dest`.

  `int`

  `hashCode()`

  `Vector3f`

  `hermite(org.joml.Vector3fc t0,
  org.joml.Vector3fc v1,
  org.joml.Vector3fc t1,
  float t,
  Vector3f dest)`

  Compute a hermite interpolation between `this` vector with its
  associated tangent `t0` and the given vector `v`
  with its tangent `t1` and store the result in
  `dest`.

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
  float y,
  float z)`

  Get the length of a 3-dimensional single-precision vector.

  `float`

  `lengthSquared()`

  Return the length squared of this vector.

  `static float`

  `lengthSquared(float x,
  float y,
  float z)`

  Get the length squared of a 3-dimensional single-precision vector.

  `Vector3f`

  `lerp(org.joml.Vector3fc other,
  float t)`

  Linearly interpolate `this` and `other` using the given interpolation factor `t`
  and store the result in `this`.

  `Vector3f`

  `lerp(org.joml.Vector3fc other,
  float t,
  Vector3f dest)`

  Linearly interpolate `this` and `other` using the given interpolation factor `t`
  and store the result in `dest`.

  `Vector3f`

  `max(org.joml.Vector3fc v)`

  Set the components of this vector to be the component-wise maximum of this and the other vector.

  `Vector3f`

  `max(org.joml.Vector3fc v,
  Vector3f dest)`

  Set the components of `dest` to be the component-wise maximum of this and the other vector.

  `int`

  `maxComponent()`

  Determine the component with the biggest absolute value.

  `Vector3f`

  `min(org.joml.Vector3fc v)`

  Set the components of this vector to be the component-wise minimum of this and the other vector.

  `Vector3f`

  `min(org.joml.Vector3fc v,
  Vector3f dest)`

  Set the components of `dest` to be the component-wise minimum of this and the other vector.

  `int`

  `minComponent()`

  Determine the component with the smallest (towards zero) absolute value.

  `Vector3f`

  `mul(float scalar)`

  Multiply all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
  value.

  `Vector3f`

  `mul(float x,
  float y,
  float z)`

  Multiply the components of this Vector3f by the given scalar values and store the result in `this`.

  `Vector3f`

  `mul(float x,
  float y,
  float z,
  Vector3f dest)`

  Multiply the components of this Vector3f by the given scalar values and store the result in `dest`.

  `Vector3f`

  `mul(float scalar,
  Vector3f dest)`

  Multiply all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
  value and store the result in `dest`.

  `Vector3f`

  `mul(org.joml.Matrix3dc mat)`

  Multiply the given matrix with this Vector3f and store the result in `this`.

  `Vector3f`

  `mul(org.joml.Matrix3dc mat,
  Vector3f dest)`

  Multiply the given matrix with this Vector3f and store the result in `dest`.

  `Vector3f`

  `mul(org.joml.Matrix3fc mat)`

  Multiply the given matrix with this Vector3f and store the result in `this`.

  `Vector3f`

  `mul(org.joml.Matrix3fc mat,
  Vector3f dest)`

  Multiply the given matrix with this Vector3f and store the result in `dest`.

  `Vector3f`

  `mul(org.joml.Matrix3x2fc mat)`

  Multiply the given matrix with this Vector3f and store the result in `this`.

  `Vector3f`

  `mul(org.joml.Matrix3x2fc mat,
  Vector3f dest)`

  Multiply the given matrix `mat` with `this` by assuming a
  third row in the matrix of `(0, 0, 1)` and store the result in `dest`.

  `Vector3f`

  `mul(org.joml.Vector3fc v)`

  Multiply this Vector3f component-wise by another Vector3fc.

  `Vector3f`

  `mul(org.joml.Vector3fc v,
  Vector3f dest)`

  Multiply this Vector3f component-wise by another Vector3f and store the result in `dest`.

  `Vector3f`

  `mulAdd(float a,
  org.joml.Vector3fc b)`

  Add the component-wise multiplication of `this * a` to `b`
  and store the result in `this`.

  `Vector3f`

  `mulAdd(float a,
  org.joml.Vector3fc b,
  Vector3f dest)`

  Add the component-wise multiplication of `this * a` to `b`
  and store the result in `dest`.

  `Vector3f`

  `mulAdd(org.joml.Vector3fc a,
  org.joml.Vector3fc b)`

  Add the component-wise multiplication of `this * a` to `b`
  and store the result in `this`.

  `Vector3f`

  `mulAdd(org.joml.Vector3fc a,
  org.joml.Vector3fc b,
  Vector3f dest)`

  Add the component-wise multiplication of `this * a` to `b`
  and store the result in `dest`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4dc mat)`

  Multiply the given 4x4 matrix `mat` with `this`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4dc mat,
  Vector3f dest)`

  Multiply the given 4x4 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4fc mat)`

  Multiply the given 4x4 matrix `mat` with `this`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the given 4x4 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4x3fc mat)`

  Multiply the given 4x3 matrix `mat` with `this`.

  `Vector3f`

  `mulDirection(org.joml.Matrix4x3fc mat,
  Vector3f dest)`

  Multiply the given 4x3 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `mulPosition(org.joml.Matrix4fc mat)`

  Multiply the given 4x4 matrix `mat` with `this`.

  `Vector3f`

  `mulPosition(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the given 4x4 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `mulPosition(org.joml.Matrix4x3fc mat)`

  Multiply the given 4x3 matrix `mat` with `this`.

  `Vector3f`

  `mulPosition(org.joml.Matrix4x3fc mat,
  Vector3f dest)`

  Multiply the given 4x3 matrix `mat` with `this` and store the
  result in `dest`.

  `float`

  `mulPositionW(org.joml.Matrix4fc mat)`

  Multiply the given 4x4 matrix `mat` with `this` and return the *w* component
  of the resulting 4D vector.

  `float`

  `mulPositionW(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the given 4x4 matrix `mat` with `this`, store the
  result in `dest` and return the *w* component of the resulting 4D vector.

  `Vector3f`

  `mulProject(org.joml.Matrix4fc mat)`

  Multiply the given matrix `mat` with this Vector3f, perform perspective division.

  `Vector3f`

  `mulProject(org.joml.Matrix4fc mat,
  float w,
  Vector3f dest)`

  Multiply the given matrix `mat` with this Vector3f, perform perspective division
  and store the result in `dest`.

  `Vector3f`

  `mulProject(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the given matrix `mat` with this Vector3f, perform perspective division
  and store the result in `dest`.

  `Vector3f`

  `mulTranspose(org.joml.Matrix3fc mat)`

  Multiply the transpose of the given matrix with this Vector3f store the result in `this`.

  `Vector3f`

  `mulTranspose(org.joml.Matrix3fc mat,
  Vector3f dest)`

  Multiply the transpose of the given matrix with this Vector3f and store the result in `dest`.

  `Vector3f`

  `mulTransposeDirection(org.joml.Matrix4fc mat)`

  Multiply the transpose of the given 4x4 matrix `mat` with `this`.

  `Vector3f`

  `mulTransposeDirection(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the transpose of the given 4x4 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `mulTransposePosition(org.joml.Matrix4fc mat)`

  Multiply the transpose of the given 4x4 matrix `mat` with `this`.

  `Vector3f`

  `mulTransposePosition(org.joml.Matrix4fc mat,
  Vector3f dest)`

  Multiply the transpose of the given 4x4 matrix `mat` with `this` and store the
  result in `dest`.

  `Vector3f`

  `negate()`

  Negate this vector.

  `Vector3f`

  `negate(Vector3f dest)`

  Negate this vector and store the result in `dest`.

  `Vector3f`

  `normalize()`

  Normalize this vector.

  `Vector3f`

  `normalize(float length)`

  Scale this vector to have the given length.

  `Vector3f`

  `normalize(float length,
  Vector3f dest)`

  Scale this vector to have the given length and store the result in `dest`.

  `Vector3f`

  `normalize(Vector3f dest)`

  Normalize this vector and store the result in `dest`.

  `Vector3f`

  `orthogonalize(org.joml.Vector3fc v)`

  Transform `this` vector so that it is orthogonal to the given vector `v` and normalize the result.

  `Vector3f`

  `orthogonalize(org.joml.Vector3fc v,
  Vector3f dest)`

  Transform `this` vector so that it is orthogonal to the given vector `v`, normalize the result and store it into `dest`.

  `Vector3f`

  `orthogonalizeUnit(org.joml.Vector3fc v)`

  Transform `this` vector so that it is orthogonal to the given unit vector `v` and normalize the result.

  `Vector3f`

  `orthogonalizeUnit(org.joml.Vector3fc v,
  Vector3f dest)`

  Transform `this` vector so that it is orthogonal to the given unit vector `v`, normalize the result and store it into `dest`.

  `void`

  `readExternal(ObjectInput in)`

  `Vector3f`

  `reflect(float x,
  float y,
  float z)`

  Reflect this vector about the given normal vector.

  `Vector3f`

  `reflect(float x,
  float y,
  float z,
  Vector3f dest)`

  Reflect this vector about the given normal vector and store the result in `dest`.

  `Vector3f`

  `reflect(org.joml.Vector3fc normal)`

  Reflect this vector about the given `normal` vector.

  `Vector3f`

  `reflect(org.joml.Vector3fc normal,
  Vector3f dest)`

  Reflect this vector about the given `normal` vector and store the result in `dest`.

  `Vector3f`

  `rotate(org.joml.Quaternionfc quat)`

  Rotate this vector by the given quaternion `quat` and store the result in `this`.

  `Vector3f`

  `rotate(org.joml.Quaternionfc quat,
  Vector3f dest)`

  Rotate this vector by the given quaternion `quat` and store the result in `dest`.

  `Vector3f`

  `rotateAxis(float angle,
  float x,
  float y,
  float z)`

  Rotate this vector the specified radians around the given rotation axis.

  `Vector3f`

  `rotateAxis(float angle,
  float aX,
  float aY,
  float aZ,
  Vector3f dest)`

  Rotate this vector the specified radians around the given rotation axis and store the result
  into `dest`.

  `private Vector3f`

  `rotateAxisInternal(float angle,
  float aX,
  float aY,
  float aZ,
  Vector3f dest)`

  `Vector3f`

  `rotateX(float angle)`

  Rotate this vector the specified radians around the X axis.

  `Vector3f`

  `rotateX(float angle,
  Vector3f dest)`

  Rotate this vector the specified radians around the X axis and store the result
  into `dest`.

  `Vector3f`

  `rotateY(float angle)`

  Rotate this vector the specified radians around the Y axis.

  `Vector3f`

  `rotateY(float angle,
  Vector3f dest)`

  Rotate this vector the specified radians around the Y axis and store the result
  into `dest`.

  `Vector3f`

  `rotateZ(float angle)`

  Rotate this vector the specified radians around the Z axis.

  `Vector3f`

  `rotateZ(float angle,
  Vector3f dest)`

  Rotate this vector the specified radians around the Z axis and store the result
  into `dest`.

  `org.joml.Quaternionf`

  `rotationTo(float toDirX,
  float toDirY,
  float toDirZ,
  org.joml.Quaternionf dest)`

  Compute the quaternion representing a rotation of `this` vector to point along `(toDirX, toDirY, toDirZ)`
  and store the result in `dest`.

  `org.joml.Quaternionf`

  `rotationTo(org.joml.Vector3fc toDir,
  org.joml.Quaternionf dest)`

  Compute the quaternion representing a rotation of `this` vector to point along `toDir`
  and store the result in `dest`.

  `Vector3f`

  `round()`

  Set each component of this vector to the closest float that is equal to
  a mathematical integer, with ties rounding to positive infinity.

  `Vector3f`

  `round(Vector3f dest)`

  Compute for each component of this vector the closest float that is equal to
  a mathematical integer, with ties rounding to positive infinity and store
  the result in `dest`.

  `Vector3f`

  `set(double d)`

  Set the x, y, and z components to the supplied value.

  `Vector3f`

  `set(double x,
  double y,
  double z)`

  Set the x, y and z components to the supplied values.

  `Vector3f`

  `set(float d)`

  Set the x, y, and z components to the supplied value.

  `Vector3f`

  `set(float[] xyz)`

  Set the three components of this vector to the first three elements of the given array.

  `Vector3f`

  `set(float x,
  float y,
  float z)`

  Set the x, y and z components to the supplied values.

  `Vector3f`

  `set(int index,
  ByteBuffer buffer)`

  Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `Vector3f`

  `set(int index,
  FloatBuffer buffer)`

  Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
  absolute buffer position/index.

  `Vector3f`

  `set(ByteBuffer buffer)`

  Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector3f`

  `set(FloatBuffer buffer)`

  Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
  buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

  `Vector3f`

  `set(org.joml.Vector2dc v,
  float z)`

  Set the first two components from the given `v`
  and the z component from the given `z`

  `Vector3f`

  `set(org.joml.Vector2fc v,
  float z)`

  Set the first two components from the given `v`
  and the z component from the given `z`

  `Vector3f`

  `set(org.joml.Vector2ic v,
  float z)`

  Set the first two components from the given `v`
  and the z component from the given `z`

  `Vector3f`

  `set(org.joml.Vector3dc v)`

  Set the x, y and z components to match the supplied vector.

  `Vector3f`

  `set(org.joml.Vector3fc v)`

  Set the x, y and z components to match the supplied vector.

  `Vector3f`

  `set(org.joml.Vector3ic v)`

  Set the x, y and z components to match the supplied vector.

  `Vector3f`

  `setComponent(int component,
  float value)`

  Set the value of the specified component of this vector.

  `Vector3f`

  `setFromAddress(long address)`

  Set the values of this vector by reading 3 float values from off-heap memory,
  starting at the given address.

  `Vector3f`

  `smoothStep(org.joml.Vector3fc v,
  float t,
  Vector3f dest)`

  Compute a smooth-step (i.e.

  `Vector3f`

  `sub(float x,
  float y,
  float z)`

  Decrement the components of this vector by the given values.

  `Vector3f`

  `sub(float x,
  float y,
  float z,
  Vector3f dest)`

  Decrement the components of this vector by the given values and store the result in `dest`.

  `Vector3f`

  `sub(org.joml.Vector3fc v)`

  Subtract the supplied vector from this one and store the result in `this`.

  `Vector3f`

  `sub(org.joml.Vector3fc v,
  Vector3f dest)`

  Subtract the supplied vector from this one and store the result in `dest`.

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

  `float`

  `z()`

  `Vector3f`

  `zero()`

  Set all components to zero.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### serialVersionUID

    private static final long serialVersionUID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Vector3f.serialVersionUID)
  + ### x

    public float x

    The x component of the vector.
  + ### y

    public float y

    The y component of the vector.
  + ### z

    public float z

    The z component of the vector.
* Constructor Details
  -------------------

  + ### Vector3f

    public Vector3f()

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") of `(0, 0, 0)`.
  + ### Vector3f

    public Vector3f(float d)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and initialize all three components with the given value.

    Parameters:
    :   `d` - the value of all three components
  + ### Vector3f

    public Vector3f(float x,
    float y,
    float z)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the given component values.

    Parameters:
    :   `x` - the value of x
    :   `y` - the value of y
    :   `z` - the value of z
  + ### Vector3f

    public Vector3f(org.joml.Vector3fc v)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the same values as `v`.

    Parameters:
    :   `v` - the `Vector3fc` to copy the values from
  + ### Vector3f

    public Vector3f(org.joml.Vector3ic v)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the same values as `v`.

    Parameters:
    :   `v` - the `Vector3ic` to copy the values from
  + ### Vector3f

    public Vector3f(org.joml.Vector2fc v,
    float z)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the first two components from the
    given `v` and the given `z`

    Parameters:
    :   `v` - the `Vector2fc` to copy the values from
    :   `z` - the z component
  + ### Vector3f

    public Vector3f(org.joml.Vector2ic v,
    float z)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") with the first two components from the
    given `v` and the given `z`

    Parameters:
    :   `v` - the `Vector2ic` to copy the values from
    :   `z` - the z component
  + ### Vector3f

    public Vector3f(float[] xyz)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and initialize its three components from the first
    three elements of the given array.

    Parameters:
    :   `xyz` - the array containing at least three elements
  + ### Vector3f

    public Vector3f([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
    at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is read, use [`Vector3f(int, ByteBuffer)`](#%3Cinit%3E(int,java.nio.ByteBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y, z` order

    See Also:
    :   - [`Vector3f(int, ByteBuffer)`](#%3Cinit%3E(int,java.nio.ByteBuffer))
  + ### Vector3f

    public Vector3f(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")
    starting at the specified absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - values will be read in `x, y, z` order
  + ### Vector3f

    public Vector3f([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
    at the current buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is read, use [`Vector3f(int, FloatBuffer)`](#%3Cinit%3E(int,java.nio.FloatBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y, z` order

    See Also:
    :   - [`Vector3f(int, FloatBuffer)`](#%3Cinit%3E(int,java.nio.FloatBuffer))
  + ### Vector3f

    public Vector3f(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Create a new [`Vector3f`](Vector3f.html "class in org.joml") and read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")
    starting at the specified absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - values will be read in `x, y, z` order
* Method Details
  --------------

  + ### x

    public float x()

    Specified by:
    :   `x` in interface `org.joml.Vector3fc`

    Returns:
    :   the value of the x component
  + ### y

    public float y()

    Specified by:
    :   `y` in interface `org.joml.Vector3fc`

    Returns:
    :   the value of the y component
  + ### z

    public float z()

    Specified by:
    :   `z` in interface `org.joml.Vector3fc`

    Returns:
    :   the value of the z component
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector3fc v)

    Set the x, y and z components to match the supplied vector.

    Parameters:
    :   `v` - contains the values of x, y and z to set

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector3dc v)

    Set the x, y and z components to match the supplied vector.

    Note that due to the given vector `v` storing the components in double-precision,
    there is the possibility to lose precision.

    Parameters:
    :   `v` - contains the values of x, y and z to set

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector3ic v)

    Set the x, y and z components to match the supplied vector.

    Parameters:
    :   `v` - contains the values of x, y and z to set

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector2fc v,
    float z)

    Set the first two components from the given `v`
    and the z component from the given `z`

    Parameters:
    :   `v` - the `Vector2fc` to copy the values from
    :   `z` - the z component

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector2dc v,
    float z)

    Set the first two components from the given `v`
    and the z component from the given `z`

    Parameters:
    :   `v` - the `Vector2dc` to copy the values from
    :   `z` - the z component

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(org.joml.Vector2ic v,
    float z)

    Set the first two components from the given `v`
    and the z component from the given `z`

    Parameters:
    :   `v` - the `Vector2ic` to copy the values from
    :   `z` - the z component

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(float d)

    Set the x, y, and z components to the supplied value.

    Parameters:
    :   `d` - the value of all three components

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(float x,
    float y,
    float z)

    Set the x, y and z components to the supplied values.

    Parameters:
    :   `x` - the x component
    :   `y` - the y component
    :   `z` - the z component

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(double d)

    Set the x, y, and z components to the supplied value.

    Parameters:
    :   `d` - the value of all three components

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(double x,
    double y,
    double z)

    Set the x, y and z components to the supplied values.

    Parameters:
    :   `x` - the x component
    :   `y` - the y component
    :   `z` - the z component

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(float[] xyz)

    Set the three components of this vector to the first three elements of the given array.

    Parameters:
    :   `xyz` - the array containing at least three elements

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is read, use [`set(int, ByteBuffer)`](#set(int,java.nio.ByteBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y, z` order

    Returns:
    :   this

    See Also:
    :   - [`set(int, ByteBuffer)`](#set(int,java.nio.ByteBuffer))
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - values will be read in `x, y, z` order

    Returns:
    :   this
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is read, use [`set(int, FloatBuffer)`](#set(int,java.nio.FloatBuffer)), taking
    the absolute position as parameter.

    Parameters:
    :   `buffer` - values will be read in `x, y, z` order

    Returns:
    :   this

    See Also:
    :   - [`set(int, FloatBuffer)`](#set(int,java.nio.FloatBuffer))
  + ### set

    public [Vector3f](Vector3f.html "class in org.joml") set(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Read this vector from the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - values will be read in `x, y, z` order

    Returns:
    :   this
  + ### setFromAddress

    public [Vector3f](Vector3f.html "class in org.joml") setFromAddress(long address)

    Set the values of this vector by reading 3 float values from off-heap memory,
    starting at the given address.

    This method will throw an [`UnsupportedOperationException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/UnsupportedOperationException.html "class or interface in java.lang") when JOML is used with `-Djoml.nounsafe`.

    *This method is unsafe as it can result in a crash of the JVM process when the specified address range does not belong to this process.*

    Parameters:
    :   `address` - the off-heap memory address to read the vector values from

    Returns:
    :   this
  + ### setComponent

    public [Vector3f](Vector3f.html "class in org.joml") setComponent(int component,
    float value)
    throws [IllegalArgumentException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html "class or interface in java.lang")

    Set the value of the specified component of this vector.

    Parameters:
    :   `component` - the component whose value to set, within `[0..2]`
    :   `value` - the value to set

    Returns:
    :   this

    Throws:
    :   `IllegalArgumentException` - if `component` is not within `[0..2]`
  + ### get

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") get([FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector3fc`

    Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given FloatBuffer.

    In order to specify the offset into the FloatBuffer at which
    the vector is stored, use `Vector3fc.get(int, FloatBuffer)`, taking
    the absolute position as parameter.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `buffer` - will receive the values of this vector in `x, y, z` order

    Returns:
    :   the passed in buffer

    See Also:
    :   - `Vector3fc.get(int, FloatBuffer)`
        - `Vector3fc.get(int, FloatBuffer)`
  + ### get

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") get(int index,
    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector3fc`

    Store this vector into the supplied [`FloatBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given FloatBuffer.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `index` - the absolute position into the FloatBuffer
    :   `buffer` - will receive the values of this vector in `x, y, z` order

    Returns:
    :   the passed in buffer
  + ### get

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") get([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector3fc`

    Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") at the current
    buffer [`position`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/Buffer.html#position() "class or interface in java.nio").

    This method will not increment the position of the given ByteBuffer.

    In order to specify the offset into the ByteBuffer at which
    the vector is stored, use `Vector3fc.get(int, ByteBuffer)`, taking
    the absolute position as parameter.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `buffer` - will receive the values of this vector in `x, y, z` order

    Returns:
    :   the passed in buffer

    See Also:
    :   - `Vector3fc.get(int, ByteBuffer)`
        - `Vector3fc.get(int, ByteBuffer)`
  + ### get

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") get(int index,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") buffer)

    Description copied from interface: `org.joml.Vector3fc`

    Store this vector into the supplied [`ByteBuffer`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") starting at the specified
    absolute buffer position/index.

    This method will not increment the position of the given ByteBuffer.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `index` - the absolute position into the ByteBuffer
    :   `buffer` - will receive the values of this vector in `x, y, z` order

    Returns:
    :   the passed in buffer
  + ### getToAddress

    public org.joml.Vector3fc getToAddress(long address)

    Description copied from interface: `org.joml.Vector3fc`

    Store this vector at the given off-heap memory address.

    This method will throw an [`UnsupportedOperationException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/UnsupportedOperationException.html "class or interface in java.lang") when JOML is used with `-Djoml.nounsafe`.

    *This method is unsafe as it can result in a crash of the JVM process when the specified address range does not belong to this process.*

    Specified by:
    :   `getToAddress` in interface `org.joml.Vector3fc`

    Parameters:
    :   `address` - the off-heap address where to store this vector

    Returns:
    :   this
  + ### sub

    public [Vector3f](Vector3f.html "class in org.joml") sub(org.joml.Vector3fc v)

    Subtract the supplied vector from this one and store the result in `this`.

    Parameters:
    :   `v` - the vector to subtract

    Returns:
    :   this
  + ### sub

    public [Vector3f](Vector3f.html "class in org.joml") sub(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Subtract the supplied vector from this one and store the result in `dest`.

    Specified by:
    :   `sub` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the vector to subtract
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### sub

    public [Vector3f](Vector3f.html "class in org.joml") sub(float x,
    float y,
    float z)

    Decrement the components of this vector by the given values.

    Parameters:
    :   `x` - the x component to subtract
    :   `y` - the y component to subtract
    :   `z` - the z component to subtract

    Returns:
    :   this
  + ### sub

    public [Vector3f](Vector3f.html "class in org.joml") sub(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Decrement the components of this vector by the given values and store the result in `dest`.

    Specified by:
    :   `sub` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component to subtract
    :   `y` - the y component to subtract
    :   `z` - the z component to subtract
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### add

    public [Vector3f](Vector3f.html "class in org.joml") add(org.joml.Vector3fc v)

    Add the supplied vector to this one.

    Parameters:
    :   `v` - the vector to add

    Returns:
    :   this
  + ### add

    public [Vector3f](Vector3f.html "class in org.joml") add(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Add the supplied vector to this one and store the result in `dest`.

    Specified by:
    :   `add` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the vector to add
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### add

    public [Vector3f](Vector3f.html "class in org.joml") add(float x,
    float y,
    float z)

    Increment the components of this vector by the given values.

    Parameters:
    :   `x` - the x component to add
    :   `y` - the y component to add
    :   `z` - the z component to add

    Returns:
    :   this
  + ### add

    public [Vector3f](Vector3f.html "class in org.joml") add(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Increment the components of this vector by the given values and store the result in `dest`.

    Specified by:
    :   `add` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component to add
    :   `y` - the y component to add
    :   `z` - the z component to add
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### fma

    public [Vector3f](Vector3f.html "class in org.joml") fma(org.joml.Vector3fc a,
    org.joml.Vector3fc b)

    Add the component-wise multiplication of `a * b` to this vector.

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand

    Returns:
    :   this
  + ### fma

    public [Vector3f](Vector3f.html "class in org.joml") fma(float a,
    org.joml.Vector3fc b)

    Add the component-wise multiplication of `a * b` to this vector.

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand

    Returns:
    :   this
  + ### fma

    public [Vector3f](Vector3f.html "class in org.joml") fma(org.joml.Vector3fc a,
    org.joml.Vector3fc b,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Add the component-wise multiplication of `a * b` to this vector
    and store the result in `dest`.

    Specified by:
    :   `fma` in interface `org.joml.Vector3fc`

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### fma

    public [Vector3f](Vector3f.html "class in org.joml") fma(float a,
    org.joml.Vector3fc b,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Add the component-wise multiplication of `a * b` to this vector
    and store the result in `dest`.

    Specified by:
    :   `fma` in interface `org.joml.Vector3fc`

    Parameters:
    :   `a` - the first multiplicand
    :   `b` - the second multiplicand
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulAdd

    public [Vector3f](Vector3f.html "class in org.joml") mulAdd(org.joml.Vector3fc a,
    org.joml.Vector3fc b)

    Add the component-wise multiplication of `this * a` to `b`
    and store the result in `this`.

    Parameters:
    :   `a` - the multiplicand
    :   `b` - the addend

    Returns:
    :   this
  + ### mulAdd

    public [Vector3f](Vector3f.html "class in org.joml") mulAdd(float a,
    org.joml.Vector3fc b)

    Add the component-wise multiplication of `this * a` to `b`
    and store the result in `this`.

    Parameters:
    :   `a` - the multiplicand
    :   `b` - the addend

    Returns:
    :   this
  + ### mulAdd

    public [Vector3f](Vector3f.html "class in org.joml") mulAdd(org.joml.Vector3fc a,
    org.joml.Vector3fc b,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Add the component-wise multiplication of `this * a` to `b`
    and store the result in `dest`.

    Specified by:
    :   `mulAdd` in interface `org.joml.Vector3fc`

    Parameters:
    :   `a` - the multiplicand
    :   `b` - the addend
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulAdd

    public [Vector3f](Vector3f.html "class in org.joml") mulAdd(float a,
    org.joml.Vector3fc b,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Add the component-wise multiplication of `this * a` to `b`
    and store the result in `dest`.

    Specified by:
    :   `mulAdd` in interface `org.joml.Vector3fc`

    Parameters:
    :   `a` - the multiplicand
    :   `b` - the addend
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Vector3fc v)

    Multiply this Vector3f component-wise by another Vector3fc.

    Parameters:
    :   `v` - the vector to multiply by

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply this Vector3f component-wise by another Vector3f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the vector to multiply by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(org.joml.Vector3fc v)

    Divide this Vector3f component-wise by another Vector3fc.

    Parameters:
    :   `v` - the vector to divide by

    Returns:
    :   this
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Divide this Vector3f component-wise by another Vector3f and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the vector to divide by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulProject

    public [Vector3f](Vector3f.html "class in org.joml") mulProject(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given matrix `mat` with this Vector3f, perform perspective division
    and store the result in `dest`.

    This method uses `w=1.0` as the fourth vector component.

    Specified by:
    :   `mulProject` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulProject

    public [Vector3f](Vector3f.html "class in org.joml") mulProject(org.joml.Matrix4fc mat,
    float w,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given matrix `mat` with this Vector3f, perform perspective division
    and store the result in `dest`.

    This method uses the given `w` as the fourth vector component.

    Specified by:
    :   `mulProject` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `w` - the w component to use
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulProject

    public [Vector3f](Vector3f.html "class in org.joml") mulProject(org.joml.Matrix4fc mat)

    Multiply the given matrix `mat` with this Vector3f, perform perspective division.

    This method uses `w=1.0` as the fourth vector component.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3fc mat)

    Multiply the given matrix with this Vector3f and store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given matrix with this Vector3f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3dc mat)

    Multiply the given matrix with this Vector3f and store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3dc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given matrix with this Vector3f and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3x2fc mat)

    Multiply the given matrix with this Vector3f and store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(org.joml.Matrix3x2fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given matrix `mat` with `this` by assuming a
    third row in the matrix of `(0, 0, 1)` and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulTranspose

    public [Vector3f](Vector3f.html "class in org.joml") mulTranspose(org.joml.Matrix3fc mat)

    Multiply the transpose of the given matrix with this Vector3f store the result in `this`.

    Parameters:
    :   `mat` - the matrix

    Returns:
    :   this
  + ### mulTranspose

    public [Vector3f](Vector3f.html "class in org.joml") mulTranspose(org.joml.Matrix3fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the transpose of the given matrix with this Vector3f and store the result in `dest`.

    Specified by:
    :   `mulTranspose` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulPosition

    public [Vector3f](Vector3f.html "class in org.joml") mulPosition(org.joml.Matrix4fc mat)

    Multiply the given 4x4 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `1.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulPosition

    public [Vector3f](Vector3f.html "class in org.joml") mulPosition(org.joml.Matrix4x3fc mat)

    Multiply the given 4x3 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `1.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulPosition

    public [Vector3f](Vector3f.html "class in org.joml") mulPosition(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x4 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `1.0`.

    Specified by:
    :   `mulPosition` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulPosition

    public [Vector3f](Vector3f.html "class in org.joml") mulPosition(org.joml.Matrix4x3fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x3 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `1.0`.

    Specified by:
    :   `mulPosition` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulTransposePosition

    public [Vector3f](Vector3f.html "class in org.joml") mulTransposePosition(org.joml.Matrix4fc mat)

    Multiply the transpose of the given 4x4 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `1.0`.

    Parameters:
    :   `mat` - the matrix whose transpose to multiply this vector by

    Returns:
    :   this
  + ### mulTransposePosition

    public [Vector3f](Vector3f.html "class in org.joml") mulTransposePosition(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the transpose of the given 4x4 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `1.0`.

    Specified by:
    :   `mulTransposePosition` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix whose transpose to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulPositionW

    public float mulPositionW(org.joml.Matrix4fc mat)

    Multiply the given 4x4 matrix `mat` with `this` and return the *w* component
    of the resulting 4D vector.

    This method assumes the `w` component of `this` to be `1.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   the *w* component of the resulting 4D vector after multiplication
  + ### mulPositionW

    public float mulPositionW(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x4 matrix `mat` with `this`, store the
    result in `dest` and return the *w* component of the resulting 4D vector.

    This method assumes the `w` component of `this` to be `1.0`.

    Specified by:
    :   `mulPositionW` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the `(x, y, z)` components of the resulting vector

    Returns:
    :   the *w* component of the resulting 4D vector after multiplication
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4dc mat)

    Multiply the given 4x4 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `0.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4fc mat)

    Multiply the given 4x4 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `0.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4x3fc mat)

    Multiply the given 4x3 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `0.0`.

    Parameters:
    :   `mat` - the matrix to multiply this vector by

    Returns:
    :   this
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4dc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x4 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `0.0`.

    Specified by:
    :   `mulDirection` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x4 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `0.0`.

    Specified by:
    :   `mulDirection` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulDirection(org.joml.Matrix4x3fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the given 4x3 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `0.0`.

    Specified by:
    :   `mulDirection` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mulTransposeDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulTransposeDirection(org.joml.Matrix4fc mat)

    Multiply the transpose of the given 4x4 matrix `mat` with `this`.

    This method assumes the `w` component of `this` to be `0.0`.

    Parameters:
    :   `mat` - the matrix whose transpose to multiply this vector by

    Returns:
    :   this
  + ### mulTransposeDirection

    public [Vector3f](Vector3f.html "class in org.joml") mulTransposeDirection(org.joml.Matrix4fc mat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the transpose of the given 4x4 matrix `mat` with `this` and store the
    result in `dest`.

    This method assumes the `w` component of `this` to be `0.0`.

    Specified by:
    :   `mulTransposeDirection` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mat` - the matrix whose transpose to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(float scalar)

    Multiply all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
    value.

    Parameters:
    :   `scalar` - the scalar to multiply this vector by

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(float scalar,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
    value and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `scalar` - the scalar to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(float x,
    float y,
    float z)

    Multiply the components of this Vector3f by the given scalar values and store the result in `this`.

    Parameters:
    :   `x` - the x component to multiply this vector by
    :   `y` - the y component to multiply this vector by
    :   `z` - the z component to multiply this vector by

    Returns:
    :   this
  + ### mul

    public [Vector3f](Vector3f.html "class in org.joml") mul(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Multiply the components of this Vector3f by the given scalar values and store the result in `dest`.

    Specified by:
    :   `mul` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component to multiply this vector by
    :   `y` - the y component to multiply this vector by
    :   `z` - the z component to multiply this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(float scalar)

    Divide all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
    value.

    Parameters:
    :   `scalar` - the scalar to divide by

    Returns:
    :   this
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(float scalar,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Divide all components of this [`Vector3f`](Vector3f.html "class in org.joml") by the given scalar
    value and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector3fc`

    Parameters:
    :   `scalar` - the scalar to divide by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(float x,
    float y,
    float z)

    Divide the components of this Vector3f by the given scalar values and store the result in `this`.

    Parameters:
    :   `x` - the x component to divide this vector by
    :   `y` - the y component to divide this vector by
    :   `z` - the z component to divide this vector by

    Returns:
    :   this
  + ### div

    public [Vector3f](Vector3f.html "class in org.joml") div(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Divide the components of this Vector3f by the given scalar values and store the result in `dest`.

    Specified by:
    :   `div` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component to divide this vector by
    :   `y` - the y component to divide this vector by
    :   `z` - the z component to divide this vector by
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### rotate

    public [Vector3f](Vector3f.html "class in org.joml") rotate(org.joml.Quaternionfc quat)

    Rotate this vector by the given quaternion `quat` and store the result in `this`.

    Parameters:
    :   `quat` - the quaternion to rotate this vector

    Returns:
    :   this

    See Also:
    :   - `Quaternionfc.transform(Vector3f)`
  + ### rotate

    public [Vector3f](Vector3f.html "class in org.joml") rotate(org.joml.Quaternionfc quat,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Rotate this vector by the given quaternion `quat` and store the result in `dest`.

    Specified by:
    :   `rotate` in interface `org.joml.Vector3fc`

    Parameters:
    :   `quat` - the quaternion to rotate this vector
    :   `dest` - will hold the result

    Returns:
    :   dest

    See Also:
    :   - `Quaternionfc.transform(Vector3f)`
  + ### rotationTo

    public org.joml.Quaternionf rotationTo(org.joml.Vector3fc toDir,
    org.joml.Quaternionf dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the quaternion representing a rotation of `this` vector to point along `toDir`
    and store the result in `dest`.

    Because there can be multiple possible rotations, this method chooses the one with the shortest arc.

    Specified by:
    :   `rotationTo` in interface `org.joml.Vector3fc`

    Parameters:
    :   `toDir` - the destination direction
    :   `dest` - will hold the result

    Returns:
    :   dest

    See Also:
    :   - `Quaternionf.rotationTo(Vector3fc, Vector3fc)`
  + ### rotationTo

    public org.joml.Quaternionf rotationTo(float toDirX,
    float toDirY,
    float toDirZ,
    org.joml.Quaternionf dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the quaternion representing a rotation of `this` vector to point along `(toDirX, toDirY, toDirZ)`
    and store the result in `dest`.

    Because there can be multiple possible rotations, this method chooses the one with the shortest arc.

    Specified by:
    :   `rotationTo` in interface `org.joml.Vector3fc`

    Parameters:
    :   `toDirX` - the x coordinate of the destination direction
    :   `toDirY` - the y coordinate of the destination direction
    :   `toDirZ` - the z coordinate of the destination direction
    :   `dest` - will hold the result

    Returns:
    :   dest

    See Also:
    :   - `Quaternionf.rotationTo(float, float, float, float, float, float)`
  + ### rotateAxis

    public [Vector3f](Vector3f.html "class in org.joml") rotateAxis(float angle,
    float x,
    float y,
    float z)

    Rotate this vector the specified radians around the given rotation axis.

    Parameters:
    :   `angle` - the angle in radians
    :   `x` - the x component of the rotation axis
    :   `y` - the y component of the rotation axis
    :   `z` - the z component of the rotation axis

    Returns:
    :   this
  + ### rotateAxis

    public [Vector3f](Vector3f.html "class in org.joml") rotateAxis(float angle,
    float aX,
    float aY,
    float aZ,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Rotate this vector the specified radians around the given rotation axis and store the result
    into `dest`.

    Specified by:
    :   `rotateAxis` in interface `org.joml.Vector3fc`

    Parameters:
    :   `angle` - the angle in radians
    :   `aX` - the x component of the rotation axis
    :   `aY` - the y component of the rotation axis
    :   `aZ` - the z component of the rotation axis
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### rotateAxisInternal

    private [Vector3f](Vector3f.html "class in org.joml") rotateAxisInternal(float angle,
    float aX,
    float aY,
    float aZ,
    [Vector3f](Vector3f.html "class in org.joml") dest)
  + ### rotateX

    public [Vector3f](Vector3f.html "class in org.joml") rotateX(float angle)

    Rotate this vector the specified radians around the X axis.

    Parameters:
    :   `angle` - the angle in radians

    Returns:
    :   this
  + ### rotateX

    public [Vector3f](Vector3f.html "class in org.joml") rotateX(float angle,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Rotate this vector the specified radians around the X axis and store the result
    into `dest`.

    Specified by:
    :   `rotateX` in interface `org.joml.Vector3fc`

    Parameters:
    :   `angle` - the angle in radians
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### rotateY

    public [Vector3f](Vector3f.html "class in org.joml") rotateY(float angle)

    Rotate this vector the specified radians around the Y axis.

    Parameters:
    :   `angle` - the angle in radians

    Returns:
    :   this
  + ### rotateY

    public [Vector3f](Vector3f.html "class in org.joml") rotateY(float angle,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Rotate this vector the specified radians around the Y axis and store the result
    into `dest`.

    Specified by:
    :   `rotateY` in interface `org.joml.Vector3fc`

    Parameters:
    :   `angle` - the angle in radians
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### rotateZ

    public [Vector3f](Vector3f.html "class in org.joml") rotateZ(float angle)

    Rotate this vector the specified radians around the Z axis.

    Parameters:
    :   `angle` - the angle in radians

    Returns:
    :   this
  + ### rotateZ

    public [Vector3f](Vector3f.html "class in org.joml") rotateZ(float angle,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Rotate this vector the specified radians around the Z axis and store the result
    into `dest`.

    Specified by:
    :   `rotateZ` in interface `org.joml.Vector3fc`

    Parameters:
    :   `angle` - the angle in radians
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### lengthSquared

    public float lengthSquared()

    Description copied from interface: `org.joml.Vector3fc`

    Return the length squared of this vector.

    Specified by:
    :   `lengthSquared` in interface `org.joml.Vector3fc`

    Returns:
    :   the length squared
  + ### lengthSquared

    public static float lengthSquared(float x,
    float y,
    float z)

    Get the length squared of a 3-dimensional single-precision vector.

    Parameters:
    :   `x` - The vector's x component
    :   `y` - The vector's y component
    :   `z` - The vector's z component

    Returns:
    :   the length squared of the given vector
  + ### length

    public float length()

    Description copied from interface: `org.joml.Vector3fc`

    Return the length of this vector.

    Specified by:
    :   `length` in interface `org.joml.Vector3fc`

    Returns:
    :   the length
  + ### length

    public static float length(float x,
    float y,
    float z)

    Get the length of a 3-dimensional single-precision vector.

    Parameters:
    :   `x` - The vector's x component
    :   `y` - The vector's y component
    :   `z` - The vector's z component

    Returns:
    :   the length of the given vector
  + ### normalize

    public [Vector3f](Vector3f.html "class in org.joml") normalize()

    Normalize this vector.

    Returns:
    :   this
  + ### normalize

    public [Vector3f](Vector3f.html "class in org.joml") normalize([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Normalize this vector and store the result in `dest`.

    Specified by:
    :   `normalize` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### normalize

    public [Vector3f](Vector3f.html "class in org.joml") normalize(float length)

    Scale this vector to have the given length.

    Parameters:
    :   `length` - the desired length

    Returns:
    :   this
  + ### normalize

    public [Vector3f](Vector3f.html "class in org.joml") normalize(float length,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Scale this vector to have the given length and store the result in `dest`.

    Specified by:
    :   `normalize` in interface `org.joml.Vector3fc`

    Parameters:
    :   `length` - the desired length
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### cross

    public [Vector3f](Vector3f.html "class in org.joml") cross(org.joml.Vector3fc v)

    Set this vector to be the cross product of itself and `v`.

    Parameters:
    :   `v` - the other vector

    Returns:
    :   this
  + ### cross

    public [Vector3f](Vector3f.html "class in org.joml") cross(float x,
    float y,
    float z)

    Set this vector to be the cross product of itself and `(x, y, z)`.

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector

    Returns:
    :   this
  + ### cross

    public [Vector3f](Vector3f.html "class in org.joml") cross(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the cross product of this vector and `v` and store the result in `dest`.

    Specified by:
    :   `cross` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### cross

    public [Vector3f](Vector3f.html "class in org.joml") cross(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the cross product of this vector and `(x, y, z)` and store the result in `dest`.

    Specified by:
    :   `cross` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### distance

    public float distance(org.joml.Vector3fc v)

    Description copied from interface: `org.joml.Vector3fc`

    Return the distance between this Vector and `v`.

    Specified by:
    :   `distance` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the distance
  + ### distance

    public float distance(float x,
    float y,
    float z)

    Description copied from interface: `org.joml.Vector3fc`

    Return the distance between `this` vector and `(x, y, z)`.

    Specified by:
    :   `distance` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector

    Returns:
    :   the euclidean distance
  + ### distanceSquared

    public float distanceSquared(org.joml.Vector3fc v)

    Description copied from interface: `org.joml.Vector3fc`

    Return the square of the distance between this vector and `v`.

    Specified by:
    :   `distanceSquared` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the squared of the distance
  + ### distanceSquared

    public float distanceSquared(float x,
    float y,
    float z)

    Description copied from interface: `org.joml.Vector3fc`

    Return the square of the distance between `this` vector and `(x, y, z)`.

    Specified by:
    :   `distanceSquared` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector

    Returns:
    :   the square of the distance
  + ### distance

    public static float distance(float x1,
    float y1,
    float z1,
    float x2,
    float y2,
    float z2)

    Return the distance between `(x1, y1, z1)` and `(x2, y2, z2)`.

    Parameters:
    :   `x1` - the x component of the first vector
    :   `y1` - the y component of the first vector
    :   `z1` - the z component of the first vector
    :   `x2` - the x component of the second vector
    :   `y2` - the y component of the second vector
    :   `z2` - the z component of the second vector

    Returns:
    :   the euclidean distance
  + ### distanceSquared

    public static float distanceSquared(float x1,
    float y1,
    float z1,
    float x2,
    float y2,
    float z2)

    Return the squared distance between `(x1, y1, z1)` and `(x2, y2, z2)`.

    Parameters:
    :   `x1` - the x component of the first vector
    :   `y1` - the y component of the first vector
    :   `z1` - the z component of the first vector
    :   `x2` - the x component of the second vector
    :   `y2` - the y component of the second vector
    :   `z2` - the z component of the second vector

    Returns:
    :   the euclidean distance squared
  + ### dot

    public float dot(org.joml.Vector3fc v)

    Description copied from interface: `org.joml.Vector3fc`

    Return the dot product of this vector and the supplied vector.

    Specified by:
    :   `dot` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the dot product
  + ### dot

    public float dot(float x,
    float y,
    float z)

    Description copied from interface: `org.joml.Vector3fc`

    Return the dot product of this vector and the vector `(x, y, z)`.

    Specified by:
    :   `dot` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector

    Returns:
    :   the dot product
  + ### angleCos

    public float angleCos(org.joml.Vector3fc v)

    Description copied from interface: `org.joml.Vector3fc`

    Return the cosine of the angle between this vector and the supplied vector. Use this instead of Math.cos(this.angle(v)).

    Specified by:
    :   `angleCos` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the cosine of the angle

    See Also:
    :   - `Vector3fc.angle(Vector3fc)`
  + ### angle

    public float angle(org.joml.Vector3fc v)

    Description copied from interface: `org.joml.Vector3fc`

    Return the angle between this vector and the supplied vector.

    Specified by:
    :   `angle` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector

    Returns:
    :   the angle, in radians

    See Also:
    :   - `Vector3fc.angleCos(Vector3fc)`
  + ### angleSigned

    public float angleSigned(org.joml.Vector3fc v,
    org.joml.Vector3fc n)

    Description copied from interface: `org.joml.Vector3fc`

    Return the signed angle between this vector and the supplied vector with
    respect to the plane with the given normal vector `n`.

    Specified by:
    :   `angleSigned` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `n` - the plane's normal vector

    Returns:
    :   the angle, in radians

    See Also:
    :   - `Vector3fc.angleCos(Vector3fc)`
  + ### angleSigned

    public float angleSigned(float x,
    float y,
    float z,
    float nx,
    float ny,
    float nz)

    Description copied from interface: `org.joml.Vector3fc`

    Return the signed angle between this vector and the supplied vector with
    respect to the plane with the given normal vector `(nx, ny, nz)`.

    Specified by:
    :   `angleSigned` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x coordinate of the other vector
    :   `y` - the y coordinate of the other vector
    :   `z` - the z coordinate of the other vector
    :   `nx` - the x coordinate of the plane's normal vector
    :   `ny` - the y coordinate of the plane's normal vector
    :   `nz` - the z coordinate of the plane's normal vector

    Returns:
    :   the angle, in radians
  + ### min

    public [Vector3f](Vector3f.html "class in org.joml") min(org.joml.Vector3fc v)

    Set the components of this vector to be the component-wise minimum of this and the other vector.

    Parameters:
    :   `v` - the other vector

    Returns:
    :   this
  + ### min

    public [Vector3f](Vector3f.html "class in org.joml") min(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Set the components of `dest` to be the component-wise minimum of this and the other vector.

    Specified by:
    :   `min` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### max

    public [Vector3f](Vector3f.html "class in org.joml") max(org.joml.Vector3fc v)

    Set the components of this vector to be the component-wise maximum of this and the other vector.

    Parameters:
    :   `v` - the other vector

    Returns:
    :   this
  + ### max

    public [Vector3f](Vector3f.html "class in org.joml") max(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Set the components of `dest` to be the component-wise maximum of this and the other vector.

    Specified by:
    :   `max` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### zero

    public [Vector3f](Vector3f.html "class in org.joml") zero()

    Set all components to zero.

    Returns:
    :   this
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

    public [Vector3f](Vector3f.html "class in org.joml") negate()

    Negate this vector.

    Returns:
    :   this
  + ### negate

    public [Vector3f](Vector3f.html "class in org.joml") negate([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Negate this vector and store the result in `dest`.

    Specified by:
    :   `negate` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### absolute

    public [Vector3f](Vector3f.html "class in org.joml") absolute()

    Set `this` vector's components to their respective absolute values.

    Returns:
    :   this
  + ### absolute

    public [Vector3f](Vector3f.html "class in org.joml") absolute([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the absolute values of the individual components of `this` and store the result in `dest`.

    Specified by:
    :   `absolute` in interface `org.joml.Vector3fc`

    Parameters:
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

    public boolean equals(org.joml.Vector3fc v,
    float delta)

    Description copied from interface: `org.joml.Vector3fc`

    Compare the vector components of `this` vector with the given vector using the given `delta`
    and return whether all of them are equal within a maximum difference of `delta`.

    Please note that this method is not used by any data structure such as [`ArrayList`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util") [`HashSet`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util") or [`HashMap`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")
    and their operations, such as [`ArrayList.contains(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html#contains(java.lang.Object) "class or interface in java.util") or [`HashSet.remove(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html#remove(java.lang.Object) "class or interface in java.util"), since those
    data structures only use the [`Object.equals(Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#equals(java.lang.Object) "class or interface in java.lang") and [`Object.hashCode()`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#hashCode() "class or interface in java.lang") methods.

    Specified by:
    :   `equals` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `delta` - the allowed maximum difference

    Returns:
    :   `true` whether all of the vector components are equal; `false` otherwise
  + ### equals

    public boolean equals(float x,
    float y,
    float z)

    Description copied from interface: `org.joml.Vector3fc`

    Compare the vector components of `this` vector with the given `(x, y, z)`
    and return whether all of them are equal.

    Specified by:
    :   `equals` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component to compare to
    :   `y` - the y component to compare to
    :   `z` - the z component to compare to

    Returns:
    :   `true` if all the vector components are equal
  + ### reflect

    public [Vector3f](Vector3f.html "class in org.joml") reflect(org.joml.Vector3fc normal)

    Reflect this vector about the given `normal` vector.

    Parameters:
    :   `normal` - the vector to reflect about

    Returns:
    :   this
  + ### reflect

    public [Vector3f](Vector3f.html "class in org.joml") reflect(float x,
    float y,
    float z)

    Reflect this vector about the given normal vector.

    Parameters:
    :   `x` - the x component of the normal
    :   `y` - the y component of the normal
    :   `z` - the z component of the normal

    Returns:
    :   this
  + ### reflect

    public [Vector3f](Vector3f.html "class in org.joml") reflect(org.joml.Vector3fc normal,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Reflect this vector about the given `normal` vector and store the result in `dest`.

    Specified by:
    :   `reflect` in interface `org.joml.Vector3fc`

    Parameters:
    :   `normal` - the vector to reflect about
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### reflect

    public [Vector3f](Vector3f.html "class in org.joml") reflect(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Reflect this vector about the given normal vector and store the result in `dest`.

    Specified by:
    :   `reflect` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the normal
    :   `y` - the y component of the normal
    :   `z` - the z component of the normal
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### half

    public [Vector3f](Vector3f.html "class in org.joml") half(org.joml.Vector3fc other)

    Compute the half vector between this and the other vector.

    Parameters:
    :   `other` - the other vector

    Returns:
    :   this
  + ### half

    public [Vector3f](Vector3f.html "class in org.joml") half(float x,
    float y,
    float z)

    Compute the half vector between this and the vector `(x, y, z)`.

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector

    Returns:
    :   this
  + ### half

    public [Vector3f](Vector3f.html "class in org.joml") half(org.joml.Vector3fc other,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the half vector between this and the other vector and store the result in `dest`.

    Specified by:
    :   `half` in interface `org.joml.Vector3fc`

    Parameters:
    :   `other` - the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### half

    public [Vector3f](Vector3f.html "class in org.joml") half(float x,
    float y,
    float z,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute the half vector between this and the vector `(x, y, z)`
    and store the result in `dest`.

    Specified by:
    :   `half` in interface `org.joml.Vector3fc`

    Parameters:
    :   `x` - the x component of the other vector
    :   `y` - the y component of the other vector
    :   `z` - the z component of the other vector
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### smoothStep

    public [Vector3f](Vector3f.html "class in org.joml") smoothStep(org.joml.Vector3fc v,
    float t,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute a smooth-step (i.e. hermite with zero tangents) interpolation
    between `this` vector and the given vector `v` and
    store the result in `dest`.

    Specified by:
    :   `smoothStep` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the other vector
    :   `t` - the interpolation factor, within `[0..1]`
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### hermite

    public [Vector3f](Vector3f.html "class in org.joml") hermite(org.joml.Vector3fc t0,
    org.joml.Vector3fc v1,
    org.joml.Vector3fc t1,
    float t,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute a hermite interpolation between `this` vector with its
    associated tangent `t0` and the given vector `v`
    with its tangent `t1` and store the result in
    `dest`.

    Specified by:
    :   `hermite` in interface `org.joml.Vector3fc`

    Parameters:
    :   `t0` - the tangent of `this` vector
    :   `v1` - the other vector
    :   `t1` - the tangent of the other vector
    :   `t` - the interpolation factor, within `[0..1]`
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### lerp

    public [Vector3f](Vector3f.html "class in org.joml") lerp(org.joml.Vector3fc other,
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

    public [Vector3f](Vector3f.html "class in org.joml") lerp(org.joml.Vector3fc other,
    float t,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Linearly interpolate `this` and `other` using the given interpolation factor `t`
    and store the result in `dest`.

    If `t` is `0.0` then the result is `this`. If the interpolation factor is `1.0`
    then the result is `other`.

    Specified by:
    :   `lerp` in interface `org.joml.Vector3fc`

    Parameters:
    :   `other` - the other vector
    :   `t` - the interpolation factor between 0.0 and 1.0
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### get

    public float get(int component)
    throws [IllegalArgumentException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html "class or interface in java.lang")

    Description copied from interface: `org.joml.Vector3fc`

    Get the value of the specified component of this vector.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `component` - the component, within `[0..2]`

    Returns:
    :   the value

    Throws:
    :   `IllegalArgumentException` - if `component` is not within `[0..2]`
  + ### get

    public org.joml.Vector3i get(int mode,
    org.joml.Vector3i dest)

    Description copied from interface: `org.joml.Vector3fc`

    Set the components of the given vector `dest` to those of `this` vector
    using the given `RoundingMode`.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `mode` - the `RoundingMode` to use
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### get

    public [Vector3f](Vector3f.html "class in org.joml") get([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Set the components of the given vector `dest` to those of `this` vector.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### get

    public org.joml.Vector3d get(org.joml.Vector3d dest)

    Description copied from interface: `org.joml.Vector3fc`

    Set the components of the given vector `dest` to those of `this` vector.

    Specified by:
    :   `get` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### maxComponent

    public int maxComponent()

    Description copied from interface: `org.joml.Vector3fc`

    Determine the component with the biggest absolute value.

    Specified by:
    :   `maxComponent` in interface `org.joml.Vector3fc`

    Returns:
    :   the component index, within `[0..2]`
  + ### minComponent

    public int minComponent()

    Description copied from interface: `org.joml.Vector3fc`

    Determine the component with the smallest (towards zero) absolute value.

    Specified by:
    :   `minComponent` in interface `org.joml.Vector3fc`

    Returns:
    :   the component index, within `[0..2]`
  + ### orthogonalize

    public [Vector3f](Vector3f.html "class in org.joml") orthogonalize(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Transform `this` vector so that it is orthogonal to the given vector `v`, normalize the result and store it into `dest`.

    Reference: [Gram-Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)

    Specified by:
    :   `orthogonalize` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the reference vector which the result should be orthogonal to
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### orthogonalize

    public [Vector3f](Vector3f.html "class in org.joml") orthogonalize(org.joml.Vector3fc v)

    Transform `this` vector so that it is orthogonal to the given vector `v` and normalize the result.

    Reference: [Gram-Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)

    Parameters:
    :   `v` - the reference vector which the result should be orthogonal to

    Returns:
    :   this
  + ### orthogonalizeUnit

    public [Vector3f](Vector3f.html "class in org.joml") orthogonalizeUnit(org.joml.Vector3fc v,
    [Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Transform `this` vector so that it is orthogonal to the given unit vector `v`, normalize the result and store it into `dest`.

    The vector `v` is assumed to be a `unit` vector.

    Reference: [Gram-Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)

    Specified by:
    :   `orthogonalizeUnit` in interface `org.joml.Vector3fc`

    Parameters:
    :   `v` - the reference unit vector which the result should be orthogonal to
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### orthogonalizeUnit

    public [Vector3f](Vector3f.html "class in org.joml") orthogonalizeUnit(org.joml.Vector3fc v)

    Transform `this` vector so that it is orthogonal to the given unit vector `v` and normalize the result.

    The vector `v` is assumed to be a [`unit`](#normalize()) vector.

    Reference: [Gram-Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)

    Parameters:
    :   `v` - the reference unit vector which the result should be orthogonal to

    Returns:
    :   this
  + ### floor

    public [Vector3f](Vector3f.html "class in org.joml") floor()

    Set each component of this vector to the largest (closest to positive
    infinity) `float` value that is less than or equal to that
    component and is equal to a mathematical integer.

    Returns:
    :   this
  + ### floor

    public [Vector3f](Vector3f.html "class in org.joml") floor([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute for each component of this vector the largest (closest to positive
    infinity) `float` value that is less than or equal to that
    component and is equal to a mathematical integer and store the result in
    `dest`.

    Specified by:
    :   `floor` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### ceil

    public [Vector3f](Vector3f.html "class in org.joml") ceil()

    Set each component of this vector to the smallest (closest to negative
    infinity) `float` value that is greater than or equal to that
    component and is equal to a mathematical integer.

    Returns:
    :   this
  + ### ceil

    public [Vector3f](Vector3f.html "class in org.joml") ceil([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute for each component of this vector the smallest (closest to negative
    infinity) `float` value that is greater than or equal to that
    component and is equal to a mathematical integer and store the result in
    `dest`.

    Specified by:
    :   `ceil` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### round

    public [Vector3f](Vector3f.html "class in org.joml") round()

    Set each component of this vector to the closest float that is equal to
    a mathematical integer, with ties rounding to positive infinity.

    Returns:
    :   this
  + ### round

    public [Vector3f](Vector3f.html "class in org.joml") round([Vector3f](Vector3f.html "class in org.joml") dest)

    Description copied from interface: `org.joml.Vector3fc`

    Compute for each component of this vector the closest float that is equal to
    a mathematical integer, with ties rounding to positive infinity and store
    the result in `dest`.

    Specified by:
    :   `round` in interface `org.joml.Vector3fc`

    Parameters:
    :   `dest` - will hold the result

    Returns:
    :   dest
  + ### isFinite

    public boolean isFinite()

    Description copied from interface: `org.joml.Vector3fc`

    Determine whether all components are finite floating-point values, that
    is, they are not [`NaN`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isNaN() "class or interface in java.lang") and not
    [`infinity`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html#isInfinite() "class or interface in java.lang").

    Specified by:
    :   `isFinite` in interface `org.joml.Vector3fc`

    Returns:
    :   `true` if all components are finite floating-point values;
        `false` otherwise