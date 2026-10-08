[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [OpenWindowState](OpenWindowState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [WINDOW](#WINDOW)
7. [Constructor Details](#constructor-detail)
   1. [OpenWindowState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   3. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   4. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   5. [animEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#animEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   6. [isDoingActionThatCanBeCancelled()](#isDoingActionThatCanBeCancelled())
   7. [onAttemptFinished(IsoGameCharacter, IsoWindow)](#onAttemptFinished(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoWindow))
   8. [onSuccess(IsoGameCharacter, IsoWindow)](#onSuccess(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoWindow))
   9. [exert(IsoGameCharacter)](#exert(zombie.characters.IsoGameCharacter))
   10. [slideX(IsoGameCharacter, float)](#slideX(zombie.characters.IsoGameCharacter,float))
   11. [slideY(IsoGameCharacter, float)](#slideY(zombie.characters.IsoGameCharacter,float))
   12. [setParams(IsoGameCharacter, IsoWindow)](#setParams(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoWindow))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class OpenWindowState
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.OpenWindowState

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class OpenWindowState
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

  `private static final OpenWindowState`

  `INSTANCE`

  `static final zombie.ai.State.Param<IsoWindow>`

  `WINDOW`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `OpenWindowState()`
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

  `private void`

  `exert(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `static OpenWindowState`

  `instance()`

  `boolean`

  `isDoingActionThatCanBeCancelled()`

  `private void`

  `onAttemptFinished(IsoGameCharacter owner,
  IsoWindow window)`

  `private void`

  `onSuccess(IsoGameCharacter owner,
  IsoWindow window)`

  `void`

  `setParams(IsoGameCharacter owner,
  IsoWindow window)`

  `private void`

  `slideX(IsoGameCharacter owner,
  float x)`

  `private void`

  `slideY(IsoGameCharacter owner,
  float y)`

  ### Methods inherited from class zombie.ai.State

  `awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit, setParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [OpenWindowState](OpenWindowState.html "class in zombie.ai.states") INSTANCE
  + ### WINDOW

    public static final zombie.ai.State.Param<[IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects")> WINDOW
* Constructor Details
  -------------------

  + ### OpenWindowState

    private OpenWindowState()
* Method Details
  --------------

  + ### instance

    public static [OpenWindowState](OpenWindowState.html "class in zombie.ai.states") instance()
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
  + ### onAttemptFinished

    private void onAttemptFinished([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### onSuccess

    private void onSuccess([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### exert

    private void exert([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### slideX

    private void slideX([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float x)
  + ### slideY

    private void slideY([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float y)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)