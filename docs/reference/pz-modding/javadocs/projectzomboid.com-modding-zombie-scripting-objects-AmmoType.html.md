[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [AmmoType](AmmoType.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [BULLETS\_3030](#BULLETS_3030)
   2. [BULLETS\_308](#BULLETS_308)
   3. [BULLETS\_357](#BULLETS_357)
   4. [BULLETS\_38](#BULLETS_38)
   5. [BULLETS\_44](#BULLETS_44)
   6. [BULLETS\_45](#BULLETS_45)
   7. [BULLETS\_556](#BULLETS_556)
   8. [BULLETS\_9MM](#BULLETS_9MM)
   9. [CAP\_GUN\_CAP](#CAP_GUN_CAP)
   10. [SHOTGUN\_SHELLS](#SHOTGUN_SHELLS)
   11. [itemKey](#itemKey)
   12. [translationName](#translationName)
6. [Constructor Details](#constructor-detail)
   1. [AmmoType(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [getByItemKey(String)](#getByItemKey(java.lang.String))
   3. [toString()](#toString())
   4. [getItemKey()](#getItemKey())
   5. [getTranslationName()](#getTranslationName())
   6. [register(String, String)](#register(java.lang.String,java.lang.String))
   7. [registerBase(String, ItemKey)](#registerBase(java.lang.String,zombie.scripting.objects.ItemKey))
   8. [register(boolean, String, AmmoType)](#register(boolean,java.lang.String,zombie.scripting.objects.AmmoType))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AmmoType
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.AmmoType

---

public class AmmoType
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final AmmoType`

  `BULLETS_3030`

  `static final AmmoType`

  `BULLETS_308`

  `static final AmmoType`

  `BULLETS_357`

  `static final AmmoType`

  `BULLETS_38`

  `static final AmmoType`

  `BULLETS_44`

  `static final AmmoType`

  `BULLETS_45`

  `static final AmmoType`

  `BULLETS_556`

  `static final AmmoType`

  `BULLETS_9MM`

  `static final AmmoType`

  `CAP_GUN_CAP`

  `private final String`

  `itemKey`

  `static final AmmoType`

  `SHOTGUN_SHELLS`

  `private final String`

  `translationName`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AmmoType(String itemKey,
  String translationName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AmmoType`

  `get(ResourceLocation id)`

  `static Optional<AmmoType>`

  `getByItemKey(String key)`

  `String`

  `getItemKey()`

  `String`

  `getTranslationName()`

  `private static AmmoType`

  `register(boolean allowDefaultNamespace,
  String id,
  AmmoType t)`

  `static AmmoType`

  `register(String id,
  String itemKey)`

  `private static AmmoType`

  `registerBase(String id,
  ItemKey itemKey)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### BULLETS\_3030

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_3030
  + ### BULLETS\_308

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_308
  + ### BULLETS\_357

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_357
  + ### BULLETS\_38

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_38
  + ### BULLETS\_44

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_44
  + ### BULLETS\_45

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_45
  + ### BULLETS\_556

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_556
  + ### BULLETS\_9MM

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") BULLETS\_9MM
  + ### CAP\_GUN\_CAP

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") CAP\_GUN\_CAP
  + ### SHOTGUN\_SHELLS

    public static final [AmmoType](AmmoType.html "class in zombie.scripting.objects") SHOTGUN\_SHELLS
  + ### itemKey

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemKey
  + ### translationName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
* Constructor Details
  -------------------

  + ### AmmoType

    private AmmoType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemKey,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName)
* Method Details
  --------------

  + ### get

    public static [AmmoType](AmmoType.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### getByItemKey

    public static [Optional](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Optional.html "class or interface in java.util")<[AmmoType](AmmoType.html "class in zombie.scripting.objects")> getByItemKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getItemKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemKey()
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### register

    public static [AmmoType](AmmoType.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemKey)
  + ### registerBase

    private static [AmmoType](AmmoType.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ItemKey](ItemKey.html "class in zombie.scripting.objects") itemKey)
  + ### register

    private static [AmmoType](AmmoType.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [AmmoType](AmmoType.html "class in zombie.scripting.objects") t)