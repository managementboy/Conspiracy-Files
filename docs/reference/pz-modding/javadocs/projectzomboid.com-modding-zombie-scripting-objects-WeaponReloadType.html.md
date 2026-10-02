[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [WeaponReloadType](WeaponReloadType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [NONE](#NONE)
   2. [BOLT\_ACTION](#BOLT_ACTION)
   3. [BOLT\_ACTION\_NO\_MAG](#BOLT_ACTION_NO_MAG)
   4. [DOUBLE\_BARREL\_SHOTGUN](#DOUBLE_BARREL_SHOTGUN)
   5. [DOUBLE\_BARREL\_SHOTGUN\_SAWN](#DOUBLE_BARREL_SHOTGUN_SAWN)
   6. [HANDGUN](#HANDGUN)
   7. [LEVER\_ACTION](#LEVER_ACTION)
   8. [REVOLVER](#REVOLVER)
   9. [SHOTGUN](#SHOTGUN)
8. [Field Details](#field-detail)
   1. [id](#id)
9. [Constructor Details](#constructor-detail)
   1. [WeaponReloadType(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [toString()](#toString())
    4. [fromValue(String)](#fromValue(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class WeaponReloadType
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects")>

zombie.scripting.objects.WeaponReloadType

All Implemented Interfaces:
:   `Serializable, Comparable<WeaponReloadType>, Constable`

---

public enum WeaponReloadType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `BOLT_ACTION`

  `BOLT_ACTION_NO_MAG`

  `DOUBLE_BARREL_SHOTGUN`

  `DOUBLE_BARREL_SHOTGUN_SAWN`

  `HANDGUN`

  `LEVER_ACTION`

  `NONE`

  `REVOLVER`

  `SHOTGUN`
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

  `WeaponReloadType(String id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static WeaponReloadType`

  `fromValue(String value)`

  `String`

  `toString()`

  `static WeaponReloadType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static WeaponReloadType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### NONE

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") NONE
  + ### BOLT\_ACTION

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") BOLT\_ACTION
  + ### BOLT\_ACTION\_NO\_MAG

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") BOLT\_ACTION\_NO\_MAG
  + ### DOUBLE\_BARREL\_SHOTGUN

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") DOUBLE\_BARREL\_SHOTGUN
  + ### DOUBLE\_BARREL\_SHOTGUN\_SAWN

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") DOUBLE\_BARREL\_SHOTGUN\_SAWN
  + ### HANDGUN

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") HANDGUN
  + ### LEVER\_ACTION

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") LEVER\_ACTION
  + ### REVOLVER

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") REVOLVER
  + ### SHOTGUN

    public static final [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") SHOTGUN
* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
* Constructor Details
  -------------------

  + ### WeaponReloadType

    private WeaponReloadType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### values

    public static [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
    :   `toString` in class `Enum<WeaponReloadType>`
  + ### fromValue

    public static [WeaponReloadType](WeaponReloadType.html "enum class in zombie.scripting.objects") fromValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)