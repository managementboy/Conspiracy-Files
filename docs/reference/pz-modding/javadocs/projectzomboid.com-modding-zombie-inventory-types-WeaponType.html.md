[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [WeaponType](WeaponType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [UNARMED](#UNARMED)
   2. [TWO\_HANDED](#TWO_HANDED)
   3. [ONE\_HANDED](#ONE_HANDED)
   4. [HEAVY](#HEAVY)
   5. [KNIFE](#KNIFE)
   6. [SPEAR](#SPEAR)
   7. [HANDGUN](#HANDGUN)
   8. [FIREARM](#FIREARM)
   9. [THROWING](#THROWING)
   10. [CHAINSAW](#CHAINSAW)
8. [Field Details](#field-detail)
   1. [type](#type)
   2. [possibleAttack](#possibleAttack)
   3. [canMiss](#canMiss)
   4. [isRanged](#isRanged)
9. [Constructor Details](#constructor-detail)
   1. [WeaponType(String, WeightedList, boolean, boolean)](#%3Cinit%3E(java.lang.String,zombie.util.list.WeightedList,boolean,boolean))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [list()](#list())
    4. [getWeaponType(HandWeapon)](#getWeaponType(zombie.inventory.types.HandWeapon))
    5. [getWeaponType(IsoGameCharacter)](#getWeaponType(zombie.characters.IsoGameCharacter))
    6. [getWeaponType(IsoGameCharacter, InventoryItem, InventoryItem)](#getWeaponType(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
    7. [getType()](#getType())
    8. [getPossibleAttack()](#getPossibleAttack())
    9. [isCanMiss()](#isCanMiss())
    10. [isRanged()](#isRanged())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class WeaponType
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeaponType](WeaponType.html "enum class in zombie.inventory.types")>

zombie.inventory.types.WeaponType

All Implemented Interfaces:
:   `Serializable, Comparable<WeaponType>, Constable`

---

public enum WeaponType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[WeaponType](WeaponType.html "enum class in zombie.inventory.types")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `CHAINSAW`

  `FIREARM`

  `HANDGUN`

  `HEAVY`

  `KNIFE`

  `ONE_HANDED`

  `SPEAR`

  `THROWING`

  `TWO_HANDED`

  `UNARMED`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `canMiss`

  `private final boolean`

  `isRanged`

  `private final zombie.util.list.WeightedList<zombie.AttackType>`

  `possibleAttack`

  `private final String`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WeaponType(String type,
  zombie.util.list.WeightedList<zombie.AttackType> possibleAttack,
  boolean canMiss,
  boolean isRanged)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.util.list.WeightedList<zombie.AttackType>`

  `getPossibleAttack()`

  `String`

  `getType()`

  `static WeaponType`

  `getWeaponType(IsoGameCharacter chr)`

  `static WeaponType`

  `getWeaponType(IsoGameCharacter chr,
  InventoryItem inv1,
  InventoryItem inv2)`

  `static WeaponType`

  `getWeaponType(HandWeapon weapon)`

  `boolean`

  `isCanMiss()`

  `boolean`

  `isRanged()`

  `private static zombie.util.list.WeightedList<zombie.AttackType>`

  `list()`

  `static WeaponType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static WeaponType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### UNARMED

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") UNARMED
  + ### TWO\_HANDED

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") TWO\_HANDED
  + ### ONE\_HANDED

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") ONE\_HANDED
  + ### HEAVY

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") HEAVY
  + ### KNIFE

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") KNIFE
  + ### SPEAR

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") SPEAR
  + ### HANDGUN

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") HANDGUN
  + ### FIREARM

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") FIREARM
  + ### THROWING

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") THROWING
  + ### CHAINSAW

    public static final [WeaponType](WeaponType.html "enum class in zombie.inventory.types") CHAINSAW
* Field Details
  -------------

  + ### type

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### possibleAttack

    private final zombie.util.list.WeightedList<zombie.AttackType> possibleAttack
  + ### canMiss

    private final boolean canMiss
  + ### isRanged

    private final boolean isRanged
* Constructor Details
  -------------------

  + ### WeaponType

    private WeaponType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    zombie.util.list.WeightedList<zombie.AttackType> possibleAttack,
    boolean canMiss,
    boolean isRanged)
* Method Details
  --------------

  + ### values

    public static [WeaponType](WeaponType.html "enum class in zombie.inventory.types")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [WeaponType](WeaponType.html "enum class in zombie.inventory.types") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### list

    private static zombie.util.list.WeightedList<zombie.AttackType> list()
  + ### getWeaponType

    public static [WeaponType](WeaponType.html "enum class in zombie.inventory.types") getWeaponType([HandWeapon](HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### getWeaponType

    public static [WeaponType](WeaponType.html "enum class in zombie.inventory.types") getWeaponType([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getWeaponType

    public static [WeaponType](WeaponType.html "enum class in zombie.inventory.types") getWeaponType([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") inv1,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") inv2)
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### getPossibleAttack

    public zombie.util.list.WeightedList<zombie.AttackType> getPossibleAttack()
  + ### isCanMiss

    public boolean isCanMiss()
  + ### isRanged

    public boolean isRanged()