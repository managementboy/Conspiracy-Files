[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ThumpState](ThumpState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
7. [Constructor Details](#constructor-detail)
   1. [ThumpState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [slideAwayFromEdge(IsoGameCharacter, Thumpable)](#slideAwayFromEdge(zombie.characters.IsoGameCharacter,zombie.iso.objects.interfaces.Thumpable))
   7. [slideAwayFromEdgeN(IsoGameCharacter, int, float)](#slideAwayFromEdgeN(zombie.characters.IsoGameCharacter,int,float))
   8. [slideAwayFromEdgeS(IsoGameCharacter, int, float)](#slideAwayFromEdgeS(zombie.characters.IsoGameCharacter,int,float))
   9. [slideAwayFromEdgeW(IsoGameCharacter, int, float)](#slideAwayFromEdgeW(zombie.characters.IsoGameCharacter,int,float))
   10. [slideAwayFromEdgeE(IsoGameCharacter, int, float)](#slideAwayFromEdgeE(zombie.characters.IsoGameCharacter,int,float))
   11. [findPlayer(int, int, int, int, int)](#findPlayer(int,int,int,int,int))
   12. [lungeThroughDoor(IsoZombie, IsoGridSquare, IsoGridSquare)](#lungeThroughDoor(zombie.characters.IsoZombie,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   13. [getFastForwardDamageMultiplier()](#getFastForwardDamageMultiplier())
   14. [isThumpTargetValid(IsoGameCharacter, Thumpable)](#isThumpTargetValid(zombie.characters.IsoGameCharacter,zombie.iso.objects.interfaces.Thumpable))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ThumpState
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.ThumpState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class ThumpState
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

  `private static final ThumpState`

  `INSTANCE`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ThumpState()`
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

  `private IsoPlayer`

  `findPlayer(int x1,
  int x2,
  int y1,
  int y2,
  int z)`

  `static int`

  `getFastForwardDamageMultiplier()`

  `static ThumpState`

  `instance()`

  `private boolean`

  `isThumpTargetValid(IsoGameCharacter owner,
  zombie.iso.objects.interfaces.Thumpable thumpable)`

  `private boolean`

  `lungeThroughDoor(IsoZombie z,
  IsoGridSquare sq,
  IsoGridSquare sq2)`

  `private void`

  `slideAwayFromEdge(IsoGameCharacter owner,
  zombie.iso.objects.interfaces.Thumpable target)`

  `private void`

  `slideAwayFromEdgeE(IsoGameCharacter owner,
  int squareX,
  float dist)`

  `private void`

  `slideAwayFromEdgeN(IsoGameCharacter owner,
  int squareY,
  float dist)`

  `private void`

  `slideAwayFromEdgeS(IsoGameCharacter owner,
  int squareY,
  float dist)`

  `private void`

  `slideAwayFromEdgeW(IsoGameCharacter owner,
  int squareX,
  float dist)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [ThumpState](ThumpState.html "class in zombie.ai.states") INSTANCE
* Constructor Details
  -------------------

  + ### ThumpState

    private ThumpState()
* Method Details
  --------------

  + ### instance

    public static [ThumpState](ThumpState.html "class in zombie.ai.states") instance()
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
  + ### slideAwayFromEdge

    private void slideAwayFromEdge([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.iso.objects.interfaces.Thumpable target)
  + ### slideAwayFromEdgeN

    private void slideAwayFromEdgeN([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int squareY,
    float dist)
  + ### slideAwayFromEdgeS

    private void slideAwayFromEdgeS([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int squareY,
    float dist)
  + ### slideAwayFromEdgeW

    private void slideAwayFromEdgeW([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int squareX,
    float dist)
  + ### slideAwayFromEdgeE

    private void slideAwayFromEdgeE([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    int squareX,
    float dist)
  + ### findPlayer

    private [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") findPlayer(int x1,
    int x2,
    int y1,
    int y2,
    int z)
  + ### lungeThroughDoor

    private boolean lungeThroughDoor([IsoZombie](../../characters/IsoZombie.html "class in zombie.characters") z,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq2)
  + ### getFastForwardDamageMultiplier

    public static int getFastForwardDamageMultiplier()
  + ### isThumpTargetValid

    private boolean isThumpTargetValid([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.iso.objects.interfaces.Thumpable thumpable)