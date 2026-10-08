[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoWorldInventoryObject](IsoWorldInventoryObject.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [item](#item)
   2. [xoff](#xoff)
   3. [yoff](#yoff)
   4. [zoff](#zoff)
   5. [removeProcess](#removeProcess)
   6. [dropTime](#dropTime)
   7. [ignoreRemoveSandbox](#ignoreRemoveSandbox)
   8. [extendedPlacement](#extendedPlacement)
7. [Constructor Details](#constructor-detail)
   1. [IsoWorldInventoryObject(InventoryItem, IsoGridSquare, float, float, float)](#%3Cinit%3E(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float))
   2. [IsoWorldInventoryObject(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
8. [Method Details](#method-detail)
   1. [swapItem(InventoryItem)](#swapItem(zombie.inventory.InventoryItem))
   2. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   3. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   4. [isWaterSource()](#isWaterSource())
   5. [isPureWater(boolean)](#isPureWater(boolean))
   6. [hasWater()](#hasWater())
   7. [getFluidAmount()](#getFluidAmount())
   8. [emptyFluid()](#emptyFluid())
   9. [useFluid(float)](#useFluid(float))
   10. [addFluid(FluidType, float)](#addFluid(zombie.entity.components.fluids.FluidType,float))
   11. [canTransferFluidFrom(FluidContainer)](#canTransferFluidFrom(zombie.entity.components.fluids.FluidContainer))
   12. [canTransferFluidTo(FluidContainer)](#canTransferFluidTo(zombie.entity.components.fluids.FluidContainer))
   13. [transferFluidTo(FluidContainer, float)](#transferFluidTo(zombie.entity.components.fluids.FluidContainer,float))
   14. [transferFluidFrom(FluidContainer, float)](#transferFluidFrom(zombie.entity.components.fluids.FluidContainer,float))
   15. [getFluidCapacity()](#getFluidCapacity())
   16. [isFluidInputLocked()](#isFluidInputLocked())
   17. [isTaintedWater()](#isTaintedWater())
   18. [getFluidUiName()](#getFluidUiName())
   19. [getCustomMenuOption()](#getCustomMenuOption())
   20. [update()](#update())
   21. [updateSprite()](#updateSprite())
   22. [finishupdate()](#finishupdate())
   23. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   24. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   25. [softReset()](#softReset())
   26. [getObjectName()](#getObjectName())
   27. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   28. [debugDrawLocation(float, float, float)](#debugDrawLocation(float,float,float))
   29. [debugHitTest()](#debugHitTest())
   30. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   31. [renderObjectPicker(float, float, float, ColorInfo)](#renderObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   32. [getItem()](#getItem())
   33. [addToWorld()](#addToWorld())
   34. [removeFromWorld()](#removeFromWorld())
   35. [removeFromSquare()](#removeFromSquare())
   36. [getScreenPosX(int)](#getScreenPosX(int))
   37. [getScreenPosY(int)](#getScreenPosY(int))
   38. [setIgnoreRemoveSandbox(boolean)](#setIgnoreRemoveSandbox(boolean))
   39. [isIgnoreRemoveSandbox()](#isIgnoreRemoveSandbox())
   40. [setExtendedPlacement(boolean)](#setExtendedPlacement(boolean))
   41. [isExtendedPlacement()](#isExtendedPlacement())
   42. [getWorldPosX()](#getWorldPosX())
   43. [getWorldPosY()](#getWorldPosY())
   44. [getWorldPosZ()](#getWorldPosZ())
   45. [getSurfaceAlpha(IsoGridSquare, float)](#getSurfaceAlpha(zombie.iso.IsoGridSquare,float))
   46. [getSurfaceAlpha(IsoGridSquare, float, boolean)](#getSurfaceAlpha(zombie.iso.IsoGridSquare,float,boolean))
   47. [setOffset(float, float, float)](#setOffset(float,float,float))
   48. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   49. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   50. [getRenderSquare()](#getRenderSquare())
   51. [setHighlighted(int, boolean, boolean)](#setHighlighted(int,boolean,boolean))
   52. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   53. [getOffX()](#getOffX())
   54. [getOffY()](#getOffY())
   55. [getOffZ()](#getOffZ())
   56. [setOffX(float)](#setOffX(float))
   57. [setOffY(float)](#setOffY(float))
   58. [setOffZ(float)](#setOffZ(float))
   59. [syncExtendedPlacement()](#syncExtendedPlacement())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoWorldInventoryObject
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoWorldInventoryObject

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IItemProvider, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoWorldInventoryObject
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.IItemProvider

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoWorldInventoryObject)

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

  `double`

  `dropTime`

  `private boolean`

  `extendedPlacement`

  `boolean`

  `ignoreRemoveSandbox`

  `InventoryItem`

  `item`

  `boolean`

  `removeProcess`

  `float`

  `xoff`

  `float`

  `yoff`

  `float`

  `zoff`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWorldInventoryObject(InventoryItem item,
  IsoGridSquare sq,
  float xoff,
  float yoff,
  float zoff)`

  `IsoWorldInventoryObject(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFluid(FluidType fluidType,
  float amount)`

  `void`

  `addToWorld()`

  `boolean`

  `canTransferFluidFrom(FluidContainer other)`

  `boolean`

  `canTransferFluidTo(FluidContainer other)`

  `boolean`

  `couldBePoweredByGenerator()`

  `private void`

  `debugDrawLocation(float x,
  float y,
  float z)`

  `private void`

  `debugHitTest()`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `emptyFluid()`

  `boolean`

  `finishupdate()`

  `String`

  `getCustomMenuOption()`

  `float`

  `getFluidAmount()`

  `float`

  `getFluidCapacity()`

  `String`

  `getFluidUiName()`

  `InventoryItem`

  `getItem()`

  `String`

  `getObjectName()`

  `float`

  `getOffX()`

  `float`

  `getOffY()`

  `float`

  `getOffZ()`

  `IsoGridSquare`

  `getRenderSquare()`

  `float`

  `getScreenPosX(int playerIndex)`

  `float`

  `getScreenPosY(int playerIndex)`

  `static float`

  `getSurfaceAlpha(IsoGridSquare square,
  float zoff)`

  `static float`

  `getSurfaceAlpha(IsoGridSquare square,
  float zoff,
  boolean bTargetAlpha)`

  `float`

  `getWorldPosX()`

  `float`

  `getWorldPosY()`

  `float`

  `getWorldPosZ()`

  `boolean`

  `hasWater()`

  `boolean`

  `isExtendedPlacement()`

  `boolean`

  `isFluidInputLocked()`

  `boolean`

  `isIgnoreRemoveSandbox()`

  `boolean`

  `isPureWater(boolean includeTainted)`

  `boolean`

  `isTaintedWater()`

  `private boolean`

  `isWaterSource()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `removeFromSquare()`

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

  `renderObjectPicker(float x,
  float y,
  float z,
  ColorInfo lightInfo)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `setExtendedPlacement(boolean b)`

  `void`

  `setHighlighted(int playerIndex,
  boolean bHighlight,
  boolean bRenderOnce)`

  `void`

  `setIgnoreRemoveSandbox(boolean b)`

  `void`

  `setOffset(float x,
  float y,
  float z)`

  `void`

  `setOffX(float newoff)`

  `void`

  `setOffY(float newoff)`

  `void`

  `setOffZ(float newoff)`

  `void`

  `softReset()`

  `void`

  `swapItem(InventoryItem newItem)`

  `void`

  `syncExtendedPlacement()`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `float`

  `transferFluidFrom(FluidContainer source,
  float amount)`

  `float`

  `transferFluidTo(FluidContainer target,
  float amount)`

  `void`

  `update()`

  `void`

  `updateSprite()`

  `float`

  `useFluid(float amount)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, dumpContentsInSquare, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObjectReceive, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useItemOn, WeaponHit, writeToRemoteBuffer`

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

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
  + ### xoff

    public float xoff
  + ### yoff

    public float yoff
  + ### zoff

    public float zoff
  + ### removeProcess

    public boolean removeProcess
  + ### dropTime

    public double dropTime
  + ### ignoreRemoveSandbox

    public boolean ignoreRemoveSandbox
  + ### extendedPlacement

    private boolean extendedPlacement
* Constructor Details
  -------------------

  + ### IsoWorldInventoryObject

    public IsoWorldInventoryObject([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    float xoff,
    float yoff,
    float zoff)
  + ### IsoWorldInventoryObject

    public IsoWorldInventoryObject([IsoCell](../IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### swapItem

    public void swapItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") newItem)
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
  + ### isWaterSource

    private boolean isWaterSource()
  + ### isPureWater

    public boolean isPureWater(boolean includeTainted)
  + ### hasWater

    public boolean hasWater()

    Overrides:
    :   `hasWater` in class `IsoObject`
  + ### getFluidAmount

    public float getFluidAmount()

    Overrides:
    :   `getFluidAmount` in class `IsoObject`
  + ### emptyFluid

    public void emptyFluid()

    Overrides:
    :   `emptyFluid` in class `IsoObject`
  + ### useFluid

    public float useFluid(float amount)

    Overrides:
    :   `useFluid` in class `IsoObject`
  + ### addFluid

    public void addFluid([FluidType](../../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") fluidType,
    float amount)

    Overrides:
    :   `addFluid` in class `IsoObject`
  + ### canTransferFluidFrom

    public boolean canTransferFluidFrom([FluidContainer](../../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") other)

    Overrides:
    :   `canTransferFluidFrom` in class `IsoObject`
  + ### canTransferFluidTo

    public boolean canTransferFluidTo([FluidContainer](../../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") other)

    Overrides:
    :   `canTransferFluidTo` in class `IsoObject`
  + ### transferFluidTo

    public float transferFluidTo([FluidContainer](../../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") target,
    float amount)

    Overrides:
    :   `transferFluidTo` in class `IsoObject`
  + ### transferFluidFrom

    public float transferFluidFrom([FluidContainer](../../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") source,
    float amount)

    Overrides:
    :   `transferFluidFrom` in class `IsoObject`
  + ### getFluidCapacity

    public float getFluidCapacity()

    Overrides:
    :   `getFluidCapacity` in class `IsoObject`
  + ### isFluidInputLocked

    public boolean isFluidInputLocked()

    Overrides:
    :   `isFluidInputLocked` in class `IsoObject`
  + ### isTaintedWater

    public boolean isTaintedWater()

    Overrides:
    :   `isTaintedWater` in class `IsoObject`
  + ### getFluidUiName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidUiName()

    Overrides:
    :   `getFluidUiName` in class `IsoObject`
  + ### getCustomMenuOption

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomMenuOption()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateSprite

    public void updateSprite()
  + ### finishupdate

    public boolean finishupdate()
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
  + ### softReset

    public void softReset()

    Overrides:
    :   `softReset` in class `IsoObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)

    Overrides:
    :   `DoTooltip` in class `IsoObject`
  + ### debugDrawLocation

    private void debugDrawLocation(float x,
    float y,
    float z)
  + ### debugHitTest

    private void debugHitTest()
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
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()

    Specified by:
    :   `getItem` in interface `zombie.iso.IItemProvider`
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
  + ### getScreenPosX

    public float getScreenPosX(int playerIndex)
  + ### getScreenPosY

    public float getScreenPosY(int playerIndex)
  + ### setIgnoreRemoveSandbox

    public void setIgnoreRemoveSandbox(boolean b)
  + ### isIgnoreRemoveSandbox

    public boolean isIgnoreRemoveSandbox()
  + ### setExtendedPlacement

    public void setExtendedPlacement(boolean b)
  + ### isExtendedPlacement

    public boolean isExtendedPlacement()
  + ### getWorldPosX

    public float getWorldPosX()
  + ### getWorldPosY

    public float getWorldPosY()
  + ### getWorldPosZ

    public float getWorldPosZ()
  + ### getSurfaceAlpha

    public static float getSurfaceAlpha([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    float zoff)
  + ### getSurfaceAlpha

    public static float getSurfaceAlpha([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    float zoff,
    boolean bTargetAlpha)
  + ### setOffset

    public void setOffset(float x,
    float y,
    float z)
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
  + ### getRenderSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRenderSquare()

    Overrides:
    :   `getRenderSquare` in class `IsoObject`
  + ### setHighlighted

    public void setHighlighted(int playerIndex,
    boolean bHighlight,
    boolean bRenderOnce)

    Overrides:
    :   `setHighlighted` in class `IsoObject`
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()

    Overrides:
    :   `couldBePoweredByGenerator` in class `IsoObject`
  + ### getOffX

    public float getOffX()
  + ### getOffY

    public float getOffY()
  + ### getOffZ

    public float getOffZ()
  + ### setOffX

    public void setOffX(float newoff)
  + ### setOffY

    public void setOffY(float newoff)
  + ### setOffZ

    public void setOffZ(float newoff)
  + ### syncExtendedPlacement

    public void syncExtendedPlacement()