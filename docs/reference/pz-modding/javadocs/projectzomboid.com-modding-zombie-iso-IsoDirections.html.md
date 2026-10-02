[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoDirections](IsoDirections.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [N](#N)
   2. [NW](#NW)
   3. [W](#W)
   4. [SW](#SW)
   5. [S](#S)
   6. [SE](#SE)
   7. [E](#E)
   8. [NE](#NE)
8. [Field Details](#field-detail)
   1. [VALUES](#VALUES)
   2. [TEMP](#TEMP)
   3. [dx](#dx)
   4. [dy](#dy)
   5. [angle](#angle)
   6. [vector](#vector)
9. [Constructor Details](#constructor-detail)
   1. [IsoDirections(int, int)](#%3Cinit%3E(int,int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [fromString(String)](#fromString(java.lang.String))
    4. [fromIndex(int)](#fromIndex(int))
    5. [RotLeft()](#RotLeft())
    6. [RotLeft(int)](#RotLeft(int))
    7. [RotRight()](#RotRight())
    8. [RotRight(int)](#RotRight(int))
    9. [Rot180()](#Rot180())
    10. [fromAngle(Vector2)](#fromAngle(zombie.iso.Vector2))
    11. [fromAngle(float, float)](#fromAngle(float,float))
    12. [fromAngle(float)](#fromAngle(float))
    13. [safeFromAngle(float)](#safeFromAngle(float))
    14. [cardinalFromAngle(Vector2)](#cardinalFromAngle(zombie.iso.Vector2))
    15. [cardinalFromAngle(float, float)](#cardinalFromAngle(float,float))
    16. [cardinalFromAngle(float)](#cardinalFromAngle(float))
    17. [safeCardinalFromAngle(float)](#safeCardinalFromAngle(float))
    18. [dx()](#dx())
    19. [dy()](#dy())
    20. [isCardinal()](#isCardinal())
    21. [isDiagonal()](#isDiagonal())
    22. [ToVector()](#ToVector())
    23. [ToVector(Vector2)](#ToVector(zombie.iso.Vector2))
    24. [addToVector(Vector2, Vector2)](#addToVector(zombie.iso.Vector2,zombie.iso.Vector2))
    25. [toAngle()](#toAngle())
    26. [toAngleDegrees()](#toAngleDegrees())
    27. [getRandom()](#getRandom())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class IsoDirections
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoDirections](IsoDirections.html "enum class in zombie.iso")>

zombie.iso.IsoDirections

All Implemented Interfaces:
:   `Serializable, Comparable<IsoDirections>, Constable`

---

public enum IsoDirections
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoDirections](IsoDirections.html "enum class in zombie.iso")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `E`

  `N`

  `NE`

  `NW`

  `S`

  `SE`

  `SW`

  `W`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `angle`

  `private final int`

  `dx`

  `private final int`

  `dy`

  `private static final Vector2`

  `TEMP`

  `private static final IsoDirections[]`

  `VALUES`

  `private final Vector2`

  `vector`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoDirections(int dx,
  int dy)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Vector2`

  `addToVector(Vector2 addTo,
  Vector2 result)`

  `static IsoDirections`

  `cardinalFromAngle(float angleRadians)`

  `static IsoDirections`

  `cardinalFromAngle(float dx,
  float dy)`

  `static IsoDirections`

  `cardinalFromAngle(Vector2 v)`

  `int`

  `dx()`

  `int`

  `dy()`

  `static IsoDirections`

  `fromAngle(float angleRadians)`

  `static IsoDirections`

  `fromAngle(float dx,
  float dy)`

  `static IsoDirections`

  `fromAngle(Vector2 v)`

  `static IsoDirections`

  `fromIndex(int index)`

  `static IsoDirections`

  `fromString(String str)`

  `static IsoDirections`

  `getRandom()`

  `boolean`

  `isCardinal()`

  `boolean`

  `isDiagonal()`

  `IsoDirections`

  `Rot180()`

  `IsoDirections`

  `RotLeft()`

  `IsoDirections`

  `RotLeft(int times)`

  `IsoDirections`

  `RotRight()`

  `IsoDirections`

  `RotRight(int times)`

  `private static IsoDirections`

  `safeCardinalFromAngle(float preClampedAngleRadians)`

  `private static IsoDirections`

  `safeFromAngle(float preClampedAngleRadians)`

  `float`

  `toAngle()`

  `float`

  `toAngleDegrees()`

  `Vector2`

  `ToVector()`

  `Vector2`

  `ToVector(Vector2 result)`

  `static IsoDirections`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoDirections[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### N

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") N
  + ### NW

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") NW
  + ### W

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") W
  + ### SW

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") SW
  + ### S

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") S
  + ### SE

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") SE
  + ### E

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") E
  + ### NE

    public static final [IsoDirections](IsoDirections.html "enum class in zombie.iso") NE
* Field Details
  -------------

  + ### VALUES

    private static final [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] VALUES
  + ### TEMP

    private static final [Vector2](Vector2.html "class in zombie.iso") TEMP
  + ### dx

    private final int dx
  + ### dy

    private final int dy
  + ### angle

    private final float angle
  + ### vector

    private final [Vector2](Vector2.html "class in zombie.iso") vector
* Constructor Details
  -------------------

  + ### IsoDirections

    private IsoDirections(int dx,
    int dy)
* Method Details
  --------------

  + ### values

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### fromString

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### fromIndex

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") fromIndex(int index)
  + ### RotLeft

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") RotLeft()
  + ### RotLeft

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") RotLeft(int times)
  + ### RotRight

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") RotRight()
  + ### RotRight

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") RotRight(int times)
  + ### Rot180

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") Rot180()
  + ### fromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") fromAngle([Vector2](Vector2.html "class in zombie.iso") v)
  + ### fromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") fromAngle(float dx,
    float dy)
  + ### fromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") fromAngle(float angleRadians)
  + ### safeFromAngle

    private static [IsoDirections](IsoDirections.html "enum class in zombie.iso") safeFromAngle(float preClampedAngleRadians)
  + ### cardinalFromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") cardinalFromAngle([Vector2](Vector2.html "class in zombie.iso") v)
  + ### cardinalFromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") cardinalFromAngle(float dx,
    float dy)
  + ### cardinalFromAngle

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") cardinalFromAngle(float angleRadians)
  + ### safeCardinalFromAngle

    private static [IsoDirections](IsoDirections.html "enum class in zombie.iso") safeCardinalFromAngle(float preClampedAngleRadians)
  + ### dx

    public int dx()
  + ### dy

    public int dy()
  + ### isCardinal

    public boolean isCardinal()
  + ### isDiagonal

    public boolean isDiagonal()
  + ### ToVector

    public [Vector2](Vector2.html "class in zombie.iso") ToVector()
  + ### ToVector

    public [Vector2](Vector2.html "class in zombie.iso") ToVector([Vector2](Vector2.html "class in zombie.iso") result)
  + ### addToVector

    public [Vector2](Vector2.html "class in zombie.iso") addToVector([Vector2](Vector2.html "class in zombie.iso") addTo,
    [Vector2](Vector2.html "class in zombie.iso") result)
  + ### toAngle

    public float toAngle()
  + ### toAngleDegrees

    public float toAngleDegrees()
  + ### getRandom

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") getRandom()