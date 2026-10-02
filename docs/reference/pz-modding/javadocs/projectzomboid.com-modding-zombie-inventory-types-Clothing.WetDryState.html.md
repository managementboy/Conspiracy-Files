[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Clothing](Clothing.html)
3. [WetDryState](Clothing.WetDryState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Invalid](#Invalid)
   2. [Dryer](#Dryer)
   3. [Wetter](#Wetter)
7. [Constructor Details](#constructor-detail)
   1. [WetDryState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class Clothing.WetDryState
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types")>

zombie.inventory.types.Clothing.WetDryState

All Implemented Interfaces:
:   `Serializable, Comparable<Clothing.WetDryState>, Constable`

Enclosing class:
:   `Clothing`

---

private static enum Clothing.WetDryState
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Dryer`

  `Invalid`

  `Wetter`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WetDryState()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Clothing.WetDryState`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Clothing.WetDryState[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Invalid

    public static final [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types") Invalid
  + ### Dryer

    public static final [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types") Dryer
  + ### Wetter

    public static final [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types") Wetter
* Constructor Details
  -------------------

  + ### WetDryState

    private WetDryState()
* Method Details
  --------------

  + ### values

    public static [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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