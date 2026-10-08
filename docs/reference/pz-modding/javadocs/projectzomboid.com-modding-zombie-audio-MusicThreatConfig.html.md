[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [MusicThreatConfig](MusicThreatConfig.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [statusList](#statusList)
   3. [statusById](#statusById)
7. [Constructor Details](#constructor-detail)
   1. [MusicThreatConfig()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [initStatuses(KahluaTableImpl)](#initStatuses(se.krka.kahlua.j2se.KahluaTableImpl))
   3. [getStatusCount()](#getStatusCount())
   4. [getStatusIdByIndex(int)](#getStatusIdByIndex(int))
   5. [getStatusIntensityByIndex(int)](#getStatusIntensityByIndex(int))
   6. [getStatusIntensity(String)](#getStatusIntensity(java.lang.String))
   7. [setStatusIntensityOverride(String, float)](#setStatusIntensityOverride(java.lang.String,float))
   8. [getStatusIntensityOverride(String)](#getStatusIntensityOverride(java.lang.String))
   9. [isStatusIntensityOverridden(String)](#isStatusIntensityOverridden(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MusicThreatConfig
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.MusicThreatConfig

---

public final class MusicThreatConfig
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `MusicThreatConfig.Status`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static MusicThreatConfig`

  `instance`

  `private final HashMap<String, MusicThreatConfig.Status>`

  `statusById`

  `private final ArrayList<MusicThreatConfig.Status>`

  `statusList`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MusicThreatConfig()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static MusicThreatConfig`

  `getInstance()`

  `int`

  `getStatusCount()`

  `String`

  `getStatusIdByIndex(int index)`

  `float`

  `getStatusIntensity(String id)`

  `float`

  `getStatusIntensityByIndex(int index)`

  `float`

  `getStatusIntensityOverride(String id)`

  `void`

  `initStatuses(se.krka.kahlua.j2se.KahluaTableImpl statusesTable)`

  `boolean`

  `isStatusIntensityOverridden(String id)`

  `void`

  `setStatusIntensityOverride(String id,
  float intensity)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [MusicThreatConfig](MusicThreatConfig.html "class in zombie.audio") instance
  + ### statusList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MusicThreatConfig.Status](MusicThreatConfig.Status.html "class in zombie.audio")> statusList
  + ### statusById

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [MusicThreatConfig.Status](MusicThreatConfig.Status.html "class in zombie.audio")> statusById
* Constructor Details
  -------------------

  + ### MusicThreatConfig

    public MusicThreatConfig()
* Method Details
  --------------

  + ### getInstance

    public static [MusicThreatConfig](MusicThreatConfig.html "class in zombie.audio") getInstance()
  + ### initStatuses

    public void initStatuses(se.krka.kahlua.j2se.KahluaTableImpl statusesTable)
  + ### getStatusCount

    public int getStatusCount()
  + ### getStatusIdByIndex

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStatusIdByIndex(int index)
  + ### getStatusIntensityByIndex

    public float getStatusIntensityByIndex(int index)
  + ### getStatusIntensity

    public float getStatusIntensity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### setStatusIntensityOverride

    public void setStatusIntensityOverride([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float intensity)
  + ### getStatusIntensityOverride

    public float getStatusIntensityOverride([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### isStatusIntensityOverridden

    public boolean isStatusIntensityOverridden([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)