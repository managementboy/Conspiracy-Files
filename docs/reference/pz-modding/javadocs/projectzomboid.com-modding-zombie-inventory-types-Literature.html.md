[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Literature](Literature.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [alreadyRead](#alreadyRead)
   2. [requireInHandOrInventory](#requireInHandOrInventory)
   3. [useOnConsume](#useOnConsume)
   4. [numberOfPages](#numberOfPages)
   5. [bookName](#bookName)
   6. [lvlSkillTrained](#lvlSkillTrained)
   7. [numLevelsTrained](#numLevelsTrained)
   8. [skillTrained](#skillTrained)
   9. [alreadyReadPages](#alreadyReadPages)
   10. [canBeWrite](#canBeWrite)
   11. [customPages](#customPages)
   12. [lockedBy](#lockedBy)
   13. [pageToWrite](#pageToWrite)
   14. [learnedRecipes](#learnedRecipes)
   15. [maxTextLength](#maxTextLength)
6. [Constructor Details](#constructor-detail)
   1. [Literature(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [Literature(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [IsLiterature()](#IsLiterature())
   2. [getCategory()](#getCategory())
   3. [update()](#update())
   4. [finishupdate()](#finishupdate())
   5. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   6. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   7. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   8. [getBoredomChange()](#getBoredomChange())
   9. [getUnhappyChange()](#getUnhappyChange())
   10. [getStressChange()](#getStressChange())
   11. [getNumberOfPages()](#getNumberOfPages())
   12. [setNumberOfPages(int)](#setNumberOfPages(int))
   13. [getBookName()](#getBookName())
   14. [setBookName(String)](#setBookName(java.lang.String))
   15. [getLvlSkillTrained()](#getLvlSkillTrained())
   16. [setLvlSkillTrained(int)](#setLvlSkillTrained(int))
   17. [getNumLevelsTrained()](#getNumLevelsTrained())
   18. [setNumLevelsTrained(int)](#setNumLevelsTrained(int))
   19. [getMaxLevelTrained()](#getMaxLevelTrained())
   20. [getSkillTrained()](#getSkillTrained())
   21. [setSkillTrained(String)](#setSkillTrained(java.lang.String))
   22. [getAlreadyReadPages()](#getAlreadyReadPages())
   23. [setAlreadyReadPages(int)](#setAlreadyReadPages(int))
   24. [canBeWrite()](#canBeWrite())
   25. [setCanBeWrite(boolean)](#setCanBeWrite(boolean))
   26. [getCustomPages()](#getCustomPages())
   27. [setCustomPages(HashMap)](#setCustomPages(java.util.HashMap))
   28. [addPage(Integer, String)](#addPage(java.lang.Integer,java.lang.String))
   29. [seePage(Integer)](#seePage(java.lang.Integer))
   30. [isEmptyPages()](#isEmptyPages())
   31. [getLockedBy()](#getLockedBy())
   32. [setLockedBy(String)](#setLockedBy(java.lang.String))
   33. [getPageToWrite()](#getPageToWrite())
   34. [setPageToWrite(int)](#setPageToWrite(int))
   35. [getLearnedRecipes()](#getLearnedRecipes())
   36. [setLearnedRecipes(List)](#setLearnedRecipes(java.util.List))
   37. [getReadType()](#getReadType())
   38. [hasRecipe(String)](#hasRecipe(java.lang.String))
   39. [containsKnownRecipe(IsoGameCharacter)](#containsKnownRecipe(zombie.characters.IsoGameCharacter))
   40. [getKnownRecipes(IsoGameCharacter)](#getKnownRecipes(zombie.characters.IsoGameCharacter))
   41. [containsCraftRecipe()](#containsCraftRecipe())
   42. [containsBuildRecipe()](#containsBuildRecipe())
   43. [containsGrowingSeason()](#containsGrowingSeason())
   44. [containsCraftOrBuildRecipe()](#containsCraftOrBuildRecipe())
   45. [containsMiscRecipe()](#containsMiscRecipe())
   46. [getKnownMiscRecipes(IsoGameCharacter)](#getKnownMiscRecipes(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Literature
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.Literature

---

public final class Literature
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `alreadyRead`

  `private int`

  `alreadyReadPages`

  `private String`

  `bookName`

  `private boolean`

  `canBeWrite`

  `private HashMap<Integer,String>`

  `customPages`

  `private List<String>`

  `learnedRecipes`

  `private String`

  `lockedBy`

  `private int`

  `lvlSkillTrained`

  `private final int`

  `maxTextLength`

  `private int`

  `numberOfPages`

  `private int`

  `numLevelsTrained`

  `private int`

  `pageToWrite`

  `String`

  `requireInHandOrInventory`

  `private String`

  `skillTrained`

  `String`

  `useOnConsume`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Literature(String module,
  String name,
  String itemType,
  String texName)`

  `Literature(String module,
  String name,
  String itemType,
  Item item)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPage(Integer index,
  String text)`

  `boolean`

  `canBeWrite()`

  `boolean`

  `containsBuildRecipe()`

  `boolean`

  `containsCraftOrBuildRecipe()`

  `boolean`

  `containsCraftRecipe()`

  `boolean`

  `containsGrowingSeason()`

  `boolean`

  `containsKnownRecipe(IsoGameCharacter chr)`

  `boolean`

  `containsMiscRecipe()`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `boolean`

  `finishupdate()`

  `int`

  `getAlreadyReadPages()`

  `String`

  `getBookName()`

  `float`

  `getBoredomChange()`

  `String`

  `getCategory()`

  `HashMap<Integer,String>`

  `getCustomPages()`

  `List<String>`

  `getKnownMiscRecipes(IsoGameCharacter chr)`

  `List<String>`

  `getKnownRecipes(IsoGameCharacter chr)`

  `List<String>`

  `getLearnedRecipes()`

  `String`

  `getLockedBy()`

  `int`

  `getLvlSkillTrained()`

  `int`

  `getMaxLevelTrained()`

  `int`

  `getNumberOfPages()`

  `int`

  `getNumLevelsTrained()`

  `int`

  `getPageToWrite()`

  `String`

  `getReadType()`

  `String`

  `getSkillTrained()`

  `float`

  `getStressChange()`

  `float`

  `getUnhappyChange()`

  `boolean`

  `hasRecipe(String recipe)`

  `boolean`

  `isEmptyPages()`

  `boolean`

  `IsLiterature()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `String`

  `seePage(Integer index)`

  `void`

  `setAlreadyReadPages(int alreadyReadPages)`

  `void`

  `setBookName(String bookName)`

  `void`

  `setCanBeWrite(boolean canBeWrite)`

  `void`

  `setCustomPages(HashMap<Integer,String> customPages)`

  `void`

  `setLearnedRecipes(List<String> learnedRecipes)`

  `void`

  `setLockedBy(String lockedBy)`

  `void`

  `setLvlSkillTrained(int lvlSkillTrained)`

  `void`

  `setNumberOfPages(int numberOfPages)`

  `void`

  `setNumLevelsTrained(int numLevelsTrained)`

  `void`

  `setPageToWrite(int pageToWrite)`

  `void`

  `setSkillTrained(String skillTrained)`

  `void`

  `update()`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeActivated, canBeEquipped, canBeRemote, canEmitLight, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, getA, getActualWeight, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevel, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerChance, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getContentsWeight, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCurrentUsesFloat, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLightDistance, getLightStrength, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getName, getName, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScore, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModel, getStaticModelException, getStaticModelsByIndex, getStrainModifier, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getTorchDot, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWeight, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTorchCone, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, IsWeapon, isWet, isWorn, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playActivateSound, playDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivated, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBloodLevel, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setScriptItem, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### alreadyRead

    public boolean alreadyRead
  + ### requireInHandOrInventory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") requireInHandOrInventory
  + ### useOnConsume

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") useOnConsume
  + ### numberOfPages

    private int numberOfPages
  + ### bookName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bookName
  + ### lvlSkillTrained

    private int lvlSkillTrained
  + ### numLevelsTrained

    private int numLevelsTrained
  + ### skillTrained

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skillTrained
  + ### alreadyReadPages

    private int alreadyReadPages
  + ### canBeWrite

    private boolean canBeWrite
  + ### customPages

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> customPages
  + ### lockedBy

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lockedBy
  + ### pageToWrite

    private int pageToWrite
  + ### learnedRecipes

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> learnedRecipes
  + ### maxTextLength

    private final int maxTextLength

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.Literature.maxTextLength)
* Constructor Details
  -------------------

  + ### Literature

    public Literature([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
  + ### Literature

    public Literature([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### IsLiterature

    public boolean IsLiterature()

    Overrides:
    :   `IsLiterature` in class `InventoryItem`
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `InventoryItem`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `InventoryItem`
  + ### finishupdate

    public boolean finishupdate()

    Overrides:
    :   `finishupdate` in class `InventoryItem`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `InventoryItem`
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
  + ### getBoredomChange

    public float getBoredomChange()

    Overrides:
    :   `getBoredomChange` in class `InventoryItem`
  + ### getUnhappyChange

    public float getUnhappyChange()

    Overrides:
    :   `getUnhappyChange` in class `InventoryItem`
  + ### getStressChange

    public float getStressChange()

    Overrides:
    :   `getStressChange` in class `InventoryItem`
  + ### getNumberOfPages

    public int getNumberOfPages()
  + ### setNumberOfPages

    public void setNumberOfPages(int numberOfPages)
  + ### getBookName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBookName()
  + ### setBookName

    public void setBookName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bookName)
  + ### getLvlSkillTrained

    public int getLvlSkillTrained()
  + ### setLvlSkillTrained

    public void setLvlSkillTrained(int lvlSkillTrained)
  + ### getNumLevelsTrained

    public int getNumLevelsTrained()
  + ### setNumLevelsTrained

    public void setNumLevelsTrained(int numLevelsTrained)
  + ### getMaxLevelTrained

    public int getMaxLevelTrained()
  + ### getSkillTrained

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSkillTrained()
  + ### setSkillTrained

    public void setSkillTrained([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skillTrained)
  + ### getAlreadyReadPages

    public int getAlreadyReadPages()
  + ### setAlreadyReadPages

    public void setAlreadyReadPages(int alreadyReadPages)
  + ### canBeWrite

    public boolean canBeWrite()
  + ### setCanBeWrite

    public void setCanBeWrite(boolean canBeWrite)
  + ### getCustomPages

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCustomPages()
  + ### setCustomPages

    public void setCustomPages([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> customPages)
  + ### addPage

    public void addPage([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### seePage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seePage([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### isEmptyPages

    public boolean isEmptyPages()
  + ### getLockedBy

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLockedBy()
  + ### setLockedBy

    public void setLockedBy([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lockedBy)
  + ### getPageToWrite

    public int getPageToWrite()
  + ### setPageToWrite

    public void setPageToWrite(int pageToWrite)
  + ### getLearnedRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLearnedRecipes()
  + ### setLearnedRecipes

    public void setLearnedRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> learnedRecipes)
  + ### getReadType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReadType()
  + ### hasRecipe

    public boolean hasRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### containsKnownRecipe

    public boolean containsKnownRecipe([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getKnownRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKnownRecipes([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### containsCraftRecipe

    public boolean containsCraftRecipe()
  + ### containsBuildRecipe

    public boolean containsBuildRecipe()
  + ### containsGrowingSeason

    public boolean containsGrowingSeason()
  + ### containsCraftOrBuildRecipe

    public boolean containsCraftOrBuildRecipe()
  + ### containsMiscRecipe

    public boolean containsMiscRecipe()
  + ### getKnownMiscRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKnownMiscRecipes([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)