[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Colors](Colors.html)
3. [ColorSet](Colors.ColorSet.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Game](#Game)
   2. [Standard](#Standard)
   3. [ColorBlind](#ColorBlind)
8. [Field Details](#field-detail)
   1. [index](#index)
9. [Constructor Details](#constructor-detail)
   1. [ColorSet(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getIndex()](#getIndex())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class Colors.ColorSet
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core")>

zombie.core.Colors.ColorSet

All Implemented Interfaces:
:   `Serializable, Comparable<Colors.ColorSet>, Constable`

Enclosing class:
:   `Colors`

---

public static enum Colors.ColorSet
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ColorBlind`

  `Game`

  `Standard`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final int`

  `index`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ColorSet(int index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getIndex()`

  `static Colors.ColorSet`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Colors.ColorSet[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Game

    public static final [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") Game
  + ### Standard

    public static final [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") Standard
  + ### ColorBlind

    public static final [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") ColorBlind
* Field Details
  -------------

  + ### index

    final int index
* Constructor Details
  -------------------

  + ### ColorSet

    private ColorSet(int index)
* Method Details
  --------------

  + ### values

    public static [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getIndex

    public int getIndex()