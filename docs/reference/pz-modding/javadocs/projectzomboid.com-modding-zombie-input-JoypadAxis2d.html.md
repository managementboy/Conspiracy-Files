[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.input](package-summary.html)
2. [JoypadAxis2d](JoypadAxis2d.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [LeftStick](#LeftStick)
   2. [RightStick](#RightStick)
8. [Field Details](#field-detail)
   1. [axisSupplierX](#axisSupplierX)
   2. [axisSupplierY](#axisSupplierY)
   3. [isAppliedSupplier](#isAppliedSupplier)
   4. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [JoypadAxis2d(AxisValueSupplier, AxisValueSupplier, JoypadAxis2d.IsAxisAppliedSupplier)](#%3Cinit%3E(zombie.input.AxisValueSupplier,zombie.input.AxisValueSupplier,zombie.input.JoypadAxis2d.IsAxisAppliedSupplier))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getNameTranslationKey()](#getNameTranslationKey())
    4. [getLength(int)](#getLength(int))
    5. [getValue(int, Vector2)](#getValue(int,zombie.iso.Vector2))
    6. [getValueX(int)](#getValueX(int))
    7. [getValueY(int)](#getValueY(int))
    8. [isApplied(int)](#isApplied(int))
    9. [getAxes()](#getAxes())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class JoypadAxis2d
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input")>

zombie.input.JoypadAxis2d

All Implemented Interfaces:
:   `Serializable, Comparable<JoypadAxis2d>, Constable`

---

public enum JoypadAxis2d
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static interface`

  `JoypadAxis2d.IsAxisAppliedSupplier`

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `LeftStick`

  `RightStick`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.input.AxisValueSupplier`

  `axisSupplierX`

  `private final zombie.input.AxisValueSupplier`

  `axisSupplierY`

  `private final JoypadAxis2d.IsAxisAppliedSupplier`

  `isAppliedSupplier`

  `private static final JoypadAxis2d[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `JoypadAxis2d(zombie.input.AxisValueSupplier axisSupplierX,
  zombie.input.AxisValueSupplier axisSupplierY,
  JoypadAxis2d.IsAxisAppliedSupplier isAppliedSupplier)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static JoypadAxis2d[]`

  `getAxes()`

  `float`

  `getLength(int joypadBind)`

  `String`

  `getNameTranslationKey()`

  `Vector2`

  `getValue(int joypadBind,
  Vector2 out)`

  `float`

  `getValueX(int joypadBind)`

  `float`

  `getValueY(int joypadBind)`

  `boolean`

  `isApplied(int joypadBind)`

  `static JoypadAxis2d`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static JoypadAxis2d[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### LeftStick

    public static final [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input") LeftStick
  + ### RightStick

    public static final [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input") RightStick
* Field Details
  -------------

  + ### axisSupplierX

    private final zombie.input.AxisValueSupplier axisSupplierX
  + ### axisSupplierY

    private final zombie.input.AxisValueSupplier axisSupplierY
  + ### isAppliedSupplier

    private final [JoypadAxis2d.IsAxisAppliedSupplier](JoypadAxis2d.IsAxisAppliedSupplier.html "interface in zombie.input") isAppliedSupplier
  + ### values

    private static final [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input")[] values
* Constructor Details
  -------------------

  + ### JoypadAxis2d

    private JoypadAxis2d(zombie.input.AxisValueSupplier axisSupplierX,
    zombie.input.AxisValueSupplier axisSupplierY,
    [JoypadAxis2d.IsAxisAppliedSupplier](JoypadAxis2d.IsAxisAppliedSupplier.html "interface in zombie.input") isAppliedSupplier)
* Method Details
  --------------

  + ### values

    public static [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getNameTranslationKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameTranslationKey()
  + ### getLength

    public float getLength(int joypadBind)
  + ### getValue

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getValue(int joypadBind,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### getValueX

    public float getValueX(int joypadBind)
  + ### getValueY

    public float getValueY(int joypadBind)
  + ### isApplied

    public boolean isApplied(int joypadBind)
  + ### getAxes

    public static [JoypadAxis2d](JoypadAxis2d.html "enum class in zombie.input")[] getAxes()