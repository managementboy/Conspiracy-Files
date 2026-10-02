[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [WeaponCategory](WeaponCategory.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [AXE](#AXE)
   2. [BLUNT](#BLUNT)
   3. [IMPROVISED](#IMPROVISED)
   4. [LONG\_BLADE](#LONG_BLADE)
   5. [SMALL\_BLADE](#SMALL_BLADE)
   6. [SMALL\_BLUNT](#SMALL_BLUNT)
   7. [SPEAR](#SPEAR)
   8. [UNARMED](#UNARMED)
   9. [translationName](#translationName)
6. [Constructor Details](#constructor-detail)
   1. [WeaponCategory(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [toString()](#toString())
   3. [getTranslationName()](#getTranslationName())
   4. [register(String)](#register(java.lang.String))
   5. [registerBase(String)](#registerBase(java.lang.String))
   6. [register(boolean, String)](#register(boolean,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WeaponCategory
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.WeaponCategory

---

public class WeaponCategory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final WeaponCategory`

  `AXE`

  `static final WeaponCategory`

  `BLUNT`

  `static final WeaponCategory`

  `IMPROVISED`

  `static final WeaponCategory`

  `LONG_BLADE`

  `static final WeaponCategory`

  `SMALL_BLADE`

  `static final WeaponCategory`

  `SMALL_BLUNT`

  `static final WeaponCategory`

  `SPEAR`

  `private final String`

  `translationName`

  `static final WeaponCategory`

  `UNARMED`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WeaponCategory(String translationName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static WeaponCategory`

  `get(ResourceLocation id)`

  `String`

  `getTranslationName()`

  `private static WeaponCategory`

  `register(boolean allowDefaultNamespace,
  String id)`

  `static WeaponCategory`

  `register(String id)`

  `private static WeaponCategory`

  `registerBase(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### AXE

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") AXE
  + ### BLUNT

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") BLUNT
  + ### IMPROVISED

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") IMPROVISED
  + ### LONG\_BLADE

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") LONG\_BLADE
  + ### SMALL\_BLADE

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") SMALL\_BLADE
  + ### SMALL\_BLUNT

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") SMALL\_BLUNT
  + ### SPEAR

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") SPEAR
  + ### UNARMED

    public static final [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") UNARMED
  + ### translationName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
* Constructor Details
  -------------------

  + ### WeaponCategory

    private WeaponCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName)
* Method Details
  --------------

  + ### get

    public static [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### register

    public static [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### register

    private static [WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)