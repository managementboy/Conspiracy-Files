[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoStove](IsoStove.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [s\_tempObjects](#s_tempObjects)
   2. [LitTemperature](#LitTemperature)
   3. [UnlitTemperature](#UnlitTemperature)
   4. [FireStartingEnergy](#FireStartingEnergy)
   5. [TemperatureAdjustmentDivisor](#TemperatureAdjustmentDivisor)
   6. [MinimumTemperatureIncrease](#MinimumTemperatureIncrease)
   7. [MaximumStoveTemperature](#MaximumStoveTemperature)
   8. [MaximumMicrowaveTemperature](#MaximumMicrowaveTemperature)
   9. [BaseTemperature](#BaseTemperature)
   10. [activated](#activated)
   11. [soundInstance](#soundInstance)
   12. [maxTemperature](#maxTemperature)
   13. [stopTime](#stopTime)
   14. [startTime](#startTime)
   15. [currentTemperature](#currentTemperature)
   16. [secondsTimer](#secondsTimer)
   17. [firstTurnOn](#firstTurnOn)
   18. [broken](#broken)
   19. [hasMetal](#hasMetal)
7. [Constructor Details](#constructor-detail)
   1. [IsoStove(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
   2. [IsoStove(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [Activated()](#Activated())
   3. [update()](#update())
   4. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   5. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   6. [addToWorld()](#addToWorld())
   7. [Toggle()](#Toggle())
   8. [PlayToggleSound()](#PlayToggleSound())
   9. [sync()](#sync())
   10. [doSound()](#doSound())
   11. [hasMetal()](#hasMetal())
   12. [getActivatableType()](#getActivatableType())
   13. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   14. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   15. [setActivated(boolean)](#setActivated(boolean))
   16. [doOverlay()](#doOverlay())
   17. [setTimer(int)](#setTimer(int))
   18. [getTimer()](#getTimer())
   19. [getMaxTemperature()](#getMaxTemperature())
   20. [setMaxTemperature(float)](#setMaxTemperature(float))
   21. [isMicrowave()](#isMicrowave())
   22. [isStove()](#isStove())
   23. [isRunningFor()](#isRunningFor())
   24. [getCurrentTemperature()](#getCurrentTemperature())
   25. [isTemperatureChanging()](#isTemperatureChanging())
   26. [isBroken()](#isBroken())
   27. [setBroken(boolean)](#setBroken(boolean))
   28. [isSpriteGridOriginObject()](#isSpriteGridOriginObject())
   29. [syncSpriteGridObjects(boolean, boolean)](#syncSpriteGridObjects(boolean,boolean))
   30. [shouldShowOnOverlay()](#shouldShowOnOverlay())
   31. [shouldLightSourceBeActive()](#shouldLightSourceBeActive())
   32. [afterRotated()](#afterRotated())
   33. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   34. [getGeneratorPowerConsumption()](#getGeneratorPowerConsumption())
   35. [updateClientCookingSounds()](#updateClientCookingSounds())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoStove
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoStove

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Activatable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoStove
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.objects.interfaces.Activatable

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoStove)

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

  `private boolean`

  `activated`

  `private static final float`

  `BaseTemperature`

  `private boolean`

  `broken`

  `private float`

  `currentTemperature`

  `private static final int`

  `FireStartingEnergy`

  `private boolean`

  `firstTurnOn`

  `private boolean`

  `hasMetal`

  `static final float`

  `LitTemperature`

  `private static final float`

  `MaximumMicrowaveTemperature`

  `private static final float`

  `MaximumStoveTemperature`

  `private float`

  `maxTemperature`

  `private static final float`

  `MinimumTemperatureIncrease`

  `private static final ArrayList<IsoObject>`

  `s_tempObjects`

  `private int`

  `secondsTimer`

  `private long`

  `soundInstance`

  `private double`

  `startTime`

  `private double`

  `stopTime`

  `private static final float`

  `TemperatureAdjustmentDivisor`

  `static final float`

  `UnlitTemperature`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoStove(IsoCell cell)`

  `IsoStove(IsoCell cell,
  IsoGridSquare sq,
  IsoSprite gid)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `Activated()`

  `void`

  `addToWorld()`

  `void`

  `afterRotated()`

  `boolean`

  `couldBePoweredByGenerator()`

  `private void`

  `doOverlay()`

  `private void`

  `doSound()`

  `String`

  `getActivatableType()`

  `float`

  `getCurrentTemperature()`

  `float`

  `getGeneratorPowerConsumption()`

  `float`

  `getMaxTemperature()`

  `String`

  `getObjectName()`

  `int`

  `getTimer()`

  `private boolean`

  `hasMetal()`

  `boolean`

  `isBroken()`

  `boolean`

  `isMicrowave()`

  `int`

  `isRunningFor()`

  `private boolean`

  `isSpriteGridOriginObject()`

  `private boolean`

  `isStove()`

  `boolean`

  `isTemperatureChanging()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `PlayToggleSound()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setActivated(boolean b)`

  `void`

  `setBroken(boolean broken)`

  `void`

  `setMaxTemperature(float maxTemperature)`

  `void`

  `setTimer(int seconds)`

  `protected boolean`

  `shouldLightSourceBeActive()`

  `boolean`

  `shouldShowOnOverlay()`

  `void`

  `sync()`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `void`

  `syncSpriteGridObjects(boolean toggle,
  boolean network)`

  `void`

  `Toggle()`

  `void`

  `update()`

  `private void`

  `updateClientCookingSounds()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorld, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObjectReceive, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### s\_tempObjects

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../IsoObject.html "class in zombie.iso")> s\_tempObjects
  + ### LitTemperature

    public static final float LitTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.LitTemperature)
  + ### UnlitTemperature

    public static final float UnlitTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.UnlitTemperature)
  + ### FireStartingEnergy

    private static final int FireStartingEnergy

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.FireStartingEnergy)
  + ### TemperatureAdjustmentDivisor

    private static final float TemperatureAdjustmentDivisor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.TemperatureAdjustmentDivisor)
  + ### MinimumTemperatureIncrease

    private static final float MinimumTemperatureIncrease

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.MinimumTemperatureIncrease)
  + ### MaximumStoveTemperature

    private static final float MaximumStoveTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.MaximumStoveTemperature)
  + ### MaximumMicrowaveTemperature

    private static final float MaximumMicrowaveTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.MaximumMicrowaveTemperature)
  + ### BaseTemperature

    private static final float BaseTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoStove.BaseTemperature)
  + ### activated

    private boolean activated
  + ### soundInstance

    private long soundInstance
  + ### maxTemperature

    private float maxTemperature
  + ### stopTime

    private double stopTime
  + ### startTime

    private double startTime
  + ### currentTemperature

    private float currentTemperature
  + ### secondsTimer

    private int secondsTimer
  + ### firstTurnOn

    private boolean firstTurnOn
  + ### broken

    private boolean broken
  + ### hasMetal

    private boolean hasMetal
* Constructor Details
  -------------------

  + ### IsoStove

    public IsoStove([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid)
  + ### IsoStove

    public IsoStove([IsoCell](../IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### Activated

    public boolean Activated()

    Specified by:
    :   `Activated` in interface `zombie.iso.objects.interfaces.Activatable`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
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
  + ### Toggle

    public void Toggle()

    Specified by:
    :   `Toggle` in interface `zombie.iso.objects.interfaces.Activatable`
  + ### PlayToggleSound

    public void PlayToggleSound()
  + ### sync

    public void sync()

    Overrides:
    :   `sync` in class `IsoObject`
  + ### doSound

    private void doSound()
  + ### hasMetal

    private boolean hasMetal()
  + ### getActivatableType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActivatableType()

    Specified by:
    :   `getActivatableType` in interface `zombie.iso.objects.interfaces.Activatable`
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObject

    public void syncIsoObject(boolean bRemote,
    byte val,
    zombie.core.raknet.UdpConnection source,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObject` in class `IsoObject`
  + ### setActivated

    public void setActivated(boolean b)
  + ### doOverlay

    private void doOverlay()
  + ### setTimer

    public void setTimer(int seconds)
  + ### getTimer

    public int getTimer()
  + ### getMaxTemperature

    public float getMaxTemperature()
  + ### setMaxTemperature

    public void setMaxTemperature(float maxTemperature)
  + ### isMicrowave

    public boolean isMicrowave()
  + ### isStove

    private boolean isStove()
  + ### isRunningFor

    public int isRunningFor()
  + ### getCurrentTemperature

    public float getCurrentTemperature()
  + ### isTemperatureChanging

    public boolean isTemperatureChanging()
  + ### isBroken

    public boolean isBroken()
  + ### setBroken

    public void setBroken(boolean broken)
  + ### isSpriteGridOriginObject

    private boolean isSpriteGridOriginObject()
  + ### syncSpriteGridObjects

    public void syncSpriteGridObjects(boolean toggle,
    boolean network)
  + ### shouldShowOnOverlay

    public boolean shouldShowOnOverlay()

    Overrides:
    :   `shouldShowOnOverlay` in class `IsoObject`
  + ### shouldLightSourceBeActive

    protected boolean shouldLightSourceBeActive()

    Overrides:
    :   `shouldLightSourceBeActive` in class `IsoObject`
  + ### afterRotated

    public void afterRotated()

    Overrides:
    :   `afterRotated` in class `IsoObject`
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()

    Overrides:
    :   `couldBePoweredByGenerator` in class `IsoObject`
  + ### getGeneratorPowerConsumption

    public float getGeneratorPowerConsumption()

    Overrides:
    :   `getGeneratorPowerConsumption` in class `IsoObject`
  + ### updateClientCookingSounds

    private void updateClientCookingSounds()