[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ClimbOverFenceState](ClimbOverFenceState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SOUND\_RADIUS](#SOUND_RADIUS)
   2. [INSTANCE](#INSTANCE)
   3. [START\_X](#START_X)
   4. [START\_Y](#START_Y)
   5. [Z](#Z)
   6. [END\_X](#END_X)
   7. [END\_Y](#END_Y)
   8. [DIR](#DIR)
   9. [ZOMBIE\_ON\_FLOOR](#ZOMBIE_ON_FLOOR)
   10. [PREV\_STATE](#PREV_STATE)
   11. [SCRATCH](#SCRATCH)
   12. [COUNTER](#COUNTER)
   13. [SOLID\_FLOOR](#SOLID_FLOOR)
   14. [SHEET\_ROPE](#SHEET_ROPE)
   15. [RUN](#RUN)
   16. [SPRINT](#SPRINT)
   17. [COLLIDABLE](#COLLIDABLE)
   18. [OUTCOME](#OUTCOME)
7. [Constructor Details](#constructor-detail)
   1. [ClimbOverFenceState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [setLungeXVars(IsoZombie)](#setLungeXVars(zombie.characters.IsoZombie))
   4. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   5. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   6. [OnAnimEvent\_VaultOverStarted(IsoGameCharacter)](#OnAnimEvent_VaultOverStarted(zombie.characters.IsoGameCharacter))
   7. [OnAnimEvent\_SetState(IsoGameCharacter, AnimEvent)](#OnAnimEvent_SetState(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   8. [OnAnimEvent\_SetCollidable(IsoGameCharacter, AnimEvent)](#OnAnimEvent_SetCollidable(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   9. [OnAnimEvent\_PlayTripSound(IsoGameCharacter, AnimEvent)](#OnAnimEvent_PlayTripSound(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   10. [OnAnimEvent\_PlayerVoiceSound(IsoGameCharacter, AnimEvent)](#OnAnimEvent_PlayerVoiceSound(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   11. [OnAnimEvent\_PlayFenceSound(IsoGameCharacter, AnimEvent)](#OnAnimEvent_PlayFenceSound(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   12. [OnAnimEvent\_OnFloor(IsoGameCharacter, AnimEvent)](#OnAnimEvent_OnFloor(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   13. [OnAnimEvent\_FallenOnKnees(IsoGameCharacter)](#OnAnimEvent_FallenOnKnees(zombie.characters.IsoGameCharacter))
   14. [OnAnimEvent\_VaultSprintFallLanded(IsoGameCharacter)](#OnAnimEvent_VaultSprintFallLanded(zombie.characters.IsoGameCharacter))
   15. [OnAnimEvent\_CheckAttack(IsoGameCharacter)](#OnAnimEvent_CheckAttack(zombie.characters.IsoGameCharacter))
   16. [getDeltaModifiers(IsoGameCharacter, MoveDeltaModifiers)](#getDeltaModifiers(zombie.characters.IsoGameCharacter,zombie.characters.MoveDeltaModifiers))
   17. [isIgnoreCollide(IsoGameCharacter, int, int, int, int, int, int)](#isIgnoreCollide(zombie.characters.IsoGameCharacter,int,int,int,int,int,int))
   18. [slideX(IsoGameCharacter, float)](#slideX(zombie.characters.IsoGameCharacter,float))
   19. [slideY(IsoGameCharacter, float)](#slideY(zombie.characters.IsoGameCharacter,float))
   20. [getFence(IsoGameCharacter)](#getFence(zombie.characters.IsoGameCharacter))
   21. [getFenceType(IsoObject)](#getFenceType(zombie.iso.IsoObject))
   22. [getTripType(IsoObject)](#getTripType(zombie.iso.IsoObject))
   23. [shouldFallAfterVaultOver(IsoGameCharacter)](#shouldFallAfterVaultOver(zombie.characters.IsoGameCharacter))
   24. [countZombiesClimbingOver(IsoObject)](#countZombiesClimbingOver(zombie.iso.IsoObject))
   25. [countZombiesClimbingOver(IsoObject, IsoGridSquare)](#countZombiesClimbingOver(zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   26. [isMetalFence(IsoObject)](#isMetalFence(zombie.iso.IsoObject))
   27. [setParams(IsoGameCharacter, IsoDirections)](#setParams(zombie.characters.IsoGameCharacter,zombie.iso.IsoDirections))
   28. [canRagdoll(IsoGameCharacter)](#canRagdoll(zombie.characters.IsoGameCharacter))
   29. [isProcessedOnEnter()](#isProcessedOnEnter())
   30. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   31. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimbOverFenceState
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ClimbOverFenceState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ClimbOverFenceState
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

  `static final zombie.ai.State.Param<Boolean>`

  `COUNTER`

  `static final zombie.ai.State.Param<IsoDirections>`

  `DIR`

  `static final zombie.ai.State.Param<Integer>`

  `END_X`

  `static final zombie.ai.State.Param<Integer>`

  `END_Y`

  `private static final ClimbOverFenceState`

  `INSTANCE`

  `static final zombie.ai.State.Param<String>`

  `OUTCOME`

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

  `private static final int`

  `SOUND_RADIUS`

  `static final zombie.ai.State.Param<Boolean>`

  `SPRINT`

  `static final zombie.ai.State.Param<Integer>`

  `START_X`

  `static final zombie.ai.State.Param<Integer>`

  `START_Y`

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

  `ClimbOverFenceState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canRagdoll(IsoGameCharacter owner)`

  Can the character that owns this state become a ragdoll.

  `private int`

  `countZombiesClimbingOver(IsoObject fence)`

  `private int`

  `countZombiesClimbingOver(IsoObject fence,
  IsoGridSquare square)`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `void`

  `getDeltaModifiers(IsoGameCharacter owner,
  MoveDeltaModifiers modifiers)`

  `private IsoObject`

  `getFence(IsoGameCharacter owner)`

  `private zombie.audio.parameters.ParameterFenceTypeLow.FenceType`

  `getFenceType(IsoObject fence)`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `private zombie.audio.parameters.ParameterTripObstacleType.ObstacleType`

  `getTripType(IsoObject fence)`

  `static ClimbOverFenceState`

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

  `private boolean`

  `isMetalFence(IsoObject fence)`

  `boolean`

  `isProcessedOnEnter()`

  `private void`

  `OnAnimEvent_CheckAttack(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_FallenOnKnees(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_OnFloor(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_PlayerVoiceSound(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_PlayFenceSound(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_PlayTripSound(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_SetCollidable(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_SetState(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_VaultOverStarted(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_VaultSprintFallLanded(IsoGameCharacter owner)`

  `void`

  `processOnEnter(IsoGameCharacter owner,
  Map<Object,Object> delegate)`

  `private void`

  `setLungeXVars(IsoZombie zombie)`

  Turn the zombie toward the player when lunge to get an attack
  This is called 2 times, when starting the climb over, and about 50% of the anim, to not make a too fast weird turn

  `void`

  `setParams(IsoGameCharacter owner,
  IsoDirections dir)`

  `private boolean`

  `shouldFallAfterVaultOver(IsoGameCharacter owner)`

  `private void`

  `slideX(IsoGameCharacter owner,
  float x)`

  `private void`

  `slideY(IsoGameCharacter owner,
  float y)`

  ### Methods inherited from class zombie.ai.State

  `animEvent, awayCheckDistance, getAnimEventBroadcaster, getName, getParams, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnExit, setParams`

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
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbOverFenceState.SOUND_RADIUS)
  + ### INSTANCE

    private static final [ClimbOverFenceState](ClimbOverFenceState.html "class in zombie.ai.states") INSTANCE
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
  + ### OUTCOME

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> OUTCOME
* Constructor Details
  -------------------

  + ### ClimbOverFenceState

    private ClimbOverFenceState()
* Method Details
  --------------

  + ### instance

    public static [ClimbOverFenceState](ClimbOverFenceState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### setLungeXVars

    private void setLungeXVars([IsoZombie](../../characters/IsoZombie.html "class in zombie.characters") zombie)

    Turn the zombie toward the player when lunge to get an attack
    This is called 2 times, when starting the climb over, and about 50% of the anim, to not make a too fast weird turn
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### OnAnimEvent\_VaultOverStarted

    private void OnAnimEvent\_VaultOverStarted([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_SetState

    private void OnAnimEvent\_SetState([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_SetCollidable

    private void OnAnimEvent\_SetCollidable([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_PlayTripSound

    private void OnAnimEvent\_PlayTripSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_PlayerVoiceSound

    private void OnAnimEvent\_PlayerVoiceSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_PlayFenceSound

    private void OnAnimEvent\_PlayFenceSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_OnFloor

    private void OnAnimEvent\_OnFloor([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_FallenOnKnees

    private void OnAnimEvent\_FallenOnKnees([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_VaultSprintFallLanded

    private void OnAnimEvent\_VaultSprintFallLanded([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_CheckAttack

    private void OnAnimEvent\_CheckAttack([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getDeltaModifiers

    public void getDeltaModifiers([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [MoveDeltaModifiers](../../characters/MoveDeltaModifiers.html "class in zombie.characters") modifiers)

    Overrides:
    :   `getDeltaModifiers` in class `zombie.ai.State`
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
  + ### slideX

    private void slideX([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float x)
  + ### slideY

    private void slideY([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float y)
  + ### getFence

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getFence([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getFenceType

    private zombie.audio.parameters.ParameterFenceTypeLow.FenceType getFenceType([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### getTripType

    private zombie.audio.parameters.ParameterTripObstacleType.ObstacleType getTripType([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### shouldFallAfterVaultOver

    private boolean shouldFallAfterVaultOver([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### countZombiesClimbingOver

    private int countZombiesClimbingOver([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### countZombiesClimbingOver

    private int countZombiesClimbingOver([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isMetalFence

    private boolean isMetalFence([IsoObject](../../iso/IsoObject.html "class in zombie.iso") fence)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### canRagdoll

    public boolean canRagdoll([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Description copied from interface: `zombie.ai.IStateFlagsSource`

    Can the character that owns this state become a ragdoll. If FALSE, the character cannot.
  + ### isProcessedOnEnter

    public boolean isProcessedOnEnter()

    Overrides:
    :   `isProcessedOnEnter` in class `zombie.ai.State`
  + ### processOnEnter

    public void processOnEnter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> delegate)

    Overrides:
    :   `processOnEnter` in class `zombie.ai.State`
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()

    Overrides:
    :   `getMinimumSimulationLevel` in class `zombie.ai.State`