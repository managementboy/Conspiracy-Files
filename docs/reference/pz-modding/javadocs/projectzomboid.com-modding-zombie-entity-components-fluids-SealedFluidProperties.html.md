[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [SealedFluidProperties](SealedFluidProperties.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [Str\_Fatigue](#Str_Fatigue)
   2. [Str\_Hunger](#Str_Hunger)
   3. [Str\_Stress](#Str_Stress)
   4. [Str\_Thirst](#Str_Thirst)
   5. [Str\_Unhappy](#Str_Unhappy)
   6. [Str\_Calories](#Str_Calories)
   7. [Str\_Carbohydrates](#Str_Carbohydrates)
   8. [Str\_Lipids](#Str_Lipids)
   9. [Str\_Proteins](#Str_Proteins)
   10. [Str\_Alcohol](#Str_Alcohol)
   11. [Str\_Flu](#Str_Flu)
   12. [Str\_Pain](#Str_Pain)
   13. [Str\_Endurance](#Str_Endurance)
   14. [Str\_FoodSickness](#Str_FoodSickness)
   15. [fatigueChange](#fatigueChange)
   16. [hungerChange](#hungerChange)
   17. [stressChange](#stressChange)
   18. [thirstChange](#thirstChange)
   19. [unhappyChange](#unhappyChange)
   20. [calories](#calories)
   21. [carbohydrates](#carbohydrates)
   22. [lipids](#lipids)
   23. [proteins](#proteins)
   24. [alcohol](#alcohol)
   25. [poison](#poison)
   26. [fluReduction](#fluReduction)
   27. [painReduction](#painReduction)
   28. [enduranceChange](#enduranceChange)
   29. [foodSicknessChange](#foodSicknessChange)
6. [Constructor Details](#constructor-detail)
   1. [SealedFluidProperties()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   2. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   3. [hasProperties()](#hasProperties())
   4. [clear()](#clear())
   5. [addFromMultiplied(SealedFluidProperties, float)](#addFromMultiplied(zombie.entity.components.fluids.SealedFluidProperties,float))
   6. [setEffects(float, float, float, float, float, float, float)](#setEffects(float,float,float,float,float,float,float))
   7. [setNutrients(float, float, float, float)](#setNutrients(float,float,float,float))
   8. [setReductions(float, float, float, int)](#setReductions(float,float,float,int))
   9. [getFatigueChange()](#getFatigueChange())
   10. [setFatigueChange(float)](#setFatigueChange(float))
   11. [getHungerChange()](#getHungerChange())
   12. [setHungerChange(float)](#setHungerChange(float))
   13. [getStressChange()](#getStressChange())
   14. [setStressChange(float)](#setStressChange(float))
   15. [getThirstChange()](#getThirstChange())
   16. [setThirstChange(float)](#setThirstChange(float))
   17. [getUnhappyChange()](#getUnhappyChange())
   18. [setUnhappyChange(float)](#setUnhappyChange(float))
   19. [getCalories()](#getCalories())
   20. [setCalories(float)](#setCalories(float))
   21. [getCarbohydrates()](#getCarbohydrates())
   22. [setCarbohydrates(float)](#setCarbohydrates(float))
   23. [getLipids()](#getLipids())
   24. [setLipids(float)](#setLipids(float))
   25. [getProteins()](#getProteins())
   26. [setProteins(float)](#setProteins(float))
   27. [getAlcohol()](#getAlcohol())
   28. [setAlcohol(float)](#setAlcohol(float))
   29. [getPoison()](#getPoison())
   30. [setPoison(float)](#setPoison(float))
   31. [getFluReduction()](#getFluReduction())
   32. [setFluReduction(float)](#setFluReduction(float))
   33. [getPainReduction()](#getPainReduction())
   34. [setPainReduction(float)](#setPainReduction(float))
   35. [getEnduranceChange()](#getEnduranceChange())
   36. [setEnduranceChange(float)](#setEnduranceChange(float))
   37. [getFoodSicknessChange()](#getFoodSicknessChange())
   38. [setFoodSicknessChange(int)](#setFoodSicknessChange(int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SealedFluidProperties
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.SealedFluidProperties

Direct Known Subclasses:
:   `FluidConsume, FluidProperties`

---

public class SealedFluidProperties
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Base for FluidProperties and FluidConsume.
Also acts as a protected property class for FluidContainer that doesn't expose setters.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `alcohol`

  `private float`

  `calories`

  `private float`

  `carbohydrates`

  `private float`

  `enduranceChange`

  `private float`

  `fatigueChange`

  `private float`

  `fluReduction`

  `private int`

  `foodSicknessChange`

  `private float`

  `hungerChange`

  `private float`

  `lipids`

  `private float`

  `painReduction`

  `private float`

  `poison`

  `private float`

  `proteins`

  `static final String`

  `Str_Alcohol`

  `static final String`

  `Str_Calories`

  `static final String`

  `Str_Carbohydrates`

  `static final String`

  `Str_Endurance`

  `static final String`

  `Str_Fatigue`

  `static final String`

  `Str_Flu`

  `static final String`

  `Str_FoodSickness`

  `static final String`

  `Str_Hunger`

  `static final String`

  `Str_Lipids`

  `static final String`

  `Str_Pain`

  `static final String`

  `Str_Proteins`

  `static final String`

  `Str_Stress`

  `static final String`

  `Str_Thirst`

  `static final String`

  `Str_Unhappy`

  `private float`

  `stressChange`

  `private float`

  `thirstChange`

  `private float`

  `unhappyChange`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SealedFluidProperties()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `addFromMultiplied(SealedFluidProperties other,
  float multi)`

  `protected void`

  `clear()`

  `float`

  `getAlcohol()`

  `float`

  `getCalories()`

  `float`

  `getCarbohydrates()`

  `float`

  `getEnduranceChange()`

  `float`

  `getFatigueChange()`

  `float`

  `getFluReduction()`

  `int`

  `getFoodSicknessChange()`

  `float`

  `getHungerChange()`

  `float`

  `getLipids()`

  `float`

  `getPainReduction()`

  `float`

  `getPoison()`

  `float`

  `getProteins()`

  `float`

  `getStressChange()`

  `float`

  `getThirstChange()`

  `float`

  `getUnhappyChange()`

  `boolean`

  `hasProperties()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setAlcohol(float alcohol)`

  `protected void`

  `setCalories(float calories)`

  `protected void`

  `setCarbohydrates(float carbohydrates)`

  `protected void`

  `setEffects(float fatigueChange,
  float hungerChange,
  float stressChange,
  float thirstChange,
  float unhappyChange,
  float alcoholChange,
  float poisonChange)`

  `protected void`

  `setEnduranceChange(float enduranceChange)`

  `protected void`

  `setFatigueChange(float fatigueChange)`

  `protected void`

  `setFluReduction(float fluReduction)`

  `protected void`

  `setFoodSicknessChange(int foodSicknessChange)`

  `protected void`

  `setHungerChange(float hungerChange)`

  `protected void`

  `setLipids(float lipids)`

  `protected void`

  `setNutrients(float calories,
  float carbohydrates,
  float lipids,
  float proteins)`

  `protected void`

  `setPainReduction(float painReduction)`

  `protected void`

  `setPoison(float poison)`

  `protected void`

  `setProteins(float proteins)`

  `protected void`

  `setReductions(float fluReduction,
  float painReduction,
  float enduranceChange,
  int foodSicknessChange)`

  `protected void`

  `setStressChange(float stressChange)`

  `protected void`

  `setThirstChange(float thirstChange)`

  `protected void`

  `setUnhappyChange(float unhappyChange)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### Str\_Fatigue

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Fatigue

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Fatigue)
  + ### Str\_Hunger

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Hunger

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Hunger)
  + ### Str\_Stress

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Stress

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Stress)
  + ### Str\_Thirst

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Thirst

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Thirst)
  + ### Str\_Unhappy

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Unhappy

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Unhappy)
  + ### Str\_Calories

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Calories

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Calories)
  + ### Str\_Carbohydrates

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Carbohydrates

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Carbohydrates)
  + ### Str\_Lipids

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Lipids

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Lipids)
  + ### Str\_Proteins

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Proteins

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Proteins)
  + ### Str\_Alcohol

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Alcohol

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Alcohol)
  + ### Str\_Flu

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Flu

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Flu)
  + ### Str\_Pain

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Pain

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Pain)
  + ### Str\_Endurance

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_Endurance

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_Endurance)
  + ### Str\_FoodSickness

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Str\_FoodSickness

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.SealedFluidProperties.Str_FoodSickness)
  + ### fatigueChange

    private float fatigueChange
  + ### hungerChange

    private float hungerChange
  + ### stressChange

    private float stressChange
  + ### thirstChange

    private float thirstChange
  + ### unhappyChange

    private float unhappyChange
  + ### calories

    private float calories
  + ### carbohydrates

    private float carbohydrates
  + ### lipids

    private float lipids
  + ### proteins

    private float proteins
  + ### alcohol

    private float alcohol
  + ### poison

    private float poison
  + ### fluReduction

    private float fluReduction
  + ### painReduction

    private float painReduction
  + ### enduranceChange

    private float enduranceChange
  + ### foodSicknessChange

    private int foodSicknessChange
* Constructor Details
  -------------------

  + ### SealedFluidProperties

    public SealedFluidProperties()
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### hasProperties

    public boolean hasProperties()
  + ### clear

    protected void clear()
  + ### addFromMultiplied

    protected void addFromMultiplied([SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") other,
    float multi)
  + ### setEffects

    protected void setEffects(float fatigueChange,
    float hungerChange,
    float stressChange,
    float thirstChange,
    float unhappyChange,
    float alcoholChange,
    float poisonChange)
  + ### setNutrients

    protected void setNutrients(float calories,
    float carbohydrates,
    float lipids,
    float proteins)
  + ### setReductions

    protected void setReductions(float fluReduction,
    float painReduction,
    float enduranceChange,
    int foodSicknessChange)
  + ### getFatigueChange

    public float getFatigueChange()
  + ### setFatigueChange

    protected void setFatigueChange(float fatigueChange)
  + ### getHungerChange

    public float getHungerChange()
  + ### setHungerChange

    protected void setHungerChange(float hungerChange)
  + ### getStressChange

    public float getStressChange()
  + ### setStressChange

    protected void setStressChange(float stressChange)
  + ### getThirstChange

    public float getThirstChange()
  + ### setThirstChange

    protected void setThirstChange(float thirstChange)
  + ### getUnhappyChange

    public float getUnhappyChange()
  + ### setUnhappyChange

    protected void setUnhappyChange(float unhappyChange)
  + ### getCalories

    public float getCalories()
  + ### setCalories

    protected void setCalories(float calories)
  + ### getCarbohydrates

    public float getCarbohydrates()
  + ### setCarbohydrates

    protected void setCarbohydrates(float carbohydrates)
  + ### getLipids

    public float getLipids()
  + ### setLipids

    protected void setLipids(float lipids)
  + ### getProteins

    public float getProteins()
  + ### setProteins

    protected void setProteins(float proteins)
  + ### getAlcohol

    public float getAlcohol()
  + ### setAlcohol

    protected void setAlcohol(float alcohol)
  + ### getPoison

    public float getPoison()
  + ### setPoison

    protected void setPoison(float poison)
  + ### getFluReduction

    public float getFluReduction()
  + ### setFluReduction

    protected void setFluReduction(float fluReduction)
  + ### getPainReduction

    public float getPainReduction()
  + ### setPainReduction

    protected void setPainReduction(float painReduction)
  + ### getEnduranceChange

    public float getEnduranceChange()
  + ### setEnduranceChange

    protected void setEnduranceChange(float enduranceChange)
  + ### getFoodSicknessChange

    public int getFoodSicknessChange()
  + ### setFoodSicknessChange

    protected void setFoodSicknessChange(int foodSicknessChange)