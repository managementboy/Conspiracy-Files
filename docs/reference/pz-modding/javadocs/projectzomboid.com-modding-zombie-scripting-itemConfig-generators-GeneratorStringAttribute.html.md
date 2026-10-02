[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.scripting.itemConfig.generators](package-summary.html)
2. [GeneratorStringAttribute](GeneratorStringAttribute.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [attributeType](#attributeType)
   2. [str](#str)
6. [Constructor Details](#constructor-detail)
   1. [GeneratorStringAttribute(AttributeType, String)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,java.lang.String))
   2. [GeneratorStringAttribute(AttributeType, float, String)](#%3Cinit%3E(zombie.entity.components.attributes.AttributeType,float,java.lang.String))
7. [Method Details](#method-detail)
   1. [execute(GameEntity)](#execute(zombie.entity.GameEntity))
   2. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class GeneratorStringAttribute
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.itemConfig.RandomGenerator<[GeneratorStringAttribute](GeneratorStringAttribute.html "class in zombie.scripting.itemConfig.generators")>

zombie.scripting.itemConfig.generators.GeneratorStringAttribute

---

public class GeneratorStringAttribute
extends zombie.scripting.itemConfig.RandomGenerator<[GeneratorStringAttribute](GeneratorStringAttribute.html "class in zombie.scripting.itemConfig.generators")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final AttributeType.String`

  `attributeType`

  `private final String`

  `str`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GeneratorStringAttribute(AttributeType attributeType,
  float chance,
  String s)`

  `GeneratorStringAttribute(AttributeType attributeType,
  String s)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GeneratorStringAttribute`

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

    private final [AttributeType.String](../../../entity/components/attributes/AttributeType.String.html "class in zombie.entity.components.attributes") attributeType
  + ### str

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str
* Constructor Details
  -------------------

  + ### GeneratorStringAttribute

    public GeneratorStringAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### GeneratorStringAttribute

    public GeneratorStringAttribute([AttributeType](../../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    float chance,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
* Method Details
  --------------

  + ### execute

    public boolean execute([GameEntity](../../../entity/GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `execute` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorStringAttribute>`
  + ### copy

    public [GeneratorStringAttribute](GeneratorStringAttribute.html "class in zombie.scripting.itemConfig.generators") copy()

    Specified by:
    :   `copy` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorStringAttribute>`