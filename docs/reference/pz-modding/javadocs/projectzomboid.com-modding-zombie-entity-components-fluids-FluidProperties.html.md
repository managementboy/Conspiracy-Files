[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidProperties](FluidProperties.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [FluidProperties()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [getSealedFluidProperties()](#getSealedFluidProperties())
   2. [setEffects(float, float, float, float, float, float, float)](#setEffects(float,float,float,float,float,float,float))
   3. [setNutrients(float, float, float, float)](#setNutrients(float,float,float,float))
   4. [setReductions(float, float, float, int)](#setReductions(float,float,float,int))
   5. [setFatigueChange(float)](#setFatigueChange(float))
   6. [setHungerChange(float)](#setHungerChange(float))
   7. [setStressChange(float)](#setStressChange(float))
   8. [setThirstChange(float)](#setThirstChange(float))
   9. [setUnhappyChange(float)](#setUnhappyChange(float))
   10. [setCalories(float)](#setCalories(float))
   11. [setCarbohydrates(float)](#setCarbohydrates(float))
   12. [setLipids(float)](#setLipids(float))
   13. [setProteins(float)](#setProteins(float))
   14. [setAlcohol(float)](#setAlcohol(float))
   15. [setFluReduction(float)](#setFluReduction(float))
   16. [setPainReduction(float)](#setPainReduction(float))
   17. [setEnduranceChange(float)](#setEnduranceChange(float))
   18. [setFoodSicknessChange(int)](#setFoodSicknessChange(int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidProperties
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.fluids.SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids")

zombie.entity.components.fluids.FluidProperties

---

public class FluidProperties
extends [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids")

The (optional) properties of a fluid, values should be based on a liter of the fluid.

* Field Summary
  -------------

  ### Fields inherited from class [SealedFluidProperties](SealedFluidProperties.html#field-summary "class in zombie.entity.components.fluids")

  `Str_Alcohol, Str_Calories, Str_Carbohydrates, Str_Endurance, Str_Fatigue, Str_Flu, Str_FoodSickness, Str_Hunger, Str_Lipids, Str_Pain, Str_Proteins, Str_Stress, Str_Thirst, Str_Unhappy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FluidProperties()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `SealedFluidProperties`

  `getSealedFluidProperties()`

  `void`

  `setAlcohol(float alcohol)`

  `void`

  `setCalories(float calories)`

  `void`

  `setCarbohydrates(float carbohydrates)`

  `void`

  `setEffects(float fatigueChange,
  float hungerChange,
  float stressChange,
  float thirstChange,
  float unhappyChange,
  float alcoholChange,
  float poisonChange)`

  `void`

  `setEnduranceChange(float enduranceChange)`

  `void`

  `setFatigueChange(float fatigueChange)`

  `void`

  `setFluReduction(float fluReduction)`

  `void`

  `setFoodSicknessChange(int foodSicknessChange)`

  `void`

  `setHungerChange(float hungerChange)`

  `void`

  `setLipids(float lipids)`

  `void`

  `setNutrients(float calories,
  float carbohydrates,
  float lipids,
  float proteins)`

  `void`

  `setPainReduction(float painReduction)`

  `void`

  `setProteins(float proteins)`

  `void`

  `setReductions(float fluReduction,
  float painReduction,
  float enduranceChange,
  int foodSicknessChange)`

  `void`

  `setStressChange(float stressChange)`

  `void`

  `setThirstChange(float thirstChange)`

  `void`

  `setUnhappyChange(float unhappyChange)`

  ### Methods inherited from class [SealedFluidProperties](SealedFluidProperties.html#method-summary "class in zombie.entity.components.fluids")

  `addFromMultiplied, clear, getAlcohol, getCalories, getCarbohydrates, getEnduranceChange, getFatigueChange, getFluReduction, getFoodSicknessChange, getHungerChange, getLipids, getPainReduction, getPoison, getProteins, getStressChange, getThirstChange, getUnhappyChange, hasProperties, load, save, setPoison`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### FluidProperties

    public FluidProperties()
* Method Details
  --------------

  + ### getSealedFluidProperties

    public [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") getSealedFluidProperties()
  + ### setEffects

    public void setEffects(float fatigueChange,
    float hungerChange,
    float stressChange,
    float thirstChange,
    float unhappyChange,
    float alcoholChange,
    float poisonChange)

    Overrides:
    :   `setEffects` in class `SealedFluidProperties`
  + ### setNutrients

    public void setNutrients(float calories,
    float carbohydrates,
    float lipids,
    float proteins)

    Overrides:
    :   `setNutrients` in class `SealedFluidProperties`
  + ### setReductions

    public void setReductions(float fluReduction,
    float painReduction,
    float enduranceChange,
    int foodSicknessChange)

    Overrides:
    :   `setReductions` in class `SealedFluidProperties`
  + ### setFatigueChange

    public void setFatigueChange(float fatigueChange)

    Overrides:
    :   `setFatigueChange` in class `SealedFluidProperties`
  + ### setHungerChange

    public void setHungerChange(float hungerChange)

    Overrides:
    :   `setHungerChange` in class `SealedFluidProperties`
  + ### setStressChange

    public void setStressChange(float stressChange)

    Overrides:
    :   `setStressChange` in class `SealedFluidProperties`
  + ### setThirstChange

    public void setThirstChange(float thirstChange)

    Overrides:
    :   `setThirstChange` in class `SealedFluidProperties`
  + ### setUnhappyChange

    public void setUnhappyChange(float unhappyChange)

    Overrides:
    :   `setUnhappyChange` in class `SealedFluidProperties`
  + ### setCalories

    public void setCalories(float calories)

    Overrides:
    :   `setCalories` in class `SealedFluidProperties`
  + ### setCarbohydrates

    public void setCarbohydrates(float carbohydrates)

    Overrides:
    :   `setCarbohydrates` in class `SealedFluidProperties`
  + ### setLipids

    public void setLipids(float lipids)

    Overrides:
    :   `setLipids` in class `SealedFluidProperties`
  + ### setProteins

    public void setProteins(float proteins)

    Overrides:
    :   `setProteins` in class `SealedFluidProperties`
  + ### setAlcohol

    public void setAlcohol(float alcohol)

    Overrides:
    :   `setAlcohol` in class `SealedFluidProperties`
  + ### setFluReduction

    public void setFluReduction(float fluReduction)

    Overrides:
    :   `setFluReduction` in class `SealedFluidProperties`
  + ### setPainReduction

    public void setPainReduction(float painReduction)

    Overrides:
    :   `setPainReduction` in class `SealedFluidProperties`
  + ### setEnduranceChange

    public void setEnduranceChange(float enduranceChange)

    Overrides:
    :   `setEnduranceChange` in class `SealedFluidProperties`
  + ### setFoodSicknessChange

    public void setFoodSicknessChange(int foodSicknessChange)

    Overrides:
    :   `setFoodSicknessChange` in class `SealedFluidProperties`