[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SandboxOptions](SandboxOptions.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [FIRST\_YEAR](#FIRST_YEAR)
   3. [speed](#speed)
   4. [options](#options)
   5. [optionByName](#optionByName)
   6. [zombies](#zombies)
   7. [distribution](#distribution)
   8. [zombieVoronoiNoise](#zombieVoronoiNoise)
   9. [zombieRespawn](#zombieRespawn)
   10. [zombieMigrate](#zombieMigrate)
   11. [dayLength](#dayLength)
   12. [startYear](#startYear)
   13. [startMonth](#startMonth)
   14. [startDay](#startDay)
   15. [startTime](#startTime)
   16. [dayNightCycle](#dayNightCycle)
   17. [climateCycle](#climateCycle)
   18. [fogCycle](#fogCycle)
   19. [waterShut](#waterShut)
   20. [elecShut](#elecShut)
   21. [alarmDecay](#alarmDecay)
   22. [waterShutModifier](#waterShutModifier)
   23. [elecShutModifier](#elecShutModifier)
   24. [alarmDecayModifier](#alarmDecayModifier)
   25. [foodLootNew](#foodLootNew)
   26. [literatureLootNew](#literatureLootNew)
   27. [skillBookLoot](#skillBookLoot)
   28. [recipeResourceLoot](#recipeResourceLoot)
   29. [medicalLootNew](#medicalLootNew)
   30. [survivalGearsLootNew](#survivalGearsLootNew)
   31. [cannedFoodLootNew](#cannedFoodLootNew)
   32. [weaponLootNew](#weaponLootNew)
   33. [rangedWeaponLootNew](#rangedWeaponLootNew)
   34. [ammoLootNew](#ammoLootNew)
   35. [mechanicsLootNew](#mechanicsLootNew)
   36. [otherLootNew](#otherLootNew)
   37. [clothingLootNew](#clothingLootNew)
   38. [containerLootNew](#containerLootNew)
   39. [keyLootNew](#keyLootNew)
   40. [mediaLootNew](#mediaLootNew)
   41. [mementoLootNew](#mementoLootNew)
   42. [cookwareLootNew](#cookwareLootNew)
   43. [materialLootNew](#materialLootNew)
   44. [farmingLootNew](#farmingLootNew)
   45. [toolLootNew](#toolLootNew)
   46. [rollsMultiplier](#rollsMultiplier)
   47. [lootItemRemovalList](#lootItemRemovalList)
   48. [removeStoryLoot](#removeStoryLoot)
   49. [removeZombieLoot](#removeZombieLoot)
   50. [zombiePopLootEffect](#zombiePopLootEffect)
   51. [insaneLootFactor](#insaneLootFactor)
   52. [extremeLootFactor](#extremeLootFactor)
   53. [rareLootFactor](#rareLootFactor)
   54. [normalLootFactor](#normalLootFactor)
   55. [commonLootFactor](#commonLootFactor)
   56. [abundantLootFactor](#abundantLootFactor)
   57. [temperature](#temperature)
   58. [rain](#rain)
   59. [erosionSpeed](#erosionSpeed)
   60. [erosionDays](#erosionDays)
   61. [farming](#farming)
   62. [compostTime](#compostTime)
   63. [statsDecrease](#statsDecrease)
   64. [natureAbundance](#natureAbundance)
   65. [alarm](#alarm)
   66. [lockedHouses](#lockedHouses)
   67. [starterKit](#starterKit)
   68. [nutrition](#nutrition)
   69. [foodRotSpeed](#foodRotSpeed)
   70. [fridgeFactor](#fridgeFactor)
   71. [seenHoursPreventLootRespawn](#seenHoursPreventLootRespawn)
   72. [hoursForLootRespawn](#hoursForLootRespawn)
   73. [maxItemsForLootRespawn](#maxItemsForLootRespawn)
   74. [constructionPreventsLootRespawn](#constructionPreventsLootRespawn)
   75. [worldItemRemovalList](#worldItemRemovalList)
   76. [hoursForWorldItemRemoval](#hoursForWorldItemRemoval)
   77. [itemRemovalListBlacklistToggle](#itemRemovalListBlacklistToggle)
   78. [timeSinceApo](#timeSinceApo)
   79. [plantResilience](#plantResilience)
   80. [plantAbundance](#plantAbundance)
   81. [endRegen](#endRegen)
   82. [helicopter](#helicopter)
   83. [metaEvent](#metaEvent)
   84. [sleepingEvent](#sleepingEvent)
   85. [generatorFuelConsumption](#generatorFuelConsumption)
   86. [generatorSpawning](#generatorSpawning)
   87. [annotatedMapChance](#annotatedMapChance)
   88. [characterFreePoints](#characterFreePoints)
   89. [constructionBonusPoints](#constructionBonusPoints)
   90. [nightDarkness](#nightDarkness)
   91. [nightLength](#nightLength)
   92. [boneFracture](#boneFracture)
   93. [injurySeverity](#injurySeverity)
   94. [hoursForCorpseRemoval](#hoursForCorpseRemoval)
   95. [decayingCorpseHealthImpact](#decayingCorpseHealthImpact)
   96. [zombieHealthImpact](#zombieHealthImpact)
   97. [bloodLevel](#bloodLevel)
   98. [clothingDegradation](#clothingDegradation)
   99. [fireSpread](#fireSpread)
   100. [daysForRottenFoodRemoval](#daysForRottenFoodRemoval)
   101. [allowExteriorGenerator](#allowExteriorGenerator)
   102. [maxFogIntensity](#maxFogIntensity)
   103. [maxRainFxIntensity](#maxRainFxIntensity)
   104. [enableSnowOnGround](#enableSnowOnGround)
   105. [attackBlockMovements](#attackBlockMovements)
   106. [survivorHouseChance](#survivorHouseChance)
   107. [vehicleStoryChance](#vehicleStoryChance)
   108. [zoneStoryChance](#zoneStoryChance)
   109. [allClothesUnlocked](#allClothesUnlocked)
   110. [enableTaintedWaterText](#enableTaintedWaterText)
   111. [enableVehicles](#enableVehicles)
   112. [carSpawnRate](#carSpawnRate)
   113. [zombieAttractionMultiplier](#zombieAttractionMultiplier)
   114. [vehicleEasyUse](#vehicleEasyUse)
   115. [initialGas](#initialGas)
   116. [fuelStationGasInfinite](#fuelStationGasInfinite)
   117. [fuelStationGasMin](#fuelStationGasMin)
   118. [fuelStationGasMax](#fuelStationGasMax)
   119. [fuelStationGasEmptyChance](#fuelStationGasEmptyChance)
   120. [lockedCar](#lockedCar)
   121. [carGasConsumption](#carGasConsumption)
   122. [carGeneralCondition](#carGeneralCondition)
   123. [carDamageOnImpact](#carDamageOnImpact)
   124. [damageToPlayerFromHitByACar](#damageToPlayerFromHitByACar)
   125. [trafficJam](#trafficJam)
   126. [carAlarm](#carAlarm)
   127. [playerDamageFromCrash](#playerDamageFromCrash)
   128. [sirenShutoffHours](#sirenShutoffHours)
   129. [chanceHasGas](#chanceHasGas)
   130. [recentlySurvivorVehicles](#recentlySurvivorVehicles)
   131. [multiHitZombies](#multiHitZombies)
   132. [rearVulnerability](#rearVulnerability)
   133. [sirenEffectsZombies](#sirenEffectsZombies)
   134. [animalStatsModifier](#animalStatsModifier)
   135. [animalMetaStatsModifier](#animalMetaStatsModifier)
   136. [animalPregnancyTime](#animalPregnancyTime)
   137. [animalAgeModifier](#animalAgeModifier)
   138. [animalMilkIncModifier](#animalMilkIncModifier)
   139. [animalWoolIncModifier](#animalWoolIncModifier)
   140. [animalRanchChance](#animalRanchChance)
   141. [animalGrassRegrowTime](#animalGrassRegrowTime)
   142. [animalMetaPredator](#animalMetaPredator)
   143. [animalMatingSeason](#animalMatingSeason)
   144. [animalEggHatch](#animalEggHatch)
   145. [animalSoundAttractZombies](#animalSoundAttractZombies)
   146. [animalTrackChance](#animalTrackChance)
   147. [animalPathChance](#animalPathChance)
   148. [maximumRatIndex](#maximumRatIndex)
   149. [daysUntilMaximumRatIndex](#daysUntilMaximumRatIndex)
   150. [metaKnowledge](#metaKnowledge)
   151. [seeNotLearntRecipe](#seeNotLearntRecipe)
   152. [maximumLootedBuildingRooms](#maximumLootedBuildingRooms)
   153. [enablePoisoning](#enablePoisoning)
   154. [maggotSpawn](#maggotSpawn)
   155. [lightBulbLifespan](#lightBulbLifespan)
   156. [fishAbundance](#fishAbundance)
   157. [levelForMediaXpCutoff](#levelForMediaXpCutoff)
   158. [levelForDismantleXpCutoff](#levelForDismantleXpCutoff)
   159. [bloodSplatLifespanDays](#bloodSplatLifespanDays)
   160. [literatureCooldown](#literatureCooldown)
   161. [negativeTraitsPenalty](#negativeTraitsPenalty)
   162. [minutesPerPage](#minutesPerPage)
   163. [killInsideCrops](#killInsideCrops)
   164. [plantGrowingSeasons](#plantGrowingSeasons)
   165. [placeDirtAboveground](#placeDirtAboveground)
   166. [farmingSpeedNew](#farmingSpeedNew)
   167. [farmingAmountNew](#farmingAmountNew)
   168. [maximumLooted](#maximumLooted)
   169. [daysUntilMaximumLooted](#daysUntilMaximumLooted)
   170. [ruralLooted](#ruralLooted)
   171. [maximumDiminishedLoot](#maximumDiminishedLoot)
   172. [daysUntilMaximumDiminishedLoot](#daysUntilMaximumDiminishedLoot)
   173. [muscleStrainFactor](#muscleStrainFactor)
   174. [discomfortFactor](#discomfortFactor)
   175. [woundInfectionFactor](#woundInfectionFactor)
   176. [noBlackClothes](#noBlackClothes)
   177. [easyClimbing](#easyClimbing)
   178. [maximumFireFuelHours](#maximumFireFuelHours)
   179. [firearmUseDamageChance](#firearmUseDamageChance)
   180. [firearmNoiseMultiplier](#firearmNoiseMultiplier)
   181. [firearmJamMultiplier](#firearmJamMultiplier)
   182. [firearmMoodleMultiplier](#firearmMoodleMultiplier)
   183. [firearmWeatherMultiplier](#firearmWeatherMultiplier)
   184. [firearmHeadGearEffect](#firearmHeadGearEffect)
   185. [clayLakeChance](#clayLakeChance)
   186. [clayRiverChance](#clayRiverChance)
   187. [generatorTileRange](#generatorTileRange)
   188. [generatorVerticalPowerRange](#generatorVerticalPowerRange)
   189. [customOptions](#customOptions)
   190. [basement](#basement)
   191. [map](#map)
   192. [lore](#lore)
   193. [zombieConfig](#zombieConfig)
   194. [multipliersConfig](#multipliersConfig)
   195. [SANDBOX\_VERSION](#SANDBOX_VERSION)
   196. [lootItemRemovalSet](#lootItemRemovalSet)
   197. [lootItemRemovalString](#lootItemRemovalString)
   198. [worldItemRemovalSet](#worldItemRemovalSet)
   199. [worldItemRemovalString](#worldItemRemovalString)
7. [Constructor Details](#constructor-detail)
   1. [SandboxOptions()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [toLua()](#toLua())
   3. [updateFromLua()](#updateFromLua())
   4. [initSandboxVars()](#initSandboxVars())
   5. [randomWaterShut(int)](#randomWaterShut(int))
   6. [randomElectricityShut(int)](#randomElectricityShut(int))
   7. [randomAlarmDecay(int)](#randomAlarmDecay(int))
   8. [getTemperatureModifier()](#getTemperatureModifier())
   9. [getRainModifier()](#getRainModifier())
   10. [getErosionSpeed()](#getErosionSpeed())
   11. [getWaterShutModifier()](#getWaterShutModifier())
   12. [getElecShutModifier()](#getElecShutModifier())
   13. [getTimeSinceApo()](#getTimeSinceApo())
   14. [getEnduranceRegenMultiplier()](#getEnduranceRegenMultiplier())
   15. [getStatsDecreaseMultiplier()](#getStatsDecreaseMultiplier())
   16. [getDayLengthMinutes()](#getDayLengthMinutes())
   17. [getDayLengthMinutesDefault()](#getDayLengthMinutesDefault())
   18. [getCompostHours()](#getCompostHours())
   19. [applySettings()](#applySettings())
   20. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   21. [load(ByteBuffer)](#load(java.nio.ByteBuffer))
   22. [getFirstYear()](#getFirstYear())
   23. [parseName(String)](#parseName(java.lang.String))
   24. [newBooleanOption(String, boolean)](#newBooleanOption(java.lang.String,boolean))
   25. [newDoubleOption(String, double, double, double)](#newDoubleOption(java.lang.String,double,double,double))
   26. [newEnumOption(String, int, int)](#newEnumOption(java.lang.String,int,int))
   27. [newEnumOption(String, Class, EnumType)](#newEnumOption(java.lang.String,java.lang.Class,EnumType))
   28. [newIntegerOption(String, int, int, int)](#newIntegerOption(java.lang.String,int,int,int))
   29. [newStringOption(String, String, int)](#newStringOption(java.lang.String,java.lang.String,int))
   30. [addOption(SandboxOptions.SandboxOption)](#addOption(zombie.SandboxOptions.SandboxOption))
   31. [getNumOptions()](#getNumOptions())
   32. [getOptionByIndex(int)](#getOptionByIndex(int))
   33. [getOptionByName(String)](#getOptionByName(java.lang.String))
   34. [set(String, Object)](#set(java.lang.String,java.lang.Object))
   35. [copyValuesFrom(SandboxOptions)](#copyValuesFrom(zombie.SandboxOptions))
   36. [resetToDefault()](#resetToDefault())
   37. [setDefaultsToCurrentValues()](#setDefaultsToCurrentValues())
   38. [newCopy()](#newCopy())
   39. [isValidPresetName(String)](#isValidPresetName(java.lang.String))
   40. [readTextFile(String, boolean)](#readTextFile(java.lang.String,boolean))
   41. [writeTextFile(String, int)](#writeTextFile(java.lang.String,int))
   42. [loadServerTextFile(String)](#loadServerTextFile(java.lang.String))
   43. [loadServerLuaFile(String)](#loadServerLuaFile(java.lang.String))
   44. [saveServerLuaFile(String)](#saveServerLuaFile(java.lang.String))
   45. [loadPresetFile(String)](#loadPresetFile(java.lang.String))
   46. [savePresetFile(String)](#savePresetFile(java.lang.String))
   47. [loadGameFile(String)](#loadGameFile(java.lang.String))
   48. [saveGameFile(String)](#saveGameFile(java.lang.String))
   49. [saveCurrentGameBinFile()](#saveCurrentGameBinFile())
   50. [handleOldZombiesFile1()](#handleOldZombiesFile1())
   51. [handleOldZombiesFile2()](#handleOldZombiesFile2())
   52. [handleOldServerZombiesFile()](#handleOldServerZombiesFile())
   53. [loadServerZombiesFile(String)](#loadServerZombiesFile(java.lang.String))
   54. [readLuaFile(String)](#readLuaFile(java.lang.String))
   55. [writeLuaFile(String, boolean)](#writeLuaFile(java.lang.String,boolean))
   56. [load()](#load())
   57. [loadCurrentGameBinFile()](#loadCurrentGameBinFile())
   58. [upgradeOptionName(String, int)](#upgradeOptionName(java.lang.String,int))
   59. [upgradeOptionValue(String, String, int)](#upgradeOptionValue(java.lang.String,java.lang.String,int))
   60. [upgradeLuaTable(String, KahluaTable, int)](#upgradeLuaTable(java.lang.String,se.krka.kahlua.vm.KahluaTable,int))
   61. [sendToServer()](#sendToServer())
   62. [newCustomOption(CustomSandboxOption)](#newCustomOption(zombie.sandbox.CustomSandboxOption))
   63. [addCustomOption(SandboxOptions.SandboxOption, CustomSandboxOption)](#addCustomOption(zombie.SandboxOptions.SandboxOption,zombie.sandbox.CustomSandboxOption))
   64. [removeCustomOptions()](#removeCustomOptions())
   65. [Reset()](#Reset())
   66. [getAllClothesUnlocked()](#getAllClothesUnlocked())
   67. [getCurrentRatIndex()](#getCurrentRatIndex())
   68. [getCurrentLootedChance()](#getCurrentLootedChance())
   69. [getCurrentLootedChance(IsoGridSquare)](#getCurrentLootedChance(zombie.iso.IsoGridSquare))
   70. [getCurrentDiminishedLootPercentage()](#getCurrentDiminishedLootPercentage())
   71. [getCurrentDiminishedLootPercentage(IsoGridSquare)](#getCurrentDiminishedLootPercentage(zombie.iso.IsoGridSquare))
   72. [getCurrentLootMultiplier()](#getCurrentLootMultiplier())
   73. [getCurrentLootMultiplier(IsoGridSquare)](#getCurrentLootMultiplier(zombie.iso.IsoGridSquare))
   74. [isUnstableScriptNameSpam()](#isUnstableScriptNameSpam())
   75. [doesPowerGridExist()](#doesPowerGridExist())
   76. [doesPowerGridExist(int)](#doesPowerGridExist(int))
   77. [lootItemRemovalListContains(String)](#lootItemRemovalListContains(java.lang.String))
   78. [worldItemRemovalListContains(String)](#worldItemRemovalListContains(java.lang.String))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SandboxOptions
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.SandboxOptions

---

public final class SandboxOptions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `final class`

  `SandboxOptions.Basement`

  `static class`

  `SandboxOptions.BooleanSandboxOption`

  `static class`

  `SandboxOptions.DoubleSandboxOption`

  `static class`

  `SandboxOptions.EnumSandboxOption`

  `static class`

  `SandboxOptions.IntegerSandboxOption`

  `final class`

  `SandboxOptions.Map`

  `final class`

  `SandboxOptions.MultiplierConfig`

  `static interface`

  `SandboxOptions.SandboxOption`

  `static class`

  `SandboxOptions.StringSandboxOption`

  `static class`

  `SandboxOptions.StrongEnumSandboxOption<EnumType extends Enum<EnumType>>`

  `final class`

  `SandboxOptions.ZombieConfig`

  `final class`

  `SandboxOptions.ZombieLore`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final SandboxOptions.DoubleSandboxOption`

  `abundantLootFactor`

  `final SandboxOptions.EnumSandboxOption`

  `alarm`

  `final SandboxOptions.EnumSandboxOption`

  `alarmDecay`

  `final SandboxOptions.IntegerSandboxOption`

  `alarmDecayModifier`

  `final SandboxOptions.BooleanSandboxOption`

  `allClothesUnlocked`

  `final SandboxOptions.BooleanSandboxOption`

  `allowExteriorGenerator`

  `final SandboxOptions.DoubleSandboxOption`

  `ammoLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `animalAgeModifier`

  `final SandboxOptions.EnumSandboxOption`

  `animalEggHatch`

  `final SandboxOptions.IntegerSandboxOption`

  `animalGrassRegrowTime`

  `final SandboxOptions.BooleanSandboxOption`

  `animalMatingSeason`

  `final SandboxOptions.BooleanSandboxOption`

  `animalMetaPredator`

  `final SandboxOptions.EnumSandboxOption`

  `animalMetaStatsModifier`

  `final SandboxOptions.EnumSandboxOption`

  `animalMilkIncModifier`

  `final SandboxOptions.EnumSandboxOption`

  `animalPathChance`

  `final SandboxOptions.EnumSandboxOption`

  `animalPregnancyTime`

  `final SandboxOptions.EnumSandboxOption`

  `animalRanchChance`

  `final SandboxOptions.BooleanSandboxOption`

  `animalSoundAttractZombies`

  `final SandboxOptions.EnumSandboxOption`

  `animalStatsModifier`

  `final SandboxOptions.EnumSandboxOption`

  `animalTrackChance`

  `final SandboxOptions.EnumSandboxOption`

  `animalWoolIncModifier`

  `final SandboxOptions.EnumSandboxOption`

  `annotatedMapChance`

  `final SandboxOptions.BooleanSandboxOption`

  `attackBlockMovements`

  `final SandboxOptions.Basement`

  `basement`

  `final SandboxOptions.EnumSandboxOption`

  `bloodLevel`

  `final SandboxOptions.IntegerSandboxOption`

  `bloodSplatLifespanDays`

  `final SandboxOptions.BooleanSandboxOption`

  `boneFracture`

  `final SandboxOptions.DoubleSandboxOption`

  `cannedFoodLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `carAlarm`

  `final SandboxOptions.EnumSandboxOption`

  `carDamageOnImpact`

  `final SandboxOptions.DoubleSandboxOption`

  `carGasConsumption`

  `final SandboxOptions.EnumSandboxOption`

  `carGeneralCondition`

  `final SandboxOptions.EnumSandboxOption`

  `carSpawnRate`

  `final SandboxOptions.EnumSandboxOption`

  `chanceHasGas`

  `final SandboxOptions.IntegerSandboxOption`

  `characterFreePoints`

  `final SandboxOptions.DoubleSandboxOption`

  `clayLakeChance`

  `final SandboxOptions.DoubleSandboxOption`

  `clayRiverChance`

  `final SandboxOptions.EnumSandboxOption`

  `climateCycle`

  `final SandboxOptions.EnumSandboxOption`

  `clothingDegradation`

  `final SandboxOptions.DoubleSandboxOption`

  `clothingLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `commonLootFactor`

  `final SandboxOptions.EnumSandboxOption`

  `compostTime`

  `final SandboxOptions.EnumSandboxOption`

  `constructionBonusPoints`

  `final SandboxOptions.BooleanSandboxOption`

  `constructionPreventsLootRespawn`

  `final SandboxOptions.DoubleSandboxOption`

  `containerLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `cookwareLootNew`

  `private final ArrayList<SandboxOptions.SandboxOption>`

  `customOptions`

  `final SandboxOptions.StrongEnumSandboxOption<zombie.characters.DamageModifier>`

  `damageToPlayerFromHitByACar`

  `final SandboxOptions.EnumSandboxOption`

  `dayLength`

  `final SandboxOptions.EnumSandboxOption`

  `dayNightCycle`

  `final SandboxOptions.IntegerSandboxOption`

  `daysForRottenFoodRemoval`

  `final SandboxOptions.IntegerSandboxOption`

  `daysUntilMaximumDiminishedLoot`

  `final SandboxOptions.IntegerSandboxOption`

  `daysUntilMaximumLooted`

  `final SandboxOptions.IntegerSandboxOption`

  `daysUntilMaximumRatIndex`

  `final SandboxOptions.EnumSandboxOption`

  `decayingCorpseHealthImpact`

  `final SandboxOptions.DoubleSandboxOption`

  `discomfortFactor`

  `final SandboxOptions.EnumSandboxOption`

  `distribution`

  `final SandboxOptions.BooleanSandboxOption`

  `easyClimbing`

  `final SandboxOptions.EnumSandboxOption`

  `elecShut`

  `final SandboxOptions.IntegerSandboxOption`

  `elecShutModifier`

  `final SandboxOptions.EnumSandboxOption`

  `enablePoisoning`

  `final SandboxOptions.BooleanSandboxOption`

  `enableSnowOnGround`

  `final SandboxOptions.BooleanSandboxOption`

  `enableTaintedWaterText`

  `final SandboxOptions.BooleanSandboxOption`

  `enableVehicles`

  `final SandboxOptions.EnumSandboxOption`

  `endRegen`

  `final SandboxOptions.IntegerSandboxOption`

  `erosionDays`

  `final SandboxOptions.EnumSandboxOption`

  `erosionSpeed`

  `final SandboxOptions.DoubleSandboxOption`

  `extremeLootFactor`

  `final SandboxOptions.EnumSandboxOption`

  `farming`

  `final SandboxOptions.DoubleSandboxOption`

  `farmingAmountNew`

  `final SandboxOptions.DoubleSandboxOption`

  `farmingLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `farmingSpeedNew`

  `final SandboxOptions.BooleanSandboxOption`

  `firearmHeadGearEffect`

  `final SandboxOptions.DoubleSandboxOption`

  `firearmJamMultiplier`

  `final SandboxOptions.DoubleSandboxOption`

  `firearmMoodleMultiplier`

  `final SandboxOptions.DoubleSandboxOption`

  `firearmNoiseMultiplier`

  `final SandboxOptions.EnumSandboxOption`

  `firearmUseDamageChance`

  `final SandboxOptions.DoubleSandboxOption`

  `firearmWeatherMultiplier`

  `final SandboxOptions.BooleanSandboxOption`

  `fireSpread`

  `static final int`

  `FIRST_YEAR`

  `final SandboxOptions.EnumSandboxOption`

  `fishAbundance`

  `final SandboxOptions.EnumSandboxOption`

  `fogCycle`

  `final SandboxOptions.DoubleSandboxOption`

  `foodLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `foodRotSpeed`

  `final SandboxOptions.EnumSandboxOption`

  `fridgeFactor`

  `final SandboxOptions.IntegerSandboxOption`

  `fuelStationGasEmptyChance`

  `final SandboxOptions.BooleanSandboxOption`

  `fuelStationGasInfinite`

  `final SandboxOptions.DoubleSandboxOption`

  `fuelStationGasMax`

  `final SandboxOptions.DoubleSandboxOption`

  `fuelStationGasMin`

  `final SandboxOptions.DoubleSandboxOption`

  `generatorFuelConsumption`

  `final SandboxOptions.EnumSandboxOption`

  `generatorSpawning`

  `final SandboxOptions.IntegerSandboxOption`

  `generatorTileRange`

  `final SandboxOptions.IntegerSandboxOption`

  `generatorVerticalPowerRange`

  `final SandboxOptions.EnumSandboxOption`

  `helicopter`

  `final SandboxOptions.DoubleSandboxOption`

  `hoursForCorpseRemoval`

  `final SandboxOptions.IntegerSandboxOption`

  `hoursForLootRespawn`

  `final SandboxOptions.DoubleSandboxOption`

  `hoursForWorldItemRemoval`

  `final SandboxOptions.EnumSandboxOption`

  `initialGas`

  `final SandboxOptions.StrongEnumSandboxOption<zombie.characters.InjurySeverity>`

  `injurySeverity`

  `final SandboxOptions.DoubleSandboxOption`

  `insaneLootFactor`

  `static final SandboxOptions`

  `instance`

  `final SandboxOptions.BooleanSandboxOption`

  `itemRemovalListBlacklistToggle`

  `final SandboxOptions.DoubleSandboxOption`

  `keyLootNew`

  `final SandboxOptions.BooleanSandboxOption`

  `killInsideCrops`

  `final SandboxOptions.IntegerSandboxOption`

  `levelForDismantleXpCutoff`

  `final SandboxOptions.IntegerSandboxOption`

  `levelForMediaXpCutoff`

  `final SandboxOptions.DoubleSandboxOption`

  `lightBulbLifespan`

  `final SandboxOptions.IntegerSandboxOption`

  `literatureCooldown`

  `final SandboxOptions.DoubleSandboxOption`

  `literatureLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `lockedCar`

  `final SandboxOptions.EnumSandboxOption`

  `lockedHouses`

  `final SandboxOptions.StringSandboxOption`

  `lootItemRemovalList`

  `private final HashSet<String>`

  `lootItemRemovalSet`

  `private String`

  `lootItemRemovalString`

  `final SandboxOptions.ZombieLore`

  `lore`

  `final SandboxOptions.EnumSandboxOption`

  `maggotSpawn`

  `final SandboxOptions.Map`

  `map`

  `final SandboxOptions.DoubleSandboxOption`

  `materialLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `maxFogIntensity`

  `final SandboxOptions.IntegerSandboxOption`

  `maximumDiminishedLoot`

  `final SandboxOptions.IntegerSandboxOption`

  `maximumFireFuelHours`

  `final SandboxOptions.IntegerSandboxOption`

  `maximumLooted`

  `final SandboxOptions.IntegerSandboxOption`

  `maximumLootedBuildingRooms`

  `final SandboxOptions.IntegerSandboxOption`

  `maximumRatIndex`

  `final SandboxOptions.IntegerSandboxOption`

  `maxItemsForLootRespawn`

  `final SandboxOptions.EnumSandboxOption`

  `maxRainFxIntensity`

  `final SandboxOptions.DoubleSandboxOption`

  `mechanicsLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `mediaLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `medicalLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `mementoLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `metaEvent`

  `final SandboxOptions.EnumSandboxOption`

  `metaKnowledge`

  `final SandboxOptions.DoubleSandboxOption`

  `minutesPerPage`

  `final SandboxOptions.BooleanSandboxOption`

  `multiHitZombies`

  `final SandboxOptions.MultiplierConfig`

  `multipliersConfig`

  `final SandboxOptions.DoubleSandboxOption`

  `muscleStrainFactor`

  `final SandboxOptions.EnumSandboxOption`

  `natureAbundance`

  `final SandboxOptions.EnumSandboxOption`

  `negativeTraitsPenalty`

  `final SandboxOptions.EnumSandboxOption`

  `nightDarkness`

  `final SandboxOptions.EnumSandboxOption`

  `nightLength`

  `final SandboxOptions.BooleanSandboxOption`

  `noBlackClothes`

  `final SandboxOptions.DoubleSandboxOption`

  `normalLootFactor`

  `final SandboxOptions.BooleanSandboxOption`

  `nutrition`

  `private final HashMap<String, SandboxOptions.SandboxOption>`

  `optionByName`

  `private final ArrayList<SandboxOptions.SandboxOption>`

  `options`

  `final SandboxOptions.DoubleSandboxOption`

  `otherLootNew`

  `final SandboxOptions.BooleanSandboxOption`

  `placeDirtAboveground`

  `final SandboxOptions.EnumSandboxOption`

  `plantAbundance`

  `final SandboxOptions.BooleanSandboxOption`

  `plantGrowingSeasons`

  `final SandboxOptions.EnumSandboxOption`

  `plantResilience`

  `final SandboxOptions.BooleanSandboxOption`

  `playerDamageFromCrash`

  `final SandboxOptions.EnumSandboxOption`

  `rain`

  `final SandboxOptions.DoubleSandboxOption`

  `rangedWeaponLootNew`

  `final SandboxOptions.DoubleSandboxOption`

  `rareLootFactor`

  `final SandboxOptions.EnumSandboxOption`

  `rearVulnerability`

  `final SandboxOptions.EnumSandboxOption`

  `recentlySurvivorVehicles`

  `final SandboxOptions.DoubleSandboxOption`

  `recipeResourceLoot`

  `final SandboxOptions.BooleanSandboxOption`

  `removeStoryLoot`

  `final SandboxOptions.BooleanSandboxOption`

  `removeZombieLoot`

  `final SandboxOptions.DoubleSandboxOption`

  `rollsMultiplier`

  `final SandboxOptions.DoubleSandboxOption`

  `ruralLooted`

  `private static final int`

  `SANDBOX_VERSION`

  `final SandboxOptions.IntegerSandboxOption`

  `seenHoursPreventLootRespawn`

  `final SandboxOptions.BooleanSandboxOption`

  `seeNotLearntRecipe`

  `final SandboxOptions.BooleanSandboxOption`

  `sirenEffectsZombies`

  `final SandboxOptions.DoubleSandboxOption`

  `sirenShutoffHours`

  `final SandboxOptions.DoubleSandboxOption`

  `skillBookLoot`

  `final SandboxOptions.EnumSandboxOption`

  `sleepingEvent`

  `int`

  `speed`

  `final SandboxOptions.EnumSandboxOption`

  `startDay`

  `final SandboxOptions.BooleanSandboxOption`

  `starterKit`

  `final SandboxOptions.EnumSandboxOption`

  `startMonth`

  `final SandboxOptions.EnumSandboxOption`

  `startTime`

  `final SandboxOptions.EnumSandboxOption`

  `startYear`

  `final SandboxOptions.EnumSandboxOption`

  `statsDecrease`

  `final SandboxOptions.DoubleSandboxOption`

  `survivalGearsLootNew`

  `final SandboxOptions.EnumSandboxOption`

  `survivorHouseChance`

  `final SandboxOptions.EnumSandboxOption`

  `temperature`

  `final SandboxOptions.EnumSandboxOption`

  `timeSinceApo`

  `final SandboxOptions.DoubleSandboxOption`

  `toolLootNew`

  `final SandboxOptions.BooleanSandboxOption`

  `trafficJam`

  `final SandboxOptions.BooleanSandboxOption`

  `vehicleEasyUse`

  `final SandboxOptions.EnumSandboxOption`

  `vehicleStoryChance`

  `final SandboxOptions.EnumSandboxOption`

  `waterShut`

  `final SandboxOptions.IntegerSandboxOption`

  `waterShutModifier`

  `final SandboxOptions.DoubleSandboxOption`

  `weaponLootNew`

  `final SandboxOptions.StringSandboxOption`

  `worldItemRemovalList`

  `private final HashSet<String>`

  `worldItemRemovalSet`

  `private String`

  `worldItemRemovalString`

  `final SandboxOptions.DoubleSandboxOption`

  `woundInfectionFactor`

  `final SandboxOptions.DoubleSandboxOption`

  `zombieAttractionMultiplier`

  `final SandboxOptions.ZombieConfig`

  `zombieConfig`

  `final SandboxOptions.BooleanSandboxOption`

  `zombieHealthImpact`

  `final SandboxOptions.BooleanSandboxOption`

  `zombieMigrate`

  `final SandboxOptions.IntegerSandboxOption`

  `zombiePopLootEffect`

  `final SandboxOptions.EnumSandboxOption`

  `zombieRespawn`

  `final SandboxOptions.EnumSandboxOption`

  `zombies`

  `final SandboxOptions.BooleanSandboxOption`

  `zombieVoronoiNoise`

  `final SandboxOptions.EnumSandboxOption`

  `zoneStoryChance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SandboxOptions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addCustomOption(SandboxOptions.SandboxOption option,
  zombie.sandbox.CustomSandboxOption custom)`

  `protected SandboxOptions`

  `addOption(SandboxOptions.SandboxOption option)`

  `void`

  `applySettings()`

  `void`

  `copyValuesFrom(SandboxOptions other)`

  `boolean`

  `doesPowerGridExist()`

  `boolean`

  `doesPowerGridExist(int offset)`

  `boolean`

  `getAllClothesUnlocked()`

  `int`

  `getCompostHours()`

  `int`

  `getCurrentDiminishedLootPercentage()`

  `int`

  `getCurrentDiminishedLootPercentage(IsoGridSquare square)`

  `int`

  `getCurrentLootedChance()`

  `int`

  `getCurrentLootedChance(IsoGridSquare square)`

  `float`

  `getCurrentLootMultiplier()`

  `float`

  `getCurrentLootMultiplier(IsoGridSquare square)`

  `int`

  `getCurrentRatIndex()`

  `int`

  `getDayLengthMinutes()`

  `int`

  `getDayLengthMinutesDefault()`

  `int`

  `getElecShutModifier()`

  `double`

  `getEnduranceRegenMultiplier()`

  `int`

  `getErosionSpeed()`

  `int`

  `getFirstYear()`

  `static SandboxOptions`

  `getInstance()`

  `int`

  `getNumOptions()`

  `SandboxOptions.SandboxOption`

  `getOptionByIndex(int index)`

  `SandboxOptions.SandboxOption`

  `getOptionByName(String name)`

  `int`

  `getRainModifier()`

  `double`

  `getStatsDecreaseMultiplier()`

  `int`

  `getTemperatureModifier()`

  `int`

  `getTimeSinceApo()`

  `int`

  `getWaterShutModifier()`

  `void`

  `handleOldServerZombiesFile()`

  `void`

  `handleOldZombiesFile1()`

  `void`

  `handleOldZombiesFile2()`

  `void`

  `initSandboxVars()`

  `boolean`

  `isUnstableScriptNameSpam()`

  `static boolean`

  `isValidPresetName(String name)`

  `void`

  `load()`

  `void`

  `load(ByteBuffer input)`

  `void`

  `loadCurrentGameBinFile()`

  `boolean`

  `loadGameFile(String presetName)`

  `boolean`

  `loadPresetFile(String presetName)`

  `boolean`

  `loadServerLuaFile(String serverName)`

  `boolean`

  `loadServerTextFile(String serverName)`

  `boolean`

  `loadServerZombiesFile(String serverName)`

  `boolean`

  `lootItemRemovalListContains(String itemType)`

  `private SandboxOptions.BooleanSandboxOption`

  `newBooleanOption(String name,
  boolean defaultValue)`

  `SandboxOptions`

  `newCopy()`

  `void`

  `newCustomOption(zombie.sandbox.CustomSandboxOption customSandboxOption)`

  `private SandboxOptions.DoubleSandboxOption`

  `newDoubleOption(String name,
  double min,
  double max,
  double defaultValue)`

  `private SandboxOptions.EnumSandboxOption`

  `newEnumOption(String name,
  int numValues,
  int defaultValue)`

  `private <EnumType extends Enum<EnumType>>  
  SandboxOptions.StrongEnumSandboxOption<EnumType>`

  `newEnumOption(String name,
  Class<EnumType> enumClass,
  EnumType defaultValue)`

  `private SandboxOptions.IntegerSandboxOption`

  `newIntegerOption(String name,
  int min,
  int max,
  int defaultValue)`

  `private SandboxOptions.StringSandboxOption`

  `newStringOption(String name,
  String defaultValue,
  int maxLength)`

  `private static String[]`

  `parseName(String name)`

  `int`

  `randomAlarmDecay(int alarmDecayModifier)`

  `int`

  `randomElectricityShut(int electricityShutoffModifier)`

  Random the number of day for the electricity shut off

  `int`

  `randomWaterShut(int waterShutoffModifier)`

  Random the number of day for the water shut off

  `private boolean`

  `readLuaFile(String fileName)`

  `private boolean`

  `readTextFile(String fileName,
  boolean isPreset)`

  `private void`

  `removeCustomOptions()`

  `static void`

  `Reset()`

  `void`

  `resetToDefault()`

  `void`

  `save(ByteBuffer output)`

  `private void`

  `saveCurrentGameBinFile()`

  `boolean`

  `saveGameFile(String presetName)`

  `boolean`

  `savePresetFile(String presetName)`

  `boolean`

  `saveServerLuaFile(String serverName)`

  `void`

  `sendToServer()`

  `void`

  `set(String name,
  Object o)`

  `void`

  `setDefaultsToCurrentValues()`

  `void`

  `toLua()`

  `void`

  `updateFromLua()`

  `private se.krka.kahlua.vm.KahluaTable`

  `upgradeLuaTable(String prefix,
  se.krka.kahlua.vm.KahluaTable table,
  int version)`

  `private String`

  `upgradeOptionName(String optionName,
  int version)`

  `private String`

  `upgradeOptionValue(String optionName,
  String optionValue,
  int version)`

  `boolean`

  `worldItemRemovalListContains(String itemType)`

  `private boolean`

  `writeLuaFile(String fileName,
  boolean isDeveloperFile)`

  `private boolean`

  `writeTextFile(String fileName,
  int version)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [SandboxOptions](SandboxOptions.html "class in zombie") instance
  + ### FIRST\_YEAR

    public static final int FIRST\_YEAR

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SandboxOptions.FIRST_YEAR)
  + ### speed

    public int speed
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie")> options
  + ### optionByName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie")> optionByName
  + ### zombies

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") zombies
  + ### distribution

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") distribution
  + ### zombieVoronoiNoise

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") zombieVoronoiNoise
  + ### zombieRespawn

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") zombieRespawn
  + ### zombieMigrate

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") zombieMigrate
  + ### dayLength

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") dayLength
  + ### startYear

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") startYear
  + ### startMonth

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") startMonth
  + ### startDay

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") startDay
  + ### startTime

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") startTime
  + ### dayNightCycle

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") dayNightCycle
  + ### climateCycle

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") climateCycle
  + ### fogCycle

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") fogCycle
  + ### waterShut

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") waterShut
  + ### elecShut

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") elecShut
  + ### alarmDecay

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") alarmDecay
  + ### waterShutModifier

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") waterShutModifier
  + ### elecShutModifier

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") elecShutModifier
  + ### alarmDecayModifier

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") alarmDecayModifier
  + ### foodLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") foodLootNew
  + ### literatureLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") literatureLootNew
  + ### skillBookLoot

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") skillBookLoot
  + ### recipeResourceLoot

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") recipeResourceLoot
  + ### medicalLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") medicalLootNew
  + ### survivalGearsLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") survivalGearsLootNew
  + ### cannedFoodLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") cannedFoodLootNew
  + ### weaponLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") weaponLootNew
  + ### rangedWeaponLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") rangedWeaponLootNew
  + ### ammoLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") ammoLootNew
  + ### mechanicsLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") mechanicsLootNew
  + ### otherLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") otherLootNew
  + ### clothingLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") clothingLootNew
  + ### containerLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") containerLootNew
  + ### keyLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") keyLootNew
  + ### mediaLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") mediaLootNew
  + ### mementoLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") mementoLootNew
  + ### cookwareLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") cookwareLootNew
  + ### materialLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") materialLootNew
  + ### farmingLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") farmingLootNew
  + ### toolLootNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") toolLootNew
  + ### rollsMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") rollsMultiplier
  + ### lootItemRemovalList

    public final [SandboxOptions.StringSandboxOption](SandboxOptions.StringSandboxOption.html "class in zombie") lootItemRemovalList
  + ### removeStoryLoot

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") removeStoryLoot
  + ### removeZombieLoot

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") removeZombieLoot
  + ### zombiePopLootEffect

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") zombiePopLootEffect
  + ### insaneLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") insaneLootFactor
  + ### extremeLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") extremeLootFactor
  + ### rareLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") rareLootFactor
  + ### normalLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") normalLootFactor
  + ### commonLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") commonLootFactor
  + ### abundantLootFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") abundantLootFactor
  + ### temperature

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") temperature
  + ### rain

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") rain
  + ### erosionSpeed

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") erosionSpeed
  + ### erosionDays

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") erosionDays
  + ### farming

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") farming
  + ### compostTime

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") compostTime
  + ### statsDecrease

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") statsDecrease
  + ### natureAbundance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") natureAbundance
  + ### alarm

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") alarm
  + ### lockedHouses

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") lockedHouses
  + ### starterKit

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") starterKit
  + ### nutrition

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") nutrition
  + ### foodRotSpeed

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") foodRotSpeed
  + ### fridgeFactor

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") fridgeFactor
  + ### seenHoursPreventLootRespawn

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") seenHoursPreventLootRespawn
  + ### hoursForLootRespawn

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") hoursForLootRespawn
  + ### maxItemsForLootRespawn

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maxItemsForLootRespawn
  + ### constructionPreventsLootRespawn

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") constructionPreventsLootRespawn
  + ### worldItemRemovalList

    public final [SandboxOptions.StringSandboxOption](SandboxOptions.StringSandboxOption.html "class in zombie") worldItemRemovalList
  + ### hoursForWorldItemRemoval

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") hoursForWorldItemRemoval
  + ### itemRemovalListBlacklistToggle

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") itemRemovalListBlacklistToggle
  + ### timeSinceApo

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") timeSinceApo
  + ### plantResilience

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") plantResilience
  + ### plantAbundance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") plantAbundance
  + ### endRegen

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") endRegen
  + ### helicopter

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") helicopter
  + ### metaEvent

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") metaEvent
  + ### sleepingEvent

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") sleepingEvent
  + ### generatorFuelConsumption

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") generatorFuelConsumption
  + ### generatorSpawning

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") generatorSpawning
  + ### annotatedMapChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") annotatedMapChance
  + ### characterFreePoints

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") characterFreePoints
  + ### constructionBonusPoints

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") constructionBonusPoints
  + ### nightDarkness

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") nightDarkness
  + ### nightLength

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") nightLength
  + ### boneFracture

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") boneFracture
  + ### injurySeverity

    public final [SandboxOptions.StrongEnumSandboxOption](SandboxOptions.StrongEnumSandboxOption.html "class in zombie")<zombie.characters.InjurySeverity> injurySeverity
  + ### hoursForCorpseRemoval

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") hoursForCorpseRemoval
  + ### decayingCorpseHealthImpact

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") decayingCorpseHealthImpact
  + ### zombieHealthImpact

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") zombieHealthImpact
  + ### bloodLevel

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") bloodLevel
  + ### clothingDegradation

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") clothingDegradation
  + ### fireSpread

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") fireSpread
  + ### daysForRottenFoodRemoval

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") daysForRottenFoodRemoval
  + ### allowExteriorGenerator

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") allowExteriorGenerator
  + ### maxFogIntensity

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") maxFogIntensity
  + ### maxRainFxIntensity

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") maxRainFxIntensity
  + ### enableSnowOnGround

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") enableSnowOnGround
  + ### attackBlockMovements

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") attackBlockMovements
  + ### survivorHouseChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") survivorHouseChance
  + ### vehicleStoryChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") vehicleStoryChance
  + ### zoneStoryChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") zoneStoryChance
  + ### allClothesUnlocked

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") allClothesUnlocked
  + ### enableTaintedWaterText

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") enableTaintedWaterText
  + ### enableVehicles

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") enableVehicles
  + ### carSpawnRate

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") carSpawnRate
  + ### zombieAttractionMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") zombieAttractionMultiplier
  + ### vehicleEasyUse

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") vehicleEasyUse
  + ### initialGas

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") initialGas
  + ### fuelStationGasInfinite

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") fuelStationGasInfinite
  + ### fuelStationGasMin

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") fuelStationGasMin
  + ### fuelStationGasMax

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") fuelStationGasMax
  + ### fuelStationGasEmptyChance

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") fuelStationGasEmptyChance
  + ### lockedCar

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") lockedCar
  + ### carGasConsumption

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") carGasConsumption
  + ### carGeneralCondition

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") carGeneralCondition
  + ### carDamageOnImpact

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") carDamageOnImpact
  + ### damageToPlayerFromHitByACar

    public final [SandboxOptions.StrongEnumSandboxOption](SandboxOptions.StrongEnumSandboxOption.html "class in zombie")<zombie.characters.DamageModifier> damageToPlayerFromHitByACar
  + ### trafficJam

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") trafficJam
  + ### carAlarm

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") carAlarm
  + ### playerDamageFromCrash

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") playerDamageFromCrash
  + ### sirenShutoffHours

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") sirenShutoffHours
  + ### chanceHasGas

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") chanceHasGas
  + ### recentlySurvivorVehicles

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") recentlySurvivorVehicles
  + ### multiHitZombies

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") multiHitZombies
  + ### rearVulnerability

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") rearVulnerability
  + ### sirenEffectsZombies

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") sirenEffectsZombies
  + ### animalStatsModifier

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalStatsModifier
  + ### animalMetaStatsModifier

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalMetaStatsModifier
  + ### animalPregnancyTime

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalPregnancyTime
  + ### animalAgeModifier

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalAgeModifier
  + ### animalMilkIncModifier

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalMilkIncModifier
  + ### animalWoolIncModifier

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalWoolIncModifier
  + ### animalRanchChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalRanchChance
  + ### animalGrassRegrowTime

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") animalGrassRegrowTime
  + ### animalMetaPredator

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") animalMetaPredator
  + ### animalMatingSeason

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") animalMatingSeason
  + ### animalEggHatch

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalEggHatch
  + ### animalSoundAttractZombies

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") animalSoundAttractZombies
  + ### animalTrackChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalTrackChance
  + ### animalPathChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") animalPathChance
  + ### maximumRatIndex

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maximumRatIndex
  + ### daysUntilMaximumRatIndex

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") daysUntilMaximumRatIndex
  + ### metaKnowledge

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") metaKnowledge
  + ### seeNotLearntRecipe

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") seeNotLearntRecipe
  + ### maximumLootedBuildingRooms

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maximumLootedBuildingRooms
  + ### enablePoisoning

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") enablePoisoning
  + ### maggotSpawn

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") maggotSpawn
  + ### lightBulbLifespan

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") lightBulbLifespan
  + ### fishAbundance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") fishAbundance
  + ### levelForMediaXpCutoff

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") levelForMediaXpCutoff
  + ### levelForDismantleXpCutoff

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") levelForDismantleXpCutoff
  + ### bloodSplatLifespanDays

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") bloodSplatLifespanDays
  + ### literatureCooldown

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") literatureCooldown
  + ### negativeTraitsPenalty

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") negativeTraitsPenalty
  + ### minutesPerPage

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") minutesPerPage
  + ### killInsideCrops

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") killInsideCrops
  + ### plantGrowingSeasons

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") plantGrowingSeasons
  + ### placeDirtAboveground

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") placeDirtAboveground
  + ### farmingSpeedNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") farmingSpeedNew
  + ### farmingAmountNew

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") farmingAmountNew
  + ### maximumLooted

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maximumLooted
  + ### daysUntilMaximumLooted

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") daysUntilMaximumLooted
  + ### ruralLooted

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") ruralLooted
  + ### maximumDiminishedLoot

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maximumDiminishedLoot
  + ### daysUntilMaximumDiminishedLoot

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") daysUntilMaximumDiminishedLoot
  + ### muscleStrainFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") muscleStrainFactor
  + ### discomfortFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") discomfortFactor
  + ### woundInfectionFactor

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") woundInfectionFactor
  + ### noBlackClothes

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") noBlackClothes
  + ### easyClimbing

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") easyClimbing
  + ### maximumFireFuelHours

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") maximumFireFuelHours
  + ### firearmUseDamageChance

    public final [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") firearmUseDamageChance
  + ### firearmNoiseMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") firearmNoiseMultiplier
  + ### firearmJamMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") firearmJamMultiplier
  + ### firearmMoodleMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") firearmMoodleMultiplier
  + ### firearmWeatherMultiplier

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") firearmWeatherMultiplier
  + ### firearmHeadGearEffect

    public final [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") firearmHeadGearEffect
  + ### clayLakeChance

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") clayLakeChance
  + ### clayRiverChance

    public final [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") clayRiverChance
  + ### generatorTileRange

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") generatorTileRange
  + ### generatorVerticalPowerRange

    public final [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") generatorVerticalPowerRange
  + ### customOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie")> customOptions
  + ### basement

    public final [SandboxOptions.Basement](SandboxOptions.Basement.html "class in zombie") basement
  + ### map

    public final [SandboxOptions.Map](SandboxOptions.Map.html "class in zombie") map
  + ### lore

    public final [SandboxOptions.ZombieLore](SandboxOptions.ZombieLore.html "class in zombie") lore
  + ### zombieConfig

    public final [SandboxOptions.ZombieConfig](SandboxOptions.ZombieConfig.html "class in zombie") zombieConfig
  + ### multipliersConfig

    public final [SandboxOptions.MultiplierConfig](SandboxOptions.MultiplierConfig.html "class in zombie") multipliersConfig
  + ### SANDBOX\_VERSION

    private static final int SANDBOX\_VERSION

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SandboxOptions.SANDBOX_VERSION)
  + ### lootItemRemovalSet

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lootItemRemovalSet
  + ### lootItemRemovalString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lootItemRemovalString
  + ### worldItemRemovalSet

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> worldItemRemovalSet
  + ### worldItemRemovalString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldItemRemovalString
* Constructor Details
  -------------------

  + ### SandboxOptions

    public SandboxOptions()
* Method Details
  --------------

  + ### getInstance

    public static [SandboxOptions](SandboxOptions.html "class in zombie") getInstance()
  + ### toLua

    public void toLua()
  + ### updateFromLua

    public void updateFromLua()
  + ### initSandboxVars

    public void initSandboxVars()
  + ### randomWaterShut

    public int randomWaterShut(int waterShutoffModifier)

    Random the number of day for the water shut off
  + ### randomElectricityShut

    public int randomElectricityShut(int electricityShutoffModifier)

    Random the number of day for the electricity shut off
  + ### randomAlarmDecay

    public int randomAlarmDecay(int alarmDecayModifier)
  + ### getTemperatureModifier

    public int getTemperatureModifier()
  + ### getRainModifier

    public int getRainModifier()
  + ### getErosionSpeed

    public int getErosionSpeed()
  + ### getWaterShutModifier

    public int getWaterShutModifier()
  + ### getElecShutModifier

    public int getElecShutModifier()
  + ### getTimeSinceApo

    public int getTimeSinceApo()
  + ### getEnduranceRegenMultiplier

    public double getEnduranceRegenMultiplier()
  + ### getStatsDecreaseMultiplier

    public double getStatsDecreaseMultiplier()
  + ### getDayLengthMinutes

    public int getDayLengthMinutes()
  + ### getDayLengthMinutesDefault

    public int getDayLengthMinutesDefault()
  + ### getCompostHours

    public int getCompostHours()
  + ### applySettings

    public void applySettings()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getFirstYear

    public int getFirstYear()
  + ### parseName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] parseName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### newBooleanOption

    private [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") newBooleanOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
  + ### newDoubleOption

    private [SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") newDoubleOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double min,
    double max,
    double defaultValue)
  + ### newEnumOption

    private [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") newEnumOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int numValues,
    int defaultValue)
  + ### newEnumOption

    private <EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>>
    [SandboxOptions.StrongEnumSandboxOption](SandboxOptions.StrongEnumSandboxOption.html "class in zombie")<EnumType> newEnumOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<EnumType> enumClass,
    EnumType defaultValue)
  + ### newIntegerOption

    private [SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") newIntegerOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int min,
    int max,
    int defaultValue)
  + ### newStringOption

    private [SandboxOptions.StringSandboxOption](SandboxOptions.StringSandboxOption.html "class in zombie") newStringOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    int maxLength)
  + ### addOption

    protected [SandboxOptions](SandboxOptions.html "class in zombie") addOption([SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") option)
  + ### getNumOptions

    public int getNumOptions()
  + ### getOptionByIndex

    public [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") getOptionByIndex(int index)
  + ### getOptionByName

    public [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### set

    public void set([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### copyValuesFrom

    public void copyValuesFrom([SandboxOptions](SandboxOptions.html "class in zombie") other)
  + ### resetToDefault

    public void resetToDefault()
  + ### setDefaultsToCurrentValues

    public void setDefaultsToCurrentValues()
  + ### newCopy

    public [SandboxOptions](SandboxOptions.html "class in zombie") newCopy()
  + ### isValidPresetName

    public static boolean isValidPresetName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### readTextFile

    private boolean readTextFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    boolean isPreset)
  + ### writeTextFile

    private boolean writeTextFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    int version)
  + ### loadServerTextFile

    public boolean loadServerTextFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### loadServerLuaFile

    public boolean loadServerLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### saveServerLuaFile

    public boolean saveServerLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### loadPresetFile

    public boolean loadPresetFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") presetName)
  + ### savePresetFile

    public boolean savePresetFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") presetName)
  + ### loadGameFile

    public boolean loadGameFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") presetName)
  + ### saveGameFile

    public boolean saveGameFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") presetName)
  + ### saveCurrentGameBinFile

    private void saveCurrentGameBinFile()
  + ### handleOldZombiesFile1

    public void handleOldZombiesFile1()
  + ### handleOldZombiesFile2

    public void handleOldZombiesFile2()
  + ### handleOldServerZombiesFile

    public void handleOldServerZombiesFile()
  + ### loadServerZombiesFile

    public boolean loadServerZombiesFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serverName)
  + ### readLuaFile

    private boolean readLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### writeLuaFile

    private boolean writeLuaFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    boolean isDeveloperFile)
  + ### load

    public void load()
  + ### loadCurrentGameBinFile

    public void loadCurrentGameBinFile()
  + ### upgradeOptionName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") upgradeOptionName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionName,
    int version)
  + ### upgradeOptionValue

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") upgradeOptionValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionValue,
    int version)
  + ### upgradeLuaTable

    private se.krka.kahlua.vm.KahluaTable upgradeLuaTable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefix,
    se.krka.kahlua.vm.KahluaTable table,
    int version)
  + ### sendToServer

    public void sendToServer()
  + ### newCustomOption

    public void newCustomOption(zombie.sandbox.CustomSandboxOption customSandboxOption)
  + ### addCustomOption

    private void addCustomOption([SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") option,
    zombie.sandbox.CustomSandboxOption custom)
  + ### removeCustomOptions

    private void removeCustomOptions()
  + ### Reset

    public static void Reset()
  + ### getAllClothesUnlocked

    public boolean getAllClothesUnlocked()
  + ### getCurrentRatIndex

    public int getCurrentRatIndex()
  + ### getCurrentLootedChance

    public int getCurrentLootedChance()
  + ### getCurrentLootedChance

    public int getCurrentLootedChance([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getCurrentDiminishedLootPercentage

    public int getCurrentDiminishedLootPercentage()
  + ### getCurrentDiminishedLootPercentage

    public int getCurrentDiminishedLootPercentage([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getCurrentLootMultiplier

    public float getCurrentLootMultiplier()
  + ### getCurrentLootMultiplier

    public float getCurrentLootMultiplier([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isUnstableScriptNameSpam

    public boolean isUnstableScriptNameSpam()
  + ### doesPowerGridExist

    public boolean doesPowerGridExist()
  + ### doesPowerGridExist

    public boolean doesPowerGridExist(int offset)
  + ### lootItemRemovalListContains

    public boolean lootItemRemovalListContains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### worldItemRemovalListContains

    public boolean worldItemRemovalListContains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)