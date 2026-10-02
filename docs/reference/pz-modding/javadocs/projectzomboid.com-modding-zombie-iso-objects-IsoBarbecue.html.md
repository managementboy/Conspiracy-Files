[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoBarbecue](IsoBarbecue.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [LitTemperature](#LitTemperature)
   2. [UnlitTemperature](#UnlitTemperature)
   3. [SmoulderMinutes](#SmoulderMinutes)
   4. [MaxFuelAmount](#MaxFuelAmount)
   5. [SpriteWithPropaneTankOffset](#SpriteWithPropaneTankOffset)
   6. [SpriteWithoutPropaneTankOffset](#SpriteWithoutPropaneTankOffset)
   7. [SpriteOffsetX](#SpriteOffsetX)
   8. [SpriteOffsetY](#SpriteOffsetY)
   9. [IsoHeatSourceRadius](#IsoHeatSourceRadius)
   10. [IsoHeatSourceTemperature](#IsoHeatSourceTemperature)
   11. [SmokeTint](#SmokeTint)
   12. [hasPropaneTank](#hasPropaneTank)
   13. [fuelAmountMinutes](#fuelAmountMinutes)
   14. [lit](#lit)
   15. [isSmouldering](#isSmouldering)
   16. [lastUpdateTime](#lastUpdateTime)
   17. [minuteAccumulator](#minuteAccumulator)
   18. [minutesSinceExtinguished](#minutesSinceExtinguished)
   19. [normalIsoSprite](#normalIsoSprite)
   20. [noTankIsoSprite](#noTankIsoSprite)
   21. [isoHeatSource](#isoHeatSource)
   22. [soundInstance](#soundInstance)
7. [Constructor Details](#constructor-detail)
   1. [IsoBarbecue(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoBarbecue(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   3. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   4. [setFuelAmount(int)](#setFuelAmount(int))
   5. [getFuelAmount()](#getFuelAmount())
   6. [addFuel(int)](#addFuel(int))
   7. [useFuel(int)](#useFuel(int))
   8. [hasFuel()](#hasFuel())
   9. [hasPropaneTank()](#hasPropaneTank())
   10. [isPropaneBBQ()](#isPropaneBBQ())
   11. [isSpriteWithPropaneTank(IsoSprite)](#isSpriteWithPropaneTank(zombie.iso.sprite.IsoSprite))
   12. [isSpriteWithoutPropaneTank(IsoSprite)](#isSpriteWithoutPropaneTank(zombie.iso.sprite.IsoSprite))
   13. [setPropaneTank(InventoryItem)](#setPropaneTank(zombie.inventory.InventoryItem))
   14. [removePropaneTank()](#removePropaneTank())
   15. [setLit(boolean)](#setLit(boolean))
   16. [isLit()](#isLit())
   17. [isSmouldering()](#isSmouldering())
   18. [turnOn()](#turnOn())
   19. [turnOff()](#turnOff())
   20. [toggle()](#toggle())
   21. [extinguish()](#extinguish())
   22. [getTemperature()](#getTemperature())
   23. [isTemperatureChanging()](#isTemperatureChanging())
   24. [updateSprite()](#updateSprite())
   25. [updateHeatSource()](#updateHeatSource())
   26. [updateSound()](#updateSound())
   27. [update()](#update())
   28. [setSprite(IsoSprite)](#setSprite(zombie.iso.sprite.IsoSprite))
   29. [addToWorld()](#addToWorld())
   30. [removeFromWorld()](#removeFromWorld())
   31. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   32. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   33. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   34. [hasAnimatedAttachments()](#hasAnimatedAttachments())
   35. [renderAnimatedAttachments(float, float, float, ColorInfo)](#renderAnimatedAttachments(float,float,float,zombie.core.textures.ColorInfo))
   36. [updateClientCookingSounds()](#updateClientCookingSounds())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoBarbecue
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoBarbecue

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoBarbecue
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoBarbecue)

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

  `private int`

  `fuelAmountMinutes`

  `private boolean`

  `hasPropaneTank`

  `private IsoHeatSource`

  `isoHeatSource`

  `private static final int`

  `IsoHeatSourceRadius`

  `private static final int`

  `IsoHeatSourceTemperature`

  `private boolean`

  `isSmouldering`

  `protected float`

  `lastUpdateTime`

  `private boolean`

  `lit`

  `private static final float`

  `LitTemperature`

  `private static final int`

  `MaxFuelAmount`

  `protected float`

  `minuteAccumulator`

  `protected int`

  `minutesSinceExtinguished`

  `private IsoSprite`

  `normalIsoSprite`

  `private IsoSprite`

  `noTankIsoSprite`

  `private static final ColorInfo`

  `SmokeTint`

  `private static final int`

  `SmoulderMinutes`

  `private long`

  `soundInstance`

  `private static final short`

  `SpriteOffsetX`

  `private static final short`

  `SpriteOffsetY`

  `private static final int`

  `SpriteWithoutPropaneTankOffset`

  `private static final int`

  `SpriteWithPropaneTankOffset`

  `private static final float`

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

  `IsoBarbecue(IsoCell cell)`

  `IsoBarbecue(IsoCell cell,
  IsoGridSquare isoGridSquare,
  IsoSprite isoSprite)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFuel(int fuelAmount)`

  `void`

  `addToWorld()`

  `void`

  `extinguish()`

  `int`

  `getFuelAmount()`

  `String`

  `getObjectName()`

  `float`

  `getTemperature()`

  `boolean`

  `hasAnimatedAttachments()`

  `boolean`

  `hasFuel()`

  `boolean`

  `hasPropaneTank()`

  `boolean`

  `isLit()`

  `boolean`

  `isPropaneBBQ()`

  `boolean`

  `isSmouldering()`

  `static boolean`

  `isSpriteWithoutPropaneTank(IsoSprite sprite)`

  `static boolean`

  `isSpriteWithPropaneTank(IsoSprite sprite)`

  `boolean`

  `isTemperatureChanging()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader byteBuffer)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `InventoryItem`

  `removePropaneTank()`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo colorInfo,
  boolean doChild,
  boolean wallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `void`

  `renderAnimatedAttachments(float x,
  float y,
  float z,
  ColorInfo colorInfo)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable kahluaTable,
  zombie.core.network.ByteBufferWriter byteBuffer)`

  `void`

  `setFuelAmount(int fuelAmount)`

  `void`

  `setLit(boolean lit)`

  `void`

  `setPropaneTank(InventoryItem tank)`

  `void`

  `setSprite(IsoSprite isoSprite)`

  `void`

  `toggle()`

  `void`

  `turnOff()`

  `void`

  `turnOn()`

  `void`

  `update()`

  `private void`

  `updateClientCookingSounds()`

  `private void`

  `updateHeatSource()`

  `private void`

  `updateSound()`

  `private void`

  `updateSprite()`

  `int`

  `useFuel(int amount)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### LitTemperature

    private static final float LitTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.LitTemperature)
  + ### UnlitTemperature

    private static final float UnlitTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.UnlitTemperature)
  + ### SmoulderMinutes

    private static final int SmoulderMinutes

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.SmoulderMinutes)
  + ### MaxFuelAmount

    private static final int MaxFuelAmount

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.MaxFuelAmount)
  + ### SpriteWithPropaneTankOffset

    private static final int SpriteWithPropaneTankOffset

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.SpriteWithPropaneTankOffset)
  + ### SpriteWithoutPropaneTankOffset

    private static final int SpriteWithoutPropaneTankOffset

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.SpriteWithoutPropaneTankOffset)
  + ### SpriteOffsetX

    private static final short SpriteOffsetX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.SpriteOffsetX)
  + ### SpriteOffsetY

    private static final short SpriteOffsetY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.SpriteOffsetY)
  + ### IsoHeatSourceRadius

    private static final int IsoHeatSourceRadius

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.IsoHeatSourceRadius)
  + ### IsoHeatSourceTemperature

    private static final int IsoHeatSourceTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarbecue.IsoHeatSourceTemperature)
  + ### SmokeTint

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") SmokeTint
  + ### hasPropaneTank

    private boolean hasPropaneTank
  + ### fuelAmountMinutes

    private int fuelAmountMinutes
  + ### lit

    private boolean lit
  + ### isSmouldering

    private boolean isSmouldering
  + ### lastUpdateTime

    protected float lastUpdateTime
  + ### minuteAccumulator

    protected float minuteAccumulator
  + ### minutesSinceExtinguished

    protected int minutesSinceExtinguished
  + ### normalIsoSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") normalIsoSprite
  + ### noTankIsoSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") noTankIsoSprite
  + ### isoHeatSource

    private [IsoHeatSource](../IsoHeatSource.html "class in zombie.iso") isoHeatSource
  + ### soundInstance

    private long soundInstance
* Constructor Details
  -------------------

  + ### IsoBarbecue

    public IsoBarbecue([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoBarbecue

    public IsoBarbecue([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") isoSprite)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
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
  + ### setFuelAmount

    public void setFuelAmount(int fuelAmount)
  + ### getFuelAmount

    public int getFuelAmount()
  + ### addFuel

    public void addFuel(int fuelAmount)
  + ### useFuel

    public int useFuel(int amount)
  + ### hasFuel

    public boolean hasFuel()
  + ### hasPropaneTank

    public boolean hasPropaneTank()

    Overrides:
    :   `hasPropaneTank` in class `IsoObject`
  + ### isPropaneBBQ

    public boolean isPropaneBBQ()

    Overrides:
    :   `isPropaneBBQ` in class `IsoObject`
  + ### isSpriteWithPropaneTank

    public static boolean isSpriteWithPropaneTank([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### isSpriteWithoutPropaneTank

    public static boolean isSpriteWithoutPropaneTank([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setPropaneTank

    public void setPropaneTank([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") tank)
  + ### removePropaneTank

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removePropaneTank()
  + ### setLit

    public void setLit(boolean lit)

    Overrides:
    :   `setLit` in class `IsoObject`
  + ### isLit

    public boolean isLit()

    Overrides:
    :   `isLit` in class `IsoObject`
  + ### isSmouldering

    public boolean isSmouldering()
  + ### turnOn

    public void turnOn()

    Overrides:
    :   `turnOn` in class `IsoObject`
  + ### turnOff

    public void turnOff()
  + ### toggle

    public void toggle()
  + ### extinguish

    public void extinguish()
  + ### getTemperature

    public float getTemperature()
  + ### isTemperatureChanging

    public boolean isTemperatureChanging()
  + ### updateSprite

    private void updateSprite()
  + ### updateHeatSource

    private void updateHeatSource()
  + ### updateSound

    private void updateSound()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### setSprite

    public void setSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") isoSprite)

    Overrides:
    :   `setSprite` in class `IsoObject`
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
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") colorInfo,
    boolean doChild,
    boolean wallLightingPass,
    zombie.core.opengl.Shader shader)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Attempt to render this Renderable.   
    It will not draw if isSceneCulled == TRUE,   
    or if isDoRender == FALSE

    Specified by:
    :   `render` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `render` in class `IsoObject`
  + ### saveChange

    public void saveChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable kahluaTable,
    zombie.core.network.ByteBufferWriter byteBuffer)

    Overrides:
    :   `saveChange` in class `IsoObject`
  + ### loadChange

    public void loadChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader byteBuffer)

    Overrides:
    :   `loadChange` in class `IsoObject`
  + ### hasAnimatedAttachments

    public boolean hasAnimatedAttachments()

    Overrides:
    :   `hasAnimatedAttachments` in class `IsoObject`
  + ### renderAnimatedAttachments

    public void renderAnimatedAttachments(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") colorInfo)

    Overrides:
    :   `renderAnimatedAttachments` in class `IsoObject`
  + ### updateClientCookingSounds

    private void updateClientCookingSounds()