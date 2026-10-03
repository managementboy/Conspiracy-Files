[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.scripting.itemConfig.generators](package-summary.html)
2. [GeneratorNumericAttribute](GeneratorNumericAttribute.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [attributeType](#attributeType)
   2. [min](#min)
   3. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [GeneratorNumericAttribute(AttributeType, float)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,float))
   2. [GeneratorNumericAttribute(AttributeType, float, float)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,float,float))
   3. [GeneratorNumericAttribute(AttributeType, float, float, float)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,float,float,float))
7. [Method Details](#method-detail)
   1. [execute(GameEntity)](#execute(zombie.entity.GameEntity))
   2. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class GeneratorNumericAttribute
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.itemConfig.RandomGenerator<[GeneratorNumericAttribute](GeneratorNumericAttribute.html "class in zombie.scripting.itemConfig.generators")>

zombie.scripting.itemConfig.generators.GeneratorNumericAttribute

---

public class GeneratorNumericAttribute
extends zombie.scripting.itemConfig.RandomGenerator<[GeneratorNumericAttribute](GeneratorNumericAttribute.html "class in zombie.scripting.itemConfig.generators")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final AttributeType.Numeric<?,?>`

  `attributeType`

  `private final float`

  `max`

  `private final float`

  `min`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GeneratorNumericAttribute(AttributeType attributeType,
  float max)`

  `GeneratorNumericAttribute(AttributeType attributeType,
  float min,
  float max)`

  `GeneratorNumericAttribute(AttributeType attributeType,
  float chance,
  float min,
  float max)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GeneratorNumericAttribute`

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

    private final [AttributeType.Numeric](../../../entity/components/attributes/AttributeType.Numeric.html "class in zombie.entity.components.attributes")<?,?> attributeType
  + ### min

    private final float min
  + ### max

    private final float max
* Constructor Details
  -------------------

  + ### GeneratorNumericAttribute

    public GeneratorNumericAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    float max)
  + ### GeneratorNumericAttribute

    public GeneratorNumericAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    float min,
    float max)
  + ### GeneratorNumericAttribute

    public GeneratorNumericAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    float chance,
    float min,
    float max)
* Method Details
  --------------

  + ### execute

    public boolean execute([GameEntity](../../../entity/GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `execute` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorNumericAttribute>`
  + ### copy

    public [GeneratorNumericAttribute](GeneratorNumericAttribute.html "class in zombie.scripting.itemConfig.generators") copy()

    Specified by:
    :   `copy` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorNumericAttribute>`