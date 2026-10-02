[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [WallCoveringType](WallCoveringType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [PAINT\_THUMP](#PAINT_THUMP)
   2. [PAINT\_SIGN](#PAINT_SIGN)
   3. [PLASTER](#PLASTER)
   4. [WALLPAPER](#WALLPAPER)
8. [Field Details](#field-detail)
   1. [typeString](#typeString)
9. [Constructor Details](#constructor-detail)
   1. [WallCoveringType(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [toString()](#toString())
    4. [typeOf(String)](#typeOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class WallCoveringType
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects")>

zombie.scripting.objects.WallCoveringType

All Implemented Interfaces:
:   `Serializable, Comparable<WallCoveringType>, Constable`

---

public enum WallCoveringType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `PAINT_SIGN`

  `PAINT_THUMP`

  `PLASTER`

  `WALLPAPER`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `typeString`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WallCoveringType(String typeString)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `toString()`

  `static WallCoveringType`

  `typeOf(String typeString)`

  `static WallCoveringType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static WallCoveringType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### PAINT\_THUMP

    public static final [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") PAINT\_THUMP
  + ### PAINT\_SIGN

    public static final [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") PAINT\_SIGN
  + ### PLASTER

    public static final [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") PLASTER
  + ### WALLPAPER

    public static final [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") WALLPAPER
* Field Details
  -------------

  + ### typeString

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") typeString
* Constructor Details
  -------------------

  + ### WallCoveringType

    private WallCoveringType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") typeString)
* Method Details
  --------------

  + ### values

    public static [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Enum<WallCoveringType>`
  + ### typeOf

    public static [WallCoveringType](WallCoveringType.html "enum class in zombie.scripting.objects") typeOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") typeString)