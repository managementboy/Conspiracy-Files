[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [PlayerSitOnFurnitureState](PlayerSitOnFurnitureState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [DIRECTIONS](#DIRECTIONS)
   3. [DIR](#DIR)
   4. [SIT\_OBJECT](#SIT_OBJECT)
   5. [BEFORE\_SIT\_DIR](#BEFORE_SIT_DIR)
7. [Constructor Details](#constructor-detail)
   1. [PlayerSitOnFurnitureState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   7. [abortSitting(IsoGameCharacter)](#abortSitting(zombie.characters.IsoGameCharacter))
   8. [isVisibleZombieNearby(IsoGameCharacter)](#isVisibleZombieNearby(zombie.characters.IsoGameCharacter))
   9. [getUp(IsoGameCharacter)](#getUp(zombie.characters.IsoGameCharacter))
   10. [isProcessedOnEnter()](#isProcessedOnEnter())
   11. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   12. [isProcessedOnExit()](#isProcessedOnExit())
   13. [processOnExit(IsoGameCharacter, Map)](#processOnExit(zombie.characters.IsoGameCharacter,java.util.Map))
   14. [awayCheckDistance()](#awayCheckDistance())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PlayerSitOnFurnitureState
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.PlayerSitOnFurnitureState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class PlayerSitOnFurnitureState
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

  `static final zombie.ai.State.Param<String>`

  `BEFORE_SIT_DIR`

  `static final zombie.ai.State.Param<IsoDirections>`

  `DIR`

  `private static final IsoDirections[]`

  `DIRECTIONS`

  `private static final PlayerSitOnFurnitureState`

  `INSTANCE`

  `static final zombie.ai.State.Param<IsoObject>`

  `SIT_OBJECT`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PlayerSitOnFurnitureState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `abortSitting(IsoGameCharacter owner)`

  `void`

  `animEvent(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `float`

  `awayCheckDistance()`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `private void`

  `getUp(IsoGameCharacter owner)`

  `static PlayerSitOnFurnitureState`

  `instance()`

  `boolean`

  `isProcessedOnEnter()`

  `boolean`

  `isProcessedOnExit()`

  `private boolean`

  `isVisibleZombieNearby(IsoGameCharacter owner)`

  `void`

  `processOnEnter(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `void`

  `processOnExit(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `void`

  `setParams(IsoGameCharacter owner,
  zombie.ai.State.Stage stage)`

  ### Methods inherited from class zombie.ai.State

  `getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [PlayerSitOnFurnitureState](PlayerSitOnFurnitureState.html "class in zombie.ai.states") INSTANCE
  + ### DIRECTIONS

    private static final [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso")[] DIRECTIONS
  + ### DIR

    public static final zombie.ai.State.Param<[IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso")> DIR
  + ### SIT\_OBJECT

    public static final zombie.ai.State.Param<[IsoObject](../../iso/IsoObject.html "class in zombie.iso")> SIT\_OBJECT
  + ### BEFORE\_SIT\_DIR

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> BEFORE\_SIT\_DIR
* Constructor Details
  -------------------

  + ### PlayerSitOnFurnitureState

    private PlayerSitOnFurnitureState()
* Method Details
  --------------

  + ### instance

    public static [PlayerSitOnFurnitureState](PlayerSitOnFurnitureState.html "class in zombie.ai.states") instance()
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
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.ai.State.Stage stage)

    Overrides:
    :   `setParams` in class `zombie.ai.State`
  + ### abortSitting

    public void abortSitting([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### isVisibleZombieNearby

    private boolean isVisibleZombieNearby([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getUp

    private void getUp([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
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
  + ### awayCheckDistance

    public float awayCheckDistance()

    Overrides:
    :   `awayCheckDistance` in class `zombie.ai.State`