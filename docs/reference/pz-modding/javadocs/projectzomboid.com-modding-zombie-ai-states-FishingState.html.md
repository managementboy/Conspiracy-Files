[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [FishingState](FishingState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [FISHING\_FINISHED](#FISHING_FINISHED)
   3. [FISHING\_STAGE](#FISHING_STAGE)
   4. [FISHING\_X](#FISHING_X)
   5. [FISHING\_Y](#FISHING_Y)
   6. [AIM](#AIM)
7. [Constructor Details](#constructor-detail)
   1. [FishingState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   6. [isProcessedOnEnter()](#isProcessedOnEnter())
   7. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   8. [isProcessedOnExit()](#isProcessedOnExit())
   9. [processOnExit(IsoGameCharacter, Map)](#processOnExit(zombie.characters.IsoGameCharacter,java.util.Map))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FishingState
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.FishingState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class FishingState
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

  `AIM`

  `static final zombie.ai.State.Param<Boolean>`

  `FISHING_FINISHED`

  `static final zombie.ai.State.Param<String>`

  `FISHING_STAGE`

  `static final zombie.ai.State.Param<String>`

  `FISHING_X`

  `static final zombie.ai.State.Param<String>`

  `FISHING_Y`

  `private static final FishingState`

  `INSTANCE`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FishingState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static FishingState`

  `instance()`

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
  zombie.ai.State.Stage stage)`

  ### Methods inherited from class zombie.ai.State

  `animEvent, awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [FishingState](FishingState.html "class in zombie.ai.states") INSTANCE
  + ### FISHING\_FINISHED

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> FISHING\_FINISHED
  + ### FISHING\_STAGE

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> FISHING\_STAGE
  + ### FISHING\_X

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> FISHING\_X
  + ### FISHING\_Y

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> FISHING\_Y
  + ### AIM

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> AIM
* Constructor Details
  -------------------

  + ### FishingState

    private FishingState()
* Method Details
  --------------

  + ### instance

    public static [FishingState](FishingState.html "class in zombie.ai.states") instance()
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
  + ### isProcessedOnExit

    public boolean isProcessedOnExit()

    Overrides:
    :   `isProcessedOnExit` in class `zombie.ai.State`
  + ### processOnExit

    public void processOnExit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnExit` in class `zombie.ai.State`