[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [PlayerSitOnGroundState](PlayerSitOnGroundState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [FireCheckBaseTime](#FireCheckBaseTime)
   3. [ChangeAnimRandomMinTime](#ChangeAnimRandomMinTime)
   4. [ChangeAnimRandomMaxTime](#ChangeAnimRandomMaxTime)
   5. [RAND\_EXT](#RAND_EXT)
   6. [FIRE](#FIRE)
   7. [SITGROUNDANIM](#SITGROUNDANIM)
   8. [CHECK\_FIRE](#CHECK_FIRE)
   9. [CHANGE\_ANIM](#CHANGE_ANIM)
7. [Constructor Details](#constructor-detail)
   1. [PlayerSitOnGroundState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [checkFire(IsoGameCharacter)](#checkFire(zombie.characters.IsoGameCharacter))
   4. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   5. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   6. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   7. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   8. [isProcessedOnEnter()](#isProcessedOnEnter())
   9. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   10. [isProcessedOnExit()](#isProcessedOnExit())
   11. [processOnExit(IsoGameCharacter, Map)](#processOnExit(zombie.characters.IsoGameCharacter,java.util.Map))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PlayerSitOnGroundState
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.PlayerSitOnGroundState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class PlayerSitOnGroundState
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

  `static final zombie.ai.State.Param<Long>`

  `CHANGE_ANIM`

  `private static final int`

  `ChangeAnimRandomMaxTime`

  `private static final int`

  `ChangeAnimRandomMinTime`

  `static final zombie.ai.State.Param<Long>`

  `CHECK_FIRE`

  `static final zombie.ai.State.Param<Boolean>`

  `FIRE`

  `private static final long`

  `FireCheckBaseTime`

  `private static final PlayerSitOnGroundState`

  `INSTANCE`

  `private static final int`

  `RAND_EXT`

  `static final zombie.ai.State.Param<String>`

  `SITGROUNDANIM`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PlayerSitOnGroundState()`
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

  `private boolean`

  `checkFire(IsoGameCharacter owner)`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static PlayerSitOnGroundState`

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

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [PlayerSitOnGroundState](PlayerSitOnGroundState.html "class in zombie.ai.states") INSTANCE
  + ### FireCheckBaseTime

    private static final long FireCheckBaseTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.PlayerSitOnGroundState.FireCheckBaseTime)
  + ### ChangeAnimRandomMinTime

    private static final int ChangeAnimRandomMinTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.PlayerSitOnGroundState.ChangeAnimRandomMinTime)
  + ### ChangeAnimRandomMaxTime

    private static final int ChangeAnimRandomMaxTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.PlayerSitOnGroundState.ChangeAnimRandomMaxTime)
  + ### RAND\_EXT

    private static final int RAND\_EXT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.PlayerSitOnGroundState.RAND_EXT)
  + ### FIRE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> FIRE
  + ### SITGROUNDANIM

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> SITGROUNDANIM
  + ### CHECK\_FIRE

    public static final zombie.ai.State.Param<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> CHECK\_FIRE
  + ### CHANGE\_ANIM

    public static final zombie.ai.State.Param<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> CHANGE\_ANIM
* Constructor Details
  -------------------

  + ### PlayerSitOnGroundState

    private PlayerSitOnGroundState()
* Method Details
  --------------

  + ### instance

    public static [PlayerSitOnGroundState](PlayerSitOnGroundState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### checkFire

    private boolean checkFire([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
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