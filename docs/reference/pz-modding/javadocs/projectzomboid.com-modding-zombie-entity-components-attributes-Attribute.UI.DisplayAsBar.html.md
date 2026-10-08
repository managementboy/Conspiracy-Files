[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [Attribute](Attribute.html)
3. [UI](Attribute.UI.html)
4. [DisplayAsBar](Attribute.UI.DisplayAsBar.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Default](#Default)
   2. [ForceIfBounds](#ForceIfBounds)
   3. [Never](#Never)
7. [Constructor Details](#constructor-detail)
   1. [DisplayAsBar()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class Attribute.UI.DisplayAsBar
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes")>

zombie.entity.components.attributes.Attribute.UI.DisplayAsBar

All Implemented Interfaces:
:   `Serializable, Comparable<Attribute.UI.DisplayAsBar>, Constable`

Enclosing class:
:   `Attribute.UI`

---

public static enum Attribute.UI.DisplayAsBar
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Default`

  `ForceIfBounds`

  `Never`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DisplayAsBar()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Attribute.UI.DisplayAsBar`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Attribute.UI.DisplayAsBar[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Default

    public static final [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") Default
  + ### ForceIfBounds

    public static final [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") ForceIfBounds
  + ### Never

    public static final [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") Never
* Constructor Details
  -------------------

  + ### DisplayAsBar

    private DisplayAsBar()
* Method Details
  --------------

  + ### values

    public static [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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