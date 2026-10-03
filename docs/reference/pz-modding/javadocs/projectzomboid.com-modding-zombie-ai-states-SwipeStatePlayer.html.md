[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [SwipeStatePlayer](SwipeStatePlayer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [ShoveChargeDeltaMultiplier](#ShoveChargeDeltaMultiplier)
   3. [MaxStartChargeDelta](#MaxStartChargeDelta)
   4. [ChargeDeltaModifier](#ChargeDeltaModifier)
   5. [ShoveRecoilDelay](#ShoveRecoilDelay)
   6. [WeaponEmptyRecoilDelay](#WeaponEmptyRecoilDelay)
   7. [BaseAimingDelay](#BaseAimingDelay)
   8. [DefaultChargeDelta](#DefaultChargeDelta)
   9. [BreakMultiplierBase](#BreakMultiplierBase)
   10. [BreakMultiplerChargeModifier](#BreakMultiplerChargeModifier)
   11. [DefaultMaintenanceXP](#DefaultMaintenanceXP)
   12. [ConditionLowerChance](#ConditionLowerChance)
   13. [FootDamageBaseRange](#FootDamageBaseRange)
   14. [NoShoesFootDamageBaseRange](#NoShoesFootDamageBaseRange)
   15. [AutoShootSpeed](#AutoShootSpeed)
   16. [DefaultAutoShootSpeed](#DefaultAutoShootSpeed)
   17. [MinimumSingleShootSpeed](#MinimumSingleShootSpeed)
   18. [SingleShootSpeedBase](#SingleShootSpeedBase)
   19. [MaxStompDistance](#MaxStompDistance)
   20. [LOWER\_CONDITION](#LOWER_CONDITION)
   21. [ATTACKED](#ATTACKED)
   22. [GRAPPLING\_TYPE](#GRAPPLING_TYPE)
   23. [GRAPPLING\_TARGET](#GRAPPLING_TARGET)
   24. [DO\_GRAPPLE](#DO_GRAPPLE)
   25. [DO\_CONTINUE\_GRAPPLE](#DO_CONTINUE_GRAPPLE)
   26. [IS\_GRAPPLE\_WINDOW](#IS_GRAPPLE_WINDOW)
   27. [IS\_THROWING](#IS_THROWING)
   28. [dbgGlobalEventBroadcaster](#dbgGlobalEventBroadcaster)
7. [Constructor Details](#constructor-detail)
   1. [SwipeStatePlayer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [instance()](#instance())
   2. [dbgOnGlobalAnimEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#dbgOnGlobalAnimEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   3. [WeaponLowerConditionEvent(HandWeapon, IsoGameCharacter)](#WeaponLowerConditionEvent(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter))
   4. [doAttack(IsoPlayer, float, String, AttackVars)](#doAttack(zombie.characters.IsoPlayer,float,java.lang.String,zombie.network.fields.hit.AttackVars))
   5. [enter(IsoGameCharacter)](#enter(zombie.characters.IsoGameCharacter))
   6. [execute(IsoGameCharacter)](#execute(zombie.characters.IsoGameCharacter))
   7. [OnAnimEvent\_ActiveAnimFinishing(IsoGameCharacter)](#OnAnimEvent_ActiveAnimFinishing(zombie.characters.IsoGameCharacter))
   8. [OnAnimEvent\_AttackAnim(IsoGameCharacter, boolean)](#OnAnimEvent_AttackAnim(zombie.characters.IsoGameCharacter,boolean))
   9. [OnAnimEvent\_BlockTurn(IsoGameCharacter, boolean)](#OnAnimEvent_BlockTurn(zombie.characters.IsoGameCharacter,boolean))
   10. [OnAnimEvent\_ShoveAnim(IsoGameCharacter, boolean)](#OnAnimEvent_ShoveAnim(zombie.characters.IsoGameCharacter,boolean))
   11. [OnAnimEvent\_StompAnim(IsoGameCharacter, boolean)](#OnAnimEvent_StompAnim(zombie.characters.IsoGameCharacter,boolean))
   12. [OnAnimEvent\_GrappleGrabAnim(IsoGameCharacter, boolean)](#OnAnimEvent_GrappleGrabAnim(zombie.characters.IsoGameCharacter,boolean))
   13. [OnAnimEvent\_AttackCollisionCheck(IsoGameCharacter, AttackType)](#OnAnimEvent_AttackCollisionCheck(zombie.characters.IsoGameCharacter,zombie.AttackType))
   14. [OnAnimEvent\_GrappleGrabCollisionCheck(IsoGameCharacter, String)](#OnAnimEvent_GrappleGrabCollisionCheck(zombie.characters.IsoGameCharacter,java.lang.String))
   15. [OnAnimEvent\_BlockMovement(IsoGameCharacter, AnimEvent)](#OnAnimEvent_BlockMovement(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   16. [OnAnimEvent\_WeaponEmptyCheck(IsoGameCharacter)](#OnAnimEvent_WeaponEmptyCheck(zombie.characters.IsoGameCharacter))
   17. [OnAnimEvent\_ShotDone(IsoGameCharacter)](#OnAnimEvent_ShotDone(zombie.characters.IsoGameCharacter))
   18. [OnAnimEvent\_SetVariable(IsoGameCharacter, AnimationVariableReference, String)](#OnAnimEvent_SetVariable(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference,java.lang.String))
   19. [OnAnimEvent\_PlayRackSound(IsoGameCharacter)](#OnAnimEvent_PlayRackSound(zombie.characters.IsoGameCharacter))
   20. [OnAnimEvent\_PlayClickSound(IsoGameCharacter)](#OnAnimEvent_PlayClickSound(zombie.characters.IsoGameCharacter))
   21. [OnAnimEvent\_PlaySwingSound(IsoGameCharacter, String)](#OnAnimEvent_PlaySwingSound(zombie.characters.IsoGameCharacter,java.lang.String))
   22. [OnAnimEvent\_PlaySwingSoundAlways(IsoGameCharacter, String)](#OnAnimEvent_PlaySwingSoundAlways(zombie.characters.IsoGameCharacter,java.lang.String))
   23. [OnAnimEvent\_PlayerVoiceSound(IsoGameCharacter, String)](#OnAnimEvent_PlayerVoiceSound(zombie.characters.IsoGameCharacter,java.lang.String))
   24. [OnAnimEvent\_PlayerVoiceSoundAlways(IsoGameCharacter, String)](#OnAnimEvent_PlayerVoiceSoundAlways(zombie.characters.IsoGameCharacter,java.lang.String))
   25. [OnAnimEvent\_PistolWhipAnim(IsoGameCharacter, String)](#OnAnimEvent_PistolWhipAnim(zombie.characters.IsoGameCharacter,java.lang.String))
   26. [OnAnimEvent\_SetMeleeDelay(IsoGameCharacter, float)](#OnAnimEvent_SetMeleeDelay(zombie.characters.IsoGameCharacter,float))
   27. [OnAnimEvent\_SitGroundStarted(IsoGameCharacter)](#OnAnimEvent_SitGroundStarted(zombie.characters.IsoGameCharacter))
   28. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   29. [GrappleGrabCollisionCheck(IsoGameCharacter, HandWeapon, String)](#GrappleGrabCollisionCheck(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,java.lang.String))
   30. [changeWeapon(HandWeapon, IsoGameCharacter)](#changeWeapon(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter))
   31. [checkRangedWeaponFailedToShoot(IsoGameCharacter)](#checkRangedWeaponFailedToShoot(zombie.characters.IsoGameCharacter))
   32. [setParams(IsoGameCharacter, State.Stage)](#setParams(zombie.characters.IsoGameCharacter,zombie.ai.State.Stage))
   33. [isStompingDisabled(IsoGameCharacter, boolean)](#isStompingDisabled(zombie.characters.IsoGameCharacter,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SwipeStatePlayer
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.State

zombie.ai.states.SwipeStatePlayer

All Implemented Interfaces:
:   `zombie.ai.IStateFlagsSource, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`

---

public final class SwipeStatePlayer
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

  `ATTACKED`

  `private static final float`

  `AutoShootSpeed`

  `private static final int`

  `BaseAimingDelay`

  `private static final float`

  `BreakMultiplerChargeModifier`

  `private static final float`

  `BreakMultiplierBase`

  `private static final float`

  `ChargeDeltaModifier`

  `private static final int`

  `ConditionLowerChance`

  `private static zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster`

  `dbgGlobalEventBroadcaster`

  `private static final float`

  `DefaultAutoShootSpeed`

  `private static final float`

  `DefaultChargeDelta`

  `private static final float`

  `DefaultMaintenanceXP`

  `static final zombie.ai.State.Param<Boolean>`

  `DO_CONTINUE_GRAPPLE`

  `static final zombie.ai.State.Param<Boolean>`

  `DO_GRAPPLE`

  `private static final int`

  `FootDamageBaseRange`

  `static final zombie.ai.State.Param<zombie.core.skinnedmodel.IGrappleable>`

  `GRAPPLING_TARGET`

  `static final zombie.ai.State.Param<String>`

  `GRAPPLING_TYPE`

  `private static final SwipeStatePlayer`

  `INSTANCE`

  `static final zombie.ai.State.Param<Boolean>`

  `IS_GRAPPLE_WINDOW`

  `static final zombie.ai.State.Param<Boolean>`

  `IS_THROWING`

  `static final zombie.ai.State.Param<Boolean>`

  `LOWER_CONDITION`

  `private static final float`

  `MaxStartChargeDelta`

  `static final float`

  `MaxStompDistance`

  `private static final float`

  `MinimumSingleShootSpeed`

  `private static final int`

  `NoShoesFootDamageBaseRange`

  `private static final float`

  `ShoveChargeDeltaMultiplier`

  `private static final float`

  `ShoveRecoilDelay`

  `private static final float`

  `SingleShootSpeedBase`

  `private static final float`

  `WeaponEmptyRecoilDelay`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SwipeStatePlayer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `changeWeapon(HandWeapon weapon,
  IsoGameCharacter owner)`

  `private static void`

  `checkRangedWeaponFailedToShoot(IsoGameCharacter owner)`

  `static void`

  `dbgOnGlobalAnimEvent(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `doAttack(IsoPlayer ownerPlayer,
  float chargeDelta,
  String clickSound,
  zombie.network.fields.hit.AttackVars vars)`

  `void`

  `enter(IsoGameCharacter owner)`

  `void`

  `execute(IsoGameCharacter owner)`

  `void`

  `exit(IsoGameCharacter owner)`

  `private void`

  `GrappleGrabCollisionCheck(IsoGameCharacter owner,
  HandWeapon weapon,
  String grappleType)`

  `static SwipeStatePlayer`

  `instance()`

  `static boolean`

  `isStompingDisabled(IsoGameCharacter owner,
  boolean doShove)`

  `private void`

  `OnAnimEvent_ActiveAnimFinishing(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_AttackAnim(IsoGameCharacter owner,
  boolean parameterValue)`

  `private void`

  `OnAnimEvent_AttackCollisionCheck(IsoGameCharacter owner,
  zombie.AttackType attackTypeModifier)`

  `private void`

  `OnAnimEvent_BlockMovement(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_BlockTurn(IsoGameCharacter owner,
  boolean parameterValue)`

  `private void`

  `OnAnimEvent_GrappleGrabAnim(IsoGameCharacter owner,
  boolean parameterValue)`

  `private void`

  `OnAnimEvent_GrappleGrabCollisionCheck(IsoGameCharacter owner,
  String grappleType)`

  `private void`

  `OnAnimEvent_PistolWhipAnim(IsoGameCharacter owner,
  String param)`

  `private static void`

  `OnAnimEvent_PlayClickSound(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_PlayerVoiceSound(IsoGameCharacter owner,
  String param)`

  `private static void`

  `OnAnimEvent_PlayerVoiceSoundAlways(IsoGameCharacter owner,
  String param)`

  `private static void`

  `OnAnimEvent_PlayRackSound(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_PlaySwingSound(IsoGameCharacter owner,
  String swingSoundId)`

  `private static void`

  `OnAnimEvent_PlaySwingSoundAlways(IsoGameCharacter owner,
  String swingSoundId)`

  `private void`

  `OnAnimEvent_SetMeleeDelay(IsoGameCharacter owner,
  float param)`

  `private void`

  `OnAnimEvent_SetVariable(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference variable,
  String variableValue)`

  `private void`

  `OnAnimEvent_ShotDone(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_ShoveAnim(IsoGameCharacter owner,
  boolean parameterValue)`

  `private void`

  `OnAnimEvent_SitGroundStarted(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_StompAnim(IsoGameCharacter owner,
  boolean parameterValue)`

  `private void`

  `OnAnimEvent_WeaponEmptyCheck(IsoGameCharacter owner)`

  `void`

  `setParams(IsoGameCharacter owner,
  zombie.ai.State.Stage stage)`

  `private static void`

  `WeaponLowerConditionEvent(HandWeapon weapon,
  IsoGameCharacter owner)`

  ### Methods inherited from class zombie.ai.State

  `animEvent, awayCheckDistance, getAnimEventBroadcaster, getDeltaModifiers, getMinimumSimulationLevel, getName, getParams, isIgnoreCollide, isProcessedOnEnter, isProcessedOnExit, isSyncInIdle, isSyncOnEnter, isSyncOnExit, isSyncOnSquare, loadFrom, processOnEnter, processOnExit`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener`

  ### Methods inherited from interface zombie.ai.IStateFlagsSource

  `canBeHitByVehicle, canRagdoll, canSlowDownVehicleWhenHit, causesDamageToVehicleWhenHit, isAttacking, isDoingActionThatCanBeCancelled, isMoving`

* Field Details
  -------------

  + ### INSTANCE

    private static final [SwipeStatePlayer](SwipeStatePlayer.html "class in zombie.ai.states") INSTANCE
  + ### ShoveChargeDeltaMultiplier

    private static final float ShoveChargeDeltaMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.ShoveChargeDeltaMultiplier)
  + ### MaxStartChargeDelta

    private static final float MaxStartChargeDelta

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.MaxStartChargeDelta)
  + ### ChargeDeltaModifier

    private static final float ChargeDeltaModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.ChargeDeltaModifier)
  + ### ShoveRecoilDelay

    private static final float ShoveRecoilDelay

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.ShoveRecoilDelay)
  + ### WeaponEmptyRecoilDelay

    private static final float WeaponEmptyRecoilDelay

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.WeaponEmptyRecoilDelay)
  + ### BaseAimingDelay

    private static final int BaseAimingDelay

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.BaseAimingDelay)
  + ### DefaultChargeDelta

    private static final float DefaultChargeDelta

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.DefaultChargeDelta)
  + ### BreakMultiplierBase

    private static final float BreakMultiplierBase

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.BreakMultiplierBase)
  + ### BreakMultiplerChargeModifier

    private static final float BreakMultiplerChargeModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.BreakMultiplerChargeModifier)
  + ### DefaultMaintenanceXP

    private static final float DefaultMaintenanceXP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.DefaultMaintenanceXP)
  + ### ConditionLowerChance

    private static final int ConditionLowerChance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.ConditionLowerChance)
  + ### FootDamageBaseRange

    private static final int FootDamageBaseRange

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.FootDamageBaseRange)
  + ### NoShoesFootDamageBaseRange

    private static final int NoShoesFootDamageBaseRange

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.NoShoesFootDamageBaseRange)
  + ### AutoShootSpeed

    private static final float AutoShootSpeed

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.AutoShootSpeed)
  + ### DefaultAutoShootSpeed

    private static final float DefaultAutoShootSpeed

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.DefaultAutoShootSpeed)
  + ### MinimumSingleShootSpeed

    private static final float MinimumSingleShootSpeed

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.MinimumSingleShootSpeed)
  + ### SingleShootSpeedBase

    private static final float SingleShootSpeedBase

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.SingleShootSpeedBase)
  + ### MaxStompDistance

    public static final float MaxStompDistance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.ai.states.SwipeStatePlayer.MaxStompDistance)
  + ### LOWER\_CONDITION

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> LOWER\_CONDITION
  + ### ATTACKED

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> ATTACKED
  + ### GRAPPLING\_TYPE

    public static final zombie.ai.State.Param<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> GRAPPLING\_TYPE
  + ### GRAPPLING\_TARGET

    public static final zombie.ai.State.Param<zombie.core.skinnedmodel.IGrappleable> GRAPPLING\_TARGET
  + ### DO\_GRAPPLE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> DO\_GRAPPLE
  + ### DO\_CONTINUE\_GRAPPLE

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> DO\_CONTINUE\_GRAPPLE
  + ### IS\_GRAPPLE\_WINDOW

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> IS\_GRAPPLE\_WINDOW
  + ### IS\_THROWING

    public static final zombie.ai.State.Param<[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> IS\_THROWING
  + ### dbgGlobalEventBroadcaster

    private static zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster dbgGlobalEventBroadcaster
* Constructor Details
  -------------------

  + ### SwipeStatePlayer

    private SwipeStatePlayer()
* Method Details
  --------------

  + ### instance

    public static [SwipeStatePlayer](SwipeStatePlayer.html "class in zombie.ai.states") instance()
  + ### dbgOnGlobalAnimEvent

    public static void dbgOnGlobalAnimEvent([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### WeaponLowerConditionEvent

    private static void WeaponLowerConditionEvent([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### doAttack

    private void doAttack([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") ownerPlayer,
    float chargeDelta,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound,
    zombie.network.fields.hit.AttackVars vars)
  + ### enter

    public void enter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `enter` in class `zombie.ai.State`
  + ### execute

    public void execute([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `execute` in class `zombie.ai.State`
  + ### OnAnimEvent\_ActiveAnimFinishing

    private void OnAnimEvent\_ActiveAnimFinishing([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_AttackAnim

    private void OnAnimEvent\_AttackAnim([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean parameterValue)
  + ### OnAnimEvent\_BlockTurn

    private void OnAnimEvent\_BlockTurn([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean parameterValue)
  + ### OnAnimEvent\_ShoveAnim

    private void OnAnimEvent\_ShoveAnim([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean parameterValue)
  + ### OnAnimEvent\_StompAnim

    private void OnAnimEvent\_StompAnim([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean parameterValue)
  + ### OnAnimEvent\_GrappleGrabAnim

    private void OnAnimEvent\_GrappleGrabAnim([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean parameterValue)
  + ### OnAnimEvent\_AttackCollisionCheck

    private void OnAnimEvent\_AttackCollisionCheck([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.AttackType attackTypeModifier)
  + ### OnAnimEvent\_GrappleGrabCollisionCheck

    private void OnAnimEvent\_GrappleGrabCollisionCheck([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grappleType)
  + ### OnAnimEvent\_BlockMovement

    private void OnAnimEvent\_BlockMovement([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_WeaponEmptyCheck

    private void OnAnimEvent\_WeaponEmptyCheck([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_ShotDone

    private void OnAnimEvent\_ShotDone([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_SetVariable

    private void OnAnimEvent\_SetVariable([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference variable,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") variableValue)
  + ### OnAnimEvent\_PlayRackSound

    private static void OnAnimEvent\_PlayRackSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_PlayClickSound

    private static void OnAnimEvent\_PlayClickSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_PlaySwingSound

    private void OnAnimEvent\_PlaySwingSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") swingSoundId)
  + ### OnAnimEvent\_PlaySwingSoundAlways

    private static void OnAnimEvent\_PlaySwingSoundAlways([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") swingSoundId)
  + ### OnAnimEvent\_PlayerVoiceSound

    private void OnAnimEvent\_PlayerVoiceSound([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") param)
  + ### OnAnimEvent\_PlayerVoiceSoundAlways

    private static void OnAnimEvent\_PlayerVoiceSoundAlways([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") param)
  + ### OnAnimEvent\_PistolWhipAnim

    private void OnAnimEvent\_PistolWhipAnim([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") param)
  + ### OnAnimEvent\_SetMeleeDelay

    private void OnAnimEvent\_SetMeleeDelay([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    float param)
  + ### OnAnimEvent\_SitGroundStarted

    private void OnAnimEvent\_SitGroundStarted([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### exit

    public void exit([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `exit` in class `zombie.ai.State`
  + ### GrappleGrabCollisionCheck

    private void GrappleGrabCollisionCheck([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grappleType)
  + ### changeWeapon

    private void changeWeapon([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### checkRangedWeaponFailedToShoot

    private static void checkRangedWeaponFailedToShoot([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### setParams

    public void setParams([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.ai.State.Stage stage)

    Overrides:
    :   `setParams` in class `zombie.ai.State`
  + ### isStompingDisabled

    public static boolean isStompingDisabled([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner,
    boolean doShove)