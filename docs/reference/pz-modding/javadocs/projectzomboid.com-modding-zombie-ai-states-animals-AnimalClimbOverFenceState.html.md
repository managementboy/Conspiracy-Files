[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.ai.states.animals](package-summary.html)
2. [AnimalClimbOverFenceState](AnimalClimbOverFenceState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [START\_X](#START_X)
   3. [START\_Y](#START_Y)
   4. [Z](#Z)
   5. [END\_X](#END_X)
   6. [END\_Y](#END_Y)
   7. [DIR](#DIR)
   8. [ZOMBIE\_ON\_FLOOR](#ZOMBIE_ON_FLOOR)
   9. [PREV\_STATE](#PREV_STATE)
   10. [SCRATCH](#SCRATCH)
   11. [COUNTER](#COUNTER)
   12. [SOLID\_FLOOR](#SOLID_FLOOR)
   13. [SHEET\_ROPE](#SHEET_ROPE)
   14. [RUN](#RUN)
   15. [SPRINT](#SPRINT)
   16. [COLLIDABLE](#COLLIDABLE)
   17. [FENCE\_TYPE\_WOOD](#FENCE_TYPE_WOOD)
   18. [FENCE\_TYPE\_METAL](#FENCE_TYPE_METAL)
   19. [FENCE\_TYPE\_SANDBAG](#FENCE_TYPE_SANDBAG)
   20. [FENCE\_TYPE\_GRAVELBAG](#FENCE_TYPE_GRAVELBAG)
   21. [FENCE\_TYPE\_BARBWIRE](#FENCE_TYPE_BARBWIRE)
   22. [FENCE\_TYPE\_ROADBLOCK](#FENCE_TYPE_ROADBLOCK)
   23. [FENCE\_TYPE\_METAL\_BARS](#FENCE_TYPE_METAL_BARS)
   24. [TRIP\_WOOD](#TRIP_WOOD)
   25. [TRIP\_METAL](#TRIP_METAL)
   26. [TRIP\_SANDBAG](#TRIP_SANDBAG)
   27. [TRIP\_GRAVELBAG](#TRIP_GRAVELBAG)
   28. [TRIP\_BARBWIRE](#TRIP_BARBWIRE)
   29. [TRIP\_TREE](#TRIP_TREE)
   30. [TRIP\_ZOMBIE](#TRIP_ZOMBIE)
   31. [COLLIDE\_WITH\_WALL](#COLLIDE_WITH_WALL)
   32. [TRIP\_METAL\_BARS](#TRIP_METAL_BARS)
   33. [TRIP\_WINDOW](#TRIP_WINDOW)
7. [Constructor Details](#constructor-detail)
   1. [AnimalClimbOverFenceState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [isIgnoreCollide(IsoGameCharacter, int, int, int, int, int, int)](#isIgnoreCollide(zombie.characters.IsoGameCharacter,int,int,int,int,int,int))
   7. [slideX(IsoGameCharacter, float)](#slideX(zombie.characters.IsoGameCharacter,float))
   8. [slideY(IsoGameCharacter, float)](#slideY(zombie.characters.IsoGameCharacter,float))
   9. [getFence(IsoGameCharacter)](#getFence(zombie.characters.IsoGameCharacter))
   10. [getFenceType(IsoObject)](#getFenceType(zombie.iso.IsoObject))
   11. [getTripType(IsoObject)](#getTripType(zombie.iso.IsoObject))
   12. [setParams(IsoGameCharacter, IsoDirections)](#setParams(zombie.characters.IsoGameCharacter,zombie.iso.IsoDirections))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AnimalClimbOverFenceState
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.animals.AnimalClimbOverFenceState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class AnimalClimbOverFenceState
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

  `static final zombie.ai.State.Param<Boolean>`

  `COLLIDABLE`

  `static final int`

  `COLLIDE_WITH_WALL`

  `static final zombie.ai.State.Param<Boolean>`

  `COUNTER`

  `static final zombie.ai.State.Param<IsoDirections>`

  `DIR`

  `static final zombie.ai.State.Param<Integer>`

  `END_X`

  `static final zombie.ai.State.Param<Integer>`

  `END_Y`

  `(package private) static final int`

  `FENCE_TYPE_BARBWIRE`

  `(package private) static final int`

  `FENCE_TYPE_GRAVELBAG`

  `(package private) static final int`

  `FENCE_TYPE_METAL`

  `(package private) static final int`

  `FENCE_TYPE_METAL_BARS`

  `(package private) static final int`

  `FENCE_TYPE_ROADBLOCK`

  `(package private) static final int`

  `FENCE_TYPE_SANDBAG`

  `(package private) static final int`

  `FENCE_TYPE_WOOD`

  `private static final AnimalClimbOverFenceState`

  `INSTANCE`

  `static final zombie.ai.State.Param<zombie.ai.State>`

  `PREV_STATE`

  `static final zombie.ai.State.Param<Boolean>`

  `RUN`

  `static final zombie.ai.State.Param<Boolean>`

  `SCRATCH`

  `static final zombie.ai.State.Param<Boolean>`

  `SHEET_ROPE`

  `static final zombie.ai.State.Param<Boolean>`

  `SOLID_FLOOR`

  `static final zombie.ai.State.Param<Boolean>`

  `SPRINT`

  `static final zombie.ai.State.Param<Integer>`

  `START_X`

  `static final zombie.ai.State.Param<Integer>`

  `START_Y`

  `(package private) static final int`

  `TRIP_BARBWIRE`

  `(package private) static final int`

  `TRIP_GRAVELBAG`

  `(package private) static final int`

  `TRIP_METAL`

  `static final int`

  `TRIP_METAL_BARS`

  `(package private) static final int`

  `TRIP_SANDBAG`

  `static final int`

  `TRIP_TREE`

  `static final int`

  `TRIP_WINDOW`

  `(package private) static final int`

  `TRIP_WOOD`

  `static final int`

  `TRIP_ZOMBIE`

  `static final zombie.ai.State.Param<Integer>`

  `Z`

  `static final zombie.ai.State.Param<Boolean>`

  `ZOMBIE_ON_FLOOR`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AnimalClimbOverFenceState()`
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

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `private IsoObject`

  `getFence(IsoGameCharacter owner)`

  `private int`

  `getFenceType(IsoObject fence)`

  `private int`

  `getTripType(IsoObject fence)`

  `static AnimalClimbOverFenceState`

  `instance()`

  `boolean`

  `isIgnoreCollide(IsoGameCharacter owner,
  int fromX,
  int fromY,
  int fromZ,
  int toX,
  int toY,
  int toZ)`

  Return TRUE if the owner should ignore collisions when passing between two squares.

  `void`

  `setParams(IsoGameCharacter owner,
  IsoDirections dir)`

  `private void`

  `slideX(IsoGameCharacter owner,
  float x)`

  `private void`

  `slideY(IsoGameCharacter owner,
  float y)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [AnimalClimbOverFenceState](AnimalClimbOverFenceState.html "class in zombie.ai.states.animals") INSTANCE
  + ### START\_X

    public static final zombie.ai.State.Param<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> START\_X
  + ### START\_Y

    public static final zombie.ai.State.Param<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> START\_Y
  + ### Z

    public static final zombie.ai.State.Param<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> Z
  + ### END\_X

    public static final zombie.ai.State.Param<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> END\_X
  + ### END\_Y

    public static final zombie.ai.State.Param<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> END\_Y
  + ### DIR

    public static final zombie.ai.State.Param<[IsoDirections](../../../iso/IsoDirections.html "enum class in zombie.iso")> DIR
  + ### ZOMBIE\_ON\_FLOOR

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> ZOMBIE\_ON\_FLOOR
  + ### PREV\_STATE

    public static final zombie.ai.State.Param<zombie.ai.State> PREV\_STATE
  + ### SCRATCH

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SCRATCH
  + ### COUNTER

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> COUNTER
  + ### SOLID\_FLOOR

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SOLID\_FLOOR
  + ### SHEET\_ROPE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SHEET\_ROPE
  + ### RUN

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> RUN
  + ### SPRINT

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SPRINT
  + ### COLLIDABLE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> COLLIDABLE
  + ### FENCE\_TYPE\_WOOD

    static final int FENCE\_TYPE\_WOOD

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_WOOD)
  + ### FENCE\_TYPE\_METAL

    static final int FENCE\_TYPE\_METAL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_METAL)
  + ### FENCE\_TYPE\_SANDBAG

    static final int FENCE\_TYPE\_SANDBAG

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_SANDBAG)
  + ### FENCE\_TYPE\_GRAVELBAG

    static final int FENCE\_TYPE\_GRAVELBAG

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_GRAVELBAG)
  + ### FENCE\_TYPE\_BARBWIRE

    static final int FENCE\_TYPE\_BARBWIRE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_BARBWIRE)
  + ### FENCE\_TYPE\_ROADBLOCK

    static final int FENCE\_TYPE\_ROADBLOCK

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_ROADBLOCK)
  + ### FENCE\_TYPE\_METAL\_BARS

    static final int FENCE\_TYPE\_METAL\_BARS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.FENCE_TYPE_METAL_BARS)
  + ### TRIP\_WOOD

    static final int TRIP\_WOOD

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_WOOD)
  + ### TRIP\_METAL

    static final int TRIP\_METAL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_METAL)
  + ### TRIP\_SANDBAG

    static final int TRIP\_SANDBAG

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_SANDBAG)
  + ### TRIP\_GRAVELBAG

    static final int TRIP\_GRAVELBAG

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_GRAVELBAG)
  + ### TRIP\_BARBWIRE

    static final int TRIP\_BARBWIRE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_BARBWIRE)
  + ### TRIP\_TREE

    public static final int TRIP\_TREE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_TREE)
  + ### TRIP\_ZOMBIE

    public static final int TRIP\_ZOMBIE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_ZOMBIE)
  + ### COLLIDE\_WITH\_WALL

    public static final int COLLIDE\_WITH\_WALL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.COLLIDE_WITH_WALL)
  + ### TRIP\_METAL\_BARS

    public static final int TRIP\_METAL\_BARS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_METAL_BARS)
  + ### TRIP\_WINDOW

    public static final int TRIP\_WINDOW

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.ai.states.animals.AnimalClimbOverFenceState.TRIP_WINDOW)
* Constructor Details
  -------------------

  + ### AnimalClimbOverFenceState

    private AnimalClimbOverFenceState()
* Method Details
  --------------

  + ### instance

    public static [AnimalClimbOverFenceState](AnimalClimbOverFenceState.html "class in zombie.ai.states.animals") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### exit

    public void exit([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### animEvent

    public void animEvent([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
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

    public boolean isIgnoreCollide([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
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
  + ### slideX

    private void slideX([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float x)
  + ### slideY

    private void slideY([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float y)
  + ### getFence

    private [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") getFence([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getFenceType

    private int getFenceType([IsoObject](../../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### getTripType

    private int getTripType([IsoObject](../../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### setParams

    public void setParams([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoDirections](../../../iso/IsoDirections.html "enum class in zombie.iso") dir)