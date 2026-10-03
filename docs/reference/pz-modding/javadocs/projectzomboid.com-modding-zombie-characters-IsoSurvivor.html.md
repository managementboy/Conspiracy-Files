[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoSurvivor](IsoSurvivor.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [noGoreDeath](#noGoreDeath)
   2. [draggable](#draggable)
   3. [following](#following)
   4. [dragging](#dragging)
   5. [repathDelay](#repathDelay)
   6. [nightsSurvived](#nightsSurvived)
   7. [ping](#ping)
   8. [collidePushable](#collidePushable)
   9. [tryToTeamUp](#tryToTeamUp)
   10. [neightbourUpdate](#neightbourUpdate)
   11. [neightbourUpdateMax](#neightbourUpdateMax)
7. [Constructor Details](#constructor-detail)
   1. [IsoSurvivor(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoSurvivor(SurvivorDesc, IsoCell, int, int, int)](#%3Cinit%3E(zombie.characters.SurvivorDesc,zombie.iso.IsoCell,int,int,int))
   3. [IsoSurvivor(SurvivorDesc, IsoCell, int, int, int, boolean)](#%3Cinit%3E(zombie.characters.SurvivorDesc,zombie.iso.IsoCell,int,int,int,boolean))
8. [Method Details](#method-detail)
   1. [Despawn()](#Despawn())
   2. [getObjectName()](#getObjectName())
   3. [reloadSpritePart()](#reloadSpritePart())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoSurvivor
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")

[zombie.characters.IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")

zombie.characters.IsoLivingCharacter

zombie.characters.IsoSurvivor

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.ai.IStateCharacter, zombie.characters.action.IActionStateChanged, zombie.characters.CharacterInputComponentEntity, zombie.characters.ecs.ECSEntity, zombie.characters.ILuaGameCharacter, ILuaGameCharacterAttachedItems, ILuaGameCharacterClothing, zombie.characters.ILuaGameCharacterDamage, zombie.characters.ILuaGameCharacterHealth, zombie.characters.ILuaVariableSource, zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, IAnimationVariableRegistry, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.population.IClothingItemListener, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public final class IsoSurvivor
extends zombie.characters.IsoLivingCharacter

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characters.IsoSurvivor)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [IsoGameCharacter](IsoGameCharacter.html#nested-class-summary "class in zombie.characters")

  `IsoGameCharacter.BodyLocation, IsoGameCharacter.l_testDotSide, IsoGameCharacter.LightInfo, IsoGameCharacter.Location, IsoGameCharacter.PerkInfo, IsoGameCharacter.TorchInfo, IsoGameCharacter.XP, IsoGameCharacter.XPMultiplier`

  ### Nested classes/interfaces inherited from class [IsoObject](../iso/IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoPushableObject`

  `collidePushable`

  `boolean`

  `draggable`

  `boolean`

  `dragging`

  `IsoGameCharacter`

  `following`

  `private int`

  `neightbourUpdate`

  `private final int`

  `neightbourUpdateMax`

  `int`

  `nightsSurvived`

  `boolean`

  `noGoreDeath`

  `private int`

  `ping`

  `private final int`

  `repathDelay`

  `private final boolean`

  `tryToTeamUp`

  ### Fields inherited from class zombie.characters.IsoLivingCharacter

  `bareHands, collidedWithPushable, targetOnGround, useChargeDelta`

  ### Fields inherited from class [IsoGameCharacter](IsoGameCharacter.html#field-summary "class in zombie.characters")

  `allowConversation, amputations, asleep, attachedItems, attackedBy, attackTargetSquare, attackVars, AwkwardGlovesStrengthDivisor, bagsWorn, beard, BeenMovingForDecrease, BeenMovingForIncrease, blockTurning, bodyDamage, bumpNbr, callOut, characterActions, characterTraits, chatElement, cheats, climbing, clothingWetness, clothingWetnessSync, damagedByVehicle, dead, delayToActuallySleep, descriptor, doDirtBloodEtc, emitter, enemyList, falling, fallTime, finder, forceNullOverride, forceWakeUp, forceWakeUpTime, forwardDirection, GlovesStrengthBonus, hair, handItemShouldSendToClients, health, HUMANOID_SCREEN_CHEST_HEIGHT, HUMANOID_WORLD_CHEST_HEIGHT, hurtSound, ignoreStaggerBack, inf, inventory, invRadioFreq, isOnGround, isoPlayer, isResting, isVisibleToPlayer, kill, knockbackAttackMod, lastAnimalPet, lastFallSpeed, leftHandItem, legsSprite, lightInfo, moodles, networkCharacter, numSurvivorsInVicinity, onFireLightSource, overridePrimaryHandModel, overrideSecondaryHandModel, pathing, persistentOutfitId, persistentOutfitInit, playingDeathSound, postUpdateInternal, primaryHandModel, realState, realx, realy, realz, reanimatedCorpse, reanimatedCorpseId, remoteId, removedFromWorldMs, RENDER_OFFSET_X, RENDER_OFFSET_Y, rightHandItem, runSpeedModifier, s_maxPossibleTwist, savedInventoryItems, savedVehicleRunning, savedVehicleSeat, savedVehicleX, savedVehicleY, secondaryHandModel, slowFactor, slowTimer, SNEAK_LIMP_INJURY_THRESHOLD, SNEAK_LIMP_SPEED_SCALE_DEFAULT, speakColour, speaking, speedMod, stats, tempItemVisuals, tempo, tempo2, tempo3, timeOfSleep, turnDeltaNormal, turnDeltaRunning, turnDeltaSprinting, updateEquippedTextures, updateInternal, useHandWeapon, useParts, userName, usernameDisguised, vbdebugHitTarget, vehicle, vocalEvent, WALK_SPEED_DEFAULT, WALK_SPEED_SLOW, wasKnockedDown, wornItems, xp`

  ### Fields inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#field-summary "class in zombie.iso")

  `collidable, current, def, hitDir, id, last, MAX_ZOMBIES_EATING, movementLastFrame, movingSq, noDamage, reqMovement, shootable, solid, treeSoundMgr, weight, width`

  ### Fields inherited from class [IsoObject](../iso/IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSurvivor(SurvivorDesc desc,
  IsoCell cell,
  int x,
  int y,
  int z)`

  `IsoSurvivor(SurvivorDesc desc,
  IsoCell cell,
  int x,
  int y,
  int z,
  boolean bSetInstance)`

  `IsoSurvivor(IsoCell cell)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Despawn()`

  `String`

  `getObjectName()`

  `void`

  `reloadSpritePart()`

  ### Methods inherited from class zombie.characters.IsoLivingCharacter

  `AttemptAttack, clearHandToHandAttack, DoAttack, getAttackingWeapon, isCollidedWithPushableThisFrame, isDoHandToHandAttack, isDoShove, isDoStomp, isGrapplingWhileAiming, isPrimaryHandModelReady, isShoving, isShovingWhileAiming, isUnarmed, setDoShove`

  ### Methods inherited from class [IsoGameCharacter](IsoGameCharacter.html#method-summary "class in zombie.characters")

  `actionStateChanged, addArmMuscleStrain, addBackMuscleStrain, addBasicPatch, addBlood, addBloodFromVehicleImpact, addBodyVisualFromItemType, addBothArmMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addDirt, addHole, addHole, addHoleFromZombieAttacks, addKnownMediaLine, addLeftArmMuscleStrain, addLineChatElement, addLineChatElement, addLineChatElement, addLineChatElement, addLotsOfDirt, addNeckMuscleStrain, addOnDiedListener, addReadLiterature, addReadLiterature, addReadMap, addReadPrintMedia, addRightLegMuscleStrain, addStiffness, addVisualDamage, addWorldSoundUnlessInvisible, aimAtFloorTargetDistance, allowsInvisibleAnimationSkips, allowsTwist, applyCharacterTraitsRecipes, applyDamage, applyDamageFromVehicleHit, ApplyInBedOffset, applyProfessionRecipes, applyTraits, attackFromWindowsLunge, autoDrink, avoidDamage, becomeCorpseItem, BetaAntiDepress, BetaBlockers, bodyPartIsSpiked, bodyPartIsSpikedBehind, burnCorpse, CacheEquipped, calcCarForwardVector, calcCarPositionOffset, calcCarSpeedVector, calcCarSpeedVector, calcCarToPlayerVector, calcCarToPlayerVector, calcConeAngleMultiplier, calcConeAngleOffset, calcHitDir, calcHitDir, calcLengthMultiplier, calculateBaseSpeed, calculateCombatSpeed, calculateGrappleEffectivenessFromTraits, calculateIdleSpeed, calculateShadowParams, calculateShadowParams, calculateSneakLimpSpeedScale, calculateStats, calculateVisibilityData, calculateWalkSpeed, Callout, Callout, canAccessContainer, CanAttack, canBeGrappled, canClimbDownSheetRope, canClimbDownSheetRopeInCurrentSquare, canClimbSheetRope, canDropCorpseInto, canGrabCorpseFrom, canRagdoll, canReachTo, CanSee, CanSee, canSprint, canStandAt, canUseAsGenericCraftingSurface, canUseCurrentPoseForCorpse, canUseDebugContextMenu, canUseLootLog, canUseLootZed, CanUsePathfindState, carMovingBackward, causesDamageToVehicleWhenHit, changeState, checkCurrentAction, checkIsNearVehicle, checkIsNearWall, checkUpdateModelTextures, clear, clear, clearAIStateMap, clearAttachedItems, clearDiedBody, ClearEquippedCache, clearFallDamage, clearHitInfo, clearKnownMediaLines, clearVariable, ClearVariable, clearVariables, clearWornItems, climbDownSheetRope, climbOverFence, climbSheetRope, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindowFrame, closeWindow, clothingItemChanged, compareMovePriority, createFallingItem, createKeyRing, createKeyRing, damageWhileInTrees, dbgGetAnimTrack, dbgGetAnimTrackName, dbgGetAnimTrackTime, dbgGetAnimTrackWeight, die, dieNetwork, DirectionFromVector, DoDeath, DoDeath, doDeathSplatterAndSounds, doDeferredMovement, doDeferredMovementFromRagdoll, DoFloorSplat, DoFootstepSound, DoFootstepSound, DoLand, doNetworkHitByVehicle, doSleepSpeech, DoSneezeText, DoSplat, DoSwingCollisionBoneCheck, drawDebugTextBelow, drawDirectionLine, drawDirectionLine, drawLine, DrawSneezeText, dressInClothingItem, dressInNamedOutfit, dressInPersistentOutfit, dressInPersistentOutfitID, dressInRandomNonSillyOutfit, dressInRandomOutfit, Dressup, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, dropHandItems, dropHeavyItems, dropHeldItems, Eat, Eat, Eat, EatOnClient, endPlaybackGameVariables, ensureExistsBallisticsTarget, ensureNotInVehicle, enterVehicle, exert, faceDirection, faceLocation, faceLocationF, facePosition, faceThisObject, faceThisObjectAlt, fallenOnKnees, fallenOnKnees, fallFromRope, FireCheck, flagForHotSave, forceAwake, forgetRecipes, get, get, getAbsoluteExcessTwist, getActionContext, getActionStateName, getActiveLightItems, getAdvancedAnimator, getAge, getAimAtFloorAmount, getAimingDelay, getAimingMode, getAimOriginPosX, getAimOriginPosY, getAimOriginPosZ, getAlphaUpdateRateMul, getAlreadyReadPages, getAnimAngle, getAnimAngleRadians, getAnimAngleStepDelta, getAnimAngleTwistDelta, getAnimatable, getAnimationDebug, getAnimationPlayer, getAnimationStateName, getAnimationTimeDelta, getAnimEventBroadcaster, getAnimForwardDirection, GetAnimSetName, getAnimVector, getAppetiteMultiplier, getAttachedItem, getAttachedItems, getAttachedLocationGroup, getAttackedBy, getAttackTargetSquare, getAttackVars, getAutoWalkDirection, getBallisticsController, getBallisticsTarget, getBarricadeStrengthMod, getBarricadeTimeMod, getBed, getBedType, getBeenMovingFor, getBeenSprintingFor, getBetaDelta, getBetaEffect, getBloodImpactX, getBloodImpactY, getBloodImpactZ, getBloodSplat, getBlurFactor, getBodyDamage, getBodyDamageRemote, getBodyLocationGroup, getBodyPartClothingDefense, getBumpedChr, getBumpFallType, getBumpType, getCardinalDirection, getCardinalDirectionTo, getCharacterActions, getCharacterGender, getCharacterTraits, getChatElement, getCheats, getChestHeight, getChopTreeSpeed, getClickSound, getClimbData, getClimbingFailChanceFloat, getClimbingFailChanceInt, getClimbRopeSpeed, getClimbRopeTime, getClothingDiscomfortModifier, getClothingItem_Back, getClothingItem_Feet, getClothingItem_Hands, getClothingItem_Head, getClothingItem_Legs, getClothingItem_Torso, getClothingWetness, getClothingWetnessSync, getContainers, getContainerToolTip, getContextWorldContainers, getContextWorldContainers, getContextWorldContainersInObjects, getContextWorldContainersWithHumanCorpse, getContextWorldSuitableContainersToDropCorpseInObjects, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessRate, getCurrentActionContextStateName, getCurrentBuildingDef, getCurrentRoomDef, getCurrentState, getCurrentStateName, getCurrentVerticalAimAngle, getDangerLevels, getDebugMonitor, getDefaultState, getDeferredAngleDelta, getDeferredMovement, getDeferredMovement, getDeferredMovementFromRagdoll, getDeferredRotationWeight, getDepressDelta, getDepressEffect, getDescription, getDescriptor, getDetectionRange, getDieCount, getDirectionAngle, getDirectionAngleRadians, getDotWithForwardDirection, getDotWithForwardDirection, getEffectiveFatigue, getEmitter, getEnemyList, getEquipedRadio, getExcessTwist, getFallSpeedSeverity, getFallTime, getFamiliarBuildings, getFatigueMod, getFatiqueMultiplier, getFinder, getFireKillRate, getFireMode, getFireSpreadProbability, getFMODParameters, getFollowingTarget, getFootInjurySpeedModifier, getForceWakeUpTime, getForwardDirection, getForwardDirection, getForwardDirectionX, getForwardDirectionY, getForwardMovementIsoDirection, getFreeInventoryCapacity, getFullName, getGameVariables, getGameVariablesInternal, getGlobalMovementMod, getGrappleable, getHaloTimerCount, getHammerSoundMod, getHeadLookAngleMax, getHeadLookHorizontal, getHeadLookVertical, getHealth, getHearDistanceModifier, getHeightAboveFloor, getHitChancesMod, getHitDirEnum, getHitInfoList, getHitReaction, getHitReactionNetworkAI, getHittingMod, getHoursSurvived, getHungerMultiplier, getHurtSound, getHyperthermiaMod, getIdleSquareTime, getIgnoreMovement, getImpactIsoSpeed, getInf, getInventory, getInventoryWeight, getItemVisuals, getItemVisuals, getKnownRecipes, getLastBump, getLastChatMessage, getLastFallSpeed, getLastHeardSound, getLastHitCharacter, getLastHitCount, getLastHourSleeped, getLastKnownLocation, getLastKnownLocationOf, getLastLocalEnemies, getLastSpokenLine, getLastZombieKills, getLeaveBodyTimedown, getLegsSprite, getLevelMaxForXp, getLevelUpLevels, getLevelUpLevels, getLevelUpMultiplier, getLightfootMod, getLightInfo2, getLlx, getLly, getLlz, getLocalEnemyList, getLocalGroupList, getLocalList, getLocalNeutralList, getLocalRelevantEnemyList, getLookAngleRadians, getLookDirectionX, getLookDirectionY, getLookVector, getLowDangerInVicinity, getMaintenanceMod, getMapKnowledge, getMass, getMaxChatLines, getMaxTwist, getMaxWeight, getMaxWeightBase, getMeleeCombatMod, getMeleeDelay, getMetalBarricadeStrengthMod, getMinimumSimulationLevel, getModel, getModelInstance, getMomentumScalar, getMoodles, getMoveDelta, getMoveForwardVec, getMovementSpeed, getMusicIntensityEventModData, getNameCoords, getNearVehicle, getNetworkCharacterAI, getNextAnimationTranslationLength, getNextWander, getNimbleMod, getNumSurvivorsInVicinity, getNumTwistBones, getOrCreateSleepingEventData, getOutfitName, getOwner, getOwnerPlayer, getPacingMod, getPainDelta, getPainEffect, getPath2, getPathFindBehavior2, getPathIndex, getPathTargetX, getPathTargetY, getPathTargetZ, getPatience, getPatienceMax, getPatienceMin, getPerkInfo, getPerkLevel, getPerkList, getPerkToUnit, getPersistentOutfitID, getPreviousActionContextStateName, getPreviousStateName, GetPrimaryEquippedCache, getPrimaryHandItem, getPrimaryHandType, getRagdollController, getRandomDefaultOutfit, getReadLiterature, getReadPrintMedia, getReadyModelData, getReanimAnimDelay, getReanimAnimFrame, getReanimatedCorpse, getReanimateTimer, getRecoilDelay, getRecoilVarX, getRecoilVarY, getRecoveryMod, getReduceInfectionPower, getRemoteID, getRunSpeedModifier, getSafety, getSayLine, GetSecondaryEquippedCache, getSecondaryHandItem, getSecondaryHandType, getShoulderTwist, getShoulderTwistWeight, getShoutItemModel, getShoutType, getShovingMod, getSitOnFurnitureDirection, getSitOnFurnitureObject, getSleepingTabletDelta, getSleepingTabletEffect, getSlowFactor, getSlowTimer, getSneakLimpSpeedScale, getSneakSpotMod, getSpeakColour, getSpeakTime, getSpeedMod, getSprintMod, getSpriteDef, getStaggerTimeMod, getStateMachine, getStateMachineComponent, getStateMachineParams, getStatisticsDebug, getStats, getSubVariableSource, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpseInSquare, getSuitableContainersToDropCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSurroundingAttackingZombies, getSurroundingAttackingZombies, getSurvivorKills, getSurvivorMap, getTalkerType, getTargetGrapplePos, getTargetGrapplePos, getTargetGrappleRotation, getTargetTwist, getTargetVerticalAimAngle, getTempo, getTempo2, getTextureCreator, getThirstMultiplier, getThreatLevel, getTimedActionTimeModifier, getTimeSinceLastSmoke, getTimeThumping, getTorchStrength, getTotalBlood, getTurnDelta, getTwist, getUsedItemsOn, getUseHandWeapon, getUserNameHeight, getVariable, GetVariable, getVehicle, getVehicleDiscomfortModifier, getVeryCloseEnemyList, getVisual, getWaterSource, getWeaponLevel, getWeaponLevel, getWeatherHearingMultiplier, getWeightAsCorpse, getWeightMod, getWeldingSoundMod, getWornItem, getWornItems, getWornItemsHearingModifier, getWornItemsHearingMultiplier, getWornItemsVisionModifier, getWornItemsVisionMultiplier, getWrappedGrappleable, getXp, getXpForLevel, getZombieKills, handleLandingImpact, hasActiveModel, hasAnimationPlayer, hasAwkwardHands, hasBloodyClothing, hasDirtyClothing, hasEquipped, hasEquippedTag, hasFootInjury, hasFullInventory, hasHitReaction, HasItem, hasItems, hasPath, hasReadMap, hasRecipeAtHand, hasTimedActions, hasTrait, hasTrait, hasWornTag, helmetFall, Hit, Hit, Hit, hitConsequences, initAttachedItems, initLightInfo2, InitSpriteParts, initSpritePartsEmpty, initTextObjects, initWornItems, isAboveTopOfStairs, isActuallyAttackingWithMeleeWeapon, isAddedToModelManager, isAimAtFloor, isAiming, isAimingFirearmEquipped, isAlive, isAllowConversation, isAlwaysDayCheat, isAnimal, isAnimalCheat, isAnimalExtraValuesCheat, isAnimalRunningToDeathPosition, isAnimatingBackwards, isAnimationUpdatingThisFrame, isAnimForecasted, isAsleep, isAttachedItem, isAttacking, IsAttackRange, isAutoWalk, isbDoDefer, isBehaviourMoving, isBehind, isBeingSteppedOn, isbFalling, isbOnBed, isBuildCheat, isBumpDone, isBumped, isBumpFall, isBumpStaggered, isbUseParts, isCanShout, isCanUseBrushTool, isCheatSet, isClimbing, isClimbingRope, isClimbingThroughWindow, isClosingWindow, isCriticalHit, isCurrentActionAllowedWhileDraggingCorpses, isCurrentActionPathfinding, isCurrentGameClientState, isCurrentlyBusy, isCurrentlyIdle, isCurrentState, isDead, isDeathDragDown, isDeferredMovementEnabled, isDisguised, isDoDeathSound, isDoingActionThatCanBeCancelled, isDraggingCorpse, isDriving, isDuplicateBodyVisual, isEditingRagdoll, isEnduranceSufficientForAction, isEquipped, isEquippedClothing, isFacingLocation, isFacingObject, isFalling, isFallOnFront, isFarmingCheat, isFastMoveCheat, isFemale, isFishingCheat, isFullyRagdolling, isGodMod, isGrappleThrowIntoContainer, isGrappleThrowOutWindow, isGrappleThrowOverFence, isHandItem, isHandModelOverriddenByCurrentCharacterAction, isHeadLookAround, isHealthCheat, isHeavyItem, isHideEquippedHandL, isHideEquippedHandR, isHideWeaponModel, isHitFromBehind, isIgnoreMovementForDirection, isIgnoreStaggerBack, isImpactFromBehind, isImpactFromBehind, isImpactFromBehind, isInARoom, isInTrees, isInTrees2, isInTreesNoBush, isInventive, isInvincible, isInvisible, isInvulnerable, isItemInBothHands, isKilledByFall, isKilledBySlicingWeapon, isKnockedDown, isKnowAllRecipes, isKnownMediaLine, isKnownPoison, isKnownPoison, isLastCollidedN, isLastCollidedW, isLiteratureRead, isLocal, isMaskClicked, isMechanicsCheat, isMeleeAttackRange, isMeleeWeaponEquipped, isMovablesCheat, isMoving, isNearSirenVehicle, isNetworkVehicleCollisionActive, isNpc, isObjectBehind, isOnBack, isOnBed, isOnDeathDone, isOnFire, isOnKillDone, isOutside, isOverEncumbered, isPathing, isPerformingAttackAnimation, isPerformingGrappleAnimation, isPerformingHostileAnimation, isPerformingNoAimShortStrafe, isPerformingShoveAnimation, isPerformingStompAnimation, isPersistentOutfitInit, isPlayerMoving, isPlayingDeathSound, isPrimaryEquipped, isPrimaryHandItem, isPrintMediaRead, isProtectedFromToxic, isProtectedFromToxic, isPushedByForSeparate, isRagdoll, isRagdollFall, isRagdollSimulationActive, isRangedWeaponEmpty, isRangedWeaponEquipped, isReading, isReanim, isRecipeActuallyKnown, isRecipeActuallyKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRemote, isResting, isRunning, isSeatedInVehicle, isSecondaryHandItem, isShoveStompAnim, isShowAdminTag, isSitOnFurnitureObject, isSitOnGround, isSitting, isSittingOnFurniture, isSkipResolveCollision, isSneaking, isSpeaking, IsSpeaking, IsSpeakingNPC, isSprinting, isStaggerBack, isStrafing, isTimedActionInstant, isTimedActionInstantCheat, isTurning, isTurning90, isTurningAround, isTwisting, isUnderVehicle, isUnderVehicleRadius, isUnlimitedAmmo, isUnlimitedCarry, isUnlimitedEndurance, isUpdateAlphaDuringRender, isUpright, isUsingWornItems, isVehicleCollision, isVisibleToNPCs, isWeaponReady, isWearingAwkwardGloves, isWearingGlasses, isWearingGloves, isWearingTag, isWearingVisualAid, isZombie, isZombieAttacking, isZombieAttacking, isZombiesDontAttack, Kill, Kill, Kill, Kill, learnRecipe, learnRecipe, level0, LevelPerk, LevelPerk, load, loadChange, loadKnownMediaLines, LoseLevel, modifyTraitXPBoost, modifyTraitXPBoost, MoveForward, nearbyZombieClimbPenalty, OnAnimEvent, OnAnimEvent_IsAlmostUp, OnAnimEvent_KilledByAttacker, onAnimPlayerCreated, OnClothingUpdated, OnDeath, onDeath_ShouldDoSplatterAndSounds, OnEquipmentUpdated, onFireLightSourceCheck, onHitByVehicle, onHitByVehicleApplyDamage, onHitByVehicleDriver, onKilled, onMouseLeftClick, onRagdollSimulationStarted, onTrigger_setAnimStateToTriggerFile, onTrigger_setClothingToXmlTriggerFile, onWornItemsChanged, openWindow, PainMeds, pathToAux, pathToCharacter, pathToLocation, pathToLocationF, pathToSound, pickUpCorpse, pickUpCorpseItem, PlayAnim, PlayAnimUnlooped, PlayAnimWithSpeed, playbackRecordCurrentStateSnapshot, playbackSetCurrentStateSnapshot, playBloodSplatterSound, playDeadSound, playDropItemSound, playEmote, playerIsSelf, playHurtSound, playPainVoicesFromFallDamage, playSound, playSoundLocal, playWeaponHitArmourSound, postAnimationFinishing, postHitByVehicleUpdateStance, postupdate, postUpdateEquippedTextures, postUpdateModelTextures, preupdate, processHitDamage, QueueAction, readInventory, ReadLiterature, ReduceHealthWhenBurning, registerAIState, registerECSComponents, releaseAnimationPlayer, releaseBallisticsController, releaseBallisticsTarget, releaseRagdollController, reloadOutfit, remove, removeAttachedItem, removeFromHands, removeFromWorld, removeKnownMediaLine, removeOnFireLightSource, removeWornItem, removeWornItem, render, renderlast, renderObjectPicker, renderServerGUI, renderShadow, renderTextureInsteadOfModel, reportEvent, resetAimingDelay, resetBeardGrowingTime, resetBodyDamageRemote, resetEquippedHandsModels, resetHairGrowingTime, resetModel, resetModelNextFrame, save, saveChange, saveKnownMediaLines, Say, Say, SayDebug, SayDebug, SayRadio, SayShout, SayWhisper, Seen, set, setAddedToModelManager, setAge, setAimAtFloor, setAimAtFloor, setAimingDelay, setAllowConversation, setAlreadyReadPages, setAlwaysDayCheat, setAnimalCheat, setAnimalExtraValuesCheat, setAnimated, setAnimatingBackwards, setAnimForecasted, setAsleep, setAttachedItem, setAttachedItems, setAttackedBy, setAttackTargetSquare, setAutoWalk, setAutoWalkDirection, setAvoidDamage, setbClimbing, setbDoDefer, setBed, setBedType, setBeenMovingFor, setBeenSprintingFor, setBetaDelta, setBetaEffect, setbFalling, setBloodImpactX, setBloodImpactY, setBloodImpactZ, setBloodSplat, setbOnBed, setBuildCheat, setBumpDone, setBumpedChr, setBumpFall, setBumpFallType, setBumpStaggered, setBumpType, setbUseParts, setCanShout, setCanUseBrushTool, setCanUseDebugContextMenu, setCanUseLootLog, setCanUseLootZed, setCharacterGender, setClickSound, setClimbData, setClimbRopeTime, setClothingItem_Back, setClothingItem_Feet, setClothingItem_Hands, setClothingItem_Head, setClothingItem_Legs, setClothingItem_Torso, setCorpseSicknessRate, setCriticalHit, setCurrentVerticalAimAngle, setDangerLevels, setDeathDragDown, setDebugMonitor, setDefaultState, setDefaultState, setDeferredMovementEnabled, setDelayToSleep, setDepressDelta, setDepressEffect, setDescriptor, setDieCount, setDirectionAngle, setDoDeathSound, setEditingRagdoll, setEquipParent, setEquipParent, setFallOnFront, setFallTime, setFarmingCheat, setFastMoveCheat, setFemale, setFireKillRate, setFireMode, setFireSpreadProbability, setFishingCheat, setFollowingTarget, setForceWakeUpTime, setForwardDirection, setForwardDirection, setForwardDirectionFromAnimAngle, setForwardDirectionFromIsoDirection, setForwardIsoDirection, setGodMod, setGodMod, setGrappleThrowIntoContainer, setGrappleThrowOutWindow, setGrappleThrowOverFence, setHaloNote, setHaloNote, setHaloNote, setHeadLookAround, setHeadLookAroundDirection, setHealth, setHealthCheat, setHideEquippedHandL, setHideEquippedHandR, setHideWeaponModel, setHitDir, setHitFromBehind, setHitReaction, setHurtSound, setIgnoreMovement, setIgnoreStaggerBack, setInventory, setInvincible, setInvisible, setInvisible, setInvulnerable, setIsAiming, setIsAnimal, setIsResting, setKilledByFall, setKnockedDown, setKnowAllRecipes, setLastBump, setLastChatMessage, setLastCollidedN, setLastCollidedW, setLastFallSpeed, setLastHeardSound, setLastHitCharacter, setLastHitCount, setLastHourSleeped, setLastLocalEnemies, setLastSpokenLine, setLastZombieKills, setLeaveBodyTimedown, setLegsSprite, setLevelUpMultiplier, setLlx, setLly, setLlz, setMaxTwist, setMaxWeight, setMaxWeightBase, setMechanicsCheat, setMeleeDelay, setMetabolicTarget, setMetabolicTarget, setMomentumScalar, setMovablesCheat, setMoveDelta, setMoveForwardVec, setMoving, setMusicIntensityEventModData, setNextWander, setNumSurvivorsInVicinity, setOnBed, setOnDeathDone, setOnFire, SetOnFire, setOnKillDone, setOwner, setOwnerPlayer, setPainDelta, setPainEffect, setPath2, setPathIndex, setPathing, setPathSpeed, setPatience, setPatienceMax, setPatienceMin, setPerformingAttackAnimation, setPerformingShoveAnimation, setPerformingStompAnimation, setPerkLevelDebug, setPersistentOutfitID, setPersistentOutfitID, setPlayingDeathSound, setPrimaryHandItem, setRagdollFall, setRangedWeaponEmpty, setReading, setReanim, setReanimAnimDelay, setReanimAnimFrame, setReanimateTimer, setRecoilDelay, setRecoilVarX, setRecoilVarY, setReduceInfectionPower, setRemoteID, setRunning, setSafety, setSayLine, setSceneCulled, setSecondaryHandItem, setShoveStompAnim, setShowAdminTag, setSitOnFurnitureDirection, setSitOnFurnitureObject, setSitOnGround, setSittingOnFurniture, setSleepingTabletDelta, setSleepingTabletEffect, setSlowFactor, setSlowTimer, setSneaking, setSneakLimpSpeedScale, setSpeakColour, setSpeakColourInfo, setSpeaking, setSpeakTime, setSpeedMod, setSprinting, setStaggerTimeMod, setStateMachineLocked, setSurvivorKills, setTargetAndCurrentDirection, setTargetGrapplePos, setTargetVerticalAimAngle, setTextureCreator, setTimedActionInstantCheat, setTimeOfSleep, setTimeSinceLastSmoke, setTimeThumping, setTurnDelta, setUnlimitedAmmo, setUnlimitedCarry, setUnlimitedEndurance, setUseHandWeapon, setUsePhysicHitReaction, setVariable, setVariable, setVariable, setVariable, setVariable, SetVariable, setVariableEnum, setVehicle, setVehicleCollision, setVehicleHitLocation, setVisibleToNPCs, setWornItem, setWornItem, setWornItems, setXp, setZombieKills, setZombiesDontAttack, shouldBecomeZombieAfterDeath, shouldBeFalling, shouldBePushedBackByVehicleHit, shouldBeTurning, shouldBeTurning90, shouldBeTurningAround, shouldIgnoreCollisionWithSquare, shouldSnapZToCurrentSquare, shouldWaitToStartTimedAction, SleepingTablet, slideAwayFromWalls, smashCarWindow, smashWindow, spikePart, spikePartIndex, spinToZeroAllAnimNodes, splatBlood, splatBloodFloor, splatBloodFloorBig, SpreadFire, SpreadFireMP, StartAction, startEvent, startPlaybackGameVariables, StartTimedActionAnim, StartTimedActionAnim, StopAllActionQueue, StopAllActionQueueAiming, StopAllActionQueueRunning, StopAllActionQueueWalking, StopBurning, stopEvent, stopOrTriggerSound, StopTimedActionAnim, teleportTo, teleportTo, teleportTo, teleportTo, testCollideWithVehicles, testDefense, testDotSide, testDotSideEnum, TestIfSeen, Throw, throwGrappledIntoInventory, throwGrappledOverFence, throwGrappledTargetOutWindow, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerCough, tryGetAIState, update, updateAimingDelay, updateBallistics, updateBandages, updateDiscomfortModifiers, updateDisguisedState, updateEmitter, updateEquippedItemSounds, updateEquippedRadioFreq, updateEvent, updateForServerGui, updateHandEquips, updateHasTargetFlag, updateLightInfo, updateMovementMomentum, updateMovementRates, updateRecoilVar, updateSpeedModifiers, updateStats_Awake, updateStats_Sleeping, updateStats_WakeState, updateTextObjects, updateUserName, updateVisionEffects, updateVisionEffectTargets, updateWornItemsHearingModifier, updateWornItemsVisionModifier, usePhysicHitReaction, useRagdollVehicleCollision, wasLocal, zeroForwardDirectionX, zeroForwardDirectionY`

  ### Methods inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, doTreeNoises, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isCrawling, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isGettingUp, isOnFloor, isProne, isPushableForSeparate, isShootable, isSolid, isSolidForSeparate, isStanding, isWithinRange, moveUnmodded, moveUnmoddedInternal, onMouseRightClick, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, shouldSlideHeadAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, toString, updateAnimation`

  ### Methods inherited from class [IsoObject](../iso/IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.CharacterInputComponentEntity

  `getCharacterInputComponent, getInputMode, getInputMovementRate, getInputMoveVector, getJoypadBind, isAimKeyDown, isAllowRun, isAllowSprint, isAnyAimKeyDown, isAttackButtonDown, isBuildButtonDown, isBuildButtonReleased, isChangeCharacterKeyDown, isCrouchButtonPressed, isF12KeyDown, isForceAim, isForceRun, isForceSprint, isIgnoreInputsForDirection, isIgnoringAimingInput, isInputMoveAxisApplied, isInteractButtonClicked, isInteractButtonDown, isInteractButtonPressed, isJoypadButtonsActive, isJoypadIgnoreAimUntilCentered, isManualFloorAtkButtonDown, isMeleeButtonDown, isPrecisionAimKeyDown, isRunButtonDown, isShiftKeyDown, isSprintButtonDown, isWalkToButtonDown, setAllowRun, setAllowSprint, setForceAim, setForceRun, setForceSprint, setIgnoreAimingInput, setIgnoreInputsForDirection, setJoypadBind, setJoypadButtonsActive, setJoypadIgnoreAim, setJoypadIgnoreAimUntilCentered, toggleForceAim, wasRunButtonDown`

  ### Methods inherited from interface zombie.chat.ChatElementOwner

  `getSquare, getX, getY, getZ`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getECSComponentMap, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimatable

  `canTransitionToState, getAnimationRecorder, getOnlineID, getUID, isAnimationRecorderActive`

  ### Methods inherited from interface [IAnimationVariableRegistry](../core/skinnedmodel/advancedanimation/IAnimationVariableRegistry.html#method-summary "interface in zombie.core.skinnedmodel.advancedanimation")

  `setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable, setVariable`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource

  `getVariableBoolean, getVariableEnum`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer

  `containsVariable, getVariable, getVariableBoolean, getVariableBoolean, getVariableFloat, getVariableString, isVariable`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster

  `addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, addAnimEventListener, animEvent`

  ### Methods inherited from interface zombie.core.skinnedmodel.IGrappleable

  `getID, getPosition, getPosition, setDoGrappleLetGo, setGrappleDeferredOffset, setGrappleDeferredOffset, setPosition, setPosition, setTargetGrapplePos, setTargetGrapplePos, setTargetGrappleRotation`

  ### Methods inherited from interface zombie.core.skinnedmodel.IGrappleableWrapper

  `AcceptGrapple, getBearingFromGrappledTarget, getBearingToGrappledTarget, getGrappledBy, getGrappledByString, getGrappledByType, getGrappleOffset, getGrappleOffset, getGrappleOffsetBehaviour, getGrapplePosOffsetForward, getGrappleResult, getGrappleRotOffsetYaw, getGrapplingTarget, getSharedGrappleAnimFraction, getSharedGrappleAnimNode, getSharedGrappleAnimTime, getSharedGrappleType, Grappled, GrapplerLetGo, isBeingGrappled, isBeingGrappledBy, isDoContinueGrapple, isDoGrapple, isGrappling, isGrapplingTarget, isOnFloor, isPerformingAnyGrappleAnimation, isPerformingGrappleGrabAnimation, LetGoOfGrappled, RejectGrapple, resetGrappleStateToDefault, setDoContinueGrapple, setDoGrapple, setGrappleDeferredOffset, setGrappleoffsetBehaviour, setGrapplePosOffsetForward, setGrappleResult, setGrappleRotOffsetYaw, setOnFloor, setPerformingGrappleGrabAnimation, setSharedGrappleAnimFraction, setSharedGrappleAnimNode, setSharedGrappleAnimTime, setSharedGrappleType, setTargetGrappleRotation`

  ### Methods inherited from interface [ILuaIsoObject](../iso/ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.ai.IStateCharacter

  `canBeHitByVehicle, canCurrentStateRagdoll, canSlowDownVehicleWhenHit, hasCurrentState, isCurrentStateAttacking, isCurrentStateMoving`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### noGoreDeath

    public boolean noGoreDeath
  + ### draggable

    public boolean draggable
  + ### following

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") following
  + ### dragging

    public boolean dragging
  + ### repathDelay

    private final int repathDelay

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoSurvivor.repathDelay)
  + ### nightsSurvived

    public int nightsSurvived
  + ### ping

    private int ping
  + ### collidePushable

    public [IsoPushableObject](../iso/IsoPushableObject.html "class in zombie.iso") collidePushable
  + ### tryToTeamUp

    private final boolean tryToTeamUp

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoSurvivor.tryToTeamUp)
  + ### neightbourUpdate

    private int neightbourUpdate
  + ### neightbourUpdateMax

    private final int neightbourUpdateMax

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoSurvivor.neightbourUpdateMax)
* Constructor Details
  -------------------

  + ### IsoSurvivor

    public IsoSurvivor([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell)
  + ### IsoSurvivor

    public IsoSurvivor([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    [IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z)
  + ### IsoSurvivor

    public IsoSurvivor([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    [IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    boolean bSetInstance)
* Method Details
  --------------

  + ### Despawn

    public void Despawn()

    Overrides:
    :   `Despawn` in class `IsoMovingObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoMovingObject`
  + ### reloadSpritePart

    public void reloadSpritePart()