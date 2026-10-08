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
3. [CachedRecipeComparator](BaseCraftingLogic.CachedRecipeComparator.html)
4. [CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [NAME](#NAME)
   2. [LAST\_USED](#LAST_USED)
   3. [MOST\_USED](#MOST_USED)
7. [Constructor Details](#constructor-detail)
   1. [CompareMode()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class BaseCraftingLogic.CachedRecipeComparator.CompareMode
===============================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting")>

zombie.entity.components.crafting.BaseCraftingLogic.CachedRecipeComparator.CompareMode

All Implemented Interfaces:
:   `Serializable, Comparable<BaseCraftingLogic.CachedRecipeComparator.CompareMode>, Constable`

Enclosing class:
:   `BaseCraftingLogic.CachedRecipeComparator`

---

public static enum BaseCraftingLogic.CachedRecipeComparator.CompareMode
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `LAST_USED`

  `MOST_USED`

  `NAME`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CompareMode()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BaseCraftingLogic.CachedRecipeComparator.CompareMode`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BaseCraftingLogic.CachedRecipeComparator.CompareMode[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### NAME

    public static final [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") NAME
  + ### LAST\_USED

    public static final [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") LAST\_USED
  + ### MOST\_USED

    public static final [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") MOST\_USED
* Constructor Details
  -------------------

  + ### CompareMode

    private CompareMode()
* Method Details
  --------------

  + ### values

    public static [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BaseCraftingLogic.CachedRecipeComparator.CompareMode](BaseCraftingLogic.CachedRecipeComparator.CompareMode.html "enum class in zombie.entity.components.crafting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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