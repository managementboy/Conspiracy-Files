[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoFire](IsoFire.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [LIGHT\_RADIUS\_MINIMUM](#LIGHT_RADIUS_MINIMUM)
   2. [LIGHT\_RADIUS\_LOW](#LIGHT_RADIUS_LOW)
   3. [LIGHT\_RADIUS\_MEDIUM](#LIGHT_RADIUS_MEDIUM)
   4. [LIGHT\_RADIUS\_HIGH](#LIGHT_RADIUS_HIGH)
   5. [NUM\_FRAMES\_FIRE](#NUM_FRAMES_FIRE)
   6. [NUM\_FRAMES\_SMOKE](#NUM_FRAMES_SMOKE)
   7. [tempColorInfo](#tempColorInfo)
   8. [DefaultEnergyRequirement](#DefaultEnergyRequirement)
   9. [VegetationEnergyBonus](#VegetationEnergyBonus)
   10. [InteriorEnergyRequirement](#InteriorEnergyRequirement)
   11. [TutorialEnergyDivisor](#TutorialEnergyDivisor)
   12. [MaxLife](#MaxLife)
   13. [MinLife](#MinLife)
   14. [age](#age)
   15. [energy](#energy)
   16. [life](#life)
   17. [lifeStage](#lifeStage)
   18. [lifeStageDuration](#lifeStageDuration)
   19. [lifeStageTimer](#lifeStageTimer)
   20. [spreadDelay](#spreadDelay)
   21. [spreadTimer](#spreadTimer)
   22. [numFlameParticles](#numFlameParticles)
   23. [perm](#perm)
   24. [smoke](#smoke)
   25. [lightSource](#lightSource)
   26. [lightRadius](#lightRadius)
   27. [lightOscillator](#lightOscillator)
   28. [heatSource](#heatSource)
   29. [savedUpdateTime](#savedUpdateTime)
   30. [LIGHT\_R](#LIGHT_R)
   31. [LIGHT\_G](#LIGHT_G)
   32. [LIGHT\_B](#LIGHT_B)
   33. [accum](#accum)
   34. [soffX](#soffX)
   35. [soffY](#soffY)
7. [Constructor Details](#constructor-detail)
   1. [IsoFire(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoFire(IsoCell, IsoGridSquare)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
   3. [IsoFire(IsoCell, IsoGridSquare, boolean, int, int, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int,int,boolean))
   4. [IsoFire(IsoCell, IsoGridSquare, boolean, int, int)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int,int))
   5. [IsoFire(IsoCell, IsoGridSquare, boolean, int)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   3. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   4. [CanAddSmoke(IsoGridSquare, boolean)](#CanAddSmoke(zombie.iso.IsoGridSquare,boolean))
   5. [CanAddFire(IsoGridSquare, boolean)](#CanAddFire(zombie.iso.IsoGridSquare,boolean))
   6. [CanAddFire(IsoGridSquare, boolean, boolean)](#CanAddFire(zombie.iso.IsoGridSquare,boolean,boolean))
   7. [Fire\_IsSquareFlamable(IsoGridSquare)](#Fire_IsSquareFlamable(zombie.iso.IsoGridSquare))
   8. [Spread()](#Spread())
   9. [TestCollide(IsoMovingObject, IsoGridSquare)](#TestCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare))
   10. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   11. [update()](#update())
   12. [updateSinceLastLoaded()](#updateSinceLastLoaded())
   13. [updateFromTimer(float)](#updateFromTimer(float))
   14. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   15. [extinctFire()](#extinctFire())
   16. [getSquaresEnergyRequirement(IsoGridSquare)](#getSquaresEnergyRequirement(zombie.iso.IsoGridSquare))
   17. [setSpreadDelay(int)](#setSpreadDelay(int))
   18. [getSpreadDelay()](#getSpreadDelay())
   19. [setLife(int)](#setLife(int))
   20. [getLife()](#getLife())
   21. [getEnergy()](#getEnergy())
   22. [isPermanent()](#isPermanent())
   23. [setLifeStage(int)](#setLifeStage(int))
   24. [setLightRadius(int)](#setLightRadius(int))
   25. [getLightRadius()](#getLightRadius())
   26. [addToWorld()](#addToWorld())
   27. [removeFromWorld()](#removeFromWorld())
   28. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   29. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   30. [isCampfire()](#isCampfire())
   31. [hasAnimatedAttachments()](#hasAnimatedAttachments())
   32. [renderAnimatedAttachments(float, float, float, ColorInfo)](#renderAnimatedAttachments(float,float,float,zombie.core.textures.ColorInfo))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFire
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoFire

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoFire
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoFire)

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

  `private float`

  `accum`

  `int`

  `age`

  `private static final int`

  `DefaultEnergyRequirement`

  `int`

  `energy`

  `private IsoHeatSource`

  `heatSource`

  `private static final int`

  `InteriorEnergyRequirement`

  `int`

  `life`

  `int`

  `lifeStage`

  `int`

  `lifeStageDuration`

  `int`

  `lifeStageTimer`

  `static final float`

  `LIGHT_B`

  `static final float`

  `LIGHT_G`

  `static final float`

  `LIGHT_R`

  `static final int`

  `LIGHT_RADIUS_HIGH`

  `static final int`

  `LIGHT_RADIUS_LOW`

  `static final int`

  `LIGHT_RADIUS_MEDIUM`

  `static final int`

  `LIGHT_RADIUS_MINIMUM`

  `float`

  `lightOscillator`

  `int`

  `lightRadius`

  `IsoLightSource`

  `lightSource`

  `static final int`

  `MaxLife`

  `static final int`

  `MinLife`

  `static final int`

  `NUM_FRAMES_FIRE`

  `static final int`

  `NUM_FRAMES_SMOKE`

  `int`

  `numFlameParticles`

  `boolean`

  `perm`

  `private long`

  `savedUpdateTime`

  `boolean`

  `smoke`

  `private short[]`

  `soffX`

  `private short[]`

  `soffY`

  `int`

  `spreadDelay`

  `int`

  `spreadTimer`

  `private static final ColorInfo`

  `tempColorInfo`

  `private static final int`

  `TutorialEnergyDivisor`

  `private static final int`

  `VegetationEnergyBonus`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoFire(IsoCell cell)`

  `IsoFire(IsoCell cell,
  IsoGridSquare gridSquare)`

  `IsoFire(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean canBurnAnywhere,
  int startingEnergy)`

  `IsoFire(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean canBurnAnywhere,
  int startingEnergy,
  int setLife)`

  `IsoFire(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean canBurnAnywhere,
  int startingEnergy,
  int setLife,
  boolean isSmoke)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addToWorld()`

  `static boolean`

  `CanAddFire(IsoGridSquare gridSquare,
  boolean canBurnAnywhere)`

  `static boolean`

  `CanAddFire(IsoGridSquare gridSquare,
  boolean canBurnAnywhere,
  boolean smoke)`

  `static boolean`

  `CanAddSmoke(IsoGridSquare gridSquare,
  boolean canBurnAnywhere)`

  `void`

  `extinctFire()`

  `static boolean`

  `Fire_IsSquareFlamable(IsoGridSquare gridSquare)`

  `int`

  `getEnergy()`

  `int`

  `getLife()`

  `int`

  `getLightRadius()`

  `String`

  `getObjectName()`

  `int`

  `getSpreadDelay()`

  `(package private) int`

  `getSquaresEnergyRequirement(IsoGridSquare testSquare)`

  `boolean`

  `hasAnimatedAttachments()`

  `boolean`

  `isCampfire()`

  `boolean`

  `isPermanent()`

  `void`

  `load(ByteBuffer b,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

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

  `renderAnimatedAttachments(float x,
  float y,
  float z,
  ColorInfo col)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `setLife(int life)`

  `void`

  `setLifeStage(int lifeStage)`

  `void`

  `setLightRadius(int radius)`

  `void`

  `setSpreadDelay(int spreadDelay)`

  `void`

  `Spread()`

  `boolean`

  `TestCollide(IsoMovingObject obj,
  IsoGridSquare passedObjectSquare)`

  `IsoObject.VisionResult`

  `TestVision(IsoGridSquare from,
  IsoGridSquare to)`

  `void`

  `update()`

  `void`

  `updateFromTimer(float timer)`

  `private void`

  `updateSinceLastLoaded()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### LIGHT\_RADIUS\_MINIMUM

    public static final int LIGHT\_RADIUS\_MINIMUM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_RADIUS_MINIMUM)
  + ### LIGHT\_RADIUS\_LOW

    public static final int LIGHT\_RADIUS\_LOW

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_RADIUS_LOW)
  + ### LIGHT\_RADIUS\_MEDIUM

    public static final int LIGHT\_RADIUS\_MEDIUM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_RADIUS_MEDIUM)
  + ### LIGHT\_RADIUS\_HIGH

    public static final int LIGHT\_RADIUS\_HIGH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_RADIUS_HIGH)
  + ### NUM\_FRAMES\_FIRE

    public static final int NUM\_FRAMES\_FIRE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.NUM_FRAMES_FIRE)
  + ### NUM\_FRAMES\_SMOKE

    public static final int NUM\_FRAMES\_SMOKE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.NUM_FRAMES_SMOKE)
  + ### tempColorInfo

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") tempColorInfo
  + ### DefaultEnergyRequirement

    private static final int DefaultEnergyRequirement

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.DefaultEnergyRequirement)
  + ### VegetationEnergyBonus

    private static final int VegetationEnergyBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.VegetationEnergyBonus)
  + ### InteriorEnergyRequirement

    private static final int InteriorEnergyRequirement

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.InteriorEnergyRequirement)
  + ### TutorialEnergyDivisor

    private static final int TutorialEnergyDivisor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.TutorialEnergyDivisor)
  + ### MaxLife

    public static final int MaxLife

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.MaxLife)
  + ### MinLife

    public static final int MinLife

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.MinLife)
  + ### age

    public int age
  + ### energy

    public int energy
  + ### life

    public int life
  + ### lifeStage

    public int lifeStage
  + ### lifeStageDuration

    public int lifeStageDuration
  + ### lifeStageTimer

    public int lifeStageTimer
  + ### spreadDelay

    public int spreadDelay
  + ### spreadTimer

    public int spreadTimer
  + ### numFlameParticles

    public int numFlameParticles
  + ### perm

    public boolean perm
  + ### smoke

    public boolean smoke
  + ### lightSource

    public [IsoLightSource](../IsoLightSource.html "class in zombie.iso") lightSource
  + ### lightRadius

    public int lightRadius
  + ### lightOscillator

    public float lightOscillator
  + ### heatSource

    private [IsoHeatSource](../IsoHeatSource.html "class in zombie.iso") heatSource
  + ### savedUpdateTime

    private long savedUpdateTime
  + ### LIGHT\_R

    public static final float LIGHT\_R

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_R)
  + ### LIGHT\_G

    public static final float LIGHT\_G

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_G)
  + ### LIGHT\_B

    public static final float LIGHT\_B

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFire.LIGHT_B)
  + ### accum

    private float accum
  + ### soffX

    private short[] soffX
  + ### soffY

    private short[] soffY
* Constructor Details
  -------------------

  + ### IsoFire

    public IsoFire([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoFire

    public IsoFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare)
  + ### IsoFire

    public IsoFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere,
    int startingEnergy,
    int setLife,
    boolean isSmoke)
  + ### IsoFire

    public IsoFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere,
    int startingEnergy,
    int setLife)
  + ### IsoFire

    public IsoFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere,
    int startingEnergy)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### CanAddSmoke

    public static boolean CanAddSmoke([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere)
  + ### CanAddFire

    public static boolean CanAddFire([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere)
  + ### CanAddFire

    public static boolean CanAddFire([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canBurnAnywhere,
    boolean smoke)
  + ### Fire\_IsSquareFlamable

    public static boolean Fire\_IsSquareFlamable([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare)
  + ### Spread

    public void Spread()
  + ### TestCollide

    public boolean TestCollide([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") passedObjectSquare)
  + ### TestVision

    public [IsoObject.VisionResult](../IsoObject.VisionResult.html "enum class in zombie.iso") TestVision([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") to)

    Overrides:
    :   `TestVision` in class `IsoObject`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateSinceLastLoaded

    private void updateSinceLastLoaded()
  + ### updateFromTimer

    public void updateFromTimer(float timer)
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
  + ### extinctFire

    public void extinctFire()
  + ### getSquaresEnergyRequirement

    int getSquaresEnergyRequirement([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") testSquare)
  + ### setSpreadDelay

    public void setSpreadDelay(int spreadDelay)
  + ### getSpreadDelay

    public int getSpreadDelay()
  + ### setLife

    public void setLife(int life)
  + ### getLife

    public int getLife()
  + ### getEnergy

    public int getEnergy()
  + ### isPermanent

    public boolean isPermanent()
  + ### setLifeStage

    public void setLifeStage(int lifeStage)
  + ### setLightRadius

    public void setLightRadius(int radius)
  + ### getLightRadius

    public int getLightRadius()
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
  + ### saveChange

    public void saveChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl,
    zombie.core.network.ByteBufferWriter bb)

    Overrides:
    :   `saveChange` in class `IsoObject`
  + ### loadChange

    public void loadChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `loadChange` in class `IsoObject`
  + ### isCampfire

    public boolean isCampfire()
  + ### hasAnimatedAttachments

    public boolean hasAnimatedAttachments()

    Overrides:
    :   `hasAnimatedAttachments` in class `IsoObject`
  + ### renderAnimatedAttachments

    public void renderAnimatedAttachments(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col)

    Overrides:
    :   `renderAnimatedAttachments` in class `IsoObject`