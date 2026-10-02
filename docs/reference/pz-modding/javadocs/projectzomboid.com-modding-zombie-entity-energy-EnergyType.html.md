[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.energy](package-summary.html)
2. [EnergyType](EnergyType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [Electric](#Electric)
   3. [Mechanical](#Mechanical)
   4. [Thermal](#Thermal)
   5. [Steam](#Steam)
   6. [VoidEnergy](#VoidEnergy)
   7. [Modded](#Modded)
8. [Field Details](#field-detail)
   1. [energyNames](#energyNames)
   2. [energyIdMap](#energyIdMap)
   3. [energyNameMap](#energyNameMap)
   4. [id](#id)
   5. [lowerCache](#lowerCache)
9. [Constructor Details](#constructor-detail)
   1. [EnergyType(byte)](#%3Cinit%3E(byte))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getId()](#getId())
    4. [toStringLower()](#toStringLower())
    5. [containsNameLowercase(String)](#containsNameLowercase(java.lang.String))
    6. [FromId(byte)](#FromId(byte))
    7. [FromNameLower(String)](#FromNameLower(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class EnergyType
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EnergyType](EnergyType.html "enum class in zombie.entity.energy")>

zombie.entity.energy.EnergyType

All Implemented Interfaces:
:   `Serializable, Comparable<EnergyType>, Constable`

---

public enum EnergyType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EnergyType](EnergyType.html "enum class in zombie.entity.energy")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Electric`

  `Mechanical`

  `Modded`

  `None`

  `Steam`

  `Thermal`

  `VoidEnergy`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<Byte, EnergyType>`

  `energyIdMap`

  `private static final HashMap<String, EnergyType>`

  `energyNameMap`

  `private static final HashSet<String>`

  `energyNames`

  `private final byte`

  `id`

  `private String`

  `lowerCache`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EnergyType(byte typeID)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `containsNameLowercase(String name)`

  `static EnergyType`

  `FromId(byte id)`

  `static EnergyType`

  `FromNameLower(String name)`

  `byte`

  `getId()`

  `String`

  `toStringLower()`

  `static EnergyType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static EnergyType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### None

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") None
  + ### Electric

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") Electric
  + ### Mechanical

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") Mechanical
  + ### Thermal

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") Thermal
  + ### Steam

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") Steam
  + ### VoidEnergy

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") VoidEnergy
  + ### Modded

    public static final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") Modded
* Field Details
  -------------

  + ### energyNames

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> energyNames
  + ### energyIdMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [EnergyType](EnergyType.html "enum class in zombie.entity.energy")> energyIdMap
  + ### energyNameMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [EnergyType](EnergyType.html "enum class in zombie.entity.energy")> energyNameMap
  + ### id

    private final byte id
  + ### lowerCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lowerCache
* Constructor Details
  -------------------

  + ### EnergyType

    private EnergyType(byte typeID)
* Method Details
  --------------

  + ### values

    public static [EnergyType](EnergyType.html "enum class in zombie.entity.energy")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [EnergyType](EnergyType.html "enum class in zombie.entity.energy") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### toStringLower

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toStringLower()
  + ### containsNameLowercase

    public static boolean containsNameLowercase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FromId

    public static [EnergyType](EnergyType.html "enum class in zombie.entity.energy") FromId(byte id)
  + ### FromNameLower

    public static [EnergyType](EnergyType.html "enum class in zombie.entity.energy") FromNameLower([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)