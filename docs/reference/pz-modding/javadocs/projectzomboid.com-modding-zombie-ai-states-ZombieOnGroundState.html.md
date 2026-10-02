[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ZombieOnGroundState](ZombieOnGroundState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [tempVector](#tempVector)
   3. [tempVectorBonePos](#tempVectorBonePos)
7. [Constructor Details](#constructor-detail)
   1. [ZombieOnGroundState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [isCharacterStandingOnOther(IsoGameCharacter, IsoGameCharacter)](#isCharacterStandingOnOther(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter))
   5. [DoCollisionBoneCheck(IsoGameCharacter, IsoGameCharacter, int, float)](#DoCollisionBoneCheck(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter,int,float))
   6. [startReanimateTimer(IsoZombie)](#startReanimateTimer(zombie.characters.IsoZombie))
   7. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ZombieOnGroundState
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ZombieOnGroundState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ZombieOnGroundState
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

  `private static final ZombieOnGroundState`

  `INSTANCE`

  `(package private) static Vector3`

  `tempVector`

  `(package private) static Vector3`

  `tempVectorBonePos`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ZombieOnGroundState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static int`

  `DoCollisionBoneCheck(IsoGameCharacter chrStanding,
  IsoGameCharacter chrProne,
  int bone,
  float tempoLengthTest)`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static ZombieOnGroundState`

  `instance()`

  `static boolean`

  `isCharacterStandingOnOther(IsoGameCharacter chrStanding,
  IsoGameCharacter chrProne)`

  `static void`

  `startReanimateTimer(IsoZombie ownerZombie)`

  ### Methods inherited from class zombie.ai.State

  `animEvent, awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [ZombieOnGroundState](ZombieOnGroundState.html "class in zombie.ai.states") INSTANCE
  + ### tempVector

    static [Vector3](../../iso/Vector3.html "class in zombie.iso") tempVector
  + ### tempVectorBonePos

    static [Vector3](../../iso/Vector3.html "class in zombie.iso") tempVectorBonePos
* Constructor Details
  -------------------

  + ### ZombieOnGroundState

    private ZombieOnGroundState()
* Method Details
  --------------

  + ### instance

    public static [ZombieOnGroundState](ZombieOnGroundState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### isCharacterStandingOnOther

    public static boolean isCharacterStandingOnOther([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chrStanding,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chrProne)
  + ### DoCollisionBoneCheck

    private static int DoCollisionBoneCheck([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chrStanding,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chrProne,
    int bone,
    float tempoLengthTest)
  + ### startReanimateTimer

    public static void startReanimateTimer([IsoZombie](../../characters/IsoZombie.html "class in zombie.characters") ownerZombie)
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`