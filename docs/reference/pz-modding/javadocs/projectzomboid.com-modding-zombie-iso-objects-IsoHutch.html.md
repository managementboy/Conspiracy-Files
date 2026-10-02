[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoHutch](IsoHutch.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [linkedX](#linkedX)
   2. [linkedY](#linkedY)
   3. [linkedZ](#linkedZ)
   4. [open](#open)
   5. [openEggHatch](#openEggHatch)
   6. [def](#def)
   7. [savedX](#savedX)
   8. [savedY](#savedY)
   9. [savedZ](#savedZ)
   10. [animalInside](#animalInside)
   11. [deadBodiesInside](#deadBodiesInside)
   12. [animalOutside](#animalOutside)
   13. [type](#type)
   14. [lastHourCheck](#lastHourCheck)
   15. [exitTimer](#exitTimer)
   16. [enterSpotX](#enterSpotX)
   17. [enterSpotY](#enterSpotY)
   18. [maxAnimals](#maxAnimals)
   19. [maxNestBox](#maxNestBox)
   20. [nestBoxes](#nestBoxes)
   21. [nestBoxDirt](#nestBoxDirt)
   22. [hutchDirt](#hutchDirt)
   23. [updateAnimal](#updateAnimal)
   24. [animalInsideSize](#animalInsideSize)
   25. [sendUpdate](#sendUpdate)
7. [Constructor Details](#constructor-detail)
   1. [IsoHutch(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoHutch(IsoGridSquare, boolean, String, KahluaTableImpl, IsoGridSquare)](#%3Cinit%3E(zombie.iso.IsoGridSquare,boolean,java.lang.String,se.krka.kahlua.j2se.KahluaTableImpl,zombie.iso.IsoGridSquare))
8. [Method Details](#method-detail)
   1. [getHutch()](#getHutch())
   2. [getHutch(int, int, int)](#getHutch(int,int,int))
   3. [transmitCompleteItemToClients()](#transmitCompleteItemToClients())
   4. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   5. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   6. [haveRoomForNewEggs()](#haveRoomForNewEggs())
   7. [update()](#update())
   8. [updateAnimalInside(IsoAnimal, boolean)](#updateAnimalInside(zombie.characters.animals.IsoAnimal,boolean))
   9. [doMeta(int)](#doMeta(int))
   10. [updateAnimalHealthInside(IsoAnimal, boolean)](#updateAnimalHealthInside(zombie.characters.animals.IsoAnimal,boolean))
   11. [killAnimal(IsoAnimal)](#killAnimal(zombie.characters.animals.IsoAnimal))
   12. [checkAnimalExitHutch(IsoAnimal)](#checkAnimalExitHutch(zombie.characters.animals.IsoAnimal))
   13. [releaseAnimal(IsoGridSquare, IsoAnimal)](#releaseAnimal(zombie.iso.IsoGridSquare,zombie.characters.animals.IsoAnimal))
   14. [removeAnimal(IsoAnimal)](#removeAnimal(zombie.characters.animals.IsoAnimal))
   15. [removeAnimalFromNestBox(IsoHutch.NestBox)](#removeAnimalFromNestBox(zombie.iso.objects.IsoHutch.NestBox))
   16. [tryFindAndRemoveAnimalFromNestBox(IsoAnimal)](#tryFindAndRemoveAnimalFromNestBox(zombie.characters.animals.IsoAnimal))
   17. [addAnimalInNestBox(IsoAnimal)](#addAnimalInNestBox(zombie.characters.animals.IsoAnimal))
   18. [addEgg(IsoAnimal)](#addEgg(zombie.characters.animals.IsoAnimal))
   19. [toggleEggHatchDoor()](#toggleEggHatchDoor())
   20. [reforceUpdate()](#reforceUpdate())
   21. [toggleDoor()](#toggleDoor())
   22. [isOpen()](#isOpen())
   23. [sendAnimalUpdate(IsoAnimal)](#sendAnimalUpdate(zombie.characters.animals.IsoAnimal))
   24. [getDefFromSprite()](#getDefFromSprite())
   25. [checkNestBoxPrefPosition(int)](#checkNestBoxPrefPosition(int))
   26. [addAnimalInside(IsoAnimal)](#addAnimalInside(zombie.characters.animals.IsoAnimal))
   27. [addAnimalInside(IsoAnimal, boolean)](#addAnimalInside(zombie.characters.animals.IsoAnimal,boolean))
   28. [addAnimalOutside(IsoAnimal)](#addAnimalOutside(zombie.characters.animals.IsoAnimal))
   29. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   30. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   31. [addMetaEgg(IsoAnimal)](#addMetaEgg(zombie.characters.animals.IsoAnimal))
   32. [isSlave()](#isSlave())
   33. [getObjectName()](#getObjectName())
   34. [addToWorld()](#addToWorld())
   35. [removeHutch()](#removeHutch())
   36. [removeHutchObject(IsoHutch)](#removeHutchObject(zombie.iso.objects.IsoHutch))
   37. [getAllHutchObjects()](#getAllHutchObjects())
   38. [removeFromWorld()](#removeFromWorld())
   39. [dropAllEggs()](#dropAllEggs())
   40. [releaseAllAnimals()](#releaseAllAnimals())
   41. [getAnimalInside()](#getAnimalInside())
   42. [getAnimal(Integer)](#getAnimal(java.lang.Integer))
   43. [getDeadBody(Integer)](#getDeadBody(java.lang.Integer))
   44. [getMaxAnimals()](#getMaxAnimals())
   45. [getMaxNestBox()](#getMaxNestBox())
   46. [getEnterSpotX()](#getEnterSpotX())
   47. [getEnterSpotY()](#getEnterSpotY())
   48. [haveEggHatchDoor()](#haveEggHatchDoor())
   49. [isEggHatchDoorOpen()](#isEggHatchDoorOpen())
   50. [isEggHatchDoorClosed()](#isEggHatchDoorClosed())
   51. [getEntrySq()](#getEntrySq())
   52. [getAnimalInNestBox(Integer)](#getAnimalInNestBox(java.lang.Integer))
   53. [getNestBox(Integer)](#getNestBox(java.lang.Integer))
   54. [getHutchDirt()](#getHutchDirt())
   55. [setHutchDirt(float)](#setHutchDirt(float))
   56. [getNestBoxDirt()](#getNestBoxDirt())
   57. [setNestBoxDirt(float)](#setNestBoxDirt(float))
   58. [isDoorClosed()](#isDoorClosed())
   59. [isAllDoorClosed()](#isAllDoorClosed())
   60. [isOwner()](#isOwner())
   61. [tryRemoveAnimalFromWorld(IsoAnimal)](#tryRemoveAnimalFromWorld(zombie.characters.animals.IsoAnimal))
   62. [handleBurning()](#handleBurning())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoHutch
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoHutch

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoHutch
extends [IsoObject](../IsoObject.html "class in zombie.iso")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoHutch)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) class`

  `IsoHutch.AgeComparator`

  `class`

  `IsoHutch.NestBox`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `HashMap<Integer, IsoAnimal>`

  `animalInside`

  `(package private) byte`

  `animalInsideSize`

  `ArrayList<IsoAnimal>`

  `animalOutside`

  `HashMap<Integer, IsoDeadBody>`

  `deadBodiesInside`

  `(package private) se.krka.kahlua.j2se.KahluaTableImpl`

  `def`

  `private int`

  `enterSpotX`

  `private int`

  `enterSpotY`

  `private float`

  `exitTimer`

  `private float`

  `hutchDirt`

  `int`

  `lastHourCheck`

  `(package private) int`

  `linkedX`

  `(package private) int`

  `linkedY`

  `(package private) int`

  `linkedZ`

  `private int`

  `maxAnimals`

  `private int`

  `maxNestBox`

  `private float`

  `nestBoxDirt`

  `private final HashMap<Integer, IsoHutch.NestBox>`

  `nestBoxes`

  `(package private) boolean`

  `open`

  `(package private) boolean`

  `openEggHatch`

  `int`

  `savedX`

  `int`

  `savedY`

  `int`

  `savedZ`

  `(package private) boolean`

  `sendUpdate`

  `String`

  `type`

  `(package private) zombie.core.utils.UpdateLimit`

  `updateAnimal`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoHutch(IsoCell cell)`

  `IsoHutch(IsoGridSquare sq,
  boolean north,
  String mainSprite,
  se.krka.kahlua.j2se.KahluaTableImpl def,
  IsoGridSquare linkedSq)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `addAnimalInNestBox(IsoAnimal animal)`

  `boolean`

  `addAnimalInside(IsoAnimal animal)`

  `boolean`

  `addAnimalInside(IsoAnimal animal,
  boolean bSync)`

  `void`

  `addAnimalOutside(IsoAnimal animal)`

  `void`

  `addEgg(IsoAnimal animal)`

  `boolean`

  `addMetaEgg(IsoAnimal animal)`

  `void`

  `addToWorld()`

  `private boolean`

  `checkAnimalExitHutch(IsoAnimal animal)`

  `private boolean`

  `checkNestBoxPrefPosition(int pos)`

  When adding animal inside the hutch, we also need to check if an animal that is in a nest box have this place reserved for him

  `void`

  `doMeta(int hours)`

  Increase dirtiness for each hours spent in meta
  Eggs are done directly via IsoAnimal.updateStatsAway()

  `void`

  `dropAllEggs()`

  Used when the hutch gets destroyed

  `List<IsoHutch>`

  `getAllHutchObjects()`

  `IsoAnimal`

  `getAnimal(Integer index)`

  `IsoAnimal`

  `getAnimalInNestBox(Integer index)`

  `HashMap<Integer, IsoAnimal>`

  `getAnimalInside()`

  `IsoDeadBody`

  `getDeadBody(Integer index)`

  `private se.krka.kahlua.j2se.KahluaTableImpl`

  `getDefFromSprite()`

  `int`

  `getEnterSpotX()`

  `int`

  `getEnterSpotY()`

  `IsoGridSquare`

  `getEntrySq()`

  `IsoHutch`

  `getHutch()`

  `static IsoHutch`

  `getHutch(int x,
  int y,
  int z)`

  `float`

  `getHutchDirt()`

  `int`

  `getMaxAnimals()`

  `int`

  `getMaxNestBox()`

  `IsoHutch.NestBox`

  `getNestBox(Integer index)`

  `float`

  `getNestBoxDirt()`

  `String`

  `getObjectName()`

  `void`

  `handleBurning()`

  `boolean`

  `haveEggHatchDoor()`

  `boolean`

  `haveRoomForNewEggs()`

  `boolean`

  `isAllDoorClosed()`

  `boolean`

  `isDoorClosed()`

  `boolean`

  `isEggHatchDoorClosed()`

  `boolean`

  `isEggHatchDoorOpen()`

  `boolean`

  `isOpen()`

  `boolean`

  `isOwner()`

  `boolean`

  `isSlave()`

  `void`

  `killAnimal(IsoAnimal animal)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `reforceUpdate()`

  Reforce the entry in the update list just in case

  `void`

  `releaseAllAnimals()`

  Used when the hutch gets destroyed

  `private void`

  `releaseAnimal(IsoGridSquare animalSq,
  IsoAnimal animal)`

  `void`

  `removeAnimal(IsoAnimal animal)`

  `private void`

  `removeAnimalFromNestBox(IsoHutch.NestBox nestBox)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeHutch()`

  Called from lua when destroying using a sledgehammer
  Remove all the tiles of the hutch we're trying to destroy al well as releasing all animals from it

  `void`

  `removeHutchObject(IsoHutch hutch)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `private void`

  `sendAnimalUpdate(IsoAnimal animal)`

  `void`

  `setHutchDirt(float hutchDirt)`

  `void`

  `setNestBoxDirt(float nestBoxDirt)`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `void`

  `toggleDoor()`

  `void`

  `toggleEggHatchDoor()`

  `void`

  `transmitCompleteItemToClients()`

  `void`

  `tryFindAndRemoveAnimalFromNestBox(IsoAnimal animal)`

  `void`

  `tryRemoveAnimalFromWorld(IsoAnimal animal)`

  `void`

  `update()`

  `private void`

  `updateAnimalHealthInside(IsoAnimal animal,
  boolean hourGrow)`

  Update the animal's health while inside the hutch, if the hutch is dirty the animal will lose health

  `private void`

  `updateAnimalInside(IsoAnimal animal,
  boolean hourGrow)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### linkedX

    int linkedX
  + ### linkedY

    int linkedY
  + ### linkedZ

    int linkedZ
  + ### open

    boolean open
  + ### openEggHatch

    boolean openEggHatch
  + ### def

    se.krka.kahlua.j2se.KahluaTableImpl def
  + ### savedX

    public int savedX
  + ### savedY

    public int savedY
  + ### savedZ

    public int savedZ
  + ### animalInside

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animalInside
  + ### deadBodiesInside

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [IsoDeadBody](IsoDeadBody.html "class in zombie.iso.objects")> deadBodiesInside
  + ### animalOutside

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animalOutside
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### lastHourCheck

    public int lastHourCheck
  + ### exitTimer

    private float exitTimer
  + ### enterSpotX

    private int enterSpotX
  + ### enterSpotY

    private int enterSpotY
  + ### maxAnimals

    private int maxAnimals
  + ### maxNestBox

    private int maxNestBox
  + ### nestBoxes

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [IsoHutch.NestBox](IsoHutch.NestBox.html "class in zombie.iso.objects")> nestBoxes
  + ### nestBoxDirt

    private float nestBoxDirt
  + ### hutchDirt

    private float hutchDirt
  + ### updateAnimal

    zombie.core.utils.UpdateLimit updateAnimal
  + ### animalInsideSize

    byte animalInsideSize
  + ### sendUpdate

    boolean sendUpdate
* Constructor Details
  -------------------

  + ### IsoHutch

    public IsoHutch([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoHutch

    public IsoHutch([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    boolean north,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mainSprite,
    se.krka.kahlua.j2se.KahluaTableImpl def,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") linkedSq)
* Method Details
  --------------

  + ### getHutch

    public [IsoHutch](IsoHutch.html "class in zombie.iso.objects") getHutch()
  + ### getHutch

    public static [IsoHutch](IsoHutch.html "class in zombie.iso.objects") getHutch(int x,
    int y,
    int z)
  + ### transmitCompleteItemToClients

    public void transmitCompleteItemToClients()

    Overrides:
    :   `transmitCompleteItemToClients` in class `IsoObject`
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### haveRoomForNewEggs

    public boolean haveRoomForNewEggs()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### updateAnimalInside

    private void updateAnimalInside([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    boolean hourGrow)
  + ### doMeta

    public void doMeta(int hours)

    Increase dirtiness for each hours spent in meta
    Eggs are done directly via IsoAnimal.updateStatsAway()
  + ### updateAnimalHealthInside

    private void updateAnimalHealthInside([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    boolean hourGrow)

    Update the animal's health while inside the hutch, if the hutch is dirty the animal will lose health
  + ### killAnimal

    public void killAnimal([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### checkAnimalExitHutch

    private boolean checkAnimalExitHutch([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### releaseAnimal

    private void releaseAnimal([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") animalSq,
    [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### removeAnimal

    public void removeAnimal([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### removeAnimalFromNestBox

    private void removeAnimalFromNestBox([IsoHutch.NestBox](IsoHutch.NestBox.html "class in zombie.iso.objects") nestBox)
  + ### tryFindAndRemoveAnimalFromNestBox

    public void tryFindAndRemoveAnimalFromNestBox([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### addAnimalInNestBox

    public boolean addAnimalInNestBox([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### addEgg

    public void addEgg([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### toggleEggHatchDoor

    public void toggleEggHatchDoor()
  + ### reforceUpdate

    public void reforceUpdate()

    Reforce the entry in the update list just in case
  + ### toggleDoor

    public void toggleDoor()
  + ### isOpen

    public boolean isOpen()
  + ### sendAnimalUpdate

    private void sendAnimalUpdate([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getDefFromSprite

    private se.krka.kahlua.j2se.KahluaTableImpl getDefFromSprite()
  + ### checkNestBoxPrefPosition

    private boolean checkNestBoxPrefPosition(int pos)

    When adding animal inside the hutch, we also need to check if an animal that is in a nest box have this place reserved for him
  + ### addAnimalInside

    public boolean addAnimalInside([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### addAnimalInside

    public boolean addAnimalInside([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    boolean bSync)
  + ### addAnimalOutside

    public void addAnimalOutside([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
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
  + ### addMetaEgg

    public boolean addMetaEgg([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### isSlave

    public boolean isSlave()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### removeHutch

    public void removeHutch()

    Called from lua when destroying using a sledgehammer
    Remove all the tiles of the hutch we're trying to destroy al well as releasing all animals from it
  + ### removeHutchObject

    public void removeHutchObject([IsoHutch](IsoHutch.html "class in zombie.iso.objects") hutch)
  + ### getAllHutchObjects

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoHutch](IsoHutch.html "class in zombie.iso.objects")> getAllHutchObjects()
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoObject`
  + ### dropAllEggs

    public void dropAllEggs()

    Used when the hutch gets destroyed
  + ### releaseAllAnimals

    public void releaseAllAnimals()

    Used when the hutch gets destroyed
  + ### getAnimalInside

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimalInside()
  + ### getAnimal

    public [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") getAnimal([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### getDeadBody

    public [IsoDeadBody](IsoDeadBody.html "class in zombie.iso.objects") getDeadBody([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### getMaxAnimals

    public int getMaxAnimals()
  + ### getMaxNestBox

    public int getMaxNestBox()
  + ### getEnterSpotX

    public int getEnterSpotX()
  + ### getEnterSpotY

    public int getEnterSpotY()
  + ### haveEggHatchDoor

    public boolean haveEggHatchDoor()
  + ### isEggHatchDoorOpen

    public boolean isEggHatchDoorOpen()
  + ### isEggHatchDoorClosed

    public boolean isEggHatchDoorClosed()
  + ### getEntrySq

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getEntrySq()
  + ### getAnimalInNestBox

    public [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") getAnimalInNestBox([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### getNestBox

    public [IsoHutch.NestBox](IsoHutch.NestBox.html "class in zombie.iso.objects") getNestBox([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### getHutchDirt

    public float getHutchDirt()
  + ### setHutchDirt

    public void setHutchDirt(float hutchDirt)
  + ### getNestBoxDirt

    public float getNestBoxDirt()
  + ### setNestBoxDirt

    public void setNestBoxDirt(float nestBoxDirt)
  + ### isDoorClosed

    public boolean isDoorClosed()
  + ### isAllDoorClosed

    public boolean isAllDoorClosed()
  + ### isOwner

    public boolean isOwner()
  + ### tryRemoveAnimalFromWorld

    public void tryRemoveAnimalFromWorld([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### handleBurning

    public void handleBurning()

    Overrides:
    :   `handleBurning` in class `IsoObject`