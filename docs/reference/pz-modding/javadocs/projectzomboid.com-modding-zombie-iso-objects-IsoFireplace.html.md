[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoFireplace](IsoFireplace.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SmoulderMinutes](#SmoulderMinutes)
   2. [IsoHeatSourceTemperature](#IsoHeatSourceTemperature)
   3. [fuelAmountMinutes](#fuelAmountMinutes)
   4. [lit](#lit)
   5. [smouldering](#smouldering)
   6. [lastUpdateTime](#lastUpdateTime)
   7. [minuteAccumulator](#minuteAccumulator)
   8. [minutesSinceExtinguished](#minutesSinceExtinguished)
   9. [fuelSprite](#fuelSprite)
   10. [fuelSpriteIndex](#fuelSpriteIndex)
   11. [fireSpriteIndex](#fireSpriteIndex)
   12. [fireSpriteUsesOurDepthTexture](#fireSpriteUsesOurDepthTexture)
   13. [lightSource](#lightSource)
   14. [heatSource](#heatSource)
   15. [soundInstance](#soundInstance)
7. [Constructor Details](#constructor-detail)
   1. [IsoFireplace(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoFireplace(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   3. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   4. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   5. [setFuelAmount(int)](#setFuelAmount(int))
   6. [getFuelAmount()](#getFuelAmount())
   7. [addFuel(int)](#addFuel(int))
   8. [useFuel(int)](#useFuel(int))
   9. [hasFuel()](#hasFuel())
   10. [turnOn()](#turnOn())
   11. [setLit(boolean)](#setLit(boolean))
   12. [isLit()](#isLit())
   13. [isSmouldering()](#isSmouldering())
   14. [extinguish()](#extinguish())
   15. [getTemperature()](#getTemperature())
   16. [isTemperatureChanging()](#isTemperatureChanging())
   17. [updateFuelSprite()](#updateFuelSprite())
   18. [updateFireSprite()](#updateFireSprite())
   19. [calcLightRadius()](#calcLightRadius())
   20. [updateLightSource()](#updateLightSource())
   21. [updateHeatSource()](#updateHeatSource())
   22. [updateSound()](#updateSound())
   23. [update()](#update())
   24. [addToWorld()](#addToWorld())
   25. [removeFromWorld()](#removeFromWorld())
   26. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   27. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   28. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   29. [isFireSpriteUsingOurDepthTexture()](#isFireSpriteUsingOurDepthTexture())
   30. [hasAnimatedAttachments()](#hasAnimatedAttachments())
   31. [renderAnimatedAttachments(float, float, float, ColorInfo)](#renderAnimatedAttachments(float,float,float,zombie.core.textures.ColorInfo))
   32. [afterRotated()](#afterRotated())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFireplace
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoFireplace

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoFireplace
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoFireplace)

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

  `protected int`

  `fireSpriteIndex`

  `private boolean`

  `fireSpriteUsesOurDepthTexture`

  `private int`

  `fuelAmountMinutes`

  `protected IsoSprite`

  `fuelSprite`

  `protected int`

  `fuelSpriteIndex`

  `protected IsoHeatSource`

  `heatSource`

  `private static final int`

  `IsoHeatSourceTemperature`

  `protected float`

  `lastUpdateTime`

  `protected IsoLightSource`

  `lightSource`

  `private boolean`

  `lit`

  `protected float`

  `minuteAccumulator`

  `protected int`

  `minutesSinceExtinguished`

  `private boolean`

  `smouldering`

  `private static final int`

  `SmoulderMinutes`

  `private long`

  `soundInstance`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoFireplace(IsoCell cell)`

  `IsoFireplace(IsoCell cell,
  IsoGridSquare sq,
  IsoSprite gid)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFuel(int units)`

  `void`

  `addToWorld()`

  `void`

  `afterRotated()`

  `private int`

  `calcLightRadius()`

  `void`

  `extinguish()`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

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

  `isFireSpriteUsingOurDepthTexture()`

  `boolean`

  `isLit()`

  `boolean`

  `isSmouldering()`

  `boolean`

  `isTemperatureChanging()`

  `void`

  `load(ByteBuffer input,
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

  `setFuelAmount(int units)`

  `void`

  `setLit(boolean lit)`

  `void`

  `turnOn()`

  `void`

  `update()`

  `private void`

  `updateFireSprite()`

  `private void`

  `updateFuelSprite()`

  `private void`

  `updateHeatSource()`

  `private void`

  `updateLightSource()`

  `private void`

  `updateSound()`

  `int`

  `useFuel(int amount)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### SmoulderMinutes

    private static final int SmoulderMinutes

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFireplace.SmoulderMinutes)
  + ### IsoHeatSourceTemperature

    private static final int IsoHeatSourceTemperature

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFireplace.IsoHeatSourceTemperature)
  + ### fuelAmountMinutes

    private int fuelAmountMinutes
  + ### lit

    private boolean lit
  + ### smouldering

    private boolean smouldering
  + ### lastUpdateTime

    protected float lastUpdateTime
  + ### minuteAccumulator

    protected float minuteAccumulator
  + ### minutesSinceExtinguished

    protected int minutesSinceExtinguished
  + ### fuelSprite

    protected [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") fuelSprite
  + ### fuelSpriteIndex

    protected int fuelSpriteIndex
  + ### fireSpriteIndex

    protected int fireSpriteIndex
  + ### fireSpriteUsesOurDepthTexture

    private boolean fireSpriteUsesOurDepthTexture
  + ### lightSource

    protected [IsoLightSource](../IsoLightSource.html "class in zombie.iso") lightSource
  + ### heatSource

    protected [IsoHeatSource](../IsoHeatSource.html "class in zombie.iso") heatSource
  + ### soundInstance

    private long soundInstance
* Constructor Details
  -------------------

  + ### IsoFireplace

    public IsoFireplace([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoFireplace

    public IsoFireplace([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### getFacingPosition

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPosition([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
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

    public void setFuelAmount(int units)
  + ### getFuelAmount

    public int getFuelAmount()
  + ### addFuel

    public void addFuel(int units)
  + ### useFuel

    public int useFuel(int amount)
  + ### hasFuel

    public boolean hasFuel()
  + ### turnOn

    public void turnOn()

    Overrides:
    :   `turnOn` in class `IsoObject`
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
  + ### extinguish

    public void extinguish()
  + ### getTemperature

    public float getTemperature()
  + ### isTemperatureChanging

    public boolean isTemperatureChanging()
  + ### updateFuelSprite

    private void updateFuelSprite()
  + ### updateFireSprite

    private void updateFireSprite()
  + ### calcLightRadius

    private int calcLightRadius()
  + ### updateLightSource

    private void updateLightSource()
  + ### updateHeatSource

    private void updateHeatSource()
  + ### updateSound

    private void updateSound()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
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
  + ### isFireSpriteUsingOurDepthTexture

    public boolean isFireSpriteUsingOurDepthTexture()
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
  + ### afterRotated

    public void afterRotated()

    Overrides:
    :   `afterRotated` in class `IsoObject`