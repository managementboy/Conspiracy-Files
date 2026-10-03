[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoWindowFrame](IsoWindowFrame.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [north](#north)
7. [Constructor Details](#constructor-detail)
   1. [IsoWindowFrame(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoWindowFrame(IsoCell, IsoGridSquare, IsoSprite, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite,boolean))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [haveSheetRope()](#haveSheetRope())
   3. [countAddSheetRope()](#countAddSheetRope())
   4. [canAddSheetRope()](#canAddSheetRope())
   5. [addSheetRope(IsoPlayer, String)](#addSheetRope(zombie.characters.IsoPlayer,java.lang.String))
   6. [removeSheetRope(IsoPlayer)](#removeSheetRope(zombie.characters.IsoPlayer))
   7. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   8. [isBarricaded()](#isBarricaded())
   9. [isBarricadeAllowed()](#isBarricadeAllowed())
   10. [getBarricadeOnSameSquare()](#getBarricadeOnSameSquare())
   11. [getBarricadeOnOppositeSquare()](#getBarricadeOnOppositeSquare())
   12. [getBarricadeForCharacter(IsoGameCharacter)](#getBarricadeForCharacter(zombie.characters.IsoGameCharacter))
   13. [getBarricadeOppositeCharacter(IsoGameCharacter)](#getBarricadeOppositeCharacter(zombie.characters.IsoGameCharacter))
   14. [getOppositeSquare()](#getOppositeSquare())
   15. [getNorth()](#getNorth())
   16. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   17. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   18. [getWindow()](#getWindow())
   19. [hasWindow()](#hasWindow())
   20. [canClimbThrough(IsoGameCharacter)](#canClimbThrough(zombie.characters.IsoGameCharacter))
   21. [getCurtain()](#getCurtain())
   22. [HasCurtains()](#HasCurtains())
   23. [getAddSheetSquare(IsoGameCharacter)](#getAddSheetSquare(zombie.characters.IsoGameCharacter))
   24. [addSheet(IsoGameCharacter)](#addSheet(zombie.characters.IsoGameCharacter))
   25. [getDirection(IsoObject)](#getDirection(zombie.iso.IsoObject))
   26. [isWindowFrame(IsoObject)](#isWindowFrame(zombie.iso.IsoObject))
   27. [isWindowFrame(IsoObject, boolean)](#isWindowFrame(zombie.iso.IsoObject,boolean))
   28. [countAddSheetRope(IsoObject)](#countAddSheetRope(zombie.iso.IsoObject))
   29. [canAddSheetRope(IsoObject)](#canAddSheetRope(zombie.iso.IsoObject))
   30. [haveSheetRope(IsoObject)](#haveSheetRope(zombie.iso.IsoObject))
   31. [addSheetRope(IsoObject, IsoPlayer, String)](#addSheetRope(zombie.iso.IsoObject,zombie.characters.IsoPlayer,java.lang.String))
   32. [removeSheetRope(IsoObject, IsoPlayer)](#removeSheetRope(zombie.iso.IsoObject,zombie.characters.IsoPlayer))
   33. [getOppositeSquare(IsoObject)](#getOppositeSquare(zombie.iso.IsoObject))
   34. [getIndoorSquare(IsoObject)](#getIndoorSquare(zombie.iso.IsoObject))
   35. [getCurtain(IsoObject)](#getCurtain(zombie.iso.IsoObject))
   36. [getAddSheetSquare(IsoObject, IsoGameCharacter)](#getAddSheetSquare(zombie.iso.IsoObject,zombie.characters.IsoGameCharacter))
   37. [addSheet(IsoObject, IsoGameCharacter)](#addSheet(zombie.iso.IsoObject,zombie.characters.IsoGameCharacter))
   38. [canClimbThrough(IsoObject, IsoGameCharacter)](#canClimbThrough(zombie.iso.IsoObject,zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoWindowFrame
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoWindowFrame

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, BarricadeAble, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoWindowFrame
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoWindowFrame)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `IsoWindowFrame.Direction`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `north`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWindowFrame(IsoCell cell)`

  `IsoWindowFrame(IsoCell cell,
  IsoGridSquare gridSquare,
  IsoSprite gid,
  boolean north)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSheet(IsoGameCharacter chr)`

  `static void`

  `addSheet(IsoObject o,
  IsoGameCharacter chr)`

  `boolean`

  `addSheetRope(IsoPlayer player,
  String itemType)`

  `static boolean`

  `addSheetRope(IsoObject o,
  IsoPlayer player,
  String itemType)`

  `boolean`

  `canAddSheetRope()`

  `static boolean`

  `canAddSheetRope(IsoObject o)`

  `boolean`

  `canClimbThrough(IsoGameCharacter chr)`

  `static boolean`

  `canClimbThrough(IsoObject o,
  IsoGameCharacter chr)`

  `int`

  `countAddSheetRope()`

  `static int`

  `countAddSheetRope(IsoObject o)`

  `IsoGridSquare`

  `getAddSheetSquare(IsoGameCharacter chr)`

  `static IsoGridSquare`

  `getAddSheetSquare(IsoObject o,
  IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeForCharacter(IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeOnOppositeSquare()`

  `IsoBarricade`

  `getBarricadeOnSameSquare()`

  `IsoBarricade`

  `getBarricadeOppositeCharacter(IsoGameCharacter chr)`

  `IsoCurtain`

  `getCurtain()`

  `static IsoCurtain`

  `getCurtain(IsoObject o)`

  `private static IsoWindowFrame.Direction`

  `getDirection(IsoObject o)`

  `static IsoGridSquare`

  `getIndoorSquare(IsoObject o)`

  `boolean`

  `getNorth()`

  `String`

  `getObjectName()`

  `IsoGridSquare`

  `getOppositeSquare()`

  `static IsoGridSquare`

  `getOppositeSquare(IsoObject o)`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `IsoWindow`

  `getWindow()`

  `IsoCurtain`

  `HasCurtains()`

  `boolean`

  `hasWindow()`

  `boolean`

  `haveSheetRope()`

  `static boolean`

  `haveSheetRope(IsoObject o)`

  `boolean`

  `isBarricadeAllowed()`

  `boolean`

  `isBarricaded()`

  `static boolean`

  `isWindowFrame(IsoObject o)`

  `static boolean`

  `isWindowFrame(IsoObject o,
  boolean north)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `boolean`

  `removeSheetRope(IsoPlayer player)`

  `static boolean`

  `removeSheetRope(IsoObject o,
  IsoPlayer player)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorld, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [BarricadeAble](interfaces/BarricadeAble.html#method-summary "interface in zombie.iso.objects.interfaces")

  `addBarricadesFromCraftRecipe, getSquare`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### north

    private boolean north
* Constructor Details
  -------------------

  + ### IsoWindowFrame

    public IsoWindowFrame([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoWindowFrame

    public IsoWindowFrame([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid,
    boolean north)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### haveSheetRope

    public boolean haveSheetRope()

    Overrides:
    :   `haveSheetRope` in class `IsoObject`
  + ### countAddSheetRope

    public int countAddSheetRope()

    Overrides:
    :   `countAddSheetRope` in class `IsoObject`
  + ### canAddSheetRope

    public boolean canAddSheetRope()

    Overrides:
    :   `canAddSheetRope` in class `IsoObject`
  + ### addSheetRope

    public boolean addSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)

    Overrides:
    :   `addSheetRope` in class `IsoObject`
  + ### removeSheetRope

    public boolean removeSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `removeSheetRope` in class `IsoObject`
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpableFor` in class `IsoObject`
  + ### isBarricaded

    public boolean isBarricaded()

    Specified by:
    :   `isBarricaded` in interface `BarricadeAble`
  + ### isBarricadeAllowed

    public boolean isBarricadeAllowed()

    Specified by:
    :   `isBarricadeAllowed` in interface `BarricadeAble`
  + ### getBarricadeOnSameSquare

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnSameSquare()

    Specified by:
    :   `getBarricadeOnSameSquare` in interface `BarricadeAble`
  + ### getBarricadeOnOppositeSquare

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnOppositeSquare()

    Specified by:
    :   `getBarricadeOnOppositeSquare` in interface `BarricadeAble`
  + ### getBarricadeForCharacter

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeForCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getBarricadeForCharacter` in interface `BarricadeAble`
  + ### getBarricadeOppositeCharacter

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOppositeCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getBarricadeOppositeCharacter` in interface `BarricadeAble`
  + ### getOppositeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOppositeSquare()

    Specified by:
    :   `getOppositeSquare` in interface `BarricadeAble`
  + ### getNorth

    public boolean getNorth()

    Specified by:
    :   `getNorth` in interface `BarricadeAble`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### getWindow

    public [IsoWindow](IsoWindow.html "class in zombie.iso.objects") getWindow()
  + ### hasWindow

    public boolean hasWindow()
  + ### canClimbThrough

    public boolean canClimbThrough([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getCurtain

    public [IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") getCurtain()
  + ### HasCurtains

    public [IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") HasCurtains()
  + ### getAddSheetSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getAddSheetSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addSheet

    public void addSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getDirection

    private static [IsoWindowFrame.Direction](IsoWindowFrame.Direction.html "enum class in zombie.iso.objects") getDirection([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### isWindowFrame

    public static boolean isWindowFrame([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### isWindowFrame

    public static boolean isWindowFrame([IsoObject](../IsoObject.html "class in zombie.iso") o,
    boolean north)
  + ### countAddSheetRope

    public static int countAddSheetRope([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### canAddSheetRope

    public static boolean canAddSheetRope([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### haveSheetRope

    public static boolean haveSheetRope([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### addSheetRope

    public static boolean addSheetRope([IsoObject](../IsoObject.html "class in zombie.iso") o,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### removeSheetRope

    public static boolean removeSheetRope([IsoObject](../IsoObject.html "class in zombie.iso") o,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getOppositeSquare

    public static [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOppositeSquare([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### getIndoorSquare

    public static [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getIndoorSquare([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### getCurtain

    public static [IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") getCurtain([IsoObject](../IsoObject.html "class in zombie.iso") o)
  + ### getAddSheetSquare

    public static [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getAddSheetSquare([IsoObject](../IsoObject.html "class in zombie.iso") o,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addSheet

    public static void addSheet([IsoObject](../IsoObject.html "class in zombie.iso") o,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canClimbThrough

    public static boolean canClimbThrough([IsoObject](../IsoObject.html "class in zombie.iso") o,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)