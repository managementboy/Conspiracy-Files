[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [BaseCraftingLogic](BaseCraftingLogic.html)
3. [FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [EXACT](#EXACT)
   2. [STARTSWITH](#STARTSWITH)
   3. [PARTS\_ALL\_EXACT](#PARTS_ALL_EXACT)
   4. [PARTS\_ALL\_STARTWITH](#PARTS_ALL_STARTWITH)
   5. [CONTAINS](#CONTAINS)
   6. [NONE](#NONE)
7. [Constructor Details](#constructor-detail)
   1. [FilterStringMatchType()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class BaseCraftingLogic.FilterStringMatchType
==================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting")>

zombie.entity.components.crafting.BaseCraftingLogic.FilterStringMatchType

All Implemented Interfaces:
:   `Serializable, Comparable<BaseCraftingLogic.FilterStringMatchType>, Constable`

Enclosing class:
:   `BaseCraftingLogic`

---

static enum BaseCraftingLogic.FilterStringMatchType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting")>

Filter string match type - to assist with ordering of search results by match exactness

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `CONTAINS`

  `EXACT`

  `NONE`

  `PARTS_ALL_EXACT`

  `PARTS_ALL_STARTWITH`

  `STARTSWITH`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FilterStringMatchType()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BaseCraftingLogic.FilterStringMatchType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BaseCraftingLogic.FilterStringMatchType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### EXACT

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") EXACT
  + ### STARTSWITH

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") STARTSWITH
  + ### PARTS\_ALL\_EXACT

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") PARTS\_ALL\_EXACT
  + ### PARTS\_ALL\_STARTWITH

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") PARTS\_ALL\_STARTWITH
  + ### CONTAINS

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") CONTAINS
  + ### NONE

    public static final [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") NONE
* Constructor Details
  -------------------

  + ### FilterStringMatchType

    private FilterStringMatchType()
* Method Details
  --------------

  + ### values

    public static [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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