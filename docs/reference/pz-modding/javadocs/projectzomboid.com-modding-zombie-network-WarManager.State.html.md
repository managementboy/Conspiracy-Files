[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [WarManager](WarManager.html)
3. [State](WarManager.State.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Ended](#Ended)
   2. [Started](#Started)
   3. [Blocked](#Blocked)
   4. [Refused](#Refused)
   5. [Claimed](#Claimed)
   6. [Accepted](#Accepted)
   7. [Canceled](#Canceled)
8. [Field Details](#field-detail)
   1. [next](#next)
9. [Constructor Details](#constructor-detail)
   1. [State(WarManager.State)](#%3Cinit%3E(zombie.network.WarManager.State))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [valueOf(int)](#valueOf(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class WarManager.State
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WarManager.State](WarManager.State.html "enum class in zombie.network")>

zombie.network.WarManager.State

All Implemented Interfaces:
:   `Serializable, Comparable<WarManager.State>, Constable`

Enclosing class:
:   `WarManager`

---

public static enum WarManager.State
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WarManager.State](WarManager.State.html "enum class in zombie.network")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Accepted`

  `Blocked`

  `Canceled`

  `Claimed`

  `Ended`

  `Refused`

  `Started`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final WarManager.State`

  `next`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `State(WarManager.State next)`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static WarManager.State`

  `valueOf(int ordinal)`

  Returns the enum constant of this class with the specified name.

  `static WarManager.State`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static WarManager.State[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Ended

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Ended
  + ### Started

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Started
  + ### Blocked

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Blocked
  + ### Refused

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Refused
  + ### Claimed

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Claimed
  + ### Accepted

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Accepted
  + ### Canceled

    public static final [WarManager.State](WarManager.State.html "enum class in zombie.network") Canceled
* Field Details
  -------------

  + ### next

    private final [WarManager.State](WarManager.State.html "enum class in zombie.network") next
* Constructor Details
  -------------------

  + ### State

    private State([WarManager.State](WarManager.State.html "enum class in zombie.network") next)
* Method Details
  --------------

  + ### values

    public static [WarManager.State](WarManager.State.html "enum class in zombie.network")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [WarManager.State](WarManager.State.html "enum class in zombie.network") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### valueOf

    public static [WarManager.State](WarManager.State.html "enum class in zombie.network") valueOf(int ordinal)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `ordinal` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null