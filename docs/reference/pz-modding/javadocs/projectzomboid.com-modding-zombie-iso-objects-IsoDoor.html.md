[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoDoor](IsoDoor.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [BREAK\_SOUND\_RADIUS](#BREAK_SOUND_RADIUS)
   2. [health](#health)
   3. [lockedByKey](#lockedByKey)
   4. [haveKey](#haveKey)
   5. [locked](#locked)
   6. [maxHealth](#maxHealth)
   7. [pushedMaxStrength](#pushedMaxStrength)
   8. [pushedStrength](#pushedStrength)
   9. [type](#type)
   10. [closedSprite](#closedSprite)
   11. [north](#north)
   12. [gid](#gid)
   13. [open](#open)
   14. [openSprite](#openSprite)
   15. [destroyed](#destroyed)
   16. [hasCurtain](#hasCurtain)
   17. [curtainInside](#curtainInside)
   18. [curtainOpen](#curtainOpen)
   19. [curtainColor](#curtainColor)
   20. [lastPlayerOnlineId](#lastPlayerOnlineId)
   21. [wasTryingToggleLockedDoor](#wasTryingToggleLockedDoor)
   22. [wasTryingToggleBarricadedDoor](#wasTryingToggleBarricadedDoor)
   23. [stCol](#stCol)
   24. [table](#table)
   25. [tempo](#tempo)
   26. [curtainN](#curtainN)
   27. [curtainS](#curtainS)
   28. [curtainW](#curtainW)
   29. [curtainE](#curtainE)
   30. [curtainNopen](#curtainNopen)
   31. [curtainSopen](#curtainSopen)
   32. [curtainWopen](#curtainWopen)
   33. [curtainEopen](#curtainEopen)
   34. [DoubleDoorNorthSpriteOffset](#DoubleDoorNorthSpriteOffset)
   35. [DoubleDoorWestSpriteOffset](#DoubleDoorWestSpriteOffset)
   36. [DoubleDoorNorthClosedXOffset](#DoubleDoorNorthClosedXOffset)
   37. [DoubleDoorNorthOpenXOffset](#DoubleDoorNorthOpenXOffset)
   38. [DoubleDoorNorthClosedYOffset](#DoubleDoorNorthClosedYOffset)
   39. [DoubleDoorNorthOpenYOffset](#DoubleDoorNorthOpenYOffset)
   40. [DoubleDoorWestClosedXOffset](#DoubleDoorWestClosedXOffset)
   41. [DoubleDoorWestOpenXOffset](#DoubleDoorWestOpenXOffset)
   42. [DoubleDoorWestClosedYOffset](#DoubleDoorWestClosedYOffset)
   43. [DoubleDoorWestOpenYOffset](#DoubleDoorWestOpenYOffset)
7. [Constructor Details](#constructor-detail)
   1. [IsoDoor(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoDoor(IsoCell, IsoGridSquare, IsoSprite, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite,boolean))
   3. [IsoDoor(IsoCell, IsoGridSquare, String, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String,boolean))
   4. [IsoDoor(IsoCell, IsoGridSquare, String, boolean, KahluaTable)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String,boolean,se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [getObjectName()](#getObjectName())
   2. [isOpen()](#isOpen())
   3. [setOpen(boolean)](#setOpen(boolean))
   4. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   5. [renderWallTile(IsoDirections, float, float, float, ColorInfo, boolean, boolean, Shader, Consumer)](#renderWallTile(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   6. [initCurtainColor()](#initCurtainColor())
   7. [addToWorld()](#addToWorld())
   8. [removeFromWorld()](#removeFromWorld())
   9. [checkKeyHighlight(int)](#checkKeyHighlight(int))
   10. [prerender(float, float, float, ColorInfo, boolean, boolean, IsoDirections)](#prerender(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.iso.IsoDirections))
   11. [postrender(float, float, float, ColorInfo, boolean, boolean, IsoDirections)](#postrender(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.iso.IsoDirections))
   12. [prerender1xN(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender1xN(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   13. [postrender1xN(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender1xN(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   14. [prerender1xS(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender1xS(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   15. [postrender1xS(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender1xS(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   16. [prerender1xW(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender1xW(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   17. [postrender1xW(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender1xW(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   18. [prerender1xE(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender1xE(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   19. [postrender1xE(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender1xE(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   20. [prerender2xN(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender2xN(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   21. [postrender2xN(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender2xN(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   22. [prerender2xS(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender2xS(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   23. [postrender2xS(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender2xS(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   24. [prerender2xW(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender2xW(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   25. [postrender2xW(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender2xW(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   26. [prerender2xE(float, float, float, ColorInfo, boolean, boolean, Shader)](#prerender2xE(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   27. [postrender2xE(float, float, float, ColorInfo, boolean, boolean, Shader)](#postrender2xE(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   28. [renderCurtainSpriteOrModel(IsoSpriteInstance, float, float, float, IsoDirections, float, float, ColorInfo, boolean)](#renderCurtainSpriteOrModel(zombie.iso.sprite.IsoSpriteInstance,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean))
   29. [renderCurtainModel(IsoSpriteInstance, float, float, float, ColorInfo)](#renderCurtainModel(zombie.iso.sprite.IsoSpriteInstance,float,float,float,zombie.core.textures.ColorInfo))
   30. [getSpriteEdge(boolean)](#getSpriteEdge(boolean))
   31. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   32. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   33. [saveState(ByteBuffer)](#saveState(java.nio.ByteBuffer))
   34. [loadState(ByteBuffer)](#loadState(java.nio.ByteBuffer))
   35. [isDestroyed()](#isDestroyed())
   36. [IsOpen()](#IsOpen())
   37. [IsStrengthenedByPushedItems()](#IsStrengthenedByPushedItems())
   38. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   39. [TestPathfindCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestPathfindCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   40. [TestCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   41. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   42. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   43. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   44. [getThumpCondition()](#getThumpCondition())
   45. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   46. [destroy()](#destroy())
   47. [getOtherSideOfDoor(IsoGameCharacter)](#getOtherSideOfDoor(zombie.characters.IsoGameCharacter))
   48. [isExteriorDoor(IsoGameCharacter)](#isExteriorDoor(zombie.characters.IsoGameCharacter))
   49. [isExterior()](#isExterior())
   50. [isHoppable()](#isHoppable())
   51. [canClimbOver(IsoGameCharacter)](#canClimbOver(zombie.characters.IsoGameCharacter))
   52. [canBeOpenFromInside(IsoGameCharacter)](#canBeOpenFromInside(zombie.characters.IsoGameCharacter))
   53. [couldBeOpen(IsoGameCharacter)](#couldBeOpen(zombie.characters.IsoGameCharacter))
   54. [ToggleDoorActual(IsoGameCharacter)](#ToggleDoorActual(zombie.characters.IsoGameCharacter))
   55. [setWasTryingToggleLockedDoor(boolean)](#setWasTryingToggleLockedDoor(boolean))
   56. [setWasTryingToggleBarricadedDoor(boolean)](#setWasTryingToggleBarricadedDoor(boolean))
   57. [PlayAnimation()](#PlayAnimation())
   58. [TriggerLockedDoor(IsoGameCharacter)](#TriggerLockedDoor(zombie.characters.IsoGameCharacter))
   59. [TriggerBarricadedDoor(IsoGameCharacter)](#TriggerBarricadedDoor(zombie.characters.IsoGameCharacter))
   60. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   61. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   62. [ToggleDoor(IsoGameCharacter)](#ToggleDoor(zombie.characters.IsoGameCharacter))
   63. [ToggleDoorSilent()](#ToggleDoorSilent())
   64. [Damage(int)](#Damage(int))
   65. [getBarricadeOnSameSquare()](#getBarricadeOnSameSquare())
   66. [getBarricadeOnOppositeSquare()](#getBarricadeOnOppositeSquare())
   67. [isBarricaded()](#isBarricaded())
   68. [isBarricadeAllowed()](#isBarricadeAllowed())
   69. [getBarricadeForCharacter(IsoGameCharacter)](#getBarricadeForCharacter(zombie.characters.IsoGameCharacter))
   70. [getBarricadeOppositeCharacter(IsoGameCharacter)](#getBarricadeOppositeCharacter(zombie.characters.IsoGameCharacter))
   71. [isLocked()](#isLocked())
   72. [setLocked(boolean)](#setLocked(boolean))
   73. [getNorth()](#getNorth())
   74. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   75. [getFacingPositionAlt(Vector2)](#getFacingPositionAlt(zombie.iso.Vector2))
   76. [setIsLocked(boolean)](#setIsLocked(boolean))
   77. [getOpenSprite()](#getOpenSprite())
   78. [setOpenSprite(IsoSprite)](#setOpenSprite(zombie.iso.sprite.IsoSprite))
   79. [getKeyId()](#getKeyId())
   80. [isLockedByKey()](#isLockedByKey())
   81. [setLockedByKey(boolean)](#setLockedByKey(boolean))
   82. [setLockedByKey(boolean, boolean)](#setLockedByKey(boolean,boolean))
   83. [haveKey()](#haveKey())
   84. [setHaveKey(boolean)](#setHaveKey(boolean))
   85. [getOppositeSquare()](#getOppositeSquare())
   86. [isAdjacentToSquare(IsoGridSquare)](#isAdjacentToSquare(zombie.iso.IsoGridSquare))
   87. [checkKeyId()](#checkKeyId())
   88. [setHealth(int)](#setHealth(int))
   89. [initCurtainSprites()](#initCurtainSprites())
   90. [canAddCurtain()](#canAddCurtain())
   91. [HasCurtains()](#HasCurtains())
   92. [isCurtainOpen()](#isCurtainOpen())
   93. [setCurtainOpen(boolean)](#setCurtainOpen(boolean))
   94. [transmitSetCurtainOpen(boolean)](#transmitSetCurtainOpen(boolean))
   95. [toggleCurtain()](#toggleCurtain())
   96. [addSheet(IsoGameCharacter)](#addSheet(zombie.characters.IsoGameCharacter))
   97. [addSheet(boolean, IsoGameCharacter)](#addSheet(boolean,zombie.characters.IsoGameCharacter))
   98. [removeSheet(IsoGameCharacter)](#removeSheet(zombie.characters.IsoGameCharacter))
   99. [getAddSheetSquare(IsoGameCharacter)](#getAddSheetSquare(zombie.characters.IsoGameCharacter))
   100. [getSheetSquare()](#getSheetSquare())
   101. [getHealth()](#getHealth())
   102. [getMaxHealth()](#getMaxHealth())
   103. [isFacingSheet(IsoGameCharacter)](#isFacingSheet(zombie.characters.IsoGameCharacter))
   104. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   105. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   106. [addRandomBarricades()](#addRandomBarricades())
   107. [isObstructed()](#isObstructed())
   108. [isDoorObstructed(IsoObject)](#isDoorObstructed(zombie.iso.IsoObject))
   109. [toggleDoubleDoor(IsoObject, boolean)](#toggleDoubleDoor(zombie.iso.IsoObject,boolean))
   110. [toggleDoubleDoorObject(IsoObject)](#toggleDoubleDoorObject(zombie.iso.IsoObject))
   111. [getDoubleDoorIndex(IsoObject)](#getDoubleDoorIndex(zombie.iso.IsoObject))
   112. [getDoubleDoorObject(IsoObject, int)](#getDoubleDoorObject(zombie.iso.IsoObject,int))
   113. [getDoubleDoorPartnerIndex(int)](#getDoubleDoorPartnerIndex(int))
   114. [isDoubleDoorObstructed(IsoObject)](#isDoubleDoorObstructed(zombie.iso.IsoObject))
   115. [hasSolidObjects(IsoGridSquare)](#hasSolidObjects(zombie.iso.IsoGridSquare))
   116. [isSomethingTo(IsoGridSquare, IsoGridSquare)](#isSomethingTo(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   117. [hasSomething4x4(int, int, int, int, int)](#hasSomething4x4(int,int,int,int,int))
   118. [destroyDoubleDoor(IsoObject)](#destroyDoubleDoor(zombie.iso.IsoObject))
   119. [getGarageDoorIndex(IsoObject)](#getGarageDoorIndex(zombie.iso.IsoObject))
   120. [getGarageDoorPrev(IsoObject)](#getGarageDoorPrev(zombie.iso.IsoObject))
   121. [getGarageDoorNext(IsoObject)](#getGarageDoorNext(zombie.iso.IsoObject))
   122. [getGarageDoorFirst(IsoObject)](#getGarageDoorFirst(zombie.iso.IsoObject))
   123. [changeSprite(IsoDoor)](#changeSprite(zombie.iso.objects.IsoDoor))
   124. [toggleGarageDoorObject(IsoObject)](#toggleGarageDoorObject(zombie.iso.IsoObject))
   125. [toggleGarageDoor(IsoObject, boolean)](#toggleGarageDoor(zombie.iso.IsoObject,boolean))
   126. [isGarageDoorObstructed(IsoObject)](#isGarageDoorObstructed(zombie.iso.IsoObject))
   127. [destroyGarageDoor(IsoObject)](#destroyGarageDoor(zombie.iso.IsoObject))
   128. [getRenderEffectMaster()](#getRenderEffectMaster())
   129. [getRenderEffectObjectCount()](#getRenderEffectObjectCount())
   130. [getRenderEffectObjectByIndex(int)](#getRenderEffectObjectByIndex(int))
   131. [getThumpSound()](#getThumpSound())
   132. [getSoundPrefix()](#getSoundPrefix())
   133. [playDoorSound(BaseCharacterSoundEmitter, String)](#playDoorSound(zombie.characters.BaseCharacterSoundEmitter,java.lang.String))
   134. [getSpriteModel()](#getSpriteModel())
   135. [forEachDoorObject(Consumer)](#forEachDoorObject(java.util.function.Consumer))
   136. [forEachDoorObject(IsoObject, Consumer)](#forEachDoorObject(zombie.iso.IsoObject,java.util.function.Consumer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoDoor
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoDoor

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.ICurtain, zombie.iso.IHasHealth, zombie.iso.ILockableDoor, ILuaIsoObject, zombie.iso.IsoRenderable, BarricadeAble, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoDoor
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.objects.interfaces.Thumpable, zombie.iso.IHasHealth, zombie.iso.ILockableDoor, zombie.iso.ICurtain

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoDoor)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `IsoDoor.DoorType`

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `BREAK_SOUND_RADIUS`

  `private IsoSprite`

  `closedSprite`

  `private static final ColorInfo`

  `curtainColor`

  `private IsoSpriteInstance`

  `curtainE`

  `private IsoSpriteInstance`

  `curtainEopen`

  `private boolean`

  `curtainInside`

  `private IsoSpriteInstance`

  `curtainN`

  `private IsoSpriteInstance`

  `curtainNopen`

  `private boolean`

  `curtainOpen`

  `private IsoSpriteInstance`

  `curtainS`

  `private IsoSpriteInstance`

  `curtainSopen`

  `private IsoSpriteInstance`

  `curtainW`

  `private IsoSpriteInstance`

  `curtainWopen`

  `private boolean`

  `destroyed`

  `private static final int[]`

  `DoubleDoorNorthClosedXOffset`

  `private static final int[]`

  `DoubleDoorNorthClosedYOffset`

  `private static final int[]`

  `DoubleDoorNorthOpenXOffset`

  `private static final int[]`

  `DoubleDoorNorthOpenYOffset`

  `private static final int[]`

  `DoubleDoorNorthSpriteOffset`

  `private static final int[]`

  `DoubleDoorWestClosedXOffset`

  `private static final int[]`

  `DoubleDoorWestClosedYOffset`

  `private static final int[]`

  `DoubleDoorWestOpenXOffset`

  `private static final int[]`

  `DoubleDoorWestOpenYOffset`

  `private static final int[]`

  `DoubleDoorWestSpriteOffset`

  `(package private) int`

  `gid`

  `private boolean`

  `hasCurtain`

  `private boolean`

  `haveKey`

  `int`

  `health`

  `private short`

  `lastPlayerOnlineId`

  `boolean`

  `locked`

  `boolean`

  `lockedByKey`

  `int`

  `maxHealth`

  `boolean`

  `north`

  `private boolean`

  `open`

  `private IsoSprite`

  `openSprite`

  `int`

  `pushedMaxStrength`

  `int`

  `pushedStrength`

  `private static final ColorInfo`

  `stCol`

  `(package private) se.krka.kahlua.vm.KahluaTable`

  `table`

  `static final Vector2`

  `tempo`

  `IsoDoor.DoorType`

  `type`

  `private boolean`

  `wasTryingToggleBarricadedDoor`

  `private boolean`

  `wasTryingToggleLockedDoor`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoDoor(IsoCell cell)`

  `IsoDoor(IsoCell cell,
  IsoGridSquare gridSquare,
  String gid,
  boolean north)`

  `IsoDoor(IsoCell cell,
  IsoGridSquare gridSquare,
  String gid,
  boolean north,
  se.krka.kahlua.vm.KahluaTable table)`

  `IsoDoor(IsoCell cell,
  IsoGridSquare gridSquare,
  IsoSprite gid,
  boolean north)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRandomBarricades()`

  `void`

  `addSheet(boolean inside,
  IsoGameCharacter chr)`

  `void`

  `addSheet(IsoGameCharacter chr)`

  `void`

  `addToWorld()`

  `boolean`

  `canAddCurtain()`

  `private boolean`

  `canBeOpenFromInside(IsoGameCharacter chr)`

  `boolean`

  `canClimbOver(IsoGameCharacter chr)`

  `void`

  `changeSprite(IsoDoor door)`

  `void`

  `checkKeyHighlight(int playerIndex)`

  `int`

  `checkKeyId()`

  `boolean`

  `couldBeOpen(IsoGameCharacter chr)`

  `(package private) void`

  `Damage(int amount)`

  `void`

  `destroy()`

  `static boolean`

  `destroyDoubleDoor(IsoObject oneOfFour)`

  `static boolean`

  `destroyGarageDoor(IsoObject oneOfThree)`

  `void`

  `forEachDoorObject(Consumer<IsoDoor> consumer)`

  `static void`

  `forEachDoorObject(IsoObject object,
  Consumer<IsoObject> consumer)`

  `IsoGridSquare`

  `getAddSheetSquare(IsoGameCharacter chr)`

  Returns the square the player should stand on to add a sheet.

  `IsoBarricade`

  `getBarricadeForCharacter(IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeOnOppositeSquare()`

  `IsoBarricade`

  `getBarricadeOnSameSquare()`

  `IsoBarricade`

  `getBarricadeOppositeCharacter(IsoGameCharacter chr)`

  `static int`

  `getDoubleDoorIndex(IsoObject oneOfFour)`

  `static IsoObject`

  `getDoubleDoorObject(IsoObject oneOfFour,
  int index)`

  `static int`

  `getDoubleDoorPartnerIndex(int ddIndex)`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `Vector2`

  `getFacingPositionAlt(Vector2 pos)`

  `static IsoObject`

  `getGarageDoorFirst(IsoObject oneOfThree)`

  `static int`

  `getGarageDoorIndex(IsoObject oneOfThree)`

  `static IsoObject`

  `getGarageDoorNext(IsoObject oneOfThree)`

  `static IsoObject`

  `getGarageDoorPrev(IsoObject oneOfThree)`

  `int`

  `getHealth()`

  `int`

  `getKeyId()`

  `int`

  `getMaxHealth()`

  `boolean`

  `getNorth()`

  `String`

  `getObjectName()`

  `IsoSprite`

  `getOpenSprite()`

  `IsoGridSquare`

  `getOppositeSquare()`

  `IsoGridSquare`

  `getOtherSideOfDoor(IsoGameCharacter chr)`

  `IsoObject`

  `getRenderEffectMaster()`

  `IsoObject`

  `getRenderEffectObjectByIndex(int index)`

  `int`

  `getRenderEffectObjectCount()`

  `IsoGridSquare`

  `getSheetSquare()`

  Returns the square the player should stand on to open/close/remove a sheet.

  `String`

  `getSoundPrefix()`

  `IsoDirections`

  `getSpriteEdge(boolean ignoreOpen)`

  `SpriteModel`

  `getSpriteModel()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `float`

  `getThumpCondition()`

  `String`

  `getThumpSound()`

  `IsoDoor`

  `HasCurtains()`

  `private static boolean`

  `hasSolidObjects(IsoGridSquare square1)`

  `private static boolean`

  `hasSomething4x4(int x1,
  int y1,
  int x2,
  int y2,
  int z)`

  `boolean`

  `haveKey()`

  `private ColorInfo`

  `initCurtainColor()`

  `private void`

  `initCurtainSprites()`

  `boolean`

  `isAdjacentToSquare(IsoGridSquare square2)`

  `boolean`

  `isBarricadeAllowed()`

  `boolean`

  `isBarricaded()`

  `boolean`

  `isCurtainOpen()`

  `boolean`

  `isDestroyed()`

  `static boolean`

  `isDoorObstructed(IsoObject object)`

  `static boolean`

  `isDoubleDoorObstructed(IsoObject oneOfFour)`

  `boolean`

  `isExterior()`

  `boolean`

  `isExteriorDoor(IsoGameCharacter chr)`

  Deprecated.

  `boolean`

  `isFacingSheet(IsoGameCharacter chr)`

  `private static boolean`

  `isGarageDoorObstructed(IsoObject oneOfThree)`

  `boolean`

  `isHoppable()`

  `boolean`

  `isLocked()`

  `boolean`

  `isLockedByKey()`

  `boolean`

  `isObstructed()`

  `boolean`

  `isOpen()`

  `boolean`

  `IsOpen()`

  `private static boolean`

  `isSomethingTo(IsoGridSquare square1,
  IsoGridSquare square2)`

  `boolean`

  `IsStrengthenedByPushedItems()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `loadState(ByteBuffer bb)`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `private void`

  `PlayAnimation()`

  `private void`

  `playDoorSound(BaseCharacterSoundEmitter emitter,
  String suffix)`

  `private void`

  `postrender(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  IsoDirections edge)`

  `private void`

  `postrender1xE(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender1xN(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender1xS(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender1xW(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender2xE(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender2xN(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender2xS(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `postrender2xW(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  IsoDirections edge)`

  `private void`

  `prerender1xE(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender1xN(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender1xS(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender1xW(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender2xE(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender2xN(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender2xS(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `private void`

  `prerender2xW(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeSheet(IsoGameCharacter chr)`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo info,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `private boolean`

  `renderCurtainModel(IsoSpriteInstance spriteInstance,
  float x,
  float y,
  float z,
  ColorInfo col)`

  `private void`

  `renderCurtainSpriteOrModel(IsoSpriteInstance spriteInstance,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo col,
  boolean bDoRenderPrep)`

  `void`

  `renderWallTile(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `saveState(ByteBuffer bb)`

  `void`

  `setCurtainOpen(boolean open)`

  `void`

  `setHaveKey(boolean haveKey)`

  `void`

  `setHealth(int health)`

  `void`

  `setIsLocked(boolean lock)`

  `void`

  `setLocked(boolean bLocked)`

  `void`

  `setLockedByKey(boolean lockedByKey)`

  `void`

  `setLockedByKey(boolean lockedByKey,
  boolean doSync)`

  `void`

  `setOpen(boolean open)`

  `void`

  `setOpenSprite(IsoSprite sprite)`

  `private void`

  `setWasTryingToggleBarricadedDoor(boolean b)`

  `private void`

  `setWasTryingToggleLockedDoor(boolean b)`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `boolean`

  `TestCollide(IsoMovingObject obj,
  IsoGridSquare from,
  IsoGridSquare to)`

  `boolean`

  `TestPathfindCollide(IsoMovingObject obj,
  IsoGridSquare from,
  IsoGridSquare to)`

  `IsoObject.VisionResult`

  `TestVision(IsoGridSquare from,
  IsoGridSquare to)`

  `void`

  `Thump(IsoMovingObject thumper,
  int thumpEventCount)`

  `void`

  `toggleCurtain()`

  `void`

  `ToggleDoor(IsoGameCharacter chr)`

  `void`

  `ToggleDoorActual(IsoGameCharacter chr)`

  `void`

  `ToggleDoorSilent()`

  `static void`

  `toggleDoubleDoor(IsoObject oneOfFour,
  boolean doSync)`

  `private static void`

  `toggleDoubleDoorObject(IsoObject oneOfFour)`

  `static void`

  `toggleGarageDoor(IsoObject oneOfThree,
  boolean doSync)`

  `private static void`

  `toggleGarageDoorObject(IsoObject oneOfThree)`

  `void`

  `transmitSetCurtainOpen(boolean open)`

  `private void`

  `TriggerBarricadedDoor(IsoGameCharacter chr)`

  `private void`

  `TriggerLockedDoor(IsoGameCharacter chr)`

  `void`

  `WeaponHit(IsoGameCharacter owner,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObjectReceive, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, update, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [BarricadeAble](interfaces/BarricadeAble.html#method-summary "interface in zombie.iso.objects.interfaces")

  `addBarricadesFromCraftRecipe, getSquare`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface zombie.iso.ILockableDoor

  `setKeyId`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `getThumpableFor, Thump`

* Field Details
  -------------

  + ### BREAK\_SOUND\_RADIUS

    public static final int BREAK\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDoor.BREAK_SOUND_RADIUS)
  + ### health

    public int health
  + ### lockedByKey

    public boolean lockedByKey
  + ### haveKey

    private boolean haveKey
  + ### locked

    public boolean locked
  + ### maxHealth

    public int maxHealth
  + ### pushedMaxStrength

    public int pushedMaxStrength
  + ### pushedStrength

    public int pushedStrength
  + ### type

    public [IsoDoor.DoorType](IsoDoor.DoorType.html "enum class in zombie.iso.objects") type
  + ### closedSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") closedSprite
  + ### north

    public boolean north
  + ### gid

    int gid
  + ### open

    private boolean open
  + ### openSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") openSprite
  + ### destroyed

    private boolean destroyed
  + ### hasCurtain

    private boolean hasCurtain
  + ### curtainInside

    private boolean curtainInside
  + ### curtainOpen

    private boolean curtainOpen
  + ### curtainColor

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") curtainColor
  + ### lastPlayerOnlineId

    private short lastPlayerOnlineId
  + ### wasTryingToggleLockedDoor

    private boolean wasTryingToggleLockedDoor
  + ### wasTryingToggleBarricadedDoor

    private boolean wasTryingToggleBarricadedDoor
  + ### stCol

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") stCol
  + ### table

    se.krka.kahlua.vm.KahluaTable table
  + ### tempo

    public static final [Vector2](../Vector2.html "class in zombie.iso") tempo
  + ### curtainN

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainN
  + ### curtainS

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainS
  + ### curtainW

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainW
  + ### curtainE

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainE
  + ### curtainNopen

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainNopen
  + ### curtainSopen

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainSopen
  + ### curtainWopen

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainWopen
  + ### curtainEopen

    private [IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") curtainEopen
  + ### DoubleDoorNorthSpriteOffset

    private static final int[] DoubleDoorNorthSpriteOffset
  + ### DoubleDoorWestSpriteOffset

    private static final int[] DoubleDoorWestSpriteOffset
  + ### DoubleDoorNorthClosedXOffset

    private static final int[] DoubleDoorNorthClosedXOffset
  + ### DoubleDoorNorthOpenXOffset

    private static final int[] DoubleDoorNorthOpenXOffset
  + ### DoubleDoorNorthClosedYOffset

    private static final int[] DoubleDoorNorthClosedYOffset
  + ### DoubleDoorNorthOpenYOffset

    private static final int[] DoubleDoorNorthOpenYOffset
  + ### DoubleDoorWestClosedXOffset

    private static final int[] DoubleDoorWestClosedXOffset
  + ### DoubleDoorWestOpenXOffset

    private static final int[] DoubleDoorWestOpenXOffset
  + ### DoubleDoorWestClosedYOffset

    private static final int[] DoubleDoorWestClosedYOffset
  + ### DoubleDoorWestOpenYOffset

    private static final int[] DoubleDoorWestOpenYOffset
* Constructor Details
  -------------------

  + ### IsoDoor

    public IsoDoor([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoDoor

    public IsoDoor([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") gid,
    boolean north)
  + ### IsoDoor

    public IsoDoor([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gid,
    boolean north)
  + ### IsoDoor

    public IsoDoor([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gid,
    boolean north,
    se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### isOpen

    public boolean isOpen()
  + ### setOpen

    public void setOpen(boolean open)
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
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
  + ### renderWallTile

    public void renderWallTile([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)

    Overrides:
    :   `renderWallTile` in class `IsoObject`
  + ### initCurtainColor

    private [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") initCurtainColor()
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
  + ### checkKeyHighlight

    public void checkKeyHighlight(int playerIndex)
  + ### prerender

    private void prerender(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") edge)
  + ### postrender

    private void postrender(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") edge)
  + ### prerender1xN

    private void prerender1xN(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender1xN

    private void postrender1xN(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender1xS

    private void prerender1xS(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender1xS

    private void postrender1xS(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender1xW

    private void prerender1xW(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender1xW

    private void postrender1xW(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender1xE

    private void prerender1xE(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender1xE

    private void postrender1xE(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender2xN

    private void prerender2xN(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender2xN

    private void postrender2xN(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender2xS

    private void prerender2xS(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender2xS

    private void postrender2xS(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender2xW

    private void prerender2xW(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender2xW

    private void postrender2xW(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### prerender2xE

    private void prerender2xE(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### postrender2xE

    private void postrender2xE(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)
  + ### renderCurtainSpriteOrModel

    private void renderCurtainSpriteOrModel([IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") spriteInstance,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoRenderPrep)
  + ### renderCurtainModel

    private boolean renderCurtainModel([IsoSpriteInstance](../sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") spriteInstance,
    float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### getSpriteEdge

    public [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getSpriteEdge(boolean ignoreOpen)
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
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `isDestroyed` in class `IsoObject`
  + ### IsOpen

    public boolean IsOpen()

    Specified by:
    :   `IsOpen` in interface `zombie.iso.ILockableDoor`
  + ### IsStrengthenedByPushedItems

    public boolean IsStrengthenedByPushedItems()
  + ### onMouseLeftClick

    public boolean onMouseLeftClick(int x,
    int y)

    Overrides:
    :   `onMouseLeftClick` in class `IsoObject`
  + ### TestPathfindCollide

    public boolean TestPathfindCollide([IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") to)

    Overrides:
    :   `TestPathfindCollide` in class `IsoObject`
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
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpCondition` in class `IsoObject`
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
  + ### destroy

    public void destroy()
  + ### getOtherSideOfDoor

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOtherSideOfDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isExteriorDoor

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isExteriorDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Deprecated.
  + ### isExterior

    public boolean isExterior()
  + ### isHoppable

    public boolean isHoppable()

    Overrides:
    :   `isHoppable` in class `IsoObject`
  + ### canClimbOver

    public boolean canClimbOver([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `canClimbOver` in interface `zombie.iso.ILockableDoor`
  + ### canBeOpenFromInside

    private boolean canBeOpenFromInside([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### couldBeOpen

    public boolean couldBeOpen([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `couldBeOpen` in interface `zombie.iso.ILockableDoor`
  + ### ToggleDoorActual

    public void ToggleDoorActual([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### setWasTryingToggleLockedDoor

    private void setWasTryingToggleLockedDoor(boolean b)
  + ### setWasTryingToggleBarricadedDoor

    private void setWasTryingToggleBarricadedDoor(boolean b)
  + ### PlayAnimation

    private void PlayAnimation()
  + ### TriggerLockedDoor

    private void TriggerLockedDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### TriggerBarricadedDoor

    private void TriggerBarricadedDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
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
  + ### ToggleDoor

    public void ToggleDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### ToggleDoorSilent

    public void ToggleDoorSilent()
  + ### Damage

    void Damage(int amount)
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
  + ### isLocked

    public boolean isLocked()
  + ### setLocked

    public void setLocked(boolean bLocked)
  + ### getNorth

    public boolean getNorth()

    Specified by:
    :   `getNorth` in interface `BarricadeAble`
  + ### getFacingPosition

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPosition([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
  + ### getFacingPositionAlt

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPositionAlt([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPositionAlt` in class `IsoObject`
  + ### setIsLocked

    public void setIsLocked(boolean lock)
  + ### getOpenSprite

    public [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") getOpenSprite()
  + ### setOpenSprite

    public void setOpenSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getKeyId

    public int getKeyId()

    Specified by:
    :   `getKeyId` in interface `zombie.iso.ILockableDoor`

    Overrides:
    :   `getKeyId` in class `IsoObject`
  + ### isLockedByKey

    public boolean isLockedByKey()

    Specified by:
    :   `isLockedByKey` in interface `zombie.iso.ILockableDoor`
  + ### setLockedByKey

    public void setLockedByKey(boolean lockedByKey)

    Specified by:
    :   `setLockedByKey` in interface `zombie.iso.ILockableDoor`
  + ### setLockedByKey

    public void setLockedByKey(boolean lockedByKey,
    boolean doSync)
  + ### haveKey

    public boolean haveKey()
  + ### setHaveKey

    public void setHaveKey(boolean haveKey)
  + ### getOppositeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOppositeSquare()

    Specified by:
    :   `getOppositeSquare` in interface `BarricadeAble`
  + ### isAdjacentToSquare

    public boolean isAdjacentToSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square2)
  + ### checkKeyId

    public int checkKeyId()
  + ### setHealth

    public void setHealth(int health)

    Specified by:
    :   `setHealth` in interface `zombie.iso.IHasHealth`
  + ### initCurtainSprites

    private void initCurtainSprites()
  + ### canAddCurtain

    public boolean canAddCurtain()

    Specified by:
    :   `canAddCurtain` in interface `zombie.iso.ILockableDoor`
  + ### HasCurtains

    public [IsoDoor](IsoDoor.html "class in zombie.iso.objects") HasCurtains()

    Specified by:
    :   `HasCurtains` in interface `zombie.iso.ILockableDoor`
  + ### isCurtainOpen

    public boolean isCurtainOpen()

    Specified by:
    :   `isCurtainOpen` in interface `zombie.iso.ICurtain`
  + ### setCurtainOpen

    public void setCurtainOpen(boolean open)
  + ### transmitSetCurtainOpen

    public void transmitSetCurtainOpen(boolean open)
  + ### toggleCurtain

    public void toggleCurtain()
  + ### addSheet

    public void addSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addSheet

    public void addSheet(boolean inside,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### removeSheet

    public void removeSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getAddSheetSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getAddSheetSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Returns the square the player should stand on to add a sheet.
  + ### getSheetSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getSheetSquare()

    Returns the square the player should stand on to open/close/remove a sheet.
  + ### getHealth

    public int getHealth()

    Specified by:
    :   `getHealth` in interface `zombie.iso.IHasHealth`
  + ### getMaxHealth

    public int getMaxHealth()

    Specified by:
    :   `getMaxHealth` in interface `zombie.iso.IHasHealth`
  + ### isFacingSheet

    public boolean isFacingSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
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
  + ### addRandomBarricades

    public void addRandomBarricades()
  + ### isObstructed

    public boolean isObstructed()
  + ### isDoorObstructed

    public static boolean isDoorObstructed([IsoObject](../IsoObject.html "class in zombie.iso") object)
  + ### toggleDoubleDoor

    public static void toggleDoubleDoor([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour,
    boolean doSync)
  + ### toggleDoubleDoorObject

    private static void toggleDoubleDoorObject([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour)
  + ### getDoubleDoorIndex

    public static int getDoubleDoorIndex([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour)
  + ### getDoubleDoorObject

    public static [IsoObject](../IsoObject.html "class in zombie.iso") getDoubleDoorObject([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour,
    int index)
  + ### getDoubleDoorPartnerIndex

    public static int getDoubleDoorPartnerIndex(int ddIndex)
  + ### isDoubleDoorObstructed

    public static boolean isDoubleDoorObstructed([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour)
  + ### hasSolidObjects

    private static boolean hasSolidObjects([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square1)
  + ### isSomethingTo

    private static boolean isSomethingTo([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square1,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square2)
  + ### hasSomething4x4

    private static boolean hasSomething4x4(int x1,
    int y1,
    int x2,
    int y2,
    int z)
  + ### destroyDoubleDoor

    public static boolean destroyDoubleDoor([IsoObject](../IsoObject.html "class in zombie.iso") oneOfFour)
  + ### getGarageDoorIndex

    public static int getGarageDoorIndex([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### getGarageDoorPrev

    public static [IsoObject](../IsoObject.html "class in zombie.iso") getGarageDoorPrev([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### getGarageDoorNext

    public static [IsoObject](../IsoObject.html "class in zombie.iso") getGarageDoorNext([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### getGarageDoorFirst

    public static [IsoObject](../IsoObject.html "class in zombie.iso") getGarageDoorFirst([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### changeSprite

    public void changeSprite([IsoDoor](IsoDoor.html "class in zombie.iso.objects") door)
  + ### toggleGarageDoorObject

    private static void toggleGarageDoorObject([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### toggleGarageDoor

    public static void toggleGarageDoor([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree,
    boolean doSync)
  + ### isGarageDoorObstructed

    private static boolean isGarageDoorObstructed([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### destroyGarageDoor

    public static boolean destroyGarageDoor([IsoObject](../IsoObject.html "class in zombie.iso") oneOfThree)
  + ### getRenderEffectMaster

    public [IsoObject](../IsoObject.html "class in zombie.iso") getRenderEffectMaster()

    Overrides:
    :   `getRenderEffectMaster` in class `IsoObject`
  + ### getRenderEffectObjectCount

    public int getRenderEffectObjectCount()

    Overrides:
    :   `getRenderEffectObjectCount` in class `IsoObject`
  + ### getRenderEffectObjectByIndex

    public [IsoObject](../IsoObject.html "class in zombie.iso") getRenderEffectObjectByIndex(int index)

    Overrides:
    :   `getRenderEffectObjectByIndex` in class `IsoObject`
  + ### getThumpSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getThumpSound()
  + ### getSoundPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundPrefix()
  + ### playDoorSound

    private void playDoorSound([BaseCharacterSoundEmitter](../../characters/BaseCharacterSoundEmitter.html "class in zombie.characters") emitter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### getSpriteModel

    public [SpriteModel](../SpriteModel.html "class in zombie.iso") getSpriteModel()

    Overrides:
    :   `getSpriteModel` in class `IsoObject`
  + ### forEachDoorObject

    public void forEachDoorObject([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[IsoDoor](IsoDoor.html "class in zombie.iso.objects")> consumer)
  + ### forEachDoorObject

    public static void forEachDoorObject([IsoObject](../IsoObject.html "class in zombie.iso") object,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[IsoObject](../IsoObject.html "class in zombie.iso")> consumer)