[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [StartMode](StartMode.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Manual](#Manual)
   2. [Automatic](#Automatic)
   3. [Passive](#Passive)
8. [Field Details](#field-detail)
   1. [cache](#cache)
   2. [id](#id)
   3. [bits](#bits)
9. [Constructor Details](#constructor-detail)
   1. [StartMode(byte, int)](#%3Cinit%3E(byte,int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getByteId()](#getByteId())
    4. [fromByteId(byte)](#fromByteId(byte))
    5. [getBits()](#getBits())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class StartMode
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[StartMode](StartMode.html "enum class in zombie.entity.components.crafting")>

zombie.entity.components.crafting.StartMode

All Implemented Interfaces:
:   `Serializable, Comparable<StartMode>, Constable, zombie.entity.util.enums.IOEnum`

---

public enum StartMode
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[StartMode](StartMode.html "enum class in zombie.entity.components.crafting")>
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

  `Automatic`

  `Manual`

  `Passive`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final int`

  `bits`

  `private static final HashMap<Byte, StartMode>`

  `cache`

  `(package private) final byte`

  `id`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StartMode(byte id,
  int bits)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static StartMode`

  `fromByteId(byte id)`

  `int`

  `getBits()`

  `byte`

  `getByteId()`

  `static StartMode`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static StartMode[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Manual

    public static final [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") Manual
  + ### Automatic

    public static final [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") Automatic
  + ### Passive

    public static final [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") Passive
* Field Details
  -------------

  + ### cache

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [StartMode](StartMode.html "enum class in zombie.entity.components.crafting")> cache
  + ### id

    final byte id
  + ### bits

    final int bits
* Constructor Details
  -------------------

  + ### StartMode

    private StartMode(byte id,
    int bits)
* Method Details
  --------------

  + ### values

    public static [StartMode](StartMode.html "enum class in zombie.entity.components.crafting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### fromByteId

    public static [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") fromByteId(byte id)
  + ### getBits

    public int getBits()

    Specified by:
    :   `getBits` in interface `zombie.entity.util.enums.IOEnum`