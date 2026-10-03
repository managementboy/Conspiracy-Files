[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ClimbOverWallState](ClimbOverWallState.html)

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
   8. [STRUGGLE](#STRUGGLE)
   9. [SUCCESS](#SUCCESS)
   10. [STRAIN](#STRAIN)
   11. [FENCE\_TYPE\_WOOD](#FENCE_TYPE_WOOD)
   12. [FENCE\_TYPE\_METAL](#FENCE_TYPE_METAL)
   13. [FENCE\_TYPE\_METAL\_BARS](#FENCE_TYPE_METAL_BARS)
7. [Constructor Details](#constructor-detail)
   1. [ClimbOverWallState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [isIgnoreCollide(IsoGameCharacter, int, int, int, int, int, int)](#isIgnoreCollide(zombie.characters.IsoGameCharacter,int,int,int,int,int,int))
   7. [getClimbableWallN(IsoGridSquare)](#getClimbableWallN(zombie.iso.IsoGridSquare))
   8. [getClimbableWallW(IsoGridSquare)](#getClimbableWallW(zombie.iso.IsoGridSquare))
   9. [getFence(IsoGameCharacter)](#getFence(zombie.characters.IsoGameCharacter))
   10. [getFenceType(IsoObject)](#getFenceType(zombie.iso.IsoObject))
   11. [setParams(IsoGameCharacter, IsoDirections)](#setParams(zombie.characters.IsoGameCharacter,zombie.iso.IsoDirections))
   12. [isProcessedOnEnter()](#isProcessedOnEnter())
   13. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   14. [isProcessedOnExit()](#isProcessedOnExit())
   15. [processOnExit(IsoGameCharacter, Map)](#processOnExit(zombie.characters.IsoGameCharacter,java.util.Map))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimbOverWallState
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ClimbOverWallState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ClimbOverWallState
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

  `static final zombie.ai.State.Param<IsoDirections>`

  `DIR`

  `static final zombie.ai.State.Param<Integer>`

  `END_X`

  `static final zombie.ai.State.Param<Integer>`

  `END_Y`

  `(package private) static final int`

  `FENCE_TYPE_METAL`

  `(package private) static final int`

  `FENCE_TYPE_METAL_BARS`

  `(package private) static final int`

  `FENCE_TYPE_WOOD`

  `private static final ClimbOverWallState`

  `INSTANCE`

  `static final zombie.ai.State.Param<Integer>`

  `START_X`

  `static final zombie.ai.State.Param<Integer>`

  `START_Y`

  `static final zombie.ai.State.Param<Float>`

  `STRAIN`

  `static final zombie.ai.State.Param<Boolean>`

  `STRUGGLE`

  `static final zombie.ai.State.Param<Boolean>`

  `SUCCESS`

  `static final zombie.ai.State.Param<Integer>`

  `Z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ClimbOverWallState()`
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

  `getClimbableWallN(IsoGridSquare square)`

  `private IsoObject`

  `getClimbableWallW(IsoGridSquare square)`

  `private IsoObject`

  `getFence(IsoGameCharacter owner)`

  `private int`

  `getFenceType(IsoObject fence)`

  `static ClimbOverWallState`

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

  `boolean`

  `isProcessedOnEnter()`

  `boolean`

  `isProcessedOnExit()`

  `void`

  `processOnEnter(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `void`

  `processOnExit(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `void`

  `setParams(IsoGameCharacter owner,
  IsoDirections dir)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [ClimbOverWallState](ClimbOverWallState.html "class in zombie.ai.states") INSTANCE
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

    public static final zombie.ai.State.Param<[IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso")> DIR
  + ### STRUGGLE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> STRUGGLE
  + ### SUCCESS

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SUCCESS
  + ### STRAIN

    public static final zombie.ai.State.Param<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> STRAIN
  + ### FENCE\_TYPE\_WOOD

    static final int FENCE\_TYPE\_WOOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbOverWallState.FENCE_TYPE_WOOD)
  + ### FENCE\_TYPE\_METAL

    static final int FENCE\_TYPE\_METAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbOverWallState.FENCE_TYPE_METAL)
  + ### FENCE\_TYPE\_METAL\_BARS

    static final int FENCE\_TYPE\_METAL\_BARS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbOverWallState.FENCE_TYPE_METAL_BARS)
* Constructor Details
  -------------------

  + ### ClimbOverWallState

    private ClimbOverWallState()
* Method Details
  --------------

  + ### instance

    public static [ClimbOverWallState](ClimbOverWallState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
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
  + ### getClimbableWallN

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getClimbableWallN([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getClimbableWallW

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getClimbableWallW([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getFence

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getFence([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getFenceType

    private int getFenceType([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### isProcessedOnEnter

    public boolean isProcessedOnEnter()

    Overrides:
    :   `isProcessedOnEnter` in class `zombie.ai.State`
  + ### processOnEnter

    public void processOnEnter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnEnter` in class `zombie.ai.State`
  + ### isProcessedOnExit

    public boolean isProcessedOnExit()

    Overrides:
    :   `isProcessedOnExit` in class `zombie.ai.State`
  + ### processOnExit

    public void processOnExit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnExit` in class `zombie.ai.State`