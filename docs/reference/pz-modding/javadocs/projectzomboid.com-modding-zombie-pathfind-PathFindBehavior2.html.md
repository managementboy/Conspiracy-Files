[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.pathfind](package-summary.html)
2. [PathFindBehavior2](PathFindBehavior2.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [tempVector2](#tempVector2)
   2. [tempVector2\_2](#tempVector2_2)
   3. [tempVector3f\_1](#tempVector3f_1)
   4. [pointOnPath](#pointOnPath)
   5. [pathNextIsSet](#pathNextIsSet)
   6. [pathNextX](#pathNextX)
   7. [pathNextY](#pathNextY)
   8. [chr](#chr)
   9. [startX](#startX)
   10. [startY](#startY)
   11. [startZ](#startZ)
   12. [targetX](#targetX)
   13. [targetY](#targetY)
   14. [targetZ](#targetZ)
   15. [targetXyz](#targetXyz)
   16. [path](#path)
   17. [pathIndex](#pathIndex)
   18. [isCancel](#isCancel)
   19. [startedMoving](#startedMoving)
   20. [stopping](#stopping)
   21. [turningToObstacle](#turningToObstacle)
   22. [walkingOnTheSpot](#walkingOnTheSpot)
   23. [actualPos](#actualPos)
   24. [actualPool](#actualPool)
   25. [goal](#goal)
   26. [goalCharacter](#goalCharacter)
   27. [goalSitOnFurnitureObject](#goalSitOnFurnitureObject)
   28. [goalSitOnFurnitureAnySpriteGridObject](#goalSitOnFurnitureAnySpriteGridObject)
   29. [goalVehicle](#goalVehicle)
   30. [goalVehicleArea](#goalVehicleArea)
   31. [goalVehicleSeat](#goalVehicleSeat)
7. [Constructor Details](#constructor-detail)
   1. [PathFindBehavior2(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [isGoalNone()](#isGoalNone())
   2. [isGoalCharacter()](#isGoalCharacter())
   3. [isGoalLocation()](#isGoalLocation())
   4. [isGoalSound()](#isGoalSound())
   5. [isGoalSitOnFurniture()](#isGoalSitOnFurniture())
   6. [getGoalSitOnFurnitureObject()](#getGoalSitOnFurnitureObject())
   7. [isGoalVehicleAdjacent()](#isGoalVehicleAdjacent())
   8. [isGoalVehicleArea()](#isGoalVehicleArea())
   9. [isGoalVehicleSeat()](#isGoalVehicleSeat())
   10. [reset()](#reset())
   11. [pathToCharacter(IsoGameCharacter)](#pathToCharacter(zombie.characters.IsoGameCharacter))
   12. [pathToLocation(int, int, int)](#pathToLocation(int,int,int))
   13. [pathToLocationF(float, float, float)](#pathToLocationF(float,float,float))
   14. [pathToSound(int, int, int)](#pathToSound(int,int,int))
   15. [pathToNearest(TFloatArrayList)](#pathToNearest(gnu.trove.list.array.TFloatArrayList))
   16. [pathToNearestTable(KahluaTable)](#pathToNearestTable(se.krka.kahlua.vm.KahluaTable))
   17. [pathToSitOnFurniture(IsoObject, boolean)](#pathToSitOnFurniture(zombie.iso.IsoObject,boolean))
   18. [pathToSitOnFurnitureNoSpriteGrid(IsoObject, TFloatArrayList)](#pathToSitOnFurnitureNoSpriteGrid(zombie.iso.IsoObject,gnu.trove.list.array.TFloatArrayList))
   19. [isPointInSquare(float, float, int, int)](#isPointInSquare(float,float,int,int))
   20. [fixSitOnFurniturePath(float, float)](#fixSitOnFurniturePath(float,float))
   21. [shouldIgnoreCollisionWithSquare(IsoGridSquare)](#shouldIgnoreCollisionWithSquare(zombie.iso.IsoGridSquare))
   22. [pathToVehicleAdjacent(BaseVehicle)](#pathToVehicleAdjacent(zombie.vehicles.BaseVehicle))
   23. [pathToVehicleArea(BaseVehicle, String)](#pathToVehicleArea(zombie.vehicles.BaseVehicle,java.lang.String))
   24. [pathToVehicleSeat(BaseVehicle, int)](#pathToVehicleSeat(zombie.vehicles.BaseVehicle,int))
   25. [getGrabCorpseLocations(IsoDeadBody, List)](#getGrabCorpseLocations(zombie.iso.objects.IsoDeadBody,java.util.List))
   26. [pathToGrabCorpse(IsoDeadBody)](#pathToGrabCorpse(zombie.iso.objects.IsoDeadBody))
   27. [cancel()](#cancel())
   28. [getIsCancelled()](#getIsCancelled())
   29. [setData(float, float, float)](#setData(float,float,float))
   30. [getTargetX()](#getTargetX())
   31. [getTargetY()](#getTargetY())
   32. [getTargetZ()](#getTargetZ())
   33. [getPathLength()](#getPathLength())
   34. [getTargetChar()](#getTargetChar())
   35. [isTargetLocation(float, float, float)](#isTargetLocation(float,float,float))
   36. [update()](#update())
   37. [updateWhileRunningPathfind()](#updateWhileRunningPathfind())
   38. [moveToPoint(float, float, float)](#moveToPoint(float,float,float))
   39. [moveToDir(IsoMovingObject, float)](#moveToDir(zombie.iso.IsoMovingObject,float))
   40. [checkDoorHoppableWindow(float, float, float)](#checkDoorHoppableWindow(float,float,float))
   41. [checkCrawlingTransition(PathNode, PathNode, float)](#checkCrawlingTransition(zombie.pathfind.PathNode,zombie.pathfind.PathNode,float))
   42. [shouldGetUpFromCrawl()](#shouldGetUpFromCrawl())
   43. [shouldBeMoving()](#shouldBeMoving())
   44. [hasStartedMoving()](#hasStartedMoving())
   45. [allowTurnAnimation()](#allowTurnAnimation())
   46. [isTurningToObstacle()](#isTurningToObstacle())
   47. [isStrafing()](#isStrafing())
   48. [closestPointOnPath(float, float, float, IsoMovingObject, Path, PathFindBehavior2.PointOnPath)](#closestPointOnPath(float,float,float,zombie.iso.IsoMovingObject,zombie.pathfind.Path,zombie.pathfind.PathFindBehavior2.PointOnPath))
   49. [advanceAlongPath(float, float, float, float, PathFindBehavior2.PointOnPath)](#advanceAlongPath(float,float,float,float,zombie.pathfind.PathFindBehavior2.PointOnPath))
   50. [render()](#render())
   51. [Succeeded(Path, Mover)](#Succeeded(zombie.pathfind.Path,zombie.ai.astar.Mover))
   52. [Failed(Mover)](#Failed(zombie.ai.astar.Mover))
   53. [isMovingUsingPathFind()](#isMovingUsingPathFind())
   54. [isGoodChairAdjacentSquare(IsoGridSquare, IsoGridSquare)](#isGoodChairAdjacentSquare(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PathFindBehavior2
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.pathfind.PathFindBehavior2

All Implemented Interfaces:
:   `zombie.pathfind.IPathfinder`

---

public final class PathFindBehavior2
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.pathfind.IPathfinder

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `PathFindBehavior2.BehaviorResult`

  `private static final class`

  `PathFindBehavior2.DebugPt`

  `static enum`

  `PathFindBehavior2.Goal`

  `static final class`

  `PathFindBehavior2.PointOnPath`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final zombie.popman.ObjectPool<PathFindBehavior2.DebugPt>`

  `actualPool`

  `private final ArrayList<PathFindBehavior2.DebugPt>`

  `actualPos`

  `private final IsoGameCharacter`

  `chr`

  `private PathFindBehavior2.Goal`

  `goal`

  `private IsoGameCharacter`

  `goalCharacter`

  `private boolean`

  `goalSitOnFurnitureAnySpriteGridObject`

  `private IsoObject`

  `goalSitOnFurnitureObject`

  `private BaseVehicle`

  `goalVehicle`

  `private String`

  `goalVehicleArea`

  `private int`

  `goalVehicleSeat`

  `private boolean`

  `isCancel`

  `private final zombie.pathfind.Path`

  `path`

  `private int`

  `pathIndex`

  `boolean`

  `pathNextIsSet`

  `float`

  `pathNextX`

  `float`

  `pathNextY`

  `private static final PathFindBehavior2.PointOnPath`

  `pointOnPath`

  `private boolean`

  `startedMoving`

  `private float`

  `startX`

  `private float`

  `startY`

  `private float`

  `startZ`

  `boolean`

  `stopping`

  `private float`

  `targetX`

  `private final gnu.trove.list.array.TFloatArrayList`

  `targetXyz`

  `private float`

  `targetY`

  `private float`

  `targetZ`

  `private static final Vector2`

  `tempVector2`

  `private static final Vector2`

  `tempVector2_2`

  `private static final Vector3f`

  `tempVector3f_1`

  `private boolean`

  `turningToObstacle`

  `final zombie.ai.WalkingOnTheSpot`

  `walkingOnTheSpot`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PathFindBehavior2(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `advanceAlongPath(float x,
  float y,
  float z,
  float dist,
  PathFindBehavior2.PointOnPath pop)`

  `boolean`

  `allowTurnAnimation()`

  `void`

  `cancel()`

  `private void`

  `checkCrawlingTransition(zombie.pathfind.PathNode v1,
  zombie.pathfind.PathNode v2,
  float distTo)`

  `private boolean`

  `checkDoorHoppableWindow(float nx,
  float ny,
  float z)`

  `static void`

  `closestPointOnPath(float x3,
  float y3,
  float z,
  IsoMovingObject mover,
  zombie.pathfind.Path path,
  PathFindBehavior2.PointOnPath pop)`

  `void`

  `Failed(zombie.ai.astar.Mover mover)`

  `private void`

  `fixSitOnFurniturePath(float targetX,
  float targetY)`

  `IsoObject`

  `getGoalSitOnFurnitureObject()`

  `private void`

  `getGrabCorpseLocations(IsoDeadBody targetBody,
  List<Vector2f> possibleTargetPositions)`

  `boolean`

  `getIsCancelled()`

  `float`

  `getPathLength()`

  `IsoGameCharacter`

  `getTargetChar()`

  `float`

  `getTargetX()`

  `float`

  `getTargetY()`

  `float`

  `getTargetZ()`

  `boolean`

  `hasStartedMoving()`

  `boolean`

  `isGoalCharacter()`

  `boolean`

  `isGoalLocation()`

  `boolean`

  `isGoalNone()`

  `boolean`

  `isGoalSitOnFurniture()`

  `boolean`

  `isGoalSound()`

  `boolean`

  `isGoalVehicleAdjacent()`

  `boolean`

  `isGoalVehicleArea()`

  `boolean`

  `isGoalVehicleSeat()`

  `boolean`

  `isGoodChairAdjacentSquare(IsoGridSquare targetSquare,
  IsoGridSquare adjacentSquare)`

  `boolean`

  `isMovingUsingPathFind()`

  `private boolean`

  `isPointInSquare(float x,
  float y,
  int squareX,
  int squareY)`

  `boolean`

  `isStrafing()`

  `boolean`

  `isTargetLocation(float x,
  float y,
  float z)`

  `boolean`

  `isTurningToObstacle()`

  `void`

  `moveToDir(IsoMovingObject target,
  float speedMul)`

  `void`

  `moveToPoint(float x,
  float y,
  float speedMul)`

  `void`

  `pathToCharacter(IsoGameCharacter target)`

  `void`

  `pathToGrabCorpse(IsoDeadBody targetBody)`

  `void`

  `pathToLocation(int x,
  int y,
  int z)`

  `void`

  `pathToLocationF(float x,
  float y,
  float z)`

  `void`

  `pathToNearest(gnu.trove.list.array.TFloatArrayList locations)`

  `void`

  `pathToNearestTable(se.krka.kahlua.vm.KahluaTable locationsTable)`

  `void`

  `pathToSitOnFurniture(IsoObject furniture,
  boolean bAnySpriteGridObject)`

  `private void`

  `pathToSitOnFurnitureNoSpriteGrid(IsoObject furniture,
  gnu.trove.list.array.TFloatArrayList locations)`

  `void`

  `pathToSound(int x,
  int y,
  int z)`

  `void`

  `pathToVehicleAdjacent(BaseVehicle vehicle)`

  `void`

  `pathToVehicleArea(BaseVehicle vehicle,
  String areaId)`

  `void`

  `pathToVehicleSeat(BaseVehicle vehicle,
  int seat)`

  `void`

  `render()`

  `void`

  `reset()`

  `void`

  `setData(float targetX,
  float targetY,
  float targetZ)`

  `boolean`

  `shouldBeMoving()`

  `boolean`

  `shouldGetUpFromCrawl()`

  `boolean`

  `shouldIgnoreCollisionWithSquare(IsoGridSquare square)`

  `void`

  `Succeeded(zombie.pathfind.Path path,
  zombie.ai.astar.Mover mover)`

  `PathFindBehavior2.BehaviorResult`

  `update()`

  `private void`

  `updateWhileRunningPathfind()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempVector2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2
  + ### tempVector2\_2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2\_2
  + ### tempVector3f\_1

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f\_1
  + ### pointOnPath

    private static final [PathFindBehavior2.PointOnPath](PathFindBehavior2.PointOnPath.html "class in zombie.pathfind") pointOnPath
  + ### pathNextIsSet

    public boolean pathNextIsSet
  + ### pathNextX

    public float pathNextX
  + ### pathNextY

    public float pathNextY
  + ### chr

    private final [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr
  + ### startX

    private float startX
  + ### startY

    private float startY
  + ### startZ

    private float startZ
  + ### targetX

    private float targetX
  + ### targetY

    private float targetY
  + ### targetZ

    private float targetZ
  + ### targetXyz

    private final gnu.trove.list.array.TFloatArrayList targetXyz
  + ### path

    private final zombie.pathfind.Path path
  + ### pathIndex

    private int pathIndex
  + ### isCancel

    private boolean isCancel
  + ### startedMoving

    private boolean startedMoving
  + ### stopping

    public boolean stopping
  + ### turningToObstacle

    private boolean turningToObstacle
  + ### walkingOnTheSpot

    public final zombie.ai.WalkingOnTheSpot walkingOnTheSpot
  + ### actualPos

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PathFindBehavior2.DebugPt](PathFindBehavior2.DebugPt.html "class in zombie.pathfind")> actualPos
  + ### actualPool

    private static final zombie.popman.ObjectPool<[PathFindBehavior2.DebugPt](PathFindBehavior2.DebugPt.html "class in zombie.pathfind")> actualPool
  + ### goal

    private [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") goal
  + ### goalCharacter

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") goalCharacter
  + ### goalSitOnFurnitureObject

    private [IsoObject](../iso/IsoObject.html "class in zombie.iso") goalSitOnFurnitureObject
  + ### goalSitOnFurnitureAnySpriteGridObject

    private boolean goalSitOnFurnitureAnySpriteGridObject
  + ### goalVehicle

    private [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") goalVehicle
  + ### goalVehicleArea

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") goalVehicleArea
  + ### goalVehicleSeat

    private int goalVehicleSeat
* Constructor Details
  -------------------

  + ### PathFindBehavior2

    public PathFindBehavior2([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### isGoalNone

    public boolean isGoalNone()
  + ### isGoalCharacter

    public boolean isGoalCharacter()
  + ### isGoalLocation

    public boolean isGoalLocation()
  + ### isGoalSound

    public boolean isGoalSound()
  + ### isGoalSitOnFurniture

    public boolean isGoalSitOnFurniture()
  + ### getGoalSitOnFurnitureObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getGoalSitOnFurnitureObject()
  + ### isGoalVehicleAdjacent

    public boolean isGoalVehicleAdjacent()
  + ### isGoalVehicleArea

    public boolean isGoalVehicleArea()
  + ### isGoalVehicleSeat

    public boolean isGoalVehicleSeat()
  + ### reset

    public void reset()
  + ### pathToCharacter

    public void pathToCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target)
  + ### pathToLocation

    public void pathToLocation(int x,
    int y,
    int z)
  + ### pathToLocationF

    public void pathToLocationF(float x,
    float y,
    float z)
  + ### pathToSound

    public void pathToSound(int x,
    int y,
    int z)
  + ### pathToNearest

    public void pathToNearest(gnu.trove.list.array.TFloatArrayList locations)
  + ### pathToNearestTable

    public void pathToNearestTable(se.krka.kahlua.vm.KahluaTable locationsTable)
  + ### pathToSitOnFurniture

    public void pathToSitOnFurniture([IsoObject](../iso/IsoObject.html "class in zombie.iso") furniture,
    boolean bAnySpriteGridObject)
  + ### pathToSitOnFurnitureNoSpriteGrid

    private void pathToSitOnFurnitureNoSpriteGrid([IsoObject](../iso/IsoObject.html "class in zombie.iso") furniture,
    gnu.trove.list.array.TFloatArrayList locations)
  + ### isPointInSquare

    private boolean isPointInSquare(float x,
    float y,
    int squareX,
    int squareY)
  + ### fixSitOnFurniturePath

    private void fixSitOnFurniturePath(float targetX,
    float targetY)
  + ### shouldIgnoreCollisionWithSquare

    public boolean shouldIgnoreCollisionWithSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### pathToVehicleAdjacent

    public void pathToVehicleAdjacent([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### pathToVehicleArea

    public void pathToVehicleArea([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId)
  + ### pathToVehicleSeat

    public void pathToVehicleSeat([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    int seat)
  + ### getGrabCorpseLocations

    private void getGrabCorpseLocations([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") targetBody,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Vector2f](../../org/joml/Vector2f.html "class in org.joml")> possibleTargetPositions)
  + ### pathToGrabCorpse

    public void pathToGrabCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") targetBody)
  + ### cancel

    public void cancel()
  + ### getIsCancelled

    public boolean getIsCancelled()
  + ### setData

    public void setData(float targetX,
    float targetY,
    float targetZ)
  + ### getTargetX

    public float getTargetX()
  + ### getTargetY

    public float getTargetY()
  + ### getTargetZ

    public float getTargetZ()
  + ### getPathLength

    public float getPathLength()
  + ### getTargetChar

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getTargetChar()
  + ### isTargetLocation

    public boolean isTargetLocation(float x,
    float y,
    float z)
  + ### update

    public [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind") update()
  + ### updateWhileRunningPathfind

    private void updateWhileRunningPathfind()
  + ### moveToPoint

    public void moveToPoint(float x,
    float y,
    float speedMul)
  + ### moveToDir

    public void moveToDir([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target,
    float speedMul)
  + ### checkDoorHoppableWindow

    private boolean checkDoorHoppableWindow(float nx,
    float ny,
    float z)
  + ### checkCrawlingTransition

    private void checkCrawlingTransition(zombie.pathfind.PathNode v1,
    zombie.pathfind.PathNode v2,
    float distTo)
  + ### shouldGetUpFromCrawl

    public boolean shouldGetUpFromCrawl()
  + ### shouldBeMoving

    public boolean shouldBeMoving()
  + ### hasStartedMoving

    public boolean hasStartedMoving()
  + ### allowTurnAnimation

    public boolean allowTurnAnimation()
  + ### isTurningToObstacle

    public boolean isTurningToObstacle()
  + ### isStrafing

    public boolean isStrafing()
  + ### closestPointOnPath

    public static void closestPointOnPath(float x3,
    float y3,
    float z,
    [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") mover,
    zombie.pathfind.Path path,
    [PathFindBehavior2.PointOnPath](PathFindBehavior2.PointOnPath.html "class in zombie.pathfind") pop)
  + ### advanceAlongPath

    void advanceAlongPath(float x,
    float y,
    float z,
    float dist,
    [PathFindBehavior2.PointOnPath](PathFindBehavior2.PointOnPath.html "class in zombie.pathfind") pop)
  + ### render

    public void render()
  + ### Succeeded

    public void Succeeded(zombie.pathfind.Path path,
    zombie.ai.astar.Mover mover)

    Specified by:
    :   `Succeeded` in interface `zombie.pathfind.IPathfinder`
  + ### Failed

    public void Failed(zombie.ai.astar.Mover mover)

    Specified by:
    :   `Failed` in interface `zombie.pathfind.IPathfinder`
  + ### isMovingUsingPathFind

    public boolean isMovingUsingPathFind()
  + ### isGoodChairAdjacentSquare

    public boolean isGoodChairAdjacentSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") targetSquare,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") adjacentSquare)