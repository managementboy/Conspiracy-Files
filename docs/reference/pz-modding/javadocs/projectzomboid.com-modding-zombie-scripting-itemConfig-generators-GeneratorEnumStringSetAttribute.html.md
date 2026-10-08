[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.scripting.itemConfig.generators](package-summary.html)
2. [GeneratorEnumStringSetAttribute](GeneratorEnumStringSetAttribute.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [attributeType](#attributeType)
   2. [enumsValues](#enumsValues)
   3. [stringValues](#stringValues)
   4. [mode](#mode)
7. [Constructor Details](#constructor-detail)
   1. [GeneratorEnumStringSetAttribute(AttributeType, GeneratorEnumStringSetAttribute.Mode, String[], String[])](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,zombie.scripting.itemConfig.generators.GeneratorEnumStringSetAttribute.Mode,java.lang.String%5B%5D,java.lang.String%5B%5D))
   2. [GeneratorEnumStringSetAttribute(AttributeType, GeneratorEnumStringSetAttribute.Mode, float, String[], String[])](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,zombie.scripting.itemConfig.generators.GeneratorEnumStringSetAttribute.Mode,float,java.lang.String%5B%5D,java.lang.String%5B%5D))
8. [Method Details](#method-detail)
   1. [execute(GameEntity)](#execute(zombie.entity.GameEntity))
   2. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class GeneratorEnumStringSetAttribute
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.itemConfig.RandomGenerator<[GeneratorEnumStringSetAttribute](GeneratorEnumStringSetAttribute.html "class in zombie.scripting.itemConfig.generators")>

zombie.scripting.itemConfig.generators.GeneratorEnumStringSetAttribute

---

public class GeneratorEnumStringSetAttribute
extends zombie.scripting.itemConfig.RandomGenerator<[GeneratorEnumStringSetAttribute](GeneratorEnumStringSetAttribute.html "class in zombie.scripting.itemConfig.generators")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `GeneratorEnumStringSetAttribute.Mode`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final AttributeType.EnumStringSet`

  `attributeType`

  `private final String[]`

  `enumsValues`

  `private final GeneratorEnumStringSetAttribute.Mode`

  `mode`

  `private final String[]`

  `stringValues`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GeneratorEnumStringSetAttribute(AttributeType attributeType,
  GeneratorEnumStringSetAttribute.Mode mode,
  float chance,
  String[] enums,
  String[] strings)`

  `GeneratorEnumStringSetAttribute(AttributeType attributeType,
  GeneratorEnumStringSetAttribute.Mode mode,
  String[] enums,
  String[] strings)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GeneratorEnumStringSetAttribute`

  `copy()`

  `boolean`

  `execute(GameEntity entity)`

  ### Methods inherited from class zombie.scripting.itemConfig.RandomGenerator

  `getChance, setChance`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### attributeType

    private final [AttributeType.EnumStringSet](../../../entity/components/attributes/AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes") attributeType
  + ### enumsValues

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] enumsValues
  + ### stringValues

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] stringValues
  + ### mode

    private final [GeneratorEnumStringSetAttribute.Mode](GeneratorEnumStringSetAttribute.Mode.html "enum class in zombie.scripting.itemConfig.generators") mode
* Constructor Details
  -------------------

  + ### GeneratorEnumStringSetAttribute

    public GeneratorEnumStringSetAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [GeneratorEnumStringSetAttribute.Mode](GeneratorEnumStringSetAttribute.Mode.html "enum class in zombie.scripting.itemConfig.generators") mode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] enums,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] strings)
  + ### GeneratorEnumStringSetAttribute

    public GeneratorEnumStringSetAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [GeneratorEnumStringSetAttribute.Mode](GeneratorEnumStringSetAttribute.Mode.html "enum class in zombie.scripting.itemConfig.generators") mode,
    float chance,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] enums,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] strings)
* Method Details
  --------------

  + ### execute

    public boolean execute([GameEntity](../../../entity/GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `execute` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorEnumStringSetAttribute>`
  + ### copy

    public [GeneratorEnumStringSetAttribute](GeneratorEnumStringSetAttribute.html "class in zombie.scripting.itemConfig.generators") copy()

    Specified by:
    :   `copy` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorEnumStringSetAttribute>`