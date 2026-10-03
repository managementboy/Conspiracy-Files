[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoThumpable](IsoThumpable.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [BREAK\_SOUND\_RADIUS](#BREAK_SOUND_RADIUS)
   2. [BUILD\_MATERIAL\_PREFIX](#BUILD_MATERIAL_PREFIX)
   3. [table](#table)
   4. [modData](#modData)
   5. [buildMaterials](#buildMaterials)
   6. [isDoor](#isDoor)
   7. [isDoorFrame](#isDoorFrame)
   8. [DEFAULT\_BREAK\_SOUND](#DEFAULT_BREAK_SOUND)
   9. [breakSound](#breakSound)
   10. [isCorner](#isCorner)
   11. [isFloor](#isFloor)
   12. [blockAllTheSquare](#blockAllTheSquare)
   13. [locked](#locked)
   14. [maxHealth](#maxHealth)
   15. [health](#health)
   16. [pushedMaxStrength](#pushedMaxStrength)
   17. [pushedStrength](#pushedStrength)
   18. [closedSprite](#closedSprite)
   19. [north](#north)
   20. [thumpDmg](#thumpDmg)
   21. [crossSpeed](#crossSpeed)
   22. [open](#open)
   23. [openSprite](#openSprite)
   24. [destroyed](#destroyed)
   25. [canBarricade](#canBarricade)
   26. [canPassThrough](#canPassThrough)
   27. [isStairs](#isStairs)
   28. [isContainer](#isContainer)
   29. [dismantable](#dismantable)
   30. [canBePlastered](#canBePlastered)
   31. [paintable](#paintable)
   32. [isThumpable](#isThumpable)
   33. [isHoppable](#isHoppable)
   34. [lightSourceRadius](#lightSourceRadius)
   35. [lightSourceLife](#lightSourceLife)
   36. [lightSourceXOffset](#lightSourceXOffset)
   37. [lightSourceYOffset](#lightSourceYOffset)
   38. [lightSourceOn](#lightSourceOn)
   39. [lightSource](#lightSource)
   40. [lightSourceFuel](#lightSourceFuel)
   41. [lifeLeft](#lifeLeft)
   42. [lifeDelta](#lifeDelta)
   43. [haveFuel](#haveFuel)
   44. [updateAccumulator](#updateAccumulator)
   45. [lastUpdateHours](#lastUpdateHours)
   46. [keyId](#keyId)
   47. [lockedByKey](#lockedByKey)
   48. [lockedByPadlock](#lockedByPadlock)
   49. [canBeLockByPadlock](#canBeLockByPadlock)
   50. [lockedByCode](#lockedByCode)
   51. [oldNumPlanks](#oldNumPlanks)
   52. [thumpSound](#thumpSound)
   53. [wasTryingToggleLockedDoor](#wasTryingToggleLockedDoor)
   54. [wasTryingToggleBarricadedDoor](#wasTryingToggleBarricadedDoor)
   55. [tempo](#tempo)
   56. [lastPlayerOnlineId](#lastPlayerOnlineId)
7. [Constructor Details](#constructor-detail)
   1. [IsoThumpable(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoThumpable(IsoCell, IsoGridSquare, String, String, boolean, KahluaTable)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String,java.lang.String,boolean,se.krka.kahlua.vm.KahluaTable))
   3. [IsoThumpable(IsoCell, IsoGridSquare, String, boolean, KahluaTable)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String,boolean,se.krka.kahlua.vm.KahluaTable))
   4. [IsoThumpable(IsoCell, IsoGridSquare, String, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getModData()](#getModData())
   2. [setModData(KahluaTable)](#setModData(se.krka.kahlua.vm.KahluaTable))
   3. [hasModData()](#hasModData())
   4. [getBuildMaterials()](#getBuildMaterials())
   5. [hasBuildMaterials()](#hasBuildMaterials())
   6. [isCanPassThrough()](#isCanPassThrough())
   7. [setCanPassThrough(boolean)](#setCanPassThrough(boolean))
   8. [isBlockAllTheSquare()](#isBlockAllTheSquare())
   9. [setBlockAllTheSquare(boolean)](#setBlockAllTheSquare(boolean))
   10. [setIsDismantable(boolean)](#setIsDismantable(boolean))
   11. [isDismantable()](#isDismantable())
   12. [getCrossSpeed()](#getCrossSpeed())
   13. [setCrossSpeed(float)](#setCrossSpeed(float))
   14. [setIsFloor(boolean)](#setIsFloor(boolean))
   15. [isCorner()](#isCorner())
   16. [isFloor()](#isFloor())
   17. [setIsContainer(boolean)](#setIsContainer(boolean))
   18. [setIsStairs(boolean)](#setIsStairs(boolean))
   19. [isStairs()](#isStairs())
   20. [isWindowN()](#isWindowN())
   21. [isWindowW()](#isWindowW())
   22. [getObjectName()](#getObjectName())
   23. [setCorner(boolean)](#setCorner(boolean))
   24. [setCanBarricade(boolean)](#setCanBarricade(boolean))
   25. [getCanBarricade()](#getCanBarricade())
   26. [setHealth(int)](#setHealth(int))
   27. [getHealth()](#getHealth())
   28. [setMaxHealth(int)](#setMaxHealth(int))
   29. [getMaxHealth()](#getMaxHealth())
   30. [setThumpDmg(Integer)](#setThumpDmg(java.lang.Integer))
   31. [getThumpDmg()](#getThumpDmg())
   32. [setBreakSound(String)](#setBreakSound(java.lang.String))
   33. [getBreakSound()](#getBreakSound())
   34. [isDoor()](#isDoor())
   35. [getNorth()](#getNorth())
   36. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   37. [isDoorFrame()](#isDoorFrame())
   38. [setIsDoor(boolean)](#setIsDoor(boolean))
   39. [setIsDoorFrame(boolean)](#setIsDoorFrame(boolean))
   40. [setSprite(String)](#setSprite(java.lang.String))
   41. [setSpriteFromName(String)](#setSpriteFromName(java.lang.String))
   42. [setClosedSprite(IsoSprite)](#setClosedSprite(zombie.iso.sprite.IsoSprite))
   43. [setOpenSprite(IsoSprite)](#setOpenSprite(zombie.iso.sprite.IsoSprite))
   44. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   45. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   46. [isDestroyed()](#isDestroyed())
   47. [IsOpen()](#IsOpen())
   48. [IsStrengthenedByPushedItems()](#IsStrengthenedByPushedItems())
   49. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   50. [TestPathfindCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestPathfindCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   51. [TestCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   52. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   53. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   54. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   55. [getThumpableFor(IsoGameCharacter, HandWeapon)](#getThumpableFor(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   56. [getThumpCondition()](#getThumpCondition())
   57. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   58. [getOtherSideOfDoor(IsoGameCharacter)](#getOtherSideOfDoor(zombie.characters.IsoGameCharacter))
   59. [changeSprite(IsoThumpable)](#changeSprite(zombie.iso.objects.IsoThumpable))
   60. [couldBeOpen(IsoGameCharacter)](#couldBeOpen(zombie.characters.IsoGameCharacter))
   61. [ToggleDoorActual(IsoGameCharacter)](#ToggleDoorActual(zombie.characters.IsoGameCharacter))
   62. [TriggerLockedDoor(IsoGameCharacter)](#TriggerLockedDoor(zombie.characters.IsoGameCharacter))
   63. [TriggerBarricadedDoor(IsoGameCharacter)](#TriggerBarricadedDoor(zombie.characters.IsoGameCharacter))
   64. [PlayAnimation()](#PlayAnimation())
   65. [ToggleDoor(IsoGameCharacter)](#ToggleDoor(zombie.characters.IsoGameCharacter))
   66. [ToggleDoorSilent()](#ToggleDoorSilent())
   67. [isObstructed()](#isObstructed())
   68. [haveSheetRope()](#haveSheetRope())
   69. [countAddSheetRope()](#countAddSheetRope())
   70. [canAddSheetRope()](#canAddSheetRope())
   71. [addSheetRope(IsoPlayer, String)](#addSheetRope(zombie.characters.IsoPlayer,java.lang.String))
   72. [removeSheetRope(IsoPlayer)](#removeSheetRope(zombie.characters.IsoPlayer))
   73. [createLightSource(int, int, int, int, int, String, InventoryItem, IsoGameCharacter)](#createLightSource(int,int,int,int,int,java.lang.String,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   74. [insertNewFuel(InventoryItem, IsoGameCharacter)](#insertNewFuel(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   75. [removeCurrentFuel(IsoGameCharacter)](#removeCurrentFuel(zombie.characters.IsoGameCharacter))
   76. [calcLightSourceX()](#calcLightSourceX())
   77. [calcLightSourceY()](#calcLightSourceY())
   78. [update()](#update())
   79. [Damage(float)](#Damage(float))
   80. [destroy()](#destroy())
   81. [getBarricadeOnSameSquare()](#getBarricadeOnSameSquare())
   82. [getBarricadeOnOppositeSquare()](#getBarricadeOnOppositeSquare())
   83. [isBarricaded()](#isBarricaded())
   84. [isBarricadeAllowed()](#isBarricadeAllowed())
   85. [getBarricadeForCharacter(IsoGameCharacter)](#getBarricadeForCharacter(zombie.characters.IsoGameCharacter))
   86. [getBarricadeOppositeCharacter(IsoGameCharacter)](#getBarricadeOppositeCharacter(zombie.characters.IsoGameCharacter))
   87. [setIsDoor(Boolean)](#setIsDoor(java.lang.Boolean))
   88. [getTable()](#getTable())
   89. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   90. [canBePlastered()](#canBePlastered())
   91. [setCanBePlastered(boolean)](#setCanBePlastered(boolean))
   92. [isPaintable()](#isPaintable())
   93. [setPaintable(boolean)](#setPaintable(boolean))
   94. [isLocked()](#isLocked())
   95. [setIsLocked(boolean)](#setIsLocked(boolean))
   96. [isThumpable()](#isThumpable())
   97. [setIsThumpable(boolean)](#setIsThumpable(boolean))
   98. [setIsHoppable(boolean)](#setIsHoppable(boolean))
   99. [getOpenSprite()](#getOpenSprite())
   100. [isHoppable()](#isHoppable())
   101. [isTallHoppable()](#isTallHoppable())
   102. [setHoppable(boolean)](#setHoppable(boolean))
   103. [getLightSourceRadius()](#getLightSourceRadius())
   104. [setLightSourceRadius(int)](#setLightSourceRadius(int))
   105. [getLightSourceXOffset()](#getLightSourceXOffset())
   106. [setLightSourceXOffset(int)](#setLightSourceXOffset(int))
   107. [getLightSourceYOffset()](#getLightSourceYOffset())
   108. [setLightSourceYOffset(int)](#setLightSourceYOffset(int))
   109. [getLightSourceLife()](#getLightSourceLife())
   110. [setLightSourceLife(int)](#setLightSourceLife(int))
   111. [isLightSourceOn()](#isLightSourceOn())
   112. [setLightSourceOn(boolean)](#setLightSourceOn(boolean))
   113. [getLightSource()](#getLightSource())
   114. [setLightSource(IsoLightSource)](#setLightSource(zombie.iso.IsoLightSource))
   115. [toggleLightSource(boolean)](#toggleLightSource(boolean))
   116. [getLightSourceFuel()](#getLightSourceFuel())
   117. [setLightSourceFuel(String)](#setLightSourceFuel(java.lang.String))
   118. [getLifeLeft()](#getLifeLeft())
   119. [setLifeLeft(float)](#setLifeLeft(float))
   120. [getLifeDelta()](#getLifeDelta())
   121. [setLifeDelta(float)](#setLifeDelta(float))
   122. [haveFuel()](#haveFuel())
   123. [setHaveFuel(boolean)](#setHaveFuel(boolean))
   124. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   125. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   126. [addToWorld()](#addToWorld())
   127. [removeFromWorld()](#removeFromWorld())
   128. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   129. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   130. [HasCurtains()](#HasCurtains())
   131. [canAddCurtain()](#canAddCurtain())
   132. [getInsideSquare()](#getInsideSquare())
   133. [getOppositeSquare()](#getOppositeSquare())
   134. [isAdjacentToSquare(IsoGridSquare)](#isAdjacentToSquare(zombie.iso.IsoGridSquare))
   135. [getAddSheetSquare(IsoGameCharacter)](#getAddSheetSquare(zombie.characters.IsoGameCharacter))
   136. [addSheet(IsoGameCharacter)](#addSheet(zombie.characters.IsoGameCharacter))
   137. [getIndoorSquare()](#getIndoorSquare())
   138. [getKeyId()](#getKeyId())
   139. [setKeyId(int, boolean)](#setKeyId(int,boolean))
   140. [setKeyId(int)](#setKeyId(int))
   141. [isLockedByKey()](#isLockedByKey())
   142. [setLockedByKey(boolean)](#setLockedByKey(boolean))
   143. [setLockedByKey(boolean, boolean)](#setLockedByKey(boolean,boolean))
   144. [isLockedByPadlock()](#isLockedByPadlock())
   145. [syncIsoThumpable()](#syncIsoThumpable())
   146. [setLockedByPadlock(boolean)](#setLockedByPadlock(boolean))
   147. [canBeLockByPadlock()](#canBeLockByPadlock())
   148. [setCanBeLockByPadlock(boolean)](#setCanBeLockByPadlock(boolean))
   149. [getLockedByCode()](#getLockedByCode())
   150. [setLockedByCode(int)](#setLockedByCode(int))
   151. [isLockedToCharacter(IsoGameCharacter)](#isLockedToCharacter(zombie.characters.IsoGameCharacter))
   152. [canClimbOver(IsoGameCharacter)](#canClimbOver(zombie.characters.IsoGameCharacter))
   153. [canClimbThrough(IsoGameCharacter)](#canClimbThrough(zombie.characters.IsoGameCharacter))
   154. [getThumpSound()](#getThumpSound())
   155. [setThumpSound(String)](#setThumpSound(java.lang.String))
   156. [getRenderEffectMaster()](#getRenderEffectMaster())
   157. [getSpriteEdge(boolean)](#getSpriteEdge(boolean))
   158. [getSoundPrefix()](#getSoundPrefix())
   159. [playDoorSound(BaseCharacterSoundEmitter, String)](#playDoorSound(zombie.characters.BaseCharacterSoundEmitter,java.lang.String))
   160. [getMeleeHitSurface()](#getMeleeHitSurface())
   161. [GetBreakFurnitureSound(IsoSprite)](#GetBreakFurnitureSound(zombie.iso.sprite.IsoSprite))
   162. [GetBreakFurnitureSound(String)](#GetBreakFurnitureSound(java.lang.String))
   163. [checkKeyHighlight(int)](#checkKeyHighlight(int))
   164. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   165. [renderWallTile(IsoDirections, float, float, float, ColorInfo, boolean, boolean, Shader, Consumer)](#renderWallTile(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   166. [getSpriteModel()](#getSpriteModel())
   167. [animalHit(IsoAnimal)](#animalHit(zombie.characters.animals.IsoAnimal))
   168. [getClosedSpriteTextureName()](#getClosedSpriteTextureName())
   169. [afterRotated()](#afterRotated())
   170. [forEachDoorObject(Consumer)](#forEachDoorObject(java.util.function.Consumer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoThumpable
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

zombie.iso.objects.IsoThumpable

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, zombie.iso.IHasHealth, zombie.iso.ILockableDoor, ILuaIsoObject, zombie.iso.IsoRenderable, BarricadeAble, zombie.iso.objects.interfaces.Thumpable`

---

public class IsoThumpable
extends [IsoObject](../IsoObject.html "class in zombie.iso")
implements [BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.objects.interfaces.Thumpable, zombie.iso.IHasHealth, zombie.iso.ILockableDoor

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoThumpable)

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

  `private boolean`

  `blockAllTheSquare`

  `static final int`

  `BREAK_SOUND_RADIUS`

  `private String`

  `breakSound`

  `private static final String`

  `BUILD_MATERIAL_PREFIX`

  `private se.krka.kahlua.vm.KahluaTable`

  `buildMaterials`

  `private boolean`

  `canBarricade`

  `private boolean`

  `canBeLockByPadlock`

  `private boolean`

  `canBePlastered`

  `boolean`

  `canPassThrough`

  `protected IsoSprite`

  `closedSprite`

  `private float`

  `crossSpeed`

  `static final SoundKey`

  `DEFAULT_BREAK_SOUND`

  `private boolean`

  `destroyed`

  `private boolean`

  `dismantable`

  `private boolean`

  `haveFuel`

  `int`

  `health`

  `private boolean`

  `isContainer`

  `private boolean`

  `isCorner`

  `private boolean`

  `isDoor`

  `private boolean`

  `isDoorFrame`

  `private boolean`

  `isFloor`

  `private boolean`

  `isHoppable`

  `private boolean`

  `isStairs`

  `private boolean`

  `isThumpable`

  `int`

  `keyId`

  `private short`

  `lastPlayerOnlineId`

  `private float`

  `lastUpdateHours`

  `private float`

  `lifeDelta`

  `private float`

  `lifeLeft`

  `private IsoLightSource`

  `lightSource`

  `private String`

  `lightSourceFuel`

  `private int`

  `lightSourceLife`

  `private boolean`

  `lightSourceOn`

  `private int`

  `lightSourceRadius`

  `private int`

  `lightSourceXOffset`

  `private int`

  `lightSourceYOffset`

  `boolean`

  `locked`

  `int`

  `lockedByCode`

  `private boolean`

  `lockedByKey`

  `boolean`

  `lockedByPadlock`

  `private int`

  `maxHealth`

  `private se.krka.kahlua.vm.KahluaTable`

  `modData`

  `boolean`

  `north`

  `int`

  `oldNumPlanks`

  `boolean`

  `open`

  `IsoSprite`

  `openSprite`

  `private boolean`

  `paintable`

  `int`

  `pushedMaxStrength`

  `int`

  `pushedStrength`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `static final Vector2`

  `tempo`

  `private int`

  `thumpDmg`

  `String`

  `thumpSound`

  `private float`

  `updateAccumulator`

  `private boolean`

  `wasTryingToggleBarricadedDoor`

  `private boolean`

  `wasTryingToggleLockedDoor`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoThumpable(IsoCell cell)`

  `IsoThumpable(IsoCell cell,
  IsoGridSquare gridSquare,
  String sprite,
  boolean north)`

  `IsoThumpable(IsoCell cell,
  IsoGridSquare gridSquare,
  String sprite,
  boolean north,
  se.krka.kahlua.vm.KahluaTable table)`

  Create an object than can be interacted by you, survivor or zombie (destroy, barricade, etc.) This one can be a wall, a fence, etc.

  `IsoThumpable(IsoCell cell,
  IsoGridSquare gridSquare,
  String closedSprite,
  String openSprite,
  boolean north,
  se.krka.kahlua.vm.KahluaTable table)`

  Create an object than can be interacted by you, survivor or zombie (destroy, barricade, etc.) This one have a closed/openSprite so it can be a
  door for example
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSheet(IsoGameCharacter chr)`

  `boolean`

  `addSheetRope(IsoPlayer player,
  String itemType)`

  `void`

  `addToWorld()`

  `void`

  `afterRotated()`

  `void`

  `animalHit(IsoAnimal animal)`

  `private int`

  `calcLightSourceX()`

  `private int`

  `calcLightSourceY()`

  `boolean`

  `canAddCurtain()`

  `boolean`

  `canAddSheetRope()`

  `boolean`

  `canBeLockByPadlock()`

  `boolean`

  `canBePlastered()`

  `boolean`

  `canClimbOver(IsoGameCharacter chr)`

  `boolean`

  `canClimbThrough(IsoGameCharacter chr)`

  `void`

  `changeSprite(IsoThumpable thumpable)`

  `void`

  `checkKeyHighlight(int playerIndex)`

  `boolean`

  `couldBeOpen(IsoGameCharacter chr)`

  `int`

  `countAddSheetRope()`

  `void`

  `createLightSource(int radius,
  int offsetX,
  int offsetY,
  int offsetZ,
  int life,
  String lightSourceFuel,
  InventoryItem baseItem,
  IsoGameCharacter chr)`

  `void`

  `Damage(float amount)`

  `void`

  `destroy()`

  `void`

  `forEachDoorObject(Consumer<IsoThumpable> consumer)`

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

  `static String`

  `GetBreakFurnitureSound(String spriteName)`

  `static String`

  `GetBreakFurnitureSound(IsoSprite sprite)`

  `String`

  `getBreakSound()`

  `se.krka.kahlua.vm.KahluaTable`

  `getBuildMaterials()`

  `boolean`

  `getCanBarricade()`

  `String`

  `getClosedSpriteTextureName()`

  `float`

  `getCrossSpeed()`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `int`

  `getHealth()`

  `IsoGridSquare`

  `getIndoorSquare()`

  `IsoGridSquare`

  `getInsideSquare()`

  `int`

  `getKeyId()`

  `float`

  `getLifeDelta()`

  `float`

  `getLifeLeft()`

  `IsoLightSource`

  `getLightSource()`

  `String`

  `getLightSourceFuel()`

  `int`

  `getLightSourceLife()`

  `int`

  `getLightSourceRadius()`

  `int`

  `getLightSourceXOffset()`

  `int`

  `getLightSourceYOffset()`

  `int`

  `getLockedByCode()`

  `int`

  `getMaxHealth()`

  `private zombie.audio.parameters.ParameterMeleeHitSurface.Material`

  `getMeleeHitSurface()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

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

  `String`

  `getSoundPrefix()`

  `IsoDirections`

  `getSpriteEdge(boolean ignoreOpen)`

  `SpriteModel`

  `getSpriteModel()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr,
  HandWeapon weapon)`

  `float`

  `getThumpCondition()`

  `int`

  `getThumpDmg()`

  `String`

  `getThumpSound()`

  `boolean`

  `hasBuildMaterials()`

  `IsoCurtain`

  `HasCurtains()`

  `boolean`

  `hasModData()`

  `boolean`

  `haveFuel()`

  `boolean`

  `haveSheetRope()`

  `InventoryItem`

  `insertNewFuel(InventoryItem item,
  IsoGameCharacter chr)`

  `boolean`

  `isAdjacentToSquare(IsoGridSquare square2)`

  `boolean`

  `isBarricadeAllowed()`

  `boolean`

  `isBarricaded()`

  `boolean`

  `isBlockAllTheSquare()`

  `boolean`

  `isCanPassThrough()`

  Can you pass through the item, if false we gonna test the collide default to false (so it collide)

  `boolean`

  `isCorner()`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isDismantable()`

  `boolean`

  `isDoor()`

  `boolean`

  `isDoorFrame()`

  `boolean`

  `isFloor()`

  `boolean`

  `isHoppable()`

  `boolean`

  `isLightSourceOn()`

  `boolean`

  `isLocked()`

  `boolean`

  `isLockedByKey()`

  `boolean`

  `isLockedByPadlock()`

  `boolean`

  `isLockedToCharacter(IsoGameCharacter chr)`

  `boolean`

  `isObstructed()`

  `boolean`

  `IsOpen()`

  `boolean`

  `isPaintable()`

  `boolean`

  `isStairs()`

  `boolean`

  `IsStrengthenedByPushedItems()`

  `boolean`

  `isTallHoppable()`

  `boolean`

  `isThumpable()`

  `boolean`

  `isWindowN()`

  `boolean`

  `isWindowW()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `private void`

  `PlayAnimation()`

  `private void`

  `playDoorSound(BaseCharacterSoundEmitter emitter,
  String suffix)`

  `InventoryItem`

  `removeCurrentFuel(IsoGameCharacter chr)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `boolean`

  `removeSheetRope(IsoPlayer player)`

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

  `setBlockAllTheSquare(boolean blockAllTheSquare)`

  `void`

  `setBreakSound(String pBreakSound)`

  The sound that be played if this object is broken default "BreakDoor"

  `void`

  `setCanBarricade(boolean pCanBarricade)`

  `void`

  `setCanBeLockByPadlock(boolean canBeLockByPadlock)`

  `void`

  `setCanBePlastered(boolean canBePlastered)`

  `void`

  `setCanPassThrough(boolean pCanPassThrough)`

  `void`

  `setClosedSprite(IsoSprite sprite)`

  `void`

  `setCorner(boolean pCorner)`

  `void`

  `setCrossSpeed(float pCrossSpeed)`

  `void`

  `setHaveFuel(boolean haveFuel)`

  `void`

  `setHealth(int health)`

  `void`

  `setHoppable(boolean isHoppable)`

  `void`

  `setIsContainer(boolean pIsContainer)`

  `void`

  `setIsDismantable(boolean dismantable)`

  `void`

  `setIsDoor(boolean pIsDoor)`

  `void`

  `setIsDoor(Boolean pIsDoor)`

  `void`

  `setIsDoorFrame(boolean pIsDoorFrame)`

  `void`

  `setIsFloor(boolean pIsFloor)`

  `void`

  `setIsHoppable(boolean isHoppable)`

  `void`

  `setIsLocked(boolean lock)`

  `void`

  `setIsStairs(boolean pStairs)`

  `void`

  `setIsThumpable(boolean thumpable)`

  `void`

  `setKeyId(int keyId)`

  `void`

  `setKeyId(int keyId,
  boolean doNetwork)`

  `void`

  `setLifeDelta(float lifeDelta)`

  `void`

  `setLifeLeft(float lifeLeft)`

  `void`

  `setLightSource(IsoLightSource lightSource)`

  `void`

  `setLightSourceFuel(String lightSourceFuel)`

  `void`

  `setLightSourceLife(int lightSourceLife)`

  `void`

  `setLightSourceOn(boolean lightSourceOn)`

  `void`

  `setLightSourceRadius(int lightSourceRadius)`

  `void`

  `setLightSourceXOffset(int lightSourceXOffset)`

  `void`

  `setLightSourceYOffset(int lightSourceYOffset)`

  `void`

  `setLockedByCode(int lockedByCode)`

  `void`

  `setLockedByKey(boolean lockedByKey)`

  `void`

  `setLockedByKey(boolean lockedByKey,
  boolean doSync)`

  `void`

  `setLockedByPadlock(boolean lockedByPadlock)`

  `void`

  `setMaxHealth(int maxHealth)`

  `void`

  `setModData(se.krka.kahlua.vm.KahluaTable modData)`

  `void`

  `setOpenSprite(IsoSprite sprite)`

  `void`

  `setPaintable(boolean paintable)`

  `void`

  `setSprite(String sprite)`

  `void`

  `setSpriteFromName(String name)`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `setThumpDmg(Integer pThumpDmg)`

  `void`

  `setThumpSound(String thumpSound)`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)`

  `void`

  `syncIsoThumpable()`

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

  `ToggleDoor(IsoGameCharacter chr)`

  `void`

  `ToggleDoorActual(IsoGameCharacter chr)`

  `void`

  `ToggleDoorSilent()`

  `void`

  `toggleLightSource(boolean toggle)`

  `private void`

  `TriggerBarricadedDoor(IsoGameCharacter chr)`

  `private void`

  `TriggerLockedDoor(IsoGameCharacter chr)`

  `void`

  `update()`

  `void`

  `WeaponHit(IsoGameCharacter owner,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getLastRendered, getLastRenderedRendered, getMaskClickedY, getMasterObject, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPosition, getPosition, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteName, getSquare, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTargetAlpha, getTargetAlpha, getTextureName, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, getX, getY, getZ, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isCharacter, isConnectedSpriteGridObject, isEntityValid, isExistInTheWorld, isFascia, isFireInteractionObject, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromSquare, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setLastRendered, setLastRenderedRendered, setLit, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSpriteModelName, setSquare, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, toString, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

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

  + ### BREAK\_SOUND\_RADIUS

    public static final int BREAK\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoThumpable.BREAK_SOUND_RADIUS)
  + ### BUILD\_MATERIAL\_PREFIX

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") BUILD\_MATERIAL\_PREFIX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoThumpable.BUILD_MATERIAL_PREFIX)
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### modData

    private se.krka.kahlua.vm.KahluaTable modData
  + ### buildMaterials

    private se.krka.kahlua.vm.KahluaTable buildMaterials
  + ### isDoor

    private boolean isDoor
  + ### isDoorFrame

    private boolean isDoorFrame
  + ### DEFAULT\_BREAK\_SOUND

    public static final [SoundKey](../../scripting/objects/SoundKey.html "class in zombie.scripting.objects") DEFAULT\_BREAK\_SOUND
  + ### breakSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breakSound
  + ### isCorner

    private boolean isCorner
  + ### isFloor

    private boolean isFloor
  + ### blockAllTheSquare

    private boolean blockAllTheSquare
  + ### locked

    public boolean locked
  + ### maxHealth

    private int maxHealth
  + ### health

    public int health
  + ### pushedMaxStrength

    public int pushedMaxStrength
  + ### pushedStrength

    public int pushedStrength
  + ### closedSprite

    protected [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") closedSprite
  + ### north

    public boolean north
  + ### thumpDmg

    private int thumpDmg
  + ### crossSpeed

    private float crossSpeed
  + ### open

    public boolean open
  + ### openSprite

    public [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") openSprite
  + ### destroyed

    private boolean destroyed
  + ### canBarricade

    private boolean canBarricade
  + ### canPassThrough

    public boolean canPassThrough
  + ### isStairs

    private boolean isStairs
  + ### isContainer

    private boolean isContainer
  + ### dismantable

    private boolean dismantable
  + ### canBePlastered

    private boolean canBePlastered
  + ### paintable

    private boolean paintable
  + ### isThumpable

    private boolean isThumpable
  + ### isHoppable

    private boolean isHoppable
  + ### lightSourceRadius

    private int lightSourceRadius
  + ### lightSourceLife

    private int lightSourceLife
  + ### lightSourceXOffset

    private int lightSourceXOffset
  + ### lightSourceYOffset

    private int lightSourceYOffset
  + ### lightSourceOn

    private boolean lightSourceOn
  + ### lightSource

    private [IsoLightSource](../IsoLightSource.html "class in zombie.iso") lightSource
  + ### lightSourceFuel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightSourceFuel
  + ### lifeLeft

    private float lifeLeft
  + ### lifeDelta

    private float lifeDelta
  + ### haveFuel

    private boolean haveFuel
  + ### updateAccumulator

    private float updateAccumulator
  + ### lastUpdateHours

    private float lastUpdateHours
  + ### keyId

    public int keyId
  + ### lockedByKey

    private boolean lockedByKey
  + ### lockedByPadlock

    public boolean lockedByPadlock
  + ### canBeLockByPadlock

    private boolean canBeLockByPadlock
  + ### lockedByCode

    public int lockedByCode
  + ### oldNumPlanks

    public int oldNumPlanks
  + ### thumpSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") thumpSound
  + ### wasTryingToggleLockedDoor

    private boolean wasTryingToggleLockedDoor
  + ### wasTryingToggleBarricadedDoor

    private boolean wasTryingToggleBarricadedDoor
  + ### tempo

    public static final [Vector2](../Vector2.html "class in zombie.iso") tempo
  + ### lastPlayerOnlineId

    private short lastPlayerOnlineId
* Constructor Details
  -------------------

  + ### IsoThumpable

    public IsoThumpable([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### IsoThumpable

    public IsoThumpable([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") closedSprite,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") openSprite,
    boolean north,
    se.krka.kahlua.vm.KahluaTable table)

    Create an object than can be interacted by you, survivor or zombie (destroy, barricade, etc.) This one have a closed/openSprite so it can be a
    door for example
  + ### IsoThumpable

    public IsoThumpable([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite,
    boolean north,
    se.krka.kahlua.vm.KahluaTable table)

    Create an object than can be interacted by you, survivor or zombie (destroy, barricade, etc.) This one can be a wall, a fence, etc.
  + ### IsoThumpable

    public IsoThumpable([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite,
    boolean north)
* Method Details
  --------------

  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()

    Overrides:
    :   `getModData` in class `IsoObject`
  + ### setModData

    public void setModData(se.krka.kahlua.vm.KahluaTable modData)

    Overrides:
    :   `setModData` in class `IsoObject`
  + ### hasModData

    public boolean hasModData()

    Overrides:
    :   `hasModData` in class `IsoObject`
  + ### getBuildMaterials

    public se.krka.kahlua.vm.KahluaTable getBuildMaterials()
  + ### hasBuildMaterials

    public boolean hasBuildMaterials()
  + ### isCanPassThrough

    public boolean isCanPassThrough()

    Can you pass through the item, if false we gonna test the collide default to false (so it collide)
  + ### setCanPassThrough

    public void setCanPassThrough(boolean pCanPassThrough)
  + ### isBlockAllTheSquare

    public boolean isBlockAllTheSquare()
  + ### setBlockAllTheSquare

    public void setBlockAllTheSquare(boolean blockAllTheSquare)
  + ### setIsDismantable

    public void setIsDismantable(boolean dismantable)
  + ### isDismantable

    public boolean isDismantable()
  + ### getCrossSpeed

    public float getCrossSpeed()
  + ### setCrossSpeed

    public void setCrossSpeed(float pCrossSpeed)
  + ### setIsFloor

    public void setIsFloor(boolean pIsFloor)
  + ### isCorner

    public boolean isCorner()
  + ### isFloor

    public boolean isFloor()

    Overrides:
    :   `isFloor` in class `IsoObject`
  + ### setIsContainer

    public void setIsContainer(boolean pIsContainer)
  + ### setIsStairs

    public void setIsStairs(boolean pStairs)
  + ### isStairs

    public boolean isStairs()
  + ### isWindowN

    public boolean isWindowN()
  + ### isWindowW

    public boolean isWindowW()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### setCorner

    public void setCorner(boolean pCorner)
  + ### setCanBarricade

    public void setCanBarricade(boolean pCanBarricade)
  + ### getCanBarricade

    public boolean getCanBarricade()
  + ### setHealth

    public void setHealth(int health)

    Specified by:
    :   `setHealth` in interface `zombie.iso.IHasHealth`
  + ### getHealth

    public int getHealth()

    Specified by:
    :   `getHealth` in interface `zombie.iso.IHasHealth`
  + ### setMaxHealth

    public void setMaxHealth(int maxHealth)
  + ### getMaxHealth

    public int getMaxHealth()

    Specified by:
    :   `getMaxHealth` in interface `zombie.iso.IHasHealth`
  + ### setThumpDmg

    public void setThumpDmg([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") pThumpDmg)
  + ### getThumpDmg

    public int getThumpDmg()
  + ### setBreakSound

    public void setBreakSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pBreakSound)

    The sound that be played if this object is broken default "BreakDoor"
  + ### getBreakSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBreakSound()
  + ### isDoor

    public boolean isDoor()
  + ### getNorth

    public boolean getNorth()

    Specified by:
    :   `getNorth` in interface `BarricadeAble`
  + ### getFacingPosition

    public [Vector2](../Vector2.html "class in zombie.iso") getFacingPosition([Vector2](../Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
  + ### isDoorFrame

    public boolean isDoorFrame()
  + ### setIsDoor

    public void setIsDoor(boolean pIsDoor)
  + ### setIsDoorFrame

    public void setIsDoorFrame(boolean pIsDoorFrame)
  + ### setSprite

    public void setSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)

    Overrides:
    :   `setSprite` in class `IsoObject`
  + ### setSpriteFromName

    public void setSpriteFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `setSpriteFromName` in class `IsoObject`
  + ### setClosedSprite

    public void setClosedSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setOpenSprite

    public void setOpenSprite([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
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
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
  + ### getOtherSideOfDoor

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOtherSideOfDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### changeSprite

    public void changeSprite([IsoThumpable](IsoThumpable.html "class in zombie.iso.objects") thumpable)
  + ### couldBeOpen

    public boolean couldBeOpen([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `couldBeOpen` in interface `zombie.iso.ILockableDoor`
  + ### ToggleDoorActual

    public void ToggleDoorActual([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### TriggerLockedDoor

    private void TriggerLockedDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### TriggerBarricadedDoor

    private void TriggerBarricadedDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### PlayAnimation

    private void PlayAnimation()
  + ### ToggleDoor

    public void ToggleDoor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### ToggleDoorSilent

    public void ToggleDoorSilent()
  + ### isObstructed

    public boolean isObstructed()
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
  + ### createLightSource

    public void createLightSource(int radius,
    int offsetX,
    int offsetY,
    int offsetZ,
    int life,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightSourceFuel,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### insertNewFuel

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") insertNewFuel([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### removeCurrentFuel

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removeCurrentFuel([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### calcLightSourceX

    private int calcLightSourceX()
  + ### calcLightSourceY

    private int calcLightSourceY()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### Damage

    public void Damage(float amount)

    Overrides:
    :   `Damage` in class `IsoObject`
  + ### destroy

    public void destroy()
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
  + ### setIsDoor

    public void setIsDoor([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") pIsDoor)
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()

    Overrides:
    :   `getTable` in class `IsoObject`

    Returns:
    :   the table
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)

    Overrides:
    :   `setTable` in class `IsoObject`

    Parameters:
    :   `table` - the table to set
  + ### canBePlastered

    public boolean canBePlastered()
  + ### setCanBePlastered

    public void setCanBePlastered(boolean canBePlastered)
  + ### isPaintable

    public boolean isPaintable()
  + ### setPaintable

    public void setPaintable(boolean paintable)
  + ### isLocked

    public boolean isLocked()
  + ### setIsLocked

    public void setIsLocked(boolean lock)
  + ### isThumpable

    public boolean isThumpable()
  + ### setIsThumpable

    public void setIsThumpable(boolean thumpable)
  + ### setIsHoppable

    public void setIsHoppable(boolean isHoppable)
  + ### getOpenSprite

    public [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") getOpenSprite()
  + ### isHoppable

    public boolean isHoppable()

    Overrides:
    :   `isHoppable` in class `IsoObject`
  + ### isTallHoppable

    public boolean isTallHoppable()

    Overrides:
    :   `isTallHoppable` in class `IsoObject`
  + ### setHoppable

    public void setHoppable(boolean isHoppable)
  + ### getLightSourceRadius

    public int getLightSourceRadius()
  + ### setLightSourceRadius

    public void setLightSourceRadius(int lightSourceRadius)
  + ### getLightSourceXOffset

    public int getLightSourceXOffset()
  + ### setLightSourceXOffset

    public void setLightSourceXOffset(int lightSourceXOffset)
  + ### getLightSourceYOffset

    public int getLightSourceYOffset()
  + ### setLightSourceYOffset

    public void setLightSourceYOffset(int lightSourceYOffset)
  + ### getLightSourceLife

    public int getLightSourceLife()
  + ### setLightSourceLife

    public void setLightSourceLife(int lightSourceLife)
  + ### isLightSourceOn

    public boolean isLightSourceOn()
  + ### setLightSourceOn

    public void setLightSourceOn(boolean lightSourceOn)
  + ### getLightSource

    public [IsoLightSource](../IsoLightSource.html "class in zombie.iso") getLightSource()

    Overrides:
    :   `getLightSource` in class `IsoObject`
  + ### setLightSource

    public void setLightSource([IsoLightSource](../IsoLightSource.html "class in zombie.iso") lightSource)

    Overrides:
    :   `setLightSource` in class `IsoObject`
  + ### toggleLightSource

    public void toggleLightSource(boolean toggle)
  + ### getLightSourceFuel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLightSourceFuel()
  + ### setLightSourceFuel

    public void setLightSourceFuel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightSourceFuel)
  + ### getLifeLeft

    public float getLifeLeft()
  + ### setLifeLeft

    public void setLifeLeft(float lifeLeft)
  + ### getLifeDelta

    public float getLifeDelta()
  + ### setLifeDelta

    public void setLifeDelta(float lifeDelta)
  + ### haveFuel

    public boolean haveFuel()
  + ### setHaveFuel

    public void setHaveFuel(boolean haveFuel)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter b)

    Overrides:
    :   `syncIsoObjectSend` in class `IsoObject`
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `syncIsoObjectReceive` in class `IsoObject`
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
  + ### HasCurtains

    public [IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") HasCurtains()

    Specified by:
    :   `HasCurtains` in interface `zombie.iso.ILockableDoor`
  + ### canAddCurtain

    public boolean canAddCurtain()

    Specified by:
    :   `canAddCurtain` in interface `zombie.iso.ILockableDoor`
  + ### getInsideSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getInsideSquare()
  + ### getOppositeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getOppositeSquare()

    Specified by:
    :   `getOppositeSquare` in interface `BarricadeAble`
  + ### isAdjacentToSquare

    public boolean isAdjacentToSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square2)
  + ### getAddSheetSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getAddSheetSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addSheet

    public void addSheet([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getIndoorSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getIndoorSquare()
  + ### getKeyId

    public int getKeyId()

    Specified by:
    :   `getKeyId` in interface `zombie.iso.ILockableDoor`

    Overrides:
    :   `getKeyId` in class `IsoObject`
  + ### setKeyId

    public void setKeyId(int keyId,
    boolean doNetwork)
  + ### setKeyId

    public void setKeyId(int keyId)

    Specified by:
    :   `setKeyId` in interface `zombie.iso.ILockableDoor`

    Overrides:
    :   `setKeyId` in class `IsoObject`
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
  + ### isLockedByPadlock

    public boolean isLockedByPadlock()
  + ### syncIsoThumpable

    public void syncIsoThumpable()
  + ### setLockedByPadlock

    public void setLockedByPadlock(boolean lockedByPadlock)
  + ### canBeLockByPadlock

    public boolean canBeLockByPadlock()
  + ### setCanBeLockByPadlock

    public void setCanBeLockByPadlock(boolean canBeLockByPadlock)
  + ### getLockedByCode

    public int getLockedByCode()
  + ### setLockedByCode

    public void setLockedByCode(int lockedByCode)
  + ### isLockedToCharacter

    public boolean isLockedToCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canClimbOver

    public boolean canClimbOver([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `canClimbOver` in interface `zombie.iso.ILockableDoor`
  + ### canClimbThrough

    public boolean canClimbThrough([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getThumpSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getThumpSound()
  + ### setThumpSound

    public void setThumpSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") thumpSound)
  + ### getRenderEffectMaster

    public [IsoObject](../IsoObject.html "class in zombie.iso") getRenderEffectMaster()

    Overrides:
    :   `getRenderEffectMaster` in class `IsoObject`
  + ### getSpriteEdge

    public [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getSpriteEdge(boolean ignoreOpen)
  + ### getSoundPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundPrefix()
  + ### playDoorSound

    private void playDoorSound([BaseCharacterSoundEmitter](../../characters/BaseCharacterSoundEmitter.html "class in zombie.characters") emitter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### getMeleeHitSurface

    private zombie.audio.parameters.ParameterMeleeHitSurface.Material getMeleeHitSurface()
  + ### GetBreakFurnitureSound

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetBreakFurnitureSound([IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### GetBreakFurnitureSound

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetBreakFurnitureSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### checkKeyHighlight

    public void checkKeyHighlight(int playerIndex)
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
  + ### getSpriteModel

    public [SpriteModel](../SpriteModel.html "class in zombie.iso") getSpriteModel()

    Overrides:
    :   `getSpriteModel` in class `IsoObject`
  + ### animalHit

    public void animalHit([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getClosedSpriteTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClosedSpriteTextureName()
  + ### afterRotated

    public void afterRotated()

    Overrides:
    :   `afterRotated` in class `IsoObject`
  + ### forEachDoorObject

    public void forEachDoorObject([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[IsoThumpable](IsoThumpable.html "class in zombie.iso.objects")> consumer)