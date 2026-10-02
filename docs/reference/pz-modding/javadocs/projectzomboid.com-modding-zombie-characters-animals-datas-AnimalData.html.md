[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.characters.animals.datas](package-summary.html)
2. [AnimalData](AnimalData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [parent](#parent)
   2. [attachedPlayer](#attachedPlayer)
   3. [attachedTree](#attachedTree)
   4. [attachedTreeX](#attachedTreeX)
   5. [attachedTreeY](#attachedTreeY)
   6. [breed](#breed)
   7. [milkQty](#milkQty)
   8. [woolQty](#woolQty)
   9. [canHaveMilk](#canHaveMilk)
   10. [weight](#weight)
   11. [size](#size)
   12. [originalSize](#originalSize)
   13. [age](#age)
   14. [currentStageNbr](#currentStageNbr)
   15. [lastHourCheck](#lastHourCheck)
   16. [currentStage](#currentStage)
   17. [pregnant](#pregnant)
   18. [pregnantTime](#pregnantTime)
   19. [femaleToCheck](#femaleToCheck)
   20. [animalToInseminate](#animalToInseminate)
   21. [maxMilkActual](#maxMilkActual)
   22. [goingToMomTest](#goingToMomTest)
   23. [goingToMom](#goingToMom)
   24. [goingToMomTimer](#goingToMomTimer)
   25. [linkedTrough](#linkedTrough)
   26. [eatingGrass](#eatingGrass)
   27. [eggsToday](#eggsToday)
   28. [eggTime](#eggTime)
   29. [fertilized](#fertilized)
   30. [fertilizedTime](#fertilizedTime)
   31. [maleGenome](#maleGenome)
   32. [hutchPosition](#hutchPosition)
   33. [preferredHutchPosition](#preferredHutchPosition)
   34. [troughPathTimer](#troughPathTimer)
   35. [troughToCheck](#troughToCheck)
   36. [goingToInseminate](#goingToInseminate)
   37. [lastMilkTimer](#lastMilkTimer)
   38. [lastPregnancyTime](#lastPregnancyTime)
   39. [ONE\_WEEK\_MILLISECONDS](#ONE_WEEK_MILLISECONDS)
   40. [ONE\_DAY\_MILLISECONDS](#ONE_DAY_MILLISECONDS)
   41. [ONE\_HOUR\_MILLISECONDS](#ONE_HOUR_MILLISECONDS)
   42. [FEATHER\_CHANCE\_PER\_HOUR](#FEATHER_CHANCE_PER_HOUR)
   43. [HUNGER\_PER\_DRAINABLE\_USE](#HUNGER_PER_DRAINABLE_USE)
   44. [TIME\_TO\_LOSE\_MILK](#TIME_TO_LOSE_MILK)
   45. [lastImpregnateTime](#lastImpregnateTime)
   46. [clutchSize](#clutchSize)
   47. [clutchSizeDone](#clutchSizeDone)
   48. [enterHutchTimerAfterDestroy](#enterHutchTimerAfterDestroy)
6. [Constructor Details](#constructor-detail)
   1. [AnimalData(IsoAnimal, AnimalBreed)](#%3Cinit%3E(zombie.characters.animals.IsoAnimal,zombie.characters.animals.datas.AnimalBreed))
7. [Method Details](#method-detail)
   1. [checkStages()](#checkStages())
   2. [update()](#update())
   3. [callToTrough(IsoFeedingTrough)](#callToTrough(zombie.iso.objects.IsoFeedingTrough))
   4. [checkPregnancy()](#checkPregnancy())
   5. [getAgeGrowModifier()](#getAgeGrowModifier())
   6. [growUp(boolean)](#growUp(boolean))
   7. [checkPoop(boolean, boolean)](#checkPoop(boolean,boolean))
   8. [dropFeather(boolean)](#dropFeather(boolean))
   9. [updateHungerAndThirst(boolean)](#updateHungerAndThirst(boolean))
   10. [reduceHealthDueToMilk()](#reduceHealthDueToMilk())
   11. [updateHealth()](#updateHealth())
   12. [hourGrow(boolean)](#hourGrow(boolean))
   13. [updateWeight()](#updateWeight())
   14. [updateMilk()](#updateMilk())
   15. [checkOld()](#checkOld())
   16. [getHealthLoss(Float)](#getHealthLoss(java.lang.Float))
   17. [getMaxMilk()](#getMaxMilk())
   18. [getMaxMilkActual()](#getMaxMilkActual())
   19. [setMaxMilkActual(float)](#setMaxMilkActual(float))
   20. [getMaxWool()](#getMaxWool())
   21. [getMinMilk()](#getMinMilk())
   22. [getMilkInc()](#getMilkInc())
   23. [getWoolInc()](#getWoolInc())
   24. [calcClutchSize()](#calcClutchSize())
   25. [checkEggs(PZCalendar, boolean)](#checkEggs(zombie.util.PZCalendar,boolean))
   26. [checkFertilizedTime()](#checkFertilizedTime())
   27. [getMilkIncModifier()](#getMilkIncModifier())
   28. [getWoolIncModifier()](#getWoolIncModifier())
   29. [getPregnantPeriod()](#getPregnantPeriod())
   30. [getThirstReduction()](#getThirstReduction())
   31. [getHungerReduction()](#getHungerReduction())
   32. [getHungerReductionMetaMod()](#getHungerReductionMetaMod())
   33. [getHungerReductionMod()](#getHungerReductionMod())
   34. [eatAndDrinkAfterMetaVehicle()](#eatAndDrinkAfterMetaVehicle())
   35. [eatAndDrinkAfterMeta()](#eatAndDrinkAfterMeta())
   36. [eatFromVehicle()](#eatFromVehicle())
   37. [getRandomTroughList()](#getRandomTroughList())
   38. [shuffleList(ArrayList)](#shuffleList(java.util.ArrayList))
   39. [swap(List, int, int)](#swap(java.util.List,int,int))
   40. [resetEatingCheck()](#resetEatingCheck())
   41. [canEatFromTrough(IsoFeedingTrough)](#canEatFromTrough(zombie.iso.objects.IsoFeedingTrough))
   42. [drinkFromGround()](#drinkFromGround())
   43. [drinkFromRiver()](#drinkFromRiver())
   44. [drinkFromPuddle()](#drinkFromPuddle())
   45. [drink()](#drink())
   46. [doesItemSatisfyHunger(float, float)](#doesItemSatisfyHunger(float,float))
   47. [eatItem(InventoryItem, boolean)](#eatItem(zombie.inventory.InventoryItem,boolean))
   48. [eat()](#eat())
   49. [canBePregnant()](#canBePregnant())
   50. [tryInseminateInMeta(PZCalendar)](#tryInseminateInMeta(zombie.util.PZCalendar))
   51. [findFemaleToInseminate(PZCalendar)](#findFemaleToInseminate(zombie.util.PZCalendar))
   52. [initSize()](#initSize())
   53. [initWeight()](#initWeight())
   54. [initStage()](#initStage())
   55. [grow(String)](#grow(java.lang.String))
   56. [getDaysSurvived()](#getDaysSurvived())
   57. [canHaveBaby()](#canHaveBaby())
   58. [init()](#init())
   59. [setAttachedPlayer(IsoPlayer)](#setAttachedPlayer(zombie.characters.IsoPlayer))
   60. [getAttachedPlayer()](#getAttachedPlayer())
   61. [setAttachedTree(IsoObject)](#setAttachedTree(zombie.iso.IsoObject))
   62. [getAttachedTree()](#getAttachedTree())
   63. [getAttachedTreeX()](#getAttachedTreeX())
   64. [getAttachedTreeY()](#getAttachedTreeY())
   65. [getBreed()](#getBreed())
   66. [setBreed(AnimalBreed)](#setBreed(zombie.characters.animals.datas.AnimalBreed))
   67. [getMilkQuantity()](#getMilkQuantity())
   68. [setMilkQuantity(float)](#setMilkQuantity(float))
   69. [setSize(float)](#setSize(float))
   70. [setSizeForced(float)](#setSizeForced(float))
   71. [getSize()](#getSize())
   72. [getOriginalSize()](#getOriginalSize())
   73. [setAge(int)](#setAge(int))
   74. [getAge()](#getAge())
   75. [getGrowStage()](#getGrowStage())
   76. [getWeight()](#getWeight())
   77. [isFemale()](#isFemale())
   78. [getAgeString(IsoGameCharacter)](#getAgeString(zombie.characters.IsoGameCharacter))
   79. [canHaveMilk()](#canHaveMilk())
   80. [setCanHaveMilk(boolean)](#setCanHaveMilk(boolean))
   81. [setPregnant(boolean)](#setPregnant(boolean))
   82. [isPregnant()](#isPregnant())
   83. [getPregnancyTime()](#getPregnancyTime())
   84. [setPregnancyTime(int)](#setPregnancyTime(int))
   85. [isFertilized()](#isFertilized())
   86. [setFertilized(boolean)](#setFertilized(boolean))
   87. [getFertilizedTime()](#getFertilizedTime())
   88. [setFertilizedTime(int)](#setFertilizedTime(int))
   89. [getWoolQuantity()](#getWoolQuantity())
   90. [setMaleGenome(HashMap)](#setMaleGenome(java.util.HashMap))
   91. [setWoolQuantity(float, boolean)](#setWoolQuantity(float,boolean))
   92. [setWoolQuantity(float)](#setWoolQuantity(float))
   93. [getRegionHutch()](#getRegionHutch())
   94. [getGeriatricPercentage()](#getGeriatricPercentage())
   95. [getMaxAgeGeriatric()](#getMaxAgeGeriatric())
   96. [getMinSize()](#getMinSize())
   97. [getMaxSize()](#getMaxSize())
   98. [getMinWeight()](#getMinWeight())
   99. [getMaxWeight()](#getMaxWeight())
   100. [setWeight(float)](#setWeight(float))
   101. [getHutchPosition()](#getHutchPosition())
   102. [setHutchPosition(int)](#setHutchPosition(int))
   103. [getPreferredHutchPosition()](#getPreferredHutchPosition())
   104. [setPreferredHutchPosition(int)](#setPreferredHutchPosition(int))
   105. [getTimeBeforeNextPregnancy()](#getTimeBeforeNextPregnancy())
   106. [getLastPregnancyPeriod()](#getLastPregnancyPeriod())
   107. [updateLastPregnancyTime()](#updateLastPregnancyTime())
   108. [getLastImpregnatePeriod(PZCalendar)](#getLastImpregnatePeriod(zombie.util.PZCalendar))
   109. [getLastTimeMilkedInHour()](#getLastTimeMilkedInHour())
   110. [updateLastTimeMilked()](#updateLastTimeMilked())
   111. [getDebugBehaviorString()](#getDebugBehaviorString())
   112. [isInLayingEggPeriod(PZCalendar)](#isInLayingEggPeriod(zombie.util.PZCalendar))
   113. [haveLayingEggPeriod()](#haveLayingEggPeriod())
   114. [getClutchSize()](#getClutchSize())
   115. [getInventoryIconTextureName()](#getInventoryIconTextureName())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AnimalData
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.datas.AnimalData

---

public class AnimalData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `age`

  `ArrayList<IsoAnimal>`

  `animalToInseminate`

  `IsoPlayer`

  `attachedPlayer`

  `private IsoObject`

  `attachedTree`

  `private int`

  `attachedTreeX`

  `private int`

  `attachedTreeY`

  `AnimalBreed`

  `breed`

  `boolean`

  `canHaveMilk`

  `int`

  `clutchSize`

  `boolean`

  `clutchSizeDone`

  `zombie.characters.animals.datas.AnimalGrowStage`

  `currentStage`

  `private int`

  `currentStageNbr`

  `boolean`

  `eatingGrass`

  `int`

  `eggsToday`

  `long`

  `eggTime`

  `int`

  `enterHutchTimerAfterDestroy`

  `static final int`

  `FEATHER_CHANCE_PER_HOUR`

  `private final IsoAnimal`

  `femaleToCheck`

  `boolean`

  `fertilized`

  `int`

  `fertilizedTime`

  `private final boolean`

  `goingToInseminate`

  `boolean`

  `goingToMom`

  `boolean`

  `goingToMomTest`

  `float`

  `goingToMomTimer`

  `static final float`

  `HUNGER_PER_DRAINABLE_USE`

  `private int`

  `hutchPosition`

  `int`

  `lastHourCheck`

  `int`

  `lastImpregnateTime`

  `long`

  `lastMilkTimer`

  `long`

  `lastPregnancyTime`

  `private final ArrayList<zombie.network.SpawnRegions.Point>`

  `linkedTrough`

  `HashMap<String, AnimalGene>`

  `maleGenome`

  `float`

  `maxMilkActual`

  `float`

  `milkQty`

  `static final long`

  `ONE_DAY_MILLISECONDS`

  `static final long`

  `ONE_HOUR_MILLISECONDS`

  `static final long`

  `ONE_WEEK_MILLISECONDS`

  `private float`

  `originalSize`

  `IsoAnimal`

  `parent`

  `private int`

  `preferredHutchPosition`

  `boolean`

  `pregnant`

  `int`

  `pregnantTime`

  `private float`

  `size`

  `private static final long`

  `TIME_TO_LOSE_MILK`

  `private int`

  `troughPathTimer`

  `IsoFeedingTrough`

  `troughToCheck`

  `float`

  `weight`

  `float`

  `woolQty`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalData(IsoAnimal parent,
  AnimalBreed breed)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private int`

  `calcClutchSize()`

  `void`

  `callToTrough(IsoFeedingTrough trough)`

  When adding feed to a trough, animals will come to it to eat

  `boolean`

  `canBePregnant()`

  `private InventoryItem`

  `canEatFromTrough(IsoFeedingTrough trough)`

  `boolean`

  `canHaveBaby()`

  `boolean`

  `canHaveMilk()`

  `void`

  `checkEggs(PZCalendar realCal,
  boolean meta)`

  `void`

  `checkFertilizedTime()`

  `private void`

  `checkOld()`

  `InventoryItem`

  `checkPoop(boolean meta,
  boolean bForce)`

  Each day animal poop

  `private void`

  `checkPregnancy()`

  Check if the animal is ready to popup a baby
  Stress can reduce chance of having a baby

  `void`

  `checkStages()`

  `private static boolean`

  `doesItemSatisfyHunger(float itemHungerValue,
  float animalHunger)`

  `void`

  `drink()`

  `void`

  `drinkFromGround()`

  `private void`

  `drinkFromPuddle()`

  `private void`

  `drinkFromRiver()`

  `InventoryItem`

  `dropFeather(boolean meta)`

  Some chance that an animal will drop a feather

  `void`

  `eat()`

  `private void`

  `eatAndDrinkAfterMeta()`

  We gonna try to eat invalid input: '&' drink after meta
  This function is called 1 time for each hour spent in the meta

  `private void`

  `eatAndDrinkAfterMetaVehicle()`

  Gonna check if we can eat from vehicle's food container

  `private boolean`

  `eatFromVehicle()`

  When inside a trailer we look for the food container

  `void`

  `eatItem(InventoryItem item,
  boolean onground)`

  `void`

  `findFemaleToInseminate(PZCalendar realCal)`

  Look for every possible female in our zones
  This list gets reset every day as some female might be outside of reach so we ignore them

  `int`

  `getAge()`

  `float`

  `getAgeGrowModifier()`

  `String`

  `getAgeString(IsoGameCharacter chr)`

  `IsoPlayer`

  `getAttachedPlayer()`

  `IsoObject`

  `getAttachedTree()`

  `int`

  `getAttachedTreeX()`

  `int`

  `getAttachedTreeY()`

  `AnimalBreed`

  `getBreed()`

  `int`

  `getClutchSize()`

  `int`

  `getDaysSurvived()`

  `String`

  `getDebugBehaviorString()`

  `int`

  `getFertilizedTime()`

  `float`

  `getGeriatricPercentage()`

  The closer we are to MaxAgeGeriatric the closer to 100% we'll be

  `ArrayList<zombie.characters.animals.datas.AnimalGrowStage>`

  `getGrowStage()`

  `float`

  `getHealthLoss(Float divide)`

  `private float`

  `getHungerReduction()`

  `private float`

  `getHungerReductionMetaMod()`

  `private float`

  `getHungerReductionMod()`

  `int`

  `getHutchPosition()`

  `String`

  `getInventoryIconTextureName()`

  `int`

  `getLastImpregnatePeriod(PZCalendar realCal)`

  Return how much hours since the last time the male tried to have sex
  0 means he's ready, -1 means he can't have child

  `String`

  `getLastPregnancyPeriod()`

  `Float`

  `getLastTimeMilkedInHour()`

  Used in debug in animalUI

  `float`

  `getMaxAgeGeriatric()`

  `float`

  `getMaxMilk()`

  `float`

  `getMaxMilkActual()`

  `float`

  `getMaxSize()`

  `float`

  `getMaxWeight()`

  `float`

  `getMaxWool()`

  `float`

  `getMilkInc()`

  `private float`

  `getMilkIncModifier()`

  `float`

  `getMilkQuantity()`

  `float`

  `getMinMilk()`

  `float`

  `getMinSize()`

  `float`

  `getMinWeight()`

  `float`

  `getOriginalSize()`

  `int`

  `getPreferredHutchPosition()`

  `int`

  `getPregnancyTime()`

  `int`

  `getPregnantPeriod()`

  `ArrayList<IsoFeedingTrough>`

  `getRandomTroughList()`

  Deprecated.

  `IsoHutch`

  `getRegionHutch()`

  `float`

  `getSize()`

  `private float`

  `getThirstReduction()`

  `int`

  `getTimeBeforeNextPregnancy()`

  `float`

  `getWeight()`

  `float`

  `getWoolInc()`

  `private float`

  `getWoolIncModifier()`

  `float`

  `getWoolQuantity()`

  `void`

  `grow(String newtype)`

  When an animal change stage

  `void`

  `growUp(boolean meta)`

  Every day

  `boolean`

  `haveLayingEggPeriod()`

  `void`

  `hourGrow(boolean meta)`

  `void`

  `init()`

  `void`

  `initSize()`

  `void`

  `initStage()`

  `void`

  `initWeight()`

  `boolean`

  `isFemale()`

  `boolean`

  `isFertilized()`

  `boolean`

  `isInLayingEggPeriod(PZCalendar cal)`

  `boolean`

  `isPregnant()`

  `boolean`

  `reduceHealthDueToMilk()`

  If an animal can have milk and its current milk is at least 70% of the max possible milk for this breed, we gonna drain health

  `void`

  `resetEatingCheck()`

  Reset every trough we're supposed to check

  `void`

  `setAge(int age)`

  `void`

  `setAttachedPlayer(IsoPlayer chr)`

  `void`

  `setAttachedTree(IsoObject tree)`

  `void`

  `setBreed(AnimalBreed breed)`

  `void`

  `setCanHaveMilk(boolean canHaveMilk)`

  `void`

  `setFertilized(boolean b)`

  `int`

  `setFertilizedTime(int period)`

  `void`

  `setHutchPosition(int hutchPosition)`

  `void`

  `setMaleGenome(HashMap<String, AnimalGene> maleGenome)`

  `void`

  `setMaxMilkActual(float maxMilkActual)`

  `void`

  `setMilkQuantity(float milkQty)`

  `void`

  `setPreferredHutchPosition(int preferredHutchPosition)`

  `void`

  `setPregnancyTime(int period)`

  `void`

  `setPregnant(boolean pregnant)`

  `void`

  `setSize(float size)`

  `void`

  `setSizeForced(float size)`

  This function ignores the restricted size by the animal def
  Used for the butcher hook to force a size of some animals

  `void`

  `setWeight(float weight)`

  `void`

  `setWoolQuantity(float woolQty)`

  `void`

  `setWoolQuantity(float woolQty,
  boolean force)`

  `static void`

  `shuffleList(ArrayList<IsoFeedingTrough> a)`

  `private static void`

  `swap(List<IsoFeedingTrough> a,
  int i,
  int change)`

  `void`

  `tryInseminateInMeta(PZCalendar realCal)`

  `void`

  `update()`

  `void`

  `updateHealth()`

  `void`

  `updateHungerAndThirst(boolean fromMeta)`

  `void`

  `updateLastPregnancyTime()`

  `void`

  `updateLastTimeMilked()`

  When an animal is milked or when she start to have milk, we update the last time it was milked, after a week she won't produce anymore milk

  `private void`

  `updateMilk()`

  `private void`

  `updateWeight()`

  Weight is updated each day, but this is where we lower the weight if animal is hungry

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parent

    public [IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals") parent
  + ### attachedPlayer

    public [IsoPlayer](../../IsoPlayer.html "class in zombie.characters") attachedPlayer
  + ### attachedTree

    private [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") attachedTree
  + ### attachedTreeX

    private int attachedTreeX
  + ### attachedTreeY

    private int attachedTreeY
  + ### breed

    public [AnimalBreed](AnimalBreed.html "class in zombie.characters.animals.datas") breed
  + ### milkQty

    public float milkQty
  + ### woolQty

    public float woolQty
  + ### canHaveMilk

    public boolean canHaveMilk
  + ### weight

    public float weight
  + ### size

    private float size
  + ### originalSize

    private float originalSize
  + ### age

    private int age
  + ### currentStageNbr

    private int currentStageNbr
  + ### lastHourCheck

    public int lastHourCheck
  + ### currentStage

    public zombie.characters.animals.datas.AnimalGrowStage currentStage
  + ### pregnant

    public boolean pregnant
  + ### pregnantTime

    public int pregnantTime
  + ### femaleToCheck

    private final [IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals") femaleToCheck
  + ### animalToInseminate

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals")> animalToInseminate
  + ### maxMilkActual

    public float maxMilkActual
  + ### goingToMomTest

    public boolean goingToMomTest
  + ### goingToMom

    public boolean goingToMom
  + ### goingToMomTimer

    public float goingToMomTimer
  + ### linkedTrough

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.network.SpawnRegions.Point> linkedTrough
  + ### eatingGrass

    public boolean eatingGrass
  + ### eggsToday

    public int eggsToday
  + ### eggTime

    public long eggTime
  + ### fertilized

    public boolean fertilized
  + ### fertilizedTime

    public int fertilizedTime
  + ### maleGenome

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](../AnimalGene.html "class in zombie.characters.animals")> maleGenome
  + ### hutchPosition

    private int hutchPosition
  + ### preferredHutchPosition

    private int preferredHutchPosition
  + ### troughPathTimer

    private int troughPathTimer
  + ### troughToCheck

    public [IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") troughToCheck
  + ### goingToInseminate

    private final boolean goingToInseminate

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.goingToInseminate)
  + ### lastMilkTimer

    public long lastMilkTimer
  + ### lastPregnancyTime

    public long lastPregnancyTime
  + ### ONE\_WEEK\_MILLISECONDS

    public static final long ONE\_WEEK\_MILLISECONDS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.ONE_WEEK_MILLISECONDS)
  + ### ONE\_DAY\_MILLISECONDS

    public static final long ONE\_DAY\_MILLISECONDS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.ONE_DAY_MILLISECONDS)
  + ### ONE\_HOUR\_MILLISECONDS

    public static final long ONE\_HOUR\_MILLISECONDS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.ONE_HOUR_MILLISECONDS)
  + ### FEATHER\_CHANCE\_PER\_HOUR

    public static final int FEATHER\_CHANCE\_PER\_HOUR

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.FEATHER_CHANCE_PER_HOUR)
  + ### HUNGER\_PER\_DRAINABLE\_USE

    public static final float HUNGER\_PER\_DRAINABLE\_USE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.HUNGER_PER_DRAINABLE_USE)
  + ### TIME\_TO\_LOSE\_MILK

    private static final long TIME\_TO\_LOSE\_MILK

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.characters.animals.datas.AnimalData.TIME_TO_LOSE_MILK)
  + ### lastImpregnateTime

    public int lastImpregnateTime
  + ### clutchSize

    public int clutchSize
  + ### clutchSizeDone

    public boolean clutchSizeDone
  + ### enterHutchTimerAfterDestroy

    public int enterHutchTimerAfterDestroy
* Constructor Details
  -------------------

  + ### AnimalData

    public AnimalData([IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals") parent,
    [AnimalBreed](AnimalBreed.html "class in zombie.characters.animals.datas") breed)
* Method Details
  --------------

  + ### checkStages

    public void checkStages()
  + ### update

    public void update()
  + ### callToTrough

    public void callToTrough([IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)

    When adding feed to a trough, animals will come to it to eat
  + ### checkPregnancy

    private void checkPregnancy()

    Check if the animal is ready to popup a baby
    Stress can reduce chance of having a baby
  + ### getAgeGrowModifier

    public float getAgeGrowModifier()
  + ### growUp

    public void growUp(boolean meta)

    Every day
  + ### checkPoop

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") checkPoop(boolean meta,
    boolean bForce)

    Each day animal poop
  + ### dropFeather

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") dropFeather(boolean meta)

    Some chance that an animal will drop a feather
  + ### updateHungerAndThirst

    public void updateHungerAndThirst(boolean fromMeta)
  + ### reduceHealthDueToMilk

    public boolean reduceHealthDueToMilk()

    If an animal can have milk and its current milk is at least 70% of the max possible milk for this breed, we gonna drain health
  + ### updateHealth

    public void updateHealth()
  + ### hourGrow

    public void hourGrow(boolean meta)
  + ### updateWeight

    private void updateWeight()

    Weight is updated each day, but this is where we lower the weight if animal is hungry
  + ### updateMilk

    private void updateMilk()
  + ### checkOld

    private void checkOld()
  + ### getHealthLoss

    public float getHealthLoss([Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") divide)
  + ### getMaxMilk

    public float getMaxMilk()
  + ### getMaxMilkActual

    public float getMaxMilkActual()
  + ### setMaxMilkActual

    public void setMaxMilkActual(float maxMilkActual)
  + ### getMaxWool

    public float getMaxWool()
  + ### getMinMilk

    public float getMinMilk()
  + ### getMilkInc

    public float getMilkInc()
  + ### getWoolInc

    public float getWoolInc()
  + ### calcClutchSize

    private int calcClutchSize()
  + ### checkEggs

    public void checkEggs([PZCalendar](../../../util/PZCalendar.html "class in zombie.util") realCal,
    boolean meta)
  + ### checkFertilizedTime

    public void checkFertilizedTime()
  + ### getMilkIncModifier

    private float getMilkIncModifier()
  + ### getWoolIncModifier

    private float getWoolIncModifier()
  + ### getPregnantPeriod

    public int getPregnantPeriod()
  + ### getThirstReduction

    private float getThirstReduction()
  + ### getHungerReduction

    private float getHungerReduction()
  + ### getHungerReductionMetaMod

    private float getHungerReductionMetaMod()
  + ### getHungerReductionMod

    private float getHungerReductionMod()
  + ### eatAndDrinkAfterMetaVehicle

    private void eatAndDrinkAfterMetaVehicle()

    Gonna check if we can eat from vehicle's food container
  + ### eatAndDrinkAfterMeta

    private void eatAndDrinkAfterMeta()

    We gonna try to eat invalid input: '&' drink after meta
    This function is called 1 time for each hour spent in the meta
  + ### eatFromVehicle

    private boolean eatFromVehicle()

    When inside a trailer we look for the food container
  + ### getRandomTroughList

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> getRandomTroughList()

    Deprecated.

    Randomize all the trough available in all our zones
  + ### shuffleList

    public static void shuffleList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> a)
  + ### swap

    private static void swap([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> a,
    int i,
    int change)
  + ### resetEatingCheck

    public void resetEatingCheck()

    Reset every trough we're supposed to check
  + ### canEatFromTrough

    private [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") canEatFromTrough([IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)
  + ### drinkFromGround

    public void drinkFromGround()
  + ### drinkFromRiver

    private void drinkFromRiver()
  + ### drinkFromPuddle

    private void drinkFromPuddle()
  + ### drink

    public void drink()
  + ### doesItemSatisfyHunger

    private static boolean doesItemSatisfyHunger(float itemHungerValue,
    float animalHunger)
  + ### eatItem

    public void eatItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean onground)
  + ### eat

    public void eat()
  + ### canBePregnant

    public boolean canBePregnant()
  + ### tryInseminateInMeta

    public void tryInseminateInMeta([PZCalendar](../../../util/PZCalendar.html "class in zombie.util") realCal)
  + ### findFemaleToInseminate

    public void findFemaleToInseminate([PZCalendar](../../../util/PZCalendar.html "class in zombie.util") realCal)

    Look for every possible female in our zones
    This list gets reset every day as some female might be outside of reach so we ignore them
  + ### initSize

    public void initSize()
  + ### initWeight

    public void initWeight()
  + ### initStage

    public void initStage()
  + ### grow

    public void grow([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newtype)

    When an animal change stage
  + ### getDaysSurvived

    public int getDaysSurvived()
  + ### canHaveBaby

    public boolean canHaveBaby()
  + ### init

    public void init()
  + ### setAttachedPlayer

    public void setAttachedPlayer([IsoPlayer](../../IsoPlayer.html "class in zombie.characters") chr)
  + ### getAttachedPlayer

    public [IsoPlayer](../../IsoPlayer.html "class in zombie.characters") getAttachedPlayer()
  + ### setAttachedTree

    public void setAttachedTree([IsoObject](../../../iso/IsoObject.html "class in zombie.iso") tree)
  + ### getAttachedTree

    public [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") getAttachedTree()
  + ### getAttachedTreeX

    public int getAttachedTreeX()
  + ### getAttachedTreeY

    public int getAttachedTreeY()
  + ### getBreed

    public [AnimalBreed](AnimalBreed.html "class in zombie.characters.animals.datas") getBreed()
  + ### setBreed

    public void setBreed([AnimalBreed](AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### getMilkQuantity

    public float getMilkQuantity()
  + ### setMilkQuantity

    public void setMilkQuantity(float milkQty)
  + ### setSize

    public void setSize(float size)
  + ### setSizeForced

    public void setSizeForced(float size)

    This function ignores the restricted size by the animal def
    Used for the butcher hook to force a size of some animals
  + ### getSize

    public float getSize()
  + ### getOriginalSize

    public float getOriginalSize()
  + ### setAge

    public void setAge(int age)
  + ### getAge

    public int getAge()
  + ### getGrowStage

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.datas.AnimalGrowStage> getGrowStage()
  + ### getWeight

    public float getWeight()
  + ### isFemale

    public boolean isFemale()
  + ### getAgeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAgeString([IsoGameCharacter](../../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canHaveMilk

    public boolean canHaveMilk()
  + ### setCanHaveMilk

    public void setCanHaveMilk(boolean canHaveMilk)
  + ### setPregnant

    public void setPregnant(boolean pregnant)
  + ### isPregnant

    public boolean isPregnant()
  + ### getPregnancyTime

    public int getPregnancyTime()
  + ### setPregnancyTime

    public void setPregnancyTime(int period)
  + ### isFertilized

    public boolean isFertilized()
  + ### setFertilized

    public void setFertilized(boolean b)
  + ### getFertilizedTime

    public int getFertilizedTime()
  + ### setFertilizedTime

    public int setFertilizedTime(int period)
  + ### getWoolQuantity

    public float getWoolQuantity()
  + ### setMaleGenome

    public void setMaleGenome([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](../AnimalGene.html "class in zombie.characters.animals")> maleGenome)
  + ### setWoolQuantity

    public void setWoolQuantity(float woolQty,
    boolean force)
  + ### setWoolQuantity

    public void setWoolQuantity(float woolQty)
  + ### getRegionHutch

    public [IsoHutch](../../../iso/objects/IsoHutch.html "class in zombie.iso.objects") getRegionHutch()
  + ### getGeriatricPercentage

    public float getGeriatricPercentage()

    The closer we are to MaxAgeGeriatric the closer to 100% we'll be
  + ### getMaxAgeGeriatric

    public float getMaxAgeGeriatric()
  + ### getMinSize

    public float getMinSize()
  + ### getMaxSize

    public float getMaxSize()
  + ### getMinWeight

    public float getMinWeight()
  + ### getMaxWeight

    public float getMaxWeight()
  + ### setWeight

    public void setWeight(float weight)
  + ### getHutchPosition

    public int getHutchPosition()
  + ### setHutchPosition

    public void setHutchPosition(int hutchPosition)
  + ### getPreferredHutchPosition

    public int getPreferredHutchPosition()
  + ### setPreferredHutchPosition

    public void setPreferredHutchPosition(int preferredHutchPosition)
  + ### getTimeBeforeNextPregnancy

    public int getTimeBeforeNextPregnancy()
  + ### getLastPregnancyPeriod

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastPregnancyPeriod()
  + ### updateLastPregnancyTime

    public void updateLastPregnancyTime()
  + ### getLastImpregnatePeriod

    public int getLastImpregnatePeriod([PZCalendar](../../../util/PZCalendar.html "class in zombie.util") realCal)

    Return how much hours since the last time the male tried to have sex
    0 means he's ready, -1 means he can't have child

    Parameters:
    :   `realCal` - calender to test, if null gonna take the current time (cal is needed when calculating meta time)
  + ### getLastTimeMilkedInHour

    public [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") getLastTimeMilkedInHour()

    Used in debug in animalUI
  + ### updateLastTimeMilked

    public void updateLastTimeMilked()

    When an animal is milked or when she start to have milk, we update the last time it was milked, after a week she won't produce anymore milk
  + ### getDebugBehaviorString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDebugBehaviorString()
  + ### isInLayingEggPeriod

    public boolean isInLayingEggPeriod([PZCalendar](../../../util/PZCalendar.html "class in zombie.util") cal)
  + ### haveLayingEggPeriod

    public boolean haveLayingEggPeriod()
  + ### getClutchSize

    public int getClutchSize()
  + ### getInventoryIconTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInventoryIconTextureName()