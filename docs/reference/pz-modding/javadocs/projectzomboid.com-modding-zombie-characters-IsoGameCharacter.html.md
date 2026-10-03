[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [CorpseBodyWeight](#CorpseBodyWeight)
   2. [BaseMuscleStrainMultiplier](#BaseMuscleStrainMultiplier)
   3. [ZombieAttackingClimbPenalty](#ZombieAttackingClimbPenalty)
   4. [ZombieNearbyClimbPenalty](#ZombieNearbyClimbPenalty)
   5. [GlovesStrengthBonus](#GlovesStrengthBonus)
   6. [AwkwardGlovesStrengthDivisor](#AwkwardGlovesStrengthDivisor)
   7. [tempItemVisuals](#tempItemVisuals)
   8. [HUMANOID\_WORLD\_CHEST\_HEIGHT](#HUMANOID_WORLD_CHEST_HEIGHT)
   9. [HUMANOID\_SCREEN\_CHEST\_HEIGHT](#HUMANOID_SCREEN_CHEST_HEIGHT)
   10. [extraLungeRange](#extraLungeRange)
   11. [headLookAround](#headLookAround)
   12. [maxHeadLookAngle](#maxHeadLookAngle)
   13. [headLookHorizontal](#headLookHorizontal)
   14. [headLookVertical](#headLookVertical)
   15. [doDeathSound](#doDeathSound)
   16. [canShout](#canShout)
   17. [doDirtBloodEtc](#doDirtBloodEtc)
   18. [instanceId](#instanceId)
   19. [RENDER\_OFFSET\_X](#RENDER_OFFSET_X)
   20. [RENDER\_OFFSET\_Y](#RENDER_OFFSET_Y)
   21. [s\_maxPossibleTwist](#s_maxPossibleTwist)
   22. [s\_bandages](#s_bandages)
   23. [SurvivorMap](#SurvivorMap)
   24. [LevelUpLevels](#LevelUpLevels)
   25. [tempo](#tempo)
   26. [tempo3](#tempo3)
   27. [inf](#inf)
   28. [vocalEvent](#vocalEvent)
   29. [removedFromWorldMs](#removedFromWorldMs)
   30. [isAddedToModelManager](#isAddedToModelManager)
   31. [autoWalk](#autoWalk)
   32. [autoWalkDirection](#autoWalkDirection)
   33. [sneaking](#sneaking)
   34. [SNEAK\_LIMP\_SPEED\_SCALE\_DEFAULT](#SNEAK_LIMP_SPEED_SCALE_DEFAULT)
   35. [sneakLimpSpeedScale](#sneakLimpSpeedScale)
   36. [WALK\_SPEED\_SLOW](#WALK_SPEED_SLOW)
   37. [WALK\_SPEED\_DEFAULT](#WALK_SPEED_DEFAULT)
   38. [SNEAK\_LIMP\_INJURY\_THRESHOLD](#SNEAK_LIMP_INJURY_THRESHOLD)
   39. [m\_sneakLimpSpeed](#m_sneakLimpSpeed)
   40. [m\_sneakLowLimpSpeed](#m_sneakLowLimpSpeed)
   41. [tempo2](#tempo2)
   42. [tempVector2\_1](#tempVector2_1)
   43. [tempVector2\_2](#tempVector2_2)
   44. [sleepText](#sleepText)
   45. [savedInventoryItems](#savedInventoryItems)
   46. [instancename](#instancename)
   47. [amputations](#amputations)
   48. [hair](#hair)
   49. [beard](#beard)
   50. [primaryHandModel](#primaryHandModel)
   51. [secondaryHandModel](#secondaryHandModel)
   52. [emitter](#emitter)
   53. [fmodParameters](#fmodParameters)
   54. [gameVariables](#gameVariables)
   55. [playbackGameVariables](#playbackGameVariables)
   56. [running](#running)
   57. [sprinting](#sprinting)
   58. [avoidDamage](#avoidDamage)
   59. [callOut](#callOut)
   60. [reanimatedCorpse](#reanimatedCorpse)
   61. [reanimatedCorpseId](#reanimatedCorpseId)
   62. [animPlayer](#animPlayer)
   63. [deferredMovementEnabled](#deferredMovementEnabled)
   64. [isCrit](#isCrit)
   65. [knockedDown](#knockedDown)
   66. [bumpNbr](#bumpNbr)
   67. [perkList](#perkList)
   68. [forwardDirection](#forwardDirection)
   69. [targetVerticalAimAngleDegrees](#targetVerticalAimAngleDegrees)
   70. [currentVerticalAimAngleDegrees](#currentVerticalAimAngleDegrees)
   71. [asleep](#asleep)
   72. [isResting](#isResting)
   73. [blockTurning](#blockTurning)
   74. [wasKnockedDown](#wasKnockedDown)
   75. [speedMod](#speedMod)
   76. [legsSprite](#legsSprite)
   77. [knockbackAttackMod](#knockbackAttackMod)
   78. [animal](#animal)
   79. [isVisibleToPlayer](#isVisibleToPlayer)
   80. [savedVehicleX](#savedVehicleX)
   81. [savedVehicleY](#savedVehicleY)
   82. [savedVehicleSeat](#savedVehicleSeat)
   83. [savedVehicleRunning](#savedVehicleRunning)
   84. [RecoilDelayDecrease](#RecoilDelayDecrease)
   85. [BeenMovingForIncrease](#BeenMovingForIncrease)
   86. [BeenMovingForDecrease](#BeenMovingForDecrease)
   87. [followingTarget](#followingTarget)
   88. [localList](#localList)
   89. [localNeutralList](#localNeutralList)
   90. [localGroupList](#localGroupList)
   91. [localRelevantEnemyList](#localRelevantEnemyList)
   92. [dangerLevels](#dangerLevels)
   93. [tempVector2](#tempVector2)
   94. [leaveBodyTimedown](#leaveBodyTimedown)
   95. [allowConversation](#allowConversation)
   96. [reanimateTimer](#reanimateTimer)
   97. [reanimAnimFrame](#reanimAnimFrame)
   98. [reanimAnimDelay](#reanimAnimDelay)
   99. [reanim](#reanim)
   100. [visibleToNpcs](#visibleToNpcs)
   101. [dieCount](#dieCount)
   102. [llx](#llx)
   103. [lly](#lly)
   104. [llz](#llz)
   105. [remoteId](#remoteId)
   106. [numSurvivorsInVicinity](#numSurvivorsInVicinity)
   107. [levelUpMultiplier](#levelUpMultiplier)
   108. [xp](#xp)
   109. [lastLocalEnemies](#lastLocalEnemies)
   110. [veryCloseEnemyList](#veryCloseEnemyList)
   111. [lastKnownLocation](#lastKnownLocation)
   112. [attackedBy](#attackedBy)
   113. [damagedByVehicle](#damagedByVehicle)
   114. [ignoreStaggerBack](#ignoreStaggerBack)
   115. [timeThumping](#timeThumping)
   116. [patienceMax](#patienceMax)
   117. [patienceMin](#patienceMin)
   118. [patience](#patience)
   119. [characterActions](#characterActions)
   120. [zombieKills](#zombieKills)
   121. [survivorKills](#survivorKills)
   122. [lastZombieKills](#lastZombieKills)
   123. [forceWakeUpTime](#forceWakeUpTime)
   124. [fullSpeedMod](#fullSpeedMod)
   125. [runSpeedModifier](#runSpeedModifier)
   126. [walkSpeedModifier](#walkSpeedModifier)
   127. [combatSpeedModifier](#combatSpeedModifier)
   128. [clothingDiscomfortModifier](#clothingDiscomfortModifier)
   129. [rangedWeaponEmpty](#rangedWeaponEmpty)
   130. [bagsWorn](#bagsWorn)
   131. [forceWakeUp](#forceWakeUp)
   132. [bodyDamage](#bodyDamage)
   133. [bodyDamageRemote](#bodyDamageRemote)
   134. [wornItems](#wornItems)
   135. [attachedItems](#attachedItems)
   136. [clothingWetness](#clothingWetness)
   137. [clothingWetnessSync](#clothingWetnessSync)
   138. [descriptor](#descriptor)
   139. [familiarBuildings](#familiarBuildings)
   140. [finder](#finder)
   141. [fireKillRate](#fireKillRate)
   142. [fireSpreadProbability](#fireSpreadProbability)
   143. [health](#health)
   144. [dead](#dead)
   145. [kill](#kill)
   146. [wornClothingCanRagdoll](#wornClothingCanRagdoll)
   147. [isEditingRagdoll](#isEditingRagdoll)
   148. [ragdollFall](#ragdollFall)
   149. [vehicleCollision](#vehicleCollision)
   150. [playingDeathSound](#playingDeathSound)
   151. [deathDragDown](#deathDragDown)
   152. [hurtSound](#hurtSound)
   153. [inventory](#inventory)
   154. [leftHandItem](#leftHandItem)
   155. [handItemShouldSendToClients](#handItemShouldSendToClients)
   156. [nextWander](#nextWander)
   157. [onFire](#onFire)
   158. [pathIndex](#pathIndex)
   159. [rightHandItem](#rightHandItem)
   160. [speakColour](#speakColour)
   161. [slowFactor](#slowFactor)
   162. [slowTimer](#slowTimer)
   163. [useParts](#useParts)
   164. [speaking](#speaking)
   165. [speakTime](#speakTime)
   166. [staggerTimeMod](#staggerTimeMod)
   167. [moodles](#moodles)
   168. [stats](#stats)
   169. [usedItemsOn](#usedItemsOn)
   170. [useHandWeapon](#useHandWeapon)
   171. [attackTargetSquare](#attackTargetSquare)
   172. [bloodImpactX](#bloodImpactX)
   173. [bloodImpactY](#bloodImpactY)
   174. [bloodImpactZ](#bloodImpactZ)
   175. [bloodSplat](#bloodSplat)
   176. [onBed](#onBed)
   177. [moveForwardVec](#moveForwardVec)
   178. [pathing](#pathing)
   179. [chatElement](#chatElement)
   180. [localEnemyList](#localEnemyList)
   181. [enemyList](#enemyList)
   182. [characterTraits](#characterTraits)
   183. [maxWeight](#maxWeight)
   184. [maxWeightBase](#maxWeightBase)
   185. [sleepingTabletEffect](#sleepingTabletEffect)
   186. [sleepingTabletDelta](#sleepingTabletDelta)
   187. [betaEffect](#betaEffect)
   188. [betaDelta](#betaDelta)
   189. [depressEffect](#depressEffect)
   190. [depressDelta](#depressDelta)
   191. [depressFirstTakeTime](#depressFirstTakeTime)
   192. [painEffect](#painEffect)
   193. [painDelta](#painDelta)
   194. [doDefer](#doDefer)
   195. [haloDispTime](#haloDispTime)
   196. [userName](#userName)
   197. [haloNote](#haloNote)
   198. [nameCarKeySuffix](#nameCarKeySuffix)
   199. [voiceSuffix](#voiceSuffix)
   200. [voiceMuteSuffix](#voiceMuteSuffix)
   201. [isoPlayer](#isoPlayer)
   202. [hasInitTextObjects](#hasInitTextObjects)
   203. [canSeeCurrent](#canSeeCurrent)
   204. [drawUserName](#drawUserName)
   205. [lastHeardSound](#lastHeardSound)
   206. [climbing](#climbing)
   207. [lastCollidedW](#lastCollidedW)
   208. [lastCollidedN](#lastCollidedN)
   209. [fallTime](#fallTime)
   210. [lastFallSpeed](#lastFallSpeed)
   211. [falling](#falling)
   212. [isOnGround](#isOnGround)
   213. [vehicle](#vehicle)
   214. [lastBump](#lastBump)
   215. [bumpedChr](#bumpedChr)
   216. [age](#age)
   217. [lastHitCount](#lastHitCount)
   218. [safety](#safety)
   219. [meleeDelay](#meleeDelay)
   220. [recoilDelay](#recoilDelay)
   221. [beenMovingFor](#beenMovingFor)
   222. [beenSprintingFor](#beenSprintingFor)
   223. [aimingDelay](#aimingDelay)
   224. [clickSound](#clickSound)
   225. [reduceInfectionPower](#reduceInfectionPower)
   226. [knownRecipes](#knownRecipes)
   227. [knownMediaLines](#knownMediaLines)
   228. [lastHourSleeped](#lastHourSleeped)
   229. [timeOfSleep](#timeOfSleep)
   230. [delayToActuallySleep](#delayToActuallySleep)
   231. [bedType](#bedType)
   232. [bed](#bed)
   233. [isReading](#isReading)
   234. [timeSinceLastSmoke](#timeSinceLastSmoke)
   235. [lastChatMessage](#lastChatMessage)
   236. [lastSpokenLine](#lastSpokenLine)
   237. [cheats](#cheats)
   238. [showAdminTag](#showAdminTag)
   239. [isAnimForecasted](#isAnimForecasted)
   240. [fallOnFront](#fallOnFront)
   241. [killedByFall](#killedByFall)
   242. [hitFromBehind](#hitFromBehind)
   243. [hitReaction](#hitReaction)
   244. [bumpType](#bumpType)
   245. [isBumpDone](#isBumpDone)
   246. [bumpFall](#bumpFall)
   247. [bumpStaggered](#bumpStaggered)
   248. [bumpFallType](#bumpFallType)
   249. [animationFinishing](#animationFinishing)
   250. [animationFinishingState](#animationFinishingState)
   251. [sleepSpeechCnt](#sleepSpeechCnt)
   252. [equipedRadio](#equipedRadio)
   253. [leftHandCache](#leftHandCache)
   254. [rightHandCache](#rightHandCache)
   255. [backCache](#backCache)
   256. [readBooks](#readBooks)
   257. [lightInfo](#lightInfo)
   258. [lightInfo2](#lightInfo2)
   259. [path2](#path2)
   260. [mapKnowledge](#mapKnowledge)
   261. [attackVars](#attackVars)
   262. [hasTarget](#hasTarget)
   263. [hitInfoList](#hitInfoList)
   264. [pfb2](#pfb2)
   265. [cacheEquiped](#cacheEquiped)
   266. [aimAtFloor](#aimAtFloor)
   267. [aimAtFloorTargetDistance](#aimAtFloorTargetDistance)
   268. [persistentOutfitId](#persistentOutfitId)
   269. [persistentOutfitInit](#persistentOutfitInit)
   270. [updateModelTextures](#updateModelTextures)
   271. [textureCreator](#textureCreator)
   272. [updateEquippedTextures](#updateEquippedTextures)
   273. [readyModelData](#readyModelData)
   274. [isSitOnFurniture](#isSitOnFurniture)
   275. [sitOnFurnitureObject](#sitOnFurnitureObject)
   276. [sitOnFurnitureDirection](#sitOnFurnitureDirection)
   277. [sitOnGround](#sitOnGround)
   278. [ignoreMovement](#ignoreMovement)
   279. [hideWeaponModel](#hideWeaponModel)
   280. [hideEquippedHandL](#hideEquippedHandL)
   281. [hideEquippedHandR](#hideEquippedHandR)
   282. [isAiming](#isAiming)
   283. [beardGrowTiming](#beardGrowTiming)
   284. [hairGrowTiming](#hairGrowTiming)
   285. [moveDelta](#moveDelta)
   286. [turnDeltaNormal](#turnDeltaNormal)
   287. [turnDeltaRunning](#turnDeltaRunning)
   288. [turnDeltaSprinting](#turnDeltaSprinting)
   289. [maxTwist](#maxTwist)
   290. [isMoving](#isMoving)
   291. [isTurning](#isTurning)
   292. [isTurningAround](#isTurningAround)
   293. [initialTurningAroundTarget](#initialTurningAroundTarget)
   294. [isTurning90](#isTurning90)
   295. [invincible](#invincible)
   296. [lungeFallTimer](#lungeFallTimer)
   297. [sleepingEventData](#sleepingEventData)
   298. [HAIR\_GROW\_TIME\_DAYS](#HAIR_GROW_TIME_DAYS)
   299. [BEARD\_GROW\_TIME\_DAYS](#BEARD_GROW_TIME_DAYS)
   300. [realx](#realx)
   301. [realy](#realy)
   302. [realz](#realz)
   303. [realState](#realState)
   304. [overridePrimaryHandModel](#overridePrimaryHandModel)
   305. [overrideSecondaryHandModel](#overrideSecondaryHandModel)
   306. [forceNullOverride](#forceNullOverride)
   307. [momentumScalar](#momentumScalar)
   308. [isPerformingAttackAnim](#isPerformingAttackAnim)
   309. [isPerformingShoveAnim](#isPerformingShoveAnim)
   310. [isPerformingStompAnim](#isPerformingStompAnim)
   311. [wornItemsVisionModifier](#wornItemsVisionModifier)
   312. [wornItemsHearingModifier](#wornItemsHearingModifier)
   313. [corpseSicknessRate](#corpseSicknessRate)
   314. [blurFactor](#blurFactor)
   315. [blurFactorTarget](#blurFactorTarget)
   316. [usernameDisguised](#usernameDisguised)
   317. [climbRopeTime](#climbRopeTime)
   318. [invRadioFreq](#invRadioFreq)
   319. [animStateTriggerWatcher](#animStateTriggerWatcher)
   320. [debugVariablesRegistered](#debugVariablesRegistered)
   321. [effectiveEdibleBuffTimer](#effectiveEdibleBuffTimer)
   322. [readLiterature](#readLiterature)
   323. [readPrintMedia](#readPrintMedia)
   324. [lastHitCharacter](#lastHitCharacter)
   325. [ballisticsController](#ballisticsController)
   326. [ballisticsTarget](#ballisticsTarget)
   327. [grappleable](#grappleable)
   328. [isAnimatingBackwards](#isAnimatingBackwards)
   329. [animationTimeScale](#animationTimeScale)
   330. [animationUpdatingThisFrame](#animationUpdatingThisFrame)
   331. [animationInvisibleFrameDelay](#animationInvisibleFrameDelay)
   332. [lastAnimalPet](#lastAnimalPet)
   333. [animEventBroadcaster](#animEventBroadcaster)
   334. [vbdebugHitTarget](#vbdebugHitTarget)
   335. [hitDirEnum](#hitDirEnum)
   336. [isGrappleThrowOutWindow](#isGrappleThrowOutWindow)
   337. [isGrappleThrowOverFence](#isGrappleThrowOverFence)
   338. [isGrappleThrowIntoContainer](#isGrappleThrowIntoContainer)
   339. [shoveStompAnim](#shoveStompAnim)
   340. [maxStrafeSpeed](#maxStrafeSpeed)
   341. [tempVector3f00](#tempVector3f00)
   342. [tempVector3f01](#tempVector3f01)
   343. [CombatSpeedBase](#CombatSpeedBase)
   344. [HeavyTwoHandedWeaponModifier](#HeavyTwoHandedWeaponModifier)
   345. [idleSquareTime](#idleSquareTime)
   346. [concurrentActionList](#concurrentActionList)
   347. [shadowFm](#shadowFm)
   348. [shadowBm](#shadowBm)
   349. [shadowTick](#shadowTick)
   350. [lastFitnessValue](#lastFitnessValue)
   351. [networkCharacter](#networkCharacter)
   352. [onDiedListeners](#onDiedListeners)
   353. [diedBody](#diedBody)
   354. [recoil](#recoil)
   355. [meleeWeaponMuscleStrainAdjustment](#meleeWeaponMuscleStrainAdjustment)
   356. [usePhysicHitReaction](#usePhysicHitReaction)
   357. [climbData](#climbData)
   358. [fallDamage](#fallDamage)
   359. [onFireLightSource](#onFireLightSource)
   360. [slideAwayFromWalls](#slideAwayFromWalls)
   361. [NAME\_TAG\_Y\_OFFSET](#NAME_TAG_Y_OFFSET)
   362. [movingStatic](#movingStatic)
   363. [postUpdateInternal](#postUpdateInternal)
   364. [updateInternal](#updateInternal)
   365. [tempVectorBonePos](#tempVectorBonePos)
7. [Constructor Details](#constructor-detail)
   1. [IsoGameCharacter(IsoCell, float, float, float)](#%3Cinit%3E(zombie.iso.IsoCell,float,float,float))
8. [Method Details](#method-detail)
   1. [registerECSComponents()](#registerECSComponents())
   2. [registerVariableCallbacks()](#registerVariableCallbacks())
   3. [isFalling()](#isFalling())
   4. [getMinFloorZ()](#getMinFloorZ())
   5. [registerAnimEventCallbacks()](#registerAnimEventCallbacks())
   6. [OnAnimEvent\_GrapplerLetGo(IsoGameCharacter, String)](#OnAnimEvent_GrapplerLetGo(zombie.characters.IsoGameCharacter,java.lang.String))
   7. [OnAnimEvent\_FallOnFront(IsoGameCharacter, boolean)](#OnAnimEvent_FallOnFront(zombie.characters.IsoGameCharacter,boolean))
   8. [OnAnimEvent\_SetOnFloor(IsoGameCharacter, boolean)](#OnAnimEvent_SetOnFloor(zombie.characters.IsoGameCharacter,boolean))
   9. [OnAnimEvent\_SetKnockedDown(IsoGameCharacter, boolean)](#OnAnimEvent_SetKnockedDown(zombie.characters.IsoGameCharacter,boolean))
   10. [OnAnimEvent\_IsAlmostUp(IsoGameCharacter)](#OnAnimEvent_IsAlmostUp(zombie.characters.IsoGameCharacter))
   11. [OnAnimEvent\_KilledByAttacker(IsoGameCharacter)](#OnAnimEvent_KilledByAttacker(zombie.characters.IsoGameCharacter))
   12. [isShoveStompAnim()](#isShoveStompAnim())
   13. [setShoveStompAnim(boolean)](#setShoveStompAnim(boolean))
   14. [onGrappleBegin()](#onGrappleBegin())
   15. [onGrappleEnded()](#onGrappleEnded())
   16. [canUseCurrentPoseForCorpse()](#canUseCurrentPoseForCorpse())
   17. [getRecoilVarX()](#getRecoilVarX())
   18. [setRecoilVarX(float)](#setRecoilVarX(float))
   19. [getRecoilVarY()](#getRecoilVarY())
   20. [setRecoilVarY(float)](#setRecoilVarY(float))
   21. [setGrappleThrowOutWindow(boolean)](#setGrappleThrowOutWindow(boolean))
   22. [isGrappleThrowOutWindow()](#isGrappleThrowOutWindow())
   23. [setGrappleThrowOverFence(boolean)](#setGrappleThrowOverFence(boolean))
   24. [isGrappleThrowOverFence()](#isGrappleThrowOverFence())
   25. [setGrappleThrowIntoContainer(boolean)](#setGrappleThrowIntoContainer(boolean))
   26. [isGrappleThrowIntoContainer()](#isGrappleThrowIntoContainer())
   27. [updateRecoilVar()](#updateRecoilVar())
   28. [registerDebugGameVariables()](#registerDebugGameVariables())
   29. [dbgRegisterAnimTrackVariable(int, int)](#dbgRegisterAnimTrackVariable(int,int))
   30. [setVehicleHitLocation(BaseVehicle)](#setVehicleHitLocation(zombie.vehicles.BaseVehicle))
   31. [getMomentumScalar()](#getMomentumScalar())
   32. [setMomentumScalar(float)](#setMomentumScalar(float))
   33. [getDeferredMovement(Vector2)](#getDeferredMovement(zombie.iso.Vector2))
   34. [getDeferredMovement(Vector2, boolean)](#getDeferredMovement(zombie.iso.Vector2,boolean))
   35. [getDeferredMovementFromRagdoll(Vector3)](#getDeferredMovementFromRagdoll(zombie.iso.Vector3))
   36. [getDeferredAngleDelta()](#getDeferredAngleDelta())
   37. [getDeferredRotationWeight()](#getDeferredRotationWeight())
   38. [getTargetGrapplePos(Vector3f)](#getTargetGrapplePos(org.joml.Vector3f))
   39. [getTargetGrapplePos(Vector3)](#getTargetGrapplePos(zombie.iso.Vector3))
   40. [setTargetGrapplePos(float, float, float)](#setTargetGrapplePos(float,float,float))
   41. [getTargetGrappleRotation(Vector2)](#getTargetGrappleRotation(zombie.iso.Vector2))
   42. [isStrafing()](#isStrafing())
   43. [isPerformingNoAimShortStrafe()](#isPerformingNoAimShortStrafe())
   44. [dbgGetAnimTrack(int, int)](#dbgGetAnimTrack(int,int))
   45. [dbgGetAnimTrackName(int, int)](#dbgGetAnimTrackName(int,int))
   46. [dbgGetAnimTrackTime(int, int)](#dbgGetAnimTrackTime(int,int))
   47. [dbgGetAnimTrackWeight(int, int)](#dbgGetAnimTrackWeight(int,int))
   48. [getTwist()](#getTwist())
   49. [getShoulderTwist()](#getShoulderTwist())
   50. [getMaxTwist()](#getMaxTwist())
   51. [setMaxTwist(float)](#setMaxTwist(float))
   52. [getExcessTwist()](#getExcessTwist())
   53. [getNumTwistBones()](#getNumTwistBones())
   54. [getAbsoluteExcessTwist()](#getAbsoluteExcessTwist())
   55. [getAnimAngleTwistDelta()](#getAnimAngleTwistDelta())
   56. [getAnimAngleStepDelta()](#getAnimAngleStepDelta())
   57. [getTargetTwist()](#getTargetTwist())
   58. [isRangedWeaponEmpty()](#isRangedWeaponEmpty())
   59. [setRangedWeaponEmpty(boolean)](#setRangedWeaponEmpty(boolean))
   60. [hasFootInjury()](#hasFootInjury())
   61. [isInTrees2(boolean)](#isInTrees2(boolean))
   62. [isInTreesNoBush()](#isInTreesNoBush())
   63. [isInTrees()](#isInTrees())
   64. [getSurvivorMap()](#getSurvivorMap())
   65. [getLevelUpLevels()](#getLevelUpLevels())
   66. [getTempo()](#getTempo())
   67. [getTempo2()](#getTempo2())
   68. [getInf()](#getInf())
   69. [getEmitter()](#getEmitter())
   70. [updateEmitter()](#updateEmitter())
   71. [doDeferredMovement()](#doDeferredMovement())
   72. [doDeferredMovementFromRagdoll(Vector3)](#doDeferredMovementFromRagdoll(zombie.iso.Vector3))
   73. [getActionContext()](#getActionContext())
   74. [getStateMachineComponent()](#getStateMachineComponent())
   75. [getPreviousActionContextStateName()](#getPreviousActionContextStateName())
   76. [getCurrentActionContextStateName()](#getCurrentActionContextStateName())
   77. [hasAnimationPlayer()](#hasAnimationPlayer())
   78. [getAnimationPlayer()](#getAnimationPlayer())
   79. [releaseAnimationPlayer()](#releaseAnimationPlayer())
   80. [onAnimPlayerCreated(AnimationPlayer)](#onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer))
   81. [getAdvancedAnimator()](#getAdvancedAnimator())
   82. [getModelInstance()](#getModelInstance())
   83. [getCurrentStateName()](#getCurrentStateName())
   84. [getPreviousStateName()](#getPreviousStateName())
   85. [getAnimationDebug()](#getAnimationDebug())
   86. [getStatisticsDebug()](#getStatisticsDebug())
   87. [getTalkerType()](#getTalkerType())
   88. [spinToZeroAllAnimNodes()](#spinToZeroAllAnimNodes())
   89. [isAnimForecasted()](#isAnimForecasted())
   90. [setAnimForecasted(int)](#setAnimForecasted(int))
   91. [resetModel()](#resetModel())
   92. [resetModelNextFrame()](#resetModelNextFrame())
   93. [onTrigger\_setClothingToXmlTriggerFile(TriggerXmlFile)](#onTrigger_setClothingToXmlTriggerFile(zombie.characters.TriggerXmlFile))
   94. [onTrigger\_setAnimStateToTriggerFile(AnimStateTriggerXmlFile)](#onTrigger_setAnimStateToTriggerFile(zombie.characters.AnimStateTriggerXmlFile))
   95. [restoreAnimatorStateToActionContext()](#restoreAnimatorStateToActionContext())
   96. [clothingItemChanged(String)](#clothingItemChanged(java.lang.String))
   97. [reloadOutfit()](#reloadOutfit())
   98. [setSceneCulled(boolean)](#setSceneCulled(boolean))
   99. [setAddedToModelManager(ModelManager, boolean)](#setAddedToModelManager(zombie.core.skinnedmodel.ModelManager,boolean))
   100. [isAddedToModelManager()](#isAddedToModelManager())
   101. [dressInRandomOutfit()](#dressInRandomOutfit())
   102. [dressInRandomNonSillyOutfit()](#dressInRandomNonSillyOutfit())
   103. [dressInNamedOutfit(String)](#dressInNamedOutfit(java.lang.String))
   104. [dressInPersistentOutfit(String)](#dressInPersistentOutfit(java.lang.String))
   105. [dressInPersistentOutfitID(int)](#dressInPersistentOutfitID(int))
   106. [getOutfitName()](#getOutfitName())
   107. [dressInClothingItem(String)](#dressInClothingItem(java.lang.String))
   108. [getRandomDefaultOutfit()](#getRandomDefaultOutfit())
   109. [getModel()](#getModel())
   110. [hasActiveModel()](#hasActiveModel())
   111. [hasItems(String, int)](#hasItems(java.lang.String,int))
   112. [getLevelUpLevels(int)](#getLevelUpLevels(int))
   113. [getLevelMaxForXp()](#getLevelMaxForXp())
   114. [getXpForLevel(int)](#getXpForLevel(int))
   115. [DoDeath(HandWeapon, IsoGameCharacter)](#DoDeath(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter))
   116. [DoDeath(HandWeapon, IsoGameCharacter, boolean)](#DoDeath(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean))
   117. [doDeathSplatterAndSounds(HandWeapon, IsoGameCharacter, boolean)](#doDeathSplatterAndSounds(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean))
   118. [onDeath\_ShouldDoSplatterAndSounds(HandWeapon, IsoGameCharacter, boolean)](#onDeath_ShouldDoSplatterAndSounds(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean))
   119. [TestIfSeen(int, IsoPlayer)](#TestIfSeen(int,zombie.characters.IsoPlayer))
   120. [clearFallDamage()](#clearFallDamage())
   121. [getImpactIsoSpeed()](#getImpactIsoSpeed())
   122. [DoLand(float)](#DoLand(float))
   123. [handleLandingImpact(FallDamage)](#handleLandingImpact(zombie.characters.FallDamage))
   124. [playPainVoicesFromFallDamage(FallDamage)](#playPainVoicesFromFallDamage(zombie.characters.FallDamage))
   125. [getContextWorldContainers(T, Invokers.Params2.Boolean.ICallback)](#getContextWorldContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   126. [getContextWorldContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getContextWorldContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   127. [getContextWorldContainersInObjects(IsoObject[], T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getContextWorldContainersInObjects(zombie.iso.IsoObject%5B%5D,T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   128. [getContextWorldSuitableContainersToDropCorpseInObjects(IsoObject[])](#getContextWorldSuitableContainersToDropCorpseInObjects(zombie.iso.IsoObject%5B%5D))
   129. [getSuitableContainersToDropCorpseInSquare(IsoGridSquare)](#getSuitableContainersToDropCorpseInSquare(zombie.iso.IsoGridSquare))
   130. [getSuitableContainersToDropCorpseInSquare(IsoGridSquare, PZArrayList)](#getSuitableContainersToDropCorpseInSquare(zombie.iso.IsoGridSquare,zombie.util.list.PZArrayList))
   131. [getSuitableContainersToDropCorpse()](#getSuitableContainersToDropCorpse())
   132. [getSuitableContainersToDropCorpse(PZArrayList)](#getSuitableContainersToDropCorpse(zombie.util.list.PZArrayList))
   133. [getContextWorldContainersWithHumanCorpse(IsoObject[])](#getContextWorldContainersWithHumanCorpse(zombie.iso.IsoObject%5B%5D))
   134. [getSuitableContainersWithHumanCorpseInSquare(IsoGridSquare)](#getSuitableContainersWithHumanCorpseInSquare(zombie.iso.IsoGridSquare))
   135. [getSuitableContainersWithHumanCorpseInSquare(IsoGridSquare, PZArrayList)](#getSuitableContainersWithHumanCorpseInSquare(zombie.iso.IsoGridSquare,zombie.util.list.PZArrayList))
   136. [canDropCorpseInto(IsoGameCharacter, ItemContainer)](#canDropCorpseInto(zombie.characters.IsoGameCharacter,zombie.inventory.ItemContainer))
   137. [canGrabCorpseFrom(IsoGameCharacter, ItemContainer)](#canGrabCorpseFrom(zombie.characters.IsoGameCharacter,zombie.inventory.ItemContainer))
   138. [canAccessContainer(ItemContainer)](#canAccessContainer(zombie.inventory.ItemContainer))
   139. [getContainerToolTip(ItemContainer)](#getContainerToolTip(zombie.inventory.ItemContainer))
   140. [getFollowingTarget()](#getFollowingTarget())
   141. [setFollowingTarget(IsoGameCharacter)](#setFollowingTarget(zombie.characters.IsoGameCharacter))
   142. [getLocalList()](#getLocalList())
   143. [getLocalNeutralList()](#getLocalNeutralList())
   144. [getLocalGroupList()](#getLocalGroupList())
   145. [getLocalRelevantEnemyList()](#getLocalRelevantEnemyList())
   146. [getDangerLevels()](#getDangerLevels())
   147. [setDangerLevels(float)](#setDangerLevels(float))
   148. [getPerkList()](#getPerkList())
   149. [getLeaveBodyTimedown()](#getLeaveBodyTimedown())
   150. [setLeaveBodyTimedown(float)](#setLeaveBodyTimedown(float))
   151. [isAllowConversation()](#isAllowConversation())
   152. [setAllowConversation(boolean)](#setAllowConversation(boolean))
   153. [getReanimateTimer()](#getReanimateTimer())
   154. [setReanimateTimer(float)](#setReanimateTimer(float))
   155. [getReanimAnimFrame()](#getReanimAnimFrame())
   156. [setReanimAnimFrame(int)](#setReanimAnimFrame(int))
   157. [getReanimAnimDelay()](#getReanimAnimDelay())
   158. [setReanimAnimDelay(int)](#setReanimAnimDelay(int))
   159. [isReanim()](#isReanim())
   160. [setReanim(boolean)](#setReanim(boolean))
   161. [isVisibleToNPCs()](#isVisibleToNPCs())
   162. [setVisibleToNPCs(boolean)](#setVisibleToNPCs(boolean))
   163. [getDieCount()](#getDieCount())
   164. [setDieCount(int)](#setDieCount(int))
   165. [getLlx()](#getLlx())
   166. [setLlx(float)](#setLlx(float))
   167. [getLly()](#getLly())
   168. [setLly(float)](#setLly(float))
   169. [getLlz()](#getLlz())
   170. [setLlz(float)](#setLlz(float))
   171. [getRemoteID()](#getRemoteID())
   172. [setRemoteID(int)](#setRemoteID(int))
   173. [getNumSurvivorsInVicinity()](#getNumSurvivorsInVicinity())
   174. [setNumSurvivorsInVicinity(int)](#setNumSurvivorsInVicinity(int))
   175. [getLevelUpMultiplier()](#getLevelUpMultiplier())
   176. [setLevelUpMultiplier(float)](#setLevelUpMultiplier(float))
   177. [getXp()](#getXp())
   178. [setXp(IsoGameCharacter.XP)](#setXp(zombie.characters.IsoGameCharacter.XP))
   179. [getLastLocalEnemies()](#getLastLocalEnemies())
   180. [setLastLocalEnemies(int)](#setLastLocalEnemies(int))
   181. [getVeryCloseEnemyList()](#getVeryCloseEnemyList())
   182. [getLastKnownLocation()](#getLastKnownLocation())
   183. [getAttackedBy()](#getAttackedBy())
   184. [setAttackedBy(IsoGameCharacter)](#setAttackedBy(zombie.characters.IsoGameCharacter))
   185. [isIgnoreStaggerBack()](#isIgnoreStaggerBack())
   186. [setIgnoreStaggerBack(boolean)](#setIgnoreStaggerBack(boolean))
   187. [getTimeThumping()](#getTimeThumping())
   188. [setTimeThumping(int)](#setTimeThumping(int))
   189. [getPatienceMax()](#getPatienceMax())
   190. [setPatienceMax(int)](#setPatienceMax(int))
   191. [getPatienceMin()](#getPatienceMin())
   192. [setPatienceMin(int)](#setPatienceMin(int))
   193. [getPatience()](#getPatience())
   194. [setPatience(int)](#setPatience(int))
   195. [getCharacterActions()](#getCharacterActions())
   196. [hasTimedActions()](#hasTimedActions())
   197. [isCurrentActionPathfinding()](#isCurrentActionPathfinding())
   198. [isCurrentActionAllowedWhileDraggingCorpses()](#isCurrentActionAllowedWhileDraggingCorpses())
   199. [checkCurrentAction(Invokers.Params1.Boolean.ICallback)](#checkCurrentAction(zombie.util.lambda.Invokers.Params1.Boolean.ICallback))
   200. [isImpactFromBehind(Vector2)](#isImpactFromBehind(zombie.iso.Vector2))
   201. [isImpactFromBehind(float, float)](#isImpactFromBehind(float,float))
   202. [isImpactFromBehind(float, float, float, float)](#isImpactFromBehind(float,float,float,float))
   203. [getForwardDirection()](#getForwardDirection())
   204. [getForwardDirectionX()](#getForwardDirectionX())
   205. [getForwardDirectionY()](#getForwardDirectionY())
   206. [getForwardDirection(Vector2)](#getForwardDirection(zombie.iso.Vector2))
   207. [setForwardDirection(Vector2)](#setForwardDirection(zombie.iso.Vector2))
   208. [setTargetAndCurrentDirection(float, float)](#setTargetAndCurrentDirection(float,float))
   209. [setForwardDirection(float, float)](#setForwardDirection(float,float))
   210. [zeroForwardDirectionX()](#zeroForwardDirectionX())
   211. [zeroForwardDirectionY()](#zeroForwardDirectionY())
   212. [getDirectionAngleRadians()](#getDirectionAngleRadians())
   213. [getDirectionAngle()](#getDirectionAngle())
   214. [setDirectionAngle(float)](#setDirectionAngle(float))
   215. [getAnimAngle()](#getAnimAngle())
   216. [getAnimAngleRadians()](#getAnimAngleRadians())
   217. [getAnimVector(Vector2)](#getAnimVector(zombie.iso.Vector2))
   218. [getAnimForwardDirection(Vector2)](#getAnimForwardDirection(zombie.iso.Vector2))
   219. [getLookAngleRadians()](#getLookAngleRadians())
   220. [getLookVector(Vector2)](#getLookVector(zombie.iso.Vector2))
   221. [getLookDirectionX()](#getLookDirectionX())
   222. [getLookDirectionY()](#getLookDirectionY())
   223. [isAnimatingBackwards()](#isAnimatingBackwards())
   224. [getForwardMovementIsoDirection()](#getForwardMovementIsoDirection())
   225. [setAnimatingBackwards(boolean)](#setAnimatingBackwards(boolean))
   226. [isDraggingCorpse()](#isDraggingCorpse())
   227. [getOwner()](#getOwner())
   228. [setOwner(UdpConnection)](#setOwner(zombie.core.raknet.UdpConnection))
   229. [getOwnerPlayer()](#getOwnerPlayer())
   230. [setOwnerPlayer(IsoPlayer)](#setOwnerPlayer(zombie.characters.IsoPlayer))
   231. [getDotWithForwardDirection(Vector3)](#getDotWithForwardDirection(zombie.iso.Vector3))
   232. [getDotWithForwardDirection(float, float)](#getDotWithForwardDirection(float,float))
   233. [getCardinalDirection()](#getCardinalDirection())
   234. [isAsleep()](#isAsleep())
   235. [setAsleep(boolean)](#setAsleep(boolean))
   236. [isResting()](#isResting())
   237. [setIsResting(boolean)](#setIsResting(boolean))
   238. [getZombieKills()](#getZombieKills())
   239. [setZombieKills(int)](#setZombieKills(int))
   240. [getLastZombieKills()](#getLastZombieKills())
   241. [setLastZombieKills(int)](#setLastZombieKills(int))
   242. [getForceWakeUpTime()](#getForceWakeUpTime())
   243. [setForceWakeUpTime(float)](#setForceWakeUpTime(float))
   244. [forceAwake()](#forceAwake())
   245. [getBodyDamage()](#getBodyDamage())
   246. [getBodyDamageRemote()](#getBodyDamageRemote())
   247. [resetBodyDamageRemote()](#resetBodyDamageRemote())
   248. [getDefaultState()](#getDefaultState())
   249. [setDefaultState(State)](#setDefaultState(zombie.ai.State))
   250. [getDescriptor()](#getDescriptor())
   251. [setDescriptor(SurvivorDesc)](#setDescriptor(zombie.characters.SurvivorDesc))
   252. [getFullName()](#getFullName())
   253. [getVisual()](#getVisual())
   254. [getItemVisuals()](#getItemVisuals())
   255. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   256. [isUsingWornItems()](#isUsingWornItems())
   257. [getFamiliarBuildings()](#getFamiliarBuildings())
   258. [getFinder()](#getFinder())
   259. [getFireKillRate()](#getFireKillRate())
   260. [setFireKillRate(float)](#setFireKillRate(float))
   261. [getFireSpreadProbability()](#getFireSpreadProbability())
   262. [setFireSpreadProbability(int)](#setFireSpreadProbability(int))
   263. [getHealth()](#getHealth())
   264. [setHealth(float)](#setHealth(float))
   265. [isOnDeathDone()](#isOnDeathDone())
   266. [setOnDeathDone(boolean)](#setOnDeathDone(boolean))
   267. [isOnKillDone()](#isOnKillDone())
   268. [setOnKillDone(boolean)](#setOnKillDone(boolean))
   269. [isDeathDragDown()](#isDeathDragDown())
   270. [setDeathDragDown(boolean)](#setDeathDragDown(boolean))
   271. [isPlayingDeathSound()](#isPlayingDeathSound())
   272. [setPlayingDeathSound(boolean)](#setPlayingDeathSound(boolean))
   273. [getHurtSound()](#getHurtSound())
   274. [setHurtSound(String)](#setHurtSound(java.lang.String))
   275. [isIgnoreMovementForDirection()](#isIgnoreMovementForDirection())
   276. [getInventory()](#getInventory())
   277. [setInventory(ItemContainer)](#setInventory(zombie.inventory.ItemContainer))
   278. [isPrimaryEquipped(String)](#isPrimaryEquipped(java.lang.String))
   279. [getPrimaryHandItem()](#getPrimaryHandItem())
   280. [setPrimaryHandItem(InventoryItem)](#setPrimaryHandItem(zombie.inventory.InventoryItem))
   281. [getAttackingWeapon()](#getAttackingWeapon())
   282. [setEquipParent(InventoryItem, InventoryItem)](#setEquipParent(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   283. [setEquipParent(InventoryItem, InventoryItem, boolean)](#setEquipParent(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem,boolean))
   284. [initWornItems(String)](#initWornItems(java.lang.String))
   285. [getWornItems()](#getWornItems())
   286. [setWornItems(WornItems)](#setWornItems(zombie.characters.WornItems.WornItems))
   287. [getWornItem(ItemBodyLocation)](#getWornItem(zombie.scripting.objects.ItemBodyLocation))
   288. [setWornItem(ItemBodyLocation, InventoryItem)](#setWornItem(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   289. [setWornItem(ItemBodyLocation, InventoryItem, boolean)](#setWornItem(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem,boolean))
   290. [removeWornItem(InventoryItem)](#removeWornItem(zombie.inventory.InventoryItem))
   291. [removeWornItem(InventoryItem, boolean)](#removeWornItem(zombie.inventory.InventoryItem,boolean))
   292. [clearWornItems()](#clearWornItems())
   293. [getBodyLocationGroup()](#getBodyLocationGroup())
   294. [onWornItemsChanged()](#onWornItemsChanged())
   295. [initAttachedItems(String)](#initAttachedItems(java.lang.String))
   296. [getAttachedItems()](#getAttachedItems())
   297. [setAttachedItems(AttachedItems)](#setAttachedItems(zombie.characters.AttachedItems.AttachedItems))
   298. [getAttachedItem(String)](#getAttachedItem(java.lang.String))
   299. [setAttachedItem(String, InventoryItem)](#setAttachedItem(java.lang.String,zombie.inventory.InventoryItem))
   300. [removeAttachedItem(InventoryItem)](#removeAttachedItem(zombie.inventory.InventoryItem))
   301. [clearAttachedItems()](#clearAttachedItems())
   302. [getAttachedLocationGroup()](#getAttachedLocationGroup())
   303. [getClothingWetness()](#getClothingWetness())
   304. [getClothingWetnessSync()](#getClothingWetnessSync())
   305. [getClothingItem\_Head()](#getClothingItem_Head())
   306. [setClothingItem\_Head(InventoryItem)](#setClothingItem_Head(zombie.inventory.InventoryItem))
   307. [getClothingItem\_Torso()](#getClothingItem_Torso())
   308. [setClothingItem\_Torso(InventoryItem)](#setClothingItem_Torso(zombie.inventory.InventoryItem))
   309. [getClothingItem\_Back()](#getClothingItem_Back())
   310. [setClothingItem\_Back(InventoryItem)](#setClothingItem_Back(zombie.inventory.InventoryItem))
   311. [getClothingItem\_Hands()](#getClothingItem_Hands())
   312. [setClothingItem\_Hands(InventoryItem)](#setClothingItem_Hands(zombie.inventory.InventoryItem))
   313. [getClothingItem\_Legs()](#getClothingItem_Legs())
   314. [setClothingItem\_Legs(InventoryItem)](#setClothingItem_Legs(zombie.inventory.InventoryItem))
   315. [getClothingItem\_Feet()](#getClothingItem_Feet())
   316. [setClothingItem\_Feet(InventoryItem)](#setClothingItem_Feet(zombie.inventory.InventoryItem))
   317. [getNextWander()](#getNextWander())
   318. [setNextWander(int)](#setNextWander(int))
   319. [isOnFire()](#isOnFire())
   320. [setOnFire(boolean)](#setOnFire(boolean))
   321. [removeFromWorld()](#removeFromWorld())
   322. [getPathIndex()](#getPathIndex())
   323. [setPathIndex(int)](#setPathIndex(int))
   324. [getPathTargetX()](#getPathTargetX())
   325. [getPathTargetY()](#getPathTargetY())
   326. [getPathTargetZ()](#getPathTargetZ())
   327. [getSecondaryHandItem()](#getSecondaryHandItem())
   328. [setSecondaryHandItem(InventoryItem)](#setSecondaryHandItem(zombie.inventory.InventoryItem))
   329. [isHandItem(InventoryItem)](#isHandItem(zombie.inventory.InventoryItem))
   330. [isPrimaryHandItem(InventoryItem)](#isPrimaryHandItem(zombie.inventory.InventoryItem))
   331. [isSecondaryHandItem(InventoryItem)](#isSecondaryHandItem(zombie.inventory.InventoryItem))
   332. [isItemInBothHands(InventoryItem)](#isItemInBothHands(zombie.inventory.InventoryItem))
   333. [removeFromHands(InventoryItem)](#removeFromHands(zombie.inventory.InventoryItem))
   334. [getSpeakColour()](#getSpeakColour())
   335. [setSpeakColour(Color)](#setSpeakColour(zombie.core.Color))
   336. [setSpeakColourInfo(ColorInfo)](#setSpeakColourInfo(zombie.core.textures.ColorInfo))
   337. [getSlowFactor()](#getSlowFactor())
   338. [setSlowFactor(float)](#setSlowFactor(float))
   339. [getSlowTimer()](#getSlowTimer())
   340. [setSlowTimer(float)](#setSlowTimer(float))
   341. [isbUseParts()](#isbUseParts())
   342. [setbUseParts(boolean)](#setbUseParts(boolean))
   343. [isSpeaking()](#isSpeaking())
   344. [setSpeaking(boolean)](#setSpeaking(boolean))
   345. [getSpeakTime()](#getSpeakTime())
   346. [setSpeakTime(int)](#setSpeakTime(int))
   347. [getSpeedMod()](#getSpeedMod())
   348. [setSpeedMod(float)](#setSpeedMod(float))
   349. [getStaggerTimeMod()](#getStaggerTimeMod())
   350. [setStaggerTimeMod(float)](#setStaggerTimeMod(float))
   351. [getStateMachine()](#getStateMachine())
   352. [getMoodles()](#getMoodles())
   353. [getStats()](#getStats())
   354. [getUsedItemsOn()](#getUsedItemsOn())
   355. [getUseHandWeapon()](#getUseHandWeapon())
   356. [setUseHandWeapon(HandWeapon)](#setUseHandWeapon(zombie.inventory.types.HandWeapon))
   357. [getLegsSprite()](#getLegsSprite())
   358. [setLegsSprite(IsoSprite)](#setLegsSprite(zombie.iso.sprite.IsoSprite))
   359. [getAttackTargetSquare()](#getAttackTargetSquare())
   360. [setAttackTargetSquare(IsoGridSquare)](#setAttackTargetSquare(zombie.iso.IsoGridSquare))
   361. [getBloodImpactX()](#getBloodImpactX())
   362. [setBloodImpactX(float)](#setBloodImpactX(float))
   363. [getBloodImpactY()](#getBloodImpactY())
   364. [setBloodImpactY(float)](#setBloodImpactY(float))
   365. [getBloodImpactZ()](#getBloodImpactZ())
   366. [setBloodImpactZ(float)](#setBloodImpactZ(float))
   367. [getBloodSplat()](#getBloodSplat())
   368. [setBloodSplat(IsoSprite)](#setBloodSplat(zombie.iso.sprite.IsoSprite))
   369. [isbOnBed()](#isbOnBed())
   370. [setbOnBed(boolean)](#setbOnBed(boolean))
   371. [isOnBed()](#isOnBed())
   372. [setOnBed(boolean)](#setOnBed(boolean))
   373. [getMoveForwardVec()](#getMoveForwardVec())
   374. [setMoveForwardVec(Vector2)](#setMoveForwardVec(zombie.iso.Vector2))
   375. [isPathing()](#isPathing())
   376. [setPathing(boolean)](#setPathing(boolean))
   377. [getLocalEnemyList()](#getLocalEnemyList())
   378. [getEnemyList()](#getEnemyList())
   379. [getCharacterTraits()](#getCharacterTraits())
   380. [getMaxWeight()](#getMaxWeight())
   381. [setMaxWeight(int)](#setMaxWeight(int))
   382. [getMaxWeightBase()](#getMaxWeightBase())
   383. [setMaxWeightBase(int)](#setMaxWeightBase(int))
   384. [getSleepingTabletDelta()](#getSleepingTabletDelta())
   385. [setSleepingTabletDelta(float)](#setSleepingTabletDelta(float))
   386. [getBetaEffect()](#getBetaEffect())
   387. [setBetaEffect(float)](#setBetaEffect(float))
   388. [getDepressEffect()](#getDepressEffect())
   389. [setDepressEffect(float)](#setDepressEffect(float))
   390. [getSleepingTabletEffect()](#getSleepingTabletEffect())
   391. [setSleepingTabletEffect(float)](#setSleepingTabletEffect(float))
   392. [getBetaDelta()](#getBetaDelta())
   393. [setBetaDelta(float)](#setBetaDelta(float))
   394. [getDepressDelta()](#getDepressDelta())
   395. [setDepressDelta(float)](#setDepressDelta(float))
   396. [getPainEffect()](#getPainEffect())
   397. [setPainEffect(float)](#setPainEffect(float))
   398. [getPainDelta()](#getPainDelta())
   399. [setPainDelta(float)](#setPainDelta(float))
   400. [isbDoDefer()](#isbDoDefer())
   401. [setbDoDefer(boolean)](#setbDoDefer(boolean))
   402. [getLastHeardSound()](#getLastHeardSound())
   403. [setLastHeardSound(int, int, int)](#setLastHeardSound(int,int,int))
   404. [isClimbing()](#isClimbing())
   405. [setbClimbing(boolean)](#setbClimbing(boolean))
   406. [isLastCollidedW()](#isLastCollidedW())
   407. [setLastCollidedW(boolean)](#setLastCollidedW(boolean))
   408. [isLastCollidedN()](#isLastCollidedN())
   409. [setLastCollidedN(boolean)](#setLastCollidedN(boolean))
   410. [getFallTime()](#getFallTime())
   411. [getFallSpeedSeverity()](#getFallSpeedSeverity())
   412. [setFallTime(float)](#setFallTime(float))
   413. [getLastFallSpeed()](#getLastFallSpeed())
   414. [setLastFallSpeed(float)](#setLastFallSpeed(float))
   415. [isbFalling()](#isbFalling())
   416. [setbFalling(boolean)](#setbFalling(boolean))
   417. [getCurrentBuildingDef()](#getCurrentBuildingDef())
   418. [getCurrentRoomDef()](#getCurrentRoomDef())
   419. [getTorchStrength()](#getTorchStrength())
   420. [getAnimEventBroadcaster()](#getAnimEventBroadcaster())
   421. [OnAnimEvent(AnimLayer, AnimationTrack, AnimEvent)](#OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   422. [dbgOnGlobalAnimEvent(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#dbgOnGlobalAnimEvent(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   423. [OnAnimEvent\_SetVariable(IsoGameCharacter, AnimationVariableReference, String)](#OnAnimEvent_SetVariable(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference,java.lang.String))
   424. [OnAnimEvent\_ClearVariable(IsoGameCharacter, String)](#OnAnimEvent_ClearVariable(zombie.characters.IsoGameCharacter,java.lang.String))
   425. [OnAnimEvent\_PlaySound(IsoGameCharacter, String)](#OnAnimEvent_PlaySound(zombie.characters.IsoGameCharacter,java.lang.String))
   426. [OnAnimEvent\_PlaySoundNoBlend(IsoGameCharacter, AnimLayer, AnimationTrack, AnimEvent)](#OnAnimEvent_PlaySoundNoBlend(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   427. [OnAnimEvent\_Footstep(IsoGameCharacter, String)](#OnAnimEvent_Footstep(zombie.characters.IsoGameCharacter,java.lang.String))
   428. [OnAnimEvent\_DamageWhileInTrees(IsoGameCharacter)](#OnAnimEvent_DamageWhileInTrees(zombie.characters.IsoGameCharacter))
   429. [OnAnimEvent\_TurnAround(IsoGameCharacter, boolean)](#OnAnimEvent_TurnAround(zombie.characters.IsoGameCharacter,boolean))
   430. [OnAnimEvent\_TurnAroundFlipSkeleton(IsoGameCharacter, AnimLayer, AnimationTrack, String)](#OnAnimEvent_TurnAroundFlipSkeleton(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,java.lang.String))
   431. [OnAnimEvent\_SetSharedGrappleType(IsoGameCharacter, String)](#OnAnimEvent_SetSharedGrappleType(zombie.characters.IsoGameCharacter,java.lang.String))
   432. [onRagdollSimulationStarted()](#onRagdollSimulationStarted())
   433. [damageWhileInTrees()](#damageWhileInTrees())
   434. [getHammerSoundMod()](#getHammerSoundMod())
   435. [getWeldingSoundMod()](#getWeldingSoundMod())
   436. [getBarricadeTimeMod()](#getBarricadeTimeMod())
   437. [getMetalBarricadeStrengthMod()](#getMetalBarricadeStrengthMod())
   438. [getBarricadeStrengthMod()](#getBarricadeStrengthMod())
   439. [getSneakSpotMod()](#getSneakSpotMod())
   440. [getNimbleMod()](#getNimbleMod())
   441. [getFatigueMod()](#getFatigueMod())
   442. [getLightfootMod()](#getLightfootMod())
   443. [getPacingMod()](#getPacingMod())
   444. [getHyperthermiaMod()](#getHyperthermiaMod())
   445. [getHittingMod()](#getHittingMod())
   446. [getShovingMod()](#getShovingMod())
   447. [getRecoveryMod()](#getRecoveryMod())
   448. [getWeightMod()](#getWeightMod())
   449. [getHitChancesMod()](#getHitChancesMod())
   450. [getSprintMod()](#getSprintMod())
   451. [getPerkLevel(PerkFactory.Perk)](#getPerkLevel(zombie.characters.skills.PerkFactory.Perk))
   452. [setPerkLevelDebug(PerkFactory.Perk, int)](#setPerkLevelDebug(zombie.characters.skills.PerkFactory.Perk,int))
   453. [LoseLevel(PerkFactory.Perk)](#LoseLevel(zombie.characters.skills.PerkFactory.Perk))
   454. [LevelPerk(PerkFactory.Perk, boolean)](#LevelPerk(zombie.characters.skills.PerkFactory.Perk,boolean))
   455. [LevelPerk(PerkFactory.Perk)](#LevelPerk(zombie.characters.skills.PerkFactory.Perk))
   456. [level0(PerkFactory.Perk)](#level0(zombie.characters.skills.PerkFactory.Perk))
   457. [getLastKnownLocationOf(String)](#getLastKnownLocationOf(java.lang.String))
   458. [ReadLiterature(Literature)](#ReadLiterature(zombie.inventory.types.Literature))
   459. [OnDeath()](#OnDeath())
   460. [splatBloodFloorBig()](#splatBloodFloorBig())
   461. [splatBloodFloor()](#splatBloodFloor())
   462. [getThreatLevel()](#getThreatLevel())
   463. [isDead()](#isDead())
   464. [isAlive()](#isAlive())
   465. [isEditingRagdoll()](#isEditingRagdoll())
   466. [setEditingRagdoll(boolean)](#setEditingRagdoll(boolean))
   467. [isRagdoll()](#isRagdoll())
   468. [isFullyRagdolling()](#isFullyRagdolling())
   469. [setRagdollFall(boolean)](#setRagdollFall(boolean))
   470. [isRagdollFall()](#isRagdollFall())
   471. [isVehicleCollision()](#isVehicleCollision())
   472. [setVehicleCollision(boolean)](#setVehicleCollision(boolean))
   473. [useRagdollVehicleCollision()](#useRagdollVehicleCollision())
   474. [isUpright()](#isUpright())
   475. [isOnBack()](#isOnBack())
   476. [usePhysicHitReaction()](#usePhysicHitReaction())
   477. [setUsePhysicHitReaction(boolean)](#setUsePhysicHitReaction(boolean))
   478. [isRagdollSimulationActive()](#isRagdollSimulationActive())
   479. [Seen(Stack)](#Seen(java.util.Stack))
   480. [CanSee(IsoMovingObject)](#CanSee(zombie.iso.IsoMovingObject))
   481. [CanSee(IsoObject)](#CanSee(zombie.iso.IsoObject))
   482. [getLowDangerInVicinity(int, int)](#getLowDangerInVicinity(int,int))
   483. [hasEquipped(String)](#hasEquipped(java.lang.String))
   484. [hasEquippedTag(ItemTag)](#hasEquippedTag(zombie.scripting.objects.ItemTag))
   485. [hasWornTag(ItemTag)](#hasWornTag(zombie.scripting.objects.ItemTag))
   486. [setForwardIsoDirection(IsoDirections)](#setForwardIsoDirection(zombie.iso.IsoDirections))
   487. [setForwardDirectionFromIsoDirection()](#setForwardDirectionFromIsoDirection())
   488. [setForwardDirectionFromAnimAngle()](#setForwardDirectionFromAnimAngle())
   489. [Callout(boolean)](#Callout(boolean))
   490. [Callout()](#Callout())
   491. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   492. [getDescription(String)](#getDescription(java.lang.String))
   493. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   494. [getChatElement()](#getChatElement())
   495. [StartAction(BaseAction)](#StartAction(zombie.characters.CharacterTimedActions.BaseAction))
   496. [QueueAction(BaseAction)](#QueueAction(zombie.characters.CharacterTimedActions.BaseAction))
   497. [StopAllActionQueue()](#StopAllActionQueue())
   498. [StopAllActionQueueRunning()](#StopAllActionQueueRunning())
   499. [StopAllActionQueueAiming()](#StopAllActionQueueAiming())
   500. [StopAllActionQueueWalking()](#StopAllActionQueueWalking())
   501. [GetAnimSetName()](#GetAnimSetName())
   502. [SleepingTablet(float)](#SleepingTablet(float))
   503. [BetaBlockers(float)](#BetaBlockers(float))
   504. [BetaAntiDepress(float)](#BetaAntiDepress(float))
   505. [PainMeds(float)](#PainMeds(float))
   506. [initSpritePartsEmpty()](#initSpritePartsEmpty())
   507. [InitSpriteParts(SurvivorDesc)](#InitSpriteParts(zombie.characters.SurvivorDesc))
   508. [hasTrait(CharacterTrait)](#hasTrait(zombie.scripting.objects.CharacterTrait))
   509. [hasTrait(CharacterTrait...)](#hasTrait(zombie.scripting.objects.CharacterTrait...))
   510. [ApplyInBedOffset(boolean)](#ApplyInBedOffset(boolean))
   511. [Dressup(SurvivorDesc)](#Dressup(zombie.characters.SurvivorDesc))
   512. [setPathSpeed(float)](#setPathSpeed(float))
   513. [PlayAnim(String)](#PlayAnim(java.lang.String))
   514. [PlayAnimWithSpeed(String, float)](#PlayAnimWithSpeed(java.lang.String,float))
   515. [PlayAnimUnlooped(String)](#PlayAnimUnlooped(java.lang.String))
   516. [DirectionFromVector(Vector2)](#DirectionFromVector(zombie.iso.Vector2))
   517. [DoFootstepSound(String)](#DoFootstepSound(java.lang.String))
   518. [DoFootstepSound(float)](#DoFootstepSound(float))
   519. [Eat(InventoryItem, float)](#Eat(zombie.inventory.InventoryItem,float))
   520. [EatOnClient(InventoryItem, float)](#EatOnClient(zombie.inventory.InventoryItem,float))
   521. [Eat(InventoryItem, float, boolean)](#Eat(zombie.inventory.InventoryItem,float,boolean))
   522. [Eat(InventoryItem)](#Eat(zombie.inventory.InventoryItem))
   523. [DrinkFluid(InventoryItem, float)](#DrinkFluid(zombie.inventory.InventoryItem,float))
   524. [DrinkFluid(InventoryItem, float, boolean)](#DrinkFluid(zombie.inventory.InventoryItem,float,boolean))
   525. [DrinkFluid(FluidContainer, float)](#DrinkFluid(zombie.entity.components.fluids.FluidContainer,float))
   526. [DrinkFluid(FluidContainer, float, boolean)](#DrinkFluid(zombie.entity.components.fluids.FluidContainer,float,boolean))
   527. [DrinkFluid(InventoryItem)](#DrinkFluid(zombie.inventory.InventoryItem))
   528. [FireCheck()](#FireCheck())
   529. [getPrimaryHandType()](#getPrimaryHandType())
   530. [getChestHeight()](#getChestHeight())
   531. [getAimOriginPosX()](#getAimOriginPosX())
   532. [getAimOriginPosY()](#getAimOriginPosY())
   533. [getAimOriginPosZ()](#getAimOriginPosZ())
   534. [getGlobalMovementMod(boolean)](#getGlobalMovementMod(boolean))
   535. [getMovementSpeed()](#getMovementSpeed())
   536. [getSecondaryHandType()](#getSecondaryHandType())
   537. [HasItem(String)](#HasItem(java.lang.String))
   538. [changeState(State)](#changeState(zombie.ai.State))
   539. [getCurrentState()](#getCurrentState())
   540. [isCurrentState(State)](#isCurrentState(zombie.ai.State))
   541. [isCurrentGameClientState(State)](#isCurrentGameClientState(zombie.ai.State))
   542. [set(State.Param, T)](#set(zombie.ai.State.Param,T))
   543. [get(State.Param)](#get(zombie.ai.State.Param))
   544. [get(State.Param, T)](#get(zombie.ai.State.Param,T))
   545. [remove(State.Param)](#remove(zombie.ai.State.Param))
   546. [clear(State)](#clear(zombie.ai.State))
   547. [clear(Class)](#clear(java.lang.Class))
   548. [getStateMachineParams(Class)](#getStateMachineParams(java.lang.Class))
   549. [setStateMachineLocked(boolean)](#setStateMachineLocked(boolean))
   550. [Hit(HandWeapon, IsoGameCharacter, float, boolean, float)](#Hit(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float))
   551. [Hit(HandWeapon, IsoGameCharacter, float, boolean, float, boolean)](#Hit(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float,boolean))
   552. [calculateHitDirection(HandWeapon, IsoGameCharacter)](#calculateHitDirection(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter))
   553. [processInstantExplosionHitDamage(HandWeapon, IsoGameCharacter, float, boolean, float)](#processInstantExplosionHitDamage(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float))
   554. [processHitDamage(HandWeapon, IsoGameCharacter, float, boolean, float)](#processHitDamage(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float))
   555. [hitConsequences(HandWeapon, IsoGameCharacter, boolean, float, boolean)](#hitConsequences(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean,float,boolean))
   556. [IsAttackRange(float, float, float)](#IsAttackRange(float,float,float))
   557. [isMeleeAttackRange(HandWeapon, IsoMovingObject, Vector3)](#isMeleeAttackRange(zombie.inventory.types.HandWeapon,zombie.iso.IsoMovingObject,zombie.iso.Vector3))
   558. [IsSpeaking()](#IsSpeaking())
   559. [IsSpeakingNPC()](#IsSpeakingNPC())
   560. [MoveForward(float, float, float, float)](#MoveForward(float,float,float,float))
   561. [CanUsePathfindState()](#CanUsePathfindState())
   562. [pathToAux(float, float, float)](#pathToAux(float,float,float))
   563. [pathToCharacter(IsoGameCharacter)](#pathToCharacter(zombie.characters.IsoGameCharacter))
   564. [pathToLocation(int, int, int)](#pathToLocation(int,int,int))
   565. [pathToLocationF(float, float, float)](#pathToLocationF(float,float,float))
   566. [pathToSound(int, int, int)](#pathToSound(int,int,int))
   567. [CanAttack()](#CanAttack())
   568. [isEnduranceSufficientForAction()](#isEnduranceSufficientForAction())
   569. [ReduceHealthWhenBurning()](#ReduceHealthWhenBurning())
   570. [DrawSneezeText()](#DrawSneezeText())
   571. [getSpriteDef()](#getSpriteDef())
   572. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   573. [renderServerGUI()](#renderServerGUI())
   574. [getAlphaUpdateRateMul()](#getAlphaUpdateRateMul())
   575. [isUpdateAlphaDuringRender()](#isUpdateAlphaDuringRender())
   576. [isSeatedInVehicle()](#isSeatedInVehicle())
   577. [renderObjectPicker(float, float, float, ColorInfo)](#renderObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   578. [closestpointonline(double, double, double, double, double, double, Vector2)](#closestpointonline(double,double,double,double,double,double,zombie.iso.Vector2))
   579. [calculateShadowParams(ShadowParams)](#calculateShadowParams(zombie.iso.objects.ShadowParams))
   580. [calculateShadowParams(AnimationPlayer, float, boolean, ShadowParams)](#calculateShadowParams(zombie.core.skinnedmodel.animation.AnimationPlayer,float,boolean,zombie.iso.objects.ShadowParams))
   581. [renderShadow(float, float, float)](#renderShadow(float,float,float))
   582. [checkUpdateModelTextures()](#checkUpdateModelTextures())
   583. [isMaskClicked(int, int, boolean)](#isMaskClicked(int,int,boolean))
   584. [setHaloNote(String)](#setHaloNote(java.lang.String))
   585. [setHaloNote(String, float)](#setHaloNote(java.lang.String,float))
   586. [setHaloNote(String, int, int, int, float)](#setHaloNote(java.lang.String,int,int,int,float))
   587. [getHaloTimerCount()](#getHaloTimerCount())
   588. [DoSneezeText()](#DoSneezeText())
   589. [getSayLine()](#getSayLine())
   590. [setSayLine(String)](#setSayLine(java.lang.String))
   591. [getLastChatMessage()](#getLastChatMessage())
   592. [setLastChatMessage(ChatMessage)](#setLastChatMessage(zombie.chat.ChatMessage))
   593. [getLastSpokenLine()](#getLastSpokenLine())
   594. [setLastSpokenLine(String)](#setLastSpokenLine(java.lang.String))
   595. [doSleepSpeech()](#doSleepSpeech())
   596. [SayDebug(String)](#SayDebug(java.lang.String))
   597. [SayDebug(int, String)](#SayDebug(int,java.lang.String))
   598. [getMaxChatLines()](#getMaxChatLines())
   599. [Say(String)](#Say(java.lang.String))
   600. [Say(String, float, float, float, UIFont, float, String)](#Say(java.lang.String,float,float,float,zombie.ui.UIFont,float,java.lang.String))
   601. [SayWhisper(String)](#SayWhisper(java.lang.String))
   602. [SayShout(String)](#SayShout(java.lang.String))
   603. [SayRadio(String, float, float, float, UIFont, float, int, String)](#SayRadio(java.lang.String,float,float,float,zombie.ui.UIFont,float,int,java.lang.String))
   604. [ProcessSay(String, float, float, float, float, int, String)](#ProcessSay(java.lang.String,float,float,float,float,int,java.lang.String))
   605. [addLineChatElement(String)](#addLineChatElement(java.lang.String))
   606. [addLineChatElement(String, float, float, float)](#addLineChatElement(java.lang.String,float,float,float))
   607. [addLineChatElement(String, float, float, float, UIFont, float, String)](#addLineChatElement(java.lang.String,float,float,float,zombie.ui.UIFont,float,java.lang.String))
   608. [addLineChatElement(String, float, float, float, UIFont, float, String, boolean, boolean, boolean, boolean, boolean, boolean)](#addLineChatElement(java.lang.String,float,float,float,zombie.ui.UIFont,float,java.lang.String,boolean,boolean,boolean,boolean,boolean,boolean))
   609. [playerIsSelf()](#playerIsSelf())
   610. [getUserNameHeight()](#getUserNameHeight())
   611. [initTextObjects()](#initTextObjects())
   612. [updateUserName()](#updateUserName())
   613. [checkPVP()](#checkPVP())
   614. [updateTextObjects()](#updateTextObjects())
   615. [getNameCoords(float, float, float, float, float, float, Vector2)](#getNameCoords(float,float,float,float,float,float,zombie.iso.Vector2))
   616. [renderlast()](#renderlast())
   617. [debugRenderLast()](#debugRenderLast())
   618. [drawLine(Vector2, Vector2, float, float, float, float)](#drawLine(zombie.iso.Vector2,zombie.iso.Vector2,float,float,float,float))
   619. [calcCarForwardVector()](#calcCarForwardVector())
   620. [carMovingBackward(Vector2)](#carMovingBackward(zombie.iso.Vector2))
   621. [calcCarPositionOffset(boolean)](#calcCarPositionOffset(boolean))
   622. [calcLengthMultiplier(Vector2, boolean)](#calcLengthMultiplier(zombie.iso.Vector2,boolean))
   623. [calcCarSpeedVector(Vector2)](#calcCarSpeedVector(zombie.iso.Vector2))
   624. [calcCarSpeedVector()](#calcCarSpeedVector())
   625. [calcCarToPlayerVector(IsoGameCharacter, Vector2)](#calcCarToPlayerVector(zombie.characters.IsoGameCharacter,zombie.iso.Vector2))
   626. [calcCarToPlayerVector(IsoGameCharacter)](#calcCarToPlayerVector(zombie.characters.IsoGameCharacter))
   627. [calcConeAngleOffset(IsoGameCharacter, boolean)](#calcConeAngleOffset(zombie.characters.IsoGameCharacter,boolean))
   628. [calcConeAngleMultiplier(IsoGameCharacter, boolean)](#calcConeAngleMultiplier(zombie.characters.IsoGameCharacter,boolean))
   629. [renderTextureInsteadOfModel(float, float)](#renderTextureInsteadOfModel(float,float))
   630. [drawDirectionLine(Vector2, float, float, float, float)](#drawDirectionLine(zombie.iso.Vector2,float,float,float,float))
   631. [drawDirectionLine(Vector3, float, float, float, float)](#drawDirectionLine(zombie.iso.Vector3,float,float,float,float))
   632. [drawDebugTextBelow(String)](#drawDebugTextBelow(java.lang.String))
   633. [getEquipedRadio()](#getEquipedRadio())
   634. [radioEquipedCheck()](#radioEquipedCheck())
   635. [debugAim()](#debugAim())
   636. [debugTestDotSide()](#debugTestDotSide())
   637. [debugVision()](#debugVision())
   638. [setDefaultState()](#setDefaultState())
   639. [SetOnFire()](#SetOnFire())
   640. [StopBurning()](#StopBurning())
   641. [SpreadFireMP()](#SpreadFireMP())
   642. [SpreadFire()](#SpreadFire())
   643. [Throw(HandWeapon)](#Throw(zombie.inventory.types.HandWeapon))
   644. [helmetFall(boolean)](#helmetFall(boolean))
   645. [helmetFallFromWornItems(boolean)](#helmetFallFromWornItems(boolean))
   646. [smashCarWindow(VehiclePart)](#smashCarWindow(zombie.vehicles.VehiclePart))
   647. [smashWindow(IsoWindow)](#smashWindow(zombie.iso.objects.IsoWindow))
   648. [openWindow(IsoWindow)](#openWindow(zombie.iso.objects.IsoWindow))
   649. [closeWindow(IsoWindow)](#closeWindow(zombie.iso.objects.IsoWindow))
   650. [climbThroughWindow(IsoWindow)](#climbThroughWindow(zombie.iso.objects.IsoWindow))
   651. [climbThroughWindow(IsoWindow, Integer)](#climbThroughWindow(zombie.iso.objects.IsoWindow,java.lang.Integer))
   652. [isClosingWindow(IsoWindow)](#isClosingWindow(zombie.iso.objects.IsoWindow))
   653. [isClimbingThroughWindow(IsoWindow)](#isClimbingThroughWindow(zombie.iso.objects.IsoWindow))
   654. [climbThroughWindowFrame(IsoWindowFrame)](#climbThroughWindowFrame(zombie.iso.objects.IsoWindowFrame))
   655. [climbSheetRope()](#climbSheetRope())
   656. [climbDownSheetRope()](#climbDownSheetRope())
   657. [canClimbSheetRope(IsoGridSquare)](#canClimbSheetRope(zombie.iso.IsoGridSquare))
   658. [canClimbDownSheetRopeInCurrentSquare()](#canClimbDownSheetRopeInCurrentSquare())
   659. [canClimbDownSheetRope(IsoGridSquare)](#canClimbDownSheetRope(zombie.iso.IsoGridSquare))
   660. [getCardinalDirectionTo(IsoGridSquare, boolean)](#getCardinalDirectionTo(zombie.iso.IsoGridSquare,boolean))
   661. [climbThroughWindow(IsoThumpable)](#climbThroughWindow(zombie.iso.objects.IsoThumpable))
   662. [climbThroughWindow(IsoThumpable, Integer)](#climbThroughWindow(zombie.iso.objects.IsoThumpable,java.lang.Integer))
   663. [climbOverFence(IsoDirections)](#climbOverFence(zombie.iso.IsoDirections))
   664. [isAboveTopOfStairs()](#isAboveTopOfStairs())
   665. [throwGrappledTargetOutWindow(IsoObject)](#throwGrappledTargetOutWindow(zombie.iso.IsoObject))
   666. [throwGrappledOverFence(IsoObject, IsoDirections)](#throwGrappledOverFence(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   667. [throwGrappledIntoInventory(ItemContainer)](#throwGrappledIntoInventory(zombie.inventory.ItemContainer))
   668. [pickUpCorpseItem(InventoryItem)](#pickUpCorpseItem(zombie.inventory.InventoryItem))
   669. [pickUpCorpse(IsoDeadBody, String)](#pickUpCorpse(zombie.iso.objects.IsoDeadBody,java.lang.String))
   670. [calculateGrappleEffectivenessFromTraits()](#calculateGrappleEffectivenessFromTraits())
   671. [preupdate()](#preupdate())
   672. [updateAnimationTimeDelta()](#updateAnimationTimeDelta())
   673. [allowsInvisibleAnimationSkips()](#allowsInvisibleAnimationSkips())
   674. [updateHandEquips()](#updateHandEquips())
   675. [update()](#update())
   676. [isPushedByForSeparate(IsoMovingObject)](#isPushedByForSeparate(zombie.iso.IsoMovingObject))
   677. [slideAwayFromWalls(float, boolean, boolean)](#slideAwayFromWalls(float,boolean,boolean))
   678. [resolveCollisionWithNeighboringSquares(float, Vector2f)](#resolveCollisionWithNeighboringSquares(float,org.joml.Vector2f))
   679. [setHitDir(Vector2)](#setHitDir(zombie.iso.Vector2))
   680. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())
   681. [setHitDirEnum(String)](#setHitDirEnum(java.lang.String))
   682. [getHitDirEnum()](#getHitDirEnum())
   683. [determineHitDirEnum(Vector2)](#determineHitDirEnum(zombie.iso.Vector2))
   684. [updateInternal()](#updateInternal())
   685. [isInGrapplerState()](#isInGrapplerState())
   686. [updateSeenVisibility()](#updateSeenVisibility())
   687. [updateSeenVisibility(int)](#updateSeenVisibility(int))
   688. [recursiveItemUpdater(ItemContainer)](#recursiveItemUpdater(zombie.inventory.ItemContainer))
   689. [recursiveItemUpdater(InventoryContainer)](#recursiveItemUpdater(zombie.inventory.types.InventoryContainer))
   690. [updateDirt()](#updateDirt())
   691. [updateMovementMomentum()](#updateMovementMomentum())
   692. [getHoursSurvived()](#getHoursSurvived())
   693. [updateBeardAndHair()](#updateBeardAndHair())
   694. [updateFalling()](#updateFalling())
   695. [shouldSnapZToCurrentSquare()](#shouldSnapZToCurrentSquare())
   696. [shouldBeFalling()](#shouldBeFalling())
   697. [getHeightAboveFloor()](#getHeightAboveFloor())
   698. [updateMovementRates()](#updateMovementRates())
   699. [calculateIdleSpeed()](#calculateIdleSpeed())
   700. [calculateBaseSpeed()](#calculateBaseSpeed())
   701. [calcRunSpeedModByClothing()](#calcRunSpeedModByClothing())
   702. [calcRunSpeedModByBag(InventoryContainer)](#calcRunSpeedModByBag(zombie.inventory.types.InventoryContainer))
   703. [calculateCombatSpeed()](#calculateCombatSpeed())
   704. [getArmsInjurySpeedModifier()](#getArmsInjurySpeedModifier())
   705. [getFootInjurySpeedModifier()](#getFootInjurySpeedModifier())
   706. [calculateInjurySpeed(BodyPart, boolean)](#calculateInjurySpeed(zombie.characters.BodyDamage.BodyPart,boolean))
   707. [calcFractureInjurySpeed(BodyPart)](#calcFractureInjurySpeed(zombie.characters.BodyDamage.BodyPart))
   708. [calculateSneakLimpSpeedScale()](#calculateSneakLimpSpeedScale())
   709. [calculateWalkSpeed()](#calculateWalkSpeed())
   710. [updateSpeedModifiers()](#updateSpeedModifiers())
   711. [updateDiscomfortModifiers()](#updateDiscomfortModifiers())
   712. [DoFloorSplat(IsoGridSquare, String, boolean, float, float)](#DoFloorSplat(zombie.iso.IsoGridSquare,java.lang.String,boolean,float,float))
   713. [DoSplat(IsoGridSquare, String, boolean, IsoFlagType, float, float, float)](#DoSplat(zombie.iso.IsoGridSquare,java.lang.String,boolean,zombie.iso.SpriteDetails.IsoFlagType,float,float,float))
   714. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   715. [calculateStats()](#calculateStats())
   716. [updateStats\_WakeState()](#updateStats_WakeState())
   717. [updateStats\_Sleeping()](#updateStats_Sleeping())
   718. [updateStats\_Awake()](#updateStats_Awake())
   719. [updateMorale()](#updateMorale())
   720. [updateFitness()](#updateFitness())
   721. [updateTripping()](#updateTripping())
   722. [getAppetiteMultiplier()](#getAppetiteMultiplier())
   723. [updateStress()](#updateStress())
   724. [updateEndurance()](#updateEndurance())
   725. [updateThirst()](#updateThirst())
   726. [getRunningThirstReduction()](#getRunningThirstReduction())
   727. [faceDirection(IsoDirections)](#faceDirection(zombie.iso.IsoDirections))
   728. [faceLocation(float, float)](#faceLocation(float,float))
   729. [faceLocationF(float, float)](#faceLocationF(float,float))
   730. [isFacingLocation(float, float, float)](#isFacingLocation(float,float,float))
   731. [isFacingObject(IsoObject, float)](#isFacingObject(zombie.iso.IsoObject,float))
   732. [splatBlood(int, float)](#splatBlood(int,float))
   733. [isOutside()](#isOutside())
   734. [isFemale()](#isFemale())
   735. [setFemale(boolean)](#setFemale(boolean))
   736. [setCharacterGender(CharacterGender)](#setCharacterGender(zombie.characters.CharacterGender))
   737. [getCharacterGender()](#getCharacterGender())
   738. [isZombie()](#isZombie())
   739. [getLastHitCount()](#getLastHitCount())
   740. [setLastHitCount(int)](#setLastHitCount(int))
   741. [getSurvivorKills()](#getSurvivorKills())
   742. [setSurvivorKills(int)](#setSurvivorKills(int))
   743. [getAge()](#getAge())
   744. [setAge(int)](#setAge(int))
   745. [exert(float)](#exert(float))
   746. [getPerkInfo(PerkFactory.Perk)](#getPerkInfo(zombie.characters.skills.PerkFactory.Perk))
   747. [isEquipped(InventoryItem)](#isEquipped(zombie.inventory.InventoryItem))
   748. [isEquippedClothing(InventoryItem)](#isEquippedClothing(zombie.inventory.InventoryItem))
   749. [isAttachedItem(InventoryItem)](#isAttachedItem(zombie.inventory.InventoryItem))
   750. [faceThisObject(IsoObject)](#faceThisObject(zombie.iso.IsoObject))
   751. [facePosition(int, int)](#facePosition(int,int))
   752. [faceThisObjectAlt(IsoObject)](#faceThisObjectAlt(zombie.iso.IsoObject))
   753. [setAnimated(boolean)](#setAnimated(boolean))
   754. [playHurtSound()](#playHurtSound())
   755. [playDeadSound()](#playDeadSound())
   756. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   757. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   758. [getAlreadyReadPages(String)](#getAlreadyReadPages(java.lang.String))
   759. [setAlreadyReadPages(String, int)](#setAlreadyReadPages(java.lang.String,int))
   760. [updateLightInfo()](#updateLightInfo())
   761. [initLightInfo2()](#initLightInfo2())
   762. [getLightInfo2()](#getLightInfo2())
   763. [postupdate()](#postupdate())
   764. [getAnimationTimeDelta()](#getAnimationTimeDelta())
   765. [updateForServerGui()](#updateForServerGui())
   766. [postUpdateInternal()](#postUpdateInternal())
   767. [postUpdateAnimating()](#postUpdateAnimating())
   768. [isAnimationUpdatingThisFrame()](#isAnimationUpdatingThisFrame())
   769. [clearHitInfo()](#clearHitInfo())
   770. [clearAttackVars()](#clearAttackVars())
   771. [updateAnimPlayer(AnimationPlayer)](#updateAnimPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer))
   772. [updateModelSlot()](#updateModelSlot())
   773. [applyDeltas(AnimationPlayer)](#applyDeltas(zombie.core.skinnedmodel.animation.AnimationPlayer))
   774. [getCurrentTimedActionDeltaModifiers(MoveDeltaModifiers)](#getCurrentTimedActionDeltaModifiers(zombie.characters.MoveDeltaModifiers))
   775. [shouldBeTurning()](#shouldBeTurning())
   776. [shouldBeTurning90()](#shouldBeTurning90())
   777. [shouldBeTurningAround()](#shouldBeTurningAround())
   778. [isTurning()](#isTurning())
   779. [setTurning(boolean)](#setTurning(boolean))
   780. [isTurningAround()](#isTurningAround())
   781. [setTurningAround(boolean)](#setTurningAround(boolean))
   782. [invokeGlobalAnimEvent(GlobalAnimEvent)](#invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent))
   783. [isTurning90()](#isTurning90())
   784. [setTurning90(boolean)](#setTurning90(boolean))
   785. [hasPath()](#hasPath())
   786. [getMeleeDelay()](#getMeleeDelay())
   787. [setMeleeDelay(float)](#setMeleeDelay(float))
   788. [getRecoilDelay()](#getRecoilDelay())
   789. [setRecoilDelay(float)](#setRecoilDelay(float))
   790. [getAimingDelay()](#getAimingDelay())
   791. [setAimingDelay(float)](#setAimingDelay(float))
   792. [resetAimingDelay()](#resetAimingDelay())
   793. [updateAimingDelay()](#updateAimingDelay())
   794. [getBeenMovingFor()](#getBeenMovingFor())
   795. [setBeenMovingFor(float)](#setBeenMovingFor(float))
   796. [getClickSound()](#getClickSound())
   797. [setClickSound(String)](#setClickSound(java.lang.String))
   798. [getMeleeCombatMod()](#getMeleeCombatMod())
   799. [getWeaponLevel()](#getWeaponLevel())
   800. [getWeaponLevel(HandWeapon)](#getWeaponLevel(zombie.inventory.types.HandWeapon))
   801. [getMaintenanceMod()](#getMaintenanceMod())
   802. [getVehicle()](#getVehicle())
   803. [setVehicle(BaseVehicle)](#setVehicle(zombie.vehicles.BaseVehicle))
   804. [isUnderVehicle()](#isUnderVehicle())
   805. [isUnderVehicleRadius(float)](#isUnderVehicleRadius(float))
   806. [isBeingSteppedOn()](#isBeingSteppedOn())
   807. [getReduceInfectionPower()](#getReduceInfectionPower())
   808. [setReduceInfectionPower(float)](#setReduceInfectionPower(float))
   809. [getInventoryWeight()](#getInventoryWeight())
   810. [dropHandItems()](#dropHandItems())
   811. [dropHeldItems(int, int, int, boolean, boolean)](#dropHeldItems(int,int,int,boolean,boolean))
   812. [shouldBecomeZombieAfterDeath()](#shouldBecomeZombieAfterDeath())
   813. [modifyTraitXPBoost(CharacterTrait, boolean)](#modifyTraitXPBoost(zombie.scripting.objects.CharacterTrait,boolean))
   814. [modifyTraitXPBoost(CharacterTraitDefinition, boolean)](#modifyTraitXPBoost(zombie.characters.traits.CharacterTraitDefinition,boolean))
   815. [applyTraits(List)](#applyTraits(java.util.List))
   816. [applyProfessionRecipes()](#applyProfessionRecipes())
   817. [applyCharacterTraitsRecipes()](#applyCharacterTraitsRecipes())
   818. [createKeyRing()](#createKeyRing())
   819. [createKeyRing(ItemKey)](#createKeyRing(zombie.scripting.objects.ItemKey))
   820. [autoDrink()](#autoDrink())
   821. [getWaterSource(ArrayList)](#getWaterSource(java.util.ArrayList))
   822. [getKnownRecipes()](#getKnownRecipes())
   823. [isRecipeKnown(Recipe)](#isRecipeKnown(zombie.scripting.objects.Recipe))
   824. [isRecipeKnown(CraftRecipe)](#isRecipeKnown(zombie.scripting.entity.components.crafting.CraftRecipe))
   825. [isRecipeKnown(CraftRecipe, boolean)](#isRecipeKnown(zombie.scripting.entity.components.crafting.CraftRecipe,boolean))
   826. [isRecipeKnown(String)](#isRecipeKnown(java.lang.String))
   827. [isRecipeKnown(String, boolean)](#isRecipeKnown(java.lang.String,boolean))
   828. [isRecipeActuallyKnown(CraftRecipe)](#isRecipeActuallyKnown(zombie.scripting.entity.components.crafting.CraftRecipe))
   829. [isRecipeActuallyKnown(String)](#isRecipeActuallyKnown(java.lang.String))
   830. [learnRecipe(String)](#learnRecipe(java.lang.String))
   831. [learnRecipe(String, boolean)](#learnRecipe(java.lang.String,boolean))
   832. [addKnownMediaLine(String)](#addKnownMediaLine(java.lang.String))
   833. [removeKnownMediaLine(String)](#removeKnownMediaLine(java.lang.String))
   834. [clearKnownMediaLines()](#clearKnownMediaLines())
   835. [isKnownMediaLine(String)](#isKnownMediaLine(java.lang.String))
   836. [saveKnownMediaLines(ByteBuffer)](#saveKnownMediaLines(java.nio.ByteBuffer))
   837. [loadKnownMediaLines(ByteBuffer, int)](#loadKnownMediaLines(java.nio.ByteBuffer,int))
   838. [isMoving()](#isMoving())
   839. [isBehaviourMoving()](#isBehaviourMoving())
   840. [isPlayerMoving()](#isPlayerMoving())
   841. [setMoving(boolean)](#setMoving(boolean))
   842. [isFacingNorthWesterly()](#isFacingNorthWesterly())
   843. [isAttacking()](#isAttacking())
   844. [isZombieAttacking()](#isZombieAttacking())
   845. [isZombieAttacking(IsoMovingObject)](#isZombieAttacking(zombie.iso.IsoMovingObject))
   846. [isZombieThumping()](#isZombieThumping())
   847. [compareMovePriority(IsoGameCharacter)](#compareMovePriority(zombie.characters.IsoGameCharacter))
   848. [playSound(String)](#playSound(java.lang.String))
   849. [playSoundLocal(String)](#playSoundLocal(java.lang.String))
   850. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   851. [playDropItemSound(InventoryItem)](#playDropItemSound(zombie.inventory.InventoryItem))
   852. [playWeaponHitArmourSound(int, boolean)](#playWeaponHitArmourSound(int,boolean))
   853. [addWorldSoundUnlessInvisible(int, int, boolean)](#addWorldSoundUnlessInvisible(int,int,boolean))
   854. [isKnownPoison(InventoryItem)](#isKnownPoison(zombie.inventory.InventoryItem))
   855. [isKnownPoison(Item)](#isKnownPoison(zombie.scripting.objects.Item))
   856. [getLastHourSleeped()](#getLastHourSleeped())
   857. [setLastHourSleeped(int)](#setLastHourSleeped(int))
   858. [setTimeOfSleep(float)](#setTimeOfSleep(float))
   859. [setDelayToSleep(float)](#setDelayToSleep(float))
   860. [getBedType()](#getBedType())
   861. [setBedType(String)](#setBedType(java.lang.String))
   862. [enterVehicle(BaseVehicle, int, Vector3f)](#enterVehicle(zombie.vehicles.BaseVehicle,int,org.joml.Vector3f))
   863. [Hit(BaseVehicle, float, boolean, float, float, boolean, float, float)](#Hit(zombie.vehicles.BaseVehicle,float,boolean,float,float,boolean,float,float))
   864. [getPath2()](#getPath2())
   865. [setPath2(Path)](#setPath2(zombie.pathfind.Path))
   866. [getPathFindBehavior2()](#getPathFindBehavior2())
   867. [getMapKnowledge()](#getMapKnowledge())
   868. [getBed()](#getBed())
   869. [setBed(IsoObject)](#setBed(zombie.iso.IsoObject))
   870. [avoidDamage()](#avoidDamage())
   871. [setAvoidDamage(boolean)](#setAvoidDamage(boolean))
   872. [isReading()](#isReading())
   873. [setReading(boolean)](#setReading(boolean))
   874. [getTimeSinceLastSmoke()](#getTimeSinceLastSmoke())
   875. [setTimeSinceLastSmoke(float)](#setTimeSinceLastSmoke(float))
   876. [isInvisible()](#isInvisible())
   877. [setInvisible(boolean)](#setInvisible(boolean))
   878. [setInvisible(boolean, boolean)](#setInvisible(boolean,boolean))
   879. [isCanUseBrushTool()](#isCanUseBrushTool())
   880. [setCanUseBrushTool(boolean)](#setCanUseBrushTool(boolean))
   881. [canUseLootZed()](#canUseLootZed())
   882. [setCanUseLootZed(boolean)](#setCanUseLootZed(boolean))
   883. [canUseLootLog()](#canUseLootLog())
   884. [setCanUseLootLog(boolean)](#setCanUseLootLog(boolean))
   885. [canUseDebugContextMenu()](#canUseDebugContextMenu())
   886. [setCanUseDebugContextMenu(boolean)](#setCanUseDebugContextMenu(boolean))
   887. [isDriving()](#isDriving())
   888. [isInARoom()](#isInARoom())
   889. [isGodMod()](#isGodMod())
   890. [isInvulnerable()](#isInvulnerable())
   891. [setInvulnerable(boolean)](#setInvulnerable(boolean))
   892. [setGodModCheat(boolean)](#setGodModCheat(boolean))
   893. [setZombiesDontAttack(boolean)](#setZombiesDontAttack(boolean))
   894. [isZombiesDontAttack()](#isZombiesDontAttack())
   895. [setGodMod(boolean, boolean)](#setGodMod(boolean,boolean))
   896. [setGodMod(boolean)](#setGodMod(boolean))
   897. [isUnlimitedCarry()](#isUnlimitedCarry())
   898. [setUnlimitedCarry(boolean)](#setUnlimitedCarry(boolean))
   899. [isBuildCheat()](#isBuildCheat())
   900. [setBuildCheat(boolean)](#setBuildCheat(boolean))
   901. [isFarmingCheat()](#isFarmingCheat())
   902. [setFarmingCheat(boolean)](#setFarmingCheat(boolean))
   903. [isFishingCheat()](#isFishingCheat())
   904. [setFishingCheat(boolean)](#setFishingCheat(boolean))
   905. [isHealthCheat()](#isHealthCheat())
   906. [setHealthCheat(boolean)](#setHealthCheat(boolean))
   907. [isMechanicsCheat()](#isMechanicsCheat())
   908. [setMechanicsCheat(boolean)](#setMechanicsCheat(boolean))
   909. [isFastMoveCheat()](#isFastMoveCheat())
   910. [setFastMoveCheat(boolean)](#setFastMoveCheat(boolean))
   911. [isMovablesCheat()](#isMovablesCheat())
   912. [setMovablesCheat(boolean)](#setMovablesCheat(boolean))
   913. [isAnimalCheat()](#isAnimalCheat())
   914. [setAnimalCheat(boolean)](#setAnimalCheat(boolean))
   915. [isAnimalExtraValuesCheat()](#isAnimalExtraValuesCheat())
   916. [setAnimalExtraValuesCheat(boolean)](#setAnimalExtraValuesCheat(boolean))
   917. [isAlwaysDayCheat()](#isAlwaysDayCheat())
   918. [setAlwaysDayCheat(boolean)](#setAlwaysDayCheat(boolean))
   919. [isTimedActionInstantCheat()](#isTimedActionInstantCheat())
   920. [setTimedActionInstantCheat(boolean)](#setTimedActionInstantCheat(boolean))
   921. [isTimedActionInstant()](#isTimedActionInstant())
   922. [isShowAdminTag()](#isShowAdminTag())
   923. [setShowAdminTag(boolean)](#setShowAdminTag(boolean))
   924. [isCheatSet(CheatType)](#isCheatSet(zombie.characters.CheatType))
   925. [getGameVariables()](#getGameVariables())
   926. [getVariable(AnimationVariableHandle)](#getVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle))
   927. [setVariable(IAnimationVariableSlot)](#setVariable(zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot))
   928. [setVariable(String, String)](#setVariable(java.lang.String,java.lang.String))
   929. [setVariable(String, boolean)](#setVariable(java.lang.String,boolean))
   930. [setVariable(String, float)](#setVariable(java.lang.String,float))
   931. [setVariableEnum(String, EnumType)](#setVariableEnum(java.lang.String,EnumType))
   932. [setVariable(AnimationVariableHandle, boolean)](#setVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle,boolean))
   933. [clearVariable(String)](#clearVariable(java.lang.String))
   934. [clearVariables()](#clearVariables())
   935. [getFootInjuryType()](#getFootInjuryType())
   936. [getSubVariableSource(String)](#getSubVariableSource(java.lang.String))
   937. [getGameVariablesInternal()](#getGameVariablesInternal())
   938. [startPlaybackGameVariables()](#startPlaybackGameVariables())
   939. [endPlaybackGameVariables(AnimationVariableSource)](#endPlaybackGameVariables(zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource))
   940. [playbackSetCurrentStateSnapshot(ActionStateSnapshot)](#playbackSetCurrentStateSnapshot(zombie.characters.action.ActionStateSnapshot))
   941. [playbackRecordCurrentStateSnapshot()](#playbackRecordCurrentStateSnapshot())
   942. [GetVariable(String)](#GetVariable(java.lang.String))
   943. [SetVariable(String, String)](#SetVariable(java.lang.String,java.lang.String))
   944. [ClearVariable(String)](#ClearVariable(java.lang.String))
   945. [actionStateChanged(ActionContext)](#actionStateChanged(zombie.characters.action.ActionContext))
   946. [isFallOnFront()](#isFallOnFront())
   947. [setFallOnFront(boolean)](#setFallOnFront(boolean))
   948. [isHitFromBehind()](#isHitFromBehind())
   949. [setHitFromBehind(boolean)](#setHitFromBehind(boolean))
   950. [isKilledBySlicingWeapon()](#isKilledBySlicingWeapon())
   951. [testCollideWithVehicles(BaseVehicle, BaseVehicle.HitVars)](#testCollideWithVehicles(zombie.vehicles.BaseVehicle,zombie.vehicles.BaseVehicle.HitVars))
   952. [shouldBePushedBackByVehicleHit()](#shouldBePushedBackByVehicleHit())
   953. [onHitByVehicle(BaseVehicle, float, Vector2, Vector2)](#onHitByVehicle(zombie.vehicles.BaseVehicle,float,zombie.iso.Vector2,zombie.iso.Vector2))
   954. [onHitByVehicleApplyDamage(BaseVehicle, float)](#onHitByVehicleApplyDamage(zombie.vehicles.BaseVehicle,float))
   955. [onHitByVehicleDriver(IsoGameCharacter)](#onHitByVehicleDriver(zombie.characters.IsoGameCharacter))
   956. [applyDamageFromVehicleHit(BaseVehicle, float, float)](#applyDamageFromVehicleHit(zombie.vehicles.BaseVehicle,float,float))
   957. [calculateDamageFromVehicleImpact(float)](#calculateDamageFromVehicleImpact(float))
   958. [calculateDamageFromVehicleRunOver(float)](#calculateDamageFromVehicleRunOver(float))
   959. [postHitByVehicleUpdateStance(float, boolean)](#postHitByVehicleUpdateStance(float,boolean))
   960. [reportEvent(String)](#reportEvent(java.lang.String))
   961. [StartTimedActionAnim(String)](#StartTimedActionAnim(java.lang.String))
   962. [StartTimedActionAnim(String, String)](#StartTimedActionAnim(java.lang.String,java.lang.String))
   963. [StopTimedActionAnim()](#StopTimedActionAnim())
   964. [hasHitReaction()](#hasHitReaction())
   965. [getHitReaction()](#getHitReaction())
   966. [setHitReaction(String)](#setHitReaction(java.lang.String))
   967. [CacheEquipped()](#CacheEquipped())
   968. [GetPrimaryEquippedCache()](#GetPrimaryEquippedCache())
   969. [GetSecondaryEquippedCache()](#GetSecondaryEquippedCache())
   970. [ClearEquippedCache()](#ClearEquippedCache())
   971. [isObjectBehind(IsoObject)](#isObjectBehind(zombie.iso.IsoObject))
   972. [isBehind(IsoGameCharacter)](#isBehind(zombie.characters.IsoGameCharacter))
   973. [resetEquippedHandsModels()](#resetEquippedHandsModels())
   974. [getDebugMonitor()](#getDebugMonitor())
   975. [setDebugMonitor(AnimatorDebugMonitor)](#setDebugMonitor(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor))
   976. [isAimAtFloor()](#isAimAtFloor())
   977. [setAimAtFloor(boolean)](#setAimAtFloor(boolean))
   978. [setAimAtFloor(boolean, float)](#setAimAtFloor(boolean,float))
   979. [aimAtFloorTargetDistance()](#aimAtFloorTargetDistance())
   980. [getAimAtFloorAmount()](#getAimAtFloorAmount())
   981. [getCurrentVerticalAimAngle()](#getCurrentVerticalAimAngle())
   982. [setCurrentVerticalAimAngle(float)](#setCurrentVerticalAimAngle(float))
   983. [setTargetVerticalAimAngle(float)](#setTargetVerticalAimAngle(float))
   984. [getTargetVerticalAimAngle()](#getTargetVerticalAimAngle())
   985. [isDeferredMovementEnabled()](#isDeferredMovementEnabled())
   986. [setDeferredMovementEnabled(boolean)](#setDeferredMovementEnabled(boolean))
   987. [testDotSide(IsoMovingObject)](#testDotSide(zombie.iso.IsoMovingObject))
   988. [testDotSideEnum(IsoMovingObject)](#testDotSideEnum(zombie.iso.IsoMovingObject))
   989. [addBasicPatch(BloodBodyPartType)](#addBasicPatch(zombie.characterTextures.BloodBodyPartType))
   990. [addHole(BloodBodyPartType)](#addHole(zombie.characterTextures.BloodBodyPartType))
   991. [addHole(BloodBodyPartType, boolean)](#addHole(zombie.characterTextures.BloodBodyPartType,boolean))
   992. [addDirt(BloodBodyPartType, Integer, boolean)](#addDirt(zombie.characterTextures.BloodBodyPartType,java.lang.Integer,boolean))
   993. [addLotsOfDirt(BloodBodyPartType, Integer, boolean)](#addLotsOfDirt(zombie.characterTextures.BloodBodyPartType,java.lang.Integer,boolean))
   994. [addBlood(BloodBodyPartType, boolean, boolean, boolean)](#addBlood(zombie.characterTextures.BloodBodyPartType,boolean,boolean,boolean))
   995. [bodyPartHasTag(Integer, ItemTag)](#bodyPartHasTag(java.lang.Integer,zombie.scripting.objects.ItemTag))
   996. [bodyPartIsSpiked(Integer)](#bodyPartIsSpiked(java.lang.Integer))
   997. [bodyPartIsSpikedBehind(Integer)](#bodyPartIsSpikedBehind(java.lang.Integer))
   998. [getBodyPartClothingDefense(Integer, boolean, boolean)](#getBodyPartClothingDefense(java.lang.Integer,boolean,boolean))
   999. [isBumped()](#isBumped())
   1000. [isBumpDone()](#isBumpDone())
   1001. [setBumpDone(boolean)](#setBumpDone(boolean))
   1002. [isBumpFall()](#isBumpFall())
   1003. [setBumpFall(boolean)](#setBumpFall(boolean))
   1004. [isBumpStaggered()](#isBumpStaggered())
   1005. [setBumpStaggered(boolean)](#setBumpStaggered(boolean))
   1006. [getBumpType()](#getBumpType())
   1007. [setBumpType(String)](#setBumpType(java.lang.String))
   1008. [getBumpFallType()](#getBumpFallType())
   1009. [setBumpFallType(String)](#setBumpFallType(java.lang.String))
   1010. [getBumpedChr()](#getBumpedChr())
   1011. [setBumpedChr(IsoGameCharacter)](#setBumpedChr(zombie.characters.IsoGameCharacter))
   1012. [getLastBump()](#getLastBump())
   1013. [setLastBump(long)](#setLastBump(long))
   1014. [postAnimationFinishing(String)](#postAnimationFinishing(java.lang.String))
   1015. [isSitOnGround()](#isSitOnGround())
   1016. [setSitOnGround(boolean)](#setSitOnGround(boolean))
   1017. [isSittingOnFurniture()](#isSittingOnFurniture())
   1018. [setSittingOnFurniture(boolean)](#setSittingOnFurniture(boolean))
   1019. [isSitting()](#isSitting())
   1020. [getSitOnFurnitureObject()](#getSitOnFurnitureObject())
   1021. [setSitOnFurnitureObject(IsoObject)](#setSitOnFurnitureObject(zombie.iso.IsoObject))
   1022. [getSitOnFurnitureDirection()](#getSitOnFurnitureDirection())
   1023. [setSitOnFurnitureDirection(IsoDirections)](#setSitOnFurnitureDirection(zombie.iso.IsoDirections))
   1024. [isSitOnFurnitureObject(IsoObject)](#isSitOnFurnitureObject(zombie.iso.IsoObject))
   1025. [shouldIgnoreCollisionWithSquare(IsoGridSquare)](#shouldIgnoreCollisionWithSquare(zombie.iso.IsoGridSquare))
   1026. [canStandAt(float, float, float)](#canStandAt(float,float,float))
   1027. [clearAIStateMap()](#clearAIStateMap())
   1028. [registerAIState(String, State)](#registerAIState(java.lang.String,zombie.ai.State))
   1029. [tryGetAIState(String)](#tryGetAIState(java.lang.String))
   1030. [isRunning()](#isRunning())
   1031. [setRunning(boolean)](#setRunning(boolean))
   1032. [isSprinting()](#isSprinting())
   1033. [setSprinting(boolean)](#setSprinting(boolean))
   1034. [canSprint()](#canSprint())
   1035. [postUpdateModelTextures()](#postUpdateModelTextures())
   1036. [getTextureCreator()](#getTextureCreator())
   1037. [setTextureCreator(ModelInstanceTextureCreator)](#setTextureCreator(zombie.core.skinnedmodel.model.ModelInstanceTextureCreator))
   1038. [postUpdateEquippedTextures()](#postUpdateEquippedTextures())
   1039. [getReadyModelData()](#getReadyModelData())
   1040. [getIgnoreMovement()](#getIgnoreMovement())
   1041. [setIgnoreMovement(boolean)](#setIgnoreMovement(boolean))
   1042. [isAutoWalk()](#isAutoWalk())
   1043. [setAutoWalk(boolean)](#setAutoWalk(boolean))
   1044. [setAutoWalkDirection(Vector2)](#setAutoWalkDirection(zombie.iso.Vector2))
   1045. [getAutoWalkDirection(Vector2)](#getAutoWalkDirection(zombie.iso.Vector2))
   1046. [isSneaking()](#isSneaking())
   1047. [setSneaking(boolean)](#setSneaking(boolean))
   1048. [getSneakLimpSpeedScale()](#getSneakLimpSpeedScale())
   1049. [setSneakLimpSpeedScale(float)](#setSneakLimpSpeedScale(float))
   1050. [getMoveDelta()](#getMoveDelta())
   1051. [setMoveDelta(float)](#setMoveDelta(float))
   1052. [getTurnDelta()](#getTurnDelta())
   1053. [setTurnDelta(float)](#setTurnDelta(float))
   1054. [getChopTreeSpeed()](#getChopTreeSpeed())
   1055. [testDefense(IsoZombie)](#testDefense(zombie.characters.IsoZombie))
   1056. [getSurroundingAttackingZombies()](#getSurroundingAttackingZombies())
   1057. [getSurroundingAttackingZombies(boolean)](#getSurroundingAttackingZombies(boolean))
   1058. [checkIsNearVehicle()](#checkIsNearVehicle())
   1059. [checkIsNearWall()](#checkIsNearWall())
   1060. [getBeenSprintingFor()](#getBeenSprintingFor())
   1061. [setBeenSprintingFor(float)](#setBeenSprintingFor(float))
   1062. [isHideWeaponModel()](#isHideWeaponModel())
   1063. [setHideWeaponModel(boolean)](#setHideWeaponModel(boolean))
   1064. [isHideEquippedHandL()](#isHideEquippedHandL())
   1065. [setHideEquippedHandL(boolean)](#setHideEquippedHandL(boolean))
   1066. [isHideEquippedHandR()](#isHideEquippedHandR())
   1067. [setHideEquippedHandR(boolean)](#setHideEquippedHandR(boolean))
   1068. [setIsAiming(boolean)](#setIsAiming(boolean))
   1069. [setFireMode(String)](#setFireMode(java.lang.String))
   1070. [getFireMode()](#getFireMode())
   1071. [isAiming()](#isAiming())
   1072. [isTwisting()](#isTwisting())
   1073. [allowsTwist()](#allowsTwist())
   1074. [getShoulderTwistWeight()](#getShoulderTwistWeight())
   1075. [resetBeardGrowingTime()](#resetBeardGrowingTime())
   1076. [resetHairGrowingTime()](#resetHairGrowingTime())
   1077. [fallenOnKnees()](#fallenOnKnees())
   1078. [fallenOnKnees(boolean)](#fallenOnKnees(boolean))
   1079. [addVisualDamage(String)](#addVisualDamage(java.lang.String))
   1080. [addBodyVisualFromItemType(String)](#addBodyVisualFromItemType(java.lang.String))
   1081. [isDuplicateBodyVisual(ItemVisual)](#isDuplicateBodyVisual(zombie.core.skinnedmodel.visual.ItemVisual))
   1082. [isCriticalHit()](#isCriticalHit())
   1083. [setCriticalHit(boolean)](#setCriticalHit(boolean))
   1084. [getRunSpeedModifier()](#getRunSpeedModifier())
   1085. [isNpc()](#isNpc())
   1086. [setMetabolicTarget(Metabolics)](#setMetabolicTarget(zombie.characters.BodyDamage.Metabolics))
   1087. [setMetabolicTarget(float)](#setMetabolicTarget(float))
   1088. [getThirstMultiplier()](#getThirstMultiplier())
   1089. [getHungerMultiplier()](#getHungerMultiplier())
   1090. [getFatiqueMultiplier()](#getFatiqueMultiplier())
   1091. [getTimedActionTimeModifier()](#getTimedActionTimeModifier())
   1092. [addHoleFromZombieAttacks(BloodBodyPartType, boolean)](#addHoleFromZombieAttacks(zombie.characterTextures.BloodBodyPartType,boolean))
   1093. [updateBandages()](#updateBandages())
   1094. [getTotalBlood()](#getTotalBlood())
   1095. [attackFromWindowsLunge(IsoZombie)](#attackFromWindowsLunge(zombie.characters.IsoZombie))
   1096. [DoSwingCollisionBoneCheck(IsoGameCharacter, int, float)](#DoSwingCollisionBoneCheck(zombie.characters.IsoGameCharacter,int,float))
   1097. [isInvincible()](#isInvincible())
   1098. [setInvincible(boolean)](#setInvincible(boolean))
   1099. [getNearVehicle()](#getNearVehicle())
   1100. [isNearSirenVehicle()](#isNearSirenVehicle())
   1101. [getSolidFloorAt(int, int, int)](#getSolidFloorAt(int,int,int))
   1102. [dropHeavyItems()](#dropHeavyItems())
   1103. [isHeavyItem(InventoryItem)](#isHeavyItem(zombie.inventory.InventoryItem))
   1104. [isCanShout()](#isCanShout())
   1105. [setCanShout(boolean)](#setCanShout(boolean))
   1106. [isKnowAllRecipes()](#isKnowAllRecipes())
   1107. [setKnowAllRecipes(boolean)](#setKnowAllRecipes(boolean))
   1108. [isUnlimitedAmmo()](#isUnlimitedAmmo())
   1109. [setUnlimitedAmmo(boolean)](#setUnlimitedAmmo(boolean))
   1110. [isUnlimitedEndurance()](#isUnlimitedEndurance())
   1111. [setUnlimitedEndurance(boolean)](#setUnlimitedEndurance(boolean))
   1112. [addActiveLightItem(InventoryItem, ArrayList)](#addActiveLightItem(zombie.inventory.InventoryItem,java.util.ArrayList))
   1113. [getActiveLightItems(ArrayList)](#getActiveLightItems(java.util.ArrayList))
   1114. [getOrCreateSleepingEventData()](#getOrCreateSleepingEventData())
   1115. [playEmote(String)](#playEmote(java.lang.String))
   1116. [getAnimationStateName()](#getAnimationStateName())
   1117. [getActionStateName()](#getActionStateName())
   1118. [shouldWaitToStartTimedAction()](#shouldWaitToStartTimedAction())
   1119. [setPersistentOutfitID(int)](#setPersistentOutfitID(int))
   1120. [setPersistentOutfitID(int, boolean)](#setPersistentOutfitID(int,boolean))
   1121. [getPersistentOutfitID()](#getPersistentOutfitID())
   1122. [isPersistentOutfitInit()](#isPersistentOutfitInit())
   1123. [isDoingActionThatCanBeCancelled()](#isDoingActionThatCanBeCancelled())
   1124. [causesDamageToVehicleWhenHit(BaseVehicle)](#causesDamageToVehicleWhenHit(zombie.vehicles.BaseVehicle))
   1125. [isDoDeathSound()](#isDoDeathSound())
   1126. [setDoDeathSound(boolean)](#setDoDeathSound(boolean))
   1127. [isKilledByFall()](#isKilledByFall())
   1128. [setKilledByFall(boolean)](#setKilledByFall(boolean))
   1129. [updateEquippedRadioFreq()](#updateEquippedRadioFreq())
   1130. [updateEquippedItemSounds()](#updateEquippedItemSounds())
   1131. [getFMODParameters()](#getFMODParameters())
   1132. [startEvent(long, GameSoundClip, boolean, BitSet)](#startEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   1133. [updateEvent(long, GameSoundClip)](#updateEvent(long,zombie.audio.GameSoundClip))
   1134. [stopEvent(long, GameSoundClip, boolean, BitSet)](#stopEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   1135. [playBloodSplatterSound()](#playBloodSplatterSound())
   1136. [setHeadLookAround(boolean)](#setHeadLookAround(boolean))
   1137. [isHeadLookAround()](#isHeadLookAround())
   1138. [setHeadLookAroundDirection(float, float)](#setHeadLookAroundDirection(float,float))
   1139. [getHeadLookHorizontal()](#getHeadLookHorizontal())
   1140. [getHeadLookVertical()](#getHeadLookVertical())
   1141. [getHeadLookAngleMax()](#getHeadLookAngleMax())
   1142. [addBloodFromVehicleImpact(float)](#addBloodFromVehicleImpact(float))
   1143. [isKnockedDown()](#isKnockedDown())
   1144. [setKnockedDown(boolean)](#setKnockedDown(boolean))
   1145. [isStaggerBack()](#isStaggerBack())
   1146. [readInventory(ByteBufferReader)](#readInventory(zombie.core.network.ByteBufferReader))
   1147. [Kill(IsoGameCharacter)](#Kill(zombie.characters.IsoGameCharacter))
   1148. [Kill(HandWeapon, IsoGameCharacter)](#Kill(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter))
   1149. [Kill(IsoGameCharacter, boolean)](#Kill(zombie.characters.IsoGameCharacter,boolean))
   1150. [Kill(IsoGameCharacter, HandWeapon, boolean, CharacterDiedListener)](#Kill(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,boolean,zombie.characters.CharacterDiedListener))
   1151. [onKilled(IsoGameCharacter, HandWeapon, boolean)](#onKilled(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,boolean))
   1152. [die()](#die())
   1153. [dieNetwork(IsoGameCharacter, HandWeapon, boolean, CharacterDiedListener)](#dieNetwork(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,boolean,zombie.characters.CharacterDiedListener))
   1154. [onDied(IsoGameCharacter, IsoDeadBody)](#onDied(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoDeadBody))
   1155. [addOnDiedListener(CharacterDiedListener, boolean)](#addOnDiedListener(zombie.characters.CharacterDiedListener,boolean))
   1156. [invokeOnDiedListeners(IsoDeadBody)](#invokeOnDiedListeners(zombie.iso.objects.IsoDeadBody))
   1157. [becomeCorpse()](#becomeCorpse())
   1158. [clearDiedBody()](#clearDiedBody())
   1159. [becomeCorpseItem(ItemContainer, IsoGameCharacter)](#becomeCorpseItem(zombie.inventory.ItemContainer,zombie.characters.IsoGameCharacter))
   1160. [getMass()](#getMass())
   1161. [getWeightAsCorpse()](#getWeightAsCorpse())
   1162. [getHitReactionNetworkAI()](#getHitReactionNetworkAI())
   1163. [getNetworkCharacterAI()](#getNetworkCharacterAI())
   1164. [wasLocal()](#wasLocal())
   1165. [isLocal()](#isLocal())
   1166. [isRemote()](#isRemote())
   1167. [isNetworkVehicleCollisionActive(BaseVehicle)](#isNetworkVehicleCollisionActive(zombie.vehicles.BaseVehicle))
   1168. [doNetworkHitByVehicle(BaseVehicle, BaseVehicle.HitVars)](#doNetworkHitByVehicle(zombie.vehicles.BaseVehicle,zombie.vehicles.BaseVehicle.HitVars))
   1169. [isSkipResolveCollision()](#isSkipResolveCollision())
   1170. [isPerformingAttackAnimation()](#isPerformingAttackAnimation())
   1171. [setPerformingAttackAnimation(boolean)](#setPerformingAttackAnimation(boolean))
   1172. [isPerformingShoveAnimation()](#isPerformingShoveAnimation())
   1173. [setPerformingShoveAnimation(boolean)](#setPerformingShoveAnimation(boolean))
   1174. [isPerformingStompAnimation()](#isPerformingStompAnimation())
   1175. [setPerformingStompAnimation(boolean)](#setPerformingStompAnimation(boolean))
   1176. [isPerformingHostileAnimation()](#isPerformingHostileAnimation())
   1177. [getNextAnimationTranslationLength()](#getNextAnimationTranslationLength())
   1178. [calcHitDir(IsoGameCharacter, HandWeapon, Vector2)](#calcHitDir(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,zombie.iso.Vector2))
   1179. [calcHitDir(Vector2)](#calcHitDir(zombie.iso.Vector2))
   1180. [getSafety()](#getSafety())
   1181. [setSafety(Safety)](#setSafety(zombie.characters.Safety))
   1182. [burnCorpse(IsoDeadBody)](#burnCorpse(zombie.iso.objects.IsoDeadBody))
   1183. [setIsAnimal(boolean)](#setIsAnimal(boolean))
   1184. [isAnimal()](#isAnimal())
   1185. [isAnimalRunningToDeathPosition()](#isAnimalRunningToDeathPosition())
   1186. [getPerkToUnit(PerkFactory.Perk)](#getPerkToUnit(zombie.characters.skills.PerkFactory.Perk))
   1187. [getReadLiterature()](#getReadLiterature())
   1188. [isLiteratureRead(String)](#isLiteratureRead(java.lang.String))
   1189. [addReadLiterature(String)](#addReadLiterature(java.lang.String))
   1190. [addReadLiterature(String, int)](#addReadLiterature(java.lang.String,int))
   1191. [addReadPrintMedia(String)](#addReadPrintMedia(java.lang.String))
   1192. [isPrintMediaRead(String)](#isPrintMediaRead(java.lang.String))
   1193. [getReadPrintMedia()](#getReadPrintMedia())
   1194. [hasReadMap(InventoryItem)](#hasReadMap(zombie.inventory.InventoryItem))
   1195. [addReadMap(InventoryItem)](#addReadMap(zombie.inventory.InventoryItem))
   1196. [setMusicIntensityEventModData(String, Object)](#setMusicIntensityEventModData(java.lang.String,java.lang.Object))
   1197. [getMusicIntensityEventModData(String)](#getMusicIntensityEventModData(java.lang.String))
   1198. [isWearingTag(ItemTag)](#isWearingTag(zombie.scripting.objects.ItemTag))
   1199. [getCorpseSicknessDefense()](#getCorpseSicknessDefense())
   1200. [getCorpseSicknessDefense(float)](#getCorpseSicknessDefense(float))
   1201. [getCorpseSicknessDefense(float, boolean)](#getCorpseSicknessDefense(float,boolean))
   1202. [isProtectedFromToxic()](#isProtectedFromToxic())
   1203. [isProtectedFromToxic(boolean)](#isProtectedFromToxic(boolean))
   1204. [checkSCBADrain()](#checkSCBADrain())
   1205. [isOverEncumbered()](#isOverEncumbered())
   1206. [updateWornItemsVisionModifier()](#updateWornItemsVisionModifier())
   1207. [getWornItemsVisionModifier()](#getWornItemsVisionModifier())
   1208. [getWornItemsVisionMultiplier()](#getWornItemsVisionMultiplier())
   1209. [updateWornItemsHearingModifier()](#updateWornItemsHearingModifier())
   1210. [getWornItemsHearingModifier()](#getWornItemsHearingModifier())
   1211. [getWornItemsHearingMultiplier()](#getWornItemsHearingMultiplier())
   1212. [getHearDistanceModifier()](#getHearDistanceModifier())
   1213. [getWeatherHearingMultiplier()](#getWeatherHearingMultiplier())
   1214. [getEffectiveFatigue()](#getEffectiveFatigue())
   1215. [getDetectionRange()](#getDetectionRange())
   1216. [setLastHitCharacter(IsoGameCharacter)](#setLastHitCharacter(zombie.characters.IsoGameCharacter))
   1217. [getLastHitCharacter()](#getLastHitCharacter())
   1218. [triggerCough()](#triggerCough())
   1219. [hasDirtyClothing(Integer)](#hasDirtyClothing(java.lang.Integer))
   1220. [hasBloodyClothing(Integer)](#hasBloodyClothing(java.lang.Integer))
   1221. [getAnimatable()](#getAnimatable())
   1222. [getGrappleable()](#getGrappleable())
   1223. [getWrappedGrappleable()](#getWrappedGrappleable())
   1224. [canBeGrappled()](#canBeGrappled())
   1225. [isPerformingGrappleAnimation()](#isPerformingGrappleAnimation())
   1226. [getShoutType()](#getShoutType())
   1227. [getShoutItemModel()](#getShoutItemModel())
   1228. [isWearingGlasses()](#isWearingGlasses())
   1229. [isWearingVisualAid()](#isWearingVisualAid())
   1230. [getClothingDiscomfortModifier()](#getClothingDiscomfortModifier())
   1231. [getVehicleDiscomfortModifier()](#getVehicleDiscomfortModifier())
   1232. [updateVisionEffectTargets()](#updateVisionEffectTargets())
   1233. [updateVisionEffects()](#updateVisionEffects())
   1234. [getBlurFactor()](#getBlurFactor())
   1235. [isDisguised()](#isDisguised())
   1236. [updateDisguisedState()](#updateDisguisedState())
   1237. [OnClothingUpdated()](#OnClothingUpdated())
   1238. [OnEquipmentUpdated()](#OnEquipmentUpdated())
   1239. [renderDebugData()](#renderDebugData())
   1240. [getCorpseSicknessRate()](#getCorpseSicknessRate())
   1241. [setCorpseSicknessRate(float)](#setCorpseSicknessRate(float))
   1242. [spikePartIndex(int)](#spikePartIndex(int))
   1243. [spikePart(BodyPartType)](#spikePart(zombie.characters.BodyDamage.BodyPartType))
   1244. [getReanimatedCorpse()](#getReanimatedCorpse())
   1245. [applyDamage(float)](#applyDamage(float))
   1246. [canRagdoll()](#canRagdoll())
   1247. [getRagdollController()](#getRagdollController())
   1248. [releaseRagdollController()](#releaseRagdollController())
   1249. [getBallisticsController()](#getBallisticsController())
   1250. [updateBallistics()](#updateBallistics())
   1251. [releaseBallisticsController()](#releaseBallisticsController())
   1252. [getBallisticsTarget()](#getBallisticsTarget())
   1253. [ensureExistsBallisticsTarget(IsoGameCharacter)](#ensureExistsBallisticsTarget(zombie.characters.IsoGameCharacter))
   1254. [updateBallisticsTarget()](#updateBallisticsTarget())
   1255. [releaseBallisticsTarget()](#releaseBallisticsTarget())
   1256. [canReachTo(IsoGridSquare)](#canReachTo(zombie.iso.IsoGridSquare))
   1257. [canUseAsGenericCraftingSurface(IsoObject)](#canUseAsGenericCraftingSurface(zombie.iso.IsoObject))
   1258. [getHitInfoList()](#getHitInfoList())
   1259. [getAimingMode()](#getAimingMode())
   1260. [updateHasTargetFlag()](#updateHasTargetFlag())
   1261. [isUnarmed()](#isUnarmed())
   1262. [isMeleeWeaponEquipped()](#isMeleeWeaponEquipped())
   1263. [isRangedWeaponEquipped()](#isRangedWeaponEquipped())
   1264. [isAimingFirearmEquipped()](#isAimingFirearmEquipped())
   1265. [getAttackVars()](#getAttackVars())
   1266. [addCombatMuscleStrain(InventoryItem)](#addCombatMuscleStrain(zombie.inventory.InventoryItem))
   1267. [addCombatMuscleStrain(InventoryItem, int)](#addCombatMuscleStrain(zombie.inventory.InventoryItem,int))
   1268. [addCombatMuscleStrain(InventoryItem, int, float)](#addCombatMuscleStrain(zombie.inventory.InventoryItem,int,float))
   1269. [addRightLegMuscleStrain(float)](#addRightLegMuscleStrain(float))
   1270. [addBackMuscleStrain(float)](#addBackMuscleStrain(float))
   1271. [addNeckMuscleStrain(float)](#addNeckMuscleStrain(float))
   1272. [addArmMuscleStrain(float)](#addArmMuscleStrain(float))
   1273. [addLeftArmMuscleStrain(float)](#addLeftArmMuscleStrain(float))
   1274. [addBothArmMuscleStrain(float)](#addBothArmMuscleStrain(float))
   1275. [addStiffness(BodyPartType, float)](#addStiffness(zombie.characters.BodyDamage.BodyPartType,float))
   1276. [getClimbingFailChanceInt()](#getClimbingFailChanceInt())
   1277. [getClimbingFailChanceFloat()](#getClimbingFailChanceFloat())
   1278. [nearbyZombieClimbPenalty()](#nearbyZombieClimbPenalty())
   1279. [isClimbingRope()](#isClimbingRope())
   1280. [fallFromRope()](#fallFromRope())
   1281. [isWearingGloves()](#isWearingGloves())
   1282. [isWearingAwkwardGloves()](#isWearingAwkwardGloves())
   1283. [getClimbRopeSpeed(boolean)](#getClimbRopeSpeed(boolean))
   1284. [setClimbRopeTime(float)](#setClimbRopeTime(float))
   1285. [getClimbRopeTime()](#getClimbRopeTime())
   1286. [hasAwkwardHands()](#hasAwkwardHands())
   1287. [forbidConcurrentAction(String)](#forbidConcurrentAction(java.lang.String))
   1288. [triggerContextualAction(String)](#triggerContextualAction(java.lang.String))
   1289. [triggerContextualAction(String, Object)](#triggerContextualAction(java.lang.String,java.lang.Object))
   1290. [triggerContextualAction(String, Object, Object)](#triggerContextualAction(java.lang.String,java.lang.Object,java.lang.Object))
   1291. [triggerContextualAction(String, Object, Object, Object)](#triggerContextualAction(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   1292. [triggerContextualAction(String, Object, Object, Object, Object)](#triggerContextualAction(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   1293. [isActuallyAttackingWithMeleeWeapon()](#isActuallyAttackingWithMeleeWeapon())
   1294. [isDoStomp()](#isDoStomp())
   1295. [isShoving()](#isShoving())
   1296. [teleportTo(int, int)](#teleportTo(int,int))
   1297. [teleportTo(float, float)](#teleportTo(float,float))
   1298. [teleportTo(float, float, int)](#teleportTo(float,float,int))
   1299. [teleportTo(int, int, int)](#teleportTo(int,int,int))
   1300. [ensureNotInVehicle()](#ensureNotInVehicle())
   1301. [forgetRecipes()](#forgetRecipes())
   1302. [isHandModelOverriddenByCurrentCharacterAction()](#isHandModelOverriddenByCurrentCharacterAction())
   1303. [isPrimaryHandModelReady()](#isPrimaryHandModelReady())
   1304. [isRangedWeaponReady()](#isRangedWeaponReady())
   1305. [isWeaponReady()](#isWeaponReady())
   1306. [climbThroughWindow(IsoObject)](#climbThroughWindow(zombie.iso.IsoObject))
   1307. [getClimbData()](#getClimbData())
   1308. [setClimbData(ClimbSheetRopeState.ClimbData)](#setClimbData(zombie.ai.states.ClimbSheetRopeState.ClimbData))
   1309. [getIdleSquareTime()](#getIdleSquareTime())
   1310. [updateIdleSquareTime()](#updateIdleSquareTime())
   1311. [isCurrentlyIdle()](#isCurrentlyIdle())
   1312. [isCurrentlyBusy()](#isCurrentlyBusy())
   1313. [isInCombat()](#isInCombat())
   1314. [updateMovementStatistics()](#updateMovementStatistics())
   1315. [flagForHotSave()](#flagForHotSave())
   1316. [getContainers()](#getContainers())
   1317. [hasRecipeAtHand(CraftRecipe)](#hasRecipeAtHand(zombie.scripting.entity.components.crafting.CraftRecipe))
   1318. [getCheats()](#getCheats())
   1319. [calculateVisibilityData()](#calculateVisibilityData())
   1320. [hasFullInventory()](#hasFullInventory())
   1321. [getFreeInventoryCapacity()](#getFreeInventoryCapacity())
   1322. [onFireLightSourceCheck()](#onFireLightSourceCheck())
   1323. [removeOnFireLightSource()](#removeOnFireLightSource())
   1324. [isInventive()](#isInventive())
   1325. [createFallingItem(InventoryItem)](#createFallingItem(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")

zombie.characters.IsoGameCharacter

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.ai.IStateCharacter, zombie.characters.action.IActionStateChanged, zombie.characters.CharacterInputComponentEntity, zombie.characters.ecs.ECSEntity, zombie.characters.ILuaGameCharacter, ILuaGameCharacterAttachedItems, ILuaGameCharacterClothing, zombie.characters.ILuaGameCharacterDamage, zombie.characters.ILuaGameCharacterHealth, zombie.characters.ILuaVariableSource, zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, IAnimationVariableRegistry, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.population.IClothingItemListener, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

Direct Known Subclasses:
:   `IsoDummyCameraCharacter, zombie.characters.IsoLivingCharacter, IsoLuaMover, IsoZombie, RandomizedBuildingBase.HumanCorpse`

---

public abstract class IsoGameCharacter
extends [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")
implements zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, [IAnimationVariableRegistry](../core/skinnedmodel/advancedanimation/IAnimationVariableRegistry.html "interface in zombie.core.skinnedmodel.advancedanimation"), zombie.core.skinnedmodel.population.IClothingItemListener, zombie.characters.action.IActionStateChanged, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, fmod.fmod.IFMODParameterUpdater, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.characters.ILuaVariableSource, zombie.characters.ILuaGameCharacter, zombie.ai.IStateCharacter, zombie.characters.CharacterInputComponentEntity

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characters.IsoGameCharacter)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoGameCharacter.Bandages`

  `static enum`

  `IsoGameCharacter.BodyLocation`

  `private static final class`

  `IsoGameCharacter.L_getDotWithForwardDirection`

  `private static class`

  `IsoGameCharacter.L_postUpdate`

  `private static final class`

  `IsoGameCharacter.L_renderLast`

  `private static final class`

  `IsoGameCharacter.L_renderShadow`

  `protected static final class`

  `IsoGameCharacter.l_testDotSide`

  `private static final class`

  `IsoGameCharacter.LC_slideAwayFromWalls`

  `static class`

  `IsoGameCharacter.LightInfo`

  `static class`

  `IsoGameCharacter.Location`

  `class`

  `IsoGameCharacter.PerkInfo`

  `private static class`

  `IsoGameCharacter.ReadBook`

  `private static class`

  `IsoGameCharacter.Recoil`

  `static class`

  `IsoGameCharacter.TorchInfo`

  `class`

  `IsoGameCharacter.XP`

  `static class`

  `IsoGameCharacter.XPMultiplier`

  ### Nested classes/interfaces inherited from class [IsoObject](../iso/IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `age`

  `private boolean`

  `aimAtFloor`

  `private float`

  `aimAtFloorTargetDistance`

  `private float`

  `aimingDelay`

  `protected boolean`

  `allowConversation`

  `final ArrayList<String>`

  `amputations`

  `private boolean`

  `animal`

  `private boolean`

  `animationFinishing`

  `private String`

  `animationFinishingState`

  `private final zombie.util.FrameDelay`

  `animationInvisibleFrameDelay`

  `private float`

  `animationTimeScale`

  `private boolean`

  `animationUpdatingThisFrame`

  `private final zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster`

  `animEventBroadcaster`

  `private zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animPlayer`

  `private final zombie.PredicatedFileWatcher`

  `animStateTriggerWatcher`

  `boolean`

  `asleep`

  `protected AttachedItems`

  `attachedItems`

  `protected IsoGameCharacter`

  `attackedBy`

  `protected IsoGridSquare`

  `attackTargetSquare`

  `protected final zombie.network.fields.hit.AttackVars`

  `attackVars`

  `private boolean`

  `autoWalk`

  `private final Vector2`

  `autoWalkDirection`

  `private boolean`

  `avoidDamage`

  `static final int`

  `AwkwardGlovesStrengthDivisor`

  `private InventoryItem`

  `backCache`

  `final ArrayList<InventoryContainer>`

  `bagsWorn`

  `private zombie.core.physics.BallisticsController`

  `ballisticsController`

  `private zombie.core.physics.BallisticsTarget`

  `ballisticsTarget`

  `private static final float`

  `BaseMuscleStrainMultiplier`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `beard`

  `private static final int`

  `BEARD_GROW_TIME_DAYS`

  `private float`

  `beardGrowTiming`

  `private IsoObject`

  `bed`

  `private String`

  `bedType`

  `private float`

  `beenMovingFor`

  `protected static final float`

  `BeenMovingForDecrease`

  `protected static final float`

  `BeenMovingForIncrease`

  `private float`

  `beenSprintingFor`

  `private float`

  `betaDelta`

  `private float`

  `betaEffect`

  `boolean`

  `blockTurning`

  `private float`

  `bloodImpactX`

  `private float`

  `bloodImpactY`

  `private float`

  `bloodImpactZ`

  `private IsoSprite`

  `bloodSplat`

  `private float`

  `blurFactor`

  `private float`

  `blurFactorTarget`

  `protected final BodyDamage`

  `bodyDamage`

  `private BodyDamage`

  `bodyDamageRemote`

  `private IsoGameCharacter`

  `bumpedChr`

  `private boolean`

  `bumpFall`

  `private String`

  `bumpFallType`

  `int`

  `bumpNbr`

  `private boolean`

  `bumpStaggered`

  `private String`

  `bumpType`

  `private final InventoryItem[]`

  `cacheEquiped`

  `boolean`

  `callOut`

  `private boolean`

  `canSeeCurrent`

  `private boolean`

  `canShout`

  `protected final Stack<zombie.characters.CharacterTimedActions.BaseAction>`

  `characterActions`

  `protected final CharacterTraits`

  `characterTraits`

  `protected zombie.chat.ChatElement`

  `chatElement`

  `zombie.characters.PlayerCheats`

  `cheats`

  `private String`

  `clickSound`

  `private ClimbSheetRopeState.ClimbData`

  `climbData`

  `protected boolean`

  `climbing`

  `private float`

  `climbRopeTime`

  `private float`

  `clothingDiscomfortModifier`

  `protected zombie.characters.ClothingWetness`

  `clothingWetness`

  `protected zombie.characters.ClothingWetnessSync`

  `clothingWetnessSync`

  `private static final float`

  `CombatSpeedBase`

  `private float`

  `combatSpeedModifier`

  `private final List<String>`

  `concurrentActionList`

  `private static final int`

  `CorpseBodyWeight`

  `private float`

  `corpseSicknessRate`

  `private float`

  `currentVerticalAimAngleDegrees`

  `protected boolean`

  `damagedByVehicle`

  `private float`

  `dangerLevels`

  `protected boolean`

  `dead`

  `private boolean`

  `deathDragDown`

  `private boolean`

  `debugVariablesRegistered`

  `private boolean`

  `deferredMovementEnabled`

  `protected float`

  `delayToActuallySleep`

  `private float`

  `depressDelta`

  `private float`

  `depressEffect`

  `private float`

  `depressFirstTakeTime`

  `protected SurvivorDesc`

  `descriptor`

  `private int`

  `dieCount`

  `private IsoDeadBody`

  `diedBody`

  `private boolean`

  `doDeathSound`

  `private boolean`

  `doDefer`

  `boolean`

  `doDirtBloodEtc`

  `private boolean`

  `drawUserName`

  `private float`

  `effectiveEdibleBuffTimer`

  `final BaseCharacterSoundEmitter`

  `emitter`

  `protected final Stack<IsoGameCharacter>`

  `enemyList`

  `private Radio`

  `equipedRadio`

  `private final float`

  `extraLungeRange`

  `private final zombie.characters.FallDamage`

  `fallDamage`

  `protected boolean`

  `falling`

  `private boolean`

  `fallOnFront`

  `protected float`

  `fallTime`

  `private final Stack<IsoBuilding>`

  `familiarBuildings`

  `protected final zombie.ai.astar.AStarPathFinderResult`

  `finder`

  `private float`

  `fireKillRate`

  `private int`

  `fireSpreadProbability`

  `private final zombie.audio.FMODParameterList`

  `fmodParameters`

  `private IsoGameCharacter`

  `followingTarget`

  `boolean`

  `forceNullOverride`

  `protected boolean`

  `forceWakeUp`

  `protected float`

  `forceWakeUpTime`

  `protected final Vector2`

  `forwardDirection`

  `private float`

  `fullSpeedMod`

  `private final zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource`

  `gameVariables`

  `static final int`

  `GlovesStrengthBonus`

  `private final zombie.core.skinnedmodel.BaseGrappleable`

  `grappleable`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `hair`

  `private static final int`

  `HAIR_GROW_TIME_DAYS`

  `private float`

  `hairGrowTiming`

  `private float`

  `haloDispTime`

  `private TextDrawObject`

  `haloNote`

  `protected boolean`

  `handItemShouldSendToClients`

  `private boolean`

  `hasInitTextObjects`

  `private boolean`

  `hasTarget`

  `private boolean`

  `headLookAround`

  `private float`

  `headLookHorizontal`

  `private float`

  `headLookVertical`

  `protected float`

  `health`

  `private static final float`

  `HeavyTwoHandedWeaponModifier`

  `private boolean`

  `hideEquippedHandL`

  `private boolean`

  `hideEquippedHandR`

  `private boolean`

  `hideWeaponModel`

  `private String`

  `hitDirEnum`

  `private boolean`

  `hitFromBehind`

  `private final PZArrayList<zombie.network.fields.hit.HitInfo>`

  `hitInfoList`

  `private String`

  `hitReaction`

  `static final float`

  `HUMANOID_SCREEN_CHEST_HEIGHT`

  `static final float`

  `HUMANOID_WORLD_CHEST_HEIGHT`

  `protected String`

  `hurtSound`

  `private float`

  `idleSquareTime`

  `private boolean`

  `ignoreMovement`

  `protected boolean`

  `ignoreStaggerBack`

  `protected static final ColorInfo`

  `inf`

  `private float`

  `initialTurningAroundTarget`

  `private static int`

  `instanceId`

  `private final String`

  `instancename`

  `protected ItemContainer`

  `inventory`

  `private boolean`

  `invincible`

  `ArrayList<Integer>`

  `invRadioFreq`

  Deprecated.

  `private boolean`

  `isAddedToModelManager`

  `private boolean`

  `isAiming`

  `private boolean`

  `isAnimatingBackwards`

  `private long`

  `isAnimForecasted`

  `private boolean`

  `isBumpDone`

  `private boolean`

  `isCrit`

  `private boolean`

  `isEditingRagdoll`

  `private boolean`

  `isGrappleThrowIntoContainer`

  `private boolean`

  `isGrappleThrowOutWindow`

  `private boolean`

  `isGrappleThrowOverFence`

  `private boolean`

  `isMoving`

  `protected boolean`

  `isOnGround`

  `protected IsoPlayer`

  `isoPlayer`

  `private boolean`

  `isPerformingAttackAnim`

  `private boolean`

  `isPerformingShoveAnim`

  `private boolean`

  `isPerformingStompAnim`

  `private boolean`

  `isReading`

  `boolean`

  `isResting`

  `private boolean`

  `isSitOnFurniture`

  `private boolean`

  `isTurning`

  `private boolean`

  `isTurning90`

  `private boolean`

  `isTurningAround`

  `final boolean[]`

  `isVisibleToPlayer`

  `protected boolean`

  `kill`

  `private boolean`

  `killedByFall`

  `float`

  `knockbackAttackMod`

  `private boolean`

  `knockedDown`

  `private final HashSet<String>`

  `knownMediaLines`

  `private final List<String>`

  `knownRecipes`

  `long`

  `lastAnimalPet`

  `private long`

  `lastBump`

  `private ChatMessage`

  `lastChatMessage`

  `private boolean`

  `lastCollidedN`

  `private boolean`

  `lastCollidedW`

  `protected float`

  `lastFallSpeed`

  `private float`

  `lastFitnessValue`

  `private final IsoGameCharacter.Location`

  `lastHeardSound`

  `private IsoGameCharacter`

  `lastHitCharacter`

  `private int`

  `lastHitCount`

  `private int`

  `lastHourSleeped`

  `private final HashMap<String, IsoGameCharacter.Location>`

  `lastKnownLocation`

  `private int`

  `lastLocalEnemies`

  `private String`

  `lastSpokenLine`

  `private int`

  `lastZombieKills`

  `private float`

  `leaveBodyTimedown`

  `private InventoryItem`

  `leftHandCache`

  `protected InventoryItem`

  `leftHandItem`

  `IsoSprite`

  `legsSprite`

  `private static final int[]`

  `LevelUpLevels`

  `private float`

  `levelUpMultiplier`

  `final IsoGameCharacter.LightInfo`

  `lightInfo`

  `private final IsoGameCharacter.LightInfo`

  `lightInfo2`

  `private float`

  `llx`

  `private float`

  `lly`

  `private float`

  `llz`

  `private final Stack<IsoGameCharacter>`

  `localEnemyList`

  `private final ArrayList<IsoMovingObject>`

  `localGroupList`

  `private final ArrayList<IsoMovingObject>`

  `localList`

  `private final ArrayList<IsoMovingObject>`

  `localNeutralList`

  `private final ArrayList<IsoMovingObject>`

  `localRelevantEnemyList`

  `private float`

  `lungeFallTimer`

  `private static final float`

  `m_sneakLimpSpeed`

  `private static final float`

  `m_sneakLowLimpSpeed`

  `private final MapKnowledge`

  `mapKnowledge`

  `private static final float`

  `maxHeadLookAngle`

  `private static final float`

  `maxStrafeSpeed`

  `private float`

  `maxTwist`

  `private int`

  `maxWeight`

  `private int`

  `maxWeightBase`

  `private float`

  `meleeDelay`

  `private static final double`

  `meleeWeaponMuscleStrainAdjustment`

  `private float`

  `momentumScalar`

  `protected final Moodles`

  `moodles`

  `private float`

  `moveDelta`

  `private final Vector2`

  `moveForwardVec`

  `private static final ArrayList<IsoMovingObject>`

  `movingStatic`

  `private static final int`

  `NAME_TAG_Y_OFFSET`

  `private static final String`

  `nameCarKeySuffix`

  `final zombie.characters.NetworkCharacter`

  `networkCharacter`

  `private int`

  `nextWander`

  `protected int`

  `numSurvivorsInVicinity`

  `private boolean`

  `onBed`

  `private final Map<zombie.characters.CharacterDiedListener, Boolean>`

  `onDiedListeners`

  `private boolean`

  `onFire`

  `IsoLightSource`

  `onFireLightSource`

  `String`

  `overridePrimaryHandModel`

  `String`

  `overrideSecondaryHandModel`

  `private float`

  `painDelta`

  `private float`

  `painEffect`

  `private zombie.pathfind.Path`

  `path2`

  `private int`

  `pathIndex`

  `protected boolean`

  `pathing`

  `private int`

  `patience`

  `private int`

  `patienceMax`

  `private int`

  `patienceMin`

  `private final ArrayList<IsoGameCharacter.PerkInfo>`

  `perkList`

  `protected int`

  `persistentOutfitId`

  `protected boolean`

  `persistentOutfitInit`

  `private final PathFindBehavior2`

  `pfb2`

  `private zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource`

  `playbackGameVariables`

  `protected boolean`

  `playingDeathSound`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `postUpdateInternal`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `primaryHandModel`

  `private boolean`

  `ragdollFall`

  `private boolean`

  `rangedWeaponEmpty`

  `private final ArrayList<IsoGameCharacter.ReadBook>`

  `readBooks`

  `private final HashMap<String,Integer>`

  `readLiterature`

  `private final HashSet<String>`

  `readPrintMedia`

  `private final ArrayList<zombie.core.skinnedmodel.model.ModelInstance>`

  `readyModelData`

  `zombie.network.NetworkVariables.ZombieState`

  `realState`

  `float`

  `realx`

  `float`

  `realy`

  `byte`

  `realz`

  `private boolean`

  `reanim`

  `private int`

  `reanimAnimDelay`

  `private int`

  `reanimAnimFrame`

  `IsoGameCharacter`

  `reanimatedCorpse`

  `int`

  `reanimatedCorpseId`

  `private float`

  `reanimateTimer`

  `private final IsoGameCharacter.Recoil`

  `recoil`

  `private float`

  `recoilDelay`

  `private static final float`

  `RecoilDelayDecrease`

  `private float`

  `reduceInfectionPower`

  `protected int`

  `remoteId`

  `long`

  `removedFromWorldMs`

  `static final int`

  `RENDER_OFFSET_X`

  `static final int`

  `RENDER_OFFSET_Y`

  `private InventoryItem`

  `rightHandCache`

  `protected InventoryItem`

  `rightHandItem`

  `private boolean`

  `running`

  `protected float`

  `runSpeedModifier`

  `private static final IsoGameCharacter.Bandages`

  `s_bandages`

  `static final float`

  `s_maxPossibleTwist`

  `private final Safety`

  `safety`

  `protected final ArrayList<InventoryItem>`

  `savedInventoryItems`

  `boolean`

  `savedVehicleRunning`

  `short`

  `savedVehicleSeat`

  `float`

  `savedVehicleX`

  `float`

  `savedVehicleY`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `secondaryHandModel`

  `private float`

  `shadowBm`

  `private float`

  `shadowFm`

  `private long`

  `shadowTick`

  `private boolean`

  `shoveStompAnim`

  `private boolean`

  `showAdminTag`

  `private IsoDirections`

  `sitOnFurnitureDirection`

  `private IsoObject`

  `sitOnFurnitureObject`

  `private boolean`

  `sitOnGround`

  `private zombie.ai.sadisticAIDirector.SleepingEventData`

  `sleepingEventData`

  `private float`

  `sleepingTabletDelta`

  `private float`

  `sleepingTabletEffect`

  `private int`

  `sleepSpeechCnt`

  `private static String`

  `sleepText`

  `private final IsoGameCharacter.LC_slideAwayFromWalls`

  `slideAwayFromWalls`

  `protected float`

  `slowFactor`

  `protected float`

  `slowTimer`

  `protected static final float`

  `SNEAK_LIMP_INJURY_THRESHOLD`

  `protected static final float`

  `SNEAK_LIMP_SPEED_SCALE_DEFAULT`

  `private boolean`

  `sneaking`

  `private float`

  `sneakLimpSpeedScale`

  `protected Color`

  `speakColour`

  `protected boolean`

  `speaking`

  `private float`

  `speakTime`

  `float`

  `speedMod`

  `private boolean`

  `sprinting`

  `private float`

  `staggerTimeMod`

  `protected final Stats`

  `stats`

  `private int`

  `survivorKills`

  `private static final HashMap<Integer, SurvivorDesc>`

  `SurvivorMap`

  `private float`

  `targetVerticalAimAngleDegrees`

  `protected static final ItemVisuals`

  `tempItemVisuals`

  `protected static final Vector2`

  `tempo`

  `protected static final Vector2`

  `tempo2`

  `protected static final Vector3`

  `tempo3`

  `private static final Vector2`

  `tempVector2`

  `private static final Vector2`

  `tempVector2_1`

  `private static final Vector2`

  `tempVector2_2`

  `private static final Vector3f`

  `tempVector3f00`

  `private static final Vector3f`

  `tempVector3f01`

  `private static final Vector3`

  `tempVectorBonePos`

  `private zombie.core.skinnedmodel.model.ModelInstanceTextureCreator`

  `textureCreator`

  `protected float`

  `timeOfSleep`

  `private float`

  `timeSinceLastSmoke`

  `private int`

  `timeThumping`

  `protected float`

  `turnDeltaNormal`

  `protected float`

  `turnDeltaRunning`

  `protected float`

  `turnDeltaSprinting`

  `boolean`

  `updateEquippedTextures`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `updateInternal`

  `private boolean`

  `updateModelTextures`

  `private final Stack<String>`

  `usedItemsOn`

  `protected HandWeapon`

  `useHandWeapon`

  `protected boolean`

  `useParts`

  `private boolean`

  `usePhysicHitReaction`

  `protected TextDrawObject`

  `userName`

  `boolean`

  `usernameDisguised`

  `IsoGameCharacter`

  `vbdebugHitTarget`

  `protected BaseVehicle`

  `vehicle`

  `private boolean`

  `vehicleCollision`

  `private final ArrayList<IsoMovingObject>`

  `veryCloseEnemyList`

  `private boolean`

  `visibleToNpcs`

  `long`

  `vocalEvent`

  `private static final String`

  `voiceMuteSuffix`

  `private static final String`

  `voiceSuffix`

  `static final float`

  `WALK_SPEED_DEFAULT`

  `static final float`

  `WALK_SPEED_SLOW`

  `private float`

  `walkSpeedModifier`

  `boolean`

  `wasKnockedDown`

  `private boolean`

  `wornClothingCanRagdoll`

  `protected WornItems`

  `wornItems`

  `private float`

  `wornItemsHearingModifier`

  `private float`

  `wornItemsVisionModifier`

  `protected IsoGameCharacter.XP`

  `xp`

  `private static final float`

  `ZombieAttackingClimbPenalty`

  `private int`

  `zombieKills`

  `private static final float`

  `ZombieNearbyClimbPenalty`

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

  `IsoGameCharacter(IsoCell cell,
  float x,
  float y,
  float z)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `actionStateChanged(zombie.characters.action.ActionContext sender)`

  `private void`

  `addActiveLightItem(InventoryItem item,
  ArrayList<InventoryItem> items)`

  `void`

  `addArmMuscleStrain(float painfactor)`

  `void`

  `addBackMuscleStrain(float painfactor)`

  `void`

  `addBasicPatch(BloodBodyPartType part)`

  `void`

  `addBlood(BloodBodyPartType part,
  boolean scratched,
  boolean bitten,
  boolean allLayers)`

  `void`

  `addBloodFromVehicleImpact(float speed)`

  `ItemVisual`

  `addBodyVisualFromItemType(String itemType)`

  `void`

  `addBothArmMuscleStrain(float painfactor)`

  `void`

  `addCombatMuscleStrain(InventoryItem weapon)`

  `void`

  `addCombatMuscleStrain(InventoryItem weapon,
  int hitCount)`

  `void`

  `addCombatMuscleStrain(InventoryItem item,
  int hitCount,
  float multiplier)`

  `void`

  `addDirt(BloodBodyPartType part,
  Integer nbr,
  boolean allLayers)`

  `boolean`

  `addHole(BloodBodyPartType part)`

  `boolean`

  `addHole(BloodBodyPartType part,
  boolean allLayers)`

  `boolean`

  `addHoleFromZombieAttacks(BloodBodyPartType part,
  boolean scratch)`

  `void`

  `addKnownMediaLine(String guid)`

  `void`

  `addLeftArmMuscleStrain(float painfactor)`

  `void`

  `addLineChatElement(String line)`

  `void`

  `addLineChatElement(String line,
  float r,
  float g,
  float b)`

  `void`

  `addLineChatElement(String line,
  float r,
  float g,
  float b,
  UIFont font,
  float baseRange,
  String customTag)`

  `void`

  `addLineChatElement(String line,
  float r,
  float g,
  float b,
  UIFont font,
  float baseRange,
  String customTag,
  boolean bbcode,
  boolean img,
  boolean icons,
  boolean colors,
  boolean fonts,
  boolean equalizeHeights)`

  `void`

  `addLotsOfDirt(BloodBodyPartType part,
  Integer nbr,
  boolean allLayers)`

  `void`

  `addNeckMuscleStrain(float painfactor)`

  `void`

  `addOnDiedListener(zombie.characters.CharacterDiedListener onDiedListener,
  boolean autoRemoveOnInvoke)`

  `void`

  `addReadLiterature(String name)`

  `void`

  `addReadLiterature(String name,
  int day)`

  `void`

  `addReadMap(InventoryItem item)`

  `void`

  `addReadPrintMedia(String mediaId)`

  `void`

  `addRightLegMuscleStrain(float painfactor)`

  `void`

  `addStiffness(BodyPartType partType,
  float stiffness)`

  `void`

  `addVisualDamage(String itemType)`

  `void`

  `addWorldSoundUnlessInvisible(int radius,
  int volume,
  boolean bStressHumans)`

  `float`

  `aimAtFloorTargetDistance()`

  `boolean`

  `allowsInvisibleAnimationSkips()`

  `boolean`

  `allowsTwist()`

  `void`

  `applyCharacterTraitsRecipes()`

  `void`

  `applyDamage(float damageAmount)`

  `void`

  `applyDamageFromVehicleHit(BaseVehicle vehicle,
  float vehicleSpeed,
  float damage)`

  `private void`

  `applyDeltas(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)`

  `void`

  `ApplyInBedOffset(boolean apply)`

  `void`

  `applyProfessionRecipes()`

  `void`

  `applyTraits(List<CharacterTrait> luaTraits)`

  `void`

  `attackFromWindowsLunge(IsoZombie zombie)`

  `void`

  `autoDrink()`

  `boolean`

  `avoidDamage()`

  `private final IsoDeadBody`

  `becomeCorpse()`

  `InventoryItem`

  `becomeCorpseItem(ItemContainer placeInContainer,
  IsoGameCharacter chr)`

  `void`

  `BetaAntiDepress(float delta)`

  `void`

  `BetaBlockers(float delta)`

  `private boolean`

  `bodyPartHasTag(Integer part,
  ItemTag itemTag)`

  `boolean`

  `bodyPartIsSpiked(Integer part)`

  `boolean`

  `bodyPartIsSpikedBehind(Integer part)`

  `void`

  `burnCorpse(IsoDeadBody corpse)`

  `void`

  `CacheEquipped()`

  `Vector2`

  `calcCarForwardVector()`

  `Vector2`

  `calcCarPositionOffset(boolean movingBackward)`

  `Vector2`

  `calcCarSpeedVector()`

  `Vector2`

  `calcCarSpeedVector(Vector2 offset)`

  `Vector2`

  `calcCarToPlayerVector(IsoGameCharacter target)`

  `Vector2`

  `calcCarToPlayerVector(IsoGameCharacter target,
  Vector2 offset)`

  `float`

  `calcConeAngleMultiplier(IsoGameCharacter target,
  boolean movingBackward)`

  `float`

  `calcConeAngleOffset(IsoGameCharacter target,
  boolean movingBackward)`

  `private float`

  `calcFractureInjurySpeed(BodyPart bodyPart)`

  `void`

  `calcHitDir(IsoGameCharacter wielder,
  HandWeapon weapon,
  Vector2 out)`

  `void`

  `calcHitDir(Vector2 out)`

  `float`

  `calcLengthMultiplier(Vector2 carSpeed,
  boolean movingBackward)`

  `private float`

  `calcRunSpeedModByBag(InventoryContainer bag)`

  `private float`

  `calcRunSpeedModByClothing()`

  `float`

  `calculateBaseSpeed()`

  `float`

  `calculateCombatSpeed()`

  `private float`

  `calculateDamageFromVehicleImpact(float impactSpeed)`

  `private float`

  `calculateDamageFromVehicleRunOver(float impactSpeed)`

  `float`

  `calculateGrappleEffectivenessFromTraits()`

  `private void`

  `calculateHitDirection(HandWeapon handWeapon,
  IsoGameCharacter wielder)`

  `protected float`

  `calculateIdleSpeed()`

  `private float`

  `calculateInjurySpeed(BodyPart bodyPart,
  boolean doPain)`

  `static zombie.iso.objects.ShadowParams`

  `calculateShadowParams(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer,
  float animalSize,
  boolean bRagdoll,
  zombie.iso.objects.ShadowParams sp)`

  `zombie.iso.objects.ShadowParams`

  `calculateShadowParams(zombie.iso.objects.ShadowParams sp)`

  `protected float`

  `calculateSneakLimpSpeedScale()`

  `protected void`

  `calculateStats()`

  `zombie.characters.VisibilityData`

  `calculateVisibilityData()`

  `protected void`

  `calculateWalkSpeed()`

  `void`

  `Callout()`

  `void`

  `Callout(boolean doAnim)`

  `boolean`

  `canAccessContainer(ItemContainer container)`

  `boolean`

  `CanAttack()`

  `boolean`

  `canBeGrappled()`

  `boolean`

  `canClimbDownSheetRope(IsoGridSquare sq)`

  `boolean`

  `canClimbDownSheetRopeInCurrentSquare()`

  `boolean`

  `canClimbSheetRope(IsoGridSquare sq)`

  `static boolean`

  `canDropCorpseInto(IsoGameCharacter chr,
  ItemContainer container)`

  `static boolean`

  `canGrabCorpseFrom(IsoGameCharacter chr,
  ItemContainer container)`

  `boolean`

  `canRagdoll()`

  `boolean`

  `canReachTo(IsoGridSquare square)`

  `boolean`

  `CanSee(IsoMovingObject obj)`

  `boolean`

  `CanSee(IsoObject obj)`

  `boolean`

  `canSprint()`

  `boolean`

  `canStandAt(float x,
  float y,
  float z)`

  `boolean`

  `canUseAsGenericCraftingSurface(IsoObject object)`

  `boolean`

  `canUseCurrentPoseForCorpse()`

  `boolean`

  `canUseDebugContextMenu()`

  `boolean`

  `canUseLootLog()`

  `boolean`

  `canUseLootZed()`

  `protected boolean`

  `CanUsePathfindState()`

  `boolean`

  `carMovingBackward(Vector2 carSpeed)`

  `boolean`

  `causesDamageToVehicleWhenHit(BaseVehicle impactingVehicle)`

  Checks if BaseVehicle.hitCharacter causes any damage to the vehicle.

  `void`

  `changeState(zombie.ai.State state)`

  `boolean`

  `checkCurrentAction(zombie.util.lambda.Invokers.Params1.Boolean.ICallback<zombie.characters.CharacterTimedActions.BaseAction> checkPredicate)`

  `boolean`

  `checkIsNearVehicle()`

  `float`

  `checkIsNearWall()`

  `private boolean`

  `checkPVP()`

  `private void`

  `checkSCBADrain()`

  `void`

  `checkUpdateModelTextures()`

  `void`

  `clear(Class<? extends zombie.ai.State> clazz)`

  `void`

  `clear(zombie.ai.State state)`

  `protected void`

  `clearAIStateMap()`

  `void`

  `clearAttachedItems()`

  `private void`

  `clearAttackVars()`

  `final void`

  `clearDiedBody()`

  `void`

  `ClearEquippedCache()`

  `void`

  `clearFallDamage()`

  `void`

  `clearHitInfo()`

  `void`

  `clearKnownMediaLines()`

  `void`

  `clearVariable(String key)`

  `void`

  `ClearVariable(String key)`

  `void`

  `clearVariables()`

  `void`

  `clearWornItems()`

  `void`

  `climbDownSheetRope()`

  `void`

  `climbOverFence(IsoDirections dir)`

  `void`

  `climbSheetRope()`

  `void`

  `climbThroughWindow(IsoObject isoObject)`

  `void`

  `climbThroughWindow(IsoThumpable w)`

  `void`

  `climbThroughWindow(IsoThumpable w,
  Integer startingFrame)`

  `void`

  `climbThroughWindow(IsoWindow w)`

  `void`

  `climbThroughWindow(IsoWindow w,
  Integer startingFrame)`

  `void`

  `climbThroughWindowFrame(IsoWindowFrame windowFrame)`

  `private static Vector2`

  `closestpointonline(double lx1,
  double ly1,
  double lx2,
  double ly2,
  double x0,
  double y0,
  Vector2 out)`

  `void`

  `closeWindow(IsoWindow w)`

  `void`

  `clothingItemChanged(String itemGuid)`

  `int`

  `compareMovePriority(IsoGameCharacter other)`

  `protected void`

  `createFallingItem(InventoryItem item)`

  `InventoryItem`

  `createKeyRing()`

  `InventoryItem`

  `createKeyRing(ItemKey itemKey)`

  `protected void`

  `damageWhileInTrees()`

  `zombie.core.skinnedmodel.animation.AnimationTrack`

  `dbgGetAnimTrack(int layerIdx,
  int trackIdx)`

  `String`

  `dbgGetAnimTrackName(int layerIdx,
  int trackIdx)`

  `float`

  `dbgGetAnimTrackTime(int layerIdx,
  int trackIdx)`

  `float`

  `dbgGetAnimTrackWeight(int layerIdx,
  int trackIdx)`

  `private static void`

  `dbgOnGlobalAnimEvent(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `dbgRegisterAnimTrackVariable(int layerIdx,
  int trackIdx)`

  `private void`

  `debugAim()`

  `private void`

  `debugRenderLast()`

  `private void`

  `debugTestDotSide()`

  `private void`

  `debugVision()`

  `private String`

  `determineHitDirEnum(Vector2 hitDir)`

  `final void`

  `die()`

  `final IsoDeadBody`

  `dieNetwork(IsoGameCharacter killer,
  HandWeapon attackingWeapon,
  boolean isGory,
  zombie.characters.CharacterDiedListener onDiedListener)`

  `void`

  `DirectionFromVector(Vector2 vecA)`

  `final void`

  `DoDeath(HandWeapon weapon,
  IsoGameCharacter wielder)`

  `void`

  `DoDeath(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean isGory)`

  `void`

  `doDeathSplatterAndSounds(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean isGory)`

  `protected void`

  `doDeferredMovement()`

  `void`

  `doDeferredMovementFromRagdoll(Vector3 dMovement)`

  `void`

  `DoFloorSplat(IsoGridSquare sq,
  String id,
  boolean bFlip,
  float offZ,
  float alpha)`

  `void`

  `DoFootstepSound(float volume)`

  `void`

  `DoFootstepSound(String type)`

  `void`

  `DoLand(float impactIsoSpeed)`

  `void`

  `doNetworkHitByVehicle(BaseVehicle hitByVehicle,
  BaseVehicle.HitVars hitVars)`

  `protected void`

  `doSleepSpeech()`

  `void`

  `DoSneezeText()`

  `(package private) void`

  `DoSplat(IsoGridSquare sq,
  String id,
  boolean bFlip,
  IsoFlagType prop,
  float offX,
  float offZ,
  float alpha)`

  `boolean`

  `DoSwingCollisionBoneCheck(IsoGameCharacter zombie,
  int bone,
  float tempoLengthTest)`

  `void`

  `drawDebugTextBelow(String text)`

  `void`

  `drawDirectionLine(Vector2 dir,
  float length,
  float r,
  float g,
  float b)`

  `void`

  `drawDirectionLine(Vector3 dir,
  float length,
  float r,
  float g,
  float b)`

  `void`

  `drawLine(Vector2 startPos,
  Vector2 dir,
  float length,
  float r,
  float g,
  float b)`

  `void`

  `DrawSneezeText()`

  Deprecated.

  `void`

  `dressInClothingItem(String itemGUID)`

  `void`

  `dressInNamedOutfit(String outfitName)`

  `void`

  `dressInPersistentOutfit(String outfitName)`

  `void`

  `dressInPersistentOutfitID(int outfitID)`

  `void`

  `dressInRandomNonSillyOutfit()`

  `void`

  `dressInRandomOutfit()`

  `void`

  `Dressup(SurvivorDesc desc)`

  `boolean`

  `DrinkFluid(FluidContainer fluidCont,
  float percentage)`

  `boolean`

  `DrinkFluid(FluidContainer fluidCont,
  float percentage,
  boolean useUtensil)`

  `boolean`

  `DrinkFluid(InventoryItem info)`

  `boolean`

  `DrinkFluid(InventoryItem info,
  float percentage)`

  `boolean`

  `DrinkFluid(InventoryItem info,
  float percentage,
  boolean useUtensil)`

  `void`

  `dropHandItems()`

  `void`

  `dropHeavyItems()`

  `void`

  `dropHeldItems(int x,
  int y,
  int z,
  boolean heavy,
  boolean isThrow)`

  `boolean`

  `Eat(InventoryItem info)`

  `boolean`

  `Eat(InventoryItem info,
  float percentage)`

  `boolean`

  `Eat(InventoryItem info,
  float percentage,
  boolean useUtensil)`

  `boolean`

  `EatOnClient(InventoryItem info,
  float percentage)`

  `void`

  `endPlaybackGameVariables(zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource playbackVars)`

  `zombie.core.physics.BallisticsTarget`

  `ensureExistsBallisticsTarget(IsoGameCharacter isoGameCharacter)`

  `void`

  `ensureNotInVehicle()`

  `void`

  `enterVehicle(BaseVehicle v,
  int seat,
  Vector3f offset)`

  `void`

  `exert(float f)`

  `void`

  `faceDirection(IsoDirections dir)`

  `final boolean`

  `faceLocation(float x,
  float y)`

  `boolean`

  `faceLocationF(float x,
  float y)`

  `void`

  `facePosition(int x,
  int y)`

  `void`

  `faceThisObject(IsoObject object)`

  `void`

  `faceThisObjectAlt(IsoObject object)`

  `void`

  `fallenOnKnees()`

  `void`

  `fallenOnKnees(boolean hardFall)`

  `void`

  `fallFromRope()`

  `void`

  `FireCheck()`

  `void`

  `flagForHotSave()`

  `private boolean`

  `forbidConcurrentAction(String action)`

  `void`

  `forceAwake()`

  `void`

  `forgetRecipes()`

  `<T> T`

  `get(zombie.ai.State.Param<T> state)`

  `<T> T`

  `get(zombie.ai.State.Param<T> state,
  T defaultT)`

  `float`

  `getAbsoluteExcessTwist()`

  `zombie.characters.action.ActionContext`

  `getActionContext()`

  `String`

  `getActionStateName()`

  `ArrayList<InventoryItem>`

  `getActiveLightItems(ArrayList<InventoryItem> items)`

  `zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator`

  `getAdvancedAnimator()`

  `int`

  `getAge()`

  `float`

  `getAimAtFloorAmount()`

  Returns the amount we need to aim dowrwards.

  `float`

  `getAimingDelay()`

  `zombie.input.AimingMode`

  `getAimingMode()`

  `float`

  `getAimOriginPosX()`

  `float`

  `getAimOriginPosY()`

  `float`

  `getAimOriginPosZ()`

  `protected float`

  `getAlphaUpdateRateMul()`

  `int`

  `getAlreadyReadPages(String fullType)`

  `float`

  `getAnimAngle()`

  `float`

  `getAnimAngleRadians()`

  `float`

  `getAnimAngleStepDelta()`

  `float`

  `getAnimAngleTwistDelta()`

  `zombie.core.skinnedmodel.advancedanimation.IAnimatable`

  `getAnimatable()`

  `String`

  `getAnimationDebug()`

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `getAnimationPlayer()`

  `String`

  `getAnimationStateName()`

  `float`

  `getAnimationTimeDelta()`

  `zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster`

  `getAnimEventBroadcaster()`

  `Vector2`

  `getAnimForwardDirection(Vector2 forwardDirection)`

  `String`

  `GetAnimSetName()`

  `Vector2`

  `getAnimVector(Vector2 animForwardDirection)`

  Deprecated.

  `protected float`

  `getAppetiteMultiplier()`

  `private float`

  `getArmsInjurySpeedModifier()`

  `InventoryItem`

  `getAttachedItem(String location)`

  `AttachedItems`

  `getAttachedItems()`

  `AttachedLocationGroup`

  `getAttachedLocationGroup()`

  `IsoGameCharacter`

  `getAttackedBy()`

  `HandWeapon`

  `getAttackingWeapon()`

  `IsoGridSquare`

  `getAttackTargetSquare()`

  `zombie.network.fields.hit.AttackVars`

  `getAttackVars()`

  `Vector2`

  `getAutoWalkDirection(Vector2 out)`

  `zombie.core.physics.BallisticsController`

  `getBallisticsController()`

  `zombie.core.physics.BallisticsTarget`

  `getBallisticsTarget()`

  `float`

  `getBarricadeStrengthMod()`

  `float`

  `getBarricadeTimeMod()`

  `IsoObject`

  `getBed()`

  `String`

  `getBedType()`

  `float`

  `getBeenMovingFor()`

  `float`

  `getBeenSprintingFor()`

  `float`

  `getBetaDelta()`

  `float`

  `getBetaEffect()`

  `float`

  `getBloodImpactX()`

  `float`

  `getBloodImpactY()`

  `float`

  `getBloodImpactZ()`

  `IsoSprite`

  `getBloodSplat()`

  `float`

  `getBlurFactor()`

  `BodyDamage`

  `getBodyDamage()`

  `BodyDamage`

  `getBodyDamageRemote()`

  `BodyLocationGroup`

  `getBodyLocationGroup()`

  `float`

  `getBodyPartClothingDefense(Integer part,
  boolean bite,
  boolean bullet)`

  `IsoGameCharacter`

  `getBumpedChr()`

  `String`

  `getBumpFallType()`

  `String`

  `getBumpType()`

  `IsoDirections`

  `getCardinalDirection()`

  `protected IsoDirections`

  `getCardinalDirectionTo(IsoGridSquare square,
  boolean north)`

  `Stack<zombie.characters.CharacterTimedActions.BaseAction>`

  `getCharacterActions()`

  `final zombie.characters.CharacterGender`

  `getCharacterGender()`

  `CharacterTraits`

  `getCharacterTraits()`

  `zombie.chat.ChatElement`

  `getChatElement()`

  `zombie.characters.PlayerCheats`

  `getCheats()`

  `float`

  `getChestHeight()`

  `float`

  `getChopTreeSpeed()`

  `String`

  `getClickSound()`

  `ClimbSheetRopeState.ClimbData`

  `getClimbData()`

  `float`

  `getClimbingFailChanceFloat()`

  `int`

  `getClimbingFailChanceInt()`

  `float`

  `getClimbRopeSpeed(boolean down)`

  `float`

  `getClimbRopeTime()`

  `float`

  `getClothingDiscomfortModifier()`

  `InventoryItem`

  `getClothingItem_Back()`

  `InventoryItem`

  `getClothingItem_Feet()`

  `InventoryItem`

  `getClothingItem_Hands()`

  `InventoryItem`

  `getClothingItem_Head()`

  `InventoryItem`

  `getClothingItem_Legs()`

  `InventoryItem`

  `getClothingItem_Torso()`

  `zombie.characters.ClothingWetness`

  `getClothingWetness()`

  `zombie.characters.ClothingWetnessSync`

  `getClothingWetnessSync()`

  `ArrayList<ItemContainer>`

  `getContainers()`

  `String`

  `getContainerToolTip(ItemContainer container)`

  `<T> PZArrayList<ItemContainer>`

  `getContextWorldContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate)`

  `<T> PZArrayList<ItemContainer>`

  `getContextWorldContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `<T> PZArrayList<ItemContainer>`

  `getContextWorldContainersInObjects(IsoObject[] contextObjects,
  T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `PZArrayList<ItemContainer>`

  `getContextWorldContainersWithHumanCorpse(IsoObject[] contextObjects)`

  `PZArrayList<ItemContainer>`

  `getContextWorldSuitableContainersToDropCorpseInObjects(IsoObject[] contextObjects)`

  `float`

  `getCorpseSicknessDefense()`

  `float`

  `getCorpseSicknessDefense(float rate)`

  `float`

  `getCorpseSicknessDefense(float rate,
  boolean drain)`

  `float`

  `getCorpseSicknessRate()`

  `String`

  `getCurrentActionContextStateName()`

  `BuildingDef`

  `getCurrentBuildingDef()`

  `RoomDef`

  `getCurrentRoomDef()`

  `zombie.ai.State`

  `getCurrentState()`

  `String`

  `getCurrentStateName()`

  `private void`

  `getCurrentTimedActionDeltaModifiers(MoveDeltaModifiers deltas)`

  `float`

  `getCurrentVerticalAimAngle()`

  Returns the desired aim angle, in degrees.

  `float`

  `getDangerLevels()`

  `AnimatorDebugMonitor`

  `getDebugMonitor()`

  `zombie.ai.State`

  `getDefaultState()`

  `float`

  `getDeferredAngleDelta()`

  `Vector2`

  `getDeferredMovement(Vector2 result)`

  `protected Vector2`

  `getDeferredMovement(Vector2 result,
  boolean reset)`

  `Vector3`

  `getDeferredMovementFromRagdoll(Vector3 result)`

  `float`

  `getDeferredRotationWeight()`

  `float`

  `getDepressDelta()`

  `float`

  `getDepressEffect()`

  `String`

  `getDescription(String separatorStr)`

  `SurvivorDesc`

  `getDescriptor()`

  `float`

  `getDetectionRange()`

  `int`

  `getDieCount()`

  `float`

  `getDirectionAngle()`

  `float`

  `getDirectionAngleRadians()`

  `float`

  `getDotWithForwardDirection(float targetX,
  float targetY)`

  `float`

  `getDotWithForwardDirection(Vector3 bonePos)`

  `float`

  `getEffectiveFatigue()`

  `BaseCharacterSoundEmitter`

  `getEmitter()`

  `Stack<IsoGameCharacter>`

  `getEnemyList()`

  `Radio`

  `getEquipedRadio()`

  `float`

  `getExcessTwist()`

  `zombie.characters.FallSeverity`

  `getFallSpeedSeverity()`

  `float`

  `getFallTime()`

  `Stack<IsoBuilding>`

  `getFamiliarBuildings()`

  `float`

  `getFatigueMod()`

  `double`

  `getFatiqueMultiplier()`

  `zombie.ai.astar.AStarPathFinderResult`

  `getFinder()`

  `float`

  `getFireKillRate()`

  `String`

  `getFireMode()`

  `int`

  `getFireSpreadProbability()`

  `zombie.audio.FMODParameterList`

  `getFMODParameters()`

  `IsoGameCharacter`

  `getFollowingTarget()`

  `protected float`

  `getFootInjurySpeedModifier()`

  `private String`

  `getFootInjuryType()`

  Return the type of foot injury, could be leftheavy, rightlight etc.

  `float`

  `getForceWakeUpTime()`

  `Vector2`

  `getForwardDirection()`

  Deprecated.

  Returns reference to internal memory.

  `Vector2`

  `getForwardDirection(Vector2 forwardDirection)`

  `float`

  `getForwardDirectionX()`

  `float`

  `getForwardDirectionY()`

  `IsoDirections`

  `getForwardMovementIsoDirection()`

  `float`

  `getFreeInventoryCapacity()`

  `String`

  `getFullName()`

  `Iterable<zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot>`

  `getGameVariables()`

  Returns all Game variables.

  `zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource`

  `getGameVariablesInternal()`

  `float`

  `getGlobalMovementMod(boolean bDoNoises)`

  `zombie.core.skinnedmodel.IGrappleable`

  `getGrappleable()`

  `float`

  `getHaloTimerCount()`

  `float`

  `getHammerSoundMod()`

  `float`

  `getHeadLookAngleMax()`

  `float`

  `getHeadLookHorizontal()`

  `float`

  `getHeadLookVertical()`

  `float`

  `getHealth()`

  `float`

  `getHearDistanceModifier()`

  `float`

  `getHeightAboveFloor()`

  `int`

  `getHitChancesMod()`

  `String`

  `getHitDirEnum()`

  `PZArrayList<zombie.network.fields.hit.HitInfo>`

  `getHitInfoList()`

  `String`

  `getHitReaction()`

  `zombie.characters.HitReactionNetworkAI`

  `getHitReactionNetworkAI()`

  `float`

  `getHittingMod()`

  `double`

  `getHoursSurvived()`

  `double`

  `getHungerMultiplier()`

  `String`

  `getHurtSound()`

  `float`

  `getHyperthermiaMod()`

  `float`

  `getIdleSquareTime()`

  `boolean`

  `getIgnoreMovement()`

  `float`

  `getImpactIsoSpeed()`

  `static ColorInfo`

  `getInf()`

  `ItemContainer`

  `getInventory()`

  `float`

  `getInventoryWeight()`

  `ItemVisuals`

  `getItemVisuals()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `List<String>`

  `getKnownRecipes()`

  `long`

  `getLastBump()`

  `ChatMessage`

  `getLastChatMessage()`

  `float`

  `getLastFallSpeed()`

  `IsoGameCharacter.Location`

  `getLastHeardSound()`

  `IsoGameCharacter`

  `getLastHitCharacter()`

  `int`

  `getLastHitCount()`

  `int`

  `getLastHourSleeped()`

  `HashMap<String, IsoGameCharacter.Location>`

  `getLastKnownLocation()`

  `IsoGameCharacter.Location`

  `getLastKnownLocationOf(String character)`

  `int`

  `getLastLocalEnemies()`

  `String`

  `getLastSpokenLine()`

  `int`

  `getLastZombieKills()`

  `float`

  `getLeaveBodyTimedown()`

  `IsoSprite`

  `getLegsSprite()`

  `int`

  `getLevelMaxForXp()`

  `static int[]`

  `getLevelUpLevels()`

  `int`

  `getLevelUpLevels(int level)`

  `float`

  `getLevelUpMultiplier()`

  `float`

  `getLightfootMod()`

  `IsoGameCharacter.LightInfo`

  `getLightInfo2()`

  `float`

  `getLlx()`

  `float`

  `getLly()`

  `float`

  `getLlz()`

  `Stack<IsoGameCharacter>`

  `getLocalEnemyList()`

  `ArrayList<IsoMovingObject>`

  `getLocalGroupList()`

  `ArrayList<IsoMovingObject>`

  `getLocalList()`

  `ArrayList<IsoMovingObject>`

  `getLocalNeutralList()`

  `ArrayList<IsoMovingObject>`

  `getLocalRelevantEnemyList()`

  `float`

  `getLookAngleRadians()`

  `float`

  `getLookDirectionX()`

  `float`

  `getLookDirectionY()`

  `Vector2`

  `getLookVector(Vector2 vector2)`

  `IsoGridSquare`

  `getLowDangerInVicinity(int attempts,
  int range)`

  `int`

  `getMaintenanceMod()`

  `MapKnowledge`

  `getMapKnowledge()`

  `float`

  `getMass()`

  `int`

  `getMaxChatLines()`

  `float`

  `getMaxTwist()`

  `int`

  `getMaxWeight()`

  `int`

  `getMaxWeightBase()`

  `int`

  `getMeleeCombatMod()`

  `float`

  `getMeleeDelay()`

  `float`

  `getMetalBarricadeStrengthMod()`

  `private int`

  `getMinFloorZ()`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `getModel()`

  `zombie.core.skinnedmodel.model.ModelInstance`

  `getModelInstance()`

  `float`

  `getMomentumScalar()`

  `Moodles`

  `getMoodles()`

  `float`

  `getMoveDelta()`

  `Vector2`

  `getMoveForwardVec()`

  `float`

  `getMovementSpeed()`

  `Object`

  `getMusicIntensityEventModData(String key)`

  `static void`

  `getNameCoords(float x,
  float y,
  float z,
  float offX,
  float offY,
  float zoom,
  Vector2 coord)`

  `BaseVehicle`

  `getNearVehicle()`

  `zombie.characters.NetworkCharacterAI`

  `getNetworkCharacterAI()`

  `Float`

  `getNextAnimationTranslationLength()`

  `int`

  `getNextWander()`

  `float`

  `getNimbleMod()`

  `int`

  `getNumSurvivorsInVicinity()`

  `int`

  `getNumTwistBones()`

  `zombie.ai.sadisticAIDirector.SleepingEventData`

  `getOrCreateSleepingEventData()`

  `String`

  `getOutfitName()`

  `zombie.core.raknet.UdpConnection`

  `getOwner()`

  `IsoPlayer`

  `getOwnerPlayer()`

  `float`

  `getPacingMod()`

  `float`

  `getPainDelta()`

  `float`

  `getPainEffect()`

  `zombie.pathfind.Path`

  `getPath2()`

  `PathFindBehavior2`

  `getPathFindBehavior2()`

  `int`

  `getPathIndex()`

  `int`

  `getPathTargetX()`

  `int`

  `getPathTargetY()`

  `int`

  `getPathTargetZ()`

  `int`

  `getPatience()`

  `int`

  `getPatienceMax()`

  `int`

  `getPatienceMin()`

  `IsoGameCharacter.PerkInfo`

  `getPerkInfo(PerkFactory.Perk perk)`

  `int`

  `getPerkLevel(PerkFactory.Perk perks)`

  `ArrayList<IsoGameCharacter.PerkInfo>`

  `getPerkList()`

  `float`

  `getPerkToUnit(PerkFactory.Perk perk)`

  `int`

  `getPersistentOutfitID()`

  `String`

  `getPreviousActionContextStateName()`

  `String`

  `getPreviousStateName()`

  `InventoryItem`

  `GetPrimaryEquippedCache()`

  `InventoryItem`

  `getPrimaryHandItem()`

  `String`

  `getPrimaryHandType()`

  `zombie.core.physics.RagdollController`

  `getRagdollController()`

  `zombie.core.skinnedmodel.population.Outfit`

  `getRandomDefaultOutfit()`

  `HashMap<String,Integer>`

  `getReadLiterature()`

  `HashSet<String>`

  `getReadPrintMedia()`

  `ArrayList<zombie.core.skinnedmodel.model.ModelInstance>`

  `getReadyModelData()`

  `int`

  `getReanimAnimDelay()`

  `int`

  `getReanimAnimFrame()`

  `IsoGameCharacter`

  `getReanimatedCorpse()`

  `float`

  `getReanimateTimer()`

  `float`

  `getRecoilDelay()`

  `float`

  `getRecoilVarX()`

  `float`

  `getRecoilVarY()`

  `float`

  `getRecoveryMod()`

  `float`

  `getReduceInfectionPower()`

  `int`

  `getRemoteID()`

  `private double`

  `getRunningThirstReduction()`

  `float`

  `getRunSpeedModifier()`

  `Safety`

  `getSafety()`

  `String`

  `getSayLine()`

  `InventoryItem`

  `GetSecondaryEquippedCache()`

  `InventoryItem`

  `getSecondaryHandItem()`

  `String`

  `getSecondaryHandType()`

  `float`

  `getShoulderTwist()`

  `float`

  `getShoulderTwistWeight()`

  Returns the amount of weight to be applied to the shoulder twist.

  `String`

  `getShoutItemModel()`

  `String`

  `getShoutType()`

  `float`

  `getShovingMod()`

  `IsoDirections`

  `getSitOnFurnitureDirection()`

  `IsoObject`

  `getSitOnFurnitureObject()`

  `float`

  `getSleepingTabletDelta()`

  `float`

  `getSleepingTabletEffect()`

  `float`

  `getSlowFactor()`

  `float`

  `getSlowTimer()`

  `float`

  `getSneakLimpSpeedScale()`

  `float`

  `getSneakSpotMod()`

  `private IsoGridSquare`

  `getSolidFloorAt(int x,
  int y,
  int z)`

  `Color`

  `getSpeakColour()`

  `float`

  `getSpeakTime()`

  `float`

  `getSpeedMod()`

  `float`

  `getSprintMod()`

  `IsoSpriteInstance`

  `getSpriteDef()`

  `float`

  `getStaggerTimeMod()`

  `zombie.ai.StateMachine`

  `getStateMachine()`

  `final StateMachineComponent`

  `getStateMachineComponent()`

  `Map<zombie.ai.State.Param<?>, Object>`

  `getStateMachineParams(Class<?> clazz)`

  `String`

  `getStatisticsDebug()`

  `Stats`

  `getStats()`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

  `getSubVariableSource(String subVariableSourceName)`

  get an internal VariableSource.

  `PZArrayList<ItemContainer>`

  `getSuitableContainersToDropCorpse()`

  `PZArrayList<ItemContainer>`

  `getSuitableContainersToDropCorpse(PZArrayList<ItemContainer> foundContainers)`

  `PZArrayList<ItemContainer>`

  `getSuitableContainersToDropCorpseInSquare(IsoGridSquare square)`

  `PZArrayList<ItemContainer>`

  `getSuitableContainersToDropCorpseInSquare(IsoGridSquare square,
  PZArrayList<ItemContainer> foundContainers)`

  `PZArrayList<ItemContainer>`

  `getSuitableContainersWithHumanCorpseInSquare(IsoGridSquare square)`

  `PZArrayList<ItemContainer>`

  `getSuitableContainersWithHumanCorpseInSquare(IsoGridSquare square,
  PZArrayList<ItemContainer> foundContainers)`

  `int`

  `getSurroundingAttackingZombies()`

  `int`

  `getSurroundingAttackingZombies(boolean includeCrawlers)`

  `int`

  `getSurvivorKills()`

  `static HashMap<Integer, SurvivorDesc>`

  `getSurvivorMap()`

  `String`

  `getTalkerType()`

  `Vector3f`

  `getTargetGrapplePos(Vector3f result)`

  `Vector3`

  `getTargetGrapplePos(Vector3 result)`

  `Vector2`

  `getTargetGrappleRotation(Vector2 result)`

  `float`

  `getTargetTwist()`

  `float`

  `getTargetVerticalAimAngle()`

  `static Vector2`

  `getTempo()`

  `static Vector2`

  `getTempo2()`

  `zombie.core.skinnedmodel.model.ModelInstanceTextureCreator`

  `getTextureCreator()`

  `double`

  `getThirstMultiplier()`

  `int`

  `getThreatLevel()`

  `float`

  `getTimedActionTimeModifier()`

  `float`

  `getTimeSinceLastSmoke()`

  `int`

  `getTimeThumping()`

  `float`

  `getTorchStrength()`

  `float`

  `getTotalBlood()`

  `float`

  `getTurnDelta()`

  `float`

  `getTwist()`

  `Stack<String>`

  `getUsedItemsOn()`

  `HandWeapon`

  `getUseHandWeapon()`

  `int`

  `getUserNameHeight()`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `getVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle handle)`

  Returns the specified variable slot.

  `String`

  `GetVariable(String key)`

  `BaseVehicle`

  `getVehicle()`

  `float`

  `getVehicleDiscomfortModifier()`

  `ArrayList<IsoMovingObject>`

  `getVeryCloseEnemyList()`

  `zombie.core.skinnedmodel.visual.BaseVisual`

  `getVisual()`

  `InventoryItem`

  `getWaterSource(ArrayList<InventoryItem> items)`

  `int`

  `getWeaponLevel()`

  `int`

  `getWeaponLevel(HandWeapon weapon)`

  `float`

  `getWeatherHearingMultiplier()`

  `static int`

  `getWeightAsCorpse()`

  `float`

  `getWeightMod()`

  `float`

  `getWeldingSoundMod()`

  `InventoryItem`

  `getWornItem(ItemBodyLocation itemBodyLocation)`

  `WornItems`

  `getWornItems()`

  `float`

  `getWornItemsHearingModifier()`

  `float`

  `getWornItemsHearingMultiplier()`

  `float`

  `getWornItemsVisionModifier()`

  `float`

  `getWornItemsVisionMultiplier()`

  `zombie.core.skinnedmodel.BaseGrappleable`

  `getWrappedGrappleable()`

  `IsoGameCharacter.XP`

  `getXp()`

  `int`

  `getXpForLevel(int level)`

  `int`

  `getZombieKills()`

  `protected void`

  `handleLandingImpact(zombie.characters.FallDamage fallDamage)`

  `boolean`

  `hasActiveModel()`

  `boolean`

  `hasAnimationPlayer()`

  `boolean`

  `hasAwkwardHands()`

  `boolean`

  `hasBloodyClothing(Integer part)`

  `boolean`

  `hasDirtyClothing(Integer part)`

  `boolean`

  `hasEquipped(String string)`

  `boolean`

  `hasEquippedTag(ItemTag itemTag)`

  `boolean`

  `hasFootInjury()`

  `boolean`

  `hasFullInventory()`

  `boolean`

  `hasHitReaction()`

  `boolean`

  `HasItem(String string)`

  `boolean`

  `hasItems(String type,
  int count)`

  `boolean`

  `hasPath()`

  `boolean`

  `hasReadMap(InventoryItem item)`

  `boolean`

  `hasRecipeAtHand(CraftRecipe recipe)`

  `boolean`

  `hasTimedActions()`

  `boolean`

  `hasTrait(CharacterTrait characterTrait)`

  `boolean`

  `hasTrait(CharacterTrait... characterTrait)`

  `boolean`

  `hasWornTag(ItemTag itemTag)`

  `boolean`

  `helmetFall(boolean hitHead)`

  `private boolean`

  `helmetFallFromWornItems(boolean hitHead)`

  `float`

  `Hit(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damageSplit,
  boolean bIgnoreDamage,
  float modDelta)`

  `float`

  `Hit(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damageSplit,
  boolean bIgnoreDamage,
  float modDelta,
  boolean bRemote)`

  `float`

  `Hit(BaseVehicle vehicle,
  float speed,
  boolean isHitFromBehind,
  float hitDirX,
  float hitDirY,
  boolean pushedBack,
  float collisionPosOnVehicleX,
  float collisionPosOnVehicleY)`

  `void`

  `hitConsequences(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean bIgnoreDamage,
  float damage,
  boolean bRemote)`

  `void`

  `initAttachedItems(String groupName)`

  `IsoGameCharacter.LightInfo`

  `initLightInfo2()`

  `void`

  `InitSpriteParts(SurvivorDesc desc)`

  `void`

  `initSpritePartsEmpty()`

  `protected void`

  `initTextObjects()`

  `void`

  `initWornItems(String bodyLocationGroupName)`

  `private void`

  `invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent globalEvent)`

  `private void`

  `invokeOnDiedListeners(IsoDeadBody body)`

  `boolean`

  `isAboveTopOfStairs()`

  `boolean`

  `isActuallyAttackingWithMeleeWeapon()`

  `boolean`

  `isAddedToModelManager()`

  `boolean`

  `isAimAtFloor()`

  `boolean`

  `isAiming()`

  `boolean`

  `isAimingFirearmEquipped()`

  `boolean`

  `isAlive()`

  `boolean`

  `isAllowConversation()`

  `boolean`

  `isAlwaysDayCheat()`

  `boolean`

  `isAnimal()`

  `boolean`

  `isAnimalCheat()`

  `boolean`

  `isAnimalExtraValuesCheat()`

  `boolean`

  `isAnimalRunningToDeathPosition()`

  `boolean`

  `isAnimatingBackwards()`

  `boolean`

  `isAnimationUpdatingThisFrame()`

  `boolean`

  `isAnimForecasted()`

  `boolean`

  `isAsleep()`

  `boolean`

  `isAttachedItem(InventoryItem item)`

  `boolean`

  `isAttacking()`

  `boolean`

  `IsAttackRange(float x,
  float y,
  float z)`

  `boolean`

  `isAutoWalk()`

  `boolean`

  `isbDoDefer()`

  `boolean`

  `isBehaviourMoving()`

  `boolean`

  `isBehind(IsoGameCharacter chr)`

  `boolean`

  `isBeingSteppedOn()`

  `boolean`

  `isbFalling()`

  `boolean`

  `isbOnBed()`

  Deprecated.

  `boolean`

  `isBuildCheat()`

  `boolean`

  `isBumpDone()`

  `boolean`

  `isBumped()`

  `boolean`

  `isBumpFall()`

  `boolean`

  `isBumpStaggered()`

  `boolean`

  `isbUseParts()`

  `boolean`

  `isCanShout()`

  `boolean`

  `isCanUseBrushTool()`

  `boolean`

  `isCheatSet(CheatType cheat)`

  `boolean`

  `isClimbing()`

  `boolean`

  `isClimbingRope()`

  `boolean`

  `isClimbingThroughWindow(IsoWindow window)`

  `boolean`

  `isClosingWindow(IsoWindow window)`

  `boolean`

  `isCriticalHit()`

  `boolean`

  `isCurrentActionAllowedWhileDraggingCorpses()`

  `boolean`

  `isCurrentActionPathfinding()`

  `boolean`

  `isCurrentGameClientState(zombie.ai.State state)`

  `boolean`

  `isCurrentlyBusy()`

  `boolean`

  `isCurrentlyIdle()`

  `boolean`

  `isCurrentState(zombie.ai.State state)`

  `boolean`

  `isDead()`

  `boolean`

  `isDeathDragDown()`

  `boolean`

  `isDeferredMovementEnabled()`

  `boolean`

  `isDisguised()`

  `boolean`

  `isDoDeathSound()`

  `boolean`

  `isDoingActionThatCanBeCancelled()`

  `boolean`

  `isDoStomp()`

  `boolean`

  `isDraggingCorpse()`

  `boolean`

  `isDriving()`

  `protected boolean`

  `isDuplicateBodyVisual(ItemVisual itemVisual)`

  `boolean`

  `isEditingRagdoll()`

  `boolean`

  `isEnduranceSufficientForAction()`

  `boolean`

  `isEquipped(InventoryItem item)`

  `boolean`

  `isEquippedClothing(InventoryItem item)`

  `boolean`

  `isFacingLocation(float x,
  float y,
  float dot)`

  `private boolean`

  `isFacingNorthWesterly()`

  `boolean`

  `isFacingObject(IsoObject object,
  float dot)`

  `final boolean`

  `isFalling()`

  `boolean`

  `isFallOnFront()`

  `boolean`

  `isFarmingCheat()`

  `boolean`

  `isFastMoveCheat()`

  `final boolean`

  `isFemale()`

  `boolean`

  `isFishingCheat()`

  `boolean`

  `isFullyRagdolling()`

  `boolean`

  `isGodMod()`

  `boolean`

  `isGrappleThrowIntoContainer()`

  `boolean`

  `isGrappleThrowOutWindow()`

  `boolean`

  `isGrappleThrowOverFence()`

  `boolean`

  `isHandItem(InventoryItem item)`

  `protected boolean`

  `isHandModelOverriddenByCurrentCharacterAction()`

  `boolean`

  `isHeadLookAround()`

  `boolean`

  `isHealthCheat()`

  `boolean`

  `isHeavyItem(InventoryItem item)`

  `boolean`

  `isHideEquippedHandL()`

  `boolean`

  `isHideEquippedHandR()`

  `boolean`

  `isHideWeaponModel()`

  `boolean`

  `isHitFromBehind()`

  `boolean`

  `isIgnoreMovementForDirection()`

  Deprecated.

  `boolean`

  `isIgnoreStaggerBack()`

  `boolean`

  `isImpactFromBehind(float impactDirX,
  float impactDirY)`

  `static boolean`

  `isImpactFromBehind(float chrForwardX,
  float chrForwardY,
  float impactDirX,
  float impactDirY)`

  `boolean`

  `isImpactFromBehind(Vector2 impactDir)`

  `boolean`

  `isInARoom()`

  `private boolean`

  `isInCombat()`

  `private boolean`

  `isInGrapplerState()`

  `boolean`

  `isInTrees()`

  `boolean`

  `isInTrees2(boolean ignoreBush)`

  `boolean`

  `isInTreesNoBush()`

  `boolean`

  `isInventive()`

  `boolean`

  `isInvincible()`

  Currently only used for animals, use godMod for players

  `boolean`

  `isInvisible()`

  `boolean`

  `isInvulnerable()`

  `boolean`

  `isItemInBothHands(InventoryItem item)`

  `boolean`

  `isKilledByFall()`

  `boolean`

  `isKilledBySlicingWeapon()`

  `boolean`

  `isKnockedDown()`

  `boolean`

  `isKnowAllRecipes()`

  `boolean`

  `isKnownMediaLine(String guid)`

  `boolean`

  `isKnownPoison(InventoryItem item)`

  `boolean`

  `isKnownPoison(Item item)`

  `boolean`

  `isLastCollidedN()`

  `boolean`

  `isLastCollidedW()`

  `boolean`

  `isLiteratureRead(String name)`

  `final boolean`

  `isLocal()`

  `boolean`

  `isMaskClicked(int x,
  int y,
  boolean flip)`

  `boolean`

  `isMechanicsCheat()`

  `boolean`

  `isMeleeAttackRange(HandWeapon handWeapon,
  IsoMovingObject isoMovingObject,
  Vector3 bonePos)`

  `boolean`

  `isMeleeWeaponEquipped()`

  `boolean`

  `isMovablesCheat()`

  `boolean`

  `isMoving()`

  `boolean`

  `isNearSirenVehicle()`

  `boolean`

  `isNetworkVehicleCollisionActive(BaseVehicle testVehicle)`

  `boolean`

  `isNpc()`

  `boolean`

  `isObjectBehind(IsoObject obj)`

  `boolean`

  `isOnBack()`

  `boolean`

  `isOnBed()`

  `boolean`

  `isOnDeathDone()`

  `boolean`

  `isOnFire()`

  `boolean`

  `isOnKillDone()`

  `boolean`

  `isOutside()`

  `boolean`

  `isOverEncumbered()`

  `boolean`

  `isPathing()`

  `boolean`

  `isPerformingAttackAnimation()`

  `boolean`

  `isPerformingGrappleAnimation()`

  `boolean`

  `isPerformingHostileAnimation()`

  `boolean`

  `isPerformingNoAimShortStrafe()`

  `boolean`

  `isPerformingShoveAnimation()`

  `boolean`

  `isPerformingStompAnimation()`

  `boolean`

  `isPersistentOutfitInit()`

  `boolean`

  `isPlayerMoving()`

  `boolean`

  `isPlayingDeathSound()`

  `boolean`

  `isPrimaryEquipped(String item)`

  `boolean`

  `isPrimaryHandItem(InventoryItem item)`

  `protected boolean`

  `isPrimaryHandModelReady()`

  `boolean`

  `isPrintMediaRead(String mediaId)`

  `boolean`

  `isProtectedFromToxic()`

  `boolean`

  `isProtectedFromToxic(boolean drain)`

  `boolean`

  `isPushedByForSeparate(IsoMovingObject other)`

  `boolean`

  `isRagdoll()`

  `boolean`

  `isRagdollFall()`

  `boolean`

  `isRagdollSimulationActive()`

  `boolean`

  `isRangedWeaponEmpty()`

  `boolean`

  `isRangedWeaponEquipped()`

  `private boolean`

  `isRangedWeaponReady()`

  `boolean`

  `isReading()`

  `boolean`

  `isReanim()`

  `boolean`

  `isRecipeActuallyKnown(String name)`

  `boolean`

  `isRecipeActuallyKnown(CraftRecipe recipe)`

  `boolean`

  `isRecipeKnown(String name)`

  `boolean`

  `isRecipeKnown(String name,
  boolean ignoreSandbox)`

  `boolean`

  `isRecipeKnown(CraftRecipe recipe)`

  `boolean`

  `isRecipeKnown(CraftRecipe recipe,
  boolean ignoreSandbox)`

  `boolean`

  `isRecipeKnown(Recipe recipe)`

  `final boolean`

  `isRemote()`

  `boolean`

  `isResting()`

  `boolean`

  `isRunning()`

  `boolean`

  `isSeatedInVehicle()`

  `boolean`

  `isSecondaryHandItem(InventoryItem item)`

  `boolean`

  `isShoveStompAnim()`

  `boolean`

  `isShoving()`

  `boolean`

  `isShowAdminTag()`

  `boolean`

  `isSitOnFurnitureObject(IsoObject object)`

  `boolean`

  `isSitOnGround()`

  `boolean`

  `isSitting()`

  `boolean`

  `isSittingOnFurniture()`

  `boolean`

  `isSkipResolveCollision()`

  Should this character ignore collision resolutions.

  `boolean`

  `isSneaking()`

  `boolean`

  `isSpeaking()`

  `boolean`

  `IsSpeaking()`

  `boolean`

  `IsSpeakingNPC()`

  `boolean`

  `isSprinting()`

  `boolean`

  `isStaggerBack()`

  `boolean`

  `isStrafing()`

  `boolean`

  `isTimedActionInstant()`

  `boolean`

  `isTimedActionInstantCheat()`

  `boolean`

  `isTurning()`

  `boolean`

  `isTurning90()`

  `boolean`

  `isTurningAround()`

  `boolean`

  `isTwisting()`

  `boolean`

  `isUnarmed()`

  `boolean`

  `isUnderVehicle()`

  `boolean`

  `isUnderVehicleRadius(float radius)`

  `boolean`

  `isUnlimitedAmmo()`

  `boolean`

  `isUnlimitedCarry()`

  `boolean`

  `isUnlimitedEndurance()`

  `protected boolean`

  `isUpdateAlphaDuringRender()`

  `boolean`

  `isUpright()`

  `boolean`

  `isUsingWornItems()`

  `boolean`

  `isVehicleCollision()`

  `boolean`

  `isVisibleToNPCs()`

  `boolean`

  `isWeaponReady()`

  `boolean`

  `isWearingAwkwardGloves()`

  `boolean`

  `isWearingGlasses()`

  `boolean`

  `isWearingGloves()`

  `boolean`

  `isWearingTag(ItemTag itemTag)`

  `boolean`

  `isWearingVisualAid()`

  `boolean`

  `isZombie()`

  `boolean`

  `isZombieAttacking()`

  `boolean`

  `isZombieAttacking(IsoMovingObject other)`

  `boolean`

  `isZombiesDontAttack()`

  `private boolean`

  `isZombieThumping()`

  `final void`

  `Kill(IsoGameCharacter killer)`

  `final void`

  `Kill(IsoGameCharacter killer,
  boolean bGory)`

  `final void`

  `Kill(IsoGameCharacter killer,
  HandWeapon attackingWeapon,
  boolean isGory,
  zombie.characters.CharacterDiedListener onDiedListener)`

  `final void`

  `Kill(HandWeapon handWeapon,
  IsoGameCharacter killer)`

  `boolean`

  `learnRecipe(String name)`

  `boolean`

  `learnRecipe(String name,
  boolean checkMetaRecipe)`

  `void`

  `level0(PerkFactory.Perk perk)`

  `void`

  `LevelPerk(PerkFactory.Perk perk)`

  `void`

  `LevelPerk(PerkFactory.Perk perk,
  boolean removePick)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `protected void`

  `loadKnownMediaLines(ByteBuffer bb,
  int worldVersion)`

  `void`

  `LoseLevel(PerkFactory.Perk perk)`

  `void`

  `modifyTraitXPBoost(CharacterTraitDefinition trait,
  boolean isRemovingTrait)`

  `void`

  `modifyTraitXPBoost(CharacterTrait characterTrait,
  boolean isRemovingTrait)`

  `void`

  `MoveForward(float dist,
  float x,
  float y,
  float soundDelta)`

  `float`

  `nearbyZombieClimbPenalty()`

  `void`

  `OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer sender,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_ClearVariable(IsoGameCharacter owner,
  String variableName)`

  `private void`

  `OnAnimEvent_DamageWhileInTrees(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_FallOnFront(IsoGameCharacter owner,
  boolean fallOnFront)`

  `private void`

  `OnAnimEvent_Footstep(IsoGameCharacter owner,
  String type)`

  `private void`

  `OnAnimEvent_GrapplerLetGo(IsoGameCharacter owner,
  String grappleResult)`

  `protected void`

  `OnAnimEvent_IsAlmostUp(IsoGameCharacter owner)`

  `protected void`

  `OnAnimEvent_KilledByAttacker(IsoGameCharacter owner)`

  `private void`

  `OnAnimEvent_PlaySound(IsoGameCharacter owner,
  String file)`

  `private void`

  `OnAnimEvent_PlaySoundNoBlend(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_SetKnockedDown(IsoGameCharacter owner,
  boolean knockedDown)`

  `private void`

  `OnAnimEvent_SetOnFloor(IsoGameCharacter owner,
  boolean onFloor)`

  `private void`

  `OnAnimEvent_SetSharedGrappleType(IsoGameCharacter owner,
  String sharedGrappleType)`

  `private void`

  `OnAnimEvent_SetVariable(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference animReference,
  String variableValue)`

  `private void`

  `OnAnimEvent_TurnAround(IsoGameCharacter owner,
  boolean instant)`

  `private void`

  `OnAnimEvent_TurnAroundFlipSkeleton(IsoGameCharacter owner,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  String boneName)`

  `protected void`

  `onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)`

  `void`

  `OnClothingUpdated()`

  `void`

  `OnDeath()`

  `boolean`

  `onDeath_ShouldDoSplatterAndSounds(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean isGory)`

  `private void`

  `onDied(IsoGameCharacter sender,
  IsoDeadBody body)`

  `void`

  `OnEquipmentUpdated()`

  `void`

  `onFireLightSourceCheck()`

  `private void`

  `onGrappleBegin()`

  `private void`

  `onGrappleEnded()`

  `float`

  `onHitByVehicle(BaseVehicle vehicle,
  float impactSpeed,
  Vector2 hitDir,
  Vector2 impactPosOnVehicle)`

  `float`

  `onHitByVehicleApplyDamage(BaseVehicle vehicle,
  float impactSpeed)`

  `protected void`

  `onHitByVehicleDriver(IsoGameCharacter vehicleDriver)`

  Called from onHitByVehicle   
  Handles what to do about the vehicle's driver.

  `void`

  `onKilled(IsoGameCharacter killer,
  HandWeapon attackingWeapon,
  boolean isGory)`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `void`

  `onRagdollSimulationStarted()`

  `protected void`

  `onTrigger_setAnimStateToTriggerFile(zombie.characters.AnimStateTriggerXmlFile triggerXml)`

  `protected void`

  `onTrigger_setClothingToXmlTriggerFile(zombie.characters.TriggerXmlFile triggerXml)`

  `void`

  `onWornItemsChanged()`

  `void`

  `openWindow(IsoWindow w)`

  `void`

  `PainMeds(float delta)`

  `protected void`

  `pathToAux(float x,
  float y,
  float z)`

  `void`

  `pathToCharacter(IsoGameCharacter target)`

  `void`

  `pathToLocation(int x,
  int y,
  int z)`

  `void`

  `pathToLocationF(float x,
  float y,
  float z)`

  `void`

  `pathToSound(int x,
  int y,
  int z)`

  `void`

  `pickUpCorpse(IsoDeadBody body,
  String dragType)`

  `void`

  `pickUpCorpseItem(InventoryItem item)`

  `void`

  `PlayAnim(String string)`

  `void`

  `PlayAnimUnlooped(String string)`

  `void`

  `PlayAnimWithSpeed(String string,
  float framesSpeedPerFrame)`

  `zombie.characters.action.ActionStateSnapshot`

  `playbackRecordCurrentStateSnapshot()`

  `void`

  `playbackSetCurrentStateSnapshot(zombie.characters.action.ActionStateSnapshot snapshot)`

  `void`

  `playBloodSplatterSound()`

  `void`

  `playDeadSound()`

  `long`

  `playDropItemSound(InventoryItem item)`

  `void`

  `playEmote(String emote)`

  `protected boolean`

  `playerIsSelf()`

  `long`

  `playHurtSound()`

  `protected void`

  `playPainVoicesFromFallDamage(zombie.characters.FallDamage fallDamage)`

  `long`

  `playSound(String file)`

  `long`

  `playSoundLocal(String file)`

  `long`

  `playWeaponHitArmourSound(int partIndex,
  boolean bullet)`

  `void`

  `postAnimationFinishing(String state)`

  `protected void`

  `postHitByVehicleUpdateStance(float speed,
  boolean knockDownAllowed)`

  Update our reaction stance after a vehicle impact.

  `void`

  `postupdate()`

  `private void`

  `postUpdateAnimating()`

  `void`

  `postUpdateEquippedTextures()`

  `private void`

  `postUpdateInternal()`

  `void`

  `postUpdateModelTextures()`

  `void`

  `preupdate()`

  `float`

  `processHitDamage(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damageSplit,
  boolean bIgnoreDamage,
  float modDelta)`

  `private float`

  `processInstantExplosionHitDamage(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damage,
  boolean bIgnoreDamage,
  float modDelta)`

  `private void`

  `ProcessSay(String line,
  float r,
  float g,
  float b,
  float baseRange,
  int channel,
  String customTag)`

  `void`

  `QueueAction(zombie.characters.CharacterTimedActions.BaseAction act)`

  `private void`

  `radioEquipedCheck()`

  `void`

  `readInventory(zombie.core.network.ByteBufferReader b)`

  `void`

  `ReadLiterature(Literature literature)`

  `private void`

  `recursiveItemUpdater(ItemContainer container)`

  `private void`

  `recursiveItemUpdater(InventoryContainer container)`

  `void`

  `ReduceHealthWhenBurning()`

  `protected void`

  `registerAIState(String name,
  zombie.ai.State aiState)`

  `private void`

  `registerAnimEventCallbacks()`

  `private void`

  `registerDebugGameVariables()`

  `void`

  `registerECSComponents()`

  `private void`

  `registerVariableCallbacks()`

  `void`

  `releaseAnimationPlayer()`

  `void`

  `releaseBallisticsController()`

  `void`

  `releaseBallisticsTarget()`

  `void`

  `releaseRagdollController()`

  `void`

  `reloadOutfit()`

  `<T> T`

  `remove(zombie.ai.State.Param<T> state)`

  `void`

  `removeAttachedItem(InventoryItem item)`

  `boolean`

  `removeFromHands(InventoryItem item)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeKnownMediaLine(String guid)`

  `void`

  `removeOnFireLightSource()`

  `void`

  `removeWornItem(InventoryItem item)`

  `void`

  `removeWornItem(InventoryItem item,
  boolean forceDropTooHeavy)`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoChild,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `private void`

  `renderDebugData()`

  `void`

  `renderlast()`

  `void`

  `renderObjectPicker(float x,
  float y,
  float z,
  ColorInfo lightInfo)`

  `void`

  `renderServerGUI()`

  `void`

  `renderShadow(float x,
  float y,
  float z)`

  `protected boolean`

  `renderTextureInsteadOfModel(float x,
  float y)`

  `void`

  `reportEvent(String name)`

  `void`

  `resetAimingDelay()`

  `void`

  `resetBeardGrowingTime()`

  `void`

  `resetBodyDamageRemote()`

  `void`

  `resetEquippedHandsModels()`

  `void`

  `resetHairGrowingTime()`

  `void`

  `resetModel()`

  `void`

  `resetModelNextFrame()`

  `private boolean`

  `resolveCollisionWithNeighboringSquares(float inRadius,
  Vector2f newPos)`

  `private void`

  `restoreAnimatorStateToActionContext()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `protected void`

  `saveKnownMediaLines(ByteBuffer bb)`

  `void`

  `Say(String line)`

  `void`

  `Say(String line,
  float r,
  float g,
  float b,
  UIFont font,
  float baseRange,
  String customTag)`

  `void`

  `SayDebug(int n,
  String text)`

  `void`

  `SayDebug(String text)`

  `void`

  `SayRadio(String line,
  float r,
  float g,
  float b,
  UIFont font,
  float baseRange,
  int channel,
  String customTag)`

  `void`

  `SayShout(String line)`

  `void`

  `SayWhisper(String line)`

  `void`

  `Seen(Stack<IsoMovingObject> seenList)`

  `<T> void`

  `set(zombie.ai.State.Param<T> state,
  T value)`

  `void`

  `setAddedToModelManager(zombie.core.skinnedmodel.ModelManager modelManager,
  boolean isAdded)`

  Callback from ModelManager.Add/Remove functions.

  `void`

  `setAge(int age)`

  `void`

  `setAimAtFloor(boolean aimAtFloor)`

  `void`

  `setAimAtFloor(boolean aimAtFloor,
  float targetDistance)`

  `void`

  `setAimingDelay(float aimingDelay)`

  `void`

  `setAllowConversation(boolean allowConversation)`

  `void`

  `setAlreadyReadPages(String fullType,
  int pages)`

  `void`

  `setAlwaysDayCheat(boolean b)`

  `void`

  `setAnimalCheat(boolean b)`

  `void`

  `setAnimalExtraValuesCheat(boolean b)`

  `void`

  `setAnimated(boolean b)`

  `void`

  `setAnimatingBackwards(boolean isAnimatingBackwards)`

  `void`

  `setAnimForecasted(int timeMs)`

  `void`

  `setAsleep(boolean asleep)`

  `void`

  `setAttachedItem(String location,
  InventoryItem item)`

  `void`

  `setAttachedItems(AttachedItems other)`

  `void`

  `setAttackedBy(IsoGameCharacter attackedBy)`

  `void`

  `setAttackTargetSquare(IsoGridSquare attackTargetSquare)`

  `void`

  `setAutoWalk(boolean b)`

  `void`

  `setAutoWalkDirection(Vector2 v)`

  `void`

  `setAvoidDamage(boolean avoid)`

  `void`

  `setbClimbing(boolean climbing)`

  `void`

  `setbDoDefer(boolean doDefer)`

  `void`

  `setBed(IsoObject bed)`

  `void`

  `setBedType(String bedType)`

  `void`

  `setBeenMovingFor(float beenMovingFor)`

  `void`

  `setBeenSprintingFor(float beenSprintingFor)`

  `void`

  `setBetaDelta(float betaDelta)`

  `void`

  `setBetaEffect(float betaEffect)`

  `void`

  `setbFalling(boolean falling)`

  `void`

  `setBloodImpactX(float bloodImpactX)`

  `void`

  `setBloodImpactY(float bloodImpactY)`

  `void`

  `setBloodImpactZ(float bloodImpactZ)`

  `void`

  `setBloodSplat(IsoSprite bloodSplat)`

  `void`

  `setbOnBed(boolean onBed)`

  Deprecated.

  `void`

  `setBuildCheat(boolean buildCheat)`

  `void`

  `setBumpDone(boolean val)`

  `void`

  `setBumpedChr(IsoGameCharacter bumpedChr)`

  `void`

  `setBumpFall(boolean val)`

  `void`

  `setBumpFallType(String val)`

  `void`

  `setBumpStaggered(boolean val)`

  `void`

  `setBumpType(String bumpType)`

  `void`

  `setbUseParts(boolean useParts)`

  `void`

  `setCanShout(boolean canShout)`

  `void`

  `setCanUseBrushTool(boolean b)`

  `void`

  `setCanUseDebugContextMenu(boolean b)`

  `void`

  `setCanUseLootLog(boolean b)`

  `void`

  `setCanUseLootZed(boolean b)`

  `final void`

  `setCharacterGender(zombie.characters.CharacterGender characterGender)`

  `void`

  `setClickSound(String clickSound)`

  `void`

  `setClimbData(ClimbSheetRopeState.ClimbData climbData)`

  `void`

  `setClimbRopeTime(float time)`

  `void`

  `setClothingItem_Back(InventoryItem item)`

  `void`

  `setClothingItem_Feet(InventoryItem item)`

  `void`

  `setClothingItem_Hands(InventoryItem item)`

  `void`

  `setClothingItem_Head(InventoryItem item)`

  `void`

  `setClothingItem_Legs(InventoryItem item)`

  `void`

  `setClothingItem_Torso(InventoryItem item)`

  `void`

  `setCorpseSicknessRate(float rate)`

  `void`

  `setCriticalHit(boolean isCrit)`

  `void`

  `setCurrentVerticalAimAngle(float verticalAimAngleDegrees)`

  `void`

  `setDangerLevels(float dangerLevels)`

  `void`

  `setDeathDragDown(boolean dragDown)`

  `void`

  `setDebugMonitor(AnimatorDebugMonitor monitor)`

  `void`

  `setDefaultState()`

  `void`

  `setDefaultState(zombie.ai.State defaultState)`

  `void`

  `setDeferredMovementEnabled(boolean deferredMovementEnabled)`

  `void`

  `setDelayToSleep(float delay)`

  `void`

  `setDepressDelta(float depressDelta)`

  `void`

  `setDepressEffect(float depressEffect)`

  `void`

  `setDescriptor(SurvivorDesc descriptor)`

  `void`

  `setDieCount(int dieCount)`

  `void`

  `setDirectionAngle(float angleDegrees)`

  `void`

  `setDoDeathSound(boolean doDeathSound)`

  `void`

  `setEditingRagdoll(boolean value)`

  `protected void`

  `setEquipParent(InventoryItem handItem,
  InventoryItem newHandItem)`

  `protected void`

  `setEquipParent(InventoryItem handItem,
  InventoryItem newHandItem,
  boolean register)`

  `void`

  `setFallOnFront(boolean fallOnFront)`

  `void`

  `setFallTime(float fallTime)`

  `void`

  `setFarmingCheat(boolean b)`

  `void`

  `setFastMoveCheat(boolean b)`

  `final void`

  `setFemale(boolean isFemale)`

  `void`

  `setFireKillRate(float fireKillRate)`

  `void`

  `setFireMode(String fireMode)`

  `void`

  `setFireSpreadProbability(int fireSpreadProbability)`

  `void`

  `setFishingCheat(boolean b)`

  `void`

  `setFollowingTarget(IsoGameCharacter followingTarget)`

  `void`

  `setForceWakeUpTime(float forceWakeUpTime)`

  `void`

  `setForwardDirection(float directionX,
  float directionY)`

  `void`

  `setForwardDirection(Vector2 dir)`

  `void`

  `setForwardDirectionFromAnimAngle()`

  `void`

  `setForwardDirectionFromIsoDirection()`

  `void`

  `setForwardIsoDirection(IsoDirections directions)`

  `void`

  `setGodMod(boolean b)`

  `void`

  `setGodMod(boolean b,
  boolean isForced)`

  `private void`

  `setGodModCheat(boolean enabled)`

  `void`

  `setGrappleThrowIntoContainer(boolean newValue)`

  `void`

  `setGrappleThrowOutWindow(boolean newValue)`

  `void`

  `setGrappleThrowOverFence(boolean newValue)`

  `void`

  `setHaloNote(String str)`

  `void`

  `setHaloNote(String str,
  float dispTime)`

  `void`

  `setHaloNote(String str,
  int r,
  int g,
  int b,
  float dispTime)`

  `void`

  `setHeadLookAround(boolean b)`

  `void`

  `setHeadLookAroundDirection(float lookHorizontal,
  float lookVertical)`

  `void`

  `setHealth(float health)`

  `void`

  `setHealthCheat(boolean healthCheat)`

  `void`

  `setHideEquippedHandL(boolean hideEquippedHandL)`

  `void`

  `setHideEquippedHandR(boolean hideEquippedHandR)`

  `void`

  `setHideWeaponModel(boolean hideWeaponModel)`

  `void`

  `setHitDir(Vector2 hitDir)`

  `private void`

  `setHitDirEnum(String hitDirEnum)`

  `void`

  `setHitFromBehind(boolean hitFromBehind)`

  `void`

  `setHitReaction(String hitReaction)`

  `void`

  `setHurtSound(String hurtSound)`

  `void`

  `setIgnoreMovement(boolean ignoreMovement)`

  `void`

  `setIgnoreStaggerBack(boolean ignoreStaggerBack)`

  `void`

  `setInventory(ItemContainer inventory)`

  `void`

  `setInvincible(boolean invincible)`

  Currently only used for animals, use godMod for players

  `void`

  `setInvisible(boolean b)`

  `void`

  `setInvisible(boolean b,
  boolean isForced)`

  `void`

  `setInvulnerable(boolean invulnerable)`

  `void`

  `setIsAiming(boolean isAiming)`

  `void`

  `setIsAnimal(boolean v)`

  `void`

  `setIsResting(boolean isResting)`

  `void`

  `setKilledByFall(boolean killedByFall)`

  `void`

  `setKnockedDown(boolean knockedDown)`

  `void`

  `setKnowAllRecipes(boolean knowAllRecipes)`

  `void`

  `setLastBump(long lastBump)`

  `void`

  `setLastChatMessage(ChatMessage lastChatMessage)`

  `void`

  `setLastCollidedN(boolean lastCollidedN)`

  `void`

  `setLastCollidedW(boolean lastCollidedW)`

  `void`

  `setLastFallSpeed(float lastFallSpeed)`

  `void`

  `setLastHeardSound(int x,
  int y,
  int z)`

  `void`

  `setLastHitCharacter(IsoGameCharacter character)`

  `void`

  `setLastHitCount(int hitCount)`

  `void`

  `setLastHourSleeped(int lastHourSleeped)`

  `void`

  `setLastLocalEnemies(int lastLocalEnemies)`

  `void`

  `setLastSpokenLine(String line)`

  `void`

  `setLastZombieKills(int lastZombieKills)`

  `void`

  `setLeaveBodyTimedown(float leaveBodyTimedown)`

  `void`

  `setLegsSprite(IsoSprite legsSprite)`

  `void`

  `setLevelUpMultiplier(float levelUpMultiplier)`

  `void`

  `setLlx(float llx)`

  `void`

  `setLly(float lly)`

  `void`

  `setLlz(float llz)`

  `void`

  `setMaxTwist(float degrees)`

  `void`

  `setMaxWeight(int maxWeight)`

  `void`

  `setMaxWeightBase(int maxWeightBase)`

  `void`

  `setMechanicsCheat(boolean mechanicsCheat)`

  `void`

  `setMeleeDelay(float delay)`

  `void`

  `setMetabolicTarget(float target)`

  `void`

  `setMetabolicTarget(Metabolics m)`

  `void`

  `setMomentumScalar(float val)`

  `void`

  `setMovablesCheat(boolean b)`

  `void`

  `setMoveDelta(float moveDelta)`

  `void`

  `setMoveForwardVec(Vector2 moveForwardVec)`

  `void`

  `setMoving(boolean val)`

  `void`

  `setMusicIntensityEventModData(String key,
  Object value)`

  `void`

  `setNextWander(int nextWander)`

  `void`

  `setNumSurvivorsInVicinity(int numSurvivorsInVicinity)`

  `void`

  `setOnBed(boolean bOnBed)`

  `void`

  `setOnDeathDone(boolean done)`

  `void`

  `setOnFire(boolean onFire)`

  `void`

  `SetOnFire()`

  `void`

  `setOnKillDone(boolean done)`

  `void`

  `setOwner(zombie.core.raknet.UdpConnection connection)`

  `void`

  `setOwnerPlayer(IsoPlayer player)`

  `void`

  `setPainDelta(float painDelta)`

  `void`

  `setPainEffect(float painEffect)`

  `void`

  `setPath2(zombie.pathfind.Path path)`

  `void`

  `setPathIndex(int pathIndex)`

  `void`

  `setPathing(boolean pathing)`

  `void`

  `setPathSpeed(float speed)`

  `void`

  `setPatience(int patience)`

  `void`

  `setPatienceMax(int patienceMax)`

  `void`

  `setPatienceMin(int patienceMin)`

  `void`

  `setPerformingAttackAnimation(boolean attackAnim)`

  `void`

  `setPerformingShoveAnimation(boolean shoveAnim)`

  `void`

  `setPerformingStompAnimation(boolean stompAnim)`

  `void`

  `setPerkLevelDebug(PerkFactory.Perk perks,
  int level)`

  `void`

  `setPersistentOutfitID(int outfitID)`

  `void`

  `setPersistentOutfitID(int outfitID,
  boolean init)`

  `void`

  `setPlayingDeathSound(boolean playing)`

  `void`

  `setPrimaryHandItem(InventoryItem leftHandItem)`

  `void`

  `setRagdollFall(boolean value)`

  `void`

  `setRangedWeaponEmpty(boolean val)`

  `void`

  `setReading(boolean isReading)`

  `void`

  `setReanim(boolean reanim)`

  `void`

  `setReanimAnimDelay(int reanimAnimDelay)`

  `void`

  `setReanimAnimFrame(int reanimAnimFrame)`

  `void`

  `setReanimateTimer(float reanimateTimer)`

  `void`

  `setRecoilDelay(float recoilDelay)`

  `void`

  `setRecoilVarX(float recoilVarX)`

  `void`

  `setRecoilVarY(float recoilVarY)`

  `void`

  `setReduceInfectionPower(float reduceInfectionPower)`

  `void`

  `setRemoteID(int remoteId)`

  `void`

  `setRunning(boolean bRunning)`

  `void`

  `setSafety(Safety safety)`

  `void`

  `setSayLine(String sayLine)`

  `void`

  `setSceneCulled(boolean isCulled)`

  Is this Renderable culled from the scene.

  `void`

  `setSecondaryHandItem(InventoryItem rightHandItem)`

  `void`

  `setShoveStompAnim(boolean val)`

  `void`

  `setShowAdminTag(boolean showAdminTag)`

  `void`

  `setSitOnFurnitureDirection(IsoDirections dir)`

  `void`

  `setSitOnFurnitureObject(IsoObject object)`

  `void`

  `setSitOnGround(boolean sitOnGround)`

  `void`

  `setSittingOnFurniture(boolean isSittingOnFurniture)`

  `void`

  `setSleepingTabletDelta(float sleepingTabletDelta)`

  `void`

  `setSleepingTabletEffect(float sleepingTabletEffect)`

  `void`

  `setSlowFactor(float slowFactor)`

  `void`

  `setSlowTimer(float slowTimer)`

  `void`

  `setSneaking(boolean bSneaking)`

  `void`

  `setSneakLimpSpeedScale(float sneakLimpSpeedScale)`

  `void`

  `setSpeakColour(Color speakColour)`

  `void`

  `setSpeakColourInfo(ColorInfo info)`

  `void`

  `setSpeaking(boolean speaking)`

  `void`

  `setSpeakTime(int speakTime)`

  `void`

  `setSpeedMod(float speedMod)`

  `void`

  `setSprinting(boolean bSprinting)`

  `void`

  `setStaggerTimeMod(float staggerTimeMod)`

  `void`

  `setStateMachineLocked(boolean val)`

  `void`

  `setSurvivorKills(int survivorKills)`

  `void`

  `setTargetAndCurrentDirection(float directionX,
  float directionY)`

  `void`

  `setTargetGrapplePos(float x,
  float y,
  float z)`

  `void`

  `setTargetVerticalAimAngle(float verticalAimAngleDegrees)`

  `void`

  `setTextureCreator(zombie.core.skinnedmodel.model.ModelInstanceTextureCreator textureCreator)`

  `void`

  `setTimedActionInstantCheat(boolean b)`

  `void`

  `setTimeOfSleep(float timeOfSleep)`

  `void`

  `setTimeSinceLastSmoke(float timeSinceLastSmoke)`

  `void`

  `setTimeThumping(int timeThumping)`

  `void`

  `setTurnDelta(float turnDelta)`

  `private void`

  `setTurning(boolean isTurning)`

  `private void`

  `setTurning90(boolean is)`

  `private void`

  `setTurningAround(boolean isTurningAround)`

  `void`

  `setUnlimitedAmmo(boolean unlimitedAmmo)`

  `void`

  `setUnlimitedCarry(boolean unlimitedCarry)`

  `void`

  `setUnlimitedEndurance(boolean unlimitedEndurance)`

  `void`

  `setUseHandWeapon(HandWeapon useHandWeapon)`

  `void`

  `setUsePhysicHitReaction(boolean usePhysicHitReaction)`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `setVariable(String key,
  boolean value)`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `setVariable(String key,
  float value)`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `setVariable(String key,
  String value)`

  `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `setVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle handle,
  boolean value)`

  `void`

  `setVariable(zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot var)`

  Set the specified animation variable slot.

  `void`

  `SetVariable(String key,
  String value)`

  `<EnumType extends Enum<EnumType>>  
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot`

  `setVariableEnum(String key,
  EnumType value)`

  `void`

  `setVehicle(BaseVehicle v)`

  `void`

  `setVehicleCollision(boolean value)`

  `void`

  `setVehicleHitLocation(BaseVehicle vehicle)`

  Base method.

  `void`

  `setVisibleToNPCs(boolean visibleToNpcs)`

  `void`

  `setWornItem(ItemBodyLocation location,
  InventoryItem item)`

  `void`

  `setWornItem(ItemBodyLocation location,
  InventoryItem item,
  boolean forceDropTooHeavy)`

  `void`

  `setWornItems(WornItems other)`

  `void`

  `setXp(IsoGameCharacter.XP xp)`

  Deprecated.

  `void`

  `setZombieKills(int zombieKills)`

  `void`

  `setZombiesDontAttack(boolean b)`

  `boolean`

  `shouldBecomeZombieAfterDeath()`

  `boolean`

  `shouldBeFalling()`

  `boolean`

  `shouldBePushedBackByVehicleHit()`

  `boolean`

  `shouldBeTurning()`

  `boolean`

  `shouldBeTurning90()`

  `boolean`

  `shouldBeTurningAround()`

  `boolean`

  `shouldIgnoreCollisionWithSquare(IsoGridSquare square)`

  `boolean`

  `shouldSnapZToCurrentSquare()`

  `boolean`

  `shouldWaitToStartTimedAction()`

  `void`

  `SleepingTablet(float sleepingTabletDelta)`

  `protected void`

  `slideAwayFromWalls(float radius,
  boolean instant,
  boolean includePolyCollisions)`

  `void`

  `smashCarWindow(VehiclePart part)`

  `void`

  `smashWindow(IsoWindow w)`

  `void`

  `spikePart(BodyPartType partType)`

  `void`

  `spikePartIndex(int bodyPartIndex)`

  `void`

  `spinToZeroAllAnimNodes()`

  `void`

  `splatBlood(int dist,
  float alpha)`

  `void`

  `splatBloodFloor()`

  `void`

  `splatBloodFloorBig()`

  `void`

  `SpreadFire()`

  `void`

  `SpreadFireMP()`

  `void`

  `StartAction(zombie.characters.CharacterTimedActions.BaseAction act)`

  `void`

  `startEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource`

  `startPlaybackGameVariables()`

  `void`

  `StartTimedActionAnim(String event)`

  `void`

  `StartTimedActionAnim(String event,
  String type)`

  `void`

  `StopAllActionQueue()`

  `void`

  `StopAllActionQueueAiming()`

  `void`

  `StopAllActionQueueRunning()`

  `void`

  `StopAllActionQueueWalking()`

  `void`

  `StopBurning()`

  `void`

  `stopEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `void`

  `stopOrTriggerSound(long eventInstance)`

  `void`

  `StopTimedActionAnim()`

  `void`

  `teleportTo(float newX,
  float newY)`

  `void`

  `teleportTo(float newX,
  float newY,
  int newZ)`

  `void`

  `teleportTo(int newX,
  int newY)`

  `void`

  `teleportTo(int newX,
  int newY,
  int newZ)`

  `boolean`

  `testCollideWithVehicles(BaseVehicle vehicle,
  BaseVehicle.HitVars hitVars)`

  `boolean`

  `testDefense(IsoZombie zomb)`

  Test if we're able to defend a zombie bite
  Can only happen if zombie is attacking from front
  Calcul include current weapon skills, fitness invalid input: '&' strength

  `String`

  `testDotSide(IsoMovingObject target)`

  `zombie.characters.Side`

  `testDotSideEnum(IsoMovingObject target)`

  `protected boolean`

  `TestIfSeen(int playerIndex,
  IsoPlayer player)`

  `void`

  `Throw(HandWeapon weapon)`

  `void`

  `throwGrappledIntoInventory(ItemContainer targetContainer)`

  `void`

  `throwGrappledOverFence(IsoObject hoppableObject,
  IsoDirections dir)`

  `void`

  `throwGrappledTargetOutWindow(IsoObject windowObject)`

  `void`

  `triggerContextualAction(String action)`

  `void`

  `triggerContextualAction(String action,
  Object param1)`

  `void`

  `triggerContextualAction(String action,
  Object param1,
  Object param2)`

  `void`

  `triggerContextualAction(String action,
  Object param1,
  Object param2,
  Object param3)`

  `void`

  `triggerContextualAction(String action,
  Object param1,
  Object param2,
  Object param3,
  Object param4)`

  `void`

  `triggerCough()`

  `zombie.ai.State`

  `tryGetAIState(String stateName)`

  `void`

  `update()`

  `void`

  `updateAimingDelay()`

  `private void`

  `updateAnimationTimeDelta()`

  Calculates this character's animation time-delta timeScale
  Also determines whether this character should update its animation, state, and actionContext this frame.

  `private void`

  `updateAnimPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)`

  `void`

  `updateBallistics()`

  `private void`

  `updateBallisticsTarget()`

  `protected void`

  `updateBandages()`

  `private void`

  `updateBeardAndHair()`

  `private void`

  `updateDirt()`

  `void`

  `updateDiscomfortModifiers()`

  `void`

  `updateDisguisedState()`

  `void`

  `updateEmitter()`

  `private void`

  `updateEndurance()`

  `void`

  `updateEquippedItemSounds()`

  `void`

  `updateEquippedRadioFreq()`

  `void`

  `updateEvent(long eventInstance,
  GameSoundClip clip)`

  `private void`

  `updateFalling()`

  `private void`

  `updateFitness()`

  `void`

  `updateForServerGui()`

  `void`

  `updateHandEquips()`

  `void`

  `updateHasTargetFlag()`

  `private void`

  `updateIdleSquareTime()`

  `private void`

  `updateInternal()`

  `void`

  `updateLightInfo()`

  `private void`

  `updateModelSlot()`

  `private void`

  `updateMorale()`

  `protected void`

  `updateMovementMomentum()`

  `protected void`

  `updateMovementRates()`

  `private void`

  `updateMovementStatistics()`

  `void`

  `updateRecoilVar()`

  `private void`

  `updateSeenVisibility()`

  `private void`

  `updateSeenVisibility(int playerIndex)`

  `void`

  `updateSpeedModifiers()`

  `protected void`

  `updateStats_Awake()`

  `protected void`

  `updateStats_Sleeping()`

  `protected void`

  `updateStats_WakeState()`

  `private void`

  `updateStress()`

  `void`

  `updateTextObjects()`

  `private void`

  `updateThirst()`

  `private void`

  `updateTripping()`

  `protected void`

  `updateUserName()`

  `void`

  `updateVisionEffects()`

  `void`

  `updateVisionEffectTargets()`

  `void`

  `updateWornItemsHearingModifier()`

  `void`

  `updateWornItemsVisionModifier()`

  `boolean`

  `usePhysicHitReaction()`

  `boolean`

  `useRagdollVehicleCollision()`

  `boolean`

  `wasLocal()`

  `void`

  `zeroForwardDirectionX()`

  `void`

  `zeroForwardDirectionY()`

  ### Methods inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, doTreeNoises, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getObjectName, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isCrawling, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isGettingUp, isOnFloor, isProne, isPushableForSeparate, isShootable, isSolid, isSolidForSeparate, isStanding, isWithinRange, moveUnmodded, moveUnmoddedInternal, onMouseRightClick, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, shouldSlideHeadAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, toString, updateAnimation`

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

  + ### CorpseBodyWeight

    private static final int CorpseBodyWeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.CorpseBodyWeight)
  + ### BaseMuscleStrainMultiplier

    private static final float BaseMuscleStrainMultiplier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.BaseMuscleStrainMultiplier)
  + ### ZombieAttackingClimbPenalty

    private static final float ZombieAttackingClimbPenalty

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.ZombieAttackingClimbPenalty)
  + ### ZombieNearbyClimbPenalty

    private static final float ZombieNearbyClimbPenalty

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.ZombieNearbyClimbPenalty)
  + ### GlovesStrengthBonus

    public static final int GlovesStrengthBonus

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.GlovesStrengthBonus)
  + ### AwkwardGlovesStrengthDivisor

    public static final int AwkwardGlovesStrengthDivisor

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.AwkwardGlovesStrengthDivisor)
  + ### tempItemVisuals

    protected static final [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") tempItemVisuals
  + ### HUMANOID\_WORLD\_CHEST\_HEIGHT

    public static final float HUMANOID\_WORLD\_CHEST\_HEIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.HUMANOID_WORLD_CHEST_HEIGHT)
  + ### HUMANOID\_SCREEN\_CHEST\_HEIGHT

    public static final float HUMANOID\_SCREEN\_CHEST\_HEIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.HUMANOID_SCREEN_CHEST_HEIGHT)
  + ### extraLungeRange

    private final float extraLungeRange

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.extraLungeRange)
  + ### headLookAround

    private boolean headLookAround
  + ### maxHeadLookAngle

    private static final float maxHeadLookAngle

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.maxHeadLookAngle)
  + ### headLookHorizontal

    private float headLookHorizontal
  + ### headLookVertical

    private float headLookVertical
  + ### doDeathSound

    private boolean doDeathSound
  + ### canShout

    private boolean canShout
  + ### doDirtBloodEtc

    public boolean doDirtBloodEtc
  + ### instanceId

    private static int instanceId
  + ### RENDER\_OFFSET\_X

    public static final int RENDER\_OFFSET\_X

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.RENDER_OFFSET_X)
  + ### RENDER\_OFFSET\_Y

    public static final int RENDER\_OFFSET\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.RENDER_OFFSET_Y)
  + ### s\_maxPossibleTwist

    public static final float s\_maxPossibleTwist

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.s_maxPossibleTwist)
  + ### s\_bandages

    private static final [IsoGameCharacter.Bandages](IsoGameCharacter.Bandages.html "class in zombie.characters") s\_bandages
  + ### SurvivorMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [SurvivorDesc](SurvivorDesc.html "class in zombie.characters")> SurvivorMap
  + ### LevelUpLevels

    private static final int[] LevelUpLevels
  + ### tempo

    protected static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempo
  + ### tempo3

    protected static final [Vector3](../iso/Vector3.html "class in zombie.iso") tempo3
  + ### inf

    protected static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") inf
  + ### vocalEvent

    public long vocalEvent
  + ### removedFromWorldMs

    public long removedFromWorldMs
  + ### isAddedToModelManager

    private boolean isAddedToModelManager
  + ### autoWalk

    private boolean autoWalk
  + ### autoWalkDirection

    private final [Vector2](../iso/Vector2.html "class in zombie.iso") autoWalkDirection
  + ### sneaking

    private boolean sneaking
  + ### SNEAK\_LIMP\_SPEED\_SCALE\_DEFAULT

    protected static final float SNEAK\_LIMP\_SPEED\_SCALE\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.SNEAK_LIMP_SPEED_SCALE_DEFAULT)
  + ### sneakLimpSpeedScale

    private float sneakLimpSpeedScale
  + ### WALK\_SPEED\_SLOW

    public static final float WALK\_SPEED\_SLOW

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.WALK_SPEED_SLOW)
  + ### WALK\_SPEED\_DEFAULT

    public static final float WALK\_SPEED\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.WALK_SPEED_DEFAULT)
  + ### SNEAK\_LIMP\_INJURY\_THRESHOLD

    protected static final float SNEAK\_LIMP\_INJURY\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.SNEAK_LIMP_INJURY_THRESHOLD)
  + ### m\_sneakLimpSpeed

    private static final float m\_sneakLimpSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.m_sneakLimpSpeed)
  + ### m\_sneakLowLimpSpeed

    private static final float m\_sneakLowLimpSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.m_sneakLowLimpSpeed)
  + ### tempo2

    protected static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempo2
  + ### tempVector2\_1

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2\_1
  + ### tempVector2\_2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2\_2
  + ### sleepText

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sleepText
  + ### savedInventoryItems

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> savedInventoryItems
  + ### instancename

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") instancename
  + ### amputations

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> amputations
  + ### hair

    public zombie.core.skinnedmodel.model.ModelInstance hair
  + ### beard

    public zombie.core.skinnedmodel.model.ModelInstance beard
  + ### primaryHandModel

    public zombie.core.skinnedmodel.model.ModelInstance primaryHandModel
  + ### secondaryHandModel

    public zombie.core.skinnedmodel.model.ModelInstance secondaryHandModel
  + ### emitter

    public final [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters") emitter
  + ### fmodParameters

    private final zombie.audio.FMODParameterList fmodParameters
  + ### gameVariables

    private final zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource gameVariables
  + ### playbackGameVariables

    private zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource playbackGameVariables
  + ### running

    private boolean running
  + ### sprinting

    private boolean sprinting
  + ### avoidDamage

    private boolean avoidDamage
  + ### callOut

    public boolean callOut
  + ### reanimatedCorpse

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") reanimatedCorpse
  + ### reanimatedCorpseId

    public int reanimatedCorpseId
  + ### animPlayer

    private zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer
  + ### deferredMovementEnabled

    private boolean deferredMovementEnabled
  + ### isCrit

    private boolean isCrit
  + ### knockedDown

    private boolean knockedDown
  + ### bumpNbr

    public int bumpNbr
  + ### perkList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.PerkInfo](IsoGameCharacter.PerkInfo.html "class in zombie.characters")> perkList
  + ### forwardDirection

    protected final [Vector2](../iso/Vector2.html "class in zombie.iso") forwardDirection
  + ### targetVerticalAimAngleDegrees

    private float targetVerticalAimAngleDegrees
  + ### currentVerticalAimAngleDegrees

    private float currentVerticalAimAngleDegrees
  + ### asleep

    public boolean asleep
  + ### isResting

    public boolean isResting
  + ### blockTurning

    public boolean blockTurning
  + ### wasKnockedDown

    public boolean wasKnockedDown
  + ### speedMod

    public float speedMod
  + ### legsSprite

    public [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") legsSprite
  + ### knockbackAttackMod

    public float knockbackAttackMod
  + ### animal

    private boolean animal
  + ### isVisibleToPlayer

    public final boolean[] isVisibleToPlayer
  + ### savedVehicleX

    public float savedVehicleX
  + ### savedVehicleY

    public float savedVehicleY
  + ### savedVehicleSeat

    public short savedVehicleSeat
  + ### savedVehicleRunning

    public boolean savedVehicleRunning
  + ### RecoilDelayDecrease

    private static final float RecoilDelayDecrease

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.RecoilDelayDecrease)
  + ### BeenMovingForIncrease

    protected static final float BeenMovingForIncrease

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.BeenMovingForIncrease)
  + ### BeenMovingForDecrease

    protected static final float BeenMovingForDecrease

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.BeenMovingForDecrease)
  + ### followingTarget

    private [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") followingTarget
  + ### localList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> localList
  + ### localNeutralList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> localNeutralList
  + ### localGroupList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> localGroupList
  + ### localRelevantEnemyList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> localRelevantEnemyList
  + ### dangerLevels

    private float dangerLevels
  + ### tempVector2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2
  + ### leaveBodyTimedown

    private float leaveBodyTimedown
  + ### allowConversation

    protected boolean allowConversation
  + ### reanimateTimer

    private float reanimateTimer
  + ### reanimAnimFrame

    private int reanimAnimFrame
  + ### reanimAnimDelay

    private int reanimAnimDelay
  + ### reanim

    private boolean reanim
  + ### visibleToNpcs

    private boolean visibleToNpcs
  + ### dieCount

    private int dieCount
  + ### llx

    private float llx
  + ### lly

    private float lly
  + ### llz

    private float llz
  + ### remoteId

    protected int remoteId
  + ### numSurvivorsInVicinity

    protected int numSurvivorsInVicinity
  + ### levelUpMultiplier

    private float levelUpMultiplier
  + ### xp

    protected [IsoGameCharacter.XP](IsoGameCharacter.XP.html "class in zombie.characters") xp
  + ### lastLocalEnemies

    private int lastLocalEnemies
  + ### veryCloseEnemyList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> veryCloseEnemyList
  + ### lastKnownLocation

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters")> lastKnownLocation
  + ### attackedBy

    protected [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") attackedBy
  + ### damagedByVehicle

    protected boolean damagedByVehicle
  + ### ignoreStaggerBack

    protected boolean ignoreStaggerBack
  + ### timeThumping

    private int timeThumping
  + ### patienceMax

    private int patienceMax
  + ### patienceMin

    private int patienceMin
  + ### patience

    private int patience
  + ### characterActions

    protected final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.characters.CharacterTimedActions.BaseAction> characterActions
  + ### zombieKills

    private int zombieKills
  + ### survivorKills

    private int survivorKills
  + ### lastZombieKills

    private int lastZombieKills
  + ### forceWakeUpTime

    protected float forceWakeUpTime
  + ### fullSpeedMod

    private float fullSpeedMod
  + ### runSpeedModifier

    protected float runSpeedModifier
  + ### walkSpeedModifier

    private float walkSpeedModifier
  + ### combatSpeedModifier

    private float combatSpeedModifier
  + ### clothingDiscomfortModifier

    private float clothingDiscomfortModifier
  + ### rangedWeaponEmpty

    private boolean rangedWeaponEmpty
  + ### bagsWorn

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryContainer](../inventory/types/InventoryContainer.html "class in zombie.inventory.types")> bagsWorn
  + ### forceWakeUp

    protected boolean forceWakeUp
  + ### bodyDamage

    protected final [BodyDamage](BodyDamage/BodyDamage.html "class in zombie.characters.BodyDamage") bodyDamage
  + ### bodyDamageRemote

    private [BodyDamage](BodyDamage/BodyDamage.html "class in zombie.characters.BodyDamage") bodyDamageRemote
  + ### wornItems

    protected [WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") wornItems
  + ### attachedItems

    protected [AttachedItems](AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") attachedItems
  + ### clothingWetness

    protected zombie.characters.ClothingWetness clothingWetness
  + ### clothingWetnessSync

    protected zombie.characters.ClothingWetnessSync clothingWetnessSync
  + ### descriptor

    protected [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") descriptor
  + ### familiarBuildings

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoBuilding](../iso/areas/IsoBuilding.html "class in zombie.iso.areas")> familiarBuildings
  + ### finder

    protected final zombie.ai.astar.AStarPathFinderResult finder
  + ### fireKillRate

    private float fireKillRate
  + ### fireSpreadProbability

    private int fireSpreadProbability
  + ### health

    protected float health
  + ### dead

    protected boolean dead
  + ### kill

    protected boolean kill
  + ### wornClothingCanRagdoll

    private boolean wornClothingCanRagdoll
  + ### isEditingRagdoll

    private boolean isEditingRagdoll
  + ### ragdollFall

    private boolean ragdollFall
  + ### vehicleCollision

    private boolean vehicleCollision
  + ### playingDeathSound

    protected boolean playingDeathSound
  + ### deathDragDown

    private boolean deathDragDown
  + ### hurtSound

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hurtSound
  + ### inventory

    protected [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") inventory
  + ### leftHandItem

    protected [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") leftHandItem
  + ### handItemShouldSendToClients

    protected boolean handItemShouldSendToClients
  + ### nextWander

    private int nextWander
  + ### onFire

    private boolean onFire
  + ### pathIndex

    private int pathIndex
  + ### rightHandItem

    protected [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") rightHandItem
  + ### speakColour

    protected [Color](../core/Color.html "class in zombie.core") speakColour
  + ### slowFactor

    protected float slowFactor
  + ### slowTimer

    protected float slowTimer
  + ### useParts

    protected boolean useParts
  + ### speaking

    protected boolean speaking
  + ### speakTime

    private float speakTime
  + ### staggerTimeMod

    private float staggerTimeMod
  + ### moodles

    protected final [Moodles](Moodles/Moodles.html "class in zombie.characters.Moodles") moodles
  + ### stats

    protected final [Stats](Stats.html "class in zombie.characters") stats
  + ### usedItemsOn

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> usedItemsOn
  + ### useHandWeapon

    protected [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") useHandWeapon
  + ### attackTargetSquare

    protected [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") attackTargetSquare
  + ### bloodImpactX

    private float bloodImpactX
  + ### bloodImpactY

    private float bloodImpactY
  + ### bloodImpactZ

    private float bloodImpactZ
  + ### bloodSplat

    private [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") bloodSplat
  + ### onBed

    private boolean onBed
  + ### moveForwardVec

    private final [Vector2](../iso/Vector2.html "class in zombie.iso") moveForwardVec
  + ### pathing

    protected boolean pathing
  + ### chatElement

    protected zombie.chat.ChatElement chatElement
  + ### localEnemyList

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")> localEnemyList
  + ### enemyList

    protected final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")> enemyList
  + ### characterTraits

    protected final [CharacterTraits](traits/CharacterTraits.html "class in zombie.characters.traits") characterTraits
  + ### maxWeight

    private int maxWeight
  + ### maxWeightBase

    private int maxWeightBase
  + ### sleepingTabletEffect

    private float sleepingTabletEffect
  + ### sleepingTabletDelta

    private float sleepingTabletDelta
  + ### betaEffect

    private float betaEffect
  + ### betaDelta

    private float betaDelta
  + ### depressEffect

    private float depressEffect
  + ### depressDelta

    private float depressDelta
  + ### depressFirstTakeTime

    private float depressFirstTakeTime
  + ### painEffect

    private float painEffect
  + ### painDelta

    private float painDelta
  + ### doDefer

    private boolean doDefer
  + ### haloDispTime

    private float haloDispTime
  + ### userName

    protected [TextDrawObject](../ui/TextDrawObject.html "class in zombie.ui") userName
  + ### haloNote

    private [TextDrawObject](../ui/TextDrawObject.html "class in zombie.ui") haloNote
  + ### nameCarKeySuffix

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nameCarKeySuffix

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.nameCarKeySuffix)
  + ### voiceSuffix

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") voiceSuffix

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.voiceSuffix)
  + ### voiceMuteSuffix

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") voiceMuteSuffix

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.voiceMuteSuffix)
  + ### isoPlayer

    protected [IsoPlayer](IsoPlayer.html "class in zombie.characters") isoPlayer
  + ### hasInitTextObjects

    private boolean hasInitTextObjects
  + ### canSeeCurrent

    private boolean canSeeCurrent
  + ### drawUserName

    private boolean drawUserName
  + ### lastHeardSound

    private final [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters") lastHeardSound
  + ### climbing

    protected boolean climbing
  + ### lastCollidedW

    private boolean lastCollidedW
  + ### lastCollidedN

    private boolean lastCollidedN
  + ### fallTime

    protected float fallTime
  + ### lastFallSpeed

    protected float lastFallSpeed
  + ### falling

    protected boolean falling
  + ### isOnGround

    protected boolean isOnGround
  + ### vehicle

    protected [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle
  + ### lastBump

    private long lastBump
  + ### bumpedChr

    private [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") bumpedChr
  + ### age

    private int age
  + ### lastHitCount

    private int lastHitCount
  + ### safety

    private final [Safety](Safety.html "class in zombie.characters") safety
  + ### meleeDelay

    private float meleeDelay
  + ### recoilDelay

    private float recoilDelay
  + ### beenMovingFor

    private float beenMovingFor
  + ### beenSprintingFor

    private float beenSprintingFor
  + ### aimingDelay

    private float aimingDelay
  + ### clickSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound
  + ### reduceInfectionPower

    private float reduceInfectionPower
  + ### knownRecipes

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> knownRecipes
  + ### knownMediaLines

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> knownMediaLines
  + ### lastHourSleeped

    private int lastHourSleeped
  + ### timeOfSleep

    protected float timeOfSleep
  + ### delayToActuallySleep

    protected float delayToActuallySleep
  + ### bedType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bedType
  + ### bed

    private [IsoObject](../iso/IsoObject.html "class in zombie.iso") bed
  + ### isReading

    private boolean isReading
  + ### timeSinceLastSmoke

    private float timeSinceLastSmoke
  + ### lastChatMessage

    private [ChatMessage](../chat/ChatMessage.html "class in zombie.chat") lastChatMessage
  + ### lastSpokenLine

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastSpokenLine
  + ### cheats

    public zombie.characters.PlayerCheats cheats
  + ### showAdminTag

    private boolean showAdminTag
  + ### isAnimForecasted

    private long isAnimForecasted
  + ### fallOnFront

    private boolean fallOnFront
  + ### killedByFall

    private boolean killedByFall
  + ### hitFromBehind

    private boolean hitFromBehind
  + ### hitReaction

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitReaction
  + ### bumpType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bumpType
  + ### isBumpDone

    private boolean isBumpDone
  + ### bumpFall

    private boolean bumpFall
  + ### bumpStaggered

    private boolean bumpStaggered
  + ### bumpFallType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bumpFallType
  + ### animationFinishing

    private boolean animationFinishing
  + ### animationFinishingState

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animationFinishingState
  + ### sleepSpeechCnt

    private int sleepSpeechCnt
  + ### equipedRadio

    private [Radio](../inventory/types/Radio.html "class in zombie.inventory.types") equipedRadio
  + ### leftHandCache

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") leftHandCache
  + ### rightHandCache

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") rightHandCache
  + ### backCache

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") backCache
  + ### readBooks

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.ReadBook](IsoGameCharacter.ReadBook.html "class in zombie.characters")> readBooks
  + ### lightInfo

    public final [IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters") lightInfo
  + ### lightInfo2

    private final [IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters") lightInfo2
  + ### path2

    private zombie.pathfind.Path path2
  + ### mapKnowledge

    private final [MapKnowledge](../ai/MapKnowledge.html "class in zombie.ai") mapKnowledge
  + ### attackVars

    protected final zombie.network.fields.hit.AttackVars attackVars
  + ### hasTarget

    private boolean hasTarget
  + ### hitInfoList

    private final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<zombie.network.fields.hit.HitInfo> hitInfoList
  + ### pfb2

    private final [PathFindBehavior2](../pathfind/PathFindBehavior2.html "class in zombie.pathfind") pfb2
  + ### cacheEquiped

    private final [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")[] cacheEquiped
  + ### aimAtFloor

    private boolean aimAtFloor
  + ### aimAtFloorTargetDistance

    private float aimAtFloorTargetDistance
  + ### persistentOutfitId

    protected int persistentOutfitId
  + ### persistentOutfitInit

    protected boolean persistentOutfitInit
  + ### updateModelTextures

    private boolean updateModelTextures
  + ### textureCreator

    private zombie.core.skinnedmodel.model.ModelInstanceTextureCreator textureCreator
  + ### updateEquippedTextures

    public boolean updateEquippedTextures
  + ### readyModelData

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.skinnedmodel.model.ModelInstance> readyModelData
  + ### isSitOnFurniture

    private boolean isSitOnFurniture
  + ### sitOnFurnitureObject

    private [IsoObject](../iso/IsoObject.html "class in zombie.iso") sitOnFurnitureObject
  + ### sitOnFurnitureDirection

    private [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") sitOnFurnitureDirection
  + ### sitOnGround

    private boolean sitOnGround
  + ### ignoreMovement

    private boolean ignoreMovement
  + ### hideWeaponModel

    private boolean hideWeaponModel
  + ### hideEquippedHandL

    private boolean hideEquippedHandL
  + ### hideEquippedHandR

    private boolean hideEquippedHandR
  + ### isAiming

    private boolean isAiming
  + ### beardGrowTiming

    private float beardGrowTiming
  + ### hairGrowTiming

    private float hairGrowTiming
  + ### moveDelta

    private float moveDelta
  + ### turnDeltaNormal

    protected float turnDeltaNormal
  + ### turnDeltaRunning

    protected float turnDeltaRunning
  + ### turnDeltaSprinting

    protected float turnDeltaSprinting
  + ### maxTwist

    private float maxTwist
  + ### isMoving

    private boolean isMoving
  + ### isTurning

    private boolean isTurning
  + ### isTurningAround

    private boolean isTurningAround
  + ### initialTurningAroundTarget

    private float initialTurningAroundTarget
  + ### isTurning90

    private boolean isTurning90
  + ### invincible

    private boolean invincible
  + ### lungeFallTimer

    private float lungeFallTimer
  + ### sleepingEventData

    private zombie.ai.sadisticAIDirector.SleepingEventData sleepingEventData
  + ### HAIR\_GROW\_TIME\_DAYS

    private static final int HAIR\_GROW\_TIME\_DAYS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.HAIR_GROW_TIME_DAYS)
  + ### BEARD\_GROW\_TIME\_DAYS

    private static final int BEARD\_GROW\_TIME\_DAYS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.BEARD_GROW_TIME_DAYS)
  + ### realx

    public float realx
  + ### realy

    public float realy
  + ### realz

    public byte realz
  + ### realState

    public zombie.network.NetworkVariables.ZombieState realState
  + ### overridePrimaryHandModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overridePrimaryHandModel
  + ### overrideSecondaryHandModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overrideSecondaryHandModel
  + ### forceNullOverride

    public boolean forceNullOverride
  + ### momentumScalar

    private float momentumScalar
  + ### isPerformingAttackAnim

    private boolean isPerformingAttackAnim
  + ### isPerformingShoveAnim

    private boolean isPerformingShoveAnim
  + ### isPerformingStompAnim

    private boolean isPerformingStompAnim
  + ### wornItemsVisionModifier

    private float wornItemsVisionModifier
  + ### wornItemsHearingModifier

    private float wornItemsHearingModifier
  + ### corpseSicknessRate

    private float corpseSicknessRate
  + ### blurFactor

    private float blurFactor
  + ### blurFactorTarget

    private float blurFactorTarget
  + ### usernameDisguised

    public boolean usernameDisguised
  + ### climbRopeTime

    private float climbRopeTime
  + ### invRadioFreq

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> invRadioFreq

    Deprecated.
  + ### animStateTriggerWatcher

    private final zombie.PredicatedFileWatcher animStateTriggerWatcher
  + ### debugVariablesRegistered

    private boolean debugVariablesRegistered
  + ### effectiveEdibleBuffTimer

    private float effectiveEdibleBuffTimer
  + ### readLiterature

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> readLiterature
  + ### readPrintMedia

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> readPrintMedia
  + ### lastHitCharacter

    private [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") lastHitCharacter
  + ### ballisticsController

    private zombie.core.physics.BallisticsController ballisticsController
  + ### ballisticsTarget

    private zombie.core.physics.BallisticsTarget ballisticsTarget
  + ### grappleable

    private final zombie.core.skinnedmodel.BaseGrappleable grappleable
  + ### isAnimatingBackwards

    private boolean isAnimatingBackwards
  + ### animationTimeScale

    private float animationTimeScale
  + ### animationUpdatingThisFrame

    private boolean animationUpdatingThisFrame
  + ### animationInvisibleFrameDelay

    private final zombie.util.FrameDelay animationInvisibleFrameDelay
  + ### lastAnimalPet

    public long lastAnimalPet
  + ### animEventBroadcaster

    private final zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster animEventBroadcaster
  + ### vbdebugHitTarget

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") vbdebugHitTarget
  + ### hitDirEnum

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitDirEnum
  + ### isGrappleThrowOutWindow

    private boolean isGrappleThrowOutWindow
  + ### isGrappleThrowOverFence

    private boolean isGrappleThrowOverFence
  + ### isGrappleThrowIntoContainer

    private boolean isGrappleThrowIntoContainer
  + ### shoveStompAnim

    private boolean shoveStompAnim
  + ### maxStrafeSpeed

    private static final float maxStrafeSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.maxStrafeSpeed)
  + ### tempVector3f00

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f00
  + ### tempVector3f01

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f01
  + ### CombatSpeedBase

    private static final float CombatSpeedBase

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.CombatSpeedBase)
  + ### HeavyTwoHandedWeaponModifier

    private static final float HeavyTwoHandedWeaponModifier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.HeavyTwoHandedWeaponModifier)
  + ### idleSquareTime

    private float idleSquareTime
  + ### concurrentActionList

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> concurrentActionList
  + ### shadowFm

    private float shadowFm
  + ### shadowBm

    private float shadowBm
  + ### shadowTick

    private long shadowTick
  + ### lastFitnessValue

    private float lastFitnessValue
  + ### networkCharacter

    public final zombie.characters.NetworkCharacter networkCharacter
  + ### onDiedListeners

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.characters.CharacterDiedListener, [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> onDiedListeners
  + ### diedBody

    private [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") diedBody
  + ### recoil

    private final [IsoGameCharacter.Recoil](IsoGameCharacter.Recoil.html "class in zombie.characters") recoil
  + ### meleeWeaponMuscleStrainAdjustment

    private static final double meleeWeaponMuscleStrainAdjustment

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.meleeWeaponMuscleStrainAdjustment)
  + ### usePhysicHitReaction

    private boolean usePhysicHitReaction
  + ### climbData

    private [ClimbSheetRopeState.ClimbData](../ai/states/ClimbSheetRopeState.ClimbData.html "class in zombie.ai.states") climbData
  + ### fallDamage

    private final zombie.characters.FallDamage fallDamage
  + ### onFireLightSource

    public [IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") onFireLightSource
  + ### slideAwayFromWalls

    private final [IsoGameCharacter.LC\_slideAwayFromWalls](IsoGameCharacter.LC_slideAwayFromWalls.html "class in zombie.characters") slideAwayFromWalls
  + ### NAME\_TAG\_Y\_OFFSET

    private static final int NAME\_TAG\_Y\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoGameCharacter.NAME_TAG_Y_OFFSET)
  + ### movingStatic

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> movingStatic
  + ### postUpdateInternal

    final zombie.core.profiling.PerformanceProfileProbe postUpdateInternal
  + ### updateInternal

    final zombie.core.profiling.PerformanceProfileProbe updateInternal
  + ### tempVectorBonePos

    private static final [Vector3](../iso/Vector3.html "class in zombie.iso") tempVectorBonePos
* Constructor Details
  -------------------

  + ### IsoGameCharacter

    public IsoGameCharacter([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    float x,
    float y,
    float z)
* Method Details
  --------------

  + ### registerECSComponents

    public void registerECSComponents()

    Specified by:
    :   `registerECSComponents` in interface `zombie.characters.ecs.ECSEntity`
  + ### registerVariableCallbacks

    private void registerVariableCallbacks()
  + ### isFalling

    public final boolean isFalling()
  + ### getMinFloorZ

    private int getMinFloorZ()
  + ### registerAnimEventCallbacks

    private void registerAnimEventCallbacks()
  + ### OnAnimEvent\_GrapplerLetGo

    private void OnAnimEvent\_GrapplerLetGo([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grappleResult)
  + ### OnAnimEvent\_FallOnFront

    private void OnAnimEvent\_FallOnFront([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    boolean fallOnFront)
  + ### OnAnimEvent\_SetOnFloor

    private void OnAnimEvent\_SetOnFloor([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    boolean onFloor)
  + ### OnAnimEvent\_SetKnockedDown

    private void OnAnimEvent\_SetKnockedDown([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    boolean knockedDown)
  + ### OnAnimEvent\_IsAlmostUp

    protected void OnAnimEvent\_IsAlmostUp([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_KilledByAttacker

    protected void OnAnimEvent\_KilledByAttacker([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner)
  + ### isShoveStompAnim

    public boolean isShoveStompAnim()
  + ### setShoveStompAnim

    public void setShoveStompAnim(boolean val)
  + ### onGrappleBegin

    private void onGrappleBegin()
  + ### onGrappleEnded

    private void onGrappleEnded()
  + ### canUseCurrentPoseForCorpse

    public boolean canUseCurrentPoseForCorpse()
  + ### getRecoilVarX

    public float getRecoilVarX()
  + ### setRecoilVarX

    public void setRecoilVarX(float recoilVarX)
  + ### getRecoilVarY

    public float getRecoilVarY()
  + ### setRecoilVarY

    public void setRecoilVarY(float recoilVarY)
  + ### setGrappleThrowOutWindow

    public void setGrappleThrowOutWindow(boolean newValue)
  + ### isGrappleThrowOutWindow

    public boolean isGrappleThrowOutWindow()
  + ### setGrappleThrowOverFence

    public void setGrappleThrowOverFence(boolean newValue)
  + ### isGrappleThrowOverFence

    public boolean isGrappleThrowOverFence()
  + ### setGrappleThrowIntoContainer

    public void setGrappleThrowIntoContainer(boolean newValue)
  + ### isGrappleThrowIntoContainer

    public boolean isGrappleThrowIntoContainer()
  + ### updateRecoilVar

    public void updateRecoilVar()
  + ### registerDebugGameVariables

    private void registerDebugGameVariables()
  + ### dbgRegisterAnimTrackVariable

    private void dbgRegisterAnimTrackVariable(int layerIdx,
    int trackIdx)
  + ### setVehicleHitLocation

    public void setVehicleHitLocation([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)

    Base method. Default does nothing.
  + ### getMomentumScalar

    public float getMomentumScalar()
  + ### setMomentumScalar

    public void setMomentumScalar(float val)
  + ### getDeferredMovement

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getDeferredMovement([Vector2](../iso/Vector2.html "class in zombie.iso") result)
  + ### getDeferredMovement

    protected [Vector2](../iso/Vector2.html "class in zombie.iso") getDeferredMovement([Vector2](../iso/Vector2.html "class in zombie.iso") result,
    boolean reset)
  + ### getDeferredMovementFromRagdoll

    public [Vector3](../iso/Vector3.html "class in zombie.iso") getDeferredMovementFromRagdoll([Vector3](../iso/Vector3.html "class in zombie.iso") result)
  + ### getDeferredAngleDelta

    public float getDeferredAngleDelta()
  + ### getDeferredRotationWeight

    public float getDeferredRotationWeight()
  + ### getTargetGrapplePos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTargetGrapplePos([Vector3f](../../org/joml/Vector3f.html "class in org.joml") result)

    Specified by:
    :   `getTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `getTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### getTargetGrapplePos

    public [Vector3](../iso/Vector3.html "class in zombie.iso") getTargetGrapplePos([Vector3](../iso/Vector3.html "class in zombie.iso") result)

    Specified by:
    :   `getTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `getTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### setTargetGrapplePos

    public void setTargetGrapplePos(float x,
    float y,
    float z)

    Specified by:
    :   `setTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `setTargetGrapplePos` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### getTargetGrappleRotation

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getTargetGrappleRotation([Vector2](../iso/Vector2.html "class in zombie.iso") result)

    Specified by:
    :   `getTargetGrappleRotation` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `getTargetGrappleRotation` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### isStrafing

    public boolean isStrafing()
  + ### isPerformingNoAimShortStrafe

    public boolean isPerformingNoAimShortStrafe()
  + ### dbgGetAnimTrack

    public zombie.core.skinnedmodel.animation.AnimationTrack dbgGetAnimTrack(int layerIdx,
    int trackIdx)
  + ### dbgGetAnimTrackName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dbgGetAnimTrackName(int layerIdx,
    int trackIdx)
  + ### dbgGetAnimTrackTime

    public float dbgGetAnimTrackTime(int layerIdx,
    int trackIdx)
  + ### dbgGetAnimTrackWeight

    public float dbgGetAnimTrackWeight(int layerIdx,
    int trackIdx)
  + ### getTwist

    public float getTwist()
  + ### getShoulderTwist

    public float getShoulderTwist()
  + ### getMaxTwist

    public float getMaxTwist()
  + ### setMaxTwist

    public void setMaxTwist(float degrees)
  + ### getExcessTwist

    public float getExcessTwist()
  + ### getNumTwistBones

    public int getNumTwistBones()
  + ### getAbsoluteExcessTwist

    public float getAbsoluteExcessTwist()
  + ### getAnimAngleTwistDelta

    public float getAnimAngleTwistDelta()
  + ### getAnimAngleStepDelta

    public float getAnimAngleStepDelta()
  + ### getTargetTwist

    public float getTargetTwist()
  + ### isRangedWeaponEmpty

    public boolean isRangedWeaponEmpty()

    Specified by:
    :   `isRangedWeaponEmpty` in interface `zombie.characters.ILuaGameCharacter`
  + ### setRangedWeaponEmpty

    public void setRangedWeaponEmpty(boolean val)

    Specified by:
    :   `setRangedWeaponEmpty` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasFootInjury

    public boolean hasFootInjury()
  + ### isInTrees2

    public boolean isInTrees2(boolean ignoreBush)
  + ### isInTreesNoBush

    public boolean isInTreesNoBush()
  + ### isInTrees

    public boolean isInTrees()
  + ### getSurvivorMap

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [SurvivorDesc](SurvivorDesc.html "class in zombie.characters")> getSurvivorMap()
  + ### getLevelUpLevels

    public static int[] getLevelUpLevels()
  + ### getTempo

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") getTempo()
  + ### getTempo2

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") getTempo2()
  + ### getInf

    public static [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getInf()
  + ### getEmitter

    public [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters") getEmitter()

    Specified by:
    :   `getEmitter` in interface `zombie.characters.ILuaGameCharacter`
  + ### updateEmitter

    public void updateEmitter()
  + ### doDeferredMovement

    protected void doDeferredMovement()
  + ### doDeferredMovementFromRagdoll

    public void doDeferredMovementFromRagdoll([Vector3](../iso/Vector3.html "class in zombie.iso") dMovement)
  + ### getActionContext

    public zombie.characters.action.ActionContext getActionContext()

    Specified by:
    :   `getActionContext` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### getStateMachineComponent

    public final [StateMachineComponent](component/StateMachineComponent.html "class in zombie.characters.component") getStateMachineComponent()
  + ### getPreviousActionContextStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPreviousActionContextStateName()
  + ### getCurrentActionContextStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentActionContextStateName()
  + ### hasAnimationPlayer

    public boolean hasAnimationPlayer()

    Specified by:
    :   `hasAnimationPlayer` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### getAnimationPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer getAnimationPlayer()

    Specified by:
    :   `getAnimationPlayer` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### releaseAnimationPlayer

    public void releaseAnimationPlayer()
  + ### onAnimPlayerCreated

    protected void onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)
  + ### getAdvancedAnimator

    public zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator getAdvancedAnimator()

    Specified by:
    :   `getAdvancedAnimator` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### getModelInstance

    public zombie.core.skinnedmodel.model.ModelInstance getModelInstance()

    Specified by:
    :   `getModelInstance` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### getCurrentStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentStateName()
  + ### getPreviousStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPreviousStateName()
  + ### getAnimationDebug

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimationDebug()
  + ### getStatisticsDebug

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStatisticsDebug()
  + ### getTalkerType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTalkerType()

    Specified by:
    :   `getTalkerType` in interface `zombie.characters.Talker`
  + ### spinToZeroAllAnimNodes

    public void spinToZeroAllAnimNodes()
  + ### isAnimForecasted

    public boolean isAnimForecasted()
  + ### setAnimForecasted

    public void setAnimForecasted(int timeMs)
  + ### resetModel

    public void resetModel()

    Specified by:
    :   `resetModel` in interface `zombie.characters.ILuaGameCharacter`
  + ### resetModelNextFrame

    public void resetModelNextFrame()

    Specified by:
    :   `resetModelNextFrame` in interface `zombie.characters.ILuaGameCharacter`
  + ### onTrigger\_setClothingToXmlTriggerFile

    protected void onTrigger\_setClothingToXmlTriggerFile(zombie.characters.TriggerXmlFile triggerXml)
  + ### onTrigger\_setAnimStateToTriggerFile

    protected void onTrigger\_setAnimStateToTriggerFile(zombie.characters.AnimStateTriggerXmlFile triggerXml)
  + ### restoreAnimatorStateToActionContext

    private void restoreAnimatorStateToActionContext()
  + ### clothingItemChanged

    public void clothingItemChanged([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGuid)

    Specified by:
    :   `clothingItemChanged` in interface `zombie.core.skinnedmodel.population.IClothingItemListener`
  + ### reloadOutfit

    public void reloadOutfit()
  + ### setSceneCulled

    public void setSceneCulled(boolean isCulled)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Is this Renderable culled from the scene. Usually because it is outside visible range, or is hidden somehow, eg foliage or darkness.

    Specified by:
    :   `setSceneCulled` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `setSceneCulled` in class `IsoObject`
  + ### setAddedToModelManager

    public void setAddedToModelManager(zombie.core.skinnedmodel.ModelManager modelManager,
    boolean isAdded)

    Callback from ModelManager.Add/Remove functions.

    NOTE: Do not call this directly, it is intended for use by the ModelManager only.

    Parameters:
    :   `modelManager` - Event sender.
    :   `isAdded` - Whether or not this object extists in the ModelManager's render list.
  + ### isAddedToModelManager

    public boolean isAddedToModelManager()
  + ### dressInRandomOutfit

    public void dressInRandomOutfit()
  + ### dressInRandomNonSillyOutfit

    public void dressInRandomNonSillyOutfit()
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)

    Specified by:
    :   `dressInNamedOutfit` in interface `ILuaGameCharacterClothing`
  + ### dressInPersistentOutfit

    public void dressInPersistentOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)

    Specified by:
    :   `dressInPersistentOutfit` in interface `ILuaGameCharacterClothing`
  + ### dressInPersistentOutfitID

    public void dressInPersistentOutfitID(int outfitID)

    Specified by:
    :   `dressInPersistentOutfitID` in interface `ILuaGameCharacterClothing`
  + ### getOutfitName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutfitName()

    Specified by:
    :   `getOutfitName` in interface `ILuaGameCharacterClothing`
  + ### dressInClothingItem

    public void dressInClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGUID)
  + ### getRandomDefaultOutfit

    public zombie.core.skinnedmodel.population.Outfit getRandomDefaultOutfit()
  + ### getModel

    public zombie.core.skinnedmodel.model.ModelInstance getModel()
  + ### hasActiveModel

    public boolean hasActiveModel()
  + ### hasItems

    public boolean hasItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)

    Specified by:
    :   `hasItems` in interface `zombie.characters.ILuaGameCharacter`
  + ### getLevelUpLevels

    public int getLevelUpLevels(int level)
  + ### getLevelMaxForXp

    public int getLevelMaxForXp()
  + ### getXpForLevel

    public int getXpForLevel(int level)

    Specified by:
    :   `getXpForLevel` in interface `zombie.characters.ILuaGameCharacter`
  + ### DoDeath

    public final void DoDeath([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder)
  + ### DoDeath

    public void DoDeath([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean isGory)
  + ### doDeathSplatterAndSounds

    public void doDeathSplatterAndSounds([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean isGory)
  + ### onDeath\_ShouldDoSplatterAndSounds

    public boolean onDeath\_ShouldDoSplatterAndSounds([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean isGory)
  + ### TestIfSeen

    protected boolean TestIfSeen(int playerIndex,
    [IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### clearFallDamage

    public void clearFallDamage()
  + ### getImpactIsoSpeed

    public float getImpactIsoSpeed()
  + ### DoLand

    public void DoLand(float impactIsoSpeed)
  + ### handleLandingImpact

    protected void handleLandingImpact(zombie.characters.FallDamage fallDamage)
  + ### playPainVoicesFromFallDamage

    protected void playPainVoicesFromFallDamage(zombie.characters.FallDamage fallDamage)
  + ### getContextWorldContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContextWorldContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate)
  + ### getContextWorldContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContextWorldContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getContextWorldContainersInObjects

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContextWorldContainersInObjects([IsoObject](../iso/IsoObject.html "class in zombie.iso")[] contextObjects,
    T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getContextWorldSuitableContainersToDropCorpseInObjects

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContextWorldSuitableContainersToDropCorpseInObjects([IsoObject](../iso/IsoObject.html "class in zombie.iso")[] contextObjects)
  + ### getSuitableContainersToDropCorpseInSquare

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersToDropCorpseInSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getSuitableContainersToDropCorpseInSquare

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersToDropCorpseInSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> foundContainers)
  + ### getSuitableContainersToDropCorpse

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersToDropCorpse()
  + ### getSuitableContainersToDropCorpse

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersToDropCorpse([PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> foundContainers)
  + ### getContextWorldContainersWithHumanCorpse

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContextWorldContainersWithHumanCorpse([IsoObject](../iso/IsoObject.html "class in zombie.iso")[] contextObjects)
  + ### getSuitableContainersWithHumanCorpseInSquare

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersWithHumanCorpseInSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getSuitableContainersWithHumanCorpseInSquare

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getSuitableContainersWithHumanCorpseInSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> foundContainers)
  + ### canDropCorpseInto

    public static boolean canDropCorpseInto([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### canGrabCorpseFrom

    public static boolean canGrabCorpseFrom([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### canAccessContainer

    public boolean canAccessContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getContainerToolTip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerToolTip([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getFollowingTarget

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getFollowingTarget()
  + ### setFollowingTarget

    public void setFollowingTarget([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") followingTarget)
  + ### getLocalList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getLocalList()
  + ### getLocalNeutralList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getLocalNeutralList()
  + ### getLocalGroupList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getLocalGroupList()
  + ### getLocalRelevantEnemyList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getLocalRelevantEnemyList()
  + ### getDangerLevels

    public float getDangerLevels()
  + ### setDangerLevels

    public void setDangerLevels(float dangerLevels)
  + ### getPerkList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.PerkInfo](IsoGameCharacter.PerkInfo.html "class in zombie.characters")> getPerkList()
  + ### getLeaveBodyTimedown

    public float getLeaveBodyTimedown()
  + ### setLeaveBodyTimedown

    public void setLeaveBodyTimedown(float leaveBodyTimedown)
  + ### isAllowConversation

    public boolean isAllowConversation()
  + ### setAllowConversation

    public void setAllowConversation(boolean allowConversation)
  + ### getReanimateTimer

    public float getReanimateTimer()
  + ### setReanimateTimer

    public void setReanimateTimer(float reanimateTimer)
  + ### getReanimAnimFrame

    public int getReanimAnimFrame()
  + ### setReanimAnimFrame

    public void setReanimAnimFrame(int reanimAnimFrame)
  + ### getReanimAnimDelay

    public int getReanimAnimDelay()
  + ### setReanimAnimDelay

    public void setReanimAnimDelay(int reanimAnimDelay)
  + ### isReanim

    public boolean isReanim()
  + ### setReanim

    public void setReanim(boolean reanim)
  + ### isVisibleToNPCs

    public boolean isVisibleToNPCs()
  + ### setVisibleToNPCs

    public void setVisibleToNPCs(boolean visibleToNpcs)
  + ### getDieCount

    public int getDieCount()
  + ### setDieCount

    public void setDieCount(int dieCount)
  + ### getLlx

    public float getLlx()
  + ### setLlx

    public void setLlx(float llx)
  + ### getLly

    public float getLly()
  + ### setLly

    public void setLly(float lly)
  + ### getLlz

    public float getLlz()
  + ### setLlz

    public void setLlz(float llz)
  + ### getRemoteID

    public int getRemoteID()
  + ### setRemoteID

    public void setRemoteID(int remoteId)
  + ### getNumSurvivorsInVicinity

    public int getNumSurvivorsInVicinity()
  + ### setNumSurvivorsInVicinity

    public void setNumSurvivorsInVicinity(int numSurvivorsInVicinity)
  + ### getLevelUpMultiplier

    public float getLevelUpMultiplier()
  + ### setLevelUpMultiplier

    public void setLevelUpMultiplier(float levelUpMultiplier)
  + ### getXp

    public [IsoGameCharacter.XP](IsoGameCharacter.XP.html "class in zombie.characters") getXp()

    Specified by:
    :   `getXp` in interface `zombie.characters.ILuaGameCharacter`
  + ### setXp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setXp([IsoGameCharacter.XP](IsoGameCharacter.XP.html "class in zombie.characters") xp)

    Deprecated.
  + ### getLastLocalEnemies

    public int getLastLocalEnemies()
  + ### setLastLocalEnemies

    public void setLastLocalEnemies(int lastLocalEnemies)
  + ### getVeryCloseEnemyList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getVeryCloseEnemyList()
  + ### getLastKnownLocation

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters")> getLastKnownLocation()
  + ### getAttackedBy

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getAttackedBy()
  + ### setAttackedBy

    public void setAttackedBy([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") attackedBy)
  + ### isIgnoreStaggerBack

    public boolean isIgnoreStaggerBack()
  + ### setIgnoreStaggerBack

    public void setIgnoreStaggerBack(boolean ignoreStaggerBack)
  + ### getTimeThumping

    public int getTimeThumping()
  + ### setTimeThumping

    public void setTimeThumping(int timeThumping)
  + ### getPatienceMax

    public int getPatienceMax()
  + ### setPatienceMax

    public void setPatienceMax(int patienceMax)
  + ### getPatienceMin

    public int getPatienceMin()
  + ### setPatienceMin

    public void setPatienceMin(int patienceMin)
  + ### getPatience

    public int getPatience()
  + ### setPatience

    public void setPatience(int patience)
  + ### getCharacterActions

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.characters.CharacterTimedActions.BaseAction> getCharacterActions()

    Specified by:
    :   `getCharacterActions` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasTimedActions

    public boolean hasTimedActions()
  + ### isCurrentActionPathfinding

    public boolean isCurrentActionPathfinding()
  + ### isCurrentActionAllowedWhileDraggingCorpses

    public boolean isCurrentActionAllowedWhileDraggingCorpses()
  + ### checkCurrentAction

    public boolean checkCurrentAction(zombie.util.lambda.Invokers.Params1.Boolean.ICallback<zombie.characters.CharacterTimedActions.BaseAction> checkPredicate)
  + ### isImpactFromBehind

    public boolean isImpactFromBehind([Vector2](../iso/Vector2.html "class in zombie.iso") impactDir)
  + ### isImpactFromBehind

    public boolean isImpactFromBehind(float impactDirX,
    float impactDirY)
  + ### isImpactFromBehind

    public static boolean isImpactFromBehind(float chrForwardX,
    float chrForwardY,
    float impactDirX,
    float impactDirY)
  + ### getForwardDirection

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [Vector2](../iso/Vector2.html "class in zombie.iso") getForwardDirection()

    Deprecated.

    Returns reference to internal memory.   
    Which can then be modified externally, leading to undesired effects.

    Returns the forward direction vector.

    Returns:
    :   the forward direction vector.
  + ### getForwardDirectionX

    public float getForwardDirectionX()
  + ### getForwardDirectionY

    public float getForwardDirectionY()
  + ### getForwardDirection

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getForwardDirection([Vector2](../iso/Vector2.html "class in zombie.iso") forwardDirection)
  + ### setForwardDirection

    public void setForwardDirection([Vector2](../iso/Vector2.html "class in zombie.iso") dir)
  + ### setTargetAndCurrentDirection

    public void setTargetAndCurrentDirection(float directionX,
    float directionY)

    Specified by:
    :   `setTargetAndCurrentDirection` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `setTargetAndCurrentDirection` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### setForwardDirection

    public void setForwardDirection(float directionX,
    float directionY)

    Specified by:
    :   `setForwardDirection` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### zeroForwardDirectionX

    public void zeroForwardDirectionX()
  + ### zeroForwardDirectionY

    public void zeroForwardDirectionY()
  + ### getDirectionAngleRadians

    public float getDirectionAngleRadians()
  + ### getDirectionAngle

    public float getDirectionAngle()
  + ### setDirectionAngle

    public void setDirectionAngle(float angleDegrees)
  + ### getAnimAngle

    public float getAnimAngle()
  + ### getAnimAngleRadians

    public float getAnimAngleRadians()
  + ### getAnimVector

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAnimVector([Vector2](../iso/Vector2.html "class in zombie.iso") animForwardDirection)

    Deprecated.
  + ### getAnimForwardDirection

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAnimForwardDirection([Vector2](../iso/Vector2.html "class in zombie.iso") forwardDirection)

    Specified by:
    :   `getAnimForwardDirection` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### getLookAngleRadians

    public float getLookAngleRadians()
  + ### getLookVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getLookVector([Vector2](../iso/Vector2.html "class in zombie.iso") vector2)
  + ### getLookDirectionX

    public float getLookDirectionX()
  + ### getLookDirectionY

    public float getLookDirectionY()
  + ### isAnimatingBackwards

    public boolean isAnimatingBackwards()
  + ### getForwardMovementIsoDirection

    public [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getForwardMovementIsoDirection()

    Overrides:
    :   `getForwardMovementIsoDirection` in class `IsoObject`
  + ### setAnimatingBackwards

    public void setAnimatingBackwards(boolean isAnimatingBackwards)
  + ### isDraggingCorpse

    public boolean isDraggingCorpse()
  + ### getOwner

    public zombie.core.raknet.UdpConnection getOwner()
  + ### setOwner

    public void setOwner(zombie.core.raknet.UdpConnection connection)
  + ### getOwnerPlayer

    public [IsoPlayer](IsoPlayer.html "class in zombie.characters") getOwnerPlayer()
  + ### setOwnerPlayer

    public void setOwnerPlayer([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### getDotWithForwardDirection

    public float getDotWithForwardDirection([Vector3](../iso/Vector3.html "class in zombie.iso") bonePos)
  + ### getDotWithForwardDirection

    public float getDotWithForwardDirection(float targetX,
    float targetY)
  + ### getCardinalDirection

    public [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getCardinalDirection()
  + ### isAsleep

    public boolean isAsleep()

    Specified by:
    :   `isAsleep` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAsleep

    public void setAsleep(boolean asleep)

    Specified by:
    :   `setAsleep` in interface `zombie.characters.ILuaGameCharacter`
  + ### isResting

    public boolean isResting()

    Specified by:
    :   `isResting` in interface `zombie.characters.ILuaGameCharacter`
  + ### setIsResting

    public void setIsResting(boolean isResting)

    Specified by:
    :   `setIsResting` in interface `zombie.characters.ILuaGameCharacter`
  + ### getZombieKills

    public int getZombieKills()

    Specified by:
    :   `getZombieKills` in interface `zombie.characters.ILuaGameCharacter`
  + ### setZombieKills

    public void setZombieKills(int zombieKills)
  + ### getLastZombieKills

    public int getLastZombieKills()
  + ### setLastZombieKills

    public void setLastZombieKills(int lastZombieKills)
  + ### getForceWakeUpTime

    public float getForceWakeUpTime()
  + ### setForceWakeUpTime

    public void setForceWakeUpTime(float forceWakeUpTime)

    Specified by:
    :   `setForceWakeUpTime` in interface `zombie.characters.ILuaGameCharacter`
  + ### forceAwake

    public void forceAwake()
  + ### getBodyDamage

    public [BodyDamage](BodyDamage/BodyDamage.html "class in zombie.characters.BodyDamage") getBodyDamage()

    Specified by:
    :   `getBodyDamage` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### getBodyDamageRemote

    public [BodyDamage](BodyDamage/BodyDamage.html "class in zombie.characters.BodyDamage") getBodyDamageRemote()

    Specified by:
    :   `getBodyDamageRemote` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### resetBodyDamageRemote

    public void resetBodyDamageRemote()
  + ### getDefaultState

    public zombie.ai.State getDefaultState()
  + ### setDefaultState

    public void setDefaultState(zombie.ai.State defaultState)
  + ### getDescriptor

    public [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") getDescriptor()

    Specified by:
    :   `getDescriptor` in interface `zombie.characters.ILuaGameCharacter`
  + ### setDescriptor

    public void setDescriptor([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") descriptor)

    Specified by:
    :   `setDescriptor` in interface `zombie.characters.ILuaGameCharacter`
  + ### getFullName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullName()

    Specified by:
    :   `getFullName` in interface `zombie.characters.ILuaGameCharacter`
  + ### getVisual

    public zombie.core.skinnedmodel.visual.BaseVisual getVisual()

    Specified by:
    :   `getVisual` in interface `zombie.characters.ILuaGameCharacter`
  + ### getItemVisuals

    public [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") getItemVisuals()
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### isUsingWornItems

    public boolean isUsingWornItems()
  + ### getFamiliarBuildings

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoBuilding](../iso/areas/IsoBuilding.html "class in zombie.iso.areas")> getFamiliarBuildings()
  + ### getFinder

    public zombie.ai.astar.AStarPathFinderResult getFinder()
  + ### getFireKillRate

    public float getFireKillRate()
  + ### setFireKillRate

    public void setFireKillRate(float fireKillRate)
  + ### getFireSpreadProbability

    public int getFireSpreadProbability()
  + ### setFireSpreadProbability

    public void setFireSpreadProbability(int fireSpreadProbability)
  + ### getHealth

    public float getHealth()

    Specified by:
    :   `getHealth` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setHealth

    public void setHealth(float health)

    Specified by:
    :   `setHealth` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### isOnDeathDone

    public boolean isOnDeathDone()

    Specified by:
    :   `isOnDeathDone` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setOnDeathDone

    public void setOnDeathDone(boolean done)

    Specified by:
    :   `setOnDeathDone` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### isOnKillDone

    public boolean isOnKillDone()

    Specified by:
    :   `isOnKillDone` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setOnKillDone

    public void setOnKillDone(boolean done)

    Specified by:
    :   `setOnKillDone` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### isDeathDragDown

    public boolean isDeathDragDown()

    Specified by:
    :   `isDeathDragDown` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setDeathDragDown

    public void setDeathDragDown(boolean dragDown)

    Specified by:
    :   `setDeathDragDown` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### isPlayingDeathSound

    public boolean isPlayingDeathSound()

    Specified by:
    :   `isPlayingDeathSound` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setPlayingDeathSound

    public void setPlayingDeathSound(boolean playing)

    Specified by:
    :   `setPlayingDeathSound` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### getHurtSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHurtSound()
  + ### setHurtSound

    public void setHurtSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hurtSound)
  + ### isIgnoreMovementForDirection

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isIgnoreMovementForDirection()

    Deprecated.
  + ### getInventory

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getInventory()

    Specified by:
    :   `getInventory` in interface `zombie.characters.ILuaGameCharacter`
  + ### setInventory

    public void setInventory([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") inventory)
  + ### isPrimaryEquipped

    public boolean isPrimaryEquipped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getPrimaryHandItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getPrimaryHandItem()

    Specified by:
    :   `getPrimaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### setPrimaryHandItem

    public void setPrimaryHandItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") leftHandItem)

    Specified by:
    :   `setPrimaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### getAttackingWeapon

    public [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") getAttackingWeapon()
  + ### setEquipParent

    protected void setEquipParent([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") handItem,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newHandItem)
  + ### setEquipParent

    protected void setEquipParent([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") handItem,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newHandItem,
    boolean register)
  + ### initWornItems

    public void initWornItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodyLocationGroupName)
  + ### getWornItems

    public [WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") getWornItems()

    Specified by:
    :   `getWornItems` in interface `ILuaGameCharacterClothing`
  + ### setWornItems

    public void setWornItems([WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") other)

    Specified by:
    :   `setWornItems` in interface `ILuaGameCharacterClothing`
  + ### getWornItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)

    Specified by:
    :   `getWornItem` in interface `ILuaGameCharacterClothing`
  + ### setWornItem

    public void setWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setWornItem` in interface `ILuaGameCharacterClothing`
  + ### setWornItem

    public void setWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean forceDropTooHeavy)
  + ### removeWornItem

    public void removeWornItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `removeWornItem` in interface `ILuaGameCharacterClothing`
  + ### removeWornItem

    public void removeWornItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean forceDropTooHeavy)

    Specified by:
    :   `removeWornItem` in interface `ILuaGameCharacterClothing`
  + ### clearWornItems

    public void clearWornItems()

    Specified by:
    :   `clearWornItems` in interface `ILuaGameCharacterClothing`
  + ### getBodyLocationGroup

    public [BodyLocationGroup](WornItems/BodyLocationGroup.html "class in zombie.characters.WornItems") getBodyLocationGroup()

    Specified by:
    :   `getBodyLocationGroup` in interface `ILuaGameCharacterClothing`
  + ### onWornItemsChanged

    public void onWornItemsChanged()
  + ### initAttachedItems

    public void initAttachedItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName)
  + ### getAttachedItems

    public [AttachedItems](AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") getAttachedItems()

    Specified by:
    :   `getAttachedItems` in interface `ILuaGameCharacterAttachedItems`
  + ### setAttachedItems

    public void setAttachedItems([AttachedItems](AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") other)

    Specified by:
    :   `setAttachedItems` in interface `ILuaGameCharacterAttachedItems`
  + ### getAttachedItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getAttachedItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)

    Specified by:
    :   `getAttachedItem` in interface `ILuaGameCharacterAttachedItems`
  + ### setAttachedItem

    public void setAttachedItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setAttachedItem` in interface `ILuaGameCharacterAttachedItems`
  + ### removeAttachedItem

    public void removeAttachedItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `removeAttachedItem` in interface `ILuaGameCharacterAttachedItems`
  + ### clearAttachedItems

    public void clearAttachedItems()

    Specified by:
    :   `clearAttachedItems` in interface `ILuaGameCharacterAttachedItems`
  + ### getAttachedLocationGroup

    public [AttachedLocationGroup](AttachedItems/AttachedLocationGroup.html "class in zombie.characters.AttachedItems") getAttachedLocationGroup()

    Specified by:
    :   `getAttachedLocationGroup` in interface `ILuaGameCharacterAttachedItems`
  + ### getClothingWetness

    public zombie.characters.ClothingWetness getClothingWetness()
  + ### getClothingWetnessSync

    public zombie.characters.ClothingWetnessSync getClothingWetnessSync()
  + ### getClothingItem\_Head

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Head()
  + ### setClothingItem\_Head

    public void setClothingItem\_Head([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Head` in interface `ILuaGameCharacterClothing`
  + ### getClothingItem\_Torso

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Torso()
  + ### setClothingItem\_Torso

    public void setClothingItem\_Torso([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Torso` in interface `ILuaGameCharacterClothing`
  + ### getClothingItem\_Back

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Back()
  + ### setClothingItem\_Back

    public void setClothingItem\_Back([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Back` in interface `ILuaGameCharacterClothing`
  + ### getClothingItem\_Hands

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Hands()
  + ### setClothingItem\_Hands

    public void setClothingItem\_Hands([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Hands` in interface `ILuaGameCharacterClothing`
  + ### getClothingItem\_Legs

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Legs()
  + ### setClothingItem\_Legs

    public void setClothingItem\_Legs([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Legs` in interface `ILuaGameCharacterClothing`
  + ### getClothingItem\_Feet

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getClothingItem\_Feet()
  + ### setClothingItem\_Feet

    public void setClothingItem\_Feet([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `setClothingItem_Feet` in interface `ILuaGameCharacterClothing`
  + ### getNextWander

    public int getNextWander()
  + ### setNextWander

    public void setNextWander(int nextWander)
  + ### isOnFire

    public boolean isOnFire()

    Specified by:
    :   `isOnFire` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setOnFire

    public void setOnFire(boolean onFire)
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoMovingObject`
  + ### getPathIndex

    public int getPathIndex()
  + ### setPathIndex

    public void setPathIndex(int pathIndex)
  + ### getPathTargetX

    public int getPathTargetX()
  + ### getPathTargetY

    public int getPathTargetY()
  + ### getPathTargetZ

    public int getPathTargetZ()
  + ### getSecondaryHandItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getSecondaryHandItem()

    Specified by:
    :   `getSecondaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### setSecondaryHandItem

    public void setSecondaryHandItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") rightHandItem)

    Specified by:
    :   `setSecondaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### isHandItem

    public boolean isHandItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### isPrimaryHandItem

    public boolean isPrimaryHandItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isPrimaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### isSecondaryHandItem

    public boolean isSecondaryHandItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isSecondaryHandItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### isItemInBothHands

    public boolean isItemInBothHands([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isItemInBothHands` in interface `zombie.characters.ILuaGameCharacter`
  + ### removeFromHands

    public boolean removeFromHands([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `removeFromHands` in interface `zombie.characters.ILuaGameCharacter`
  + ### getSpeakColour

    public [Color](../core/Color.html "class in zombie.core") getSpeakColour()
  + ### setSpeakColour

    public void setSpeakColour([Color](../core/Color.html "class in zombie.core") speakColour)
  + ### setSpeakColourInfo

    public void setSpeakColourInfo([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") info)

    Specified by:
    :   `setSpeakColourInfo` in interface `zombie.characters.ILuaGameCharacter`
  + ### getSlowFactor

    public float getSlowFactor()
  + ### setSlowFactor

    public void setSlowFactor(float slowFactor)
  + ### getSlowTimer

    public float getSlowTimer()
  + ### setSlowTimer

    public void setSlowTimer(float slowTimer)
  + ### isbUseParts

    public boolean isbUseParts()
  + ### setbUseParts

    public void setbUseParts(boolean useParts)
  + ### isSpeaking

    public boolean isSpeaking()

    Specified by:
    :   `isSpeaking` in interface `zombie.characters.ILuaGameCharacter`
  + ### setSpeaking

    public void setSpeaking(boolean speaking)
  + ### getSpeakTime

    public float getSpeakTime()
  + ### setSpeakTime

    public void setSpeakTime(int speakTime)
  + ### getSpeedMod

    public float getSpeedMod()
  + ### setSpeedMod

    public void setSpeedMod(float speedMod)
  + ### getStaggerTimeMod

    public float getStaggerTimeMod()
  + ### setStaggerTimeMod

    public void setStaggerTimeMod(float staggerTimeMod)
  + ### getStateMachine

    public zombie.ai.StateMachine getStateMachine()
  + ### getMoodles

    public [Moodles](Moodles/Moodles.html "class in zombie.characters.Moodles") getMoodles()

    Specified by:
    :   `getMoodles` in interface `zombie.characters.ILuaGameCharacter`
  + ### getStats

    public [Stats](Stats.html "class in zombie.characters") getStats()

    Specified by:
    :   `getStats` in interface `zombie.characters.ILuaGameCharacter`
  + ### getUsedItemsOn

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUsedItemsOn()
  + ### getUseHandWeapon

    public [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") getUseHandWeapon()
  + ### setUseHandWeapon

    public void setUseHandWeapon([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") useHandWeapon)
  + ### getLegsSprite

    public [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") getLegsSprite()
  + ### setLegsSprite

    public void setLegsSprite([IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") legsSprite)
  + ### getAttackTargetSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getAttackTargetSquare()
  + ### setAttackTargetSquare

    public void setAttackTargetSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") attackTargetSquare)
  + ### getBloodImpactX

    public float getBloodImpactX()
  + ### setBloodImpactX

    public void setBloodImpactX(float bloodImpactX)
  + ### getBloodImpactY

    public float getBloodImpactY()
  + ### setBloodImpactY

    public void setBloodImpactY(float bloodImpactY)
  + ### getBloodImpactZ

    public float getBloodImpactZ()
  + ### setBloodImpactZ

    public void setBloodImpactZ(float bloodImpactZ)
  + ### getBloodSplat

    public [IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") getBloodSplat()
  + ### setBloodSplat

    public void setBloodSplat([IsoSprite](../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") bloodSplat)
  + ### isbOnBed

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isbOnBed()

    Deprecated.
  + ### setbOnBed

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setbOnBed(boolean onBed)

    Deprecated.
  + ### isOnBed

    public boolean isOnBed()
  + ### setOnBed

    public void setOnBed(boolean bOnBed)
  + ### getMoveForwardVec

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getMoveForwardVec()
  + ### setMoveForwardVec

    public void setMoveForwardVec([Vector2](../iso/Vector2.html "class in zombie.iso") moveForwardVec)
  + ### isPathing

    public boolean isPathing()
  + ### setPathing

    public void setPathing(boolean pathing)
  + ### getLocalEnemyList

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")> getLocalEnemyList()
  + ### getEnemyList

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")> getEnemyList()
  + ### getCharacterTraits

    public [CharacterTraits](traits/CharacterTraits.html "class in zombie.characters.traits") getCharacterTraits()

    Specified by:
    :   `getCharacterTraits` in interface `zombie.characters.ILuaGameCharacter`
  + ### getMaxWeight

    public int getMaxWeight()

    Specified by:
    :   `getMaxWeight` in interface `zombie.characters.ILuaGameCharacter`
  + ### setMaxWeight

    public void setMaxWeight(int maxWeight)
  + ### getMaxWeightBase

    public int getMaxWeightBase()
  + ### setMaxWeightBase

    public void setMaxWeightBase(int maxWeightBase)
  + ### getSleepingTabletDelta

    public float getSleepingTabletDelta()
  + ### setSleepingTabletDelta

    public void setSleepingTabletDelta(float sleepingTabletDelta)
  + ### getBetaEffect

    public float getBetaEffect()
  + ### setBetaEffect

    public void setBetaEffect(float betaEffect)
  + ### getDepressEffect

    public float getDepressEffect()
  + ### setDepressEffect

    public void setDepressEffect(float depressEffect)
  + ### getSleepingTabletEffect

    public float getSleepingTabletEffect()

    Specified by:
    :   `getSleepingTabletEffect` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### setSleepingTabletEffect

    public void setSleepingTabletEffect(float sleepingTabletEffect)

    Specified by:
    :   `setSleepingTabletEffect` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### getBetaDelta

    public float getBetaDelta()
  + ### setBetaDelta

    public void setBetaDelta(float betaDelta)
  + ### getDepressDelta

    public float getDepressDelta()
  + ### setDepressDelta

    public void setDepressDelta(float depressDelta)
  + ### getPainEffect

    public float getPainEffect()
  + ### setPainEffect

    public void setPainEffect(float painEffect)
  + ### getPainDelta

    public float getPainDelta()
  + ### setPainDelta

    public void setPainDelta(float painDelta)
  + ### isbDoDefer

    public boolean isbDoDefer()
  + ### setbDoDefer

    public void setbDoDefer(boolean doDefer)
  + ### getLastHeardSound

    public [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters") getLastHeardSound()
  + ### setLastHeardSound

    public void setLastHeardSound(int x,
    int y,
    int z)
  + ### isClimbing

    public boolean isClimbing()
  + ### setbClimbing

    public void setbClimbing(boolean climbing)
  + ### isLastCollidedW

    public boolean isLastCollidedW()
  + ### setLastCollidedW

    public void setLastCollidedW(boolean lastCollidedW)
  + ### isLastCollidedN

    public boolean isLastCollidedN()
  + ### setLastCollidedN

    public void setLastCollidedN(boolean lastCollidedN)
  + ### getFallTime

    public float getFallTime()
  + ### getFallSpeedSeverity

    public zombie.characters.FallSeverity getFallSpeedSeverity()
  + ### setFallTime

    public void setFallTime(float fallTime)
  + ### getLastFallSpeed

    public float getLastFallSpeed()
  + ### setLastFallSpeed

    public void setLastFallSpeed(float lastFallSpeed)
  + ### isbFalling

    public boolean isbFalling()
  + ### setbFalling

    public void setbFalling(boolean falling)
  + ### getCurrentBuildingDef

    public [BuildingDef](../iso/BuildingDef.html "class in zombie.iso") getCurrentBuildingDef()
  + ### getCurrentRoomDef

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getCurrentRoomDef()
  + ### getTorchStrength

    public float getTorchStrength()
  + ### getAnimEventBroadcaster

    public zombie.core.skinnedmodel.advancedanimation.events.AnimEventBroadcaster getAnimEventBroadcaster()

    Specified by:
    :   `getAnimEventBroadcaster` in interface `zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster`
  + ### OnAnimEvent

    public void OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer sender,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)

    Specified by:
    :   `OnAnimEvent` in interface `zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback`
  + ### dbgOnGlobalAnimEvent

    private static void dbgOnGlobalAnimEvent([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_SetVariable

    private void OnAnimEvent\_SetVariable([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableReference animReference,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") variableValue)
  + ### OnAnimEvent\_ClearVariable

    private void OnAnimEvent\_ClearVariable([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") variableName)
  + ### OnAnimEvent\_PlaySound

    private void OnAnimEvent\_PlaySound([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### OnAnimEvent\_PlaySoundNoBlend

    private void OnAnimEvent\_PlaySoundNoBlend([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)
  + ### OnAnimEvent\_Footstep

    private void OnAnimEvent\_Footstep([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### OnAnimEvent\_DamageWhileInTrees

    private void OnAnimEvent\_DamageWhileInTrees([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner)
  + ### OnAnimEvent\_TurnAround

    private void OnAnimEvent\_TurnAround([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    boolean instant)
  + ### OnAnimEvent\_TurnAroundFlipSkeleton

    private void OnAnimEvent\_TurnAroundFlipSkeleton([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") boneName)
  + ### OnAnimEvent\_SetSharedGrappleType

    private void OnAnimEvent\_SetSharedGrappleType([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sharedGrappleType)
  + ### onRagdollSimulationStarted

    public void onRagdollSimulationStarted()
  + ### damageWhileInTrees

    protected void damageWhileInTrees()
  + ### getHammerSoundMod

    public float getHammerSoundMod()

    Specified by:
    :   `getHammerSoundMod` in interface `zombie.characters.ILuaGameCharacter`
  + ### getWeldingSoundMod

    public float getWeldingSoundMod()

    Specified by:
    :   `getWeldingSoundMod` in interface `zombie.characters.ILuaGameCharacter`
  + ### getBarricadeTimeMod

    public float getBarricadeTimeMod()
  + ### getMetalBarricadeStrengthMod

    public float getMetalBarricadeStrengthMod()
  + ### getBarricadeStrengthMod

    public float getBarricadeStrengthMod()
  + ### getSneakSpotMod

    public float getSneakSpotMod()
  + ### getNimbleMod

    public float getNimbleMod()
  + ### getFatigueMod

    public float getFatigueMod()

    Specified by:
    :   `getFatigueMod` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### getLightfootMod

    public float getLightfootMod()
  + ### getPacingMod

    public float getPacingMod()
  + ### getHyperthermiaMod

    public float getHyperthermiaMod()
  + ### getHittingMod

    public float getHittingMod()
  + ### getShovingMod

    public float getShovingMod()
  + ### getRecoveryMod

    public float getRecoveryMod()
  + ### getWeightMod

    public float getWeightMod()
  + ### getHitChancesMod

    public int getHitChancesMod()
  + ### getSprintMod

    public float getSprintMod()
  + ### getPerkLevel

    public int getPerkLevel([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perks)

    Specified by:
    :   `getPerkLevel` in interface `zombie.characters.ILuaGameCharacter`
  + ### setPerkLevelDebug

    public void setPerkLevelDebug([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perks,
    int level)

    Specified by:
    :   `setPerkLevelDebug` in interface `zombie.characters.ILuaGameCharacter`
  + ### LoseLevel

    public void LoseLevel([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)

    Specified by:
    :   `LoseLevel` in interface `zombie.characters.ILuaGameCharacter`
  + ### LevelPerk

    public void LevelPerk([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    boolean removePick)

    Specified by:
    :   `LevelPerk` in interface `zombie.characters.ILuaGameCharacter`
  + ### LevelPerk

    public void LevelPerk([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)

    Specified by:
    :   `LevelPerk` in interface `zombie.characters.ILuaGameCharacter`
  + ### level0

    public void level0([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)
  + ### getLastKnownLocationOf

    public [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters") getLastKnownLocationOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") character)
  + ### ReadLiterature

    public void ReadLiterature([Literature](../inventory/types/Literature.html "class in zombie.inventory.types") literature)

    Specified by:
    :   `ReadLiterature` in interface `zombie.characters.ILuaGameCharacter`
  + ### OnDeath

    public void OnDeath()
  + ### splatBloodFloorBig

    public void splatBloodFloorBig()
  + ### splatBloodFloor

    public void splatBloodFloor()
  + ### getThreatLevel

    public int getThreatLevel()
  + ### isDead

    public boolean isDead()
  + ### isAlive

    public boolean isAlive()
  + ### isEditingRagdoll

    public boolean isEditingRagdoll()
  + ### setEditingRagdoll

    public void setEditingRagdoll(boolean value)
  + ### isRagdoll

    public boolean isRagdoll()
  + ### isFullyRagdolling

    public boolean isFullyRagdolling()
  + ### setRagdollFall

    public void setRagdollFall(boolean value)
  + ### isRagdollFall

    public boolean isRagdollFall()
  + ### isVehicleCollision

    public boolean isVehicleCollision()
  + ### setVehicleCollision

    public void setVehicleCollision(boolean value)
  + ### useRagdollVehicleCollision

    public boolean useRagdollVehicleCollision()
  + ### isUpright

    public boolean isUpright()
  + ### isOnBack

    public boolean isOnBack()
  + ### usePhysicHitReaction

    public boolean usePhysicHitReaction()
  + ### setUsePhysicHitReaction

    public void setUsePhysicHitReaction(boolean usePhysicHitReaction)
  + ### isRagdollSimulationActive

    public boolean isRagdollSimulationActive()
  + ### Seen

    public void Seen([Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> seenList)
  + ### CanSee

    public boolean CanSee([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") obj)
  + ### CanSee

    public boolean CanSee([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getLowDangerInVicinity

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getLowDangerInVicinity(int attempts,
    int range)
  + ### hasEquipped

    public boolean hasEquipped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)

    Specified by:
    :   `hasEquipped` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasEquippedTag

    public boolean hasEquippedTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)

    Specified by:
    :   `hasEquippedTag` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasWornTag

    public boolean hasWornTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)

    Specified by:
    :   `hasWornTag` in interface `zombie.characters.ILuaGameCharacter`
  + ### setForwardIsoDirection

    public void setForwardIsoDirection([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") directions)

    Specified by:
    :   `setForwardIsoDirection` in interface `ILuaIsoObject`

    Overrides:
    :   `setForwardIsoDirection` in class `IsoObject`
  + ### setForwardDirectionFromIsoDirection

    public void setForwardDirectionFromIsoDirection()
  + ### setForwardDirectionFromAnimAngle

    public void setForwardDirectionFromAnimAngle()
  + ### Callout

    public void Callout(boolean doAnim)
  + ### Callout

    public void Callout()

    Specified by:
    :   `Callout` in interface `zombie.characters.ILuaGameCharacter`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separatorStr)

    Overrides:
    :   `getDescription` in class `IsoMovingObject`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### getChatElement

    public zombie.chat.ChatElement getChatElement()
  + ### StartAction

    public void StartAction(zombie.characters.CharacterTimedActions.BaseAction act)

    Specified by:
    :   `StartAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### QueueAction

    public void QueueAction(zombie.characters.CharacterTimedActions.BaseAction act)
  + ### StopAllActionQueue

    public void StopAllActionQueue()

    Specified by:
    :   `StopAllActionQueue` in interface `zombie.characters.ILuaGameCharacter`
  + ### StopAllActionQueueRunning

    public void StopAllActionQueueRunning()
  + ### StopAllActionQueueAiming

    public void StopAllActionQueueAiming()
  + ### StopAllActionQueueWalking

    public void StopAllActionQueueWalking()
  + ### GetAnimSetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetAnimSetName()

    Specified by:
    :   `GetAnimSetName` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### SleepingTablet

    public void SleepingTablet(float sleepingTabletDelta)
  + ### BetaBlockers

    public void BetaBlockers(float delta)
  + ### BetaAntiDepress

    public void BetaAntiDepress(float delta)
  + ### PainMeds

    public void PainMeds(float delta)
  + ### initSpritePartsEmpty

    public void initSpritePartsEmpty()

    Specified by:
    :   `initSpritePartsEmpty` in interface `zombie.characters.ILuaGameCharacter`
  + ### InitSpriteParts

    public void InitSpriteParts([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)
  + ### hasTrait

    public boolean hasTrait([CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)

    Specified by:
    :   `hasTrait` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasTrait

    public boolean hasTrait([CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")... characterTrait)
  + ### ApplyInBedOffset

    public void ApplyInBedOffset(boolean apply)
  + ### Dressup

    public void Dressup([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)

    Specified by:
    :   `Dressup` in interface `ILuaGameCharacterClothing`
  + ### setPathSpeed

    public void setPathSpeed(float speed)
  + ### PlayAnim

    public void PlayAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)

    Specified by:
    :   `PlayAnim` in interface `zombie.characters.ILuaGameCharacter`
  + ### PlayAnimWithSpeed

    public void PlayAnimWithSpeed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string,
    float framesSpeedPerFrame)

    Specified by:
    :   `PlayAnimWithSpeed` in interface `zombie.characters.ILuaGameCharacter`
  + ### PlayAnimUnlooped

    public void PlayAnimUnlooped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)

    Specified by:
    :   `PlayAnimUnlooped` in interface `zombie.characters.ILuaGameCharacter`
  + ### DirectionFromVector

    public void DirectionFromVector([Vector2](../iso/Vector2.html "class in zombie.iso") vecA)
  + ### DoFootstepSound

    public void DoFootstepSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### DoFootstepSound

    public void DoFootstepSound(float volume)
  + ### Eat

    public boolean Eat([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    float percentage)

    Specified by:
    :   `Eat` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### EatOnClient

    public boolean EatOnClient([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    float percentage)
  + ### Eat

    public boolean Eat([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    float percentage,
    boolean useUtensil)

    Specified by:
    :   `Eat` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### Eat

    public boolean Eat([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info)

    Specified by:
    :   `Eat` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### DrinkFluid

    public boolean DrinkFluid([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    float percentage)

    Specified by:
    :   `DrinkFluid` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### DrinkFluid

    public boolean DrinkFluid([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    float percentage,
    boolean useUtensil)

    Specified by:
    :   `DrinkFluid` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### DrinkFluid

    public boolean DrinkFluid([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") fluidCont,
    float percentage)

    Specified by:
    :   `DrinkFluid` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### DrinkFluid

    public boolean DrinkFluid([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") fluidCont,
    float percentage,
    boolean useUtensil)

    Specified by:
    :   `DrinkFluid` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### DrinkFluid

    public boolean DrinkFluid([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info)

    Specified by:
    :   `DrinkFluid` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### FireCheck

    public void FireCheck()
  + ### getPrimaryHandType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPrimaryHandType()
  + ### getChestHeight

    public float getChestHeight()
  + ### getAimOriginPosX

    public float getAimOriginPosX()
  + ### getAimOriginPosY

    public float getAimOriginPosY()
  + ### getAimOriginPosZ

    public float getAimOriginPosZ()
  + ### getGlobalMovementMod

    public float getGlobalMovementMod(boolean bDoNoises)

    Overrides:
    :   `getGlobalMovementMod` in class `IsoMovingObject`
  + ### getMovementSpeed

    public float getMovementSpeed()
  + ### getSecondaryHandType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSecondaryHandType()
  + ### HasItem

    public boolean HasItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### changeState

    public void changeState(zombie.ai.State state)

    Specified by:
    :   `changeState` in interface `zombie.ai.IStateCharacter`
  + ### getCurrentState

    public zombie.ai.State getCurrentState()

    Specified by:
    :   `getCurrentState` in interface `zombie.ai.IStateCharacter`
  + ### isCurrentState

    public boolean isCurrentState(zombie.ai.State state)

    Specified by:
    :   `isCurrentState` in interface `zombie.ai.IStateCharacter`
  + ### isCurrentGameClientState

    public boolean isCurrentGameClientState(zombie.ai.State state)
  + ### set

    public <T> void set(zombie.ai.State.Param<T> state,
    T value)
  + ### get

    public <T> T get(zombie.ai.State.Param<T> state)
  + ### get

    public <T> T get(zombie.ai.State.Param<T> state,
    T defaultT)
  + ### remove

    public <T> T remove(zombie.ai.State.Param<T> state)
  + ### clear

    public void clear(zombie.ai.State state)
  + ### clear

    public void clear([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends zombie.ai.State> clazz)
  + ### getStateMachineParams

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.ai.State.Param<?>, [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> getStateMachineParams([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> clazz)
  + ### setStateMachineLocked

    public void setStateMachineLocked(boolean val)
  + ### Hit

    public float Hit([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    float damageSplit,
    boolean bIgnoreDamage,
    float modDelta)

    Specified by:
    :   `Hit` in interface `zombie.characters.ILuaGameCharacterDamage`

    Overrides:
    :   `Hit` in class `IsoMovingObject`
  + ### Hit

    public float Hit([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    float damageSplit,
    boolean bIgnoreDamage,
    float modDelta,
    boolean bRemote)

    Specified by:
    :   `Hit` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### calculateHitDirection

    private void calculateHitDirection([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder)
  + ### processInstantExplosionHitDamage

    private float processInstantExplosionHitDamage([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    float damage,
    boolean bIgnoreDamage,
    float modDelta)
  + ### processHitDamage

    public float processHitDamage([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    float damageSplit,
    boolean bIgnoreDamage,
    float modDelta)
  + ### hitConsequences

    public void hitConsequences([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean bIgnoreDamage,
    float damage,
    boolean bRemote)
  + ### IsAttackRange

    public boolean IsAttackRange(float x,
    float y,
    float z)
  + ### isMeleeAttackRange

    public boolean isMeleeAttackRange([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon,
    [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") isoMovingObject,
    [Vector3](../iso/Vector3.html "class in zombie.iso") bonePos)
  + ### IsSpeaking

    public boolean IsSpeaking()

    Specified by:
    :   `IsSpeaking` in interface `zombie.characters.ILuaGameCharacter`

    Specified by:
    :   `IsSpeaking` in interface `zombie.characters.Talker`
  + ### IsSpeakingNPC

    public boolean IsSpeakingNPC()
  + ### MoveForward

    public void MoveForward(float dist,
    float x,
    float y,
    float soundDelta)
  + ### CanUsePathfindState

    protected boolean CanUsePathfindState()
  + ### pathToAux

    protected void pathToAux(float x,
    float y,
    float z)
  + ### pathToCharacter

    public void pathToCharacter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target)
  + ### pathToLocation

    public void pathToLocation(int x,
    int y,
    int z)

    Specified by:
    :   `pathToLocation` in interface `zombie.characters.ILuaGameCharacter`
  + ### pathToLocationF

    public void pathToLocationF(float x,
    float y,
    float z)

    Specified by:
    :   `pathToLocationF` in interface `zombie.characters.ILuaGameCharacter`
  + ### pathToSound

    public void pathToSound(int x,
    int y,
    int z)
  + ### CanAttack

    public boolean CanAttack()
  + ### isEnduranceSufficientForAction

    public boolean isEnduranceSufficientForAction()

    Specified by:
    :   `isEnduranceSufficientForAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### ReduceHealthWhenBurning

    public void ReduceHealthWhenBurning()
  + ### DrawSneezeText

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void DrawSneezeText()

    Deprecated.
  + ### getSpriteDef

    public [IsoSpriteInstance](../iso/sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") getSpriteDef()

    Specified by:
    :   `getSpriteDef` in interface `zombie.characters.ILuaGameCharacter`
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoChild,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Attempt to render this Renderable.   
    It will not draw if isSceneCulled == TRUE,   
    or if isDoRender == FALSE

    Specified by:
    :   `render` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `render` in class `IsoObject`
  + ### renderServerGUI

    public void renderServerGUI()
  + ### getAlphaUpdateRateMul

    protected float getAlphaUpdateRateMul()

    Overrides:
    :   `getAlphaUpdateRateMul` in class `IsoObject`
  + ### isUpdateAlphaDuringRender

    protected boolean isUpdateAlphaDuringRender()

    Overrides:
    :   `isUpdateAlphaDuringRender` in class `IsoObject`
  + ### isSeatedInVehicle

    public boolean isSeatedInVehicle()
  + ### renderObjectPicker

    public void renderObjectPicker(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)

    Overrides:
    :   `renderObjectPicker` in class `IsoObject`
  + ### closestpointonline

    private static [Vector2](../iso/Vector2.html "class in zombie.iso") closestpointonline(double lx1,
    double ly1,
    double lx2,
    double ly2,
    double x0,
    double y0,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### calculateShadowParams

    public zombie.iso.objects.ShadowParams calculateShadowParams(zombie.iso.objects.ShadowParams sp)
  + ### calculateShadowParams

    public static zombie.iso.objects.ShadowParams calculateShadowParams(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer,
    float animalSize,
    boolean bRagdoll,
    zombie.iso.objects.ShadowParams sp)
  + ### renderShadow

    public void renderShadow(float x,
    float y,
    float z)
  + ### checkUpdateModelTextures

    public void checkUpdateModelTextures()
  + ### isMaskClicked

    public boolean isMaskClicked(int x,
    int y,
    boolean flip)

    Overrides:
    :   `isMaskClicked` in class `IsoObject`
  + ### setHaloNote

    public void setHaloNote([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)

    Specified by:
    :   `setHaloNote` in interface `zombie.characters.ILuaGameCharacter`
  + ### setHaloNote

    public void setHaloNote([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    float dispTime)

    Specified by:
    :   `setHaloNote` in interface `zombie.characters.ILuaGameCharacter`
  + ### setHaloNote

    public void setHaloNote([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int r,
    int g,
    int b,
    float dispTime)

    Specified by:
    :   `setHaloNote` in interface `zombie.characters.ILuaGameCharacter`
  + ### getHaloTimerCount

    public float getHaloTimerCount()
  + ### DoSneezeText

    public void DoSneezeText()
  + ### getSayLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSayLine()

    Specified by:
    :   `getSayLine` in interface `zombie.characters.Talker`
  + ### setSayLine

    public void setSayLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sayLine)
  + ### getLastChatMessage

    public [ChatMessage](../chat/ChatMessage.html "class in zombie.chat") getLastChatMessage()
  + ### setLastChatMessage

    public void setLastChatMessage([ChatMessage](../chat/ChatMessage.html "class in zombie.chat") lastChatMessage)
  + ### getLastSpokenLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastSpokenLine()
  + ### setLastSpokenLine

    public void setLastSpokenLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### doSleepSpeech

    protected void doSleepSpeech()
  + ### SayDebug

    public void SayDebug([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### SayDebug

    public void SayDebug(int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getMaxChatLines

    public int getMaxChatLines()
  + ### Say

    public void Say([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)

    Specified by:
    :   `Say` in interface `zombie.characters.ILuaGameCharacter`

    Specified by:
    :   `Say` in interface `zombie.characters.Talker`
  + ### Say

    public void Say([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [UIFont](../ui/UIFont.html "enum class in zombie.ui") font,
    float baseRange,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag)

    Specified by:
    :   `Say` in interface `zombie.characters.ILuaGameCharacter`
  + ### SayWhisper

    public void SayWhisper([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### SayShout

    public void SayShout([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### SayRadio

    public void SayRadio([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [UIFont](../ui/UIFont.html "enum class in zombie.ui") font,
    float baseRange,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag)
  + ### ProcessSay

    private void ProcessSay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    float baseRange,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag)
  + ### addLineChatElement

    public void addLineChatElement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### addLineChatElement

    public void addLineChatElement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b)
  + ### addLineChatElement

    public void addLineChatElement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [UIFont](../ui/UIFont.html "enum class in zombie.ui") font,
    float baseRange,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag)
  + ### addLineChatElement

    public void addLineChatElement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [UIFont](../ui/UIFont.html "enum class in zombie.ui") font,
    float baseRange,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag,
    boolean bbcode,
    boolean img,
    boolean icons,
    boolean colors,
    boolean fonts,
    boolean equalizeHeights)
  + ### playerIsSelf

    protected boolean playerIsSelf()
  + ### getUserNameHeight

    public int getUserNameHeight()
  + ### initTextObjects

    protected void initTextObjects()
  + ### updateUserName

    protected void updateUserName()
  + ### checkPVP

    private boolean checkPVP()
  + ### updateTextObjects

    public void updateTextObjects()
  + ### getNameCoords

    public static void getNameCoords(float x,
    float y,
    float z,
    float offX,
    float offY,
    float zoom,
    [Vector2](../iso/Vector2.html "class in zombie.iso") coord)
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `IsoMovingObject`
  + ### debugRenderLast

    private void debugRenderLast()
  + ### drawLine

    public void drawLine([Vector2](../iso/Vector2.html "class in zombie.iso") startPos,
    [Vector2](../iso/Vector2.html "class in zombie.iso") dir,
    float length,
    float r,
    float g,
    float b)
  + ### calcCarForwardVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarForwardVector()
  + ### carMovingBackward

    public boolean carMovingBackward([Vector2](../iso/Vector2.html "class in zombie.iso") carSpeed)
  + ### calcCarPositionOffset

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarPositionOffset(boolean movingBackward)
  + ### calcLengthMultiplier

    public float calcLengthMultiplier([Vector2](../iso/Vector2.html "class in zombie.iso") carSpeed,
    boolean movingBackward)
  + ### calcCarSpeedVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarSpeedVector([Vector2](../iso/Vector2.html "class in zombie.iso") offset)
  + ### calcCarSpeedVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarSpeedVector()
  + ### calcCarToPlayerVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarToPlayerVector([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target,
    [Vector2](../iso/Vector2.html "class in zombie.iso") offset)
  + ### calcCarToPlayerVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") calcCarToPlayerVector([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target)
  + ### calcConeAngleOffset

    public float calcConeAngleOffset([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target,
    boolean movingBackward)
  + ### calcConeAngleMultiplier

    public float calcConeAngleMultiplier([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target,
    boolean movingBackward)
  + ### renderTextureInsteadOfModel

    protected boolean renderTextureInsteadOfModel(float x,
    float y)
  + ### drawDirectionLine

    public void drawDirectionLine([Vector2](../iso/Vector2.html "class in zombie.iso") dir,
    float length,
    float r,
    float g,
    float b)
  + ### drawDirectionLine

    public void drawDirectionLine([Vector3](../iso/Vector3.html "class in zombie.iso") dir,
    float length,
    float r,
    float g,
    float b)
  + ### drawDebugTextBelow

    public void drawDebugTextBelow([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getEquipedRadio

    public [Radio](../inventory/types/Radio.html "class in zombie.inventory.types") getEquipedRadio()
  + ### radioEquipedCheck

    private void radioEquipedCheck()
  + ### debugAim

    private void debugAim()
  + ### debugTestDotSide

    private void debugTestDotSide()
  + ### debugVision

    private void debugVision()
  + ### setDefaultState

    public void setDefaultState()
  + ### SetOnFire

    public void SetOnFire()
  + ### StopBurning

    public void StopBurning()

    Specified by:
    :   `StopBurning` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### SpreadFireMP

    public void SpreadFireMP()
  + ### SpreadFire

    public void SpreadFire()
  + ### Throw

    public void Throw([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)
  + ### helmetFall

    public boolean helmetFall(boolean hitHead)
  + ### helmetFallFromWornItems

    private boolean helmetFallFromWornItems(boolean hitHead)
  + ### smashCarWindow

    public void smashCarWindow([VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `smashCarWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### smashWindow

    public void smashWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") w)

    Specified by:
    :   `smashWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### openWindow

    public void openWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") w)

    Specified by:
    :   `openWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### closeWindow

    public void closeWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") w)

    Specified by:
    :   `closeWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbThroughWindow

    public void climbThroughWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") w)

    Specified by:
    :   `climbThroughWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbThroughWindow

    public void climbThroughWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") w,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") startingFrame)

    Specified by:
    :   `climbThroughWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### isClosingWindow

    public boolean isClosingWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### isClimbingThroughWindow

    public boolean isClimbingThroughWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### climbThroughWindowFrame

    public void climbThroughWindowFrame([IsoWindowFrame](../iso/objects/IsoWindowFrame.html "class in zombie.iso.objects") windowFrame)

    Specified by:
    :   `climbThroughWindowFrame` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbSheetRope

    public void climbSheetRope()

    Specified by:
    :   `climbSheetRope` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbDownSheetRope

    public void climbDownSheetRope()

    Specified by:
    :   `climbDownSheetRope` in interface `zombie.characters.ILuaGameCharacter`
  + ### canClimbSheetRope

    public boolean canClimbSheetRope([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)

    Specified by:
    :   `canClimbSheetRope` in interface `zombie.characters.ILuaGameCharacter`
  + ### canClimbDownSheetRopeInCurrentSquare

    public boolean canClimbDownSheetRopeInCurrentSquare()

    Specified by:
    :   `canClimbDownSheetRopeInCurrentSquare` in interface `zombie.characters.ILuaGameCharacter`
  + ### canClimbDownSheetRope

    public boolean canClimbDownSheetRope([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)

    Specified by:
    :   `canClimbDownSheetRope` in interface `zombie.characters.ILuaGameCharacter`
  + ### getCardinalDirectionTo

    protected [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getCardinalDirectionTo([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    boolean north)
  + ### climbThroughWindow

    public void climbThroughWindow([IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") w)

    Specified by:
    :   `climbThroughWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbThroughWindow

    public void climbThroughWindow([IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") w,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") startingFrame)

    Specified by:
    :   `climbThroughWindow` in interface `zombie.characters.ILuaGameCharacter`
  + ### climbOverFence

    public void climbOverFence([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)

    Specified by:
    :   `climbOverFence` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAboveTopOfStairs

    public boolean isAboveTopOfStairs()

    Specified by:
    :   `isAboveTopOfStairs` in interface `zombie.characters.ILuaGameCharacter`
  + ### throwGrappledTargetOutWindow

    public void throwGrappledTargetOutWindow([IsoObject](../iso/IsoObject.html "class in zombie.iso") windowObject)
  + ### throwGrappledOverFence

    public void throwGrappledOverFence([IsoObject](../iso/IsoObject.html "class in zombie.iso") hoppableObject,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### throwGrappledIntoInventory

    public void throwGrappledIntoInventory([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") targetContainer)
  + ### pickUpCorpseItem

    public void pickUpCorpseItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### pickUpCorpse

    public void pickUpCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dragType)
  + ### calculateGrappleEffectivenessFromTraits

    public float calculateGrappleEffectivenessFromTraits()
  + ### preupdate

    public void preupdate()

    Overrides:
    :   `preupdate` in class `IsoMovingObject`
  + ### updateAnimationTimeDelta

    private void updateAnimationTimeDelta()

    Calculates this character's animation time-delta timeScale
    Also determines whether this character should update its animation, state, and actionContext this frame.
  + ### allowsInvisibleAnimationSkips

    public boolean allowsInvisibleAnimationSkips()
  + ### updateHandEquips

    public void updateHandEquips()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoMovingObject`
  + ### isPushedByForSeparate

    public boolean isPushedByForSeparate([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other)

    Overrides:
    :   `isPushedByForSeparate` in class `IsoMovingObject`
  + ### slideAwayFromWalls

    protected void slideAwayFromWalls(float radius,
    boolean instant,
    boolean includePolyCollisions)

    Overrides:
    :   `slideAwayFromWalls` in class `IsoMovingObject`
  + ### resolveCollisionWithNeighboringSquares

    private boolean resolveCollisionWithNeighboringSquares(float inRadius,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") newPos)
  + ### setHitDir

    public void setHitDir([Vector2](../iso/Vector2.html "class in zombie.iso") hitDir)

    Overrides:
    :   `setHitDir` in class `IsoMovingObject`
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()

    Overrides:
    :   `getMinimumSimulationLevel` in class `IsoMovingObject`
  + ### setHitDirEnum

    private void setHitDirEnum([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitDirEnum)
  + ### getHitDirEnum

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHitDirEnum()
  + ### determineHitDirEnum

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") determineHitDirEnum([Vector2](../iso/Vector2.html "class in zombie.iso") hitDir)
  + ### updateInternal

    private void updateInternal()
  + ### isInGrapplerState

    private boolean isInGrapplerState()
  + ### updateSeenVisibility

    private void updateSeenVisibility()
  + ### updateSeenVisibility

    private void updateSeenVisibility(int playerIndex)
  + ### recursiveItemUpdater

    private void recursiveItemUpdater([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### recursiveItemUpdater

    private void recursiveItemUpdater([InventoryContainer](../inventory/types/InventoryContainer.html "class in zombie.inventory.types") container)
  + ### updateDirt

    private void updateDirt()
  + ### updateMovementMomentum

    protected void updateMovementMomentum()
  + ### getHoursSurvived

    public double getHoursSurvived()

    Specified by:
    :   `getHoursSurvived` in interface `zombie.characters.ILuaGameCharacter`
  + ### updateBeardAndHair

    private void updateBeardAndHair()
  + ### updateFalling

    private void updateFalling()
  + ### shouldSnapZToCurrentSquare

    public boolean shouldSnapZToCurrentSquare()

    Overrides:
    :   `shouldSnapZToCurrentSquare` in class `IsoMovingObject`
  + ### shouldBeFalling

    public boolean shouldBeFalling()
  + ### getHeightAboveFloor

    public float getHeightAboveFloor()
  + ### updateMovementRates

    protected void updateMovementRates()
  + ### calculateIdleSpeed

    protected float calculateIdleSpeed()
  + ### calculateBaseSpeed

    public float calculateBaseSpeed()
  + ### calcRunSpeedModByClothing

    private float calcRunSpeedModByClothing()
  + ### calcRunSpeedModByBag

    private float calcRunSpeedModByBag([InventoryContainer](../inventory/types/InventoryContainer.html "class in zombie.inventory.types") bag)
  + ### calculateCombatSpeed

    public float calculateCombatSpeed()
  + ### getArmsInjurySpeedModifier

    private float getArmsInjurySpeedModifier()
  + ### getFootInjurySpeedModifier

    protected float getFootInjurySpeedModifier()
  + ### calculateInjurySpeed

    private float calculateInjurySpeed([BodyPart](BodyDamage/BodyPart.html "class in zombie.characters.BodyDamage") bodyPart,
    boolean doPain)
  + ### calcFractureInjurySpeed

    private float calcFractureInjurySpeed([BodyPart](BodyDamage/BodyPart.html "class in zombie.characters.BodyDamage") bodyPart)
  + ### calculateSneakLimpSpeedScale

    protected float calculateSneakLimpSpeedScale()
  + ### calculateWalkSpeed

    protected void calculateWalkSpeed()
  + ### updateSpeedModifiers

    public void updateSpeedModifiers()
  + ### updateDiscomfortModifiers

    public void updateDiscomfortModifiers()
  + ### DoFloorSplat

    public void DoFloorSplat([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    boolean bFlip,
    float offZ,
    float alpha)
  + ### DoSplat

    void DoSplat([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    boolean bFlip,
    [IsoFlagType](../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") prop,
    float offX,
    float offZ,
    float alpha)
  + ### onMouseLeftClick

    public boolean onMouseLeftClick(int x,
    int y)

    Overrides:
    :   `onMouseLeftClick` in class `IsoObject`
  + ### calculateStats

    protected void calculateStats()
  + ### updateStats\_WakeState

    protected void updateStats\_WakeState()
  + ### updateStats\_Sleeping

    protected void updateStats\_Sleeping()
  + ### updateStats\_Awake

    protected void updateStats\_Awake()
  + ### updateMorale

    private void updateMorale()
  + ### updateFitness

    private void updateFitness()
  + ### updateTripping

    private void updateTripping()
  + ### getAppetiteMultiplier

    protected float getAppetiteMultiplier()
  + ### updateStress

    private void updateStress()
  + ### updateEndurance

    private void updateEndurance()
  + ### updateThirst

    private void updateThirst()
  + ### getRunningThirstReduction

    private double getRunningThirstReduction()
  + ### faceDirection

    public void faceDirection([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### faceLocation

    public final boolean faceLocation(float x,
    float y)
  + ### faceLocationF

    public boolean faceLocationF(float x,
    float y)
  + ### isFacingLocation

    public boolean isFacingLocation(float x,
    float y,
    float dot)
  + ### isFacingObject

    public boolean isFacingObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") object,
    float dot)
  + ### splatBlood

    public void splatBlood(int dist,
    float alpha)
  + ### isOutside

    public boolean isOutside()

    Specified by:
    :   `isOutside` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isOutside` in class `GameEntity`
  + ### isFemale

    public final boolean isFemale()

    Specified by:
    :   `isFemale` in interface `zombie.characters.ILuaGameCharacter`
  + ### setFemale

    public final void setFemale(boolean isFemale)

    Specified by:
    :   `setFemale` in interface `zombie.characters.ILuaGameCharacter`
  + ### setCharacterGender

    public final void setCharacterGender(zombie.characters.CharacterGender characterGender)
  + ### getCharacterGender

    public final zombie.characters.CharacterGender getCharacterGender()
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isZombie` in class `IsoObject`
  + ### getLastHitCount

    public int getLastHitCount()

    Specified by:
    :   `getLastHitCount` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setLastHitCount

    public void setLastHitCount(int hitCount)

    Specified by:
    :   `setLastHitCount` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### getSurvivorKills

    public int getSurvivorKills()
  + ### setSurvivorKills

    public void setSurvivorKills(int survivorKills)
  + ### getAge

    public int getAge()
  + ### setAge

    public void setAge(int age)
  + ### exert

    public void exert(float f)
  + ### getPerkInfo

    public [IsoGameCharacter.PerkInfo](IsoGameCharacter.PerkInfo.html "class in zombie.characters") getPerkInfo([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)

    Specified by:
    :   `getPerkInfo` in interface `zombie.characters.ILuaGameCharacter`
  + ### isEquipped

    public boolean isEquipped([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isEquipped` in interface `zombie.characters.ILuaGameCharacter`
  + ### isEquippedClothing

    public boolean isEquippedClothing([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isEquippedClothing` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAttachedItem

    public boolean isAttachedItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isAttachedItem` in interface `zombie.characters.ILuaGameCharacter`
  + ### faceThisObject

    public void faceThisObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)

    Specified by:
    :   `faceThisObject` in interface `zombie.characters.ILuaGameCharacter`
  + ### facePosition

    public void facePosition(int x,
    int y)

    Specified by:
    :   `facePosition` in interface `zombie.characters.ILuaGameCharacter`
  + ### faceThisObjectAlt

    public void faceThisObjectAlt([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)

    Specified by:
    :   `faceThisObjectAlt` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAnimated

    public void setAnimated(boolean b)
  + ### playHurtSound

    public long playHurtSound()
  + ### playDeadSound

    public void playDeadSound()
  + ### saveChange

    public void saveChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl,
    zombie.core.network.ByteBufferWriter bb)

    Overrides:
    :   `saveChange` in class `IsoObject`
  + ### loadChange

    public void loadChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `loadChange` in class `IsoObject`
  + ### getAlreadyReadPages

    public int getAlreadyReadPages([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)

    Specified by:
    :   `getAlreadyReadPages` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAlreadyReadPages

    public void setAlreadyReadPages([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType,
    int pages)

    Specified by:
    :   `setAlreadyReadPages` in interface `zombie.characters.ILuaGameCharacter`
  + ### updateLightInfo

    public void updateLightInfo()
  + ### initLightInfo2

    public [IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters") initLightInfo2()
  + ### getLightInfo2

    public [IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters") getLightInfo2()
  + ### postupdate

    public void postupdate()

    Overrides:
    :   `postupdate` in class `IsoMovingObject`
  + ### getAnimationTimeDelta

    public float getAnimationTimeDelta()

    Specified by:
    :   `getAnimationTimeDelta` in interface `zombie.characters.ILuaGameCharacter`
  + ### updateForServerGui

    public void updateForServerGui()
  + ### postUpdateInternal

    private void postUpdateInternal()
  + ### postUpdateAnimating

    private void postUpdateAnimating()
  + ### isAnimationUpdatingThisFrame

    public boolean isAnimationUpdatingThisFrame()
  + ### clearHitInfo

    public void clearHitInfo()
  + ### clearAttackVars

    private void clearAttackVars()
  + ### updateAnimPlayer

    private void updateAnimPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)
  + ### updateModelSlot

    private void updateModelSlot()
  + ### applyDeltas

    private void applyDeltas(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer)
  + ### getCurrentTimedActionDeltaModifiers

    private void getCurrentTimedActionDeltaModifiers([MoveDeltaModifiers](MoveDeltaModifiers.html "class in zombie.characters") deltas)
  + ### shouldBeTurning

    public boolean shouldBeTurning()
  + ### shouldBeTurning90

    public boolean shouldBeTurning90()
  + ### shouldBeTurningAround

    public boolean shouldBeTurningAround()
  + ### isTurning

    public boolean isTurning()
  + ### setTurning

    private void setTurning(boolean isTurning)
  + ### isTurningAround

    public boolean isTurningAround()
  + ### setTurningAround

    private void setTurningAround(boolean isTurningAround)
  + ### invokeGlobalAnimEvent

    private void invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent globalEvent)
  + ### isTurning90

    public boolean isTurning90()
  + ### setTurning90

    private void setTurning90(boolean is)
  + ### hasPath

    public boolean hasPath()
  + ### getMeleeDelay

    public float getMeleeDelay()

    Specified by:
    :   `getMeleeDelay` in interface `zombie.characters.ILuaGameCharacter`
  + ### setMeleeDelay

    public void setMeleeDelay(float delay)

    Specified by:
    :   `setMeleeDelay` in interface `zombie.characters.ILuaGameCharacter`
  + ### getRecoilDelay

    public float getRecoilDelay()

    Specified by:
    :   `getRecoilDelay` in interface `zombie.characters.ILuaGameCharacter`
  + ### setRecoilDelay

    public void setRecoilDelay(float recoilDelay)

    Specified by:
    :   `setRecoilDelay` in interface `zombie.characters.ILuaGameCharacter`
  + ### getAimingDelay

    public float getAimingDelay()
  + ### setAimingDelay

    public void setAimingDelay(float aimingDelay)
  + ### resetAimingDelay

    public void resetAimingDelay()
  + ### updateAimingDelay

    public void updateAimingDelay()
  + ### getBeenMovingFor

    public float getBeenMovingFor()
  + ### setBeenMovingFor

    public void setBeenMovingFor(float beenMovingFor)
  + ### getClickSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClickSound()
  + ### setClickSound

    public void setClickSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound)
  + ### getMeleeCombatMod

    public int getMeleeCombatMod()
  + ### getWeaponLevel

    public int getWeaponLevel()

    Specified by:
    :   `getWeaponLevel` in interface `zombie.characters.ILuaGameCharacter`
  + ### getWeaponLevel

    public int getWeaponLevel([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `getWeaponLevel` in interface `zombie.characters.ILuaGameCharacter`
  + ### getMaintenanceMod

    public int getMaintenanceMod()

    Specified by:
    :   `getMaintenanceMod` in interface `zombie.characters.ILuaGameCharacter`
  + ### getVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getVehicle()

    Specified by:
    :   `getVehicle` in interface `zombie.characters.ILuaGameCharacter`
  + ### setVehicle

    public void setVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v)

    Specified by:
    :   `setVehicle` in interface `zombie.characters.ILuaGameCharacter`
  + ### isUnderVehicle

    public boolean isUnderVehicle()
  + ### isUnderVehicleRadius

    public boolean isUnderVehicleRadius(float radius)
  + ### isBeingSteppedOn

    public boolean isBeingSteppedOn()
  + ### getReduceInfectionPower

    public float getReduceInfectionPower()

    Specified by:
    :   `getReduceInfectionPower` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### setReduceInfectionPower

    public void setReduceInfectionPower(float reduceInfectionPower)

    Specified by:
    :   `setReduceInfectionPower` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### getInventoryWeight

    public float getInventoryWeight()

    Specified by:
    :   `getInventoryWeight` in interface `zombie.characters.ILuaGameCharacter`
  + ### dropHandItems

    public void dropHandItems()
  + ### dropHeldItems

    public void dropHeldItems(int x,
    int y,
    int z,
    boolean heavy,
    boolean isThrow)
  + ### shouldBecomeZombieAfterDeath

    public boolean shouldBecomeZombieAfterDeath()
  + ### modifyTraitXPBoost

    public void modifyTraitXPBoost([CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait,
    boolean isRemovingTrait)

    Specified by:
    :   `modifyTraitXPBoost` in interface `zombie.characters.ILuaGameCharacter`
  + ### modifyTraitXPBoost

    public void modifyTraitXPBoost([CharacterTraitDefinition](traits/CharacterTraitDefinition.html "class in zombie.characters.traits") trait,
    boolean isRemovingTrait)

    Specified by:
    :   `modifyTraitXPBoost` in interface `zombie.characters.ILuaGameCharacter`
  + ### applyTraits

    public void applyTraits([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterTrait](../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> luaTraits)
  + ### applyProfessionRecipes

    public void applyProfessionRecipes()
  + ### applyCharacterTraitsRecipes

    public void applyCharacterTraitsRecipes()
  + ### createKeyRing

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") createKeyRing()
  + ### createKeyRing

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") createKeyRing([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") itemKey)
  + ### autoDrink

    public void autoDrink()
  + ### getWaterSource

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getWaterSource([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getKnownRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKnownRecipes()

    Specified by:
    :   `getKnownRecipes` in interface `zombie.characters.ILuaGameCharacter`
  + ### isRecipeKnown

    public boolean isRecipeKnown([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe)

    Specified by:
    :   `isRecipeKnown` in interface `zombie.characters.ILuaGameCharacter`
  + ### isRecipeKnown

    public boolean isRecipeKnown([CraftRecipe](../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### isRecipeKnown

    public boolean isRecipeKnown([CraftRecipe](../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    boolean ignoreSandbox)
  + ### isRecipeKnown

    public boolean isRecipeKnown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `isRecipeKnown` in interface `zombie.characters.ILuaGameCharacter`
  + ### isRecipeKnown

    public boolean isRecipeKnown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean ignoreSandbox)
  + ### isRecipeActuallyKnown

    public boolean isRecipeActuallyKnown([CraftRecipe](../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### isRecipeActuallyKnown

    public boolean isRecipeActuallyKnown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### learnRecipe

    public boolean learnRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### learnRecipe

    public boolean learnRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean checkMetaRecipe)
  + ### addKnownMediaLine

    public void addKnownMediaLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)

    Specified by:
    :   `addKnownMediaLine` in interface `zombie.characters.ILuaGameCharacter`
  + ### removeKnownMediaLine

    public void removeKnownMediaLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)

    Specified by:
    :   `removeKnownMediaLine` in interface `zombie.characters.ILuaGameCharacter`
  + ### clearKnownMediaLines

    public void clearKnownMediaLines()

    Specified by:
    :   `clearKnownMediaLines` in interface `zombie.characters.ILuaGameCharacter`
  + ### isKnownMediaLine

    public boolean isKnownMediaLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)

    Specified by:
    :   `isKnownMediaLine` in interface `zombie.characters.ILuaGameCharacter`
  + ### saveKnownMediaLines

    protected void saveKnownMediaLines([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### loadKnownMediaLines

    protected void loadKnownMediaLines([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)
  + ### isMoving

    public boolean isMoving()

    Specified by:
    :   `isMoving` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### isBehaviourMoving

    public boolean isBehaviourMoving()
  + ### isPlayerMoving

    public boolean isPlayerMoving()
  + ### setMoving

    public void setMoving(boolean val)
  + ### isFacingNorthWesterly

    private boolean isFacingNorthWesterly()
  + ### isAttacking

    public boolean isAttacking()
  + ### isZombieAttacking

    public boolean isZombieAttacking()
  + ### isZombieAttacking

    public boolean isZombieAttacking([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other)
  + ### isZombieThumping

    private boolean isZombieThumping()
  + ### compareMovePriority

    public int compareMovePriority([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") other)
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSound` in interface `zombie.characters.ILuaGameCharacter`
  + ### playSoundLocal

    public long playSoundLocal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSoundLocal` in interface `zombie.characters.ILuaGameCharacter`
  + ### stopOrTriggerSound

    public void stopOrTriggerSound(long eventInstance)

    Specified by:
    :   `stopOrTriggerSound` in interface `zombie.characters.ILuaGameCharacter`
  + ### playDropItemSound

    public long playDropItemSound([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### playWeaponHitArmourSound

    public long playWeaponHitArmourSound(int partIndex,
    boolean bullet)
  + ### addWorldSoundUnlessInvisible

    public void addWorldSoundUnlessInvisible(int radius,
    int volume,
    boolean bStressHumans)

    Specified by:
    :   `addWorldSoundUnlessInvisible` in interface `zombie.characters.ILuaGameCharacter`
  + ### isKnownPoison

    public boolean isKnownPoison([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `isKnownPoison` in interface `zombie.characters.ILuaGameCharacter`
  + ### isKnownPoison

    public boolean isKnownPoison([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") item)

    Specified by:
    :   `isKnownPoison` in interface `zombie.characters.ILuaGameCharacter`
  + ### getLastHourSleeped

    public int getLastHourSleeped()

    Specified by:
    :   `getLastHourSleeped` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### setLastHourSleeped

    public void setLastHourSleeped(int lastHourSleeped)

    Specified by:
    :   `setLastHourSleeped` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### setTimeOfSleep

    public void setTimeOfSleep(float timeOfSleep)

    Specified by:
    :   `setTimeOfSleep` in interface `zombie.characters.ILuaGameCharacterHealth`
  + ### setDelayToSleep

    public void setDelayToSleep(float delay)
  + ### getBedType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBedType()

    Specified by:
    :   `getBedType` in interface `zombie.characters.ILuaGameCharacter`
  + ### setBedType

    public void setBedType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bedType)

    Specified by:
    :   `setBedType` in interface `zombie.characters.ILuaGameCharacter`
  + ### enterVehicle

    public void enterVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v,
    int seat,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") offset)
  + ### Hit

    public float Hit([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float speed,
    boolean isHitFromBehind,
    float hitDirX,
    float hitDirY,
    boolean pushedBack,
    float collisionPosOnVehicleX,
    float collisionPosOnVehicleY)

    Specified by:
    :   `Hit` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### getPath2

    public zombie.pathfind.Path getPath2()

    Specified by:
    :   `getPath2` in interface `zombie.characters.ILuaGameCharacter`
  + ### setPath2

    public void setPath2(zombie.pathfind.Path path)

    Specified by:
    :   `setPath2` in interface `zombie.characters.ILuaGameCharacter`
  + ### getPathFindBehavior2

    public [PathFindBehavior2](../pathfind/PathFindBehavior2.html "class in zombie.pathfind") getPathFindBehavior2()

    Specified by:
    :   `getPathFindBehavior2` in interface `zombie.characters.ILuaGameCharacter`
  + ### getMapKnowledge

    public [MapKnowledge](../ai/MapKnowledge.html "class in zombie.ai") getMapKnowledge()
  + ### getBed

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getBed()

    Specified by:
    :   `getBed` in interface `zombie.characters.ILuaGameCharacter`
  + ### setBed

    public void setBed([IsoObject](../iso/IsoObject.html "class in zombie.iso") bed)

    Specified by:
    :   `setBed` in interface `zombie.characters.ILuaGameCharacter`
  + ### avoidDamage

    public boolean avoidDamage()
  + ### setAvoidDamage

    public void setAvoidDamage(boolean avoid)
  + ### isReading

    public boolean isReading()

    Specified by:
    :   `isReading` in interface `zombie.characters.ILuaGameCharacter`
  + ### setReading

    public void setReading(boolean isReading)

    Specified by:
    :   `setReading` in interface `zombie.characters.ILuaGameCharacter`
  + ### getTimeSinceLastSmoke

    public float getTimeSinceLastSmoke()

    Specified by:
    :   `getTimeSinceLastSmoke` in interface `zombie.characters.ILuaGameCharacter`
  + ### setTimeSinceLastSmoke

    public void setTimeSinceLastSmoke(float timeSinceLastSmoke)

    Specified by:
    :   `setTimeSinceLastSmoke` in interface `zombie.characters.ILuaGameCharacter`
  + ### isInvisible

    public boolean isInvisible()

    Specified by:
    :   `isInvisible` in interface `zombie.characters.ILuaGameCharacter`
  + ### setInvisible

    public void setInvisible(boolean b)

    Specified by:
    :   `setInvisible` in interface `zombie.characters.ILuaGameCharacter`
  + ### setInvisible

    public void setInvisible(boolean b,
    boolean isForced)
  + ### isCanUseBrushTool

    public boolean isCanUseBrushTool()
  + ### setCanUseBrushTool

    public void setCanUseBrushTool(boolean b)
  + ### canUseLootZed

    public boolean canUseLootZed()
  + ### setCanUseLootZed

    public void setCanUseLootZed(boolean b)
  + ### canUseLootLog

    public boolean canUseLootLog()
  + ### setCanUseLootLog

    public void setCanUseLootLog(boolean b)
  + ### canUseDebugContextMenu

    public boolean canUseDebugContextMenu()
  + ### setCanUseDebugContextMenu

    public void setCanUseDebugContextMenu(boolean b)
  + ### isDriving

    public boolean isDriving()

    Specified by:
    :   `isDriving` in interface `zombie.characters.ILuaGameCharacter`
  + ### isInARoom

    public boolean isInARoom()

    Specified by:
    :   `isInARoom` in interface `zombie.characters.ILuaGameCharacter`
  + ### isGodMod

    public boolean isGodMod()

    Specified by:
    :   `isGodMod` in interface `zombie.characters.ILuaGameCharacter`
  + ### isInvulnerable

    public boolean isInvulnerable()
  + ### setInvulnerable

    public void setInvulnerable(boolean invulnerable)
  + ### setGodModCheat

    private void setGodModCheat(boolean enabled)
  + ### setZombiesDontAttack

    public void setZombiesDontAttack(boolean b)
  + ### isZombiesDontAttack

    public boolean isZombiesDontAttack()
  + ### setGodMod

    public void setGodMod(boolean b,
    boolean isForced)
  + ### setGodMod

    public void setGodMod(boolean b)

    Specified by:
    :   `setGodMod` in interface `zombie.characters.ILuaGameCharacter`
  + ### isUnlimitedCarry

    public boolean isUnlimitedCarry()

    Specified by:
    :   `isUnlimitedCarry` in interface `zombie.characters.ILuaGameCharacter`
  + ### setUnlimitedCarry

    public void setUnlimitedCarry(boolean unlimitedCarry)

    Specified by:
    :   `setUnlimitedCarry` in interface `zombie.characters.ILuaGameCharacter`
  + ### isBuildCheat

    public boolean isBuildCheat()

    Specified by:
    :   `isBuildCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setBuildCheat

    public void setBuildCheat(boolean buildCheat)

    Specified by:
    :   `setBuildCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isFarmingCheat

    public boolean isFarmingCheat()

    Specified by:
    :   `isFarmingCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setFarmingCheat

    public void setFarmingCheat(boolean b)

    Specified by:
    :   `setFarmingCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isFishingCheat

    public boolean isFishingCheat()

    Specified by:
    :   `isFishingCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setFishingCheat

    public void setFishingCheat(boolean b)

    Specified by:
    :   `setFishingCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isHealthCheat

    public boolean isHealthCheat()

    Specified by:
    :   `isHealthCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setHealthCheat

    public void setHealthCheat(boolean healthCheat)

    Specified by:
    :   `setHealthCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isMechanicsCheat

    public boolean isMechanicsCheat()

    Specified by:
    :   `isMechanicsCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setMechanicsCheat

    public void setMechanicsCheat(boolean mechanicsCheat)

    Specified by:
    :   `setMechanicsCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isFastMoveCheat

    public boolean isFastMoveCheat()
  + ### setFastMoveCheat

    public void setFastMoveCheat(boolean b)
  + ### isMovablesCheat

    public boolean isMovablesCheat()

    Specified by:
    :   `isMovablesCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setMovablesCheat

    public void setMovablesCheat(boolean b)

    Specified by:
    :   `setMovablesCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAnimalCheat

    public boolean isAnimalCheat()

    Specified by:
    :   `isAnimalCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAnimalCheat

    public void setAnimalCheat(boolean b)

    Specified by:
    :   `setAnimalCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAnimalExtraValuesCheat

    public boolean isAnimalExtraValuesCheat()

    Specified by:
    :   `isAnimalExtraValuesCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAnimalExtraValuesCheat

    public void setAnimalExtraValuesCheat(boolean b)

    Specified by:
    :   `setAnimalExtraValuesCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAlwaysDayCheat

    public boolean isAlwaysDayCheat()

    Specified by:
    :   `isAlwaysDayCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setAlwaysDayCheat

    public void setAlwaysDayCheat(boolean b)

    Specified by:
    :   `setAlwaysDayCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isTimedActionInstantCheat

    public boolean isTimedActionInstantCheat()

    Specified by:
    :   `isTimedActionInstantCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### setTimedActionInstantCheat

    public void setTimedActionInstantCheat(boolean b)

    Specified by:
    :   `setTimedActionInstantCheat` in interface `zombie.characters.ILuaGameCharacter`
  + ### isTimedActionInstant

    public boolean isTimedActionInstant()

    Specified by:
    :   `isTimedActionInstant` in interface `zombie.characters.ILuaGameCharacter`
  + ### isShowAdminTag

    public boolean isShowAdminTag()

    Specified by:
    :   `isShowAdminTag` in interface `zombie.characters.ILuaGameCharacter`
  + ### setShowAdminTag

    public void setShowAdminTag(boolean showAdminTag)

    Specified by:
    :   `setShowAdminTag` in interface `zombie.characters.ILuaGameCharacter`
  + ### isCheatSet

    public boolean isCheatSet([CheatType](CheatType.html "enum class in zombie.characters") cheat)
  + ### getGameVariables

    public [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot> getGameVariables()

    Description copied from interface: `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

    Returns all Game variables.

    Specified by:
    :   `getGameVariables` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

    Specified by:
    :   `getGameVariables` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer`
  + ### getVariable

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot getVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle handle)

    Description copied from interface: `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

    Returns the specified variable slot. Or NULL if not found.

    Specified by:
    :   `getVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

    Specified by:
    :   `getVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer`
  + ### setVariable

    public void setVariable(zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot var)

    Description copied from interface: `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`

    Set the specified animation variable slot. Overwriting an existing slot if necessary.

    Specified by:
    :   `setVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### setVariable

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)

    Specified by:
    :   `setVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### setVariable

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    boolean value)

    Specified by:
    :   `setVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### setVariable

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    float value)

    Specified by:
    :   `setVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### setVariableEnum

    public <EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>>
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot setVariableEnum([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    EnumType value)

    Specified by:
    :   `setVariableEnum` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### setVariable

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlot setVariable(zombie.core.skinnedmodel.advancedanimation.AnimationVariableHandle handle,
    boolean value)

    Specified by:
    :   `setVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### clearVariable

    public void clearVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)

    Specified by:
    :   `clearVariable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### clearVariables

    public void clearVariables()

    Specified by:
    :   `clearVariables` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap`
  + ### getFootInjuryType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFootInjuryType()

    Return the type of foot injury, could be leftheavy, rightlight etc.
    Heavy predominate any light injuries (so we don't blend heavy with light, as it'll fasten up a tad the anim compared to a pure heavy).
    Run don't have any heavy limp, so we use only the light for running.
  + ### getSubVariableSource

    public zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource getSubVariableSource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subVariableSourceName)

    Description copied from interface: `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`

    get an internal VariableSource. Most classes won't have any internal VariableSources.
    IsoGameCharacters, for example, will have some, like the GrapplingTarget, or GrappledBy

    Specified by:
    :   `getSubVariableSource` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource`
  + ### getGameVariablesInternal

    public zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource getGameVariablesInternal()

    Specified by:
    :   `getGameVariablesInternal` in interface `IAnimationVariableRegistry`

    Specified by:
    :   `getGameVariablesInternal` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer`
  + ### startPlaybackGameVariables

    public zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource startPlaybackGameVariables()
  + ### endPlaybackGameVariables

    public void endPlaybackGameVariables(zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource playbackVars)
  + ### playbackSetCurrentStateSnapshot

    public void playbackSetCurrentStateSnapshot(zombie.characters.action.ActionStateSnapshot snapshot)
  + ### playbackRecordCurrentStateSnapshot

    public zombie.characters.action.ActionStateSnapshot playbackRecordCurrentStateSnapshot()
  + ### GetVariable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)

    Specified by:
    :   `GetVariable` in interface `zombie.characters.ILuaVariableSource`
  + ### SetVariable

    public void SetVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)

    Specified by:
    :   `SetVariable` in interface `zombie.characters.ILuaVariableSource`
  + ### ClearVariable

    public void ClearVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)

    Specified by:
    :   `ClearVariable` in interface `zombie.characters.ILuaVariableSource`
  + ### actionStateChanged

    public void actionStateChanged(zombie.characters.action.ActionContext sender)

    Specified by:
    :   `actionStateChanged` in interface `zombie.characters.action.IActionStateChanged`
  + ### isFallOnFront

    public boolean isFallOnFront()

    Specified by:
    :   `isFallOnFront` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setFallOnFront

    public void setFallOnFront(boolean fallOnFront)

    Specified by:
    :   `setFallOnFront` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### isHitFromBehind

    public boolean isHitFromBehind()
  + ### setHitFromBehind

    public void setHitFromBehind(boolean hitFromBehind)
  + ### isKilledBySlicingWeapon

    public boolean isKilledBySlicingWeapon()
  + ### testCollideWithVehicles

    public boolean testCollideWithVehicles([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [BaseVehicle.HitVars](../vehicles/BaseVehicle.HitVars.html "class in zombie.vehicles") hitVars)
  + ### shouldBePushedBackByVehicleHit

    public boolean shouldBePushedBackByVehicleHit()
  + ### onHitByVehicle

    public float onHitByVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float impactSpeed,
    [Vector2](../iso/Vector2.html "class in zombie.iso") hitDir,
    [Vector2](../iso/Vector2.html "class in zombie.iso") impactPosOnVehicle)
  + ### onHitByVehicleApplyDamage

    public float onHitByVehicleApplyDamage([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float impactSpeed)
  + ### onHitByVehicleDriver

    protected void onHitByVehicleDriver([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") vehicleDriver)

    Called from onHitByVehicle   
    Handles what to do about the vehicle's driver.   
      
    Note: Vehicle's driver may be null.
  + ### applyDamageFromVehicleHit

    public void applyDamageFromVehicleHit([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float vehicleSpeed,
    float damage)
  + ### calculateDamageFromVehicleImpact

    private float calculateDamageFromVehicleImpact(float impactSpeed)
  + ### calculateDamageFromVehicleRunOver

    private float calculateDamageFromVehicleRunOver(float impactSpeed)
  + ### postHitByVehicleUpdateStance

    protected void postHitByVehicleUpdateStance(float speed,
    boolean knockDownAllowed)

    Update our reaction stance after a vehicle impact.   
    Set the appropriate flags, such as knockedDown, etc.   
    Note: Only on clients and single-player. The server does not do these.
  + ### reportEvent

    public void reportEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `reportEvent` in interface `zombie.characters.ILuaGameCharacter`
  + ### StartTimedActionAnim

    public void StartTimedActionAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)

    Specified by:
    :   `StartTimedActionAnim` in interface `zombie.characters.ILuaGameCharacter`
  + ### StartTimedActionAnim

    public void StartTimedActionAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Specified by:
    :   `StartTimedActionAnim` in interface `zombie.characters.ILuaGameCharacter`
  + ### StopTimedActionAnim

    public void StopTimedActionAnim()

    Specified by:
    :   `StopTimedActionAnim` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasHitReaction

    public boolean hasHitReaction()
  + ### getHitReaction

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHitReaction()
  + ### setHitReaction

    public void setHitReaction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitReaction)
  + ### CacheEquipped

    public void CacheEquipped()
  + ### GetPrimaryEquippedCache

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") GetPrimaryEquippedCache()
  + ### GetSecondaryEquippedCache

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") GetSecondaryEquippedCache()
  + ### ClearEquippedCache

    public void ClearEquippedCache()
  + ### isObjectBehind

    public boolean isObjectBehind([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### isBehind

    public boolean isBehind([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
  + ### resetEquippedHandsModels

    public void resetEquippedHandsModels()
  + ### getDebugMonitor

    public [AnimatorDebugMonitor](../core/skinnedmodel/advancedanimation/debug/AnimatorDebugMonitor.html "class in zombie.core.skinnedmodel.advancedanimation.debug") getDebugMonitor()

    Specified by:
    :   `getDebugMonitor` in interface `zombie.characters.ILuaGameCharacter`
  + ### setDebugMonitor

    public void setDebugMonitor([AnimatorDebugMonitor](../core/skinnedmodel/advancedanimation/debug/AnimatorDebugMonitor.html "class in zombie.core.skinnedmodel.advancedanimation.debug") monitor)

    Specified by:
    :   `setDebugMonitor` in interface `zombie.characters.ILuaGameCharacter`
  + ### isAimAtFloor

    public boolean isAimAtFloor()
  + ### setAimAtFloor

    public void setAimAtFloor(boolean aimAtFloor)
  + ### setAimAtFloor

    public void setAimAtFloor(boolean aimAtFloor,
    float targetDistance)
  + ### aimAtFloorTargetDistance

    public float aimAtFloorTargetDistance()
  + ### getAimAtFloorAmount

    public float getAimAtFloorAmount()

    Returns the amount we need to aim dowrwards.
    0.0 - horizontal, straight ahead.
    1.0 - vertical, straight down.
  + ### getCurrentVerticalAimAngle

    public float getCurrentVerticalAimAngle()

    Returns the desired aim angle, in degrees.
    90 - up
    0 - horizontal
    -90 - down
  + ### setCurrentVerticalAimAngle

    public void setCurrentVerticalAimAngle(float verticalAimAngleDegrees)
  + ### setTargetVerticalAimAngle

    public void setTargetVerticalAimAngle(float verticalAimAngleDegrees)
  + ### getTargetVerticalAimAngle

    public float getTargetVerticalAimAngle()
  + ### isDeferredMovementEnabled

    public boolean isDeferredMovementEnabled()
  + ### setDeferredMovementEnabled

    public void setDeferredMovementEnabled(boolean deferredMovementEnabled)
  + ### testDotSide

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") testDotSide([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target)
  + ### testDotSideEnum

    public zombie.characters.Side testDotSideEnum([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target)
  + ### addBasicPatch

    public void addBasicPatch([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)
  + ### addHole

    public boolean addHole([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part)

    Specified by:
    :   `addHole` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### addHole

    public boolean addHole([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    boolean allLayers)
  + ### addDirt

    public void addDirt([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") nbr,
    boolean allLayers)
  + ### addLotsOfDirt

    public void addLotsOfDirt([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") nbr,
    boolean allLayers)
  + ### addBlood

    public void addBlood([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    boolean scratched,
    boolean bitten,
    boolean allLayers)

    Specified by:
    :   `addBlood` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### bodyPartHasTag

    private boolean bodyPartHasTag([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part,
    [ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### bodyPartIsSpiked

    public boolean bodyPartIsSpiked([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part)
  + ### bodyPartIsSpikedBehind

    public boolean bodyPartIsSpikedBehind([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part)
  + ### getBodyPartClothingDefense

    public float getBodyPartClothingDefense([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part,
    boolean bite,
    boolean bullet)
  + ### isBumped

    public boolean isBumped()

    Specified by:
    :   `isBumped` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### isBumpDone

    public boolean isBumpDone()
  + ### setBumpDone

    public void setBumpDone(boolean val)
  + ### isBumpFall

    public boolean isBumpFall()
  + ### setBumpFall

    public void setBumpFall(boolean val)
  + ### isBumpStaggered

    public boolean isBumpStaggered()
  + ### setBumpStaggered

    public void setBumpStaggered(boolean val)
  + ### getBumpType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBumpType()

    Specified by:
    :   `getBumpType` in interface `zombie.characters.ILuaGameCharacterDamage`
  + ### setBumpType

    public void setBumpType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bumpType)
  + ### getBumpFallType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBumpFallType()
  + ### setBumpFallType

    public void setBumpFallType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### getBumpedChr

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getBumpedChr()
  + ### setBumpedChr

    public void setBumpedChr([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") bumpedChr)
  + ### getLastBump

    public long getLastBump()
  + ### setLastBump

    public void setLastBump(long lastBump)
  + ### postAnimationFinishing

    public void postAnimationFinishing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") state)
  + ### isSitOnGround

    public boolean isSitOnGround()
  + ### setSitOnGround

    public void setSitOnGround(boolean sitOnGround)
  + ### isSittingOnFurniture

    public boolean isSittingOnFurniture()
  + ### setSittingOnFurniture

    public void setSittingOnFurniture(boolean isSittingOnFurniture)
  + ### isSitting

    public boolean isSitting()
  + ### getSitOnFurnitureObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getSitOnFurnitureObject()
  + ### setSitOnFurnitureObject

    public void setSitOnFurnitureObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### getSitOnFurnitureDirection

    public [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getSitOnFurnitureDirection()
  + ### setSitOnFurnitureDirection

    public void setSitOnFurnitureDirection([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### isSitOnFurnitureObject

    public boolean isSitOnFurnitureObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### shouldIgnoreCollisionWithSquare

    public boolean shouldIgnoreCollisionWithSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)

    Overrides:
    :   `shouldIgnoreCollisionWithSquare` in class `IsoMovingObject`
  + ### canStandAt

    public boolean canStandAt(float x,
    float y,
    float z)
  + ### clearAIStateMap

    protected void clearAIStateMap()
  + ### registerAIState

    protected void registerAIState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    zombie.ai.State aiState)
  + ### tryGetAIState

    public zombie.ai.State tryGetAIState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)
  + ### isRunning

    public boolean isRunning()
  + ### setRunning

    public void setRunning(boolean bRunning)
  + ### isSprinting

    public boolean isSprinting()
  + ### setSprinting

    public void setSprinting(boolean bSprinting)
  + ### canSprint

    public boolean canSprint()
  + ### postUpdateModelTextures

    public void postUpdateModelTextures()
  + ### getTextureCreator

    public zombie.core.skinnedmodel.model.ModelInstanceTextureCreator getTextureCreator()
  + ### setTextureCreator

    public void setTextureCreator(zombie.core.skinnedmodel.model.ModelInstanceTextureCreator textureCreator)
  + ### postUpdateEquippedTextures

    public void postUpdateEquippedTextures()
  + ### getReadyModelData

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.skinnedmodel.model.ModelInstance> getReadyModelData()
  + ### getIgnoreMovement

    public boolean getIgnoreMovement()
  + ### setIgnoreMovement

    public void setIgnoreMovement(boolean ignoreMovement)
  + ### isAutoWalk

    public boolean isAutoWalk()
  + ### setAutoWalk

    public void setAutoWalk(boolean b)
  + ### setAutoWalkDirection

    public void setAutoWalkDirection([Vector2](../iso/Vector2.html "class in zombie.iso") v)
  + ### getAutoWalkDirection

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAutoWalkDirection([Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### isSneaking

    public boolean isSneaking()
  + ### setSneaking

    public void setSneaking(boolean bSneaking)
  + ### getSneakLimpSpeedScale

    public float getSneakLimpSpeedScale()
  + ### setSneakLimpSpeedScale

    public void setSneakLimpSpeedScale(float sneakLimpSpeedScale)
  + ### getMoveDelta

    public float getMoveDelta()
  + ### setMoveDelta

    public void setMoveDelta(float moveDelta)
  + ### getTurnDelta

    public float getTurnDelta()
  + ### setTurnDelta

    public void setTurnDelta(float turnDelta)
  + ### getChopTreeSpeed

    public float getChopTreeSpeed()
  + ### testDefense

    public boolean testDefense([IsoZombie](IsoZombie.html "class in zombie.characters") zomb)

    Test if we're able to defend a zombie bite
    Can only happen if zombie is attacking from front
    Calcul include current weapon skills, fitness invalid input: '&' strength
  + ### getSurroundingAttackingZombies

    public int getSurroundingAttackingZombies()
  + ### getSurroundingAttackingZombies

    public int getSurroundingAttackingZombies(boolean includeCrawlers)
  + ### checkIsNearVehicle

    public boolean checkIsNearVehicle()
  + ### checkIsNearWall

    public float checkIsNearWall()
  + ### getBeenSprintingFor

    public float getBeenSprintingFor()
  + ### setBeenSprintingFor

    public void setBeenSprintingFor(float beenSprintingFor)
  + ### isHideWeaponModel

    public boolean isHideWeaponModel()
  + ### setHideWeaponModel

    public void setHideWeaponModel(boolean hideWeaponModel)
  + ### isHideEquippedHandL

    public boolean isHideEquippedHandL()
  + ### setHideEquippedHandL

    public void setHideEquippedHandL(boolean hideEquippedHandL)
  + ### isHideEquippedHandR

    public boolean isHideEquippedHandR()
  + ### setHideEquippedHandR

    public void setHideEquippedHandR(boolean hideEquippedHandR)
  + ### setIsAiming

    public void setIsAiming(boolean isAiming)
  + ### setFireMode

    public void setFireMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fireMode)
  + ### getFireMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFireMode()
  + ### isAiming

    public boolean isAiming()

    Specified by:
    :   `isAiming` in interface `zombie.characters.ILuaGameCharacter`

    Returns:
    :   if this character is an NPC, returns the value from
        invalid reference

        ```
        #NPCGetAiming()
        ```

        .   
          
        TRUE if the character is performing a hostile animation ([`isPerformingHostileAnimation()`](#isPerformingHostileAnimation()) returns TRUE).   
          
        FALSE if this character is ignoring Aim input (`CharacterInputComponentEntity.isIgnoringAimingInput()`.   
          
        Otherwise, The current value of the internal isAiming variable is returned.
  + ### isTwisting

    public boolean isTwisting()

    Specified by:
    :   `isTwisting` in interface `zombie.characters.ILuaGameCharacter`
  + ### allowsTwist

    public boolean allowsTwist()

    Specified by:
    :   `allowsTwist` in interface `zombie.characters.ILuaGameCharacter`
  + ### getShoulderTwistWeight

    public float getShoulderTwistWeight()

    Returns the amount of weight to be applied to the shoulder twist.
    That is, how much of the head's lookAt twist angle is to be propagated down the spine.
    if 0.0, head turns only.
    if 1.0, shoulders turn in step with the head. eg. when aiming rifles
  + ### resetBeardGrowingTime

    public void resetBeardGrowingTime()

    Specified by:
    :   `resetBeardGrowingTime` in interface `zombie.characters.ILuaGameCharacter`
  + ### resetHairGrowingTime

    public void resetHairGrowingTime()

    Specified by:
    :   `resetHairGrowingTime` in interface `zombie.characters.ILuaGameCharacter`
  + ### fallenOnKnees

    public void fallenOnKnees()
  + ### fallenOnKnees

    public void fallenOnKnees(boolean hardFall)
  + ### addVisualDamage

    public void addVisualDamage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### addBodyVisualFromItemType

    public [ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual") addBodyVisualFromItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### isDuplicateBodyVisual

    protected boolean isDuplicateBodyVisual([ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual") itemVisual)
  + ### isCriticalHit

    public boolean isCriticalHit()
  + ### setCriticalHit

    public void setCriticalHit(boolean isCrit)
  + ### getRunSpeedModifier

    public float getRunSpeedModifier()
  + ### isNpc

    public boolean isNpc()
  + ### setMetabolicTarget

    public void setMetabolicTarget([Metabolics](BodyDamage/Metabolics.html "enum class in zombie.characters.BodyDamage") m)
  + ### setMetabolicTarget

    public void setMetabolicTarget(float target)
  + ### getThirstMultiplier

    public double getThirstMultiplier()
  + ### getHungerMultiplier

    public double getHungerMultiplier()
  + ### getFatiqueMultiplier

    public double getFatiqueMultiplier()
  + ### getTimedActionTimeModifier

    public float getTimedActionTimeModifier()
  + ### addHoleFromZombieAttacks

    public boolean addHoleFromZombieAttacks([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    boolean scratch)
  + ### updateBandages

    protected void updateBandages()
  + ### getTotalBlood

    public float getTotalBlood()
  + ### attackFromWindowsLunge

    public void attackFromWindowsLunge([IsoZombie](IsoZombie.html "class in zombie.characters") zombie)
  + ### DoSwingCollisionBoneCheck

    public boolean DoSwingCollisionBoneCheck([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") zombie,
    int bone,
    float tempoLengthTest)
  + ### isInvincible

    public boolean isInvincible()

    Currently only used for animals, use godMod for players
  + ### setInvincible

    public void setInvincible(boolean invincible)

    Currently only used for animals, use godMod for players
  + ### getNearVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getNearVehicle()
  + ### isNearSirenVehicle

    public boolean isNearSirenVehicle()
  + ### getSolidFloorAt

    private [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSolidFloorAt(int x,
    int y,
    int z)
  + ### dropHeavyItems

    public void dropHeavyItems()
  + ### isHeavyItem

    public boolean isHeavyItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isCanShout

    public boolean isCanShout()
  + ### setCanShout

    public void setCanShout(boolean canShout)
  + ### isKnowAllRecipes

    public boolean isKnowAllRecipes()
  + ### setKnowAllRecipes

    public void setKnowAllRecipes(boolean knowAllRecipes)
  + ### isUnlimitedAmmo

    public boolean isUnlimitedAmmo()
  + ### setUnlimitedAmmo

    public void setUnlimitedAmmo(boolean unlimitedAmmo)
  + ### isUnlimitedEndurance

    public boolean isUnlimitedEndurance()
  + ### setUnlimitedEndurance

    public void setUnlimitedEndurance(boolean unlimitedEndurance)
  + ### addActiveLightItem

    private void addActiveLightItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getActiveLightItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> getActiveLightItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getOrCreateSleepingEventData

    public zombie.ai.sadisticAIDirector.SleepingEventData getOrCreateSleepingEventData()
  + ### playEmote

    public void playEmote([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") emote)
  + ### getAnimationStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimationStateName()
  + ### getActionStateName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActionStateName()
  + ### shouldWaitToStartTimedAction

    public boolean shouldWaitToStartTimedAction()
  + ### setPersistentOutfitID

    public void setPersistentOutfitID(int outfitID)
  + ### setPersistentOutfitID

    public void setPersistentOutfitID(int outfitID,
    boolean init)
  + ### getPersistentOutfitID

    public int getPersistentOutfitID()
  + ### isPersistentOutfitInit

    public boolean isPersistentOutfitInit()
  + ### isDoingActionThatCanBeCancelled

    public boolean isDoingActionThatCanBeCancelled()

    Specified by:
    :   `isDoingActionThatCanBeCancelled` in interface `zombie.ai.IStateCharacter`

    Returns:
    :   TRUE if this state handles the "Cancel Action" key or the B controller button.
  + ### causesDamageToVehicleWhenHit

    public boolean causesDamageToVehicleWhenHit([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") impactingVehicle)

    Description copied from interface: `zombie.ai.IStateCharacter`

    Checks if BaseVehicle.hitCharacter causes any damage to the vehicle. If FALSE, no damage is inflicted.

    Specified by:
    :   `causesDamageToVehicleWhenHit` in interface `zombie.ai.IStateCharacter`
  + ### isDoDeathSound

    public boolean isDoDeathSound()
  + ### setDoDeathSound

    public void setDoDeathSound(boolean doDeathSound)
  + ### isKilledByFall

    public boolean isKilledByFall()

    Specified by:
    :   `isKilledByFall` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setKilledByFall

    public void setKilledByFall(boolean killedByFall)

    Specified by:
    :   `setKilledByFall` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### updateEquippedRadioFreq

    public void updateEquippedRadioFreq()
  + ### updateEquippedItemSounds

    public void updateEquippedItemSounds()
  + ### getFMODParameters

    public zombie.audio.FMODParameterList getFMODParameters()

    Specified by:
    :   `getFMODParameters` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### startEvent

    public void startEvent(long eventInstance,
    [GameSoundClip](../audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `startEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### updateEvent

    public void updateEvent(long eventInstance,
    [GameSoundClip](../audio/GameSoundClip.html "class in zombie.audio") clip)

    Specified by:
    :   `updateEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### stopEvent

    public void stopEvent(long eventInstance,
    [GameSoundClip](../audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `stopEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### playBloodSplatterSound

    public void playBloodSplatterSound()
  + ### setHeadLookAround

    public void setHeadLookAround(boolean b)
  + ### isHeadLookAround

    public boolean isHeadLookAround()
  + ### setHeadLookAroundDirection

    public void setHeadLookAroundDirection(float lookHorizontal,
    float lookVertical)
  + ### getHeadLookHorizontal

    public float getHeadLookHorizontal()
  + ### getHeadLookVertical

    public float getHeadLookVertical()
  + ### getHeadLookAngleMax

    public float getHeadLookAngleMax()
  + ### addBloodFromVehicleImpact

    public void addBloodFromVehicleImpact(float speed)
  + ### isKnockedDown

    public boolean isKnockedDown()
  + ### setKnockedDown

    public void setKnockedDown(boolean knockedDown)
  + ### isStaggerBack

    public boolean isStaggerBack()
  + ### readInventory

    public void readInventory(zombie.core.network.ByteBufferReader b)
  + ### Kill

    public final void Kill([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer)
  + ### Kill

    public final void Kill([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer)
  + ### Kill

    public final void Kill([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    boolean bGory)
  + ### Kill

    public final void Kill([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") attackingWeapon,
    boolean isGory,
    zombie.characters.CharacterDiedListener onDiedListener)
  + ### onKilled

    public void onKilled([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") attackingWeapon,
    boolean isGory)
  + ### die

    public final void die()
  + ### dieNetwork

    public final [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") dieNetwork([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") attackingWeapon,
    boolean isGory,
    zombie.characters.CharacterDiedListener onDiedListener)
  + ### onDied

    private void onDied([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") sender,
    [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### addOnDiedListener

    public void addOnDiedListener(zombie.characters.CharacterDiedListener onDiedListener,
    boolean autoRemoveOnInvoke)
  + ### invokeOnDiedListeners

    private void invokeOnDiedListeners([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### becomeCorpse

    private final [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") becomeCorpse()
  + ### clearDiedBody

    public final void clearDiedBody()
  + ### becomeCorpseItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") becomeCorpseItem([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") placeInContainer,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getMass

    public float getMass()
  + ### getWeightAsCorpse

    public static int getWeightAsCorpse()
  + ### getHitReactionNetworkAI

    public zombie.characters.HitReactionNetworkAI getHitReactionNetworkAI()
  + ### getNetworkCharacterAI

    public zombie.characters.NetworkCharacterAI getNetworkCharacterAI()
  + ### wasLocal

    public boolean wasLocal()
  + ### isLocal

    public final boolean isLocal()
  + ### isRemote

    public final boolean isRemote()
  + ### isNetworkVehicleCollisionActive

    public boolean isNetworkVehicleCollisionActive([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") testVehicle)
  + ### doNetworkHitByVehicle

    public void doNetworkHitByVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") hitByVehicle,
    [BaseVehicle.HitVars](../vehicles/BaseVehicle.HitVars.html "class in zombie.vehicles") hitVars)
  + ### isSkipResolveCollision

    public boolean isSkipResolveCollision()

    Should this character ignore collision resolutions.
    Overriding classes can define their own special-cases.

    Returns:
    :   FALSE if this character wishes to be shunted around by the collision system.   
        TRUE if this character wishes to ignoree collision detection, and phase through obstacles like walls and other characters.
  + ### isPerformingAttackAnimation

    public boolean isPerformingAttackAnimation()
  + ### setPerformingAttackAnimation

    public void setPerformingAttackAnimation(boolean attackAnim)
  + ### isPerformingShoveAnimation

    public boolean isPerformingShoveAnimation()
  + ### setPerformingShoveAnimation

    public void setPerformingShoveAnimation(boolean shoveAnim)
  + ### isPerformingStompAnimation

    public boolean isPerformingStompAnimation()
  + ### setPerformingStompAnimation

    public void setPerformingStompAnimation(boolean stompAnim)
  + ### isPerformingHostileAnimation

    public boolean isPerformingHostileAnimation()
  + ### getNextAnimationTranslationLength

    public [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") getNextAnimationTranslationLength()
  + ### calcHitDir

    public void calcHitDir([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### calcHitDir

    public void calcHitDir([Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### getSafety

    public [Safety](Safety.html "class in zombie.characters") getSafety()

    Specified by:
    :   `getSafety` in interface `zombie.characters.ILuaGameCharacter`
  + ### setSafety

    public void setSafety([Safety](Safety.html "class in zombie.characters") safety)

    Specified by:
    :   `setSafety` in interface `zombie.characters.ILuaGameCharacter`
  + ### burnCorpse

    public void burnCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") corpse)
  + ### setIsAnimal

    public void setIsAnimal(boolean v)
  + ### isAnimal

    public boolean isAnimal()
  + ### isAnimalRunningToDeathPosition

    public boolean isAnimalRunningToDeathPosition()
  + ### getPerkToUnit

    public float getPerkToUnit([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)

    Specified by:
    :   `getPerkToUnit` in interface `zombie.characters.ILuaGameCharacter`
  + ### getReadLiterature

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getReadLiterature()

    Specified by:
    :   `getReadLiterature` in interface `zombie.characters.ILuaGameCharacter`
  + ### isLiteratureRead

    public boolean isLiteratureRead([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `isLiteratureRead` in interface `zombie.characters.ILuaGameCharacter`
  + ### addReadLiterature

    public void addReadLiterature([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `addReadLiterature` in interface `zombie.characters.ILuaGameCharacter`
  + ### addReadLiterature

    public void addReadLiterature([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int day)

    Specified by:
    :   `addReadLiterature` in interface `zombie.characters.ILuaGameCharacter`
  + ### addReadPrintMedia

    public void addReadPrintMedia([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaId)

    Specified by:
    :   `addReadPrintMedia` in interface `zombie.characters.ILuaGameCharacter`
  + ### isPrintMediaRead

    public boolean isPrintMediaRead([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaId)

    Specified by:
    :   `isPrintMediaRead` in interface `zombie.characters.ILuaGameCharacter`
  + ### getReadPrintMedia

    public [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getReadPrintMedia()

    Specified by:
    :   `getReadPrintMedia` in interface `zombie.characters.ILuaGameCharacter`
  + ### hasReadMap

    public boolean hasReadMap([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `hasReadMap` in interface `zombie.characters.ILuaGameCharacter`
  + ### addReadMap

    public void addReadMap([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Specified by:
    :   `addReadMap` in interface `zombie.characters.ILuaGameCharacter`
  + ### setMusicIntensityEventModData

    public void setMusicIntensityEventModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)
  + ### getMusicIntensityEventModData

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getMusicIntensityEventModData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### isWearingTag

    public boolean isWearingTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getCorpseSicknessDefense

    public float getCorpseSicknessDefense()
  + ### getCorpseSicknessDefense

    public float getCorpseSicknessDefense(float rate)
  + ### getCorpseSicknessDefense

    public float getCorpseSicknessDefense(float rate,
    boolean drain)
  + ### isProtectedFromToxic

    public boolean isProtectedFromToxic()
  + ### isProtectedFromToxic

    public boolean isProtectedFromToxic(boolean drain)
  + ### checkSCBADrain

    private void checkSCBADrain()
  + ### isOverEncumbered

    public boolean isOverEncumbered()
  + ### updateWornItemsVisionModifier

    public void updateWornItemsVisionModifier()
  + ### getWornItemsVisionModifier

    public float getWornItemsVisionModifier()
  + ### getWornItemsVisionMultiplier

    public float getWornItemsVisionMultiplier()
  + ### updateWornItemsHearingModifier

    public void updateWornItemsHearingModifier()
  + ### getWornItemsHearingModifier

    public float getWornItemsHearingModifier()
  + ### getWornItemsHearingMultiplier

    public float getWornItemsHearingMultiplier()
  + ### getHearDistanceModifier

    public float getHearDistanceModifier()
  + ### getWeatherHearingMultiplier

    public float getWeatherHearingMultiplier()
  + ### getEffectiveFatigue

    public float getEffectiveFatigue()
  + ### getDetectionRange

    public float getDetectionRange()
  + ### setLastHitCharacter

    public void setLastHitCharacter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") character)
  + ### getLastHitCharacter

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getLastHitCharacter()
  + ### triggerCough

    public void triggerCough()
  + ### hasDirtyClothing

    public boolean hasDirtyClothing([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part)
  + ### hasBloodyClothing

    public boolean hasBloodyClothing([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") part)
  + ### getAnimatable

    public zombie.core.skinnedmodel.advancedanimation.IAnimatable getAnimatable()

    Specified by:
    :   `getAnimatable` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### getGrappleable

    public zombie.core.skinnedmodel.IGrappleable getGrappleable()

    Specified by:
    :   `getGrappleable` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### getWrappedGrappleable

    public zombie.core.skinnedmodel.BaseGrappleable getWrappedGrappleable()

    Specified by:
    :   `getWrappedGrappleable` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### canBeGrappled

    public boolean canBeGrappled()

    Specified by:
    :   `canBeGrappled` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `canBeGrappled` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### isPerformingGrappleAnimation

    public boolean isPerformingGrappleAnimation()

    Specified by:
    :   `isPerformingGrappleAnimation` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### getShoutType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShoutType()
  + ### getShoutItemModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShoutItemModel()
  + ### isWearingGlasses

    public boolean isWearingGlasses()
  + ### isWearingVisualAid

    public boolean isWearingVisualAid()
  + ### getClothingDiscomfortModifier

    public float getClothingDiscomfortModifier()
  + ### getVehicleDiscomfortModifier

    public float getVehicleDiscomfortModifier()
  + ### updateVisionEffectTargets

    public void updateVisionEffectTargets()
  + ### updateVisionEffects

    public void updateVisionEffects()
  + ### getBlurFactor

    public float getBlurFactor()
  + ### isDisguised

    public boolean isDisguised()
  + ### updateDisguisedState

    public void updateDisguisedState()
  + ### OnClothingUpdated

    public void OnClothingUpdated()
  + ### OnEquipmentUpdated

    public void OnEquipmentUpdated()
  + ### renderDebugData

    private void renderDebugData()
  + ### getCorpseSicknessRate

    public float getCorpseSicknessRate()
  + ### setCorpseSicknessRate

    public void setCorpseSicknessRate(float rate)
  + ### spikePartIndex

    public void spikePartIndex(int bodyPartIndex)
  + ### spikePart

    public void spikePart([BodyPartType](BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") partType)
  + ### getReanimatedCorpse

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getReanimatedCorpse()
  + ### applyDamage

    public void applyDamage(float damageAmount)
  + ### canRagdoll

    public boolean canRagdoll()
  + ### getRagdollController

    public zombie.core.physics.RagdollController getRagdollController()
  + ### releaseRagdollController

    public void releaseRagdollController()
  + ### getBallisticsController

    public zombie.core.physics.BallisticsController getBallisticsController()
  + ### updateBallistics

    public void updateBallistics()
  + ### releaseBallisticsController

    public void releaseBallisticsController()
  + ### getBallisticsTarget

    public zombie.core.physics.BallisticsTarget getBallisticsTarget()
  + ### ensureExistsBallisticsTarget

    public zombie.core.physics.BallisticsTarget ensureExistsBallisticsTarget([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### updateBallisticsTarget

    private void updateBallisticsTarget()
  + ### releaseBallisticsTarget

    public void releaseBallisticsTarget()
  + ### canReachTo

    public boolean canReachTo([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### canUseAsGenericCraftingSurface

    public boolean canUseAsGenericCraftingSurface([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### getHitInfoList

    public [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<zombie.network.fields.hit.HitInfo> getHitInfoList()
  + ### getAimingMode

    public zombie.input.AimingMode getAimingMode()
  + ### updateHasTargetFlag

    public void updateHasTargetFlag()
  + ### isUnarmed

    public boolean isUnarmed()
  + ### isMeleeWeaponEquipped

    public boolean isMeleeWeaponEquipped()
  + ### isRangedWeaponEquipped

    public boolean isRangedWeaponEquipped()
  + ### isAimingFirearmEquipped

    public boolean isAimingFirearmEquipped()
  + ### getAttackVars

    public zombie.network.fields.hit.AttackVars getAttackVars()
  + ### addCombatMuscleStrain

    public void addCombatMuscleStrain([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") weapon)
  + ### addCombatMuscleStrain

    public void addCombatMuscleStrain([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") weapon,
    int hitCount)
  + ### addCombatMuscleStrain

    public void addCombatMuscleStrain([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    int hitCount,
    float multiplier)
  + ### addRightLegMuscleStrain

    public void addRightLegMuscleStrain(float painfactor)
  + ### addBackMuscleStrain

    public void addBackMuscleStrain(float painfactor)
  + ### addNeckMuscleStrain

    public void addNeckMuscleStrain(float painfactor)
  + ### addArmMuscleStrain

    public void addArmMuscleStrain(float painfactor)
  + ### addLeftArmMuscleStrain

    public void addLeftArmMuscleStrain(float painfactor)
  + ### addBothArmMuscleStrain

    public void addBothArmMuscleStrain(float painfactor)
  + ### addStiffness

    public void addStiffness([BodyPartType](BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") partType,
    float stiffness)
  + ### getClimbingFailChanceInt

    public int getClimbingFailChanceInt()
  + ### getClimbingFailChanceFloat

    public float getClimbingFailChanceFloat()
  + ### nearbyZombieClimbPenalty

    public float nearbyZombieClimbPenalty()
  + ### isClimbingRope

    public boolean isClimbingRope()
  + ### fallFromRope

    public void fallFromRope()
  + ### isWearingGloves

    public boolean isWearingGloves()
  + ### isWearingAwkwardGloves

    public boolean isWearingAwkwardGloves()
  + ### getClimbRopeSpeed

    public float getClimbRopeSpeed(boolean down)
  + ### setClimbRopeTime

    public void setClimbRopeTime(float time)
  + ### getClimbRopeTime

    public float getClimbRopeTime()
  + ### hasAwkwardHands

    public boolean hasAwkwardHands()
  + ### forbidConcurrentAction

    private boolean forbidConcurrentAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action)
  + ### triggerContextualAction

    public void triggerContextualAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action)

    Specified by:
    :   `triggerContextualAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### triggerContextualAction

    public void triggerContextualAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)

    Specified by:
    :   `triggerContextualAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### triggerContextualAction

    public void triggerContextualAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2)

    Specified by:
    :   `triggerContextualAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### triggerContextualAction

    public void triggerContextualAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3)

    Specified by:
    :   `triggerContextualAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### triggerContextualAction

    public void triggerContextualAction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4)

    Specified by:
    :   `triggerContextualAction` in interface `zombie.characters.ILuaGameCharacter`
  + ### isActuallyAttackingWithMeleeWeapon

    public boolean isActuallyAttackingWithMeleeWeapon()
  + ### isDoStomp

    public boolean isDoStomp()
  + ### isShoving

    public boolean isShoving()
  + ### teleportTo

    public void teleportTo(int newX,
    int newY)
  + ### teleportTo

    public void teleportTo(float newX,
    float newY)
  + ### teleportTo

    public void teleportTo(float newX,
    float newY,
    int newZ)
  + ### teleportTo

    public void teleportTo(int newX,
    int newY,
    int newZ)
  + ### ensureNotInVehicle

    public void ensureNotInVehicle()
  + ### forgetRecipes

    public void forgetRecipes()
  + ### isHandModelOverriddenByCurrentCharacterAction

    protected boolean isHandModelOverriddenByCurrentCharacterAction()
  + ### isPrimaryHandModelReady

    protected boolean isPrimaryHandModelReady()
  + ### isRangedWeaponReady

    private boolean isRangedWeaponReady()
  + ### isWeaponReady

    public boolean isWeaponReady()
  + ### climbThroughWindow

    public void climbThroughWindow([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)
  + ### getClimbData

    public [ClimbSheetRopeState.ClimbData](../ai/states/ClimbSheetRopeState.ClimbData.html "class in zombie.ai.states") getClimbData()
  + ### setClimbData

    public void setClimbData([ClimbSheetRopeState.ClimbData](../ai/states/ClimbSheetRopeState.ClimbData.html "class in zombie.ai.states") climbData)
  + ### getIdleSquareTime

    public float getIdleSquareTime()
  + ### updateIdleSquareTime

    private void updateIdleSquareTime()
  + ### isCurrentlyIdle

    public boolean isCurrentlyIdle()
  + ### isCurrentlyBusy

    public boolean isCurrentlyBusy()
  + ### isInCombat

    private boolean isInCombat()
  + ### updateMovementStatistics

    private void updateMovementStatistics()
  + ### flagForHotSave

    public void flagForHotSave()

    Overrides:
    :   `flagForHotSave` in class `IsoObject`
  + ### getContainers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContainers()
  + ### hasRecipeAtHand

    public boolean hasRecipeAtHand([CraftRecipe](../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getCheats

    public zombie.characters.PlayerCheats getCheats()
  + ### calculateVisibilityData

    public zombie.characters.VisibilityData calculateVisibilityData()
  + ### hasFullInventory

    public boolean hasFullInventory()
  + ### getFreeInventoryCapacity

    public float getFreeInventoryCapacity()
  + ### onFireLightSourceCheck

    public void onFireLightSourceCheck()
  + ### removeOnFireLightSource

    public void removeOnFireLightSource()
  + ### isInventive

    public boolean isInventive()
  + ### createFallingItem

    protected void createFallingItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)