[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoMannequin](IsoMannequin.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [inf](#inf)
   2. [init](#init)
   3. [female](#female)
   4. [zombie](#zombie)
   5. [skeleton](#skeleton)
   6. [mannequinScriptName](#mannequinScriptName)
   7. [modelScriptName](#modelScriptName)
   8. [textureName](#textureName)
   9. [animSet](#animSet)
   10. [animState](#animState)
   11. [pose](#pose)
   12. [outfit](#outfit)
   13. [humanVisual](#humanVisual)
   14. [itemVisuals](#itemVisuals)
   15. [wornItems](#wornItems)
   16. [mannequinScript](#mannequinScript)
   17. [modelScript](#modelScript)
   18. [perPlayer](#perPlayer)
   19. [animate](#animate)
   20. [animatedModel](#animatedModel)
   21. [drawers](#drawers)
   22. [screenX](#screenX)
   23. [screenY](#screenY)
   24. [staticPerPlayer](#staticPerPlayer)
7. [Constructor Details](#constructor-detail)
   1. [IsoMannequin(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoMannequin(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [getHumanVisual()](#getHumanVisual())
   3. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   4. [isFemale()](#isFemale())
   5. [isZombie()](#isZombie())
   6. [isSkeleton()](#isSkeleton())
   7. [isItemAllowedInContainer(ItemContainer, InventoryItem)](#isItemAllowedInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   8. [getMannequinScriptName()](#getMannequinScriptName())
   9. [setMannequinScriptName(String)](#setMannequinScriptName(java.lang.String))
   10. [getPose()](#getPose())
   11. [setRenderDirection(IsoDirections)](#setRenderDirection(zombie.iso.IsoDirections))
   12. [rotate(IsoDirections)](#rotate(zombie.iso.IsoDirections))
   13. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   14. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   15. [getVariables(Map)](#getVariables(java.util.Map))
   16. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   17. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   18. [saveState(ByteBuffer)](#saveState(java.nio.ByteBuffer))
   19. [loadState(ByteBuffer)](#loadState(java.nio.ByteBuffer))
   20. [addToWorld()](#addToWorld())
   21. [removeFromWorld()](#removeFromWorld())
   22. [initMannequinScript()](#initMannequinScript())
   23. [initModelScript()](#initModelScript())
   24. [validateSkinTexture()](#validateSkinTexture())
   25. [validatePose()](#validatePose())
   26. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   27. [renderFxMask(float, float, float, boolean)](#renderFxMask(float,float,float,boolean))
   28. [shouldRenderEachFrame()](#shouldRenderEachFrame())
   29. [checkRenderDirection(int)](#checkRenderDirection(int))
   30. [calcScreenPos(float, float, float)](#calcScreenPos(float,float,float))
   31. [getAtlasTexture()](#getAtlasTexture())
   32. [renderShadow(float, float, float)](#renderShadow(float,float,float))
   33. [initOutfit()](#initOutfit())
   34. [getPropertiesFromSprite()](#getPropertiesFromSprite())
   35. [getPropertiesFromZone()](#getPropertiesFromZone())
   36. [syncModel()](#syncModel())
   37. [createInventory(ItemVisuals)](#createInventory(zombie.core.skinnedmodel.visual.ItemVisuals))
   38. [wearItem(InventoryItem, IsoGameCharacter)](#wearItem(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   39. [checkClothing(InventoryItem)](#checkClothing(zombie.inventory.InventoryItem))
   40. [getAnimSetName()](#getAnimSetName())
   41. [getAnimStateName()](#getAnimStateName())
   42. [getCustomSettingsFromItem(InventoryItem)](#getCustomSettingsFromItem(zombie.inventory.InventoryItem))
   43. [setCustomSettingsToItem(InventoryItem)](#setCustomSettingsToItem(zombie.inventory.InventoryItem))
   44. [isMannequinSprite(IsoSprite)](#isMannequinSprite(zombie.iso.sprite.IsoSprite))
   45. [resetMannequin()](#resetMannequin())
   46. [renderMoveableItem(Moveable, int, int, int, IsoDirections)](#renderMoveableItem(zombie.inventory.types.Moveable,int,int,int,zombie.iso.IsoDirections))
   47. [renderMoveableObject(IsoMannequin, int, int, int, IsoDirections)](#renderMoveableObject(zombie.iso.objects.IsoMannequin,int,int,int,zombie.iso.IsoDirections))
   48. [getDirectionFromItem(Moveable, int)](#getDirectionFromItem(zombie.inventory.types.Moveable,int))
   49. [getWornItems()](#getWornItems())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoMannequin
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoMannequin

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, IHumanVisual, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoMannequin
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoMannequin)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private final class`

  `IsoMannequin.Drawer`

  `static final class`

  `IsoMannequin.MannequinZone`

  `private static final class`

  `IsoMannequin.PerPlayer`

  `private static final class`

  `IsoMannequin.StaticPerPlayer`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `animate`

  `private zombie.core.skinnedmodel.advancedanimation.AnimatedModel`

  `animatedModel`

  `private String`

  `animSet`

  `private String`

  `animState`

  `private IsoMannequin.Drawer[]`

  `drawers`

  `private boolean`

  `female`

  `private final HumanVisual`

  `humanVisual`

  `private static final ColorInfo`

  `inf`

  `private boolean`

  `init`

  `private final ItemVisuals`

  `itemVisuals`

  `private MannequinScript`

  `mannequinScript`

  `private String`

  `mannequinScriptName`

  `private ModelScript`

  `modelScript`

  `private String`

  `modelScriptName`

  `private String`

  `outfit`

  `private final IsoMannequin.PerPlayer[]`

  `perPlayer`

  `private String`

  `pose`

  `private float`

  `screenX`

  `private float`

  `screenY`

  `private boolean`

  `skeleton`

  `private static final IsoMannequin.StaticPerPlayer[]`

  `staticPerPlayer`

  `private String`

  `textureName`

  `private final WornItems`

  `wornItems`

  `private boolean`

  `zombie`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMannequin(IsoCell cell)`

  `IsoMannequin(IsoCell cell,
  IsoGridSquare square,
  IsoSprite sprite)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addToWorld()`

  `private void`

  `calcScreenPos(float x,
  float y,
  float z)`

  `void`

  `checkClothing(InventoryItem removedItem)`

  `void`

  `checkRenderDirection(int playerIndex)`

  `private void`

  `createInventory(ItemVisuals itemVisuals)`

  `String`

  `getAnimSetName()`

  `String`

  `getAnimStateName()`

  `zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture`

  `getAtlasTexture()`

  `void`

  `getCustomSettingsFromItem(InventoryItem item)`

  `static IsoDirections`

  `getDirectionFromItem(Moveable item,
  int playerIndex)`

  `HumanVisual`

  `getHumanVisual()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `String`

  `getMannequinScriptName()`

  `String`

  `getObjectName()`

  `String`

  `getPose()`

  `private void`

  `getPropertiesFromSprite()`

  `private void`

  `getPropertiesFromZone()`

  `void`

  `getVariables(Map<String,String> vars)`

  `WornItems`

  `getWornItems()`

  `private void`

  `initMannequinScript()`

  `private void`

  `initModelScript()`

  `private void`

  `initOutfit()`

  `boolean`

  `isFemale()`

  `boolean`

  `isItemAllowedInContainer(ItemContainer container,
  InventoryItem item)`

  `static boolean`

  `isMannequinSprite(IsoSprite sprite)`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isZombie()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `loadState(ByteBuffer input)`

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

  `renderFxMask(float x,
  float y,
  float z,
  boolean bDoAttached)`

  `static void`

  `renderMoveableItem(Moveable item,
  int x,
  int y,
  int z,
  IsoDirections dir)`

  `static void`

  `renderMoveableObject(IsoMannequin mannequin,
  int x,
  int y,
  int z,
  IsoDirections dir)`

  `void`

  `renderShadow(float x,
  float y,
  float z)`

  `private void`

  `resetMannequin()`

  `void`

  `rotate(IsoDirections newDir)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `saveState(ByteBuffer output)`

  `void`

  `setCustomSettingsToItem(InventoryItem item)`

  `void`

  `setMannequinScriptName(String name)`

  `void`

  `setRenderDirection(IsoDirections newDir)`

  `boolean`

  `shouldRenderEachFrame()`

  `private void`

  `syncModel()`

  `private void`

  `validatePose()`

  `private void`

  `validateSkinTexture()`

  `void`

  `wearItem(InventoryItem item,
  IsoGameCharacter chr)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  + ### inf

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") inf
  + ### init

    private boolean init
  + ### female

    private boolean female
  + ### zombie

    private boolean zombie
  + ### skeleton

    private boolean skeleton
  + ### mannequinScriptName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mannequinScriptName
  + ### modelScriptName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptName
  + ### textureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName
  + ### animSet

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animSet
  + ### animState

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animState
  + ### pose

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pose
  + ### outfit

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit
  + ### humanVisual

    private final [HumanVisual](../../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual
  + ### itemVisuals

    private final [ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals
  + ### wornItems

    private final [WornItems](../../characters/WornItems/WornItems.html "class in zombie.characters.WornItems") wornItems
  + ### mannequinScript

    private [MannequinScript](../../scripting/objects/MannequinScript.html "class in zombie.scripting.objects") mannequinScript
  + ### modelScript

    private [ModelScript](../../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript
  + ### perPlayer

    private final [IsoMannequin.PerPlayer](IsoMannequin.PerPlayer.html "class in zombie.iso.objects")[] perPlayer
  + ### animate

    private boolean animate
  + ### animatedModel

    private zombie.core.skinnedmodel.advancedanimation.AnimatedModel animatedModel
  + ### drawers

    private [IsoMannequin.Drawer](IsoMannequin.Drawer.html "class in zombie.iso.objects")[] drawers
  + ### screenX

    private float screenX
  + ### screenY

    private float screenY
  + ### staticPerPlayer

    private static final [IsoMannequin.StaticPerPlayer](IsoMannequin.StaticPerPlayer.html "class in zombie.iso.objects")[] staticPerPlayer
* Constructor Details
  -------------------

  + ### IsoMannequin

    public IsoMannequin([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoMannequin

    public IsoMannequin([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### getHumanVisual

    public [HumanVisual](../../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") getHumanVisual()

    Specified by:
    :   `getHumanVisual` in interface `IHumanVisual`
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `getItemVisuals` in interface `IHumanVisual`
  + ### isFemale

    public boolean isFemale()

    Specified by:
    :   `isFemale` in interface `IHumanVisual`
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `IHumanVisual`

    Overrides:
    :   `isZombie` in class `IsoObject`
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`
  + ### isItemAllowedInContainer

    public boolean isItemAllowedInContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `isItemAllowedInContainer` in class `IsoObject`
  + ### getMannequinScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMannequinScriptName()
  + ### setMannequinScriptName

    public void setMannequinScriptName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPose

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPose()
  + ### setRenderDirection

    public void setRenderDirection([IsoDirections](../IsoDirections.html "enum class in zombie.iso") newDir)
  + ### rotate

    public void rotate([IsoDirections](../IsoDirections.html "enum class in zombie.iso") newDir)
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
  + ### getVariables

    public void getVariables([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> vars)
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
  + ### saveState

    public void saveState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `saveState` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### loadState

    public void loadState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `loadState` in class `IsoObject`

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
  + ### initMannequinScript

    private void initMannequinScript()
  + ### initModelScript

    private void initModelScript()
  + ### validateSkinTexture

    private void validateSkinTexture()
  + ### validatePose

    private void validatePose()
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
  + ### renderFxMask

    public void renderFxMask(float x,
    float y,
    float z,
    boolean bDoAttached)

    Overrides:
    :   `renderFxMask` in class `IsoObject`
  + ### shouldRenderEachFrame

    public boolean shouldRenderEachFrame()
  + ### checkRenderDirection

    public void checkRenderDirection(int playerIndex)
  + ### calcScreenPos

    private void calcScreenPos(float x,
    float y,
    float z)
  + ### getAtlasTexture

    public zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture getAtlasTexture()
  + ### renderShadow

    public void renderShadow(float x,
    float y,
    float z)
  + ### initOutfit

    private void initOutfit()
  + ### getPropertiesFromSprite

    private void getPropertiesFromSprite()
  + ### getPropertiesFromZone

    private void getPropertiesFromZone()
  + ### syncModel

    private void syncModel()
  + ### createInventory

    private void createInventory([ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### wearItem

    public void wearItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkClothing

    public void checkClothing([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removedItem)
  + ### getAnimSetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimSetName()
  + ### getAnimStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimStateName()
  + ### getCustomSettingsFromItem

    public void getCustomSettingsFromItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### setCustomSettingsToItem

    public void setCustomSettingsToItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isMannequinSprite

    public static boolean isMannequinSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### resetMannequin

    private void resetMannequin()
  + ### renderMoveableItem

    public static void renderMoveableItem([Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") item,
    int x,
    int y,
    int z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### renderMoveableObject

    public static void renderMoveableObject([IsoMannequin](IsoMannequin.html "class in zombie.iso.objects") mannequin,
    int x,
    int y,
    int z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### getDirectionFromItem

    public static [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getDirectionFromItem([Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") item,
    int playerIndex)
  + ### getWornItems

    public [WornItems](../../characters/WornItems/WornItems.html "class in zombie.characters.WornItems") getWornItems()