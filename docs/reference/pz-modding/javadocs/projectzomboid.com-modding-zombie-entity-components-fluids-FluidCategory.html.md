[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidCategory](FluidCategory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Beverage](#Beverage)
   2. [Alcoholic](#Alcoholic)
   3. [Hazardous](#Hazardous)
   4. [Medical](#Medical)
   5. [Industrial](#Industrial)
   6. [Colors](#Colors)
   7. [Dyes](#Dyes)
   8. [HairDyes](#HairDyes)
   9. [Paint](#Paint)
   10. [Fuel](#Fuel)
   11. [Poisons](#Poisons)
   12. [Water](#Water)
8. [Field Details](#field-detail)
   1. [idMap](#idMap)
   2. [list](#list)
   3. [id](#id)
9. [Constructor Details](#constructor-detail)
   1. [FluidCategory(byte)](#%3Cinit%3E(byte))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getId()](#getId())
    4. [FromId(byte)](#FromId(byte))
    5. [getList()](#getList())
    6. [getName()](#getName())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class FluidCategory
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")>

zombie.entity.components.fluids.FluidCategory

All Implemented Interfaces:
:   `Serializable, Comparable<FluidCategory>, Constable`

---

public enum FluidCategory
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Alcoholic`

  `Beverage`

  `Colors`

  `Dyes`

  `Fuel`

  `HairDyes`

  `Hazardous`

  `Industrial`

  `Medical`

  `Paint`

  `Poisons`

  `Water`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final byte`

  `id`

  `private static final HashMap<Byte, FluidCategory>`

  `idMap`

  `private static final ArrayList<FluidCategory>`

  `list`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidCategory(byte id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static FluidCategory`

  `FromId(byte id)`

  `byte`

  `getId()`

  `static ArrayList<FluidCategory>`

  `getList()`

  `String`

  `getName()`

  `static FluidCategory`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static FluidCategory[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Beverage

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Beverage
  + ### Alcoholic

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Alcoholic
  + ### Hazardous

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Hazardous
  + ### Medical

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Medical
  + ### Industrial

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Industrial
  + ### Colors

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Colors
  + ### Dyes

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Dyes
  + ### HairDyes

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") HairDyes
  + ### Paint

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Paint
  + ### Fuel

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Fuel
  + ### Poisons

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Poisons
  + ### Water

    public static final [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") Water
* Field Details
  -------------

  + ### idMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> idMap
  + ### list

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> list
  + ### id

    private final byte id
* Constructor Details
  -------------------

  + ### FluidCategory

    private FluidCategory(byte id)
* Method Details
  --------------

  + ### values

    public static [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### FromId

    public static [FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") FromId(byte id)
  + ### getList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> getList()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()