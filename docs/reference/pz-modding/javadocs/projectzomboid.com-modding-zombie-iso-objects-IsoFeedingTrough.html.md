[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoFeedingTrough](IsoFeedingTrough.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [feedingTypes](#feedingTypes)
   2. [linkedX](#linkedX)
   3. [linkedY](#linkedY)
   4. [linkedAnimals](#linkedAnimals)
   5. [maxFeed](#maxFeed)
   6. [water](#water)
   7. [maxWater](#maxWater)
   8. [def](#def)
   9. [north](#north)
7. [Constructor Details](#constructor-detail)
   1. [IsoFeedingTrough(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoFeedingTrough(IsoGridSquare, String, IsoGridSquare)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String,zombie.iso.IsoGridSquare))
8. [Method Details](#method-detail)
   1. [checkContainer()](#checkContainer())
   2. [isItemAllowedInContainer(ItemContainer, InventoryItem)](#isItemAllowedInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   3. [checkZone()](#checkZone())
   4. [removeFromWorld()](#removeFromWorld())
   5. [checkIsoRegion()](#checkIsoRegion())
   6. [addToWorld()](#addToWorld())
   7. [update()](#update())
   8. [checkWaterFromRain()](#checkWaterFromRain())
   9. [getObjectName()](#getObjectName())
   10. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   11. [setContainer(ItemContainer)](#setContainer(zombie.inventory.ItemContainer))
   12. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   13. [initWithDef()](#initWithDef())
   14. [doDef(KahluaTableImpl)](#doDef(se.krka.kahlua.j2se.KahluaTableImpl))
   15. [checkOverlayFull(boolean)](#checkOverlayFull(boolean))
   16. [checkOverlayAfterAnimalEat()](#checkOverlayAfterAnimalEat())
   17. [onFoodAdded()](#onFoodAdded())
   18. [onRemoveFood()](#onRemoveFood())
   19. [checkOverlay(KahluaTableImpl, float, float, boolean, boolean, boolean, boolean)](#checkOverlay(se.krka.kahlua.j2se.KahluaTableImpl,float,float,boolean,boolean,boolean,boolean))
   20. [getFeedAmount(String)](#getFeedAmount(java.lang.String))
   21. [updateLuaObject()](#updateLuaObject())
   22. [getAllFeedingTypes()](#getAllFeedingTypes())
   23. [getLinkedX()](#getLinkedX())
   24. [getLinkedY()](#getLinkedY())
   25. [setLinkedX(int)](#setLinkedX(int))
   26. [setLinkedY(int)](#setLinkedY(int))
   27. [isSlave()](#isSlave())
   28. [getMasterTrough()](#getMasterTrough())
   29. [getMaxWater()](#getMaxWater())
   30. [setMaxWater(float)](#setMaxWater(float))
   31. [getWater()](#getWater())
   32. [removeWater(float)](#removeWater(float))
   33. [addWater(FluidType, float)](#addWater(zombie.entity.components.fluids.FluidType,float))
   34. [getLinkedAnimals()](#getLinkedAnimals())
   35. [setLinkedAnimals(ArrayList)](#setLinkedAnimals(java.util.ArrayList))
   36. [isEmptyFeed()](#isEmptyFeed())
   37. [getMaxFeed()](#getMaxFeed())
   38. [setMaxFeed(int)](#setMaxFeed(int))
   39. [setDef(KahluaTableImpl)](#setDef(se.krka.kahlua.j2se.KahluaTableImpl))
   40. [setNorth(boolean)](#setNorth(boolean))
   41. [addLinkedAnimal(IsoAnimal)](#addLinkedAnimal(zombie.characters.animals.IsoAnimal))
   42. [getCurrentFeedAmount()](#getCurrentFeedAmount())
   43. [createFluidContainer()](#createFluidContainer())
   44. [removeFluidContainer()](#removeFluidContainer())
   45. [onFluidContainerUpdate()](#onFluidContainerUpdate())
   46. [handleBurning()](#handleBurning())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFeedingTrough
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoFeedingTrough

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public final class IsoFeedingTrough
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoFeedingTrough)

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

  `private se.krka.kahlua.j2se.KahluaTableImpl`

  `def`

  `private final HashMap<String,Float>`

  `feedingTypes`

  `ArrayList<IsoAnimal>`

  `linkedAnimals`

  `private int`

  `linkedX`

  `private int`

  `linkedY`

  `private int`

  `maxFeed`

  `private float`

  `maxWater`

  `boolean`

  `north`

  `private float`

  `water`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoFeedingTrough(IsoCell cell)`

  `IsoFeedingTrough(IsoGridSquare square,
  String spriteName,
  IsoGridSquare linkedSquare)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addLinkedAnimal(IsoAnimal animal)`

  `void`

  `addToWorld()`

  `void`

  `addWater(FluidType type,
  float amount)`

  `void`

  `checkContainer()`

  `void`

  `checkIsoRegion()`

  `private void`

  `checkOverlay(se.krka.kahlua.j2se.KahluaTableImpl def,
  float feedAmount,
  float maxFeed,
  boolean isWater,
  boolean checkOtherTile,
  boolean deletePrevious,
  boolean transmit)`

  `void`

  `checkOverlayAfterAnimalEat()`

  `void`

  `checkOverlayFull(boolean transmit)`

  `void`

  `checkWaterFromRain()`

  `void`

  `checkZone()`

  `void`

  `createFluidContainer()`

  `void`

  `doDef(se.krka.kahlua.j2se.KahluaTableImpl def)`

  `ArrayList<String>`

  `getAllFeedingTypes()`

  `float`

  `getCurrentFeedAmount()`

  `float`

  `getFeedAmount(String type)`

  `ArrayList<IsoAnimal>`

  `getLinkedAnimals()`

  `int`

  `getLinkedX()`

  `int`

  `getLinkedY()`

  `IsoFeedingTrough`

  `getMasterTrough()`

  `int`

  `getMaxFeed()`

  `float`

  `getMaxWater()`

  `String`

  `getObjectName()`

  `float`

  `getWater()`

  `void`

  `handleBurning()`

  `void`

  `initWithDef()`

  When creating a feeding trough from the map (MOFeedingTrough) we need to init its properties with our definitions table

  `boolean`

  `isEmptyFeed()`

  `boolean`

  `isItemAllowedInContainer(ItemContainer container,
  InventoryItem item)`

  `private boolean`

  `isSlave()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `onFluidContainerUpdate()`

  `void`

  `onFoodAdded()`

  `void`

  `onRemoveFood()`

  `void`

  `removeFluidContainer()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeWater(float water)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setContainer(ItemContainer container)`

  `void`

  `setDef(se.krka.kahlua.j2se.KahluaTableImpl def)`

  `void`

  `setLinkedAnimals(ArrayList<IsoAnimal> linkedAnimals)`

  `void`

  `setLinkedX(int x)`

  `void`

  `setLinkedY(int y)`

  `void`

  `setMaxFeed(int maxFeed)`

  `void`

  `setMaxWater(float maxWater)`

  `void`

  `setNorth(boolean north)`

  `void`

  `update()`

  `void`

  `updateLuaObject()`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

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

  + ### feedingTypes

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> feedingTypes
  + ### linkedX

    private int linkedX
  + ### linkedY

    private int linkedY
  + ### linkedAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> linkedAnimals
  + ### maxFeed

    private int maxFeed
  + ### water

    private float water
  + ### maxWater

    private float maxWater
  + ### def

    private se.krka.kahlua.j2se.KahluaTableImpl def
  + ### north

    public boolean north
* Constructor Details
  -------------------

  + ### IsoFeedingTrough

    public IsoFeedingTrough([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoFeedingTrough

    public IsoFeedingTrough([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") linkedSquare)
* Method Details
  --------------

  + ### checkContainer

    public void checkContainer()
  + ### isItemAllowedInContainer

    public boolean isItemAllowedInContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `isItemAllowedInContainer` in class `IsoObject`
  + ### checkZone

    public void checkZone()
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoObject`
  + ### checkIsoRegion

    public void checkIsoRegion()
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### checkWaterFromRain

    public void checkWaterFromRain()
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
  + ### setContainer

    public void setContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)

    Overrides:
    :   `setContainer` in class `IsoObject`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### initWithDef

    public void initWithDef()

    When creating a feeding trough from the map (MOFeedingTrough) we need to init its properties with our definitions table
  + ### doDef

    public void doDef(se.krka.kahlua.j2se.KahluaTableImpl def)
  + ### checkOverlayFull

    public void checkOverlayFull(boolean transmit)
  + ### checkOverlayAfterAnimalEat

    public void checkOverlayAfterAnimalEat()
  + ### onFoodAdded

    public void onFoodAdded()
  + ### onRemoveFood

    public void onRemoveFood()
  + ### checkOverlay

    private void checkOverlay(se.krka.kahlua.j2se.KahluaTableImpl def,
    float feedAmount,
    float maxFeed,
    boolean isWater,
    boolean checkOtherTile,
    boolean deletePrevious,
    boolean transmit)
  + ### getFeedAmount

    public float getFeedAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### updateLuaObject

    public void updateLuaObject()
  + ### getAllFeedingTypes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllFeedingTypes()
  + ### getLinkedX

    public int getLinkedX()
  + ### getLinkedY

    public int getLinkedY()
  + ### setLinkedX

    public void setLinkedX(int x)
  + ### setLinkedY

    public void setLinkedY(int y)
  + ### isSlave

    private boolean isSlave()
  + ### getMasterTrough

    public [IsoFeedingTrough](IsoFeedingTrough.html "class in zombie.iso.objects") getMasterTrough()
  + ### getMaxWater

    public float getMaxWater()
  + ### setMaxWater

    public void setMaxWater(float maxWater)
  + ### getWater

    public float getWater()
  + ### removeWater

    public void removeWater(float water)
  + ### addWater

    public void addWater([FluidType](../../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") type,
    float amount)
  + ### getLinkedAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getLinkedAnimals()
  + ### setLinkedAnimals

    public void setLinkedAnimals([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> linkedAnimals)
  + ### isEmptyFeed

    public boolean isEmptyFeed()
  + ### getMaxFeed

    public int getMaxFeed()
  + ### setMaxFeed

    public void setMaxFeed(int maxFeed)
  + ### setDef

    public void setDef(se.krka.kahlua.j2se.KahluaTableImpl def)
  + ### setNorth

    public void setNorth(boolean north)
  + ### addLinkedAnimal

    public void addLinkedAnimal([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getCurrentFeedAmount

    public float getCurrentFeedAmount()
  + ### createFluidContainer

    public void createFluidContainer()
  + ### removeFluidContainer

    public void removeFluidContainer()
  + ### onFluidContainerUpdate

    public void onFluidContainerUpdate()

    Overrides:
    :   `onFluidContainerUpdate` in class `GameEntity`
  + ### handleBurning

    public void handleBurning()

    Overrides:
    :   `handleBurning` in class `IsoObject`