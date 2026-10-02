[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeValueType](AttributeValueType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Boolean](#Boolean)
   2. [String](#String)
   3. [Float](#Float)
   4. [Double](#Double)
   5. [Byte](#Byte)
   6. [Short](#Short)
   7. [Int](#Int)
   8. [Long](#Long)
   9. [Enum](#Enum)
   10. [EnumSet](#EnumSet)
   11. [EnumStringSet](#EnumStringSet)
8. [Field Details](#field-detail)
   1. [numerics](#numerics)
   2. [decimals](#decimals)
   3. [byteIndex](#byteIndex)
9. [Constructor Details](#constructor-detail)
   1. [AttributeValueType(byte)](#%3Cinit%3E(byte))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getByteIndex()](#getByteIndex())
    4. [IsNumeric(AttributeValueType)](#IsNumeric(zombie.entity.components.attributes.AttributeValueType))
    5. [IsDecimal(AttributeValueType)](#IsDecimal(zombie.entity.components.attributes.AttributeValueType))
    6. [fromByteIndex(int)](#fromByteIndex(int))
    7. [valueOfIgnoreCase(String)](#valueOfIgnoreCase(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class AttributeValueType
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes")>

zombie.entity.components.attributes.AttributeValueType

All Implemented Interfaces:
:   `Serializable, Comparable<AttributeValueType>, Constable`

---

public enum AttributeValueType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Boolean`

  `Byte`

  `Double`

  `Enum`

  `EnumSet`

  `EnumStringSet`

  `Float`

  `Int`

  `Long`

  `Short`

  `String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final byte`

  `byteIndex`

  `private static final EnumSet<AttributeValueType>`

  `decimals`

  `private static final EnumSet<AttributeValueType>`

  `numerics`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AttributeValueType(byte index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AttributeValueType`

  `fromByteIndex(int value)`

  `int`

  `getByteIndex()`

  `static boolean`

  `IsDecimal(AttributeValueType valueType)`

  `static boolean`

  `IsNumeric(AttributeValueType valueType)`

  `static AttributeValueType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static AttributeValueType`

  `valueOfIgnoreCase(String s)`

  `static AttributeValueType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Boolean

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Boolean
  + ### String

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") String
  + ### Float

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Float
  + ### Double

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Double
  + ### Byte

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Byte
  + ### Short

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Short
  + ### Int

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Int
  + ### Long

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Long
  + ### Enum

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") Enum
  + ### EnumSet

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") EnumSet
  + ### EnumStringSet

    public static final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") EnumStringSet
* Field Details
  -------------

  + ### numerics

    private static final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes")> numerics
  + ### decimals

    private static final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes")> decimals
  + ### byteIndex

    private final byte byteIndex
* Constructor Details
  -------------------

  + ### AttributeValueType

    private AttributeValueType(byte index)
* Method Details
  --------------

  + ### values

    public static [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getByteIndex

    public int getByteIndex()
  + ### IsNumeric

    public static boolean IsNumeric([AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") valueType)
  + ### IsDecimal

    public static boolean IsDecimal([AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") valueType)
  + ### fromByteIndex

    public static [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") fromByteIndex(int value)
  + ### valueOfIgnoreCase

    public static [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") valueOfIgnoreCase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)