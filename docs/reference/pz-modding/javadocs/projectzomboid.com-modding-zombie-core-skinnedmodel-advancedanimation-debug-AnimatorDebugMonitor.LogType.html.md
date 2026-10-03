[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.advancedanimation.debug](package-summary.html)
2. [AnimatorDebugMonitor](AnimatorDebugMonitor.html)
3. [LogType](AnimatorDebugMonitor.LogType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [DEFAULT](#DEFAULT)
   2. [LAYER](#LAYER)
   3. [NODE](#NODE)
   4. [TRACK](#TRACK)
   5. [VAR](#VAR)
   6. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [val](#val)
9. [Constructor Details](#constructor-detail)
   1. [LogType(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [value()](#value())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Enum Class AnimatorDebugMonitor.LogType
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug")>

zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.LogType

All Implemented Interfaces:
:   `Serializable, Comparable<AnimatorDebugMonitor.LogType>, Constable`

Enclosing class:
:   `AnimatorDebugMonitor`

---

private static enum AnimatorDebugMonitor.LogType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `DEFAULT`

  `LAYER`

  `MAX`

  `NODE`

  `TRACK`

  `VAR`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `val`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `LogType(int value)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `value()`

  `static AnimatorDebugMonitor.LogType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static AnimatorDebugMonitor.LogType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### DEFAULT

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") DEFAULT
  + ### LAYER

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") LAYER
  + ### NODE

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") NODE
  + ### TRACK

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") TRACK
  + ### VAR

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") VAR
  + ### MAX

    public static final [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") MAX
* Field Details
  -------------

  + ### val

    private final int val
* Constructor Details
  -------------------

  + ### LogType

    private LogType(int value)
* Method Details
  --------------

  + ### values

    public static [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### value

    public int value()