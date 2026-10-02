[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [GameEntityType](GameEntityType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [IsoObject](#IsoObject)
   2. [InventoryItem](#InventoryItem)
   3. [VehiclePart](#VehiclePart)
   4. [IsoMovingObject](#IsoMovingObject)
   5. [Template](#Template)
   6. [MetaEntity](#MetaEntity)
8. [Field Details](#field-detail)
   1. [map](#map)
   2. [id](#id)
   3. [bits](#bits)
9. [Constructor Details](#constructor-detail)
   1. [GameEntityType(byte, int)](#%3Cinit%3E(byte,int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getId()](#getId())
    4. [FromID(byte)](#FromID(byte))
    5. [getByteId()](#getByteId())
    6. [getBits()](#getBits())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class GameEntityType
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[GameEntityType](GameEntityType.html "enum class in zombie.entity")>

zombie.entity.GameEntityType

All Implemented Interfaces:
:   `Serializable, Comparable<GameEntityType>, Constable, zombie.entity.util.enums.IOEnum`

---

public enum GameEntityType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[GameEntityType](GameEntityType.html "enum class in zombie.entity")>
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

  `InventoryItem`

  `IsoMovingObject`

  `IsoObject`

  `MetaEntity`

  `Template`

  `VehiclePart`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `bits`

  `private final byte`

  `id`

  `private static final HashMap<Byte, GameEntityType>`

  `map`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `GameEntityType(byte id,
  int bits)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static GameEntityType`

  `FromID(byte id)`

  `int`

  `getBits()`

  `byte`

  `getByteId()`

  `byte`

  `getId()`

  `static GameEntityType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static GameEntityType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### IsoObject

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") IsoObject
  + ### InventoryItem

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") InventoryItem
  + ### VehiclePart

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") VehiclePart
  + ### IsoMovingObject

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") IsoMovingObject
  + ### Template

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") Template
  + ### MetaEntity

    public static final [GameEntityType](GameEntityType.html "enum class in zombie.entity") MetaEntity
* Field Details
  -------------

  + ### map

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [GameEntityType](GameEntityType.html "enum class in zombie.entity")> map
  + ### id

    private final byte id
  + ### bits

    private final int bits
* Constructor Details
  -------------------

  + ### GameEntityType

    private GameEntityType(byte id,
    int bits)
* Method Details
  --------------

  + ### values

    public static [GameEntityType](GameEntityType.html "enum class in zombie.entity")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [GameEntityType](GameEntityType.html "enum class in zombie.entity") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### FromID

    public static [GameEntityType](GameEntityType.html "enum class in zombie.entity") FromID(byte id)
  + ### getByteId

    public byte getByteId()

    Specified by:
    :   `getByteId` in interface `zombie.entity.util.enums.IOEnum`
  + ### getBits

    public int getBits()

    Specified by:
    :   `getBits` in interface `zombie.entity.util.enums.IOEnum`