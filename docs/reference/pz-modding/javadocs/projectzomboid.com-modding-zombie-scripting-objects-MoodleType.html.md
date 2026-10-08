[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [MoodleType](MoodleType.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ENDURANCE](#ENDURANCE)
   2. [TIRED](#TIRED)
   3. [HUNGRY](#HUNGRY)
   4. [PANIC](#PANIC)
   5. [SICK](#SICK)
   6. [BORED](#BORED)
   7. [UNHAPPY](#UNHAPPY)
   8. [BLEEDING](#BLEEDING)
   9. [WET](#WET)
   10. [HAS\_A\_COLD](#HAS_A_COLD)
   11. [ANGRY](#ANGRY)
   12. [STRESS](#STRESS)
   13. [THIRST](#THIRST)
   14. [INJURED](#INJURED)
   15. [PAIN](#PAIN)
   16. [HEAVY\_LOAD](#HEAVY_LOAD)
   17. [DRUNK](#DRUNK)
   18. [DEAD](#DEAD)
   19. [ZOMBIE](#ZOMBIE)
   20. [HYPERTHERMIA](#HYPERTHERMIA)
   21. [HYPOTHERMIA](#HYPOTHERMIA)
   22. [WINDCHILL](#WINDCHILL)
   23. [CANT\_SPRINT](#CANT_SPRINT)
   24. [UNCOMFORTABLE](#UNCOMFORTABLE)
   25. [NOXIOUS\_SMELL](#NOXIOUS_SMELL)
   26. [FOOD\_EATEN](#FOOD_EATEN)
   27. [translationName](#translationName)
6. [Constructor Details](#constructor-detail)
   1. [MoodleType(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [toString()](#toString())
   3. [getTranslationName()](#getTranslationName())
   4. [register(String)](#register(java.lang.String))
   5. [registerBase(String)](#registerBase(java.lang.String))
   6. [register(boolean, String)](#register(boolean,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MoodleType
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.MoodleType

---

public class MoodleType
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final MoodleType`

  `ANGRY`

  `static final MoodleType`

  `BLEEDING`

  `static final MoodleType`

  `BORED`

  `static final MoodleType`

  `CANT_SPRINT`

  `static final MoodleType`

  `DEAD`

  `static final MoodleType`

  `DRUNK`

  `static final MoodleType`

  `ENDURANCE`

  `static final MoodleType`

  `FOOD_EATEN`

  `static final MoodleType`

  `HAS_A_COLD`

  `static final MoodleType`

  `HEAVY_LOAD`

  `static final MoodleType`

  `HUNGRY`

  `static final MoodleType`

  `HYPERTHERMIA`

  `static final MoodleType`

  `HYPOTHERMIA`

  `static final MoodleType`

  `INJURED`

  `static final MoodleType`

  `NOXIOUS_SMELL`

  `static final MoodleType`

  `PAIN`

  `static final MoodleType`

  `PANIC`

  `static final MoodleType`

  `SICK`

  `static final MoodleType`

  `STRESS`

  `static final MoodleType`

  `THIRST`

  `static final MoodleType`

  `TIRED`

  `private final String`

  `translationName`

  `static final MoodleType`

  `UNCOMFORTABLE`

  `static final MoodleType`

  `UNHAPPY`

  `static final MoodleType`

  `WET`

  `static final MoodleType`

  `WINDCHILL`

  `static final MoodleType`

  `ZOMBIE`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MoodleType(String translationName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static MoodleType`

  `get(ResourceLocation id)`

  `String`

  `getTranslationName()`

  `private static MoodleType`

  `register(boolean allowDefaultNamespace,
  String id)`

  `static MoodleType`

  `register(String id)`

  `private static MoodleType`

  `registerBase(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### ENDURANCE

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") ENDURANCE
  + ### TIRED

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") TIRED
  + ### HUNGRY

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") HUNGRY
  + ### PANIC

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") PANIC
  + ### SICK

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") SICK
  + ### BORED

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") BORED
  + ### UNHAPPY

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") UNHAPPY
  + ### BLEEDING

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") BLEEDING
  + ### WET

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") WET
  + ### HAS\_A\_COLD

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") HAS\_A\_COLD
  + ### ANGRY

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") ANGRY
  + ### STRESS

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") STRESS
  + ### THIRST

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") THIRST
  + ### INJURED

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") INJURED
  + ### PAIN

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") PAIN
  + ### HEAVY\_LOAD

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") HEAVY\_LOAD
  + ### DRUNK

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") DRUNK
  + ### DEAD

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") DEAD
  + ### ZOMBIE

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") ZOMBIE
  + ### HYPERTHERMIA

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") HYPERTHERMIA
  + ### HYPOTHERMIA

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") HYPOTHERMIA
  + ### WINDCHILL

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") WINDCHILL
  + ### CANT\_SPRINT

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") CANT\_SPRINT
  + ### UNCOMFORTABLE

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") UNCOMFORTABLE
  + ### NOXIOUS\_SMELL

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") NOXIOUS\_SMELL
  + ### FOOD\_EATEN

    public static final [MoodleType](MoodleType.html "class in zombie.scripting.objects") FOOD\_EATEN
  + ### translationName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
* Constructor Details
  -------------------

  + ### MoodleType

    private MoodleType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName)
* Method Details
  --------------

  + ### get

    public static [MoodleType](MoodleType.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### register

    public static [MoodleType](MoodleType.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [MoodleType](MoodleType.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### register

    private static [MoodleType](MoodleType.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)