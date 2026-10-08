[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [ResourceType](ResourceType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Item](#Item)
   2. [Fluid](#Fluid)
   3. [Energy](#Energy)
   4. [Any](#Any)
8. [Field Details](#field-detail)
   1. [id](#id)
9. [Constructor Details](#constructor-detail)
   1. [ResourceType(byte)](#%3Cinit%3E(byte))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getId()](#getId())
    4. [fromId(byte)](#fromId(byte))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class ResourceType
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ResourceType](ResourceType.html "enum class in zombie.entity.components.resources")>

zombie.entity.components.resources.ResourceType

All Implemented Interfaces:
:   `Serializable, Comparable<ResourceType>, Constable`

---

public enum ResourceType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ResourceType](ResourceType.html "enum class in zombie.entity.components.resources")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Any`

  `Energy`

  `Fluid`

  `Item`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final byte`

  `id`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ResourceType(byte id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ResourceType`

  `fromId(byte id)`

  `byte`

  `getId()`

  `static ResourceType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ResourceType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Item

    public static final [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") Item
  + ### Fluid

    public static final [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") Fluid
  + ### Energy

    public static final [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") Energy
  + ### Any

    public static final [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") Any
* Field Details
  -------------

  + ### id

    private final byte id
* Constructor Details
  -------------------

  + ### ResourceType

    private ResourceType(byte id)
* Method Details
  --------------

  + ### values

    public static [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getId

    public byte getId()
  + ### fromId

    public static [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") fromId(byte id)