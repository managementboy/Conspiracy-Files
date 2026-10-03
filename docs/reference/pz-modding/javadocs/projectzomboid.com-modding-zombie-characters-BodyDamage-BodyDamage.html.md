[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [BodyDamage](BodyDamage.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [behindStr](#behindStr)
   2. [leftStr](#leftStr)
   3. [rightStr](#rightStr)
   4. [bodyParts](#bodyParts)
   5. [bodyPartsLastState](#bodyPartsLastState)
   6. [damageModCount](#damageModCount)
   7. [infectionGrowthRate](#infectionGrowthRate)
   8. [isInfected](#isInfected)
   9. [infectionTime](#infectionTime)
   10. [infectionMortalityDuration](#infectionMortalityDuration)
   11. [isFakeInfected](#isFakeInfected)
   12. [overallBodyHealth](#overallBodyHealth)
   13. [standardHealthAddition](#standardHealthAddition)
   14. [reducedHealthAddition](#reducedHealthAddition)
   15. [severlyReducedHealthAddition](#severlyReducedHealthAddition)
   16. [sleepingHealthAddition](#sleepingHealthAddition)
   17. [healthFromFood](#healthFromFood)
   18. [healthReductionFromSevereBadMoodles](#healthReductionFromSevereBadMoodles)
   19. [standardHealthFromFoodTime](#standardHealthFromFoodTime)
   20. [healthFromFoodTimer](#healthFromFoodTimer)
   21. [boredomDecreaseFromReading](#boredomDecreaseFromReading)
   22. [initialThumpPain](#initialThumpPain)
   23. [initialScratchPain](#initialScratchPain)
   24. [initialBitePain](#initialBitePain)
   25. [initialWoundPain](#initialWoundPain)
   26. [continualPainIncrease](#continualPainIncrease)
   27. [painReductionFromMeds](#painReductionFromMeds)
   28. [standardPainReductionWhenWell](#standardPainReductionWhenWell)
   29. [oldNumZombiesVisible](#oldNumZombiesVisible)
   30. [currentNumZombiesVisible](#currentNumZombiesVisible)
   31. [panicIncreaseValue](#panicIncreaseValue)
   32. [panicIncreaseValueFrame](#panicIncreaseValueFrame)
   33. [panicReductionValue](#panicReductionValue)
   34. [drunkIncreaseValue](#drunkIncreaseValue)
   35. [drunkReductionValue](#drunkReductionValue)
   36. [isOnFire](#isOnFire)
   37. [burntToDeath](#burntToDeath)
   38. [catchACold](#catchACold)
   39. [hasACold](#hasACold)
   40. [coldStrength](#coldStrength)
   41. [coldProgressionRate](#coldProgressionRate)
   42. [timeToSneezeOrCough](#timeToSneezeOrCough)
   43. [smokerSneezeTimerMin](#smokerSneezeTimerMin)
   44. [smokerSneezeTimerMax](#smokerSneezeTimerMax)
   45. [mildColdSneezeTimerMin](#mildColdSneezeTimerMin)
   46. [mildColdSneezeTimerMax](#mildColdSneezeTimerMax)
   47. [coldSneezeTimerMin](#coldSneezeTimerMin)
   48. [coldSneezeTimerMax](#coldSneezeTimerMax)
   49. [nastyColdSneezeTimerMin](#nastyColdSneezeTimerMin)
   50. [nastyColdSneezeTimerMax](#nastyColdSneezeTimerMax)
   51. [sneezeCoughActive](#sneezeCoughActive)
   52. [sneezeCoughTime](#sneezeCoughTime)
   53. [sneezeCoughDelay](#sneezeCoughDelay)
   54. [coldDamageStage](#coldDamageStage)
   55. [parentChar](#parentChar)
   56. [stats](#stats)
   57. [remotePainLevel](#remotePainLevel)
   58. [reduceFakeInfection](#reduceFakeInfection)
   59. [painReduction](#painReduction)
   60. [coldReduction](#coldReduction)
   61. [thermoregulator](#thermoregulator)
   62. [InfectionLevelToZombify](#InfectionLevelToZombify)
   63. [wasDraggingCorpse](#wasDraggingCorpse)
   64. [startedDraggingCorpse](#startedDraggingCorpse)
6. [Constructor Details](#constructor-detail)
   1. [BodyDamage(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [getBodyPart(BodyPartType)](#getBodyPart(zombie.characters.BodyDamage.BodyPartType))
   2. [getBodyPartsLastState(BodyPartType)](#getBodyPartsLastState(zombie.characters.BodyDamage.BodyPartType))
   3. [setBodyPartsLastState()](#setBodyPartsLastState())
   4. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   5. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   6. [saveMainFields(ByteBuffer)](#saveMainFields(java.nio.ByteBuffer))
   7. [loadMainFields(ByteBuffer, int)](#loadMainFields(java.nio.ByteBuffer,int))
   8. [IsFakeInfected()](#IsFakeInfected())
   9. [OnFire(boolean)](#OnFire(boolean))
   10. [IsOnFire()](#IsOnFire())
   11. [WasBurntToDeath()](#WasBurntToDeath())
   12. [IncreasePanicFloat(float)](#IncreasePanicFloat(float))
   13. [IncreasePanic(int)](#IncreasePanic(int))
   14. [ReducePanic()](#ReducePanic())
   15. [UpdateDraggingCorpse()](#UpdateDraggingCorpse())
   16. [UpdatePanicState()](#UpdatePanicState())
   17. [JustDrankBooze(Food, float)](#JustDrankBooze(zombie.inventory.types.Food,float))
   18. [JustDrankBoozeFluid(float)](#JustDrankBoozeFluid(float))
   19. [JustTookPill(InventoryItem)](#JustTookPill(zombie.inventory.InventoryItem))
   20. [JustAteFood(Food, float)](#JustAteFood(zombie.inventory.types.Food,float))
   21. [JustAteFood(Food, float, boolean)](#JustAteFood(zombie.inventory.types.Food,float,boolean))
   22. [JustAteFood(Food)](#JustAteFood(zombie.inventory.types.Food))
   23. [getHealthFromFoodTimeByHunger()](#getHealthFromFoodTimeByHunger())
   24. [JustReadSomething(Literature)](#JustReadSomething(zombie.inventory.types.Literature))
   25. [JustTookPainMeds()](#JustTookPainMeds())
   26. [UpdateWetness()](#UpdateWetness())
   27. [TriggerSneezeCough()](#TriggerSneezeCough())
   28. [IsSneezingCoughing()](#IsSneezingCoughing())
   29. [UpdateCold()](#UpdateCold())
   30. [getColdStrength()](#getColdStrength())
   31. [AddDamage(BodyPartType, float)](#AddDamage(zombie.characters.BodyDamage.BodyPartType,float))
   32. [AddGeneralHealth(float)](#AddGeneralHealth(float))
   33. [ReduceGeneralHealth(float)](#ReduceGeneralHealth(float))
   34. [AddDamage(int, float)](#AddDamage(int,float))
   35. [splatBloodFloorBig()](#splatBloodFloorBig())
   36. [isSpikedPart(IsoGameCharacter, IsoGameCharacter, int)](#isSpikedPart(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter,int))
   37. [damageFromSpikedArmor(IsoGameCharacter, IsoGameCharacter, int, HandWeapon)](#damageFromSpikedArmor(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter,int,zombie.inventory.types.HandWeapon))
   38. [applyDamageFromWeapon(int, float, int, float)](#applyDamageFromWeapon(int,float,int,float))
   39. [DamageFromWeapon(HandWeapon, int)](#DamageFromWeapon(zombie.inventory.types.HandWeapon,int))
   40. [AddRandomDamageFromZombie(IsoZombie, String, int)](#AddRandomDamageFromZombie(zombie.characters.IsoZombie,java.lang.String,int))
   41. [doesBodyPartHaveInjury(BodyPartType)](#doesBodyPartHaveInjury(zombie.characters.BodyDamage.BodyPartType))
   42. [doBodyPartsHaveInjuries(BodyPartType, BodyPartType)](#doBodyPartsHaveInjuries(zombie.characters.BodyDamage.BodyPartType,zombie.characters.BodyDamage.BodyPartType))
   43. [isBodyPartBleeding(BodyPartType)](#isBodyPartBleeding(zombie.characters.BodyDamage.BodyPartType))
   44. [areBodyPartsBleeding(BodyPartType, BodyPartType)](#areBodyPartsBleeding(zombie.characters.BodyDamage.BodyPartType,zombie.characters.BodyDamage.BodyPartType))
   45. [DrawUntexturedQuad(int, int, int, int, float, float, float, float)](#DrawUntexturedQuad(int,int,int,int,float,float,float,float))
   46. [getBodyPartHealth(BodyPartType)](#getBodyPartHealth(zombie.characters.BodyDamage.BodyPartType))
   47. [getBodyPartHealth(int)](#getBodyPartHealth(int))
   48. [getBodyPartName(BodyPartType)](#getBodyPartName(zombie.characters.BodyDamage.BodyPartType))
   49. [getBodyPartName(int)](#getBodyPartName(int))
   50. [getHealth()](#getHealth())
   51. [getApparentInfectionLevel()](#getApparentInfectionLevel())
   52. [getNumPartsBleeding()](#getNumPartsBleeding())
   53. [isNeckBleeding()](#isNeckBleeding())
   54. [getNumPartsScratched()](#getNumPartsScratched())
   55. [getNumPartsBitten()](#getNumPartsBitten())
   56. [HasInjury()](#HasInjury())
   57. [IsBandaged(BodyPartType)](#IsBandaged(zombie.characters.BodyDamage.BodyPartType))
   58. [IsDeepWounded(BodyPartType)](#IsDeepWounded(zombie.characters.BodyDamage.BodyPartType))
   59. [IsBandaged(int)](#IsBandaged(int))
   60. [IsBitten(BodyPartType)](#IsBitten(zombie.characters.BodyDamage.BodyPartType))
   61. [IsBitten(int)](#IsBitten(int))
   62. [IsBleeding(BodyPartType)](#IsBleeding(zombie.characters.BodyDamage.BodyPartType))
   63. [IsBleeding(int)](#IsBleeding(int))
   64. [IsBleedingStemmed(BodyPartType)](#IsBleedingStemmed(zombie.characters.BodyDamage.BodyPartType))
   65. [IsBleedingStemmed(int)](#IsBleedingStemmed(int))
   66. [IsCauterized(BodyPartType)](#IsCauterized(zombie.characters.BodyDamage.BodyPartType))
   67. [IsCauterized(int)](#IsCauterized(int))
   68. [IsInfected()](#IsInfected())
   69. [IsInfected(BodyPartType)](#IsInfected(zombie.characters.BodyDamage.BodyPartType))
   70. [IsInfected(int)](#IsInfected(int))
   71. [IsFakeInfected(int)](#IsFakeInfected(int))
   72. [DisableFakeInfection(int)](#DisableFakeInfection(int))
   73. [IsScratched(BodyPartType)](#IsScratched(zombie.characters.BodyDamage.BodyPartType))
   74. [IsCut(BodyPartType)](#IsCut(zombie.characters.BodyDamage.BodyPartType))
   75. [IsScratched(int)](#IsScratched(int))
   76. [IsStitched(BodyPartType)](#IsStitched(zombie.characters.BodyDamage.BodyPartType))
   77. [IsStitched(int)](#IsStitched(int))
   78. [IsWounded(BodyPartType)](#IsWounded(zombie.characters.BodyDamage.BodyPartType))
   79. [IsWounded(int)](#IsWounded(int))
   80. [RestoreToFullHealth()](#RestoreToFullHealth())
   81. [SetBandaged(int, boolean, float, boolean, String)](#SetBandaged(int,boolean,float,boolean,java.lang.String))
   82. [SetBitten(BodyPartType, boolean)](#SetBitten(zombie.characters.BodyDamage.BodyPartType,boolean))
   83. [SetBitten(int, boolean)](#SetBitten(int,boolean))
   84. [SetBitten(int, boolean, boolean)](#SetBitten(int,boolean,boolean))
   85. [SetBleeding(BodyPartType, boolean)](#SetBleeding(zombie.characters.BodyDamage.BodyPartType,boolean))
   86. [SetBleeding(int, boolean)](#SetBleeding(int,boolean))
   87. [SetBleedingStemmed(BodyPartType, boolean)](#SetBleedingStemmed(zombie.characters.BodyDamage.BodyPartType,boolean))
   88. [SetBleedingStemmed(int, boolean)](#SetBleedingStemmed(int,boolean))
   89. [SetCauterized(BodyPartType, boolean)](#SetCauterized(zombie.characters.BodyDamage.BodyPartType,boolean))
   90. [SetCauterized(int, boolean)](#SetCauterized(int,boolean))
   91. [setScratchedWindow()](#setScratchedWindow())
   92. [SetScratched(BodyPartType, boolean)](#SetScratched(zombie.characters.BodyDamage.BodyPartType,boolean))
   93. [SetScratched(int, boolean)](#SetScratched(int,boolean))
   94. [SetScratchedFromWeapon(int, boolean)](#SetScratchedFromWeapon(int,boolean))
   95. [SetCut(int, boolean)](#SetCut(int,boolean))
   96. [SetWounded(BodyPartType, boolean)](#SetWounded(zombie.characters.BodyDamage.BodyPartType,boolean))
   97. [SetWounded(int, boolean)](#SetWounded(int,boolean))
   98. [ShowDebugInfo()](#ShowDebugInfo())
   99. [UpdateBoredom()](#UpdateBoredom())
   100. [UpdateStrength()](#UpdateStrength())
   101. [pickMortalityDuration()](#pickMortalityDuration())
   102. [Update()](#Update())
   103. [calculateOverallHealth()](#calculateOverallHealth())
   104. [getSicknessFromCorpsesRate(int)](#getSicknessFromCorpsesRate(int))
   105. [UpdateIllness()](#UpdateIllness())
   106. [GetBaseCorpseSickness()](#GetBaseCorpseSickness())
   107. [UpdateTemperatureState()](#UpdateTemperatureState())
   108. [getDamageFromPills()](#getDamageFromPills())
   109. [UseBandageOnMostNeededPart()](#UseBandageOnMostNeededPart())
   110. [getBodyParts()](#getBodyParts())
   111. [getDamageModCount()](#getDamageModCount())
   112. [setDamageModCount(int)](#setDamageModCount(int))
   113. [getInfectionGrowthRate()](#getInfectionGrowthRate())
   114. [setInfectionGrowthRate(float)](#setInfectionGrowthRate(float))
   115. [isInfected()](#isInfected())
   116. [setInfected(boolean)](#setInfected(boolean))
   117. [getInfectionTime()](#getInfectionTime())
   118. [setInfectionTime(float)](#setInfectionTime(float))
   119. [getInfectionMortalityDuration()](#getInfectionMortalityDuration())
   120. [setInfectionMortalityDuration(float)](#setInfectionMortalityDuration(float))
   121. [getCurrentTimeForInfection()](#getCurrentTimeForInfection())
   122. [isInf()](#isInf())
   123. [setInf(boolean)](#setInf(boolean))
   124. [isIsFakeInfected()](#isIsFakeInfected())
   125. [setIsFakeInfected(boolean)](#setIsFakeInfected(boolean))
   126. [getOverallBodyHealth()](#getOverallBodyHealth())
   127. [setOverallBodyHealth(float)](#setOverallBodyHealth(float))
   128. [getStandardHealthAddition()](#getStandardHealthAddition())
   129. [setStandardHealthAddition(float)](#setStandardHealthAddition(float))
   130. [getReducedHealthAddition()](#getReducedHealthAddition())
   131. [setReducedHealthAddition(float)](#setReducedHealthAddition(float))
   132. [getSeverlyReducedHealthAddition()](#getSeverlyReducedHealthAddition())
   133. [setSeverlyReducedHealthAddition(float)](#setSeverlyReducedHealthAddition(float))
   134. [getSleepingHealthAddition()](#getSleepingHealthAddition())
   135. [setSleepingHealthAddition(float)](#setSleepingHealthAddition(float))
   136. [getHealthFromFood()](#getHealthFromFood())
   137. [setHealthFromFood(float)](#setHealthFromFood(float))
   138. [getHealthReductionFromSevereBadMoodles()](#getHealthReductionFromSevereBadMoodles())
   139. [setHealthReductionFromSevereBadMoodles(float)](#setHealthReductionFromSevereBadMoodles(float))
   140. [getStandardHealthFromFoodTime()](#getStandardHealthFromFoodTime())
   141. [setStandardHealthFromFoodTime(int)](#setStandardHealthFromFoodTime(int))
   142. [getHealthFromFoodTimer()](#getHealthFromFoodTimer())
   143. [setHealthFromFoodTimer(float)](#setHealthFromFoodTimer(float))
   144. [getBoredomDecreaseFromReading()](#getBoredomDecreaseFromReading())
   145. [setBoredomDecreaseFromReading(float)](#setBoredomDecreaseFromReading(float))
   146. [getInitialThumpPain()](#getInitialThumpPain())
   147. [setInitialThumpPain(float)](#setInitialThumpPain(float))
   148. [getInitialScratchPain()](#getInitialScratchPain())
   149. [setInitialScratchPain(float)](#setInitialScratchPain(float))
   150. [getInitialBitePain()](#getInitialBitePain())
   151. [setInitialBitePain(float)](#setInitialBitePain(float))
   152. [getInitialWoundPain()](#getInitialWoundPain())
   153. [setInitialWoundPain(float)](#setInitialWoundPain(float))
   154. [getContinualPainIncrease()](#getContinualPainIncrease())
   155. [setContinualPainIncrease(float)](#setContinualPainIncrease(float))
   156. [getPainReductionFromMeds()](#getPainReductionFromMeds())
   157. [setPainReductionFromMeds(float)](#setPainReductionFromMeds(float))
   158. [getStandardPainReductionWhenWell()](#getStandardPainReductionWhenWell())
   159. [setStandardPainReductionWhenWell(float)](#setStandardPainReductionWhenWell(float))
   160. [getOldNumZombiesVisible()](#getOldNumZombiesVisible())
   161. [setOldNumZombiesVisible(int)](#setOldNumZombiesVisible(int))
   162. [getWasDraggingCorpse()](#getWasDraggingCorpse())
   163. [setWasDraggingCorpse(boolean)](#setWasDraggingCorpse(boolean))
   164. [getCurrentNumZombiesVisible()](#getCurrentNumZombiesVisible())
   165. [setCurrentNumZombiesVisible(int)](#setCurrentNumZombiesVisible(int))
   166. [getPanicIncreaseValue()](#getPanicIncreaseValue())
   167. [getPanicIncreaseValueFrame()](#getPanicIncreaseValueFrame())
   168. [setPanicIncreaseValue(float)](#setPanicIncreaseValue(float))
   169. [getPanicReductionValue()](#getPanicReductionValue())
   170. [setPanicReductionValue(float)](#setPanicReductionValue(float))
   171. [getDrunkIncreaseValue()](#getDrunkIncreaseValue())
   172. [setDrunkIncreaseValue(float)](#setDrunkIncreaseValue(float))
   173. [getDrunkReductionValue()](#getDrunkReductionValue())
   174. [setDrunkReductionValue(float)](#setDrunkReductionValue(float))
   175. [isIsOnFire()](#isIsOnFire())
   176. [setIsOnFire(boolean)](#setIsOnFire(boolean))
   177. [isBurntToDeath()](#isBurntToDeath())
   178. [setBurntToDeath(boolean)](#setBurntToDeath(boolean))
   179. [getCatchACold()](#getCatchACold())
   180. [setCatchACold(float)](#setCatchACold(float))
   181. [isHasACold()](#isHasACold())
   182. [setHasACold(boolean)](#setHasACold(boolean))
   183. [setColdStrength(float)](#setColdStrength(float))
   184. [getColdProgressionRate()](#getColdProgressionRate())
   185. [setColdProgressionRate(float)](#setColdProgressionRate(float))
   186. [getTimeToSneezeOrCough()](#getTimeToSneezeOrCough())
   187. [setTimeToSneezeOrCough(float)](#setTimeToSneezeOrCough(float))
   188. [getSmokerSneezeTimerMin()](#getSmokerSneezeTimerMin())
   189. [getSmokerSneezeTimerMax()](#getSmokerSneezeTimerMax())
   190. [getMildColdSneezeTimerMin()](#getMildColdSneezeTimerMin())
   191. [setMildColdSneezeTimerMin(int)](#setMildColdSneezeTimerMin(int))
   192. [getMildColdSneezeTimerMax()](#getMildColdSneezeTimerMax())
   193. [setMildColdSneezeTimerMax(int)](#setMildColdSneezeTimerMax(int))
   194. [getColdSneezeTimerMin()](#getColdSneezeTimerMin())
   195. [setColdSneezeTimerMin(int)](#setColdSneezeTimerMin(int))
   196. [getColdSneezeTimerMax()](#getColdSneezeTimerMax())
   197. [setColdSneezeTimerMax(int)](#setColdSneezeTimerMax(int))
   198. [getNastyColdSneezeTimerMin()](#getNastyColdSneezeTimerMin())
   199. [setNastyColdSneezeTimerMin(int)](#setNastyColdSneezeTimerMin(int))
   200. [getNastyColdSneezeTimerMax()](#getNastyColdSneezeTimerMax())
   201. [setNastyColdSneezeTimerMax(int)](#setNastyColdSneezeTimerMax(int))
   202. [getSneezeCoughActive()](#getSneezeCoughActive())
   203. [setSneezeCoughActive(int)](#setSneezeCoughActive(int))
   204. [getSneezeCoughTime()](#getSneezeCoughTime())
   205. [setSneezeCoughTime(int)](#setSneezeCoughTime(int))
   206. [getSneezeCoughDelay()](#getSneezeCoughDelay())
   207. [setSneezeCoughDelay(int)](#setSneezeCoughDelay(int))
   208. [getParentChar()](#getParentChar())
   209. [isReduceFakeInfection()](#isReduceFakeInfection())
   210. [setReduceFakeInfection(boolean)](#setReduceFakeInfection(boolean))
   211. [AddRandomDamage()](#AddRandomDamage())
   212. [getPainReduction()](#getPainReduction())
   213. [setPainReduction(float)](#setPainReduction(float))
   214. [getColdReduction()](#getColdReduction())
   215. [setColdReduction(float)](#setColdReduction(float))
   216. [getRemotePainLevel()](#getRemotePainLevel())
   217. [setRemotePainLevel(int)](#setRemotePainLevel(int))
   218. [getColdDamageStage()](#getColdDamageStage())
   219. [setColdDamageStage(float)](#setColdDamageStage(float))
   220. [getThermoregulator()](#getThermoregulator())
   221. [decreaseBodyWetness(float)](#decreaseBodyWetness(float))
   222. [increaseBodyWetness(float)](#increaseBodyWetness(float))
   223. [DamageFromAnimal(IsoAnimal)](#DamageFromAnimal(zombie.characters.animals.IsoAnimal))
   224. [getGeneralWoundInfectionLevel()](#getGeneralWoundInfectionLevel())
   225. [UpdateDiscomfort()](#UpdateDiscomfort())
   226. [addStiffness(BodyPart, float)](#addStiffness(zombie.characters.BodyDamage.BodyPart,float))
   227. [addStiffness(BodyPartType, float)](#addStiffness(zombie.characters.BodyDamage.BodyPartType,float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyDamage
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.BodyDamage

---

public final class BodyDamage
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final String`

  `behindStr`

  `private final ArrayList<BodyPart>`

  `bodyParts`

  `private final ArrayList<zombie.characters.BodyDamage.BodyPartLast>`

  `bodyPartsLastState`

  `private float`

  `boredomDecreaseFromReading`

  `private boolean`

  `burntToDeath`

  `private float`

  `catchACold`

  `private float`

  `coldDamageStage`

  `private float`

  `coldProgressionRate`

  `private float`

  `coldReduction`

  `private int`

  `coldSneezeTimerMax`

  `private int`

  `coldSneezeTimerMin`

  `private float`

  `coldStrength`

  `private float`

  `continualPainIncrease`

  `private int`

  `currentNumZombiesVisible`

  `private int`

  `damageModCount`

  `private float`

  `drunkIncreaseValue`

  `private float`

  `drunkReductionValue`

  `private boolean`

  `hasACold`

  `private float`

  `healthFromFood`

  `private float`

  `healthFromFoodTimer`

  `private float`

  `healthReductionFromSevereBadMoodles`

  `private float`

  `infectionGrowthRate`

  `static final float`

  `InfectionLevelToZombify`

  `private float`

  `infectionMortalityDuration`

  `private float`

  `infectionTime`

  `private float`

  `initialBitePain`

  `private float`

  `initialScratchPain`

  `private float`

  `initialThumpPain`

  `private float`

  `initialWoundPain`

  `boolean`

  `isFakeInfected`

  `private boolean`

  `isInfected`

  `private boolean`

  `isOnFire`

  `private static final String`

  `leftStr`

  `private int`

  `mildColdSneezeTimerMax`

  `private int`

  `mildColdSneezeTimerMin`

  `private int`

  `nastyColdSneezeTimerMax`

  `private int`

  `nastyColdSneezeTimerMin`

  `private int`

  `oldNumZombiesVisible`

  `private float`

  `overallBodyHealth`

  `private float`

  `painReduction`

  `private float`

  `painReductionFromMeds`

  `private float`

  `panicIncreaseValue`

  `private final float`

  `panicIncreaseValueFrame`

  `private float`

  `panicReductionValue`

  `private final IsoGameCharacter`

  `parentChar`

  `private float`

  `reducedHealthAddition`

  `private boolean`

  `reduceFakeInfection`

  `private int`

  `remotePainLevel`

  `private static final String`

  `rightStr`

  `private float`

  `severlyReducedHealthAddition`

  `private float`

  `sleepingHealthAddition`

  `private final int`

  `smokerSneezeTimerMax`

  `private final int`

  `smokerSneezeTimerMin`

  `private int`

  `sneezeCoughActive`

  `private int`

  `sneezeCoughDelay`

  `private int`

  `sneezeCoughTime`

  `private float`

  `standardHealthAddition`

  `private int`

  `standardHealthFromFoodTime`

  `private float`

  `standardPainReductionWhenWell`

  `private boolean`

  `startedDraggingCorpse`

  `private final Stats`

  `stats`

  `private Thermoregulator`

  `thermoregulator`

  `private float`

  `timeToSneezeOrCough`

  `private boolean`

  `wasDraggingCorpse`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyDamage(IsoGameCharacter parentCharacter)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddDamage(int bodyPartIndex,
  float val)`

  `void`

  `AddDamage(BodyPartType bodyPart,
  float val)`

  `void`

  `AddGeneralHealth(float val)`

  `void`

  `AddRandomDamage()`

  `boolean`

  `AddRandomDamageFromZombie(IsoZombie zombie,
  String hitReaction,
  int partIndex)`

  `void`

  `addStiffness(BodyPart part,
  float stiffness)`

  `void`

  `addStiffness(BodyPartType partType,
  float stiffness)`

  `void`

  `applyDamageFromWeapon(int partIndex,
  float damage,
  int damageType,
  float pain)`

  `boolean`

  `areBodyPartsBleeding(BodyPartType partA,
  BodyPartType partB)`

  `void`

  `calculateOverallHealth()`

  `void`

  `DamageFromAnimal(IsoAnimal wielder)`

  `static void`

  `damageFromSpikedArmor(IsoGameCharacter owner,
  IsoGameCharacter target,
  int partIndex,
  HandWeapon weapon)`

  `void`

  `DamageFromWeapon(HandWeapon weapon,
  int partIndex)`

  `void`

  `decreaseBodyWetness(float amount)`

  `void`

  `DisableFakeInfection(int bodyPartIndex)`

  `boolean`

  `doBodyPartsHaveInjuries(BodyPartType partA,
  BodyPartType partB)`

  `boolean`

  `doesBodyPartHaveInjury(BodyPartType part)`

  `void`

  `DrawUntexturedQuad(int x,
  int y,
  int width,
  int height,
  float r,
  float g,
  float b,
  float a)`

  `float`

  `getApparentInfectionLevel()`

  `float`

  `GetBaseCorpseSickness()`

  `BodyPart`

  `getBodyPart(BodyPartType type)`

  `float`

  `getBodyPartHealth(int bodyPartIndex)`

  `float`

  `getBodyPartHealth(BodyPartType bodyPart)`

  `String`

  `getBodyPartName(int bodyPartIndex)`

  `String`

  `getBodyPartName(BodyPartType bodyPart)`

  `ArrayList<BodyPart>`

  `getBodyParts()`

  `zombie.characters.BodyDamage.BodyPartLast`

  `getBodyPartsLastState(BodyPartType type)`

  `float`

  `getBoredomDecreaseFromReading()`

  `float`

  `getCatchACold()`

  `float`

  `getColdDamageStage()`

  `float`

  `getColdProgressionRate()`

  `float`

  `getColdReduction()`

  `int`

  `getColdSneezeTimerMax()`

  `int`

  `getColdSneezeTimerMin()`

  `float`

  `getColdStrength()`

  `float`

  `getContinualPainIncrease()`

  `int`

  `getCurrentNumZombiesVisible()`

  `private float`

  `getCurrentTimeForInfection()`

  `private float`

  `getDamageFromPills()`

  `int`

  `getDamageModCount()`

  `float`

  `getDrunkIncreaseValue()`

  `float`

  `getDrunkReductionValue()`

  `float`

  `getGeneralWoundInfectionLevel()`

  `float`

  `getHealth()`

  `float`

  `getHealthFromFood()`

  `private float`

  `getHealthFromFoodTimeByHunger()`

  `float`

  `getHealthFromFoodTimer()`

  `float`

  `getHealthReductionFromSevereBadMoodles()`

  `float`

  `getInfectionGrowthRate()`

  `float`

  `getInfectionMortalityDuration()`

  `float`

  `getInfectionTime()`

  `float`

  `getInitialBitePain()`

  `float`

  `getInitialScratchPain()`

  `float`

  `getInitialThumpPain()`

  `float`

  `getInitialWoundPain()`

  `int`

  `getMildColdSneezeTimerMax()`

  `int`

  `getMildColdSneezeTimerMin()`

  `int`

  `getNastyColdSneezeTimerMax()`

  `int`

  `getNastyColdSneezeTimerMin()`

  `int`

  `getNumPartsBitten()`

  `int`

  `getNumPartsBleeding()`

  `int`

  `getNumPartsScratched()`

  `int`

  `getOldNumZombiesVisible()`

  `float`

  `getOverallBodyHealth()`

  `float`

  `getPainReduction()`

  `float`

  `getPainReductionFromMeds()`

  `float`

  `getPanicIncreaseValue()`

  `float`

  `getPanicIncreaseValueFrame()`

  `float`

  `getPanicReductionValue()`

  `IsoGameCharacter`

  `getParentChar()`

  `float`

  `getReducedHealthAddition()`

  `int`

  `getRemotePainLevel()`

  `float`

  `getSeverlyReducedHealthAddition()`

  `static float`

  `getSicknessFromCorpsesRate(int corpseCount)`

  `float`

  `getSleepingHealthAddition()`

  `int`

  `getSmokerSneezeTimerMax()`

  `int`

  `getSmokerSneezeTimerMin()`

  `int`

  `getSneezeCoughActive()`

  `int`

  `getSneezeCoughDelay()`

  `int`

  `getSneezeCoughTime()`

  `float`

  `getStandardHealthAddition()`

  `int`

  `getStandardHealthFromFoodTime()`

  `float`

  `getStandardPainReductionWhenWell()`

  `Thermoregulator`

  `getThermoregulator()`

  `float`

  `getTimeToSneezeOrCough()`

  `boolean`

  `getWasDraggingCorpse()`

  `boolean`

  `HasInjury()`

  `void`

  `increaseBodyWetness(float amount)`

  `void`

  `IncreasePanic(int numNewZombiesSeen)`

  `void`

  `IncreasePanicFloat(float delta)`

  `boolean`

  `IsBandaged(int bodyPartIndex)`

  `boolean`

  `IsBandaged(BodyPartType bodyPart)`

  `boolean`

  `IsBitten(int bodyPartIndex)`

  `boolean`

  `IsBitten(BodyPartType bodyPart)`

  `boolean`

  `IsBleeding(int bodyPartIndex)`

  `boolean`

  `IsBleeding(BodyPartType bodyPart)`

  `boolean`

  `IsBleedingStemmed(int bodyPartIndex)`

  `boolean`

  `IsBleedingStemmed(BodyPartType bodyPart)`

  `boolean`

  `isBodyPartBleeding(BodyPartType part)`

  `boolean`

  `isBurntToDeath()`

  `boolean`

  `IsCauterized(int bodyPartIndex)`

  `boolean`

  `IsCauterized(BodyPartType bodyPart)`

  `boolean`

  `IsCut(BodyPartType bodyPart)`

  `boolean`

  `IsDeepWounded(BodyPartType bodyPart)`

  `boolean`

  `IsFakeInfected()`

  `boolean`

  `IsFakeInfected(int bodyPartIndex)`

  `boolean`

  `isHasACold()`

  `boolean`

  `isInf()`

  Deprecated.

  `boolean`

  `isInfected()`

  `boolean`

  `IsInfected()`

  `boolean`

  `IsInfected(int bodyPartIndex)`

  `boolean`

  `IsInfected(BodyPartType bodyPart)`

  `boolean`

  `isIsFakeInfected()`

  `boolean`

  `isIsOnFire()`

  `boolean`

  `isNeckBleeding()`

  `boolean`

  `IsOnFire()`

  `boolean`

  `isReduceFakeInfection()`

  `boolean`

  `IsScratched(int bodyPartIndex)`

  `boolean`

  `IsScratched(BodyPartType bodyPart)`

  `int`

  `IsSneezingCoughing()`

  `private static boolean`

  `isSpikedPart(IsoGameCharacter owner,
  IsoGameCharacter target,
  int partIndex)`

  `boolean`

  `IsStitched(int bodyPartIndex)`

  `boolean`

  `IsStitched(BodyPartType bodyPart)`

  `boolean`

  `IsWounded(int bodyPartIndex)`

  `boolean`

  `IsWounded(BodyPartType bodyPart)`

  `void`

  `JustAteFood(Food newFood)`

  `void`

  `JustAteFood(Food newFood,
  float percentage)`

  `void`

  `JustAteFood(Food newFood,
  float percentage,
  boolean useUtensil)`

  `void`

  `JustDrankBooze(Food food,
  float percentage)`

  `void`

  `JustDrankBoozeFluid(float alcohol)`

  `void`

  `JustReadSomething(Literature literature)`

  `void`

  `JustTookPainMeds()`

  `void`

  `JustTookPill(InventoryItem pill)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `loadMainFields(ByteBuffer input,
  int worldVersion)`

  `void`

  `OnFire(boolean onFire)`

  `float`

  `pickMortalityDuration()`

  `void`

  `ReduceGeneralHealth(float val)`

  `void`

  `ReducePanic()`

  `void`

  `RestoreToFullHealth()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveMainFields(ByteBuffer output)`

  `void`

  `SetBandaged(int bodyPartIndex,
  boolean bandaged,
  float bandageLife,
  boolean isAlcoholic,
  String bandageType)`

  `void`

  `SetBitten(int bodyPartIndex,
  boolean bitten)`

  `void`

  `SetBitten(int bodyPartIndex,
  boolean bitten,
  boolean infected)`

  `void`

  `SetBitten(BodyPartType bodyPart,
  boolean bitten)`

  `void`

  `SetBleeding(int bodyPartIndex,
  boolean bleeding)`

  `void`

  `SetBleeding(BodyPartType bodyPart,
  boolean bleeding)`

  `void`

  `SetBleedingStemmed(int bodyPartIndex,
  boolean bleedingStemmed)`

  `void`

  `SetBleedingStemmed(BodyPartType bodyPart,
  boolean bleedingStemmed)`

  `void`

  `setBodyPartsLastState()`

  `void`

  `setBoredomDecreaseFromReading(float boredomDecreaseFromReading)`

  `void`

  `setBurntToDeath(boolean burntToDeath)`

  `void`

  `setCatchACold(float catchACold)`

  `void`

  `SetCauterized(int bodyPartIndex,
  boolean cauterized)`

  `void`

  `SetCauterized(BodyPartType bodyPart,
  boolean cauterized)`

  `void`

  `setColdDamageStage(float coldDamageStage)`

  `void`

  `setColdProgressionRate(float coldProgressionRate)`

  `void`

  `setColdReduction(float coldReduction)`

  `void`

  `setColdSneezeTimerMax(int coldSneezeTimerMax)`

  `void`

  `setColdSneezeTimerMin(int coldSneezeTimerMin)`

  `void`

  `setColdStrength(float coldStrength)`

  `void`

  `setContinualPainIncrease(float continualPainIncrease)`

  `void`

  `setCurrentNumZombiesVisible(int currentNumZombiesVisible)`

  `void`

  `SetCut(int bodyPartIndex,
  boolean cut)`

  `void`

  `setDamageModCount(int damageModCount)`

  `void`

  `setDrunkIncreaseValue(float drunkIncreaseValue)`

  `void`

  `setDrunkReductionValue(float drunkReductionValue)`

  `void`

  `setHasACold(boolean hasACold)`

  `void`

  `setHealthFromFood(float healthFromFood)`

  `void`

  `setHealthFromFoodTimer(float healthFromFoodTimer)`

  `void`

  `setHealthReductionFromSevereBadMoodles(float healthReductionFromSevereBadMoodles)`

  `void`

  `setInf(boolean inf)`

  Deprecated.

  `void`

  `setInfected(boolean infected)`

  `void`

  `setInfectionGrowthRate(float infectionGrowthRate)`

  `void`

  `setInfectionMortalityDuration(float worldHours)`

  `void`

  `setInfectionTime(float worldHours)`

  `void`

  `setInitialBitePain(float initialBitePain)`

  `void`

  `setInitialScratchPain(float initialScratchPain)`

  `void`

  `setInitialThumpPain(float initialThumpPain)`

  `void`

  `setInitialWoundPain(float initialWoundPain)`

  `void`

  `setIsFakeInfected(boolean isFakeInfected)`

  `void`

  `setIsOnFire(boolean isOnFire)`

  `void`

  `setMildColdSneezeTimerMax(int mildColdSneezeTimerMax)`

  `void`

  `setMildColdSneezeTimerMin(int mildColdSneezeTimerMin)`

  `void`

  `setNastyColdSneezeTimerMax(int nastyColdSneezeTimerMax)`

  `void`

  `setNastyColdSneezeTimerMin(int nastyColdSneezeTimerMin)`

  `void`

  `setOldNumZombiesVisible(int oldNumZombiesVisible)`

  `void`

  `setOverallBodyHealth(float overallBodyHealth)`

  `void`

  `setPainReduction(float painReduction)`

  `void`

  `setPainReductionFromMeds(float painReductionFromMeds)`

  `void`

  `setPanicIncreaseValue(float panicIncreaseValue)`

  `void`

  `setPanicReductionValue(float panicReductionValue)`

  `void`

  `setReducedHealthAddition(float reducedHealthAddition)`

  `void`

  `setReduceFakeInfection(boolean reduceFakeInfection)`

  `void`

  `setRemotePainLevel(int painLevel)`

  `void`

  `SetScratched(int bodyPartIndex,
  boolean scratched)`

  `void`

  `SetScratched(BodyPartType bodyPart,
  boolean scratched)`

  `void`

  `SetScratchedFromWeapon(int bodyPartIndex,
  boolean scratched)`

  `BodyPart`

  `setScratchedWindow()`

  `void`

  `setSeverlyReducedHealthAddition(float severlyReducedHealthAddition)`

  `void`

  `setSleepingHealthAddition(float sleepingHealthAddition)`

  `void`

  `setSneezeCoughActive(int sneezeCoughActive)`

  `void`

  `setSneezeCoughDelay(int sneezeCoughDelay)`

  `void`

  `setSneezeCoughTime(int sneezeCoughTime)`

  `void`

  `setStandardHealthAddition(float standardHealthAddition)`

  `void`

  `setStandardHealthFromFoodTime(int standardHealthFromFoodTime)`

  `void`

  `setStandardPainReductionWhenWell(float standardPainReductionWhenWell)`

  `void`

  `setTimeToSneezeOrCough(float timeToSneezeOrCough)`

  `void`

  `setWasDraggingCorpse(boolean wasDraggingCorpse)`

  `void`

  `SetWounded(int bodyPartIndex,
  boolean wounded)`

  `void`

  `SetWounded(BodyPartType bodyPart,
  boolean wounded)`

  `void`

  `ShowDebugInfo()`

  `void`

  `splatBloodFloorBig()`

  `void`

  `TriggerSneezeCough()`

  `void`

  `Update()`

  `void`

  `UpdateBoredom()`

  `void`

  `UpdateCold()`

  `void`

  `UpdateDiscomfort()`

  `void`

  `UpdateDraggingCorpse()`

  `private void`

  `UpdateIllness()`

  `void`

  `UpdatePanicState()`

  `void`

  `UpdateStrength()`

  `private void`

  `UpdateTemperatureState()`

  `void`

  `UpdateWetness()`

  `boolean`

  `UseBandageOnMostNeededPart()`

  `boolean`

  `WasBurntToDeath()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### behindStr

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") behindStr

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.behindStr)
  + ### leftStr

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") leftStr

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.leftStr)
  + ### rightStr

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rightStr

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.rightStr)
  + ### bodyParts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BodyPart](BodyPart.html "class in zombie.characters.BodyDamage")> bodyParts
  + ### bodyPartsLastState

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.BodyDamage.BodyPartLast> bodyPartsLastState
  + ### damageModCount

    private int damageModCount
  + ### infectionGrowthRate

    private float infectionGrowthRate
  + ### isInfected

    private boolean isInfected
  + ### infectionTime

    private float infectionTime
  + ### infectionMortalityDuration

    private float infectionMortalityDuration
  + ### isFakeInfected

    public boolean isFakeInfected
  + ### overallBodyHealth

    private float overallBodyHealth
  + ### standardHealthAddition

    private float standardHealthAddition
  + ### reducedHealthAddition

    private float reducedHealthAddition
  + ### severlyReducedHealthAddition

    private float severlyReducedHealthAddition
  + ### sleepingHealthAddition

    private float sleepingHealthAddition
  + ### healthFromFood

    private float healthFromFood
  + ### healthReductionFromSevereBadMoodles

    private float healthReductionFromSevereBadMoodles
  + ### standardHealthFromFoodTime

    private int standardHealthFromFoodTime
  + ### healthFromFoodTimer

    private float healthFromFoodTimer
  + ### boredomDecreaseFromReading

    private float boredomDecreaseFromReading
  + ### initialThumpPain

    private float initialThumpPain
  + ### initialScratchPain

    private float initialScratchPain
  + ### initialBitePain

    private float initialBitePain
  + ### initialWoundPain

    private float initialWoundPain
  + ### continualPainIncrease

    private float continualPainIncrease
  + ### painReductionFromMeds

    private float painReductionFromMeds
  + ### standardPainReductionWhenWell

    private float standardPainReductionWhenWell
  + ### oldNumZombiesVisible

    private int oldNumZombiesVisible
  + ### currentNumZombiesVisible

    private int currentNumZombiesVisible
  + ### panicIncreaseValue

    private float panicIncreaseValue
  + ### panicIncreaseValueFrame

    private final float panicIncreaseValueFrame

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.panicIncreaseValueFrame)
  + ### panicReductionValue

    private float panicReductionValue
  + ### drunkIncreaseValue

    private float drunkIncreaseValue
  + ### drunkReductionValue

    private float drunkReductionValue
  + ### isOnFire

    private boolean isOnFire
  + ### burntToDeath

    private boolean burntToDeath
  + ### catchACold

    private float catchACold
  + ### hasACold

    private boolean hasACold
  + ### coldStrength

    private float coldStrength
  + ### coldProgressionRate

    private float coldProgressionRate
  + ### timeToSneezeOrCough

    private float timeToSneezeOrCough
  + ### smokerSneezeTimerMin

    private final int smokerSneezeTimerMin

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.smokerSneezeTimerMin)
  + ### smokerSneezeTimerMax

    private final int smokerSneezeTimerMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.smokerSneezeTimerMax)
  + ### mildColdSneezeTimerMin

    private int mildColdSneezeTimerMin
  + ### mildColdSneezeTimerMax

    private int mildColdSneezeTimerMax
  + ### coldSneezeTimerMin

    private int coldSneezeTimerMin
  + ### coldSneezeTimerMax

    private int coldSneezeTimerMax
  + ### nastyColdSneezeTimerMin

    private int nastyColdSneezeTimerMin
  + ### nastyColdSneezeTimerMax

    private int nastyColdSneezeTimerMax
  + ### sneezeCoughActive

    private int sneezeCoughActive
  + ### sneezeCoughTime

    private int sneezeCoughTime
  + ### sneezeCoughDelay

    private int sneezeCoughDelay
  + ### coldDamageStage

    private float coldDamageStage
  + ### parentChar

    private final [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parentChar
  + ### stats

    private final [Stats](../Stats.html "class in zombie.characters") stats
  + ### remotePainLevel

    private int remotePainLevel
  + ### reduceFakeInfection

    private boolean reduceFakeInfection
  + ### painReduction

    private float painReduction
  + ### coldReduction

    private float coldReduction
  + ### thermoregulator

    private [Thermoregulator](Thermoregulator.html "class in zombie.characters.BodyDamage") thermoregulator
  + ### InfectionLevelToZombify

    public static final float InfectionLevelToZombify

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyDamage.InfectionLevelToZombify)
  + ### wasDraggingCorpse

    private boolean wasDraggingCorpse
  + ### startedDraggingCorpse

    private boolean startedDraggingCorpse
* Constructor Details
  -------------------

  + ### BodyDamage

    public BodyDamage([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parentCharacter)
* Method Details
  --------------

  + ### getBodyPart

    public [BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") getBodyPart([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") type)
  + ### getBodyPartsLastState

    public zombie.characters.BodyDamage.BodyPartLast getBodyPartsLastState([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") type)
  + ### setBodyPartsLastState

    public void setBodyPartsLastState()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveMainFields

    public void saveMainFields([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### loadMainFields

    public void loadMainFields([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### IsFakeInfected

    public boolean IsFakeInfected()
  + ### OnFire

    public void OnFire(boolean onFire)
  + ### IsOnFire

    public boolean IsOnFire()
  + ### WasBurntToDeath

    public boolean WasBurntToDeath()
  + ### IncreasePanicFloat

    public void IncreasePanicFloat(float delta)
  + ### IncreasePanic

    public void IncreasePanic(int numNewZombiesSeen)
  + ### ReducePanic

    public void ReducePanic()
  + ### UpdateDraggingCorpse

    public void UpdateDraggingCorpse()
  + ### UpdatePanicState

    public void UpdatePanicState()
  + ### JustDrankBooze

    public void JustDrankBooze([Food](../../inventory/types/Food.html "class in zombie.inventory.types") food,
    float percentage)
  + ### JustDrankBoozeFluid

    public void JustDrankBoozeFluid(float alcohol)
  + ### JustTookPill

    public void JustTookPill([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") pill)
  + ### JustAteFood

    public void JustAteFood([Food](../../inventory/types/Food.html "class in zombie.inventory.types") newFood,
    float percentage)
  + ### JustAteFood

    public void JustAteFood([Food](../../inventory/types/Food.html "class in zombie.inventory.types") newFood,
    float percentage,
    boolean useUtensil)
  + ### JustAteFood

    public void JustAteFood([Food](../../inventory/types/Food.html "class in zombie.inventory.types") newFood)
  + ### getHealthFromFoodTimeByHunger

    private float getHealthFromFoodTimeByHunger()
  + ### JustReadSomething

    public void JustReadSomething([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") literature)
  + ### JustTookPainMeds

    public void JustTookPainMeds()
  + ### UpdateWetness

    public void UpdateWetness()
  + ### TriggerSneezeCough

    public void TriggerSneezeCough()
  + ### IsSneezingCoughing

    public int IsSneezingCoughing()
  + ### UpdateCold

    public void UpdateCold()
  + ### getColdStrength

    public float getColdStrength()
  + ### AddDamage

    public void AddDamage([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    float val)
  + ### AddGeneralHealth

    public void AddGeneralHealth(float val)
  + ### ReduceGeneralHealth

    public void ReduceGeneralHealth(float val)
  + ### AddDamage

    public void AddDamage(int bodyPartIndex,
    float val)
  + ### splatBloodFloorBig

    public void splatBloodFloorBig()
  + ### isSpikedPart

    private static boolean isSpikedPart([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") target,
    int partIndex)
  + ### damageFromSpikedArmor

    public static void damageFromSpikedArmor([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") target,
    int partIndex,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### applyDamageFromWeapon

    public void applyDamageFromWeapon(int partIndex,
    float damage,
    int damageType,
    float pain)
  + ### DamageFromWeapon

    public void DamageFromWeapon([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    int partIndex)
  + ### AddRandomDamageFromZombie

    public boolean AddRandomDamageFromZombie([IsoZombie](../IsoZombie.html "class in zombie.characters") zombie,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitReaction,
    int partIndex)
  + ### doesBodyPartHaveInjury

    public boolean doesBodyPartHaveInjury([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") part)
  + ### doBodyPartsHaveInjuries

    public boolean doBodyPartsHaveInjuries([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partA,
    [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partB)
  + ### isBodyPartBleeding

    public boolean isBodyPartBleeding([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") part)
  + ### areBodyPartsBleeding

    public boolean areBodyPartsBleeding([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partA,
    [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partB)
  + ### DrawUntexturedQuad

    public void DrawUntexturedQuad(int x,
    int y,
    int width,
    int height,
    float r,
    float g,
    float b,
    float a)
  + ### getBodyPartHealth

    public float getBodyPartHealth([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### getBodyPartHealth

    public float getBodyPartHealth(int bodyPartIndex)
  + ### getBodyPartName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBodyPartName([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### getBodyPartName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBodyPartName(int bodyPartIndex)
  + ### getHealth

    public float getHealth()
  + ### getApparentInfectionLevel

    public float getApparentInfectionLevel()
  + ### getNumPartsBleeding

    public int getNumPartsBleeding()
  + ### isNeckBleeding

    public boolean isNeckBleeding()
  + ### getNumPartsScratched

    public int getNumPartsScratched()
  + ### getNumPartsBitten

    public int getNumPartsBitten()
  + ### HasInjury

    public boolean HasInjury()
  + ### IsBandaged

    public boolean IsBandaged([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsDeepWounded

    public boolean IsDeepWounded([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsBandaged

    public boolean IsBandaged(int bodyPartIndex)
  + ### IsBitten

    public boolean IsBitten([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsBitten

    public boolean IsBitten(int bodyPartIndex)
  + ### IsBleeding

    public boolean IsBleeding([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsBleeding

    public boolean IsBleeding(int bodyPartIndex)
  + ### IsBleedingStemmed

    public boolean IsBleedingStemmed([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsBleedingStemmed

    public boolean IsBleedingStemmed(int bodyPartIndex)
  + ### IsCauterized

    public boolean IsCauterized([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsCauterized

    public boolean IsCauterized(int bodyPartIndex)
  + ### IsInfected

    public boolean IsInfected()
  + ### IsInfected

    public boolean IsInfected([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsInfected

    public boolean IsInfected(int bodyPartIndex)
  + ### IsFakeInfected

    public boolean IsFakeInfected(int bodyPartIndex)
  + ### DisableFakeInfection

    public void DisableFakeInfection(int bodyPartIndex)
  + ### IsScratched

    public boolean IsScratched([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsCut

    public boolean IsCut([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsScratched

    public boolean IsScratched(int bodyPartIndex)
  + ### IsStitched

    public boolean IsStitched([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsStitched

    public boolean IsStitched(int bodyPartIndex)
  + ### IsWounded

    public boolean IsWounded([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart)
  + ### IsWounded

    public boolean IsWounded(int bodyPartIndex)
  + ### RestoreToFullHealth

    public void RestoreToFullHealth()
  + ### SetBandaged

    public void SetBandaged(int bodyPartIndex,
    boolean bandaged,
    float bandageLife,
    boolean isAlcoholic,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageType)
  + ### SetBitten

    public void SetBitten([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean bitten)
  + ### SetBitten

    public void SetBitten(int bodyPartIndex,
    boolean bitten)
  + ### SetBitten

    public void SetBitten(int bodyPartIndex,
    boolean bitten,
    boolean infected)
  + ### SetBleeding

    public void SetBleeding([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean bleeding)
  + ### SetBleeding

    public void SetBleeding(int bodyPartIndex,
    boolean bleeding)
  + ### SetBleedingStemmed

    public void SetBleedingStemmed([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean bleedingStemmed)
  + ### SetBleedingStemmed

    public void SetBleedingStemmed(int bodyPartIndex,
    boolean bleedingStemmed)
  + ### SetCauterized

    public void SetCauterized([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean cauterized)
  + ### SetCauterized

    public void SetCauterized(int bodyPartIndex,
    boolean cauterized)
  + ### setScratchedWindow

    public [BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") setScratchedWindow()
  + ### SetScratched

    public void SetScratched([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean scratched)
  + ### SetScratched

    public void SetScratched(int bodyPartIndex,
    boolean scratched)
  + ### SetScratchedFromWeapon

    public void SetScratchedFromWeapon(int bodyPartIndex,
    boolean scratched)
  + ### SetCut

    public void SetCut(int bodyPartIndex,
    boolean cut)
  + ### SetWounded

    public void SetWounded([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean wounded)
  + ### SetWounded

    public void SetWounded(int bodyPartIndex,
    boolean wounded)
  + ### ShowDebugInfo

    public void ShowDebugInfo()
  + ### UpdateBoredom

    public void UpdateBoredom()
  + ### UpdateStrength

    public void UpdateStrength()
  + ### pickMortalityDuration

    public float pickMortalityDuration()
  + ### Update

    public void Update()
  + ### calculateOverallHealth

    public void calculateOverallHealth()
  + ### getSicknessFromCorpsesRate

    public static float getSicknessFromCorpsesRate(int corpseCount)
  + ### UpdateIllness

    private void UpdateIllness()
  + ### GetBaseCorpseSickness

    public float GetBaseCorpseSickness()
  + ### UpdateTemperatureState

    private void UpdateTemperatureState()
  + ### getDamageFromPills

    private float getDamageFromPills()
  + ### UseBandageOnMostNeededPart

    public boolean UseBandageOnMostNeededPart()
  + ### getBodyParts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BodyPart](BodyPart.html "class in zombie.characters.BodyDamage")> getBodyParts()
  + ### getDamageModCount

    public int getDamageModCount()
  + ### setDamageModCount

    public void setDamageModCount(int damageModCount)
  + ### getInfectionGrowthRate

    public float getInfectionGrowthRate()
  + ### setInfectionGrowthRate

    public void setInfectionGrowthRate(float infectionGrowthRate)
  + ### isInfected

    public boolean isInfected()
  + ### setInfected

    public void setInfected(boolean infected)
  + ### getInfectionTime

    public float getInfectionTime()
  + ### setInfectionTime

    public void setInfectionTime(float worldHours)
  + ### getInfectionMortalityDuration

    public float getInfectionMortalityDuration()
  + ### setInfectionMortalityDuration

    public void setInfectionMortalityDuration(float worldHours)
  + ### getCurrentTimeForInfection

    private float getCurrentTimeForInfection()
  + ### isInf

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isInf()

    Deprecated.
  + ### setInf

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setInf(boolean inf)

    Deprecated.
  + ### isIsFakeInfected

    public boolean isIsFakeInfected()
  + ### setIsFakeInfected

    public void setIsFakeInfected(boolean isFakeInfected)
  + ### getOverallBodyHealth

    public float getOverallBodyHealth()
  + ### setOverallBodyHealth

    public void setOverallBodyHealth(float overallBodyHealth)
  + ### getStandardHealthAddition

    public float getStandardHealthAddition()
  + ### setStandardHealthAddition

    public void setStandardHealthAddition(float standardHealthAddition)
  + ### getReducedHealthAddition

    public float getReducedHealthAddition()
  + ### setReducedHealthAddition

    public void setReducedHealthAddition(float reducedHealthAddition)
  + ### getSeverlyReducedHealthAddition

    public float getSeverlyReducedHealthAddition()
  + ### setSeverlyReducedHealthAddition

    public void setSeverlyReducedHealthAddition(float severlyReducedHealthAddition)
  + ### getSleepingHealthAddition

    public float getSleepingHealthAddition()
  + ### setSleepingHealthAddition

    public void setSleepingHealthAddition(float sleepingHealthAddition)
  + ### getHealthFromFood

    public float getHealthFromFood()
  + ### setHealthFromFood

    public void setHealthFromFood(float healthFromFood)
  + ### getHealthReductionFromSevereBadMoodles

    public float getHealthReductionFromSevereBadMoodles()
  + ### setHealthReductionFromSevereBadMoodles

    public void setHealthReductionFromSevereBadMoodles(float healthReductionFromSevereBadMoodles)
  + ### getStandardHealthFromFoodTime

    public int getStandardHealthFromFoodTime()
  + ### setStandardHealthFromFoodTime

    public void setStandardHealthFromFoodTime(int standardHealthFromFoodTime)
  + ### getHealthFromFoodTimer

    public float getHealthFromFoodTimer()
  + ### setHealthFromFoodTimer

    public void setHealthFromFoodTimer(float healthFromFoodTimer)
  + ### getBoredomDecreaseFromReading

    public float getBoredomDecreaseFromReading()
  + ### setBoredomDecreaseFromReading

    public void setBoredomDecreaseFromReading(float boredomDecreaseFromReading)
  + ### getInitialThumpPain

    public float getInitialThumpPain()
  + ### setInitialThumpPain

    public void setInitialThumpPain(float initialThumpPain)
  + ### getInitialScratchPain

    public float getInitialScratchPain()
  + ### setInitialScratchPain

    public void setInitialScratchPain(float initialScratchPain)
  + ### getInitialBitePain

    public float getInitialBitePain()
  + ### setInitialBitePain

    public void setInitialBitePain(float initialBitePain)
  + ### getInitialWoundPain

    public float getInitialWoundPain()
  + ### setInitialWoundPain

    public void setInitialWoundPain(float initialWoundPain)
  + ### getContinualPainIncrease

    public float getContinualPainIncrease()
  + ### setContinualPainIncrease

    public void setContinualPainIncrease(float continualPainIncrease)
  + ### getPainReductionFromMeds

    public float getPainReductionFromMeds()
  + ### setPainReductionFromMeds

    public void setPainReductionFromMeds(float painReductionFromMeds)
  + ### getStandardPainReductionWhenWell

    public float getStandardPainReductionWhenWell()
  + ### setStandardPainReductionWhenWell

    public void setStandardPainReductionWhenWell(float standardPainReductionWhenWell)
  + ### getOldNumZombiesVisible

    public int getOldNumZombiesVisible()
  + ### setOldNumZombiesVisible

    public void setOldNumZombiesVisible(int oldNumZombiesVisible)
  + ### getWasDraggingCorpse

    public boolean getWasDraggingCorpse()
  + ### setWasDraggingCorpse

    public void setWasDraggingCorpse(boolean wasDraggingCorpse)
  + ### getCurrentNumZombiesVisible

    public int getCurrentNumZombiesVisible()
  + ### setCurrentNumZombiesVisible

    public void setCurrentNumZombiesVisible(int currentNumZombiesVisible)
  + ### getPanicIncreaseValue

    public float getPanicIncreaseValue()
  + ### getPanicIncreaseValueFrame

    public float getPanicIncreaseValueFrame()
  + ### setPanicIncreaseValue

    public void setPanicIncreaseValue(float panicIncreaseValue)
  + ### getPanicReductionValue

    public float getPanicReductionValue()
  + ### setPanicReductionValue

    public void setPanicReductionValue(float panicReductionValue)
  + ### getDrunkIncreaseValue

    public float getDrunkIncreaseValue()
  + ### setDrunkIncreaseValue

    public void setDrunkIncreaseValue(float drunkIncreaseValue)
  + ### getDrunkReductionValue

    public float getDrunkReductionValue()
  + ### setDrunkReductionValue

    public void setDrunkReductionValue(float drunkReductionValue)
  + ### isIsOnFire

    public boolean isIsOnFire()
  + ### setIsOnFire

    public void setIsOnFire(boolean isOnFire)
  + ### isBurntToDeath

    public boolean isBurntToDeath()
  + ### setBurntToDeath

    public void setBurntToDeath(boolean burntToDeath)
  + ### getCatchACold

    public float getCatchACold()
  + ### setCatchACold

    public void setCatchACold(float catchACold)
  + ### isHasACold

    public boolean isHasACold()
  + ### setHasACold

    public void setHasACold(boolean hasACold)
  + ### setColdStrength

    public void setColdStrength(float coldStrength)
  + ### getColdProgressionRate

    public float getColdProgressionRate()
  + ### setColdProgressionRate

    public void setColdProgressionRate(float coldProgressionRate)
  + ### getTimeToSneezeOrCough

    public float getTimeToSneezeOrCough()
  + ### setTimeToSneezeOrCough

    public void setTimeToSneezeOrCough(float timeToSneezeOrCough)
  + ### getSmokerSneezeTimerMin

    public int getSmokerSneezeTimerMin()
  + ### getSmokerSneezeTimerMax

    public int getSmokerSneezeTimerMax()
  + ### getMildColdSneezeTimerMin

    public int getMildColdSneezeTimerMin()
  + ### setMildColdSneezeTimerMin

    public void setMildColdSneezeTimerMin(int mildColdSneezeTimerMin)
  + ### getMildColdSneezeTimerMax

    public int getMildColdSneezeTimerMax()
  + ### setMildColdSneezeTimerMax

    public void setMildColdSneezeTimerMax(int mildColdSneezeTimerMax)
  + ### getColdSneezeTimerMin

    public int getColdSneezeTimerMin()
  + ### setColdSneezeTimerMin

    public void setColdSneezeTimerMin(int coldSneezeTimerMin)
  + ### getColdSneezeTimerMax

    public int getColdSneezeTimerMax()
  + ### setColdSneezeTimerMax

    public void setColdSneezeTimerMax(int coldSneezeTimerMax)
  + ### getNastyColdSneezeTimerMin

    public int getNastyColdSneezeTimerMin()
  + ### setNastyColdSneezeTimerMin

    public void setNastyColdSneezeTimerMin(int nastyColdSneezeTimerMin)
  + ### getNastyColdSneezeTimerMax

    public int getNastyColdSneezeTimerMax()
  + ### setNastyColdSneezeTimerMax

    public void setNastyColdSneezeTimerMax(int nastyColdSneezeTimerMax)
  + ### getSneezeCoughActive

    public int getSneezeCoughActive()
  + ### setSneezeCoughActive

    public void setSneezeCoughActive(int sneezeCoughActive)
  + ### getSneezeCoughTime

    public int getSneezeCoughTime()
  + ### setSneezeCoughTime

    public void setSneezeCoughTime(int sneezeCoughTime)
  + ### getSneezeCoughDelay

    public int getSneezeCoughDelay()
  + ### setSneezeCoughDelay

    public void setSneezeCoughDelay(int sneezeCoughDelay)
  + ### getParentChar

    public [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") getParentChar()
  + ### isReduceFakeInfection

    public boolean isReduceFakeInfection()
  + ### setReduceFakeInfection

    public void setReduceFakeInfection(boolean reduceFakeInfection)
  + ### AddRandomDamage

    public void AddRandomDamage()
  + ### getPainReduction

    public float getPainReduction()
  + ### setPainReduction

    public void setPainReduction(float painReduction)
  + ### getColdReduction

    public float getColdReduction()
  + ### setColdReduction

    public void setColdReduction(float coldReduction)
  + ### getRemotePainLevel

    public int getRemotePainLevel()
  + ### setRemotePainLevel

    public void setRemotePainLevel(int painLevel)
  + ### getColdDamageStage

    public float getColdDamageStage()
  + ### setColdDamageStage

    public void setColdDamageStage(float coldDamageStage)
  + ### getThermoregulator

    public [Thermoregulator](Thermoregulator.html "class in zombie.characters.BodyDamage") getThermoregulator()
  + ### decreaseBodyWetness

    public void decreaseBodyWetness(float amount)
  + ### increaseBodyWetness

    public void increaseBodyWetness(float amount)
  + ### DamageFromAnimal

    public void DamageFromAnimal([IsoAnimal](../animals/IsoAnimal.html "class in zombie.characters.animals") wielder)
  + ### getGeneralWoundInfectionLevel

    public float getGeneralWoundInfectionLevel()
  + ### UpdateDiscomfort

    public void UpdateDiscomfort()
  + ### addStiffness

    public void addStiffness([BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") part,
    float stiffness)
  + ### addStiffness

    public void addStiffness([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partType,
    float stiffness)