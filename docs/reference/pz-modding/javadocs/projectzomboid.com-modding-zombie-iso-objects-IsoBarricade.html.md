[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoBarricade](IsoBarricade.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_PLANKS](#MAX_PLANKS)
   2. [PLANK\_HEALTH](#PLANK_HEALTH)
   3. [METAL\_BAR\_HEALTH](#METAL_BAR_HEALTH)
   4. [METAL\_HEALTH](#METAL_HEALTH)
   5. [METAL\_HEALTH\_DAMAGED](#METAL_HEALTH_DAMAGED)
   6. [plankHealth](#plankHealth)
   7. [metalHealth](#metalHealth)
   8. [metalBarHealth](#metalBarHealth)
7. [Constructor Details](#constructor-detail)
   1. [IsoBarricade(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoBarricade(IsoGridSquare, IsoDirections)](#%3Cinit%3E(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [addPlank(IsoGameCharacter)](#addPlank(zombie.characters.IsoGameCharacter))
   3. [addPlank(IsoGameCharacter, InventoryItem)](#addPlank(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   4. [removePlank(IsoGameCharacter)](#removePlank(zombie.characters.IsoGameCharacter))
   5. [getNumPlanks()](#getNumPlanks())
   6. [canAddPlank()](#canAddPlank())
   7. [addMetalBar(IsoGameCharacter, InventoryItem)](#addMetalBar(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   8. [removeMetalBar(IsoGameCharacter)](#removeMetalBar(zombie.characters.IsoGameCharacter))
   9. [addMetal(IsoGameCharacter, InventoryItem)](#addMetal(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   10. [isMetalBar()](#isMetalBar())
   11. [removeMetal(IsoGameCharacter)](#removeMetal(zombie.characters.IsoGameCharacter))
   12. [isMetal()](#isMetal())
   13. [isBlockVision()](#isBlockVision())
   14. [chooseSprite()](#chooseSprite())
   15. [isDestroyed()](#isDestroyed())
   16. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   17. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   18. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   19. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   20. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   21. [Damage(float)](#Damage(float))
   22. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   23. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   24. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   25. [getThumpCondition()](#getThumpCondition())
   26. [setHealth(int)](#setHealth(int))
   27. [getHealth()](#getHealth())
   28. [getMaxHealth()](#getMaxHealth())
   29. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   30. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   31. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   32. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   33. [getBarricadedObject()](#getBarricadedObject())
   34. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   35. [GetBarricadeOnSquare(IsoGridSquare, IsoDirections)](#GetBarricadeOnSquare(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   36. [GetBarricadeForCharacter(BarricadeAble, IsoGameCharacter)](#GetBarricadeForCharacter(zombie.iso.objects.interfaces.BarricadeAble,zombie.characters.IsoGameCharacter))
   37. [GetBarricadeOppositeCharacter(BarricadeAble, IsoGameCharacter)](#GetBarricadeOppositeCharacter(zombie.iso.objects.interfaces.BarricadeAble,zombie.characters.IsoGameCharacter))
   38. [AddBarricadeToObject(BarricadeAble, boolean)](#AddBarricadeToObject(zombie.iso.objects.interfaces.BarricadeAble,boolean))
   39. [AddBarricadeToObject(BarricadeAble, IsoGameCharacter)](#AddBarricadeToObject(zombie.iso.objects.interfaces.BarricadeAble,zombie.characters.IsoGameCharacter))
   40. [getNewBarricadeIndex(BarricadeAble, IsoGridSquare, IsoDirections)](#getNewBarricadeIndex(zombie.iso.objects.interfaces.BarricadeAble,zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   41. [canAttackBypassIsoBarricade(IsoGameCharacter, HandWeapon)](#canAttackBypassIsoBarricade(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   42. [barricadeCurrentCellWithMetalPlate()](#barricadeCurrentCellWithMetalPlate())
   43. [barricadeCurrentCellWithMetalBars()](#barricadeCurrentCellWithMetalBars())
   44. [barricadeCurrentCellWithPlanks(int)](#barricadeCurrentCellWithPlanks(int))
   45. [setNumberOfPlanks(int)](#setNumberOfPlanks(int))
   46. [recalculateLighting()](#recalculateLighting())
   47. [updateSprite()](#updateSprite())
   48. [addFromCraftRecipe(IsoGameCharacter, ArrayList)](#addFromCraftRecipe(zombie.characters.IsoGameCharacter,java.util.ArrayList))
   49. [getLightTransmission()](#getLightTransmission())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoBarricade
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoBarricade

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IHasHealth, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoBarricade
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.objects.interfaces.Thumpable, zombie.iso.IHasHealth

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoBarricade)

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

  `static final int`

  `MAX_PLANKS`

  `static final int`

  `METAL_BAR_HEALTH`

  `static final int`

  `METAL_HEALTH`

  `static final int`

  `METAL_HEALTH_DAMAGED`

  `private int`

  `metalBarHealth`

  `private int`

  `metalHealth`

  `static final int`

  `PLANK_HEALTH`

  `private final int[]`

  `plankHealth`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoBarricade(IsoCell cell)`

  `IsoBarricade(IsoGridSquare gridSquare,
  IsoDirections dir)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoBarricade`

  `AddBarricadeToObject(BarricadeAble to,
  boolean addOpposite)`

  `static IsoBarricade`

  `AddBarricadeToObject(BarricadeAble to,
  IsoGameCharacter chr)`

  `void`

  `addFromCraftRecipe(IsoGameCharacter chr,
  ArrayList<InventoryItem> items)`

  `void`

  `addMetal(IsoGameCharacter chr,
  InventoryItem metal)`

  `void`

  `addMetalBar(IsoGameCharacter chr,
  InventoryItem metalBar)`

  `void`

  `addPlank(IsoGameCharacter chr)`

  `void`

  `addPlank(IsoGameCharacter chr,
  InventoryItem plank)`

  `static void`

  `barricadeCurrentCellWithMetalBars()`

  `static void`

  `barricadeCurrentCellWithMetalPlate()`

  `static void`

  `barricadeCurrentCellWithPlanks(int numberOfPlanks)`

  `boolean`

  `canAddPlank()`

  `boolean`

  `canAttackBypassIsoBarricade(IsoGameCharacter isoGameCharacter,
  HandWeapon handWeapon)`

  `private void`

  `chooseSprite()`

  `void`

  `Damage(float amount)`

  `BarricadeAble`

  `getBarricadedObject()`

  `static IsoBarricade`

  `GetBarricadeForCharacter(BarricadeAble obj,
  IsoGameCharacter chr)`

  `static IsoBarricade`

  `GetBarricadeOnSquare(IsoGridSquare square,
  IsoDirections dir)`

  `static IsoBarricade`

  `GetBarricadeOppositeCharacter(BarricadeAble obj,
  IsoGameCharacter chr)`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `int`

  `getHealth()`

  `float`

  `getLightTransmission()`

  `int`

  `getMaxHealth()`

  `private static int`

  `getNewBarricadeIndex(BarricadeAble object,
  IsoGridSquare square,
  IsoDirections dir)`

  `int`

  `getNumPlanks()`

  `String`

  `getObjectName()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `float`

  `getThumpCondition()`

  `boolean`

  `isBlockVision()`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isMetal()`

  `boolean`

  `isMetalBar()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `private static void`

  `recalculateLighting()`

  `InventoryItem`

  `removeMetal(IsoGameCharacter chr)`

  `InventoryItem`

  `removeMetalBar(IsoGameCharacter chr)`

  `InventoryItem`

  `removePlank(IsoGameCharacter chr)`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `setHealth(int health)`

  `private void`

  `setNumberOfPlanks(int numberOfPlanks)`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `IsoObject.VisionResult`

  `TestVision(IsoGridSquare from,
  IsoGridSquare to)`

  `void`

  `Thump(IsoMovingObject thumper,
  int thumpEventCount)`

  `private void`

  `updateSprite()`

  `void`

  `WeaponHit(IsoGameCharacter owner,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorld, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, TestCollide, TestPathfindCollide, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `getThumpableFor, Thump`

* Field Details
  -------------

  + ### MAX\_PLANKS

    public static final int MAX\_PLANKS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarricade.MAX_PLANKS)
  + ### PLANK\_HEALTH

    public static final int PLANK\_HEALTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarricade.PLANK_HEALTH)
  + ### METAL\_BAR\_HEALTH

    public static final int METAL\_BAR\_HEALTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarricade.METAL_BAR_HEALTH)
  + ### METAL\_HEALTH

    public static final int METAL\_HEALTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarricade.METAL_HEALTH)
  + ### METAL\_HEALTH\_DAMAGED

    public static final int METAL\_HEALTH\_DAMAGED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoBarricade.METAL_HEALTH_DAMAGED)
  + ### plankHealth

    private final int[] plankHealth
  + ### metalHealth

    private int metalHealth
  + ### metalBarHealth

    private int metalBarHealth
* Constructor Details
  -------------------

  + ### IsoBarricade

    public IsoBarricade([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoBarricade

    public IsoBarricade([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### addPlank

    public void addPlank([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addPlank

    public void addPlank([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") plank)
  + ### removePlank

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removePlank([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getNumPlanks

    public int getNumPlanks()
  + ### canAddPlank

    public boolean canAddPlank()
  + ### addMetalBar

    public void addMetalBar([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") metalBar)
  + ### removeMetalBar

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removeMetalBar([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addMetal

    public void addMetal([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") metal)
  + ### isMetalBar

    public boolean isMetalBar()
  + ### removeMetal

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removeMetal([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isMetal

    public boolean isMetal()
  + ### isBlockVision

    public boolean isBlockVision()
  + ### chooseSprite

    private void chooseSprite()
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `isDestroyed` in class `IsoObject`
  + ### TestVision

    public [IsoObject.VisionResult](../IsoObject.VisionResult.html "enum class in zombie.iso") TestVision([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") to)

    Overrides:
    :   `TestVision` in class `IsoObject`
  + ### Thump

    public void Thump([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") thumper,
    int thumpEventCount)

    Specified by:
    :   `Thump` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `Thump` in class `IsoObject`
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpableFor` in class `IsoObject`
  + ### getFacingPosition

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPosition([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
  + ### Damage

    public void Damage(float amount)

    Overrides:
    :   `Damage` in class `IsoObject`
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### syncIsoObject

    public void syncIsoObject(boolean bRemote,
    byte val,
    zombie.core.raknet.UdpConnection source,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObject` in class `IsoObject`
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpCondition` in class `IsoObject`
  + ### setHealth

    public void setHealth(int health)

    Specified by:
    :   `setHealth` in interface `zombie.iso.IHasHealth`
  + ### getHealth

    public int getHealth()

    Specified by:
    :   `getHealth` in interface `zombie.iso.IHasHealth`
  + ### getMaxHealth

    public int getMaxHealth()

    Specified by:
    :   `getMaxHealth` in interface `zombie.iso.IHasHealth`
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
  + ### getBarricadedObject

    public [BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") getBarricadedObject()
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
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
  + ### GetBarricadeOnSquare

    public static [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") GetBarricadeOnSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### GetBarricadeForCharacter

    public static [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") GetBarricadeForCharacter([BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") obj,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### GetBarricadeOppositeCharacter

    public static [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") GetBarricadeOppositeCharacter([BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") obj,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### AddBarricadeToObject

    public static [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") AddBarricadeToObject([BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") to,
    boolean addOpposite)
  + ### AddBarricadeToObject

    public static [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") AddBarricadeToObject([BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") to,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getNewBarricadeIndex

    private static int getNewBarricadeIndex([BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") object,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### canAttackBypassIsoBarricade

    public boolean canAttackBypassIsoBarricade([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon)
  + ### barricadeCurrentCellWithMetalPlate

    public static void barricadeCurrentCellWithMetalPlate()
  + ### barricadeCurrentCellWithMetalBars

    public static void barricadeCurrentCellWithMetalBars()
  + ### barricadeCurrentCellWithPlanks

    public static void barricadeCurrentCellWithPlanks(int numberOfPlanks)
  + ### setNumberOfPlanks

    private void setNumberOfPlanks(int numberOfPlanks)
  + ### recalculateLighting

    private static void recalculateLighting()
  + ### updateSprite

    private void updateSprite()
  + ### addFromCraftRecipe

    public void addFromCraftRecipe([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getLightTransmission

    public float getLightTransmission()