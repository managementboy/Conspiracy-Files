[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoWindow](IsoWindow.html)
3. [LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Never](#Never)
   2. [ExtremelyRare](#ExtremelyRare)
   3. [Rare](#Rare)
   4. [Sometimes](#Sometimes)
   5. [Often](#Often)
   6. [VeryOften](#VeryOften)
8. [Field Details](#field-detail)
   1. [value](#value)
   2. [lockChance](#lockChance)
9. [Constructor Details](#constructor-detail)
   1. [LockedHouseFrequency(int, int)](#%3Cinit%3E(int,int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getLockChance()](#getLockChance())
    4. [fromValue(int)](#fromValue(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class IsoWindow.LockedHouseFrequency
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects")>

zombie.iso.objects.IsoWindow.LockedHouseFrequency

All Implemented Interfaces:
:   `Serializable, Comparable<IsoWindow.LockedHouseFrequency>, Constable`

Enclosing class:
:   `IsoWindow`

---

private static enum IsoWindow.LockedHouseFrequency
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ExtremelyRare`

  `Never`

  `Often`

  `Rare`

  `Sometimes`

  `VeryOften`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `lockChance`

  `private final int`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `LockedHouseFrequency(int value,
  int lockChance)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoWindow.LockedHouseFrequency`

  `fromValue(int value)`

  `int`

  `getLockChance()`

  `static IsoWindow.LockedHouseFrequency`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoWindow.LockedHouseFrequency[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Never

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") Never
  + ### ExtremelyRare

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") ExtremelyRare
  + ### Rare

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") Rare
  + ### Sometimes

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") Sometimes
  + ### Often

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") Often
  + ### VeryOften

    public static final [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") VeryOften
* Field Details
  -------------

  + ### value

    private final int value
  + ### lockChance

    private final int lockChance
* Constructor Details
  -------------------

  + ### LockedHouseFrequency

    private LockedHouseFrequency(int value,
    int lockChance)
* Method Details
  --------------

  + ### values

    public static [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getLockChance

    public int getLockChance()
  + ### fromValue

    public static [IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects") fromValue(int value)