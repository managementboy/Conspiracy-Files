[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.combat](package-summary.html)
2. [CombatConfigKey](CombatConfigKey.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [BASE\_WEAPON\_DAMAGE\_MULTIPLIER](#BASE_WEAPON_DAMAGE_MULTIPLIER)
   2. [WEAPON\_LEVEL\_DAMAGE\_MULTIPLIER\_INCREMENT](#WEAPON_LEVEL_DAMAGE_MULTIPLIER_INCREMENT)
   3. [PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER](#PLAYER_RECEIVED_DAMAGE_MULTIPLIER)
   4. [NON\_PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER](#NON_PLAYER_RECEIVED_DAMAGE_MULTIPLIER)
   5. [HEAD\_HIT\_DAMAGE\_SPLIT\_MODIFIER](#HEAD_HIT_DAMAGE_SPLIT_MODIFIER)
   6. [LEG\_HIT\_DAMAGE\_SPLIT\_MODIFIER](#LEG_HIT_DAMAGE_SPLIT_MODIFIER)
   7. [ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_FROM\_BEHIND](#ADDITIONAL_CRITICAL_HIT_CHANCE_FROM_BEHIND)
   8. [ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_DEFAULT](#ADDITIONAL_CRITICAL_HIT_CHANCE_DEFAULT)
   9. [RECOIL\_DELAY](#RECOIL_DELAY)
   10. [POINT\_BLANK\_DISTANCE](#POINT_BLANK_DISTANCE)
   11. [LOW\_LIGHT\_THRESHOLD](#LOW_LIGHT_THRESHOLD)
   12. [LOW\_LIGHT\_TO\_HIT\_MAXIMUM\_PENALTY](#LOW_LIGHT_TO_HIT_MAXIMUM_PENALTY)
   13. [POINT\_BLANK\_TO\_HIT\_MAXIMUM\_BONUS](#POINT_BLANK_TO_HIT_MAXIMUM_BONUS)
   14. [POINT\_BLANK\_DROP\_OFF\_TO\_HIT\_PENALTY](#POINT_BLANK_DROP_OFF_TO_HIT_PENALTY)
   15. [POST\_SHOT\_AIMING\_DELAY\_RECOIL\_MODIFIER](#POST_SHOT_AIMING_DELAY_RECOIL_MODIFIER)
   16. [POST\_SHOT\_AIMING\_DELAY\_AIMING\_MODIFIER](#POST_SHOT_AIMING_DELAY_AIMING_MODIFIER)
   17. [OPTIMAL\_RANGE\_TO\_HIT\_MAXIMUM\_BONUS](#OPTIMAL_RANGE_TO_HIT_MAXIMUM_BONUS)
   18. [OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY](#OPTIMAL_RANGE_DROP_OFF_TO_HIT_PENALTY)
   19. [OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY\_INCREMENT](#OPTIMAL_RANGE_DROP_OFF_TO_HIT_PENALTY_INCREMENT)
   20. [MINIMUM\_TO\_HIT\_CHANCE](#MINIMUM_TO_HIT_CHANCE)
   21. [MAXIMUM\_START\_TO\_HIT\_CHANCE](#MAXIMUM_START_TO_HIT_CHANCE)
   22. [MAXIMUM\_TO\_HIT\_CHANCE](#MAXIMUM_TO_HIT_CHANCE)
   23. [MOVING\_TO\_HIT\_PENALTY](#MOVING_TO_HIT_PENALTY)
   24. [RUNNING\_TO\_HIT\_PENALTY](#RUNNING_TO_HIT_PENALTY)
   25. [SPRINTING\_TO\_HIT\_PENALTY](#SPRINTING_TO_HIT_PENALTY)
   26. [MARKSMAN\_TRAIT\_TO\_HIT\_BONUS](#MARKSMAN_TRAIT_TO_HIT_BONUS)
   27. [ARM\_PAIN\_TO\_HIT\_MODIFIER](#ARM_PAIN_TO_HIT_MODIFIER)
   28. [PANIC\_TO\_HIT\_BASE\_PENALTY](#PANIC_TO_HIT_BASE_PENALTY)
   29. [PANIC\_TO\_HIT\_DISTANCE\_MODIFIER](#PANIC_TO_HIT_DISTANCE_MODIFIER)
   30. [STRESS\_TO\_HIT\_BASE\_PENALTY](#STRESS_TO_HIT_BASE_PENALTY)
   31. [STRESS\_TO\_HIT\_DISTANCE\_MODIFIER](#STRESS_TO_HIT_DISTANCE_MODIFIER)
   32. [TIRED\_TO\_HIT\_BASE\_PENALTY](#TIRED_TO_HIT_BASE_PENALTY)
   33. [ENDURANCE\_TO\_HIT\_BASE\_PENALTY](#ENDURANCE_TO_HIT_BASE_PENALTY)
   34. [DRUNK\_TO\_HIT\_BASE\_PENALTY](#DRUNK_TO_HIT_BASE_PENALTY)
   35. [DRUNK\_TO\_HIT\_DISTANCE\_MODIFIER](#DRUNK_TO_HIT_DISTANCE_MODIFIER)
   36. [WIND\_INTENSITY\_TO\_HIT\_PENALTY](#WIND_INTENSITY_TO_HIT_PENALTY)
   37. [WIND\_INTENSITY\_TO\_HIT\_AIMING\_MODIFIER](#WIND_INTENSITY_TO_HIT_AIMING_MODIFIER)
   38. [WIND\_INTENSITY\_TO\_HIT\_MINIMUM\_MARKSMAN\_MODIFIER](#WIND_INTENSITY_TO_HIT_MINIMUM_MARKSMAN_MODIFIER)
   39. [WIND\_INTENSITY\_TO\_HIT\_MAXIMUM\_MARKSMAN\_MODIFIER](#WIND_INTENSITY_TO_HIT_MAXIMUM_MARKSMAN_MODIFIER)
   40. [RAIN\_INTENSITY\_TO\_HIT\_DISTANCE\_MODIFIER](#RAIN_INTENSITY_TO_HIT_DISTANCE_MODIFIER)
   41. [FOG\_INTENSITY\_DISTANCE\_MODIFIER](#FOG_INTENSITY_DISTANCE_MODIFIER)
   42. [POINT\_BLANK\_MAXIMUM\_DISTANCE\_MODIFIER](#POINT_BLANK_MAXIMUM_DISTANCE_MODIFIER)
   43. [SIGHTLESS\_TO\_HIT\_BASE\_DISTANCE](#SIGHTLESS_TO_HIT_BASE_DISTANCE)
   44. [SIGHTLESS\_TO\_HIT\_PRONE\_MODIFIER](#SIGHTLESS_TO_HIT_PRONE_MODIFIER)
   45. [SIGHTLESS\_AIM\_DELAY\_TO\_HIT\_DISTANCE\_MODIFIER](#SIGHTLESS_AIM_DELAY_TO_HIT_DISTANCE_MODIFIER)
   46. [PIERCING\_BULLET\_DAMAGE\_REDUCTION](#PIERCING_BULLET_DAMAGE_REDUCTION)
   47. [FIREARM\_RECOIL\_MUSCLE\_STRAIN\_MODIFIER](#FIREARM_RECOIL_MUSCLE_STRAIN_MODIFIER)
   48. [DRIVEBY\_DOT\_OPTIMAL\_ANGLE](#DRIVEBY_DOT_OPTIMAL_ANGLE)
   49. [DRIVEBY\_DOT\_MAXIMUM\_ANGLE](#DRIVEBY_DOT_MAXIMUM_ANGLE)
   50. [DRIVEBY\_DOT\_TO\_HIT\_MAXIMUM\_PENALTY](#DRIVEBY_DOT_TO_HIT_MAXIMUM_PENALTY)
   51. [GLOBAL\_MELEE\_DAMAGE\_REDUCTION\_MULTIPLIER](#GLOBAL_MELEE_DAMAGE_REDUCTION_MULTIPLIER)
   52. [DAMAGE\_PENALTY\_ONE\_HANDED\_TWO\_HANDED\_WEAPON\_MULTIPLIER](#DAMAGE_PENALTY_ONE_HANDED_TWO_HANDED_WEAPON_MULTIPLIER)
   53. [ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_DIVISOR](#ENDURANCE_LOSS_TWO_HANDED_PENALTY_DIVISOR)
   54. [ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_SCALE](#ENDURANCE_LOSS_TWO_HANDED_PENALTY_SCALE)
   55. [ENDURANCE\_LOSS\_FLOOR\_SHOVE\_MULTIPLIER](#ENDURANCE_LOSS_FLOOR_SHOVE_MULTIPLIER)
   56. [ENDURANCE\_LOSS\_CLOSE\_KILL\_MODIFIER](#ENDURANCE_LOSS_CLOSE_KILL_MODIFIER)
   57. [ENDURANCE\_LOSS\_BASE\_SCALE](#ENDURANCE_LOSS_BASE_SCALE)
   58. [ENDURANCE\_LOSS\_WEIGHT\_MODIFIER](#ENDURANCE_LOSS_WEIGHT_MODIFIER)
   59. [ENDURANCE\_LOSS\_FINAL\_MULTIPLIER](#ENDURANCE_LOSS_FINAL_MULTIPLIER)
   60. [BALLISTICS\_CONTROLLER\_DISTANCE\_THRESHOLD](#BALLISTICS_CONTROLLER_DISTANCE_THRESHOLD)
8. [Field Details](#field-detail)
   1. [category](#category)
   2. [defaultValue](#defaultValue)
   3. [minimum](#minimum)
   4. [maximum](#maximum)
9. [Constructor Details](#constructor-detail)
   1. [CombatConfigKey(CombatConfigCategory, float, float, float)](#%3Cinit%3E(zombie.combat.CombatConfigCategory,float,float,float))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getCategory()](#getCategory())
    4. [getDefaultValue()](#getDefaultValue())
    5. [getMinimum()](#getMinimum())
    6. [getMaximum()](#getMaximum())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CombatConfigKey
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat")>

zombie.combat.CombatConfigKey

All Implemented Interfaces:
:   `Serializable, Comparable<CombatConfigKey>, Constable`

---

public enum CombatConfigKey
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ADDITIONAL_CRITICAL_HIT_CHANCE_DEFAULT`

  `ADDITIONAL_CRITICAL_HIT_CHANCE_FROM_BEHIND`

  `ARM_PAIN_TO_HIT_MODIFIER`

  `BALLISTICS_CONTROLLER_DISTANCE_THRESHOLD`

  `BASE_WEAPON_DAMAGE_MULTIPLIER`

  `DAMAGE_PENALTY_ONE_HANDED_TWO_HANDED_WEAPON_MULTIPLIER`

  `DRIVEBY_DOT_MAXIMUM_ANGLE`

  `DRIVEBY_DOT_OPTIMAL_ANGLE`

  `DRIVEBY_DOT_TO_HIT_MAXIMUM_PENALTY`

  `DRUNK_TO_HIT_BASE_PENALTY`

  `DRUNK_TO_HIT_DISTANCE_MODIFIER`

  `ENDURANCE_LOSS_BASE_SCALE`

  `ENDURANCE_LOSS_CLOSE_KILL_MODIFIER`

  `ENDURANCE_LOSS_FINAL_MULTIPLIER`

  `ENDURANCE_LOSS_FLOOR_SHOVE_MULTIPLIER`

  `ENDURANCE_LOSS_TWO_HANDED_PENALTY_DIVISOR`

  `ENDURANCE_LOSS_TWO_HANDED_PENALTY_SCALE`

  `ENDURANCE_LOSS_WEIGHT_MODIFIER`

  `ENDURANCE_TO_HIT_BASE_PENALTY`

  `FIREARM_RECOIL_MUSCLE_STRAIN_MODIFIER`

  `FOG_INTENSITY_DISTANCE_MODIFIER`

  `GLOBAL_MELEE_DAMAGE_REDUCTION_MULTIPLIER`

  `HEAD_HIT_DAMAGE_SPLIT_MODIFIER`

  `LEG_HIT_DAMAGE_SPLIT_MODIFIER`

  `LOW_LIGHT_THRESHOLD`

  `LOW_LIGHT_TO_HIT_MAXIMUM_PENALTY`

  `MARKSMAN_TRAIT_TO_HIT_BONUS`

  `MAXIMUM_START_TO_HIT_CHANCE`

  `MAXIMUM_TO_HIT_CHANCE`

  `MINIMUM_TO_HIT_CHANCE`

  `MOVING_TO_HIT_PENALTY`

  `NON_PLAYER_RECEIVED_DAMAGE_MULTIPLIER`

  `OPTIMAL_RANGE_DROP_OFF_TO_HIT_PENALTY`

  `OPTIMAL_RANGE_DROP_OFF_TO_HIT_PENALTY_INCREMENT`

  `OPTIMAL_RANGE_TO_HIT_MAXIMUM_BONUS`

  `PANIC_TO_HIT_BASE_PENALTY`

  `PANIC_TO_HIT_DISTANCE_MODIFIER`

  `PIERCING_BULLET_DAMAGE_REDUCTION`

  `PLAYER_RECEIVED_DAMAGE_MULTIPLIER`

  `POINT_BLANK_DISTANCE`

  `POINT_BLANK_DROP_OFF_TO_HIT_PENALTY`

  `POINT_BLANK_MAXIMUM_DISTANCE_MODIFIER`

  `POINT_BLANK_TO_HIT_MAXIMUM_BONUS`

  `POST_SHOT_AIMING_DELAY_AIMING_MODIFIER`

  `POST_SHOT_AIMING_DELAY_RECOIL_MODIFIER`

  `RAIN_INTENSITY_TO_HIT_DISTANCE_MODIFIER`

  `RECOIL_DELAY`

  `RUNNING_TO_HIT_PENALTY`

  `SIGHTLESS_AIM_DELAY_TO_HIT_DISTANCE_MODIFIER`

  `SIGHTLESS_TO_HIT_BASE_DISTANCE`

  `SIGHTLESS_TO_HIT_PRONE_MODIFIER`

  `SPRINTING_TO_HIT_PENALTY`

  `STRESS_TO_HIT_BASE_PENALTY`

  `STRESS_TO_HIT_DISTANCE_MODIFIER`

  `TIRED_TO_HIT_BASE_PENALTY`

  `WEAPON_LEVEL_DAMAGE_MULTIPLIER_INCREMENT`

  `WIND_INTENSITY_TO_HIT_AIMING_MODIFIER`

  `WIND_INTENSITY_TO_HIT_MAXIMUM_MARKSMAN_MODIFIER`

  `WIND_INTENSITY_TO_HIT_MINIMUM_MARKSMAN_MODIFIER`

  `WIND_INTENSITY_TO_HIT_PENALTY`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final CombatConfigCategory`

  `category`

  `private final float`

  `defaultValue`

  `private final float`

  `maximum`

  `private final float`

  `minimum`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CombatConfigKey(CombatConfigCategory category,
  float defaultValue,
  float minimum,
  float maximum)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `CombatConfigCategory`

  `getCategory()`

  `float`

  `getDefaultValue()`

  `float`

  `getMaximum()`

  `float`

  `getMinimum()`

  `static CombatConfigKey`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CombatConfigKey[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### BASE\_WEAPON\_DAMAGE\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") BASE\_WEAPON\_DAMAGE\_MULTIPLIER
  + ### WEAPON\_LEVEL\_DAMAGE\_MULTIPLIER\_INCREMENT

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") WEAPON\_LEVEL\_DAMAGE\_MULTIPLIER\_INCREMENT
  + ### PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER
  + ### NON\_PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") NON\_PLAYER\_RECEIVED\_DAMAGE\_MULTIPLIER
  + ### HEAD\_HIT\_DAMAGE\_SPLIT\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") HEAD\_HIT\_DAMAGE\_SPLIT\_MODIFIER
  + ### LEG\_HIT\_DAMAGE\_SPLIT\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") LEG\_HIT\_DAMAGE\_SPLIT\_MODIFIER
  + ### ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_FROM\_BEHIND

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_FROM\_BEHIND
  + ### ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_DEFAULT

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ADDITIONAL\_CRITICAL\_HIT\_CHANCE\_DEFAULT
  + ### RECOIL\_DELAY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") RECOIL\_DELAY
  + ### POINT\_BLANK\_DISTANCE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POINT\_BLANK\_DISTANCE
  + ### LOW\_LIGHT\_THRESHOLD

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") LOW\_LIGHT\_THRESHOLD
  + ### LOW\_LIGHT\_TO\_HIT\_MAXIMUM\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") LOW\_LIGHT\_TO\_HIT\_MAXIMUM\_PENALTY
  + ### POINT\_BLANK\_TO\_HIT\_MAXIMUM\_BONUS

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POINT\_BLANK\_TO\_HIT\_MAXIMUM\_BONUS
  + ### POINT\_BLANK\_DROP\_OFF\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POINT\_BLANK\_DROP\_OFF\_TO\_HIT\_PENALTY
  + ### POST\_SHOT\_AIMING\_DELAY\_RECOIL\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POST\_SHOT\_AIMING\_DELAY\_RECOIL\_MODIFIER
  + ### POST\_SHOT\_AIMING\_DELAY\_AIMING\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POST\_SHOT\_AIMING\_DELAY\_AIMING\_MODIFIER
  + ### OPTIMAL\_RANGE\_TO\_HIT\_MAXIMUM\_BONUS

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") OPTIMAL\_RANGE\_TO\_HIT\_MAXIMUM\_BONUS
  + ### OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY
  + ### OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY\_INCREMENT

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") OPTIMAL\_RANGE\_DROP\_OFF\_TO\_HIT\_PENALTY\_INCREMENT
  + ### MINIMUM\_TO\_HIT\_CHANCE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") MINIMUM\_TO\_HIT\_CHANCE
  + ### MAXIMUM\_START\_TO\_HIT\_CHANCE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") MAXIMUM\_START\_TO\_HIT\_CHANCE
  + ### MAXIMUM\_TO\_HIT\_CHANCE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") MAXIMUM\_TO\_HIT\_CHANCE
  + ### MOVING\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") MOVING\_TO\_HIT\_PENALTY
  + ### RUNNING\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") RUNNING\_TO\_HIT\_PENALTY
  + ### SPRINTING\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") SPRINTING\_TO\_HIT\_PENALTY
  + ### MARKSMAN\_TRAIT\_TO\_HIT\_BONUS

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") MARKSMAN\_TRAIT\_TO\_HIT\_BONUS
  + ### ARM\_PAIN\_TO\_HIT\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ARM\_PAIN\_TO\_HIT\_MODIFIER
  + ### PANIC\_TO\_HIT\_BASE\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") PANIC\_TO\_HIT\_BASE\_PENALTY
  + ### PANIC\_TO\_HIT\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") PANIC\_TO\_HIT\_DISTANCE\_MODIFIER
  + ### STRESS\_TO\_HIT\_BASE\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") STRESS\_TO\_HIT\_BASE\_PENALTY
  + ### STRESS\_TO\_HIT\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") STRESS\_TO\_HIT\_DISTANCE\_MODIFIER
  + ### TIRED\_TO\_HIT\_BASE\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") TIRED\_TO\_HIT\_BASE\_PENALTY
  + ### ENDURANCE\_TO\_HIT\_BASE\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_TO\_HIT\_BASE\_PENALTY
  + ### DRUNK\_TO\_HIT\_BASE\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DRUNK\_TO\_HIT\_BASE\_PENALTY
  + ### DRUNK\_TO\_HIT\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DRUNK\_TO\_HIT\_DISTANCE\_MODIFIER
  + ### WIND\_INTENSITY\_TO\_HIT\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") WIND\_INTENSITY\_TO\_HIT\_PENALTY
  + ### WIND\_INTENSITY\_TO\_HIT\_AIMING\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") WIND\_INTENSITY\_TO\_HIT\_AIMING\_MODIFIER
  + ### WIND\_INTENSITY\_TO\_HIT\_MINIMUM\_MARKSMAN\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") WIND\_INTENSITY\_TO\_HIT\_MINIMUM\_MARKSMAN\_MODIFIER
  + ### WIND\_INTENSITY\_TO\_HIT\_MAXIMUM\_MARKSMAN\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") WIND\_INTENSITY\_TO\_HIT\_MAXIMUM\_MARKSMAN\_MODIFIER
  + ### RAIN\_INTENSITY\_TO\_HIT\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") RAIN\_INTENSITY\_TO\_HIT\_DISTANCE\_MODIFIER
  + ### FOG\_INTENSITY\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") FOG\_INTENSITY\_DISTANCE\_MODIFIER
  + ### POINT\_BLANK\_MAXIMUM\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") POINT\_BLANK\_MAXIMUM\_DISTANCE\_MODIFIER
  + ### SIGHTLESS\_TO\_HIT\_BASE\_DISTANCE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") SIGHTLESS\_TO\_HIT\_BASE\_DISTANCE
  + ### SIGHTLESS\_TO\_HIT\_PRONE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") SIGHTLESS\_TO\_HIT\_PRONE\_MODIFIER
  + ### SIGHTLESS\_AIM\_DELAY\_TO\_HIT\_DISTANCE\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") SIGHTLESS\_AIM\_DELAY\_TO\_HIT\_DISTANCE\_MODIFIER
  + ### PIERCING\_BULLET\_DAMAGE\_REDUCTION

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") PIERCING\_BULLET\_DAMAGE\_REDUCTION
  + ### FIREARM\_RECOIL\_MUSCLE\_STRAIN\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") FIREARM\_RECOIL\_MUSCLE\_STRAIN\_MODIFIER
  + ### DRIVEBY\_DOT\_OPTIMAL\_ANGLE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DRIVEBY\_DOT\_OPTIMAL\_ANGLE
  + ### DRIVEBY\_DOT\_MAXIMUM\_ANGLE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DRIVEBY\_DOT\_MAXIMUM\_ANGLE
  + ### DRIVEBY\_DOT\_TO\_HIT\_MAXIMUM\_PENALTY

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DRIVEBY\_DOT\_TO\_HIT\_MAXIMUM\_PENALTY
  + ### GLOBAL\_MELEE\_DAMAGE\_REDUCTION\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") GLOBAL\_MELEE\_DAMAGE\_REDUCTION\_MULTIPLIER
  + ### DAMAGE\_PENALTY\_ONE\_HANDED\_TWO\_HANDED\_WEAPON\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") DAMAGE\_PENALTY\_ONE\_HANDED\_TWO\_HANDED\_WEAPON\_MULTIPLIER
  + ### ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_DIVISOR

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_DIVISOR
  + ### ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_SCALE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_TWO\_HANDED\_PENALTY\_SCALE
  + ### ENDURANCE\_LOSS\_FLOOR\_SHOVE\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_FLOOR\_SHOVE\_MULTIPLIER
  + ### ENDURANCE\_LOSS\_CLOSE\_KILL\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_CLOSE\_KILL\_MODIFIER
  + ### ENDURANCE\_LOSS\_BASE\_SCALE

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_BASE\_SCALE
  + ### ENDURANCE\_LOSS\_WEIGHT\_MODIFIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_WEIGHT\_MODIFIER
  + ### ENDURANCE\_LOSS\_FINAL\_MULTIPLIER

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") ENDURANCE\_LOSS\_FINAL\_MULTIPLIER
  + ### BALLISTICS\_CONTROLLER\_DISTANCE\_THRESHOLD

    public static final [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") BALLISTICS\_CONTROLLER\_DISTANCE\_THRESHOLD
* Field Details
  -------------

  + ### category

    private final [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") category
  + ### defaultValue

    private final float defaultValue
  + ### minimum

    private final float minimum
  + ### maximum

    private final float maximum
* Constructor Details
  -------------------

  + ### CombatConfigKey

    private CombatConfigKey([CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") category,
    float defaultValue,
    float minimum,
    float maximum)
* Method Details
  --------------

  + ### values

    public static [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getCategory

    public [CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") getCategory()
  + ### getDefaultValue

    public float getDefaultValue()
  + ### getMinimum

    public float getMinimum()
  + ### getMaximum

    public float getMaximum()