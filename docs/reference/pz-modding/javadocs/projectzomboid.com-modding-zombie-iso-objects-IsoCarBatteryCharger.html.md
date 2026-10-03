[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoCarBatteryCharger](IsoCarBatteryCharger.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [item](#item)
   2. [battery](#battery)
   3. [activated](#activated)
   4. [lastUpdate](#lastUpdate)
   5. [chargeRate](#chargeRate)
   6. [chargerSprite](#chargerSprite)
   7. [batterySprite](#batterySprite)
   8. [sound](#sound)
7. [Constructor Details](#constructor-detail)
   1. [IsoCarBatteryCharger(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoCarBatteryCharger(InventoryItem, IsoCell, IsoGridSquare)](#%3Cinit%3E(zombie.inventory.InventoryItem,zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   3. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   4. [addToWorld()](#addToWorld())
   5. [removeFromWorld()](#removeFromWorld())
   6. [update()](#update())
   7. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   8. [renderObjectPicker(float, float, float, ColorInfo)](#renderObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   9. [hasAnimatedAttachments()](#hasAnimatedAttachments())
   10. [renderAnimatedAttachments(float, float, float, ColorInfo)](#renderAnimatedAttachments(float,float,float,zombie.core.textures.ColorInfo))
   11. [configureSprite(InventoryItem, IsoSprite)](#configureSprite(zombie.inventory.InventoryItem,zombie.iso.sprite.IsoSprite))
   12. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   13. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   14. [getItem()](#getItem())
   15. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   16. [getGeneratorPowerConsumption()](#getGeneratorPowerConsumption())
   17. [getBattery()](#getBattery())
   18. [setBattery(InventoryItem)](#setBattery(zombie.inventory.InventoryItem))
   19. [isActivated()](#isActivated())
   20. [setActivated(boolean)](#setActivated(boolean))
   21. [getChargeRate()](#getChargeRate())
   22. [setChargeRate(float)](#setChargeRate(float))
   23. [startChargingSound()](#startChargingSound())
   24. [stopChargingSound()](#stopChargingSound())
   25. [getTexture()](#getTexture())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoCarBatteryCharger
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoCarBatteryCharger

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IItemProvider, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoCarBatteryCharger
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.IItemProvider

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoCarBatteryCharger)

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

  `protected boolean`

  `activated`

  `protected InventoryItem`

  `battery`

  `protected IsoSprite`

  `batterySprite`

  `protected float`

  `chargeRate`

  `protected IsoSprite`

  `chargerSprite`

  `protected InventoryItem`

  `item`

  `protected float`

  `lastUpdate`

  `protected long`

  `sound`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoCarBatteryCharger(InventoryItem item,
  IsoCell cell,
  IsoGridSquare square)`

  `IsoCarBatteryCharger(IsoCell cell)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addToWorld()`

  `private IsoSprite`

  `configureSprite(InventoryItem item,
  IsoSprite sprite)`

  `boolean`

  `couldBePoweredByGenerator()`

  `InventoryItem`

  `getBattery()`

  `float`

  `getChargeRate()`

  `float`

  `getGeneratorPowerConsumption()`

  `InventoryItem`

  `getItem()`

  `String`

  `getObjectName()`

  `Texture`

  `getTexture()`

  `boolean`

  `hasAnimatedAttachments()`

  `boolean`

  `isActivated()`

  `void`

  `load(ByteBuffer bb,
  int worldVersion,
  boolean isDebugSave)`

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

  `renderObjectPicker(float x,
  float y,
  float z,
  ColorInfo lightInfo)`

  `void`

  `save(ByteBuffer bb,
  boolean isDebugSave)`

  `void`

  `setActivated(boolean activated)`

  `void`

  `setBattery(InventoryItem battery)`

  `void`

  `setChargeRate(float chargeRate)`

  `private void`

  `startChargingSound()`

  `private void`

  `stopChargingSound()`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `void`

  `update()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### item

    protected [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
  + ### battery

    protected [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") battery
  + ### activated

    protected boolean activated
  + ### lastUpdate

    protected float lastUpdate
  + ### chargeRate

    protected float chargeRate
  + ### chargerSprite

    protected [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") chargerSprite
  + ### batterySprite

    protected [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") batterySprite
  + ### sound

    protected long sound
* Constructor Details
  -------------------

  + ### IsoCarBatteryCharger

    public IsoCarBatteryCharger([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoCarBatteryCharger

    public IsoCarBatteryCharger([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
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
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
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
  + ### renderObjectPicker

    public void renderObjectPicker(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)

    Overrides:
    :   `renderObjectPicker` in class `IsoObject`
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
  + ### configureSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") configureSprite([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()

    Specified by:
    :   `getItem` in interface `zombie.iso.IItemProvider`
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()

    Overrides:
    :   `couldBePoweredByGenerator` in class `IsoObject`
  + ### getGeneratorPowerConsumption

    public float getGeneratorPowerConsumption()

    Overrides:
    :   `getGeneratorPowerConsumption` in class `IsoObject`
  + ### getBattery

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getBattery()
  + ### setBattery

    public void setBattery([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") battery)
  + ### isActivated

    public boolean isActivated()
  + ### setActivated

    public void setActivated(boolean activated)
  + ### getChargeRate

    public float getChargeRate()
  + ### setChargeRate

    public void setChargeRate(float chargeRate)
  + ### startChargingSound

    private void startChargingSound()
  + ### stopChargingSound

    private void stopChargingSound()
  + ### getTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTexture()