[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Clothing](Clothing.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [temperature](#temperature)
   2. [insulation](#insulation)
   3. [windresistance](#windresistance)
   4. [waterResistance](#waterResistance)
   5. [patches](#patches)
   6. [spriteName](#spriteName)
   7. [palette](#palette)
   8. [bloodLevel](#bloodLevel)
   9. [dirtyness](#dirtyness)
   10. [wetness](#wetness)
   11. [weightWet](#weightWet)
   12. [lastWetnessUpdate](#lastWetnessUpdate)
   13. [conditionLowerChance](#conditionLowerChance)
   14. [stompPower](#stompPower)
   15. [runSpeedModifier](#runSpeedModifier)
   16. [combatSpeedModifier](#combatSpeedModifier)
   17. [removeOnBroken](#removeOnBroken)
   18. [canHaveHoles](#canHaveHoles)
   19. [biteDefense](#biteDefense)
   20. [scratchDefense](#scratchDefense)
   21. [bulletDefense](#bulletDefense)
   22. [CONDITION\_PER\_HOLES](#CONDITION_PER_HOLES)
   23. [neckProtectionModifier](#neckProtectionModifier)
   24. [chanceToFall](#chanceToFall)
   25. [lastGasMaskSyncMinute](#lastGasMaskSyncMinute)
7. [Constructor Details](#constructor-detail)
   1. [Clothing(String, String, String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [Clothing(String, String, String, Item, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item,java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [getCategory()](#getCategory())
   2. [IsClothing()](#IsClothing())
   3. [Unwear()](#Unwear())
   4. [Unwear(boolean)](#Unwear(boolean))
   5. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   6. [isDirty()](#isDirty())
   7. [isBloody()](#isBloody())
   8. [getName()](#getName())
   9. [getName(IsoPlayer)](#getName(zombie.characters.IsoPlayer))
   10. [update()](#update())
   11. [updateWetness()](#updateWetness())
   12. [updateWetness(boolean)](#updateWetness(boolean))
   13. [getBulletDefense()](#getBulletDefense())
   14. [setBulletDefense(float)](#setBulletDefense(float))
   15. [getWetDryState()](#getWetDryState())
   16. [flushWetness()](#flushWetness())
   17. [finishupdate()](#finishupdate())
   18. [Use(boolean, boolean)](#Use(boolean,boolean))
   19. [CanStack(InventoryItem)](#CanStack(zombie.inventory.InventoryItem))
   20. [CreateFromSprite(String)](#CreateFromSprite(java.lang.String))
   21. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   22. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   23. [getSpriteName()](#getSpriteName())
   24. [setSpriteName(String)](#setSpriteName(java.lang.String))
   25. [getPalette()](#getPalette())
   26. [setPalette(String)](#setPalette(java.lang.String))
   27. [getTemperature()](#getTemperature())
   28. [setTemperature(float)](#setTemperature(float))
   29. [setDirtiness(float)](#setDirtiness(float))
   30. [setBloodLevel(float)](#setBloodLevel(float))
   31. [getDirtiness()](#getDirtiness())
   32. [getBloodlevel()](#getBloodlevel())
   33. [getBloodlevelForPart(BloodBodyPartType)](#getBloodlevelForPart(zombie.characterTextures.BloodBodyPartType))
   34. [getBloodLevel()](#getBloodLevel())
   35. [getBloodLevelForPart(BloodBodyPartType)](#getBloodLevelForPart(zombie.characterTextures.BloodBodyPartType))
   36. [getWeight()](#getWeight())
   37. [setWetness(float)](#setWetness(float))
   38. [getWetness()](#getWetness())
   39. [getWeightWet()](#getWeightWet())
   40. [setWeightWet(float)](#setWeightWet(float))
   41. [getConditionLowerChance()](#getConditionLowerChance())
   42. [setConditionLowerChance(int)](#setConditionLowerChance(int))
   43. [setCondition(int)](#setCondition(int))
   44. [getClothingDirtynessIncreaseLevel()](#getClothingDirtynessIncreaseLevel())
   45. [getInsulation()](#getInsulation())
   46. [setInsulation(float)](#setInsulation(float))
   47. [getStompPower()](#getStompPower())
   48. [setStompPower(float)](#setStompPower(float))
   49. [getRunSpeedModifier()](#getRunSpeedModifier())
   50. [setRunSpeedModifier(float)](#setRunSpeedModifier(float))
   51. [getCombatSpeedModifier()](#getCombatSpeedModifier())
   52. [setCombatSpeedModifier(float)](#setCombatSpeedModifier(float))
   53. [isRemoveOnBroken()](#isRemoveOnBroken())
   54. [setRemoveOnBroken(Boolean)](#setRemoveOnBroken(java.lang.Boolean))
   55. [getCanHaveHoles()](#getCanHaveHoles())
   56. [setCanHaveHoles(Boolean)](#setCanHaveHoles(java.lang.Boolean))
   57. [isCosmetic()](#isCosmetic())
   58. [toString()](#toString())
   59. [getBiteDefense()](#getBiteDefense())
   60. [setBiteDefense(float)](#setBiteDefense(float))
   61. [getScratchDefense()](#getScratchDefense())
   62. [setScratchDefense(float)](#setScratchDefense(float))
   63. [getNeckProtectionModifier()](#getNeckProtectionModifier())
   64. [setNeckProtectionModifier(float)](#setNeckProtectionModifier(float))
   65. [getChanceToFall()](#getChanceToFall())
   66. [setChanceToFall(int)](#setChanceToFall(int))
   67. [getWindresistance()](#getWindresistance())
   68. [setWindresistance(float)](#setWindresistance(float))
   69. [getWaterResistance()](#getWaterResistance())
   70. [setWaterResistance(float)](#setWaterResistance(float))
   71. [getHolesNumber()](#getHolesNumber())
   72. [getPatchesNumber()](#getPatchesNumber())
   73. [getDefForPart(BloodBodyPartType, boolean, boolean)](#getDefForPart(zombie.characterTextures.BloodBodyPartType,boolean,boolean))
   74. [getBiteDefenseFromItem(IsoGameCharacter, InventoryItem)](#getBiteDefenseFromItem(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   75. [getScratchDefenseFromItem(IsoGameCharacter, InventoryItem)](#getScratchDefenseFromItem(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   76. [getPatchType(BloodBodyPartType)](#getPatchType(zombie.characterTextures.BloodBodyPartType))
   77. [removePatch(BloodBodyPartType)](#removePatch(zombie.characterTextures.BloodBodyPartType))
   78. [removeAllPatches()](#removeAllPatches())
   79. [canFullyRestore(IsoGameCharacter, BloodBodyPartType, InventoryItem)](#canFullyRestore(zombie.characters.IsoGameCharacter,zombie.characterTextures.BloodBodyPartType,zombie.inventory.InventoryItem))
   80. [fullyRestore()](#fullyRestore())
   81. [addPatchForSync(int, int, int, boolean)](#addPatchForSync(int,int,int,boolean))
   82. [addPatch(IsoGameCharacter, BloodBodyPartType, InventoryItem)](#addPatch(zombie.characters.IsoGameCharacter,zombie.characterTextures.BloodBodyPartType,zombie.inventory.InventoryItem))
   83. [getCoveredParts()](#getCoveredParts())
   84. [getNbrOfCoveredParts()](#getNbrOfCoveredParts())
   85. [getCondLossPerHole()](#getCondLossPerHole())
   86. [copyPatchesTo(Clothing)](#copyPatchesTo(zombie.inventory.types.Clothing))
   87. [getClothingExtraSubmenu()](#getClothingExtraSubmenu())
   88. [canBe3DRender()](#canBe3DRender())
   89. [isWorn()](#isWorn())
   90. [addRandomHole()](#addRandomHole())
   91. [addRandomDirt()](#addRandomDirt())
   92. [addRandomBlood()](#addRandomBlood())
   93. [randomizeCondition(int, int, int, int)](#randomizeCondition(int,int,int,int))
   94. [hasFilter()](#hasFilter())
   95. [setNoFilter()](#setNoFilter())
   96. [getFilterType()](#getFilterType())
   97. [setFilterType(String)](#setFilterType(java.lang.String))
   98. [hasTank()](#hasTank())
   99. [setNoTank()](#setNoTank())
   100. [getTankType()](#getTankType())
   101. [setTankType(String)](#setTankType(java.lang.String))
   102. [getAlternateModelName()](#getAlternateModelName())
   103. [getUsedDelta()](#getUsedDelta())
   104. [setUsedDelta(float)](#setUsedDelta(float))
   105. [getUseDelta()](#getUseDelta())
   106. [drainGasMask()](#drainGasMask())
   107. [drainGasMask(float)](#drainGasMask(float))
   108. [drainSCBA()](#drainSCBA())
   109. [getCorpseSicknessDefense()](#getCorpseSicknessDefense())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Clothing
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.Clothing

Direct Known Subclasses:
:   `AlarmClockClothing`

---

public class Clothing
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `Clothing.ClothingPatch`

  `static enum`

  `Clothing.ClothingPatchFabricType`

  `private static enum`

  `Clothing.WetDryState`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `biteDefense`

  `float`

  `bloodLevel`

  `private float`

  `bulletDefense`

  `private Boolean`

  `canHaveHoles`

  `private int`

  `chanceToFall`

  `private float`

  `combatSpeedModifier`

  `static final int`

  `CONDITION_PER_HOLES`

  `private int`

  `conditionLowerChance`

  `private float`

  `dirtyness`

  `private float`

  `insulation`

  `private int`

  `lastGasMaskSyncMinute`

  `private float`

  `lastWetnessUpdate`

  `private float`

  `neckProtectionModifier`

  `protected String`

  `palette`

  `private HashMap<Integer, Clothing.ClothingPatch>`

  `patches`

  `private Boolean`

  `removeOnBroken`

  `private float`

  `runSpeedModifier`

  `private float`

  `scratchDefense`

  `protected String`

  `spriteName`

  `private float`

  `stompPower`

  `private float`

  `temperature`

  `private float`

  `waterResistance`

  `private float`

  `weightWet`

  `private float`

  `wetness`

  `private float`

  `windresistance`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Clothing(String module,
  String name,
  String itemType,
  String texName,
  String palette,
  String spriteName)`

  `Clothing(String module,
  String name,
  String itemType,
  Item item,
  String palette,
  String spriteName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPatch(IsoGameCharacter chr,
  BloodBodyPartType part,
  InventoryItem fabric)`

  `void`

  `addPatchForSync(int partIdx,
  int tailorLvl,
  int fabricType,
  boolean hasHole)`

  `void`

  `addRandomBlood()`

  `void`

  `addRandomDirt()`

  `void`

  `addRandomHole()`

  `boolean`

  `canBe3DRender()`

  `boolean`

  `canFullyRestore(IsoGameCharacter chr,
  BloodBodyPartType part,
  InventoryItem fabric)`

  `boolean`

  `CanStack(InventoryItem item)`

  `void`

  `copyPatchesTo(Clothing newClothing)`

  `static Clothing`

  `CreateFromSprite(String sprite)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `drainGasMask()`

  `void`

  `drainGasMask(float rate)`

  `void`

  `drainSCBA()`

  `boolean`

  `finishupdate()`

  `void`

  `flushWetness()`

  `void`

  `fullyRestore()`

  `String`

  `getAlternateModelName()`

  `float`

  `getBiteDefense()`

  `static int`

  `getBiteDefenseFromItem(IsoGameCharacter chr,
  InventoryItem fabric)`

  `float`

  `getBloodlevel()`

  `float`

  `getBloodLevel()`

  `float`

  `getBloodlevelForPart(BloodBodyPartType part)`

  `float`

  `getBloodLevelForPart(BloodBodyPartType part)`

  `float`

  `getBulletDefense()`

  `Boolean`

  `getCanHaveHoles()`

  `String`

  `getCategory()`

  `int`

  `getChanceToFall()`

  `float`

  `getClothingDirtynessIncreaseLevel()`

  `String`

  `getClothingExtraSubmenu()`

  `float`

  `getCombatSpeedModifier()`

  `int`

  `getConditionLowerChance()`

  `float`

  `getCondLossPerHole()`

  `float`

  `getCorpseSicknessDefense()`

  `ArrayList<BloodBodyPartType>`

  `getCoveredParts()`

  `float`

  `getDefForPart(BloodBodyPartType part,
  boolean bite,
  boolean bullet)`

  `float`

  `getDirtiness()`

  `String`

  `getFilterType()`

  `int`

  `getHolesNumber()`

  `float`

  `getInsulation()`

  `String`

  `getName()`

  `String`

  `getName(IsoPlayer player)`

  `int`

  `getNbrOfCoveredParts()`

  `float`

  `getNeckProtectionModifier()`

  `String`

  `getPalette()`

  `int`

  `getPatchesNumber()`

  `Clothing.ClothingPatch`

  `getPatchType(BloodBodyPartType part)`

  `float`

  `getRunSpeedModifier()`

  `float`

  `getScratchDefense()`

  `static int`

  `getScratchDefenseFromItem(IsoGameCharacter chr,
  InventoryItem fabric)`

  `String`

  `getSpriteName()`

  `float`

  `getStompPower()`

  `String`

  `getTankType()`

  `float`

  `getTemperature()`

  `float`

  `getUsedDelta()`

  `float`

  `getUseDelta()`

  `float`

  `getWaterResistance()`

  `float`

  `getWeight()`

  `float`

  `getWeightWet()`

  `private Clothing.WetDryState`

  `getWetDryState()`

  `float`

  `getWetness()`

  `float`

  `getWindresistance()`

  `boolean`

  `hasFilter()`

  `boolean`

  `hasTank()`

  `boolean`

  `isBloody()`

  `boolean`

  `IsClothing()`

  `boolean`

  `isCosmetic()`

  `boolean`

  `isDirty()`

  `Boolean`

  `isRemoveOnBroken()`

  `boolean`

  `isWorn()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `randomizeCondition(int wetChance,
  int dirtChance,
  int bloodChance,
  int holeChance)`

  `void`

  `removeAllPatches()`

  `void`

  `removePatch(BloodBodyPartType part)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setBiteDefense(float biteDefense)`

  `void`

  `setBloodLevel(float delta)`

  `void`

  `setBulletDefense(float bulletDefense)`

  `void`

  `setCanHaveHoles(Boolean canHaveHoles)`

  `void`

  `setChanceToFall(int chanceToFall)`

  `void`

  `setCombatSpeedModifier(float combatSpeedModifier)`

  `void`

  `setCondition(int condition)`

  `void`

  `setConditionLowerChance(int conditionLowerChance)`

  `void`

  `setDirtiness(float delta)`

  `void`

  `setFilterType(String filterType)`

  `void`

  `setInsulation(float insulation)`

  `void`

  `setNeckProtectionModifier(float neckProtectionModifier)`

  `void`

  `setNoFilter()`

  `void`

  `setNoTank()`

  `void`

  `setPalette(String palette)`

  `void`

  `setRemoveOnBroken(Boolean removeOnBroken)`

  `void`

  `setRunSpeedModifier(float runSpeedModifier)`

  `void`

  `setScratchDefense(float scratchDefense)`

  `void`

  `setSpriteName(String spriteName)`

  `void`

  `setStompPower(float stompPower)`

  `void`

  `setTankType(String tankType)`

  `void`

  `setTemperature(float temperature)`

  `void`

  `setUsedDelta(float usedDelta)`

  `void`

  `setWaterResistance(float waterResistance)`

  `void`

  `setWeightWet(float weight)`

  `void`

  `setWetness(float percent)`

  `void`

  `setWindresistance(float windresistance)`

  `String`

  `toString()`

  `void`

  `Unwear()`

  `void`

  `Unwear(boolean drop)`

  `void`

  `update()`

  `void`

  `updateWetness()`

  `void`

  `updateWetness(boolean bIgnoreEquipped)`

  `void`

  `Use(boolean bCrafting,
  boolean bInContainer)`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCurrentUsesFloat, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWetCooldown, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBodyLocation, isBroken, isBurnt, isCanBandage, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### temperature

    private float temperature
  + ### insulation

    private float insulation
  + ### windresistance

    private float windresistance
  + ### waterResistance

    private float waterResistance
  + ### patches

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [Clothing.ClothingPatch](Clothing.ClothingPatch.html "class in zombie.inventory.types")> patches
  + ### spriteName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName
  + ### palette

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette
  + ### bloodLevel

    public float bloodLevel
  + ### dirtyness

    private float dirtyness
  + ### wetness

    private float wetness
  + ### weightWet

    private float weightWet
  + ### lastWetnessUpdate

    private float lastWetnessUpdate
  + ### conditionLowerChance

    private int conditionLowerChance
  + ### stompPower

    private float stompPower
  + ### runSpeedModifier

    private float runSpeedModifier
  + ### combatSpeedModifier

    private float combatSpeedModifier
  + ### removeOnBroken

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") removeOnBroken
  + ### canHaveHoles

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") canHaveHoles
  + ### biteDefense

    private float biteDefense
  + ### scratchDefense

    private float scratchDefense
  + ### bulletDefense

    private float bulletDefense
  + ### CONDITION\_PER\_HOLES

    public static final int CONDITION\_PER\_HOLES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Clothing.CONDITION_PER_HOLES)
  + ### neckProtectionModifier

    private float neckProtectionModifier
  + ### chanceToFall

    private int chanceToFall
  + ### lastGasMaskSyncMinute

    private int lastGasMaskSyncMinute
* Constructor Details
  -------------------

  + ### Clothing

    public Clothing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### Clothing

    public Clothing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
* Method Details
  --------------

  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `InventoryItem`
  + ### IsClothing

    public boolean IsClothing()

    Overrides:
    :   `IsClothing` in class `InventoryItem`
  + ### Unwear

    public void Unwear()
  + ### Unwear

    public void Unwear(boolean drop)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `InventoryItem`
  + ### isDirty

    public boolean isDirty()
  + ### isBloody

    public boolean isBloody()

    Overrides:
    :   `isBloody` in class `InventoryItem`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `InventoryItem`
  + ### updateWetness

    public void updateWetness()
  + ### updateWetness

    public void updateWetness(boolean bIgnoreEquipped)
  + ### getBulletDefense

    public float getBulletDefense()
  + ### setBulletDefense

    public void setBulletDefense(float bulletDefense)
  + ### getWetDryState

    private [Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types") getWetDryState()
  + ### flushWetness

    public void flushWetness()
  + ### finishupdate

    public boolean finishupdate()

    Overrides:
    :   `finishupdate` in class `InventoryItem`
  + ### Use

    public void Use(boolean bCrafting,
    boolean bInContainer)
  + ### CanStack

    public boolean CanStack([InventoryItem](../InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `CanStack` in class `InventoryItem`
  + ### CreateFromSprite

    public static [Clothing](Clothing.html "class in zombie.inventory.types") CreateFromSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
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
  + ### getSpriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpriteName()
  + ### setSpriteName

    public void setSpriteName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### getPalette

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPalette()
  + ### setPalette

    public void setPalette([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette)
  + ### getTemperature

    public float getTemperature()
  + ### setTemperature

    public void setTemperature(float temperature)
  + ### setDirtiness

    public void setDirtiness(float delta)
  + ### setBloodLevel

    public void setBloodLevel(float delta)

    Overrides:
    :   `setBloodLevel` in class `InventoryItem`
  + ### getDirtiness

    public float getDirtiness()
  + ### getBloodlevel

    public float getBloodlevel()
  + ### getBloodlevelForPart

    public float getBloodlevelForPart([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### getBloodLevel

    public float getBloodLevel()

    Overrides:
    :   `getBloodLevel` in class `InventoryItem`
  + ### getBloodLevelForPart

    public float getBloodLevelForPart([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### getWeight

    public float getWeight()

    Overrides:
    :   `getWeight` in class `InventoryItem`
  + ### setWetness

    public void setWetness(float percent)
  + ### getWetness

    public float getWetness()

    Overrides:
    :   `getWetness` in class `InventoryItem`
  + ### getWeightWet

    public float getWeightWet()
  + ### setWeightWet

    public void setWeightWet(float weight)
  + ### getConditionLowerChance

    public int getConditionLowerChance()

    Overrides:
    :   `getConditionLowerChance` in class `InventoryItem`
  + ### setConditionLowerChance

    public void setConditionLowerChance(int conditionLowerChance)
  + ### setCondition

    public void setCondition(int condition)

    Overrides:
    :   `setCondition` in class `InventoryItem`
  + ### getClothingDirtynessIncreaseLevel

    public float getClothingDirtynessIncreaseLevel()
  + ### getInsulation

    public float getInsulation()
  + ### setInsulation

    public void setInsulation(float insulation)
  + ### getStompPower

    public float getStompPower()
  + ### setStompPower

    public void setStompPower(float stompPower)
  + ### getRunSpeedModifier

    public float getRunSpeedModifier()
  + ### setRunSpeedModifier

    public void setRunSpeedModifier(float runSpeedModifier)
  + ### getCombatSpeedModifier

    public float getCombatSpeedModifier()
  + ### setCombatSpeedModifier

    public void setCombatSpeedModifier(float combatSpeedModifier)
  + ### isRemoveOnBroken

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isRemoveOnBroken()
  + ### setRemoveOnBroken

    public void setRemoveOnBroken([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") removeOnBroken)
  + ### getCanHaveHoles

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getCanHaveHoles()
  + ### setCanHaveHoles

    public void setCanHaveHoles([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") canHaveHoles)
  + ### isCosmetic

    public boolean isCosmetic()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `InventoryItem`
  + ### getBiteDefense

    public float getBiteDefense()
  + ### setBiteDefense

    public void setBiteDefense(float biteDefense)
  + ### getScratchDefense

    public float getScratchDefense()
  + ### setScratchDefense

    public void setScratchDefense(float scratchDefense)
  + ### getNeckProtectionModifier

    public float getNeckProtectionModifier()
  + ### setNeckProtectionModifier

    public void setNeckProtectionModifier(float neckProtectionModifier)
  + ### getChanceToFall

    public int getChanceToFall()
  + ### setChanceToFall

    public void setChanceToFall(int chanceToFall)
  + ### getWindresistance

    public float getWindresistance()
  + ### setWindresistance

    public void setWindresistance(float windresistance)
  + ### getWaterResistance

    public float getWaterResistance()
  + ### setWaterResistance

    public void setWaterResistance(float waterResistance)
  + ### getHolesNumber

    public int getHolesNumber()
  + ### getPatchesNumber

    public int getPatchesNumber()
  + ### getDefForPart

    public float getDefForPart([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    boolean bite,
    boolean bullet)
  + ### getBiteDefenseFromItem

    public static int getBiteDefenseFromItem([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") fabric)
  + ### getScratchDefenseFromItem

    public static int getScratchDefenseFromItem([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") fabric)
  + ### getPatchType

    public [Clothing.ClothingPatch](Clothing.ClothingPatch.html "class in zombie.inventory.types") getPatchType([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### removePatch

    public void removePatch([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### removeAllPatches

    public void removeAllPatches()
  + ### canFullyRestore

    public boolean canFullyRestore([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") fabric)
  + ### fullyRestore

    public void fullyRestore()
  + ### addPatchForSync

    public void addPatchForSync(int partIdx,
    int tailorLvl,
    int fabricType,
    boolean hasHole)
  + ### addPatch

    public void addPatch([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") fabric)
  + ### getCoveredParts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures")> getCoveredParts()
  + ### getNbrOfCoveredParts

    public int getNbrOfCoveredParts()
  + ### getCondLossPerHole

    public float getCondLossPerHole()
  + ### copyPatchesTo

    public void copyPatchesTo([Clothing](Clothing.html "class in zombie.inventory.types") newClothing)
  + ### getClothingExtraSubmenu

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClothingExtraSubmenu()
  + ### canBe3DRender

    public boolean canBe3DRender()
  + ### isWorn

    public boolean isWorn()

    Overrides:
    :   `isWorn` in class `InventoryItem`
  + ### addRandomHole

    public void addRandomHole()
  + ### addRandomDirt

    public void addRandomDirt()
  + ### addRandomBlood

    public void addRandomBlood()
  + ### randomizeCondition

    public void randomizeCondition(int wetChance,
    int dirtChance,
    int bloodChance,
    int holeChance)
  + ### hasFilter

    public boolean hasFilter()
  + ### setNoFilter

    public void setNoFilter()
  + ### getFilterType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilterType()
  + ### setFilterType

    public void setFilterType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterType)
  + ### hasTank

    public boolean hasTank()
  + ### setNoTank

    public void setNoTank()
  + ### getTankType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTankType()
  + ### setTankType

    public void setTankType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tankType)
  + ### getAlternateModelName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAlternateModelName()

    Overrides:
    :   `getAlternateModelName` in class `InventoryItem`
  + ### getUsedDelta

    public float getUsedDelta()
  + ### setUsedDelta

    public void setUsedDelta(float usedDelta)
  + ### getUseDelta

    public float getUseDelta()

    Overrides:
    :   `getUseDelta` in class `InventoryItem`
  + ### drainGasMask

    public void drainGasMask()
  + ### drainGasMask

    public void drainGasMask(float rate)
  + ### drainSCBA

    public void drainSCBA()
  + ### getCorpseSicknessDefense

    public float getCorpseSicknessDefense()