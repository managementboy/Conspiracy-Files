[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [engineStateTypes](BaseVehicle.engineStateTypes.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Idle](#Idle)
   2. [Starting](#Starting)
   3. [RetryingStarting](#RetryingStarting)
   4. [StartingSuccess](#StartingSuccess)
   5. [StartingFailed](#StartingFailed)
   6. [Running](#Running)
   7. [Stalling](#Stalling)
   8. [ShuttingDown](#ShuttingDown)
8. [Field Details](#field-detail)
   1. [Values](#Values)
9. [Constructor Details](#constructor-detail)
   1. [engineStateTypes()](#%3Cinit%3E())
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class BaseVehicle.engineStateTypes
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles")>

zombie.vehicles.BaseVehicle.engineStateTypes

All Implemented Interfaces:
:   `Serializable, Comparable<BaseVehicle.engineStateTypes>, Constable`

Enclosing class:
:   `BaseVehicle`

---

public static enum BaseVehicle.engineStateTypes
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Idle`

  `RetryingStarting`

  `Running`

  `ShuttingDown`

  `Stalling`

  `Starting`

  `StartingFailed`

  `StartingSuccess`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final BaseVehicle.engineStateTypes[]`

  `Values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `engineStateTypes()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BaseVehicle.engineStateTypes`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BaseVehicle.engineStateTypes[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Idle

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") Idle
  + ### Starting

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") Starting
  + ### RetryingStarting

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") RetryingStarting
  + ### StartingSuccess

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") StartingSuccess
  + ### StartingFailed

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") StartingFailed
  + ### Running

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") Running
  + ### Stalling

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") Stalling
  + ### ShuttingDown

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") ShuttingDown
* Field Details
  -------------

  + ### Values

    public static final [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles")[] Values
* Constructor Details
  -------------------

  + ### engineStateTypes

    private engineStateTypes()
* Method Details
  --------------

  + ### values

    public static [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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