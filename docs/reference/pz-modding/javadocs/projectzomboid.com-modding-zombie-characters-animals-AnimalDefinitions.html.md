[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalDefinitions](AnimalDefinitions.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [animalTypeStr](#animalTypeStr)
   2. [bodyModel](#bodyModel)
   3. [bodyModelSkel](#bodyModelSkel)
   4. [bodyModelFleece](#bodyModelFleece)
   5. [bodyModelStr](#bodyModelStr)
   6. [bodyModelSkelNoHeadStr](#bodyModelSkelNoHeadStr)
   7. [bodyModelSkelNoHead](#bodyModelSkelNoHead)
   8. [bodyModelHeadless](#bodyModelHeadless)
   9. [bodyModelFleeceStr](#bodyModelFleeceStr)
   10. [bodyModelSkelStr](#bodyModelSkelStr)
   11. [bodyModelHeadlessStr](#bodyModelHeadlessStr)
   12. [textureSkeleton](#textureSkeleton)
   13. [textureSkeletonBloody](#textureSkeletonBloody)
   14. [textureRotten](#textureRotten)
   15. [textureSkinned](#textureSkinned)
   16. [animset](#animset)
   17. [mate](#mate)
   18. [shadoww](#shadoww)
   19. [shadowfm](#shadowfm)
   20. [shadowbm](#shadowbm)
   21. [turnDelta](#turnDelta)
   22. [animalSize](#animalSize)
   23. [minSize](#minSize)
   24. [maxSize](#maxSize)
   25. [minAge](#minAge)
   26. [minEnclosureSize](#minEnclosureSize)
   27. [babyType](#babyType)
   28. [minAgeForBaby](#minAgeForBaby)
   29. [maxAgeGeriatric](#maxAgeGeriatric)
   30. [udder](#udder)
   31. [female](#female)
   32. [male](#male)
   33. [stages](#stages)
   34. [breeds](#breeds)
   35. [genome](#genome)
   36. [alwaysFleeHumans](#alwaysFleeHumans)
   37. [fleeZombies](#fleeZombies)
   38. [canBeAttached](#canBeAttached)
   39. [canBeTransported](#canBeTransported)
   40. [hungerMultiplier](#hungerMultiplier)
   41. [thirstMultiplier](#thirstMultiplier)
   42. [healthLossMultiplier](#healthLossMultiplier)
   43. [wanderMul](#wanderMul)
   44. [idleTypeNbr](#idleTypeNbr)
   45. [eatingTypeNbr](#eatingTypeNbr)
   46. [sittingTypeNbr](#sittingTypeNbr)
   47. [eatFromMother](#eatFromMother)
   48. [periodicRun](#periodicRun)
   49. [pregnantPeriod](#pregnantPeriod)
   50. [eatGrass](#eatGrass)
   51. [sitRandomly](#sitRandomly)
   52. [eatTypeTrough](#eatTypeTrough)
   53. [canBeMilked](#canBeMilked)
   54. [minBaby](#minBaby)
   55. [maxBaby](#maxBaby)
   56. [idleEmoteChance](#idleEmoteChance)
   57. [eggsPerDay](#eggsPerDay)
   58. [eggType](#eggType)
   59. [fertilizedTimeMax](#fertilizedTimeMax)
   60. [timeToHatch](#timeToHatch)
   61. [canBePicked](#canBePicked)
   62. [hutches](#hutches)
   63. [enterHutchTime](#enterHutchTime)
   64. [exitHutchTime](#exitHutchTime)
   65. [genes](#genes)
   66. [minMilk](#minMilk)
   67. [maxMilk](#maxMilk)
   68. [maxWool](#maxWool)
   69. [minWeight](#minWeight)
   70. [maxWeight](#maxWeight)
   71. [carcassItem](#carcassItem)
   72. [attackDist](#attackDist)
   73. [attackTimer](#attackTimer)
   74. [dontAttackOtherMale](#dontAttackOtherMale)
   75. [canBeFeedByHand](#canBeFeedByHand)
   76. [baseDmg](#baseDmg)
   77. [milkAnimPreset](#milkAnimPreset)
   78. [feedByHandType](#feedByHandType)
   79. [trailerBaseSize](#trailerBaseSize)
   80. [canBePet](#canBePet)
   81. [attackBack](#attackBack)
   82. [collisionSize](#collisionSize)
   83. [baseEncumbrance](#baseEncumbrance)
   84. [matingPeriodStart](#matingPeriodStart)
   85. [matingPeriodEnd](#matingPeriodEnd)
   86. [timeBeforeNextPregnancy](#timeBeforeNextPregnancy)
   87. [thirstHungerTrigger](#thirstHungerTrigger)
   88. [collidable](#collidable)
   89. [canThump](#canThump)
   90. [wild](#wild)
   91. [spottingDist](#spottingDist)
   92. [group](#group)
   93. [canBeAlerted](#canBeAlerted)
   94. [dung](#dung)
   95. [attackIfStressed](#attackIfStressed)
   96. [happyAnim](#happyAnim)
   97. [ropeBone](#ropeBone)
   98. [minClutchSize](#minClutchSize)
   99. [maxClutchSize](#maxClutchSize)
   100. [layEggPeriodStart](#layEggPeriodStart)
   101. [stressAboveGround](#stressAboveGround)
   102. [canClimbStairs](#canClimbStairs)
   103. [stressUnderRain](#stressUnderRain)
   104. [canClimbFences](#canClimbFences)
   105. [needMom](#needMom)
   106. [canBeDomesticated](#canBeDomesticated)
   107. [dungChancePerDay](#dungChancePerDay)
   108. [hungerBoost](#hungerBoost)
   109. [thirstBoost](#thirstBoost)
   110. [distToEat](#distToEat)
   111. [knockdownAttack](#knockdownAttack)
   112. [minBodyPart](#minBodyPart)
   113. [canDoLaceration](#canDoLaceration)
   114. [maxBlood](#maxBlood)
   115. [minBlood](#minBlood)
   116. [litterEatTogether](#litterEatTogether)
   117. [addTrackingXp](#addTrackingXp)
   118. [corpseSize](#corpseSize)
   119. [corpseLength](#corpseLength)
   120. [idleSoundRadius](#idleSoundRadius)
   121. [idleSoundVolume](#idleSoundVolume)
   122. [wildFleeTimeUntilDeadTimer](#wildFleeTimeUntilDeadTimer)
   123. [canBeKilledWithoutWeapon](#canBeKilledWithoutWeapon)
   124. [feedByHandAnim](#feedByHandAnim)
   125. [animalDefs](#animalDefs)
6. [Constructor Details](#constructor-detail)
   1. [AnimalDefinitions()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getAnimalDefs()](#getAnimalDefs())
   2. [getAnimalDefsArray()](#getAnimalDefsArray())
   3. [loadAnimalDefinitions()](#loadAnimalDefinitions())
   4. [loadGenes(AnimalDefinitions, KahluaTableImpl)](#loadGenes(zombie.characters.animals.AnimalDefinitions,se.krka.kahlua.j2se.KahluaTableImpl))
   5. [loadBreeds(AnimalDefinitions, KahluaTableImpl)](#loadBreeds(zombie.characters.animals.AnimalDefinitions,se.krka.kahlua.j2se.KahluaTableImpl))
   6. [loadStages(AnimalDefinitions, KahluaTableImpl)](#loadStages(zombie.characters.animals.AnimalDefinitions,se.krka.kahlua.j2se.KahluaTableImpl))
   7. [getBreedByName(String)](#getBreedByName(java.lang.String))
   8. [getRandomBreed()](#getRandomBreed())
   9. [getDef(IsoAnimal)](#getDef(zombie.characters.animals.IsoAnimal))
   10. [getDef(String)](#getDef(java.lang.String))
   11. [getBreeds()](#getBreeds())
   12. [getAnimalType()](#getAnimalType())
   13. [getBodyModelStr()](#getBodyModelStr())
   14. [isInsideHutchTime(Integer)](#isInsideHutchTime(java.lang.Integer))
   15. [isOutsideHutchTime()](#isOutsideHutchTime())
   16. [getGroup()](#getGroup())
   17. [Reset()](#Reset())
   18. [canBeSkeleton()](#canBeSkeleton())
   19. [getMinBaby()](#getMinBaby())
   20. [getMaxBaby()](#getMaxBaby())
   21. [getBabyType()](#getBabyType())
   22. [getWildFleeTimeUntilDeadTimer()](#getWildFleeTimeUntilDeadTimer())
   23. [getGrowStage()](#getGrowStage())
   24. [isBaby()](#isBaby())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalDefinitions
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalDefinitions

---

public class AnimalDefinitions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `addTrackingXp`

  `boolean`

  `alwaysFleeHumans`

  `static HashMap<String, AnimalDefinitions>`

  `animalDefs`

  `float`

  `animalSize`

  `String`

  `animalTypeStr`

  `String`

  `animset`

  `boolean`

  `attackBack`

  `int`

  `attackDist`

  `boolean`

  `attackIfStressed`

  `int`

  `attackTimer`

  `String`

  `babyType`

  `float`

  `baseDmg`

  `float`

  `baseEncumbrance`

  `zombie.core.skinnedmodel.model.Model`

  `bodyModel`

  `zombie.core.skinnedmodel.model.Model`

  `bodyModelFleece`

  `String`

  `bodyModelFleeceStr`

  `zombie.core.skinnedmodel.model.Model`

  `bodyModelHeadless`

  `String`

  `bodyModelHeadlessStr`

  `zombie.core.skinnedmodel.model.Model`

  `bodyModelSkel`

  `zombie.core.skinnedmodel.model.Model`

  `bodyModelSkelNoHead`

  `String`

  `bodyModelSkelNoHeadStr`

  `String`

  `bodyModelSkelStr`

  `String`

  `bodyModelStr`

  `ArrayList<AnimalBreed>`

  `breeds`

  `boolean`

  `canBeAlerted`

  `boolean`

  `canBeAttached`

  `boolean`

  `canBeDomesticated`

  `boolean`

  `canBeFeedByHand`

  `boolean`

  `canBeKilledWithoutWeapon`

  `boolean`

  `canBeMilked`

  `boolean`

  `canBePet`

  `boolean`

  `canBePicked`

  `boolean`

  `canBeTransported`

  `boolean`

  `canClimbFences`

  `boolean`

  `canClimbStairs`

  `boolean`

  `canDoLaceration`

  `boolean`

  `canThump`

  `String`

  `carcassItem`

  `boolean`

  `collidable`

  `float`

  `collisionSize`

  `float`

  `corpseLength`

  `float`

  `corpseSize`

  `float`

  `distToEat`

  `boolean`

  `dontAttackOtherMale`

  `String`

  `dung`

  `int`

  `dungChancePerDay`

  `boolean`

  `eatFromMother`

  `boolean`

  `eatGrass`

  `int`

  `eatingTypeNbr`

  `ArrayList<String>`

  `eatTypeTrough`

  `int`

  `eggsPerDay`

  `String`

  `eggType`

  `int`

  `enterHutchTime`

  `int`

  `exitHutchTime`

  `String`

  `feedByHandAnim`

  `ArrayList<String>`

  `feedByHandType`

  `boolean`

  `female`

  `int`

  `fertilizedTimeMax`

  `boolean`

  `fleeZombies`

  `ArrayList<String>`

  `genes`

  `ArrayList<AnimalAllele>`

  `genome`

  `String`

  `group`

  `int`

  `happyAnim`

  `float`

  `healthLossMultiplier`

  `float`

  `hungerBoost`

  `float`

  `hungerMultiplier`

  `ArrayList<String>`

  `hutches`

  `int`

  `idleEmoteChance`

  `float`

  `idleSoundRadius`

  `float`

  `idleSoundVolume`

  `int`

  `idleTypeNbr`

  `boolean`

  `knockdownAttack`

  `int`

  `layEggPeriodStart`

  `boolean`

  `litterEatTogether`

  `boolean`

  `male`

  `String`

  `mate`

  `int`

  `matingPeriodEnd`

  `int`

  `matingPeriodStart`

  `int`

  `maxAgeGeriatric`

  `int`

  `maxBaby`

  `float`

  `maxBlood`

  `int`

  `maxClutchSize`

  `float`

  `maxMilk`

  `float`

  `maxSize`

  `float`

  `maxWeight`

  `float`

  `maxWool`

  `String`

  `milkAnimPreset`

  `int`

  `minAge`

  `int`

  `minAgeForBaby`

  `int`

  `minBaby`

  `float`

  `minBlood`

  `int`

  `minBodyPart`

  `int`

  `minClutchSize`

  `int`

  `minEnclosureSize`

  `float`

  `minMilk`

  `float`

  `minSize`

  `float`

  `minWeight`

  `boolean`

  `needMom`

  `boolean`

  `periodicRun`

  `int`

  `pregnantPeriod`

  `String`

  `ropeBone`

  `float`

  `shadowbm`

  `float`

  `shadowfm`

  `float`

  `shadoww`

  `boolean`

  `sitRandomly`

  `int`

  `sittingTypeNbr`

  `int`

  `spottingDist`

  `ArrayList<zombie.characters.animals.datas.AnimalGrowStage>`

  `stages`

  `boolean`

  `stressAboveGround`

  `boolean`

  `stressUnderRain`

  `String`

  `textureRotten`

  `String`

  `textureSkeleton`

  `String`

  `textureSkeletonBloody`

  `String`

  `textureSkinned`

  `float`

  `thirstBoost`

  `float`

  `thirstHungerTrigger`

  `float`

  `thirstMultiplier`

  `int`

  `timeBeforeNextPregnancy`

  `int`

  `timeToHatch`

  `float`

  `trailerBaseSize`

  `float`

  `turnDelta`

  `boolean`

  `udder`

  `float`

  `wanderMul`

  `boolean`

  `wild`

  `private float`

  `wildFleeTimeUntilDeadTimer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalDefinitions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canBeSkeleton()`

  `static HashMap<String, AnimalDefinitions>`

  `getAnimalDefs()`

  `static ArrayList<AnimalDefinitions>`

  `getAnimalDefsArray()`

  `String`

  `getAnimalType()`

  `String`

  `getBabyType()`

  `String`

  `getBodyModelStr()`

  `AnimalBreed`

  `getBreedByName(String breedName)`

  `ArrayList<AnimalBreed>`

  `getBreeds()`

  `static AnimalDefinitions`

  `getDef(String animalType)`

  `static AnimalDefinitions`

  `getDef(IsoAnimal animal)`

  `String`

  `getGroup()`

  `zombie.characters.animals.datas.AnimalGrowStage`

  `getGrowStage()`

  `int`

  `getMaxBaby()`

  `int`

  `getMinBaby()`

  `AnimalBreed`

  `getRandomBreed()`

  `float`

  `getWildFleeTimeUntilDeadTimer()`

  `boolean`

  `isBaby()`

  `boolean`

  `isInsideHutchTime(Integer hour)`

  `boolean`

  `isOutsideHutchTime()`

  `static void`

  `loadAnimalDefinitions()`

  `private static void`

  `loadBreeds(AnimalDefinitions def,
  se.krka.kahlua.j2se.KahluaTableImpl table)`

  `private static void`

  `loadGenes(AnimalDefinitions def,
  se.krka.kahlua.j2se.KahluaTableImpl table)`

  `private static void`

  `loadStages(AnimalDefinitions def,
  se.krka.kahlua.j2se.KahluaTableImpl table)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### animalTypeStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalTypeStr
  + ### bodyModel

    public zombie.core.skinnedmodel.model.Model bodyModel
  + ### bodyModelSkel

    public zombie.core.skinnedmodel.model.Model bodyModelSkel
  + ### bodyModelFleece

    public zombie.core.skinnedmodel.model.Model bodyModelFleece
  + ### bodyModelStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyModelStr
  + ### bodyModelSkelNoHeadStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyModelSkelNoHeadStr
  + ### bodyModelSkelNoHead

    public zombie.core.skinnedmodel.model.Model bodyModelSkelNoHead
  + ### bodyModelHeadless

    public zombie.core.skinnedmodel.model.Model bodyModelHeadless
  + ### bodyModelFleeceStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyModelFleeceStr
  + ### bodyModelSkelStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyModelSkelStr
  + ### bodyModelHeadlessStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyModelHeadlessStr
  + ### textureSkeleton

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureSkeleton
  + ### textureSkeletonBloody

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureSkeletonBloody
  + ### textureRotten

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureRotten
  + ### textureSkinned

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureSkinned
  + ### animset

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animset
  + ### mate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mate
  + ### shadoww

    public float shadoww
  + ### shadowfm

    public float shadowfm
  + ### shadowbm

    public float shadowbm
  + ### turnDelta

    public float turnDelta
  + ### animalSize

    public float animalSize
  + ### minSize

    public float minSize
  + ### maxSize

    public float maxSize
  + ### minAge

    public int minAge
  + ### minEnclosureSize

    public int minEnclosureSize
  + ### babyType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") babyType
  + ### minAgeForBaby

    public int minAgeForBaby
  + ### maxAgeGeriatric

    public int maxAgeGeriatric
  + ### udder

    public boolean udder
  + ### female

    public boolean female
  + ### male

    public boolean male
  + ### stages

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.datas.AnimalGrowStage> stages
  + ### breeds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas")> breeds
  + ### genome

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalAllele](AnimalAllele.html "class in zombie.characters.animals")> genome
  + ### alwaysFleeHumans

    public boolean alwaysFleeHumans
  + ### fleeZombies

    public boolean fleeZombies
  + ### canBeAttached

    public boolean canBeAttached
  + ### canBeTransported

    public boolean canBeTransported
  + ### hungerMultiplier

    public float hungerMultiplier
  + ### thirstMultiplier

    public float thirstMultiplier
  + ### healthLossMultiplier

    public float healthLossMultiplier
  + ### wanderMul

    public float wanderMul
  + ### idleTypeNbr

    public int idleTypeNbr
  + ### eatingTypeNbr

    public int eatingTypeNbr
  + ### sittingTypeNbr

    public int sittingTypeNbr
  + ### eatFromMother

    public boolean eatFromMother
  + ### periodicRun

    public boolean periodicRun
  + ### pregnantPeriod

    public int pregnantPeriod
  + ### eatGrass

    public boolean eatGrass
  + ### sitRandomly

    public boolean sitRandomly
  + ### eatTypeTrough

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> eatTypeTrough
  + ### canBeMilked

    public boolean canBeMilked
  + ### minBaby

    public int minBaby
  + ### maxBaby

    public int maxBaby
  + ### idleEmoteChance

    public int idleEmoteChance
  + ### eggsPerDay

    public int eggsPerDay
  + ### eggType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eggType
  + ### fertilizedTimeMax

    public int fertilizedTimeMax
  + ### timeToHatch

    public int timeToHatch
  + ### canBePicked

    public boolean canBePicked
  + ### hutches

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> hutches
  + ### enterHutchTime

    public int enterHutchTime
  + ### exitHutchTime

    public int exitHutchTime
  + ### genes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> genes
  + ### minMilk

    public float minMilk
  + ### maxMilk

    public float maxMilk
  + ### maxWool

    public float maxWool
  + ### minWeight

    public float minWeight
  + ### maxWeight

    public float maxWeight
  + ### carcassItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carcassItem
  + ### attackDist

    public int attackDist
  + ### attackTimer

    public int attackTimer
  + ### dontAttackOtherMale

    public boolean dontAttackOtherMale
  + ### canBeFeedByHand

    public boolean canBeFeedByHand
  + ### baseDmg

    public float baseDmg
  + ### milkAnimPreset

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") milkAnimPreset
  + ### feedByHandType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> feedByHandType
  + ### trailerBaseSize

    public float trailerBaseSize
  + ### canBePet

    public boolean canBePet
  + ### attackBack

    public boolean attackBack
  + ### collisionSize

    public float collisionSize
  + ### baseEncumbrance

    public float baseEncumbrance
  + ### matingPeriodStart

    public int matingPeriodStart
  + ### matingPeriodEnd

    public int matingPeriodEnd
  + ### timeBeforeNextPregnancy

    public int timeBeforeNextPregnancy
  + ### thirstHungerTrigger

    public float thirstHungerTrigger
  + ### collidable

    public boolean collidable
  + ### canThump

    public boolean canThump
  + ### wild

    public boolean wild
  + ### spottingDist

    public int spottingDist
  + ### group

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group
  + ### canBeAlerted

    public boolean canBeAlerted
  + ### dung

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dung
  + ### attackIfStressed

    public boolean attackIfStressed
  + ### happyAnim

    public int happyAnim
  + ### ropeBone

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ropeBone
  + ### minClutchSize

    public int minClutchSize
  + ### maxClutchSize

    public int maxClutchSize
  + ### layEggPeriodStart

    public int layEggPeriodStart
  + ### stressAboveGround

    public boolean stressAboveGround
  + ### canClimbStairs

    public boolean canClimbStairs
  + ### stressUnderRain

    public boolean stressUnderRain
  + ### canClimbFences

    public boolean canClimbFences
  + ### needMom

    public boolean needMom
  + ### canBeDomesticated

    public boolean canBeDomesticated
  + ### dungChancePerDay

    public int dungChancePerDay
  + ### hungerBoost

    public float hungerBoost
  + ### thirstBoost

    public float thirstBoost
  + ### distToEat

    public float distToEat
  + ### knockdownAttack

    public boolean knockdownAttack
  + ### minBodyPart

    public int minBodyPart
  + ### canDoLaceration

    public boolean canDoLaceration
  + ### maxBlood

    public float maxBlood
  + ### minBlood

    public float minBlood
  + ### litterEatTogether

    public boolean litterEatTogether
  + ### addTrackingXp

    public boolean addTrackingXp
  + ### corpseSize

    public float corpseSize
  + ### corpseLength

    public float corpseLength
  + ### idleSoundRadius

    public float idleSoundRadius
  + ### idleSoundVolume

    public float idleSoundVolume
  + ### wildFleeTimeUntilDeadTimer

    private float wildFleeTimeUntilDeadTimer
  + ### canBeKilledWithoutWeapon

    public boolean canBeKilledWithoutWeapon
  + ### feedByHandAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") feedByHandAnim
  + ### animalDefs

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals")> animalDefs
* Constructor Details
  -------------------

  + ### AnimalDefinitions

    public AnimalDefinitions()
* Method Details
  --------------

  + ### getAnimalDefs

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals")> getAnimalDefs()
  + ### getAnimalDefsArray

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals")> getAnimalDefsArray()
  + ### loadAnimalDefinitions

    public static void loadAnimalDefinitions()
  + ### loadGenes

    private static void loadGenes([AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") def,
    se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### loadBreeds

    private static void loadBreeds([AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") def,
    se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### loadStages

    private static void loadStages([AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") def,
    se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### getBreedByName

    public [AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") getBreedByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breedName)
  + ### getRandomBreed

    public [AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") getRandomBreed()
  + ### getDef

    public static [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") getDef([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getDef

    public static [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") getDef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType)
  + ### getBreeds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas")> getBreeds()
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()
  + ### getBodyModelStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBodyModelStr()
  + ### isInsideHutchTime

    public boolean isInsideHutchTime([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") hour)
  + ### isOutsideHutchTime

    public boolean isOutsideHutchTime()
  + ### getGroup

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGroup()
  + ### Reset

    public static void Reset()
  + ### canBeSkeleton

    public boolean canBeSkeleton()
  + ### getMinBaby

    public int getMinBaby()
  + ### getMaxBaby

    public int getMaxBaby()
  + ### getBabyType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBabyType()
  + ### getWildFleeTimeUntilDeadTimer

    public float getWildFleeTimeUntilDeadTimer()
  + ### getGrowStage

    public zombie.characters.animals.datas.AnimalGrowStage getGrowStage()
  + ### isBaby

    public boolean isBaby()