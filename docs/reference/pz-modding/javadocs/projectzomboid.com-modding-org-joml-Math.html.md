[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [org.joml](package-summary.html)
2. [Math](Math.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [PI](#PI)
   2. [PI2](#PI2)
   3. [PI\_f](#PI_f)
   4. [PI2\_f](#PI2_f)
   5. [PIHalf](#PIHalf)
   6. [PIHalf\_f](#PIHalf_f)
   7. [PI\_4](#PI_4)
   8. [PI\_INV](#PI_INV)
   9. [lookupBits](#lookupBits)
   10. [lookupTableSize](#lookupTableSize)
   11. [lookupTableSizeMinus1](#lookupTableSizeMinus1)
   12. [lookupTableSizeWithMargin](#lookupTableSizeWithMargin)
   13. [pi2OverLookupSize](#pi2OverLookupSize)
   14. [lookupSizeOverPi2](#lookupSizeOverPi2)
   15. [sinTable](#sinTable)
   16. [c1](#c1)
   17. [c2](#c2)
   18. [c3](#c3)
   19. [c4](#c4)
   20. [c5](#c5)
   21. [c6](#c6)
   22. [c7](#c7)
   23. [s5](#s5)
   24. [s4](#s4)
   25. [s3](#s3)
   26. [s2](#s2)
   27. [s1](#s1)
   28. [k1](#k1)
   29. [k2](#k2)
   30. [k3](#k3)
   31. [k4](#k4)
   32. [k5](#k5)
   33. [k6](#k6)
   34. [k7](#k7)
6. [Constructor Details](#constructor-detail)
   1. [Math()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [sin\_theagentd\_arith(double)](#sin_theagentd_arith(double))
   2. [sin\_roquen\_arith(double)](#sin_roquen_arith(double))
   3. [sin\_roquen\_9(double)](#sin_roquen_9(double))
   4. [sin\_roquen\_newk(double)](#sin_roquen_newk(double))
   5. [sin\_theagentd\_lookup(float)](#sin_theagentd_lookup(float))
   6. [sin(float)](#sin(float))
   7. [sin(double)](#sin(double))
   8. [cos(float)](#cos(float))
   9. [cos(double)](#cos(double))
   10. [cosFromSin(float, float)](#cosFromSin(float,float))
   11. [cosFromSinInternal(float, float)](#cosFromSinInternal(float,float))
   12. [cosFromSin(double, double)](#cosFromSin(double,double))
   13. [sqrt(float)](#sqrt(float))
   14. [sqrt(double)](#sqrt(double))
   15. [invsqrt(float)](#invsqrt(float))
   16. [invsqrt(double)](#invsqrt(double))
   17. [tan(float)](#tan(float))
   18. [tan(double)](#tan(double))
   19. [acos(float)](#acos(float))
   20. [acos(double)](#acos(double))
   21. [safeAcos(float)](#safeAcos(float))
   22. [safeAcos(double)](#safeAcos(double))
   23. [fastAtan2(double, double)](#fastAtan2(double,double))
   24. [atan2(float, float)](#atan2(float,float))
   25. [atan2(double, double)](#atan2(double,double))
   26. [asin(float)](#asin(float))
   27. [asin(double)](#asin(double))
   28. [safeAsin(float)](#safeAsin(float))
   29. [safeAsin(double)](#safeAsin(double))
   30. [abs(float)](#abs(float))
   31. [abs(double)](#abs(double))
   32. [absEqualsOne(float)](#absEqualsOne(float))
   33. [absEqualsOne(double)](#absEqualsOne(double))
   34. [abs(int)](#abs(int))
   35. [max(int, int)](#max(int,int))
   36. [min(int, int)](#min(int,int))
   37. [min(double, double)](#min(double,double))
   38. [min(float, float)](#min(float,float))
   39. [max(float, float)](#max(float,float))
   40. [max(double, double)](#max(double,double))
   41. [clamp(float, float, float)](#clamp(float,float,float))
   42. [clamp(double, double, double)](#clamp(double,double,double))
   43. [clamp(int, int, int)](#clamp(int,int,int))
   44. [toRadians(float)](#toRadians(float))
   45. [toRadians(double)](#toRadians(double))
   46. [toDegrees(double)](#toDegrees(double))
   47. [floor(double)](#floor(double))
   48. [floor(float)](#floor(float))
   49. [ceil(double)](#ceil(double))
   50. [ceil(float)](#ceil(float))
   51. [round(double)](#round(double))
   52. [round(float)](#round(float))
   53. [exp(double)](#exp(double))
   54. [isFinite(double)](#isFinite(double))
   55. [isFinite(float)](#isFinite(float))
   56. [fma(float, float, float)](#fma(float,float,float))
   57. [fma(double, double, double)](#fma(double,double,double))
   58. [roundUsing(float, int)](#roundUsing(float,int))
   59. [roundUsing(double, int)](#roundUsing(double,int))
   60. [lerp(float, float, float)](#lerp(float,float,float))
   61. [lerp(double, double, double)](#lerp(double,double,double))
   62. [biLerp(float, float, float, float, float, float)](#biLerp(float,float,float,float,float,float))
   63. [biLerp(double, double, double, double, double, double)](#biLerp(double,double,double,double,double,double))
   64. [triLerp(float, float, float, float, float, float, float, float, float, float, float)](#triLerp(float,float,float,float,float,float,float,float,float,float,float))
   65. [triLerp(double, double, double, double, double, double, double, double, double, double, double)](#triLerp(double,double,double,double,double,double,double,double,double,double,double))
   66. [roundHalfEven(float)](#roundHalfEven(float))
   67. [roundHalfDown(float)](#roundHalfDown(float))
   68. [roundHalfUp(float)](#roundHalfUp(float))
   69. [roundHalfEven(double)](#roundHalfEven(double))
   70. [roundHalfDown(double)](#roundHalfDown(double))
   71. [roundHalfUp(double)](#roundHalfUp(double))
   72. [random()](#random())
   73. [signum(double)](#signum(double))
   74. [signum(float)](#signum(float))
   75. [signum(int)](#signum(int))
   76. [signum(long)](#signum(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Math
==========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.joml.Math

---

public class Math
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Contains fast approximations of some [`Math`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Math.html "class or interface in java.lang") operations.

By default, [`Math`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Math.html "class or interface in java.lang") methods will be used by all other JOML classes. In order to use the approximations in this class, start the JVM with the parameter `-Djoml.fastmath`.

There are two algorithms for approximating sin/cos:

1. arithmetic [polynomial approximation](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361815/view.html#msg361815) contributed by roquendm
2. theagentd's [linear interpolation](http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/msg/346213/view.html#msg346213) variant of Riven's algorithm from
   [http://www.java-gaming.org/](http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/view.html)

By default, the first algorithm is being used. In order to use the second one, start the JVM with `-Djoml.sinLookup`. The lookup table bit length of the second algorithm can also be adjusted
for improved accuracy via `-Djoml.sinLookup.bits=<n>`, where <n> is the number of bits of the lookup table.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final double`

  `c1`

  `private static final double`

  `c2`

  `private static final double`

  `c3`

  `private static final double`

  `c4`

  `private static final double`

  `c5`

  `private static final double`

  `c6`

  `private static final double`

  `c7`

  `private static final double`

  `k1`

  `private static final double`

  `k2`

  `private static final double`

  `k3`

  `private static final double`

  `k4`

  `private static final double`

  `k5`

  `private static final double`

  `k6`

  `private static final double`

  `k7`

  `private static final int`

  `lookupBits`

  `private static final float`

  `lookupSizeOverPi2`

  `private static final int`

  `lookupTableSize`

  `private static final int`

  `lookupTableSizeMinus1`

  `private static final int`

  `lookupTableSizeWithMargin`

  `static final double`

  `PI`

  `(package private) static final double`

  `PI_4`

  `(package private) static final float`

  `PI_f`

  `(package private) static final double`

  `PI_INV`

  `(package private) static final double`

  `PI2`

  `(package private) static final float`

  `PI2_f`

  `private static final float`

  `pi2OverLookupSize`

  `(package private) static final double`

  `PIHalf`

  `(package private) static final float`

  `PIHalf_f`

  `private static final double`

  `s1`

  `private static final double`

  `s2`

  `private static final double`

  `s3`

  `private static final double`

  `s4`

  `private static final double`

  `s5`

  `private static final float[]`

  `sinTable`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Math()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static double`

  `abs(double r)`

  `static float`

  `abs(float r)`

  `static int`

  `abs(int r)`

  `(package private) static boolean`

  `absEqualsOne(double r)`

  `(package private) static boolean`

  `absEqualsOne(float r)`

  `static double`

  `acos(double r)`

  `static float`

  `acos(float r)`

  `static double`

  `asin(double r)`

  `static float`

  `asin(float r)`

  `static double`

  `atan2(double y,
  double x)`

  `static float`

  `atan2(float y,
  float x)`

  `static double`

  `biLerp(double q00,
  double q10,
  double q01,
  double q11,
  double tx,
  double ty)`

  `static float`

  `biLerp(float q00,
  float q10,
  float q01,
  float q11,
  float tx,
  float ty)`

  `static double`

  `ceil(double v)`

  `static float`

  `ceil(float v)`

  `static double`

  `clamp(double a,
  double b,
  double val)`

  `static float`

  `clamp(float a,
  float b,
  float val)`

  `static int`

  `clamp(int a,
  int b,
  int val)`

  `static double`

  `cos(double rad)`

  `static float`

  `cos(float rad)`

  `static double`

  `cosFromSin(double sin,
  double angle)`

  `static float`

  `cosFromSin(float sin,
  float angle)`

  `private static float`

  `cosFromSinInternal(float sin,
  float angle)`

  `static double`

  `exp(double a)`

  `private static double`

  `fastAtan2(double y,
  double x)`

  https://math.stackexchange.com/questions/1098487/atan2-faster-approximation/1105038#answer-1105038

  `static double`

  `floor(double v)`

  `static float`

  `floor(float v)`

  `static double`

  `fma(double a,
  double b,
  double c)`

  `static float`

  `fma(float a,
  float b,
  float c)`

  `static double`

  `invsqrt(double r)`

  `static float`

  `invsqrt(float r)`

  `static boolean`

  `isFinite(double d)`

  `static boolean`

  `isFinite(float f)`

  `static double`

  `lerp(double a,
  double b,
  double t)`

  `static float`

  `lerp(float a,
  float b,
  float t)`

  `static double`

  `max(double a,
  double b)`

  `static float`

  `max(float a,
  float b)`

  `static int`

  `max(int x,
  int y)`

  `static double`

  `min(double a,
  double b)`

  `static float`

  `min(float a,
  float b)`

  `static int`

  `min(int x,
  int y)`

  `static double`

  `random()`

  `static long`

  `round(double v)`

  `static int`

  `round(float v)`

  `static int`

  `roundHalfDown(double v)`

  `static int`

  `roundHalfDown(float v)`

  `static int`

  `roundHalfEven(double v)`

  `static int`

  `roundHalfEven(float v)`

  `static int`

  `roundHalfUp(double v)`

  `static int`

  `roundHalfUp(float v)`

  `static int`

  `roundUsing(double v,
  int mode)`

  `static int`

  `roundUsing(float v,
  int mode)`

  `static double`

  `safeAcos(double v)`

  `static float`

  `safeAcos(float v)`

  `static double`

  `safeAsin(double r)`

  `static float`

  `safeAsin(float r)`

  `static double`

  `signum(double v)`

  `static float`

  `signum(float v)`

  `static int`

  `signum(int v)`

  `static int`

  `signum(long v)`

  `static double`

  `sin(double rad)`

  `static float`

  `sin(float rad)`

  `(package private) static double`

  `sin_roquen_9(double v)`

  Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361815/view.html#msg361815)

  `(package private) static double`

  `sin_roquen_arith(double x)`

  Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361718/view.html#msg361718)

  `(package private) static double`

  `sin_roquen_newk(double v)`

  Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361815/view.html#msg361815)

  `(package private) static double`

  `sin_theagentd_arith(double x)`

  `(package private) static float`

  `sin_theagentd_lookup(float rad)`

  Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/msg/349515/view.html#msg349515)

  `static double`

  `sqrt(double r)`

  `static float`

  `sqrt(float r)`

  `static double`

  `tan(double r)`

  `static float`

  `tan(float r)`

  `static double`

  `toDegrees(double angles)`

  `static double`

  `toRadians(double angles)`

  `static float`

  `toRadians(float angles)`

  `static double`

  `triLerp(double q000,
  double q100,
  double q010,
  double q110,
  double q001,
  double q101,
  double q011,
  double q111,
  double tx,
  double ty,
  double tz)`

  `static float`

  `triLerp(float q000,
  float q100,
  float q010,
  float q110,
  float q001,
  float q101,
  float q011,
  float q111,
  float tx,
  float ty,
  float tz)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PI

    public static final double PI

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI)
  + ### PI2

    static final double PI2

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI2)
  + ### PI\_f

    static final float PI\_f

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI_f)
  + ### PI2\_f

    static final float PI2\_f

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI2_f)
  + ### PIHalf

    static final double PIHalf

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PIHalf)
  + ### PIHalf\_f

    static final float PIHalf\_f

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PIHalf_f)
  + ### PI\_4

    static final double PI\_4

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI_4)
  + ### PI\_INV

    static final double PI\_INV

    See Also:
    :   - [Constant Field Values](../../constant-values.html#org.joml.Math.PI_INV)
  + ### lookupBits

    private static final int lookupBits
  + ### lookupTableSize

    private static final int lookupTableSize
  + ### lookupTableSizeMinus1

    private static final int lookupTableSizeMinus1
  + ### lookupTableSizeWithMargin

    private static final int lookupTableSizeWithMargin
  + ### pi2OverLookupSize

    private static final float pi2OverLookupSize
  + ### lookupSizeOverPi2

    private static final float lookupSizeOverPi2
  + ### sinTable

    private static final float[] sinTable
  + ### c1

    private static final double c1
  + ### c2

    private static final double c2
  + ### c3

    private static final double c3
  + ### c4

    private static final double c4
  + ### c5

    private static final double c5
  + ### c6

    private static final double c6
  + ### c7

    private static final double c7
  + ### s5

    private static final double s5
  + ### s4

    private static final double s4
  + ### s3

    private static final double s3
  + ### s2

    private static final double s2
  + ### s1

    private static final double s1
  + ### k1

    private static final double k1
  + ### k2

    private static final double k2
  + ### k3

    private static final double k3
  + ### k4

    private static final double k4
  + ### k5

    private static final double k5
  + ### k6

    private static final double k6
  + ### k7

    private static final double k7
* Constructor Details
  -------------------

  + ### Math

    public Math()
* Method Details
  --------------

  + ### sin\_theagentd\_arith

    static double sin\_theagentd\_arith(double x)
  + ### sin\_roquen\_arith

    static double sin\_roquen\_arith(double x)

    Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361718/view.html#msg361718)
  + ### sin\_roquen\_9

    static double sin\_roquen\_9(double v)

    Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361815/view.html#msg361815)
  + ### sin\_roquen\_newk

    static double sin\_roquen\_newk(double v)

    Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/joml-1-8-0-release/37491/msg/361815/view.html#msg361815)
  + ### sin\_theagentd\_lookup

    static float sin\_theagentd\_lookup(float rad)

    Reference: [http://www.java-gaming.org/](http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/msg/349515/view.html#msg349515)
  + ### sin

    public static float sin(float rad)
  + ### sin

    public static double sin(double rad)
  + ### cos

    public static float cos(float rad)
  + ### cos

    public static double cos(double rad)
  + ### cosFromSin

    public static float cosFromSin(float sin,
    float angle)
  + ### cosFromSinInternal

    private static float cosFromSinInternal(float sin,
    float angle)
  + ### cosFromSin

    public static double cosFromSin(double sin,
    double angle)
  + ### sqrt

    public static float sqrt(float r)
  + ### sqrt

    public static double sqrt(double r)
  + ### invsqrt

    public static float invsqrt(float r)
  + ### invsqrt

    public static double invsqrt(double r)
  + ### tan

    public static float tan(float r)
  + ### tan

    public static double tan(double r)
  + ### acos

    public static float acos(float r)
  + ### acos

    public static double acos(double r)
  + ### safeAcos

    public static float safeAcos(float v)
  + ### safeAcos

    public static double safeAcos(double v)
  + ### fastAtan2

    private static double fastAtan2(double y,
    double x)

    https://math.stackexchange.com/questions/1098487/atan2-faster-approximation/1105038#answer-1105038
  + ### atan2

    public static float atan2(float y,
    float x)
  + ### atan2

    public static double atan2(double y,
    double x)
  + ### asin

    public static float asin(float r)
  + ### asin

    public static double asin(double r)
  + ### safeAsin

    public static float safeAsin(float r)
  + ### safeAsin

    public static double safeAsin(double r)
  + ### abs

    public static float abs(float r)
  + ### abs

    public static double abs(double r)
  + ### absEqualsOne

    static boolean absEqualsOne(float r)
  + ### absEqualsOne

    static boolean absEqualsOne(double r)
  + ### abs

    public static int abs(int r)
  + ### max

    public static int max(int x,
    int y)
  + ### min

    public static int min(int x,
    int y)
  + ### min

    public static double min(double a,
    double b)
  + ### min

    public static float min(float a,
    float b)
  + ### max

    public static float max(float a,
    float b)
  + ### max

    public static double max(double a,
    double b)
  + ### clamp

    public static float clamp(float a,
    float b,
    float val)
  + ### clamp

    public static double clamp(double a,
    double b,
    double val)
  + ### clamp

    public static int clamp(int a,
    int b,
    int val)
  + ### toRadians

    public static float toRadians(float angles)
  + ### toRadians

    public static double toRadians(double angles)
  + ### toDegrees

    public static double toDegrees(double angles)
  + ### floor

    public static double floor(double v)
  + ### floor

    public static float floor(float v)
  + ### ceil

    public static double ceil(double v)
  + ### ceil

    public static float ceil(float v)
  + ### round

    public static long round(double v)
  + ### round

    public static int round(float v)
  + ### exp

    public static double exp(double a)
  + ### isFinite

    public static boolean isFinite(double d)
  + ### isFinite

    public static boolean isFinite(float f)
  + ### fma

    public static float fma(float a,
    float b,
    float c)
  + ### fma

    public static double fma(double a,
    double b,
    double c)
  + ### roundUsing

    public static int roundUsing(float v,
    int mode)
  + ### roundUsing

    public static int roundUsing(double v,
    int mode)
  + ### lerp

    public static float lerp(float a,
    float b,
    float t)
  + ### lerp

    public static double lerp(double a,
    double b,
    double t)
  + ### biLerp

    public static float biLerp(float q00,
    float q10,
    float q01,
    float q11,
    float tx,
    float ty)
  + ### biLerp

    public static double biLerp(double q00,
    double q10,
    double q01,
    double q11,
    double tx,
    double ty)
  + ### triLerp

    public static float triLerp(float q000,
    float q100,
    float q010,
    float q110,
    float q001,
    float q101,
    float q011,
    float q111,
    float tx,
    float ty,
    float tz)
  + ### triLerp

    public static double triLerp(double q000,
    double q100,
    double q010,
    double q110,
    double q001,
    double q101,
    double q011,
    double q111,
    double tx,
    double ty,
    double tz)
  + ### roundHalfEven

    public static int roundHalfEven(float v)
  + ### roundHalfDown

    public static int roundHalfDown(float v)
  + ### roundHalfUp

    public static int roundHalfUp(float v)
  + ### roundHalfEven

    public static int roundHalfEven(double v)
  + ### roundHalfDown

    public static int roundHalfDown(double v)
  + ### roundHalfUp

    public static int roundHalfUp(double v)
  + ### random

    public static double random()
  + ### signum

    public static double signum(double v)
  + ### signum

    public static float signum(float v)
  + ### signum

    public static int signum(int v)
  + ### signum

    public static int signum(long v)