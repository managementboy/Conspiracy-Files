[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.radio](package-summary.html)
2. [ChannelCategory](ChannelCategory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Undefined](#Undefined)
   2. [Radio](#Radio)
   3. [Television](#Television)
   4. [Military](#Military)
   5. [Amateur](#Amateur)
   6. [Bandit](#Bandit)
   7. [Emergency](#Emergency)
   8. [Other](#Other)
7. [Constructor Details](#constructor-detail)
   1. [ChannelCategory()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class ChannelCategory
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ChannelCategory](ChannelCategory.html "enum class in zombie.radio")>

zombie.radio.ChannelCategory

All Implemented Interfaces:
:   `Serializable, Comparable<ChannelCategory>, Constable`

---

public enum ChannelCategory
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ChannelCategory](ChannelCategory.html "enum class in zombie.radio")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Amateur`

  `Bandit`

  `Emergency`

  `Military`

  `Other`

  `Radio`

  `Television`

  `Undefined`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ChannelCategory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ChannelCategory`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ChannelCategory[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Undefined

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Undefined
  + ### Radio

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Radio
  + ### Television

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Television
  + ### Military

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Military
  + ### Amateur

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Amateur
  + ### Bandit

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Bandit
  + ### Emergency

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Emergency
  + ### Other

    public static final [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") Other
* Constructor Details
  -------------------

  + ### ChannelCategory

    private ChannelCategory()
* Method Details
  --------------

  + ### values

    public static [ChannelCategory](ChannelCategory.html "enum class in zombie.radio")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ChannelCategory](ChannelCategory.html "enum class in zombie.radio") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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