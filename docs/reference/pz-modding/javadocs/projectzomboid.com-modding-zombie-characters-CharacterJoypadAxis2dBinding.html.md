[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Movement](#Movement)
   2. [Aiming](#Aiming)
8. [Field Details](#field-detail)
   1. [defaultBinding](#defaultBinding)
   2. [binding](#binding)
   3. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [CharacterJoypadAxis2dBinding(JoypadAxis2d)](#%3Cinit%3E(zombie.input.JoypadAxis2d))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getNameTranslationKey()](#getNameTranslationKey())
    4. [allBindings()](#allBindings())
    5. [fromString(String)](#fromString(java.lang.String))
    6. [getJoypadAxis()](#getJoypadAxis())
    7. [getBinding()](#getBinding())
    8. [setBinding(JoypadAxis2d)](#setBinding(zombie.input.JoypadAxis2d))
    9. [removeBinding(JoypadAxis2d)](#removeBinding(zombie.input.JoypadAxis2d))
    10. [moveBindingFrom(CharacterJoypadAxis2dBinding)](#moveBindingFrom(zombie.characters.CharacterJoypadAxis2dBinding))
    11. [setDefault()](#setDefault())
    12. [setAllToDefault()](#setAllToDefault())
    13. [getLength(int)](#getLength(int))
    14. [getValue(int, Vector2)](#getValue(int,zombie.iso.Vector2))
    15. [getValueX(int)](#getValueX(int))
    16. [getValueY(int)](#getValueY(int))
    17. [isApplied(int)](#isApplied(int))
    18. [findBindings(JoypadAxis2d)](#findBindings(zombie.input.JoypadAxis2d))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CharacterJoypadAxis2dBinding
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")>

zombie.characters.CharacterJoypadAxis2dBinding

All Implemented Interfaces:
:   `Serializable, Comparable<CharacterJoypadAxis2dBinding>, Constable`

---

public enum CharacterJoypadAxis2dBinding
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Aiming`

  `Movement`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private JoypadAxis2d`

  `binding`

  `private final JoypadAxis2d`

  `defaultBinding`

  `private static final CharacterJoypadAxis2dBinding[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CharacterJoypadAxis2dBinding(JoypadAxis2d axisBinding)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CharacterJoypadAxis2dBinding[]`

  `allBindings()`

  `static CharacterJoypadAxis2dBinding[]`

  `findBindings(JoypadAxis2d joypadAxis)`

  `static CharacterJoypadAxis2dBinding`

  `fromString(String name)`

  `JoypadAxis2d`

  `getBinding()`

  `JoypadAxis2d`

  `getJoypadAxis()`

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

  `void`

  `moveBindingFrom(CharacterJoypadAxis2dBinding fromBinding)`

  `void`

  `removeBinding(JoypadAxis2d binding)`

  `static void`

  `setAllToDefault()`

  `void`

  `setBinding(JoypadAxis2d newBinding)`

  `void`

  `setDefault()`

  `static CharacterJoypadAxis2dBinding`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CharacterJoypadAxis2dBinding[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Movement

    public static final [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") Movement
  + ### Aiming

    public static final [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") Aiming
* Field Details
  -------------

  + ### defaultBinding

    private final [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") defaultBinding
  + ### binding

    private [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") binding
  + ### values

    private static final [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")[] values
* Constructor Details
  -------------------

  + ### CharacterJoypadAxis2dBinding

    private CharacterJoypadAxis2dBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axisBinding)
* Method Details
  --------------

  + ### values

    public static [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### allBindings

    public static [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")[] allBindings()
  + ### fromString

    public static [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getJoypadAxis

    public [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") getJoypadAxis()
  + ### getBinding

    public [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") getBinding()
  + ### setBinding

    public void setBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") newBinding)
  + ### removeBinding

    public void removeBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") binding)
  + ### moveBindingFrom

    public void moveBindingFrom([CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") fromBinding)
  + ### setDefault

    public void setDefault()
  + ### setAllToDefault

    public static void setAllToDefault()
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
  + ### findBindings

    public static [CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")[] findBindings([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") joypadAxis)