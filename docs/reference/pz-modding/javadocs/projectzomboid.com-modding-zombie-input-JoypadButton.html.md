[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.input](package-summary.html)
2. [JoypadButton](JoypadButton.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [A](#A)
   2. [B](#B)
   3. [X](#X)
   4. [Y](#Y)
   5. [LeftStick](#LeftStick)
   6. [RightStick](#RightStick)
   7. [LeftBump](#LeftBump)
   8. [RightBump](#RightBump)
   9. [Back](#Back)
   10. [Start](#Start)
   11. [Guide](#Guide)
   12. [DPadLeft](#DPadLeft)
   13. [DPadRight](#DPadRight)
   14. [DPadUp](#DPadUp)
   15. [DPadDown](#DPadDown)
8. [Field Details](#field-detail)
   1. [buttonDownSupplier](#buttonDownSupplier)
   2. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [JoypadButton(IsButtonDownSupplier)](#%3Cinit%3E(zombie.input.IsButtonDownSupplier))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [isDown(int)](#isDown(int))
    4. [getNameTranslationKey()](#getNameTranslationKey())
    5. [getButtonCount()](#getButtonCount())
    6. [isButtonDown(int, int)](#isButtonDown(int,int))
    7. [getButtons()](#getButtons())
    8. [fromIndex(int)](#fromIndex(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class JoypadButton
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadButton](JoypadButton.html "enum class in zombie.input")>

zombie.input.JoypadButton

All Implemented Interfaces:
:   `Serializable, Comparable<JoypadButton>, Constable`

---

public enum JoypadButton
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[JoypadButton](JoypadButton.html "enum class in zombie.input")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `A`

  `B`

  `Back`

  `DPadDown`

  `DPadLeft`

  `DPadRight`

  `DPadUp`

  `Guide`

  `LeftBump`

  `LeftStick`

  `RightBump`

  `RightStick`

  `Start`

  `X`

  `Y`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.input.IsButtonDownSupplier`

  `buttonDownSupplier`

  `private static final JoypadButton[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `JoypadButton(zombie.input.IsButtonDownSupplier buttonDownSupplier)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static JoypadButton`

  `fromIndex(int buttonIdx)`

  `static int`

  `getButtonCount()`

  `static JoypadButton[]`

  `getButtons()`

  `String`

  `getNameTranslationKey()`

  `static boolean`

  `isButtonDown(int joypadBind,
  int buttonIdx)`

  `boolean`

  `isDown(int joypadBind)`

  `static JoypadButton`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static JoypadButton[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### A

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") A
  + ### B

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") B
  + ### X

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") X
  + ### Y

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") Y
  + ### LeftStick

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") LeftStick
  + ### RightStick

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") RightStick
  + ### LeftBump

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") LeftBump
  + ### RightBump

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") RightBump
  + ### Back

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") Back
  + ### Start

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") Start
  + ### Guide

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") Guide
  + ### DPadLeft

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") DPadLeft
  + ### DPadRight

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") DPadRight
  + ### DPadUp

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") DPadUp
  + ### DPadDown

    public static final [JoypadButton](JoypadButton.html "enum class in zombie.input") DPadDown
* Field Details
  -------------

  + ### buttonDownSupplier

    private final zombie.input.IsButtonDownSupplier buttonDownSupplier
  + ### values

    private static final [JoypadButton](JoypadButton.html "enum class in zombie.input")[] values
* Constructor Details
  -------------------

  + ### JoypadButton

    private JoypadButton(zombie.input.IsButtonDownSupplier buttonDownSupplier)
* Method Details
  --------------

  + ### values

    public static [JoypadButton](JoypadButton.html "enum class in zombie.input")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [JoypadButton](JoypadButton.html "enum class in zombie.input") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### isDown

    public boolean isDown(int joypadBind)
  + ### getNameTranslationKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameTranslationKey()
  + ### getButtonCount

    public static int getButtonCount()
  + ### isButtonDown

    public static boolean isButtonDown(int joypadBind,
    int buttonIdx)
  + ### getButtons

    public static [JoypadButton](JoypadButton.html "enum class in zombie.input")[] getButtons()
  + ### fromIndex

    public static [JoypadButton](JoypadButton.html "enum class in zombie.input") fromIndex(int buttonIdx)