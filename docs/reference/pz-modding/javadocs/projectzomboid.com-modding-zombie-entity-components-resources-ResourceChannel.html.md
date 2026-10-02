[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [ResourceChannel](ResourceChannel.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [NO\_CHANNEL](#NO_CHANNEL)
   2. [Channel\_Red](#Channel_Red)
   3. [Channel\_Yellow](#Channel_Yellow)
   4. [Channel\_Blue](#Channel_Blue)
   5. [Channel\_Orange](#Channel_Orange)
   6. [Channel\_Green](#Channel_Green)
   7. [Channel\_Purple](#Channel_Purple)
   8. [Channel\_Cyan](#Channel_Cyan)
   9. [Channel\_Magenta](#Channel_Magenta)
8. [Field Details](#field-detail)
   1. [BitStoreAll](#BitStoreAll)
   2. [id](#id)
   3. [bits](#bits)
   4. [color](#color)
9. [Constructor Details](#constructor-detail)
   1. [ResourceChannel(byte, int, Color)](#%3Cinit%3E(byte,int,zombie.core.Color))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getByteId()](#getByteId())
    4. [getBits()](#getBits())
    5. [getColor()](#getColor())
    6. [fromId(byte)](#fromId(byte))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class ResourceChannel
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")>

zombie.entity.components.resources.ResourceChannel

All Implemented Interfaces:
:   `Serializable, Comparable<ResourceChannel>, Constable, zombie.entity.util.enums.IOEnum`

---

public enum ResourceChannel
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")>
implements zombie.entity.util.enums.IOEnum

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Channel_Blue`

  `Channel_Cyan`

  `Channel_Green`

  `Channel_Magenta`

  `Channel_Orange`

  `Channel_Purple`

  `Channel_Red`

  `Channel_Yellow`

  `NO_CHANNEL`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `bits`

  `static final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `BitStoreAll`

  `private final Color`

  `color`

  `private final byte`

  `id`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ResourceChannel(byte id,
  int bits,
  Color color)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ResourceChannel`

  `fromId(byte id)`

  `int`

  `getBits()`

  `byte`

  `getByteId()`

  `Color`

  `getColor()`

  `static ResourceChannel`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ResourceChannel[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### NO\_CHANNEL

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") NO\_CHANNEL
  + ### Channel\_Red

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Red
  + ### Channel\_Yellow

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Yellow
  + ### Channel\_Blue

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Blue
  + ### Channel\_Orange

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Orange
  + ### Channel\_Green

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Green
  + ### Channel\_Purple

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Purple
  + ### Channel\_Cyan

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Cyan
  + ### Channel\_Magenta

    public static final [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") Channel\_Magenta
* Field Details
  -------------

  + ### BitStoreAll

    public static final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")> BitStoreAll
  + ### id

    private final byte id
  + ### bits

    private final int bits
  + ### color

    private final [Color](../../../core/Color.html "class in zombie.core") color
* Constructor Details
  -------------------

  + ### ResourceChannel

    private ResourceChannel(byte id,
    int bits,
    [Color](../../../core/Color.html "class in zombie.core") color)
* Method Details
  --------------

  + ### values

    public static [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getByteId

    public byte getByteId()

    Specified by:
    :   `getByteId` in interface `zombie.entity.util.enums.IOEnum`
  + ### getBits

    public int getBits()

    Specified by:
    :   `getBits` in interface `zombie.entity.util.enums.IOEnum`
  + ### getColor

    public [Color](../../../core/Color.html "class in zombie.core") getColor()
  + ### fromId

    public static [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") fromId(byte id)