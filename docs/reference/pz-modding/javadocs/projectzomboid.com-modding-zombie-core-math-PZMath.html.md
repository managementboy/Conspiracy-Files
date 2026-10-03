[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.math](package-summary.html)
2. [PZMath](PZMath.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [PI](#PI)
   2. [PI2](#PI2)
   3. [halfPI](#halfPI)
   4. [degToRads](#degToRads)
   5. [radToDegs](#radToDegs)
   6. [microsToNanos](#microsToNanos)
   7. [millisToMicros](#millisToMicros)
   8. [secondsToMillis](#secondsToMillis)
   9. [secondsToNanos](#secondsToNanos)
   10. [SEGMENT\_LENGTH\_SQUARED\_EPSILON](#SEGMENT_LENGTH_SQUARED_EPSILON)
7. [Constructor Details](#constructor-detail)
   1. [PZMath()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [almostUnitIdentity(float)](#almostUnitIdentity(float))
   2. [almostIdentity(float, float, float)](#almostIdentity(float,float,float))
   3. [gain(float, float)](#gain(float,float))
   4. [clamp(float, float, float)](#clamp(float,float,float))
   5. [clamp(long, long, long)](#clamp(long,long,long))
   6. [clamp(int, int, int)](#clamp(int,int,int))
   7. [clamp(double, double, double)](#clamp(double,double,double))
   8. [clampFloat(float, float, float)](#clampFloat(float,float,float))
   9. [clamp\_01(float)](#clamp_01(float))
   10. [clampDouble\_01(double)](#clampDouble_01(double))
   11. [setFromAxisAngle(float, float, float, float, Quaternion)](#setFromAxisAngle(float,float,float,float,org.lwjgl.util.vector.Quaternion))
   12. [lerp(float, float, float)](#lerp(float,float,float))
   13. [lerp(float, float, float, LerpType)](#lerp(float,float,float,zombie.core.math.interpolators.LerpType))
   14. [lerpAngle(float, float, float)](#lerpAngle(float,float,float))
   15. [lerp(Vector3f, Vector3f, Vector3f, float)](#lerp(org.lwjgl.util.vector.Vector3f,org.lwjgl.util.vector.Vector3f,org.lwjgl.util.vector.Vector3f,float))
   16. [lerp(Vector3, Vector3, Vector3, float)](#lerp(zombie.iso.Vector3,zombie.iso.Vector3,zombie.iso.Vector3,float))
   17. [lerp(Vector2, Vector2, Vector2, float)](#lerp(zombie.iso.Vector2,zombie.iso.Vector2,zombie.iso.Vector2,float))
   18. [c\_lerp(float, float, float)](#c_lerp(float,float,float))
   19. [slerp(Quaternion, Quaternion, Quaternion, float)](#slerp(org.lwjgl.util.vector.Quaternion,org.lwjgl.util.vector.Quaternion,org.lwjgl.util.vector.Quaternion,float))
   20. [sqrt(float)](#sqrt(float))
   21. [lerpFunc\_EaseOutQuad(float)](#lerpFunc_EaseOutQuad(float))
   22. [lerpFunc\_EaseInQuad(float)](#lerpFunc_EaseInQuad(float))
   23. [lerpFunc\_EaseOutInQuad(float)](#lerpFunc_EaseOutInQuad(float))
   24. [tryParseDouble(String, double)](#tryParseDouble(java.lang.String,double))
   25. [tryParseFloat(String, float)](#tryParseFloat(java.lang.String,float))
   26. [canParseFloat(String)](#canParseFloat(java.lang.String))
   27. [tryParseInt(String, int)](#tryParseInt(java.lang.String,int))
   28. [pow(float, float)](#pow(float,float))
   29. [squared(float)](#squared(float))
   30. [degToRad(float)](#degToRad(float))
   31. [radToDeg(float)](#radToDeg(float))
   32. [getClosestAngle(float, float)](#getClosestAngle(float,float))
   33. [getClosestAngleDegrees(float, float)](#getClosestAngleDegrees(float,float))
   34. [sign(float)](#sign(float))
   35. [fastfloor(double)](#fastfloor(double))
   36. [fastfloor(float)](#fastfloor(float))
   37. [coorddivision(int, int)](#coorddivision(int,int))
   38. [coordmodulo(int, int)](#coordmodulo(int,int))
   39. [coordmodulof(float, int)](#coordmodulof(float,int))
   40. [floor(float)](#floor(float))
   41. [floor(double)](#floor(double))
   42. [ceil(float)](#ceil(float))
   43. [frac(float)](#frac(float))
   44. [wrap(float, float)](#wrap(float,float))
   45. [wrap(float, float, float)](#wrap(float,float,float))
   46. [max(float, float)](#max(float,float))
   47. [max(float, float, float)](#max(float,float,float))
   48. [max(float, float, float, float)](#max(float,float,float,float))
   49. [max(float, float, float, float, float)](#max(float,float,float,float,float))
   50. [max(int, int)](#max(int,int))
   51. [max(int, int, int)](#max(int,int,int))
   52. [max(int, int, int, int)](#max(int,int,int,int))
   53. [max(int, int, int, int, int)](#max(int,int,int,int,int))
   54. [min(float, float)](#min(float,float))
   55. [min(float, float, float)](#min(float,float,float))
   56. [min(float, float, float, float)](#min(float,float,float,float))
   57. [min(float, float, float, float, float)](#min(float,float,float,float,float))
   58. [min(int, int)](#min(int,int))
   59. [min(int, int, int)](#min(int,int,int))
   60. [min(int, int, int, int)](#min(int,int,int,int))
   61. [min(int, int, int, int, int)](#min(int,int,int,int,int))
   62. [abs(float)](#abs(float))
   63. [abs(int)](#abs(int))
   64. [equal(float, float)](#equal(float,float))
   65. [equal(float, float, float)](#equal(float,float,float))
   66. [convertMatrix(Matrix4f, Matrix4f)](#convertMatrix(org.joml.Matrix4f,org.lwjgl.util.vector.Matrix4f))
   67. [convertMatrix(Matrix4f, Matrix4f)](#convertMatrix(org.lwjgl.util.vector.Matrix4f,org.joml.Matrix4f))
   68. [step(float, float, float)](#step(float,float,float))
   69. [angleBetween(Vector2, Vector2)](#angleBetween(zombie.iso.Vector2,zombie.iso.Vector2))
   70. [angleBetween(float, float, float, float)](#angleBetween(float,float,float,float))
   71. [angleBetweenNormalized(float, float, float, float)](#angleBetweenNormalized(float,float,float,float))
   72. [acosf(float)](#acosf(float))
   73. [calculateBearing(Vector3, Vector2, Vector3)](#calculateBearing(zombie.iso.Vector3,zombie.iso.Vector2,zombie.iso.Vector3))
   74. [rotateVector(Vector3f, Quaternion, Vector3f)](#rotateVector(org.lwjgl.util.vector.Vector3f,org.lwjgl.util.vector.Quaternion,org.lwjgl.util.vector.Vector3f))
   75. [rotateVector(float, float, float, float, float, float, float, Vector3f)](#rotateVector(float,float,float,float,float,float,float,org.lwjgl.util.vector.Vector3f))
   76. [rotateVector(float, float, float, float, float, float, Vector2)](#rotateVector(float,float,float,float,float,float,zombie.iso.Vector2))
   77. [cross(Vector3, Vector3, Vector3)](#cross(zombie.iso.Vector3,zombie.iso.Vector3,zombie.iso.Vector3))
   78. [cross(float, float, float, float, float, float, Vector3)](#cross(float,float,float,float,float,float,zombie.iso.Vector3))
   79. [getLength(float, float)](#getLength(float,float))
   80. [getLengthSq(float, float)](#getLengthSq(float,float))
   81. [isBetween(float, float, float)](#isBetween(float,float,float))
   82. [isNullOrZero(Vector2)](#isNullOrZero(zombie.iso.Vector2))
   83. [isZero(Vector2)](#isZero(zombie.iso.Vector2))
   84. [testSideOfLine(float, float, float, float, float, float)](#testSideOfLine(float,float,float,float,float,float))
   85. [normalize(List, PZMath.FloatGet, PZMath.FloatSet)](#normalize(java.util.List,zombie.core.math.PZMath.FloatGet,zombie.core.math.PZMath.FloatSet))
   86. [normalize(E[], PZMath.FloatGet, PZMath.FloatSet)](#normalize(E%5B%5D,zombie.core.math.PZMath.FloatGet,zombie.core.math.PZMath.FloatSet))
   87. [normalize(float[])](#normalize(float%5B%5D))
   88. [normalize(ArrayList)](#normalize(java.util.ArrayList))
   89. [roundFloatPos(float, int)](#roundFloatPos(float,int))
   90. [roundFloat(float, int)](#roundFloat(float,int))
   91. [nextPowerOfTwo(int)](#nextPowerOfTwo(int))
   92. [roundToNearest(float)](#roundToNearest(float))
   93. [roundToInt(float)](#roundToInt(float))
   94. [roundToIntPlus05(float)](#roundToIntPlus05(float))
   95. [roundFromEdges(float)](#roundFromEdges(float))
   96. [closestVector3(float, float, float, float, float, float, float, float, float)](#closestVector3(float,float,float,float,float,float,float,float,float))
   97. [isLeft(float, float, float, float, float, float)](#isLeft(float,float,float,float,float,float))
   98. [intersectLineSegments(float, float, float, float, float, float, float, float, Vector2f)](#intersectLineSegments(float,float,float,float,float,float,float,float,org.joml.Vector2f))
   99. [closestPointOnLineSegment(float, float, float, float, float, float, double, Vector2f)](#closestPointOnLineSegment(float,float,float,float,float,float,double,org.joml.Vector2f))
   100. [closestPointsOnLineSegments(float, float, float, float, float, float, float, float, Vector2f, Vector2f)](#closestPointsOnLineSegments(float,float,float,float,float,float,float,float,org.joml.Vector2f,org.joml.Vector2f))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PZMath
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.math.PZMath

---

public final class PZMath
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static interface`

  `PZMath.FloatGet<E>`

  `static interface`

  `PZMath.FloatSet<E>`

  `static enum`

  `PZMath.SideOfLine`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final float`

  `degToRads`

  Conversion ratios, Degrees to Radians and back

  `static final float`

  `halfPI`

  `static final long`

  `microsToNanos`

  `static final long`

  `millisToMicros`

  `static final float`

  `PI`

  The `double` value that is closer than any other to
  *pi*, the ratio of the circumference of a circle to its
  diameter.

  `static final float`

  `PI2`

  `static final float`

  `radToDegs`

  `static final long`

  `secondsToMillis`

  `static long`

  `secondsToNanos`

  `private static final double`

  `SEGMENT_LENGTH_SQUARED_EPSILON`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PZMath()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static float`

  `abs(float val)`

  `static int`

  `abs(int val)`

  `static float`

  `acosf(float a)`

  `static float`

  `almostIdentity(float x,
  float m,
  float n)`

  Almost Identity

  `static float`

  `almostUnitIdentity(float x)`

  Almost Unit Identity

  `static float`

  `angleBetween(float ax,
  float ay,
  float bx,
  float by)`

  Returns the angle (in radians) between vectors va and vb.

  `static float`

  `angleBetween(Vector2 va,
  Vector2 vb)`

  Returns the angle (in radians) between vectors va and vb.  
  Assumes the incoming vectors are not normalized.

  `static float`

  `angleBetweenNormalized(float ax,
  float bx,
  float ay,
  float by)`

  Returns the angle (in radians) between vectors va and vb.

  `static float`

  `c_lerp(float src,
  float dest,
  float alpha)`

  `static float`

  `calculateBearing(Vector3 fromPosition,
  Vector2 fromForward,
  Vector3 toPosition)`

  Calculate bearing, relative angle from our current position and heading, to the target position.

  `static boolean`

  `canParseFloat(String varStr)`

  `static float`

  `ceil(float val)`

  `static double`

  `clamp(double val,
  double min,
  double max)`

  Result is clamped between min and max.

  `static float`

  `clamp(float val,
  float min,
  float max)`

  Result is clamped between min and max.

  `static int`

  `clamp(int val,
  int min,
  int max)`

  Result is clamped between min and max.

  `static long`

  `clamp(long val,
  long min,
  long max)`

  `static float`

  `clamp_01(float val)`

  `static double`

  `clampDouble_01(double val)`

  `static float`

  `clampFloat(float val,
  float min,
  float max)`

  `static double`

  `closestPointOnLineSegment(float x1,
  float y1,
  float x2,
  float y2,
  float px,
  float py,
  double endpointSnapEpsilon,
  Vector2f out)`

  `static double`

  `closestPointsOnLineSegments(float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  Vector2f p1,
  Vector2f p2)`

  `static Vector3`

  `closestVector3(float lx0,
  float ly0,
  float lz0,
  float lx1,
  float ly1,
  float lz1,
  float x,
  float y,
  float z)`

  `static org.lwjgl.util.vector.Matrix4f`

  `convertMatrix(org.joml.Matrix4f src,
  org.lwjgl.util.vector.Matrix4f dst)`

  `static org.joml.Matrix4f`

  `convertMatrix(org.lwjgl.util.vector.Matrix4f src,
  org.joml.Matrix4f dst)`

  `static int`

  `coorddivision(int value,
  int divisor)`

  `static int`

  `coordmodulo(int value,
  int divisor)`

  `static float`

  `coordmodulof(float value,
  int divisor)`

  `private static Vector3`

  `cross(float ux,
  float uy,
  float uz,
  float vx,
  float vy,
  float vz,
  Vector3 out)`

  `static Vector3`

  `cross(Vector3 a,
  Vector3 b,
  Vector3 out)`

  `static float`

  `degToRad(float degrees)`

  `static boolean`

  `equal(float a,
  float b)`

  `static boolean`

  `equal(float a,
  float b,
  float delta)`

  `static int`

  `fastfloor(double val)`

  `static int`

  `fastfloor(float val)`

  `static double`

  `floor(double val)`

  `static float`

  `floor(float val)`

  `static float`

  `frac(float val)`

  `static float`

  `gain(float x,
  float k)`

  Gain

  `static float`

  `getClosestAngle(float radsA,
  float radsB)`

  `static float`

  `getClosestAngleDegrees(float degsA,
  float degsB)`

  `static float`

  `getLength(float x,
  float y)`

  `static float`

  `getLengthSq(float x,
  float y)`

  `static boolean`

  `intersectLineSegments(float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  Vector2f intersection)`

  `static boolean`

  `isBetween(float value,
  float min,
  float max)`

  `static float`

  `isLeft(float x0,
  float y0,
  float x1,
  float y1,
  float x2,
  float y2)`

  `static boolean`

  `isNullOrZero(Vector2 vec)`

  `private static boolean`

  `isZero(Vector2 vec)`

  `static float`

  `lerp(float src,
  float dest,
  float alpha)`

  `static float`

  `lerp(float src,
  float dest,
  float alpha,
  zombie.core.math.interpolators.LerpType lerpType)`

  `static org.lwjgl.util.vector.Vector3f`

  `lerp(org.lwjgl.util.vector.Vector3f out,
  org.lwjgl.util.vector.Vector3f a,
  org.lwjgl.util.vector.Vector3f b,
  float t)`

  `static Vector2`

  `lerp(Vector2 out,
  Vector2 a,
  Vector2 b,
  float t)`

  `static Vector3`

  `lerp(Vector3 out,
  Vector3 a,
  Vector3 b,
  float t)`

  `static float`

  `lerpAngle(float src,
  float dest,
  float alpha)`

  `static float`

  `lerpFunc_EaseInQuad(float x)`

  `static float`

  `lerpFunc_EaseOutInQuad(float x)`

  `static float`

  `lerpFunc_EaseOutQuad(float x)`

  `static float`

  `max(float a,
  float b)`

  `static float`

  `max(float a,
  float b,
  float c)`

  `static float`

  `max(float a,
  float b,
  float c,
  float d)`

  `static float`

  `max(float a,
  float b,
  float c,
  float d,
  float e)`

  `static int`

  `max(int a,
  int b)`

  `static int`

  `max(int a,
  int b,
  int c)`

  `static int`

  `max(int a,
  int b,
  int c,
  int d)`

  `static int`

  `max(int a,
  int b,
  int c,
  int d,
  int e)`

  `static float`

  `min(float a,
  float b)`

  `static float`

  `min(float a,
  float b,
  float c)`

  `static float`

  `min(float a,
  float b,
  float c,
  float d)`

  `static float`

  `min(float a,
  float b,
  float c,
  float d,
  float e)`

  `static int`

  `min(int a,
  int b)`

  `static int`

  `min(int a,
  int b,
  int c)`

  `static int`

  `min(int a,
  int b,
  int c,
  int d)`

  `static int`

  `min(int a,
  int b,
  int c,
  int d,
  int e)`

  `static int`

  `nextPowerOfTwo(int value)`

  Returns the next power of two.

  `static float[]`

  `normalize(float[] weights)`

  `static <E> void`

  `normalize(E[] list,
  PZMath.FloatGet<E> floatGet,
  PZMath.FloatSet<E> floatSet)`

  `static ArrayList<Double>`

  `normalize(ArrayList<Double> list)`

  `static <E> void`

  `normalize(List<E> list,
  PZMath.FloatGet<E> floatGet,
  PZMath.FloatSet<E> floatSet)`

  Usage example:
  PZMath.normalize(list, MyClass::getMyfloat, MyClass::setMyfloat);
  Where list is a collection of MyClass.

  `static float`

  `pow(float a,
  float b)`

  `static float`

  `radToDeg(float radians)`

  `static org.lwjgl.util.vector.Vector3f`

  `rotateVector(float vx,
  float vy,
  float vz,
  float qx,
  float qy,
  float qz,
  float qw,
  org.lwjgl.util.vector.Vector3f result)`

  `static Vector2`

  `rotateVector(float vx,
  float vy,
  float qx,
  float qy,
  float qz,
  float qw,
  Vector2 result)`

  `static org.lwjgl.util.vector.Vector3f`

  `rotateVector(org.lwjgl.util.vector.Vector3f vector,
  org.lwjgl.util.vector.Quaternion quaternion,
  org.lwjgl.util.vector.Vector3f result)`

  Derived from source: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion

  `static float`

  `roundFloat(float value,
  int scale)`

  `static float`

  `roundFloatPos(float number,
  int scale)`

  `static float`

  `roundFromEdges(float val)`

  `static int`

  `roundToInt(float val)`

  `static float`

  `roundToIntPlus05(float val)`

  `static float`

  `roundToNearest(float val)`

  `static org.lwjgl.util.vector.Quaternion`

  `setFromAxisAngle(float ax,
  float ay,
  float az,
  float angleRadians,
  org.lwjgl.util.vector.Quaternion result)`

  `static int`

  `sign(float val)`

  `static org.lwjgl.util.vector.Quaternion`

  `slerp(org.lwjgl.util.vector.Quaternion result,
  org.lwjgl.util.vector.Quaternion from,
  org.lwjgl.util.vector.Quaternion to,
  float alpha)`

  `static float`

  `sqrt(float val)`

  `static float`

  `squared(float a)`

  `static float`

  `step(float from,
  float to,
  float delta)`

  `static PZMath.SideOfLine`

  `testSideOfLine(float x1,
  float y1,
  float x2,
  float y2,
  float px,
  float py)`

  `static double`

  `tryParseDouble(String varStr,
  double defaultVal)`

  `static float`

  `tryParseFloat(String varStr,
  float defaultVal)`

  `static int`

  `tryParseInt(String varStr,
  int defaultVal)`

  `static float`

  `wrap(float val,
  float range)`

  `static float`

  `wrap(float val,
  float min,
  float max)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PI

    public static final float PI

    The `double` value that is closer than any other to
    *pi*, the ratio of the circumference of a circle to its
    diameter.

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.PI)
  + ### PI2

    public static final float PI2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.PI2)
  + ### halfPI

    public static final float halfPI

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.halfPI)
  + ### degToRads

    public static final float degToRads

    Conversion ratios, Degrees to Radians and back

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.degToRads)
  + ### radToDegs

    public static final float radToDegs

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.radToDegs)
  + ### microsToNanos

    public static final long microsToNanos

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.microsToNanos)
  + ### millisToMicros

    public static final long millisToMicros

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.millisToMicros)
  + ### secondsToMillis

    public static final long secondsToMillis

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.secondsToMillis)
  + ### secondsToNanos

    public static long secondsToNanos
  + ### SEGMENT\_LENGTH\_SQUARED\_EPSILON

    private static final double SEGMENT\_LENGTH\_SQUARED\_EPSILON

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.math.PZMath.SEGMENT_LENGTH_SQUARED_EPSILON)
* Constructor Details
  -------------------

  + ### PZMath

    public PZMath()
* Method Details
  --------------

  + ### almostUnitIdentity

    public static float almostUnitIdentity(float x)

    Almost Unit Identity

    This is a near-identiy function that maps the unit interval into itself. It is the cousin of smoothstep(), in
    that it maps 0 to 0, 1 to 1, and has a 0 derivative at the origin, just like smoothstep. However, instead of
    having a 0 derivative at 1, it has a derivative of 1 at that point. It's equivalent to the Almost Identiy above
    with n=0 and m=1. Since it's a cubic just like smoothstep() it is very fast to evaluate.

    https://iquilezles.org/www/articles/functions/functions.htm

    Parameters:
    :   `x` - value in [0..1]

    Returns:
    :   value in [0..1]
  + ### almostIdentity

    public static float almostIdentity(float x,
    float m,
    float n)

    Almost Identity

    Imagine you don't want to modify a signal unless it's drops to zero or close to it, in which case you want
    to replace the value with a small possitive constant. Then, rather than clamping the value and introduce
    a discontinuity, you can smoothly blend the signal into the desired clipped value. So, let m be the threshold
    (anything above m stays unchanged), and n the value things will take when the signal is zero.
    Then, the following function does the soft clipping (in a cubic fashion):

    https://iquilezles.org/www/articles/functions/functions.htm

    Parameters:
    :   `x` - value in [0..1]

    Returns:
    :   value in [0..1]
  + ### gain

    public static float gain(float x,
    float k)

    Gain

    Remapping the unit interval into the unit interval by expanding the sides and compressing the center, and
    keeping 1/2 mapped to 1/2, that can be done with the gain() function. This was a common function in RSL tutorials
    (the Renderman Shading Language). k=1 is the identity curve, kinvalid input: '<'1 produces the classic gain() shape, and k>1
    produces "s" shaped curces. The curves are symmetric (and inverse) for k=a and k=1/a.

    https://iquilezles.org/www/articles/functions/functions.htm
  + ### clamp

    public static float clamp(float val,
    float min,
    float max)

    Result is clamped between min and max.

    Returns:
    :   min invalid input: '<'= val invalid input: '<'= max
  + ### clamp

    public static long clamp(long val,
    long min,
    long max)
  + ### clamp

    public static int clamp(int val,
    int min,
    int max)

    Result is clamped between min and max.

    Returns:
    :   min invalid input: '<'= val invalid input: '<'= max
  + ### clamp

    public static double clamp(double val,
    double min,
    double max)

    Result is clamped between min and max.

    Returns:
    :   min invalid input: '<'= val invalid input: '<'= max
  + ### clampFloat

    public static float clampFloat(float val,
    float min,
    float max)
  + ### clamp\_01

    public static float clamp\_01(float val)
  + ### clampDouble\_01

    public static double clampDouble\_01(double val)
  + ### setFromAxisAngle

    public static org.lwjgl.util.vector.Quaternion setFromAxisAngle(float ax,
    float ay,
    float az,
    float angleRadians,
    org.lwjgl.util.vector.Quaternion result)
  + ### lerp

    public static float lerp(float src,
    float dest,
    float alpha)
  + ### lerp

    public static float lerp(float src,
    float dest,
    float alpha,
    zombie.core.math.interpolators.LerpType lerpType)
  + ### lerpAngle

    public static float lerpAngle(float src,
    float dest,
    float alpha)
  + ### lerp

    public static org.lwjgl.util.vector.Vector3f lerp(org.lwjgl.util.vector.Vector3f out,
    org.lwjgl.util.vector.Vector3f a,
    org.lwjgl.util.vector.Vector3f b,
    float t)
  + ### lerp

    public static [Vector3](../../iso/Vector3.html "class in zombie.iso") lerp([Vector3](../../iso/Vector3.html "class in zombie.iso") out,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") a,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") b,
    float t)
  + ### lerp

    public static [Vector2](../../iso/Vector2.html "class in zombie.iso") lerp([Vector2](../../iso/Vector2.html "class in zombie.iso") out,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") a,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") b,
    float t)
  + ### c\_lerp

    public static float c\_lerp(float src,
    float dest,
    float alpha)
  + ### slerp

    public static org.lwjgl.util.vector.Quaternion slerp(org.lwjgl.util.vector.Quaternion result,
    org.lwjgl.util.vector.Quaternion from,
    org.lwjgl.util.vector.Quaternion to,
    float alpha)
  + ### sqrt

    public static float sqrt(float val)
  + ### lerpFunc\_EaseOutQuad

    public static float lerpFunc\_EaseOutQuad(float x)
  + ### lerpFunc\_EaseInQuad

    public static float lerpFunc\_EaseInQuad(float x)
  + ### lerpFunc\_EaseOutInQuad

    public static float lerpFunc\_EaseOutInQuad(float x)
  + ### tryParseDouble

    public static double tryParseDouble([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") varStr,
    double defaultVal)
  + ### tryParseFloat

    public static float tryParseFloat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") varStr,
    float defaultVal)
  + ### canParseFloat

    public static boolean canParseFloat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") varStr)
  + ### tryParseInt

    public static int tryParseInt([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") varStr,
    int defaultVal)
  + ### pow

    public static float pow(float a,
    float b)
  + ### squared

    public static float squared(float a)
  + ### degToRad

    public static float degToRad(float degrees)
  + ### radToDeg

    public static float radToDeg(float radians)
  + ### getClosestAngle

    public static float getClosestAngle(float radsA,
    float radsB)
  + ### getClosestAngleDegrees

    public static float getClosestAngleDegrees(float degsA,
    float degsB)
  + ### sign

    public static int sign(float val)
  + ### fastfloor

    public static int fastfloor(double val)
  + ### fastfloor

    public static int fastfloor(float val)
  + ### coorddivision

    public static int coorddivision(int value,
    int divisor)
  + ### coordmodulo

    public static int coordmodulo(int value,
    int divisor)
  + ### coordmodulof

    public static float coordmodulof(float value,
    int divisor)
  + ### floor

    public static float floor(float val)
  + ### floor

    public static double floor(double val)
  + ### ceil

    public static float ceil(float val)
  + ### frac

    public static float frac(float val)
  + ### wrap

    public static float wrap(float val,
    float range)
  + ### wrap

    public static float wrap(float val,
    float min,
    float max)
  + ### max

    public static float max(float a,
    float b)
  + ### max

    public static float max(float a,
    float b,
    float c)
  + ### max

    public static float max(float a,
    float b,
    float c,
    float d)
  + ### max

    public static float max(float a,
    float b,
    float c,
    float d,
    float e)
  + ### max

    public static int max(int a,
    int b)
  + ### max

    public static int max(int a,
    int b,
    int c)
  + ### max

    public static int max(int a,
    int b,
    int c,
    int d)
  + ### max

    public static int max(int a,
    int b,
    int c,
    int d,
    int e)
  + ### min

    public static float min(float a,
    float b)
  + ### min

    public static float min(float a,
    float b,
    float c)
  + ### min

    public static float min(float a,
    float b,
    float c,
    float d)
  + ### min

    public static float min(float a,
    float b,
    float c,
    float d,
    float e)
  + ### min

    public static int min(int a,
    int b)
  + ### min

    public static int min(int a,
    int b,
    int c)
  + ### min

    public static int min(int a,
    int b,
    int c,
    int d)
  + ### min

    public static int min(int a,
    int b,
    int c,
    int d,
    int e)
  + ### abs

    public static float abs(float val)
  + ### abs

    public static int abs(int val)
  + ### equal

    public static boolean equal(float a,
    float b)
  + ### equal

    public static boolean equal(float a,
    float b,
    float delta)
  + ### convertMatrix

    public static org.lwjgl.util.vector.Matrix4f convertMatrix(org.joml.Matrix4f src,
    org.lwjgl.util.vector.Matrix4f dst)
  + ### convertMatrix

    public static org.joml.Matrix4f convertMatrix(org.lwjgl.util.vector.Matrix4f src,
    org.joml.Matrix4f dst)
  + ### step

    public static float step(float from,
    float to,
    float delta)
  + ### angleBetween

    public static float angleBetween([Vector2](../../iso/Vector2.html "class in zombie.iso") va,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") vb)

    Returns the angle (in radians) between vectors va and vb.  
    Assumes the incoming vectors are not normalized.
  + ### angleBetween

    public static float angleBetween(float ax,
    float ay,
    float bx,
    float by)

    Returns the angle (in radians) between vectors va and vb.   
    Assumes the incoming vectors are not normalized.
  + ### angleBetweenNormalized

    public static float angleBetweenNormalized(float ax,
    float bx,
    float ay,
    float by)

    Returns the angle (in radians) between vectors va and vb.
  + ### acosf

    public static float acosf(float a)
  + ### calculateBearing

    public static float calculateBearing([Vector3](../../iso/Vector3.html "class in zombie.iso") fromPosition,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") fromForward,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") toPosition)

    Calculate bearing, relative angle from our current position and heading, to the target position.

    Returns:
    :   The bearing angle, in degrees.
  + ### rotateVector

    public static org.lwjgl.util.vector.Vector3f rotateVector(org.lwjgl.util.vector.Vector3f vector,
    org.lwjgl.util.vector.Quaternion quaternion,
    org.lwjgl.util.vector.Vector3f result)

    Derived from source: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion
  + ### rotateVector

    public static org.lwjgl.util.vector.Vector3f rotateVector(float vx,
    float vy,
    float vz,
    float qx,
    float qy,
    float qz,
    float qw,
    org.lwjgl.util.vector.Vector3f result)
  + ### rotateVector

    public static [Vector2](../../iso/Vector2.html "class in zombie.iso") rotateVector(float vx,
    float vy,
    float qx,
    float qy,
    float qz,
    float qw,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") result)
  + ### cross

    public static [Vector3](../../iso/Vector3.html "class in zombie.iso") cross([Vector3](../../iso/Vector3.html "class in zombie.iso") a,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") b,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") out)
  + ### cross

    private static [Vector3](../../iso/Vector3.html "class in zombie.iso") cross(float ux,
    float uy,
    float uz,
    float vx,
    float vy,
    float vz,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") out)
  + ### getLength

    public static float getLength(float x,
    float y)
  + ### getLengthSq

    public static float getLengthSq(float x,
    float y)
  + ### isBetween

    public static boolean isBetween(float value,
    float min,
    float max)
  + ### isNullOrZero

    public static boolean isNullOrZero([Vector2](../../iso/Vector2.html "class in zombie.iso") vec)
  + ### isZero

    private static boolean isZero([Vector2](../../iso/Vector2.html "class in zombie.iso") vec)
  + ### testSideOfLine

    public static [PZMath.SideOfLine](PZMath.SideOfLine.html "enum class in zombie.core.math") testSideOfLine(float x1,
    float y1,
    float x2,
    float y2,
    float px,
    float py)
  + ### normalize

    public static <E> void normalize([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<E> list,
    [PZMath.FloatGet](PZMath.FloatGet.html "interface in zombie.core.math")<E> floatGet,
    [PZMath.FloatSet](PZMath.FloatSet.html "interface in zombie.core.math")<E> floatSet)

    Usage example:
    PZMath.normalize(list, MyClass::getMyfloat, MyClass::setMyfloat);
    Where list is a collection of MyClass.
  + ### normalize

    public static <E> void normalize(E[] list,
    [PZMath.FloatGet](PZMath.FloatGet.html "interface in zombie.core.math")<E> floatGet,
    [PZMath.FloatSet](PZMath.FloatSet.html "interface in zombie.core.math")<E> floatSet)
  + ### normalize

    public static float[] normalize(float[] weights)
  + ### normalize

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> normalize([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> list)
  + ### roundFloatPos

    public static float roundFloatPos(float number,
    int scale)
  + ### roundFloat

    public static float roundFloat(float value,
    int scale)
  + ### nextPowerOfTwo

    public static int nextPowerOfTwo(int value)

    Returns the next power of two. Returns the specified value if the value is already a power of two.
  + ### roundToNearest

    public static float roundToNearest(float val)
  + ### roundToInt

    public static int roundToInt(float val)
  + ### roundToIntPlus05

    public static float roundToIntPlus05(float val)
  + ### roundFromEdges

    public static float roundFromEdges(float val)
  + ### closestVector3

    public static [Vector3](../../iso/Vector3.html "class in zombie.iso") closestVector3(float lx0,
    float ly0,
    float lz0,
    float lx1,
    float ly1,
    float lz1,
    float x,
    float y,
    float z)
  + ### isLeft

    public static float isLeft(float x0,
    float y0,
    float x1,
    float y1,
    float x2,
    float y2)
  + ### intersectLineSegments

    public static boolean intersectLineSegments(float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") intersection)
  + ### closestPointOnLineSegment

    public static double closestPointOnLineSegment(float x1,
    float y1,
    float x2,
    float y2,
    float px,
    float py,
    double endpointSnapEpsilon,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)

    Returns:
    :   Returns the squared distance of px,py to the line segment x1,y1 to x2,y2.
  + ### closestPointsOnLineSegments

    public static double closestPointsOnLineSegments(float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") p1,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") p2)