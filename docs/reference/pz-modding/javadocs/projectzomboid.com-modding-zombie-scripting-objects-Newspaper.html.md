[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Newspaper](Newspaper.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [KENTUCKY\_HERALD](#KENTUCKY_HERALD)
   2. [KNOX\_KNEWS](#KNOX_KNEWS)
   3. [LOUISVILLE\_SUN\_TIMES](#LOUISVILLE_SUN_TIMES)
   4. [NATIONAL\_DISPATCH](#NATIONAL_DISPATCH)
   5. [translationKey](#translationKey)
   6. [issues](#issues)
6. [Constructor Details](#constructor-detail)
   1. [Newspaper(String, List)](#%3Cinit%3E(java.lang.String,java.util.List))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [toString()](#toString())
   3. [getTranslationKey()](#getTranslationKey())
   4. [getIssues()](#getIssues())
   5. [getTitle(String)](#getTitle(java.lang.String))
   6. [getTranslationInfoKey(String)](#getTranslationInfoKey(java.lang.String))
   7. [getTranslationTextKey(String)](#getTranslationTextKey(java.lang.String))
   8. [register(String, List)](#register(java.lang.String,java.util.List))
   9. [registerBase(String, List)](#registerBase(java.lang.String,java.util.List))
   10. [register(boolean, String, Newspaper)](#register(boolean,java.lang.String,zombie.scripting.objects.Newspaper))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Newspaper
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Newspaper

---

public class Newspaper
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final List<String>`

  `issues`

  `static final Newspaper`

  `KENTUCKY_HERALD`

  `static final Newspaper`

  `KNOX_KNEWS`

  `static final Newspaper`

  `LOUISVILLE_SUN_TIMES`

  `static final Newspaper`

  `NATIONAL_DISPATCH`

  `private final String`

  `translationKey`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Newspaper(String id,
  List<String> issues)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Newspaper`

  `get(ResourceLocation id)`

  `List<String>`

  `getIssues()`

  `String`

  `getTitle(String title)`

  `String`

  `getTranslationInfoKey(String issue)`

  `String`

  `getTranslationKey()`

  `String`

  `getTranslationTextKey(String issue)`

  `private static Newspaper`

  `register(boolean allowDefaultNamespace,
  String id,
  Newspaper t)`

  `static Newspaper`

  `register(String id,
  List<String> issues)`

  `private static Newspaper`

  `registerBase(String id,
  List<String> issues)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### KENTUCKY\_HERALD

    public static final [Newspaper](Newspaper.html "class in zombie.scripting.objects") KENTUCKY\_HERALD
  + ### KNOX\_KNEWS

    public static final [Newspaper](Newspaper.html "class in zombie.scripting.objects") KNOX\_KNEWS
  + ### LOUISVILLE\_SUN\_TIMES

    public static final [Newspaper](Newspaper.html "class in zombie.scripting.objects") LOUISVILLE\_SUN\_TIMES
  + ### NATIONAL\_DISPATCH

    public static final [Newspaper](Newspaper.html "class in zombie.scripting.objects") NATIONAL\_DISPATCH
  + ### translationKey

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationKey
  + ### issues

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> issues
* Constructor Details
  -------------------

  + ### Newspaper

    private Newspaper([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> issues)
* Method Details
  --------------

  + ### get

    public static [Newspaper](Newspaper.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getTranslationKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationKey()
  + ### getIssues

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getIssues()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getTranslationInfoKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationInfoKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") issue)
  + ### getTranslationTextKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationTextKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") issue)
  + ### register

    public static [Newspaper](Newspaper.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> issues)
  + ### registerBase

    private static [Newspaper](Newspaper.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> issues)
  + ### register

    private static [Newspaper](Newspaper.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [Newspaper](Newspaper.html "class in zombie.scripting.objects") t)