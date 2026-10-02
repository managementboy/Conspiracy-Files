[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [ChooseGameInfo](ChooseGameInfo.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [Maps](#Maps)
   2. [Mods](#Mods)
   3. [MissingMods](#MissingMods)
   4. [tempStrings](#tempStrings)
   5. [minRequiredVersion](#minRequiredVersion)
7. [Constructor Details](#constructor-detail)
   1. [ChooseGameInfo()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Reset()](#Reset())
   2. [getMinRequiredVersion()](#getMinRequiredVersion())
   3. [getMapDetails(String)](#getMapDetails(java.lang.String))
   4. [getModDetails(String)](#getModDetails(java.lang.String))
   5. [getAvailableModDetails(String)](#getAvailableModDetails(java.lang.String))
   6. [readModInfo(String)](#readModInfo(java.lang.String))
   7. [readModInfoAux(String)](#readModInfoAux(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ChooseGameInfo
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.ChooseGameInfo

---

public final class ChooseGameInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `ChooseGameInfo.Map`

  `static final class`

  `ChooseGameInfo.Mod`

  `static final class`

  `ChooseGameInfo.PackFile`

  `static final class`

  `ChooseGameInfo.SpawnOrigin`

  `static final class`

  `ChooseGameInfo.TileDef`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<String, ChooseGameInfo.Map>`

  `Maps`

  `private static final GameVersion`

  `minRequiredVersion`

  `private static final HashSet<String>`

  `MissingMods`

  `private static final HashMap<String, ChooseGameInfo.Mod>`

  `Mods`

  `private static final ArrayList<String>`

  `tempStrings`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ChooseGameInfo()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ChooseGameInfo.Mod`

  `getAvailableModDetails(String modId)`

  `static ChooseGameInfo.Map`

  `getMapDetails(String dir)`

  `static GameVersion`

  `getMinRequiredVersion()`

  `static ChooseGameInfo.Mod`

  `getModDetails(String modId)`

  `static ChooseGameInfo.Mod`

  `readModInfo(String modDir)`

  `private static ChooseGameInfo.Mod`

  `readModInfoAux(String modDir)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### Maps

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ChooseGameInfo.Map](ChooseGameInfo.Map.html "class in zombie.gameStates")> Maps
  + ### Mods

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ChooseGameInfo.Mod](ChooseGameInfo.Mod.html "class in zombie.gameStates")> Mods
  + ### MissingMods

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> MissingMods
  + ### tempStrings

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tempStrings
  + ### minRequiredVersion

    private static final [GameVersion](../core/GameVersion.html "class in zombie.core") minRequiredVersion
* Constructor Details
  -------------------

  + ### ChooseGameInfo

    private ChooseGameInfo()
* Method Details
  --------------

  + ### Reset

    public static void Reset()
  + ### getMinRequiredVersion

    public static [GameVersion](../core/GameVersion.html "class in zombie.core") getMinRequiredVersion()
  + ### getMapDetails

    public static [ChooseGameInfo.Map](ChooseGameInfo.Map.html "class in zombie.gameStates") getMapDetails([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir)
  + ### getModDetails

    public static [ChooseGameInfo.Mod](ChooseGameInfo.Mod.html "class in zombie.gameStates") getModDetails([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId)
  + ### getAvailableModDetails

    public static [ChooseGameInfo.Mod](ChooseGameInfo.Mod.html "class in zombie.gameStates") getAvailableModDetails([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId)
  + ### readModInfo

    public static [ChooseGameInfo.Mod](ChooseGameInfo.Mod.html "class in zombie.gameStates") readModInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDir)
  + ### readModInfoAux

    private static [ChooseGameInfo.Mod](ChooseGameInfo.Mod.html "class in zombie.gameStates") readModInfoAux([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDir)