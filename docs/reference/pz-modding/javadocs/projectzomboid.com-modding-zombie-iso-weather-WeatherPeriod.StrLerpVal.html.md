[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [WeatherPeriod](WeatherPeriod.html)
3. [StrLerpVal](WeatherPeriod.StrLerpVal.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Entry](#Entry)
   2. [Target](#Target)
   3. [NextTarget](#NextTarget)
   4. [None](#None)
8. [Field Details](#field-detail)
   1. [value](#value)
9. [Constructor Details](#constructor-detail)
   1. [StrLerpVal(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getValue()](#getValue())
    4. [fromValue(int)](#fromValue(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class WeatherPeriod.StrLerpVal
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather")>

zombie.iso.weather.WeatherPeriod.StrLerpVal

All Implemented Interfaces:
:   `Serializable, Comparable<WeatherPeriod.StrLerpVal>, Constable`

Enclosing class:
:   `WeatherPeriod`

---

public static enum WeatherPeriod.StrLerpVal
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Entry`

  `NextTarget`

  `None`

  `Target`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StrLerpVal(int value)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static WeatherPeriod.StrLerpVal`

  `fromValue(int id)`

  `int`

  `getValue()`

  `static WeatherPeriod.StrLerpVal`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static WeatherPeriod.StrLerpVal[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Entry

    public static final [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") Entry
  + ### Target

    public static final [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") Target
  + ### NextTarget

    public static final [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") NextTarget
  + ### None

    public static final [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") None
* Field Details
  -------------

  + ### value

    private final int value
* Constructor Details
  -------------------

  + ### StrLerpVal

    private StrLerpVal(int value)
* Method Details
  --------------

  + ### values

    public static [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getValue

    public int getValue()
  + ### fromValue

    public static [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") fromValue(int id)