[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoWindow](IsoWindow.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SinglePaneWindowMaxHealth](#SinglePaneWindowMaxHealth)
   2. [DoublePaneWindowMaxHealth](#DoublePaneWindowMaxHealth)
   3. [WeaponDoorDamageModifier](#WeaponDoorDamageModifier)
   4. [NoWeaponDoorDamage](#NoWeaponDoorDamage)
   5. [SMASH\_SOUND\_RADIUS](#SMASH_SOUND_RADIUS)
   6. [type](#type)
   7. [health](#health)
   8. [maxHealth](#maxHealth)
   9. [north](#north)
   10. [locked](#locked)
   11. [permaLocked](#permaLocked)
   12. [open](#open)
   13. [destroyed](#destroyed)
   14. [glassRemoved](#glassRemoved)
   15. [openSprite](#openSprite)
   16. [closedSprite](#closedSprite)
   17. [smashedSprite](#smashedSprite)
   18. [glassRemovedSprite](#glassRemovedSprite)
7. [Constructor Details](#constructor-detail)
   1. [IsoWindow(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoWindow(IsoCell, IsoGridSquare, IsoSprite, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite,boolean))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [HasCurtains()](#HasCurtains())
   3. [getIndoorSquare()](#getIndoorSquare())
   4. [getAddSheetSquare(IsoGameCharacter)](#getAddSheetSquare(zombie.characters.IsoGameCharacter))
   5. [AttackObject(IsoGameCharacter)](#AttackObject(zombie.characters.IsoGameCharacter))
   6. [getInsideSquare()](#getInsideSquare())
   7. [getOppositeSquare()](#getOppositeSquare())
   8. [isExterior()](#isExterior())
   9. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   10. [smashWindow(boolean, boolean)](#smashWindow(boolean,boolean))
   11. [smashWindow(boolean)](#smashWindow(boolean))
   12. [smashWindow()](#smashWindow())
   13. [addBrokenGlass(IsoMovingObject)](#addBrokenGlass(zombie.iso.IsoMovingObject))
   14. [addBrokenGlass(boolean)](#addBrokenGlass(boolean))
   15. [handleAlarm()](#handleAlarm())
   16. [isDestroyed()](#isDestroyed())
   17. [TestCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   18. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   19. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   20. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   21. [getThumpableFor(IsoGameCharacter, HandWeapon)](#getThumpableFor(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   22. [getThumpCondition()](#getThumpCondition())
   23. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   24. [addToWorld()](#addToWorld())
   25. [removeFromWorld()](#removeFromWorld())
   26. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   27. [saveState(ByteBuffer)](#saveState(java.nio.ByteBuffer))
   28. [loadState(ByteBuffer)](#loadState(java.nio.ByteBuffer))
   29. [openCloseCurtain(IsoGameCharacter)](#openCloseCurtain(zombie.characters.IsoGameCharacter))
   30. [removeSheet(IsoGameCharacter)](#removeSheet(zombie.characters.IsoGameCharacter))
   31. [addSheet(IsoGameCharacter)](#addSheet(zombie.characters.IsoGameCharacter))
   32. [ToggleWindow(IsoGameCharacter)](#ToggleWindow(zombie.characters.IsoGameCharacter))
   33. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   34. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   35. [isTopOfSheetRopeHere(IsoGridSquare)](#isTopOfSheetRopeHere(zombie.iso.IsoGridSquare))
   36. [isTopOfSheetRopeHere(IsoGridSquare, boolean)](#isTopOfSheetRopeHere(zombie.iso.IsoGridSquare,boolean))
   37. [haveSheetRope()](#haveSheetRope())
   38. [isSheetRopeHere(IsoGridSquare)](#isSheetRopeHere(zombie.iso.IsoGridSquare))
   39. [canClimbHere(IsoGridSquare)](#canClimbHere(zombie.iso.IsoGridSquare))
   40. [countAddSheetRope(IsoGridSquare, boolean)](#countAddSheetRope(zombie.iso.IsoGridSquare,boolean))
   41. [countAddSheetRope()](#countAddSheetRope())
   42. [canAddSheetRope(IsoGridSquare, boolean)](#canAddSheetRope(zombie.iso.IsoGridSquare,boolean))
   43. [canAddSheetRope()](#canAddSheetRope())
   44. [addSheetRope(IsoPlayer, String)](#addSheetRope(zombie.characters.IsoPlayer,java.lang.String))
   45. [addSheetRope(IsoPlayer, IsoGridSquare, boolean, String)](#addSheetRope(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare,boolean,java.lang.String))
   46. [removeSheetRope(IsoPlayer)](#removeSheetRope(zombie.characters.IsoPlayer))
   47. [removeSheetRope(IsoPlayer, IsoGridSquare, boolean)](#removeSheetRope(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare,boolean))
   48. [Damage(float)](#Damage(float))
   49. [damage(float)](#damage(float))
   50. [damage(float, IsoMovingObject)](#damage(float,zombie.iso.IsoMovingObject))
   51. [isLocked()](#isLocked())
   52. [isSmashed()](#isSmashed())
   53. [isInvincible()](#isInvincible())
   54. [getBarricadeOnSameSquare()](#getBarricadeOnSameSquare())
   55. [getBarricadeOnOppositeSquare()](#getBarricadeOnOppositeSquare())
   56. [isBarricaded()](#isBarricaded())
   57. [isBarricadeAllowed()](#isBarricadeAllowed())
   58. [getBarricadeForCharacter(IsoGameCharacter)](#getBarricadeForCharacter(zombie.characters.IsoGameCharacter))
   59. [getBarricadeOppositeCharacter(IsoGameCharacter)](#getBarricadeOppositeCharacter(zombie.characters.IsoGameCharacter))
   60. [getNorth()](#getNorth())
   61. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   62. [setIsLocked(boolean)](#setIsLocked(boolean))
   63. [getOpenSprite()](#getOpenSprite())
   64. [setOpenSprite(IsoSprite)](#setOpenSprite(zombie.iso.sprite.IsoSprite))
   65. [setSmashed(boolean)](#setSmashed(boolean))
   66. [getSmashedSprite()](#getSmashedSprite())
   67. [setSmashedSprite(IsoSprite)](#setSmashedSprite(zombie.iso.sprite.IsoSprite))
   68. [setPermaLocked(Boolean)](#setPermaLocked(java.lang.Boolean))
   69. [isPermaLocked()](#isPermaLocked())
   70. [canClimbThroughHelper(IsoGameCharacter, IsoGridSquare, IsoGridSquare, boolean)](#canClimbThroughHelper(zombie.characters.IsoGameCharacter,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,boolean))
   71. [canClimbThrough(IsoGameCharacter)](#canClimbThrough(zombie.characters.IsoGameCharacter))
   72. [getFirstCharacterClimbingThrough()](#getFirstCharacterClimbingThrough())
   73. [getFirstCharacterClimbingThrough(IsoGridSquare)](#getFirstCharacterClimbingThrough(zombie.iso.IsoGridSquare))
   74. [getFirstCharacterClosing()](#getFirstCharacterClosing())
   75. [getFirstCharacterClosing(IsoGridSquare)](#getFirstCharacterClosing(zombie.iso.IsoGridSquare))
   76. [isGlassRemoved()](#isGlassRemoved())
   77. [setGlassRemoved(boolean)](#setGlassRemoved(boolean))
   78. [removeBrokenGlass()](#removeBrokenGlass())
   79. [addBarricadesDebug(int, boolean)](#addBarricadesDebug(int,boolean))
   80. [addRandomBarricades()](#addRandomBarricades())
   81. [getHealth()](#getHealth())
   82. [IsOpen()](#IsOpen())
   83. [isNorth()](#isNorth())
   84. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   85. [canAttackBypassIsoBarricade(IsoGameCharacter, HandWeapon)](#canAttackBypassIsoBarricade(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   86. [reset()](#reset())
   87. [resetCurrentCellWindows()](#resetCurrentCellWindows())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoWindow
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoWindow

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, BarricadeAble, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoWindow
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.objects.interfaces.Thumpable

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoWindow)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `IsoWindow.LockedHouseFrequency`

  `static enum`

  `IsoWindow.WindowType`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoSprite`

  `closedSprite`

  `private boolean`

  `destroyed`

  `private static final int`

  `DoublePaneWindowMaxHealth`

  `private boolean`

  `glassRemoved`

  `private IsoSprite`

  `glassRemovedSprite`

  `private int`

  `health`

  `private boolean`

  `locked`

  `private int`

  `maxHealth`

  `private boolean`

  `north`

  `static final float`

  `NoWeaponDoorDamage`

  `private boolean`

  `open`

  `private IsoSprite`

  `openSprite`

  `private boolean`

  `permaLocked`

  `private static final int`

  `SinglePaneWindowMaxHealth`

  `static final int`

  `SMASH_SOUND_RADIUS`

  `private IsoSprite`

  `smashedSprite`

  `private final IsoWindow.WindowType`

  `type`

  `static final float`

  `WeaponDoorDamageModifier`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWindow(IsoCell cell)`

  `IsoWindow(IsoCell cell,
  IsoGridSquare gridSquare,
  IsoSprite gid,
  boolean north)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoBarricade`

  `addBarricadesDebug(int numPlanks,
  boolean metal)`

  `void`

  `addBrokenGlass(boolean onOppositeSquare)`

  `void`

  `addBrokenGlass(IsoMovingObject chr)`

  `void`

  `addRandomBarricades()`

  `void`

  `addSheet(IsoGameCharacter chr)`

  `boolean`

  `addSheetRope(IsoPlayer player,
  String itemType)`

  `static boolean`

  `addSheetRope(IsoPlayer player,
  IsoGridSquare sq,
  boolean north,
  String itemType)`

  `void`

  `addToWorld()`

  `void`

  `AttackObject(IsoGameCharacter owner)`

  `boolean`

  `canAddSheetRope()`

  `static boolean`

  `canAddSheetRope(IsoGridSquare sq,
  boolean north)`

  `boolean`

  `canAttackBypassIsoBarricade(IsoGameCharacter isoGameCharacter,
  HandWeapon handWeapon)`

  `static boolean`

  `canClimbHere(IsoGridSquare sq)`

  `boolean`

  `canClimbThrough(IsoGameCharacter chr)`

  `static boolean`

  `canClimbThroughHelper(IsoGameCharacter chr,
  IsoGridSquare sq,
  IsoGridSquare oppositeSq,
  boolean north)`

  `int`

  `countAddSheetRope()`

  `static int`

  `countAddSheetRope(IsoGridSquare sq,
  boolean north)`

  `private void`

  `damage(float amount)`

  `private void`

  `damage(float amount,
  IsoMovingObject chr)`

  `void`

  `Damage(float amount)`

  `IsoGridSquare`

  `getAddSheetSquare(IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeForCharacter(IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeOnOppositeSquare()`

  `IsoBarricade`

  `getBarricadeOnSameSquare()`

  `IsoBarricade`

  `getBarricadeOppositeCharacter(IsoGameCharacter chr)`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `IsoGameCharacter`

  `getFirstCharacterClimbingThrough()`

  `IsoGameCharacter`

  `getFirstCharacterClimbingThrough(IsoGridSquare square)`

  `IsoGameCharacter`

  `getFirstCharacterClosing()`

  `IsoGameCharacter`

  `getFirstCharacterClosing(IsoGridSquare square)`

  `int`

  `getHealth()`

  `IsoGridSquare`

  `getIndoorSquare()`

  `IsoGridSquare`

  `getInsideSquare()`

  `boolean`

  `getNorth()`

  `String`

  `getObjectName()`

  `IsoSprite`

  `getOpenSprite()`

  `IsoGridSquare`

  `getOppositeSquare()`

  `IsoSprite`

  `getSmashedSprite()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr,
  HandWeapon weapon)`

  `float`

  `getThumpCondition()`

  `private void`

  `handleAlarm()`

  `IsoCurtain`

  `HasCurtains()`

  `boolean`

  `haveSheetRope()`

  `boolean`

  `isBarricadeAllowed()`

  `boolean`

  `isBarricaded()`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isExterior()`

  `boolean`

  `isGlassRemoved()`

  `boolean`

  `isInvincible()`

  `boolean`

  `isLocked()`

  `boolean`

  `isNorth()`

  `boolean`

  `IsOpen()`

  `boolean`

  `isPermaLocked()`

  `static boolean`

  `isSheetRopeHere(IsoGridSquare sq)`

  `boolean`

  `isSmashed()`

  `static boolean`

  `isTopOfSheetRopeHere(IsoGridSquare sq)`

  `static boolean`

  `isTopOfSheetRopeHere(IsoGridSquare sq,
  boolean north)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadState(ByteBuffer bb)`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `void`

  `openCloseCurtain(IsoGameCharacter chr)`

  `void`

  `removeBrokenGlass()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeSheet(IsoGameCharacter chr)`

  `boolean`

  `removeSheetRope(IsoPlayer player)`

  `static boolean`

  `removeSheetRope(IsoPlayer player,
  IsoGridSquare square,
  boolean north)`

  `void`

  `reset()`

  `static void`

  `resetCurrentCellWindows()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveState(ByteBuffer bb)`

  `void`

  `setGlassRemoved(boolean removed)`

  `void`

  `setIsLocked(boolean lock)`

  `void`

  `setOpenSprite(IsoSprite sprite)`

  `void`

  `setPermaLocked(Boolean permaLock)`

  `void`

  `setSmashed(boolean destroyed)`

  `void`

  `setSmashedSprite(IsoSprite sprite)`

  `void`

  `smashWindow()`

  `void`

  `smashWindow(boolean bRemote)`

  `void`

  `smashWindow(boolean bRemote,
  boolean doAlarm)`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `boolean`

  `TestCollide(IsoMovingObject obj,
  IsoGridSquare from,
  IsoGridSquare to)`

  `IsoObject.VisionResult`

  `TestVision(IsoGridSquare from,
  IsoGridSquare to)`

  `void`

  `Thump(IsoMovingObject thumper,
  int thumpEventCount)`

  `void`

  `ToggleWindow(IsoGameCharacter chr)`

  `void`

  `WeaponHit(IsoGameCharacter owner,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reuseGridSquare, save, saveChange, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, TestPathfindCollide, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

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

  + ### SinglePaneWindowMaxHealth

    private static final int SinglePaneWindowMaxHealth

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoWindow.SinglePaneWindowMaxHealth)
  + ### DoublePaneWindowMaxHealth

    private static final int DoublePaneWindowMaxHealth

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoWindow.DoublePaneWindowMaxHealth)
  + ### WeaponDoorDamageModifier

    public static final float WeaponDoorDamageModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoWindow.WeaponDoorDamageModifier)
  + ### NoWeaponDoorDamage

    public static final float NoWeaponDoorDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoWindow.NoWeaponDoorDamage)
  + ### SMASH\_SOUND\_RADIUS

    public static final int SMASH\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoWindow.SMASH_SOUND_RADIUS)
  + ### type

    private final [IsoWindow.WindowType](IsoWindow.WindowType.html "enum class in zombie.iso.objects") type
  + ### health

    private int health
  + ### maxHealth

    private int maxHealth
  + ### north

    private boolean north
  + ### locked

    private boolean locked
  + ### permaLocked

    private boolean permaLocked
  + ### open

    private boolean open
  + ### destroyed

    private boolean destroyed
  + ### glassRemoved

    private boolean glassRemoved
  + ### openSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") openSprite
  + ### closedSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") closedSprite
  + ### smashedSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") smashedSprite
  + ### glassRemovedSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") glassRemovedSprite
* Constructor Details
  -------------------

  + ### IsoWindow

    public IsoWindow([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoWindow

    public IsoWindow([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid,
    boolean north)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### HasCurtains

    public [IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") HasCurtains()
  + ### getIndoorSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getIndoorSquare()
  + ### getAddSheetSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getAddSheetSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### AttackObject

    public void AttackObject([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `AttackObject` in class `IsoObject`
  + ### getInsideSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getInsideSquare()
  + ### getOppositeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOppositeSquare()

    Specified by:
    :   `getOppositeSquare` in interface `BarricadeAble`
  + ### isExterior

    public boolean isExterior()
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
  + ### smashWindow

    public void smashWindow(boolean bRemote,
    boolean doAlarm)
  + ### smashWindow

    public void smashWindow(boolean bRemote)
  + ### smashWindow

    public void smashWindow()
  + ### addBrokenGlass

    public void addBrokenGlass([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") chr)
  + ### addBrokenGlass

    public void addBrokenGlass(boolean onOppositeSquare)
  + ### handleAlarm

    private void handleAlarm()
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `isDestroyed` in class `IsoObject`
  + ### TestCollide

    public boolean TestCollide([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") to)

    Overrides:
    :   `TestCollide` in class `IsoObject`
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
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpableFor` in class `IsoObject`
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpCondition` in class `IsoObject`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

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
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### saveState

    public void saveState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `saveState` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### loadState

    public void loadState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `loadState` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### openCloseCurtain

    public void openCloseCurtain([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### removeSheet

    public void removeSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addSheet

    public void addSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### ToggleWindow

    public void ToggleWindow([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
  + ### isTopOfSheetRopeHere

    public static boolean isTopOfSheetRopeHere([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### isTopOfSheetRopeHere

    public static boolean isTopOfSheetRopeHere([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    boolean north)
  + ### haveSheetRope

    public boolean haveSheetRope()

    Overrides:
    :   `haveSheetRope` in class `IsoObject`
  + ### isSheetRopeHere

    public static boolean isSheetRopeHere([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### canClimbHere

    public static boolean canClimbHere([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### countAddSheetRope

    public static int countAddSheetRope([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    boolean north)
  + ### countAddSheetRope

    public int countAddSheetRope()

    Overrides:
    :   `countAddSheetRope` in class `IsoObject`
  + ### canAddSheetRope

    public static boolean canAddSheetRope([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    boolean north)
  + ### canAddSheetRope

    public boolean canAddSheetRope()

    Overrides:
    :   `canAddSheetRope` in class `IsoObject`
  + ### addSheetRope

    public boolean addSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)

    Overrides:
    :   `addSheetRope` in class `IsoObject`
  + ### addSheetRope

    public static boolean addSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    boolean north,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### removeSheetRope

    public boolean removeSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `removeSheetRope` in class `IsoObject`
  + ### removeSheetRope

    public static boolean removeSheetRope([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    boolean north)
  + ### Damage

    public void Damage(float amount)

    Overrides:
    :   `Damage` in class `IsoObject`
  + ### damage

    private void damage(float amount)
  + ### damage

    private void damage(float amount,
    [IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") chr)
  + ### isLocked

    public boolean isLocked()
  + ### isSmashed

    public boolean isSmashed()
  + ### isInvincible

    public boolean isInvincible()
  + ### getBarricadeOnSameSquare

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnSameSquare()

    Specified by:
    :   `getBarricadeOnSameSquare` in interface `BarricadeAble`
  + ### getBarricadeOnOppositeSquare

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnOppositeSquare()

    Specified by:
    :   `getBarricadeOnOppositeSquare` in interface `BarricadeAble`
  + ### isBarricaded

    public boolean isBarricaded()

    Specified by:
    :   `isBarricaded` in interface `BarricadeAble`
  + ### isBarricadeAllowed

    public boolean isBarricadeAllowed()

    Specified by:
    :   `isBarricadeAllowed` in interface `BarricadeAble`
  + ### getBarricadeForCharacter

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeForCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getBarricadeForCharacter` in interface `BarricadeAble`
  + ### getBarricadeOppositeCharacter

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") getBarricadeOppositeCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getBarricadeOppositeCharacter` in interface `BarricadeAble`
  + ### getNorth

    public boolean getNorth()

    Specified by:
    :   `getNorth` in interface `BarricadeAble`
  + ### getFacingPosition

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPosition([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
  + ### setIsLocked

    public void setIsLocked(boolean lock)
  + ### getOpenSprite

    public [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") getOpenSprite()
  + ### setOpenSprite

    public void setOpenSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setSmashed

    public void setSmashed(boolean destroyed)
  + ### getSmashedSprite

    public [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") getSmashedSprite()
  + ### setSmashedSprite

    public void setSmashedSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setPermaLocked

    public void setPermaLocked([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") permaLock)
  + ### isPermaLocked

    public boolean isPermaLocked()
  + ### canClimbThroughHelper

    public static boolean canClimbThroughHelper([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") oppositeSq,
    boolean north)
  + ### canClimbThrough

    public boolean canClimbThrough([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getFirstCharacterClimbingThrough

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getFirstCharacterClimbingThrough()
  + ### getFirstCharacterClimbingThrough

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getFirstCharacterClimbingThrough([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### getFirstCharacterClosing

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getFirstCharacterClosing()
  + ### getFirstCharacterClosing

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getFirstCharacterClosing([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### isGlassRemoved

    public boolean isGlassRemoved()
  + ### setGlassRemoved

    public void setGlassRemoved(boolean removed)
  + ### removeBrokenGlass

    public void removeBrokenGlass()
  + ### addBarricadesDebug

    public [IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") addBarricadesDebug(int numPlanks,
    boolean metal)
  + ### addRandomBarricades

    public void addRandomBarricades()
  + ### getHealth

    public int getHealth()
  + ### IsOpen

    public boolean IsOpen()
  + ### isNorth

    public boolean isNorth()
  + ### onMouseLeftClick

    public boolean onMouseLeftClick(int x,
    int y)

    Overrides:
    :   `onMouseLeftClick` in class `IsoObject`
  + ### canAttackBypassIsoBarricade

    public boolean canAttackBypassIsoBarricade([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon)
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `IsoObject`
  + ### resetCurrentCellWindows

    public static void resetCurrentCellWindows()