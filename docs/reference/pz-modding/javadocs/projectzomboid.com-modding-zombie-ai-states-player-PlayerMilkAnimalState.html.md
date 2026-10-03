[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.ai.states.player](package-summary.html)
2. [PlayerMilkAnimalState](PlayerMilkAnimalState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [MILK\_ANIMAL](#MILK_ANIMAL)
   3. [ANIMAL](#ANIMAL)
   4. [ANIMAL\_SIZE](#ANIMAL_SIZE)
   5. [MILK\_ANIM](#MILK_ANIM)
7. [Constructor Details](#constructor-detail)
   1. [PlayerMilkAnimalState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   4. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class PlayerMilkAnimalState
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.player.PlayerMilkAnimalState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public class PlayerMilkAnimalState
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

  `ANIMAL`

  `static final zombie.ai.State.Param<Float>`

  `ANIMAL_SIZE`

  `private static final PlayerMilkAnimalState`

  `INSTANCE`

  `static final zombie.ai.State.Param<String>`

  `MILK_ANIM`

  `static final zombie.ai.State.Param<Boolean>`

  `MILK_ANIMAL`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PlayerMilkAnimalState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static PlayerMilkAnimalState`

  `instance()`

  `void`

  `setParams(IsoGameCharacter owner,
  zombie.ai.State.Stage stage)`

  ### Methods inherited from class zombie.ai.State

  `animEvent, awayCheckDistance, execute, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [PlayerMilkAnimalState](PlayerMilkAnimalState.html "class in zombie.ai.states.player") INSTANCE
  + ### MILK\_ANIMAL

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> MILK\_ANIMAL
  + ### ANIMAL

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ANIMAL
  + ### ANIMAL\_SIZE

    public static final zombie.ai.State.Param<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> ANIMAL\_SIZE
  + ### MILK\_ANIM

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> MILK\_ANIM
* Constructor Details
  -------------------

  + ### PlayerMilkAnimalState

    private PlayerMilkAnimalState()
* Method Details
  --------------

  + ### instance

    public static [PlayerMilkAnimalState](PlayerMilkAnimalState.html "class in zombie.ai.states.player") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### exit

    public void exit([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### setParams

    public void setParams([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.ai.State.Stage stage)

    Overrides:
    :   `setParams` in class `zombie.ai.State`