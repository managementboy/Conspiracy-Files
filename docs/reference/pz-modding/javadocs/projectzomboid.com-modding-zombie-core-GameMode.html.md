[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [GameMode](GameMode.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [APOCALYPSE](#APOCALYPSE)
   2. [OUTBREAK](#OUTBREAK)
   3. [EXTINCTION](#EXTINCTION)
   4. [RISING](#RISING)
   5. [SANDBOX](#SANDBOX)
   6. [CHALLENGES](#CHALLENGES)
   7. [id](#id)
   8. [title](#title)
   9. [description](#description)
   10. [thumbnail](#thumbnail)
   11. [video](#video)
6. [Constructor Details](#constructor-detail)
   1. [GameMode(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [getTitle()](#getTitle())
   3. [getDescription()](#getDescription())
   4. [getThumbnail()](#getThumbnail())
   5. [getVideo()](#getVideo())
   6. [toString()](#toString())
   7. [register(String)](#register(java.lang.String))
   8. [registerBase(String)](#registerBase(java.lang.String))
   9. [register(boolean, String)](#register(boolean,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameMode
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.GameMode

---

public class GameMode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final GameMode`

  `APOCALYPSE`

  `static final GameMode`

  `CHALLENGES`

  `private final String`

  `description`

  `static final GameMode`

  `EXTINCTION`

  `private final String`

  `id`

  `static final GameMode`

  `OUTBREAK`

  `static final GameMode`

  `RISING`

  `static final GameMode`

  `SANDBOX`

  `private final String`

  `thumbnail`

  `private final String`

  `title`

  `private final String`

  `video`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `GameMode(String id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static GameMode`

  `get(ResourceLocation id)`

  `String`

  `getDescription()`

  `String`

  `getThumbnail()`

  `String`

  `getTitle()`

  `String`

  `getVideo()`

  `private static GameMode`

  `register(boolean allowDefaultNamespace,
  String id)`

  `static GameMode`

  `register(String id)`

  `private static GameMode`

  `registerBase(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### APOCALYPSE

    public static final [GameMode](GameMode.html "class in zombie.core") APOCALYPSE
  + ### OUTBREAK

    public static final [GameMode](GameMode.html "class in zombie.core") OUTBREAK
  + ### EXTINCTION

    public static final [GameMode](GameMode.html "class in zombie.core") EXTINCTION
  + ### RISING

    public static final [GameMode](GameMode.html "class in zombie.core") RISING
  + ### SANDBOX

    public static final [GameMode](GameMode.html "class in zombie.core") SANDBOX
  + ### CHALLENGES

    public static final [GameMode](GameMode.html "class in zombie.core") CHALLENGES
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### title

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### description

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### thumbnail

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") thumbnail
  + ### video

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") video
* Constructor Details
  -------------------

  + ### GameMode

    private GameMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### get

    public static [GameMode](GameMode.html "class in zombie.core") get([ResourceLocation](../scripting/objects/ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### getThumbnail

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getThumbnail()
  + ### getVideo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVideo()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### register

    public static [GameMode](GameMode.html "class in zombie.core") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [GameMode](GameMode.html "class in zombie.core") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### register

    private static [GameMode](GameMode.html "class in zombie.core") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)