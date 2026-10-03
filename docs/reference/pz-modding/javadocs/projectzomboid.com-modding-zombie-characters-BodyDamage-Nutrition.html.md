[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [Nutrition](Nutrition.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [parent](#parent)
   2. [carbohydrates](#carbohydrates)
   3. [lipids](#lipids)
   4. [proteins](#proteins)
   5. [calories](#calories)
   6. [carbohydratesDecreraseFemale](#carbohydratesDecreraseFemale)
   7. [carbohydratesDecreraseMale](#carbohydratesDecreraseMale)
   8. [lipidsDecreraseFemale](#lipidsDecreraseFemale)
   9. [lipidsDecreraseMale](#lipidsDecreraseMale)
   10. [proteinsDecreraseFemale](#proteinsDecreraseFemale)
   11. [proteinsDecreraseMale](#proteinsDecreraseMale)
   12. [caloriesDecreraseFemaleNormal](#caloriesDecreraseFemaleNormal)
   13. [caloriesDecreaseMaleNormal](#caloriesDecreaseMaleNormal)
   14. [caloriesDecreraseFemaleExercise](#caloriesDecreraseFemaleExercise)
   15. [caloriesDecreaseMaleExercise](#caloriesDecreaseMaleExercise)
   16. [caloriesDecreraseFemaleSleeping](#caloriesDecreraseFemaleSleeping)
   17. [caloriesDecreaseMaleSleeping](#caloriesDecreaseMaleSleeping)
   18. [caloriesToGainWeightMale](#caloriesToGainWeightMale)
   19. [caloriesToGainWeightMaxMale](#caloriesToGainWeightMaxMale)
   20. [caloriesToGainWeightFemale](#caloriesToGainWeightFemale)
   21. [caloriesToGainWeightMaxFemale](#caloriesToGainWeightMaxFemale)
   22. [caloriesDecreaseMax](#caloriesDecreaseMax)
   23. [weightGain](#weightGain)
   24. [weightLoss](#weightLoss)
   25. [weight](#weight)
   26. [updatedWeight](#updatedWeight)
   27. [isFemale](#isFemale)
   28. [caloriesMax](#caloriesMax)
   29. [caloriesMin](#caloriesMin)
   30. [incWeight](#incWeight)
   31. [incWeightLot](#incWeightLot)
   32. [decWeight](#decWeight)
6. [Constructor Details](#constructor-detail)
   1. [Nutrition(IsoPlayer)](#%3Cinit%3E(zombie.characters.IsoPlayer))
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [updateCalories()](#updateCalories())
   3. [updateWeight()](#updateWeight())
   4. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   5. [load(ByteBuffer)](#load(java.nio.ByteBuffer))
   6. [applyWeightFromTraits()](#applyWeightFromTraits())
   7. [applyTraitFromWeight()](#applyTraitFromWeight())
   8. [characterHaveWeightTrouble()](#characterHaveWeightTrouble())
   9. [canAddFitnessXp()](#canAddFitnessXp())
   10. [getCarbohydrates()](#getCarbohydrates())
   11. [setCarbohydrates(float)](#setCarbohydrates(float))
   12. [getProteins()](#getProteins())
   13. [setProteins(float)](#setProteins(float))
   14. [getCalories()](#getCalories())
   15. [setCalories(float)](#setCalories(float))
   16. [getLipids()](#getLipids())
   17. [setLipids(float)](#setLipids(float))
   18. [getWeight()](#getWeight())
   19. [setWeight(double)](#setWeight(double))
   20. [isIncWeight()](#isIncWeight())
   21. [setIncWeight(boolean)](#setIncWeight(boolean))
   22. [isIncWeightLot()](#isIncWeightLot())
   23. [setIncWeightLot(boolean)](#setIncWeightLot(boolean))
   24. [isDecWeight()](#isDecWeight())
   25. [setDecWeight(boolean)](#setDecWeight(boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Nutrition
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.Nutrition

---

public final class Nutrition
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `calories`

  `private final float`

  `caloriesDecreaseMaleExercise`

  `private final float`

  `caloriesDecreaseMaleNormal`

  `private final float`

  `caloriesDecreaseMaleSleeping`

  `private final int`

  `caloriesDecreaseMax`

  `private final float`

  `caloriesDecreraseFemaleExercise`

  `private final float`

  `caloriesDecreraseFemaleNormal`

  `private final float`

  `caloriesDecreraseFemaleSleeping`

  `private float`

  `caloriesMax`

  `private float`

  `caloriesMin`

  `private final int`

  `caloriesToGainWeightFemale`

  `private final int`

  `caloriesToGainWeightMale`

  `private final int`

  `caloriesToGainWeightMaxFemale`

  `private final int`

  `caloriesToGainWeightMaxMale`

  `private float`

  `carbohydrates`

  `private final float`

  `carbohydratesDecreraseFemale`

  `private final float`

  `carbohydratesDecreraseMale`

  `private boolean`

  `decWeight`

  `private boolean`

  `incWeight`

  `private boolean`

  `incWeightLot`

  `private final boolean`

  `isFemale`

  `private float`

  `lipids`

  `private final float`

  `lipidsDecreraseFemale`

  `private final float`

  `lipidsDecreraseMale`

  `private final IsoPlayer`

  `parent`

  `private float`

  `proteins`

  `private final float`

  `proteinsDecreraseFemale`

  `private final float`

  `proteinsDecreraseMale`

  `private int`

  `updatedWeight`

  `private double`

  `weight`

  `private final float`

  `weightGain`

  `private final float`

  `weightLoss`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Nutrition(IsoPlayer parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `applyTraitFromWeight()`

  > 100 obese 85 to 100 over weight 75 to 85 normal 65 to 75 underweight 50 to
  65 very underweight invalid input: '<'= 50 emaciated

  `void`

  `applyWeightFromTraits()`

  `boolean`

  `canAddFitnessXp()`

  `boolean`

  `characterHaveWeightTrouble()`

  `float`

  `getCalories()`

  `float`

  `getCarbohydrates()`

  `float`

  `getLipids()`

  `float`

  `getProteins()`

  `double`

  `getWeight()`

  `boolean`

  `isDecWeight()`

  `boolean`

  `isIncWeight()`

  `boolean`

  `isIncWeightLot()`

  `void`

  `load(ByteBuffer input)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setCalories(float calories)`

  `void`

  `setCarbohydrates(float carbohydrates)`

  `void`

  `setDecWeight(boolean decWeight)`

  `void`

  `setIncWeight(boolean incWeight)`

  `void`

  `setIncWeightLot(boolean incWeightLot)`

  `void`

  `setLipids(float lipids)`

  `void`

  `setProteins(float proteins)`

  `void`

  `setWeight(double weight)`

  `void`

  `update()`

  `private void`

  `updateCalories()`

  `private void`

  `updateWeight()`

  Increrase or decrease weight

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parent

    private final [IsoPlayer](../IsoPlayer.html "class in zombie.characters") parent
  + ### carbohydrates

    private float carbohydrates
  + ### lipids

    private float lipids
  + ### proteins

    private float proteins
  + ### calories

    private float calories
  + ### carbohydratesDecreraseFemale

    private final float carbohydratesDecreraseFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.carbohydratesDecreraseFemale)
  + ### carbohydratesDecreraseMale

    private final float carbohydratesDecreraseMale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.carbohydratesDecreraseMale)
  + ### lipidsDecreraseFemale

    private final float lipidsDecreraseFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.lipidsDecreraseFemale)
  + ### lipidsDecreraseMale

    private final float lipidsDecreraseMale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.lipidsDecreraseMale)
  + ### proteinsDecreraseFemale

    private final float proteinsDecreraseFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.proteinsDecreraseFemale)
  + ### proteinsDecreraseMale

    private final float proteinsDecreraseMale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.proteinsDecreraseMale)
  + ### caloriesDecreraseFemaleNormal

    private final float caloriesDecreraseFemaleNormal

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreraseFemaleNormal)
  + ### caloriesDecreaseMaleNormal

    private final float caloriesDecreaseMaleNormal

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreaseMaleNormal)
  + ### caloriesDecreraseFemaleExercise

    private final float caloriesDecreraseFemaleExercise

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreraseFemaleExercise)
  + ### caloriesDecreaseMaleExercise

    private final float caloriesDecreaseMaleExercise

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreaseMaleExercise)
  + ### caloriesDecreraseFemaleSleeping

    private final float caloriesDecreraseFemaleSleeping

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreraseFemaleSleeping)
  + ### caloriesDecreaseMaleSleeping

    private final float caloriesDecreaseMaleSleeping

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreaseMaleSleeping)
  + ### caloriesToGainWeightMale

    private final int caloriesToGainWeightMale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesToGainWeightMale)
  + ### caloriesToGainWeightMaxMale

    private final int caloriesToGainWeightMaxMale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesToGainWeightMaxMale)
  + ### caloriesToGainWeightFemale

    private final int caloriesToGainWeightFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesToGainWeightFemale)
  + ### caloriesToGainWeightMaxFemale

    private final int caloriesToGainWeightMaxFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesToGainWeightMaxFemale)
  + ### caloriesDecreaseMax

    private final int caloriesDecreaseMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.caloriesDecreaseMax)
  + ### weightGain

    private final float weightGain

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.weightGain)
  + ### weightLoss

    private final float weightLoss

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.weightLoss)
  + ### weight

    private double weight
  + ### updatedWeight

    private int updatedWeight
  + ### isFemale

    private final boolean isFemale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Nutrition.isFemale)
  + ### caloriesMax

    private float caloriesMax
  + ### caloriesMin

    private float caloriesMin
  + ### incWeight

    private boolean incWeight
  + ### incWeightLot

    private boolean incWeightLot
  + ### decWeight

    private boolean decWeight
* Constructor Details
  -------------------

  + ### Nutrition

    public Nutrition([IsoPlayer](../IsoPlayer.html "class in zombie.characters") parent)
* Method Details
  --------------

  + ### update

    public void update()
  + ### updateCalories

    private void updateCalories()
  + ### updateWeight

    private void updateWeight()

    Increrase or decrease weight
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### applyWeightFromTraits

    public void applyWeightFromTraits()
  + ### applyTraitFromWeight

    public void applyTraitFromWeight()

    > 100 obese 85 to 100 over weight 75 to 85 normal 65 to 75 underweight 50 to
    65 very underweight invalid input: '<'= 50 emaciated
  + ### characterHaveWeightTrouble

    public boolean characterHaveWeightTrouble()
  + ### canAddFitnessXp

    public boolean canAddFitnessXp()
  + ### getCarbohydrates

    public float getCarbohydrates()
  + ### setCarbohydrates

    public void setCarbohydrates(float carbohydrates)
  + ### getProteins

    public float getProteins()
  + ### setProteins

    public void setProteins(float proteins)
  + ### getCalories

    public float getCalories()
  + ### setCalories

    public void setCalories(float calories)
  + ### getLipids

    public float getLipids()
  + ### setLipids

    public void setLipids(float lipids)
  + ### getWeight

    public double getWeight()
  + ### setWeight

    public void setWeight(double weight)
  + ### isIncWeight

    public boolean isIncWeight()
  + ### setIncWeight

    public void setIncWeight(boolean incWeight)
  + ### isIncWeightLot

    public boolean isIncWeightLot()
  + ### setIncWeightLot

    public void setIncWeightLot(boolean incWeightLot)
  + ### isDecWeight

    public boolean isDecWeight()
  + ### setDecWeight

    public void setDecWeight(boolean decWeight)