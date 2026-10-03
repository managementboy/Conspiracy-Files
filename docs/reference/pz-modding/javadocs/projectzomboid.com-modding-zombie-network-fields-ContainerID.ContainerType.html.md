[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.fields](package-summary.html)
2. [ContainerID](ContainerID.html)
3. [ContainerType](ContainerID.ContainerType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Undefined](#Undefined)
   2. [DeadBody](#DeadBody)
   3. [WorldObject](#WorldObject)
   4. [IsoObject](#IsoObject)
   5. [ObjectContainer](#ObjectContainer)
   6. [ObjectInVehicle](#ObjectInVehicle)
   7. [Vehicle](#Vehicle)
   8. [PlayerInventory](#PlayerInventory)
   9. [InventoryContainer](#InventoryContainer)
   10. [Floor](#Floor)
7. [Constructor Details](#constructor-detail)
   1. [ContainerType()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class ContainerID.ContainerType
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields")>

zombie.network.fields.ContainerID.ContainerType

All Implemented Interfaces:
:   `Serializable, Comparable<ContainerID.ContainerType>, Constable`

Enclosing class:
:   `ContainerID`

---

public static enum ContainerID.ContainerType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `DeadBody`

  `Floor`

  `InventoryContainer`

  `IsoObject`

  `ObjectContainer`

  `ObjectInVehicle`

  `PlayerInventory`

  `Undefined`

  `Vehicle`

  `WorldObject`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ContainerType()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ContainerID.ContainerType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ContainerID.ContainerType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Undefined

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") Undefined
  + ### DeadBody

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") DeadBody
  + ### WorldObject

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") WorldObject
  + ### IsoObject

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") IsoObject
  + ### ObjectContainer

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") ObjectContainer
  + ### ObjectInVehicle

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") ObjectInVehicle
  + ### Vehicle

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") Vehicle
  + ### PlayerInventory

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") PlayerInventory
  + ### InventoryContainer

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") InventoryContainer
  + ### Floor

    public static final [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") Floor
* Constructor Details
  -------------------

  + ### ContainerType

    private ContainerType()
* Method Details
  --------------

  + ### values

    public static [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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