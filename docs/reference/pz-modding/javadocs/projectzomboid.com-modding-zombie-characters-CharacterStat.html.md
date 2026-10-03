[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterStat](CharacterStat.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [REGISTRY](#REGISTRY)
   2. [ANGER](#ANGER)
   3. [BOREDOM](#BOREDOM)
   4. [DISCOMFORT](#DISCOMFORT)
   5. [ENDURANCE](#ENDURANCE)
   6. [FATIGUE](#FATIGUE)
   7. [FITNESS](#FITNESS)
   8. [FOOD\_SICKNESS](#FOOD_SICKNESS)
   9. [HUNGER](#HUNGER)
   10. [IDLENESS](#IDLENESS)
   11. [INTOXICATION](#INTOXICATION)
   12. [MORALE](#MORALE)
   13. [NICOTINE\_WITHDRAWAL](#NICOTINE_WITHDRAWAL)
   14. [PAIN](#PAIN)
   15. [PANIC](#PANIC)
   16. [POISON](#POISON)
   17. [SANITY](#SANITY)
   18. [SICKNESS](#SICKNESS)
   19. [STRESS](#STRESS)
   20. [TEMPERATURE](#TEMPERATURE)
   21. [THIRST](#THIRST)
   22. [UNHAPPINESS](#UNHAPPINESS)
   23. [WETNESS](#WETNESS)
   24. [ZOMBIE\_FEVER](#ZOMBIE_FEVER)
   25. [ZOMBIE\_INFECTION](#ZOMBIE_INFECTION)
   26. [ORDERED\_STATS](#ORDERED_STATS)
   27. [id](#id)
   28. [minimumValue](#minimumValue)
   29. [maximumValue](#maximumValue)
   30. [defaultValue](#defaultValue)
6. [Constructor Details](#constructor-detail)
   1. [CharacterStat(String, float, float, float)](#%3Cinit%3E(java.lang.String,float,float,float))
7. [Method Details](#method-detail)
   1. [register(String, float, float, float)](#register(java.lang.String,float,float,float))
   2. [getById(String)](#getById(java.lang.String))
   3. [getId()](#getId())
   4. [getMinimumValue()](#getMinimumValue())
   5. [getMaximumValue()](#getMaximumValue())
   6. [clamp(float)](#clamp(float))
   7. [getDefaultValue()](#getDefaultValue())
   8. [isAtMinimum(float)](#isAtMinimum(float))
   9. [isAtMaximum(float)](#isAtMaximum(float))
   10. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterStat
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterStat

---

public class CharacterStat
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final CharacterStat`

  `ANGER`

  `static final CharacterStat`

  `BOREDOM`

  `private final float`

  `defaultValue`

  `static final CharacterStat`

  `DISCOMFORT`

  `static final CharacterStat`

  `ENDURANCE`

  `static final CharacterStat`

  `FATIGUE`

  `static final CharacterStat`

  `FITNESS`

  `static final CharacterStat`

  `FOOD_SICKNESS`

  `static final CharacterStat`

  `HUNGER`

  `private final String`

  `id`

  `static final CharacterStat`

  `IDLENESS`

  `static final CharacterStat`

  `INTOXICATION`

  `private final float`

  `maximumValue`

  `private final float`

  `minimumValue`

  `static final CharacterStat`

  `MORALE`

  `static final CharacterStat`

  `NICOTINE_WITHDRAWAL`

  `static final CharacterStat[]`

  `ORDERED_STATS`

  `static final CharacterStat`

  `PAIN`

  `static final CharacterStat`

  `PANIC`

  `static final CharacterStat`

  `POISON`

  `static final Map<String, CharacterStat>`

  `REGISTRY`

  `static final CharacterStat`

  `SANITY`

  `static final CharacterStat`

  `SICKNESS`

  `static final CharacterStat`

  `STRESS`

  `static final CharacterStat`

  `TEMPERATURE`

  `static final CharacterStat`

  `THIRST`

  `static final CharacterStat`

  `UNHAPPINESS`

  `static final CharacterStat`

  `WETNESS`

  `static final CharacterStat`

  `ZOMBIE_FEVER`

  `static final CharacterStat`

  `ZOMBIE_INFECTION`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CharacterStat(String id,
  float minimumValue,
  float maximumValue,
  float defaultValue)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `clamp(float value)`

  `static CharacterStat`

  `getById(String id)`

  `float`

  `getDefaultValue()`

  `String`

  `getId()`

  `float`

  `getMaximumValue()`

  `float`

  `getMinimumValue()`

  `boolean`

  `isAtMaximum(float value)`

  `boolean`

  `isAtMinimum(float value)`

  `static CharacterStat`

  `register(String id,
  float minimumValue,
  float maximumValue,
  float defaultValue)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### REGISTRY

    public static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [CharacterStat](CharacterStat.html "class in zombie.characters")> REGISTRY
  + ### ANGER

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") ANGER
  + ### BOREDOM

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") BOREDOM
  + ### DISCOMFORT

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") DISCOMFORT
  + ### ENDURANCE

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") ENDURANCE
  + ### FATIGUE

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") FATIGUE
  + ### FITNESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") FITNESS
  + ### FOOD\_SICKNESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") FOOD\_SICKNESS
  + ### HUNGER

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") HUNGER
  + ### IDLENESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") IDLENESS
  + ### INTOXICATION

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") INTOXICATION
  + ### MORALE

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") MORALE
  + ### NICOTINE\_WITHDRAWAL

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") NICOTINE\_WITHDRAWAL
  + ### PAIN

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") PAIN
  + ### PANIC

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") PANIC
  + ### POISON

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") POISON
  + ### SANITY

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") SANITY
  + ### SICKNESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") SICKNESS
  + ### STRESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") STRESS
  + ### TEMPERATURE

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") TEMPERATURE
  + ### THIRST

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") THIRST
  + ### UNHAPPINESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") UNHAPPINESS
  + ### WETNESS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") WETNESS
  + ### ZOMBIE\_FEVER

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") ZOMBIE\_FEVER
  + ### ZOMBIE\_INFECTION

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters") ZOMBIE\_INFECTION
  + ### ORDERED\_STATS

    public static final [CharacterStat](CharacterStat.html "class in zombie.characters")[] ORDERED\_STATS
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### minimumValue

    private final float minimumValue
  + ### maximumValue

    private final float maximumValue
  + ### defaultValue

    private final float defaultValue
* Constructor Details
  -------------------

  + ### CharacterStat

    private CharacterStat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float minimumValue,
    float maximumValue,
    float defaultValue)
* Method Details
  --------------

  + ### register

    public static [CharacterStat](CharacterStat.html "class in zombie.characters") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float minimumValue,
    float maximumValue,
    float defaultValue)
  + ### getById

    public static [CharacterStat](CharacterStat.html "class in zombie.characters") getById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getMinimumValue

    public float getMinimumValue()
  + ### getMaximumValue

    public float getMaximumValue()
  + ### clamp

    public float clamp(float value)
  + ### getDefaultValue

    public float getDefaultValue()
  + ### isAtMinimum

    public boolean isAtMinimum(float value)
  + ### isAtMaximum

    public boolean isAtMaximum(float value)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`