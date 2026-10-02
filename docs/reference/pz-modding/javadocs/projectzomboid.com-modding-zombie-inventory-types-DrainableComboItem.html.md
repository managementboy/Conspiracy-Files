[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [DrainableComboItem](DrainableComboItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [useWhileEquiped](#useWhileEquiped)
   2. [useWhileUnequiped](#useWhileUnequiped)
   3. [ticksPerEquipUse](#ticksPerEquipUse)
   4. [useDelta](#useDelta)
   5. [ticks](#ticks)
   6. [replaceOnDeplete](#replaceOnDeplete)
   7. [replaceOnDepleteFullType](#replaceOnDepleteFullType)
   8. [replaceOnCooked](#replaceOnCooked)
   9. [onCooked](#onCooked)
   10. [canConsolidate](#canConsolidate)
   11. [weightEmpty](#weightEmpty)
   12. [MIN\_HEAT](#MIN_HEAT)
   13. [MAX\_HEAT](#MAX_HEAT)
   14. [onEat](#onEat)
   15. [lastUpdateMinutes](#lastUpdateMinutes)
   16. [heat](#heat)
   17. [lastCookMinute](#lastCookMinute)
   18. [towelWetnessAccumulator](#towelWetnessAccumulator)
   19. [TOWEL\_WET\_TIME\_MULTIPLIER](#TOWEL_WET_TIME_MULTIPLIER)
6. [Constructor Details](#constructor-detail)
   1. [DrainableComboItem(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [DrainableComboItem(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [IsDrainable()](#IsDrainable())
   2. [getMaxUses()](#getMaxUses())
   3. [setCurrentUses(int)](#setCurrentUses(int))
   4. [setUsedDelta(float)](#setUsedDelta(float))
   5. [setCurrentUsesFloat(float)](#setCurrentUsesFloat(float))
   6. [getCurrentUsesFloat()](#getCurrentUsesFloat())
   7. [render()](#render())
   8. [renderlast()](#renderlast())
   9. [shouldUpdateInWorld()](#shouldUpdateInWorld())
   10. [canBecomeWetInRain()](#canBecomeWetInRain())
   11. [replaceWetTowel()](#replaceWetTowel())
   12. [updateTowelWetness()](#updateTowelWetness())
   13. [update()](#update())
   14. [Use()](#Use())
   15. [Use(boolean, boolean, boolean)](#Use(boolean,boolean,boolean))
   16. [syncItemFields()](#syncItemFields())
   17. [updateWeight()](#updateWeight())
   18. [getWeightEmpty()](#getWeightEmpty())
   19. [setWeightEmpty(float)](#setWeightEmpty(float))
   20. [isUseWhileEquiped()](#isUseWhileEquiped())
   21. [setUseWhileEquiped(boolean)](#setUseWhileEquiped(boolean))
   22. [isUseWhileUnequiped()](#isUseWhileUnequiped())
   23. [setUseWhileUnequiped(boolean)](#setUseWhileUnequiped(boolean))
   24. [getTicksPerEquipUse()](#getTicksPerEquipUse())
   25. [setTicksPerEquipUse(int)](#setTicksPerEquipUse(int))
   26. [getUseDelta()](#getUseDelta())
   27. [setUseDelta(float)](#setUseDelta(float))
   28. [getTicks()](#getTicks())
   29. [setTicks(float)](#setTicks(float))
   30. [setReplaceOnDeplete(String)](#setReplaceOnDeplete(java.lang.String))
   31. [getReplaceOnDeplete()](#getReplaceOnDeplete())
   32. [getReplaceOnDepleteFullType()](#getReplaceOnDepleteFullType())
   33. [setHeat(float)](#setHeat(float))
   34. [getHeat()](#getHeat())
   35. [getInvHeat()](#getInvHeat())
   36. [finishupdate()](#finishupdate())
   37. [canConsolidate()](#canConsolidate())
   38. [setCanConsolidate(boolean)](#setCanConsolidate(boolean))
   39. [getReplaceOnCooked()](#getReplaceOnCooked())
   40. [setReplaceOnCooked(List)](#setReplaceOnCooked(java.util.List))
   41. [getOnCooked()](#getOnCooked())
   42. [setOnCooked(String)](#setOnCooked(java.lang.String))
   43. [getOnEat()](#getOnEat())
   44. [setOnEat(String)](#setOnEat(java.lang.String))
   45. [isEnergy()](#isEnergy())
   46. [getEnergy()](#getEnergy())
   47. [isFullUses()](#isFullUses())
   48. [isEmptyUses()](#isEmptyUses())
   49. [randomizeUses()](#randomizeUses())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DrainableComboItem
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.DrainableComboItem

All Implemented Interfaces:
:   `zombie.interfaces.IUpdater, Drainable`

---

public final class DrainableComboItem
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")
implements [Drainable](Drainable.html "interface in zombie.inventory.types"), zombie.interfaces.IUpdater

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `canConsolidate`

  `private float`

  `heat`

  `private int`

  `lastCookMinute`

  `private int`

  `lastUpdateMinutes`

  `private static final float`

  `MAX_HEAT`

  `private static final float`

  `MIN_HEAT`

  `private String`

  `onCooked`

  `private String`

  `onEat`

  `List<String>`

  `replaceOnCooked`

  `private String`

  `replaceOnDeplete`

  `private String`

  `replaceOnDepleteFullType`

  `private float`

  `ticks`

  `private int`

  `ticksPerEquipUse`

  `private static final float`

  `TOWEL_WET_TIME_MULTIPLIER`

  `private float`

  `towelWetnessAccumulator`

  `private float`

  `useDelta`

  `private boolean`

  `useWhileEquiped`

  `private boolean`

  `useWhileUnequiped`

  `private float`

  `weightEmpty`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DrainableComboItem(String module,
  String name,
  String itemType,
  String texName)`

  `DrainableComboItem(String module,
  String name,
  String itemType,
  Item item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `canBecomeWetInRain()`

  `boolean`

  `canConsolidate()`

  `boolean`

  `finishupdate()`

  `float`

  `getCurrentUsesFloat()`

  `Energy`

  `getEnergy()`

  `float`

  `getHeat()`

  `float`

  `getInvHeat()`

  `int`

  `getMaxUses()`

  `String`

  `getOnCooked()`

  `String`

  `getOnEat()`

  `List<String>`

  `getReplaceOnCooked()`

  `String`

  `getReplaceOnDeplete()`

  `String`

  `getReplaceOnDepleteFullType()`

  `float`

  `getTicks()`

  `int`

  `getTicksPerEquipUse()`

  `float`

  `getUseDelta()`

  `float`

  `getWeightEmpty()`

  `boolean`

  `IsDrainable()`

  `boolean`

  `isEmptyUses()`

  `boolean`

  `isEnergy()`

  `boolean`

  `isFullUses()`

  `boolean`

  `isUseWhileEquiped()`

  `boolean`

  `isUseWhileUnequiped()`

  `void`

  `randomizeUses()`

  `void`

  `render()`

  `void`

  `renderlast()`

  `private void`

  `replaceWetTowel()`

  `void`

  `setCanConsolidate(boolean canConsolidate)`

  `void`

  `setCurrentUses(int newuses)`

  `void`

  `setCurrentUsesFloat(float newUses)`

  `void`

  `setHeat(float heat)`

  `void`

  `setOnCooked(String onCooked)`

  `void`

  `setOnEat(String onEat)`

  `void`

  `setReplaceOnCooked(List<String> replaceOnCooked)`

  `void`

  `setReplaceOnDeplete(String replaceOnDeplete)`

  `void`

  `setTicks(float ticks)`

  `void`

  `setTicksPerEquipUse(int ticksPerEquipUse)`

  `void`

  `setUsedDelta(float delta)`

  Deprecated.

  `void`

  `setUseDelta(float useDelta)`

  `void`

  `setUseWhileEquiped(boolean bUseWhileEquiped)`

  `void`

  `setUseWhileUnequiped(boolean bUseWhileUnequiped)`

  `void`

  `setWeightEmpty(float weight)`

  `boolean`

  `shouldUpdateInWorld()`

  `void`

  `syncItemFields()`

  `void`

  `update()`

  `private void`

  `updateTowelWetness()`

  `void`

  `updateWeight()`

  `void`

  `Use()`

  `void`

  `Use(boolean bCrafting,
  boolean bInContainer,
  boolean bNeedSync)`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltip, DoTooltipEmbedded, emptyLiquid, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getCategory, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getName, getName, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWeight, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, load, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, save, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### useWhileEquiped

    private boolean useWhileEquiped
  + ### useWhileUnequiped

    private boolean useWhileUnequiped
  + ### ticksPerEquipUse

    private int ticksPerEquipUse
  + ### useDelta

    private float useDelta
  + ### ticks

    private float ticks
  + ### replaceOnDeplete

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnDeplete
  + ### replaceOnDepleteFullType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnDepleteFullType
  + ### replaceOnCooked

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> replaceOnCooked
  + ### onCooked

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onCooked
  + ### canConsolidate

    private boolean canConsolidate
  + ### weightEmpty

    private float weightEmpty
  + ### MIN\_HEAT

    private static final float MIN\_HEAT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.DrainableComboItem.MIN_HEAT)
  + ### MAX\_HEAT

    private static final float MAX\_HEAT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.DrainableComboItem.MAX_HEAT)
  + ### onEat

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onEat
  + ### lastUpdateMinutes

    private int lastUpdateMinutes
  + ### heat

    private float heat
  + ### lastCookMinute

    private int lastCookMinute
  + ### towelWetnessAccumulator

    private float towelWetnessAccumulator
  + ### TOWEL\_WET\_TIME\_MULTIPLIER

    private static final float TOWEL\_WET\_TIME\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.DrainableComboItem.TOWEL_WET_TIME_MULTIPLIER)
* Constructor Details
  -------------------

  + ### DrainableComboItem

    public DrainableComboItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
  + ### DrainableComboItem

    public DrainableComboItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### IsDrainable

    public boolean IsDrainable()

    Overrides:
    :   `IsDrainable` in class `InventoryItem`
  + ### getMaxUses

    public int getMaxUses()

    Overrides:
    :   `getMaxUses` in class `InventoryItem`
  + ### setCurrentUses

    public void setCurrentUses(int newuses)

    Overrides:
    :   `setCurrentUses` in class `InventoryItem`
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
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.interfaces.IUpdater`
  + ### renderlast

    public void renderlast()

    Specified by:
    :   `renderlast` in interface `zombie.interfaces.IUpdater`

    Overrides:
    :   `renderlast` in class `GameEntity`
  + ### shouldUpdateInWorld

    public boolean shouldUpdateInWorld()

    Overrides:
    :   `shouldUpdateInWorld` in class `InventoryItem`
  + ### canBecomeWetInRain

    private boolean canBecomeWetInRain()
  + ### replaceWetTowel

    private void replaceWetTowel()
  + ### updateTowelWetness

    private void updateTowelWetness()
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.interfaces.IUpdater`

    Overrides:
    :   `update` in class `InventoryItem`
  + ### Use

    public void Use()

    Overrides:
    :   `Use` in class `InventoryItem`
  + ### Use

    public void Use(boolean bCrafting,
    boolean bInContainer,
    boolean bNeedSync)

    Overrides:
    :   `Use` in class `InventoryItem`
  + ### syncItemFields

    public void syncItemFields()

    Overrides:
    :   `syncItemFields` in class `InventoryItem`
  + ### updateWeight

    public void updateWeight()
  + ### getWeightEmpty

    public float getWeightEmpty()
  + ### setWeightEmpty

    public void setWeightEmpty(float weight)
  + ### isUseWhileEquiped

    public boolean isUseWhileEquiped()
  + ### setUseWhileEquiped

    public void setUseWhileEquiped(boolean bUseWhileEquiped)
  + ### isUseWhileUnequiped

    public boolean isUseWhileUnequiped()
  + ### setUseWhileUnequiped

    public void setUseWhileUnequiped(boolean bUseWhileUnequiped)
  + ### getTicksPerEquipUse

    public int getTicksPerEquipUse()
  + ### setTicksPerEquipUse

    public void setTicksPerEquipUse(int ticksPerEquipUse)
  + ### getUseDelta

    public float getUseDelta()

    Overrides:
    :   `getUseDelta` in class `InventoryItem`
  + ### setUseDelta

    public void setUseDelta(float useDelta)

    Overrides:
    :   `setUseDelta` in class `InventoryItem`
  + ### getTicks

    public float getTicks()
  + ### setTicks

    public void setTicks(float ticks)
  + ### setReplaceOnDeplete

    public void setReplaceOnDeplete([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnDeplete)
  + ### getReplaceOnDeplete

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnDeplete()
  + ### getReplaceOnDepleteFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnDepleteFullType()
  + ### setHeat

    public void setHeat(float heat)
  + ### getHeat

    public float getHeat()
  + ### getInvHeat

    public float getInvHeat()

    Overrides:
    :   `getInvHeat` in class `InventoryItem`
  + ### finishupdate

    public boolean finishupdate()

    Overrides:
    :   `finishupdate` in class `InventoryItem`
  + ### canConsolidate

    public boolean canConsolidate()
  + ### setCanConsolidate

    public void setCanConsolidate(boolean canConsolidate)
  + ### getReplaceOnCooked

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getReplaceOnCooked()
  + ### setReplaceOnCooked

    public void setReplaceOnCooked([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> replaceOnCooked)
  + ### getOnCooked

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnCooked()
  + ### setOnCooked

    public void setOnCooked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onCooked)
  + ### getOnEat

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnEat()
  + ### setOnEat

    public void setOnEat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onEat)
  + ### isEnergy

    public boolean isEnergy()
  + ### getEnergy

    public [Energy](../../entity/energy/Energy.html "class in zombie.entity.energy") getEnergy()
  + ### isFullUses

    public boolean isFullUses()
  + ### isEmptyUses

    public boolean isEmptyUses()
  + ### randomizeUses

    public void randomizeUses()