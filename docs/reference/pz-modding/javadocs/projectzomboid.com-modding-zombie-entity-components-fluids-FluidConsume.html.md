[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidConsume](FluidConsume.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [amount](#amount)
   3. [poisonEffect](#poisonEffect)
6. [Constructor Details](#constructor-detail)
   1. [FluidConsume()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc()](#Alloc())
   2. [Release(FluidConsume)](#Release(zombie.entity.components.fluids.FluidConsume))
   3. [release()](#release())
   4. [reset()](#reset())
   5. [clear()](#clear())
   6. [combine(FluidConsume, FluidConsume)](#combine(zombie.entity.components.fluids.FluidConsume,zombie.entity.components.fluids.FluidConsume))
   7. [combineWith(FluidConsume)](#combineWith(zombie.entity.components.fluids.FluidConsume))
   8. [setAmount(float)](#setAmount(float))
   9. [setPoisonEffect(PoisonEffect)](#setPoisonEffect(zombie.entity.components.fluids.PoisonEffect))
   10. [getAmount()](#getAmount())
   11. [getPoisonEffect()](#getPoisonEffect())
   12. [Save(FluidConsume, ByteBuffer)](#Save(zombie.entity.components.fluids.FluidConsume,java.nio.ByteBuffer))
   13. [Load(ByteBuffer, int)](#Load(java.nio.ByteBuffer,int))
   14. [Load(FluidConsume, ByteBuffer, int)](#Load(zombie.entity.components.fluids.FluidConsume,java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidConsume
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.fluids.SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids")

zombie.entity.components.fluids.FluidConsume

---

public class FluidConsume
extends [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `amount`

  `private PoisonEffect`

  `poisonEffect`

  `private static final ConcurrentLinkedDeque<FluidConsume>`

  `pool`

  ### Fields inherited from class [SealedFluidProperties](SealedFluidProperties.html#field-summary "class in zombie.entity.components.fluids")

  `Str_Alcohol, Str_Calories, Str_Carbohydrates, Str_Endurance, Str_Fatigue, Str_Flu, Str_FoodSickness, Str_Hunger, Str_Lipids, Str_Pain, Str_Proteins, Str_Stress, Str_Thirst, Str_Unhappy`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidConsume()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static FluidConsume`

  `Alloc()`

  `void`

  `clear()`

  `static FluidConsume`

  `combine(FluidConsume a,
  FluidConsume b)`

  `FluidConsume`

  `combineWith(FluidConsume b)`

  `float`

  `getAmount()`

  `PoisonEffect`

  `getPoisonEffect()`

  `static FluidConsume`

  `Load(ByteBuffer input,
  int worldVersion)`

  `static FluidConsume`

  `Load(FluidConsume fluidConsume,
  ByteBuffer input,
  int worldVersion)`

  `void`

  `release()`

  `protected static void`

  `Release(FluidConsume fluidConsume)`

  `private void`

  `reset()`

  `static void`

  `Save(FluidConsume fluidConsume,
  ByteBuffer output)`

  `protected void`

  `setAmount(float amount)`

  `protected void`

  `setPoisonEffect(PoisonEffect poisonEffect)`

  ### Methods inherited from class [SealedFluidProperties](SealedFluidProperties.html#method-summary "class in zombie.entity.components.fluids")

  `addFromMultiplied, getAlcohol, getCalories, getCarbohydrates, getEnduranceChange, getFatigueChange, getFluReduction, getFoodSicknessChange, getHungerChange, getLipids, getPainReduction, getPoison, getProteins, getStressChange, getThirstChange, getUnhappyChange, hasProperties, load, save, setAlcohol, setCalories, setCarbohydrates, setEffects, setEnduranceChange, setFatigueChange, setFluReduction, setFoodSicknessChange, setHungerChange, setLipids, setNutrients, setPainReduction, setPoison, setProteins, setReductions, setStressChange, setThirstChange, setUnhappyChange`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids")> pool
  + ### amount

    private float amount
  + ### poisonEffect

    private [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") poisonEffect
* Constructor Details
  -------------------

  + ### FluidConsume

    private FluidConsume()
* Method Details
  --------------

  + ### Alloc

    public static [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") Alloc()
  + ### Release

    protected static void Release([FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") fluidConsume)
  + ### release

    public void release()
  + ### reset

    private void reset()
  + ### clear

    public void clear()

    Overrides:
    :   `clear` in class `SealedFluidProperties`
  + ### combine

    public static [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") combine([FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") a,
    [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") b)
  + ### combineWith

    public [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") combineWith([FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") b)
  + ### setAmount

    protected void setAmount(float amount)
  + ### setPoisonEffect

    protected void setPoisonEffect([PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") poisonEffect)
  + ### getAmount

    public float getAmount()
  + ### getPoisonEffect

    public [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") getPoisonEffect()
  + ### Save

    public static void Save([FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") fluidConsume,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Load

    public static [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") Load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Load

    public static [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") Load([FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") fluidConsume,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`