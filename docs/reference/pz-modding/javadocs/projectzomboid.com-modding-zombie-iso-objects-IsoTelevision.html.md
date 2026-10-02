[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoTelevision](IsoTelevision.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [currentScreen](#currentScreen)
   2. [spriteIndex](#spriteIndex)
   3. [hasSetupScreens](#hasSetupScreens)
   4. [tickIsLightUpdate](#tickIsLightUpdate)
   5. [screenSprites](#screenSprites)
   6. [cacheObjectSprite](#cacheObjectSprite)
   7. [facing](#facing)
7. [Constructor Details](#constructor-detail)
   1. [IsoTelevision(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoTelevision(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [setupDefaultScreens()](#setupDefaultScreens())
   3. [update()](#update())
   4. [updateLightSource()](#updateLightSource())
   5. [setScreen(IsoTelevision.Screens)](#setScreen(zombie.iso.objects.IsoTelevision.Screens))
   6. [updateTvScreen()](#updateTvScreen())
   7. [addTvScreenSprite(IsoSprite)](#addTvScreenSprite(zombie.iso.sprite.IsoSprite))
   8. [clearTvScreenSprites()](#clearTvScreenSprites())
   9. [removeTvScreenSprite(IsoSprite)](#removeTvScreenSprite(zombie.iso.sprite.IsoSprite))
   10. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   11. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   12. [getGeneratorPowerConsumption()](#getGeneratorPowerConsumption())
   13. [isFacing(IsoPlayer)](#isFacing(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoTelevision
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

[zombie.iso.objects.IsoWaveSignal](IsoWaveSignal.html "class in zombie.iso.objects")

zombie.iso.objects.IsoTelevision

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.characters.Talker, zombie.chat.ChatElementOwner, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, WaveSignalDevice`

---

public class IsoTelevision
extends [IsoWaveSignal](IsoWaveSignal.html "class in zombie.iso.objects")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoTelevision)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `IsoTelevision.Screens`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoSprite`

  `cacheObjectSprite`

  `private IsoTelevision.Screens`

  `currentScreen`

  `protected IsoDirections`

  `facing`

  `private boolean`

  `hasSetupScreens`

  `protected ArrayList<IsoSprite>`

  `screenSprites`

  `private int`

  `spriteIndex`

  `private boolean`

  `tickIsLightUpdate`

  ### Fields inherited from class [IsoWaveSignal](IsoWaveSignal.html#field-summary "class in zombie.iso.objects")

  `chatElement, deviceData, deviceDataCache, displayRange, gameTime, hasPlayerInRange, lightSource, lightSourceRadius, lightUpdateCnt, lightWasRemoved, nextLightUpdate, talkerType`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoTelevision(IsoCell cell)`

  `IsoTelevision(IsoCell cell,
  IsoGridSquare sq,
  IsoSprite spr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addTvScreenSprite(IsoSprite sprite)`

  `void`

  `clearTvScreenSprites()`

  `boolean`

  `couldBePoweredByGenerator()`

  `float`

  `getGeneratorPowerConsumption()`

  `String`

  `getObjectName()`

  `boolean`

  `isFacing(IsoPlayer player)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `removeTvScreenSprite(IsoSprite sprite)`

  `private void`

  `setScreen(IsoTelevision.Screens screen)`

  `private void`

  `setupDefaultScreens()`

  `void`

  `update()`

  `protected void`

  `updateLightSource()`

  `protected void`

  `updateTvScreen()`

  ### Methods inherited from class [IsoWaveSignal](IsoWaveSignal.html#method-summary "class in zombie.iso.objects")

  `AddDeviceText, AddDeviceText, AddDeviceText, AddDeviceText, addToWorld, cloneDeviceDataFromItem, getChatElement, getDelta, getDeviceData, getSayLine, getTalkerType, hasChatToDisplay, HasPlayerInRange, init, IsSpeaking, loadState, playerWithinBounds, removeFromSquare, removeFromWorld, removeLightSourceFromWorld, renderlast, renderlastold2, Reset, save, saveState, Say, setDelta, setDeviceData, setTalkerType`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.chat.ChatElementOwner

  `getSquare, getX, getY, getZ`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

  ### Methods inherited from interface [WaveSignalDevice](../../radio/devices/WaveSignalDevice.html#method-summary "interface in zombie.radio.devices")

  `AddDeviceText, getSquare, getX, getY, getZ`

* Field Details
  -------------

  + ### currentScreen

    private [IsoTelevision.Screens](IsoTelevision.Screens.html "enum class in zombie.iso.objects") currentScreen
  + ### spriteIndex

    private int spriteIndex
  + ### hasSetupScreens

    private boolean hasSetupScreens
  + ### tickIsLightUpdate

    private boolean tickIsLightUpdate
  + ### screenSprites

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite")> screenSprites
  + ### cacheObjectSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") cacheObjectSprite
  + ### facing

    protected [IsoDirections](../IsoDirections.html "enum class in zombie.iso") facing
* Constructor Details
  -------------------

  + ### IsoTelevision

    public IsoTelevision([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoTelevision

    public IsoTelevision([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") spr)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### setupDefaultScreens

    private void setupDefaultScreens()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoWaveSignal`
  + ### updateLightSource

    protected void updateLightSource()

    Overrides:
    :   `updateLightSource` in class `IsoWaveSignal`
  + ### setScreen

    private void setScreen([IsoTelevision.Screens](IsoTelevision.Screens.html "enum class in zombie.iso.objects") screen)
  + ### updateTvScreen

    protected void updateTvScreen()
  + ### addTvScreenSprite

    public void addTvScreenSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### clearTvScreenSprites

    public void clearTvScreenSprites()
  + ### removeTvScreenSprite

    public void removeTvScreenSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoWaveSignal`

    Throws:
    :   `IOException`
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()

    Overrides:
    :   `couldBePoweredByGenerator` in class `IsoObject`
  + ### getGeneratorPowerConsumption

    public float getGeneratorPowerConsumption()

    Overrides:
    :   `getGeneratorPowerConsumption` in class `IsoObject`
  + ### isFacing

    public boolean isFacing([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)