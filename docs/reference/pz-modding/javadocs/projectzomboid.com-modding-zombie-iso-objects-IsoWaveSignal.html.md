[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoWaveSignal](IsoWaveSignal.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [lightSource](#lightSource)
   2. [lightWasRemoved](#lightWasRemoved)
   3. [lightSourceRadius](#lightSourceRadius)
   4. [nextLightUpdate](#nextLightUpdate)
   5. [lightUpdateCnt](#lightUpdateCnt)
   6. [deviceData](#deviceData)
   7. [displayRange](#displayRange)
   8. [hasPlayerInRange](#hasPlayerInRange)
   9. [gameTime](#gameTime)
   10. [chatElement](#chatElement)
   11. [talkerType](#talkerType)
   12. [deviceDataCache](#deviceDataCache)
7. [Constructor Details](#constructor-detail)
   1. [IsoWaveSignal(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoWaveSignal(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [init(boolean)](#init(boolean))
   2. [cloneDeviceDataFromItem(String)](#cloneDeviceDataFromItem(java.lang.String))
   3. [hasChatToDisplay()](#hasChatToDisplay())
   4. [HasPlayerInRange()](#HasPlayerInRange())
   5. [getDelta()](#getDelta())
   6. [setDelta(float)](#setDelta(float))
   7. [getDeviceData()](#getDeviceData())
   8. [setDeviceData(DeviceData)](#setDeviceData(zombie.radio.devices.DeviceData))
   9. [IsSpeaking()](#IsSpeaking())
   10. [getTalkerType()](#getTalkerType())
   11. [setTalkerType(String)](#setTalkerType(java.lang.String))
   12. [getSayLine()](#getSayLine())
   13. [Say(String)](#Say(java.lang.String))
   14. [AddDeviceText(String, float, float, float, String, String, int)](#AddDeviceText(java.lang.String,float,float,float,java.lang.String,java.lang.String,int))
   15. [AddDeviceText(String, int, int, int, String, String, int)](#AddDeviceText(java.lang.String,int,int,int,java.lang.String,java.lang.String,int))
   16. [AddDeviceText(String, int, int, int, String, String, int, boolean)](#AddDeviceText(java.lang.String,int,int,int,java.lang.String,java.lang.String,int,boolean))
   17. [AddDeviceText(String, float, float, float, String, String, int, boolean)](#AddDeviceText(java.lang.String,float,float,float,java.lang.String,java.lang.String,int,boolean))
   18. [renderlast()](#renderlast())
   19. [renderlastold2()](#renderlastold2())
   20. [playerWithinBounds(IsoPlayer, float)](#playerWithinBounds(zombie.characters.IsoPlayer,float))
   21. [update()](#update())
   22. [updateLightSource()](#updateLightSource())
   23. [removeLightSourceFromWorld()](#removeLightSourceFromWorld())
   24. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   25. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   26. [addToWorld()](#addToWorld())
   27. [removeFromWorld()](#removeFromWorld())
   28. [removeFromSquare()](#removeFromSquare())
   29. [saveState(ByteBuffer)](#saveState(java.nio.ByteBuffer))
   30. [loadState(ByteBuffer)](#loadState(java.nio.ByteBuffer))
   31. [getChatElement()](#getChatElement())
   32. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoWaveSignal
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoWaveSignal

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.characters.Talker, zombie.chat.ChatElementOwner, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, WaveSignalDevice`

Direct Known Subclasses:
:   `IsoRadio, IsoTelevision`

---

public class IsoWaveSignal
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [WaveSignalDevice](../../radio/devices/WaveSignalDevice.html "interface in zombie.radio.devices"), zombie.chat.ChatElementOwner, zombie.characters.Talker

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoWaveSignal)

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

  `protected zombie.chat.ChatElement`

  `chatElement`

  `protected DeviceData`

  `deviceData`

  `protected static Map<String, DeviceData>`

  `deviceDataCache`

  `protected boolean`

  `displayRange`

  `protected GameTime`

  `gameTime`

  `protected boolean`

  `hasPlayerInRange`

  `protected IsoLightSource`

  `lightSource`

  `protected int`

  `lightSourceRadius`

  `protected float`

  `lightUpdateCnt`

  `protected boolean`

  `lightWasRemoved`

  `protected float`

  `nextLightUpdate`

  `protected String`

  `talkerType`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWaveSignal(IsoCell cell)`

  `IsoWaveSignal(IsoCell cell,
  IsoGridSquare sq,
  IsoSprite spr)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

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

  `AddDeviceText(String line,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance,
  boolean attractZombies)`

  `void`

  `AddDeviceText(String line,
  int r,
  int g,
  int b,
  String guid,
  String codes,
  int distance)`

  `void`

  `AddDeviceText(String line,
  int r,
  int g,
  int b,
  String guid,
  String codes,
  int distance,
  boolean attractZombies)`

  `void`

  `addToWorld()`

  `DeviceData`

  `cloneDeviceDataFromItem(String itemfull)`

  `zombie.chat.ChatElement`

  `getChatElement()`

  `float`

  `getDelta()`

  `DeviceData`

  `getDeviceData()`

  `String`

  `getSayLine()`

  `String`

  `getTalkerType()`

  `boolean`

  `hasChatToDisplay()`

  `boolean`

  `HasPlayerInRange()`

  `protected void`

  `init(boolean objectFromBinary)`

  `boolean`

  `IsSpeaking()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadState(ByteBuffer bb)`

  `protected boolean`

  `playerWithinBounds(IsoPlayer player,
  float dist)`

  `void`

  `removeFromSquare()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `protected void`

  `removeLightSourceFromWorld()`

  `void`

  `renderlast()`

  `void`

  `renderlastold2()`

  `static void`

  `Reset()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveState(ByteBuffer bb)`

  `void`

  `Say(String line)`

  `void`

  `setDelta(float delta)`

  `void`

  `setDeviceData(DeviceData data)`

  `void`

  `setTalkerType(String type)`

  `void`

  `update()`

  `protected void`

  `updateLightSource()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectName, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### lightSource

    protected [IsoLightSource](../IsoLightSource.html "class in zombie.iso") lightSource
  + ### lightWasRemoved

    protected boolean lightWasRemoved
  + ### lightSourceRadius

    protected int lightSourceRadius
  + ### nextLightUpdate

    protected float nextLightUpdate
  + ### lightUpdateCnt

    protected float lightUpdateCnt
  + ### deviceData

    protected [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") deviceData
  + ### displayRange

    protected boolean displayRange
  + ### hasPlayerInRange

    protected boolean hasPlayerInRange
  + ### gameTime

    protected [GameTime](../../GameTime.html "class in zombie") gameTime
  + ### chatElement

    protected zombie.chat.ChatElement chatElement
  + ### talkerType

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") talkerType
  + ### deviceDataCache

    protected static [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices")> deviceDataCache
* Constructor Details
  -------------------

  + ### IsoWaveSignal

    public IsoWaveSignal([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoWaveSignal

    public IsoWaveSignal([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") spr)
* Method Details
  --------------

  + ### init

    protected void init(boolean objectFromBinary)
  + ### cloneDeviceDataFromItem

    public [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") cloneDeviceDataFromItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemfull)
  + ### hasChatToDisplay

    public boolean hasChatToDisplay()
  + ### HasPlayerInRange

    public boolean HasPlayerInRange()

    Specified by:
    :   `HasPlayerInRange` in interface `WaveSignalDevice`
  + ### getDelta

    public float getDelta()

    Specified by:
    :   `getDelta` in interface `WaveSignalDevice`
  + ### setDelta

    public void setDelta(float delta)

    Specified by:
    :   `setDelta` in interface `WaveSignalDevice`
  + ### getDeviceData

    public [DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") getDeviceData()

    Specified by:
    :   `getDeviceData` in interface `WaveSignalDevice`
  + ### setDeviceData

    public void setDeviceData([DeviceData](../../radio/devices/DeviceData.html "class in zombie.radio.devices") data)

    Specified by:
    :   `setDeviceData` in interface `WaveSignalDevice`
  + ### IsSpeaking

    public boolean IsSpeaking()

    Specified by:
    :   `IsSpeaking` in interface `zombie.characters.Talker`
  + ### getTalkerType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTalkerType()

    Specified by:
    :   `getTalkerType` in interface `zombie.characters.Talker`
  + ### setTalkerType

    public void setTalkerType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getSayLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSayLine()

    Specified by:
    :   `getSayLine` in interface `zombie.characters.Talker`
  + ### Say

    public void Say([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)

    Specified by:
    :   `Say` in interface `zombie.characters.Talker`
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

    public void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    int r,
    int g,
    int b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)
  + ### AddDeviceText

    public void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    int r,
    int g,
    int b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance,
    boolean attractZombies)
  + ### AddDeviceText

    public void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance,
    boolean attractZombies)
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `GameEntity`
  + ### renderlastold2

    public void renderlastold2()
  + ### playerWithinBounds

    protected boolean playerWithinBounds([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    float dist)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateLightSource

    protected void updateLightSource()
  + ### removeLightSourceFromWorld

    protected void removeLightSourceFromWorld()

    Overrides:
    :   `removeLightSourceFromWorld` in class `IsoObject`
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
  + ### removeFromSquare

    public void removeFromSquare()

    Overrides:
    :   `removeFromSquare` in class `IsoObject`
  + ### saveState

    public void saveState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `saveState` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### loadState

    public void loadState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `loadState` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### getChatElement

    public zombie.chat.ChatElement getChatElement()
  + ### Reset

    public static void Reset()