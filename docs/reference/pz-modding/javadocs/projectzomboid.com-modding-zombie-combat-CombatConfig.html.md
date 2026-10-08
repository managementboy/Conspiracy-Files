[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.combat](package-summary.html)
2. [CombatConfig](CombatConfig.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [values](#values)
6. [Constructor Details](#constructor-detail)
   1. [CombatConfig()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [get(CombatConfigKey)](#get(zombie.combat.CombatConfigKey))
   2. [set(CombatConfigKey, float)](#set(zombie.combat.CombatConfigKey,float))
   3. [getByCategory(CombatConfigCategory)](#getByCategory(zombie.combat.CombatConfigCategory))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CombatConfig
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.combat.CombatConfig

---

public class CombatConfig
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final EnumMap<CombatConfigKey, Float>`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CombatConfig()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `get(CombatConfigKey combatConfigKey)`

  `Map<CombatConfigKey, Float>`

  `getByCategory(CombatConfigCategory combatConfigCategory)`

  `void`

  `set(CombatConfigKey combatConfigKey,
  float value)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### values

    private final [EnumMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumMap.html "class or interface in java.util")<[CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat"), [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> values
* Constructor Details
  -------------------

  + ### CombatConfig

    public CombatConfig()
* Method Details
  --------------

  + ### get

    public float get([CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") combatConfigKey)
  + ### set

    public void set([CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat") combatConfigKey,
    float value)
  + ### getByCategory

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CombatConfigKey](CombatConfigKey.html "enum class in zombie.combat"), [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getByCategory([CombatConfigCategory](CombatConfigCategory.html "enum class in zombie.combat") combatConfigCategory)