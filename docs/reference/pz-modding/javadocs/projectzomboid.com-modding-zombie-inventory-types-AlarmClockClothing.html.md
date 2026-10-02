[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [AlarmClockClothing](AlarmClockClothing.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [alarmHour](#alarmHour)
   2. [alarmMinutes](#alarmMinutes)
   3. [alarmSet](#alarmSet)
   4. [ringSound](#ringSound)
   5. [ringSince](#ringSince)
   6. [forceDontRing](#forceDontRing)
   7. [alarmSound](#alarmSound)
   8. [soundRadius](#soundRadius)
   9. [isDigital](#isDigital)
   10. [playerOwner](#playerOwner)
   11. [packetPlayer](#packetPlayer)
   12. [packetWorld](#packetWorld)
   13. [sendEvery](#sendEvery)
7. [Constructor Details](#constructor-detail)
   1. [AlarmClockClothing(String, String, String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [AlarmClockClothing(String, String, String, Item, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item,java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [randomizeAlarm()](#randomizeAlarm())
   2. [getAlarmSquare()](#getAlarmSquare())
   3. [shouldUpdateInWorld()](#shouldUpdateInWorld())
   4. [update()](#update())
   5. [updateSound(BaseSoundEmitter)](#updateSound(zombie.audio.BaseSoundEmitter))
   6. [stopSoundOnPlayer()](#stopSoundOnPlayer())
   7. [wakeUpPlayers(IsoGridSquare)](#wakeUpPlayers(zombie.iso.IsoGridSquare))
   8. [wakeUp(IsoPlayer)](#wakeUp(zombie.characters.IsoPlayer))
   9. [isRinging()](#isRinging())
   10. [finishupdate()](#finishupdate())
   11. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   12. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   13. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   14. [getCategory()](#getCategory())
   15. [setAlarmSet(boolean)](#setAlarmSet(boolean))
   16. [isAlarmSet()](#isAlarmSet())
   17. [setHour(int)](#setHour(int))
   18. [setMinute(int)](#setMinute(int))
   19. [setForceDontRing(int)](#setForceDontRing(int))
   20. [getHour()](#getHour())
   21. [getMinute()](#getMinute())
   22. [syncAlarmClock()](#syncAlarmClock())
   23. [syncAlarmClock\_Player(IsoPlayer)](#syncAlarmClock_Player(zombie.characters.IsoPlayer))
   24. [syncAlarmClock\_World()](#syncAlarmClock_World())
   25. [syncStopRinging()](#syncStopRinging())
   26. [stopRinging()](#stopRinging())
   27. [getAlarmSound()](#getAlarmSound())
   28. [setAlarmSound(String)](#setAlarmSound(java.lang.String))
   29. [getSoundRadius()](#getSoundRadius())
   30. [setSoundRadius(int)](#setSoundRadius(int))
   31. [isDigital()](#isDigital())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AlarmClockClothing
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

[zombie.inventory.types.Clothing](Clothing.html "class in zombie.inventory.types")

zombie.inventory.types.AlarmClockClothing

All Implemented Interfaces:
:   `IAlarmClock`

---

public final class AlarmClockClothing
extends [Clothing](Clothing.html "class in zombie.inventory.types")
implements [IAlarmClock](IAlarmClock.html "interface in zombie.inventory.types")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Clothing](Clothing.html#nested-class-summary "class in zombie.inventory.types")

  `Clothing.ClothingPatch, Clothing.ClothingPatchFabricType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `alarmHour`

  `private int`

  `alarmMinutes`

  `private boolean`

  `alarmSet`

  `private String`

  `alarmSound`

  `private int`

  `forceDontRing`

  `private boolean`

  `isDigital`

  `static short`

  `packetPlayer`

  `static short`

  `packetWorld`

  `private IsoPlayer`

  `playerOwner`

  `private double`

  `ringSince`

  `private long`

  `ringSound`

  `private static final zombie.core.utils.OnceEvery`

  `sendEvery`

  `private int`

  `soundRadius`

  ### Fields inherited from class [Clothing](Clothing.html#field-summary "class in zombie.inventory.types")

  `bloodLevel, CONDITION_PER_HOLES, palette, spriteName`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AlarmClockClothing(String module,
  String name,
  String itemType,
  String texName,
  String palette,
  String spriteName)`

  `AlarmClockClothing(String module,
  String name,
  String itemType,
  Item item,
  String palette,
  String spriteName)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `boolean`

  `finishupdate()`

  `String`

  `getAlarmSound()`

  `IsoGridSquare`

  `getAlarmSquare()`

  `String`

  `getCategory()`

  `int`

  `getHour()`

  `int`

  `getMinute()`

  `int`

  `getSoundRadius()`

  `boolean`

  `isAlarmSet()`

  `boolean`

  `isDigital()`

  `boolean`

  `isRinging()`

  `void`

  `load(ByteBuffer input,
  int worldversion)`

  `private void`

  `randomizeAlarm()`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setAlarmSet(boolean alarmSet)`

  `void`

  `setAlarmSound(String alarmSound)`

  `void`

  `setForceDontRing(int min)`

  `void`

  `setHour(int hour)`

  `void`

  `setMinute(int min)`

  `void`

  `setSoundRadius(int soundRadius)`

  `boolean`

  `shouldUpdateInWorld()`

  `void`

  `stopRinging()`

  `void`

  `stopSoundOnPlayer()`

  `void`

  `syncAlarmClock()`

  `void`

  `syncAlarmClock_Player(IsoPlayer player)`

  `void`

  `syncAlarmClock_World()`

  `void`

  `syncStopRinging()`

  `void`

  `update()`

  `void`

  `updateSound(BaseSoundEmitter emitter)`

  `private void`

  `wakeUp(IsoPlayer chr)`

  `private void`

  `wakeUpPlayers(IsoGridSquare sq)`

  ### Methods inherited from class [Clothing](Clothing.html#method-summary "class in zombie.inventory.types")

  `addPatch, addPatchForSync, addRandomBlood, addRandomDirt, addRandomHole, canBe3DRender, canFullyRestore, CanStack, copyPatchesTo, CreateFromSprite, drainGasMask, drainGasMask, drainSCBA, flushWetness, fullyRestore, getAlternateModelName, getBiteDefense, getBiteDefenseFromItem, getBloodlevel, getBloodLevel, getBloodlevelForPart, getBloodLevelForPart, getBulletDefense, getCanHaveHoles, getChanceToFall, getClothingDirtynessIncreaseLevel, getClothingExtraSubmenu, getCombatSpeedModifier, getConditionLowerChance, getCondLossPerHole, getCorpseSicknessDefense, getCoveredParts, getDefForPart, getDirtiness, getFilterType, getHolesNumber, getInsulation, getName, getName, getNbrOfCoveredParts, getNeckProtectionModifier, getPalette, getPatchesNumber, getPatchType, getRunSpeedModifier, getScratchDefense, getScratchDefenseFromItem, getSpriteName, getStompPower, getTankType, getTemperature, getUsedDelta, getUseDelta, getWaterResistance, getWeight, getWeightWet, getWetness, getWindresistance, hasFilter, hasTank, isBloody, IsClothing, isCosmetic, isDirty, isRemoveOnBroken, isWorn, randomizeCondition, removeAllPatches, removePatch, setBiteDefense, setBloodLevel, setBulletDefense, setCanHaveHoles, setChanceToFall, setCombatSpeedModifier, setCondition, setConditionLowerChance, setDirtiness, setFilterType, setInsulation, setNeckProtectionModifier, setNoFilter, setNoTank, setPalette, setRemoveOnBroken, setRunSpeedModifier, setScratchDefense, setSpriteName, setStompPower, setTankType, setTemperature, setUsedDelta, setWaterResistance, setWeightWet, setWetness, setWindresistance, toString, Unwear, Unwear, updateWetness, updateWetness, Use`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCurrentUsesFloat, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWetCooldown, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBodyLocation, isBroken, isBurnt, isCanBandage, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, stopEquippedAndActivatedSound, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### alarmHour

    private int alarmHour
  + ### alarmMinutes

    private int alarmMinutes
  + ### alarmSet

    private boolean alarmSet
  + ### ringSound

    private long ringSound
  + ### ringSince

    private double ringSince
  + ### forceDontRing

    private int forceDontRing
  + ### alarmSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alarmSound
  + ### soundRadius

    private int soundRadius
  + ### isDigital

    private boolean isDigital
  + ### playerOwner

    private [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") playerOwner
  + ### packetPlayer

    public static short packetPlayer
  + ### packetWorld

    public static short packetWorld
  + ### sendEvery

    private static final zombie.core.utils.OnceEvery sendEvery
* Constructor Details
  -------------------

  + ### AlarmClockClothing

    public AlarmClockClothing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### AlarmClockClothing

    public AlarmClockClothing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") palette,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
* Method Details
  --------------

  + ### randomizeAlarm

    private void randomizeAlarm()
  + ### getAlarmSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getAlarmSquare()
  + ### shouldUpdateInWorld

    public boolean shouldUpdateInWorld()

    Overrides:
    :   `shouldUpdateInWorld` in class `InventoryItem`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `IAlarmClock`

    Overrides:
    :   `update` in class `Clothing`
  + ### updateSound

    public void updateSound([BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)

    Overrides:
    :   `updateSound` in class `InventoryItem`
  + ### stopSoundOnPlayer

    public void stopSoundOnPlayer()

    Overrides:
    :   `stopSoundOnPlayer` in class `InventoryItem`
  + ### wakeUpPlayers

    private void wakeUpPlayers([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### wakeUp

    private void wakeUp([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### isRinging

    public boolean isRinging()
  + ### finishupdate

    public boolean finishupdate()

    Overrides:
    :   `finishupdate` in class `Clothing`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `Clothing`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `Clothing`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldversion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Clothing`

    Throws:
    :   `IOException`
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `Clothing`
  + ### setAlarmSet

    public void setAlarmSet(boolean alarmSet)

    Specified by:
    :   `setAlarmSet` in interface `IAlarmClock`
  + ### isAlarmSet

    public boolean isAlarmSet()

    Specified by:
    :   `isAlarmSet` in interface `IAlarmClock`
  + ### setHour

    public void setHour(int hour)

    Specified by:
    :   `setHour` in interface `IAlarmClock`
  + ### setMinute

    public void setMinute(int min)

    Specified by:
    :   `setMinute` in interface `IAlarmClock`
  + ### setForceDontRing

    public void setForceDontRing(int min)

    Specified by:
    :   `setForceDontRing` in interface `IAlarmClock`
  + ### getHour

    public int getHour()

    Specified by:
    :   `getHour` in interface `IAlarmClock`
  + ### getMinute

    public int getMinute()

    Specified by:
    :   `getMinute` in interface `IAlarmClock`
  + ### syncAlarmClock

    public void syncAlarmClock()
  + ### syncAlarmClock\_Player

    public void syncAlarmClock\_Player([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### syncAlarmClock\_World

    public void syncAlarmClock\_World()
  + ### syncStopRinging

    public void syncStopRinging()
  + ### stopRinging

    public void stopRinging()

    Specified by:
    :   `stopRinging` in interface `IAlarmClock`
  + ### getAlarmSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAlarmSound()
  + ### setAlarmSound

    public void setAlarmSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alarmSound)
  + ### getSoundRadius

    public int getSoundRadius()
  + ### setSoundRadius

    public void setSoundRadius(int soundRadius)
  + ### isDigital

    public boolean isDigital()