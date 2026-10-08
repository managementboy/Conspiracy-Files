[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoPlayer](IsoPlayer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [RAND\_INJURY](#RAND_INJURY)
   2. [RAND\_DISCOMFORT](#RAND_DISCOMFORT)
   3. [RAND\_SICK](#RAND_SICK)
   4. [RAND\_ENDURANCE](#RAND_ENDURANCE)
   5. [RAND\_IDLE\_EMOTE](#RAND_IDLE_EMOTE)
   6. [UPDATES\_BETWEEN\_RANDOM\_IDLE\_FIDGETS](#UPDATES_BETWEEN_RANDOM_IDLE_FIDGETS)
   7. [StrongTraitMaxWeightDelta](#StrongTraitMaxWeightDelta)
   8. [WeakTraitMaxWeightDelta](#WeakTraitMaxWeightDelta)
   9. [FeebleTraitMaxWeightDelta](#FeebleTraitMaxWeightDelta)
   10. [StoutTraitMaxWeightDelta](#StoutTraitMaxWeightDelta)
   11. [REMOTE\_PLAYER\_PATHFINDER\_SUPPRESS\_MAX\_DIST\_TILES](#REMOTE_PLAYER_PATHFINDER_SUPPRESS_MAX_DIST_TILES)
   12. [IN\_TREES\_INJURY\_INTERVAL\_SECONDS](#IN_TREES_INJURY_INTERVAL_SECONDS)
   13. [IN\_TREES\_SPEED\_PARK\_RANGER\_MULTIPLIER](#IN_TREES_SPEED_PARK_RANGER_MULTIPLIER)
   14. [IN\_TREES\_SPEED\_LUMBERJACK\_MULTIPLIER](#IN_TREES_SPEED_LUMBERJACK_MULTIPLIER)
   15. [IN\_TREES\_SPEED\_RUNNING\_MULTIPLIER](#IN_TREES_SPEED_RUNNING_MULTIPLIER)
   16. [physicsDebugRenderer](#physicsDebugRenderer)
   17. [attackType](#attackType)
   18. [DEATH\_MUSIC\_NAME](#DEATH_MUSIC_NAME)
   19. [isTestAIMode](#isTestAIMode)
   20. [NoSound](#NoSound)
   21. [assumedPlayer](#assumedPlayer)
   22. [numPlayers](#numPlayers)
   23. [MAX](#MAX)
   24. [players](#players)
   25. [instance](#instance)
   26. [instanceLock](#instanceLock)
   27. [testHitPosition](#testHitPosition)
   28. [followDeadCount](#followDeadCount)
   29. [ignoreAutoVault](#ignoreAutoVault)
   30. [remoteSneakLvl](#remoteSneakLvl)
   31. [remoteStrLvl](#remoteStrLvl)
   32. [remoteFitLvl](#remoteFitLvl)
   33. [moodleCantSprint](#moodleCantSprint)
   34. [tempo](#tempo)
   35. [tempVector2](#tempVector2)
   36. [coopPvp](#coopPvp)
   37. [ignoreContextKey](#ignoreContextKey)
   38. [lastRemoteUpdate](#lastRemoteUpdate)
   39. [luredAnimals](#luredAnimals)
   40. [isLuringAnimals](#isLuringAnimals)
   41. [invPageDirty](#invPageDirty)
   42. [attachedAnimals](#attachedAnimals)
   43. [spottedByPlayer](#spottedByPlayer)
   44. [spottedPlayerTimer](#spottedPlayerTimer)
   45. [extUpdateCount](#extUpdateCount)
   46. [attackStarted](#attackStarted)
   47. [m\_isoPlayerTriggerWatcher](#m_isoPlayerTriggerWatcher)
   48. [setClothingTriggerWatcher](#setClothingTriggerWatcher)
   49. [tempVector2\_1](#tempVector2_1)
   50. [tempVector2\_2](#tempVector2_2)
   51. [baseVisual](#baseVisual)
   52. [remotePlayerItemVisuals](#remotePlayerItemVisuals)
   53. [targetedByZombie](#targetedByZombie)
   54. [lastTargeted](#lastTargeted)
   55. [timeSinceOpenDoor](#timeSinceOpenDoor)
   56. [timeSinceCloseDoor](#timeSinceCloseDoor)
   57. [remote](#remote)
   58. [timeSinceLastNetData](#timeSinceLastNetData)
   59. [role](#role)
   60. [tagPrefix](#tagPrefix)
   61. [showTag](#showTag)
   62. [factionPvp](#factionPvp)
   63. [onlineId](#onlineId)
   64. [onlineChunkGridWidth](#onlineChunkGridWidth)
   65. [joypadIgnoreChargingRt](#joypadIgnoreChargingRt)
   66. [mpTorchCone](#mpTorchCone)
   67. [mpTorchDist](#mpTorchDist)
   68. [mpTorchStrength](#mpTorchStrength)
   69. [playerIndex](#playerIndex)
   70. [serverPlayerIndex](#serverPlayerIndex)
   71. [useChargeDelta](#useChargeDelta)
   72. [contextPanic](#contextPanic)
   73. [numNearbyBuildingsRooms](#numNearbyBuildingsRooms)
   74. [isCharging](#isCharging)
   75. [isChargingLt](#isChargingLt)
   76. [lookingWhileInVehicle](#lookingWhileInVehicle)
   77. [climbOverWallSuccess](#climbOverWallSuccess)
   78. [climbOverWallStruggle](#climbOverWallStruggle)
   79. [justMoved](#justMoved)
   80. [maxWeightDelta](#maxWeightDelta)
   81. [currentSpeed](#currentSpeed)
   82. [deathFinished](#deathFinished)
   83. [isSpeek](#isSpeek)
   84. [isVoiceMute](#isVoiceMute)
   85. [playerMoveDir](#playerMoveDir)
   86. [soundListener](#soundListener)
   87. [username](#username)
   88. [dirtyRecalcGridStack](#dirtyRecalcGridStack)
   89. [dirtyRecalcGridStackTime](#dirtyRecalcGridStackTime)
   90. [runningTime](#runningTime)
   91. [timePressedContext](#timePressedContext)
   92. [chargeTime](#chargeTime)
   93. [useChargeTime](#useChargeTime)
   94. [pressContext](#pressContext)
   95. [letGoAfterContextIsReleased](#letGoAfterContextIsReleased)
   96. [closestZombie](#closestZombie)
   97. [lastAngle](#lastAngle)
   98. [saveFileName](#saveFileName)
   99. [bannedAttacking](#bannedAttacking)
   100. [sqlId](#sqlId)
   101. [clearSpottedTimer](#clearSpottedTimer)
   102. [timeSinceLastStab](#timeSinceLastStab)
   103. [lastSpotted](#lastSpotted)
   104. [changeCharacterDebounce](#changeCharacterDebounce)
   105. [followId](#followId)
   106. [followCamStack](#followCamStack)
   107. [seenThisFrame](#seenThisFrame)
   108. [couldBeSeenThisFrame](#couldBeSeenThisFrame)
   109. [asleepTime](#asleepTime)
   110. [spottedList](#spottedList)
   111. [ticksSinceSeenZombie](#ticksSinceSeenZombie)
   112. [waiting](#waiting)
   113. [dragCharacter](#dragCharacter)
   114. [heartDelay](#heartDelay)
   115. [heartDelayMax](#heartDelayMax)
   116. [aimingWeaponAnimation](#aimingWeaponAnimation)
   117. [heartEventInstance](#heartEventInstance)
   118. [dialogMood](#dialogMood)
   119. [ping](#ping)
   120. [dragObject](#dragObject)
   121. [lastSeenZombieTime](#lastSeenZombieTime)
   122. [checkSafehouse](#checkSafehouse)
   123. [attackFromBehind](#attackFromBehind)
   124. [hypothermiaCache](#hypothermiaCache)
   125. [hyperthermiaCache](#hyperthermiaCache)
   126. [ticksSincePressedMovement](#ticksSincePressedMovement)
   127. [flickTorch](#flickTorch)
   128. [checkNearbyRooms](#checkNearbyRooms)
   129. [useVehicle](#useVehicle)
   130. [usedVehicle](#usedVehicle)
   131. [tempVector3f](#tempVector3f)
   132. [templwjglVector3f](#templwjglVector3f)
   133. [inputState](#inputState)
   134. [isWearingNightVisionGoggles](#isWearingNightVisionGoggles)
   135. [moveSpeed](#moveSpeed)
   136. [offSetXUi](#offSetXUi)
   137. [offSetYUi](#offSetYUi)
   138. [combatSpeed](#combatSpeed)
   139. [hoursSurvived](#hoursSurvived)
   140. [isAuthorizedHandToHandAction](#isAuthorizedHandToHandAction)
   141. [isAuthorizedHandToHand](#isAuthorizedHandToHand)
   142. [blockMovement](#blockMovement)
   143. [nutrition](#nutrition)
   144. [fitness](#fitness)
   145. [forceOverrideAnim](#forceOverrideAnim)
   146. [initiateAttack](#initiateAttack)
   147. [tagColor](#tagColor)
   148. [displayName](#displayName)
   149. [seeNonPvpZone](#seeNonPvpZone)
   150. [seeDesignationZone](#seeDesignationZone)
   151. [selectedZonesForHighlight](#selectedZonesForHighlight)
   152. [selectedZoneForHighlight](#selectedZoneForHighlight)
   153. [mechanicsItem](#mechanicsItem)
   154. [sleepingPillsTaken](#sleepingPillsTaken)
   155. [lastPillsTaken](#lastPillsTaken)
   156. [heavyBreathInstance](#heavyBreathInstance)
   157. [heavyBreathSoundName](#heavyBreathSoundName)
   158. [allChatMuted](#allChatMuted)
   159. [multiplayer](#multiplayer)
   160. [saveFileIp](#saveFileIp)
   161. [vehicle4testCollision](#vehicle4testCollision)
   162. [steamId](#steamId)
   163. [vehicleContainerData](#vehicleContainerData)
   164. [isWalking](#isWalking)
   165. [footInjuryTimer](#footInjuryTimer)
   166. [inTreesInjuryTimer](#inTreesInjuryTimer)
   167. [turnDelta](#turnDelta)
   168. [isPlayerMoving](#isPlayerMoving)
   169. [walkSpeed](#walkSpeed)
   170. [walkInjury](#walkInjury)
   171. [runSpeed](#runSpeed)
   172. [idleSpeed](#idleSpeed)
   173. [deltaX](#deltaX)
   174. [deltaY](#deltaY)
   175. [windspeed](#windspeed)
   176. [windForce](#windForce)
   177. [ipX](#ipX)
   178. [ipY](#ipY)
   179. [drunkDelayCommandTimer](#drunkDelayCommandTimer)
   180. [pressedRunTimer](#pressedRunTimer)
   181. [pressedRun](#pressedRun)
   182. [meleePressed](#meleePressed)
   183. [grapplePressed](#grapplePressed)
   184. [canLetGoOfGrappled](#canLetGoOfGrappled)
   185. [lastAttackWasHandToHand](#lastAttackWasHandToHand)
   186. [isPerformingAnAction](#isPerformingAnAction)
   187. [alreadyReadBook](#alreadyReadBook)
   188. [bleedingLevel](#bleedingLevel)
   189. [musicIntensityEvents](#musicIntensityEvents)
   190. [musicThreatStatuses](#musicThreatStatuses)
   191. [musicIntensityInside](#musicIntensityInside)
   192. [isFarming](#isFarming)
   193. [attackVariationX](#attackVariationX)
   194. [attackVariationY](#attackVariationY)
   195. [accessLevel](#accessLevel)
   196. [hasObstacleOnPath](#hasObstacleOnPath)
   197. [timedActionToRetrigger](#timedActionToRetrigger)
   198. [pathfindRun](#pathfindRun)
   199. [s\_targetsProne](#s_targetsProne)
   200. [s\_targetsStanding](#s_targetsStanding)
   201. [contextualActions](#contextualActions)
   202. [weaponT](#weaponT)
   203. [parameterCharacterMoving](#parameterCharacterMoving)
   204. [parameterCharacterMovementSpeed](#parameterCharacterMovementSpeed)
   205. [parameterCharacterOnFire](#parameterCharacterOnFire)
   206. [parameterCharacterVoiceType](#parameterCharacterVoiceType)
   207. [parameterCharacterVoicePitch](#parameterCharacterVoicePitch)
   208. [parameterDeaf](#parameterDeaf)
   209. [parameterDragMaterial](#parameterDragMaterial)
   210. [parameterElevation](#parameterElevation)
   211. [parameterEquippedBaggageContainer](#parameterEquippedBaggageContainer)
   212. [parameterExercising](#parameterExercising)
   213. [parameterFirearmDistance](#parameterFirearmDistance)
   214. [parameterFirearmInside](#parameterFirearmInside)
   215. [parameterFirearmRoomSize](#parameterFirearmRoomSize)
   216. [parameterFootstepMaterial](#parameterFootstepMaterial)
   217. [parameterFootstepMaterial2](#parameterFootstepMaterial2)
   218. [parameterIsStashTile](#parameterIsStashTile)
   219. [parameterLocalPlayer](#parameterLocalPlayer)
   220. [parameterMeleeHitSurface](#parameterMeleeHitSurface)
   221. [parameterOverlapFoliageType](#parameterOverlapFoliageType)
   222. [parameterPlayerHealth](#parameterPlayerHealth)
   223. [parameterVehicleHitLocation](#parameterVehicleHitLocation)
   224. [parameterShoeType](#parameterShoeType)
   225. [parameterMoodles](#parameterMoodles)
   226. [grapplerGruntChance](#grapplerGruntChance)
   227. [updateAimingVectorParams](#updateAimingVectorParams)
   228. [craftHistory](#craftHistory)
   229. [autoDrink](#autoDrink)
   230. [lastCheatToggleMillis](#lastCheatToggleMillis)
   231. [NETWORK\_SPEED\_MUL\_MIN](#NETWORK_SPEED_MUL_MIN)
   232. [NETWORK\_SPEED\_MUL\_MAX](#NETWORK_SPEED_MUL_MAX)
   233. [NETWORK\_SPEED\_SMOOTH\_START](#NETWORK_SPEED_SMOOTH_START)
   234. [NETWORK\_SPEED\_SMOOTH\_END](#NETWORK_SPEED_SMOOTH_END)
   235. [RecentlyRemoved](#RecentlyRemoved)
   236. [s\_moveVars](#s_moveVars)
   237. [drunkMoveVars](#drunkMoveVars)
   238. [attackAnimThrowTimer](#attackAnimThrowTimer)
7. [Constructor Details](#constructor-detail)
   1. [IsoPlayer(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoPlayer(IsoCell, SurvivorDesc, int, int, int, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.characters.SurvivorDesc,int,int,int,boolean))
   3. [IsoPlayer(IsoCell, SurvivorDesc, int, int, int)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.characters.SurvivorDesc,int,int,int))
8. [Method Details](#method-detail)
   1. [registerECSComponents()](#registerECSComponents())
   2. [setOnlineID(short)](#setOnlineID(short))
   3. [registerVariableCallbacks()](#registerVariableCallbacks())
   4. [registerAnimEventCallbacks()](#registerAnimEventCallbacks())
   5. [onGrappleEnded()](#onGrappleEnded())
   6. [OnAnimEvent\_GrapplerPlayRandomGrunt(IsoGameCharacter, String)](#OnAnimEvent_GrapplerPlayRandomGrunt(zombie.characters.IsoGameCharacter,java.lang.String))
   7. [getDeferredMovement(Vector2, boolean)](#getDeferredMovement(zombie.iso.Vector2,boolean))
   8. [getTurnDelta()](#getTurnDelta())
   9. [setPerformingAnAction(boolean)](#setPerformingAnAction(boolean))
   10. [isPerformingAnAction()](#isPerformingAnAction())
   11. [isAttacking()](#isAttacking())
   12. [shouldBeTurning()](#shouldBeTurning())
   13. [invokeOnPlayerInstance(Runnable)](#invokeOnPlayerInstance(java.lang.Runnable))
   14. [getInstance()](#getInstance())
   15. [setInstance(IsoPlayer)](#setInstance(zombie.characters.IsoPlayer))
   16. [hasInstance()](#hasInstance())
   17. [onTrigger\_ResetIsoPlayerModel(String)](#onTrigger_ResetIsoPlayerModel(java.lang.String))
   18. [getFollowDeadCount()](#getFollowDeadCount())
   19. [setFollowDeadCount(int)](#setFollowDeadCount(int))
   20. [getAllFileNames()](#getAllFileNames())
   21. [getUniqueFileName()](#getUniqueFileName())
   22. [getAllSavedPlayers()](#getAllSavedPlayers())
   23. [isServerPlayerIDValid(String)](#isServerPlayerIDValid(java.lang.String))
   24. [getPlayerIndex()](#getPlayerIndex())
   25. [getPlayer(int)](#getPlayer(int))
   26. [getPlayerIndex(IsoGameCharacter)](#getPlayerIndex(zombie.characters.IsoGameCharacter))
   27. [visitAllPlayers(Consumer)](#visitAllPlayers(java.util.function.Consumer))
   28. [findPlayer(C, BiPredicate)](#findPlayer(C,java.util.function.BiPredicate))
   29. [anyPlayer(C, BiPredicate)](#anyPlayer(C,java.util.function.BiPredicate))
   30. [visitAllPlayersWithComponent(Class, BiConsumer)](#visitAllPlayersWithComponent(java.lang.Class,java.util.function.BiConsumer))
   31. [getIndex()](#getIndex())
   32. [getPlayerNum()](#getPlayerNum())
   33. [allPlayersDead()](#allPlayersDead())
   34. [getPlayers()](#getPlayers())
   35. [allPlayersAsleep()](#allPlayersAsleep())
   36. [getCoopPVP()](#getCoopPVP())
   37. [setCoopPVP(boolean)](#setCoopPVP(boolean))
   38. [TestAnimalSpotPlayer(IsoAnimal)](#TestAnimalSpotPlayer(zombie.characters.animals.IsoAnimal))
   39. [TestZombieSpotPlayer(IsoMovingObject)](#TestZombieSpotPlayer(zombie.iso.IsoMovingObject))
   40. [getPathSpeed()](#getPathSpeed())
   41. [isGhostMode()](#isGhostMode())
   42. [setGhostMode(boolean, boolean)](#setGhostMode(boolean,boolean))
   43. [setGhostMode(boolean)](#setGhostMode(boolean))
   44. [isSeeEveryone()](#isSeeEveryone())
   45. [moveUnmodded(float, float)](#moveUnmodded(float,float))
   46. [nullifyAiming()](#nullifyAiming())
   47. [initializeStates()](#initializeStates())
   48. [onAnimPlayerCreated(AnimationPlayer)](#onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer))
   49. [GetAnimSetName()](#GetAnimSetName())
   50. [IsInMeleeAttack()](#IsInMeleeAttack())
   51. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   52. [setExtraInfoFlags(byte, boolean)](#setExtraInfoFlags(byte,boolean))
   53. [getExtraInfoFlags()](#getExtraInfoFlags())
   54. [calculateShowAdminTag()](#calculateShowAdminTag())
   55. [getDescription(String)](#getDescription(java.lang.String))
   56. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   57. [save()](#save())
   58. [save(String)](#save(java.lang.String))
   59. [load(String)](#load(java.lang.String))
   60. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   61. [removeFromWorld()](#removeFromWorld())
   62. [UpdateRemovedEmitters()](#UpdateRemovedEmitters())
   63. [Reset()](#Reset())
   64. [setVehicle4TestCollision(BaseVehicle)](#setVehicle4TestCollision(zombie.vehicles.BaseVehicle))
   65. [isSaveFileInUse()](#isSaveFileInUse())
   66. [removeSaveFile()](#removeSaveFile())
   67. [isSaveFileIPValid()](#isSaveFileIPValid())
   68. [getObjectName()](#getObjectName())
   69. [getScreenChestHeight()](#getScreenChestHeight())
   70. [getAimVector(Vector2)](#getAimVector(zombie.iso.Vector2))
   71. [calculateAimVector(Vector2)](#calculateAimVector(zombie.iso.Vector2))
   72. [getGlobalMovementMod(boolean)](#getGlobalMovementMod(boolean))
   73. [doTreeNoises()](#doTreeNoises())
   74. [isInTrees2(boolean)](#isInTrees2(boolean))
   75. [getMoveSpeed()](#getMoveSpeed())
   76. [setMoveSpeed(float)](#setMoveSpeed(float))
   77. [getTorchStrength()](#getTorchStrength())
   78. [getInvAimingMod()](#getInvAimingMod())
   79. [getAimingMod()](#getAimingMod())
   80. [getReloadingMod()](#getReloadingMod())
   81. [getAimingRangeMod()](#getAimingRangeMod())
   82. [isPathfindRunning()](#isPathfindRunning())
   83. [setPathfindRunning(boolean)](#setPathfindRunning(boolean))
   84. [isBannedAttacking()](#isBannedAttacking())
   85. [setBannedAttacking(boolean)](#setBannedAttacking(boolean))
   86. [getInvAimingRangeMod()](#getInvAimingRangeMod())
   87. [updateCursorVisibility()](#updateCursorVisibility())
   88. [renderAttachedAnimalRopes()](#renderAttachedAnimalRopes())
   89. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   90. [renderlast()](#renderlast())
   91. [postHitByVehicleUpdateStance(float, boolean)](#postHitByVehicleUpdateStance(float,boolean))
   92. [setIgnoreMovement(boolean)](#setIgnoreMovement(boolean))
   93. [onHitByVehicleApplyDamage(BaseVehicle, float)](#onHitByVehicleApplyDamage(zombie.vehicles.BaseVehicle,float))
   94. [applyDamageFromVehicleHit(BaseVehicle, float, float)](#applyDamageFromVehicleHit(zombie.vehicles.BaseVehicle,float,float))
   95. [update()](#update())
   96. [updateInternal1()](#updateInternal1())
   97. [setBeenMovingSprinting()](#setBeenMovingSprinting())
   98. [updateInternal2()](#updateInternal2())
   99. [setNpc(boolean)](#setNpc(boolean))
   100. [handleLandingImpact(FallDamage)](#handleLandingImpact(zombie.characters.FallDamage))
   101. [playPainVoicesFromFallDamage(FallDamage)](#playPainVoicesFromFallDamage(zombie.characters.FallDamage))
   102. [setDoGrappleLetGoAfterContextKeyIsReleased(boolean)](#setDoGrappleLetGoAfterContextKeyIsReleased(boolean))
   103. [isDoGrappleLetGoAfterContextKeyIsReleased()](#isDoGrappleLetGoAfterContextKeyIsReleased())
   104. [updateMovementFromInput(IsoPlayer.MoveVars)](#updateMovementFromInput(zombie.characters.IsoPlayer.MoveVars))
   105. [resolveStrafeDirectionFromPath(Vector2)](#resolveStrafeDirectionFromPath(zombie.iso.Vector2))
   106. [randomizeDrunkenMovement(IsoPlayer.MoveVars, boolean)](#randomizeDrunkenMovement(zombie.characters.IsoPlayer.MoveVars,boolean))
   107. [adjustMovementForDrunks(IsoPlayer.MoveVars, boolean)](#adjustMovementForDrunks(zombie.characters.IsoPlayer.MoveVars,boolean))
   108. [updateAimingStance()](#updateAimingStance())
   109. [calculateStats()](#calculateStats())
   110. [updateStats\_Sleeping()](#updateStats_Sleeping())
   111. [processWakingUp()](#processWakingUp())
   112. [updateEnduranceWhileSitting()](#updateEnduranceWhileSitting())
   113. [updateEnduranceWhileInVehicle()](#updateEnduranceWhileInVehicle())
   114. [updateEndurance()](#updateEndurance())
   115. [checkActionsBlockingMovement()](#checkActionsBlockingMovement())
   116. [updateInteractKeyPanic()](#updateInteractKeyPanic())
   117. [updateSneakKey()](#updateSneakKey())
   118. [updateChangeCharacterKey()](#updateChangeCharacterKey())
   119. [updateEnableModelsKey()](#updateEnableModelsKey())
   120. [updateDeathDragDown()](#updateDeathDragDown())
   121. [updateGodModeKey()](#updateGodModeKey())
   122. [checkReloading()](#checkReloading())
   123. [postupdate()](#postupdate())
   124. [postupdateInternal()](#postupdateInternal())
   125. [isSolidForSeparate()](#isSolidForSeparate())
   126. [isPushableForSeparate()](#isPushableForSeparate())
   127. [isPushedByForSeparate(IsoMovingObject)](#isPushedByForSeparate(zombie.iso.IsoMovingObject))
   128. [updateExt()](#updateExt())
   129. [onIdlePerformFidgets()](#onIdlePerformFidgets())
   130. [updateUseKey()](#updateUseKey())
   131. [clearUseKeyVariables()](#clearUseKeyVariables())
   132. [updateSoundListener()](#updateSoundListener())
   133. [updateMovementRates()](#updateMovementRates())
   134. [calculateWalkSpeed()](#calculateWalkSpeed())
   135. [pressedAttack()](#pressedAttack())
   136. [setAttackVariationX(float)](#setAttackVariationX(float))
   137. [getAttackVariationX()](#getAttackVariationX())
   138. [setAttackVariationY(float)](#setAttackVariationY(float))
   139. [getAttackVariationY()](#getAttackVariationY())
   140. [canPerformHandToHandCombat()](#canPerformHandToHandCombat())
   141. [clearHandToHandAttack()](#clearHandToHandAttack())
   142. [setAttackAnimThrowTimer(long)](#setAttackAnimThrowTimer(long))
   143. [isAttackAnimThrowTimeOut()](#isAttackAnimThrowTimeOut())
   144. [isAiming()](#isAiming())
   145. [getWeaponType()](#getWeaponType())
   146. [setWeaponType(String)](#setWeaponType(java.lang.String))
   147. [calculateCritChance(IsoGameCharacter)](#calculateCritChance(zombie.characters.IsoGameCharacter))
   148. [isAimControlActive()](#isAimControlActive())
   149. [isGettingUp()](#isGettingUp())
   150. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())
   151. [allowsTwist()](#allowsTwist())
   152. [getInputMoveVector(Vector2)](#getInputMoveVector(zombie.iso.Vector2))
   153. [UpdateInputState(IsoPlayer.InputState)](#UpdateInputState(zombie.characters.IsoPlayer.InputState))
   154. [getClosestTo(IsoGameCharacter)](#getClosestTo(zombie.characters.IsoGameCharacter))
   155. [hitConsequences(HandWeapon, IsoGameCharacter, boolean, float, boolean)](#hitConsequences(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean,float,boolean))
   156. [getWeapon()](#getWeapon())
   157. [updateMechanicsItems()](#updateMechanicsItems())
   158. [enterExitVehicle()](#enterExitVehicle())
   159. [checkActionGroup()](#checkActionGroup())
   160. [getUseableVehicle()](#getUseableVehicle())
   161. [isBetterBestSeat(BaseVehicle, BaseVehicle)](#isBetterBestSeat(zombie.vehicles.BaseVehicle,zombie.vehicles.BaseVehicle))
   162. [isNearVehicle()](#isNearVehicle())
   163. [getNearVehicle()](#getNearVehicle())
   164. [updateWhileInVehicle()](#updateWhileInVehicle())
   165. [attackWhileInVehicle()](#attackWhileInVehicle())
   166. [setAngleFromAim()](#setAngleFromAim())
   167. [updateTorchStrength()](#updateTorchStrength())
   168. [calculateContext()](#calculateContext())
   169. [isSafeToClimbOver(IsoDirections)](#isSafeToClimbOver(zombie.iso.IsoDirections))
   170. [canPlaceCorpseOnSquare(IsoGridSquare)](#canPlaceCorpseOnSquare(zombie.iso.IsoGridSquare))
   171. [canThrowCorpseOver(IsoGridSquare, IsoDirections)](#canThrowCorpseOver(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   172. [canThrowCorpseOver(IsoDirections)](#canThrowCorpseOver(zombie.iso.IsoDirections))
   173. [addContextualAction(ContextualAction.Action, IsoDirections, IsoGridSquare, IsoObject)](#addContextualAction(zombie.characters.ContextualAction.Action,zombie.iso.IsoDirections,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   174. [addContextualAction(ContextualAction.Action, Invokers.Params1.ICallback)](#addContextualAction(zombie.characters.ContextualAction.Action,zombie.util.lambda.Invokers.Params1.ICallback))
   175. [pickBestContextualAction(ArrayList)](#pickBestContextualAction(java.util.ArrayList))
   176. [performContextualAction(ContextualAction)](#performContextualAction(zombie.characters.ContextualAction))
   177. [doContext()](#doContext())
   178. [doContextNSWE(IsoDirections)](#doContextNSWE(zombie.iso.IsoDirections))
   179. [doContextRestOnFurniture(IsoDirections)](#doContextRestOnFurniture(zombie.iso.IsoDirections))
   180. [doContextAnimalInteraction(IsoDirections)](#doContextAnimalInteraction(zombie.iso.IsoDirections))
   181. [doContextButcherHook(IsoDirections)](#doContextButcherHook(zombie.iso.IsoDirections))
   182. [doContextHutch(IsoDirections)](#doContextHutch(zombie.iso.IsoDirections))
   183. [doContextToggleCurtain(IsoDirections)](#doContextToggleCurtain(zombie.iso.IsoDirections))
   184. [doContextClimbSheetRope(IsoDirections)](#doContextClimbSheetRope(zombie.iso.IsoDirections))
   185. [doContextHopOverFence(IsoDirections)](#doContextHopOverFence(zombie.iso.IsoDirections))
   186. [doContextThrowGrappledTargetOverFence(IsoDirections)](#doContextThrowGrappledTargetOverFence(zombie.iso.IsoDirections))
   187. [doContextCorners(IsoDirections)](#doContextCorners(zombie.iso.IsoDirections))
   188. [getContextDoorOrWindowOrWindowFrame(IsoDirections)](#getContextDoorOrWindowOrWindowFrame(zombie.iso.IsoDirections))
   189. [doContextDoorOrWindowOrWindowFrame(IsoDirections, IsoObject)](#doContextDoorOrWindowOrWindowFrame(zombie.iso.IsoDirections,zombie.iso.IsoObject))
   190. [doContextWindowFrame(IsoDirections, IsoWindowFrame, boolean)](#doContextWindowFrame(zombie.iso.IsoDirections,zombie.iso.objects.IsoWindowFrame,boolean))
   191. [doContextThumpableWindow(IsoDirections, IsoThumpable, boolean)](#doContextThumpableWindow(zombie.iso.IsoDirections,zombie.iso.objects.IsoThumpable,boolean))
   192. [doContextWindow(IsoDirections, IsoWindow, boolean)](#doContextWindow(zombie.iso.IsoDirections,zombie.iso.objects.IsoWindow,boolean))
   193. [doContextThrowGrappledTargetOutWindow(IsoDirections, IsoObject)](#doContextThrowGrappledTargetOutWindow(zombie.iso.IsoDirections,zombie.iso.IsoObject))
   194. [doContextThrowGrappledTargetOverFence(IsoGridSquare, IsoDirections, IsoObject)](#doContextThrowGrappledTargetOverFence(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,zombie.iso.IsoObject))
   195. [doContextThrowGrappledTargetIntoInventory(IsoDirections)](#doContextThrowGrappledTargetIntoInventory(zombie.iso.IsoDirections))
   196. [doContextThrowGrappledTargetIntoInventory(ItemContainer)](#doContextThrowGrappledTargetIntoInventory(zombie.inventory.ItemContainer))
   197. [doContextThumpableDoor(IsoDirections, IsoThumpable)](#doContextThumpableDoor(zombie.iso.IsoDirections,zombie.iso.objects.IsoThumpable))
   198. [doContextDoor(IsoDirections, IsoDoor)](#doContextDoor(zombie.iso.IsoDirections,zombie.iso.objects.IsoDoor))
   199. [hopFence(IsoDirections, boolean)](#hopFence(zombie.iso.IsoDirections,boolean))
   200. [canClimbOverWall(IsoDirections)](#canClimbOverWall(zombie.iso.IsoDirections))
   201. [doContextClimbOverWall(IsoDirections)](#doContextClimbOverWall(zombie.iso.IsoDirections))
   202. [climbOverWall(IsoDirections)](#climbOverWall(zombie.iso.IsoDirections))
   203. [updateSleepingPillsTaken()](#updateSleepingPillsTaken())
   204. [AttemptAttack()](#AttemptAttack())
   205. [DoAttack(float)](#DoAttack(float))
   206. [DoAttack(float, String)](#DoAttack(float,java.lang.String))
   207. [updateLOS()](#updateLOS())
   208. [checkSpottedPLayerTimer(IsoPlayer)](#checkSpottedPLayerTimer(zombie.characters.IsoPlayer))
   209. [calculateMaxDist()](#calculateMaxDist())
   210. [checkCanSeeClient(UdpConnection)](#checkCanSeeClient(zombie.core.raknet.UdpConnection))
   211. [checkCanSeeClient(IsoPlayer)](#checkCanSeeClient(zombie.characters.IsoPlayer))
   212. [getTimeSurvived()](#getTimeSurvived())
   213. [IsUsingAimWeapon()](#IsUsingAimWeapon())
   214. [IsUsingAimHandWeapon()](#IsUsingAimHandWeapon())
   215. [DoAimAnimOnAiming()](#DoAimAnimOnAiming())
   216. [getSleepingPillsTaken()](#getSleepingPillsTaken())
   217. [setSleepingPillsTaken(int)](#setSleepingPillsTaken(int))
   218. [resetSleepingPillsTaken()](#resetSleepingPillsTaken())
   219. [isOutside()](#isOutside())
   220. [getLastSeenZomboidTime()](#getLastSeenZomboidTime())
   221. [getPlayerClothingTemperature()](#getPlayerClothingTemperature())
   222. [getPlayerClothingInsulation()](#getPlayerClothingInsulation())
   223. [getActiveLightItem()](#getActiveLightItem())
   224. [isTorchCone()](#isTorchCone())
   225. [getTorchDot()](#getTorchDot())
   226. [getLightDistance()](#getLightDistance())
   227. [pressedMovement(boolean)](#pressedMovement(boolean))
   228. [pressedCancelAction()](#pressedCancelAction())
   229. [checkWalkTo()](#checkWalkTo())
   230. [pressedAim()](#pressedAim())
   231. [isDoingActionThatCanBeCancelled()](#isDoingActionThatCanBeCancelled())
   232. [getSteamID()](#getSteamID())
   233. [setSteamID(long)](#setSteamID(long))
   234. [isTargetedByZombie()](#isTargetedByZombie())
   235. [isMaskClicked(int, int, boolean)](#isMaskClicked(int,int,boolean))
   236. [getOffSetXUI()](#getOffSetXUI())
   237. [setOffSetXUI(int)](#setOffSetXUI(int))
   238. [getOffSetYUI()](#getOffSetYUI())
   239. [setOffSetYUI(int)](#setOffSetYUI(int))
   240. [getUsername()](#getUsername())
   241. [getUsername(Boolean)](#getUsername(java.lang.Boolean))
   242. [getUsername(Boolean, Boolean)](#getUsername(java.lang.Boolean,java.lang.Boolean))
   243. [setUsername(String)](#setUsername(java.lang.String))
   244. [updateUsername()](#updateUsername())
   245. [getOnlineID()](#getOnlineID())
   246. [isLocalPlayer()](#isLocalPlayer())
   247. [isLocalPlayer(IsoGameCharacter)](#isLocalPlayer(zombie.characters.IsoGameCharacter))
   248. [isLocalPlayer(Object)](#isLocalPlayer(java.lang.Object))
   249. [setLocalPlayer(int, IsoPlayer)](#setLocalPlayer(int,zombie.characters.IsoPlayer))
   250. [getLocalPlayerByOnlineID(short)](#getLocalPlayerByOnlineID(short))
   251. [isOnlyPlayerAsleep()](#isOnlyPlayerAsleep())
   252. [setHasObstacleOnPath(boolean)](#setHasObstacleOnPath(boolean))
   253. [isRemoteAndHasObstacleOnPath()](#isRemoteAndHasObstacleOnPath())
   254. [OnDeath()](#OnDeath())
   255. [isNoClip()](#isNoClip())
   256. [setNoClip(boolean, boolean)](#setNoClip(boolean,boolean))
   257. [setNoClip(boolean)](#setNoClip(boolean))
   258. [setAuthorizeMeleeAction(boolean)](#setAuthorizeMeleeAction(boolean))
   259. [isAuthorizeMeleeAction()](#isAuthorizeMeleeAction())
   260. [setAuthorizeShoveStomp(boolean)](#setAuthorizeShoveStomp(boolean))
   261. [isAuthorizeShoveStomp()](#isAuthorizeShoveStomp())
   262. [setAuthorizedHandToHandAction(boolean)](#setAuthorizedHandToHandAction(boolean))
   263. [isAuthorizedHandToHandAction()](#isAuthorizedHandToHandAction())
   264. [setAuthorizedHandToHand(boolean)](#setAuthorizedHandToHand(boolean))
   265. [isAuthorizedHandToHand()](#isAuthorizedHandToHand())
   266. [isBlockMovement()](#isBlockMovement())
   267. [setBlockMovement(boolean)](#setBlockMovement(boolean))
   268. [startReceivingBodyDamageUpdates(IsoPlayer)](#startReceivingBodyDamageUpdates(zombie.characters.IsoPlayer))
   269. [stopReceivingBodyDamageUpdates(IsoPlayer)](#stopReceivingBodyDamageUpdates(zombie.characters.IsoPlayer))
   270. [getNutrition()](#getNutrition())
   271. [getFitness()](#getFitness())
   272. [updateRemotePlayerInVehicle()](#updateRemotePlayerInVehicle())
   273. [getNetworkSpeedMul()](#getNetworkSpeedMul())
   274. [checkTile(int, int, int, boolean)](#checkTile(int,int,int,boolean))
   275. [canWalkAxialPath(int, int, int, int, int)](#canWalkAxialPath(int,int,int,int,int))
   276. [trySuppressPathFinder(Vector3)](#trySuppressPathFinder(zombie.iso.Vector3))
   277. [updateRemotePlayer()](#updateRemotePlayer())
   278. [moveUnmoddedRemotePlayer()](#moveUnmoddedRemotePlayer())
   279. [updateWhileDead()](#updateWhileDead())
   280. [initFMODParameters()](#initFMODParameters())
   281. [getParameterCharacterMovementSpeed()](#getParameterCharacterMovementSpeed())
   282. [setMeleeHitSurface(ParameterMeleeHitSurface.Material)](#setMeleeHitSurface(zombie.audio.parameters.ParameterMeleeHitSurface.Material))
   283. [setMeleeHitSurface(String)](#setMeleeHitSurface(java.lang.String))
   284. [setVehicleHitLocation(BaseVehicle)](#setVehicleHitLocation(zombie.vehicles.BaseVehicle))
   285. [updateHeartSound()](#updateHeartSound())
   286. [updateEquippedBaggageContainer()](#updateEquippedBaggageContainer())
   287. [DoFootstepSound(String)](#DoFootstepSound(java.lang.String))
   288. [updateHeavyBreathing()](#updateHeavyBreathing())
   289. [playGainExperienceLevelSound()](#playGainExperienceLevelSound())
   290. [playerVoiceSound(String)](#playerVoiceSound(java.lang.String))
   291. [transmitPlayerVoiceSound(String)](#transmitPlayerVoiceSound(java.lang.String))
   292. [stopPlayerVoiceSound(String)](#stopPlayerVoiceSound(java.lang.String))
   293. [updateVocalProperties()](#updateVocalProperties())
   294. [updateDraggingCorpseSounds()](#updateDraggingCorpseSounds())
   295. [updateAttackLoopSound()](#updateAttackLoopSound())
   296. [updateBringToBearSound()](#updateBringToBearSound())
   297. [isPlayingAttackLoopSound(String)](#isPlayingAttackLoopSound(java.lang.String))
   298. [startAttackLoopSound(String)](#startAttackLoopSound(java.lang.String))
   299. [stopAttackLoopSound(boolean)](#stopAttackLoopSound(boolean))
   300. [playRangedWeaponShootSound(String)](#playRangedWeaponShootSound(java.lang.String))
   301. [playBloodSplatterSound()](#playBloodSplatterSound())
   302. [checkVehicleContainers()](#checkVehicleContainers())
   303. [createPlayerStats(ByteBufferWriter, String)](#createPlayerStats(zombie.core.network.ByteBufferWriter,java.lang.String))
   304. [setPlayerStats(ByteBufferReader, String)](#setPlayerStats(zombie.core.network.ByteBufferReader,java.lang.String))
   305. [isAllChatMuted()](#isAllChatMuted())
   306. [setAllChatMuted(boolean)](#setAllChatMuted(boolean))
   307. [getAccessLevel()](#getAccessLevel())
   308. [getRole()](#getRole())
   309. [isAccessLevel(String)](#isAccessLevel(java.lang.String))
   310. [setRole(String)](#setRole(java.lang.String))
   311. [addMechanicsItem(String, VehiclePart, Long)](#addMechanicsItem(java.lang.String,zombie.vehicles.VehiclePart,java.lang.Long))
   312. [updateTemperatureCheck()](#updateTemperatureCheck())
   313. [getZombieRelevenceScore(IsoZombie)](#getZombieRelevenceScore(zombie.characters.IsoZombie))
   314. [getVisual()](#getVisual())
   315. [getHumanVisual()](#getHumanVisual())
   316. [getAnimalVisual()](#getAnimalVisual())
   317. [getAnimalType()](#getAnimalType())
   318. [getAnimalSize()](#getAnimalSize())
   319. [getItemVisuals()](#getItemVisuals())
   320. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   321. [dressInNamedOutfit(String)](#dressInNamedOutfit(java.lang.String))
   322. [dressInClothingItem(String)](#dressInClothingItem(java.lang.String))
   323. [onClothingOutfitPreviewChanged()](#onClothingOutfitPreviewChanged())
   324. [onWornItemsChanged()](#onWornItemsChanged())
   325. [getLastAngle()](#getLastAngle())
   326. [setLastAngle(Vector2)](#setLastAngle(zombie.iso.Vector2))
   327. [getDialogMood()](#getDialogMood())
   328. [setDialogMood(int)](#setDialogMood(int))
   329. [getPing()](#getPing())
   330. [setPing(int)](#setPing(int))
   331. [getDragObject()](#getDragObject())
   332. [setDragObject(IsoMovingObject)](#setDragObject(zombie.iso.IsoMovingObject))
   333. [getAsleepTime()](#getAsleepTime())
   334. [setAsleepTime(float)](#setAsleepTime(float))
   335. [getSpottedList()](#getSpottedList())
   336. [getTicksSinceSeenZombie()](#getTicksSinceSeenZombie())
   337. [setTicksSinceSeenZombie(int)](#setTicksSinceSeenZombie(int))
   338. [isWaiting()](#isWaiting())
   339. [setWaiting(boolean)](#setWaiting(boolean))
   340. [getDragCharacter()](#getDragCharacter())
   341. [setDragCharacter(IsoSurvivor)](#setDragCharacter(zombie.characters.IsoSurvivor))
   342. [getHeartDelay()](#getHeartDelay())
   343. [setHeartDelay(float)](#setHeartDelay(float))
   344. [getHeartDelayMax()](#getHeartDelayMax())
   345. [setHeartDelayMax(int)](#setHeartDelayMax(int))
   346. [getHoursSurvived()](#getHoursSurvived())
   347. [setHoursSurvived(double)](#setHoursSurvived(double))
   348. [getMaxWeightDelta()](#getMaxWeightDelta())
   349. [setMaxWeightDelta(float)](#setMaxWeightDelta(float))
   350. [isbChangeCharacterDebounce()](#isbChangeCharacterDebounce())
   351. [setbChangeCharacterDebounce(boolean)](#setbChangeCharacterDebounce(boolean))
   352. [getFollowID()](#getFollowID())
   353. [setFollowID(int)](#setFollowID(int))
   354. [isbSeenThisFrame()](#isbSeenThisFrame())
   355. [setbSeenThisFrame(boolean)](#setbSeenThisFrame(boolean))
   356. [isbCouldBeSeenThisFrame()](#isbCouldBeSeenThisFrame())
   357. [setbCouldBeSeenThisFrame(boolean)](#setbCouldBeSeenThisFrame(boolean))
   358. [getTimeSinceLastStab()](#getTimeSinceLastStab())
   359. [setTimeSinceLastStab(float)](#setTimeSinceLastStab(float))
   360. [getLastSpotted()](#getLastSpotted())
   361. [setLastSpotted(Stack)](#setLastSpotted(java.util.Stack))
   362. [getClearSpottedTimer()](#getClearSpottedTimer())
   363. [setClearSpottedTimer(int)](#setClearSpottedTimer(int))
   364. [IsRunning()](#IsRunning())
   365. [InitSpriteParts()](#InitSpriteParts())
   366. [getTagPrefix()](#getTagPrefix())
   367. [setTagPrefix(String)](#setTagPrefix(java.lang.String))
   368. [getTagColor()](#getTagColor())
   369. [setTagColor(ColorInfo)](#setTagColor(zombie.core.textures.ColorInfo))
   370. [getDisplayName()](#getDisplayName())
   371. [getDisguisedDisplayName()](#getDisguisedDisplayName())
   372. [resetDisplayName()](#resetDisplayName())
   373. [setDisplayName(String)](#setDisplayName(java.lang.String))
   374. [isSeeNonPvpZone()](#isSeeNonPvpZone())
   375. [isSeeDesignationZone()](#isSeeDesignationZone())
   376. [setSeeDesignationZone(boolean)](#setSeeDesignationZone(boolean))
   377. [addSelectedZoneForHighlight(Double)](#addSelectedZoneForHighlight(java.lang.Double))
   378. [setSelectedZoneForHighlight(Double)](#setSelectedZoneForHighlight(java.lang.Double))
   379. [getSelectedZoneForHighlight()](#getSelectedZoneForHighlight())
   380. [getSelectedZonesForHighlight()](#getSelectedZonesForHighlight())
   381. [resetSelectedZonesForHighlight()](#resetSelectedZonesForHighlight())
   382. [setSeeNonPvpZone(boolean)](#setSeeNonPvpZone(boolean))
   383. [checkZonesInterception(int, int, int, int)](#checkZonesInterception(int,int,int,int))
   384. [isShowTag()](#isShowTag())
   385. [setShowTag(boolean)](#setShowTag(boolean))
   386. [isFactionPvp()](#isFactionPvp())
   387. [setFactionPvp(boolean)](#setFactionPvp(boolean))
   388. [isForceOverrideAnim()](#isForceOverrideAnim())
   389. [setForceOverrideAnim(boolean)](#setForceOverrideAnim(boolean))
   390. [getMechanicsItem(String)](#getMechanicsItem(java.lang.String))
   391. [isWearingNightVisionGoggles()](#isWearingNightVisionGoggles())
   392. [setWearingNightVisionGoggles(boolean)](#setWearingNightVisionGoggles(boolean))
   393. [OnAnimEvent(AnimLayer, AnimationTrack, AnimEvent)](#OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer,zombie.core.skinnedmodel.animation.AnimationTrack,zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   394. [setAddedToModelManager(ModelManager, boolean)](#setAddedToModelManager(zombie.core.skinnedmodel.ModelManager,boolean))
   395. [isTimedActionInstant()](#isTimedActionInstant())
   396. [isSkeleton()](#isSkeleton())
   397. [addWorldSoundUnlessInvisible(int, int, boolean)](#addWorldSoundUnlessInvisible(int,int,boolean))
   398. [updateFootInjuries()](#updateFootInjuries())
   399. [calculateInTreesSpeed()](#calculateInTreesSpeed())
   400. [updateInTreesInjuries()](#updateInTreesInjuries())
   401. [possiblyPlayVoiceSound(String)](#possiblyPlayVoiceSound(java.lang.String))
   402. [getMoodleLevel(MoodleType)](#getMoodleLevel(zombie.scripting.objects.MoodleType))
   403. [isAttackStarted()](#isAttackStarted())
   404. [setAttackStarted(boolean)](#setAttackStarted(boolean))
   405. [isBehaviourMoving()](#isBehaviourMoving())
   406. [isJustMoved()](#isJustMoved())
   407. [setJustMoved(boolean)](#setJustMoved(boolean))
   408. [isPlayerMoving()](#isPlayerMoving())
   409. [getTimedActionTimeModifier()](#getTimedActionTimeModifier())
   410. [isLookingWhileInVehicle()](#isLookingWhileInVehicle())
   411. [setInitiateAttack(boolean)](#setInitiateAttack(boolean))
   412. [isInitiateAttack()](#isInitiateAttack())
   413. [isIgnoreContextKey()](#isIgnoreContextKey())
   414. [setIgnoreContextKey(boolean)](#setIgnoreContextKey(boolean))
   415. [isIgnoreAutoVault()](#isIgnoreAutoVault())
   416. [setIgnoreAutoVault(boolean)](#setIgnoreAutoVault(boolean))
   417. [isAttackType(AttackType)](#isAttackType(zombie.AttackType))
   418. [getAttackType()](#getAttackType())
   419. [getAttackTypeAnimationKey()](#getAttackTypeAnimationKey())
   420. [setAttackType(AttackType)](#setAttackType(zombie.AttackType))
   421. [canSeeAll()](#canSeeAll())
   422. [setCanSeeAll(boolean)](#setCanSeeAll(boolean))
   423. [isCheatPlayerSeeEveryone()](#isCheatPlayerSeeEveryone())
   424. [getRelevantAndDistance(float, float, float)](#getRelevantAndDistance(float,float,float))
   425. [canHearAll()](#canHearAll())
   426. [setCanHearAll(boolean)](#setCanHearAll(boolean))
   427. [getAlreadyReadBook()](#getAlreadyReadBook())
   428. [setMoodleCantSprint(boolean)](#setMoodleCantSprint(boolean))
   429. [setAttackFromBehind(boolean)](#setAttackFromBehind(boolean))
   430. [isAttackFromBehind()](#isAttackFromBehind())
   431. [onKilled(IsoGameCharacter, HandWeapon, boolean)](#onKilled(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,boolean))
   432. [onDied(IsoGameCharacter, IsoDeadBody)](#onDied(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoDeadBody))
   433. [getNetworkCharacterAI()](#getNetworkCharacterAI())
   434. [preupdate()](#preupdate())
   435. [allowsInvisibleAnimationSkips()](#allowsInvisibleAnimationSkips())
   436. [setFishingStage(String)](#setFishingStage(java.lang.String))
   437. [setFitnessSpeed()](#setFitnessSpeed())
   438. [isClimbOverWallSuccess()](#isClimbOverWallSuccess())
   439. [setClimbOverWallSuccess(boolean)](#setClimbOverWallSuccess(boolean))
   440. [isClimbOverWallStruggle()](#isClimbOverWallStruggle())
   441. [setClimbOverWallStruggle(boolean)](#setClimbOverWallStruggle(boolean))
   442. [isSkipResolveCollision()](#isSkipResolveCollision())
   443. [getMusicIntensityEvents()](#getMusicIntensityEvents())
   444. [updateMusicIntensityEvents()](#updateMusicIntensityEvents())
   445. [triggerMusicIntensityEvent(String)](#triggerMusicIntensityEvent(java.lang.String))
   446. [getMusicThreatStatuses()](#getMusicThreatStatuses())
   447. [updateMusicThreatStatuses()](#updateMusicThreatStatuses())
   448. [addAttachedAnimal(IsoAnimal)](#addAttachedAnimal(zombie.characters.animals.IsoAnimal))
   449. [getAttachedAnimals()](#getAttachedAnimals())
   450. [removeAttachedAnimal(IsoAnimal)](#removeAttachedAnimal(zombie.characters.animals.IsoAnimal))
   451. [removeAllAttachedAnimals()](#removeAllAttachedAnimals())
   452. [hasAttachedAnimals()](#hasAttachedAnimals())
   453. [checkAnimalAttachedToRope(InventoryItem)](#checkAnimalAttachedToRope(zombie.inventory.InventoryItem))
   454. [isRopeItem(InventoryItem)](#isRopeItem(zombie.inventory.InventoryItem))
   455. [lureAnimal(InventoryItem)](#lureAnimal(zombie.inventory.InventoryItem))
   456. [getLuredAnimals()](#getLuredAnimals())
   457. [stopLuringAnimals(boolean)](#stopLuringAnimals(boolean))
   458. [setIsLuringAnimals(boolean)](#setIsLuringAnimals(boolean))
   459. [getVoiceType()](#getVoiceType())
   460. [setVoiceType(int)](#setVoiceType(int))
   461. [setVoicePitch(float)](#setVoicePitch(float))
   462. [isFarming()](#isFarming())
   463. [setIsFarming(boolean)](#setIsFarming(boolean))
   464. [tooDarkToRead()](#tooDarkToRead())
   465. [isWalking()](#isWalking())
   466. [isInvPageDirty()](#isInvPageDirty())
   467. [setInvPageDirty(boolean)](#setInvPageDirty(boolean))
   468. [getVoicePitch()](#getVoicePitch())
   469. [setCombatSpeed(float)](#setCombatSpeed(float))
   470. [getCombatSpeed()](#getCombatSpeed())
   471. [isMeleePressed()](#isMeleePressed())
   472. [isGrapplePressed()](#isGrapplePressed())
   473. [setRole(Role)](#setRole(zombie.characters.Role))
   474. [wasLastAttackHandToHand()](#wasLastAttackHandToHand())
   475. [setLastAttackWasHandToHand(boolean)](#setLastAttackWasHandToHand(boolean))
   476. [petAnimal()](#petAnimal())
   477. [getUseableAnimal()](#getUseableAnimal())
   478. [getTimedActionToRetrigger()](#getTimedActionToRetrigger())
   479. [setTimedActionToRetrigger(LuaTimedActionNew)](#setTimedActionToRetrigger(zombie.characters.CharacterTimedActions.LuaTimedActionNew))
   480. [getPlayerCraftHistory()](#getPlayerCraftHistory())
   481. [isFavouriteRecipe(String)](#isFavouriteRecipe(java.lang.String))
   482. [isFavouriteRecipe(CraftRecipe)](#isFavouriteRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   483. [isUnwanted(String)](#isUnwanted(java.lang.String))
   484. [setUnwanted(String, Boolean)](#setUnwanted(java.lang.String,java.lang.Boolean))
   485. [getUnwantedModDataString(String)](#getUnwantedModDataString(java.lang.String))
   486. [getTimeSinceLastNetData()](#getTimeSinceLastNetData())
   487. [setTimeSinceLastNetData(int)](#setTimeSinceLastNetData(int))
   488. [getLastRemoteUpdate()](#getLastRemoteUpdate())
   489. [setLastRemoteUpdate(long)](#setLastRemoteUpdate(long))
   490. [getAutoDrink()](#getAutoDrink())
   491. [setAutoDrink(boolean)](#setAutoDrink(boolean))
   492. [getAnticheatMask(UdpConnection)](#getAnticheatMask(zombie.core.raknet.UdpConnection))
   493. [setLastCheatToggleMillis(long)](#setLastCheatToggleMillis(long))
   494. [forEachPlayer(Invokers.Params1.ICallback)](#forEachPlayer(zombie.util.lambda.Invokers.Params1.ICallback))
   495. [syncVisuals()](#syncVisuals())
   496. [findClosestCorpseOnGroundToPickup()](#findClosestCorpseOnGroundToPickup())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPlayer
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")

[zombie.characters.IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")

zombie.characters.IsoLivingCharacter

zombie.characters.IsoPlayer

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.ai.IStateCharacter, zombie.characters.action.IActionStateChanged, zombie.characters.CharacterInputComponentEntity, zombie.characters.ecs.ECSEntity, zombie.characters.ILuaGameCharacter, ILuaGameCharacterAttachedItems, ILuaGameCharacterClothing, zombie.characters.ILuaGameCharacterDamage, zombie.characters.ILuaGameCharacterHealth, zombie.characters.ILuaVariableSource, zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, IAnimationVariableRegistry, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.population.IClothingItemListener, IAnimalVisual, IHumanVisual, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, zombie.network.fields.IPositional`

Direct Known Subclasses:
:   `IsoAnimal`

---

public class IsoPlayer
extends zombie.characters.IsoLivingCharacter
implements [IAnimalVisual](../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"), [IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.network.fields.IPositional

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characters.IsoPlayer)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private final class`

  `IsoPlayer.GrapplerGruntChance`

  `static class`

  `IsoPlayer.InputState`

  `static final class`

  `IsoPlayer.MoveVars`

  `private static class`

  `IsoPlayer.s_performance`

  `private static class`

  `IsoPlayer.VehicleContainer`

  `private static class`

  `IsoPlayer.VehicleContainerData`

  `(package private) static final class`

  `IsoPlayer.VehicleHitDamageConstants`

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

  `String`

  `accessLevel`

  `protected boolean`

  `aimingWeaponAnimation`

  `private boolean`

  `allChatMuted`

  `private final ArrayList<String>`

  `alreadyReadBook`

  `protected float`

  `asleepTime`

  `static int`

  `assumedPlayer`

  `private final List<IsoAnimal>`

  `attachedAnimals`

  `private long`

  `attackAnimThrowTimer`

  `private boolean`

  `attackFromBehind`

  `private boolean`

  `attackStarted`

  `private zombie.AttackType`

  `attackType`

  `private float`

  `attackVariationX`

  `private float`

  `attackVariationY`

  `boolean`

  `autoDrink`

  `boolean`

  `bannedAttacking`

  `protected zombie.core.skinnedmodel.visual.BaseVisual`

  `baseVisual`

  `byte`

  `bleedingLevel`

  `private boolean`

  `blockMovement`

  `private boolean`

  `canLetGoOfGrappled`

  `protected boolean`

  `changeCharacterDebounce`

  `float`

  `chargeTime`

  `private float`

  `checkNearbyRooms`

  `private int`

  `checkSafehouse`

  `protected int`

  `clearSpottedTimer`

  `private boolean`

  `climbOverWallStruggle`

  `private boolean`

  `climbOverWallSuccess`

  `float`

  `closestZombie`

  `private float`

  `combatSpeed`

  `float`

  `contextPanic`

  `private final ArrayList<zombie.characters.ContextualAction>`

  `contextualActions`

  `private static boolean`

  `coopPvp`

  `protected boolean`

  `couldBeSeenThisFrame`

  `private final PlayerCraftHistory`

  `craftHistory`

  `float`

  `currentSpeed`

  `static final String`

  `DEATH_MUSIC_NAME`

  `boolean`

  `deathFinished`

  `private float`

  `deltaX`

  `private float`

  `deltaY`

  `protected int`

  `dialogMood`

  `boolean`

  `dirtyRecalcGridStack`

  `float`

  `dirtyRecalcGridStackTime`

  `private String`

  `displayName`

  `protected IsoSurvivor`

  `dragCharacter`

  `protected IsoMovingObject`

  `dragObject`

  `private float`

  `drunkDelayCommandTimer`

  `private final IsoPlayer.MoveVars`

  `drunkMoveVars`

  `private float`

  `extUpdateCount`

  `boolean`

  `factionPvp`

  `private static final float`

  `FeebleTraitMaxWeightDelta`

  `private Fitness`

  `fitness`

  `private boolean`

  `flickTorch`

  `protected final Stack<IsoGameCharacter>`

  `followCamStack`

  `private static int`

  `followDeadCount`

  `protected int`

  `followId`

  `private float`

  `footInjuryTimer`

  `private boolean`

  `forceOverrideAnim`

  `private boolean`

  `grapplePressed`

  `private final IsoPlayer.GrapplerGruntChance`

  `grapplerGruntChance`

  `private boolean`

  `hasObstacleOnPath`

  `protected float`

  `heartDelay`

  `protected float`

  `heartDelayMax`

  `protected long`

  `heartEventInstance`

  `private long`

  `heavyBreathInstance`

  `private String`

  `heavyBreathSoundName`

  `private double`

  `hoursSurvived`

  `private int`

  `hyperthermiaCache`

  `private int`

  `hypothermiaCache`

  `private float`

  `idleSpeed`

  `private boolean`

  `ignoreAutoVault`

  `private boolean`

  `ignoreContextKey`

  `private static final float`

  `IN_TREES_INJURY_INTERVAL_SECONDS`

  `private static final float`

  `IN_TREES_SPEED_LUMBERJACK_MULTIPLIER`

  `private static final float`

  `IN_TREES_SPEED_PARK_RANGER_MULTIPLIER`

  `private static final float`

  `IN_TREES_SPEED_RUNNING_MULTIPLIER`

  `private boolean`

  `initiateAttack`

  `private final IsoPlayer.InputState`

  `inputState`

  `private static IsoPlayer`

  `instance`

  `private static final Object`

  `instanceLock`

  `private float`

  `inTreesInjuryTimer`

  `private boolean`

  `invPageDirty`

  `private float`

  `ipX`

  `private float`

  `ipY`

  `private boolean`

  `isAuthorizedHandToHand`

  `private boolean`

  `isAuthorizedHandToHandAction`

  `boolean`

  `isCharging`

  `boolean`

  `isChargingLt`

  `private boolean`

  `isFarming`

  `boolean`

  `isLuringAnimals`

  `private boolean`

  `isPerformingAnAction`

  `protected boolean`

  `isPlayerMoving`

  `boolean`

  `isSpeek`

  `static boolean`

  `isTestAIMode`

  `boolean`

  `isVoiceMute`

  `private boolean`

  `isWalking`

  `private boolean`

  `isWearingNightVisionGoggles`

  `boolean`

  `joypadIgnoreChargingRt`

  `private boolean`

  `justMoved`

  `final Vector2`

  `lastAngle`

  `private boolean`

  `lastAttackWasHandToHand`

  `private long`

  `lastCheatToggleMillis`

  `private long`

  `lastPillsTaken`

  `private long`

  `lastRemoteUpdate`

  `private double`

  `lastSeenZombieTime`

  `protected Stack<IsoMovingObject>`

  `lastSpotted`

  `float`

  `lastTargeted`

  `private boolean`

  `letGoAfterContextIsReleased`

  `private boolean`

  `lookingWhileInVehicle`

  `List<IsoAnimal>`

  `luredAnimals`

  `private static final zombie.PredicatedFileWatcher`

  `m_isoPlayerTriggerWatcher`

  `static final short`

  `MAX`

  `float`

  `maxWeightDelta`

  `private final HashMap<Long,Long>`

  `mechanicsItem`

  `private boolean`

  `meleePressed`

  `boolean`

  `moodleCantSprint`

  `private float`

  `moveSpeed`

  `boolean`

  `mpTorchCone`

  `float`

  `mpTorchDist`

  `float`

  `mpTorchStrength`

  `private final boolean`

  `multiplayer`

  `private final MusicIntensityEvents`

  `musicIntensityEvents`

  `private final boolean`

  `musicIntensityInside`

  `private final MusicThreatStatuses`

  `musicThreatStatuses`

  `protected static final float`

  `NETWORK_SPEED_MUL_MAX`

  `protected static final float`

  `NETWORK_SPEED_MUL_MIN`

  `protected static final float`

  `NETWORK_SPEED_SMOOTH_END`

  `protected static final float`

  `NETWORK_SPEED_SMOOTH_START`

  `static final boolean`

  `NoSound`

  `float`

  `numNearbyBuildingsRooms`

  `static int`

  `numPlayers`

  `private Nutrition`

  `nutrition`

  `private int`

  `offSetXUi`

  `private int`

  `offSetYUi`

  `int`

  `onlineChunkGridWidth`

  `short`

  `onlineId`

  `private final zombie.audio.parameters.ParameterCharacterMovementSpeed`

  `parameterCharacterMovementSpeed`

  `private final zombie.audio.parameters.ParameterCharacterMoving`

  `parameterCharacterMoving`

  `private final zombie.audio.parameters.ParameterCharacterOnFire`

  `parameterCharacterOnFire`

  `private final zombie.audio.parameters.ParameterCharacterVoicePitch`

  `parameterCharacterVoicePitch`

  `private final zombie.audio.parameters.ParameterCharacterVoiceType`

  `parameterCharacterVoiceType`

  `private final zombie.audio.parameters.ParameterDeaf`

  `parameterDeaf`

  `private final zombie.audio.parameters.ParameterDragMaterial`

  `parameterDragMaterial`

  `private final zombie.audio.parameters.ParameterElevation`

  `parameterElevation`

  `private final zombie.audio.parameters.ParameterEquippedBaggageContainer`

  `parameterEquippedBaggageContainer`

  `private final zombie.audio.parameters.ParameterExercising`

  `parameterExercising`

  `private final zombie.audio.parameters.ParameterFirearmDistance`

  `parameterFirearmDistance`

  `private final zombie.audio.parameters.ParameterFirearmInside`

  `parameterFirearmInside`

  `private final zombie.audio.parameters.ParameterFirearmRoomSize`

  `parameterFirearmRoomSize`

  `private final zombie.audio.parameters.ParameterFootstepMaterial`

  `parameterFootstepMaterial`

  `private final zombie.audio.parameters.ParameterFootstepMaterial2`

  `parameterFootstepMaterial2`

  `private final zombie.audio.parameters.ParameterIsStashTile`

  `parameterIsStashTile`

  `private final zombie.audio.parameters.ParameterLocalPlayer`

  `parameterLocalPlayer`

  `private final zombie.audio.parameters.ParameterMeleeHitSurface`

  `parameterMeleeHitSurface`

  `private ParameterMoodles`

  `parameterMoodles`

  `private final zombie.audio.parameters.ParameterOverlapFoliageType`

  `parameterOverlapFoliageType`

  `private final zombie.audio.parameters.ParameterPlayerHealth`

  `parameterPlayerHealth`

  `private final zombie.audio.parameters.ParameterShoeType`

  `parameterShoeType`

  `private final zombie.audio.parameters.ParameterVehicleHitLocation`

  `parameterVehicleHitLocation`

  `private boolean`

  `pathfindRun`

  `zombie.core.physics.PhysicsDebugRenderer`

  `physicsDebugRenderer`

  `protected int`

  `ping`

  `int`

  `playerIndex`

  `final Vector2`

  `playerMoveDir`

  `static final IsoPlayer[]`

  `players`

  `private boolean`

  `pressContext`

  `private boolean`

  `pressedRun`

  `private float`

  `pressedRunTimer`

  `private static final int`

  `RAND_DISCOMFORT`

  `private static final int`

  `RAND_ENDURANCE`

  `private static final int`

  `RAND_IDLE_EMOTE`

  `private static final int`

  `RAND_INJURY`

  `private static final int`

  `RAND_SICK`

  `private static final ArrayList<IsoPlayer>`

  `RecentlyRemoved`

  `boolean`

  `remote`

  `private static final int`

  `REMOTE_PLAYER_PATHFINDER_SUPPRESS_MAX_DIST_TILES`

  `int`

  `remoteFitLvl`

  `protected final ItemVisuals`

  `remotePlayerItemVisuals`

  `int`

  `remoteSneakLvl`

  `int`

  `remoteStrLvl`

  `Role`

  `role`

  `float`

  `runningTime`

  `private float`

  `runSpeed`

  `private static final IsoPlayer.MoveVars`

  `s_moveVars`

  `private static final PZArrayList<zombie.network.fields.hit.HitInfo>`

  `s_targetsProne`

  `private static final PZArrayList<zombie.network.fields.hit.HitInfo>`

  `s_targetsStanding`

  `private String`

  `saveFileIp`

  `String`

  `saveFileName`

  `private boolean`

  `seeDesignationZone`

  `private boolean`

  `seeNonPvpZone`

  `protected boolean`

  `seenThisFrame`

  `private Double`

  `selectedZoneForHighlight`

  `private final ArrayList<Double>`

  `selectedZonesForHighlight`

  `int`

  `serverPlayerIndex`

  `private final zombie.PredicatedFileWatcher`

  `setClothingTriggerWatcher`

  `boolean`

  `showTag`

  `private int`

  `sleepingPillsTaken`

  `fmod.fmod.BaseSoundListener`

  `soundListener`

  `boolean`

  `spottedByPlayer`

  `protected final Stack<IsoMovingObject>`

  `spottedList`

  `private final HashMap<Integer,Integer>`

  `spottedPlayerTimer`

  `int`

  `sqlId`

  `private long`

  `steamId`

  `private static final float`

  `StoutTraitMaxWeightDelta`

  `private static final float`

  `StrongTraitMaxWeightDelta`

  `private final ColorInfo`

  `tagColor`

  `String`

  `tagPrefix`

  `boolean`

  `targetedByZombie`

  `private static final org.lwjgl.util.vector.Vector3f`

  `templwjglVector3f`

  `private static final Vector2`

  `tempo`

  `private static final Vector2`

  `tempVector2`

  `private static final Vector2`

  `tempVector2_1`

  `private static final Vector2`

  `tempVector2_2`

  `private static final Vector3f`

  `tempVector3f`

  `private static final Vector2`

  `testHitPosition`

  `private float`

  `ticksSincePressedMovement`

  `protected int`

  `ticksSinceSeenZombie`

  `private LuaTimedActionNew`

  `timedActionToRetrigger`

  `float`

  `timePressedContext`

  `float`

  `timeSinceCloseDoor`

  `private int`

  `timeSinceLastNetData`

  `protected float`

  `timeSinceLastStab`

  `float`

  `timeSinceOpenDoor`

  `private float`

  `turnDelta`

  `private final zombie.core.physics.BallisticsController.AimingVectorParameters`

  `updateAimingVectorParams`

  `private static final int`

  `UPDATES_BETWEEN_RANDOM_IDLE_FIDGETS`

  `float`

  `useChargeDelta`

  `private float`

  `useChargeTime`

  `private boolean`

  `usedVehicle`

  `String`

  `username`

  `private boolean`

  `useVehicle`

  `protected BaseVehicle`

  `vehicle4testCollision`

  `private final IsoPlayer.VehicleContainerData`

  `vehicleContainerData`

  `protected boolean`

  `waiting`

  `private float`

  `walkInjury`

  `private float`

  `walkSpeed`

  `private static final float`

  `WeakTraitMaxWeightDelta`

  `private String`

  `weaponT`

  `private float`

  `windForce`

  `private float`

  `windspeed`

  ### Fields inherited from class zombie.characters.IsoLivingCharacter

  `bareHands, collidedWithPushable, targetOnGround`

  ### Fields inherited from class [IsoGameCharacter](IsoGameCharacter.html#field-summary "class in zombie.characters")

  `allowConversation, amputations, asleep, attachedItems, attackedBy, attackTargetSquare, attackVars, AwkwardGlovesStrengthDivisor, bagsWorn, beard, BeenMovingForDecrease, BeenMovingForIncrease, blockTurning, bodyDamage, bumpNbr, callOut, characterActions, characterTraits, chatElement, cheats, climbing, clothingWetness, clothingWetnessSync, damagedByVehicle, dead, delayToActuallySleep, descriptor, doDirtBloodEtc, emitter, enemyList, falling, fallTime, finder, forceNullOverride, forceWakeUp, forceWakeUpTime, forwardDirection, GlovesStrengthBonus, hair, handItemShouldSendToClients, health, HUMANOID_SCREEN_CHEST_HEIGHT, HUMANOID_WORLD_CHEST_HEIGHT, hurtSound, ignoreStaggerBack, inf, inventory, invRadioFreq, isOnGround, isoPlayer, isResting, isVisibleToPlayer, kill, knockbackAttackMod, lastAnimalPet, lastFallSpeed, leftHandItem, legsSprite, lightInfo, moodles, networkCharacter, numSurvivorsInVicinity, onFireLightSource, overridePrimaryHandModel, overrideSecondaryHandModel, pathing, persistentOutfitId, persistentOutfitInit, playingDeathSound, postUpdateInternal, primaryHandModel, realState, realx, realy, realz, reanimatedCorpse, reanimatedCorpseId, remoteId, removedFromWorldMs, RENDER_OFFSET_X, RENDER_OFFSET_Y, rightHandItem, runSpeedModifier, s_maxPossibleTwist, savedInventoryItems, savedVehicleRunning, savedVehicleSeat, savedVehicleX, savedVehicleY, secondaryHandModel, slowFactor, slowTimer, SNEAK_LIMP_INJURY_THRESHOLD, SNEAK_LIMP_SPEED_SCALE_DEFAULT, speakColour, speaking, speedMod, stats, tempItemVisuals, tempo2, tempo3, timeOfSleep, turnDeltaNormal, turnDeltaRunning, turnDeltaSprinting, updateEquippedTextures, updateInternal, useHandWeapon, useParts, userName, usernameDisguised, vbdebugHitTarget, vehicle, vocalEvent, WALK_SPEED_DEFAULT, WALK_SPEED_SLOW, wasKnockedDown, wornItems, xp`

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

  `IsoPlayer(IsoCell cell)`

  `IsoPlayer(IsoCell cell,
  SurvivorDesc desc,
  int x,
  int y,
  int z)`

  `IsoPlayer(IsoCell cell,
  SurvivorDesc desc,
  int x,
  int y,
  int z,
  boolean isAnimal)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAttachedAnimal(IsoAnimal anim)`

  `private void`

  `addContextualAction(zombie.characters.ContextualAction.Action action,
  IsoDirections dir,
  IsoGridSquare square,
  IsoObject object)`

  `private void`

  `addContextualAction(zombie.characters.ContextualAction.Action action,
  zombie.util.lambda.Invokers.Params1.ICallback<zombie.characters.ContextualAction> populator)`

  `void`

  `addMechanicsItem(String itemid,
  VehiclePart part,
  Long milli)`

  `void`

  `addSelectedZoneForHighlight(Double id)`

  `void`

  `addWorldSoundUnlessInvisible(int radius,
  int volume,
  boolean bStressHumans)`

  `private void`

  `adjustMovementForDrunks(IsoPlayer.MoveVars moveVars,
  boolean isController)`

  Adjusts player movement when drunk, adding an input update delay timer and
  drifting the angle.

  `boolean`

  `allowsInvisibleAnimationSkips()`

  `boolean`

  `allowsTwist()`

  `static boolean`

  `allPlayersAsleep()`

  `static boolean`

  `allPlayersDead()`

  `static <C> boolean`

  `anyPlayer(C compareParam,
  BiPredicate<IsoPlayer, C> predicate)`

  `void`

  `applyDamageFromVehicleHit(BaseVehicle vehicle,
  float vehicleSpeed,
  float damage)`

  `private void`

  `attackWhileInVehicle()`

  `boolean`

  `AttemptAttack()`

  `private Vector2`

  `calculateAimVector(Vector2 vec)`

  `void`

  `calculateContext()`

  `int`

  `calculateCritChance(IsoGameCharacter target)`

  `private float`

  `calculateInTreesSpeed()`

  `private float`

  `calculateMaxDist()`

  `boolean`

  `calculateShowAdminTag()`

  `protected void`

  `calculateStats()`

  `protected void`

  `calculateWalkSpeed()`

  `boolean`

  `canClimbOverWall(IsoDirections dir)`

  `boolean`

  `canHearAll()`

  `boolean`

  `canPerformHandToHandCombat()`

  Can't shove or grapple if holding items in each hand (not weapon obv)

  `boolean`

  `canPlaceCorpseOnSquare(IsoGridSquare square)`

  `boolean`

  `canSeeAll()`

  `boolean`

  `canThrowCorpseOver(IsoDirections dir)`

  `boolean`

  `canThrowCorpseOver(IsoGridSquare fromSq,
  IsoDirections dir)`

  `private boolean`

  `canWalkAxialPath(int x,
  int y,
  int z,
  int targetX,
  int targetY)`

  `void`

  `checkActionGroup()`

  `private boolean`

  `checkActionsBlockingMovement()`

  `void`

  `checkAnimalAttachedToRope(InventoryItem newPrimaryItem)`

  `boolean`

  `checkCanSeeClient(IsoPlayer remoteChr)`

  `boolean`

  `checkCanSeeClient(zombie.core.raknet.UdpConnection remoteConnection)`

  `private void`

  `checkReloading()`

  `private boolean`

  `checkSpottedPLayerTimer(IsoPlayer remoteChr)`

  `private boolean`

  `checkTile(int x,
  int y,
  int z,
  boolean isVerticalWall)`

  `private void`

  `checkVehicleContainers()`

  `boolean`

  `checkWalkTo()`

  `boolean`

  `checkZonesInterception(int x1,
  int x2,
  int y1,
  int y2)`

  `void`

  `clearHandToHandAttack()`

  `private void`

  `clearUseKeyVariables()`

  `boolean`

  `climbOverWall(IsoDirections dir)`

  `zombie.core.network.ByteBufferWriter`

  `createPlayerStats(zombie.core.network.ByteBufferWriter b,
  String adminUsername)`

  `private boolean`

  `DoAimAnimOnAiming()`

  `boolean`

  `DoAttack(float chargeDelta)`

  `boolean`

  `DoAttack(float chargeDelta,
  String clickSound)`

  `boolean`

  `doContext()`

  `private boolean`

  `doContextAnimalInteraction(IsoDirections assumedDir)`

  `private boolean`

  `doContextButcherHook(IsoDirections assumedDir)`

  `boolean`

  `doContextClimbOverWall(IsoDirections dir)`

  `private boolean`

  `doContextClimbSheetRope(IsoDirections assumedDir)`

  `private boolean`

  `doContextCorners(IsoDirections assumedDir)`

  `private boolean`

  `doContextDoor(IsoDirections assumedDir,
  IsoDoor d)`

  `private boolean`

  `doContextDoorOrWindowOrWindowFrame(IsoDirections assumedDir,
  IsoObject o)`

  `private boolean`

  `doContextHopOverFence(IsoDirections assumedDir)`

  `private boolean`

  `doContextHutch(IsoDirections assumedDir)`

  `private boolean`

  `doContextNSWE(IsoDirections assumedDir)`

  `private boolean`

  `doContextRestOnFurniture(IsoDirections assumedDir)`

  `private boolean`

  `doContextThrowGrappledTargetIntoInventory(ItemContainer targetContainer)`

  `private boolean`

  `doContextThrowGrappledTargetIntoInventory(IsoDirections dir)`

  `private boolean`

  `doContextThrowGrappledTargetOutWindow(IsoDirections dir,
  IsoObject windowObject)`

  `private boolean`

  `doContextThrowGrappledTargetOverFence(IsoDirections assumedDir)`

  `private boolean`

  `doContextThrowGrappledTargetOverFence(IsoGridSquare square,
  IsoDirections dir,
  IsoObject hoppable)`

  `private boolean`

  `doContextThumpableDoor(IsoDirections assumedDir,
  IsoThumpable d)`

  `private boolean`

  `doContextThumpableWindow(IsoDirections assumedDir,
  IsoThumpable d,
  boolean bTopOfSheetRope)`

  `private boolean`

  `doContextToggleCurtain(IsoDirections assumedDir)`

  `private boolean`

  `doContextWindow(IsoDirections assumedDir,
  IsoWindow d,
  boolean bTopOfSheetRope)`

  `private boolean`

  `doContextWindowFrame(IsoDirections assumedDir,
  IsoWindowFrame o,
  boolean bTopOfSheetRope)`

  `void`

  `DoFootstepSound(String type)`

  `protected void`

  `doTreeNoises()`

  `void`

  `dressInClothingItem(String itemGUID)`

  `void`

  `dressInNamedOutfit(String outfitName)`

  `private void`

  `enterExitVehicle()`

  `IsoDeadBody`

  `findClosestCorpseOnGroundToPickup()`

  `static <C> IsoPlayer`

  `findPlayer(C compareParam,
  BiPredicate<IsoPlayer, C> predicate)`

  `static void`

  `forEachPlayer(zombie.util.lambda.Invokers.Params1.ICallback<IsoPlayer> visitor)`

  `String`

  `getAccessLevel()`

  Deprecated.

  `InventoryItem`

  `getActiveLightItem()`

  `float`

  `getAimingMod()`

  `float`

  `getAimingRangeMod()`

  `Vector2`

  `getAimVector(Vector2 vec)`

  `static ArrayList<String>`

  `getAllFileNames()`

  `static ArrayList<IsoPlayer>`

  `getAllSavedPlayers()`

  `ArrayList<String>`

  `getAlreadyReadBook()`

  `float`

  `getAnimalSize()`

  `String`

  `getAnimalType()`

  `AnimalVisual`

  `getAnimalVisual()`

  `String`

  `GetAnimSetName()`

  `short`

  `getAnticheatMask(zombie.core.raknet.UdpConnection connection)`

  `float`

  `getAsleepTime()`

  `List<IsoAnimal>`

  `getAttachedAnimals()`

  `zombie.AttackType`

  `getAttackType()`

  `private String`

  `getAttackTypeAnimationKey()`

  `private float`

  `getAttackVariationX()`

  `private float`

  `getAttackVariationY()`

  `boolean`

  `getAutoDrink()`

  `int`

  `getClearSpottedTimer()`

  `IsoGameCharacter`

  `getClosestTo(IsoGameCharacter closestTo)`

  `float`

  `getCombatSpeed()`

  `IsoObject`

  `getContextDoorOrWindowOrWindowFrame(IsoDirections assumedDir)`

  `static boolean`

  `getCoopPVP()`

  `protected Vector2`

  `getDeferredMovement(Vector2 result,
  boolean reset)`

  `String`

  `getDescription(String separatorStr)`

  `int`

  `getDialogMood()`

  `String`

  `getDisguisedDisplayName()`

  `String`

  `getDisplayName()`

  `IsoSurvivor`

  `getDragCharacter()`

  `IsoMovingObject`

  `getDragObject()`

  `byte`

  `getExtraInfoFlags()`

  `Fitness`

  `getFitness()`

  `static int`

  `getFollowDeadCount()`

  `int`

  `getFollowID()`

  `float`

  `getGlobalMovementMod(boolean bDoNoises)`

  `float`

  `getHeartDelay()`

  `float`

  `getHeartDelayMax()`

  `double`

  `getHoursSurvived()`

  `HumanVisual`

  `getHumanVisual()`

  `final int`

  `getIndex()`

  `Vector2`

  `getInputMoveVector(Vector2 out)`

  `static IsoPlayer`

  `getInstance()`

  `float`

  `getInvAimingMod()`

  `float`

  `getInvAimingRangeMod()`

  `ItemVisuals`

  `getItemVisuals()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `Vector2`

  `getLastAngle()`

  `long`

  `getLastRemoteUpdate()`

  `double`

  `getLastSeenZomboidTime()`

  `Stack<IsoMovingObject>`

  `getLastSpotted()`

  `float`

  `getLightDistance()`

  `static IsoPlayer`

  `getLocalPlayerByOnlineID(short id)`

  `List<IsoAnimal>`

  `getLuredAnimals()`

  `float`

  `getMaxWeightDelta()`

  `Long`

  `getMechanicsItem(String itemId)`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `int`

  `getMoodleLevel(MoodleType type)`

  `float`

  `getMoveSpeed()`

  `MusicIntensityEvents`

  `getMusicIntensityEvents()`

  `MusicThreatStatuses`

  `getMusicThreatStatuses()`

  `BaseVehicle`

  `getNearVehicle()`

  `zombie.characters.NetworkPlayerAI`

  `getNetworkCharacterAI()`

  `protected float`

  `getNetworkSpeedMul()`

  `Nutrition`

  `getNutrition()`

  `String`

  `getObjectName()`

  `int`

  `getOffSetXUI()`

  `int`

  `getOffSetYUI()`

  `short`

  `getOnlineID()`

  `zombie.audio.parameters.ParameterCharacterMovementSpeed`

  `getParameterCharacterMovementSpeed()`

  `float`

  `getPathSpeed()`

  `int`

  `getPing()`

  `static IsoPlayer`

  `getPlayer(int playerIndex)`

  `float`

  `getPlayerClothingInsulation()`

  `float`

  `getPlayerClothingTemperature()`

  `PlayerCraftHistory`

  `getPlayerCraftHistory()`

  `static int`

  `getPlayerIndex()`

  `static int`

  `getPlayerIndex(IsoGameCharacter chr)`

  `final int`

  `getPlayerNum()`

  Deprecated.

  Duplicate method.

  `static ArrayList<IsoPlayer>`

  `getPlayers()`

  `float`

  `getRelevantAndDistance(float x,
  float y,
  float relevantRange)`

  `float`

  `getReloadingMod()`

  `Role`

  `getRole()`

  `float`

  `getScreenChestHeight()`

  `Double`

  `getSelectedZoneForHighlight()`

  `ArrayList<Double>`

  `getSelectedZonesForHighlight()`

  `int`

  `getSleepingPillsTaken()`

  `Stack<IsoMovingObject>`

  `getSpottedList()`

  `long`

  `getSteamID()`

  `ColorInfo`

  `getTagColor()`

  `String`

  `getTagPrefix()`

  `int`

  `getTicksSinceSeenZombie()`

  `float`

  `getTimedActionTimeModifier()`

  `LuaTimedActionNew`

  `getTimedActionToRetrigger()`

  `int`

  `getTimeSinceLastNetData()`

  `float`

  `getTimeSinceLastStab()`

  `String`

  `getTimeSurvived()`

  `float`

  `getTorchDot()`

  `float`

  `getTorchStrength()`

  `float`

  `getTurnDelta()`

  `static String`

  `getUniqueFileName()`

  `static String`

  `getUnwantedModDataString(String item)`

  `IsoAnimal`

  `getUseableAnimal()`

  `BaseVehicle`

  `getUseableVehicle()`

  `String`

  `getUsername()`

  `String`

  `getUsername(Boolean canShowFirstname)`

  `String`

  `getUsername(Boolean canShowFirstname,
  Boolean canShowDisguisedName)`

  `zombie.core.skinnedmodel.visual.BaseVisual`

  `getVisual()`

  `float`

  `getVoicePitch()`

  `int`

  `getVoiceType()`

  `private HandWeapon`

  `getWeapon()`

  `private String`

  `getWeaponType()`

  `float`

  `getZombieRelevenceScore(IsoZombie z)`

  `protected void`

  `handleLandingImpact(zombie.characters.FallDamage fallDamage)`

  `boolean`

  `hasAttachedAnimals()`

  `static boolean`

  `hasInstance()`

  `void`

  `hitConsequences(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean bIgnoreDamage,
  float damage,
  boolean bRemote)`

  `boolean`

  `hopFence(IsoDirections dir,
  boolean bTest)`

  `private void`

  `initFMODParameters()`

  `private void`

  `initializeStates()`

  `void`

  `InitSpriteParts()`

  `static void`

  `invokeOnPlayerInstance(Runnable callback)`

  The IsoPlayer.instance thread-safe invoke.

  `boolean`

  `isAccessLevel(String level)`

  `boolean`

  `isAimControlActive()`

  `boolean`

  `isAiming()`

  `boolean`

  `isAllChatMuted()`

  `boolean`

  `isAttackAnimThrowTimeOut()`

  `boolean`

  `isAttackFromBehind()`

  `boolean`

  `isAttacking()`

  `boolean`

  `isAttackStarted()`

  `boolean`

  `isAttackType(zombie.AttackType attackType)`

  `boolean`

  `isAuthorizedHandToHand()`

  Returns whether character can perform hand-to-hand combat.

  `boolean`

  `isAuthorizedHandToHandAction()`

  Returns whether character can initiate hand-to-hand combat.

  `boolean`

  `isAuthorizeMeleeAction()`

  Deprecated.

  Replaced by [`isAuthorizedHandToHandAction()`](#isAuthorizedHandToHandAction())

  `boolean`

  `isAuthorizeShoveStomp()`

  Deprecated.

  Replaced by [`isAuthorizedHandToHand()`](#isAuthorizedHandToHand())

  `boolean`

  `isBannedAttacking()`

  `boolean`

  `isbChangeCharacterDebounce()`

  `boolean`

  `isbCouldBeSeenThisFrame()`

  `boolean`

  `isBehaviourMoving()`

  `private boolean`

  `isBetterBestSeat(BaseVehicle vehicle1,
  BaseVehicle vehicle2)`

  `boolean`

  `isBlockMovement()`

  `boolean`

  `isbSeenThisFrame()`

  `boolean`

  `isCheatPlayerSeeEveryone()`

  `boolean`

  `isClimbOverWallStruggle()`

  `boolean`

  `isClimbOverWallSuccess()`

  `private boolean`

  `isDoGrappleLetGoAfterContextKeyIsReleased()`

  `boolean`

  `isDoingActionThatCanBeCancelled()`

  `boolean`

  `isFactionPvp()`

  `boolean`

  `isFarming()`

  `boolean`

  `isFavouriteRecipe(String recipe)`

  `boolean`

  `isFavouriteRecipe(CraftRecipe recipe)`

  `boolean`

  `isForceOverrideAnim()`

  `boolean`

  `isGettingUp()`

  `boolean`

  `isGhostMode()`

  `boolean`

  `isGrapplePressed()`

  `boolean`

  `isIgnoreAutoVault()`

  `boolean`

  `isIgnoreContextKey()`

  `boolean`

  `isInitiateAttack()`

  `boolean`

  `IsInMeleeAttack()`

  `boolean`

  `isInTrees2(boolean ignoreBush)`

  `boolean`

  `isInvPageDirty()`

  `boolean`

  `isJustMoved()`

  `boolean`

  `isLocalPlayer()`

  `static boolean`

  `isLocalPlayer(Object characterObject)`

  `static boolean`

  `isLocalPlayer(IsoGameCharacter character)`

  `boolean`

  `isLookingWhileInVehicle()`

  `boolean`

  `isMaskClicked(int x,
  int y,
  boolean flip)`

  `boolean`

  `isMeleePressed()`

  `boolean`

  `isNearVehicle()`

  `boolean`

  `isNoClip()`

  `boolean`

  `isOnlyPlayerAsleep()`

  `boolean`

  `isOutside()`

  `boolean`

  `isPathfindRunning()`

  `boolean`

  `isPerformingAnAction()`

  `boolean`

  `isPlayerMoving()`

  `boolean`

  `isPlayingAttackLoopSound(String soundName)`

  `boolean`

  `isPushableForSeparate()`

  `boolean`

  `isPushedByForSeparate(IsoMovingObject other)`

  `boolean`

  `isRemoteAndHasObstacleOnPath()`

  `private boolean`

  `isRopeItem(InventoryItem item)`

  `boolean`

  `IsRunning()`

  `boolean`

  `isSafeToClimbOver(IsoDirections dir)`

  `boolean`

  `isSaveFileInUse()`

  `boolean`

  `isSaveFileIPValid()`

  `boolean`

  `isSeeDesignationZone()`

  `boolean`

  `isSeeEveryone()`

  `boolean`

  `isSeeNonPvpZone()`

  `static boolean`

  `isServerPlayerIDValid(String id)`

  `boolean`

  `isShowTag()`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isSkipResolveCollision()`

  Should this character ignore collision resolutions.

  `boolean`

  `isSolidForSeparate()`

  `boolean`

  `isTargetedByZombie()`

  `boolean`

  `isTimedActionInstant()`

  `boolean`

  `isTorchCone()`

  `boolean`

  `isUnwanted(String item)`

  `private boolean`

  `IsUsingAimHandWeapon()`

  `boolean`

  `IsUsingAimWeapon()`

  `boolean`

  `isWaiting()`

  `boolean`

  `isWalking()`

  `boolean`

  `isWearingNightVisionGoggles()`

  `void`

  `load(String fileName)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `lureAnimal(InventoryItem item)`

  `void`

  `moveUnmodded(float dirX,
  float dirY)`

  `private void`

  `moveUnmoddedRemotePlayer()`

  `void`

  `nullifyAiming()`

  `void`

  `OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer sender,
  zombie.core.skinnedmodel.animation.AnimationTrack track,
  zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `private void`

  `OnAnimEvent_GrapplerPlayRandomGrunt(IsoGameCharacter owner,
  String gruntSoundList)`

  `protected void`

  `onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)`

  `private void`

  `onClothingOutfitPreviewChanged()`

  `void`

  `OnDeath()`

  `private void`

  `onDied(IsoGameCharacter sender,
  IsoDeadBody body)`

  `private void`

  `onGrappleEnded()`

  `float`

  `onHitByVehicleApplyDamage(BaseVehicle vehicle,
  float impactSpeed)`

  `private void`

  `onIdlePerformFidgets()`

  We're currently idle, do some emoting or fidgeting, depending on the state of our injuries, environment, and our mentality.

  `void`

  `onKilled(IsoGameCharacter killer,
  HandWeapon attackingWeapon,
  boolean isGory)`

  `private static void`

  `onTrigger_ResetIsoPlayerModel(String entryKey)`

  `void`

  `onWornItemsChanged()`

  `private void`

  `performContextualAction(zombie.characters.ContextualAction ca)`

  `void`

  `petAnimal()`

  `private zombie.characters.ContextualAction`

  `pickBestContextualAction(ArrayList<zombie.characters.ContextualAction> contextualActions)`

  `void`

  `playBloodSplatterSound()`

  `long`

  `playerVoiceSound(String suffix)`

  `long`

  `playGainExperienceLevelSound()`

  `protected void`

  `playPainVoicesFromFallDamage(zombie.characters.FallDamage fallDamage)`

  `long`

  `playRangedWeaponShootSound(String soundName)`

  `private void`

  `possiblyPlayVoiceSound(String suffix)`

  `protected void`

  `postHitByVehicleUpdateStance(float speed,
  boolean knockDownAllowed)`

  Update our reaction stance after a vehicle impact.

  `void`

  `postupdate()`

  `private void`

  `postupdateInternal()`

  `boolean`

  `pressedAim()`

  `void`

  `pressedAttack()`

  `boolean`

  `pressedCancelAction()`

  `boolean`

  `pressedMovement(boolean ignoreBlock)`

  `void`

  `preupdate()`

  `void`

  `processWakingUp()`

  `private void`

  `randomizeDrunkenMovement(IsoPlayer.MoveVars moveVars,
  boolean isController)`

  `private void`

  `registerAnimEventCallbacks()`

  `void`

  `registerECSComponents()`

  `private void`

  `registerVariableCallbacks()`

  `void`

  `removeAllAttachedAnimals()`

  `void`

  `removeAttachedAnimal(IsoAnimal animal)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeSaveFile()`

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

  `renderAttachedAnimalRopes()`

  `void`

  `renderlast()`

  `static void`

  `Reset()`

  `void`

  `resetDisplayName()`

  `void`

  `resetSelectedZonesForHighlight()`

  `void`

  `resetSleepingPillsTaken()`

  `private void`

  `resolveStrafeDirectionFromPath(Vector2 playerMoveDir)`

  `void`

  `save()`

  `void`

  `save(String fileName)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setAddedToModelManager(zombie.core.skinnedmodel.ModelManager modelManager,
  boolean isAdded)`

  Callback from ModelManager.Add/Remove functions.

  `void`

  `setAllChatMuted(boolean allChatMuted)`

  `void`

  `setAngleFromAim()`

  `void`

  `setAsleepTime(float asleepTime)`

  `void`

  `setAttackAnimThrowTimer(long dt)`

  `void`

  `setAttackFromBehind(boolean attackFromBehind)`

  `void`

  `setAttackStarted(boolean attackStarted)`

  `void`

  `setAttackType(zombie.AttackType attackType)`

  `void`

  `setAttackVariationX(float attackVariationX)`

  `void`

  `setAttackVariationY(float attackVariationY)`

  `void`

  `setAuthorizedHandToHand(boolean enabled)`

  Specify whether character can perform hand-to-hand combat.

  `void`

  `setAuthorizedHandToHandAction(boolean enabled)`

  Specify whether character can initiate hand-to-hand combat.

  `void`

  `setAuthorizeMeleeAction(boolean enabled)`

  Deprecated.

  Replaced by [`setAuthorizedHandToHandAction(boolean)`](#setAuthorizedHandToHandAction(boolean))

  `void`

  `setAuthorizeShoveStomp(boolean enabled)`

  Deprecated.

  Replaced by [`setAuthorizedHandToHand(boolean)`](#setAuthorizedHandToHand(boolean))

  `void`

  `setAutoDrink(boolean autoDrink)`

  `void`

  `setBannedAttacking(boolean b)`

  `void`

  `setbChangeCharacterDebounce(boolean changeCharacterDebounce)`

  `void`

  `setbCouldBeSeenThisFrame(boolean couldBeSeenThisFrame)`

  `private void`

  `setBeenMovingSprinting()`

  `void`

  `setBlockMovement(boolean blockMovement)`

  `void`

  `setbSeenThisFrame(boolean seenThisFrame)`

  `void`

  `setCanHearAll(boolean b)`

  `void`

  `setCanSeeAll(boolean b)`

  `void`

  `setClearSpottedTimer(int clearSpottedTimer)`

  `void`

  `setClimbOverWallStruggle(boolean climbOverWallStruggle)`

  `void`

  `setClimbOverWallSuccess(boolean climbOverWallSuccess)`

  `void`

  `setCombatSpeed(float combatSpeed)`

  `static void`

  `setCoopPVP(boolean enabled)`

  `void`

  `setDialogMood(int dialogMood)`

  `void`

  `setDisplayName(String displayName)`

  `private void`

  `setDoGrappleLetGoAfterContextKeyIsReleased(boolean letGoAfterContextIsReleased)`

  `void`

  `setDragCharacter(IsoSurvivor dragCharacter)`

  `void`

  `setDragObject(IsoMovingObject dragObject)`

  `void`

  `setExtraInfoFlags(byte flags,
  boolean isForced)`

  `void`

  `setFactionPvp(boolean pvp)`

  `void`

  `setFishingStage(String stage)`

  `void`

  `setFitnessSpeed()`

  `static void`

  `setFollowDeadCount(int aFollowDeadCount)`

  `void`

  `setFollowID(int followId)`

  `void`

  `setForceOverrideAnim(boolean forceOverride)`

  `void`

  `setGhostMode(boolean aGhostMode)`

  `void`

  `setGhostMode(boolean aGhostMode,
  boolean isForced)`

  `void`

  `setHasObstacleOnPath(boolean value)`

  `void`

  `setHeartDelay(float heartDelay)`

  `void`

  `setHeartDelayMax(int heartDelayMax)`

  `void`

  `setHoursSurvived(double hrs)`

  `void`

  `setIgnoreAutoVault(boolean ignoreAutoVault)`

  `void`

  `setIgnoreContextKey(boolean ignoreContextKey)`

  `void`

  `setIgnoreMovement(boolean ignoreMovement)`

  `void`

  `setInitiateAttack(boolean initiate)`

  `static void`

  `setInstance(IsoPlayer newInstance)`

  `void`

  `setInvPageDirty(boolean b)`

  `void`

  `setIsFarming(boolean isFarmingBool)`

  `void`

  `setIsLuringAnimals(boolean luring)`

  `void`

  `setJustMoved(boolean val)`

  `void`

  `setLastAngle(Vector2 lastAngle)`

  `void`

  `setLastAttackWasHandToHand(boolean lastAttackWasHandToHand)`

  `void`

  `setLastCheatToggleMillis(long lastCheatToggleMillis)`

  `void`

  `setLastRemoteUpdate(long lastRemoteUpdate)`

  `void`

  `setLastSpotted(Stack<IsoMovingObject> lastSpotted)`

  `static void`

  `setLocalPlayer(int index,
  IsoPlayer newPlayerObj)`

  `void`

  `setMaxWeightDelta(float maxWeightDelta)`

  `void`

  `setMeleeHitSurface(String material)`

  `void`

  `setMeleeHitSurface(zombie.audio.parameters.ParameterMeleeHitSurface.Material material)`

  `void`

  `setMoodleCantSprint(boolean b)`

  `void`

  `setMoveSpeed(float moveSpeed)`

  `void`

  `setNoClip(boolean noClip)`

  `void`

  `setNoClip(boolean noClip,
  boolean isForced)`

  `void`

  `setNpc(boolean isNpc)`

  `void`

  `setOffSetXUI(int offSetXUi)`

  `void`

  `setOffSetYUI(int offSetYUi)`

  `void`

  `setOnlineID(short value)`

  `void`

  `setPathfindRunning(boolean newvalue)`

  `void`

  `setPerformingAnAction(boolean val)`

  `void`

  `setPing(int ping)`

  `String`

  `setPlayerStats(zombie.core.network.ByteBufferReader bb,
  String adminUsername)`

  `void`

  `setRole(String newLvl)`

  `void`

  `setRole(Role newRole)`

  `void`

  `setSeeDesignationZone(boolean seeMetaAnimalZone)`

  `void`

  `setSeeNonPvpZone(boolean seeNonPvpZone)`

  `void`

  `setSelectedZoneForHighlight(Double id)`

  `void`

  `setShowTag(boolean show)`

  `void`

  `setSleepingPillsTaken(int sleepingPillsTaken)`

  If you've take more than 10 sleeping pills you lose some health If you're
  drunk, 1 pills = 2

  `void`

  `setSteamID(long steamId)`

  `void`

  `setTagColor(ColorInfo tagColor)`

  `void`

  `setTagPrefix(String newTag)`

  `void`

  `setTicksSinceSeenZombie(int ticksSinceSeenZombie)`

  `void`

  `setTimedActionToRetrigger(LuaTimedActionNew timedActionToRetrigger)`

  `void`

  `setTimeSinceLastNetData(int timeSinceLastNetData)`

  `void`

  `setTimeSinceLastStab(float timeSinceLastStab)`

  `void`

  `setUnwanted(String item,
  Boolean unwanted)`

  `void`

  `setUsername(String newUsername)`

  `void`

  `setVehicle4TestCollision(BaseVehicle vehicle)`

  `void`

  `setVehicleHitLocation(BaseVehicle vehicle)`

  Base method.

  `void`

  `setVoicePitch(float voicePitch)`

  `void`

  `setVoiceType(int voiceType)`

  `void`

  `setWaiting(boolean waiting)`

  `private void`

  `setWeaponType(String val)`

  `void`

  `setWearingNightVisionGoggles(boolean b)`

  `boolean`

  `shouldBeTurning()`

  `void`

  `startAttackLoopSound(String soundName)`

  `void`

  `startReceivingBodyDamageUpdates(IsoPlayer other)`

  `private void`

  `stopAttackLoopSound(boolean cancelPrevious)`

  `void`

  `stopLuringAnimals(boolean eatFood)`

  `long`

  `stopPlayerVoiceSound(String suffix)`

  `void`

  `stopReceivingBodyDamageUpdates(IsoPlayer other)`

  `void`

  `syncVisuals()`

  `void`

  `TestAnimalSpotPlayer(IsoAnimal chr)`

  `void`

  `TestZombieSpotPlayer(IsoMovingObject chr)`

  `boolean`

  `tooDarkToRead()`

  `long`

  `transmitPlayerVoiceSound(String suffix)`

  `void`

  `triggerMusicIntensityEvent(String id)`

  `private void`

  `trySuppressPathFinder(Vector3 target)`

  `void`

  `update()`

  `private void`

  `updateAimingStance()`

  `private void`

  `updateAttackLoopSound()`

  `private void`

  `updateBringToBearSound()`

  `private void`

  `updateChangeCharacterKey()`

  `private void`

  `updateCursorVisibility()`

  `private void`

  `updateDeathDragDown()`

  `private void`

  `updateDraggingCorpseSounds()`

  `private void`

  `updateEnableModelsKey()`

  `private void`

  `updateEndurance()`

  `void`

  `updateEnduranceWhileInVehicle()`

  `void`

  `updateEnduranceWhileSitting()`

  `private void`

  `updateEquippedBaggageContainer()`

  `private void`

  `updateExt()`

  Throw a random idle animations if you're alone invalid input: '&' idle
  Cap it to not throw it too much time in a row

  `private void`

  `updateFootInjuries()`

  `private void`

  `updateGodModeKey()`

  `private void`

  `updateHeartSound()`

  `private void`

  `updateHeavyBreathing()`

  `private void`

  `UpdateInputState(IsoPlayer.InputState inputState)`

  `private void`

  `updateInteractKeyPanic()`

  `private void`

  `updateInternal1()`

  `private boolean`

  `updateInternal2()`

  `private void`

  `updateInTreesInjuries()`

  `void`

  `updateLOS()`

  `private void`

  `updateMechanicsItems()`

  Remove items that has been changed too long ago You can gain exp from
  changing a part only every 24h on the same part

  `private void`

  `updateMovementFromInput(IsoPlayer.MoveVars moveVars)`

  `void`

  `updateMovementRates()`

  `private void`

  `updateMusicIntensityEvents()`

  `private void`

  `updateMusicThreatStatuses()`

  `protected boolean`

  `updateRemotePlayer()`

  `void`

  `updateRemotePlayerInVehicle()`

  `static void`

  `UpdateRemovedEmitters()`

  `private void`

  `updateSleepingPillsTaken()`

  `private void`

  `updateSneakKey()`

  `private void`

  `updateSoundListener()`

  `protected void`

  `updateStats_Sleeping()`

  Updates the player's stats while asleep

  `private void`

  `updateTemperatureCheck()`

  `private void`

  `updateTorchStrength()`

  `private boolean`

  `updateUseKey()`

  `void`

  `updateUsername()`

  `void`

  `updateVocalProperties()`

  `private boolean`

  `updateWhileDead()`

  `private void`

  `updateWhileInVehicle()`

  `static void`

  `visitAllPlayers(Consumer<IsoPlayer> visitor)`

  `static <ComponentType extends ECSComponent>  
  void`

  `visitAllPlayersWithComponent(Class<ComponentType> componentClass,
  BiConsumer<IsoPlayer, ComponentType> visitor)`

  `boolean`

  `wasLastAttackHandToHand()`

  ### Methods inherited from class zombie.characters.IsoLivingCharacter

  `AttemptAttack, getAttackingWeapon, isCollidedWithPushableThisFrame, isDoHandToHandAttack, isDoShove, isDoStomp, isGrapplingWhileAiming, isPrimaryHandModelReady, isShoving, isShovingWhileAiming, isUnarmed, setDoShove`

  ### Methods inherited from class [IsoGameCharacter](IsoGameCharacter.html#method-summary "class in zombie.characters")

  `actionStateChanged, addArmMuscleStrain, addBackMuscleStrain, addBasicPatch, addBlood, addBloodFromVehicleImpact, addBodyVisualFromItemType, addBothArmMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addDirt, addHole, addHole, addHoleFromZombieAttacks, addKnownMediaLine, addLeftArmMuscleStrain, addLineChatElement, addLineChatElement, addLineChatElement, addLineChatElement, addLotsOfDirt, addNeckMuscleStrain, addOnDiedListener, addReadLiterature, addReadLiterature, addReadMap, addReadPrintMedia, addRightLegMuscleStrain, addStiffness, addVisualDamage, aimAtFloorTargetDistance, applyCharacterTraitsRecipes, applyDamage, ApplyInBedOffset, applyProfessionRecipes, applyTraits, attackFromWindowsLunge, autoDrink, avoidDamage, becomeCorpseItem, BetaAntiDepress, BetaBlockers, bodyPartIsSpiked, bodyPartIsSpikedBehind, burnCorpse, CacheEquipped, calcCarForwardVector, calcCarPositionOffset, calcCarSpeedVector, calcCarSpeedVector, calcCarToPlayerVector, calcCarToPlayerVector, calcConeAngleMultiplier, calcConeAngleOffset, calcHitDir, calcHitDir, calcLengthMultiplier, calculateBaseSpeed, calculateCombatSpeed, calculateGrappleEffectivenessFromTraits, calculateIdleSpeed, calculateShadowParams, calculateShadowParams, calculateSneakLimpSpeedScale, calculateVisibilityData, Callout, Callout, canAccessContainer, CanAttack, canBeGrappled, canClimbDownSheetRope, canClimbDownSheetRopeInCurrentSquare, canClimbSheetRope, canDropCorpseInto, canGrabCorpseFrom, canRagdoll, canReachTo, CanSee, CanSee, canSprint, canStandAt, canUseAsGenericCraftingSurface, canUseCurrentPoseForCorpse, canUseDebugContextMenu, canUseLootLog, canUseLootZed, CanUsePathfindState, carMovingBackward, causesDamageToVehicleWhenHit, changeState, checkCurrentAction, checkIsNearVehicle, checkIsNearWall, checkUpdateModelTextures, clear, clear, clearAIStateMap, clearAttachedItems, clearDiedBody, ClearEquippedCache, clearFallDamage, clearHitInfo, clearKnownMediaLines, clearVariable, ClearVariable, clearVariables, clearWornItems, climbDownSheetRope, climbOverFence, climbSheetRope, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindowFrame, closeWindow, clothingItemChanged, compareMovePriority, createFallingItem, createKeyRing, createKeyRing, damageWhileInTrees, dbgGetAnimTrack, dbgGetAnimTrackName, dbgGetAnimTrackTime, dbgGetAnimTrackWeight, die, dieNetwork, DirectionFromVector, DoDeath, DoDeath, doDeathSplatterAndSounds, doDeferredMovement, doDeferredMovementFromRagdoll, DoFloorSplat, DoFootstepSound, DoLand, doNetworkHitByVehicle, doSleepSpeech, DoSneezeText, DoSplat, DoSwingCollisionBoneCheck, drawDebugTextBelow, drawDirectionLine, drawDirectionLine, drawLine, DrawSneezeText, dressInPersistentOutfit, dressInPersistentOutfitID, dressInRandomNonSillyOutfit, dressInRandomOutfit, Dressup, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, dropHandItems, dropHeavyItems, dropHeldItems, Eat, Eat, Eat, EatOnClient, endPlaybackGameVariables, ensureExistsBallisticsTarget, ensureNotInVehicle, enterVehicle, exert, faceDirection, faceLocation, faceLocationF, facePosition, faceThisObject, faceThisObjectAlt, fallenOnKnees, fallenOnKnees, fallFromRope, FireCheck, flagForHotSave, forceAwake, forgetRecipes, get, get, getAbsoluteExcessTwist, getActionContext, getActionStateName, getActiveLightItems, getAdvancedAnimator, getAge, getAimAtFloorAmount, getAimingDelay, getAimingMode, getAimOriginPosX, getAimOriginPosY, getAimOriginPosZ, getAlphaUpdateRateMul, getAlreadyReadPages, getAnimAngle, getAnimAngleRadians, getAnimAngleStepDelta, getAnimAngleTwistDelta, getAnimatable, getAnimationDebug, getAnimationPlayer, getAnimationStateName, getAnimationTimeDelta, getAnimEventBroadcaster, getAnimForwardDirection, getAnimVector, getAppetiteMultiplier, getAttachedItem, getAttachedItems, getAttachedLocationGroup, getAttackedBy, getAttackTargetSquare, getAttackVars, getAutoWalkDirection, getBallisticsController, getBallisticsTarget, getBarricadeStrengthMod, getBarricadeTimeMod, getBed, getBedType, getBeenMovingFor, getBeenSprintingFor, getBetaDelta, getBetaEffect, getBloodImpactX, getBloodImpactY, getBloodImpactZ, getBloodSplat, getBlurFactor, getBodyDamage, getBodyDamageRemote, getBodyLocationGroup, getBodyPartClothingDefense, getBumpedChr, getBumpFallType, getBumpType, getCardinalDirection, getCardinalDirectionTo, getCharacterActions, getCharacterGender, getCharacterTraits, getChatElement, getCheats, getChestHeight, getChopTreeSpeed, getClickSound, getClimbData, getClimbingFailChanceFloat, getClimbingFailChanceInt, getClimbRopeSpeed, getClimbRopeTime, getClothingDiscomfortModifier, getClothingItem_Back, getClothingItem_Feet, getClothingItem_Hands, getClothingItem_Head, getClothingItem_Legs, getClothingItem_Torso, getClothingWetness, getClothingWetnessSync, getContainers, getContainerToolTip, getContextWorldContainers, getContextWorldContainers, getContextWorldContainersInObjects, getContextWorldContainersWithHumanCorpse, getContextWorldSuitableContainersToDropCorpseInObjects, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessRate, getCurrentActionContextStateName, getCurrentBuildingDef, getCurrentRoomDef, getCurrentState, getCurrentStateName, getCurrentVerticalAimAngle, getDangerLevels, getDebugMonitor, getDefaultState, getDeferredAngleDelta, getDeferredMovement, getDeferredMovementFromRagdoll, getDeferredRotationWeight, getDepressDelta, getDepressEffect, getDescriptor, getDetectionRange, getDieCount, getDirectionAngle, getDirectionAngleRadians, getDotWithForwardDirection, getDotWithForwardDirection, getEffectiveFatigue, getEmitter, getEnemyList, getEquipedRadio, getExcessTwist, getFallSpeedSeverity, getFallTime, getFamiliarBuildings, getFatigueMod, getFatiqueMultiplier, getFinder, getFireKillRate, getFireMode, getFireSpreadProbability, getFMODParameters, getFollowingTarget, getFootInjurySpeedModifier, getForceWakeUpTime, getForwardDirection, getForwardDirection, getForwardDirectionX, getForwardDirectionY, getForwardMovementIsoDirection, getFreeInventoryCapacity, getFullName, getGameVariables, getGameVariablesInternal, getGrappleable, getHaloTimerCount, getHammerSoundMod, getHeadLookAngleMax, getHeadLookHorizontal, getHeadLookVertical, getHealth, getHearDistanceModifier, getHeightAboveFloor, getHitChancesMod, getHitDirEnum, getHitInfoList, getHitReaction, getHitReactionNetworkAI, getHittingMod, getHungerMultiplier, getHurtSound, getHyperthermiaMod, getIdleSquareTime, getIgnoreMovement, getImpactIsoSpeed, getInf, getInventory, getInventoryWeight, getKnownRecipes, getLastBump, getLastChatMessage, getLastFallSpeed, getLastHeardSound, getLastHitCharacter, getLastHitCount, getLastHourSleeped, getLastKnownLocation, getLastKnownLocationOf, getLastLocalEnemies, getLastSpokenLine, getLastZombieKills, getLeaveBodyTimedown, getLegsSprite, getLevelMaxForXp, getLevelUpLevels, getLevelUpLevels, getLevelUpMultiplier, getLightfootMod, getLightInfo2, getLlx, getLly, getLlz, getLocalEnemyList, getLocalGroupList, getLocalList, getLocalNeutralList, getLocalRelevantEnemyList, getLookAngleRadians, getLookDirectionX, getLookDirectionY, getLookVector, getLowDangerInVicinity, getMaintenanceMod, getMapKnowledge, getMass, getMaxChatLines, getMaxTwist, getMaxWeight, getMaxWeightBase, getMeleeCombatMod, getMeleeDelay, getMetalBarricadeStrengthMod, getModel, getModelInstance, getMomentumScalar, getMoodles, getMoveDelta, getMoveForwardVec, getMovementSpeed, getMusicIntensityEventModData, getNameCoords, getNextAnimationTranslationLength, getNextWander, getNimbleMod, getNumSurvivorsInVicinity, getNumTwistBones, getOrCreateSleepingEventData, getOutfitName, getOwner, getOwnerPlayer, getPacingMod, getPainDelta, getPainEffect, getPath2, getPathFindBehavior2, getPathIndex, getPathTargetX, getPathTargetY, getPathTargetZ, getPatience, getPatienceMax, getPatienceMin, getPerkInfo, getPerkLevel, getPerkList, getPerkToUnit, getPersistentOutfitID, getPreviousActionContextStateName, getPreviousStateName, GetPrimaryEquippedCache, getPrimaryHandItem, getPrimaryHandType, getRagdollController, getRandomDefaultOutfit, getReadLiterature, getReadPrintMedia, getReadyModelData, getReanimAnimDelay, getReanimAnimFrame, getReanimatedCorpse, getReanimateTimer, getRecoilDelay, getRecoilVarX, getRecoilVarY, getRecoveryMod, getReduceInfectionPower, getRemoteID, getRunSpeedModifier, getSafety, getSayLine, GetSecondaryEquippedCache, getSecondaryHandItem, getSecondaryHandType, getShoulderTwist, getShoulderTwistWeight, getShoutItemModel, getShoutType, getShovingMod, getSitOnFurnitureDirection, getSitOnFurnitureObject, getSleepingTabletDelta, getSleepingTabletEffect, getSlowFactor, getSlowTimer, getSneakLimpSpeedScale, getSneakSpotMod, getSpeakColour, getSpeakTime, getSpeedMod, getSprintMod, getSpriteDef, getStaggerTimeMod, getStateMachine, getStateMachineComponent, getStateMachineParams, getStatisticsDebug, getStats, getSubVariableSource, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpseInSquare, getSuitableContainersToDropCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSurroundingAttackingZombies, getSurroundingAttackingZombies, getSurvivorKills, getSurvivorMap, getTalkerType, getTargetGrapplePos, getTargetGrapplePos, getTargetGrappleRotation, getTargetTwist, getTargetVerticalAimAngle, getTempo, getTempo2, getTextureCreator, getThirstMultiplier, getThreatLevel, getTimeSinceLastSmoke, getTimeThumping, getTotalBlood, getTwist, getUsedItemsOn, getUseHandWeapon, getUserNameHeight, getVariable, GetVariable, getVehicle, getVehicleDiscomfortModifier, getVeryCloseEnemyList, getWaterSource, getWeaponLevel, getWeaponLevel, getWeatherHearingMultiplier, getWeightAsCorpse, getWeightMod, getWeldingSoundMod, getWornItem, getWornItems, getWornItemsHearingModifier, getWornItemsHearingMultiplier, getWornItemsVisionModifier, getWornItemsVisionMultiplier, getWrappedGrappleable, getXp, getXpForLevel, getZombieKills, hasActiveModel, hasAnimationPlayer, hasAwkwardHands, hasBloodyClothing, hasDirtyClothing, hasEquipped, hasEquippedTag, hasFootInjury, hasFullInventory, hasHitReaction, HasItem, hasItems, hasPath, hasReadMap, hasRecipeAtHand, hasTimedActions, hasTrait, hasTrait, hasWornTag, helmetFall, Hit, Hit, Hit, initAttachedItems, initLightInfo2, InitSpriteParts, initSpritePartsEmpty, initTextObjects, initWornItems, isAboveTopOfStairs, isActuallyAttackingWithMeleeWeapon, isAddedToModelManager, isAimAtFloor, isAimingFirearmEquipped, isAlive, isAllowConversation, isAlwaysDayCheat, isAnimal, isAnimalCheat, isAnimalExtraValuesCheat, isAnimalRunningToDeathPosition, isAnimatingBackwards, isAnimationUpdatingThisFrame, isAnimForecasted, isAsleep, isAttachedItem, IsAttackRange, isAutoWalk, isbDoDefer, isBehind, isBeingSteppedOn, isbFalling, isbOnBed, isBuildCheat, isBumpDone, isBumped, isBumpFall, isBumpStaggered, isbUseParts, isCanShout, isCanUseBrushTool, isCheatSet, isClimbing, isClimbingRope, isClimbingThroughWindow, isClosingWindow, isCriticalHit, isCurrentActionAllowedWhileDraggingCorpses, isCurrentActionPathfinding, isCurrentGameClientState, isCurrentlyBusy, isCurrentlyIdle, isCurrentState, isDead, isDeathDragDown, isDeferredMovementEnabled, isDisguised, isDoDeathSound, isDraggingCorpse, isDriving, isDuplicateBodyVisual, isEditingRagdoll, isEnduranceSufficientForAction, isEquipped, isEquippedClothing, isFacingLocation, isFacingObject, isFalling, isFallOnFront, isFarmingCheat, isFastMoveCheat, isFemale, isFishingCheat, isFullyRagdolling, isGodMod, isGrappleThrowIntoContainer, isGrappleThrowOutWindow, isGrappleThrowOverFence, isHandItem, isHandModelOverriddenByCurrentCharacterAction, isHeadLookAround, isHealthCheat, isHeavyItem, isHideEquippedHandL, isHideEquippedHandR, isHideWeaponModel, isHitFromBehind, isIgnoreMovementForDirection, isIgnoreStaggerBack, isImpactFromBehind, isImpactFromBehind, isImpactFromBehind, isInARoom, isInTrees, isInTreesNoBush, isInventive, isInvincible, isInvisible, isInvulnerable, isItemInBothHands, isKilledByFall, isKilledBySlicingWeapon, isKnockedDown, isKnowAllRecipes, isKnownMediaLine, isKnownPoison, isKnownPoison, isLastCollidedN, isLastCollidedW, isLiteratureRead, isLocal, isMechanicsCheat, isMeleeAttackRange, isMeleeWeaponEquipped, isMovablesCheat, isMoving, isNearSirenVehicle, isNetworkVehicleCollisionActive, isNpc, isObjectBehind, isOnBack, isOnBed, isOnDeathDone, isOnFire, isOnKillDone, isOverEncumbered, isPathing, isPerformingAttackAnimation, isPerformingGrappleAnimation, isPerformingHostileAnimation, isPerformingNoAimShortStrafe, isPerformingShoveAnimation, isPerformingStompAnimation, isPersistentOutfitInit, isPlayingDeathSound, isPrimaryEquipped, isPrimaryHandItem, isPrintMediaRead, isProtectedFromToxic, isProtectedFromToxic, isRagdoll, isRagdollFall, isRagdollSimulationActive, isRangedWeaponEmpty, isRangedWeaponEquipped, isReading, isReanim, isRecipeActuallyKnown, isRecipeActuallyKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRemote, isResting, isRunning, isSeatedInVehicle, isSecondaryHandItem, isShoveStompAnim, isShowAdminTag, isSitOnFurnitureObject, isSitOnGround, isSitting, isSittingOnFurniture, isSneaking, isSpeaking, IsSpeaking, IsSpeakingNPC, isSprinting, isStaggerBack, isStrafing, isTimedActionInstantCheat, isTurning, isTurning90, isTurningAround, isTwisting, isUnderVehicle, isUnderVehicleRadius, isUnlimitedAmmo, isUnlimitedCarry, isUnlimitedEndurance, isUpdateAlphaDuringRender, isUpright, isUsingWornItems, isVehicleCollision, isVisibleToNPCs, isWeaponReady, isWearingAwkwardGloves, isWearingGlasses, isWearingGloves, isWearingTag, isWearingVisualAid, isZombie, isZombieAttacking, isZombieAttacking, isZombiesDontAttack, Kill, Kill, Kill, Kill, learnRecipe, learnRecipe, level0, LevelPerk, LevelPerk, loadKnownMediaLines, LoseLevel, modifyTraitXPBoost, modifyTraitXPBoost, MoveForward, nearbyZombieClimbPenalty, OnAnimEvent_IsAlmostUp, OnAnimEvent_KilledByAttacker, OnClothingUpdated, onDeath_ShouldDoSplatterAndSounds, OnEquipmentUpdated, onFireLightSourceCheck, onHitByVehicle, onHitByVehicleDriver, onMouseLeftClick, onRagdollSimulationStarted, onTrigger_setAnimStateToTriggerFile, onTrigger_setClothingToXmlTriggerFile, openWindow, PainMeds, pathToAux, pathToCharacter, pathToLocation, pathToLocationF, pathToSound, pickUpCorpse, pickUpCorpseItem, PlayAnim, PlayAnimUnlooped, PlayAnimWithSpeed, playbackRecordCurrentStateSnapshot, playbackSetCurrentStateSnapshot, playDeadSound, playDropItemSound, playEmote, playerIsSelf, playHurtSound, playSound, playSoundLocal, playWeaponHitArmourSound, postAnimationFinishing, postUpdateEquippedTextures, postUpdateModelTextures, processHitDamage, QueueAction, readInventory, ReadLiterature, ReduceHealthWhenBurning, registerAIState, releaseAnimationPlayer, releaseBallisticsController, releaseBallisticsTarget, releaseRagdollController, reloadOutfit, remove, removeAttachedItem, removeFromHands, removeKnownMediaLine, removeOnFireLightSource, removeWornItem, removeWornItem, renderObjectPicker, renderServerGUI, renderShadow, renderTextureInsteadOfModel, reportEvent, resetAimingDelay, resetBeardGrowingTime, resetBodyDamageRemote, resetEquippedHandsModels, resetHairGrowingTime, resetModel, resetModelNextFrame, saveChange, saveKnownMediaLines, Say, Say, SayDebug, SayDebug, SayRadio, SayShout, SayWhisper, Seen, set, setAge, setAimAtFloor, setAimAtFloor, setAimingDelay, setAllowConversation, setAlreadyReadPages, setAlwaysDayCheat, setAnimalCheat, setAnimalExtraValuesCheat, setAnimated, setAnimatingBackwards, setAnimForecasted, setAsleep, setAttachedItem, setAttachedItems, setAttackedBy, setAttackTargetSquare, setAutoWalk, setAutoWalkDirection, setAvoidDamage, setbClimbing, setbDoDefer, setBed, setBedType, setBeenMovingFor, setBeenSprintingFor, setBetaDelta, setBetaEffect, setbFalling, setBloodImpactX, setBloodImpactY, setBloodImpactZ, setBloodSplat, setbOnBed, setBuildCheat, setBumpDone, setBumpedChr, setBumpFall, setBumpFallType, setBumpStaggered, setBumpType, setbUseParts, setCanShout, setCanUseBrushTool, setCanUseDebugContextMenu, setCanUseLootLog, setCanUseLootZed, setCharacterGender, setClickSound, setClimbData, setClimbRopeTime, setClothingItem_Back, setClothingItem_Feet, setClothingItem_Hands, setClothingItem_Head, setClothingItem_Legs, setClothingItem_Torso, setCorpseSicknessRate, setCriticalHit, setCurrentVerticalAimAngle, setDangerLevels, setDeathDragDown, setDebugMonitor, setDefaultState, setDefaultState, setDeferredMovementEnabled, setDelayToSleep, setDepressDelta, setDepressEffect, setDescriptor, setDieCount, setDirectionAngle, setDoDeathSound, setEditingRagdoll, setEquipParent, setEquipParent, setFallOnFront, setFallTime, setFarmingCheat, setFastMoveCheat, setFemale, setFireKillRate, setFireMode, setFireSpreadProbability, setFishingCheat, setFollowingTarget, setForceWakeUpTime, setForwardDirection, setForwardDirection, setForwardDirectionFromAnimAngle, setForwardDirectionFromIsoDirection, setForwardIsoDirection, setGodMod, setGodMod, setGrappleThrowIntoContainer, setGrappleThrowOutWindow, setGrappleThrowOverFence, setHaloNote, setHaloNote, setHaloNote, setHeadLookAround, setHeadLookAroundDirection, setHealth, setHealthCheat, setHideEquippedHandL, setHideEquippedHandR, setHideWeaponModel, setHitDir, setHitFromBehind, setHitReaction, setHurtSound, setIgnoreStaggerBack, setInventory, setInvincible, setInvisible, setInvisible, setInvulnerable, setIsAiming, setIsAnimal, setIsResting, setKilledByFall, setKnockedDown, setKnowAllRecipes, setLastBump, setLastChatMessage, setLastCollidedN, setLastCollidedW, setLastFallSpeed, setLastHeardSound, setLastHitCharacter, setLastHitCount, setLastHourSleeped, setLastLocalEnemies, setLastSpokenLine, setLastZombieKills, setLeaveBodyTimedown, setLegsSprite, setLevelUpMultiplier, setLlx, setLly, setLlz, setMaxTwist, setMaxWeight, setMaxWeightBase, setMechanicsCheat, setMeleeDelay, setMetabolicTarget, setMetabolicTarget, setMomentumScalar, setMovablesCheat, setMoveDelta, setMoveForwardVec, setMoving, setMusicIntensityEventModData, setNextWander, setNumSurvivorsInVicinity, setOnBed, setOnDeathDone, setOnFire, SetOnFire, setOnKillDone, setOwner, setOwnerPlayer, setPainDelta, setPainEffect, setPath2, setPathIndex, setPathing, setPathSpeed, setPatience, setPatienceMax, setPatienceMin, setPerformingAttackAnimation, setPerformingShoveAnimation, setPerformingStompAnimation, setPerkLevelDebug, setPersistentOutfitID, setPersistentOutfitID, setPlayingDeathSound, setPrimaryHandItem, setRagdollFall, setRangedWeaponEmpty, setReading, setReanim, setReanimAnimDelay, setReanimAnimFrame, setReanimateTimer, setRecoilDelay, setRecoilVarX, setRecoilVarY, setReduceInfectionPower, setRemoteID, setRunning, setSafety, setSayLine, setSceneCulled, setSecondaryHandItem, setShoveStompAnim, setShowAdminTag, setSitOnFurnitureDirection, setSitOnFurnitureObject, setSitOnGround, setSittingOnFurniture, setSleepingTabletDelta, setSleepingTabletEffect, setSlowFactor, setSlowTimer, setSneaking, setSneakLimpSpeedScale, setSpeakColour, setSpeakColourInfo, setSpeaking, setSpeakTime, setSpeedMod, setSprinting, setStaggerTimeMod, setStateMachineLocked, setSurvivorKills, setTargetAndCurrentDirection, setTargetGrapplePos, setTargetVerticalAimAngle, setTextureCreator, setTimedActionInstantCheat, setTimeOfSleep, setTimeSinceLastSmoke, setTimeThumping, setTurnDelta, setUnlimitedAmmo, setUnlimitedCarry, setUnlimitedEndurance, setUseHandWeapon, setUsePhysicHitReaction, setVariable, setVariable, setVariable, setVariable, setVariable, SetVariable, setVariableEnum, setVehicle, setVehicleCollision, setVisibleToNPCs, setWornItem, setWornItem, setWornItems, setXp, setZombieKills, setZombiesDontAttack, shouldBecomeZombieAfterDeath, shouldBeFalling, shouldBePushedBackByVehicleHit, shouldBeTurning90, shouldBeTurningAround, shouldIgnoreCollisionWithSquare, shouldSnapZToCurrentSquare, shouldWaitToStartTimedAction, SleepingTablet, slideAwayFromWalls, smashCarWindow, smashWindow, spikePart, spikePartIndex, spinToZeroAllAnimNodes, splatBlood, splatBloodFloor, splatBloodFloorBig, SpreadFire, SpreadFireMP, StartAction, startEvent, startPlaybackGameVariables, StartTimedActionAnim, StartTimedActionAnim, StopAllActionQueue, StopAllActionQueueAiming, StopAllActionQueueRunning, StopAllActionQueueWalking, StopBurning, stopEvent, stopOrTriggerSound, StopTimedActionAnim, teleportTo, teleportTo, teleportTo, teleportTo, testCollideWithVehicles, testDefense, testDotSide, testDotSideEnum, TestIfSeen, Throw, throwGrappledIntoInventory, throwGrappledOverFence, throwGrappledTargetOutWindow, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerCough, tryGetAIState, updateAimingDelay, updateBallistics, updateBandages, updateDiscomfortModifiers, updateDisguisedState, updateEmitter, updateEquippedItemSounds, updateEquippedRadioFreq, updateEvent, updateForServerGui, updateHandEquips, updateHasTargetFlag, updateLightInfo, updateMovementMomentum, updateRecoilVar, updateSpeedModifiers, updateStats_Awake, updateStats_WakeState, updateTextObjects, updateUserName, updateVisionEffects, updateVisionEffectTargets, updateWornItemsHearingModifier, updateWornItemsVisionModifier, usePhysicHitReaction, useRagdollVehicleCollision, wasLocal, zeroForwardDirectionX, zeroForwardDirectionY`

  ### Methods inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isCrawling, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isOnFloor, isProne, isShootable, isSolid, isStanding, isWithinRange, moveUnmoddedInternal, onMouseRightClick, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, shouldSlideHeadAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, toString, updateAnimation`

  ### Methods inherited from class [IsoObject](../iso/IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.CharacterInputComponentEntity

  `getCharacterInputComponent, getInputMode, getInputMovementRate, getJoypadBind, isAimKeyDown, isAllowRun, isAllowSprint, isAnyAimKeyDown, isAttackButtonDown, isBuildButtonDown, isBuildButtonReleased, isChangeCharacterKeyDown, isCrouchButtonPressed, isF12KeyDown, isForceAim, isForceRun, isForceSprint, isIgnoreInputsForDirection, isIgnoringAimingInput, isInputMoveAxisApplied, isInteractButtonClicked, isInteractButtonDown, isInteractButtonPressed, isJoypadButtonsActive, isJoypadIgnoreAimUntilCentered, isManualFloorAtkButtonDown, isMeleeButtonDown, isPrecisionAimKeyDown, isRunButtonDown, isShiftKeyDown, isSprintButtonDown, isWalkToButtonDown, setAllowRun, setAllowSprint, setForceAim, setForceRun, setForceSprint, setIgnoreAimingInput, setIgnoreInputsForDirection, setJoypadBind, setJoypadButtonsActive, setJoypadIgnoreAim, setJoypadIgnoreAimUntilCentered, toggleForceAim, wasRunButtonDown`

  ### Methods inherited from interface zombie.chat.ChatElementOwner

  `getSquare, getX, getY, getZ`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getECSComponentMap, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimatable

  `canTransitionToState, getAnimationRecorder, getUID, isAnimationRecorderActive`

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

  ### Methods inherited from interface [IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html#method-summary "interface in zombie.core.skinnedmodel.visual")

  `isFemale, isZombie`

  ### Methods inherited from interface [ILuaIsoObject](../iso/ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.network.fields.IPositional

  `getX, getY, getZ, isInRange`

  ### Methods inherited from interface zombie.ai.IStateCharacter

  `canBeHitByVehicle, canCurrentStateRagdoll, canSlowDownVehicleWhenHit, hasCurrentState, isCurrentStateAttacking, isCurrentStateMoving`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### RAND\_INJURY

    private static final int RAND\_INJURY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.RAND_INJURY)
  + ### RAND\_DISCOMFORT

    private static final int RAND\_DISCOMFORT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.RAND_DISCOMFORT)
  + ### RAND\_SICK

    private static final int RAND\_SICK

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.RAND_SICK)
  + ### RAND\_ENDURANCE

    private static final int RAND\_ENDURANCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.RAND_ENDURANCE)
  + ### RAND\_IDLE\_EMOTE

    private static final int RAND\_IDLE\_EMOTE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.RAND_IDLE_EMOTE)
  + ### UPDATES\_BETWEEN\_RANDOM\_IDLE\_FIDGETS

    private static final int UPDATES\_BETWEEN\_RANDOM\_IDLE\_FIDGETS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.UPDATES_BETWEEN_RANDOM_IDLE_FIDGETS)
  + ### StrongTraitMaxWeightDelta

    private static final float StrongTraitMaxWeightDelta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.StrongTraitMaxWeightDelta)
  + ### WeakTraitMaxWeightDelta

    private static final float WeakTraitMaxWeightDelta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.WeakTraitMaxWeightDelta)
  + ### FeebleTraitMaxWeightDelta

    private static final float FeebleTraitMaxWeightDelta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.FeebleTraitMaxWeightDelta)
  + ### StoutTraitMaxWeightDelta

    private static final float StoutTraitMaxWeightDelta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.StoutTraitMaxWeightDelta)
  + ### REMOTE\_PLAYER\_PATHFINDER\_SUPPRESS\_MAX\_DIST\_TILES

    private static final int REMOTE\_PLAYER\_PATHFINDER\_SUPPRESS\_MAX\_DIST\_TILES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.REMOTE_PLAYER_PATHFINDER_SUPPRESS_MAX_DIST_TILES)
  + ### IN\_TREES\_INJURY\_INTERVAL\_SECONDS

    private static final float IN\_TREES\_INJURY\_INTERVAL\_SECONDS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.IN_TREES_INJURY_INTERVAL_SECONDS)
  + ### IN\_TREES\_SPEED\_PARK\_RANGER\_MULTIPLIER

    private static final float IN\_TREES\_SPEED\_PARK\_RANGER\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.IN_TREES_SPEED_PARK_RANGER_MULTIPLIER)
  + ### IN\_TREES\_SPEED\_LUMBERJACK\_MULTIPLIER

    private static final float IN\_TREES\_SPEED\_LUMBERJACK\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.IN_TREES_SPEED_LUMBERJACK_MULTIPLIER)
  + ### IN\_TREES\_SPEED\_RUNNING\_MULTIPLIER

    private static final float IN\_TREES\_SPEED\_RUNNING\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.IN_TREES_SPEED_RUNNING_MULTIPLIER)
  + ### physicsDebugRenderer

    public zombie.core.physics.PhysicsDebugRenderer physicsDebugRenderer
  + ### attackType

    private zombie.AttackType attackType
  + ### DEATH\_MUSIC\_NAME

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEATH\_MUSIC\_NAME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.DEATH_MUSIC_NAME)
  + ### isTestAIMode

    public static boolean isTestAIMode
  + ### NoSound

    public static final boolean NoSound

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.NoSound)
  + ### assumedPlayer

    public static int assumedPlayer
  + ### numPlayers

    public static int numPlayers
  + ### MAX

    public static final short MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.MAX)
  + ### players

    public static final [IsoPlayer](IsoPlayer.html "class in zombie.characters")[] players
  + ### instance

    private static [IsoPlayer](IsoPlayer.html "class in zombie.characters") instance
  + ### instanceLock

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") instanceLock
  + ### testHitPosition

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") testHitPosition
  + ### followDeadCount

    private static int followDeadCount
  + ### ignoreAutoVault

    private boolean ignoreAutoVault
  + ### remoteSneakLvl

    public int remoteSneakLvl
  + ### remoteStrLvl

    public int remoteStrLvl
  + ### remoteFitLvl

    public int remoteFitLvl
  + ### moodleCantSprint

    public boolean moodleCantSprint
  + ### tempo

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempo
  + ### tempVector2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2
  + ### coopPvp

    private static boolean coopPvp
  + ### ignoreContextKey

    private boolean ignoreContextKey
  + ### lastRemoteUpdate

    private long lastRemoteUpdate
  + ### luredAnimals

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> luredAnimals
  + ### isLuringAnimals

    public boolean isLuringAnimals
  + ### invPageDirty

    private boolean invPageDirty
  + ### attachedAnimals

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> attachedAnimals
  + ### spottedByPlayer

    public boolean spottedByPlayer
  + ### spottedPlayerTimer

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> spottedPlayerTimer
  + ### extUpdateCount

    private float extUpdateCount
  + ### attackStarted

    private boolean attackStarted
  + ### m\_isoPlayerTriggerWatcher

    private static final zombie.PredicatedFileWatcher m\_isoPlayerTriggerWatcher
  + ### setClothingTriggerWatcher

    private final zombie.PredicatedFileWatcher setClothingTriggerWatcher
  + ### tempVector2\_1

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2\_1
  + ### tempVector2\_2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") tempVector2\_2
  + ### baseVisual

    protected zombie.core.skinnedmodel.visual.BaseVisual baseVisual
  + ### remotePlayerItemVisuals

    protected final [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") remotePlayerItemVisuals
  + ### targetedByZombie

    public boolean targetedByZombie
  + ### lastTargeted

    public float lastTargeted
  + ### timeSinceOpenDoor

    public float timeSinceOpenDoor
  + ### timeSinceCloseDoor

    public float timeSinceCloseDoor
  + ### remote

    public boolean remote
  + ### timeSinceLastNetData

    private int timeSinceLastNetData
  + ### role

    public [Role](Role.html "class in zombie.characters") role
  + ### tagPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagPrefix
  + ### showTag

    public boolean showTag
  + ### factionPvp

    public boolean factionPvp
  + ### onlineId

    public short onlineId
  + ### onlineChunkGridWidth

    public int onlineChunkGridWidth
  + ### joypadIgnoreChargingRt

    public boolean joypadIgnoreChargingRt
  + ### mpTorchCone

    public boolean mpTorchCone
  + ### mpTorchDist

    public float mpTorchDist
  + ### mpTorchStrength

    public float mpTorchStrength
  + ### playerIndex

    public int playerIndex
  + ### serverPlayerIndex

    public int serverPlayerIndex
  + ### useChargeDelta

    public float useChargeDelta
  + ### contextPanic

    public float contextPanic
  + ### numNearbyBuildingsRooms

    public float numNearbyBuildingsRooms
  + ### isCharging

    public boolean isCharging
  + ### isChargingLt

    public boolean isChargingLt
  + ### lookingWhileInVehicle

    private boolean lookingWhileInVehicle
  + ### climbOverWallSuccess

    private boolean climbOverWallSuccess
  + ### climbOverWallStruggle

    private boolean climbOverWallStruggle
  + ### justMoved

    private boolean justMoved
  + ### maxWeightDelta

    public float maxWeightDelta
  + ### currentSpeed

    public float currentSpeed
  + ### deathFinished

    public boolean deathFinished
  + ### isSpeek

    public boolean isSpeek
  + ### isVoiceMute

    public boolean isVoiceMute
  + ### playerMoveDir

    public final [Vector2](../iso/Vector2.html "class in zombie.iso") playerMoveDir
  + ### soundListener

    public fmod.fmod.BaseSoundListener soundListener
  + ### username

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username
  + ### dirtyRecalcGridStack

    public boolean dirtyRecalcGridStack
  + ### dirtyRecalcGridStackTime

    public float dirtyRecalcGridStackTime
  + ### runningTime

    public float runningTime
  + ### timePressedContext

    public float timePressedContext
  + ### chargeTime

    public float chargeTime
  + ### useChargeTime

    private float useChargeTime
  + ### pressContext

    private boolean pressContext
  + ### letGoAfterContextIsReleased

    private boolean letGoAfterContextIsReleased
  + ### closestZombie

    public float closestZombie
  + ### lastAngle

    public final [Vector2](../iso/Vector2.html "class in zombie.iso") lastAngle
  + ### saveFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveFileName
  + ### bannedAttacking

    public boolean bannedAttacking
  + ### sqlId

    public int sqlId
  + ### clearSpottedTimer

    protected int clearSpottedTimer
  + ### timeSinceLastStab

    protected float timeSinceLastStab
  + ### lastSpotted

    protected [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> lastSpotted
  + ### changeCharacterDebounce

    protected boolean changeCharacterDebounce
  + ### followId

    protected int followId
  + ### followCamStack

    protected final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")> followCamStack
  + ### seenThisFrame

    protected boolean seenThisFrame
  + ### couldBeSeenThisFrame

    protected boolean couldBeSeenThisFrame
  + ### asleepTime

    protected float asleepTime
  + ### spottedList

    protected final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> spottedList
  + ### ticksSinceSeenZombie

    protected int ticksSinceSeenZombie
  + ### waiting

    protected boolean waiting
  + ### dragCharacter

    protected [IsoSurvivor](IsoSurvivor.html "class in zombie.characters") dragCharacter
  + ### heartDelay

    protected float heartDelay
  + ### heartDelayMax

    protected float heartDelayMax
  + ### aimingWeaponAnimation

    protected boolean aimingWeaponAnimation
  + ### heartEventInstance

    protected long heartEventInstance
  + ### dialogMood

    protected int dialogMood
  + ### ping

    protected int ping
  + ### dragObject

    protected [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") dragObject
  + ### lastSeenZombieTime

    private double lastSeenZombieTime
  + ### checkSafehouse

    private int checkSafehouse
  + ### attackFromBehind

    private boolean attackFromBehind
  + ### hypothermiaCache

    private int hypothermiaCache
  + ### hyperthermiaCache

    private int hyperthermiaCache
  + ### ticksSincePressedMovement

    private float ticksSincePressedMovement
  + ### flickTorch

    private boolean flickTorch
  + ### checkNearbyRooms

    private float checkNearbyRooms
  + ### useVehicle

    private boolean useVehicle
  + ### usedVehicle

    private boolean usedVehicle
  + ### tempVector3f

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f
  + ### templwjglVector3f

    private static final org.lwjgl.util.vector.Vector3f templwjglVector3f
  + ### inputState

    private final [IsoPlayer.InputState](IsoPlayer.InputState.html "class in zombie.characters") inputState
  + ### isWearingNightVisionGoggles

    private boolean isWearingNightVisionGoggles
  + ### moveSpeed

    private float moveSpeed
  + ### offSetXUi

    private int offSetXUi
  + ### offSetYUi

    private int offSetYUi
  + ### combatSpeed

    private float combatSpeed
  + ### hoursSurvived

    private double hoursSurvived
  + ### isAuthorizedHandToHandAction

    private boolean isAuthorizedHandToHandAction
  + ### isAuthorizedHandToHand

    private boolean isAuthorizedHandToHand
  + ### blockMovement

    private boolean blockMovement
  + ### nutrition

    private [Nutrition](BodyDamage/Nutrition.html "class in zombie.characters.BodyDamage") nutrition
  + ### fitness

    private [Fitness](BodyDamage/Fitness.html "class in zombie.characters.BodyDamage") fitness
  + ### forceOverrideAnim

    private boolean forceOverrideAnim
  + ### initiateAttack

    private boolean initiateAttack
  + ### tagColor

    private final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tagColor
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### seeNonPvpZone

    private boolean seeNonPvpZone
  + ### seeDesignationZone

    private boolean seeDesignationZone
  + ### selectedZonesForHighlight

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> selectedZonesForHighlight
  + ### selectedZoneForHighlight

    private [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") selectedZoneForHighlight
  + ### mechanicsItem

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"),[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> mechanicsItem
  + ### sleepingPillsTaken

    private int sleepingPillsTaken
  + ### lastPillsTaken

    private long lastPillsTaken
  + ### heavyBreathInstance

    private long heavyBreathInstance
  + ### heavyBreathSoundName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") heavyBreathSoundName
  + ### allChatMuted

    private boolean allChatMuted
  + ### multiplayer

    private final boolean multiplayer
  + ### saveFileIp

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveFileIp
  + ### vehicle4testCollision

    protected [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle4testCollision
  + ### steamId

    private long steamId
  + ### vehicleContainerData

    private final [IsoPlayer.VehicleContainerData](IsoPlayer.VehicleContainerData.html "class in zombie.characters") vehicleContainerData
  + ### isWalking

    private boolean isWalking
  + ### footInjuryTimer

    private float footInjuryTimer
  + ### inTreesInjuryTimer

    private float inTreesInjuryTimer
  + ### turnDelta

    private float turnDelta
  + ### isPlayerMoving

    protected boolean isPlayerMoving
  + ### walkSpeed

    private float walkSpeed
  + ### walkInjury

    private float walkInjury
  + ### runSpeed

    private float runSpeed
  + ### idleSpeed

    private float idleSpeed
  + ### deltaX

    private float deltaX
  + ### deltaY

    private float deltaY
  + ### windspeed

    private float windspeed
  + ### windForce

    private float windForce
  + ### ipX

    private float ipX
  + ### ipY

    private float ipY
  + ### drunkDelayCommandTimer

    private float drunkDelayCommandTimer
  + ### pressedRunTimer

    private float pressedRunTimer
  + ### pressedRun

    private boolean pressedRun
  + ### meleePressed

    private boolean meleePressed
  + ### grapplePressed

    private boolean grapplePressed
  + ### canLetGoOfGrappled

    private boolean canLetGoOfGrappled
  + ### lastAttackWasHandToHand

    private boolean lastAttackWasHandToHand
  + ### isPerformingAnAction

    private boolean isPerformingAnAction
  + ### alreadyReadBook

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> alreadyReadBook
  + ### bleedingLevel

    public byte bleedingLevel
  + ### musicIntensityEvents

    private final [MusicIntensityEvents](../audio/MusicIntensityEvents.html "class in zombie.audio") musicIntensityEvents
  + ### musicThreatStatuses

    private final [MusicThreatStatuses](../audio/MusicThreatStatuses.html "class in zombie.audio") musicThreatStatuses
  + ### musicIntensityInside

    private final boolean musicIntensityInside

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.musicIntensityInside)
  + ### isFarming

    private boolean isFarming
  + ### attackVariationX

    private float attackVariationX
  + ### attackVariationY

    private float attackVariationY
  + ### accessLevel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") accessLevel
  + ### hasObstacleOnPath

    private boolean hasObstacleOnPath
  + ### timedActionToRetrigger

    private [LuaTimedActionNew](CharacterTimedActions/LuaTimedActionNew.html "class in zombie.characters.CharacterTimedActions") timedActionToRetrigger
  + ### pathfindRun

    private boolean pathfindRun
  + ### s\_targetsProne

    private static final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<zombie.network.fields.hit.HitInfo> s\_targetsProne
  + ### s\_targetsStanding

    private static final [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<zombie.network.fields.hit.HitInfo> s\_targetsStanding
  + ### contextualActions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.ContextualAction> contextualActions
  + ### weaponT

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weaponT
  + ### parameterCharacterMoving

    private final zombie.audio.parameters.ParameterCharacterMoving parameterCharacterMoving
  + ### parameterCharacterMovementSpeed

    private final zombie.audio.parameters.ParameterCharacterMovementSpeed parameterCharacterMovementSpeed
  + ### parameterCharacterOnFire

    private final zombie.audio.parameters.ParameterCharacterOnFire parameterCharacterOnFire
  + ### parameterCharacterVoiceType

    private final zombie.audio.parameters.ParameterCharacterVoiceType parameterCharacterVoiceType
  + ### parameterCharacterVoicePitch

    private final zombie.audio.parameters.ParameterCharacterVoicePitch parameterCharacterVoicePitch
  + ### parameterDeaf

    private final zombie.audio.parameters.ParameterDeaf parameterDeaf
  + ### parameterDragMaterial

    private final zombie.audio.parameters.ParameterDragMaterial parameterDragMaterial
  + ### parameterElevation

    private final zombie.audio.parameters.ParameterElevation parameterElevation
  + ### parameterEquippedBaggageContainer

    private final zombie.audio.parameters.ParameterEquippedBaggageContainer parameterEquippedBaggageContainer
  + ### parameterExercising

    private final zombie.audio.parameters.ParameterExercising parameterExercising
  + ### parameterFirearmDistance

    private final zombie.audio.parameters.ParameterFirearmDistance parameterFirearmDistance
  + ### parameterFirearmInside

    private final zombie.audio.parameters.ParameterFirearmInside parameterFirearmInside
  + ### parameterFirearmRoomSize

    private final zombie.audio.parameters.ParameterFirearmRoomSize parameterFirearmRoomSize
  + ### parameterFootstepMaterial

    private final zombie.audio.parameters.ParameterFootstepMaterial parameterFootstepMaterial
  + ### parameterFootstepMaterial2

    private final zombie.audio.parameters.ParameterFootstepMaterial2 parameterFootstepMaterial2
  + ### parameterIsStashTile

    private final zombie.audio.parameters.ParameterIsStashTile parameterIsStashTile
  + ### parameterLocalPlayer

    private final zombie.audio.parameters.ParameterLocalPlayer parameterLocalPlayer
  + ### parameterMeleeHitSurface

    private final zombie.audio.parameters.ParameterMeleeHitSurface parameterMeleeHitSurface
  + ### parameterOverlapFoliageType

    private final zombie.audio.parameters.ParameterOverlapFoliageType parameterOverlapFoliageType
  + ### parameterPlayerHealth

    private final zombie.audio.parameters.ParameterPlayerHealth parameterPlayerHealth
  + ### parameterVehicleHitLocation

    private final zombie.audio.parameters.ParameterVehicleHitLocation parameterVehicleHitLocation
  + ### parameterShoeType

    private final zombie.audio.parameters.ParameterShoeType parameterShoeType
  + ### parameterMoodles

    private [ParameterMoodles](../audio/parameters/ParameterMoodles.html "class in zombie.audio.parameters") parameterMoodles
  + ### grapplerGruntChance

    private final [IsoPlayer.GrapplerGruntChance](IsoPlayer.GrapplerGruntChance.html "class in zombie.characters") grapplerGruntChance
  + ### updateAimingVectorParams

    private final zombie.core.physics.BallisticsController.AimingVectorParameters updateAimingVectorParams
  + ### craftHistory

    private final [PlayerCraftHistory](PlayerCraftHistory.html "class in zombie.characters") craftHistory
  + ### autoDrink

    public boolean autoDrink
  + ### lastCheatToggleMillis

    private long lastCheatToggleMillis
  + ### NETWORK\_SPEED\_MUL\_MIN

    protected static final float NETWORK\_SPEED\_MUL\_MIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.NETWORK_SPEED_MUL_MIN)
  + ### NETWORK\_SPEED\_MUL\_MAX

    protected static final float NETWORK\_SPEED\_MUL\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.NETWORK_SPEED_MUL_MAX)
  + ### NETWORK\_SPEED\_SMOOTH\_START

    protected static final float NETWORK\_SPEED\_SMOOTH\_START

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.NETWORK_SPEED_SMOOTH_START)
  + ### NETWORK\_SPEED\_SMOOTH\_END

    protected static final float NETWORK\_SPEED\_SMOOTH\_END

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.NETWORK_SPEED_SMOOTH_END)
  + ### RecentlyRemoved

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](IsoPlayer.html "class in zombie.characters")> RecentlyRemoved
  + ### s\_moveVars

    private static final [IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters") s\_moveVars
  + ### drunkMoveVars

    private final [IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters") drunkMoveVars
  + ### attackAnimThrowTimer

    private long attackAnimThrowTimer
* Constructor Details
  -------------------

  + ### IsoPlayer

    public IsoPlayer([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell)
  + ### IsoPlayer

    public IsoPlayer([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    int x,
    int y,
    int z,
    boolean isAnimal)
  + ### IsoPlayer

    public IsoPlayer([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    int x,
    int y,
    int z)
* Method Details
  --------------

  + ### registerECSComponents

    public void registerECSComponents()

    Specified by:
    :   `registerECSComponents` in interface `zombie.characters.ecs.ECSEntity`

    Overrides:
    :   `registerECSComponents` in class `IsoGameCharacter`
  + ### setOnlineID

    public void setOnlineID(short value)
  + ### registerVariableCallbacks

    private void registerVariableCallbacks()
  + ### registerAnimEventCallbacks

    private void registerAnimEventCallbacks()
  + ### onGrappleEnded

    private void onGrappleEnded()
  + ### OnAnimEvent\_GrapplerPlayRandomGrunt

    private void OnAnimEvent\_GrapplerPlayRandomGrunt([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gruntSoundList)
  + ### getDeferredMovement

    protected [Vector2](../iso/Vector2.html "class in zombie.iso") getDeferredMovement([Vector2](../iso/Vector2.html "class in zombie.iso") result,
    boolean reset)

    Overrides:
    :   `getDeferredMovement` in class `IsoGameCharacter`
  + ### getTurnDelta

    public float getTurnDelta()

    Overrides:
    :   `getTurnDelta` in class `IsoGameCharacter`
  + ### setPerformingAnAction

    public void setPerformingAnAction(boolean val)
  + ### isPerformingAnAction

    public boolean isPerformingAnAction()
  + ### isAttacking

    public boolean isAttacking()

    Overrides:
    :   `isAttacking` in class `IsoGameCharacter`
  + ### shouldBeTurning

    public boolean shouldBeTurning()

    Overrides:
    :   `shouldBeTurning` in class `IsoGameCharacter`
  + ### invokeOnPlayerInstance

    public static void invokeOnPlayerInstance([Runnable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Runnable.html "class or interface in java.lang") callback)

    The IsoPlayer.instance thread-safe invoke.
    Calls the supplied callback if the IsoPlayer.instance is non-null.
    Performs this in a thread-safe manner.

    It is intended that, should any thread intend to use the IsoPlayer.instance, and does not want another thread
    to change the ptr in the meanwhile, it should call invokeOnPlayerInstance(Runnable callback)

    eg.
    IsoPlayer.invokeOnPlayerInstance(()-> {
    IsoPlayer.instance.doStuff();
    })
  + ### getInstance

    public static [IsoPlayer](IsoPlayer.html "class in zombie.characters") getInstance()
  + ### setInstance

    public static void setInstance([IsoPlayer](IsoPlayer.html "class in zombie.characters") newInstance)
  + ### hasInstance

    public static boolean hasInstance()
  + ### onTrigger\_ResetIsoPlayerModel

    private static void onTrigger\_ResetIsoPlayerModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") entryKey)
  + ### getFollowDeadCount

    public static int getFollowDeadCount()
  + ### setFollowDeadCount

    public static void setFollowDeadCount(int aFollowDeadCount)
  + ### getAllFileNames

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllFileNames()
  + ### getUniqueFileName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUniqueFileName()
  + ### getAllSavedPlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](IsoPlayer.html "class in zombie.characters")> getAllSavedPlayers()
  + ### isServerPlayerIDValid

    public static boolean isServerPlayerIDValid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPlayerIndex

    public static int getPlayerIndex()
  + ### getPlayer

    public static [IsoPlayer](IsoPlayer.html "class in zombie.characters") getPlayer(int playerIndex)
  + ### getPlayerIndex

    public static int getPlayerIndex([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
  + ### visitAllPlayers

    public static void visitAllPlayers([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[IsoPlayer](IsoPlayer.html "class in zombie.characters")> visitor)
  + ### findPlayer

    public static <C> [IsoPlayer](IsoPlayer.html "class in zombie.characters") findPlayer(C compareParam,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoPlayer](IsoPlayer.html "class in zombie.characters"), C> predicate)
  + ### anyPlayer

    public static <C> boolean anyPlayer(C compareParam,
    [BiPredicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiPredicate.html "class or interface in java.util.function")<[IsoPlayer](IsoPlayer.html "class in zombie.characters"), C> predicate)
  + ### visitAllPlayersWithComponent

    public static <ComponentType extends [ECSComponent](ecs/ECSComponent.html "class in zombie.characters.ecs")>
    void visitAllPlayersWithComponent([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<ComponentType> componentClass,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[IsoPlayer](IsoPlayer.html "class in zombie.characters"), ComponentType> visitor)
  + ### getIndex

    public final int getIndex()
  + ### getPlayerNum

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public final int getPlayerNum()

    Deprecated.

    Duplicate method. Please use [`getIndex()`](#getIndex())
  + ### allPlayersDead

    public static boolean allPlayersDead()
  + ### getPlayers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer](IsoPlayer.html "class in zombie.characters")> getPlayers()
  + ### allPlayersAsleep

    public static boolean allPlayersAsleep()
  + ### getCoopPVP

    public static boolean getCoopPVP()
  + ### setCoopPVP

    public static void setCoopPVP(boolean enabled)
  + ### TestAnimalSpotPlayer

    public void TestAnimalSpotPlayer([IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") chr)
  + ### TestZombieSpotPlayer

    public void TestZombieSpotPlayer([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") chr)
  + ### getPathSpeed

    public float getPathSpeed()
  + ### isGhostMode

    public boolean isGhostMode()
  + ### setGhostMode

    public void setGhostMode(boolean aGhostMode,
    boolean isForced)
  + ### setGhostMode

    public void setGhostMode(boolean aGhostMode)
  + ### isSeeEveryone

    public boolean isSeeEveryone()
  + ### moveUnmodded

    public void moveUnmodded(float dirX,
    float dirY)

    Overrides:
    :   `moveUnmodded` in class `IsoMovingObject`
  + ### nullifyAiming

    public void nullifyAiming()
  + ### initializeStates

    private void initializeStates()
  + ### onAnimPlayerCreated

    protected void onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)

    Overrides:
    :   `onAnimPlayerCreated` in class `IsoGameCharacter`
  + ### GetAnimSetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetAnimSetName()

    Specified by:
    :   `GetAnimSetName` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`

    Overrides:
    :   `GetAnimSetName` in class `IsoGameCharacter`
  + ### IsInMeleeAttack

    public boolean IsInMeleeAttack()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoGameCharacter`

    Throws:
    :   `IOException`
  + ### setExtraInfoFlags

    public void setExtraInfoFlags(byte flags,
    boolean isForced)
  + ### getExtraInfoFlags

    public byte getExtraInfoFlags()
  + ### calculateShowAdminTag

    public boolean calculateShowAdminTag()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separatorStr)

    Overrides:
    :   `getDescription` in class `IsoGameCharacter`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoGameCharacter`

    Throws:
    :   `IOException`
  + ### save

    public void save()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadChange

    public void loadChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `loadChange` in class `IsoGameCharacter`
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoGameCharacter`
  + ### UpdateRemovedEmitters

    public static void UpdateRemovedEmitters()
  + ### Reset

    public static void Reset()
  + ### setVehicle4TestCollision

    public void setVehicle4TestCollision([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### isSaveFileInUse

    public boolean isSaveFileInUse()
  + ### removeSaveFile

    public void removeSaveFile()
  + ### isSaveFileIPValid

    public boolean isSaveFileIPValid()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoMovingObject`
  + ### getScreenChestHeight

    public float getScreenChestHeight()
  + ### getAimVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAimVector([Vector2](../iso/Vector2.html "class in zombie.iso") vec)
  + ### calculateAimVector

    private [Vector2](../iso/Vector2.html "class in zombie.iso") calculateAimVector([Vector2](../iso/Vector2.html "class in zombie.iso") vec)
  + ### getGlobalMovementMod

    public float getGlobalMovementMod(boolean bDoNoises)

    Overrides:
    :   `getGlobalMovementMod` in class `IsoGameCharacter`
  + ### doTreeNoises

    protected void doTreeNoises()

    Overrides:
    :   `doTreeNoises` in class `IsoMovingObject`
  + ### isInTrees2

    public boolean isInTrees2(boolean ignoreBush)

    Overrides:
    :   `isInTrees2` in class `IsoGameCharacter`
  + ### getMoveSpeed

    public float getMoveSpeed()
  + ### setMoveSpeed

    public void setMoveSpeed(float moveSpeed)
  + ### getTorchStrength

    public float getTorchStrength()

    Overrides:
    :   `getTorchStrength` in class `IsoGameCharacter`
  + ### getInvAimingMod

    public float getInvAimingMod()
  + ### getAimingMod

    public float getAimingMod()
  + ### getReloadingMod

    public float getReloadingMod()
  + ### getAimingRangeMod

    public float getAimingRangeMod()
  + ### isPathfindRunning

    public boolean isPathfindRunning()
  + ### setPathfindRunning

    public void setPathfindRunning(boolean newvalue)
  + ### isBannedAttacking

    public boolean isBannedAttacking()
  + ### setBannedAttacking

    public void setBannedAttacking(boolean b)
  + ### getInvAimingRangeMod

    public float getInvAimingRangeMod()
  + ### updateCursorVisibility

    private void updateCursorVisibility()
  + ### renderAttachedAnimalRopes

    private void renderAttachedAnimalRopes()
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
    :   `render` in class `IsoGameCharacter`
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `IsoGameCharacter`
  + ### postHitByVehicleUpdateStance

    protected void postHitByVehicleUpdateStance(float speed,
    boolean knockDownAllowed)

    Update our reaction stance after a vehicle impact.   
    Set the appropriate flags, such as knockedDown, etc.   
    Note: Only on clients and single-player. The server does not do these.

    Overrides:
    :   `postHitByVehicleUpdateStance` in class `IsoGameCharacter`
  + ### setIgnoreMovement

    public void setIgnoreMovement(boolean ignoreMovement)

    Overrides:
    :   `setIgnoreMovement` in class `IsoGameCharacter`
  + ### onHitByVehicleApplyDamage

    public float onHitByVehicleApplyDamage([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float impactSpeed)

    Overrides:
    :   `onHitByVehicleApplyDamage` in class `IsoGameCharacter`
  + ### applyDamageFromVehicleHit

    public void applyDamageFromVehicleHit([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float vehicleSpeed,
    float damage)

    Overrides:
    :   `applyDamageFromVehicleHit` in class `IsoGameCharacter`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoGameCharacter`
  + ### updateInternal1

    private void updateInternal1()
  + ### setBeenMovingSprinting

    private void setBeenMovingSprinting()
  + ### updateInternal2

    private boolean updateInternal2()
  + ### setNpc

    public void setNpc(boolean isNpc)
  + ### handleLandingImpact

    protected void handleLandingImpact(zombie.characters.FallDamage fallDamage)

    Overrides:
    :   `handleLandingImpact` in class `IsoGameCharacter`
  + ### playPainVoicesFromFallDamage

    protected void playPainVoicesFromFallDamage(zombie.characters.FallDamage fallDamage)

    Overrides:
    :   `playPainVoicesFromFallDamage` in class `IsoGameCharacter`
  + ### setDoGrappleLetGoAfterContextKeyIsReleased

    private void setDoGrappleLetGoAfterContextKeyIsReleased(boolean letGoAfterContextIsReleased)
  + ### isDoGrappleLetGoAfterContextKeyIsReleased

    private boolean isDoGrappleLetGoAfterContextKeyIsReleased()
  + ### updateMovementFromInput

    private void updateMovementFromInput([IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters") moveVars)
  + ### resolveStrafeDirectionFromPath

    private void resolveStrafeDirectionFromPath([Vector2](../iso/Vector2.html "class in zombie.iso") playerMoveDir)
  + ### randomizeDrunkenMovement

    private void randomizeDrunkenMovement([IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters") moveVars,
    boolean isController)
  + ### adjustMovementForDrunks

    private void adjustMovementForDrunks([IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters") moveVars,
    boolean isController)

    Adjusts player movement when drunk, adding an input update delay timer and
    drifting the angle. Also checks for trips while running or sprinting.
  + ### updateAimingStance

    private void updateAimingStance()
  + ### calculateStats

    protected void calculateStats()

    Overrides:
    :   `calculateStats` in class `IsoGameCharacter`
  + ### updateStats\_Sleeping

    protected void updateStats\_Sleeping()

    Updates the player's stats while asleep

    Overrides:
    :   `updateStats_Sleeping` in class `IsoGameCharacter`
  + ### processWakingUp

    public void processWakingUp()
  + ### updateEnduranceWhileSitting

    public void updateEnduranceWhileSitting()
  + ### updateEnduranceWhileInVehicle

    public void updateEnduranceWhileInVehicle()
  + ### updateEndurance

    private void updateEndurance()
  + ### checkActionsBlockingMovement

    private boolean checkActionsBlockingMovement()
  + ### updateInteractKeyPanic

    private void updateInteractKeyPanic()
  + ### updateSneakKey

    private void updateSneakKey()
  + ### updateChangeCharacterKey

    private void updateChangeCharacterKey()
  + ### updateEnableModelsKey

    private void updateEnableModelsKey()
  + ### updateDeathDragDown

    private void updateDeathDragDown()
  + ### updateGodModeKey

    private void updateGodModeKey()
  + ### checkReloading

    private void checkReloading()
  + ### postupdate

    public void postupdate()

    Overrides:
    :   `postupdate` in class `IsoGameCharacter`
  + ### postupdateInternal

    private void postupdateInternal()
  + ### isSolidForSeparate

    public boolean isSolidForSeparate()

    Overrides:
    :   `isSolidForSeparate` in class `IsoMovingObject`
  + ### isPushableForSeparate

    public boolean isPushableForSeparate()

    Overrides:
    :   `isPushableForSeparate` in class `IsoMovingObject`
  + ### isPushedByForSeparate

    public boolean isPushedByForSeparate([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other)

    Overrides:
    :   `isPushedByForSeparate` in class `IsoGameCharacter`
  + ### updateExt

    private void updateExt()

    Throw a random idle animations if you're alone invalid input: '&' idle
    Cap it to not throw it too much time in a row
  + ### onIdlePerformFidgets

    private void onIdlePerformFidgets()

    We're currently idle, do some emoting or fidgeting, depending on the state of our injuries, environment, and our mentality.
  + ### updateUseKey

    private boolean updateUseKey()
  + ### clearUseKeyVariables

    private void clearUseKeyVariables()
  + ### updateSoundListener

    private void updateSoundListener()
  + ### updateMovementRates

    public void updateMovementRates()

    Overrides:
    :   `updateMovementRates` in class `IsoGameCharacter`
  + ### calculateWalkSpeed

    protected void calculateWalkSpeed()

    Overrides:
    :   `calculateWalkSpeed` in class `IsoGameCharacter`
  + ### pressedAttack

    public void pressedAttack()
  + ### setAttackVariationX

    public void setAttackVariationX(float attackVariationX)
  + ### getAttackVariationX

    private float getAttackVariationX()
  + ### setAttackVariationY

    public void setAttackVariationY(float attackVariationY)
  + ### getAttackVariationY

    private float getAttackVariationY()
  + ### canPerformHandToHandCombat

    public boolean canPerformHandToHandCombat()

    Can't shove or grapple if holding items in each hand (not weapon obv)

    Returns:
    :   FALSE if the character currently has a non-weapon item in both hands.
  + ### clearHandToHandAttack

    public void clearHandToHandAttack()

    Overrides:
    :   `clearHandToHandAttack` in class `zombie.characters.IsoLivingCharacter`
  + ### setAttackAnimThrowTimer

    public void setAttackAnimThrowTimer(long dt)
  + ### isAttackAnimThrowTimeOut

    public boolean isAttackAnimThrowTimeOut()
  + ### isAiming

    public boolean isAiming()

    Specified by:
    :   `isAiming` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isAiming` in class `IsoGameCharacter`

    Returns:
    :   TRUE if this player is within their Attack Throw TimeOut. ([`isAttackAnimThrowTimeOut()`](#isAttackAnimThrowTimeOut()) returns TRUE)   
          
        FALSE if this is a local player on a client and MultiplayerAttackPlayer debug variable is set.   
          
        Otherwise, returns the value of [`IsoGameCharacter.isAiming()`](IsoGameCharacter.html#isAiming()).
  + ### getWeaponType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWeaponType()
  + ### setWeaponType

    private void setWeaponType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### calculateCritChance

    public int calculateCritChance([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target)
  + ### isAimControlActive

    public boolean isAimControlActive()
  + ### isGettingUp

    public boolean isGettingUp()

    Overrides:
    :   `isGettingUp` in class `IsoMovingObject`
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()

    Overrides:
    :   `getMinimumSimulationLevel` in class `IsoGameCharacter`
  + ### allowsTwist

    public boolean allowsTwist()

    Specified by:
    :   `allowsTwist` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `allowsTwist` in class `IsoGameCharacter`
  + ### getInputMoveVector

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getInputMoveVector([Vector2](../iso/Vector2.html "class in zombie.iso") out)

    Specified by:
    :   `getInputMoveVector` in interface `zombie.characters.CharacterInputComponentEntity`
  + ### UpdateInputState

    private void UpdateInputState([IsoPlayer.InputState](IsoPlayer.InputState.html "class in zombie.characters") inputState)
  + ### getClosestTo

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getClosestTo([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") closestTo)
  + ### hitConsequences

    public void hitConsequences([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean bIgnoreDamage,
    float damage,
    boolean bRemote)

    Overrides:
    :   `hitConsequences` in class `IsoGameCharacter`
  + ### getWeapon

    private [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") getWeapon()
  + ### updateMechanicsItems

    private void updateMechanicsItems()

    Remove items that has been changed too long ago You can gain exp from
    changing a part only every 24h on the same part
  + ### enterExitVehicle

    private void enterExitVehicle()
  + ### checkActionGroup

    public void checkActionGroup()
  + ### getUseableVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getUseableVehicle()
  + ### isBetterBestSeat

    private boolean isBetterBestSeat([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle1,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle2)
  + ### isNearVehicle

    public boolean isNearVehicle()
  + ### getNearVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getNearVehicle()

    Overrides:
    :   `getNearVehicle` in class `IsoGameCharacter`
  + ### updateWhileInVehicle

    private void updateWhileInVehicle()
  + ### attackWhileInVehicle

    private void attackWhileInVehicle()
  + ### setAngleFromAim

    public void setAngleFromAim()
  + ### updateTorchStrength

    private void updateTorchStrength()
  + ### calculateContext

    public void calculateContext()
  + ### isSafeToClimbOver

    public boolean isSafeToClimbOver([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### canPlaceCorpseOnSquare

    public boolean canPlaceCorpseOnSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### canThrowCorpseOver

    public boolean canThrowCorpseOver([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") fromSq,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### canThrowCorpseOver

    public boolean canThrowCorpseOver([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### addContextualAction

    private void addContextualAction(zombie.characters.ContextualAction.Action action,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### addContextualAction

    private void addContextualAction(zombie.characters.ContextualAction.Action action,
    zombie.util.lambda.Invokers.Params1.ICallback<zombie.characters.ContextualAction> populator)
  + ### pickBestContextualAction

    private zombie.characters.ContextualAction pickBestContextualAction([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.ContextualAction> contextualActions)
  + ### performContextualAction

    private void performContextualAction(zombie.characters.ContextualAction ca)
  + ### doContext

    public boolean doContext()
  + ### doContextNSWE

    private boolean doContextNSWE([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextRestOnFurniture

    private boolean doContextRestOnFurniture([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextAnimalInteraction

    private boolean doContextAnimalInteraction([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextButcherHook

    private boolean doContextButcherHook([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextHutch

    private boolean doContextHutch([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextToggleCurtain

    private boolean doContextToggleCurtain([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextClimbSheetRope

    private boolean doContextClimbSheetRope([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextHopOverFence

    private boolean doContextHopOverFence([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextThrowGrappledTargetOverFence

    private boolean doContextThrowGrappledTargetOverFence([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextCorners

    private boolean doContextCorners([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### getContextDoorOrWindowOrWindowFrame

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getContextDoorOrWindowOrWindowFrame([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir)
  + ### doContextDoorOrWindowOrWindowFrame

    private boolean doContextDoorOrWindowOrWindowFrame([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") o)
  + ### doContextWindowFrame

    private boolean doContextWindowFrame([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoWindowFrame](../iso/objects/IsoWindowFrame.html "class in zombie.iso.objects") o,
    boolean bTopOfSheetRope)
  + ### doContextThumpableWindow

    private boolean doContextThumpableWindow([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") d,
    boolean bTopOfSheetRope)
  + ### doContextWindow

    private boolean doContextWindow([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") d,
    boolean bTopOfSheetRope)
  + ### doContextThrowGrappledTargetOutWindow

    private boolean doContextThrowGrappledTargetOutWindow([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") windowObject)
  + ### doContextThrowGrappledTargetOverFence

    private boolean doContextThrowGrappledTargetOverFence([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") hoppable)
  + ### doContextThrowGrappledTargetIntoInventory

    private boolean doContextThrowGrappledTargetIntoInventory([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### doContextThrowGrappledTargetIntoInventory

    private boolean doContextThrowGrappledTargetIntoInventory([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") targetContainer)
  + ### doContextThumpableDoor

    private boolean doContextThumpableDoor([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") d)
  + ### doContextDoor

    private boolean doContextDoor([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") assumedDir,
    [IsoDoor](../iso/objects/IsoDoor.html "class in zombie.iso.objects") d)
  + ### hopFence

    public boolean hopFence([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean bTest)
  + ### canClimbOverWall

    public boolean canClimbOverWall([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### doContextClimbOverWall

    public boolean doContextClimbOverWall([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### climbOverWall

    public boolean climbOverWall([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### updateSleepingPillsTaken

    private void updateSleepingPillsTaken()
  + ### AttemptAttack

    public boolean AttemptAttack()
  + ### DoAttack

    public boolean DoAttack(float chargeDelta)

    Overrides:
    :   `DoAttack` in class `zombie.characters.IsoLivingCharacter`
  + ### DoAttack

    public boolean DoAttack(float chargeDelta,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound)
  + ### updateLOS

    public void updateLOS()
  + ### checkSpottedPLayerTimer

    private boolean checkSpottedPLayerTimer([IsoPlayer](IsoPlayer.html "class in zombie.characters") remoteChr)
  + ### calculateMaxDist

    private float calculateMaxDist()
  + ### checkCanSeeClient

    public boolean checkCanSeeClient(zombie.core.raknet.UdpConnection remoteConnection)
  + ### checkCanSeeClient

    public boolean checkCanSeeClient([IsoPlayer](IsoPlayer.html "class in zombie.characters") remoteChr)
  + ### getTimeSurvived

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTimeSurvived()
  + ### IsUsingAimWeapon

    public boolean IsUsingAimWeapon()
  + ### IsUsingAimHandWeapon

    private boolean IsUsingAimHandWeapon()
  + ### DoAimAnimOnAiming

    private boolean DoAimAnimOnAiming()
  + ### getSleepingPillsTaken

    public int getSleepingPillsTaken()
  + ### setSleepingPillsTaken

    public void setSleepingPillsTaken(int sleepingPillsTaken)

    If you've take more than 10 sleeping pills you lose some health If you're
    drunk, 1 pills = 2
  + ### resetSleepingPillsTaken

    public void resetSleepingPillsTaken()
  + ### isOutside

    public boolean isOutside()

    Specified by:
    :   `isOutside` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isOutside` in class `IsoGameCharacter`
  + ### getLastSeenZomboidTime

    public double getLastSeenZomboidTime()
  + ### getPlayerClothingTemperature

    public float getPlayerClothingTemperature()
  + ### getPlayerClothingInsulation

    public float getPlayerClothingInsulation()
  + ### getActiveLightItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getActiveLightItem()
  + ### isTorchCone

    public boolean isTorchCone()
  + ### getTorchDot

    public float getTorchDot()
  + ### getLightDistance

    public float getLightDistance()
  + ### pressedMovement

    public boolean pressedMovement(boolean ignoreBlock)
  + ### pressedCancelAction

    public boolean pressedCancelAction()
  + ### checkWalkTo

    public boolean checkWalkTo()
  + ### pressedAim

    public boolean pressedAim()
  + ### isDoingActionThatCanBeCancelled

    public boolean isDoingActionThatCanBeCancelled()

    Specified by:
    :   `isDoingActionThatCanBeCancelled` in interface `zombie.ai.IStateCharacter`

    Overrides:
    :   `isDoingActionThatCanBeCancelled` in class `IsoGameCharacter`

    Returns:
    :   TRUE if this state handles the "Cancel Action" key or the B controller button.
  + ### getSteamID

    public long getSteamID()
  + ### setSteamID

    public void setSteamID(long steamId)
  + ### isTargetedByZombie

    public boolean isTargetedByZombie()
  + ### isMaskClicked

    public boolean isMaskClicked(int x,
    int y,
    boolean flip)

    Overrides:
    :   `isMaskClicked` in class `IsoGameCharacter`
  + ### getOffSetXUI

    public int getOffSetXUI()
  + ### setOffSetXUI

    public void setOffSetXUI(int offSetXUi)
  + ### getOffSetYUI

    public int getOffSetYUI()
  + ### setOffSetYUI

    public void setOffSetYUI(int offSetYUi)
  + ### getUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUsername()
  + ### getUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUsername([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") canShowFirstname)
  + ### getUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUsername([Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") canShowFirstname,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") canShowDisguisedName)
  + ### setUsername

    public void setUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newUsername)
  + ### updateUsername

    public void updateUsername()
  + ### getOnlineID

    public short getOnlineID()

    Specified by:
    :   `getOnlineID` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### isLocalPlayer

    public boolean isLocalPlayer()
  + ### isLocalPlayer

    public static boolean isLocalPlayer([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") character)
  + ### isLocalPlayer

    public static boolean isLocalPlayer([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") characterObject)
  + ### setLocalPlayer

    public static void setLocalPlayer(int index,
    [IsoPlayer](IsoPlayer.html "class in zombie.characters") newPlayerObj)
  + ### getLocalPlayerByOnlineID

    public static [IsoPlayer](IsoPlayer.html "class in zombie.characters") getLocalPlayerByOnlineID(short id)
  + ### isOnlyPlayerAsleep

    public boolean isOnlyPlayerAsleep()
  + ### setHasObstacleOnPath

    public void setHasObstacleOnPath(boolean value)
  + ### isRemoteAndHasObstacleOnPath

    public boolean isRemoteAndHasObstacleOnPath()
  + ### OnDeath

    public void OnDeath()

    Overrides:
    :   `OnDeath` in class `IsoGameCharacter`
  + ### isNoClip

    public boolean isNoClip()
  + ### setNoClip

    public void setNoClip(boolean noClip,
    boolean isForced)
  + ### setNoClip

    public void setNoClip(boolean noClip)
  + ### setAuthorizeMeleeAction

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setAuthorizeMeleeAction(boolean enabled)

    Deprecated.

    Replaced by [`setAuthorizedHandToHandAction(boolean)`](#setAuthorizedHandToHandAction(boolean))

    Specify whether character can initiate hand-to-hand combat. That is, whether it can set its melee flag.
    Called from lua.
  + ### isAuthorizeMeleeAction

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isAuthorizeMeleeAction()

    Deprecated.

    Replaced by [`isAuthorizedHandToHandAction()`](#isAuthorizedHandToHandAction())

    Returns whether character can initiate hand-to-hand combat. That is, whether it can set its melee flag.
    Called from lua.
  + ### setAuthorizeShoveStomp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setAuthorizeShoveStomp(boolean enabled)

    Deprecated.

    Replaced by [`setAuthorizedHandToHand(boolean)`](#setAuthorizedHandToHand(boolean))

    Specify whether character can perform hand-to-hand combat.   
      

    Note: This is different from the Action variant setAuthorizeHandToHandAction, which specifies whether the melee flag can be set.   
    In this case, the melee flag has been set, but the character can be prevented from acting on them.

    Called from lua.
  + ### isAuthorizeShoveStomp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isAuthorizeShoveStomp()

    Deprecated.

    Replaced by [`isAuthorizedHandToHand()`](#isAuthorizedHandToHand())

    Returns whether character can perform hand-to-hand combat.   
      

    Note: This is different from the Action variant setAuthorizeHandToHandAction, which specifies whether the melee flags can be set.   
    In this case, the melee flag has been set, but the character can be prevented from acting on them.

    Called from lua.
  + ### setAuthorizedHandToHandAction

    public void setAuthorizedHandToHandAction(boolean enabled)

    Specify whether character can initiate hand-to-hand combat. That is, whether it can set its melee flag.
    Called from lua.
  + ### isAuthorizedHandToHandAction

    public boolean isAuthorizedHandToHandAction()

    Returns whether character can initiate hand-to-hand combat. That is, whether it can set its melee flag.
    Called from lua.
  + ### setAuthorizedHandToHand

    public void setAuthorizedHandToHand(boolean enabled)

    Specify whether character can perform hand-to-hand combat.   
      

    Note: This is different from the Action variant setAuthorizeHandToHandAction, which specifies whether the melee flag can be set.   
    In this case, the melee flag has been set, but the character can be prevented from acting on them.

    Called from lua.
  + ### isAuthorizedHandToHand

    public boolean isAuthorizedHandToHand()

    Returns whether character can perform hand-to-hand combat.   
      

    Note: This is different from the Action variant setAuthorizeHandToHandAction, which specifies whether the melee flag can be set.   
    In this case, the melee flag has been set, but the character can be prevented from acting on them.

    Called from lua.
  + ### isBlockMovement

    public boolean isBlockMovement()
  + ### setBlockMovement

    public void setBlockMovement(boolean blockMovement)
  + ### startReceivingBodyDamageUpdates

    public void startReceivingBodyDamageUpdates([IsoPlayer](IsoPlayer.html "class in zombie.characters") other)
  + ### stopReceivingBodyDamageUpdates

    public void stopReceivingBodyDamageUpdates([IsoPlayer](IsoPlayer.html "class in zombie.characters") other)
  + ### getNutrition

    public [Nutrition](BodyDamage/Nutrition.html "class in zombie.characters.BodyDamage") getNutrition()
  + ### getFitness

    public [Fitness](BodyDamage/Fitness.html "class in zombie.characters.BodyDamage") getFitness()
  + ### updateRemotePlayerInVehicle

    public void updateRemotePlayerInVehicle()
  + ### getNetworkSpeedMul

    protected float getNetworkSpeedMul()
  + ### checkTile

    private boolean checkTile(int x,
    int y,
    int z,
    boolean isVerticalWall)
  + ### canWalkAxialPath

    private boolean canWalkAxialPath(int x,
    int y,
    int z,
    int targetX,
    int targetY)
  + ### trySuppressPathFinder

    private void trySuppressPathFinder([Vector3](../iso/Vector3.html "class in zombie.iso") target)
  + ### updateRemotePlayer

    protected boolean updateRemotePlayer()
  + ### moveUnmoddedRemotePlayer

    private void moveUnmoddedRemotePlayer()
  + ### updateWhileDead

    private boolean updateWhileDead()
  + ### initFMODParameters

    private void initFMODParameters()
  + ### getParameterCharacterMovementSpeed

    public zombie.audio.parameters.ParameterCharacterMovementSpeed getParameterCharacterMovementSpeed()
  + ### setMeleeHitSurface

    public void setMeleeHitSurface(zombie.audio.parameters.ParameterMeleeHitSurface.Material material)
  + ### setMeleeHitSurface

    public void setMeleeHitSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") material)
  + ### setVehicleHitLocation

    public void setVehicleHitLocation([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)

    Description copied from class: `IsoGameCharacter`

    Base method. Default does nothing.

    Overrides:
    :   `setVehicleHitLocation` in class `IsoGameCharacter`
  + ### updateHeartSound

    private void updateHeartSound()
  + ### updateEquippedBaggageContainer

    private void updateEquippedBaggageContainer()
  + ### DoFootstepSound

    public void DoFootstepSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Overrides:
    :   `DoFootstepSound` in class `IsoGameCharacter`
  + ### updateHeavyBreathing

    private void updateHeavyBreathing()
  + ### playGainExperienceLevelSound

    public long playGainExperienceLevelSound()
  + ### playerVoiceSound

    public long playerVoiceSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### transmitPlayerVoiceSound

    public long transmitPlayerVoiceSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### stopPlayerVoiceSound

    public long stopPlayerVoiceSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### updateVocalProperties

    public void updateVocalProperties()
  + ### updateDraggingCorpseSounds

    private void updateDraggingCorpseSounds()
  + ### updateAttackLoopSound

    private void updateAttackLoopSound()
  + ### updateBringToBearSound

    private void updateBringToBearSound()
  + ### isPlayingAttackLoopSound

    public boolean isPlayingAttackLoopSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### startAttackLoopSound

    public void startAttackLoopSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### stopAttackLoopSound

    private void stopAttackLoopSound(boolean cancelPrevious)
  + ### playRangedWeaponShootSound

    public long playRangedWeaponShootSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### playBloodSplatterSound

    public void playBloodSplatterSound()

    Overrides:
    :   `playBloodSplatterSound` in class `IsoGameCharacter`
  + ### checkVehicleContainers

    private void checkVehicleContainers()
  + ### createPlayerStats

    public zombie.core.network.ByteBufferWriter createPlayerStats(zombie.core.network.ByteBufferWriter b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") adminUsername)
  + ### setPlayerStats

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") setPlayerStats(zombie.core.network.ByteBufferReader bb,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") adminUsername)
  + ### isAllChatMuted

    public boolean isAllChatMuted()
  + ### setAllChatMuted

    public void setAllChatMuted(boolean allChatMuted)
  + ### getAccessLevel

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAccessLevel()

    Deprecated.
  + ### getRole

    public [Role](Role.html "class in zombie.characters") getRole()
  + ### isAccessLevel

    public boolean isAccessLevel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") level)
  + ### setRole

    public void setRole([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newLvl)
  + ### addMechanicsItem

    public void addMechanicsItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemid,
    [VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") part,
    [Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang") milli)
  + ### updateTemperatureCheck

    private void updateTemperatureCheck()
  + ### getZombieRelevenceScore

    public float getZombieRelevenceScore([IsoZombie](IsoZombie.html "class in zombie.characters") z)
  + ### getVisual

    public zombie.core.skinnedmodel.visual.BaseVisual getVisual()

    Specified by:
    :   `getVisual` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `getVisual` in class `IsoGameCharacter`
  + ### getHumanVisual

    public [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") getHumanVisual()

    Specified by:
    :   `getHumanVisual` in interface `IHumanVisual`
  + ### getAnimalVisual

    public [AnimalVisual](../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") getAnimalVisual()

    Specified by:
    :   `getAnimalVisual` in interface `IAnimalVisual`
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()

    Specified by:
    :   `getAnimalType` in interface `IAnimalVisual`
  + ### getAnimalSize

    public float getAnimalSize()

    Specified by:
    :   `getAnimalSize` in interface `IAnimalVisual`
  + ### getItemVisuals

    public [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") getItemVisuals()

    Overrides:
    :   `getItemVisuals` in class `IsoGameCharacter`
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `getItemVisuals` in interface `IHumanVisual`

    Overrides:
    :   `getItemVisuals` in class `IsoGameCharacter`
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)

    Specified by:
    :   `dressInNamedOutfit` in interface `ILuaGameCharacterClothing`

    Overrides:
    :   `dressInNamedOutfit` in class `IsoGameCharacter`
  + ### dressInClothingItem

    public void dressInClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGUID)

    Overrides:
    :   `dressInClothingItem` in class `IsoGameCharacter`
  + ### onClothingOutfitPreviewChanged

    private void onClothingOutfitPreviewChanged()
  + ### onWornItemsChanged

    public void onWornItemsChanged()

    Overrides:
    :   `onWornItemsChanged` in class `IsoGameCharacter`
  + ### getLastAngle

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getLastAngle()
  + ### setLastAngle

    public void setLastAngle([Vector2](../iso/Vector2.html "class in zombie.iso") lastAngle)
  + ### getDialogMood

    public int getDialogMood()
  + ### setDialogMood

    public void setDialogMood(int dialogMood)
  + ### getPing

    public int getPing()
  + ### setPing

    public void setPing(int ping)
  + ### getDragObject

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") getDragObject()
  + ### setDragObject

    public void setDragObject([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") dragObject)
  + ### getAsleepTime

    public float getAsleepTime()
  + ### setAsleepTime

    public void setAsleepTime(float asleepTime)
  + ### getSpottedList

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getSpottedList()
  + ### getTicksSinceSeenZombie

    public int getTicksSinceSeenZombie()
  + ### setTicksSinceSeenZombie

    public void setTicksSinceSeenZombie(int ticksSinceSeenZombie)
  + ### isWaiting

    public boolean isWaiting()
  + ### setWaiting

    public void setWaiting(boolean waiting)
  + ### getDragCharacter

    public [IsoSurvivor](IsoSurvivor.html "class in zombie.characters") getDragCharacter()
  + ### setDragCharacter

    public void setDragCharacter([IsoSurvivor](IsoSurvivor.html "class in zombie.characters") dragCharacter)
  + ### getHeartDelay

    public float getHeartDelay()
  + ### setHeartDelay

    public void setHeartDelay(float heartDelay)
  + ### getHeartDelayMax

    public float getHeartDelayMax()
  + ### setHeartDelayMax

    public void setHeartDelayMax(int heartDelayMax)
  + ### getHoursSurvived

    public double getHoursSurvived()

    Specified by:
    :   `getHoursSurvived` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `getHoursSurvived` in class `IsoGameCharacter`
  + ### setHoursSurvived

    public void setHoursSurvived(double hrs)
  + ### getMaxWeightDelta

    public float getMaxWeightDelta()
  + ### setMaxWeightDelta

    public void setMaxWeightDelta(float maxWeightDelta)
  + ### isbChangeCharacterDebounce

    public boolean isbChangeCharacterDebounce()
  + ### setbChangeCharacterDebounce

    public void setbChangeCharacterDebounce(boolean changeCharacterDebounce)
  + ### getFollowID

    public int getFollowID()
  + ### setFollowID

    public void setFollowID(int followId)
  + ### isbSeenThisFrame

    public boolean isbSeenThisFrame()
  + ### setbSeenThisFrame

    public void setbSeenThisFrame(boolean seenThisFrame)
  + ### isbCouldBeSeenThisFrame

    public boolean isbCouldBeSeenThisFrame()
  + ### setbCouldBeSeenThisFrame

    public void setbCouldBeSeenThisFrame(boolean couldBeSeenThisFrame)
  + ### getTimeSinceLastStab

    public float getTimeSinceLastStab()
  + ### setTimeSinceLastStab

    public void setTimeSinceLastStab(float timeSinceLastStab)
  + ### getLastSpotted

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> getLastSpotted()
  + ### setLastSpotted

    public void setLastSpotted([Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")> lastSpotted)
  + ### getClearSpottedTimer

    public int getClearSpottedTimer()
  + ### setClearSpottedTimer

    public void setClearSpottedTimer(int clearSpottedTimer)
  + ### IsRunning

    public boolean IsRunning()
  + ### InitSpriteParts

    public void InitSpriteParts()
  + ### getTagPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTagPrefix()
  + ### setTagPrefix

    public void setTagPrefix([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newTag)
  + ### getTagColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getTagColor()
  + ### setTagColor

    public void setTagColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tagColor)
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getDisguisedDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisguisedDisplayName()
  + ### resetDisplayName

    public void resetDisplayName()
  + ### setDisplayName

    public void setDisplayName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName)
  + ### isSeeNonPvpZone

    public boolean isSeeNonPvpZone()
  + ### isSeeDesignationZone

    public boolean isSeeDesignationZone()
  + ### setSeeDesignationZone

    public void setSeeDesignationZone(boolean seeMetaAnimalZone)
  + ### addSelectedZoneForHighlight

    public void addSelectedZoneForHighlight([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") id)
  + ### setSelectedZoneForHighlight

    public void setSelectedZoneForHighlight([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") id)
  + ### getSelectedZoneForHighlight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getSelectedZoneForHighlight()
  + ### getSelectedZonesForHighlight

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> getSelectedZonesForHighlight()
  + ### resetSelectedZonesForHighlight

    public void resetSelectedZonesForHighlight()
  + ### setSeeNonPvpZone

    public void setSeeNonPvpZone(boolean seeNonPvpZone)
  + ### checkZonesInterception

    public boolean checkZonesInterception(int x1,
    int x2,
    int y1,
    int y2)
  + ### isShowTag

    public boolean isShowTag()
  + ### setShowTag

    public void setShowTag(boolean show)
  + ### isFactionPvp

    public boolean isFactionPvp()
  + ### setFactionPvp

    public void setFactionPvp(boolean pvp)
  + ### isForceOverrideAnim

    public boolean isForceOverrideAnim()
  + ### setForceOverrideAnim

    public void setForceOverrideAnim(boolean forceOverride)
  + ### getMechanicsItem

    public [Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang") getMechanicsItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemId)
  + ### isWearingNightVisionGoggles

    public boolean isWearingNightVisionGoggles()
  + ### setWearingNightVisionGoggles

    public void setWearingNightVisionGoggles(boolean b)
  + ### OnAnimEvent

    public void OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimLayer sender,
    zombie.core.skinnedmodel.animation.AnimationTrack track,
    zombie.core.skinnedmodel.advancedanimation.AnimEvent event)

    Specified by:
    :   `OnAnimEvent` in interface `zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback`

    Overrides:
    :   `OnAnimEvent` in class `IsoGameCharacter`
  + ### setAddedToModelManager

    public void setAddedToModelManager(zombie.core.skinnedmodel.ModelManager modelManager,
    boolean isAdded)

    Callback from ModelManager.Add/Remove functions.

    NOTE: Do not call this directly, it is intended for use by the ModelManager only.

    Overrides:
    :   `setAddedToModelManager` in class `IsoGameCharacter`

    Parameters:
    :   `modelManager` - Event sender.
    :   `isAdded` - Whether or not this object extists in the ModelManager's render list.
  + ### isTimedActionInstant

    public boolean isTimedActionInstant()

    Specified by:
    :   `isTimedActionInstant` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isTimedActionInstant` in class `IsoGameCharacter`
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`
  + ### addWorldSoundUnlessInvisible

    public void addWorldSoundUnlessInvisible(int radius,
    int volume,
    boolean bStressHumans)

    Specified by:
    :   `addWorldSoundUnlessInvisible` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `addWorldSoundUnlessInvisible` in class `IsoGameCharacter`
  + ### updateFootInjuries

    private void updateFootInjuries()
  + ### calculateInTreesSpeed

    private float calculateInTreesSpeed()
  + ### updateInTreesInjuries

    private void updateInTreesInjuries()
  + ### possiblyPlayVoiceSound

    private void possiblyPlayVoiceSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
  + ### getMoodleLevel

    public int getMoodleLevel([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") type)
  + ### isAttackStarted

    public boolean isAttackStarted()
  + ### setAttackStarted

    public void setAttackStarted(boolean attackStarted)
  + ### isBehaviourMoving

    public boolean isBehaviourMoving()

    Overrides:
    :   `isBehaviourMoving` in class `IsoGameCharacter`
  + ### isJustMoved

    public boolean isJustMoved()
  + ### setJustMoved

    public void setJustMoved(boolean val)
  + ### isPlayerMoving

    public boolean isPlayerMoving()

    Overrides:
    :   `isPlayerMoving` in class `IsoGameCharacter`
  + ### getTimedActionTimeModifier

    public float getTimedActionTimeModifier()

    Overrides:
    :   `getTimedActionTimeModifier` in class `IsoGameCharacter`
  + ### isLookingWhileInVehicle

    public boolean isLookingWhileInVehicle()
  + ### setInitiateAttack

    public void setInitiateAttack(boolean initiate)
  + ### isInitiateAttack

    public boolean isInitiateAttack()
  + ### isIgnoreContextKey

    public boolean isIgnoreContextKey()
  + ### setIgnoreContextKey

    public void setIgnoreContextKey(boolean ignoreContextKey)
  + ### isIgnoreAutoVault

    public boolean isIgnoreAutoVault()
  + ### setIgnoreAutoVault

    public void setIgnoreAutoVault(boolean ignoreAutoVault)
  + ### isAttackType

    public boolean isAttackType(zombie.AttackType attackType)
  + ### getAttackType

    public zombie.AttackType getAttackType()
  + ### getAttackTypeAnimationKey

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttackTypeAnimationKey()
  + ### setAttackType

    public void setAttackType(zombie.AttackType attackType)
  + ### canSeeAll

    public boolean canSeeAll()
  + ### setCanSeeAll

    public void setCanSeeAll(boolean b)
  + ### isCheatPlayerSeeEveryone

    public boolean isCheatPlayerSeeEveryone()
  + ### getRelevantAndDistance

    public float getRelevantAndDistance(float x,
    float y,
    float relevantRange)
  + ### canHearAll

    public boolean canHearAll()
  + ### setCanHearAll

    public void setCanHearAll(boolean b)
  + ### getAlreadyReadBook

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAlreadyReadBook()
  + ### setMoodleCantSprint

    public void setMoodleCantSprint(boolean b)
  + ### setAttackFromBehind

    public void setAttackFromBehind(boolean attackFromBehind)
  + ### isAttackFromBehind

    public boolean isAttackFromBehind()
  + ### onKilled

    public void onKilled([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") attackingWeapon,
    boolean isGory)

    Overrides:
    :   `onKilled` in class `IsoGameCharacter`
  + ### onDied

    private void onDied([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") sender,
    [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### getNetworkCharacterAI

    public zombie.characters.NetworkPlayerAI getNetworkCharacterAI()

    Overrides:
    :   `getNetworkCharacterAI` in class `IsoGameCharacter`
  + ### preupdate

    public void preupdate()

    Overrides:
    :   `preupdate` in class `IsoGameCharacter`
  + ### allowsInvisibleAnimationSkips

    public boolean allowsInvisibleAnimationSkips()

    Overrides:
    :   `allowsInvisibleAnimationSkips` in class `IsoGameCharacter`
  + ### setFishingStage

    public void setFishingStage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stage)
  + ### setFitnessSpeed

    public void setFitnessSpeed()
  + ### isClimbOverWallSuccess

    public boolean isClimbOverWallSuccess()
  + ### setClimbOverWallSuccess

    public void setClimbOverWallSuccess(boolean climbOverWallSuccess)
  + ### isClimbOverWallStruggle

    public boolean isClimbOverWallStruggle()
  + ### setClimbOverWallStruggle

    public void setClimbOverWallStruggle(boolean climbOverWallStruggle)
  + ### isSkipResolveCollision

    public boolean isSkipResolveCollision()

    Description copied from class: `IsoGameCharacter`

    Should this character ignore collision resolutions.
    Overriding classes can define their own special-cases.

    Overrides:
    :   `isSkipResolveCollision` in class `IsoGameCharacter`

    Returns:
    :   FALSE if this character wishes to be shunted around by the collision system.   
        TRUE if this character wishes to ignoree collision detection, and phase through obstacles like walls and other characters.
  + ### getMusicIntensityEvents

    public [MusicIntensityEvents](../audio/MusicIntensityEvents.html "class in zombie.audio") getMusicIntensityEvents()
  + ### updateMusicIntensityEvents

    private void updateMusicIntensityEvents()
  + ### triggerMusicIntensityEvent

    public void triggerMusicIntensityEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getMusicThreatStatuses

    public [MusicThreatStatuses](../audio/MusicThreatStatuses.html "class in zombie.audio") getMusicThreatStatuses()
  + ### updateMusicThreatStatuses

    private void updateMusicThreatStatuses()
  + ### addAttachedAnimal

    public void addAttachedAnimal([IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") anim)
  + ### getAttachedAnimals

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> getAttachedAnimals()
  + ### removeAttachedAnimal

    public void removeAttachedAnimal([IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### removeAllAttachedAnimals

    public void removeAllAttachedAnimals()
  + ### hasAttachedAnimals

    public boolean hasAttachedAnimals()
  + ### checkAnimalAttachedToRope

    public void checkAnimalAttachedToRope([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newPrimaryItem)
  + ### isRopeItem

    private boolean isRopeItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### lureAnimal

    public void lureAnimal([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getLuredAnimals

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> getLuredAnimals()
  + ### stopLuringAnimals

    public void stopLuringAnimals(boolean eatFood)
  + ### setIsLuringAnimals

    public void setIsLuringAnimals(boolean luring)
  + ### getVoiceType

    public int getVoiceType()
  + ### setVoiceType

    public void setVoiceType(int voiceType)
  + ### setVoicePitch

    public void setVoicePitch(float voicePitch)
  + ### isFarming

    public boolean isFarming()
  + ### setIsFarming

    public void setIsFarming(boolean isFarmingBool)
  + ### tooDarkToRead

    public boolean tooDarkToRead()
  + ### isWalking

    public boolean isWalking()
  + ### isInvPageDirty

    public boolean isInvPageDirty()
  + ### setInvPageDirty

    public void setInvPageDirty(boolean b)
  + ### getVoicePitch

    public float getVoicePitch()
  + ### setCombatSpeed

    public void setCombatSpeed(float combatSpeed)
  + ### getCombatSpeed

    public float getCombatSpeed()
  + ### isMeleePressed

    public boolean isMeleePressed()
  + ### isGrapplePressed

    public boolean isGrapplePressed()
  + ### setRole

    public void setRole([Role](Role.html "class in zombie.characters") newRole)
  + ### wasLastAttackHandToHand

    public boolean wasLastAttackHandToHand()
  + ### setLastAttackWasHandToHand

    public void setLastAttackWasHandToHand(boolean lastAttackWasHandToHand)
  + ### petAnimal

    public void petAnimal()
  + ### getUseableAnimal

    public [IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") getUseableAnimal()
  + ### getTimedActionToRetrigger

    public [LuaTimedActionNew](CharacterTimedActions/LuaTimedActionNew.html "class in zombie.characters.CharacterTimedActions") getTimedActionToRetrigger()
  + ### setTimedActionToRetrigger

    public void setTimedActionToRetrigger([LuaTimedActionNew](CharacterTimedActions/LuaTimedActionNew.html "class in zombie.characters.CharacterTimedActions") timedActionToRetrigger)
  + ### getPlayerCraftHistory

    public [PlayerCraftHistory](PlayerCraftHistory.html "class in zombie.characters") getPlayerCraftHistory()
  + ### isFavouriteRecipe

    public boolean isFavouriteRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### isFavouriteRecipe

    public boolean isFavouriteRecipe([CraftRecipe](../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### isUnwanted

    public boolean isUnwanted([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### setUnwanted

    public void setUnwanted([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") unwanted)
  + ### getUnwantedModDataString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUnwantedModDataString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getTimeSinceLastNetData

    public int getTimeSinceLastNetData()
  + ### setTimeSinceLastNetData

    public void setTimeSinceLastNetData(int timeSinceLastNetData)
  + ### getLastRemoteUpdate

    public long getLastRemoteUpdate()
  + ### setLastRemoteUpdate

    public void setLastRemoteUpdate(long lastRemoteUpdate)
  + ### getAutoDrink

    public boolean getAutoDrink()
  + ### setAutoDrink

    public void setAutoDrink(boolean autoDrink)
  + ### getAnticheatMask

    public short getAnticheatMask(zombie.core.raknet.UdpConnection connection)
  + ### setLastCheatToggleMillis

    public void setLastCheatToggleMillis(long lastCheatToggleMillis)
  + ### forEachPlayer

    public static void forEachPlayer(zombie.util.lambda.Invokers.Params1.ICallback<[IsoPlayer](IsoPlayer.html "class in zombie.characters")> visitor)
  + ### syncVisuals

    public void syncVisuals()
  + ### findClosestCorpseOnGroundToPickup

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") findClosestCorpseOnGroundToPickup()