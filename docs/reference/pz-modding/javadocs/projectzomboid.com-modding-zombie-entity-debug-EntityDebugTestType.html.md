[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.debug](package-summary.html)
2. [EntityDebugTestType](EntityDebugTestType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [BaseTest](#BaseTest)
8. [Field Details](#field-detail)
   1. [typeList](#typeList)
9. [Constructor Details](#constructor-detail)
   1. [EntityDebugTestType()](#%3Cinit%3E())
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getValueList()](#getValueList())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class EntityDebugTestType
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug")>

zombie.entity.debug.EntityDebugTestType

All Implemented Interfaces:
:   `Serializable, Comparable<EntityDebugTestType>, Constable`

---

public enum EntityDebugTestType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `BaseTest`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<EntityDebugTestType>`

  `typeList`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EntityDebugTestType()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<EntityDebugTestType>`

  `getValueList()`

  `static EntityDebugTestType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static EntityDebugTestType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### BaseTest

    public static final [EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug") BaseTest
* Field Details
  -------------

  + ### typeList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug")> typeList
* Constructor Details
  -------------------

  + ### EntityDebugTestType

    private EntityDebugTestType()
* Method Details
  --------------

  + ### values

    public static [EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getValueList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug")> getValueList()