[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoTrap](IsoTrap.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MaximumTrapRadius](#MaximumTrapRadius)
   2. [MaximumChance](#MaximumChance)
   3. [MaximumExplosivePower](#MaximumExplosivePower)
   4. [ExplosionDamageDivisor](#ExplosionDamageDivisor)
   5. [ExplosionDamageVarianceMultiplier](#ExplosionDamageVarianceMultiplier)
   6. [SENSOR\_TIMER](#SENSOR_TIMER)
   7. [timerBeforeExplosion](#timerBeforeExplosion)
   8. [sensorRange](#sensorRange)
   9. [fireRange](#fireRange)
   10. [fireStartingChance](#fireStartingChance)
   11. [fireStartingEnergy](#fireStartingEnergy)
   12. [explosionPower](#explosionPower)
   13. [explosionRange](#explosionRange)
   14. [smokeRange](#smokeRange)
   15. [noiseRange](#noiseRange)
   16. [noiseDuration](#noiseDuration)
   17. [noiseStartTime](#noiseStartTime)
   18. [lastWorldSoundTime](#lastWorldSoundTime)
   19. [extraDamage](#extraDamage)
   20. [remoteControlId](#remoteControlId)
   21. [countDownSound](#countDownSound)
   22. [explosionSound](#explosionSound)
   23. [weapon](#weapon)
   24. [attacker](#attacker)
   25. [instantExplosion](#instantExplosion)
   26. [beep](#beep)
   27. [explosionDuration](#explosionDuration)
   28. [explosionStartTime](#explosionStartTime)
7. [Constructor Details](#constructor-detail)
   1. [IsoTrap(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoTrap(HandWeapon, IsoCell, IsoGridSquare)](#%3Cinit%3E(zombie.inventory.types.HandWeapon,zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
   3. [IsoTrap(IsoGameCharacter, HandWeapon, IsoCell, IsoGridSquare)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
8. [Method Details](#method-detail)
   1. [IsoTrap(IsoGameCharacter, HandWeapon, IsoCell, IsoGridSquare)](#IsoTrap(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
   2. [initSprite(HandWeapon)](#initSprite(zombie.inventory.types.HandWeapon))
   3. [update()](#update())
   4. [updateExplosionDuration()](#updateExplosionDuration())
   5. [refreshSmokeBombSmoke(IsoGridSquare)](#refreshSmokeBombSmoke(zombie.iso.IsoGridSquare))
   6. [updateVictimsInSensorRange()](#updateVictimsInSensorRange())
   7. [updateSounds()](#updateSounds())
   8. [getRenderSquare()](#getRenderSquare())
   9. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   10. [place()](#place())
   11. [triggerExplosion(boolean)](#triggerExplosion(boolean))
   12. [triggerExplosion()](#triggerExplosion())
   13. [getOrCreateEmitter()](#getOrCreateEmitter())
   14. [playExplosionSound()](#playExplosionSound())
   15. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   16. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   17. [addToWorld()](#addToWorld())
   18. [removeFromWorld()](#removeFromWorld())
   19. [getTimerBeforeExplosion()](#getTimerBeforeExplosion())
   20. [setTimerBeforeExplosion(int)](#setTimerBeforeExplosion(int))
   21. [getSensorRange()](#getSensorRange())
   22. [setSensorRange(int)](#setSensorRange(int))
   23. [getFireRange()](#getFireRange())
   24. [setFireRange(int)](#setFireRange(int))
   25. [getFireStartingEnergy()](#getFireStartingEnergy())
   26. [setFireStartingEnergy(int)](#setFireStartingEnergy(int))
   27. [getFireStartingChance()](#getFireStartingChance())
   28. [setFireStartingChance(int)](#setFireStartingChance(int))
   29. [getExplosionPower()](#getExplosionPower())
   30. [setExplosionPower(int)](#setExplosionPower(int))
   31. [getNoiseDuration()](#getNoiseDuration())
   32. [setNoiseDuration(int)](#setNoiseDuration(int))
   33. [getNoiseRange()](#getNoiseRange())
   34. [setNoiseRange(int)](#setNoiseRange(int))
   35. [getExplosionRange()](#getExplosionRange())
   36. [setExplosionRange(int)](#setExplosionRange(int))
   37. [getSmokeRange()](#getSmokeRange())
   38. [setSmokeRange(int)](#setSmokeRange(int))
   39. [getExtraDamage()](#getExtraDamage())
   40. [setExtraDamage(float)](#setExtraDamage(float))
   41. [getObjectName()](#getObjectName())
   42. [getRemoteControlID()](#getRemoteControlID())
   43. [setRemoteControlID(int)](#setRemoteControlID(int))
   44. [getCountDownSound()](#getCountDownSound())
   45. [setCountDownSound(String)](#setCountDownSound(java.lang.String))
   46. [getExplosionSound()](#getExplosionSound())
   47. [setExplosionSound(String)](#setExplosionSound(java.lang.String))
   48. [getExplosionDuration()](#getExplosionDuration())
   49. [setExplosionDuration(int)](#setExplosionDuration(int))
   50. [isExploding()](#isExploding())
   51. [getItem()](#getItem())
   52. [triggerRemote(IsoPlayer, int, int)](#triggerRemote(zombie.characters.IsoPlayer,int,int))
   53. [isInstantExplosion()](#isInstantExplosion())
   54. [setInstantExplosion(boolean)](#setInstantExplosion(boolean))
   55. [shouldPlaceInWorldAfterThrowing()](#shouldPlaceInWorldAfterThrowing())
   56. [getHandWeapon()](#getHandWeapon())
   57. [getAttacker()](#getAttacker())
   58. [drawCircleExplosion(IsoGridSquare, int, IsoTrap.ExplosionMode)](#drawCircleExplosion(zombie.iso.IsoGridSquare,int,zombie.iso.objects.IsoTrap.ExplosionMode))
   59. [shouldProcess(IsoGameCharacter)](#shouldProcess(zombie.characters.IsoGameCharacter))
   60. [explosion(IsoGridSquare)](#explosion(zombie.iso.IsoGridSquare))
   61. [smoke(IsoGridSquare)](#smoke(zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoTrap
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoTrap

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IItemProvider, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoTrap
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.IItemProvider

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoTrap)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `IsoTrap.ExplosionMode`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoGameCharacter`

  `attacker`

  `private final zombie.core.utils.GameTimer`

  `beep`

  `private String`

  `countDownSound`

  `private static final int`

  `ExplosionDamageDivisor`

  `private static final float`

  `ExplosionDamageVarianceMultiplier`

  `private int`

  `explosionDuration`

  `private int`

  `explosionPower`

  `private int`

  `explosionRange`

  `private String`

  `explosionSound`

  `private float`

  `explosionStartTime`

  `private float`

  `extraDamage`

  `private int`

  `fireRange`

  `private int`

  `fireStartingChance`

  `private int`

  `fireStartingEnergy`

  `private boolean`

  `instantExplosion`

  `private float`

  `lastWorldSoundTime`

  `private static final int`

  `MaximumChance`

  `private static final int`

  `MaximumExplosivePower`

  `private static final int`

  `MaximumTrapRadius`

  `private int`

  `noiseDuration`

  `private int`

  `noiseRange`

  `private float`

  `noiseStartTime`

  `private int`

  `remoteControlId`

  `private static final zombie.core.utils.OnceEvery`

  `SENSOR_TIMER`

  `private int`

  `sensorRange`

  `private int`

  `smokeRange`

  `private int`

  `timerBeforeExplosion`

  `private HandWeapon`

  `weapon`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoTrap(IsoGameCharacter attacker,
  HandWeapon weapon,
  IsoCell cell,
  IsoGridSquare sq)`

  `IsoTrap(HandWeapon weapon,
  IsoCell cell,
  IsoGridSquare sq)`

  `IsoTrap(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addToWorld()`

  `private void`

  `drawCircleExplosion(IsoGridSquare square,
  int radius,
  IsoTrap.ExplosionMode explosionMode)`

  `private void`

  `explosion(IsoGridSquare isoGridSquare)`

  `IsoGameCharacter`

  `getAttacker()`

  `String`

  `getCountDownSound()`

  `int`

  `getExplosionDuration()`

  `int`

  `getExplosionPower()`

  `int`

  `getExplosionRange()`

  `String`

  `getExplosionSound()`

  `float`

  `getExtraDamage()`

  `int`

  `getFireRange()`

  `int`

  `getFireStartingChance()`

  `int`

  `getFireStartingEnergy()`

  `HandWeapon`

  `getHandWeapon()`

  `InventoryItem`

  `getItem()`

  `int`

  `getNoiseDuration()`

  `int`

  `getNoiseRange()`

  `String`

  `getObjectName()`

  `private BaseSoundEmitter`

  `getOrCreateEmitter()`

  `int`

  `getRemoteControlID()`

  `IsoGridSquare`

  `getRenderSquare()`

  `int`

  `getSensorRange()`

  `int`

  `getSmokeRange()`

  `int`

  `getTimerBeforeExplosion()`

  `private void`

  `initSprite(HandWeapon weapon)`

  `boolean`

  `isExploding()`

  `boolean`

  `isInstantExplosion()`

  `private void`

  `IsoTrap(IsoGameCharacter attacker,
  HandWeapon weapon,
  IsoCell cell,
  IsoGridSquare sq)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `place()`

  `void`

  `playExplosionSound()`

  `private void`

  `refreshSmokeBombSmoke(IsoGridSquare explodedSquare)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoChild,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setCountDownSound(String sound)`

  `void`

  `setExplosionDuration(int minutes)`

  `void`

  `setExplosionPower(int explosionPower)`

  `void`

  `setExplosionRange(int explosionRange)`

  `void`

  `setExplosionSound(String explosionSound)`

  `void`

  `setExtraDamage(float extraDamage)`

  `void`

  `setFireRange(int fireRange)`

  `void`

  `setFireStartingChance(int fireStartingChance)`

  `void`

  `setFireStartingEnergy(int fireStartingEnergy)`

  `void`

  `setInstantExplosion(boolean instantExplosion)`

  `void`

  `setNoiseDuration(int noiseDuration)`

  `void`

  `setNoiseRange(int noiseRange)`

  `void`

  `setRemoteControlID(int remoteControlId)`

  `void`

  `setSensorRange(int sensorRange)`

  `void`

  `setSmokeRange(int smokeRange)`

  `void`

  `setTimerBeforeExplosion(int timerBeforeExplosion)`

  `boolean`

  `shouldPlaceInWorldAfterThrowing()`

  `private boolean`

  `shouldProcess(IsoGameCharacter target)`

  `private void`

  `smoke(IsoGridSquare isoGridSquare)`

  `void`

  `triggerExplosion()`

  `void`

  `triggerExplosion(boolean sensor)`

  Deprecated.

  `static void`

  `triggerRemote(IsoPlayer player,
  int remoteID,
  int range)`

  `void`

  `update()`

  `private boolean`

  `updateExplosionDuration()`

  `private void`

  `updateSounds()`

  `private void`

  `updateVictimsInSensorRange()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### MaximumTrapRadius

    private static final int MaximumTrapRadius

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTrap.MaximumTrapRadius)
  + ### MaximumChance

    private static final int MaximumChance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTrap.MaximumChance)
  + ### MaximumExplosivePower

    private static final int MaximumExplosivePower

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTrap.MaximumExplosivePower)
  + ### ExplosionDamageDivisor

    private static final int ExplosionDamageDivisor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTrap.ExplosionDamageDivisor)
  + ### ExplosionDamageVarianceMultiplier

    private static final float ExplosionDamageVarianceMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTrap.ExplosionDamageVarianceMultiplier)
  + ### SENSOR\_TIMER

    private static final zombie.core.utils.OnceEvery SENSOR\_TIMER
  + ### timerBeforeExplosion

    private int timerBeforeExplosion
  + ### sensorRange

    private int sensorRange
  + ### fireRange

    private int fireRange
  + ### fireStartingChance

    private int fireStartingChance
  + ### fireStartingEnergy

    private int fireStartingEnergy
  + ### explosionPower

    private int explosionPower
  + ### explosionRange

    private int explosionRange
  + ### smokeRange

    private int smokeRange
  + ### noiseRange

    private int noiseRange
  + ### noiseDuration

    private int noiseDuration
  + ### noiseStartTime

    private float noiseStartTime
  + ### lastWorldSoundTime

    private float lastWorldSoundTime
  + ### extraDamage

    private float extraDamage
  + ### remoteControlId

    private int remoteControlId
  + ### countDownSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") countDownSound
  + ### explosionSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") explosionSound
  + ### weapon

    private [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon
  + ### attacker

    private [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") attacker
  + ### instantExplosion

    private boolean instantExplosion
  + ### beep

    private final zombie.core.utils.GameTimer beep
  + ### explosionDuration

    private int explosionDuration
  + ### explosionStartTime

    private float explosionStartTime
* Constructor Details
  -------------------

  + ### IsoTrap

    public IsoTrap([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoTrap

    public IsoTrap([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### IsoTrap

    public IsoTrap([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") attacker,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
* Method Details
  --------------

  + ### IsoTrap

    private void IsoTrap([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") attacker,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### initSprite

    private void initSprite([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateExplosionDuration

    private boolean updateExplosionDuration()
  + ### refreshSmokeBombSmoke

    private void refreshSmokeBombSmoke([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") explodedSquare)
  + ### updateVictimsInSensorRange

    private void updateVictimsInSensorRange()
  + ### updateSounds

    private void updateSounds()
  + ### getRenderSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRenderSquare()

    Overrides:
    :   `getRenderSquare` in class `IsoObject`
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoChild,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Attempt to render this Renderable.   
    It will not draw if isSceneCulled == TRUE,   
    or if isDoRender == FALSE

    Specified by:
    :   `render` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `render` in class `IsoObject`
  + ### place

    public void place()
  + ### triggerExplosion

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void triggerExplosion(boolean sensor)

    Deprecated.
  + ### triggerExplosion

    public void triggerExplosion()
  + ### getOrCreateEmitter

    private [BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") getOrCreateEmitter()
  + ### playExplosionSound

    public void playExplosionSound()
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
  + ### getTimerBeforeExplosion

    public int getTimerBeforeExplosion()
  + ### setTimerBeforeExplosion

    public void setTimerBeforeExplosion(int timerBeforeExplosion)
  + ### getSensorRange

    public int getSensorRange()
  + ### setSensorRange

    public void setSensorRange(int sensorRange)
  + ### getFireRange

    public int getFireRange()
  + ### setFireRange

    public void setFireRange(int fireRange)
  + ### getFireStartingEnergy

    public int getFireStartingEnergy()
  + ### setFireStartingEnergy

    public void setFireStartingEnergy(int fireStartingEnergy)
  + ### getFireStartingChance

    public int getFireStartingChance()
  + ### setFireStartingChance

    public void setFireStartingChance(int fireStartingChance)
  + ### getExplosionPower

    public int getExplosionPower()
  + ### setExplosionPower

    public void setExplosionPower(int explosionPower)
  + ### getNoiseDuration

    public int getNoiseDuration()
  + ### setNoiseDuration

    public void setNoiseDuration(int noiseDuration)
  + ### getNoiseRange

    public int getNoiseRange()
  + ### setNoiseRange

    public void setNoiseRange(int noiseRange)
  + ### getExplosionRange

    public int getExplosionRange()
  + ### setExplosionRange

    public void setExplosionRange(int explosionRange)
  + ### getSmokeRange

    public int getSmokeRange()
  + ### setSmokeRange

    public void setSmokeRange(int smokeRange)
  + ### getExtraDamage

    public float getExtraDamage()
  + ### setExtraDamage

    public void setExtraDamage(float extraDamage)
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### getRemoteControlID

    public int getRemoteControlID()
  + ### setRemoteControlID

    public void setRemoteControlID(int remoteControlId)
  + ### getCountDownSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCountDownSound()
  + ### setCountDownSound

    public void setCountDownSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### getExplosionSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getExplosionSound()
  + ### setExplosionSound

    public void setExplosionSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") explosionSound)
  + ### getExplosionDuration

    public int getExplosionDuration()
  + ### setExplosionDuration

    public void setExplosionDuration(int minutes)
  + ### isExploding

    public boolean isExploding()
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()

    Specified by:
    :   `getItem` in interface `zombie.iso.IItemProvider`
  + ### triggerRemote

    public static void triggerRemote([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    int remoteID,
    int range)
  + ### isInstantExplosion

    public boolean isInstantExplosion()
  + ### setInstantExplosion

    public void setInstantExplosion(boolean instantExplosion)
  + ### shouldPlaceInWorldAfterThrowing

    public boolean shouldPlaceInWorldAfterThrowing()
  + ### getHandWeapon

    public [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") getHandWeapon()
  + ### getAttacker

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getAttacker()
  + ### drawCircleExplosion

    private void drawCircleExplosion([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    int radius,
    [IsoTrap.ExplosionMode](IsoTrap.ExplosionMode.html "enum class in zombie.iso.objects") explosionMode)
  + ### shouldProcess

    private boolean shouldProcess([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") target)
  + ### explosion

    private void explosion([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") isoGridSquare)
  + ### smoke

    private void smoke([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") isoGridSquare)