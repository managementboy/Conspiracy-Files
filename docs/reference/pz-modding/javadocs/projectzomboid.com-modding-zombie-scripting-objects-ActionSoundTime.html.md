[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ActionSoundTime](ActionSoundTime.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [ACTION\_START](#ACTION_START)
   2. [ANIMATION\_EVENT](#ANIMATION_EVENT)
   3. [ANIMATION\_START](#ANIMATION_START)
8. [Field Details](#field-detail)
   1. [id](#id)
9. [Constructor Details](#constructor-detail)
   1. [ActionSoundTime(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [toString()](#toString())
    4. [fromValue(String)](#fromValue(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class ActionSoundTime
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects")>

zombie.scripting.objects.ActionSoundTime

All Implemented Interfaces:
:   `Serializable, Comparable<ActionSoundTime>, Constable`

---

public enum ActionSoundTime
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ACTION_START`

  `ANIMATION_EVENT`

  `ANIMATION_START`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `id`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ActionSoundTime(String id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ActionSoundTime`

  `fromValue(String value)`

  `String`

  `toString()`

  `static ActionSoundTime`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ActionSoundTime[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### ACTION\_START

    public static final [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") ACTION\_START
  + ### ANIMATION\_EVENT

    public static final [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") ANIMATION\_EVENT
  + ### ANIMATION\_START

    public static final [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") ANIMATION\_START
* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
* Constructor Details
  -------------------

  + ### ActionSoundTime

    private ActionSoundTime([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### values

    public static [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
    :   `toString` in class `Enum<ActionSoundTime>`
  + ### fromValue

    public static [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") fromValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)