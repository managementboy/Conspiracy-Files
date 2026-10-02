[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.scripting.itemConfig.generators](package-summary.html)
2. [GeneratorBoolAttribute](GeneratorBoolAttribute.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [attributeType](#attributeType)
   2. [value](#value)
6. [Constructor Details](#constructor-detail)
   1. [GeneratorBoolAttribute(AttributeType, boolean)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,boolean))
   2. [GeneratorBoolAttribute(AttributeType, float, boolean)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,float,boolean))
7. [Method Details](#method-detail)
   1. [execute(GameEntity)](#execute(zombie.entity.GameEntity))
   2. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class GeneratorBoolAttribute
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.itemConfig.RandomGenerator<[GeneratorBoolAttribute](GeneratorBoolAttribute.html "class in zombie.scripting.itemConfig.generators")>

zombie.scripting.itemConfig.generators.GeneratorBoolAttribute

---

public class GeneratorBoolAttribute
extends zombie.scripting.itemConfig.RandomGenerator<[GeneratorBoolAttribute](GeneratorBoolAttribute.html "class in zombie.scripting.itemConfig.generators")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final AttributeType.Bool`

  `attributeType`

  `private final boolean`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GeneratorBoolAttribute(AttributeType attributeType,
  boolean b)`

  `GeneratorBoolAttribute(AttributeType attributeType,
  float chance,
  boolean b)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GeneratorBoolAttribute`

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

    private final [AttributeType.Bool](../../../entity/components/attributes/AttributeType.Bool.html "class in zombie.entity.components.attributes") attributeType
  + ### value

    private final boolean value
* Constructor Details
  -------------------

  + ### GeneratorBoolAttribute

    public GeneratorBoolAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    boolean b)
  + ### GeneratorBoolAttribute

    public GeneratorBoolAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    float chance,
    boolean b)
* Method Details
  --------------

  + ### execute

    public boolean execute([GameEntity](../../../entity/GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `execute` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorBoolAttribute>`
  + ### copy

    public [GeneratorBoolAttribute](GeneratorBoolAttribute.html "class in zombie.scripting.itemConfig.generators") copy()

    Specified by:
    :   `copy` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorBoolAttribute>`