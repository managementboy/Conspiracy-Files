[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ClimbThroughWindowState](ClimbThroughWindowState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SOUND\_RADIUS](#SOUND_RADIUS)
   2. [INSTANCE](#INSTANCE)
   3. [PARAMS](#PARAMS)
   4. [PREV\_STATE](#PREV_STATE)
   5. [ZOMBIE\_ON\_FLOOR](#ZOMBIE_ON_FLOOR)
   6. [OUTCOME](#OUTCOME)
   7. [SCRATCHED](#SCRATCHED)
7. [Constructor Details](#constructor-detail)
   1. [ClimbThroughWindowState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [slideCharacterToWindowOpening(IsoGameCharacter, ClimbThroughWindowPositioningParams)](#slideCharacterToWindowOpening(zombie.characters.IsoGameCharacter,zombie.ai.states.ClimbThroughWindowPositioningParams))
   5. [checkForFallingBack(IsoGridSquare, IsoGameCharacter)](#checkForFallingBack(zombie.iso.IsoGridSquare,zombie.characters.IsoGameCharacter))
   6. [checkForFallingFront(IsoGridSquare, IsoGameCharacter)](#checkForFallingFront(zombie.iso.IsoGridSquare,zombie.characters.IsoGameCharacter))
   7. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   8. [slideX(IsoGameCharacter, float)](#slideX(zombie.characters.IsoGameCharacter,float))
   9. [slideY(IsoGameCharacter, float)](#slideY(zombie.characters.IsoGameCharacter,float))
   10. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   11. [isIgnoreCollide(IsoGameCharacter, int, int, int, int, int, int)](#isIgnoreCollide(zombie.characters.IsoGameCharacter,int,int,int,int,int,int))
   12. [getWindow(IsoGameCharacter)](#getWindow(zombie.characters.IsoGameCharacter))
   13. [isWindowClosing(IsoGameCharacter)](#isWindowClosing(zombie.characters.IsoGameCharacter))
   14. [getDeltaModifiers(IsoGameCharacter, MoveDeltaModifiers)](#getDeltaModifiers(zombie.characters.IsoGameCharacter,zombie.characters.MoveDeltaModifiers))
   15. [isFreeSquare(IsoGridSquare)](#isFreeSquare(zombie.iso.IsoGridSquare))
   16. [isObstacleSquare(IsoGridSquare)](#isObstacleSquare(zombie.iso.IsoGridSquare))
   17. [getFreeSquareAfterObstacles(IsoGridSquare, IsoDirections)](#getFreeSquareAfterObstacles(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   18. [setLungeXVars(IsoZombie)](#setLungeXVars(zombie.characters.IsoZombie))
   19. [isPastInnerEdgeOfSquare(IsoGameCharacter, int, int, IsoDirections)](#isPastInnerEdgeOfSquare(zombie.characters.IsoGameCharacter,int,int,zombie.iso.IsoDirections))
   20. [isPastOuterEdgeOfSquare(IsoGameCharacter, int, int, IsoDirections)](#isPastOuterEdgeOfSquare(zombie.characters.IsoGameCharacter,int,int,zombie.iso.IsoDirections))
   21. [setParams(IsoGameCharacter, IsoObject)](#setParams(zombie.characters.IsoGameCharacter,zombie.iso.IsoObject))
   22. [getClimbThroughWindowPositioningParams(IsoGameCharacter, IsoObject, ClimbThroughWindowPositioningParams)](#getClimbThroughWindowPositioningParams(zombie.characters.IsoGameCharacter,zombie.iso.IsoObject,zombie.ai.states.ClimbThroughWindowPositioningParams))
   23. [getPositioningParams(IsoGameCharacter)](#getPositioningParams(zombie.characters.IsoGameCharacter))
   24. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   25. [isProcessedOnEnter()](#isProcessedOnEnter())
   26. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   27. [canRagdoll(IsoGameCharacter)](#canRagdoll(zombie.characters.IsoGameCharacter))
   28. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimbThroughWindowState
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ClimbThroughWindowState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ClimbThroughWindowState
extends zombie.ai.State

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.ai.State

  `zombie.ai.State.Param<T>, zombie.ai.State.Stage`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ClimbThroughWindowState`

  `INSTANCE`

  `static final zombie.ai.State.Param<String>`

  `OUTCOME`

  `static final zombie.ai.State.Param<zombie.ai.states.ClimbThroughWindowPositioningParams>`

  `PARAMS`

  `static final zombie.ai.State.Param<zombie.ai.State>`

  `PREV_STATE`

  `static final zombie.ai.State.Param<Boolean>`

  `SCRATCHED`

  `private static final int`

  `SOUND_RADIUS`

  `static final zombie.ai.State.Param<Boolean>`

  `ZOMBIE_ON_FLOOR`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ClimbThroughWindowState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `animEvent(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `boolean`

  `canRagdoll(IsoGameCharacter owner)`

  Can the character that owns this state become a ragdoll.

  `private void`

  `checkForFallingBack(IsoGridSquare sq,
  IsoGameCharacter owner)`

  `private void`

  `checkForFallingFront(IsoGridSquare sq,
  IsoGameCharacter owner)`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static void`

  `getClimbThroughWindowPositioningParams(IsoGameCharacter climbingCharacter,
  IsoObject windowObject,
  zombie.ai.states.ClimbThroughWindowPositioningParams climbParams)`

  `void`

  `getDeltaModifiers(IsoGameCharacter owner,
  MoveDeltaModifiers modifiers)`

  `static IsoGridSquare`

  `getFreeSquareAfterObstacles(IsoGridSquare square,
  IsoDirections dir)`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `zombie.ai.states.ClimbThroughWindowPositioningParams`

  `getPositioningParams(IsoGameCharacter owner)`

  `IsoObject`

  `getWindow(IsoGameCharacter owner)`

  `static ClimbThroughWindowState`

  `instance()`

  `static boolean`

  `isFreeSquare(IsoGridSquare square)`

  `boolean`

  `isIgnoreCollide(IsoGameCharacter owner,
  int fromX,
  int fromY,
  int fromZ,
  int toX,
  int toY,
  int toZ)`

  Return TRUE if the owner should ignore collisions when passing between two squares.

  `static boolean`

  `isObstacleSquare(IsoGridSquare square)`

  `boolean`

  `isPastInnerEdgeOfSquare(IsoGameCharacter owner,
  int x,
  int y,
  IsoDirections moveDir)`

  `boolean`

  `isPastOuterEdgeOfSquare(IsoGameCharacter owner,
  int x,
  int y,
  IsoDirections moveDir)`

  `boolean`

  `isProcessedOnEnter()`

  `boolean`

  `isWindowClosing(IsoGameCharacter owner)`

  `void`

  `processOnEnter(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `private void`

  `setLungeXVars(IsoZombie zombie)`

  `void`

  `setParams(IsoGameCharacter owner,
  zombie.ai.State.Stage stage)`

  `void`

  `setParams(IsoGameCharacter owner,
  IsoObject obj)`

  `static void`

  `slideCharacterToWindowOpening(IsoGameCharacter character,
  zombie.ai.states.ClimbThroughWindowPositioningParams positioningParams)`

  `static void`

  `slideX(IsoGameCharacter owner,
  float x)`

  `static void`

  `slideY(IsoGameCharacter owner,
  float y)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getName, getParams, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnExit`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### SOUND\_RADIUS

    private static final int SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbThroughWindowState.SOUND_RADIUS)
  + ### INSTANCE

    private static final [ClimbThroughWindowState](ClimbThroughWindowState.html "class in zombie.ai.states") INSTANCE
  + ### PARAMS

    public static final zombie.ai.State.Param<zombie.ai.states.ClimbThroughWindowPositioningParams> PARAMS
  + ### PREV\_STATE

    public static final zombie.ai.State.Param<zombie.ai.State> PREV\_STATE
  + ### ZOMBIE\_ON\_FLOOR

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> ZOMBIE\_ON\_FLOOR
  + ### OUTCOME

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> OUTCOME
  + ### SCRATCHED

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SCRATCHED
* Constructor Details
  -------------------

  + ### ClimbThroughWindowState

    private ClimbThroughWindowState()
* Method Details
  --------------

  + ### instance

    public static [ClimbThroughWindowState](ClimbThroughWindowState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### slideCharacterToWindowOpening

    public static void slideCharacterToWindowOpening([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    zombie.ai.states.ClimbThroughWindowPositioningParams positioningParams)
  + ### checkForFallingBack

    private void checkForFallingBack([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### checkForFallingFront

    private void checkForFallingFront([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### slideX

    public static void slideX([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float x)
  + ### slideY

    public static void slideY([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float y)
  + ### animEvent

    public void animEvent([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)

    Specified by:
    :   `animEvent` in interface `zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener`

    Specified by:
    :   `animEvent` in interface `zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

    Overrides:
    :   `animEvent` in class `zombie.ai.State`
  + ### isIgnoreCollide

    public boolean isIgnoreCollide([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int fromX,
    int fromY,
    int fromZ,
    int toX,
    int toY,
    int toZ)

    Description copied from class: `zombie.ai.State`

    Return TRUE if the owner should ignore collisions when passing between two squares. Defaults to FALSE

    Overrides:
    :   `isIgnoreCollide` in class `zombie.ai.State`
  + ### getWindow

    public [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getWindow([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### isWindowClosing

    public boolean isWindowClosing([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getDeltaModifiers

    public void getDeltaModifiers([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [MoveDeltaModifiers](../../characters/MoveDeltaModifiers.html "class in zombie.characters") modifiers)

    Overrides:
    :   `getDeltaModifiers` in class `zombie.ai.State`
  + ### isFreeSquare

    public static boolean isFreeSquare([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isObstacleSquare

    public static boolean isObstacleSquare([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getFreeSquareAfterObstacles

    public static [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getFreeSquareAfterObstacles([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### setLungeXVars

    private void setLungeXVars([IsoZombie](../../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### isPastInnerEdgeOfSquare

    public boolean isPastInnerEdgeOfSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int x,
    int y,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") moveDir)
  + ### isPastOuterEdgeOfSquare

    public boolean isPastOuterEdgeOfSquare([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int x,
    int y,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") moveDir)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getClimbThroughWindowPositioningParams

    public static void getClimbThroughWindowPositioningParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") climbingCharacter,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") windowObject,
    zombie.ai.states.ClimbThroughWindowPositioningParams climbParams)
  + ### getPositioningParams

    public zombie.ai.states.ClimbThroughWindowPositioningParams getPositioningParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.ai.State.Stage stage)

    Overrides:
    :   `setParams` in class `zombie.ai.State`
  + ### isProcessedOnEnter

    public boolean isProcessedOnEnter()

    Overrides:
    :   `isProcessedOnEnter` in class `zombie.ai.State`
  + ### processOnEnter

    public void processOnEnter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnEnter` in class `zombie.ai.State`
  + ### canRagdoll

    public boolean canRagdoll([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Description copied from interface: `zombie.ai.IStateFlagsSource`

    Can the character that owns this state become a ragdoll. If FALSE, the character cannot.
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()

    Overrides:
    :   `getMinimumSimulationLevel` in class `zombie.ai.State`