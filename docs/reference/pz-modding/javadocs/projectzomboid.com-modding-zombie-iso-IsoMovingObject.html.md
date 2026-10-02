[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMovingObject](IsoMovingObject.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [treeSoundMgr](#treeSoundMgr)
   2. [MAX\_ZOMBIES\_EATING](#MAX_ZOMBIES_EATING)
   3. [idCount](#idCount)
   4. [tempo](#tempo)
   5. [noDamage](#noDamage)
   6. [last](#last)
   7. [lastX](#lastX)
   8. [ly](#ly)
   9. [lz](#lz)
   10. [nx](#nx)
   11. [ny](#ny)
   12. [x](#x)
   13. [y](#y)
   14. [z](#z)
   15. [reqMovement](#reqMovement)
   16. [def](#def)
   17. [current](#current)
   18. [hitDir](#hitDir)
   19. [id](#id)
   20. [uid](#uid)
   21. [movingSq](#movingSq)
   22. [solid](#solid)
   23. [width](#width)
   24. [shootable](#shootable)
   25. [collidable](#collidable)
   26. [movementLastFrame](#movementLastFrame)
   27. [weight](#weight)
   28. [onFloor](#onFloor)
   29. [closeKilled](#closeKilled)
   30. [collideType](#collideType)
   31. [lastCollideTime](#lastCollideTime)
   32. [timeSinceZombieAttack](#timeSinceZombieAttack)
   33. [collidedE](#collidedE)
   34. [collidedN](#collidedN)
   35. [collidedObject](#collidedObject)
   36. [collidedS](#collidedS)
   37. [collidedThisFrame](#collidedThisFrame)
   38. [collidedW](#collidedW)
   39. [collidedWithDoor](#collidedWithDoor)
   40. [collidedWithVehicle](#collidedWithVehicle)
   41. [destroyed](#destroyed)
   42. [firstUpdate](#firstUpdate)
   43. [impulsex](#impulsex)
   44. [impulsey](#impulsey)
   45. [limpulsex](#limpulsex)
   46. [limpulsey](#limpulsey)
   47. [hitForce](#hitForce)
   48. [hitFromAngle](#hitFromAngle)
   49. [pathFindIndex](#pathFindIndex)
   50. [stateEventDelayTimer](#stateEventDelayTimer)
   51. [thumpTarget](#thumpTarget)
   52. [altCollide](#altCollide)
   53. [lastTargettedBy](#lastTargettedBy)
   54. [feelersize](#feelersize)
   55. [eatingZombies](#eatingZombies)
   56. [animationRecorder](#animationRecorder)
   57. [animPlayerRecordingExclusive](#animPlayerRecordingExclusive)
   58. [currentSimulationLevel](#currentSimulationLevel)
7. [Constructor Details](#constructor-detail)
   1. [IsoMovingObject()](#%3Cinit%3E())
   2. [IsoMovingObject(boolean)](#%3Cinit%3E(boolean))
   3. [IsoMovingObject(IsoSprite, boolean)](#%3Cinit%3E(zombie.iso.sprite.IsoSprite,boolean))
8. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [getIDCount()](#getIDCount())
   3. [setIDCount(int)](#setIDCount(int))
   4. [isAnimationRecorderActive()](#isAnimationRecorderActive())
   5. [getAnimationRecorder()](#getAnimationRecorder())
   6. [closeAnimationRecorder()](#closeAnimationRecorder())
   7. [updateAnimationRecorder()](#updateAnimationRecorder())
   8. [setAnimRecorderActive(boolean, boolean)](#setAnimRecorderActive(boolean,boolean))
   9. [shouldAnimRecorderBeActive()](#shouldAnimRecorderBeActive())
   10. [getBuilding()](#getBuilding())
   11. [getMasterRegion()](#getMasterRegion())
   12. [getWeight()](#getWeight())
   13. [setWeight(float)](#setWeight(float))
   14. [getWeight(float, float)](#getWeight(float,float))
   15. [onMouseRightClick(int, int)](#onMouseRightClick(int,int))
   16. [getObjectName()](#getObjectName())
   17. [collideWith(IsoObject)](#collideWith(zombie.iso.IsoObject))
   18. [doStairs()](#doStairs())
   19. [handleSlopedSurface()](#handleSlopedSurface())
   20. [getID()](#getID())
   21. [getUID()](#getUID())
   22. [getPathFindIndex()](#getPathFindIndex())
   23. [setPathFindIndex(int)](#setPathFindIndex(int))
   24. [getScreenX()](#getScreenX())
   25. [getScreenY()](#getScreenY())
   26. [getThumpTarget()](#getThumpTarget())
   27. [setThumpTarget(Thumpable)](#setThumpTarget(zombie.iso.objects.interfaces.Thumpable))
   28. [getVectorFromDirection(Vector2)](#getVectorFromDirection(zombie.iso.Vector2))
   29. [getVectorFromDirection(Vector2, IsoDirections)](#getVectorFromDirection(zombie.iso.Vector2,zombie.iso.IsoDirections))
   30. [getPosition(Vector3)](#getPosition(zombie.iso.Vector3))
   31. [getPosition(Vector3f)](#getPosition(org.lwjgl.util.vector.Vector3f))
   32. [getPosition(Vector2)](#getPosition(zombie.iso.Vector2))
   33. [setPosition(float, float)](#setPosition(float,float))
   34. [setPosition(Vector2)](#setPosition(zombie.iso.Vector2))
   35. [setPosition(float, float, float)](#setPosition(float,float,float))
   36. [getX()](#getX())
   37. [setX(float)](#setX(float))
   38. [setForceX(float)](#setForceX(float))
   39. [getY()](#getY())
   40. [setY(float)](#setY(float))
   41. [setForceY(float)](#setForceY(float))
   42. [getZ()](#getZ())
   43. [setZ(float)](#setZ(float))
   44. [getMovingSquare()](#getMovingSquare())
   45. [setMovingSquare(IsoGridSquare)](#setMovingSquare(zombie.iso.IsoGridSquare))
   46. [getSquare()](#getSquare())
   47. [findCurrentGridSquare()](#findCurrentGridSquare())
   48. [getCurrentBuilding()](#getCurrentBuilding())
   49. [Hit(HandWeapon, IsoGameCharacter, float, boolean, float)](#Hit(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float))
   50. [moveUnmodded(float, float)](#moveUnmodded(float,float))
   51. [moveUnmoddedInternal(float, float)](#moveUnmoddedInternal(float,float))
   52. [isCharacter()](#isCharacter())
   53. [DistTo(int, int)](#DistTo(int,int))
   54. [DistTo(IsoMovingObject)](#DistTo(zombie.iso.IsoMovingObject))
   55. [DistToProper(IsoObject)](#DistToProper(zombie.iso.IsoObject))
   56. [DistToSquared(IsoMovingObject)](#DistToSquared(zombie.iso.IsoMovingObject))
   57. [DistToSquared(float, float)](#DistToSquared(float,float))
   58. [isWithinRange(IsoMovingObject, float)](#isWithinRange(zombie.iso.IsoMovingObject,float))
   59. [getClosestObject(List)](#getClosestObject(java.util.List))
   60. [getClosestStaticMovingObjectInNearbySquares(Class, BiPredicate, Predicate)](#getClosestStaticMovingObjectInNearbySquares(java.lang.Class,java.util.function.BiPredicate,java.util.function.Predicate))
   61. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   62. [getDescription(String)](#getDescription(java.lang.String))
   63. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   64. [removeFromWorld()](#removeFromWorld())
   65. [removeFromSquare()](#removeFromSquare())
   66. [getFuturWalkedSquare()](#getFuturWalkedSquare())
   67. [getGlobalMovementMod()](#getGlobalMovementMod())
   68. [getGlobalMovementMod(boolean)](#getGlobalMovementMod(boolean))
   69. [doTreeNoises()](#doTreeNoises())
   70. [postupdate()](#postupdate())
   71. [snapZToCurrentSquare()](#snapZToCurrentSquare())
   72. [snapZToCurrentSquareExact()](#snapZToCurrentSquareExact())
   73. [shouldSnapZToCurrentSquare()](#shouldSnapZToCurrentSquare())
   74. [updateAnimation()](#updateAnimation())
   75. [ensureOnTile()](#ensureOnTile())
   76. [preupdate()](#preupdate())
   77. [renderlast()](#renderlast())
   78. [spotted(IsoMovingObject, boolean)](#spotted(zombie.iso.IsoMovingObject,boolean))
   79. [update()](#update())
   80. [Collided()](#Collided())
   81. [compareToY(IsoMovingObject)](#compareToY(zombie.iso.IsoMovingObject))
   82. [distToNearestCamCharacter()](#distToNearestCamCharacter())
   83. [isSolidForSeparate()](#isSolidForSeparate())
   84. [isPushableForSeparate()](#isPushableForSeparate())
   85. [isPushedByForSeparate(IsoMovingObject)](#isPushedByForSeparate(zombie.iso.IsoMovingObject))
   86. [separate()](#separate())
   87. [getBumpedType(IsoGameCharacter)](#getBumpedType(zombie.characters.IsoGameCharacter))
   88. [getLastX()](#getLastX())
   89. [setLastX(float)](#setLastX(float))
   90. [getLastY()](#getLastY())
   91. [setLastY(float)](#setLastY(float))
   92. [getLastZ()](#getLastZ())
   93. [setLastZ(float)](#setLastZ(float))
   94. [getNextX()](#getNextX())
   95. [getNextXi()](#getNextXi())
   96. [setNextX(float)](#setNextX(float))
   97. [getNextY()](#getNextY())
   98. [getNextYi()](#getNextYi())
   99. [setNextY(float)](#setNextY(float))
   100. [slideHeadAwayFromWalls(boolean)](#slideHeadAwayFromWalls(boolean))
   101. [shouldSlideHeadAwayFromWalls()](#shouldSlideHeadAwayFromWalls())
   102. [slideAwayFromWalls(float, boolean, boolean)](#slideAwayFromWalls(float,boolean,boolean))
   103. [slideAwayToCollisionPos(float, float, boolean)](#slideAwayToCollisionPos(float,float,boolean))
   104. [DoCollide(int)](#DoCollide(int))
   105. [checkHitHoppableAnimal(IsoAnimal)](#checkHitHoppableAnimal(zombie.characters.animals.IsoAnimal))
   106. [checkHitHoppable()](#checkHitHoppable())
   107. [checkBreakBendableFence(IsoGridSquare)](#checkBreakBendableFence(zombie.iso.IsoGridSquare))
   108. [checkBreakHoppable()](#checkBreakHoppable())
   109. [checkHitWall()](#checkHitWall())
   110. [checkVaultOver()](#checkVaultOver())
   111. [setMovingSquareNow()](#setMovingSquareNow())
   112. [getFeelerTile(float)](#getFeelerTile(float))
   113. [DoCollideNorS()](#DoCollideNorS())
   114. [DoCollideWorE()](#DoCollideWorE())
   115. [getTimeSinceZombieAttack()](#getTimeSinceZombieAttack())
   116. [setTimeSinceZombieAttack(int)](#setTimeSinceZombieAttack(int))
   117. [isCollidedE()](#isCollidedE())
   118. [setCollidedE(boolean)](#setCollidedE(boolean))
   119. [isCollidedN()](#isCollidedN())
   120. [setCollidedN(boolean)](#setCollidedN(boolean))
   121. [getCollidedObject()](#getCollidedObject())
   122. [setCollidedObject(IsoObject)](#setCollidedObject(zombie.iso.IsoObject))
   123. [isCollidedS()](#isCollidedS())
   124. [setCollidedS(boolean)](#setCollidedS(boolean))
   125. [isCollidedThisFrame()](#isCollidedThisFrame())
   126. [setCollidedThisFrame(boolean)](#setCollidedThisFrame(boolean))
   127. [isCollidedW()](#isCollidedW())
   128. [setCollidedW(boolean)](#setCollidedW(boolean))
   129. [isCollidedWithDoor()](#isCollidedWithDoor())
   130. [setCollidedWithDoor(boolean)](#setCollidedWithDoor(boolean))
   131. [isCollidedWithVehicle()](#isCollidedWithVehicle())
   132. [getCurrentSquare()](#getCurrentSquare())
   133. [getCurrentZone()](#getCurrentZone())
   134. [setCurrent(IsoGridSquare)](#setCurrent(zombie.iso.IsoGridSquare))
   135. [setCurrentSquare(IsoGridSquare)](#setCurrentSquare(zombie.iso.IsoGridSquare))
   136. [setCurrentSquareFromPosition()](#setCurrentSquareFromPosition())
   137. [setCurrentSquareFromPosition(float, float)](#setCurrentSquareFromPosition(float,float))
   138. [setCurrentSquareFromPosition(float, float, float)](#setCurrentSquareFromPosition(float,float,float))
   139. [isDestroyed()](#isDestroyed())
   140. [setDestroyed(boolean)](#setDestroyed(boolean))
   141. [isFirstUpdate()](#isFirstUpdate())
   142. [setFirstUpdate(boolean)](#setFirstUpdate(boolean))
   143. [getHitDir()](#getHitDir())
   144. [setHitDir(Vector2)](#setHitDir(zombie.iso.Vector2))
   145. [getImpulsex()](#getImpulsex())
   146. [setImpulsex(float)](#setImpulsex(float))
   147. [getImpulsey()](#getImpulsey())
   148. [setImpulsey(float)](#setImpulsey(float))
   149. [getLimpulsex()](#getLimpulsex())
   150. [setLimpulsex(float)](#setLimpulsex(float))
   151. [getLimpulsey()](#getLimpulsey())
   152. [setLimpulsey(float)](#setLimpulsey(float))
   153. [getHitForce()](#getHitForce())
   154. [setHitForce(float)](#setHitForce(float))
   155. [getHitFromAngle()](#getHitFromAngle())
   156. [setHitFromAngle(float)](#setHitFromAngle(float))
   157. [getLastSquare()](#getLastSquare())
   158. [setLast(IsoGridSquare)](#setLast(zombie.iso.IsoGridSquare))
   159. [getNoDamage()](#getNoDamage())
   160. [setNoDamage(boolean)](#setNoDamage(boolean))
   161. [isSolid()](#isSolid())
   162. [setSolid(boolean)](#setSolid(boolean))
   163. [getStateEventDelayTimer()](#getStateEventDelayTimer())
   164. [setStateEventDelayTimer(float)](#setStateEventDelayTimer(float))
   165. [getWidth()](#getWidth())
   166. [setWidth(float)](#setWidth(float))
   167. [isbAltCollide()](#isbAltCollide())
   168. [setbAltCollide(boolean)](#setbAltCollide(boolean))
   169. [isShootable()](#isShootable())
   170. [setShootable(boolean)](#setShootable(boolean))
   171. [getLastTargettedBy()](#getLastTargettedBy())
   172. [setLastTargettedBy(IsoZombie)](#setLastTargettedBy(zombie.characters.IsoZombie))
   173. [isCollidable()](#isCollidable())
   174. [setCollidable(boolean)](#setCollidable(boolean))
   175. [getMovementLastFrame()](#getMovementLastFrame())
   176. [setMovementLastFrame(Vector2)](#setMovementLastFrame(zombie.iso.Vector2))
   177. [getFeelersize()](#getFeelersize())
   178. [setFeelersize(float)](#setFeelersize(float))
   179. [isOnFloor()](#isOnFloor())
   180. [setOnFloor(boolean)](#setOnFloor(boolean))
   181. [isStanding()](#isStanding())
   182. [isProne()](#isProne())
   183. [isGettingUp()](#isGettingUp())
   184. [isCrawling()](#isCrawling())
   185. [Despawn()](#Despawn())
   186. [isCloseKilled()](#isCloseKilled())
   187. [setCloseKilled(boolean)](#setCloseKilled(boolean))
   188. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   189. [isInLoadedArea(int, int)](#isInLoadedArea(int,int))
   190. [isCollided()](#isCollided())
   191. [getCollideType()](#getCollideType())
   192. [setCollideType(String)](#setCollideType(java.lang.String))
   193. [getLastCollideTime()](#getLastCollideTime())
   194. [setLastCollideTime(float)](#setLastCollideTime(float))
   195. [getEatingZombies()](#getEatingZombies())
   196. [setEatingZombies(ArrayList)](#setEatingZombies(java.util.ArrayList))
   197. [isEatingOther(IsoMovingObject)](#isEatingOther(zombie.iso.IsoMovingObject))
   198. [getDistanceSq(IsoMovingObject)](#getDistanceSq(zombie.iso.IsoMovingObject))
   199. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())
   200. [setCurrentSimulationLevel(UpdateSchedulerSimulationLevel)](#setCurrentSimulationLevel(zombie.UpdateSchedulerSimulationLevel))
   201. [getCurrentSimulationLevel()](#getCurrentSimulationLevel())
   202. [isExistInTheWorld()](#isExistInTheWorld())
   203. [shouldIgnoreCollisionWithSquare(IsoGridSquare)](#shouldIgnoreCollisionWithSquare(zombie.iso.IsoGridSquare))
   204. [getSurroundingThumpers()](#getSurroundingThumpers())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMovingObject
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](IsoObject.html "class in zombie.iso")

zombie.iso.IsoMovingObject

All Implemented Interfaces:
:   `Serializable, zombie.ai.astar.Mover, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

Direct Known Subclasses:
:   `BaseVehicle, IsoDeadBody, IsoGameCharacter, zombie.iso.IsoPhysicsObject, IsoPushableObject`

---

public class IsoMovingObject
extends [IsoObject](IsoObject.html "class in zombie.iso")
implements zombie.ai.astar.Mover

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.iso.IsoMovingObject)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoMovingObject.L_postUpdate`

  ### Nested classes/interfaces inherited from class [IsoObject](IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `altCollide`

  `private final zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder`

  `animationRecorder`

  `private boolean`

  `animPlayerRecordingExclusive`

  `private boolean`

  `closeKilled`

  `protected boolean`

  `collidable`

  `private boolean`

  `collidedE`

  `private boolean`

  `collidedN`

  `private IsoObject`

  `collidedObject`

  `private boolean`

  `collidedS`

  `private boolean`

  `collidedThisFrame`

  `private boolean`

  `collidedW`

  `private boolean`

  `collidedWithDoor`

  `private boolean`

  `collidedWithVehicle`

  `private String`

  `collideType`

  `protected IsoGridSquare`

  `current`

  `private zombie.UpdateSchedulerSimulationLevel`

  `currentSimulationLevel`

  `IsoSpriteInstance`

  `def`

  `private boolean`

  `destroyed`

  `private final ArrayList<IsoZombie>`

  `eatingZombies`

  `private float`

  `feelersize`

  `private boolean`

  `firstUpdate`

  `protected Vector2`

  `hitDir`

  `private float`

  `hitForce`

  `private float`

  `hitFromAngle`

  `protected final int`

  `id`

  `private static int`

  `idCount`

  `private float`

  `impulsex`

  `private float`

  `impulsey`

  `IsoGridSquare`

  `last`

  `private float`

  `lastCollideTime`

  `private IsoZombie`

  `lastTargettedBy`

  `private float`

  `lastX`

  `private float`

  `limpulsex`

  `private float`

  `limpulsey`

  `private float`

  `ly`

  `private float`

  `lz`

  `static final int`

  `MAX_ZOMBIES_EATING`

  `protected Vector2`

  `movementLastFrame`

  `protected IsoGridSquare`

  `movingSq`

  `boolean`

  `noDamage`

  `private float`

  `nx`

  `private float`

  `ny`

  `(package private) boolean`

  `onFloor`

  `private int`

  `pathFindIndex`

  `Vector2`

  `reqMovement`

  `protected boolean`

  `shootable`

  `protected boolean`

  `solid`

  `private float`

  `stateEventDelayTimer`

  `private static final Vector2`

  `tempo`

  `private zombie.iso.objects.interfaces.Thumpable`

  `thumpTarget`

  `private int`

  `timeSinceZombieAttack`

  `static TreeSoundManager`

  `treeSoundMgr`

  `private final String`

  `uid`

  `protected float`

  `weight`

  `protected float`

  `width`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`

  ### Fields inherited from class [IsoObject](IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMovingObject()`

  `IsoMovingObject(boolean bObjectListAdd)`

  `IsoMovingObject(IsoSprite spr,
  boolean bObjectListAdd)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkBreakBendableFence(IsoGridSquare square)`

  `private void`

  `checkBreakHoppable()`

  `private void`

  `checkHitHoppable()`

  `private void`

  `checkHitHoppableAnimal(IsoAnimal animal)`

  `private void`

  `checkHitWall()`

  `private boolean`

  `checkVaultOver()`

  `void`

  `closeAnimationRecorder()`

  `private void`

  `Collided()`

  `void`

  `collideWith(IsoObject obj)`

  `int`

  `compareToY(IsoMovingObject other)`

  `void`

  `Despawn()`

  `float`

  `DistTo(int x,
  int y)`

  `float`

  `DistTo(IsoMovingObject other)`

  `float`

  `distToNearestCamCharacter()`

  `float`

  `DistToProper(IsoObject other)`

  `float`

  `DistToSquared(float x,
  float y)`

  `float`

  `DistToSquared(IsoMovingObject other)`

  `private boolean`

  `DoCollide(int favour)`

  `void`

  `DoCollideNorS()`

  `void`

  `DoCollideWorE()`

  `void`

  `doStairs()`

  `protected void`

  `doTreeNoises()`

  `void`

  `ensureOnTile()`

  `IsoGridSquare`

  `findCurrentGridSquare()`

  Finds the current IsoGridSquare, based on our world coordinates.

  `zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder`

  `getAnimationRecorder()`

  `IsoBuilding`

  `getBuilding()`

  `String`

  `getBumpedType(IsoGameCharacter bumped)`

  `final <ObjectType extends IsoMovingObject>  
  ObjectType`

  `getClosestObject(List<ObjectType> objects)`

  `final <ObjectType extends IsoMovingObject>  
  ObjectType`

  `getClosestStaticMovingObjectInNearbySquares(Class<? extends ObjectType> objectType,
  BiPredicate<IsoGridSquare, IsoGridSquare> squareFilter,
  Predicate<ObjectType> objectFilter)`

  `IsoObject`

  `getCollidedObject()`

  `String`

  `getCollideType()`

  `IsoBuilding`

  `getCurrentBuilding()`

  `zombie.UpdateSchedulerSimulationLevel`

  `getCurrentSimulationLevel()`

  `IsoGridSquare`

  `getCurrentSquare()`

  `Zone`

  `getCurrentZone()`

  `String`

  `getDescription(String separatorStr)`

  `float`

  `getDistanceSq(IsoMovingObject other)`

  `ArrayList<IsoZombie>`

  `getEatingZombies()`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `float`

  `getFeelersize()`

  `IsoGridSquare`

  `getFeelerTile(float dist)`

  `IsoGridSquare`

  `getFuturWalkedSquare()`

  `float`

  `getGlobalMovementMod()`

  `float`

  `getGlobalMovementMod(boolean bDoNoises)`

  `Vector2`

  `getHitDir()`

  `float`

  `getHitForce()`

  `float`

  `getHitFromAngle()`

  `int`

  `getID()`

  `static int`

  `getIDCount()`

  `float`

  `getImpulsex()`

  `float`

  `getImpulsey()`

  `float`

  `getLastCollideTime()`

  `IsoGridSquare`

  `getLastSquare()`

  `IsoZombie`

  `getLastTargettedBy()`

  `float`

  `getLastX()`

  `float`

  `getLastY()`

  `float`

  `getLastZ()`

  `float`

  `getLimpulsex()`

  `float`

  `getLimpulsey()`

  `zombie.iso.areas.isoregion.regions.IWorldRegion`

  `getMasterRegion()`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `Vector2`

  `getMovementLastFrame()`

  `IsoGridSquare`

  `getMovingSquare()`

  `float`

  `getNextX()`

  `final int`

  `getNextXi()`

  `float`

  `getNextY()`

  `final int`

  `getNextYi()`

  `boolean`

  `getNoDamage()`

  `String`

  `getObjectName()`

  `int`

  `getPathFindIndex()`

  `org.lwjgl.util.vector.Vector3f`

  `getPosition(org.lwjgl.util.vector.Vector3f out)`

  `Vector2`

  `getPosition(Vector2 out)`

  `Vector3`

  `getPosition(Vector3 position)`

  `float`

  `getScreenX()`

  `float`

  `getScreenY()`

  `IsoGridSquare`

  `getSquare()`

  `float`

  `getStateEventDelayTimer()`

  `int`

  `getSurroundingThumpers()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpTarget()`

  `int`

  `getTimeSinceZombieAttack()`

  `String`

  `getUID()`

  `Vector2`

  `getVectorFromDirection(Vector2 moveForwardVec)`

  `static Vector2`

  `getVectorFromDirection(Vector2 moveForwardVec,
  IsoDirections dir)`

  `float`

  `getWeight()`

  `float`

  `getWeight(float x,
  float y)`

  `float`

  `getWidth()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `private void`

  `handleSlopedSurface()`

  `float`

  `Hit(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damageSplit,
  boolean bIgnoreDamage,
  float modDelta)`

  `boolean`

  `isAnimationRecorderActive()`

  `boolean`

  `isbAltCollide()`

  `boolean`

  `isCharacter()`

  `boolean`

  `isCloseKilled()`

  `boolean`

  `isCollidable()`

  `boolean`

  `isCollided()`

  `boolean`

  `isCollidedE()`

  `boolean`

  `isCollidedN()`

  `boolean`

  `isCollidedS()`

  `boolean`

  `isCollidedThisFrame()`

  `boolean`

  `isCollidedW()`

  `boolean`

  `isCollidedWithDoor()`

  `boolean`

  `isCollidedWithVehicle()`

  `boolean`

  `isCrawling()`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isEatingOther(IsoMovingObject other)`

  `boolean`

  `isExistInTheWorld()`

  `boolean`

  `isFirstUpdate()`

  `boolean`

  `isGettingUp()`

  `private boolean`

  `isInLoadedArea(int x,
  int y)`

  `boolean`

  `isOnFloor()`

  `boolean`

  `isProne()`

  `boolean`

  `isPushableForSeparate()`

  `boolean`

  `isPushedByForSeparate(IsoMovingObject other)`

  `boolean`

  `isShootable()`

  `boolean`

  `isSolid()`

  `boolean`

  `isSolidForSeparate()`

  `final boolean`

  `isStanding()`

  `boolean`

  `isWithinRange(IsoMovingObject object,
  float minRange)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `moveUnmodded(float diffX,
  float diffY)`

  `protected final void`

  `moveUnmoddedInternal(float dirx,
  float diry)`

  `void`

  `onMouseRightClick(int lx,
  int ly)`

  `void`

  `postupdate()`

  `void`

  `preupdate()`

  `void`

  `removeFromSquare()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `renderlast()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `separate()`

  `void`

  `setAnimRecorderActive(boolean isActive,
  boolean isExclusive)`

  `void`

  `setbAltCollide(boolean altCollide)`

  `void`

  `setCloseKilled(boolean closeKilled)`

  `void`

  `setCollidable(boolean collidable)`

  `void`

  `setCollidedE(boolean collidedE)`

  `void`

  `setCollidedN(boolean collidedN)`

  `void`

  `setCollidedObject(IsoObject collidedObject)`

  `void`

  `setCollidedS(boolean collidedS)`

  `void`

  `setCollidedThisFrame(boolean collidedThisFrame)`

  `void`

  `setCollidedW(boolean collidedW)`

  `void`

  `setCollidedWithDoor(boolean collidedWithDoor)`

  `void`

  `setCollideType(String collideType)`

  `void`

  `setCurrent(IsoGridSquare current)`

  `void`

  `setCurrentSimulationLevel(zombie.UpdateSchedulerSimulationLevel simulationLevel)`

  `void`

  `setCurrentSquare(IsoGridSquare square)`

  `void`

  `setCurrentSquareFromPosition()`

  `void`

  `setCurrentSquareFromPosition(float x1,
  float y1)`

  `void`

  `setCurrentSquareFromPosition(float x1,
  float y1,
  float z1)`

  `void`

  `setDestroyed(boolean destroyed)`

  `void`

  `setEatingZombies(ArrayList<IsoZombie> zeds)`

  `void`

  `setFeelersize(float feelersize)`

  `void`

  `setFirstUpdate(boolean firstUpdate)`

  `void`

  `setForceX(float x)`

  `void`

  `setForceY(float y)`

  `void`

  `setHitDir(Vector2 hitDir)`

  `void`

  `setHitForce(float hitForce)`

  `void`

  `setHitFromAngle(float hitFromAngle)`

  `static void`

  `setIDCount(int aIDCount)`

  `void`

  `setImpulsex(float impulsex)`

  `void`

  `setImpulsey(float impulsey)`

  `void`

  `setLast(IsoGridSquare last)`

  `void`

  `setLastCollideTime(float lastCollideTime)`

  `void`

  `setLastTargettedBy(IsoZombie lastTargettedBy)`

  `float`

  `setLastX(float lx)`

  `float`

  `setLastY(float ly)`

  `float`

  `setLastZ(float lz)`

  `void`

  `setLimpulsex(float limpulsex)`

  `void`

  `setLimpulsey(float limpulsey)`

  `void`

  `setMovementLastFrame(Vector2 movementLastFrame)`

  `void`

  `setMovingSquare(IsoGridSquare newMovingSquare)`

  `void`

  `setMovingSquareNow()`

  `float`

  `setNextX(float nx)`

  `float`

  `setNextY(float ny)`

  `void`

  `setNoDamage(boolean dmg)`

  `void`

  `setOnFloor(boolean onFloor)`

  `void`

  `setPathFindIndex(int pathFindIndex)`

  `void`

  `setPosition(float x,
  float y)`

  `void`

  `setPosition(float x,
  float y,
  float z)`

  `void`

  `setPosition(Vector2 pos)`

  `void`

  `setShootable(boolean shootable)`

  `void`

  `setSolid(boolean solid)`

  `void`

  `setStateEventDelayTimer(float stateEventDelayTimer)`

  `void`

  `setThumpTarget(zombie.iso.objects.interfaces.Thumpable thumpTarget)`

  `void`

  `setTimeSinceZombieAttack(int timeSinceZombieAttack)`

  `void`

  `setWeight(float weight)`

  `void`

  `setWidth(float width)`

  `float`

  `setX(float x)`

  `float`

  `setY(float y)`

  `float`

  `setZ(float z)`

  `boolean`

  `shouldAnimRecorderBeActive()`

  `boolean`

  `shouldIgnoreCollisionWithSquare(IsoGridSquare square)`

  `protected boolean`

  `shouldSlideHeadAwayFromWalls()`

  `boolean`

  `shouldSnapZToCurrentSquare()`

  `protected void`

  `slideAwayFromWalls(float radius,
  boolean instant,
  boolean includePolyCollisions)`

  `void`

  `slideAwayToCollisionPos(float collNewPosX,
  float collNewPosY,
  boolean instant)`

  `protected void`

  `slideHeadAwayFromWalls(boolean instant)`

  `protected void`

  `snapZToCurrentSquare()`

  `protected void`

  `snapZToCurrentSquareExact()`

  `void`

  `spotted(IsoMovingObject other,
  boolean bForced)`

  `String`

  `toString()`

  `void`

  `update()`

  `void`

  `updateAnimation()`

  `private void`

  `updateAnimationRecorder()`

  ### Methods inherited from class [IsoObject](IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, render, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

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

  + ### treeSoundMgr

    public static [TreeSoundManager](../audio/TreeSoundManager.html "class in zombie.audio") treeSoundMgr
  + ### MAX\_ZOMBIES\_EATING

    public static final int MAX\_ZOMBIES\_EATING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMovingObject.MAX_ZOMBIES_EATING)
  + ### idCount

    private static int idCount
  + ### tempo

    private static final [Vector2](Vector2.html "class in zombie.iso") tempo
  + ### noDamage

    public boolean noDamage
  + ### last

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") last
  + ### lastX

    private float lastX
  + ### ly

    private float ly
  + ### lz

    private float lz
  + ### nx

    private float nx
  + ### ny

    private float ny
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### reqMovement

    public [Vector2](Vector2.html "class in zombie.iso") reqMovement
  + ### def

    public [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") def
  + ### current

    protected [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") current
  + ### hitDir

    protected [Vector2](Vector2.html "class in zombie.iso") hitDir
  + ### id

    protected final int id
  + ### uid

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") uid
  + ### movingSq

    protected [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") movingSq
  + ### solid

    protected boolean solid
  + ### width

    protected float width
  + ### shootable

    protected boolean shootable
  + ### collidable

    protected boolean collidable
  + ### movementLastFrame

    protected [Vector2](Vector2.html "class in zombie.iso") movementLastFrame
  + ### weight

    protected float weight
  + ### onFloor

    boolean onFloor
  + ### closeKilled

    private boolean closeKilled
  + ### collideType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") collideType
  + ### lastCollideTime

    private float lastCollideTime
  + ### timeSinceZombieAttack

    private int timeSinceZombieAttack
  + ### collidedE

    private boolean collidedE
  + ### collidedN

    private boolean collidedN
  + ### collidedObject

    private [IsoObject](IsoObject.html "class in zombie.iso") collidedObject
  + ### collidedS

    private boolean collidedS
  + ### collidedThisFrame

    private boolean collidedThisFrame
  + ### collidedW

    private boolean collidedW
  + ### collidedWithDoor

    private boolean collidedWithDoor
  + ### collidedWithVehicle

    private boolean collidedWithVehicle
  + ### destroyed

    private boolean destroyed
  + ### firstUpdate

    private boolean firstUpdate
  + ### impulsex

    private float impulsex
  + ### impulsey

    private float impulsey
  + ### limpulsex

    private float limpulsex
  + ### limpulsey

    private float limpulsey
  + ### hitForce

    private float hitForce
  + ### hitFromAngle

    private float hitFromAngle
  + ### pathFindIndex

    private int pathFindIndex
  + ### stateEventDelayTimer

    private float stateEventDelayTimer
  + ### thumpTarget

    private zombie.iso.objects.interfaces.Thumpable thumpTarget
  + ### altCollide

    private boolean altCollide
  + ### lastTargettedBy

    private [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") lastTargettedBy
  + ### feelersize

    private float feelersize
  + ### eatingZombies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> eatingZombies
  + ### animationRecorder

    private final zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder animationRecorder
  + ### animPlayerRecordingExclusive

    private boolean animPlayerRecordingExclusive
  + ### currentSimulationLevel

    private zombie.UpdateSchedulerSimulationLevel currentSimulationLevel
* Constructor Details
  -------------------

  + ### IsoMovingObject

    public IsoMovingObject()
  + ### IsoMovingObject

    public IsoMovingObject(boolean bObjectListAdd)
  + ### IsoMovingObject

    public IsoMovingObject([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") spr,
    boolean bObjectListAdd)
* Method Details
  --------------

  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `IsoObject`
  + ### getIDCount

    public static int getIDCount()
  + ### setIDCount

    public static void setIDCount(int aIDCount)
  + ### isAnimationRecorderActive

    public boolean isAnimationRecorderActive()
  + ### getAnimationRecorder

    public zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder getAnimationRecorder()
  + ### closeAnimationRecorder

    public void closeAnimationRecorder()
  + ### updateAnimationRecorder

    private void updateAnimationRecorder()
  + ### setAnimRecorderActive

    public void setAnimRecorderActive(boolean isActive,
    boolean isExclusive)
  + ### shouldAnimRecorderBeActive

    public boolean shouldAnimRecorderBeActive()
  + ### getBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getBuilding()
  + ### getMasterRegion

    public zombie.iso.areas.isoregion.regions.IWorldRegion getMasterRegion()
  + ### getWeight

    public float getWeight()
  + ### setWeight

    public void setWeight(float weight)
  + ### getWeight

    public float getWeight(float x,
    float y)
  + ### onMouseRightClick

    public void onMouseRightClick(int lx,
    int ly)

    Overrides:
    :   `onMouseRightClick` in class `IsoObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoObject`
  + ### collideWith

    public void collideWith([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### doStairs

    public void doStairs()
  + ### handleSlopedSurface

    private void handleSlopedSurface()
  + ### getID

    public int getID()

    Specified by:
    :   `getID` in interface `zombie.ai.astar.Mover`
  + ### getUID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUID()
  + ### getPathFindIndex

    public int getPathFindIndex()

    Specified by:
    :   `getPathFindIndex` in interface `zombie.ai.astar.Mover`
  + ### setPathFindIndex

    public void setPathFindIndex(int pathFindIndex)
  + ### getScreenX

    public float getScreenX()
  + ### getScreenY

    public float getScreenY()
  + ### getThumpTarget

    public zombie.iso.objects.interfaces.Thumpable getThumpTarget()
  + ### setThumpTarget

    public void setThumpTarget(zombie.iso.objects.interfaces.Thumpable thumpTarget)
  + ### getVectorFromDirection

    public [Vector2](Vector2.html "class in zombie.iso") getVectorFromDirection([Vector2](Vector2.html "class in zombie.iso") moveForwardVec)
  + ### getVectorFromDirection

    public static [Vector2](Vector2.html "class in zombie.iso") getVectorFromDirection([Vector2](Vector2.html "class in zombie.iso") moveForwardVec,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getPosition

    public [Vector3](Vector3.html "class in zombie.iso") getPosition([Vector3](Vector3.html "class in zombie.iso") position)

    Overrides:
    :   `getPosition` in class `IsoObject`
  + ### getPosition

    public org.lwjgl.util.vector.Vector3f getPosition(org.lwjgl.util.vector.Vector3f out)

    Overrides:
    :   `getPosition` in class `IsoObject`
  + ### getPosition

    public [Vector2](Vector2.html "class in zombie.iso") getPosition([Vector2](Vector2.html "class in zombie.iso") out)
  + ### setPosition

    public void setPosition(float x,
    float y)
  + ### setPosition

    public void setPosition([Vector2](Vector2.html "class in zombie.iso") pos)
  + ### setPosition

    public void setPosition(float x,
    float y,
    float z)
  + ### getX

    public float getX()

    Overrides:
    :   `getX` in class `IsoObject`
  + ### setX

    public float setX(float x)
  + ### setForceX

    public void setForceX(float x)
  + ### getY

    public float getY()

    Overrides:
    :   `getY` in class `IsoObject`
  + ### setY

    public float setY(float y)
  + ### setForceY

    public void setForceY(float y)
  + ### getZ

    public float getZ()

    Overrides:
    :   `getZ` in class `IsoObject`
  + ### setZ

    public float setZ(float z)
  + ### getMovingSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getMovingSquare()
  + ### setMovingSquare

    public void setMovingSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") newMovingSquare)
  + ### getSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getSquare()

    Overrides:
    :   `getSquare` in class `IsoObject`
  + ### findCurrentGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") findCurrentGridSquare()

    Finds the current IsoGridSquare, based on our world coordinates.
    If a square cannot be found at these coordinates, a vertical search towards the ground level is performed.
  + ### getCurrentBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getCurrentBuilding()
  + ### Hit

    public float Hit([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") wielder,
    float damageSplit,
    boolean bIgnoreDamage,
    float modDelta)
  + ### moveUnmodded

    public void moveUnmodded(float diffX,
    float diffY)
  + ### moveUnmoddedInternal

    protected final void moveUnmoddedInternal(float dirx,
    float diry)
  + ### isCharacter

    public boolean isCharacter()

    Overrides:
    :   `isCharacter` in class `IsoObject`
  + ### DistTo

    public float DistTo(int x,
    int y)
  + ### DistTo

    public float DistTo([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### DistToProper

    public float DistToProper([IsoObject](IsoObject.html "class in zombie.iso") other)
  + ### DistToSquared

    public float DistToSquared([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### DistToSquared

    public float DistToSquared(float x,
    float y)
  + ### isWithinRange

    public boolean isWithinRange([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") object,
    float minRange)
  + ### getClosestObject

    public final <ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    ObjectType getClosestObject([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<ObjectType> objects)
  + ### getClosestStaticMovingObjectInNearbySquares

    public final <ObjectType extends [IsoMovingObject](IsoMovingObject.html "class in zombie.iso")>
    ObjectType getClosestStaticMovingObjectInNearbySquares([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends ObjectType> objectType,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso"), [IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareFilter,
    [Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<ObjectType> objectFilter)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separatorStr)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoObject`

    Throws:
    :   `IOException`
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoObject`
  + ### removeFromSquare

    public void removeFromSquare()

    Overrides:
    :   `removeFromSquare` in class `IsoObject`
  + ### getFuturWalkedSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFuturWalkedSquare()
  + ### getGlobalMovementMod

    public float getGlobalMovementMod()
  + ### getGlobalMovementMod

    public float getGlobalMovementMod(boolean bDoNoises)
  + ### doTreeNoises

    protected void doTreeNoises()
  + ### postupdate

    public void postupdate()
  + ### snapZToCurrentSquare

    protected void snapZToCurrentSquare()
  + ### snapZToCurrentSquareExact

    protected void snapZToCurrentSquareExact()
  + ### shouldSnapZToCurrentSquare

    public boolean shouldSnapZToCurrentSquare()
  + ### updateAnimation

    public void updateAnimation()
  + ### ensureOnTile

    public void ensureOnTile()
  + ### preupdate

    public void preupdate()
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `GameEntity`
  + ### spotted

    public void spotted([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoObject`
  + ### Collided

    private void Collided()
  + ### compareToY

    public int compareToY([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### distToNearestCamCharacter

    public float distToNearestCamCharacter()
  + ### isSolidForSeparate

    public boolean isSolidForSeparate()
  + ### isPushableForSeparate

    public boolean isPushableForSeparate()
  + ### isPushedByForSeparate

    public boolean isPushedByForSeparate([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### separate

    public void separate()
  + ### getBumpedType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBumpedType([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") bumped)
  + ### getLastX

    public float getLastX()
  + ### setLastX

    public float setLastX(float lx)
  + ### getLastY

    public float getLastY()
  + ### setLastY

    public float setLastY(float ly)
  + ### getLastZ

    public float getLastZ()
  + ### setLastZ

    public float setLastZ(float lz)
  + ### getNextX

    public float getNextX()
  + ### getNextXi

    public final int getNextXi()
  + ### setNextX

    public float setNextX(float nx)
  + ### getNextY

    public float getNextY()
  + ### getNextYi

    public final int getNextYi()
  + ### setNextY

    public float setNextY(float ny)
  + ### slideHeadAwayFromWalls

    protected void slideHeadAwayFromWalls(boolean instant)
  + ### shouldSlideHeadAwayFromWalls

    protected boolean shouldSlideHeadAwayFromWalls()
  + ### slideAwayFromWalls

    protected void slideAwayFromWalls(float radius,
    boolean instant,
    boolean includePolyCollisions)
  + ### slideAwayToCollisionPos

    public void slideAwayToCollisionPos(float collNewPosX,
    float collNewPosY,
    boolean instant)
  + ### DoCollide

    private boolean DoCollide(int favour)
  + ### checkHitHoppableAnimal

    private void checkHitHoppableAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### checkHitHoppable

    private void checkHitHoppable()
  + ### checkBreakBendableFence

    private void checkBreakBendableFence([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### checkBreakHoppable

    private void checkBreakHoppable()
  + ### checkHitWall

    private void checkHitWall()
  + ### checkVaultOver

    private boolean checkVaultOver()
  + ### setMovingSquareNow

    public void setMovingSquareNow()
  + ### getFeelerTile

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFeelerTile(float dist)
  + ### DoCollideNorS

    public void DoCollideNorS()
  + ### DoCollideWorE

    public void DoCollideWorE()
  + ### getTimeSinceZombieAttack

    public int getTimeSinceZombieAttack()
  + ### setTimeSinceZombieAttack

    public void setTimeSinceZombieAttack(int timeSinceZombieAttack)
  + ### isCollidedE

    public boolean isCollidedE()
  + ### setCollidedE

    public void setCollidedE(boolean collidedE)
  + ### isCollidedN

    public boolean isCollidedN()
  + ### setCollidedN

    public void setCollidedN(boolean collidedN)
  + ### getCollidedObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getCollidedObject()
  + ### setCollidedObject

    public void setCollidedObject([IsoObject](IsoObject.html "class in zombie.iso") collidedObject)
  + ### isCollidedS

    public boolean isCollidedS()
  + ### setCollidedS

    public void setCollidedS(boolean collidedS)
  + ### isCollidedThisFrame

    public boolean isCollidedThisFrame()
  + ### setCollidedThisFrame

    public void setCollidedThisFrame(boolean collidedThisFrame)
  + ### isCollidedW

    public boolean isCollidedW()
  + ### setCollidedW

    public void setCollidedW(boolean collidedW)
  + ### isCollidedWithDoor

    public boolean isCollidedWithDoor()
  + ### setCollidedWithDoor

    public void setCollidedWithDoor(boolean collidedWithDoor)
  + ### isCollidedWithVehicle

    public boolean isCollidedWithVehicle()
  + ### getCurrentSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getCurrentSquare()
  + ### getCurrentZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getCurrentZone()
  + ### setCurrent

    public void setCurrent([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") current)
  + ### setCurrentSquare

    public void setCurrentSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### setCurrentSquareFromPosition

    public void setCurrentSquareFromPosition()
  + ### setCurrentSquareFromPosition

    public void setCurrentSquareFromPosition(float x1,
    float y1)
  + ### setCurrentSquareFromPosition

    public void setCurrentSquareFromPosition(float x1,
    float y1,
    float z1)
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `isDestroyed` in class `IsoObject`
  + ### setDestroyed

    public void setDestroyed(boolean destroyed)
  + ### isFirstUpdate

    public boolean isFirstUpdate()
  + ### setFirstUpdate

    public void setFirstUpdate(boolean firstUpdate)
  + ### getHitDir

    public [Vector2](Vector2.html "class in zombie.iso") getHitDir()
  + ### setHitDir

    public void setHitDir([Vector2](Vector2.html "class in zombie.iso") hitDir)
  + ### getImpulsex

    public float getImpulsex()
  + ### setImpulsex

    public void setImpulsex(float impulsex)
  + ### getImpulsey

    public float getImpulsey()
  + ### setImpulsey

    public void setImpulsey(float impulsey)
  + ### getLimpulsex

    public float getLimpulsex()
  + ### setLimpulsex

    public void setLimpulsex(float limpulsex)
  + ### getLimpulsey

    public float getLimpulsey()
  + ### setLimpulsey

    public void setLimpulsey(float limpulsey)
  + ### getHitForce

    public float getHitForce()
  + ### setHitForce

    public void setHitForce(float hitForce)
  + ### getHitFromAngle

    public float getHitFromAngle()
  + ### setHitFromAngle

    public void setHitFromAngle(float hitFromAngle)
  + ### getLastSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getLastSquare()
  + ### setLast

    public void setLast([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") last)
  + ### getNoDamage

    public boolean getNoDamage()
  + ### setNoDamage

    public void setNoDamage(boolean dmg)
  + ### isSolid

    public boolean isSolid()
  + ### setSolid

    public void setSolid(boolean solid)
  + ### getStateEventDelayTimer

    public float getStateEventDelayTimer()
  + ### setStateEventDelayTimer

    public void setStateEventDelayTimer(float stateEventDelayTimer)
  + ### getWidth

    public float getWidth()
  + ### setWidth

    public void setWidth(float width)
  + ### isbAltCollide

    public boolean isbAltCollide()
  + ### setbAltCollide

    public void setbAltCollide(boolean altCollide)
  + ### isShootable

    public boolean isShootable()
  + ### setShootable

    public void setShootable(boolean shootable)
  + ### getLastTargettedBy

    public [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") getLastTargettedBy()
  + ### setLastTargettedBy

    public void setLastTargettedBy([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") lastTargettedBy)
  + ### isCollidable

    public boolean isCollidable()
  + ### setCollidable

    public void setCollidable(boolean collidable)
  + ### getMovementLastFrame

    public [Vector2](Vector2.html "class in zombie.iso") getMovementLastFrame()
  + ### setMovementLastFrame

    public void setMovementLastFrame([Vector2](Vector2.html "class in zombie.iso") movementLastFrame)
  + ### getFeelersize

    public float getFeelersize()
  + ### setFeelersize

    public void setFeelersize(float feelersize)
  + ### isOnFloor

    public boolean isOnFloor()
  + ### setOnFloor

    public void setOnFloor(boolean onFloor)
  + ### isStanding

    public final boolean isStanding()
  + ### isProne

    public boolean isProne()
  + ### isGettingUp

    public boolean isGettingUp()
  + ### isCrawling

    public boolean isCrawling()
  + ### Despawn

    public void Despawn()
  + ### isCloseKilled

    public boolean isCloseKilled()
  + ### setCloseKilled

    public void setCloseKilled(boolean closeKilled)
  + ### getFacingPosition

    public [Vector2](Vector2.html "class in zombie.iso") getFacingPosition([Vector2](Vector2.html "class in zombie.iso") pos)

    Overrides:
    :   `getFacingPosition` in class `IsoObject`
  + ### isInLoadedArea

    private boolean isInLoadedArea(int x,
    int y)
  + ### isCollided

    public boolean isCollided()
  + ### getCollideType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCollideType()
  + ### setCollideType

    public void setCollideType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") collideType)
  + ### getLastCollideTime

    public float getLastCollideTime()
  + ### setLastCollideTime

    public void setLastCollideTime(float lastCollideTime)
  + ### getEatingZombies

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> getEatingZombies()
  + ### setEatingZombies

    public void setEatingZombies([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> zeds)
  + ### isEatingOther

    public boolean isEatingOther([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### getDistanceSq

    public float getDistanceSq([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") other)
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()
  + ### setCurrentSimulationLevel

    public void setCurrentSimulationLevel(zombie.UpdateSchedulerSimulationLevel simulationLevel)
  + ### getCurrentSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getCurrentSimulationLevel()
  + ### isExistInTheWorld

    public boolean isExistInTheWorld()

    Overrides:
    :   `isExistInTheWorld` in class `IsoObject`
  + ### shouldIgnoreCollisionWithSquare

    public boolean shouldIgnoreCollisionWithSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getSurroundingThumpers

    public int getSurroundingThumpers()