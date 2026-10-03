[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoButcherHook](IsoButcherHook.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [animal](#animal)
   2. [removingBlood](#removingBlood)
   3. [removingBloodProgress](#removingBloodProgress)
   4. [removingBloodTick](#removingBloodTick)
   5. [bloodAtStart](#bloodAtStart)
   6. [currentBlood](#currentBlood)
   7. [luaHook](#luaHook)
   8. [playRemovingBloodSound](#playRemovingBloodSound)
   9. [emitter](#emitter)
   10. [usingPlayerId](#usingPlayerId)
7. [Constructor Details](#constructor-detail)
   1. [IsoButcherHook(IsoGridSquare)](#%3Cinit%3E(zombie.iso.IsoGridSquare))
   2. [IsoButcherHook(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
8. [Method Details](#method-detail)
   1. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   2. [stopRemovingBlood()](#stopRemovingBlood())
   3. [startRemovingBlood(KahluaTableImpl)](#startRemovingBlood(se.krka.kahlua.j2se.KahluaTableImpl))
   4. [update()](#update())
   5. [updateRemovingBlood()](#updateRemovingBlood())
   6. [setPlayRemovingBloodSound(boolean)](#setPlayRemovingBloodSound(boolean))
   7. [updateRemovingBloodSound()](#updateRemovingBloodSound())
   8. [isRemovingBlood()](#isRemovingBlood())
   9. [getRemovingBloodProgress()](#getRemovingBloodProgress())
   10. [updateDeathAge()](#updateDeathAge())
   11. [getObjectName()](#getObjectName())
   12. [setAnimal(IsoAnimal)](#setAnimal(zombie.characters.animals.IsoAnimal))
   13. [getAnimal()](#getAnimal())
   14. [removeHook()](#removeHook())
   15. [playPutDownCorpseSound(IsoAnimal)](#playPutDownCorpseSound(zombie.characters.animals.IsoAnimal))
   16. [removeFromWorld()](#removeFromWorld())
   17. [reattachAnimal(IsoAnimal)](#reattachAnimal(zombie.characters.animals.IsoAnimal))
   18. [setLuaHook(KahluaTableImpl)](#setLuaHook(se.krka.kahlua.j2se.KahluaTableImpl))
   19. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   20. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   21. [onReceivedNetUpdate()](#onReceivedNetUpdate())
   22. [updateAnimalModel()](#updateAnimalModel())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoButcherHook
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](IsoObject.html "class in zombie.iso")

zombie.iso.IsoButcherHook

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoButcherHook
extends [IsoObject](IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.iso.IsoButcherHook)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [IsoObject](IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoAnimal`

  `animal`

  `private float`

  `bloodAtStart`

  `private float`

  `currentBlood`

  `private BaseSoundEmitter`

  `emitter`

  `private se.krka.kahlua.j2se.KahluaTableImpl`

  `luaHook`

  `private boolean`

  `playRemovingBloodSound`

  `private boolean`

  `removingBlood`

  `private float`

  `removingBloodProgress`

  `private float`

  `removingBloodTick`

  `private final zombie.network.fields.character.PlayerID`

  `usingPlayerId`

  ### Fields inherited from class [IsoObject](IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoButcherHook(IsoCell cell)`

  `IsoButcherHook(IsoGridSquare sq)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoAnimal`

  `getAnimal()`

  `String`

  `getObjectName()`

  `float`

  `getRemovingBloodProgress()`

  `boolean`

  `isRemovingBlood()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `onReceivedNetUpdate()`

  `void`

  `playPutDownCorpseSound(IsoAnimal animal)`

  `void`

  `reattachAnimal(IsoAnimal animal)`

  Called when loading an animal
  We need to recreate a body from the animal given, the lua function will have to recreate the animal then and put it in correct position

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeHook()`

  `void`

  `setAnimal(IsoAnimal animal)`

  `void`

  `setLuaHook(se.krka.kahlua.j2se.KahluaTableImpl luaHook)`

  `void`

  `setPlayRemovingBloodSound(boolean b)`

  `void`

  `startRemovingBlood(se.krka.kahlua.j2se.KahluaTableImpl luaHook)`

  `void`

  `stopRemovingBlood()`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `void`

  `update()`

  `void`

  `updateAnimalModel()`

  `private void`

  `updateDeathAge()`

  `private void`

  `updateRemovingBlood()`

  `private void`

  `updateRemovingBloodSound()`

  ### Methods inherited from class [IsoObject](IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### animal

    private [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal
  + ### removingBlood

    private boolean removingBlood
  + ### removingBloodProgress

    private float removingBloodProgress
  + ### removingBloodTick

    private float removingBloodTick
  + ### bloodAtStart

    private float bloodAtStart
  + ### currentBlood

    private float currentBlood
  + ### luaHook

    private se.krka.kahlua.j2se.KahluaTableImpl luaHook
  + ### playRemovingBloodSound

    private boolean playRemovingBloodSound
  + ### emitter

    private [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### usingPlayerId

    private final zombie.network.fields.character.PlayerID usingPlayerId
* Constructor Details
  -------------------

  + ### IsoButcherHook

    public IsoButcherHook([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq)
  + ### IsoButcherHook

    public IsoButcherHook([IsoCell](IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### stopRemovingBlood

    public void stopRemovingBlood()
  + ### startRemovingBlood

    public void startRemovingBlood(se.krka.kahlua.j2se.KahluaTableImpl luaHook)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateRemovingBlood

    private void updateRemovingBlood()
  + ### setPlayRemovingBloodSound

    public void setPlayRemovingBloodSound(boolean b)
  + ### updateRemovingBloodSound

    private void updateRemovingBloodSound()
  + ### isRemovingBlood

    public boolean isRemovingBlood()
  + ### getRemovingBloodProgress

    public float getRemovingBloodProgress()
  + ### updateDeathAge

    private void updateDeathAge()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### setAnimal

    public void setAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getAnimal

    public [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") getAnimal()
  + ### removeHook

    public void removeHook()
  + ### playPutDownCorpseSound

    public void playPutDownCorpseSound([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoObject`
  + ### reattachAnimal

    public void reattachAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)

    Called when loading an animal
    We need to recreate a body from the animal given, the lua function will have to recreate the animal then and put it in correct position
  + ### setLuaHook

    public void setLuaHook(se.krka.kahlua.j2se.KahluaTableImpl luaHook)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### onReceivedNetUpdate

    public void onReceivedNetUpdate()
  + ### updateAnimalModel

    public void updateAnimalModel()