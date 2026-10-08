[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.combat](package-summary.html)
2. [CombatConfigCategory](CombatConfigCategory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [GENERAL](#GENERAL)
   2. [FIREARM](#FIREARM)
   3. [MELEE](#MELEE)
   4. [BALLISTICS](#BALLISTICS)
7. [Constructor Details](#constructor-detail)
   1. [CombatConfigCategory()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CombatConfigCategory
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat")>

zombie.combat.CombatConfigCategory

All Implemented Interfaces:
:   `Serializable, Comparable<CombatConfigCategory>, Constable`

---

public enum CombatConfigCategory
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `BALLISTICS`

  `FIREARM`

  `GENERAL`

  `MELEE`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CombatConfigCategory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CombatConfigCategory`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CombatConfigCategory[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### GENERAL

    public static final [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") GENERAL
  + ### FIREARM

    public static final [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") FIREARM
  + ### MELEE

    public static final [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") MELEE
  + ### BALLISTICS

    public static final [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") BALLISTICS
* Constructor Details
  -------------------

  + ### CombatConfigCategory

    private CombatConfigCategory()
* Method Details
  --------------

  + ### values

    public static [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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