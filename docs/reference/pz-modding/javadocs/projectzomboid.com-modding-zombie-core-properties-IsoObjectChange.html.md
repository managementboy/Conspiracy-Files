[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.properties](package-summary.html)
2. [IsoObjectChange](IsoObjectChange.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [ENERGY](#ENERGY)
   2. [LIGHT\_RADIUS](#LIGHT_RADIUS)
   3. [CONTAINERS](#CONTAINERS)
   4. [CONTAINER](#CONTAINER)
   5. [CONTAINER\_CUSTOM\_TEMPERATURE](#CONTAINER_CUSTOM_TEMPERATURE)
   6. [NAME](#NAME)
   7. [REPLACE\_WITH](#REPLACE_WITH)
   8. [USES\_EXTERNAL\_WATER\_SOURCE](#USES_EXTERNAL_WATER_SOURCE)
   9. [EMPTY\_TRASH](#EMPTY_TRASH)
   10. [SPRITE](#SPRITE)
   11. [STATE](#STATE)
   12. [WASHER\_STATE](#WASHER_STATE)
   13. [DRYER\_STATE](#DRYER_STATE)
   14. [MODE](#MODE)
   15. [BECOME\_SKELETON](#BECOME_SKELETON)
   16. [ANIMAL\_ROT\_STAGE](#ANIMAL_ROT_STAGE)
   17. [ZOMBIE\_ROT\_STAGE](#ZOMBIE_ROT_STAGE)
   18. [OBJECT\_ID](#OBJECT_ID)
   19. [ADD\_SHEET](#ADD_SHEET)
   20. [REMOVE\_SHEET](#REMOVE_SHEET)
   21. [SET\_CURTAIN\_OPEN](#SET_CURTAIN_OPEN)
   22. [ADD\_ITEM](#ADD_ITEM)
   23. [ADD\_ITEM\_OF\_TYPE](#ADD_ITEM_OF_TYPE)
   24. [ADD\_RANDOM\_DAMAGE\_FROM\_ZOMBIE](#ADD_RANDOM_DAMAGE_FROM_ZOMBIE)
   25. [ADD\_ZOMBIE\_KILL](#ADD_ZOMBIE_KILL)
   26. [REMOVE\_ITEM](#REMOVE_ITEM)
   27. [REMOVE\_ITEM\_ID](#REMOVE_ITEM_ID)
   28. [REMOVE\_ITEM\_TYPE](#REMOVE_ITEM_TYPE)
   29. [REMOVE\_ONE\_OF](#REMOVE_ONE_OF)
   30. [REANIMATED\_ID](#REANIMATED_ID)
   31. [SHOVE](#SHOVE)
   32. [WAKE\_UP](#WAKE_UP)
   33. [MECHANIC\_ACTION\_DONE](#MECHANIC_ACTION_DONE)
   34. [EXIT\_VEHICLE](#EXIT_VEHICLE)
   35. [STOP\_BURNING](#STOP_BURNING)
   36. [VEHICLE\_NO\_KEY](#VEHICLE_NO_KEY)
   37. [ROTATE](#ROTATE)
   38. [LIGHT\_SOURCE](#LIGHT_SOURCE)
   39. [PAINTABLE](#PAINTABLE)
   40. [SWAP\_ITEM](#SWAP_ITEM)
   41. [PLAY\_GAIN\_EXPERIENCE\_LEVEL\_SOUND](#PLAY_GAIN_EXPERIENCE_LEVEL_SOUND)
   42. [SET\_HALO\_NOTE](#SET_HALO_NOTE)
   43. [COUGH](#COUGH)
8. [Field Details](#field-detail)
   1. [BY\_NAME](#BY_NAME)
   2. [name](#name)
9. [Constructor Details](#constructor-detail)
   1. [IsoObjectChange(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getName()](#getName())
    4. [isProperty(String)](#isProperty(java.lang.String))
    5. [toString()](#toString())
    6. [lookup(String)](#lookup(java.lang.String))
    7. [lookup(Object)](#lookup(java.lang.Object))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class IsoObjectChange
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties")>

zombie.core.properties.IsoObjectChange

All Implemented Interfaces:
:   `Serializable, Comparable<IsoObjectChange>, Constable`

---

public enum IsoObjectChange
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoObjectChange.IsoObjectChangeNotFoundException`

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ADD_ITEM`

  `ADD_ITEM_OF_TYPE`

  `ADD_RANDOM_DAMAGE_FROM_ZOMBIE`

  `ADD_SHEET`

  `ADD_ZOMBIE_KILL`

  `ANIMAL_ROT_STAGE`

  `BECOME_SKELETON`

  `CONTAINER`

  `CONTAINER_CUSTOM_TEMPERATURE`

  `CONTAINERS`

  `COUGH`

  `DRYER_STATE`

  `EMPTY_TRASH`

  `ENERGY`

  `EXIT_VEHICLE`

  `LIGHT_RADIUS`

  `LIGHT_SOURCE`

  `MECHANIC_ACTION_DONE`

  `MODE`

  `NAME`

  `OBJECT_ID`

  `PAINTABLE`

  `PLAY_GAIN_EXPERIENCE_LEVEL_SOUND`

  `REANIMATED_ID`

  `REMOVE_ITEM`

  `REMOVE_ITEM_ID`

  `REMOVE_ITEM_TYPE`

  `REMOVE_ONE_OF`

  `REMOVE_SHEET`

  `REPLACE_WITH`

  `ROTATE`

  `SET_CURTAIN_OPEN`

  `SET_HALO_NOTE`

  `SHOVE`

  `SPRITE`

  `STATE`

  `STOP_BURNING`

  `SWAP_ITEM`

  `USES_EXTERNAL_WATER_SOURCE`

  `VEHICLE_NO_KEY`

  `WAKE_UP`

  `WASHER_STATE`

  `ZOMBIE_ROT_STAGE`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Map<String, IsoObjectChange>`

  `BY_NAME`

  `private final String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoObjectChange(String name)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `boolean`

  `isProperty(String inObjectChangeName)`

  `static IsoObjectChange`

  `lookup(Object obj)`

  `static IsoObjectChange`

  `lookup(String name)`

  `String`

  `toString()`

  `static IsoObjectChange`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoObjectChange[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### ENERGY

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ENERGY
  + ### LIGHT\_RADIUS

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") LIGHT\_RADIUS
  + ### CONTAINERS

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") CONTAINERS
  + ### CONTAINER

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") CONTAINER
  + ### CONTAINER\_CUSTOM\_TEMPERATURE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") CONTAINER\_CUSTOM\_TEMPERATURE
  + ### NAME

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") NAME
  + ### REPLACE\_WITH

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REPLACE\_WITH
  + ### USES\_EXTERNAL\_WATER\_SOURCE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") USES\_EXTERNAL\_WATER\_SOURCE
  + ### EMPTY\_TRASH

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") EMPTY\_TRASH
  + ### SPRITE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") SPRITE
  + ### STATE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") STATE
  + ### WASHER\_STATE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") WASHER\_STATE
  + ### DRYER\_STATE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") DRYER\_STATE
  + ### MODE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") MODE
  + ### BECOME\_SKELETON

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") BECOME\_SKELETON
  + ### ANIMAL\_ROT\_STAGE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ANIMAL\_ROT\_STAGE
  + ### ZOMBIE\_ROT\_STAGE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ZOMBIE\_ROT\_STAGE
  + ### OBJECT\_ID

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") OBJECT\_ID
  + ### ADD\_SHEET

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ADD\_SHEET
  + ### REMOVE\_SHEET

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REMOVE\_SHEET
  + ### SET\_CURTAIN\_OPEN

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") SET\_CURTAIN\_OPEN
  + ### ADD\_ITEM

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ADD\_ITEM
  + ### ADD\_ITEM\_OF\_TYPE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ADD\_ITEM\_OF\_TYPE
  + ### ADD\_RANDOM\_DAMAGE\_FROM\_ZOMBIE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ADD\_RANDOM\_DAMAGE\_FROM\_ZOMBIE
  + ### ADD\_ZOMBIE\_KILL

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ADD\_ZOMBIE\_KILL
  + ### REMOVE\_ITEM

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REMOVE\_ITEM
  + ### REMOVE\_ITEM\_ID

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REMOVE\_ITEM\_ID
  + ### REMOVE\_ITEM\_TYPE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REMOVE\_ITEM\_TYPE
  + ### REMOVE\_ONE\_OF

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REMOVE\_ONE\_OF
  + ### REANIMATED\_ID

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") REANIMATED\_ID
  + ### SHOVE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") SHOVE
  + ### WAKE\_UP

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") WAKE\_UP
  + ### MECHANIC\_ACTION\_DONE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") MECHANIC\_ACTION\_DONE
  + ### EXIT\_VEHICLE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") EXIT\_VEHICLE
  + ### STOP\_BURNING

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") STOP\_BURNING
  + ### VEHICLE\_NO\_KEY

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") VEHICLE\_NO\_KEY
  + ### ROTATE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") ROTATE
  + ### LIGHT\_SOURCE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") LIGHT\_SOURCE
  + ### PAINTABLE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") PAINTABLE
  + ### SWAP\_ITEM

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") SWAP\_ITEM
  + ### PLAY\_GAIN\_EXPERIENCE\_LEVEL\_SOUND

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") PLAY\_GAIN\_EXPERIENCE\_LEVEL\_SOUND
  + ### SET\_HALO\_NOTE

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") SET\_HALO\_NOTE
  + ### COUGH

    public static final [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") COUGH
* Field Details
  -------------

  + ### BY\_NAME

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties")> BY\_NAME
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### IsoObjectChange

    private IsoObjectChange([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### values

    public static [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### isProperty

    public boolean isProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inObjectChangeName)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Enum<IsoObjectChange>`
  + ### lookup

    public static [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") lookup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### lookup

    public static [IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties") lookup([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)