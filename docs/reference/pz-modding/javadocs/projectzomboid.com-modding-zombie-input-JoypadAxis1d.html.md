[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.input](package-summary.html)
2. [JoypadAxis1d](JoypadAxis1d.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [LeftTrigger](#LeftTrigger)
   2. [RightTrigger](#RightTrigger)
   3. [LeftStickX](#LeftStickX)
   4. [LeftStickY](#LeftStickY)
   5. [RightStickX](#RightStickX)
   6. [RightStickY](#RightStickY)
8. [Field Details](#field-detail)
   1. [axisSupplier](#axisSupplier)
   2. [deadZoneSupplier](#deadZoneSupplier)
   3. [deadZoneAcceptor](#deadZoneAcceptor)
   4. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [JoypadAxis1d(AxisValueSupplier, AxisValueSupplier, AxisValueAcceptor)](#%3Cinit%3E(zombie.input.AxisValueSupplier,zombie.input.AxisValueSupplier,zombie.input.AxisValueAcceptor))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getNameTranslationKey()](#getNameTranslationKey())
    4. [getValue(int)](#getValue(int))
    5. [getAxes()](#getAxes())
    6. [getAxisCount()](#getAxisCount())
    7. [getDeadZone(int)](#getDeadZone(int))
    8. [setDeadZone(int, float)](#setDeadZone(int,float))
    9. [fromIndex(int)](#fromIndex(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class JoypadAxis1d
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input")>

zombie.input.JoypadAxis1d

All Implemented Interfaces:
:   `Serializable, Comparable<JoypadAxis1d>, Constable`

---

public enum JoypadAxis1d
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `LeftStickX`

  `LeftStickY`

  `LeftTrigger`

  `RightStickX`

  `RightStickY`

  `RightTrigger`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.input.AxisValueSupplier`

  `axisSupplier`

  `private final zombie.input.AxisValueAcceptor`

  `deadZoneAcceptor`

  `private final zombie.input.AxisValueSupplier`

  `deadZoneSupplier`

  `private static final JoypadAxis1d[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `JoypadAxis1d(zombie.input.AxisValueSupplier axisSupplier,
  zombie.input.AxisValueSupplier deadZoneSupplier,
  zombie.input.AxisValueAcceptor deadZoneAcceptor)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static JoypadAxis1d`

  `fromIndex(int axisIdx)`

  `static JoypadAxis1d[]`

  `getAxes()`

  `static int`

  `getAxisCount()`

  `float`

  `getDeadZone(int joypadBind)`

  `String`

  `getNameTranslationKey()`

  `float`

  `getValue(int joypadBind)`

  `void`

  `setDeadZone(int joypadBind,
  float newValue)`

  `static JoypadAxis1d`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static JoypadAxis1d[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### LeftTrigger

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") LeftTrigger
  + ### RightTrigger

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") RightTrigger
  + ### LeftStickX

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") LeftStickX
  + ### LeftStickY

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") LeftStickY
  + ### RightStickX

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") RightStickX
  + ### RightStickY

    public static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") RightStickY
* Field Details
  -------------

  + ### axisSupplier

    private final zombie.input.AxisValueSupplier axisSupplier
  + ### deadZoneSupplier

    private final zombie.input.AxisValueSupplier deadZoneSupplier
  + ### deadZoneAcceptor

    private final zombie.input.AxisValueAcceptor deadZoneAcceptor
  + ### values

    private static final [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input")[] values
* Constructor Details
  -------------------

  + ### JoypadAxis1d

    private JoypadAxis1d(zombie.input.AxisValueSupplier axisSupplier,
    zombie.input.AxisValueSupplier deadZoneSupplier,
    zombie.input.AxisValueAcceptor deadZoneAcceptor)
* Method Details
  --------------

  + ### values

    public static [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getValue

    public float getValue(int joypadBind)
  + ### getAxes

    public static [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input")[] getAxes()
  + ### getAxisCount

    public static int getAxisCount()
  + ### getDeadZone

    public float getDeadZone(int joypadBind)
  + ### setDeadZone

    public void setDeadZone(int joypadBind,
    float newValue)
  + ### fromIndex

    public static [JoypadAxis1d](JoypadAxis1d.html "enum class in zombie.input") fromIndex(int axisIdx)