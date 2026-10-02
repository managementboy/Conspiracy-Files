[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ClimbSheetRopeState](ClimbSheetRopeState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [FallChanceBase](#FallChanceBase)
   3. [FallChanceMultiplier](#FallChanceMultiplier)
   4. [FallChanceScale](#FallChanceScale)
   5. [ClimbSpeed](#ClimbSpeed)
   6. [ClimbSlowdown](#ClimbSlowdown)
   7. [SPEED](#SPEED)
   8. [CLIMB](#CLIMB)
   9. [numberOfFallingChecks](#numberOfFallingChecks)
7. [Constructor Details](#constructor-detail)
   1. [ClimbSheetRopeState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   6. [createClimbData(IsoGameCharacter)](#createClimbData(zombie.characters.IsoGameCharacter))
   7. [calculateClimbOutcome(IsoGameCharacter)](#calculateClimbOutcome(zombie.characters.IsoGameCharacter))
   8. [finishClimbing(IsoGameCharacter)](#finishClimbing(zombie.characters.IsoGameCharacter))
   9. [setIdealDirection(IsoGameCharacter)](#setIdealDirection(zombie.characters.IsoGameCharacter))
   10. [applyIdealDirection(IsoGameCharacter)](#applyIdealDirection(zombie.characters.IsoGameCharacter))
   11. [calculateClimb(IsoGameCharacter)](#calculateClimb(zombie.characters.IsoGameCharacter))
   12. [fallChanceCalculation(IsoGameCharacter)](#fallChanceCalculation(zombie.characters.IsoGameCharacter))
   13. [debug(IsoGameCharacter)](#debug(zombie.characters.IsoGameCharacter))
   14. [isProcessedOnEnter()](#isProcessedOnEnter())
   15. [processOnEnter(IsoGameCharacter, Map)](#processOnEnter(zombie.characters.IsoGameCharacter,java.util.Map))
   16. [isProcessedOnExit()](#isProcessedOnExit())
   17. [processOnExit(IsoGameCharacter, Map)](#processOnExit(zombie.characters.IsoGameCharacter,java.util.Map))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimbSheetRopeState
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ClimbSheetRopeState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ClimbSheetRopeState
extends zombie.ai.State

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ClimbSheetRopeState.ClimbData`

  `static enum`

  `ClimbSheetRopeState.ClimbStatus`

  ### Nested classes/interfaces inherited from class zombie.ai.State

  `zombie.ai.State.Param<T>, zombie.ai.State.Stage`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final zombie.ai.State.Param<Boolean>`

  `CLIMB`

  `static final float`

  `ClimbSlowdown`

  `static final float`

  `ClimbSpeed`

  `static final float`

  `FallChanceBase`

  `static final float`

  `FallChanceMultiplier`

  `private static final float`

  `FallChanceScale`

  `private static final ClimbSheetRopeState`

  `INSTANCE`

  `private int`

  `numberOfFallingChecks`

  `static final zombie.ai.State.Param<Float>`

  `SPEED`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ClimbSheetRopeState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `applyIdealDirection(IsoGameCharacter isoGameCharacter)`

  `private static void`

  `calculateClimb(IsoGameCharacter isoGameCharacter)`

  `private static ClimbSheetRopeState.ClimbStatus`

  `calculateClimbOutcome(IsoGameCharacter isoGameCharacter)`

  `static void`

  `createClimbData(IsoGameCharacter isoGameCharacter)`

  `void`

  `debug(IsoGameCharacter isoGameCharacter)`

  `void`

  `enter(IsoGameCharacter isoGameCharacter)`

  `void`

  `execute(IsoGameCharacter isoGameCharacter)`

  `void`

  `exit(IsoGameCharacter isoGameCharacter)`

  `private static float`

  `fallChanceCalculation(IsoGameCharacter isoGameCharacter)`

  `private void`

  `finishClimbing(IsoGameCharacter isoGameCharacter)`

  `static ClimbSheetRopeState`

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

  `static void`

  `setIdealDirection(IsoGameCharacter isoGameCharacter)`

  `void`

  `setParams(IsoGameCharacter isoGameCharacter,
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

    private static final [ClimbSheetRopeState](ClimbSheetRopeState.html "class in zombie.ai.states") INSTANCE
  + ### FallChanceBase

    public static final float FallChanceBase

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbSheetRopeState.FallChanceBase)
  + ### FallChanceMultiplier

    public static final float FallChanceMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbSheetRopeState.FallChanceMultiplier)
  + ### FallChanceScale

    private static final float FallChanceScale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbSheetRopeState.FallChanceScale)
  + ### ClimbSpeed

    public static final float ClimbSpeed

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbSheetRopeState.ClimbSpeed)
  + ### ClimbSlowdown

    public static final float ClimbSlowdown

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.ClimbSheetRopeState.ClimbSlowdown)
  + ### SPEED

    public static final zombie.ai.State.Param<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> SPEED
  + ### CLIMB

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> CLIMB
  + ### numberOfFallingChecks

    private int numberOfFallingChecks
* Constructor Details
  -------------------

  + ### ClimbSheetRopeState

    private ClimbSheetRopeState()
* Method Details
  --------------

  + ### instance

    public static [ClimbSheetRopeState](ClimbSheetRopeState.html "class in zombie.ai.states") instance()
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    zombie.ai.State.Stage stage)

    Overrides:
    :   `setParams` in class `zombie.ai.State`
  + ### createClimbData

    public static void createClimbData([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### calculateClimbOutcome

    private static [ClimbSheetRopeState.ClimbStatus](ClimbSheetRopeState.ClimbStatus.html "enum class in zombie.ai.states") calculateClimbOutcome([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### finishClimbing

    private void finishClimbing([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### setIdealDirection

    public static void setIdealDirection([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### applyIdealDirection

    public static void applyIdealDirection([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### calculateClimb

    private static void calculateClimb([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### fallChanceCalculation

    private static float fallChanceCalculation([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### debug

    public void debug([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
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