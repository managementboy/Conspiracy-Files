[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoTree](IsoTree.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [s\_chopTreeLocation](#s_chopTreeLocation)
   2. [s\_chopTreeIndicators](#s_chopTreeIndicators)
   3. [chopTreeHighlighted](#chopTreeHighlighted)
   4. [fadeAlpha](#fadeAlpha)
   5. [SIZE\_JUMBO](#SIZE_JUMBO)
   6. [SIZE\_JUMBO\_L](#SIZE_JUMBO_L)
   7. [SIZE\_JUMBO\_XL](#SIZE_JUMBO_XL)
   8. [SIZE\_JUMBO\_XXL](#SIZE_JUMBO_XXL)
   9. [MAX\_SIZE](#MAX_SIZE)
   10. [logYield](#logYield)
   11. [damage](#damage)
   12. [size](#size)
   13. [renderFlag](#renderFlag)
   14. [wasFaded](#wasFaded)
   15. [useTreeShader](#useTreeShader)
   16. [cutawayAlpha](#cutawayAlpha)
   17. [LOGS\_PER\_SIZE](#LOGS_PER_SIZE)
7. [Constructor Details](#constructor-detail)
   1. [IsoTree()](#%3Cinit%3E())
   2. [IsoTree(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   3. [IsoTree(IsoGridSquare, String)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String))
   4. [IsoTree(IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
8. [Method Details](#method-detail)
   1. [getNew()](#getNew())
   2. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   3. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   4. [checkMoveWithWind()](#checkMoveWithWind())
   5. [initTree()](#initTree())
   6. [getObjectName()](#getObjectName())
   7. [Damage(float)](#Damage(float))
   8. [HitByVehicle(BaseVehicle, float)](#HitByVehicle(zombie.vehicles.BaseVehicle,float))
   9. [WeaponHitEffects(IsoGameCharacter, HandWeapon)](#WeaponHitEffects(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   10. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   11. [setHealth(int)](#setHealth(int))
   12. [getHealth()](#getHealth())
   13. [getMaxHealth()](#getMaxHealth())
   14. [getSize()](#getSize())
   15. [getSlowFactor(IsoMovingObject)](#getSlowFactor(zombie.iso.IsoMovingObject))
   16. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   17. [countObscuredSeenSquaresOriginal(int, boolean)](#countObscuredSeenSquaresOriginal(int,boolean))
   18. [countObscuredSeenSquares(int, int, boolean)](#countObscuredSeenSquares(int,int,boolean))
   19. [countObscuredSeenSquares(int, int, boolean, int, int, int, int, int)](#countObscuredSeenSquares(int,int,boolean,int,int,int,int,int))
   20. [render(float, float, float, ColorInfo, boolean, int, boolean)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,int,boolean))
   21. [renderInner(float, float, float, ColorInfo, boolean, boolean)](#renderInner(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean))
   22. [isUpdateAlphaDuringRender()](#isUpdateAlphaDuringRender())
   23. [setSprite(IsoSprite)](#setSprite(zombie.iso.sprite.IsoSprite))
   24. [isMaskClicked(int, int, boolean)](#isMaskClicked(int,int,boolean))
   25. [setChopTreeCursorLocation(int, int, int, int)](#setChopTreeCursorLocation(int,int,int,int))
   26. [checkChopTreeIndicator()](#checkChopTreeIndicator())
   27. [checkChopTreeIndicators(int)](#checkChopTreeIndicators(int))
   28. [renderChopTreeIndicators()](#renderChopTreeIndicators())
   29. [renderChopTreeIndicator(IsoGridSquare)](#renderChopTreeIndicator(zombie.iso.IsoGridSquare))
   30. [getRenderSquare()](#getRenderSquare())
   31. [reset()](#reset())
   32. [dropWood()](#dropWood())
   33. [toppleTree()](#toppleTree())
   34. [toppleTree(IsoGameCharacter)](#toppleTree(zombie.characters.IsoGameCharacter))
   35. [getLogYield()](#getLogYield())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoTree
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoTree

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IHasHealth, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoTree
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements zombie.iso.IHasHealth

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoTree)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoTree.TreeShader`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static IsoTree`

  `chopTreeHighlighted`

  `private float`

  `cutawayAlpha`

  `private int`

  `damage`

  `float`

  `fadeAlpha`

  `private static final int[]`

  `LOGS_PER_SIZE`

  `private int`

  `logYield`

  `static final int`

  `MAX_SIZE`

  `boolean`

  `renderFlag`

  `private static final ArrayList<IsoGridSquare>`

  `s_chopTreeIndicators`

  `private static final IsoGameCharacter.Location[]`

  `s_chopTreeLocation`

  `int`

  `size`

  `static final int`

  `SIZE_JUMBO`

  `static final int`

  `SIZE_JUMBO_L`

  `static final int`

  `SIZE_JUMBO_XL`

  `static final int`

  `SIZE_JUMBO_XXL`

  `boolean`

  `useTreeShader`

  `boolean`

  `wasFaded`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoTree()`

  `IsoTree(IsoCell cell)`

  `IsoTree(IsoGridSquare sq,
  String gid)`

  `IsoTree(IsoGridSquare sq,
  IsoSprite gid)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `checkChopTreeIndicator()`

  `static void`

  `checkChopTreeIndicators(int playerIndex)`

  `protected void`

  `checkMoveWithWind()`

  `private int`

  `countObscuredSeenSquares(int playerIndex,
  int stopCount,
  boolean debugRender)`

  `private int`

  `countObscuredSeenSquares(int playerIndex,
  int stopCount,
  boolean debugRender,
  int count,
  int x1,
  int y1,
  int z1,
  int num)`

  `private int`

  `countObscuredSeenSquaresOriginal(int playerIndex,
  boolean debugRender)`

  `void`

  `Damage(float amount)`

  `void`

  `dropWood()`

  `int`

  `getHealth()`

  `int`

  `getLogYield()`

  `int`

  `getMaxHealth()`

  `static IsoTree`

  `getNew()`

  `String`

  `getObjectName()`

  `IsoGridSquare`

  `getRenderSquare()`

  `int`

  `getSize()`

  `float`

  `getSlowFactor(IsoMovingObject chr)`

  `void`

  `HitByVehicle(BaseVehicle vehicle,
  float amount)`

  `void`

  `initTree()`

  `boolean`

  `isMaskClicked(int x,
  int y,
  boolean flip)`

  `protected boolean`

  `isUpdateAlphaDuringRender()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `private void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  int playerIndex,
  boolean transparent)`

  `private static void`

  `renderChopTreeIndicator(IsoGridSquare square)`

  `static void`

  `renderChopTreeIndicators()`

  `private void`

  `renderInner(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bShader)`

  `void`

  `reset()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `static void`

  `setChopTreeCursorLocation(int playerIndex,
  int x,
  int y,
  int z)`

  `void`

  `setHealth(int health)`

  `void`

  `setSprite(IsoSprite sprite)`

  `void`

  `toppleTree()`

  `void`

  `toppleTree(IsoGameCharacter owner)`

  `void`

  `WeaponHit(IsoGameCharacter owner,
  HandWeapon weapon)`

  `void`

  `WeaponHitEffects(IsoGameCharacter owner,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPosition, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isDestroyed, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorld, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

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

  + ### s\_chopTreeLocation

    private static final [IsoGameCharacter.Location](../../characters/IsoGameCharacter.Location.html "class in zombie.characters")[] s\_chopTreeLocation
  + ### s\_chopTreeIndicators

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> s\_chopTreeIndicators
  + ### chopTreeHighlighted

    private static [IsoTree](IsoTree.html "class in zombie.iso.objects") chopTreeHighlighted
  + ### fadeAlpha

    public float fadeAlpha
  + ### SIZE\_JUMBO

    public static final int SIZE\_JUMBO

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTree.SIZE_JUMBO)
  + ### SIZE\_JUMBO\_L

    public static final int SIZE\_JUMBO\_L

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTree.SIZE_JUMBO_L)
  + ### SIZE\_JUMBO\_XL

    public static final int SIZE\_JUMBO\_XL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTree.SIZE_JUMBO_XL)
  + ### SIZE\_JUMBO\_XXL

    public static final int SIZE\_JUMBO\_XXL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTree.SIZE_JUMBO_XXL)
  + ### MAX\_SIZE

    public static final int MAX\_SIZE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoTree.MAX_SIZE)
  + ### logYield

    private int logYield
  + ### damage

    private int damage
  + ### size

    public int size
  + ### renderFlag

    public boolean renderFlag
  + ### wasFaded

    public boolean wasFaded
  + ### useTreeShader

    public boolean useTreeShader
  + ### cutawayAlpha

    private float cutawayAlpha
  + ### LOGS\_PER\_SIZE

    private static final int[] LOGS\_PER\_SIZE
* Constructor Details
  -------------------

  + ### IsoTree

    public IsoTree()
  + ### IsoTree

    public IsoTree([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoTree

    public IsoTree([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gid)
  + ### IsoTree

    public IsoTree([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid)
* Method Details
  --------------

  + ### getNew

    public static [IsoTree](IsoTree.html "class in zombie.iso.objects") getNew()
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
  + ### checkMoveWithWind

    protected void checkMoveWithWind()

    Overrides:
    :   `checkMoveWithWind` in class `IsoObject`
  + ### initTree

    public void initTree()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### Damage

    public void Damage(float amount)

    Overrides:
    :   `Damage` in class `IsoObject`
  + ### HitByVehicle

    public void HitByVehicle([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float amount)

    Overrides:
    :   `HitByVehicle` in class `IsoObject`
  + ### WeaponHitEffects

    public void WeaponHitEffects([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
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
  + ### getSize

    public int getSize()
  + ### getSlowFactor

    public float getSlowFactor([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") chr)
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
  + ### countObscuredSeenSquaresOriginal

    private int countObscuredSeenSquaresOriginal(int playerIndex,
    boolean debugRender)
  + ### countObscuredSeenSquares

    private int countObscuredSeenSquares(int playerIndex,
    int stopCount,
    boolean debugRender)
  + ### countObscuredSeenSquares

    private int countObscuredSeenSquares(int playerIndex,
    int stopCount,
    boolean debugRender,
    int count,
    int x1,
    int y1,
    int z1,
    int num)
  + ### render

    private void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    int playerIndex,
    boolean transparent)
  + ### renderInner

    private void renderInner(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bShader)
  + ### isUpdateAlphaDuringRender

    protected boolean isUpdateAlphaDuringRender()

    Overrides:
    :   `isUpdateAlphaDuringRender` in class `IsoObject`
  + ### setSprite

    public void setSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)

    Overrides:
    :   `setSprite` in class `IsoObject`
  + ### isMaskClicked

    public boolean isMaskClicked(int x,
    int y,
    boolean flip)

    Overrides:
    :   `isMaskClicked` in class `IsoObject`
  + ### setChopTreeCursorLocation

    public static void setChopTreeCursorLocation(int playerIndex,
    int x,
    int y,
    int z)
  + ### checkChopTreeIndicator

    public void checkChopTreeIndicator()
  + ### checkChopTreeIndicators

    public static void checkChopTreeIndicators(int playerIndex)
  + ### renderChopTreeIndicators

    public static void renderChopTreeIndicators()
  + ### renderChopTreeIndicator

    private static void renderChopTreeIndicator([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### getRenderSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRenderSquare()

    Overrides:
    :   `getRenderSquare` in class `IsoObject`
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `IsoObject`
  + ### dropWood

    public void dropWood()
  + ### toppleTree

    public void toppleTree()
  + ### toppleTree

    public void toppleTree([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getLogYield

    public int getLogYield()