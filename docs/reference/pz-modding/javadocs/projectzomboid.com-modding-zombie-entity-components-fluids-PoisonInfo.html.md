[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [PoisonInfo](PoisonInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluid](#fluid)
   2. [maxEffect](#maxEffect)
   3. [minAmount](#minAmount)
   4. [diluteRatio](#diluteRatio)
6. [Constructor Details](#constructor-detail)
   1. [PoisonInfo(Fluid, float, float, PoisonEffect)](#%3Cinit%3E(zombie.entity.components.fluids.Fluid,float,float,zombie.entity.components.fluids.PoisonEffect))
7. [Method Details](#method-detail)
   1. [getFluid()](#getFluid())
   2. [getPoisonEffect(float, float)](#getPoisonEffect(float,float))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class PoisonInfo
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.PoisonInfo

---

public class PoisonInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `diluteRatio`

  `private final Fluid`

  `fluid`

  `private final PoisonEffect`

  `maxEffect`

  `private final float`

  `minAmount`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `PoisonInfo(Fluid fluid,
  float minAmount,
  float diluteRatio,
  PoisonEffect maxEffect)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Fluid`

  `getFluid()`

  `PoisonEffect`

  `getPoisonEffect(float volume,
  float ratio)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fluid

    private final [Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid
  + ### maxEffect

    private final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") maxEffect
  + ### minAmount

    private final float minAmount
  + ### diluteRatio

    private final float diluteRatio
* Constructor Details
  -------------------

  + ### PoisonInfo

    protected PoisonInfo([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid,
    float minAmount,
    float diluteRatio,
    [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") maxEffect)
* Method Details
  --------------

  + ### getFluid

    public [Fluid](Fluid.html "class in zombie.entity.components.fluids") getFluid()
  + ### getPoisonEffect

    public [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") getPoisonEffect(float volume,
    float ratio)