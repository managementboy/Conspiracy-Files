[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Clothing](Clothing.html)
3. [ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Cotton](#Cotton)
   2. [Denim](#Denim)
   3. [Leather](#Leather)
8. [Field Details](#field-detail)
   1. [index](#index)
   2. [type](#type)
   3. [maxScratchDef](#maxScratchDef)
   4. [maxBiteDef](#maxBiteDef)
9. [Constructor Details](#constructor-detail)
   1. [ClothingPatchFabricType(int, String, int, int)](#%3Cinit%3E(int,java.lang.String,int,int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getType()](#getType())
    4. [fromType(String)](#fromType(java.lang.String))
    5. [fromIndex(int)](#fromIndex(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class Clothing.ClothingPatchFabricType
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types")>

zombie.inventory.types.Clothing.ClothingPatchFabricType

All Implemented Interfaces:
:   `Serializable, Comparable<Clothing.ClothingPatchFabricType>, Constable`

Enclosing class:
:   `Clothing`

---

public static enum Clothing.ClothingPatchFabricType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Cotton`

  `Denim`

  `Leather`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final int`

  `index`

  `final int`

  `maxBiteDef`

  `final int`

  `maxScratchDef`

  `final String`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ClothingPatchFabricType(int index,
  String type,
  int maxScratchDef,
  int maxBiteDef)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Clothing.ClothingPatchFabricType`

  `fromIndex(int index)`

  `static Clothing.ClothingPatchFabricType`

  `fromType(String type)`

  `String`

  `getType()`

  `static Clothing.ClothingPatchFabricType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Clothing.ClothingPatchFabricType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Cotton

    public static final [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") Cotton
  + ### Denim

    public static final [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") Denim
  + ### Leather

    public static final [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") Leather
* Field Details
  -------------

  + ### index

    public final int index
  + ### type

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### maxScratchDef

    public final int maxScratchDef
  + ### maxBiteDef

    public final int maxBiteDef
* Constructor Details
  -------------------

  + ### ClothingPatchFabricType

    private ClothingPatchFabricType(int index,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int maxScratchDef,
    int maxBiteDef)
* Method Details
  --------------

  + ### values

    public static [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### fromType

    public static [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") fromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### fromIndex

    public static [Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types") fromIndex(int index)