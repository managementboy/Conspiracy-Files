[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoGenerator](IsoGenerator.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MaximumGeneratorCondition](#MaximumGeneratorCondition)
   2. [MaximumGeneratorFuel](#MaximumGeneratorFuel)
   3. [GeneratorMinimumCondition](#GeneratorMinimumCondition)
   4. [GeneratorCriticalCondition](#GeneratorCriticalCondition)
   5. [GeneratorWarningCondition](#GeneratorWarningCondition)
   6. [GeneratorLowCondition](#GeneratorLowCondition)
   7. [GeneratorBackfireChanceCritical](#GeneratorBackfireChanceCritical)
   8. [GeneratorBackfireChanceWarning](#GeneratorBackfireChanceWarning)
   9. [GeneratorBackfireChanceLow](#GeneratorBackfireChanceLow)
   10. [GeneratorFireChance](#GeneratorFireChance)
   11. [GeneratorExplodeChance](#GeneratorExplodeChance)
   12. [GeneratorSoundOffset](#GeneratorSoundOffset)
   13. [GeneratorDefaultSoundRadius](#GeneratorDefaultSoundRadius)
   14. [GeneratorDefaultSoundVolume](#GeneratorDefaultSoundVolume)
   15. [GeneratorConditionLowerChanceDefault](#GeneratorConditionLowerChanceDefault)
   16. [GeneratorBasePowerConsumption](#GeneratorBasePowerConsumption)
   17. [generatorVerticalPowerRange](#generatorVerticalPowerRange)
   18. [IsoGeneratorFireStartingEnergy](#IsoGeneratorFireStartingEnergy)
   19. [generatorChunkRange](#generatorChunkRange)
   20. [GeneratorMinZ](#GeneratorMinZ)
   21. [GeneratorMaxZ](#GeneratorMaxZ)
   22. [ClothingAppliancePowerConsumption](#ClothingAppliancePowerConsumption)
   23. [TelevisionPowerConsumption](#TelevisionPowerConsumption)
   24. [RadioPowerConsumption](#RadioPowerConsumption)
   25. [StovePowerConsumption](#StovePowerConsumption)
   26. [FridgeFreezerPowerConsumption](#FridgeFreezerPowerConsumption)
   27. [SingleFridgeOrFreezerPowerConsumption](#SingleFridgeOrFreezerPowerConsumption)
   28. [LightSwitchPowerConsumption](#LightSwitchPowerConsumption)
   29. [PipedFuelPowerConsumption](#PipedFuelPowerConsumption)
   30. [BatteryChargerPowerConsumption](#BatteryChargerPowerConsumption)
   31. [StackedWasherDryerPowerConsumption](#StackedWasherDryerPowerConsumption)
   32. [fuel](#fuel)
   33. [activated](#activated)
   34. [condition](#condition)
   35. [lastHour](#lastHour)
   36. [connected](#connected)
   37. [updateSurrounding](#updateSurrounding)
   38. [itemsPowered](#itemsPowered)
   39. [totalPowerUsing](#totalPowerUsing)
   40. [AllGenerators](#AllGenerators)
   41. [generatorRadius](#generatorRadius)
   42. [GENERATOR\_SOUND\_RADIUS](#GENERATOR_SOUND_RADIUS)
   43. [GENERATOR\_SOUND\_VOLUME](#GENERATOR_SOUND_VOLUME)
   44. [DEFAULT\_GENERATOR\_TYPE](#DEFAULT_GENERATOR_TYPE)
   45. [generatorSpriteToType](#generatorSpriteToType)
   46. [decimalFormat](#decimalFormat)
   47. [decimalFormatB](#decimalFormatB)
7. [Constructor Details](#constructor-detail)
   1. [IsoGenerator(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoGenerator(InventoryItem, IsoCell, IsoGridSquare)](#%3Cinit%3E(zombie.inventory.InventoryItem,zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
8. [Method Details](#method-detail)
   1. [setGeneratorRange()](#setGeneratorRange())
   2. [getMinAffectedLevel()](#getMinAffectedLevel())
   3. [getMaxAffectedLevel()](#getMaxAffectedLevel())
   4. [setInfoFromItem(InventoryItem)](#setInfoFromItem(zombie.inventory.InventoryItem))
   5. [getGeneratorSpriteToType()](#getGeneratorSpriteToType())
   6. [getGeneratorItemType()](#getGeneratorItemType())
   7. [update()](#update())
   8. [setSurroundingElectricity()](#setSurroundingElectricity())
   9. [addPoweredItem(IsoObject, float)](#addPoweredItem(zombie.iso.IsoObject,float))
   10. [updateFridgeFreezerItems(IsoObject)](#updateFridgeFreezerItems(zombie.iso.IsoObject))
   11. [updateFridgeFreezerItems(IsoGridSquare)](#updateFridgeFreezerItems(zombie.iso.IsoGridSquare))
   12. [updateFridgeFreezerItems()](#updateFridgeFreezerItems())
   13. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   14. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   15. [remove()](#remove())
   16. [addToWorld()](#addToWorld())
   17. [removeFromWorld()](#removeFromWorld())
   18. [getObjectName()](#getObjectName())
   19. [shouldShowOnOverlay()](#shouldShowOnOverlay())
   20. [getBasePowerConsumption()](#getBasePowerConsumption())
   21. [getBasePowerConsumptionString()](#getBasePowerConsumptionString())
   22. [getFuel()](#getFuel())
   23. [getFuelPercentage()](#getFuelPercentage())
   24. [getMaxFuel()](#getMaxFuel())
   25. [setFuel(float)](#setFuel(float))
   26. [isActivated()](#isActivated())
   27. [setActivated(boolean)](#setActivated(boolean))
   28. [failToStart()](#failToStart())
   29. [getCondition()](#getCondition())
   30. [setCondition(int)](#setCondition(int))
   31. [isConnected()](#isConnected())
   32. [setConnected(boolean)](#setConnected(boolean))
   33. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   34. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   35. [touchesChunk(IsoChunk)](#touchesChunk(zombie.iso.IsoChunk))
   36. [chunkLoaded(IsoChunk)](#chunkLoaded(zombie.iso.IsoChunk))
   37. [updateSurroundingNow()](#updateSurroundingNow())
   38. [updateGenerator(IsoGridSquare)](#updateGenerator(zombie.iso.IsoGridSquare))
   39. [Reset()](#Reset())
   40. [isPoweringSquare(int, int, int, int, int, int)](#isPoweringSquare(int,int,int,int,int,int))
   41. [getItemsPowered()](#getItemsPowered())
   42. [getTotalPowerUsing()](#getTotalPowerUsing())
   43. [getTotalPowerUsingString()](#getTotalPowerUsingString())
   44. [setTotalPowerUsing(float)](#setTotalPowerUsing(float))
   45. [getSoundPrefix()](#getSoundPrefix())
   46. [stopAllSounds()](#stopAllSounds())
   47. [playGeneratorSound(String)](#playGeneratorSound(java.lang.String))
   48. [playGeneratorSound(BaseSoundEmitter, String)](#playGeneratorSound(zombie.audio.BaseSoundEmitter,java.lang.String))
   49. [explode(IsoGridSquare)](#explode(zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoGenerator
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoGenerator

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoGenerator
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoGenerator)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `activated`

  `private static final ArrayList<IsoGenerator>`

  `AllGenerators`

  `static final float`

  `BatteryChargerPowerConsumption`

  `static final float`

  `ClothingAppliancePowerConsumption`

  `int`

  `condition`

  `boolean`

  `connected`

  `private static final DecimalFormat`

  `decimalFormat`

  `private static final DecimalFormat`

  `decimalFormatB`

  `private static final String`

  `DEFAULT_GENERATOR_TYPE`

  `static final float`

  `FridgeFreezerPowerConsumption`

  `float`

  `fuel`

  `private static final int`

  `GENERATOR_SOUND_RADIUS`

  `private static final int`

  `GENERATOR_SOUND_VOLUME`

  `private static final int`

  `GeneratorBackfireChanceCritical`

  `private static final int`

  `GeneratorBackfireChanceLow`

  `private static final int`

  `GeneratorBackfireChanceWarning`

  `private static final float`

  `GeneratorBasePowerConsumption`

  `private static int`

  `generatorChunkRange`

  `private static final int`

  `GeneratorConditionLowerChanceDefault`

  `private static final int`

  `GeneratorCriticalCondition`

  `private static final int`

  `GeneratorDefaultSoundRadius`

  `private static final int`

  `GeneratorDefaultSoundVolume`

  `private static final int`

  `GeneratorExplodeChance`

  `private static final int`

  `GeneratorFireChance`

  `private static final int`

  `GeneratorLowCondition`

  `private static final int`

  `GeneratorMaxZ`

  `private static final int`

  `GeneratorMinimumCondition`

  `private static final int`

  `GeneratorMinZ`

  `private static int`

  `generatorRadius`

  `private static final float`

  `GeneratorSoundOffset`

  `private static HashMap<String,String>`

  `generatorSpriteToType`

  `private static int`

  `generatorVerticalPowerRange`

  `private static final int`

  `GeneratorWarningCondition`

  `private static final int`

  `IsoGeneratorFireStartingEnergy`

  `private final HashMap<String,String>`

  `itemsPowered`

  `private int`

  `lastHour`

  `static final float`

  `LightSwitchPowerConsumption`

  `private static final int`

  `MaximumGeneratorCondition`

  `private static final float`

  `MaximumGeneratorFuel`

  `static final float`

  `PipedFuelPowerConsumption`

  `static final float`

  `RadioPowerConsumption`

  `static final float`

  `SingleFridgeOrFreezerPowerConsumption`

  `static final float`

  `StackedWasherDryerPowerConsumption`

  `static final float`

  `StovePowerConsumption`

  `static final float`

  `TelevisionPowerConsumption`

  `private float`

  `totalPowerUsing`

  `private boolean`

  `updateSurrounding`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoGenerator(InventoryItem item,
  IsoCell cell,
  IsoGridSquare sq)`

  `IsoGenerator(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addPoweredItem(IsoObject obj,
  float powerConsumption)`

  `void`

  `addToWorld()`

  `static void`

  `chunkLoaded(IsoChunk chunk)`

  `private void`

  `explode(IsoGridSquare isoGridSquare)`

  `void`

  `failToStart()`

  `double`

  `getBasePowerConsumption()`

  `String`

  `getBasePowerConsumptionString()`

  `int`

  `getCondition()`

  `float`

  `getFuel()`

  `float`

  `getFuelPercentage()`

  `String`

  `getGeneratorItemType()`

  `private static HashMap<String,String>`

  `getGeneratorSpriteToType()`

  `ArrayList<String>`

  `getItemsPowered()`

  `int`

  `getMaxAffectedLevel()`

  `float`

  `getMaxFuel()`

  `int`

  `getMinAffectedLevel()`

  `String`

  `getObjectName()`

  `String`

  `getSoundPrefix()`

  `float`

  `getTotalPowerUsing()`

  `String`

  `getTotalPowerUsingString()`

  `boolean`

  `isActivated()`

  `boolean`

  `isConnected()`

  `static boolean`

  `isPoweringSquare(int generatorX,
  int generatorY,
  int generatorZ,
  int x,
  int y,
  int z)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `private void`

  `playGeneratorSound(String suffix)`

  `private void`

  `playGeneratorSound(BaseSoundEmitter emitter,
  String suffix)`

  `void`

  `remove()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `static void`

  `Reset()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setActivated(boolean activated)`

  `void`

  `setCondition(int condition)`

  `void`

  `setConnected(boolean connected)`

  `void`

  `setFuel(float fuel)`

  `private void`

  `setGeneratorRange()`

  `void`

  `setInfoFromItem(InventoryItem item)`

  `void`

  `setSurroundingElectricity()`

  `void`

  `setTotalPowerUsing(float totalPowerUsing)`

  `boolean`

  `shouldShowOnOverlay()`

  `private void`

  `stopAllSounds()`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `private boolean`

  `touchesChunk(IsoChunk chunk)`

  `void`

  `update()`

  `private void`

  `updateFridgeFreezerItems()`

  `private void`

  `updateFridgeFreezerItems(IsoGridSquare square)`

  `private void`

  `updateFridgeFreezerItems(IsoObject object)`

  `static void`

  `updateGenerator(IsoGridSquare sq)`

  `static void`

  `updateSurroundingNow()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### MaximumGeneratorCondition

    private static final int MaximumGeneratorCondition

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.MaximumGeneratorCondition)
  + ### MaximumGeneratorFuel

    private static final float MaximumGeneratorFuel

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.MaximumGeneratorFuel)
  + ### GeneratorMinimumCondition

    private static final int GeneratorMinimumCondition

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorMinimumCondition)
  + ### GeneratorCriticalCondition

    private static final int GeneratorCriticalCondition

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorCriticalCondition)
  + ### GeneratorWarningCondition

    private static final int GeneratorWarningCondition

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorWarningCondition)
  + ### GeneratorLowCondition

    private static final int GeneratorLowCondition

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorLowCondition)
  + ### GeneratorBackfireChanceCritical

    private static final int GeneratorBackfireChanceCritical

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorBackfireChanceCritical)
  + ### GeneratorBackfireChanceWarning

    private static final int GeneratorBackfireChanceWarning

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorBackfireChanceWarning)
  + ### GeneratorBackfireChanceLow

    private static final int GeneratorBackfireChanceLow

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorBackfireChanceLow)
  + ### GeneratorFireChance

    private static final int GeneratorFireChance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorFireChance)
  + ### GeneratorExplodeChance

    private static final int GeneratorExplodeChance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorExplodeChance)
  + ### GeneratorSoundOffset

    private static final float GeneratorSoundOffset

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorSoundOffset)
  + ### GeneratorDefaultSoundRadius

    private static final int GeneratorDefaultSoundRadius

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorDefaultSoundRadius)
  + ### GeneratorDefaultSoundVolume

    private static final int GeneratorDefaultSoundVolume

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorDefaultSoundVolume)
  + ### GeneratorConditionLowerChanceDefault

    private static final int GeneratorConditionLowerChanceDefault

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorConditionLowerChanceDefault)
  + ### GeneratorBasePowerConsumption

    private static final float GeneratorBasePowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorBasePowerConsumption)
  + ### generatorVerticalPowerRange

    private static int generatorVerticalPowerRange
  + ### IsoGeneratorFireStartingEnergy

    private static final int IsoGeneratorFireStartingEnergy

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.IsoGeneratorFireStartingEnergy)
  + ### generatorChunkRange

    private static int generatorChunkRange
  + ### GeneratorMinZ

    private static final int GeneratorMinZ

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorMinZ)
  + ### GeneratorMaxZ

    private static final int GeneratorMaxZ

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GeneratorMaxZ)
  + ### ClothingAppliancePowerConsumption

    public static final float ClothingAppliancePowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.ClothingAppliancePowerConsumption)
  + ### TelevisionPowerConsumption

    public static final float TelevisionPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.TelevisionPowerConsumption)
  + ### RadioPowerConsumption

    public static final float RadioPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.RadioPowerConsumption)
  + ### StovePowerConsumption

    public static final float StovePowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.StovePowerConsumption)
  + ### FridgeFreezerPowerConsumption

    public static final float FridgeFreezerPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.FridgeFreezerPowerConsumption)
  + ### SingleFridgeOrFreezerPowerConsumption

    public static final float SingleFridgeOrFreezerPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.SingleFridgeOrFreezerPowerConsumption)
  + ### LightSwitchPowerConsumption

    public static final float LightSwitchPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.LightSwitchPowerConsumption)
  + ### PipedFuelPowerConsumption

    public static final float PipedFuelPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.PipedFuelPowerConsumption)
  + ### BatteryChargerPowerConsumption

    public static final float BatteryChargerPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.BatteryChargerPowerConsumption)
  + ### StackedWasherDryerPowerConsumption

    public static final float StackedWasherDryerPowerConsumption

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.StackedWasherDryerPowerConsumption)
  + ### fuel

    public float fuel
  + ### activated

    public boolean activated
  + ### condition

    public int condition
  + ### lastHour

    private int lastHour
  + ### connected

    public boolean connected
  + ### updateSurrounding

    private boolean updateSurrounding
  + ### itemsPowered

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemsPowered
  + ### totalPowerUsing

    private float totalPowerUsing
  + ### AllGenerators

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGenerator](IsoGenerator.html "class in zombie.iso.objects")> AllGenerators
  + ### generatorRadius

    private static int generatorRadius
  + ### GENERATOR\_SOUND\_RADIUS

    private static final int GENERATOR\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GENERATOR_SOUND_RADIUS)
  + ### GENERATOR\_SOUND\_VOLUME

    private static final int GENERATOR\_SOUND\_VOLUME

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.GENERATOR_SOUND_VOLUME)
  + ### DEFAULT\_GENERATOR\_TYPE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_GENERATOR\_TYPE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoGenerator.DEFAULT_GENERATOR_TYPE)
  + ### generatorSpriteToType

    private static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> generatorSpriteToType
  + ### decimalFormat

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") decimalFormat
  + ### decimalFormatB

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") decimalFormatB
* Constructor Details
  -------------------

  + ### IsoGenerator

    public IsoGenerator([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoGenerator

    public IsoGenerator([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
* Method Details
  --------------

  + ### setGeneratorRange

    private void setGeneratorRange()
  + ### getMinAffectedLevel

    public int getMinAffectedLevel()
  + ### getMaxAffectedLevel

    public int getMaxAffectedLevel()
  + ### setInfoFromItem

    public void setInfoFromItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getGeneratorSpriteToType

    private static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGeneratorSpriteToType()
  + ### getGeneratorItemType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGeneratorItemType()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### setSurroundingElectricity

    public void setSurroundingElectricity()
  + ### addPoweredItem

    private void addPoweredItem([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float powerConsumption)
  + ### updateFridgeFreezerItems

    private void updateFridgeFreezerItems([IsoObject](../IsoObject.html "class in zombie.iso") object)
  + ### updateFridgeFreezerItems

    private void updateFridgeFreezerItems([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### updateFridgeFreezerItems

    private void updateFridgeFreezerItems()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### remove

    public void remove()
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### shouldShowOnOverlay

    public boolean shouldShowOnOverlay()

    Overrides:
    :   `shouldShowOnOverlay` in class `IsoObject`
  + ### getBasePowerConsumption

    public double getBasePowerConsumption()
  + ### getBasePowerConsumptionString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBasePowerConsumptionString()
  + ### getFuel

    public float getFuel()
  + ### getFuelPercentage

    public float getFuelPercentage()
  + ### getMaxFuel

    public float getMaxFuel()
  + ### setFuel

    public void setFuel(float fuel)
  + ### isActivated

    public boolean isActivated()
  + ### setActivated

    public void setActivated(boolean activated)
  + ### failToStart

    public void failToStart()
  + ### getCondition

    public int getCondition()
  + ### setCondition

    public void setCondition(int condition)
  + ### isConnected

    public boolean isConnected()
  + ### setConnected

    public void setConnected(boolean connected)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### touchesChunk

    private boolean touchesChunk([IsoChunk](../IsoChunk.html "class in zombie.iso") chunk)
  + ### chunkLoaded

    public static void chunkLoaded([IsoChunk](../IsoChunk.html "class in zombie.iso") chunk)
  + ### updateSurroundingNow

    public static void updateSurroundingNow()
  + ### updateGenerator

    public static void updateGenerator([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### Reset

    public static void Reset()
  + ### isPoweringSquare

    public static boolean isPoweringSquare(int generatorX,
    int generatorY,
    int generatorZ,
    int x,
    int y,
    int z)
  + ### getItemsPowered

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getItemsPowered()
  + ### getTotalPowerUsing

    public float getTotalPowerUsing()
  + ### getTotalPowerUsingString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTotalPowerUsingString()
  + ### setTotalPowerUsing

    public void setTotalPowerUsing(float totalPowerUsing)
  + ### getSoundPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundPrefix()
  + ### stopAllSounds

    private void stopAllSounds()
  + ### playGeneratorSound

    private void playGeneratorSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### playGeneratorSound

    private void playGeneratorSound([BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### explode

    private void explode([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") isoGridSquare)