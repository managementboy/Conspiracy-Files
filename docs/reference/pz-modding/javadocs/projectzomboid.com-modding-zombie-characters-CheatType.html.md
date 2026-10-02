[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CheatType](CheatType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [GOD\_MODE](#GOD_MODE)
   2. [INVISIBLE](#INVISIBLE)
   3. [UNLIMITED\_ENDURANCE](#UNLIMITED_ENDURANCE)
   4. [UNLIMITED\_AMMO](#UNLIMITED_AMMO)
   5. [KNOW\_ALL\_RECIPES](#KNOW_ALL_RECIPES)
   6. [UNLIMITED\_CARRY](#UNLIMITED_CARRY)
   7. [BUILD](#BUILD)
   8. [FARMING](#FARMING)
   9. [FISHING](#FISHING)
   10. [HEALTH](#HEALTH)
   11. [MECHANICS](#MECHANICS)
   12. [FAST\_MOVE](#FAST_MOVE)
   13. [MOVABLES](#MOVABLES)
   14. [TIMED\_ACTION\_INSTANT](#TIMED_ACTION_INSTANT)
   15. [BRUSH\_TOOL](#BRUSH_TOOL)
   16. [NO\_CLIP](#NO_CLIP)
   17. [CAN\_SEE\_EVERYONE](#CAN_SEE_EVERYONE)
   18. [CAN\_HEAR\_EVERYONE](#CAN_HEAR_EVERYONE)
   19. [ZOMBIES\_DONT\_ATTACK](#ZOMBIES_DONT_ATTACK)
   20. [LOOT\_ZED](#LOOT_ZED)
   21. [LOOT\_LOG](#LOOT_LOG)
   22. [DEBUG\_CONTEXT\_MENU](#DEBUG_CONTEXT_MENU)
   23. [ANIMAL](#ANIMAL)
   24. [ANIMAL\_EXTRA\_VALUES](#ANIMAL_EXTRA_VALUES)
   25. [ALWAYS\_DAY](#ALWAYS_DAY)
8. [Field Details](#field-detail)
   1. [BY\_NAME](#BY_NAME)
   2. [values](#values)
   3. [LIST](#LIST)
   4. [tooltip](#tooltip)
9. [Constructor Details](#constructor-detail)
   1. [CheatType(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [fromId(byte)](#fromId(byte))
    4. [fromString(String)](#fromString(java.lang.String))
    5. [getList()](#getList())
    6. [getTooltip()](#getTooltip())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CheatType
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CheatType](CheatType.html "enum class in zombie.characters")>

zombie.characters.CheatType

All Implemented Interfaces:
:   `Serializable, Comparable<CheatType>, Constable`

---

public enum CheatType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CheatType](CheatType.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ALWAYS_DAY`

  `ANIMAL`

  `ANIMAL_EXTRA_VALUES`

  `BRUSH_TOOL`

  `BUILD`

  `CAN_HEAR_EVERYONE`

  `CAN_SEE_EVERYONE`

  `DEBUG_CONTEXT_MENU`

  `FARMING`

  `FAST_MOVE`

  `FISHING`

  `GOD_MODE`

  `HEALTH`

  `INVISIBLE`

  `KNOW_ALL_RECIPES`

  `LOOT_LOG`

  `LOOT_ZED`

  `MECHANICS`

  `MOVABLES`

  `NO_CLIP`

  `TIMED_ACTION_INSTANT`

  `UNLIMITED_AMMO`

  `UNLIMITED_CARRY`

  `UNLIMITED_ENDURANCE`

  `ZOMBIES_DONT_ATTACK`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<String, CheatType>`

  `BY_NAME`

  `private static final List<CheatType>`

  `LIST`

  `private final String`

  `tooltip`

  `private static final CheatType[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CheatType(String tooltip)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CheatType`

  `fromId(byte id)`

  `static CheatType`

  `fromString(String str)`

  `static List<CheatType>`

  `getList()`

  `String`

  `getTooltip()`

  `static CheatType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CheatType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### GOD\_MODE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") GOD\_MODE
  + ### INVISIBLE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") INVISIBLE
  + ### UNLIMITED\_ENDURANCE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") UNLIMITED\_ENDURANCE
  + ### UNLIMITED\_AMMO

    public static final [CheatType](CheatType.html "enum class in zombie.characters") UNLIMITED\_AMMO
  + ### KNOW\_ALL\_RECIPES

    public static final [CheatType](CheatType.html "enum class in zombie.characters") KNOW\_ALL\_RECIPES
  + ### UNLIMITED\_CARRY

    public static final [CheatType](CheatType.html "enum class in zombie.characters") UNLIMITED\_CARRY
  + ### BUILD

    public static final [CheatType](CheatType.html "enum class in zombie.characters") BUILD
  + ### FARMING

    public static final [CheatType](CheatType.html "enum class in zombie.characters") FARMING
  + ### FISHING

    public static final [CheatType](CheatType.html "enum class in zombie.characters") FISHING
  + ### HEALTH

    public static final [CheatType](CheatType.html "enum class in zombie.characters") HEALTH
  + ### MECHANICS

    public static final [CheatType](CheatType.html "enum class in zombie.characters") MECHANICS
  + ### FAST\_MOVE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") FAST\_MOVE
  + ### MOVABLES

    public static final [CheatType](CheatType.html "enum class in zombie.characters") MOVABLES
  + ### TIMED\_ACTION\_INSTANT

    public static final [CheatType](CheatType.html "enum class in zombie.characters") TIMED\_ACTION\_INSTANT
  + ### BRUSH\_TOOL

    public static final [CheatType](CheatType.html "enum class in zombie.characters") BRUSH\_TOOL
  + ### NO\_CLIP

    public static final [CheatType](CheatType.html "enum class in zombie.characters") NO\_CLIP
  + ### CAN\_SEE\_EVERYONE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") CAN\_SEE\_EVERYONE
  + ### CAN\_HEAR\_EVERYONE

    public static final [CheatType](CheatType.html "enum class in zombie.characters") CAN\_HEAR\_EVERYONE
  + ### ZOMBIES\_DONT\_ATTACK

    public static final [CheatType](CheatType.html "enum class in zombie.characters") ZOMBIES\_DONT\_ATTACK
  + ### LOOT\_ZED

    public static final [CheatType](CheatType.html "enum class in zombie.characters") LOOT\_ZED
  + ### LOOT\_LOG

    public static final [CheatType](CheatType.html "enum class in zombie.characters") LOOT\_LOG
  + ### DEBUG\_CONTEXT\_MENU

    public static final [CheatType](CheatType.html "enum class in zombie.characters") DEBUG\_CONTEXT\_MENU
  + ### ANIMAL

    public static final [CheatType](CheatType.html "enum class in zombie.characters") ANIMAL
  + ### ANIMAL\_EXTRA\_VALUES

    public static final [CheatType](CheatType.html "enum class in zombie.characters") ANIMAL\_EXTRA\_VALUES
  + ### ALWAYS\_DAY

    public static final [CheatType](CheatType.html "enum class in zombie.characters") ALWAYS\_DAY
* Field Details
  -------------

  + ### BY\_NAME

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [CheatType](CheatType.html "enum class in zombie.characters")> BY\_NAME
  + ### values

    private static final [CheatType](CheatType.html "enum class in zombie.characters")[] values
  + ### LIST

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CheatType](CheatType.html "enum class in zombie.characters")> LIST
  + ### tooltip

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip
* Constructor Details
  -------------------

  + ### CheatType

    private CheatType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip)
* Method Details
  --------------

  + ### values

    public static [CheatType](CheatType.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CheatType](CheatType.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### fromId

    public static [CheatType](CheatType.html "enum class in zombie.characters") fromId(byte id)
  + ### fromString

    public static [CheatType](CheatType.html "enum class in zombie.characters") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getList

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CheatType](CheatType.html "enum class in zombie.characters")> getList()
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()