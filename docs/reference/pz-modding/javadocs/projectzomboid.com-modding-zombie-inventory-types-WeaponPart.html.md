[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [WeaponPart](WeaponPart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [maxRange](#maxRange)
   2. [minSightRange](#minSightRange)
   3. [maxSightRange](#maxSightRange)
   4. [lowLightBonus](#lowLightBonus)
   5. [minRangeRanged](#minRangeRanged)
   6. [damage](#damage)
   7. [recoilDelay](#recoilDelay)
   8. [clipSize](#clipSize)
   9. [reloadTime](#reloadTime)
   10. [aimingTime](#aimingTime)
   11. [hitChance](#hitChance)
   12. [angle](#angle)
   13. [spreadModifier](#spreadModifier)
   14. [weightModifier](#weightModifier)
   15. [mountOn](#mountOn)
   16. [mountOnDisplayName](#mountOnDisplayName)
   17. [partType](#partType)
   18. [canAttachCallback](#canAttachCallback)
   19. [canDetachCallback](#canDetachCallback)
   20. [onAttachCallback](#onAttachCallback)
   21. [onDetachCallback](#onDetachCallback)
   22. [lastUpdateMinutes](#lastUpdateMinutes)
   23. [useDelta](#useDelta)
   24. [ticks](#ticks)
6. [Constructor Details](#constructor-detail)
   1. [WeaponPart(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [getCategory()](#getCategory())
   2. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   3. [DoBatteryTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoBatteryTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   4. [getMinSightRange()](#getMinSightRange())
   5. [setMinSightRange(float)](#setMinSightRange(float))
   6. [getMaxSightRange()](#getMaxSightRange())
   7. [setLowLightBonus(float)](#setLowLightBonus(float))
   8. [getLowLightBonus()](#getLowLightBonus())
   9. [setMaxSightRange(float)](#setMaxSightRange(float))
   10. [getMinRangeRanged()](#getMinRangeRanged())
   11. [setMinRangeRanged(float)](#setMinRangeRanged(float))
   12. [getMaxRange()](#getMaxRange())
   13. [setMaxRange(float)](#setMaxRange(float))
   14. [getRecoilDelay()](#getRecoilDelay())
   15. [setRecoilDelay(float)](#setRecoilDelay(float))
   16. [getClipSize()](#getClipSize())
   17. [setClipSize(int)](#setClipSize(int))
   18. [getDamage()](#getDamage())
   19. [setDamage(float)](#setDamage(float))
   20. [getMountOn()](#getMountOn())
   21. [setMountOn(List)](#setMountOn(java.util.List))
   22. [getPartType()](#getPartType())
   23. [setPartType(String)](#setPartType(java.lang.String))
   24. [getReloadTime()](#getReloadTime())
   25. [setReloadTime(int)](#setReloadTime(int))
   26. [getAimingTime()](#getAimingTime())
   27. [setAimingTime(int)](#setAimingTime(int))
   28. [getHitChance()](#getHitChance())
   29. [setHitChance(int)](#setHitChance(int))
   30. [getAngle()](#getAngle())
   31. [setAngle(float)](#setAngle(float))
   32. [getSpreadModifier()](#getSpreadModifier())
   33. [setSpreadModifier(float)](#setSpreadModifier(float))
   34. [getWeightModifier()](#getWeightModifier())
   35. [setWeightModifier(float)](#setWeightModifier(float))
   36. [setCanAttachCallback(String)](#setCanAttachCallback(java.lang.String))
   37. [canAttach(IsoGameCharacter, HandWeapon)](#canAttach(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   38. [setCanDetachCallback(String)](#setCanDetachCallback(java.lang.String))
   39. [canDetach(IsoGameCharacter, HandWeapon)](#canDetach(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   40. [setOnAttachCallback(String)](#setOnAttachCallback(java.lang.String))
   41. [onAttach(IsoGameCharacter, HandWeapon)](#onAttach(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   42. [setOnDetachCallback(String)](#setOnDetachCallback(java.lang.String))
   43. [onDetach(IsoGameCharacter, HandWeapon)](#onDetach(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   44. [render()](#render())
   45. [getMaxUses()](#getMaxUses())
   46. [setUsedDelta(float)](#setUsedDelta(float))
   47. [setCurrentUsesFloat(float)](#setCurrentUsesFloat(float))
   48. [getCurrentUsesFloat()](#getCurrentUsesFloat())
   49. [setUseDelta(float)](#setUseDelta(float))
   50. [update()](#update())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WeaponPart
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.WeaponPart

All Implemented Interfaces:
:   `zombie.interfaces.IUpdater, Drainable`

---

public final class WeaponPart
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")
implements [Drainable](Drainable.html "interface in zombie.inventory.types"), zombie.interfaces.IUpdater

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `aimingTime`

  `private float`

  `angle`

  `private String`

  `canAttachCallback`

  `private String`

  `canDetachCallback`

  `private int`

  `clipSize`

  `private float`

  `damage`

  `private int`

  `hitChance`

  `protected int`

  `lastUpdateMinutes`

  `private float`

  `lowLightBonus`

  `private float`

  `maxRange`

  `private float`

  `maxSightRange`

  `private float`

  `minRangeRanged`

  `private float`

  `minSightRange`

  `private final List<String>`

  `mountOn`

  `private final List<String>`

  `mountOnDisplayName`

  `private String`

  `onAttachCallback`

  `private String`

  `onDetachCallback`

  `private String`

  `partType`

  `private float`

  `recoilDelay`

  `private int`

  `reloadTime`

  `private float`

  `spreadModifier`

  `protected float`

  `ticks`

  `protected float`

  `useDelta`

  `private float`

  `weightModifier`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WeaponPart(String module,
  String name,
  String itemType,
  String texName)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canAttach(IsoGameCharacter character,
  HandWeapon weapon)`

  `boolean`

  `canDetach(IsoGameCharacter character,
  HandWeapon weapon)`

  `void`

  `DoBatteryTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `int`

  `getAimingTime()`

  `float`

  `getAngle()`

  `String`

  `getCategory()`

  `int`

  `getClipSize()`

  `float`

  `getCurrentUsesFloat()`

  `float`

  `getDamage()`

  `int`

  `getHitChance()`

  `float`

  `getLowLightBonus()`

  `float`

  `getMaxRange()`

  `float`

  `getMaxSightRange()`

  `int`

  `getMaxUses()`

  `float`

  `getMinRangeRanged()`

  `float`

  `getMinSightRange()`

  `List<String>`

  `getMountOn()`

  `String`

  `getPartType()`

  `float`

  `getRecoilDelay()`

  `int`

  `getReloadTime()`

  `float`

  `getSpreadModifier()`

  `float`

  `getWeightModifier()`

  `void`

  `onAttach(IsoGameCharacter character,
  HandWeapon weapon)`

  `void`

  `onDetach(IsoGameCharacter character,
  HandWeapon weapon)`

  `void`

  `render()`

  `void`

  `setAimingTime(int aimingTime)`

  `void`

  `setAngle(float angle)`

  `void`

  `setCanAttachCallback(String value)`

  `void`

  `setCanDetachCallback(String value)`

  `void`

  `setClipSize(int clipSize)`

  `void`

  `setCurrentUsesFloat(float newUses)`

  `void`

  `setDamage(float damage)`

  `void`

  `setHitChance(int hitChance)`

  `void`

  `setLowLightBonus(float value)`

  `void`

  `setMaxRange(float maxRange)`

  `void`

  `setMaxSightRange(float value)`

  `void`

  `setMinRangeRanged(float minRangeRanged)`

  `void`

  `setMinSightRange(float value)`

  `void`

  `setMountOn(List<String> mountOn)`

  `void`

  `setOnAttachCallback(String value)`

  `void`

  `setOnDetachCallback(String value)`

  `void`

  `setPartType(String partType)`

  `void`

  `setRecoilDelay(float recoilDelay)`

  `void`

  `setReloadTime(int reloadTime)`

  `void`

  `setSpreadModifier(float modifier)`

  `void`

  `setUsedDelta(float delta)`

  Deprecated.

  `void`

  `setUseDelta(float useDelta)`

  `void`

  `setWeightModifier(float weightModifier)`

  `void`

  `update()`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, finishupdate, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getName, getName, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWeight, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, load, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, save, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.interfaces.IUpdater

  `renderlast`

* Field Details
  -------------

  + ### maxRange

    private float maxRange
  + ### minSightRange

    private float minSightRange
  + ### maxSightRange

    private float maxSightRange
  + ### lowLightBonus

    private float lowLightBonus
  + ### minRangeRanged

    private float minRangeRanged
  + ### damage

    private float damage
  + ### recoilDelay

    private float recoilDelay
  + ### clipSize

    private int clipSize
  + ### reloadTime

    private int reloadTime
  + ### aimingTime

    private int aimingTime
  + ### hitChance

    private int hitChance
  + ### angle

    private float angle
  + ### spreadModifier

    private float spreadModifier
  + ### weightModifier

    private float weightModifier
  + ### mountOn

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mountOn
  + ### mountOnDisplayName

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mountOnDisplayName
  + ### partType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partType
  + ### canAttachCallback

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") canAttachCallback
  + ### canDetachCallback

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") canDetachCallback
  + ### onAttachCallback

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onAttachCallback
  + ### onDetachCallback

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onDetachCallback
  + ### lastUpdateMinutes

    protected int lastUpdateMinutes
  + ### useDelta

    protected float useDelta
  + ### ticks

    protected float ticks
* Constructor Details
  -------------------

  + ### WeaponPart

    public WeaponPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
* Method Details
  --------------

  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `InventoryItem`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `InventoryItem`
  + ### DoBatteryTooltip

    public void DoBatteryTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### getMinSightRange

    public float getMinSightRange()
  + ### setMinSightRange

    public void setMinSightRange(float value)
  + ### getMaxSightRange

    public float getMaxSightRange()
  + ### setLowLightBonus

    public void setLowLightBonus(float value)
  + ### getLowLightBonus

    public float getLowLightBonus()
  + ### setMaxSightRange

    public void setMaxSightRange(float value)
  + ### getMinRangeRanged

    public float getMinRangeRanged()
  + ### setMinRangeRanged

    public void setMinRangeRanged(float minRangeRanged)
  + ### getMaxRange

    public float getMaxRange()
  + ### setMaxRange

    public void setMaxRange(float maxRange)
  + ### getRecoilDelay

    public float getRecoilDelay()
  + ### setRecoilDelay

    public void setRecoilDelay(float recoilDelay)
  + ### getClipSize

    public int getClipSize()
  + ### setClipSize

    public void setClipSize(int clipSize)
  + ### getDamage

    public float getDamage()
  + ### setDamage

    public void setDamage(float damage)
  + ### getMountOn

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMountOn()
  + ### setMountOn

    public void setMountOn([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mountOn)
  + ### getPartType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPartType()
  + ### setPartType

    public void setPartType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partType)
  + ### getReloadTime

    public int getReloadTime()
  + ### setReloadTime

    public void setReloadTime(int reloadTime)
  + ### getAimingTime

    public int getAimingTime()
  + ### setAimingTime

    public void setAimingTime(int aimingTime)
  + ### getHitChance

    public int getHitChance()
  + ### setHitChance

    public void setHitChance(int hitChance)
  + ### getAngle

    public float getAngle()
  + ### setAngle

    public void setAngle(float angle)
  + ### getSpreadModifier

    public float getSpreadModifier()
  + ### setSpreadModifier

    public void setSpreadModifier(float modifier)
  + ### getWeightModifier

    public float getWeightModifier()
  + ### setWeightModifier

    public void setWeightModifier(float weightModifier)
  + ### setCanAttachCallback

    public void setCanAttachCallback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### canAttach

    public boolean canAttach([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [HandWeapon](HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### setCanDetachCallback

    public void setCanDetachCallback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### canDetach

    public boolean canDetach([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [HandWeapon](HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### setOnAttachCallback

    public void setOnAttachCallback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### onAttach

    public void onAttach([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [HandWeapon](HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### setOnDetachCallback

    public void setOnDetachCallback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### onDetach

    public void onDetach([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [HandWeapon](HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.interfaces.IUpdater`
  + ### getMaxUses

    public int getMaxUses()

    Overrides:
    :   `getMaxUses` in class `InventoryItem`
  + ### setUsedDelta

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setUsedDelta(float delta)

    Deprecated.
  + ### setCurrentUsesFloat

    public void setCurrentUsesFloat(float newUses)

    Overrides:
    :   `setCurrentUsesFloat` in class `InventoryItem`
  + ### getCurrentUsesFloat

    public float getCurrentUsesFloat()

    Overrides:
    :   `getCurrentUsesFloat` in class `InventoryItem`
  + ### setUseDelta

    public void setUseDelta(float useDelta)

    Overrides:
    :   `setUseDelta` in class `InventoryItem`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.interfaces.IUpdater`

    Overrides:
    :   `update` in class `InventoryItem`