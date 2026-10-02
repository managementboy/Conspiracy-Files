[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ItemType](ItemType.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ALARM\_CLOCK](#ALARM_CLOCK)
   2. [ALARM\_CLOCK\_CLOTHING](#ALARM_CLOCK_CLOTHING)
   3. [ANIMAL](#ANIMAL)
   4. [CLOTHING](#CLOTHING)
   5. [CONTAINER](#CONTAINER)
   6. [DRAINABLE](#DRAINABLE)
   7. [FOOD](#FOOD)
   8. [KEY](#KEY)
   9. [KEY\_RING](#KEY_RING)
   10. [LITERATURE](#LITERATURE)
   11. [MAP](#MAP)
   12. [MOVEABLE](#MOVEABLE)
   13. [NORMAL](#NORMAL)
   14. [RADIO](#RADIO)
   15. [WEAPON](#WEAPON)
   16. [WEAPON\_PART](#WEAPON_PART)
   17. [translationName](#translationName)
6. [Constructor Details](#constructor-detail)
   1. [ItemType(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [toString()](#toString())
   3. [register(String)](#register(java.lang.String))
   4. [registerBase(String)](#registerBase(java.lang.String))
   5. [getTranslationName()](#getTranslationName())
   6. [register(boolean, String)](#register(boolean,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemType
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.ItemType

---

public class ItemType
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ItemType`

  `ALARM_CLOCK`

  `static final ItemType`

  `ALARM_CLOCK_CLOTHING`

  `static final ItemType`

  `ANIMAL`

  `static final ItemType`

  `CLOTHING`

  `static final ItemType`

  `CONTAINER`

  `static final ItemType`

  `DRAINABLE`

  `static final ItemType`

  `FOOD`

  `static final ItemType`

  `KEY`

  `static final ItemType`

  `KEY_RING`

  `static final ItemType`

  `LITERATURE`

  `static final ItemType`

  `MAP`

  `static final ItemType`

  `MOVEABLE`

  `static final ItemType`

  `NORMAL`

  `static final ItemType`

  `RADIO`

  `private final String`

  `translationName`

  `static final ItemType`

  `WEAPON`

  `static final ItemType`

  `WEAPON_PART`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ItemType(String translationName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ItemType`

  `get(ResourceLocation id)`

  `String`

  `getTranslationName()`

  `private static ItemType`

  `register(boolean allowDefaultNamespace,
  String id)`

  `static ItemType`

  `register(String id)`

  `private static ItemType`

  `registerBase(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### ALARM\_CLOCK

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") ALARM\_CLOCK
  + ### ALARM\_CLOCK\_CLOTHING

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") ALARM\_CLOCK\_CLOTHING
  + ### ANIMAL

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") ANIMAL
  + ### CLOTHING

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") CLOTHING
  + ### CONTAINER

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") CONTAINER
  + ### DRAINABLE

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") DRAINABLE
  + ### FOOD

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") FOOD
  + ### KEY

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") KEY
  + ### KEY\_RING

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") KEY\_RING
  + ### LITERATURE

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") LITERATURE
  + ### MAP

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") MAP
  + ### MOVEABLE

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") MOVEABLE
  + ### NORMAL

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") NORMAL
  + ### RADIO

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") RADIO
  + ### WEAPON

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") WEAPON
  + ### WEAPON\_PART

    public static final [ItemType](ItemType.html "class in zombie.scripting.objects") WEAPON\_PART
  + ### translationName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
* Constructor Details
  -------------------

  + ### ItemType

    private ItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName)
* Method Details
  --------------

  + ### get

    public static [ItemType](ItemType.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### register

    public static [ItemType](ItemType.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [ItemType](ItemType.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### register

    private static [ItemType](ItemType.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)