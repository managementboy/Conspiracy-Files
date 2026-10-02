[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoZombie](IsoZombie.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [s\_saveFormatVersion](#s_saveFormatVersion)
   2. [SPEED\_NONE](#SPEED_NONE)
   3. [SPEED\_SPRINTER](#SPEED_SPRINTER)
   4. [SPEED\_FAST\_SHAMBLER](#SPEED_FAST_SHAMBLER)
   5. [SPEED\_SHAMBLER](#SPEED_SHAMBLER)
   6. [SPEED\_RANDOM](#SPEED_RANDOM)
   7. [HEARING\_PINPOINT](#HEARING_PINPOINT)
   8. [HEARING\_NORMAL](#HEARING_NORMAL)
   9. [HEARING\_POOR](#HEARING_POOR)
   10. [HEARING\_RANDOM](#HEARING_RANDOM)
   11. [HEARING\_NORMAL\_OR\_POOR](#HEARING_NORMAL_OR_POOR)
   12. [THUMP\_FLAG\_GENERIC](#THUMP_FLAG_GENERIC)
   13. [THUMP\_FLAG\_WINDOW\_EXTRA](#THUMP_FLAG_WINDOW_EXTRA)
   14. [THUMP\_FLAG\_WINDOW](#THUMP_FLAG_WINDOW)
   15. [THUMP\_FLAG\_METAL](#THUMP_FLAG_METAL)
   16. [THUMP\_FLAG\_GARAGE\_DOOR](#THUMP_FLAG_GARAGE_DOOR)
   17. [THUMP\_FLAG\_CHAINLINK\_FENCE](#THUMP_FLAG_CHAINLINK_FENCE)
   18. [THUMP\_FLAG\_METAL\_POLE\_GATE](#THUMP_FLAG_METAL_POLE_GATE)
   19. [THUMP\_FLAG\_WOOD](#THUMP_FLAG_WOOD)
   20. [tempBodies](#tempBodies)
   21. [alwaysKnockedDown](#alwaysKnockedDown)
   22. [onlyJawStab](#onlyJawStab)
   23. [forceEatingAnimation](#forceEatingAnimation)
   24. [noTeeth](#noTeeth)
   25. [AllowRepathDelayMax](#AllowRepathDelayMax)
   26. [SPRINTER\_FIXES](#SPRINTER_FIXES)
   27. [lastTargetSeenX](#lastTargetSeenX)
   28. [lastTargetSeenY](#lastTargetSeenY)
   29. [lastTargetSeenZ](#lastTargetSeenZ)
   30. [ghost](#ghost)
   31. [lungeTimer](#lungeTimer)
   32. [lungeSoundTime](#lungeSoundTime)
   33. [target](#target)
   34. [timeSinceSeenFlesh](#timeSinceSeenFlesh)
   35. [targetSeenTime](#targetSeenTime)
   36. [canSeeTarget](#canSeeTarget)
   37. [followCount](#followCount)
   38. [zombieId](#zombieId)
   39. [bonusSpotTime](#bonusSpotTime)
   40. [staggerBack](#staggerBack)
   41. [knifeDeath](#knifeDeath)
   42. [jawStabAttach](#jawStabAttach)
   43. [becomeCrawler](#becomeCrawler)
   44. [fakeDead](#fakeDead)
   45. [forceFakeDead](#forceFakeDead)
   46. [wasFakeDead](#wasFakeDead)
   47. [reanimate](#reanimate)
   48. [atlasTex](#atlasTex)
   49. [reanimatedPlayer](#reanimatedPlayer)
   50. [indoorZombie](#indoorZombie)
   51. [thumpFlag](#thumpFlag)
   52. [thumpSent](#thumpSent)
   53. [thumpCondition](#thumpCondition)
   54. [EAT\_BODY\_DIST](#EAT_BODY_DIST)
   55. [EAT\_BODY\_TIME](#EAT_BODY_TIME)
   56. [LUNGE\_TIME](#LUNGE_TIME)
   57. [CRAWLER\_DAMAGE\_DOT](#CRAWLER_DAMAGE_DOT)
   58. [CRAWLER\_DAMAGE\_RANGE](#CRAWLER_DAMAGE_RANGE)
   59. [useless](#useless)
   60. [speedType](#speedType)
   61. [group](#group)
   62. [inactive](#inactive)
   63. [strength](#strength)
   64. [cognition](#cognition)
   65. [memory](#memory)
   66. [sight](#sight)
   67. [hearing](#hearing)
   68. [itemsToSpawnAtDeath](#itemsToSpawnAtDeath)
   69. [voiceChoice](#voiceChoice)
   70. [soundReactDelay](#soundReactDelay)
   71. [delayedSound](#delayedSound)
   72. [soundSourceRepeating](#soundSourceRepeating)
   73. [soundSourceIsPlayer](#soundSourceIsPlayer)
   74. [soundSourceIsPlayerBase](#soundSourceIsPlayerBase)
   75. [soundSourceTarget](#soundSourceTarget)
   76. [soundAttract](#soundAttract)
   77. [soundAttractTimeout](#soundAttractTimeout)
   78. [alerted](#alerted)
   79. [walkType](#walkType)
   80. [footstepVolume](#footstepVolume)
   81. [sharedDesc](#sharedDesc)
   82. [dressInRandomOutfit](#dressInRandomOutfit)
   83. [pendingOutfitName](#pendingOutfitName)
   84. [humanVisual](#humanVisual)
   85. [crawlerType](#crawlerType)
   86. [playerAttackPosition](#playerAttackPosition)
   87. [eatSpeed](#eatSpeed)
   88. [sitAgainstWall](#sitAgainstWall)
   89. [CHECK\_FOR\_CORPSE\_TIMER\_MAX](#CHECK_FOR_CORPSE_TIMER_MAX)
   90. [checkForCorpseTimer](#checkForCorpseTimer)
   91. [bodyToEat](#bodyToEat)
   92. [eatBodyTarget](#eatBodyTarget)
   93. [hitTime](#hitTime)
   94. [thumpTimer](#thumpTimer)
   95. [hitLegsWhileOnFloor](#hitLegsWhileOnFloor)
   96. [collideWhileHit](#collideWhileHit)
   97. [characterTextureAnimTime](#characterTextureAnimTime)
   98. [characterTextureAnimDuration](#characterTextureAnimDuration)
   99. [lastPlayerHit](#lastPlayerHit)
   100. [VISION\_RADIUS\_MAX](#VISION_RADIUS_MAX)
   101. [VISION\_RADIUS\_MIN](#VISION_RADIUS_MIN)
   102. [visionRadiusResult](#visionRadiusResult)
   103. [VISION\_FOG\_PENALTY\_MAX](#VISION_FOG_PENALTY_MAX)
   104. [VISION\_RAIN\_PENALTY\_MAX](#VISION_RAIN_PENALTY_MAX)
   105. [VISION\_DARKNESS\_PENALTY\_MAX](#VISION_DARKNESS_PENALTY_MAX)
   106. [HEARING\_UNSEEN\_OFFSET\_MIN](#HEARING_UNSEEN_OFFSET_MIN)
   107. [HEARING\_UNSEEN\_OFFSET\_HEAVY\_RAIN](#HEARING_UNSEEN_OFFSET_HEAVY_RAIN)
   108. [HEARING\_UNSEEN\_OFFSET\_MAX](#HEARING_UNSEEN_OFFSET_MAX)
   109. [itemVisuals](#itemVisuals)
   110. [hitHeadWhileOnFloor](#hitHeadWhileOnFloor)
   111. [attackDidDamage](#attackDidDamage)
   112. [attackOutcome](#attackOutcome)
   113. [reanimatedForGrappleOnly](#reanimatedForGrappleOnly)
   114. [imposter](#imposter)
   115. [spottedLast](#spottedLast)
   116. [vehicle4testCollision](#vehicle4testCollision)
   117. [spotSoundDelay](#spotSoundDelay)
   118. [movex](#movex)
   119. [movey](#movey)
   120. [stepFrameLast](#stepFrameLast)
   121. [networkUpdate](#networkUpdate)
   122. [lastRemoteUpdate](#lastRemoteUpdate)
   123. [onlineId](#onlineId)
   124. [spriteName](#spriteName)
   125. [PALETTE\_COUNT](#PALETTE_COUNT)
   126. [vectorToTarget](#vectorToTarget)
   127. [allowRepathDelay](#allowRepathDelay)
   128. [keepItReal](#keepItReal)
   129. [isSkeleton](#isSkeleton)
   130. [parameterCharacterInside](#parameterCharacterInside)
   131. [parameterCharacterMovementSpeed](#parameterCharacterMovementSpeed)
   132. [parameterCharacterOnFire](#parameterCharacterOnFire)
   133. [parameterFootstepMaterial](#parameterFootstepMaterial)
   134. [parameterFootstepMaterial2](#parameterFootstepMaterial2)
   135. [parameterPlayerDistance](#parameterPlayerDistance)
   136. [parameterShoeType](#parameterShoeType)
   137. [parameterVehicleHitLocation](#parameterVehicleHitLocation)
   138. [parameterZombieState](#parameterZombieState)
   139. [scratch](#scratch)
   140. [laceration](#laceration)
   141. [zombiePacket](#zombiePacket)
   142. [zombiePacketUpdated](#zombiePacketUpdated)
   143. [lastChangeOwner](#lastChangeOwner)
   144. [bloodSplatAmount](#bloodSplatAmount)
   145. [lastPosition](#lastPosition)
   146. [currentPosition](#currentPosition)
   147. [lastHitPart](#lastHitPart)
   148. [timeSinceRespondToSound](#timeSinceRespondToSound)
   149. [m\_sharedSkeleRepo](#m_sharedSkeleRepo)
   150. [walkVariantUse](#walkVariantUse)
   151. [walkVariant](#walkVariant)
   152. [lunger](#lunger)
   153. [running](#running)
   154. [crawling](#crawling)
   155. [canCrawlUnderVehicle](#canCrawlUnderVehicle)
   156. [canWalk](#canWalk)
   157. [remote](#remote)
   158. [floodFill](#floodFill)
   159. [immortalTutorialZombie](#immortalTutorialZombie)
   160. [palette](#palette)
   161. [aggroList](#aggroList)
   162. [unbalancedLevel](#unbalancedLevel)
   163. [temporaryMapCloseSneakBonusDir](#temporaryMapCloseSneakBonusDir)
   164. [temporaryMapCloseSneakBonusValue](#temporaryMapCloseSneakBonusValue)
7. [Constructor Details](#constructor-detail)
   1. [IsoZombie(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoZombie(IsoCell, SurvivorDesc, int)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.characters.SurvivorDesc,int))
8. [Method Details](#method-detail)
   1. [registerECSComponents()](#registerECSComponents())
   2. [toString()](#toString())
   3. [getObjectName()](#getObjectName())
   4. [getOnlineID()](#getOnlineID())
   5. [isRemoteZombie()](#isRemoteZombie())
   6. [getOwner()](#getOwner())
   7. [setOwner(UdpConnection)](#setOwner(zombie.core.raknet.UdpConnection))
   8. [getOwnerPlayer()](#getOwnerPlayer())
   9. [setOwnerPlayer(IsoPlayer)](#setOwnerPlayer(zombie.characters.IsoPlayer))
   10. [setVehicle4TestCollision(BaseVehicle)](#setVehicle4TestCollision(zombie.vehicles.BaseVehicle))
   11. [initializeStates()](#initializeStates())
   12. [registerVariableCallbacks()](#registerVariableCallbacks())
   13. [OnAnimEvent\_IsAlmostUp(IsoGameCharacter)](#OnAnimEvent_IsAlmostUp(zombie.characters.IsoGameCharacter))
   14. [isIdleOrStaggering()](#isIdleOrStaggering())
   15. [shouldSlideHeadAwayFromWalls()](#shouldSlideHeadAwayFromWalls())
   16. [slideHeadAwayFromWalls(boolean)](#slideHeadAwayFromWalls(boolean))
   17. [getUnbalancedLevel()](#getUnbalancedLevel())
   18. [setUnbalancedLevel(float)](#setUnbalancedLevel(float))
   19. [getShouldAttack()](#getShouldAttack())
   20. [actionStateChanged(ActionContext)](#actionStateChanged(zombie.characters.action.ActionContext))
   21. [onAnimPlayerCreated(AnimationPlayer)](#onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer))
   22. [GetAnimSetName()](#GetAnimSetName())
   23. [InitSpritePartsZombie()](#InitSpritePartsZombie())
   24. [InitSpritePartsZombie(SurvivorDesc)](#InitSpritePartsZombie(zombie.characters.SurvivorDesc))
   25. [pathToCharacter(IsoGameCharacter)](#pathToCharacter(zombie.characters.IsoGameCharacter))
   26. [pathToLocationF(float, float, float)](#pathToLocationF(float,float,float))
   27. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   28. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   29. [collideWith(IsoObject)](#collideWith(zombie.iso.IsoObject))
   30. [Hit(HandWeapon, IsoGameCharacter, float, boolean, float, boolean)](#Hit(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,float,boolean,float,boolean))
   31. [onMouseLeftClick()](#onMouseLeftClick())
   32. [onZombieGrappleEnded()](#onZombieGrappleEnded())
   33. [renderAtlasTexture(float, float, float)](#renderAtlasTexture(float,float,float))
   34. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   35. [renderlast()](#renderlast())
   36. [renderTextureInsteadOfModel(float, float)](#renderTextureInsteadOfModel(float,float))
   37. [renderTextureOverHead(String)](#renderTextureOverHead(java.lang.String))
   38. [updateAlpha(int, float, float)](#updateAlpha(int,float,float))
   39. [initFMODParameters()](#initFMODParameters())
   40. [isRespondingToPlayerSound()](#isRespondingToPlayerSound())
   41. [isMovingToPlayerSound()](#isMovingToPlayerSound())
   42. [RespondToSound()](#RespondToSound())
   43. [shouldStopThumpingToRespondToSound(WorldSoundManager.WorldSound)](#shouldStopThumpingToRespondToSound(zombie.WorldSoundManager.WorldSound))
   44. [setTurnAlertedValues(int, int)](#setTurnAlertedValues(int,int))
   45. [getAttackDidDamage()](#getAttackDidDamage())
   46. [setAttackDidDamage(boolean)](#setAttackDidDamage(boolean))
   47. [getAttackOutcome()](#getAttackOutcome())
   48. [setAttackOutcome(String)](#setAttackOutcome(java.lang.String))
   49. [setReanimatedForGrappleOnly(boolean)](#setReanimatedForGrappleOnly(boolean))
   50. [isReanimatedForGrappleOnly()](#isReanimatedForGrappleOnly())
   51. [clearAggroList()](#clearAggroList())
   52. [processAggroList()](#processAggroList())
   53. [addAggro(IsoMovingObject, float)](#addAggro(zombie.iso.IsoMovingObject,float))
   54. [isLeadAggro(IsoMovingObject)](#isLeadAggro(zombie.iso.IsoMovingObject))
   55. [closeSneakBonusCoeff(IsoGridSquare, IsoDirections)](#closeSneakBonusCoeff(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   56. [getObstacleMod(IsoGridSquare, IsoDirections)](#getObstacleMod(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   57. [spottedNew(IsoMovingObject, boolean)](#spottedNew(zombie.iso.IsoMovingObject,boolean))
   58. [isVehicleBetween(float, float, float)](#isVehicleBetween(float,float,float))
   59. [spottedOld(IsoMovingObject, boolean)](#spottedOld(zombie.iso.IsoMovingObject,boolean))
   60. [spotted(IsoMovingObject, boolean)](#spotted(zombie.iso.IsoMovingObject,boolean))
   61. [moveUnmodded(float, float)](#moveUnmodded(float,float))
   62. [DoFootstepSound(String)](#DoFootstepSound(java.lang.String))
   63. [addFootstepParametersIfNeeded()](#addFootstepParametersIfNeeded())
   64. [DoFootstepSound(float)](#DoFootstepSound(float))
   65. [preupdate()](#preupdate())
   66. [allowsInvisibleAnimationSkips()](#allowsInvisibleAnimationSkips())
   67. [postupdate()](#postupdate())
   68. [postUpdateInternal()](#postUpdateInternal())
   69. [handleLandingImpact(FallDamage)](#handleLandingImpact(zombie.characters.FallDamage))
   70. [isSolidForSeparate()](#isSolidForSeparate())
   71. [isPushableForSeparate()](#isPushableForSeparate())
   72. [isPushedByForSeparate(IsoMovingObject)](#isPushedByForSeparate(zombie.iso.IsoMovingObject))
   73. [update()](#update())
   74. [updateActiveState()](#updateActiveState())
   75. [updateInternal()](#updateInternal())
   76. [calculateStats()](#calculateStats())
   77. [updateZombieTripping()](#updateZombieTripping())
   78. [getVoiceChoice()](#getVoiceChoice())
   79. [getVoiceSoundName()](#getVoiceSoundName())
   80. [getBiteSoundName()](#getBiteSoundName())
   81. [updateVocalProperties()](#updateVocalProperties())
   82. [setVehicleHitLocation(BaseVehicle)](#setVehicleHitLocation(zombie.vehicles.BaseVehicle))
   83. [updateSearchForCorpse()](#updateSearchForCorpse())
   84. [damageSheetRope()](#damageSheetRope())
   85. [getZombieWalkTowardSpeed(float, float, Vector2)](#getZombieWalkTowardSpeed(float,float,zombie.iso.Vector2))
   86. [getZombieLungeSpeed()](#getZombieLungeSpeed())
   87. [tryThump(IsoGridSquare)](#tryThump(zombie.iso.IsoGridSquare))
   88. [Wander()](#Wander())
   89. [DoZombieInventory()](#DoZombieInventory())
   90. [DoCorpseInventory()](#DoCorpseInventory())
   91. [DoZombieInventory(boolean)](#DoZombieInventory(boolean))
   92. [DoZombieStats()](#DoZombieStats())
   93. [setWalkType(String)](#setWalkType(java.lang.String))
   94. [getSpeedTypeFromWalkType(String)](#getSpeedTypeFromWalkType(java.lang.String))
   95. [setSpeedTypeFromWalkType()](#setSpeedTypeFromWalkType())
   96. [DoZombieSpeeds(float)](#DoZombieSpeeds(float))
   97. [isFakeDead()](#isFakeDead())
   98. [setFakeDead(boolean)](#setFakeDead(boolean))
   99. [isForceFakeDead()](#isForceFakeDead())
   100. [setForceFakeDead(boolean)](#setForceFakeDead(boolean))
   101. [onHitByVehicle(BaseVehicle, float, Vector2, Vector2)](#onHitByVehicle(zombie.vehicles.BaseVehicle,float,zombie.iso.Vector2,zombie.iso.Vector2))
   102. [onHitByVehicleDriver(IsoGameCharacter)](#onHitByVehicleDriver(zombie.characters.IsoGameCharacter))
   103. [postHitByVehicleUpdateStance(float, boolean)](#postHitByVehicleUpdateStance(float,boolean))
   104. [addBloodFromVehicleImpact(float)](#addBloodFromVehicleImpact(float))
   105. [hitConsequences(HandWeapon, IsoGameCharacter, boolean, float, boolean)](#hitConsequences(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean,float,boolean))
   106. [playHurtSound()](#playHurtSound())
   107. [checkClimbOverFenceHit()](#checkClimbOverFenceHit())
   108. [checkClimbThroughWindowHit()](#checkClimbThroughWindowHit())
   109. [climbFenceWindowHit(int, int)](#climbFenceWindowHit(int,int))
   110. [shouldBecomeCrawler(IsoGameCharacter)](#shouldBecomeCrawler(zombie.characters.IsoGameCharacter))
   111. [removeFromWorld()](#removeFromWorld())
   112. [resetForReuse()](#resetForReuse())
   113. [wasFakeDead()](#wasFakeDead())
   114. [setWasFakeDead(boolean)](#setWasFakeDead(boolean))
   115. [setCrawler(boolean)](#setCrawler(boolean))
   116. [isBecomeCrawler()](#isBecomeCrawler())
   117. [setBecomeCrawler(boolean)](#setBecomeCrawler(boolean))
   118. [isReanimate()](#isReanimate())
   119. [setReanimate(boolean)](#setReanimate(boolean))
   120. [isReanimatedPlayer()](#isReanimatedPlayer())
   121. [setReanimatedPlayer(boolean)](#setReanimatedPlayer(boolean))
   122. [getReanimatedPlayer()](#getReanimatedPlayer())
   123. [setFemaleEtc(boolean)](#setFemaleEtc(boolean))
   124. [addRandomBloodDirtHolesEtc()](#addRandomBloodDirtHolesEtc())
   125. [useDescriptor(SharedDescriptors.Descriptor)](#useDescriptor(zombie.SharedDescriptors.Descriptor))
   126. [getSharedDescriptor()](#getSharedDescriptor())
   127. [getSharedDescriptorID()](#getSharedDescriptorID())
   128. [getScreenProperX(int)](#getScreenProperX(int))
   129. [getScreenProperY(int)](#getScreenProperY(int))
   130. [getVisual()](#getVisual())
   131. [getHumanVisual()](#getHumanVisual())
   132. [getItemVisuals()](#getItemVisuals())
   133. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   134. [isUsingWornItems()](#isUsingWornItems())
   135. [setAsSurvivor()](#setAsSurvivor())
   136. [dressInRandomOutfit()](#dressInRandomOutfit())
   137. [dressInNamedOutfit(String)](#dressInNamedOutfit(java.lang.String))
   138. [dressInPersistentOutfitID(int)](#dressInPersistentOutfitID(int))
   139. [dressInClothingItem(String)](#dressInClothingItem(java.lang.String))
   140. [onDeath\_ShouldDoSplatterAndSounds(HandWeapon, IsoGameCharacter, boolean)](#onDeath_ShouldDoSplatterAndSounds(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean))
   141. [onWornItemsChanged()](#onWornItemsChanged())
   142. [clothingItemChanged(String)](#clothingItemChanged(java.lang.String))
   143. [WanderFromWindow()](#WanderFromWindow())
   144. [isUseless()](#isUseless())
   145. [setUseless(boolean)](#setUseless(boolean))
   146. [setImmortalTutorialZombie(boolean)](#setImmortalTutorialZombie(boolean))
   147. [isTargetInCone(float, float)](#isTargetInCone(float,float))
   148. [isCrawling()](#isCrawling())
   149. [isCanCrawlUnderVehicle()](#isCanCrawlUnderVehicle())
   150. [setCanCrawlUnderVehicle(boolean)](#setCanCrawlUnderVehicle(boolean))
   151. [isCanWalk()](#isCanWalk())
   152. [setCanWalk(boolean)](#setCanWalk(boolean))
   153. [initCanCrawlUnderVehicle()](#initCanCrawlUnderVehicle())
   154. [shouldGetUpFromCrawl()](#shouldGetUpFromCrawl())
   155. [toggleCrawling()](#toggleCrawling())
   156. [knockDown(boolean)](#knockDown(boolean))
   157. [addItemToSpawnAtDeath(InventoryItem)](#addItemToSpawnAtDeath(zombie.inventory.InventoryItem))
   158. [clearItemsToSpawnAtDeath()](#clearItemsToSpawnAtDeath())
   159. [getEatBodyTarget()](#getEatBodyTarget())
   160. [getEatSpeed()](#getEatSpeed())
   161. [setEatBodyTarget(IsoMovingObject, boolean)](#setEatBodyTarget(zombie.iso.IsoMovingObject,boolean))
   162. [setEatBodyTarget(IsoMovingObject, boolean, float)](#setEatBodyTarget(zombie.iso.IsoMovingObject,boolean,float))
   163. [updateEatBodyTarget()](#updateEatBodyTarget())
   164. [updateCharacterTextureAnimTime()](#updateCharacterTextureAnimTime())
   165. [getCrawlerType()](#getCrawlerType())
   166. [setCrawlerType(int)](#setCrawlerType(int))
   167. [addRandomVisualBandages()](#addRandomVisualBandages())
   168. [addVisualBandage(BodyPartType, boolean)](#addVisualBandage(zombie.characters.BodyDamage.BodyPartType,boolean))
   169. [addRandomVisualDamages()](#addRandomVisualDamages())
   170. [getPlayerAttackPosition()](#getPlayerAttackPosition())
   171. [setPlayerAttackPosition(String)](#setPlayerAttackPosition(java.lang.String))
   172. [isSitAgainstWall()](#isSitAgainstWall())
   173. [setSitAgainstWall(boolean)](#setSitAgainstWall(boolean))
   174. [isSkeleton()](#isSkeleton())
   175. [isZombie()](#isZombie())
   176. [setSkeleton(boolean)](#setSkeleton(boolean))
   177. [getHitTime()](#getHitTime())
   178. [setHitTime(int)](#setHitTime(int))
   179. [getThumpTimer()](#getThumpTimer())
   180. [setThumpTimer(int)](#setThumpTimer(int))
   181. [getTarget()](#getTarget())
   182. [setTargetSeenTime(float)](#setTargetSeenTime(float))
   183. [getTargetSeenTime()](#getTargetSeenTime())
   184. [isTargetVisible()](#isTargetVisible())
   185. [getTurnDelta()](#getTurnDelta())
   186. [isAttacking()](#isAttacking())
   187. [isZombieAttacking()](#isZombieAttacking())
   188. [isZombieAttacking(IsoMovingObject)](#isZombieAttacking(zombie.iso.IsoMovingObject))
   189. [getHitHeadWhileOnFloor()](#getHitHeadWhileOnFloor())
   190. [getRealState()](#getRealState())
   191. [setHitHeadWhileOnFloor(int)](#setHitHeadWhileOnFloor(int))
   192. [isHitLegsWhileOnFloor()](#isHitLegsWhileOnFloor())
   193. [setHitLegsWhileOnFloor(boolean)](#setHitLegsWhileOnFloor(boolean))
   194. [makeInactive(boolean)](#makeInactive(boolean))
   195. [getFootstepVolume()](#getFootstepVolume())
   196. [isFacingTarget()](#isFacingTarget())
   197. [isTargetLocationKnown()](#isTargetLocationKnown())
   198. [getSandboxMemoryDuration()](#getSandboxMemoryDuration())
   199. [shouldDoFenceLunge()](#shouldDoFenceLunge())
   200. [isProne()](#isProne())
   201. [isGettingUp()](#isGettingUp())
   202. [setTarget(IsoMovingObject)](#setTarget(zombie.iso.IsoMovingObject))
   203. [isAlwaysKnockedDown()](#isAlwaysKnockedDown())
   204. [setAlwaysKnockedDown(boolean)](#setAlwaysKnockedDown(boolean))
   205. [setDressInRandomOutfit(boolean)](#setDressInRandomOutfit(boolean))
   206. [setBodyToEat(IsoDeadBody)](#setBodyToEat(zombie.iso.objects.IsoDeadBody))
   207. [isForceEatingAnimation()](#isForceEatingAnimation())
   208. [setForceEatingAnimation(boolean)](#setForceEatingAnimation(boolean))
   209. [isOnlyJawStab()](#isOnlyJawStab())
   210. [setOnlyJawStab(boolean)](#setOnlyJawStab(boolean))
   211. [isNoTeeth()](#isNoTeeth())
   212. [cantBite()](#cantBite())
   213. [setNoTeeth(boolean)](#setNoTeeth(boolean))
   214. [setThumpFlag(int)](#setThumpFlag(int))
   215. [setThumpCondition(float)](#setThumpCondition(float))
   216. [setThumpCondition(int, int)](#setThumpCondition(int,int))
   217. [getThumpCondition()](#getThumpCondition())
   218. [isStaggerBack()](#isStaggerBack())
   219. [setStaggerBack(boolean)](#setStaggerBack(boolean))
   220. [isKnifeDeath()](#isKnifeDeath())
   221. [setKnifeDeath(boolean)](#setKnifeDeath(boolean))
   222. [isJawStabAttach()](#isJawStabAttach())
   223. [setJawStabAttach(boolean)](#setJawStabAttach(boolean))
   224. [onKilled(IsoGameCharacter, HandWeapon, boolean)](#onKilled(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,boolean))
   225. [onDied(IsoGameCharacter, IsoDeadBody)](#onDied(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoDeadBody))
   226. [getNetworkCharacterAI()](#getNetworkCharacterAI())
   227. [isSkipResolveCollision()](#isSkipResolveCollision())
   228. [updateVisionRadius()](#updateVisionRadius())
   229. [getVisionRadiusAdjusted(float, float, float)](#getVisionRadiusAdjusted(float,float,float))
   230. [shouldZombieHaveKey(boolean)](#shouldZombieHaveKey(boolean))
   231. [checkZombieEntersPlayerBuilding()](#checkZombieEntersPlayerBuilding())
   232. [doZombieSpeed()](#doZombieSpeed())
   233. [doZombieSpeed(int)](#doZombieSpeed(int))
   234. [doZombieSpeedInternal(int)](#doZombieSpeedInternal(int))
   235. [doCrawlerSpeed(int)](#doCrawlerSpeed(int))
   236. [doSprinter()](#doSprinter())
   237. [doFastShambler()](#doFastShambler())
   238. [doFakeShambler()](#doFakeShambler())
   239. [doFakeShambler(int)](#doFakeShambler(int))
   240. [doShambler()](#doShambler())
   241. [getSpeedType()](#getSpeedType())
   242. [doZombieSpeedInternal2()](#doZombieSpeedInternal2())
   243. [doZombieSpeedInternal2(int)](#doZombieSpeedInternal2(int))
   244. [determineZombieSpeed(int)](#determineZombieSpeed(int))
   245. [getLastHitPart()](#getLastHitPart())
   246. [shouldDressInRandomOutfit()](#shouldDressInRandomOutfit())
   247. [getOutfitName()](#getOutfitName())
   248. [getHeadSquare(IsoPlayer)](#getHeadSquare(zombie.characters.IsoPlayer))
   249. [couldSeeHeadSquare(IsoPlayer)](#couldSeeHeadSquare(zombie.characters.IsoPlayer))
   250. [canSeeHeadSquare(IsoPlayer)](#canSeeHeadSquare(zombie.characters.IsoPlayer))
   251. [isSideOfStaircaseBetweenSelfAndTarget()](#isSideOfStaircaseBetweenSelfAndTarget())
   252. [updateMovementStatistics()](#updateMovementStatistics())
   253. [getWalkType()](#getWalkType())
   254. [helmetFallFromVisuals(boolean)](#helmetFallFromVisuals(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoZombie
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")

[zombie.characters.IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")

zombie.characters.IsoZombie

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.ai.IStateCharacter, zombie.characters.action.IActionStateChanged, zombie.characters.CharacterInputComponentEntity, zombie.characters.ecs.ECSEntity, zombie.characters.ILuaGameCharacter, ILuaGameCharacterAttachedItems, ILuaGameCharacterClothing, zombie.characters.ILuaGameCharacterDamage, zombie.characters.ILuaGameCharacterHealth, zombie.characters.ILuaVariableSource, zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, IAnimationVariableRegistry, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.population.IClothingItemListener, IHumanVisual, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

---

public final class IsoZombie
extends [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters")
implements [IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual")

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.characters.IsoZombie)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `IsoZombie.Aggro`

  `private static final class`

  `IsoZombie.FloodFill`

  `private static class`

  `IsoZombie.s_performance`

  `static enum`

  `IsoZombie.ZombieSound`

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

  `private final IsoZombie.Aggro[]`

  `aggroList`

  `boolean`

  `alerted`

  `float`

  `allowRepathDelay`

  `static final int`

  `AllowRepathDelayMax`

  `private boolean`

  `alwaysKnockedDown`

  `zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture`

  `atlasTex`

  `private boolean`

  `attackDidDamage`

  `private String`

  `attackOutcome`

  `private boolean`

  `becomeCrawler`

  `int`

  `bloodSplatAmount`

  `IsoDeadBody`

  `bodyToEat`

  `private float`

  `bonusSpotTime`

  `private boolean`

  `canCrawlUnderVehicle`

  `private boolean`

  `canSeeTarget`

  `private boolean`

  `canWalk`

  `private float`

  `characterTextureAnimDuration`

  `private float`

  `characterTextureAnimTime`

  `private static final int`

  `CHECK_FOR_CORPSE_TIMER_MAX`

  `private float`

  `checkForCorpseTimer`

  `int`

  `cognition`

  `boolean`

  `collideWhileHit`

  `static final float`

  `CRAWLER_DAMAGE_DOT`

  `static final float`

  `CRAWLER_DAMAGE_RANGE`

  `private int`

  `crawlerType`

  `boolean`

  `crawling`

  `private static final Vector2`

  `currentPosition`

  `private final IsoGameCharacter.Location`

  `delayedSound`

  `boolean`

  `dressInRandomOutfit`

  `static final float`

  `EAT_BODY_DIST`

  `static final float`

  `EAT_BODY_TIME`

  `IsoMovingObject`

  `eatBodyTarget`

  `private float`

  `eatSpeed`

  `private boolean`

  `fakeDead`

  `private static final IsoZombie.FloodFill`

  `floodFill`

  `int`

  `followCount`

  `private float`

  `footstepVolume`

  `private boolean`

  `forceEatingAnimation`

  `private boolean`

  `forceFakeDead`

  `boolean`

  `ghost`

  `zombie.characters.ZombieGroup`

  `group`

  `int`

  `hearing`

  `static final byte`

  `HEARING_NORMAL`

  `static final byte`

  `HEARING_NORMAL_OR_POOR`

  `static final byte`

  `HEARING_PINPOINT`

  `static final byte`

  `HEARING_POOR`

  `static final byte`

  `HEARING_RANDOM`

  `static final int`

  `HEARING_UNSEEN_OFFSET_HEAVY_RAIN`

  `static final int`

  `HEARING_UNSEEN_OFFSET_MAX`

  `static final int`

  `HEARING_UNSEEN_OFFSET_MIN`

  `private int`

  `hitHeadWhileOnFloor`

  `private boolean`

  `hitLegsWhileOnFloor`

  `private int`

  `hitTime`

  `private final HumanVisual`

  `humanVisual`

  `boolean`

  `immortalTutorialZombie`

  `zombie.characters.Imposter`

  `imposter`

  `boolean`

  `inactive`

  `boolean`

  `indoorZombie`

  `private boolean`

  `isSkeleton`

  `private ArrayList<InventoryItem>`

  `itemsToSpawnAtDeath`

  `protected final ItemVisuals`

  `itemVisuals`

  `private boolean`

  `jawStabAttach`

  `boolean`

  `keepItReal`

  `private boolean`

  `knifeDeath`

  `boolean`

  `laceration`

  `long`

  `lastChangeOwner`

  `BodyPartType`

  `lastHitPart`

  `int`

  `lastPlayerHit`

  `private static final Vector2`

  `lastPosition`

  `short`

  `lastRemoteUpdate`

  `int`

  `lastTargetSeenX`

  `int`

  `lastTargetSeenY`

  `int`

  `lastTargetSeenZ`

  `static final float`

  `LUNGE_TIME`

  `boolean`

  `lunger`

  `long`

  `lungeSoundTime`

  `float`

  `lungeTimer`

  `private static final zombie.core.skinnedmodel.animation.sharedskele.SharedSkeleAnimationRepository`

  `m_sharedSkeleRepo`

  `int`

  `memory`

  `float`

  `movex`

  `float`

  `movey`

  `private final zombie.core.utils.OnceEvery`

  `networkUpdate`

  `private boolean`

  `noTeeth`

  `short`

  `onlineId`

  `private boolean`

  `onlyJawStab`

  `private final int`

  `palette`

  `static final int`

  `PALETTE_COUNT`

  `final zombie.audio.parameters.ParameterCharacterInside`

  `parameterCharacterInside`

  `private final zombie.audio.parameters.ParameterCharacterMovementSpeed`

  `parameterCharacterMovementSpeed`

  `final zombie.audio.parameters.ParameterCharacterOnFire`

  `parameterCharacterOnFire`

  `private final zombie.audio.parameters.ParameterFootstepMaterial`

  `parameterFootstepMaterial`

  `private final zombie.audio.parameters.ParameterFootstepMaterial2`

  `parameterFootstepMaterial2`

  `final zombie.audio.parameters.ParameterPlayerDistance`

  `parameterPlayerDistance`

  `private final zombie.audio.parameters.ParameterShoeType`

  `parameterShoeType`

  `private final zombie.audio.parameters.ParameterVehicleHitLocation`

  `parameterVehicleHitLocation`

  `final zombie.audio.parameters.ParameterZombieState`

  `parameterZombieState`

  `String`

  `pendingOutfitName`

  `private String`

  `playerAttackPosition`

  `private boolean`

  `reanimate`

  `private boolean`

  `reanimatedForGrappleOnly`

  `private boolean`

  `reanimatedPlayer`

  `boolean`

  `remote`

  `boolean`

  `running`

  `private static final int`

  `s_saveFormatVersion`

  `boolean`

  `scratch`

  `private zombie.SharedDescriptors.Descriptor`

  `sharedDesc`

  `int`

  `sight`

  `private boolean`

  `sitAgainstWall`

  `float`

  `soundAttract`

  `float`

  `soundAttractTimeout`

  `private float`

  `soundReactDelay`

  `private boolean`

  `soundSourceIsPlayer`

  `private boolean`

  `soundSourceIsPlayerBase`

  `private boolean`

  `soundSourceRepeating`

  `Object`

  `soundSourceTarget`

  `static final byte`

  `SPEED_FAST_SHAMBLER`

  `static final byte`

  `SPEED_NONE`

  `static final byte`

  `SPEED_RANDOM`

  `static final byte`

  `SPEED_SHAMBLER`

  `static final byte`

  `SPEED_SPRINTER`

  `int`

  `speedType`

  `private int`

  `spotSoundDelay`

  `IsoMovingObject`

  `spottedLast`

  `static final boolean`

  `SPRINTER_FIXES`

  `String`

  `spriteName`

  `boolean`

  `staggerBack`

  `private int`

  `stepFrameLast`

  `int`

  `strength`

  `IsoMovingObject`

  `target`

  `private float`

  `targetSeenTime`

  `private static final ArrayList<IsoDeadBody>`

  `tempBodies`

  `private static final Map<String,String>`

  `temporaryMapCloseSneakBonusDir`

  `private static final Map<String,Float>`

  `temporaryMapCloseSneakBonusValue`

  `static final byte`

  `THUMP_FLAG_CHAINLINK_FENCE`

  `static final byte`

  `THUMP_FLAG_GARAGE_DOOR`

  `static final byte`

  `THUMP_FLAG_GENERIC`

  `static final byte`

  `THUMP_FLAG_METAL`

  `static final byte`

  `THUMP_FLAG_METAL_POLE_GATE`

  `static final byte`

  `THUMP_FLAG_WINDOW`

  `static final byte`

  `THUMP_FLAG_WINDOW_EXTRA`

  `static final byte`

  `THUMP_FLAG_WOOD`

  `private float`

  `thumpCondition`

  `int`

  `thumpFlag`

  `boolean`

  `thumpSent`

  `private int`

  `thumpTimer`

  `float`

  `timeSinceRespondToSound`

  `float`

  `timeSinceSeenFlesh`

  `private float`

  `unbalancedLevel`

  `private boolean`

  `useless`

  `final Vector2`

  `vectorToTarget`

  `private BaseVehicle`

  `vehicle4testCollision`

  `static final float`

  `VISION_DARKNESS_PENALTY_MAX`

  `static final float`

  `VISION_FOG_PENALTY_MAX`

  `static final float`

  `VISION_RADIUS_MAX`

  `static final float`

  `VISION_RADIUS_MIN`

  `static final float`

  `VISION_RAIN_PENALTY_MAX`

  `float`

  `visionRadiusResult`

  `private int`

  `voiceChoice`

  `private String`

  `walkType`

  `String`

  `walkVariant`

  `String`

  `walkVariantUse`

  `private boolean`

  `wasFakeDead`

  `int`

  `zombieId`

  `zombie.network.packets.character.ZombiePacket`

  `zombiePacket`

  `boolean`

  `zombiePacketUpdated`

  ### Fields inherited from class [IsoGameCharacter](IsoGameCharacter.html#field-summary "class in zombie.characters")

  `allowConversation, amputations, asleep, attachedItems, attackedBy, attackTargetSquare, attackVars, AwkwardGlovesStrengthDivisor, bagsWorn, beard, BeenMovingForDecrease, BeenMovingForIncrease, blockTurning, bodyDamage, bumpNbr, callOut, characterActions, characterTraits, chatElement, cheats, climbing, clothingWetness, clothingWetnessSync, damagedByVehicle, dead, delayToActuallySleep, descriptor, doDirtBloodEtc, emitter, enemyList, falling, fallTime, finder, forceNullOverride, forceWakeUp, forceWakeUpTime, forwardDirection, GlovesStrengthBonus, hair, handItemShouldSendToClients, health, HUMANOID_SCREEN_CHEST_HEIGHT, HUMANOID_WORLD_CHEST_HEIGHT, hurtSound, ignoreStaggerBack, inf, inventory, invRadioFreq, isOnGround, isoPlayer, isResting, isVisibleToPlayer, kill, knockbackAttackMod, lastAnimalPet, lastFallSpeed, leftHandItem, legsSprite, lightInfo, moodles, networkCharacter, numSurvivorsInVicinity, onFireLightSource, overridePrimaryHandModel, overrideSecondaryHandModel, pathing, persistentOutfitId, persistentOutfitInit, playingDeathSound, postUpdateInternal, primaryHandModel, realState, realx, realy, realz, reanimatedCorpse, reanimatedCorpseId, remoteId, removedFromWorldMs, RENDER_OFFSET_X, RENDER_OFFSET_Y, rightHandItem, runSpeedModifier, s_maxPossibleTwist, savedInventoryItems, savedVehicleRunning, savedVehicleSeat, savedVehicleX, savedVehicleY, secondaryHandModel, slowFactor, slowTimer, SNEAK_LIMP_INJURY_THRESHOLD, SNEAK_LIMP_SPEED_SCALE_DEFAULT, speakColour, speaking, speedMod, stats, tempItemVisuals, tempo, tempo2, tempo3, timeOfSleep, turnDeltaNormal, turnDeltaRunning, turnDeltaSprinting, updateEquippedTextures, updateInternal, useHandWeapon, useParts, userName, usernameDisguised, vbdebugHitTarget, vehicle, vocalEvent, WALK_SPEED_DEFAULT, WALK_SPEED_SLOW, wasKnockedDown, wornItems, xp`

  ### Fields inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#field-summary "class in zombie.iso")

  `collidable, current, def, hitDir, id, last, MAX_ZOMBIES_EATING, movementLastFrame, movingSq, noDamage, reqMovement, shootable, solid, treeSoundMgr, weight, width`

  ### Fields inherited from class [IsoObject](../iso/IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoZombie(IsoCell cell)`

  `IsoZombie(IsoCell cell,
  SurvivorDesc desc,
  int palette)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `actionStateChanged(zombie.characters.action.ActionContext sender)`

  `void`

  `addAggro(IsoMovingObject other,
  float damage)`

  `void`

  `addBloodFromVehicleImpact(float speed)`

  `void`

  `addFootstepParametersIfNeeded()`

  `void`

  `addItemToSpawnAtDeath(InventoryItem item)`

  `void`

  `addRandomBloodDirtHolesEtc()`

  `void`

  `addRandomVisualBandages()`

  Possibly add visual bandages (bloody) on the zombie
  TODO: Make InventoryItem linked to it in DeadBodyAtlas to being able to remove them (like primary/secondary weapons)

  `void`

  `addRandomVisualDamages()`

  `void`

  `addVisualBandage(BodyPartType bodyPart,
  boolean bloody)`

  `boolean`

  `allowsInvisibleAnimationSkips()`

  `protected void`

  `calculateStats()`

  `boolean`

  `canSeeHeadSquare(IsoPlayer player)`

  `boolean`

  `cantBite()`

  `private void`

  `checkClimbOverFenceHit()`

  `private void`

  `checkClimbThroughWindowHit()`

  `private void`

  `checkZombieEntersPlayerBuilding()`

  `void`

  `clearAggroList()`

  `void`

  `clearItemsToSpawnAtDeath()`

  `private void`

  `climbFenceWindowHit(int endX,
  int endY)`

  `private Float`

  `closeSneakBonusCoeff(IsoGridSquare sq,
  IsoDirections dir)`

  `void`

  `clothingItemChanged(String itemGuid)`

  `void`

  `collideWith(IsoObject obj)`

  `boolean`

  `couldSeeHeadSquare(IsoPlayer player)`

  `private void`

  `damageSheetRope()`

  `private int`

  `determineZombieSpeed(int zombieSpeed)`

  `void`

  `DoCorpseInventory()`

  `void`

  `doCrawlerSpeed(int zombieSpeed)`

  `private void`

  `doFakeShambler()`

  `void`

  `doFakeShambler(int zombieSpeed)`

  `void`

  `doFastShambler()`

  `void`

  `DoFootstepSound(float volume)`

  `void`

  `DoFootstepSound(String type)`

  `void`

  `doShambler()`

  `void`

  `doSprinter()`

  `void`

  `DoZombieInventory()`

  `private void`

  `DoZombieInventory(boolean bRandomCorpse)`

  `void`

  `doZombieSpeed()`

  `void`

  `doZombieSpeed(int zombieSpeed)`

  `private void`

  `doZombieSpeedInternal(int zombieSpeed)`

  `private void`

  `doZombieSpeedInternal2()`

  `private void`

  `doZombieSpeedInternal2(int zombieSpeed)`

  `void`

  `DoZombieSpeeds(float spMod)`

  `void`

  `DoZombieStats()`

  `void`

  `dressInClothingItem(String itemGUID)`

  `void`

  `dressInNamedOutfit(String outfitName)`

  `void`

  `dressInPersistentOutfitID(int outfitID)`

  `void`

  `dressInRandomOutfit()`

  `String`

  `GetAnimSetName()`

  `boolean`

  `getAttackDidDamage()`

  `String`

  `getAttackOutcome()`

  `String`

  `getBiteSoundName()`

  `int`

  `getCrawlerType()`

  `IsoMovingObject`

  `getEatBodyTarget()`

  `float`

  `getEatSpeed()`

  `float`

  `getFootstepVolume()`

  `IsoGridSquare`

  `getHeadSquare(IsoPlayer player)`

  `int`

  `getHitHeadWhileOnFloor()`

  `int`

  `getHitTime()`

  `HumanVisual`

  `getHumanVisual()`

  `ItemVisuals`

  `getItemVisuals()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `String`

  `getLastHitPart()`

  `zombie.characters.NetworkZombieAI`

  `getNetworkCharacterAI()`

  `String`

  `getObjectName()`

  `private float`

  `getObstacleMod(IsoGridSquare sq,
  IsoDirections dir)`

  `short`

  `getOnlineID()`

  `String`

  `getOutfitName()`

  `zombie.core.raknet.UdpConnection`

  `getOwner()`

  `IsoPlayer`

  `getOwnerPlayer()`

  `String`

  `getPlayerAttackPosition()`

  `String`

  `getRealState()`

  `IsoPlayer`

  `getReanimatedPlayer()`

  `protected int`

  `getSandboxMemoryDuration()`

  `int`

  `getScreenProperX(int playerIndex)`

  `int`

  `getScreenProperY(int playerIndex)`

  `zombie.SharedDescriptors.Descriptor`

  `getSharedDescriptor()`

  `int`

  `getSharedDescriptorID()`

  `private boolean`

  `getShouldAttack()`

  `int`

  `getSpeedType()`

  `static int`

  `getSpeedTypeFromWalkType(String walkType)`

  `IsoMovingObject`

  `getTarget()`

  `float`

  `getTargetSeenTime()`

  `float`

  `getThumpCondition()`

  `int`

  `getThumpTimer()`

  `float`

  `getTurnDelta()`

  `float`

  `getUnbalancedLevel()`

  `private float`

  `getVisionRadiusAdjusted(float darknessPenalty,
  float rainPenalty,
  float fogPenalty)`

  `zombie.core.skinnedmodel.visual.BaseVisual`

  `getVisual()`

  `int`

  `getVoiceChoice()`

  `String`

  `getVoiceSoundName()`

  `String`

  `getWalkType()`

  `void`

  `getZombieLungeSpeed()`

  `void`

  `getZombieWalkTowardSpeed(float speed,
  float dist,
  Vector2 temp)`

  `protected void`

  `handleLandingImpact(zombie.characters.FallDamage fallDamage)`

  `boolean`

  `helmetFallFromVisuals(boolean hitHead)`

  `float`

  `Hit(HandWeapon weapon,
  IsoGameCharacter wielder,
  float damageSplit,
  boolean bIgnoreDamage,
  float modDelta,
  boolean bRemote)`

  `void`

  `hitConsequences(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean bIgnoreDamage,
  float damage,
  boolean bRemote)`

  `void`

  `initCanCrawlUnderVehicle()`

  `private void`

  `initFMODParameters()`

  `void`

  `initializeStates()`

  `void`

  `InitSpritePartsZombie()`

  `void`

  `InitSpritePartsZombie(SurvivorDesc desc)`

  `boolean`

  `isAlwaysKnockedDown()`

  `boolean`

  `isAttacking()`

  `boolean`

  `isBecomeCrawler()`

  `boolean`

  `isCanCrawlUnderVehicle()`

  `boolean`

  `isCanWalk()`

  `boolean`

  `isCrawling()`

  `boolean`

  `isFacingTarget()`

  `boolean`

  `isFakeDead()`

  `boolean`

  `isForceEatingAnimation()`

  `boolean`

  `isForceFakeDead()`

  `boolean`

  `isGettingUp()`

  `boolean`

  `isHitLegsWhileOnFloor()`

  `private boolean`

  `isIdleOrStaggering()`

  `boolean`

  `isJawStabAttach()`

  `boolean`

  `isKnifeDeath()`

  `boolean`

  `isLeadAggro(IsoMovingObject other)`

  `boolean`

  `isMovingToPlayerSound()`

  `boolean`

  `isNoTeeth()`

  `boolean`

  `isOnlyJawStab()`

  `boolean`

  `isProne()`

  `boolean`

  `isPushableForSeparate()`

  `boolean`

  `isPushedByForSeparate(IsoMovingObject other)`

  `boolean`

  `isReanimate()`

  `boolean`

  `isReanimatedForGrappleOnly()`

  `boolean`

  `isReanimatedPlayer()`

  `boolean`

  `isRemoteZombie()`

  `boolean`

  `isRespondingToPlayerSound()`

  `private boolean`

  `isSideOfStaircaseBetweenSelfAndTarget()`

  `boolean`

  `isSitAgainstWall()`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isSkipResolveCollision()`

  Should this character ignore collision resolutions.

  `boolean`

  `isSolidForSeparate()`

  `boolean`

  `isStaggerBack()`

  `boolean`

  `isTargetInCone(float dist,
  float dot)`

  `boolean`

  `isTargetLocationKnown()`

  `boolean`

  `isTargetVisible()`

  `boolean`

  `isUseless()`

  `boolean`

  `isUsingWornItems()`

  `private boolean`

  `isVehicleBetween(float targetX,
  float targetY,
  float targetZ)`

  `boolean`

  `isZombie()`

  `boolean`

  `isZombieAttacking()`

  `boolean`

  `isZombieAttacking(IsoMovingObject other)`

  `void`

  `knockDown(boolean hitFromBehind)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `makeInactive(boolean binactive)`

  `void`

  `moveUnmodded(float dirX,
  float dirY)`

  `protected void`

  `OnAnimEvent_IsAlmostUp(IsoGameCharacter owner)`

  `protected void`

  `onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)`

  `boolean`

  `onDeath_ShouldDoSplatterAndSounds(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean isGory)`

  `private void`

  `onDied(IsoGameCharacter sender,
  IsoDeadBody body)`

  `float`

  `onHitByVehicle(BaseVehicle vehicle,
  float impactSpeed,
  Vector2 hitDir,
  Vector2 impactPosOnVehicle)`

  `protected void`

  `onHitByVehicleDriver(IsoGameCharacter vehicleDriver)`

  Called from onHitByVehicle   
  Handles what to do about the vehicle's driver.

  `void`

  `onKilled(IsoGameCharacter killer,
  HandWeapon handWeapon,
  boolean bGory)`

  `void`

  `onMouseLeftClick()`

  `void`

  `onWornItemsChanged()`

  `void`

  `onZombieGrappleEnded()`

  `void`

  `pathToCharacter(IsoGameCharacter target)`

  `void`

  `pathToLocationF(float x,
  float y,
  float z)`

  `long`

  `playHurtSound()`

  `protected void`

  `postHitByVehicleUpdateStance(float speed,
  boolean knockDownAllowed)`

  Update our reaction stance after a vehicle impact.

  `void`

  `postupdate()`

  `private void`

  `postUpdateInternal()`

  `void`

  `preupdate()`

  `private void`

  `processAggroList()`

  `void`

  `registerECSComponents()`

  `private void`

  `registerVariableCallbacks()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

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

  `renderAtlasTexture(float x,
  float y,
  float z)`

  `void`

  `renderlast()`

  `protected boolean`

  `renderTextureInsteadOfModel(float x,
  float y)`

  `private void`

  `renderTextureOverHead(String textureName)`

  `void`

  `resetForReuse()`

  `void`

  `RespondToSound()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setAlwaysKnockedDown(boolean alwaysKnockedDown)`

  `void`

  `setAsSurvivor()`

  `void`

  `setAttackDidDamage(boolean attackDidDamage)`

  `void`

  `setAttackOutcome(String attackOutcome)`

  `void`

  `setBecomeCrawler(boolean crawler)`

  `void`

  `setBodyToEat(IsoDeadBody body)`

  `void`

  `setCanCrawlUnderVehicle(boolean b)`

  `void`

  `setCanWalk(boolean bCanStand)`

  `void`

  `setCrawler(boolean crawling)`

  `void`

  `setCrawlerType(int crawlerType)`

  `void`

  `setDressInRandomOutfit(boolean dressInRandom)`

  `void`

  `setEatBodyTarget(IsoMovingObject target,
  boolean force)`

  `void`

  `setEatBodyTarget(IsoMovingObject target,
  boolean force,
  float eatSpeed)`

  `void`

  `setFakeDead(boolean bFakeDead)`

  `void`

  `setFemaleEtc(boolean female)`

  `void`

  `setForceEatingAnimation(boolean forceEatingAnimation)`

  `void`

  `setForceFakeDead(boolean bForceFakeDead)`

  `void`

  `setHitHeadWhileOnFloor(int hitHeadWhileOnFloor)`

  `void`

  `setHitLegsWhileOnFloor(boolean hitLegsWhileOnFloor)`

  `void`

  `setHitTime(int hitTime)`

  `void`

  `setImmortalTutorialZombie(boolean immortal)`

  `void`

  `setJawStabAttach(boolean bJawStabAttach)`

  `void`

  `setKnifeDeath(boolean bKnifeDeath)`

  `void`

  `setNoTeeth(boolean noTeeth)`

  `void`

  `setOnlyJawStab(boolean onlyJawStab)`

  `void`

  `setOwner(zombie.core.raknet.UdpConnection connection)`

  `void`

  `setOwnerPlayer(IsoPlayer player)`

  `void`

  `setPlayerAttackPosition(String playerAttackPosition)`

  `void`

  `setReanimate(boolean reanimate)`

  `void`

  `setReanimatedForGrappleOnly(boolean val)`

  `void`

  `setReanimatedPlayer(boolean reanimated)`

  `void`

  `setSitAgainstWall(boolean sitAgainstWall)`

  `void`

  `setSkeleton(boolean isSkeleton)`

  `void`

  `setSpeedTypeFromWalkType()`

  `void`

  `setStaggerBack(boolean bStaggerBack)`

  `void`

  `setTarget(IsoMovingObject t)`

  `void`

  `setTargetSeenTime(float seconds)`

  `void`

  `setThumpCondition(float condition)`

  `void`

  `setThumpCondition(int condition,
  int maxCondition)`

  `void`

  `setThumpFlag(int v)`

  `void`

  `setThumpTimer(int thumpTimer)`

  `void`

  `setTurnAlertedValues(int soundX,
  int soundY)`

  `void`

  `setUnbalancedLevel(float unbalancedLevel)`

  `void`

  `setUseless(boolean useless)`

  `void`

  `setVehicle4TestCollision(BaseVehicle vehicle)`

  `void`

  `setVehicleHitLocation(BaseVehicle vehicle)`

  Base method.

  `void`

  `setWalkType(String walkType)`

  `void`

  `setWasFakeDead(boolean wasFakeDead)`

  `private boolean`

  `shouldBecomeCrawler(IsoGameCharacter attacker)`

  `boolean`

  `shouldDoFenceLunge()`

  `boolean`

  `shouldDressInRandomOutfit()`

  `boolean`

  `shouldGetUpFromCrawl()`

  `protected boolean`

  `shouldSlideHeadAwayFromWalls()`

  `private boolean`

  `shouldStopThumpingToRespondToSound(WorldSoundManager.WorldSound sound)`

  `boolean`

  `shouldZombieHaveKey(boolean allowBandits)`

  `protected void`

  `slideHeadAwayFromWalls(boolean instant)`

  `void`

  `spotted(IsoMovingObject other,
  boolean bForced)`

  `void`

  `spottedNew(IsoMovingObject other,
  boolean bForced)`

  `void`

  `spottedOld(IsoMovingObject other,
  boolean bForced)`

  `void`

  `toggleCrawling()`

  `String`

  `toString()`

  `boolean`

  `tryThump(IsoGridSquare square)`

  `void`

  `update()`

  `private void`

  `updateActiveState()`

  `protected void`

  `updateAlpha(int playerIndex,
  float mul,
  float div)`

  `private void`

  `updateCharacterTextureAnimTime()`

  `private void`

  `updateEatBodyTarget()`

  `private void`

  `updateInternal()`

  `private void`

  `updateMovementStatistics()`

  `private void`

  `updateSearchForCorpse()`

  If zombie is idle, update the search for corpse timer, after it hit 0, we check for a nearby corpse to eat it

  `private void`

  `updateVisionRadius()`

  `void`

  `updateVocalProperties()`

  `private void`

  `updateZombieTripping()`

  `void`

  `useDescriptor(zombie.SharedDescriptors.Descriptor sharedDesc)`

  `void`

  `Wander()`

  `boolean`

  `WanderFromWindow()`

  `boolean`

  `wasFakeDead()`

  ### Methods inherited from class [IsoGameCharacter](IsoGameCharacter.html#method-summary "class in zombie.characters")

  `addArmMuscleStrain, addBackMuscleStrain, addBasicPatch, addBlood, addBodyVisualFromItemType, addBothArmMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addDirt, addHole, addHole, addHoleFromZombieAttacks, addKnownMediaLine, addLeftArmMuscleStrain, addLineChatElement, addLineChatElement, addLineChatElement, addLineChatElement, addLotsOfDirt, addNeckMuscleStrain, addOnDiedListener, addReadLiterature, addReadLiterature, addReadMap, addReadPrintMedia, addRightLegMuscleStrain, addStiffness, addVisualDamage, addWorldSoundUnlessInvisible, aimAtFloorTargetDistance, allowsTwist, applyCharacterTraitsRecipes, applyDamage, applyDamageFromVehicleHit, ApplyInBedOffset, applyProfessionRecipes, applyTraits, attackFromWindowsLunge, autoDrink, avoidDamage, becomeCorpseItem, BetaAntiDepress, BetaBlockers, bodyPartIsSpiked, bodyPartIsSpikedBehind, burnCorpse, CacheEquipped, calcCarForwardVector, calcCarPositionOffset, calcCarSpeedVector, calcCarSpeedVector, calcCarToPlayerVector, calcCarToPlayerVector, calcConeAngleMultiplier, calcConeAngleOffset, calcHitDir, calcHitDir, calcLengthMultiplier, calculateBaseSpeed, calculateCombatSpeed, calculateGrappleEffectivenessFromTraits, calculateIdleSpeed, calculateShadowParams, calculateShadowParams, calculateSneakLimpSpeedScale, calculateVisibilityData, calculateWalkSpeed, Callout, Callout, canAccessContainer, CanAttack, canBeGrappled, canClimbDownSheetRope, canClimbDownSheetRopeInCurrentSquare, canClimbSheetRope, canDropCorpseInto, canGrabCorpseFrom, canRagdoll, canReachTo, CanSee, CanSee, canSprint, canStandAt, canUseAsGenericCraftingSurface, canUseCurrentPoseForCorpse, canUseDebugContextMenu, canUseLootLog, canUseLootZed, CanUsePathfindState, carMovingBackward, causesDamageToVehicleWhenHit, changeState, checkCurrentAction, checkIsNearVehicle, checkIsNearWall, checkUpdateModelTextures, clear, clear, clearAIStateMap, clearAttachedItems, clearDiedBody, ClearEquippedCache, clearFallDamage, clearHitInfo, clearKnownMediaLines, clearVariable, ClearVariable, clearVariables, clearWornItems, climbDownSheetRope, climbOverFence, climbSheetRope, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindowFrame, closeWindow, compareMovePriority, createFallingItem, createKeyRing, createKeyRing, damageWhileInTrees, dbgGetAnimTrack, dbgGetAnimTrackName, dbgGetAnimTrackTime, dbgGetAnimTrackWeight, die, dieNetwork, DirectionFromVector, DoDeath, DoDeath, doDeathSplatterAndSounds, doDeferredMovement, doDeferredMovementFromRagdoll, DoFloorSplat, DoLand, doNetworkHitByVehicle, doSleepSpeech, DoSneezeText, DoSplat, DoSwingCollisionBoneCheck, drawDebugTextBelow, drawDirectionLine, drawDirectionLine, drawLine, DrawSneezeText, dressInPersistentOutfit, dressInRandomNonSillyOutfit, Dressup, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, dropHandItems, dropHeavyItems, dropHeldItems, Eat, Eat, Eat, EatOnClient, endPlaybackGameVariables, ensureExistsBallisticsTarget, ensureNotInVehicle, enterVehicle, exert, faceDirection, faceLocation, faceLocationF, facePosition, faceThisObject, faceThisObjectAlt, fallenOnKnees, fallenOnKnees, fallFromRope, FireCheck, flagForHotSave, forceAwake, forgetRecipes, get, get, getAbsoluteExcessTwist, getActionContext, getActionStateName, getActiveLightItems, getAdvancedAnimator, getAge, getAimAtFloorAmount, getAimingDelay, getAimingMode, getAimOriginPosX, getAimOriginPosY, getAimOriginPosZ, getAlphaUpdateRateMul, getAlreadyReadPages, getAnimAngle, getAnimAngleRadians, getAnimAngleStepDelta, getAnimAngleTwistDelta, getAnimatable, getAnimationDebug, getAnimationPlayer, getAnimationStateName, getAnimationTimeDelta, getAnimEventBroadcaster, getAnimForwardDirection, getAnimVector, getAppetiteMultiplier, getAttachedItem, getAttachedItems, getAttachedLocationGroup, getAttackedBy, getAttackingWeapon, getAttackTargetSquare, getAttackVars, getAutoWalkDirection, getBallisticsController, getBallisticsTarget, getBarricadeStrengthMod, getBarricadeTimeMod, getBed, getBedType, getBeenMovingFor, getBeenSprintingFor, getBetaDelta, getBetaEffect, getBloodImpactX, getBloodImpactY, getBloodImpactZ, getBloodSplat, getBlurFactor, getBodyDamage, getBodyDamageRemote, getBodyLocationGroup, getBodyPartClothingDefense, getBumpedChr, getBumpFallType, getBumpType, getCardinalDirection, getCardinalDirectionTo, getCharacterActions, getCharacterGender, getCharacterTraits, getChatElement, getCheats, getChestHeight, getChopTreeSpeed, getClickSound, getClimbData, getClimbingFailChanceFloat, getClimbingFailChanceInt, getClimbRopeSpeed, getClimbRopeTime, getClothingDiscomfortModifier, getClothingItem_Back, getClothingItem_Feet, getClothingItem_Hands, getClothingItem_Head, getClothingItem_Legs, getClothingItem_Torso, getClothingWetness, getClothingWetnessSync, getContainers, getContainerToolTip, getContextWorldContainers, getContextWorldContainers, getContextWorldContainersInObjects, getContextWorldContainersWithHumanCorpse, getContextWorldSuitableContainersToDropCorpseInObjects, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessRate, getCurrentActionContextStateName, getCurrentBuildingDef, getCurrentRoomDef, getCurrentState, getCurrentStateName, getCurrentVerticalAimAngle, getDangerLevels, getDebugMonitor, getDefaultState, getDeferredAngleDelta, getDeferredMovement, getDeferredMovement, getDeferredMovementFromRagdoll, getDeferredRotationWeight, getDepressDelta, getDepressEffect, getDescription, getDescriptor, getDetectionRange, getDieCount, getDirectionAngle, getDirectionAngleRadians, getDotWithForwardDirection, getDotWithForwardDirection, getEffectiveFatigue, getEmitter, getEnemyList, getEquipedRadio, getExcessTwist, getFallSpeedSeverity, getFallTime, getFamiliarBuildings, getFatigueMod, getFatiqueMultiplier, getFinder, getFireKillRate, getFireMode, getFireSpreadProbability, getFMODParameters, getFollowingTarget, getFootInjurySpeedModifier, getForceWakeUpTime, getForwardDirection, getForwardDirection, getForwardDirectionX, getForwardDirectionY, getForwardMovementIsoDirection, getFreeInventoryCapacity, getFullName, getGameVariables, getGameVariablesInternal, getGlobalMovementMod, getGrappleable, getHaloTimerCount, getHammerSoundMod, getHeadLookAngleMax, getHeadLookHorizontal, getHeadLookVertical, getHealth, getHearDistanceModifier, getHeightAboveFloor, getHitChancesMod, getHitDirEnum, getHitInfoList, getHitReaction, getHitReactionNetworkAI, getHittingMod, getHoursSurvived, getHungerMultiplier, getHurtSound, getHyperthermiaMod, getIdleSquareTime, getIgnoreMovement, getImpactIsoSpeed, getInf, getInventory, getInventoryWeight, getKnownRecipes, getLastBump, getLastChatMessage, getLastFallSpeed, getLastHeardSound, getLastHitCharacter, getLastHitCount, getLastHourSleeped, getLastKnownLocation, getLastKnownLocationOf, getLastLocalEnemies, getLastSpokenLine, getLastZombieKills, getLeaveBodyTimedown, getLegsSprite, getLevelMaxForXp, getLevelUpLevels, getLevelUpLevels, getLevelUpMultiplier, getLightfootMod, getLightInfo2, getLlx, getLly, getLlz, getLocalEnemyList, getLocalGroupList, getLocalList, getLocalNeutralList, getLocalRelevantEnemyList, getLookAngleRadians, getLookDirectionX, getLookDirectionY, getLookVector, getLowDangerInVicinity, getMaintenanceMod, getMapKnowledge, getMass, getMaxChatLines, getMaxTwist, getMaxWeight, getMaxWeightBase, getMeleeCombatMod, getMeleeDelay, getMetalBarricadeStrengthMod, getMinimumSimulationLevel, getModel, getModelInstance, getMomentumScalar, getMoodles, getMoveDelta, getMoveForwardVec, getMovementSpeed, getMusicIntensityEventModData, getNameCoords, getNearVehicle, getNextAnimationTranslationLength, getNextWander, getNimbleMod, getNumSurvivorsInVicinity, getNumTwistBones, getOrCreateSleepingEventData, getPacingMod, getPainDelta, getPainEffect, getPath2, getPathFindBehavior2, getPathIndex, getPathTargetX, getPathTargetY, getPathTargetZ, getPatience, getPatienceMax, getPatienceMin, getPerkInfo, getPerkLevel, getPerkList, getPerkToUnit, getPersistentOutfitID, getPreviousActionContextStateName, getPreviousStateName, GetPrimaryEquippedCache, getPrimaryHandItem, getPrimaryHandType, getRagdollController, getRandomDefaultOutfit, getReadLiterature, getReadPrintMedia, getReadyModelData, getReanimAnimDelay, getReanimAnimFrame, getReanimatedCorpse, getReanimateTimer, getRecoilDelay, getRecoilVarX, getRecoilVarY, getRecoveryMod, getReduceInfectionPower, getRemoteID, getRunSpeedModifier, getSafety, getSayLine, GetSecondaryEquippedCache, getSecondaryHandItem, getSecondaryHandType, getShoulderTwist, getShoulderTwistWeight, getShoutItemModel, getShoutType, getShovingMod, getSitOnFurnitureDirection, getSitOnFurnitureObject, getSleepingTabletDelta, getSleepingTabletEffect, getSlowFactor, getSlowTimer, getSneakLimpSpeedScale, getSneakSpotMod, getSpeakColour, getSpeakTime, getSpeedMod, getSprintMod, getSpriteDef, getStaggerTimeMod, getStateMachine, getStateMachineComponent, getStateMachineParams, getStatisticsDebug, getStats, getSubVariableSource, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpseInSquare, getSuitableContainersToDropCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSurroundingAttackingZombies, getSurroundingAttackingZombies, getSurvivorKills, getSurvivorMap, getTalkerType, getTargetGrapplePos, getTargetGrapplePos, getTargetGrappleRotation, getTargetTwist, getTargetVerticalAimAngle, getTempo, getTempo2, getTextureCreator, getThirstMultiplier, getThreatLevel, getTimedActionTimeModifier, getTimeSinceLastSmoke, getTimeThumping, getTorchStrength, getTotalBlood, getTwist, getUsedItemsOn, getUseHandWeapon, getUserNameHeight, getVariable, GetVariable, getVehicle, getVehicleDiscomfortModifier, getVeryCloseEnemyList, getWaterSource, getWeaponLevel, getWeaponLevel, getWeatherHearingMultiplier, getWeightAsCorpse, getWeightMod, getWeldingSoundMod, getWornItem, getWornItems, getWornItemsHearingModifier, getWornItemsHearingMultiplier, getWornItemsVisionModifier, getWornItemsVisionMultiplier, getWrappedGrappleable, getXp, getXpForLevel, getZombieKills, hasActiveModel, hasAnimationPlayer, hasAwkwardHands, hasBloodyClothing, hasDirtyClothing, hasEquipped, hasEquippedTag, hasFootInjury, hasFullInventory, hasHitReaction, HasItem, hasItems, hasPath, hasReadMap, hasRecipeAtHand, hasTimedActions, hasTrait, hasTrait, hasWornTag, helmetFall, Hit, Hit, initAttachedItems, initLightInfo2, InitSpriteParts, initSpritePartsEmpty, initTextObjects, initWornItems, isAboveTopOfStairs, isActuallyAttackingWithMeleeWeapon, isAddedToModelManager, isAimAtFloor, isAiming, isAimingFirearmEquipped, isAlive, isAllowConversation, isAlwaysDayCheat, isAnimal, isAnimalCheat, isAnimalExtraValuesCheat, isAnimalRunningToDeathPosition, isAnimatingBackwards, isAnimationUpdatingThisFrame, isAnimForecasted, isAsleep, isAttachedItem, IsAttackRange, isAutoWalk, isbDoDefer, isBehaviourMoving, isBehind, isBeingSteppedOn, isbFalling, isbOnBed, isBuildCheat, isBumpDone, isBumped, isBumpFall, isBumpStaggered, isbUseParts, isCanShout, isCanUseBrushTool, isCheatSet, isClimbing, isClimbingRope, isClimbingThroughWindow, isClosingWindow, isCriticalHit, isCurrentActionAllowedWhileDraggingCorpses, isCurrentActionPathfinding, isCurrentGameClientState, isCurrentlyBusy, isCurrentlyIdle, isCurrentState, isDead, isDeathDragDown, isDeferredMovementEnabled, isDisguised, isDoDeathSound, isDoingActionThatCanBeCancelled, isDoStomp, isDraggingCorpse, isDriving, isDuplicateBodyVisual, isEditingRagdoll, isEnduranceSufficientForAction, isEquipped, isEquippedClothing, isFacingLocation, isFacingObject, isFalling, isFallOnFront, isFarmingCheat, isFastMoveCheat, isFemale, isFishingCheat, isFullyRagdolling, isGodMod, isGrappleThrowIntoContainer, isGrappleThrowOutWindow, isGrappleThrowOverFence, isHandItem, isHandModelOverriddenByCurrentCharacterAction, isHeadLookAround, isHealthCheat, isHeavyItem, isHideEquippedHandL, isHideEquippedHandR, isHideWeaponModel, isHitFromBehind, isIgnoreMovementForDirection, isIgnoreStaggerBack, isImpactFromBehind, isImpactFromBehind, isImpactFromBehind, isInARoom, isInTrees, isInTrees2, isInTreesNoBush, isInventive, isInvincible, isInvisible, isInvulnerable, isItemInBothHands, isKilledByFall, isKilledBySlicingWeapon, isKnockedDown, isKnowAllRecipes, isKnownMediaLine, isKnownPoison, isKnownPoison, isLastCollidedN, isLastCollidedW, isLiteratureRead, isLocal, isMaskClicked, isMechanicsCheat, isMeleeAttackRange, isMeleeWeaponEquipped, isMovablesCheat, isMoving, isNearSirenVehicle, isNetworkVehicleCollisionActive, isNpc, isObjectBehind, isOnBack, isOnBed, isOnDeathDone, isOnFire, isOnKillDone, isOutside, isOverEncumbered, isPathing, isPerformingAttackAnimation, isPerformingGrappleAnimation, isPerformingHostileAnimation, isPerformingNoAimShortStrafe, isPerformingShoveAnimation, isPerformingStompAnimation, isPersistentOutfitInit, isPlayerMoving, isPlayingDeathSound, isPrimaryEquipped, isPrimaryHandItem, isPrimaryHandModelReady, isPrintMediaRead, isProtectedFromToxic, isProtectedFromToxic, isRagdoll, isRagdollFall, isRagdollSimulationActive, isRangedWeaponEmpty, isRangedWeaponEquipped, isReading, isReanim, isRecipeActuallyKnown, isRecipeActuallyKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRemote, isResting, isRunning, isSeatedInVehicle, isSecondaryHandItem, isShoveStompAnim, isShoving, isShowAdminTag, isSitOnFurnitureObject, isSitOnGround, isSitting, isSittingOnFurniture, isSneaking, isSpeaking, IsSpeaking, IsSpeakingNPC, isSprinting, isStrafing, isTimedActionInstant, isTimedActionInstantCheat, isTurning, isTurning90, isTurningAround, isTwisting, isUnarmed, isUnderVehicle, isUnderVehicleRadius, isUnlimitedAmmo, isUnlimitedCarry, isUnlimitedEndurance, isUpdateAlphaDuringRender, isUpright, isVehicleCollision, isVisibleToNPCs, isWeaponReady, isWearingAwkwardGloves, isWearingGlasses, isWearingGloves, isWearingTag, isWearingVisualAid, isZombiesDontAttack, Kill, Kill, Kill, Kill, learnRecipe, learnRecipe, level0, LevelPerk, LevelPerk, loadChange, loadKnownMediaLines, LoseLevel, modifyTraitXPBoost, modifyTraitXPBoost, MoveForward, nearbyZombieClimbPenalty, OnAnimEvent, OnAnimEvent_KilledByAttacker, OnClothingUpdated, OnDeath, OnEquipmentUpdated, onFireLightSourceCheck, onHitByVehicleApplyDamage, onMouseLeftClick, onRagdollSimulationStarted, onTrigger_setAnimStateToTriggerFile, onTrigger_setClothingToXmlTriggerFile, openWindow, PainMeds, pathToAux, pathToLocation, pathToSound, pickUpCorpse, pickUpCorpseItem, PlayAnim, PlayAnimUnlooped, PlayAnimWithSpeed, playbackRecordCurrentStateSnapshot, playbackSetCurrentStateSnapshot, playBloodSplatterSound, playDeadSound, playDropItemSound, playEmote, playerIsSelf, playPainVoicesFromFallDamage, playSound, playSoundLocal, playWeaponHitArmourSound, postAnimationFinishing, postUpdateEquippedTextures, postUpdateModelTextures, processHitDamage, QueueAction, readInventory, ReadLiterature, ReduceHealthWhenBurning, registerAIState, releaseAnimationPlayer, releaseBallisticsController, releaseBallisticsTarget, releaseRagdollController, reloadOutfit, remove, removeAttachedItem, removeFromHands, removeKnownMediaLine, removeOnFireLightSource, removeWornItem, removeWornItem, renderObjectPicker, renderServerGUI, renderShadow, reportEvent, resetAimingDelay, resetBeardGrowingTime, resetBodyDamageRemote, resetEquippedHandsModels, resetHairGrowingTime, resetModel, resetModelNextFrame, saveChange, saveKnownMediaLines, Say, Say, SayDebug, SayDebug, SayRadio, SayShout, SayWhisper, Seen, set, setAddedToModelManager, setAge, setAimAtFloor, setAimAtFloor, setAimingDelay, setAllowConversation, setAlreadyReadPages, setAlwaysDayCheat, setAnimalCheat, setAnimalExtraValuesCheat, setAnimated, setAnimatingBackwards, setAnimForecasted, setAsleep, setAttachedItem, setAttachedItems, setAttackedBy, setAttackTargetSquare, setAutoWalk, setAutoWalkDirection, setAvoidDamage, setbClimbing, setbDoDefer, setBed, setBedType, setBeenMovingFor, setBeenSprintingFor, setBetaDelta, setBetaEffect, setbFalling, setBloodImpactX, setBloodImpactY, setBloodImpactZ, setBloodSplat, setbOnBed, setBuildCheat, setBumpDone, setBumpedChr, setBumpFall, setBumpFallType, setBumpStaggered, setBumpType, setbUseParts, setCanShout, setCanUseBrushTool, setCanUseDebugContextMenu, setCanUseLootLog, setCanUseLootZed, setCharacterGender, setClickSound, setClimbData, setClimbRopeTime, setClothingItem_Back, setClothingItem_Feet, setClothingItem_Hands, setClothingItem_Head, setClothingItem_Legs, setClothingItem_Torso, setCorpseSicknessRate, setCriticalHit, setCurrentVerticalAimAngle, setDangerLevels, setDeathDragDown, setDebugMonitor, setDefaultState, setDefaultState, setDeferredMovementEnabled, setDelayToSleep, setDepressDelta, setDepressEffect, setDescriptor, setDieCount, setDirectionAngle, setDoDeathSound, setEditingRagdoll, setEquipParent, setEquipParent, setFallOnFront, setFallTime, setFarmingCheat, setFastMoveCheat, setFemale, setFireKillRate, setFireMode, setFireSpreadProbability, setFishingCheat, setFollowingTarget, setForceWakeUpTime, setForwardDirection, setForwardDirection, setForwardDirectionFromAnimAngle, setForwardDirectionFromIsoDirection, setForwardIsoDirection, setGodMod, setGodMod, setGrappleThrowIntoContainer, setGrappleThrowOutWindow, setGrappleThrowOverFence, setHaloNote, setHaloNote, setHaloNote, setHeadLookAround, setHeadLookAroundDirection, setHealth, setHealthCheat, setHideEquippedHandL, setHideEquippedHandR, setHideWeaponModel, setHitDir, setHitFromBehind, setHitReaction, setHurtSound, setIgnoreMovement, setIgnoreStaggerBack, setInventory, setInvincible, setInvisible, setInvisible, setInvulnerable, setIsAiming, setIsAnimal, setIsResting, setKilledByFall, setKnockedDown, setKnowAllRecipes, setLastBump, setLastChatMessage, setLastCollidedN, setLastCollidedW, setLastFallSpeed, setLastHeardSound, setLastHitCharacter, setLastHitCount, setLastHourSleeped, setLastLocalEnemies, setLastSpokenLine, setLastZombieKills, setLeaveBodyTimedown, setLegsSprite, setLevelUpMultiplier, setLlx, setLly, setLlz, setMaxTwist, setMaxWeight, setMaxWeightBase, setMechanicsCheat, setMeleeDelay, setMetabolicTarget, setMetabolicTarget, setMomentumScalar, setMovablesCheat, setMoveDelta, setMoveForwardVec, setMoving, setMusicIntensityEventModData, setNextWander, setNumSurvivorsInVicinity, setOnBed, setOnDeathDone, setOnFire, SetOnFire, setOnKillDone, setPainDelta, setPainEffect, setPath2, setPathIndex, setPathing, setPathSpeed, setPatience, setPatienceMax, setPatienceMin, setPerformingAttackAnimation, setPerformingShoveAnimation, setPerformingStompAnimation, setPerkLevelDebug, setPersistentOutfitID, setPersistentOutfitID, setPlayingDeathSound, setPrimaryHandItem, setRagdollFall, setRangedWeaponEmpty, setReading, setReanim, setReanimAnimDelay, setReanimAnimFrame, setReanimateTimer, setRecoilDelay, setRecoilVarX, setRecoilVarY, setReduceInfectionPower, setRemoteID, setRunning, setSafety, setSayLine, setSceneCulled, setSecondaryHandItem, setShoveStompAnim, setShowAdminTag, setSitOnFurnitureDirection, setSitOnFurnitureObject, setSitOnGround, setSittingOnFurniture, setSleepingTabletDelta, setSleepingTabletEffect, setSlowFactor, setSlowTimer, setSneaking, setSneakLimpSpeedScale, setSpeakColour, setSpeakColourInfo, setSpeaking, setSpeakTime, setSpeedMod, setSprinting, setStaggerTimeMod, setStateMachineLocked, setSurvivorKills, setTargetAndCurrentDirection, setTargetGrapplePos, setTargetVerticalAimAngle, setTextureCreator, setTimedActionInstantCheat, setTimeOfSleep, setTimeSinceLastSmoke, setTimeThumping, setTurnDelta, setUnlimitedAmmo, setUnlimitedCarry, setUnlimitedEndurance, setUseHandWeapon, setUsePhysicHitReaction, setVariable, setVariable, setVariable, setVariable, setVariable, SetVariable, setVariableEnum, setVehicle, setVehicleCollision, setVisibleToNPCs, setWornItem, setWornItem, setWornItems, setXp, setZombieKills, setZombiesDontAttack, shouldBecomeZombieAfterDeath, shouldBeFalling, shouldBePushedBackByVehicleHit, shouldBeTurning, shouldBeTurning90, shouldBeTurningAround, shouldIgnoreCollisionWithSquare, shouldSnapZToCurrentSquare, shouldWaitToStartTimedAction, SleepingTablet, slideAwayFromWalls, smashCarWindow, smashWindow, spikePart, spikePartIndex, spinToZeroAllAnimNodes, splatBlood, splatBloodFloor, splatBloodFloorBig, SpreadFire, SpreadFireMP, StartAction, startEvent, startPlaybackGameVariables, StartTimedActionAnim, StartTimedActionAnim, StopAllActionQueue, StopAllActionQueueAiming, StopAllActionQueueRunning, StopAllActionQueueWalking, StopBurning, stopEvent, stopOrTriggerSound, StopTimedActionAnim, teleportTo, teleportTo, teleportTo, teleportTo, testCollideWithVehicles, testDefense, testDotSide, testDotSideEnum, TestIfSeen, Throw, throwGrappledIntoInventory, throwGrappledOverFence, throwGrappledTargetOutWindow, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerCough, tryGetAIState, updateAimingDelay, updateBallistics, updateBandages, updateDiscomfortModifiers, updateDisguisedState, updateEmitter, updateEquippedItemSounds, updateEquippedRadioFreq, updateEvent, updateForServerGui, updateHandEquips, updateHasTargetFlag, updateLightInfo, updateMovementMomentum, updateMovementRates, updateRecoilVar, updateSpeedModifiers, updateStats_Awake, updateStats_Sleeping, updateStats_WakeState, updateTextObjects, updateUserName, updateVisionEffects, updateVisionEffectTargets, updateWornItemsHearingModifier, updateWornItemsVisionModifier, usePhysicHitReaction, useRagdollVehicleCollision, wasLocal, zeroForwardDirectionX, zeroForwardDirectionY`

  ### Methods inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, doTreeNoises, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isOnFloor, isShootable, isSolid, isStanding, isWithinRange, moveUnmoddedInternal, onMouseRightClick, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, slideAwayToCollisionPos, snapZToCurrentSquare, snapZToCurrentSquareExact, updateAnimation`

  ### Methods inherited from class [IsoObject](../iso/IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, addToWorld, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

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

  `isFemale`

  ### Methods inherited from interface [ILuaIsoObject](../iso/ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.ai.IStateCharacter

  `canBeHitByVehicle, canCurrentStateRagdoll, canSlowDownVehicleWhenHit, hasCurrentState, isCurrentStateAttacking, isCurrentStateMoving`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### s\_saveFormatVersion

    private static final int s\_saveFormatVersion

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.s_saveFormatVersion)
  + ### SPEED\_NONE

    public static final byte SPEED\_NONE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPEED_NONE)
  + ### SPEED\_SPRINTER

    public static final byte SPEED\_SPRINTER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPEED_SPRINTER)
  + ### SPEED\_FAST\_SHAMBLER

    public static final byte SPEED\_FAST\_SHAMBLER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPEED_FAST_SHAMBLER)
  + ### SPEED\_SHAMBLER

    public static final byte SPEED\_SHAMBLER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPEED_SHAMBLER)
  + ### SPEED\_RANDOM

    public static final byte SPEED\_RANDOM

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPEED_RANDOM)
  + ### HEARING\_PINPOINT

    public static final byte HEARING\_PINPOINT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_PINPOINT)
  + ### HEARING\_NORMAL

    public static final byte HEARING\_NORMAL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_NORMAL)
  + ### HEARING\_POOR

    public static final byte HEARING\_POOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_POOR)
  + ### HEARING\_RANDOM

    public static final byte HEARING\_RANDOM

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_RANDOM)
  + ### HEARING\_NORMAL\_OR\_POOR

    public static final byte HEARING\_NORMAL\_OR\_POOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_NORMAL_OR_POOR)
  + ### THUMP\_FLAG\_GENERIC

    public static final byte THUMP\_FLAG\_GENERIC

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_GENERIC)
  + ### THUMP\_FLAG\_WINDOW\_EXTRA

    public static final byte THUMP\_FLAG\_WINDOW\_EXTRA

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_WINDOW_EXTRA)
  + ### THUMP\_FLAG\_WINDOW

    public static final byte THUMP\_FLAG\_WINDOW

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_WINDOW)
  + ### THUMP\_FLAG\_METAL

    public static final byte THUMP\_FLAG\_METAL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_METAL)
  + ### THUMP\_FLAG\_GARAGE\_DOOR

    public static final byte THUMP\_FLAG\_GARAGE\_DOOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_GARAGE_DOOR)
  + ### THUMP\_FLAG\_CHAINLINK\_FENCE

    public static final byte THUMP\_FLAG\_CHAINLINK\_FENCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_CHAINLINK_FENCE)
  + ### THUMP\_FLAG\_METAL\_POLE\_GATE

    public static final byte THUMP\_FLAG\_METAL\_POLE\_GATE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_METAL_POLE_GATE)
  + ### THUMP\_FLAG\_WOOD

    public static final byte THUMP\_FLAG\_WOOD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.THUMP_FLAG_WOOD)
  + ### tempBodies

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects")> tempBodies
  + ### alwaysKnockedDown

    private boolean alwaysKnockedDown
  + ### onlyJawStab

    private boolean onlyJawStab
  + ### forceEatingAnimation

    private boolean forceEatingAnimation
  + ### noTeeth

    private boolean noTeeth
  + ### AllowRepathDelayMax

    public static final int AllowRepathDelayMax

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.AllowRepathDelayMax)
  + ### SPRINTER\_FIXES

    public static final boolean SPRINTER\_FIXES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.SPRINTER_FIXES)
  + ### lastTargetSeenX

    public int lastTargetSeenX
  + ### lastTargetSeenY

    public int lastTargetSeenY
  + ### lastTargetSeenZ

    public int lastTargetSeenZ
  + ### ghost

    public boolean ghost
  + ### lungeTimer

    public float lungeTimer
  + ### lungeSoundTime

    public long lungeSoundTime
  + ### target

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target
  + ### timeSinceSeenFlesh

    public float timeSinceSeenFlesh
  + ### targetSeenTime

    private float targetSeenTime
  + ### canSeeTarget

    private boolean canSeeTarget
  + ### followCount

    public int followCount
  + ### zombieId

    public int zombieId
  + ### bonusSpotTime

    private float bonusSpotTime
  + ### staggerBack

    public boolean staggerBack
  + ### knifeDeath

    private boolean knifeDeath
  + ### jawStabAttach

    private boolean jawStabAttach
  + ### becomeCrawler

    private boolean becomeCrawler
  + ### fakeDead

    private boolean fakeDead
  + ### forceFakeDead

    private boolean forceFakeDead
  + ### wasFakeDead

    private boolean wasFakeDead
  + ### reanimate

    private boolean reanimate
  + ### atlasTex

    public zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture atlasTex
  + ### reanimatedPlayer

    private boolean reanimatedPlayer
  + ### indoorZombie

    public boolean indoorZombie
  + ### thumpFlag

    public int thumpFlag
  + ### thumpSent

    public boolean thumpSent
  + ### thumpCondition

    private float thumpCondition
  + ### EAT\_BODY\_DIST

    public static final float EAT\_BODY\_DIST

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.EAT_BODY_DIST)
  + ### EAT\_BODY\_TIME

    public static final float EAT\_BODY\_TIME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.EAT_BODY_TIME)
  + ### LUNGE\_TIME

    public static final float LUNGE\_TIME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.LUNGE_TIME)
  + ### CRAWLER\_DAMAGE\_DOT

    public static final float CRAWLER\_DAMAGE\_DOT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.CRAWLER_DAMAGE_DOT)
  + ### CRAWLER\_DAMAGE\_RANGE

    public static final float CRAWLER\_DAMAGE\_RANGE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.CRAWLER_DAMAGE_RANGE)
  + ### useless

    private boolean useless
  + ### speedType

    public int speedType
  + ### group

    public zombie.characters.ZombieGroup group
  + ### inactive

    public boolean inactive
  + ### strength

    public int strength
  + ### cognition

    public int cognition
  + ### memory

    public int memory
  + ### sight

    public int sight
  + ### hearing

    public int hearing
  + ### itemsToSpawnAtDeath

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> itemsToSpawnAtDeath
  + ### voiceChoice

    private int voiceChoice
  + ### soundReactDelay

    private float soundReactDelay
  + ### delayedSound

    private final [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters") delayedSound
  + ### soundSourceRepeating

    private boolean soundSourceRepeating
  + ### soundSourceIsPlayer

    private boolean soundSourceIsPlayer
  + ### soundSourceIsPlayerBase

    private boolean soundSourceIsPlayerBase
  + ### soundSourceTarget

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") soundSourceTarget
  + ### soundAttract

    public float soundAttract
  + ### soundAttractTimeout

    public float soundAttractTimeout
  + ### alerted

    public boolean alerted
  + ### walkType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") walkType
  + ### footstepVolume

    private float footstepVolume
  + ### sharedDesc

    private zombie.SharedDescriptors.Descriptor sharedDesc
  + ### dressInRandomOutfit

    public boolean dressInRandomOutfit
  + ### pendingOutfitName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pendingOutfitName
  + ### humanVisual

    private final [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual
  + ### crawlerType

    private int crawlerType
  + ### playerAttackPosition

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") playerAttackPosition
  + ### eatSpeed

    private float eatSpeed
  + ### sitAgainstWall

    private boolean sitAgainstWall
  + ### CHECK\_FOR\_CORPSE\_TIMER\_MAX

    private static final int CHECK\_FOR\_CORPSE\_TIMER\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.CHECK_FOR_CORPSE_TIMER_MAX)
  + ### checkForCorpseTimer

    private float checkForCorpseTimer
  + ### bodyToEat

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") bodyToEat
  + ### eatBodyTarget

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") eatBodyTarget
  + ### hitTime

    private int hitTime
  + ### thumpTimer

    private int thumpTimer
  + ### hitLegsWhileOnFloor

    private boolean hitLegsWhileOnFloor
  + ### collideWhileHit

    public boolean collideWhileHit
  + ### characterTextureAnimTime

    private float characterTextureAnimTime
  + ### characterTextureAnimDuration

    private float characterTextureAnimDuration
  + ### lastPlayerHit

    public int lastPlayerHit
  + ### VISION\_RADIUS\_MAX

    public static final float VISION\_RADIUS\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.VISION_RADIUS_MAX)
  + ### VISION\_RADIUS\_MIN

    public static final float VISION\_RADIUS\_MIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.VISION_RADIUS_MIN)
  + ### visionRadiusResult

    public float visionRadiusResult
  + ### VISION\_FOG\_PENALTY\_MAX

    public static final float VISION\_FOG\_PENALTY\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.VISION_FOG_PENALTY_MAX)
  + ### VISION\_RAIN\_PENALTY\_MAX

    public static final float VISION\_RAIN\_PENALTY\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.VISION_RAIN_PENALTY_MAX)
  + ### VISION\_DARKNESS\_PENALTY\_MAX

    public static final float VISION\_DARKNESS\_PENALTY\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.VISION_DARKNESS_PENALTY_MAX)
  + ### HEARING\_UNSEEN\_OFFSET\_MIN

    public static final int HEARING\_UNSEEN\_OFFSET\_MIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_UNSEEN_OFFSET_MIN)
  + ### HEARING\_UNSEEN\_OFFSET\_HEAVY\_RAIN

    public static final int HEARING\_UNSEEN\_OFFSET\_HEAVY\_RAIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_UNSEEN_OFFSET_HEAVY_RAIN)
  + ### HEARING\_UNSEEN\_OFFSET\_MAX

    public static final int HEARING\_UNSEEN\_OFFSET\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.HEARING_UNSEEN_OFFSET_MAX)
  + ### itemVisuals

    protected final [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals
  + ### hitHeadWhileOnFloor

    private int hitHeadWhileOnFloor
  + ### attackDidDamage

    private boolean attackDidDamage
  + ### attackOutcome

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attackOutcome
  + ### reanimatedForGrappleOnly

    private boolean reanimatedForGrappleOnly
  + ### imposter

    public zombie.characters.Imposter imposter
  + ### spottedLast

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") spottedLast
  + ### vehicle4testCollision

    private [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle4testCollision
  + ### spotSoundDelay

    private int spotSoundDelay
  + ### movex

    public float movex
  + ### movey

    public float movey
  + ### stepFrameLast

    private int stepFrameLast
  + ### networkUpdate

    private final zombie.core.utils.OnceEvery networkUpdate
  + ### lastRemoteUpdate

    public short lastRemoteUpdate
  + ### onlineId

    public short onlineId
  + ### spriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName
  + ### PALETTE\_COUNT

    public static final int PALETTE\_COUNT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoZombie.PALETTE_COUNT)
  + ### vectorToTarget

    public final [Vector2](../iso/Vector2.html "class in zombie.iso") vectorToTarget
  + ### allowRepathDelay

    public float allowRepathDelay
  + ### keepItReal

    public boolean keepItReal
  + ### isSkeleton

    private boolean isSkeleton
  + ### parameterCharacterInside

    public final zombie.audio.parameters.ParameterCharacterInside parameterCharacterInside
  + ### parameterCharacterMovementSpeed

    private final zombie.audio.parameters.ParameterCharacterMovementSpeed parameterCharacterMovementSpeed
  + ### parameterCharacterOnFire

    public final zombie.audio.parameters.ParameterCharacterOnFire parameterCharacterOnFire
  + ### parameterFootstepMaterial

    private final zombie.audio.parameters.ParameterFootstepMaterial parameterFootstepMaterial
  + ### parameterFootstepMaterial2

    private final zombie.audio.parameters.ParameterFootstepMaterial2 parameterFootstepMaterial2
  + ### parameterPlayerDistance

    public final zombie.audio.parameters.ParameterPlayerDistance parameterPlayerDistance
  + ### parameterShoeType

    private final zombie.audio.parameters.ParameterShoeType parameterShoeType
  + ### parameterVehicleHitLocation

    private final zombie.audio.parameters.ParameterVehicleHitLocation parameterVehicleHitLocation
  + ### parameterZombieState

    public final zombie.audio.parameters.ParameterZombieState parameterZombieState
  + ### scratch

    public boolean scratch
  + ### laceration

    public boolean laceration
  + ### zombiePacket

    public zombie.network.packets.character.ZombiePacket zombiePacket
  + ### zombiePacketUpdated

    public boolean zombiePacketUpdated
  + ### lastChangeOwner

    public long lastChangeOwner
  + ### bloodSplatAmount

    public int bloodSplatAmount
  + ### lastPosition

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") lastPosition
  + ### currentPosition

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") currentPosition
  + ### lastHitPart

    public [BodyPartType](BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") lastHitPart
  + ### timeSinceRespondToSound

    public float timeSinceRespondToSound
  + ### m\_sharedSkeleRepo

    private static final zombie.core.skinnedmodel.animation.sharedskele.SharedSkeleAnimationRepository m\_sharedSkeleRepo
  + ### walkVariantUse

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") walkVariantUse
  + ### walkVariant

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") walkVariant
  + ### lunger

    public boolean lunger
  + ### running

    public boolean running
  + ### crawling

    public boolean crawling
  + ### canCrawlUnderVehicle

    private boolean canCrawlUnderVehicle
  + ### canWalk

    private boolean canWalk
  + ### remote

    public boolean remote
  + ### floodFill

    private static final [IsoZombie.FloodFill](IsoZombie.FloodFill.html "class in zombie.characters") floodFill
  + ### immortalTutorialZombie

    public boolean immortalTutorialZombie
  + ### palette

    private final int palette
  + ### aggroList

    private final [IsoZombie.Aggro](IsoZombie.Aggro.html "class in zombie.characters")[] aggroList
  + ### unbalancedLevel

    private float unbalancedLevel
  + ### temporaryMapCloseSneakBonusDir

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> temporaryMapCloseSneakBonusDir
  + ### temporaryMapCloseSneakBonusValue

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> temporaryMapCloseSneakBonusValue
* Constructor Details
  -------------------

  + ### IsoZombie

    public IsoZombie([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell)
  + ### IsoZombie

    public IsoZombie([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    int palette)
* Method Details
  --------------

  + ### registerECSComponents

    public void registerECSComponents()

    Specified by:
    :   `registerECSComponents` in interface `zombie.characters.ecs.ECSEntity`

    Overrides:
    :   `registerECSComponents` in class `IsoGameCharacter`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `IsoMovingObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoMovingObject`
  + ### getOnlineID

    public short getOnlineID()

    Specified by:
    :   `getOnlineID` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`
  + ### isRemoteZombie

    public boolean isRemoteZombie()
  + ### getOwner

    public zombie.core.raknet.UdpConnection getOwner()

    Overrides:
    :   `getOwner` in class `IsoGameCharacter`
  + ### setOwner

    public void setOwner(zombie.core.raknet.UdpConnection connection)

    Overrides:
    :   `setOwner` in class `IsoGameCharacter`
  + ### getOwnerPlayer

    public [IsoPlayer](IsoPlayer.html "class in zombie.characters") getOwnerPlayer()

    Overrides:
    :   `getOwnerPlayer` in class `IsoGameCharacter`
  + ### setOwnerPlayer

    public void setOwnerPlayer([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `setOwnerPlayer` in class `IsoGameCharacter`
  + ### setVehicle4TestCollision

    public void setVehicle4TestCollision([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### initializeStates

    public void initializeStates()
  + ### registerVariableCallbacks

    private void registerVariableCallbacks()
  + ### OnAnimEvent\_IsAlmostUp

    protected void OnAnimEvent\_IsAlmostUp([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") owner)

    Overrides:
    :   `OnAnimEvent_IsAlmostUp` in class `IsoGameCharacter`
  + ### isIdleOrStaggering

    private boolean isIdleOrStaggering()
  + ### shouldSlideHeadAwayFromWalls

    protected boolean shouldSlideHeadAwayFromWalls()

    Overrides:
    :   `shouldSlideHeadAwayFromWalls` in class `IsoMovingObject`
  + ### slideHeadAwayFromWalls

    protected void slideHeadAwayFromWalls(boolean instant)

    Overrides:
    :   `slideHeadAwayFromWalls` in class `IsoMovingObject`
  + ### getUnbalancedLevel

    public float getUnbalancedLevel()
  + ### setUnbalancedLevel

    public void setUnbalancedLevel(float unbalancedLevel)
  + ### getShouldAttack

    private boolean getShouldAttack()
  + ### actionStateChanged

    public void actionStateChanged(zombie.characters.action.ActionContext sender)

    Specified by:
    :   `actionStateChanged` in interface `zombie.characters.action.IActionStateChanged`

    Overrides:
    :   `actionStateChanged` in class `IsoGameCharacter`
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
  + ### InitSpritePartsZombie

    public void InitSpritePartsZombie()
  + ### InitSpritePartsZombie

    public void InitSpritePartsZombie([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)
  + ### pathToCharacter

    public void pathToCharacter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") target)

    Overrides:
    :   `pathToCharacter` in class `IsoGameCharacter`
  + ### pathToLocationF

    public void pathToLocationF(float x,
    float y,
    float z)

    Specified by:
    :   `pathToLocationF` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `pathToLocationF` in class `IsoGameCharacter`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoGameCharacter`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoGameCharacter`

    Throws:
    :   `IOException`
  + ### collideWith

    public void collideWith([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)

    Overrides:
    :   `collideWith` in class `IsoMovingObject`
  + ### Hit

    public float Hit([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    float damageSplit,
    boolean bIgnoreDamage,
    float modDelta,
    boolean bRemote)

    Specified by:
    :   `Hit` in interface `zombie.characters.ILuaGameCharacterDamage`

    Overrides:
    :   `Hit` in class `IsoGameCharacter`
  + ### onMouseLeftClick

    public void onMouseLeftClick()
  + ### onZombieGrappleEnded

    public void onZombieGrappleEnded()
  + ### renderAtlasTexture

    private void renderAtlasTexture(float x,
    float y,
    float z)
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
  + ### renderTextureInsteadOfModel

    protected boolean renderTextureInsteadOfModel(float x,
    float y)

    Overrides:
    :   `renderTextureInsteadOfModel` in class `IsoGameCharacter`
  + ### renderTextureOverHead

    private void renderTextureOverHead([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### updateAlpha

    protected void updateAlpha(int playerIndex,
    float mul,
    float div)

    Overrides:
    :   `updateAlpha` in class `IsoObject`
  + ### initFMODParameters

    private void initFMODParameters()
  + ### isRespondingToPlayerSound

    public boolean isRespondingToPlayerSound()
  + ### isMovingToPlayerSound

    public boolean isMovingToPlayerSound()
  + ### RespondToSound

    public void RespondToSound()
  + ### shouldStopThumpingToRespondToSound

    private boolean shouldStopThumpingToRespondToSound([WorldSoundManager.WorldSound](../WorldSoundManager.WorldSound.html "class in zombie") sound)
  + ### setTurnAlertedValues

    public void setTurnAlertedValues(int soundX,
    int soundY)
  + ### getAttackDidDamage

    public boolean getAttackDidDamage()
  + ### setAttackDidDamage

    public void setAttackDidDamage(boolean attackDidDamage)
  + ### getAttackOutcome

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttackOutcome()
  + ### setAttackOutcome

    public void setAttackOutcome([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attackOutcome)
  + ### setReanimatedForGrappleOnly

    public void setReanimatedForGrappleOnly(boolean val)
  + ### isReanimatedForGrappleOnly

    public boolean isReanimatedForGrappleOnly()
  + ### clearAggroList

    public void clearAggroList()
  + ### processAggroList

    private void processAggroList()
  + ### addAggro

    public void addAggro([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other,
    float damage)
  + ### isLeadAggro

    public boolean isLeadAggro([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other)
  + ### closeSneakBonusCoeff

    private [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") closeSneakBonusCoeff([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### getObstacleMod

    private float getObstacleMod([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### spottedNew

    public void spottedNew([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced)
  + ### isVehicleBetween

    private boolean isVehicleBetween(float targetX,
    float targetY,
    float targetZ)
  + ### spottedOld

    public void spottedOld([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced)
  + ### spotted

    public void spotted([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced)

    Overrides:
    :   `spotted` in class `IsoMovingObject`
  + ### moveUnmodded

    public void moveUnmodded(float dirX,
    float dirY)

    Overrides:
    :   `moveUnmodded` in class `IsoMovingObject`
  + ### DoFootstepSound

    public void DoFootstepSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Overrides:
    :   `DoFootstepSound` in class `IsoGameCharacter`
  + ### addFootstepParametersIfNeeded

    public void addFootstepParametersIfNeeded()
  + ### DoFootstepSound

    public void DoFootstepSound(float volume)

    Overrides:
    :   `DoFootstepSound` in class `IsoGameCharacter`
  + ### preupdate

    public void preupdate()

    Overrides:
    :   `preupdate` in class `IsoGameCharacter`
  + ### allowsInvisibleAnimationSkips

    public boolean allowsInvisibleAnimationSkips()

    Overrides:
    :   `allowsInvisibleAnimationSkips` in class `IsoGameCharacter`
  + ### postupdate

    public void postupdate()

    Overrides:
    :   `postupdate` in class `IsoGameCharacter`
  + ### postUpdateInternal

    private void postUpdateInternal()
  + ### handleLandingImpact

    protected void handleLandingImpact(zombie.characters.FallDamage fallDamage)

    Overrides:
    :   `handleLandingImpact` in class `IsoGameCharacter`
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
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoGameCharacter`
  + ### updateActiveState

    private void updateActiveState()
  + ### updateInternal

    private void updateInternal()
  + ### calculateStats

    protected void calculateStats()

    Overrides:
    :   `calculateStats` in class `IsoGameCharacter`
  + ### updateZombieTripping

    private void updateZombieTripping()
  + ### getVoiceChoice

    public int getVoiceChoice()
  + ### getVoiceSoundName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVoiceSoundName()
  + ### getBiteSoundName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBiteSoundName()
  + ### updateVocalProperties

    public void updateVocalProperties()
  + ### setVehicleHitLocation

    public void setVehicleHitLocation([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)

    Description copied from class: `IsoGameCharacter`

    Base method. Default does nothing.

    Overrides:
    :   `setVehicleHitLocation` in class `IsoGameCharacter`
  + ### updateSearchForCorpse

    private void updateSearchForCorpse()

    If zombie is idle, update the search for corpse timer, after it hit 0, we check for a nearby corpse to eat it
  + ### damageSheetRope

    private void damageSheetRope()
  + ### getZombieWalkTowardSpeed

    public void getZombieWalkTowardSpeed(float speed,
    float dist,
    [Vector2](../iso/Vector2.html "class in zombie.iso") temp)
  + ### getZombieLungeSpeed

    public void getZombieLungeSpeed()
  + ### tryThump

    public boolean tryThump([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### Wander

    public void Wander()
  + ### DoZombieInventory

    public void DoZombieInventory()
  + ### DoCorpseInventory

    public void DoCorpseInventory()
  + ### DoZombieInventory

    private void DoZombieInventory(boolean bRandomCorpse)
  + ### DoZombieStats

    public void DoZombieStats()
  + ### setWalkType

    public void setWalkType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") walkType)
  + ### getSpeedTypeFromWalkType

    public static int getSpeedTypeFromWalkType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") walkType)
  + ### setSpeedTypeFromWalkType

    public void setSpeedTypeFromWalkType()
  + ### DoZombieSpeeds

    public void DoZombieSpeeds(float spMod)
  + ### isFakeDead

    public boolean isFakeDead()
  + ### setFakeDead

    public void setFakeDead(boolean bFakeDead)
  + ### isForceFakeDead

    public boolean isForceFakeDead()
  + ### setForceFakeDead

    public void setForceFakeDead(boolean bForceFakeDead)
  + ### onHitByVehicle

    public float onHitByVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float impactSpeed,
    [Vector2](../iso/Vector2.html "class in zombie.iso") hitDir,
    [Vector2](../iso/Vector2.html "class in zombie.iso") impactPosOnVehicle)

    Overrides:
    :   `onHitByVehicle` in class `IsoGameCharacter`
  + ### onHitByVehicleDriver

    protected void onHitByVehicleDriver([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") vehicleDriver)

    Called from onHitByVehicle   
    Handles what to do about the vehicle's driver.   
      
    Note: Vehicle's driver may be null.

    Overrides:
    :   `onHitByVehicleDriver` in class `IsoGameCharacter`
  + ### postHitByVehicleUpdateStance

    protected void postHitByVehicleUpdateStance(float speed,
    boolean knockDownAllowed)

    Update our reaction stance after a vehicle impact.   
    Set the appropriate flags, such as knockedDown, etc.   
    Note: Only on clients and single-player. The server does not do these.

    Overrides:
    :   `postHitByVehicleUpdateStance` in class `IsoGameCharacter`
  + ### addBloodFromVehicleImpact

    public void addBloodFromVehicleImpact(float speed)

    Overrides:
    :   `addBloodFromVehicleImpact` in class `IsoGameCharacter`
  + ### hitConsequences

    public void hitConsequences([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean bIgnoreDamage,
    float damage,
    boolean bRemote)

    Overrides:
    :   `hitConsequences` in class `IsoGameCharacter`
  + ### playHurtSound

    public long playHurtSound()

    Overrides:
    :   `playHurtSound` in class `IsoGameCharacter`
  + ### checkClimbOverFenceHit

    private void checkClimbOverFenceHit()
  + ### checkClimbThroughWindowHit

    private void checkClimbThroughWindowHit()
  + ### climbFenceWindowHit

    private void climbFenceWindowHit(int endX,
    int endY)
  + ### shouldBecomeCrawler

    private boolean shouldBecomeCrawler([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") attacker)
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoGameCharacter`
  + ### resetForReuse

    public void resetForReuse()
  + ### wasFakeDead

    public boolean wasFakeDead()
  + ### setWasFakeDead

    public void setWasFakeDead(boolean wasFakeDead)
  + ### setCrawler

    public void setCrawler(boolean crawling)
  + ### isBecomeCrawler

    public boolean isBecomeCrawler()
  + ### setBecomeCrawler

    public void setBecomeCrawler(boolean crawler)
  + ### isReanimate

    public boolean isReanimate()
  + ### setReanimate

    public void setReanimate(boolean reanimate)
  + ### isReanimatedPlayer

    public boolean isReanimatedPlayer()
  + ### setReanimatedPlayer

    public void setReanimatedPlayer(boolean reanimated)
  + ### getReanimatedPlayer

    public [IsoPlayer](IsoPlayer.html "class in zombie.characters") getReanimatedPlayer()
  + ### setFemaleEtc

    public void setFemaleEtc(boolean female)
  + ### addRandomBloodDirtHolesEtc

    public void addRandomBloodDirtHolesEtc()
  + ### useDescriptor

    public void useDescriptor(zombie.SharedDescriptors.Descriptor sharedDesc)
  + ### getSharedDescriptor

    public zombie.SharedDescriptors.Descriptor getSharedDescriptor()
  + ### getSharedDescriptorID

    public int getSharedDescriptorID()
  + ### getScreenProperX

    public int getScreenProperX(int playerIndex)
  + ### getScreenProperY

    public int getScreenProperY(int playerIndex)
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
  + ### isUsingWornItems

    public boolean isUsingWornItems()

    Overrides:
    :   `isUsingWornItems` in class `IsoGameCharacter`
  + ### setAsSurvivor

    public void setAsSurvivor()
  + ### dressInRandomOutfit

    public void dressInRandomOutfit()

    Overrides:
    :   `dressInRandomOutfit` in class `IsoGameCharacter`
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)

    Specified by:
    :   `dressInNamedOutfit` in interface `ILuaGameCharacterClothing`

    Overrides:
    :   `dressInNamedOutfit` in class `IsoGameCharacter`
  + ### dressInPersistentOutfitID

    public void dressInPersistentOutfitID(int outfitID)

    Specified by:
    :   `dressInPersistentOutfitID` in interface `ILuaGameCharacterClothing`

    Overrides:
    :   `dressInPersistentOutfitID` in class `IsoGameCharacter`
  + ### dressInClothingItem

    public void dressInClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGUID)

    Overrides:
    :   `dressInClothingItem` in class `IsoGameCharacter`
  + ### onDeath\_ShouldDoSplatterAndSounds

    public boolean onDeath\_ShouldDoSplatterAndSounds([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean isGory)

    Overrides:
    :   `onDeath_ShouldDoSplatterAndSounds` in class `IsoGameCharacter`
  + ### onWornItemsChanged

    public void onWornItemsChanged()

    Overrides:
    :   `onWornItemsChanged` in class `IsoGameCharacter`
  + ### clothingItemChanged

    public void clothingItemChanged([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGuid)

    Specified by:
    :   `clothingItemChanged` in interface `zombie.core.skinnedmodel.population.IClothingItemListener`

    Overrides:
    :   `clothingItemChanged` in class `IsoGameCharacter`
  + ### WanderFromWindow

    public boolean WanderFromWindow()
  + ### isUseless

    public boolean isUseless()
  + ### setUseless

    public void setUseless(boolean useless)
  + ### setImmortalTutorialZombie

    public void setImmortalTutorialZombie(boolean immortal)
  + ### isTargetInCone

    public boolean isTargetInCone(float dist,
    float dot)
  + ### isCrawling

    public boolean isCrawling()

    Overrides:
    :   `isCrawling` in class `IsoMovingObject`
  + ### isCanCrawlUnderVehicle

    public boolean isCanCrawlUnderVehicle()
  + ### setCanCrawlUnderVehicle

    public void setCanCrawlUnderVehicle(boolean b)
  + ### isCanWalk

    public boolean isCanWalk()
  + ### setCanWalk

    public void setCanWalk(boolean bCanStand)
  + ### initCanCrawlUnderVehicle

    public void initCanCrawlUnderVehicle()
  + ### shouldGetUpFromCrawl

    public boolean shouldGetUpFromCrawl()
  + ### toggleCrawling

    public void toggleCrawling()
  + ### knockDown

    public void knockDown(boolean hitFromBehind)
  + ### addItemToSpawnAtDeath

    public void addItemToSpawnAtDeath([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### clearItemsToSpawnAtDeath

    public void clearItemsToSpawnAtDeath()
  + ### getEatBodyTarget

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") getEatBodyTarget()
  + ### getEatSpeed

    public float getEatSpeed()
  + ### setEatBodyTarget

    public void setEatBodyTarget([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target,
    boolean force)
  + ### setEatBodyTarget

    public void setEatBodyTarget([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target,
    boolean force,
    float eatSpeed)
  + ### updateEatBodyTarget

    private void updateEatBodyTarget()
  + ### updateCharacterTextureAnimTime

    private void updateCharacterTextureAnimTime()
  + ### getCrawlerType

    public int getCrawlerType()
  + ### setCrawlerType

    public void setCrawlerType(int crawlerType)
  + ### addRandomVisualBandages

    public void addRandomVisualBandages()

    Possibly add visual bandages (bloody) on the zombie
    TODO: Make InventoryItem linked to it in DeadBodyAtlas to being able to remove them (like primary/secondary weapons)
  + ### addVisualBandage

    public void addVisualBandage([BodyPartType](BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPart,
    boolean bloody)
  + ### addRandomVisualDamages

    public void addRandomVisualDamages()
  + ### getPlayerAttackPosition

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlayerAttackPosition()
  + ### setPlayerAttackPosition

    public void setPlayerAttackPosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") playerAttackPosition)
  + ### isSitAgainstWall

    public boolean isSitAgainstWall()
  + ### setSitAgainstWall

    public void setSitAgainstWall(boolean sitAgainstWall)
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `IHumanVisual`

    Specified by:
    :   `isZombie` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `isZombie` in class `IsoGameCharacter`
  + ### setSkeleton

    public void setSkeleton(boolean isSkeleton)
  + ### getHitTime

    public int getHitTime()
  + ### setHitTime

    public void setHitTime(int hitTime)
  + ### getThumpTimer

    public int getThumpTimer()
  + ### setThumpTimer

    public void setThumpTimer(int thumpTimer)
  + ### getTarget

    public [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") getTarget()
  + ### setTargetSeenTime

    public void setTargetSeenTime(float seconds)
  + ### getTargetSeenTime

    public float getTargetSeenTime()
  + ### isTargetVisible

    public boolean isTargetVisible()
  + ### getTurnDelta

    public float getTurnDelta()

    Overrides:
    :   `getTurnDelta` in class `IsoGameCharacter`
  + ### isAttacking

    public boolean isAttacking()

    Overrides:
    :   `isAttacking` in class `IsoGameCharacter`
  + ### isZombieAttacking

    public boolean isZombieAttacking()

    Overrides:
    :   `isZombieAttacking` in class `IsoGameCharacter`
  + ### isZombieAttacking

    public boolean isZombieAttacking([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") other)

    Overrides:
    :   `isZombieAttacking` in class `IsoGameCharacter`
  + ### getHitHeadWhileOnFloor

    public int getHitHeadWhileOnFloor()
  + ### getRealState

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRealState()
  + ### setHitHeadWhileOnFloor

    public void setHitHeadWhileOnFloor(int hitHeadWhileOnFloor)
  + ### isHitLegsWhileOnFloor

    public boolean isHitLegsWhileOnFloor()
  + ### setHitLegsWhileOnFloor

    public void setHitLegsWhileOnFloor(boolean hitLegsWhileOnFloor)
  + ### makeInactive

    public void makeInactive(boolean binactive)
  + ### getFootstepVolume

    public float getFootstepVolume()
  + ### isFacingTarget

    public boolean isFacingTarget()
  + ### isTargetLocationKnown

    public boolean isTargetLocationKnown()
  + ### getSandboxMemoryDuration

    protected int getSandboxMemoryDuration()
  + ### shouldDoFenceLunge

    public boolean shouldDoFenceLunge()
  + ### isProne

    public boolean isProne()

    Overrides:
    :   `isProne` in class `IsoMovingObject`
  + ### isGettingUp

    public boolean isGettingUp()

    Overrides:
    :   `isGettingUp` in class `IsoMovingObject`
  + ### setTarget

    public void setTarget([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") t)
  + ### isAlwaysKnockedDown

    public boolean isAlwaysKnockedDown()
  + ### setAlwaysKnockedDown

    public void setAlwaysKnockedDown(boolean alwaysKnockedDown)
  + ### setDressInRandomOutfit

    public void setDressInRandomOutfit(boolean dressInRandom)
  + ### setBodyToEat

    public void setBodyToEat([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### isForceEatingAnimation

    public boolean isForceEatingAnimation()
  + ### setForceEatingAnimation

    public void setForceEatingAnimation(boolean forceEatingAnimation)
  + ### isOnlyJawStab

    public boolean isOnlyJawStab()
  + ### setOnlyJawStab

    public void setOnlyJawStab(boolean onlyJawStab)
  + ### isNoTeeth

    public boolean isNoTeeth()
  + ### cantBite

    public boolean cantBite()
  + ### setNoTeeth

    public void setNoTeeth(boolean noTeeth)
  + ### setThumpFlag

    public void setThumpFlag(int v)
  + ### setThumpCondition

    public void setThumpCondition(float condition)
  + ### setThumpCondition

    public void setThumpCondition(int condition,
    int maxCondition)
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpCondition` in class `IsoObject`
  + ### isStaggerBack

    public boolean isStaggerBack()

    Overrides:
    :   `isStaggerBack` in class `IsoGameCharacter`
  + ### setStaggerBack

    public void setStaggerBack(boolean bStaggerBack)
  + ### isKnifeDeath

    public boolean isKnifeDeath()
  + ### setKnifeDeath

    public void setKnifeDeath(boolean bKnifeDeath)
  + ### isJawStabAttach

    public boolean isJawStabAttach()
  + ### setJawStabAttach

    public void setJawStabAttach(boolean bJawStabAttach)
  + ### onKilled

    public void onKilled([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") killer,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") handWeapon,
    boolean bGory)

    Overrides:
    :   `onKilled` in class `IsoGameCharacter`
  + ### onDied

    private void onDied([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") sender,
    [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### getNetworkCharacterAI

    public zombie.characters.NetworkZombieAI getNetworkCharacterAI()

    Overrides:
    :   `getNetworkCharacterAI` in class `IsoGameCharacter`
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
  + ### updateVisionRadius

    private void updateVisionRadius()
  + ### getVisionRadiusAdjusted

    private float getVisionRadiusAdjusted(float darknessPenalty,
    float rainPenalty,
    float fogPenalty)
  + ### shouldZombieHaveKey

    public boolean shouldZombieHaveKey(boolean allowBandits)
  + ### checkZombieEntersPlayerBuilding

    private void checkZombieEntersPlayerBuilding()
  + ### doZombieSpeed

    public void doZombieSpeed()
  + ### doZombieSpeed

    public void doZombieSpeed(int zombieSpeed)
  + ### doZombieSpeedInternal

    private void doZombieSpeedInternal(int zombieSpeed)
  + ### doCrawlerSpeed

    public void doCrawlerSpeed(int zombieSpeed)
  + ### doSprinter

    public void doSprinter()
  + ### doFastShambler

    public void doFastShambler()
  + ### doFakeShambler

    private void doFakeShambler()
  + ### doFakeShambler

    public void doFakeShambler(int zombieSpeed)
  + ### doShambler

    public void doShambler()
  + ### getSpeedType

    public int getSpeedType()
  + ### doZombieSpeedInternal2

    private void doZombieSpeedInternal2()
  + ### doZombieSpeedInternal2

    private void doZombieSpeedInternal2(int zombieSpeed)
  + ### determineZombieSpeed

    private int determineZombieSpeed(int zombieSpeed)
  + ### getLastHitPart

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastHitPart()
  + ### shouldDressInRandomOutfit

    public boolean shouldDressInRandomOutfit()
  + ### getOutfitName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutfitName()

    Specified by:
    :   `getOutfitName` in interface `ILuaGameCharacterClothing`

    Overrides:
    :   `getOutfitName` in class `IsoGameCharacter`
  + ### getHeadSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getHeadSquare([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### couldSeeHeadSquare

    public boolean couldSeeHeadSquare([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### canSeeHeadSquare

    public boolean canSeeHeadSquare([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### isSideOfStaircaseBetweenSelfAndTarget

    private boolean isSideOfStaircaseBetweenSelfAndTarget()
  + ### updateMovementStatistics

    private void updateMovementStatistics()
  + ### getWalkType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWalkType()
  + ### helmetFallFromVisuals

    public boolean helmetFallFromVisuals(boolean hitHead)