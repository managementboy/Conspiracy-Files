[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Moveable](Moveable.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [worldSprite](#worldSprite)
   2. [isLight](#isLight)
   3. [lightUseBattery](#lightUseBattery)
   4. [lightHasBattery](#lightHasBattery)
   5. [lightBulbItem](#lightBulbItem)
   6. [lightPower](#lightPower)
   7. [lightDelta](#lightDelta)
   8. [lightR](#lightR)
   9. [lightG](#lightG)
   10. [lightB](#lightB)
   11. [isMultiGridAnchor](#isMultiGridAnchor)
   12. [spriteGrid](#spriteGrid)
   13. [customNameFull](#customNameFull)
   14. [movableFullName](#movableFullName)
   15. [canBeDroppedOnFloor](#canBeDroppedOnFloor)
   16. [hasReadWorldSprite](#hasReadWorldSprite)
   17. [customItem](#customItem)
6. [Constructor Details](#constructor-detail)
   1. [Moveable(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [Moveable(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getName(IsoPlayer)](#getName(zombie.characters.IsoPlayer))
   3. [getDisplayName()](#getDisplayName())
   4. [CanBeDroppedOnFloor()](#CanBeDroppedOnFloor())
   5. [getMovableFullName()](#getMovableFullName())
   6. [getCustomNameFull()](#getCustomNameFull())
   7. [isMultiGridAnchor()](#isMultiGridAnchor())
   8. [getSpriteGrid()](#getSpriteGrid())
   9. [getWorldSprite()](#getWorldSprite())
   10. [ReadFromWorldSprite(String)](#ReadFromWorldSprite(java.lang.String))
   11. [getCustomIcon(String)](#getCustomIcon(java.lang.String))
   12. [isLight()](#isLight())
   13. [setLight(boolean)](#setLight(boolean))
   14. [isLightUseBattery()](#isLightUseBattery())
   15. [setLightUseBattery(boolean)](#setLightUseBattery(boolean))
   16. [isLightHasBattery()](#isLightHasBattery())
   17. [setLightHasBattery(boolean)](#setLightHasBattery(boolean))
   18. [getLightBulbItem()](#getLightBulbItem())
   19. [setLightBulbItem(String)](#setLightBulbItem(java.lang.String))
   20. [getLightPower()](#getLightPower())
   21. [setLightPower(float)](#setLightPower(float))
   22. [getLightDelta()](#getLightDelta())
   23. [setLightDelta(float)](#setLightDelta(float))
   24. [getLightR()](#getLightR())
   25. [setLightR(float)](#setLightR(float))
   26. [getLightG()](#getLightG())
   27. [setLightG(float)](#setLightG(float))
   28. [getLightB()](#getLightB())
   29. [setLightB(float)](#setLightB(float))
   30. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   31. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   32. [setWorldSprite(String)](#setWorldSprite(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Moveable
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.Moveable

Direct Known Subclasses:
:   `Radio`

---

public class Moveable
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `canBeDroppedOnFloor`

  `protected String`

  `customItem`

  `private String`

  `customNameFull`

  `private boolean`

  `hasReadWorldSprite`

  `private boolean`

  `isLight`

  `private boolean`

  `isMultiGridAnchor`

  `private float`

  `lightB`

  `private String`

  `lightBulbItem`

  `private float`

  `lightDelta`

  `private float`

  `lightG`

  `private boolean`

  `lightHasBattery`

  `private float`

  `lightPower`

  `private float`

  `lightR`

  `private boolean`

  `lightUseBattery`

  `private String`

  `movableFullName`

  `private IsoSpriteGrid`

  `spriteGrid`

  `protected String`

  `worldSprite`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Moveable(String module,
  String name,
  String type,
  String tex)`

  `Moveable(String module,
  String name,
  String type,
  Item item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `CanBeDroppedOnFloor()`

  `void`

  `getCustomIcon(String sprite)`

  `String`

  `getCustomNameFull()`

  `String`

  `getDisplayName()`

  `float`

  `getLightB()`

  `String`

  `getLightBulbItem()`

  `float`

  `getLightDelta()`

  `float`

  `getLightG()`

  `float`

  `getLightPower()`

  `float`

  `getLightR()`

  `String`

  `getMovableFullName()`

  `String`

  `getName()`

  `String`

  `getName(IsoPlayer player)`

  `IsoSpriteGrid`

  `getSpriteGrid()`

  `String`

  `getWorldSprite()`

  `boolean`

  `isLight()`

  `boolean`

  `isLightHasBattery()`

  `boolean`

  `isLightUseBattery()`

  `boolean`

  `isMultiGridAnchor()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `boolean`

  `ReadFromWorldSprite(String sprite)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setLight(boolean isLight)`

  `void`

  `setLightB(float lightB)`

  `void`

  `setLightBulbItem(String lightBulbItem)`

  `void`

  `setLightDelta(float lightDelta)`

  `void`

  `setLightG(float lightG)`

  `void`

  `setLightHasBattery(boolean lightHasBattery)`

  `void`

  `setLightPower(float lightPower)`

  `void`

  `setLightR(float lightR)`

  `void`

  `setLightUseBattery(boolean lightUseBattery)`

  `void`

  `setWorldSprite(String worldSprite)`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltip, DoTooltipEmbedded, emptyLiquid, finishupdate, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getCategory, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCurrentUsesFloat, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWeight, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, update, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### worldSprite

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldSprite
  + ### isLight

    private boolean isLight
  + ### lightUseBattery

    private boolean lightUseBattery
  + ### lightHasBattery

    private boolean lightHasBattery
  + ### lightBulbItem

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightBulbItem
  + ### lightPower

    private float lightPower
  + ### lightDelta

    private float lightDelta
  + ### lightR

    private float lightR
  + ### lightG

    private float lightG
  + ### lightB

    private float lightB
  + ### isMultiGridAnchor

    private boolean isMultiGridAnchor
  + ### spriteGrid

    private [IsoSpriteGrid](../../iso/sprite/IsoSpriteGrid.html "class in zombie.iso.sprite") spriteGrid
  + ### customNameFull

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customNameFull
  + ### movableFullName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") movableFullName
  + ### canBeDroppedOnFloor

    protected boolean canBeDroppedOnFloor
  + ### hasReadWorldSprite

    private boolean hasReadWorldSprite
  + ### customItem

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customItem
* Constructor Details
  -------------------

  + ### Moveable

    public Moveable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### Moveable

    public Moveable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `getName` in class `InventoryItem`
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()

    Overrides:
    :   `getDisplayName` in class `InventoryItem`
  + ### CanBeDroppedOnFloor

    public boolean CanBeDroppedOnFloor()
  + ### getMovableFullName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMovableFullName()
  + ### getCustomNameFull

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomNameFull()
  + ### isMultiGridAnchor

    public boolean isMultiGridAnchor()
  + ### getSpriteGrid

    public [IsoSpriteGrid](../../iso/sprite/IsoSpriteGrid.html "class in zombie.iso.sprite") getSpriteGrid()
  + ### getWorldSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldSprite()
  + ### ReadFromWorldSprite

    public boolean ReadFromWorldSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### getCustomIcon

    public void getCustomIcon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### isLight

    public boolean isLight()
  + ### setLight

    public void setLight(boolean isLight)
  + ### isLightUseBattery

    public boolean isLightUseBattery()
  + ### setLightUseBattery

    public void setLightUseBattery(boolean lightUseBattery)
  + ### isLightHasBattery

    public boolean isLightHasBattery()
  + ### setLightHasBattery

    public void setLightHasBattery(boolean lightHasBattery)
  + ### getLightBulbItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLightBulbItem()
  + ### setLightBulbItem

    public void setLightBulbItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightBulbItem)
  + ### getLightPower

    public float getLightPower()
  + ### setLightPower

    public void setLightPower(float lightPower)
  + ### getLightDelta

    public float getLightDelta()
  + ### setLightDelta

    public void setLightDelta(float lightDelta)
  + ### getLightR

    public float getLightR()
  + ### setLightR

    public void setLightR(float lightR)
  + ### getLightG

    public float getLightG()
  + ### setLightG

    public void setLightG(float lightG)
  + ### getLightB

    public float getLightB()
  + ### setLightB

    public void setLightB(float lightB)
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
  + ### setWorldSprite

    public void setWorldSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldSprite)