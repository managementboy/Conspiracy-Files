[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoLightSwitch](IsoLightSwitch.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [activated](#activated)
   2. [lights](#lights)
   3. [lightRoom](#lightRoom)
   4. [roomId](#roomId)
   5. [streetLight](#streetLight)
   6. [canBeModified](#canBeModified)
   7. [useBattery](#useBattery)
   8. [hasBattery](#hasBattery)
   9. [bulbItem](#bulbItem)
   10. [power](#power)
   11. [delta](#delta)
   12. [primaryR](#primaryR)
   13. [primaryG](#primaryG)
   14. [primaryB](#primaryB)
   15. [s\_tempObjects](#s_tempObjects)
   16. [lastMinuteStamp](#lastMinuteStamp)
   17. [bulbBurnMinutes](#bulbBurnMinutes)
   18. [lastMin](#lastMin)
   19. [nextBreakUpdate](#nextBreakUpdate)
7. [Constructor Details](#constructor-detail)
   1. [IsoLightSwitch(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoLightSwitch(IsoCell, IsoGridSquare, IsoSprite, long)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite,long))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [addLightSourceFromSprite()](#addLightSourceFromSprite())
   3. [getCanBeModified()](#getCanBeModified())
   4. [setCanBeModified(boolean)](#setCanBeModified(boolean))
   5. [getPower()](#getPower())
   6. [setPower(float)](#setPower(float))
   7. [setDelta(float)](#setDelta(float))
   8. [getDelta()](#getDelta())
   9. [setUseBattery(boolean)](#setUseBattery(boolean))
   10. [setUseBatteryDirect(boolean)](#setUseBatteryDirect(boolean))
   11. [getUseBattery()](#getUseBattery())
   12. [getHasBattery()](#getHasBattery())
   13. [setHasBattery(boolean)](#setHasBattery(boolean))
   14. [setHasBatteryRaw(boolean)](#setHasBatteryRaw(boolean))
   15. [addBattery(IsoGameCharacter, InventoryItem)](#addBattery(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   16. [removeBattery(IsoGameCharacter)](#removeBattery(zombie.characters.IsoGameCharacter))
   17. [hasLightBulb()](#hasLightBulb())
   18. [getBulbItem()](#getBulbItem())
   19. [setBulbItemRaw(String)](#setBulbItemRaw(java.lang.String))
   20. [addLightBulb(IsoGameCharacter, InventoryItem)](#addLightBulb(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   21. [removeLightBulb(IsoGameCharacter)](#removeLightBulb(zombie.characters.IsoGameCharacter))
   22. [getPrimaryLight()](#getPrimaryLight())
   23. [getPrimaryR()](#getPrimaryR())
   24. [getPrimaryG()](#getPrimaryG())
   25. [getPrimaryB()](#getPrimaryB())
   26. [setPrimaryR(float)](#setPrimaryR(float))
   27. [setPrimaryG(float)](#setPrimaryG(float))
   28. [setPrimaryB(float)](#setPrimaryB(float))
   29. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   30. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   31. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   32. [canSwitchLight()](#canSwitchLight())
   33. [hasElectricityAround()](#hasElectricityAround())
   34. [isBuildingSquare(IsoGridSquare)](#isBuildingSquare(zombie.iso.IsoGridSquare))
   35. [hasFasciaAdjacentToBuildingSquare(IsoGridSquare)](#hasFasciaAdjacentToBuildingSquare(zombie.iso.IsoGridSquare))
   36. [setActive(boolean)](#setActive(boolean))
   37. [setActive(boolean, boolean)](#setActive(boolean,boolean))
   38. [setActive(boolean, boolean, boolean)](#setActive(boolean,boolean,boolean))
   39. [toggle()](#toggle())
   40. [switchLight(boolean)](#switchLight(boolean))
   41. [getCustomSettingsFromItem(InventoryItem)](#getCustomSettingsFromItem(zombie.inventory.InventoryItem))
   42. [setCustomSettingsToItem(InventoryItem)](#setCustomSettingsToItem(zombie.inventory.InventoryItem))
   43. [syncCustomizedSettings(UdpConnection)](#syncCustomizedSettings(zombie.core.raknet.UdpConnection))
   44. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   45. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   46. [syncIsoObject(boolean, byte, UdpConnection)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection))
   47. [update()](#update())
   48. [isActivated()](#isActivated())
   49. [setActivated(boolean)](#setActivated(boolean))
   50. [addToWorld()](#addToWorld())
   51. [removeFromWorld()](#removeFromWorld())
   52. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   53. [getGeneratorPowerConsumption()](#getGeneratorPowerConsumption())
   54. [chunkLoaded(IsoChunk)](#chunkLoaded(zombie.iso.IsoChunk))
   55. [getLights()](#getLights())
   56. [shouldShowOnOverlay()](#shouldShowOnOverlay())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoLightSwitch
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoLightSwitch

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoLightSwitch
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoLightSwitch)

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

  `protected int`

  `bulbBurnMinutes`

  `private String`

  `bulbItem`

  `private boolean`

  `canBeModified`

  `private float`

  `delta`

  `private boolean`

  `hasBattery`

  `protected int`

  `lastMin`

  `protected long`

  `lastMinuteStamp`

  `boolean`

  `lightRoom`

  `final ArrayList<IsoLightSource>`

  `lights`

  `protected int`

  `nextBreakUpdate`

  `private float`

  `power`

  `private float`

  `primaryB`

  `private float`

  `primaryG`

  `private float`

  `primaryR`

  `long`

  `roomId`

  `private static final ArrayList<IsoObject>`

  `s_tempObjects`

  `boolean`

  `streetLight`

  `private boolean`

  `useBattery`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoLightSwitch(IsoCell cell)`

  `IsoLightSwitch(IsoCell cell,
  IsoGridSquare sq,
  IsoSprite gid,
  long roomId)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBattery(IsoGameCharacter chr,
  InventoryItem battery)`

  `void`

  `addLightBulb(IsoGameCharacter chr,
  InventoryItem bulb)`

  `void`

  `addLightSourceFromSprite()`

  `void`

  `addToWorld()`

  `boolean`

  `canSwitchLight()`

  `static void`

  `chunkLoaded(IsoChunk chunk)`

  `boolean`

  `couldBePoweredByGenerator()`

  `String`

  `getBulbItem()`

  `boolean`

  `getCanBeModified()`

  `void`

  `getCustomSettingsFromItem(InventoryItem item)`

  `float`

  `getDelta()`

  `float`

  `getGeneratorPowerConsumption()`

  `boolean`

  `getHasBattery()`

  `ArrayList<IsoLightSource>`

  `getLights()`

  `String`

  `getObjectName()`

  `float`

  `getPower()`

  `float`

  `getPrimaryB()`

  `float`

  `getPrimaryG()`

  `private IsoLightSource`

  `getPrimaryLight()`

  `float`

  `getPrimaryR()`

  `boolean`

  `getUseBattery()`

  `private boolean`

  `hasElectricityAround()`

  `private boolean`

  `hasFasciaAdjacentToBuildingSquare(IsoGridSquare square)`

  `boolean`

  `hasLightBulb()`

  `boolean`

  `isActivated()`

  `private boolean`

  `isBuildingSquare(IsoGridSquare square)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `DrainableComboItem`

  `removeBattery(IsoGameCharacter chr)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `InventoryItem`

  `removeLightBulb(IsoGameCharacter chr)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setActivated(boolean val)`

  `boolean`

  `setActive(boolean active)`

  `boolean`

  `setActive(boolean active,
  boolean setActiveBoolOnly)`

  `boolean`

  `setActive(boolean active,
  boolean setActiveBoolOnly,
  boolean ignoreSwitchCheck)`

  `void`

  `setBulbItemRaw(String item)`

  `void`

  `setCanBeModified(boolean val)`

  `void`

  `setCustomSettingsToItem(InventoryItem item)`

  `void`

  `setDelta(float delta)`

  `void`

  `setHasBattery(boolean val)`

  `void`

  `setHasBatteryRaw(boolean b)`

  `void`

  `setPower(float power)`

  `void`

  `setPrimaryB(float b)`

  `void`

  `setPrimaryG(float g)`

  `void`

  `setPrimaryR(float r)`

  `void`

  `setUseBattery(boolean b)`

  `void`

  `setUseBatteryDirect(boolean b)`

  `boolean`

  `shouldShowOnOverlay()`

  `void`

  `switchLight(boolean activated)`

  `void`

  `syncCustomizedSettings(zombie.core.raknet.UdpConnection source)`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source)`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `boolean`

  `toggle()`

  `void`

  `update()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObjectReceive, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### activated

    public boolean activated
  + ### lights

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSource](../IsoLightSource.html "class in zombie.iso")> lights
  + ### lightRoom

    public boolean lightRoom
  + ### roomId

    public long roomId
  + ### streetLight

    public boolean streetLight
  + ### canBeModified

    private boolean canBeModified
  + ### useBattery

    private boolean useBattery
  + ### hasBattery

    private boolean hasBattery
  + ### bulbItem

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bulbItem
  + ### power

    private float power
  + ### delta

    private float delta
  + ### primaryR

    private float primaryR
  + ### primaryG

    private float primaryG
  + ### primaryB

    private float primaryB
  + ### s\_tempObjects

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../IsoObject.html "class in zombie.iso")> s\_tempObjects
  + ### lastMinuteStamp

    protected long lastMinuteStamp
  + ### bulbBurnMinutes

    protected int bulbBurnMinutes
  + ### lastMin

    protected int lastMin
  + ### nextBreakUpdate

    protected int nextBreakUpdate
* Constructor Details
  -------------------

  + ### IsoLightSwitch

    public IsoLightSwitch([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoLightSwitch

    public IsoLightSwitch([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid,
    long roomId)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### addLightSourceFromSprite

    public void addLightSourceFromSprite()
  + ### getCanBeModified

    public boolean getCanBeModified()
  + ### setCanBeModified

    public void setCanBeModified(boolean val)
  + ### getPower

    public float getPower()
  + ### setPower

    public void setPower(float power)
  + ### setDelta

    public void setDelta(float delta)
  + ### getDelta

    public float getDelta()
  + ### setUseBattery

    public void setUseBattery(boolean b)
  + ### setUseBatteryDirect

    public void setUseBatteryDirect(boolean b)
  + ### getUseBattery

    public boolean getUseBattery()
  + ### getHasBattery

    public boolean getHasBattery()
  + ### setHasBattery

    public void setHasBattery(boolean val)
  + ### setHasBatteryRaw

    public void setHasBatteryRaw(boolean b)
  + ### addBattery

    public void addBattery([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") battery)
  + ### removeBattery

    public [DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") removeBattery([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hasLightBulb

    public boolean hasLightBulb()
  + ### getBulbItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBulbItem()
  + ### setBulbItemRaw

    public void setBulbItemRaw([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### addLightBulb

    public void addLightBulb([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") bulb)
  + ### removeLightBulb

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removeLightBulb([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getPrimaryLight

    private [IsoLightSource](../IsoLightSource.html "class in zombie.iso") getPrimaryLight()
  + ### getPrimaryR

    public float getPrimaryR()
  + ### getPrimaryG

    public float getPrimaryG()
  + ### getPrimaryB

    public float getPrimaryB()
  + ### setPrimaryR

    public void setPrimaryR(float r)
  + ### setPrimaryG

    public void setPrimaryG(float g)
  + ### setPrimaryB

    public void setPrimaryB(float b)
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
  + ### onMouseLeftClick

    public boolean onMouseLeftClick(int x,
    int y)

    Overrides:
    :   `onMouseLeftClick` in class `IsoObject`
  + ### canSwitchLight

    public boolean canSwitchLight()
  + ### hasElectricityAround

    private boolean hasElectricityAround()
  + ### isBuildingSquare

    private boolean isBuildingSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### hasFasciaAdjacentToBuildingSquare

    private boolean hasFasciaAdjacentToBuildingSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### setActive

    public boolean setActive(boolean active)
  + ### setActive

    public boolean setActive(boolean active,
    boolean setActiveBoolOnly)
  + ### setActive

    public boolean setActive(boolean active,
    boolean setActiveBoolOnly,
    boolean ignoreSwitchCheck)
  + ### toggle

    public boolean toggle()
  + ### switchLight

    public void switchLight(boolean activated)
  + ### getCustomSettingsFromItem

    public void getCustomSettingsFromItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setCustomSettingsToItem

    public void setCustomSettingsToItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### syncCustomizedSettings

    public void syncCustomizedSettings(zombie.core.raknet.UdpConnection source)
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
  + ### syncIsoObject

    public void syncIsoObject(boolean bRemote,
    byte val,
    zombie.core.raknet.UdpConnection source)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### isActivated

    public boolean isActivated()
  + ### setActivated

    public void setActivated(boolean val)
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
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()

    Overrides:
    :   `couldBePoweredByGenerator` in class `IsoObject`
  + ### getGeneratorPowerConsumption

    public float getGeneratorPowerConsumption()

    Overrides:
    :   `getGeneratorPowerConsumption` in class `IsoObject`
  + ### chunkLoaded

    public static void chunkLoaded([IsoChunk](../IsoChunk.html "class in zombie.iso") chunk)
  + ### getLights

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSource](../IsoLightSource.html "class in zombie.iso")> getLights()
  + ### shouldShowOnOverlay

    public boolean shouldShowOnOverlay()

    Overrides:
    :   `shouldShowOnOverlay` in class `IsoObject`