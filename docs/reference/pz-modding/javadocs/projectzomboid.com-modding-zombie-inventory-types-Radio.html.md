[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Radio](Radio.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [deviceData](#deviceData)
   2. [gameTime](#gameTime)
   3. [canBeEquipped](#canBeEquipped)
   4. [lastMin](#lastMin)
   5. [doPowerTick](#doPowerTick)
   6. [listenCnt](#listenCnt)
6. [Constructor Details](#constructor-detail)
   1. [Radio(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [getDeviceData()](#getDeviceData())
   2. [setDeviceData(DeviceData)](#setDeviceData(zombie.radio.devices.DeviceData))
   3. [doReceiveSignal(int)](#doReceiveSignal(int))
   4. [AddDeviceText(String, float, float, float, String, String, int)](#AddDeviceText(java.lang.String,float,float,float,java.lang.String,java.lang.String,int))
   5. [AddDeviceText(ChatMessage, float, float, float, String, String, int)](#AddDeviceText(zombie.chat.ChatMessage,float,float,float,java.lang.String,java.lang.String,int))
   6. [HasPlayerInRange()](#HasPlayerInRange())
   7. [ReadFromWorldSprite(String)](#ReadFromWorldSprite(java.lang.String))
   8. [getDelta()](#getDelta())
   9. [setDelta(float)](#setDelta(float))
   10. [getSquare()](#getSquare())
   11. [getX()](#getX())
   12. [getY()](#getY())
   13. [getZ()](#getZ())
   14. [getPlayer()](#getPlayer())
   15. [render()](#render())
   16. [renderlast()](#renderlast())
   17. [update()](#update())
   18. [IsSpeaking()](#IsSpeaking())
   19. [Say(String)](#Say(java.lang.String))
   20. [getSayLine()](#getSayLine())
   21. [getTalkerType()](#getTalkerType())
   22. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   23. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   24. [setCanBeEquipped(ItemBodyLocation)](#setCanBeEquipped(zombie.scripting.objects.ItemBodyLocation))
   25. [canBeEquipped()](#canBeEquipped())
   26. [getClothingExtraSubmenu()](#getClothingExtraSubmenu())
   27. [OnAddedToContainer(ItemContainer)](#OnAddedToContainer(zombie.inventory.ItemContainer))
   28. [getCurrentUsesFloat()](#getCurrentUsesFloat())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Radio
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

[zombie.inventory.types.Moveable](Moveable.html "class in zombie.inventory.types")

zombie.inventory.types.Radio

All Implemented Interfaces:
:   `zombie.characters.Talker, zombie.interfaces.IUpdater, WaveSignalDevice`

---

public final class Radio
extends [Moveable](Moveable.html "class in zombie.inventory.types")
implements zombie.characters.Talker, zombie.interfaces.IUpdater, [WaveSignalDevice](../../radio/devices/WaveSignalDevice.html "interface in zombie.radio.devices")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ItemBodyLocation`

  `canBeEquipped`

  `protected DeviceData`

  `deviceData`

  `protected boolean`

  `doPowerTick`

  `protected GameTime`

  `gameTime`

  `protected int`

  `lastMin`

  `protected int`

  `listenCnt`

  ### Fields inherited from class [Moveable](Moveable.html#field-summary "class in zombie.inventory.types")

  `canBeDroppedOnFloor, customItem, worldSprite`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Radio(String module,
  String name,
  String itemType,
  String texName)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddDeviceText(String line,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance)`

  `void`

  `AddDeviceText(ChatMessage msg,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance)`

  `ItemBodyLocation`

  `canBeEquipped()`

  `void`

  `doReceiveSignal(int distance)`

  `String`

  `getClothingExtraSubmenu()`

  `float`

  `getCurrentUsesFloat()`

  `float`

  `getDelta()`

  `DeviceData`

  `getDeviceData()`

  `IsoPlayer`

  `getPlayer()`

  `String`

  `getSayLine()`

  `IsoGridSquare`

  `getSquare()`

  `String`

  `getTalkerType()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `HasPlayerInRange()`

  `boolean`

  `IsSpeaking()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `OnAddedToContainer(ItemContainer container)`

  `boolean`

  `ReadFromWorldSprite(String sprite)`

  `void`

  `render()`

  `void`

  `renderlast()`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `Say(String line)`

  `void`

  `setCanBeEquipped(ItemBodyLocation canBeEquipped)`

  `void`

  `setDelta(float delta)`

  `void`

  `setDeviceData(DeviceData data)`

  `void`

  `update()`

  ### Methods inherited from class [Moveable](Moveable.html#method-summary "class in zombie.inventory.types")

  `CanBeDroppedOnFloor, getCustomIcon, getCustomNameFull, getDisplayName, getLightB, getLightBulbItem, getLightDelta, getLightG, getLightPower, getLightR, getMovableFullName, getName, getName, getSpriteGrid, getWorldSprite, isLight, isLightHasBattery, isLightUseBattery, isMultiGridAnchor, setLight, setLightB, setLightBulbItem, setLightDelta, setLightG, setLightHasBattery, setLightPower, setLightR, setLightUseBattery, setWorldSprite`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltip, DoTooltipEmbedded, emptyLiquid, finishupdate, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getCategory, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWeight, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [WaveSignalDevice](../../radio/devices/WaveSignalDevice.html#method-summary "interface in zombie.radio.devices")

  `AddDeviceText`

* Field Details
  -------------

  + ### deviceData

    protected [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") deviceData
  + ### gameTime

    protected [GameTime](../../GameTime.html "class in zombie") gameTime
  + ### canBeEquipped

    private [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") canBeEquipped
  + ### lastMin

    protected int lastMin
  + ### doPowerTick

    protected boolean doPowerTick
  + ### listenCnt

    protected int listenCnt
* Constructor Details
  -------------------

  + ### Radio

    public Radio([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
* Method Details
  --------------

  + ### getDeviceData

    public [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") getDeviceData()

    Specified by:
    :   `getDeviceData` in interface `WaveSignalDevice`
  + ### setDeviceData

    public void setDeviceData([DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") data)

    Specified by:
    :   `setDeviceData` in interface `WaveSignalDevice`
  + ### doReceiveSignal

    public void doReceiveSignal(int distance)
  + ### AddDeviceText

    public void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)

    Specified by:
    :   `AddDeviceText` in interface `WaveSignalDevice`
  + ### AddDeviceText

    public void AddDeviceText([ChatMessage](../../chat/ChatMessage.html "class in zombie.chat") msg,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)
  + ### HasPlayerInRange

    public boolean HasPlayerInRange()

    Specified by:
    :   `HasPlayerInRange` in interface `WaveSignalDevice`
  + ### ReadFromWorldSprite

    public boolean ReadFromWorldSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)

    Overrides:
    :   `ReadFromWorldSprite` in class `Moveable`
  + ### getDelta

    public float getDelta()

    Specified by:
    :   `getDelta` in interface `WaveSignalDevice`
  + ### setDelta

    public void setDelta(float delta)

    Specified by:
    :   `setDelta` in interface `WaveSignalDevice`
  + ### getSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in interface `WaveSignalDevice`

    Overrides:
    :   `getSquare` in class `InventoryItem`
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in interface `WaveSignalDevice`

    Overrides:
    :   `getX` in class `InventoryItem`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in interface `WaveSignalDevice`

    Overrides:
    :   `getY` in class `InventoryItem`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in interface `WaveSignalDevice`

    Overrides:
    :   `getZ` in class `InventoryItem`
  + ### getPlayer

    public [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") getPlayer()

    Overrides:
    :   `getPlayer` in class `InventoryItem`
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
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.interfaces.IUpdater`

    Overrides:
    :   `update` in class `InventoryItem`
  + ### IsSpeaking

    public boolean IsSpeaking()

    Specified by:
    :   `IsSpeaking` in interface `zombie.characters.Talker`
  + ### Say

    public void Say([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)

    Specified by:
    :   `Say` in interface `zombie.characters.Talker`
  + ### getSayLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSayLine()

    Specified by:
    :   `getSayLine` in interface `zombie.characters.Talker`
  + ### getTalkerType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTalkerType()

    Specified by:
    :   `getTalkerType` in interface `zombie.characters.Talker`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `Moveable`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Moveable`

    Throws:
    :   `IOException`
  + ### setCanBeEquipped

    public void setCanBeEquipped([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") canBeEquipped)
  + ### canBeEquipped

    public [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") canBeEquipped()

    Overrides:
    :   `canBeEquipped` in class `InventoryItem`
  + ### getClothingExtraSubmenu

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClothingExtraSubmenu()
  + ### OnAddedToContainer

    public void OnAddedToContainer([ItemContainer](../ItemContainer.html "class in zombie.inventory") container)

    Overrides:
    :   `OnAddedToContainer` in class `InventoryItem`
  + ### getCurrentUsesFloat

    public float getCurrentUsesFloat()

    Overrides:
    :   `getCurrentUsesFloat` in class `InventoryItem`