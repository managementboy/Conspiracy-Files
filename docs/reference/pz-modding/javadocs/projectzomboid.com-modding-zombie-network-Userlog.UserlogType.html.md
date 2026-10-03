[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [Userlog](Userlog.html)
3. [UserlogType](Userlog.UserlogType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [AdminLog](#AdminLog)
   2. [Kicked](#Kicked)
   3. [Banned](#Banned)
   4. [DupeItem](#DupeItem)
   5. [LuaChecksum](#LuaChecksum)
   6. [WarningPoint](#WarningPoint)
   7. [UnauthorizedPacket](#UnauthorizedPacket)
   8. [SuspiciousActivity](#SuspiciousActivity)
8. [Field Details](#field-detail)
   1. [index](#index)
9. [Constructor Details](#constructor-detail)
   1. [UserlogType(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [index()](#index())
    4. [fromIndex(int)](#fromIndex(int))
    5. [FromString(String)](#FromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class Userlog.UserlogType
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network")>

zombie.network.Userlog.UserlogType

All Implemented Interfaces:
:   `Serializable, Comparable<Userlog.UserlogType>, Constable`

Enclosing class:
:   `Userlog`

---

public static enum Userlog.UserlogType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AdminLog`

  `Banned`

  `DupeItem`

  `Kicked`

  `LuaChecksum`

  `SuspiciousActivity`

  `UnauthorizedPacket`

  `WarningPoint`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `index`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `UserlogType(int index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Userlog.UserlogType`

  `fromIndex(int value)`

  `static Userlog.UserlogType`

  `FromString(String str)`

  `int`

  `index()`

  `static Userlog.UserlogType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Userlog.UserlogType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### AdminLog

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") AdminLog
  + ### Kicked

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") Kicked
  + ### Banned

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") Banned
  + ### DupeItem

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") DupeItem
  + ### LuaChecksum

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") LuaChecksum
  + ### WarningPoint

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") WarningPoint
  + ### UnauthorizedPacket

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") UnauthorizedPacket
  + ### SuspiciousActivity

    public static final [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") SuspiciousActivity
* Field Details
  -------------

  + ### index

    private final int index
* Constructor Details
  -------------------

  + ### UserlogType

    private UserlogType(int index)
* Method Details
  --------------

  + ### values

    public static [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### index

    public int index()
  + ### fromIndex

    public static [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") fromIndex(int value)
  + ### FromString

    public static [Userlog.UserlogType](Userlog.UserlogType.html "enum class in zombie.network") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)