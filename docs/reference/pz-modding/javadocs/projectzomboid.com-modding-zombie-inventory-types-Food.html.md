[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Food](Food.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [updateAgeRate](#updateAgeRate)
   2. [badCold](#badCold)
   3. [goodHot](#goodHot)
   4. [MIN\_HEAT](#MIN_HEAT)
   5. [MAX\_HEAT](#MAX_HEAT)
   6. [heat](#heat)
   7. [endChange](#endChange)
   8. [hungChange](#hungChange)
   9. [useOnConsume](#useOnConsume)
   10. [rotten](#rotten)
   11. [dangerousUncooked](#dangerousUncooked)
   12. [lastCookMinute](#lastCookMinute)
   13. [thirstChange](#thirstChange)
   14. [poison](#poison)
   15. [replaceOnCooked](#replaceOnCooked)
   16. [baseHunger](#baseHunger)
   17. [spices](#spices)
   18. [isSpice](#isSpice)
   19. [isTainted](#isTainted)
   20. [poisonDetectionLevel](#poisonDetectionLevel)
   21. [poisonLevelForRecipe](#poisonLevelForRecipe)
   22. [useForPoison](#useForPoison)
   23. [poisonPower](#poisonPower)
   24. [foodType](#foodType)
   25. [customEatSound](#customEatSound)
   26. [removeNegativeEffectOnCooked](#removeNegativeEffectOnCooked)
   27. [chef](#chef)
   28. [onCooked](#onCooked)
   29. [worldTextureCooked](#worldTextureCooked)
   30. [worldTextureRotten](#worldTextureRotten)
   31. [worldTextureOverdone](#worldTextureOverdone)
   32. [fluReduction](#fluReduction)
   33. [foodSicknessChange](#foodSicknessChange)
   34. [painReduction](#painReduction)
   35. [herbalistType](#herbalistType)
   36. [carbohydrates](#carbohydrates)
   37. [lipids](#lipids)
   38. [proteins](#proteins)
   39. [calories](#calories)
   40. [packaged](#packaged)
   41. [freezingTime](#freezingTime)
   42. [frozen](#frozen)
   43. [canBeFrozen](#canBeFrozen)
   44. [lastFrozenUpdate](#lastFrozenUpdate)
   45. [FreezerAgeMultiplier](#FreezerAgeMultiplier)
   46. [replaceOnRotten](#replaceOnRotten)
   47. [forceFoodTypeAsName](#forceFoodTypeAsName)
   48. [rottenTime](#rottenTime)
   49. [compostTime](#compostTime)
   50. [onEat](#onEat)
   51. [badInMicrowave](#badInMicrowave)
   52. [cookedInMicrowave](#cookedInMicrowave)
   53. [cookingSound](#cookingSound)
   54. [cookingParameter](#cookingParameter)
   55. [soundLimiterGroupID\_Burning](#soundLimiterGroupID_Burning)
   56. [milkQty](#milkQty)
   57. [milkType](#milkType)
   58. [fertilized](#fertilized)
   59. [fertilizedTime](#fertilizedTime)
   60. [timeToHatch](#timeToHatch)
   61. [animalHatch](#animalHatch)
   62. [animalHatchBreed](#animalHatchBreed)
   63. [lastEggTimeCheck](#lastEggTimeCheck)
   64. [motherId](#motherId)
   65. [eggGenome](#eggGenome)
   66. [temperatureTimeAccum](#temperatureTimeAccum)
   67. [COOKING\_STATE\_COOKING](#COOKING_STATE_COOKING)
   68. [COOKING\_STATE\_BURNING](#COOKING_STATE_BURNING)
   69. [floorContainer](#floorContainer)
   70. [SLP\_COOKING\_SOUND](#SLP_COOKING_SOUND)
   71. [SLP\_COOKING\_PARAMETER](#SLP_COOKING_PARAMETER)
6. [Constructor Details](#constructor-detail)
   1. [Food(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [Food(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [getCategory()](#getCategory())
   2. [IsFood()](#IsFood())
   3. [checkEggHatch(IsoHutch)](#checkEggHatch(zombie.iso.objects.IsoHutch))
   4. [update()](#update())
   5. [getSoundLimiterGroupID()](#getSoundLimiterGroupID())
   6. [registerWithSoundLimiter(SoundInstanceLimiter)](#registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter))
   7. [updateSound(BaseSoundEmitter, SoundLimiterParams)](#updateSound(zombie.audio.BaseSoundEmitter,zombie.audio.SoundLimiterParams))
   8. [shouldPlayCookingSound()](#shouldPlayCookingSound())
   9. [setCookingParameter(BaseSoundEmitter)](#setCookingParameter(zombie.audio.BaseSoundEmitter))
   10. [updateClientCookingSounds()](#updateClientCookingSounds())
   11. [updateTemperature()](#updateTemperature())
   12. [updateRotting(ItemContainer)](#updateRotting(zombie.inventory.ItemContainer))
   13. [getFridgeFactor()](#getFridgeFactor())
   14. [getFoodRotSpeed()](#getFoodRotSpeed())
   15. [updateAge()](#updateAge())
   16. [updateAge(boolean)](#updateAge(boolean))
   17. [setAutoAge()](#setAutoAge())
   18. [updateFreezing(ItemContainer, float)](#updateFreezing(zombie.inventory.ItemContainer,float))
   19. [getActualWeight()](#getActualWeight())
   20. [getWeight()](#getWeight())
   21. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   22. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   23. [finishupdate()](#finishupdate())
   24. [shouldUpdateInWorld()](#shouldUpdateInWorld())
   25. [getName()](#getName())
   26. [getName(IsoPlayer)](#getName(zombie.characters.IsoPlayer))
   27. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   28. [getEnduranceChange()](#getEnduranceChange())
   29. [setEnduranceChange(float)](#setEnduranceChange(float))
   30. [getUnhappyChange()](#getUnhappyChange())
   31. [getBoredomChange()](#getBoredomChange())
   32. [getHungerChange()](#getHungerChange())
   33. [getStressChange()](#getStressChange())
   34. [getBoredomChangeUnmodified()](#getBoredomChangeUnmodified())
   35. [getEnduranceChangeUnmodified()](#getEnduranceChangeUnmodified())
   36. [getStressChangeUnmodified()](#getStressChangeUnmodified())
   37. [getThirstChangeUnmodified()](#getThirstChangeUnmodified())
   38. [getUnhappyChangeUnmodified()](#getUnhappyChangeUnmodified())
   39. [getScore(SurvivorDesc)](#getScore(zombie.characters.SurvivorDesc))
   40. [isBadCold()](#isBadCold())
   41. [setBadCold(boolean)](#setBadCold(boolean))
   42. [isGoodHot()](#isGoodHot())
   43. [setGoodHot(boolean)](#setGoodHot(boolean))
   44. [isCookedInMicrowave()](#isCookedInMicrowave())
   45. [setCookedInMicrowave(boolean)](#setCookedInMicrowave(boolean))
   46. [getHeat()](#getHeat())
   47. [getInvHeat()](#getInvHeat())
   48. [setHeat(float)](#setHeat(float))
   49. [getEndChange()](#getEndChange())
   50. [setEndChange(float)](#setEndChange(float))
   51. [getBaseHungChange()](#getBaseHungChange())
   52. [getHungChange()](#getHungChange())
   53. [setHungChange(float)](#setHungChange(float))
   54. [getUseOnConsume()](#getUseOnConsume())
   55. [setUseOnConsume(String)](#setUseOnConsume(java.lang.String))
   56. [isRotten()](#isRotten())
   57. [isFresh()](#isFresh())
   58. [setRotten(boolean)](#setRotten(boolean))
   59. [isbDangerousUncooked()](#isbDangerousUncooked())
   60. [setbDangerousUncooked(boolean)](#setbDangerousUncooked(boolean))
   61. [getLastCookMinute()](#getLastCookMinute())
   62. [setLastCookMinute(int)](#setLastCookMinute(int))
   63. [getThirstChange()](#getThirstChange())
   64. [setThirstChange(float)](#setThirstChange(float))
   65. [setReplaceOnCooked(List)](#setReplaceOnCooked(java.util.List))
   66. [getReplaceOnCooked()](#getReplaceOnCooked())
   67. [getBaseHunger()](#getBaseHunger())
   68. [setBaseHunger(float)](#setBaseHunger(float))
   69. [isSpice()](#isSpice())
   70. [setSpice(boolean)](#setSpice(boolean))
   71. [isPoison()](#isPoison())
   72. [getPoisonDetectionLevel()](#getPoisonDetectionLevel())
   73. [setPoisonDetectionLevel(int)](#setPoisonDetectionLevel(int))
   74. [getPoisonLevelForRecipe()](#getPoisonLevelForRecipe())
   75. [setPoisonLevelForRecipe(Integer)](#setPoisonLevelForRecipe(java.lang.Integer))
   76. [getUseForPoison()](#getUseForPoison())
   77. [setUseForPoison(int)](#setUseForPoison(int))
   78. [getPoisonPower()](#getPoisonPower())
   79. [setPoisonPower(int)](#setPoisonPower(int))
   80. [getFoodType()](#getFoodType())
   81. [setFoodType(String)](#setFoodType(java.lang.String))
   82. [isRemoveNegativeEffectOnCooked()](#isRemoveNegativeEffectOnCooked())
   83. [setRemoveNegativeEffectOnCooked(boolean)](#setRemoveNegativeEffectOnCooked(boolean))
   84. [getCookingSound()](#getCookingSound())
   85. [getCustomEatSound()](#getCustomEatSound())
   86. [setCustomEatSound(String)](#setCustomEatSound(java.lang.String))
   87. [getChef()](#getChef())
   88. [setChef(String)](#setChef(java.lang.String))
   89. [getOnCooked()](#getOnCooked())
   90. [setOnCooked(String)](#setOnCooked(java.lang.String))
   91. [getHerbalistType()](#getHerbalistType())
   92. [setHerbalistType(String)](#setHerbalistType(java.lang.String))
   93. [getSpices()](#getSpices())
   94. [setSpices(ArrayList)](#setSpices(java.util.ArrayList))
   95. [getTex()](#getTex())
   96. [getWorldTexture()](#getWorldTexture())
   97. [getStaticModel()](#getStaticModel())
   98. [getFoodSicknessChange()](#getFoodSicknessChange())
   99. [setFoodSicknessChange(int)](#setFoodSicknessChange(int))
   100. [getFluReduction()](#getFluReduction())
   101. [setFluReduction(int)](#setFluReduction(int))
   102. [getPainReduction()](#getPainReduction())
   103. [setPainReduction(float)](#setPainReduction(float))
   104. [getCarbohydrates()](#getCarbohydrates())
   105. [setCarbohydrates(float)](#setCarbohydrates(float))
   106. [getLipids()](#getLipids())
   107. [setLipids(float)](#setLipids(float))
   108. [getProteins()](#getProteins())
   109. [setProteins(float)](#setProteins(float))
   110. [getCalories()](#getCalories())
   111. [setCalories(float)](#setCalories(float))
   112. [isPackaged()](#isPackaged())
   113. [setPackaged(boolean)](#setPackaged(boolean))
   114. [getFreezingTime()](#getFreezingTime())
   115. [setFreezingTime(float)](#setFreezingTime(float))
   116. [freeze()](#freeze())
   117. [isFrozen()](#isFrozen())
   118. [setFrozen(boolean)](#setFrozen(boolean))
   119. [canBeFrozen()](#canBeFrozen())
   120. [setCanBeFrozen(boolean)](#setCanBeFrozen(boolean))
   121. [isFreezing()](#isFreezing())
   122. [isThawing()](#isThawing())
   123. [getMaxUses()](#getMaxUses())
   124. [getCurrentUses()](#getCurrentUses())
   125. [setCurrentUses(int)](#setCurrentUses(int))
   126. [getCurrentUsesFloat()](#getCurrentUsesFloat())
   127. [syncItemFields()](#syncItemFields())
   128. [syncItemFieldForWorldItem()](#syncItemFieldForWorldItem())
   129. [getReplaceOnRotten()](#getReplaceOnRotten())
   130. [setReplaceOnRotten(String)](#setReplaceOnRotten(java.lang.String))
   131. [multiplyFoodValues(float)](#multiplyFoodValues(float))
   132. [getRottenTime()](#getRottenTime())
   133. [setRottenTime(float)](#setRottenTime(float))
   134. [getCompostTime()](#getCompostTime())
   135. [setCompostTime(float)](#setCompostTime(float))
   136. [getOnEat()](#getOnEat())
   137. [setOnEat(String)](#setOnEat(java.lang.String))
   138. [isBadInMicrowave()](#isBadInMicrowave())
   139. [setBadInMicrowave(boolean)](#setBadInMicrowave(boolean))
   140. [isTainted()](#isTainted())
   141. [setTainted(boolean)](#setTainted(boolean))
   142. [destroyThisItem()](#destroyThisItem())
   143. [setMilkQty(int)](#setMilkQty(int))
   144. [getMilkQty()](#getMilkQty())
   145. [setMilkType(String)](#setMilkType(java.lang.String))
   146. [getMilkType()](#getMilkType())
   147. [isFertilized()](#isFertilized())
   148. [setFertilized(boolean)](#setFertilized(boolean))
   149. [getAnimalHatch()](#getAnimalHatch())
   150. [setAnimalHatch(String)](#setAnimalHatch(java.lang.String))
   151. [getAnimalHatchBreed()](#getAnimalHatchBreed())
   152. [setAnimalHatchBreed(String)](#setAnimalHatchBreed(java.lang.String))
   153. [getTimeToHatch()](#getTimeToHatch())
   154. [setTimeToHatch(int)](#setTimeToHatch(int))
   155. [isNormalAndFullFood()](#isNormalAndFullFood())
   156. [isWholeFoodItem()](#isWholeFoodItem())
   157. [isUncooked()](#isUncooked())
   158. [OnAddedToContainer(ItemContainer)](#OnAddedToContainer(zombie.inventory.ItemContainer))
   159. [OnBeforeRemoveFromContainer(ItemContainer)](#OnBeforeRemoveFromContainer(zombie.inventory.ItemContainer))
   160. [getFertilizedTime()](#getFertilizedTime())
   161. [setFertilizedTime(int)](#setFertilizedTime(int))
   162. [inheritFoodAgeFrom(InventoryItem)](#inheritFoodAgeFrom(zombie.inventory.InventoryItem))
   163. [inheritOlderFoodAge(InventoryItem)](#inheritOlderFoodAge(zombie.inventory.InventoryItem))
   164. [hasAnimalParts()](#hasAnimalParts())
   165. [isAnimalSkeleton()](#isAnimalSkeleton())
   166. [canAge()](#canAge())
   167. [isFood()](#isFood())
   168. [copyFrozenFrom(Food)](#copyFrozenFrom(zombie.inventory.types.Food))
   169. [copyCookedBurntFrom(Food)](#copyCookedBurntFrom(zombie.inventory.types.Food))
   170. [copyTemperatureFrom(Food)](#copyTemperatureFrom(zombie.inventory.types.Food))
   171. [copyPoisonFrom(Food)](#copyPoisonFrom(zombie.inventory.types.Food))
   172. [copyAgeFrom(Food)](#copyAgeFrom(zombie.inventory.types.Food))
   173. [copyNutritionFrom(Food)](#copyNutritionFrom(zombie.inventory.types.Food))
   174. [copyNutritionFromSplit(Food, int)](#copyNutritionFromSplit(zombie.inventory.types.Food,int))
   175. [copyNutritionFromRatio(Food, float)](#copyNutritionFromRatio(zombie.inventory.types.Food,float))
   176. [copyFoodFrom(Food)](#copyFoodFrom(zombie.inventory.types.Food))
   177. [copyExtraItems(Food)](#copyExtraItems(zombie.inventory.types.Food))
   178. [copyFoodFromSplit(Food, int)](#copyFoodFromSplit(zombie.inventory.types.Food,int))
   179. [consumeHunger(float)](#consumeHunger(float))
   180. [isInFridge(ItemContainer)](#isInFridge(zombie.inventory.ItemContainer))
   181. [isInFreezer(ItemContainer)](#isInFreezer(zombie.inventory.ItemContainer))
   182. [initAnimalIcons()](#initAnimalIcons())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Food
==========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.Food

---

public final class Food
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `animalHatch`

  `private String`

  `animalHatchBreed`

  `protected boolean`

  `badCold`

  `private boolean`

  `badInMicrowave`

  `private float`

  `baseHunger`

  `private float`

  `calories`

  `private boolean`

  `canBeFrozen`

  `private float`

  `carbohydrates`

  `private String`

  `chef`

  `private float`

  `compostTime`

  `private boolean`

  `cookedInMicrowave`

  `private static final int`

  `COOKING_STATE_BURNING`

  `private static final int`

  `COOKING_STATE_COOKING`

  `private int`

  `cookingParameter`

  `private long`

  `cookingSound`

  `private String`

  `customEatSound`

  `protected boolean`

  `dangerousUncooked`

  `HashMap<String, AnimalGene>`

  `eggGenome`

  `protected float`

  `endChange`

  `private boolean`

  `fertilized`

  `private int`

  `fertilizedTime`

  `private static final ItemContainer`

  `floorContainer`

  `private int`

  `fluReduction`

  `private int`

  `foodSicknessChange`

  `private String`

  `foodType`

  `private final boolean`

  `forceFoodTypeAsName`

  `static final float`

  `FreezerAgeMultiplier`

  `private float`

  `freezingTime`

  `private boolean`

  `frozen`

  `protected boolean`

  `goodHot`

  `protected float`

  `heat`

  `private String`

  `herbalistType`

  `protected float`

  `hungChange`

  `private boolean`

  `isSpice`

  `private boolean`

  `isTainted`

  `protected int`

  `lastCookMinute`

  `private long`

  `lastEggTimeCheck`

  `protected float`

  `lastFrozenUpdate`

  `private float`

  `lipids`

  `private static final float`

  `MAX_HEAT`

  `private int`

  `milkQty`

  `private String`

  `milkType`

  `private static final float`

  `MIN_HEAT`

  `int`

  `motherId`

  `private String`

  `onCooked`

  `private String`

  `onEat`

  `private boolean`

  `packaged`

  `private float`

  `painReduction`

  `boolean`

  `poison`

  `private int`

  `poisonDetectionLevel`

  `private int`

  `poisonLevelForRecipe`

  `private int`

  `poisonPower`

  `private float`

  `proteins`

  `private boolean`

  `removeNegativeEffectOnCooked`

  `private List<String>`

  `replaceOnCooked`

  `private String`

  `replaceOnRotten`

  `protected boolean`

  `rotten`

  `private float`

  `rottenTime`

  `(package private) static final short`

  `SLP_COOKING_PARAMETER`

  `(package private) static final short`

  `SLP_COOKING_SOUND`

  `private String`

  `soundLimiterGroupID_Burning`

  `ArrayList<String>`

  `spices`

  `private float`

  `temperatureTimeAccum`

  `float`

  `thirstChange`

  `private int`

  `timeToHatch`

  `private static final zombie.core.utils.UpdateLimit`

  `updateAgeRate`

  `private int`

  `useForPoison`

  `protected String`

  `useOnConsume`

  `private String`

  `worldTextureCooked`

  `private String`

  `worldTextureOverdone`

  `private String`

  `worldTextureRotten`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Food(String module,
  String name,
  String itemType,
  String texName)`

  `Food(String module,
  String name,
  String itemType,
  Item item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canAge()`

  `boolean`

  `canBeFrozen()`

  `boolean`

  `checkEggHatch(IsoHutch hutch)`

  `void`

  `consumeHunger(float realUsedHunger)`

  `void`

  `copyAgeFrom(Food otherFood)`

  `void`

  `copyCookedBurntFrom(Food otherFood)`

  `void`

  `copyExtraItems(Food otherFood)`

  `void`

  `copyFoodFrom(Food otherFood)`

  `void`

  `copyFoodFromSplit(Food otherFood,
  int split)`

  `void`

  `copyFrozenFrom(Food otherFood)`

  `void`

  `copyNutritionFrom(Food otherFood)`

  `void`

  `copyNutritionFromRatio(Food otherFood,
  float ratio)`

  `void`

  `copyNutritionFromSplit(Food otherFood,
  int split)`

  `void`

  `copyPoisonFrom(Food otherFood)`

  `void`

  `copyTemperatureFrom(Food otherFood)`

  `private void`

  `destroyThisItem()`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `boolean`

  `finishupdate()`

  `void`

  `freeze()`

  `float`

  `getActualWeight()`

  `String`

  `getAnimalHatch()`

  `String`

  `getAnimalHatchBreed()`

  `float`

  `getBaseHungChange()`

  Deprecated.

  `float`

  `getBaseHunger()`

  `float`

  `getBoredomChange()`

  `float`

  `getBoredomChangeUnmodified()`

  `float`

  `getCalories()`

  `float`

  `getCarbohydrates()`

  `String`

  `getCategory()`

  `String`

  `getChef()`

  `float`

  `getCompostTime()`

  `String`

  `getCookingSound()`

  `int`

  `getCurrentUses()`

  `float`

  `getCurrentUsesFloat()`

  `String`

  `getCustomEatSound()`

  `float`

  `getEndChange()`

  `float`

  `getEnduranceChange()`

  `float`

  `getEnduranceChangeUnmodified()`

  `int`

  `getFertilizedTime()`

  `int`

  `getFluReduction()`

  `private float`

  `getFoodRotSpeed()`

  `int`

  `getFoodSicknessChange()`

  `String`

  `getFoodType()`

  `float`

  `getFreezingTime()`

  `private float`

  `getFridgeFactor()`

  `float`

  `getHeat()`

  `String`

  `getHerbalistType()`

  `float`

  `getHungChange()`

  `float`

  `getHungerChange()`

  `float`

  `getInvHeat()`

  `int`

  `getLastCookMinute()`

  `float`

  `getLipids()`

  `int`

  `getMaxUses()`

  `int`

  `getMilkQty()`

  `String`

  `getMilkType()`

  `String`

  `getName()`

  `String`

  `getName(IsoPlayer player)`

  `String`

  `getOnCooked()`

  `String`

  `getOnEat()`

  `float`

  `getPainReduction()`

  `int`

  `getPoisonDetectionLevel()`

  `int`

  `getPoisonLevelForRecipe()`

  `int`

  `getPoisonPower()`

  `float`

  `getProteins()`

  `List<String>`

  `getReplaceOnCooked()`

  `String`

  `getReplaceOnRotten()`

  `float`

  `getRottenTime()`

  `float`

  `getScore(SurvivorDesc desc)`

  `String`

  `getSoundLimiterGroupID()`

  `ArrayList<String>`

  `getSpices()`

  `String`

  `getStaticModel()`

  `float`

  `getStressChange()`

  `float`

  `getStressChangeUnmodified()`

  `Texture`

  `getTex()`

  `float`

  `getThirstChange()`

  `float`

  `getThirstChangeUnmodified()`

  `int`

  `getTimeToHatch()`

  `float`

  `getUnhappyChange()`

  `float`

  `getUnhappyChangeUnmodified()`

  `int`

  `getUseForPoison()`

  `String`

  `getUseOnConsume()`

  `float`

  `getWeight()`

  `String`

  `getWorldTexture()`

  `boolean`

  `hasAnimalParts()`

  `void`

  `inheritFoodAgeFrom(InventoryItem otherItem)`

  `void`

  `inheritOlderFoodAge(InventoryItem otherItem)`

  `private void`

  `initAnimalIcons()`

  `boolean`

  `isAnimalSkeleton()`

  `boolean`

  `isBadCold()`

  `boolean`

  `isBadInMicrowave()`

  `boolean`

  `isbDangerousUncooked()`

  `boolean`

  `isCookedInMicrowave()`

  `boolean`

  `isFertilized()`

  `boolean`

  `isFood()`

  `boolean`

  `IsFood()`

  `boolean`

  `isFreezing()`

  `boolean`

  `isFresh()`

  `boolean`

  `isFrozen()`

  `boolean`

  `isGoodHot()`

  `private boolean`

  `isInFreezer(ItemContainer itemContainer)`

  `private boolean`

  `isInFridge(ItemContainer itemContainer)`

  `boolean`

  `isNormalAndFullFood()`

  `boolean`

  `isPackaged()`

  `boolean`

  `isPoison()`

  `boolean`

  `isRemoveNegativeEffectOnCooked()`

  `boolean`

  `isRotten()`

  `boolean`

  `isSpice()`

  `boolean`

  `isTainted()`

  `boolean`

  `isThawing()`

  `boolean`

  `isUncooked()`

  `boolean`

  `isWholeFoodItem()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `multiplyFoodValues(float percentage)`

  `void`

  `OnAddedToContainer(ItemContainer container)`

  `void`

  `OnBeforeRemoveFromContainer(ItemContainer container)`

  `void`

  `registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter limiter)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setAnimalHatch(String animalHatch)`

  `void`

  `setAnimalHatchBreed(String animalHatchBreed)`

  `void`

  `setAutoAge()`

  `void`

  `setBadCold(boolean bBadCold)`

  `void`

  `setBadInMicrowave(boolean badInMicrowave)`

  `void`

  `setBaseHunger(float baseHunger)`

  `void`

  `setbDangerousUncooked(boolean dangerousUncooked)`

  `void`

  `setCalories(float calories)`

  `void`

  `setCanBeFrozen(boolean canBeFrozen)`

  `void`

  `setCarbohydrates(float carbohydrates)`

  `void`

  `setChef(String chef)`

  `void`

  `setCompostTime(float compostTime)`

  `void`

  `setCookedInMicrowave(boolean b)`

  `private void`

  `setCookingParameter(BaseSoundEmitter emitter)`

  `void`

  `setCurrentUses(int newuses)`

  `void`

  `setCustomEatSound(String customEatSound)`

  `void`

  `setEndChange(float endChange)`

  `void`

  `setEnduranceChange(float endChange)`

  `void`

  `setFertilized(boolean fertilized)`

  `void`

  `setFertilizedTime(int time)`

  `void`

  `setFluReduction(int fluReduction)`

  `void`

  `setFoodSicknessChange(int foodSicknessChange)`

  `void`

  `setFoodType(String foodType)`

  `void`

  `setFreezingTime(float freezingTime)`

  `void`

  `setFrozen(boolean frozen)`

  `void`

  `setGoodHot(boolean bGoodHot)`

  `void`

  `setHeat(float heat)`

  `void`

  `setHerbalistType(String type)`

  `void`

  `setHungChange(float hungChange)`

  `void`

  `setLastCookMinute(int lastCookMinute)`

  `void`

  `setLipids(float lipids)`

  `void`

  `setMilkQty(int qty)`

  `void`

  `setMilkType(String type)`

  `void`

  `setOnCooked(String onCooked)`

  `void`

  `setOnEat(String onEat)`

  `void`

  `setPackaged(boolean packaged)`

  `void`

  `setPainReduction(float painReduction)`

  `void`

  `setPoisonDetectionLevel(int poisonDetectionLevel)`

  `void`

  `setPoisonLevelForRecipe(Integer poisonLevelForRecipe)`

  `void`

  `setPoisonPower(int poisonPower)`

  `void`

  `setProteins(float proteins)`

  `void`

  `setRemoveNegativeEffectOnCooked(boolean removeNegativeEffectOnCooked)`

  `void`

  `setReplaceOnCooked(List<String> replaceOnCooked)`

  `void`

  `setReplaceOnRotten(String replaceOnRotten)`

  `void`

  `setRotten(boolean rotten)`

  `void`

  `setRottenTime(float time)`

  `void`

  `setSpice(boolean isSpice)`

  `void`

  `setSpices(ArrayList<String> spices)`

  `void`

  `setTainted(boolean tainted)`

  `void`

  `setThirstChange(float thirstChange)`

  `void`

  `setTimeToHatch(int timeToHatch)`

  `void`

  `setUseForPoison(int useForPoison)`

  `void`

  `setUseOnConsume(String useOnConsume)`

  `private boolean`

  `shouldPlayCookingSound()`

  `boolean`

  `shouldUpdateInWorld()`

  `private void`

  `syncItemFieldForWorldItem()`

  `void`

  `syncItemFields()`

  `void`

  `update()`

  `void`

  `updateAge()`

  `void`

  `updateAge(boolean bSendItemStats)`

  `void`

  `updateClientCookingSounds()`

  `private void`

  `updateFreezing(ItemContainer outermostContainer,
  float worldAgeHours)`

  `private void`

  `updateRotting(ItemContainer outermostContainer)`

  `void`

  `updateSound(BaseSoundEmitter emitter,
  zombie.audio.SoundLimiterParams params)`

  `private void`

  `updateTemperature()`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, getA, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### updateAgeRate

    private static final zombie.core.utils.UpdateLimit updateAgeRate
  + ### badCold

    protected boolean badCold
  + ### goodHot

    protected boolean goodHot
  + ### MIN\_HEAT

    private static final float MIN\_HEAT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.MIN_HEAT)
  + ### MAX\_HEAT

    private static final float MAX\_HEAT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.MAX_HEAT)
  + ### heat

    protected float heat
  + ### endChange

    protected float endChange
  + ### hungChange

    protected float hungChange
  + ### useOnConsume

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") useOnConsume
  + ### rotten

    protected boolean rotten
  + ### dangerousUncooked

    protected boolean dangerousUncooked
  + ### lastCookMinute

    protected int lastCookMinute
  + ### thirstChange

    public float thirstChange
  + ### poison

    public boolean poison
  + ### replaceOnCooked

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> replaceOnCooked
  + ### baseHunger

    private float baseHunger
  + ### spices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> spices
  + ### isSpice

    private boolean isSpice
  + ### isTainted

    private boolean isTainted
  + ### poisonDetectionLevel

    private int poisonDetectionLevel
  + ### poisonLevelForRecipe

    private int poisonLevelForRecipe
  + ### useForPoison

    private int useForPoison
  + ### poisonPower

    private int poisonPower
  + ### foodType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") foodType
  + ### customEatSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customEatSound
  + ### removeNegativeEffectOnCooked

    private boolean removeNegativeEffectOnCooked
  + ### chef

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") chef
  + ### onCooked

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onCooked
  + ### worldTextureCooked

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldTextureCooked
  + ### worldTextureRotten

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldTextureRotten
  + ### worldTextureOverdone

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldTextureOverdone
  + ### fluReduction

    private int fluReduction
  + ### foodSicknessChange

    private int foodSicknessChange
  + ### painReduction

    private float painReduction
  + ### herbalistType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") herbalistType
  + ### carbohydrates

    private float carbohydrates
  + ### lipids

    private float lipids
  + ### proteins

    private float proteins
  + ### calories

    private float calories
  + ### packaged

    private boolean packaged
  + ### freezingTime

    private float freezingTime
  + ### frozen

    private boolean frozen
  + ### canBeFrozen

    private boolean canBeFrozen
  + ### lastFrozenUpdate

    protected float lastFrozenUpdate
  + ### FreezerAgeMultiplier

    public static final float FreezerAgeMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.FreezerAgeMultiplier)
  + ### replaceOnRotten

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnRotten
  + ### forceFoodTypeAsName

    private final boolean forceFoodTypeAsName

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.forceFoodTypeAsName)
  + ### rottenTime

    private float rottenTime
  + ### compostTime

    private float compostTime
  + ### onEat

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onEat
  + ### badInMicrowave

    private boolean badInMicrowave
  + ### cookedInMicrowave

    private boolean cookedInMicrowave
  + ### cookingSound

    private long cookingSound
  + ### cookingParameter

    private int cookingParameter
  + ### soundLimiterGroupID\_Burning

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundLimiterGroupID\_Burning
  + ### milkQty

    private int milkQty
  + ### milkType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") milkType
  + ### fertilized

    private boolean fertilized
  + ### fertilizedTime

    private int fertilizedTime
  + ### timeToHatch

    private int timeToHatch
  + ### animalHatch

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalHatch
  + ### animalHatchBreed

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalHatchBreed
  + ### lastEggTimeCheck

    private long lastEggTimeCheck
  + ### motherId

    public int motherId
  + ### eggGenome

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](../../characters/animals/AnimalGene.html "class in zombie.characters.animals")> eggGenome
  + ### temperatureTimeAccum

    private float temperatureTimeAccum
  + ### COOKING\_STATE\_COOKING

    private static final int COOKING\_STATE\_COOKING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.COOKING_STATE_COOKING)
  + ### COOKING\_STATE\_BURNING

    private static final int COOKING\_STATE\_BURNING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.COOKING_STATE_BURNING)
  + ### floorContainer

    private static final [ItemContainer](../ItemContainer.html "class in zombie.inventory") floorContainer
  + ### SLP\_COOKING\_SOUND

    static final short SLP\_COOKING\_SOUND

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.SLP_COOKING_SOUND)
  + ### SLP\_COOKING\_PARAMETER

    static final short SLP\_COOKING\_PARAMETER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Food.SLP_COOKING_PARAMETER)
* Constructor Details
  -------------------

  + ### Food

    public Food([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
  + ### Food

    public Food([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `InventoryItem`
  + ### IsFood

    public boolean IsFood()

    Overrides:
    :   `IsFood` in class `InventoryItem`
  + ### checkEggHatch

    public boolean checkEggHatch([IsoHutch](../../iso/objects/IsoHutch.html "class in zombie.iso.objects") hutch)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `InventoryItem`
  + ### getSoundLimiterGroupID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundLimiterGroupID()

    Overrides:
    :   `getSoundLimiterGroupID` in class `InventoryItem`
  + ### registerWithSoundLimiter

    public void registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter limiter)

    Overrides:
    :   `registerWithSoundLimiter` in class `InventoryItem`
  + ### updateSound

    public void updateSound([BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter,
    zombie.audio.SoundLimiterParams params)

    Overrides:
    :   `updateSound` in class `InventoryItem`
  + ### shouldPlayCookingSound

    private boolean shouldPlayCookingSound()
  + ### setCookingParameter

    private void setCookingParameter([BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### updateClientCookingSounds

    public void updateClientCookingSounds()
  + ### updateTemperature

    private void updateTemperature()
  + ### updateRotting

    private void updateRotting([ItemContainer](../ItemContainer.html "class in zombie.inventory") outermostContainer)
  + ### getFridgeFactor

    private float getFridgeFactor()
  + ### getFoodRotSpeed

    private float getFoodRotSpeed()
  + ### updateAge

    public void updateAge()

    Overrides:
    :   `updateAge` in class `InventoryItem`
  + ### updateAge

    public void updateAge(boolean bSendItemStats)
  + ### setAutoAge

    public void setAutoAge()

    Overrides:
    :   `setAutoAge` in class `InventoryItem`
  + ### updateFreezing

    private void updateFreezing([ItemContainer](../ItemContainer.html "class in zombie.inventory") outermostContainer,
    float worldAgeHours)
  + ### getActualWeight

    public float getActualWeight()

    Overrides:
    :   `getActualWeight` in class `InventoryItem`
  + ### getWeight

    public float getWeight()

    Overrides:
    :   `getWeight` in class `InventoryItem`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `InventoryItem`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `InventoryItem`

    Throws:
    :   `IOException`
  + ### finishupdate

    public boolean finishupdate()

    Overrides:
    :   `finishupdate` in class `InventoryItem`
  + ### shouldUpdateInWorld

    public boolean shouldUpdateInWorld()

    Overrides:
    :   `shouldUpdateInWorld` in class `InventoryItem`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `InventoryItem`
  + ### getEnduranceChange

    public float getEnduranceChange()
  + ### setEnduranceChange

    public void setEnduranceChange(float endChange)
  + ### getUnhappyChange

    public float getUnhappyChange()

    Overrides:
    :   `getUnhappyChange` in class `InventoryItem`
  + ### getBoredomChange

    public float getBoredomChange()

    Overrides:
    :   `getBoredomChange` in class `InventoryItem`
  + ### getHungerChange

    public float getHungerChange()
  + ### getStressChange

    public float getStressChange()

    Overrides:
    :   `getStressChange` in class `InventoryItem`
  + ### getBoredomChangeUnmodified

    public float getBoredomChangeUnmodified()
  + ### getEnduranceChangeUnmodified

    public float getEnduranceChangeUnmodified()
  + ### getStressChangeUnmodified

    public float getStressChangeUnmodified()
  + ### getThirstChangeUnmodified

    public float getThirstChangeUnmodified()
  + ### getUnhappyChangeUnmodified

    public float getUnhappyChangeUnmodified()
  + ### getScore

    public float getScore([SurvivorDesc](../../characters/SurvivorDesc.html "class in zombie.characters") desc)

    Overrides:
    :   `getScore` in class `InventoryItem`
  + ### isBadCold

    public boolean isBadCold()
  + ### setBadCold

    public void setBadCold(boolean bBadCold)
  + ### isGoodHot

    public boolean isGoodHot()
  + ### setGoodHot

    public void setGoodHot(boolean bGoodHot)
  + ### isCookedInMicrowave

    public boolean isCookedInMicrowave()
  + ### setCookedInMicrowave

    public void setCookedInMicrowave(boolean b)
  + ### getHeat

    public float getHeat()
  + ### getInvHeat

    public float getInvHeat()

    Overrides:
    :   `getInvHeat` in class `InventoryItem`
  + ### setHeat

    public void setHeat(float heat)
  + ### getEndChange

    public float getEndChange()
  + ### setEndChange

    public void setEndChange(float endChange)
  + ### getBaseHungChange

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public float getBaseHungChange()

    Deprecated.
  + ### getHungChange

    public float getHungChange()
  + ### setHungChange

    public void setHungChange(float hungChange)
  + ### getUseOnConsume

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUseOnConsume()
  + ### setUseOnConsume

    public void setUseOnConsume([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") useOnConsume)
  + ### isRotten

    public boolean isRotten()
  + ### isFresh

    public boolean isFresh()
  + ### setRotten

    public void setRotten(boolean rotten)
  + ### isbDangerousUncooked

    public boolean isbDangerousUncooked()
  + ### setbDangerousUncooked

    public void setbDangerousUncooked(boolean dangerousUncooked)
  + ### getLastCookMinute

    public int getLastCookMinute()
  + ### setLastCookMinute

    public void setLastCookMinute(int lastCookMinute)
  + ### getThirstChange

    public float getThirstChange()
  + ### setThirstChange

    public void setThirstChange(float thirstChange)
  + ### setReplaceOnCooked

    public void setReplaceOnCooked([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> replaceOnCooked)
  + ### getReplaceOnCooked

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getReplaceOnCooked()
  + ### getBaseHunger

    public float getBaseHunger()
  + ### setBaseHunger

    public void setBaseHunger(float baseHunger)
  + ### isSpice

    public boolean isSpice()

    Overrides:
    :   `isSpice` in class `InventoryItem`
  + ### setSpice

    public void setSpice(boolean isSpice)
  + ### isPoison

    public boolean isPoison()
  + ### getPoisonDetectionLevel

    public int getPoisonDetectionLevel()
  + ### setPoisonDetectionLevel

    public void setPoisonDetectionLevel(int poisonDetectionLevel)
  + ### getPoisonLevelForRecipe

    public int getPoisonLevelForRecipe()
  + ### setPoisonLevelForRecipe

    public void setPoisonLevelForRecipe([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") poisonLevelForRecipe)
  + ### getUseForPoison

    public int getUseForPoison()
  + ### setUseForPoison

    public void setUseForPoison(int useForPoison)
  + ### getPoisonPower

    public int getPoisonPower()
  + ### setPoisonPower

    public void setPoisonPower(int poisonPower)
  + ### getFoodType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFoodType()
  + ### setFoodType

    public void setFoodType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") foodType)
  + ### isRemoveNegativeEffectOnCooked

    public boolean isRemoveNegativeEffectOnCooked()
  + ### setRemoveNegativeEffectOnCooked

    public void setRemoveNegativeEffectOnCooked(boolean removeNegativeEffectOnCooked)
  + ### getCookingSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCookingSound()
  + ### getCustomEatSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomEatSound()
  + ### setCustomEatSound

    public void setCustomEatSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customEatSound)
  + ### getChef

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChef()
  + ### setChef

    public void setChef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") chef)
  + ### getOnCooked

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnCooked()
  + ### setOnCooked

    public void setOnCooked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onCooked)
  + ### getHerbalistType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHerbalistType()
  + ### setHerbalistType

    public void setHerbalistType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getSpices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSpices()
  + ### setSpices

    public void setSpices([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> spices)
  + ### getTex

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTex()

    Overrides:
    :   `getTex` in class `InventoryItem`
  + ### getWorldTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldTexture()

    Overrides:
    :   `getWorldTexture` in class `InventoryItem`
  + ### getStaticModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStaticModel()

    Overrides:
    :   `getStaticModel` in class `InventoryItem`
  + ### getFoodSicknessChange

    public int getFoodSicknessChange()

    Overrides:
    :   `getFoodSicknessChange` in class `InventoryItem`
  + ### setFoodSicknessChange

    public void setFoodSicknessChange(int foodSicknessChange)

    Overrides:
    :   `setFoodSicknessChange` in class `InventoryItem`
  + ### getFluReduction

    public int getFluReduction()
  + ### setFluReduction

    public void setFluReduction(int fluReduction)
  + ### getPainReduction

    public float getPainReduction()
  + ### setPainReduction

    public void setPainReduction(float painReduction)
  + ### getCarbohydrates

    public float getCarbohydrates()
  + ### setCarbohydrates

    public void setCarbohydrates(float carbohydrates)
  + ### getLipids

    public float getLipids()
  + ### setLipids

    public void setLipids(float lipids)
  + ### getProteins

    public float getProteins()
  + ### setProteins

    public void setProteins(float proteins)
  + ### getCalories

    public float getCalories()
  + ### setCalories

    public void setCalories(float calories)
  + ### isPackaged

    public boolean isPackaged()
  + ### setPackaged

    public void setPackaged(boolean packaged)
  + ### getFreezingTime

    public float getFreezingTime()
  + ### setFreezingTime

    public void setFreezingTime(float freezingTime)
  + ### freeze

    public void freeze()
  + ### isFrozen

    public boolean isFrozen()
  + ### setFrozen

    public void setFrozen(boolean frozen)
  + ### canBeFrozen

    public boolean canBeFrozen()
  + ### setCanBeFrozen

    public void setCanBeFrozen(boolean canBeFrozen)
  + ### isFreezing

    public boolean isFreezing()
  + ### isThawing

    public boolean isThawing()
  + ### getMaxUses

    public int getMaxUses()

    Overrides:
    :   `getMaxUses` in class `InventoryItem`
  + ### getCurrentUses

    public int getCurrentUses()

    Overrides:
    :   `getCurrentUses` in class `InventoryItem`
  + ### setCurrentUses

    public void setCurrentUses(int newuses)

    Overrides:
    :   `setCurrentUses` in class `InventoryItem`
  + ### getCurrentUsesFloat

    public float getCurrentUsesFloat()

    Overrides:
    :   `getCurrentUsesFloat` in class `InventoryItem`
  + ### syncItemFields

    public void syncItemFields()

    Overrides:
    :   `syncItemFields` in class `InventoryItem`
  + ### syncItemFieldForWorldItem

    private void syncItemFieldForWorldItem()
  + ### getReplaceOnRotten

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnRotten()
  + ### setReplaceOnRotten

    public void setReplaceOnRotten([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnRotten)
  + ### multiplyFoodValues

    public void multiplyFoodValues(float percentage)
  + ### getRottenTime

    public float getRottenTime()
  + ### setRottenTime

    public void setRottenTime(float time)
  + ### getCompostTime

    public float getCompostTime()
  + ### setCompostTime

    public void setCompostTime(float compostTime)
  + ### getOnEat

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnEat()
  + ### setOnEat

    public void setOnEat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onEat)
  + ### isBadInMicrowave

    public boolean isBadInMicrowave()
  + ### setBadInMicrowave

    public void setBadInMicrowave(boolean badInMicrowave)
  + ### isTainted

    public boolean isTainted()
  + ### setTainted

    public void setTainted(boolean tainted)
  + ### destroyThisItem

    private void destroyThisItem()
  + ### setMilkQty

    public void setMilkQty(int qty)
  + ### getMilkQty

    public int getMilkQty()
  + ### setMilkType

    public void setMilkType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getMilkType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMilkType()
  + ### isFertilized

    public boolean isFertilized()
  + ### setFertilized

    public void setFertilized(boolean fertilized)
  + ### getAnimalHatch

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalHatch()
  + ### setAnimalHatch

    public void setAnimalHatch([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalHatch)
  + ### getAnimalHatchBreed

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalHatchBreed()
  + ### setAnimalHatchBreed

    public void setAnimalHatchBreed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalHatchBreed)
  + ### getTimeToHatch

    public int getTimeToHatch()
  + ### setTimeToHatch

    public void setTimeToHatch(int timeToHatch)
  + ### isNormalAndFullFood

    public boolean isNormalAndFullFood()
  + ### isWholeFoodItem

    public boolean isWholeFoodItem()
  + ### isUncooked

    public boolean isUncooked()
  + ### OnAddedToContainer

    public void OnAddedToContainer([ItemContainer](../ItemContainer.html "class in zombie.inventory") container)

    Overrides:
    :   `OnAddedToContainer` in class `InventoryItem`
  + ### OnBeforeRemoveFromContainer

    public void OnBeforeRemoveFromContainer([ItemContainer](../ItemContainer.html "class in zombie.inventory") container)

    Overrides:
    :   `OnBeforeRemoveFromContainer` in class `InventoryItem`
  + ### getFertilizedTime

    public int getFertilizedTime()
  + ### setFertilizedTime

    public void setFertilizedTime(int time)
  + ### inheritFoodAgeFrom

    public void inheritFoodAgeFrom([InventoryItem](../InventoryItem.html "class in zombie.inventory") otherItem)

    Overrides:
    :   `inheritFoodAgeFrom` in class `InventoryItem`
  + ### inheritOlderFoodAge

    public void inheritOlderFoodAge([InventoryItem](../InventoryItem.html "class in zombie.inventory") otherItem)

    Overrides:
    :   `inheritOlderFoodAge` in class `InventoryItem`
  + ### hasAnimalParts

    public boolean hasAnimalParts()
  + ### isAnimalSkeleton

    public boolean isAnimalSkeleton()
  + ### canAge

    public boolean canAge()
  + ### isFood

    public boolean isFood()

    Overrides:
    :   `isFood` in class `InventoryItem`
  + ### copyFrozenFrom

    public void copyFrozenFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyCookedBurntFrom

    public void copyCookedBurntFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyTemperatureFrom

    public void copyTemperatureFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyPoisonFrom

    public void copyPoisonFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyAgeFrom

    public void copyAgeFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyNutritionFrom

    public void copyNutritionFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyNutritionFromSplit

    public void copyNutritionFromSplit([Food](Food.html "class in zombie.inventory.types") otherFood,
    int split)
  + ### copyNutritionFromRatio

    public void copyNutritionFromRatio([Food](Food.html "class in zombie.inventory.types") otherFood,
    float ratio)
  + ### copyFoodFrom

    public void copyFoodFrom([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyExtraItems

    public void copyExtraItems([Food](Food.html "class in zombie.inventory.types") otherFood)
  + ### copyFoodFromSplit

    public void copyFoodFromSplit([Food](Food.html "class in zombie.inventory.types") otherFood,
    int split)
  + ### consumeHunger

    public void consumeHunger(float realUsedHunger)
  + ### isInFridge

    private boolean isInFridge([ItemContainer](../ItemContainer.html "class in zombie.inventory") itemContainer)
  + ### isInFreezer

    private boolean isInFreezer([ItemContainer](../ItemContainer.html "class in zombie.inventory") itemContainer)
  + ### initAnimalIcons

    private void initAnimalIcons()