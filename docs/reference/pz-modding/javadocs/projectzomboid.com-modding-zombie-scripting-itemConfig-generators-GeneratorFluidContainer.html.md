[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.scripting.itemConfig.generators](package-summary.html)
2. [GeneratorFluidContainer](GeneratorFluidContainer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [containerId](#containerId)
   2. [fluids](#fluids)
   3. [ratios](#ratios)
   4. [min](#min)
   5. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [GeneratorFluidContainer(String, Fluid[], float[], float)](#%3Cinit%3E(java.lang.String,zombie.entity.components.fluids.Fluid%5B%5D,float%5B%5D,float))
   2. [GeneratorFluidContainer(String, Fluid[], float[], float, float)](#%3Cinit%3E(java.lang.String,zombie.entity.components.fluids.Fluid%5B%5D,float%5B%5D,float,float))
   3. [GeneratorFluidContainer(String, Fluid[], float[], float, float, float)](#%3Cinit%3E(java.lang.String,zombie.entity.components.fluids.Fluid%5B%5D,float%5B%5D,float,float,float))
7. [Method Details](#method-detail)
   1. [execute(GameEntity)](#execute(zombie.entity.GameEntity))
   2. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class GeneratorFluidContainer
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.itemConfig.RandomGenerator<[GeneratorFluidContainer](GeneratorFluidContainer.html "class in zombie.scripting.itemConfig.generators")>

zombie.scripting.itemConfig.generators.GeneratorFluidContainer

---

public class GeneratorFluidContainer
extends zombie.scripting.itemConfig.RandomGenerator<[GeneratorFluidContainer](GeneratorFluidContainer.html "class in zombie.scripting.itemConfig.generators")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `containerId`

  `private final Fluid[]`

  `fluids`

  `private final float`

  `max`

  `private final float`

  `min`

  `private final float[]`

  `ratios`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GeneratorFluidContainer(String containerId,
  Fluid[] fluids,
  float[] ratios,
  float max)`

  `GeneratorFluidContainer(String containerId,
  Fluid[] fluids,
  float[] ratios,
  float min,
  float max)`

  `GeneratorFluidContainer(String containerId,
  Fluid[] fluids,
  float[] ratios,
  float chance,
  float min,
  float max)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GeneratorFluidContainer`

  `copy()`

  `boolean`

  `execute(GameEntity entity)`

  ### Methods inherited from class zombie.scripting.itemConfig.RandomGenerator

  `getChance, setChance`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### containerId

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerId
  + ### fluids

    private final [Fluid](../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")[] fluids
  + ### ratios

    private final float[] ratios
  + ### min

    private final float min
  + ### max

    private final float max
* Constructor Details
  -------------------

  + ### GeneratorFluidContainer

    public GeneratorFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerId,
    [Fluid](../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")[] fluids,
    float[] ratios,
    float max)
  + ### GeneratorFluidContainer

    public GeneratorFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerId,
    [Fluid](../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")[] fluids,
    float[] ratios,
    float min,
    float max)
  + ### GeneratorFluidContainer

    public GeneratorFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerId,
    [Fluid](../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")[] fluids,
    float[] ratios,
    float chance,
    float min,
    float max)
* Method Details
  --------------

  + ### execute

    public boolean execute([GameEntity](../../../entity/GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `execute` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorFluidContainer>`
  + ### copy

    public [GeneratorFluidContainer](GeneratorFluidContainer.html "class in zombie.scripting.itemConfig.generators") copy()

    Specified by:
    :   `copy` in class `zombie.scripting.itemConfig.RandomGenerator<GeneratorFluidContainer>`