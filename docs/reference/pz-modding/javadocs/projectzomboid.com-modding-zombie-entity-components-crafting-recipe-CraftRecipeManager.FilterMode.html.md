[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeManager](CraftRecipeManager.html)
3. [FilterMode](CraftRecipeManager.FilterMode.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Name](#Name)
   2. [ModName](#ModName)
   3. [Tags](#Tags)
   4. [InputName](#InputName)
   5. [OutputName](#OutputName)
7. [Constructor Details](#constructor-detail)
   1. [FilterMode()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Enum Class CraftRecipeManager.FilterMode
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe")>

zombie.entity.components.crafting.recipe.CraftRecipeManager.FilterMode

All Implemented Interfaces:
:   `Serializable, Comparable<CraftRecipeManager.FilterMode>, Constable`

Enclosing class:
:   `CraftRecipeManager`

---

public static enum CraftRecipeManager.FilterMode
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `InputName`

  `ModName`

  `Name`

  `OutputName`

  `Tags`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FilterMode()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CraftRecipeManager.FilterMode`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CraftRecipeManager.FilterMode[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Name

    public static final [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") Name
  + ### ModName

    public static final [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") ModName
  + ### Tags

    public static final [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") Tags
  + ### InputName

    public static final [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") InputName
  + ### OutputName

    public static final [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") OutputName
* Constructor Details
  -------------------

  + ### FilterMode

    private FilterMode()
* Method Details
  --------------

  + ### values

    public static [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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