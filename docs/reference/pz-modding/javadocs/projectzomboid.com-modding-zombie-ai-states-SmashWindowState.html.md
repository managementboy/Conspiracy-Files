[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [SmashWindowState](SmashWindowState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [SCRATCHED](#SCRATCHED)
   3. [ISO\_WINDOW](#ISO_WINDOW)
   4. [VEHICLE\_WINDOW](#VEHICLE_WINDOW)
   5. [VEHICLE](#VEHICLE)
   6. [VEHICLE\_PART](#VEHICLE_PART)
   7. [CLIMB\_THROUGH\_WINDOW](#CLIMB_THROUGH_WINDOW)
7. [Constructor Details](#constructor-detail)
   1. [SmashWindowState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [isDoingActionThatCanBeCancelled()](#isDoingActionThatCanBeCancelled())
   7. [isProcessedOnEnter()](#isProcessedOnEnter())
   8. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SmashWindowState
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.SmashWindowState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class SmashWindowState
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

  `CLIMB_THROUGH_WINDOW`

  `private static final SmashWindowState`

  `INSTANCE`

  `static final zombie.ai.State.Param<IsoWindow>`

  `ISO_WINDOW`

  `static final zombie.ai.State.Param<Boolean>`

  `SCRATCHED`

  `static final zombie.ai.State.Param<BaseVehicle>`

  `VEHICLE`

  `static final zombie.ai.State.Param<VehiclePart>`

  `VEHICLE_PART`

  `static final zombie.ai.State.Param<VehicleWindow>`

  `VEHICLE_WINDOW`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SmashWindowState()`
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

  `static SmashWindowState`

  `instance()`

  `boolean`

  `isDoingActionThatCanBeCancelled()`

  `boolean`

  `isProcessedOnEnter()`

  `void`

  `processOnEnter(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnExit, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [SmashWindowState](SmashWindowState.html "class in zombie.ai.states") INSTANCE
  + ### SCRATCHED

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> SCRATCHED
  + ### ISO\_WINDOW

    public static final zombie.ai.State.Param<[IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects")> ISO\_WINDOW
  + ### VEHICLE\_WINDOW

    public static final zombie.ai.State.Param<[VehicleWindow](../../vehicles/VehicleWindow.html "class in zombie.vehicles")> VEHICLE\_WINDOW
  + ### VEHICLE

    public static final zombie.ai.State.Param<[BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles")> VEHICLE
  + ### VEHICLE\_PART

    public static final zombie.ai.State.Param<[VehiclePart](../../vehicles/VehiclePart.html "class in zombie.vehicles")> VEHICLE\_PART
  + ### CLIMB\_THROUGH\_WINDOW

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> CLIMB\_THROUGH\_WINDOW
* Constructor Details
  -------------------

  + ### SmashWindowState

    private SmashWindowState()
* Method Details
  --------------

  + ### instance

    public static [SmashWindowState](SmashWindowState.html "class in zombie.ai.states") instance()
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
  + ### isDoingActionThatCanBeCancelled

    public boolean isDoingActionThatCanBeCancelled()

    Returns:
    :   TRUE if this state handles the "Cancel Action" key or the B controller button.
  + ### isProcessedOnEnter

    public boolean isProcessedOnEnter()

    Overrides:
    :   `isProcessedOnEnter` in class `zombie.ai.State`
  + ### processOnEnter

    public void processOnEnter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnEnter` in class `zombie.ai.State`