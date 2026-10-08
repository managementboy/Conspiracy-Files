[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [IsoAnimal](IsoAnimal.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INVALID\_SQUARE\_XY](#INVALID_SQUARE_XY)
   2. [SOUND\_RADIUS\_MULTIPLIER\_WILD](#SOUND_RADIUS_MULTIPLIER_WILD)
   3. [MIN\_PLAYER\_ACCEPTANCE\_FOR\_SOUND](#MIN_PLAYER_ACCEPTANCE_FOR_SOUND)
   4. [FLEE\_SOUND\_DISTANCE\_DEFAULT](#FLEE_SOUND_DISTANCE_DEFAULT)
   5. [FLEE\_SOUND\_DISTANCE\_WILD](#FLEE_SOUND_DISTANCE_WILD)
   6. [SOUND\_RADIUS\_STRESS\_FACTOR](#SOUND_RADIUS_STRESS_FACTOR)
   7. [SOUND\_RADIUS\_FLEE\_TIME\_FACTOR](#SOUND_RADIUS_FLEE_TIME_FACTOR)
   8. [LAST\_ALERTED\_FLEE\_SOUND\_TIME](#LAST_ALERTED_FLEE_SOUND_TIME)
   9. [serialVersionUID](#serialVersionUID)
   10. [tempVector3f](#tempVector3f)
   11. [tempVector3](#tempVector3)
   12. [tempVector2](#tempVector2)
   13. [animalId](#animalId)
   14. [itemId](#itemId)
   15. [spottedChr](#spottedChr)
   16. [type](#type)
   17. [behavior](#behavior)
   18. [data](#data)
   19. [attackedTimer](#attackedTimer)
   20. [invincible](#invincible)
   21. [attachBackToMother](#attachBackToMother)
   22. [attachBackToTreeX](#attachBackToTreeX)
   23. [attachBackToTreeY](#attachBackToTreeY)
   24. [timeSinceLastUpdate](#timeSinceLastUpdate)
   25. [customName](#customName)
   26. [smallEnclosure](#smallEnclosure)
   27. [adef](#adef)
   28. [mother](#mother)
   29. [motherId](#motherId)
   30. [searchRadius](#searchRadius)
   31. [milkRemoved](#milkRemoved)
   32. [eatFromTrough](#eatFromTrough)
   33. [eatFromGround](#eatFromGround)
   34. [drinkFromTrough](#drinkFromTrough)
   35. [drinkFromRiver](#drinkFromRiver)
   36. [drinkFromPuddle](#drinkFromPuddle)
   37. [hutch](#hutch)
   38. [fullGenome](#fullGenome)
   39. [atkTarget](#atkTarget)
   40. [thumpTarget](#thumpTarget)
   41. [fightingOpponent](#fightingOpponent)
   42. [lastSoundRespondedTo](#lastSoundRespondedTo)
   43. [timeSinceFleeFromSound](#timeSinceFleeFromSound)
   44. [stressLevel](#stressLevel)
   45. [animalVisual](#animalVisual)
   46. [animalZone](#animalZone)
   47. [moveForwardOnZone](#moveForwardOnZone)
   48. [eggTimerInHutch](#eggTimerInHutch)
   49. [nestBox](#nestBox)
   50. [playerAcceptanceList](#playerAcceptanceList)
   51. [heldBy](#heldBy)
   52. [luredBy](#luredBy)
   53. [luredStartTimer](#luredStartTimer)
   54. [walkToCharLuring](#walkToCharLuring)
   55. [geneticDisorder](#geneticDisorder)
   56. [petTimer](#petTimer)
   57. [dZone](#dZone)
   58. [connectedDZone](#connectedDZone)
   59. [zoneCheckTimer](#zoneCheckTimer)
   60. [movingToFood](#movingToFood)
   61. [movingToFoodTimer](#movingToFoodTimer)
   62. [animalSoundState](#animalSoundState)
   63. [ignoredTrough](#ignoredTrough)
   64. [attachBackToMotherTimer](#attachBackToMotherTimer)
   65. [virtualId](#virtualId)
   66. [migrationGroup](#migrationGroup)
   67. [wild](#wild)
   68. [alerted](#alerted)
   69. [alertedChr](#alertedChr)
   70. [fromMeta](#fromMeta)
   71. [thumpDelay](#thumpDelay)
   72. [shouldBeSkeleton](#shouldBeSkeleton)
   73. [babies](#babies)
   74. [zoneAcceptance](#zoneAcceptance)
   75. [followingWall](#followingWall)
   76. [shouldFollowWall](#shouldFollowWall)
   77. [onHook](#onHook)
   78. [hook](#hook)
   79. [attachBackToHookX](#attachBackToHookX)
   80. [attachBackToHookY](#attachBackToHookY)
   81. [attachBackToHookZ](#attachBackToHookZ)
   82. [roadKill](#roadKill)
   83. [lastCellSavedToX](#lastCellSavedToX)
   84. [lastCellSavedToY](#lastCellSavedToY)
   85. [isAttackingOnClient](#isAttackingOnClient)
   86. [L\_renderCustomName](#L_renderCustomName)
   87. [nextFootstepSound](#nextFootstepSound)
   88. [forceNextIdleSound](#forceNextIdleSound)
7. [Constructor Details](#constructor-detail)
   1. [IsoAnimal(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoAnimal(IsoCell, int, int, int, String, String)](#%3Cinit%3E(zombie.iso.IsoCell,int,int,int,java.lang.String,java.lang.String))
   3. [IsoAnimal(IsoCell, int, int, int, String, String, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,int,int,int,java.lang.String,java.lang.String,boolean))
   4. [IsoAnimal(IsoCell, int, int, int, String, AnimalBreed)](#%3Cinit%3E(zombie.iso.IsoCell,int,int,int,java.lang.String,zombie.characters.animals.datas.AnimalBreed))
   5. [IsoAnimal(IsoCell, int, int, int, String, AnimalBreed, boolean)](#%3Cinit%3E(zombie.iso.IsoCell,int,int,int,java.lang.String,zombie.characters.animals.datas.AnimalBreed,boolean))
8. [Method Details](#method-detail)
   1. [checkForChickenpocalypse()](#checkForChickenpocalypse())
   2. [checkForWater()](#checkForWater())
   3. [getObjectName()](#getObjectName())
   4. [registerVariableCallbacks()](#registerVariableCallbacks())
   5. [canUseCurrentPoseForCorpse()](#canUseCurrentPoseForCorpse())
   6. [getAnimalVisual()](#getAnimalVisual())
   7. [addToWorld()](#addToWorld())
   8. [GetAnimSetName()](#GetAnimSetName())
   9. [playSoundDebug()](#playSoundDebug())
   10. [update()](#update())
   11. [updateZoneAcceptance()](#updateZoneAcceptance())
   12. [test()](#test())
   13. [updateInternal()](#updateInternal())
   14. [testCollideWithVehicles(BaseVehicle, BaseVehicle.HitVars)](#testCollideWithVehicles(zombie.vehicles.BaseVehicle,zombie.vehicles.BaseVehicle.HitVars))
   15. [Hit(BaseVehicle, float, boolean, float, float, boolean, float, float)](#Hit(zombie.vehicles.BaseVehicle,float,boolean,float,float,boolean,float,float))
   16. [Hit(BaseVehicle, float, boolean, Vector2)](#Hit(zombie.vehicles.BaseVehicle,float,boolean,zombie.iso.Vector2))
   17. [onAnimPlayerCreated(AnimationPlayer)](#onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer))
   18. [allowsTwist()](#allowsTwist())
   19. [getPetTimer()](#getPetTimer())
   20. [CanUsePathfindState()](#CanUsePathfindState())
   21. [getNetworkSpeedMul()](#getNetworkSpeedMul())
   22. [reattachBackToMom()](#reattachBackToMom())
   23. [findMotherAndAttach(List)](#findMotherAndAttach(java.util.List))
   24. [checkZone()](#checkZone())
   25. [getRandomSquareInZone()](#getRandomSquareInZone())
   26. [getZone()](#getZone())
   27. [stopAllMovementNow()](#stopAllMovementNow())
   28. [cancelLuring()](#cancelLuring())
   29. [updateLured()](#updateLured())
   30. [updateStress()](#updateStress())
   31. [getCanAttachAnimalObject(IsoGridSquare)](#getCanAttachAnimalObject(zombie.iso.IsoGridSquare))
   32. [checkTreeExists()](#checkTreeExists())
   33. [reattachToTree()](#reattachToTree())
   34. [getLastSoundRespondedTo()](#getLastSoundRespondedTo())
   35. [respondToSound()](#respondToSound())
   36. [calcDamage()](#calcDamage())
   37. [HitByAnimal(IsoAnimal, boolean)](#HitByAnimal(zombie.characters.animals.IsoAnimal,boolean))
   38. [initializeStates()](#initializeStates())
   39. [spotted(IsoMovingObject, boolean, float)](#spotted(zombie.iso.IsoMovingObject,boolean,float))
   40. [drawRope(IsoGameCharacter)](#drawRope(zombie.characters.IsoGameCharacter))
   41. [drawRope(IsoGridSquare)](#drawRope(zombie.iso.IsoGridSquare))
   42. [renderlast()](#renderlast())
   43. [renderCustomName()](#renderCustomName())
   44. [doDebugString()](#doDebugString())
   45. [drawDirectionLine(Vector2, float, float, float, float)](#drawDirectionLine(zombie.iso.Vector2,float,float,float,float))
   46. [renderShadow(float, float, float)](#renderShadow(float,float,float))
   47. [getBehavior()](#getBehavior())
   48. [checkAlphaAndTargetAlpha(IsoPlayer)](#checkAlphaAndTargetAlpha(zombie.characters.IsoPlayer))
   49. [shouldBecomeZombieAfterDeath()](#shouldBecomeZombieAfterDeath())
   50. [onDied(IsoGameCharacter, IsoDeadBody)](#onDied(zombie.characters.IsoGameCharacter,zombie.iso.objects.IsoDeadBody))
   51. [OnDeath()](#OnDeath())
   52. [hitConsequences(HandWeapon, IsoGameCharacter, boolean, float, boolean)](#hitConsequences(zombie.inventory.types.HandWeapon,zombie.characters.IsoGameCharacter,boolean,float,boolean))
   53. [setHealth(float)](#setHealth(float))
   54. [sendExtraUpdateToClients()](#sendExtraUpdateToClients())
   55. [killed(IsoPlayer)](#killed(zombie.characters.IsoPlayer))
   56. [removeFromWorld()](#removeFromWorld())
   57. [getData()](#getData())
   58. [getInventoryIconTextureName()](#getInventoryIconTextureName())
   59. [getInventoryIconTexture()](#getInventoryIconTexture())
   60. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   61. [save(ByteBuffer, boolean, boolean)](#save(java.nio.ByteBuffer,boolean,boolean))
   62. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   63. [init(AnimalBreed)](#init(zombie.characters.animals.datas.AnimalBreed))
   64. [initStress()](#initStress())
   65. [initTexture()](#initTexture())
   66. [initAge()](#initAge())
   67. [canGoThere(IsoGridSquare)](#canGoThere(zombie.iso.IsoGridSquare))
   68. [getAnimalType()](#getAnimalType())
   69. [getAnimalSize()](#getAnimalSize())
   70. [getAnimalOriginalSize()](#getAnimalOriginalSize())
   71. [setAgeDebug(int)](#setAgeDebug(int))
   72. [haveEnoughMilkToFeedFrom()](#haveEnoughMilkToFeedFrom())
   73. [addBaby()](#addBaby())
   74. [initType(AnimalBreed)](#initType(zombie.characters.animals.datas.AnimalBreed))
   75. [unloaded()](#unloaded())
   76. [updateLastTimeSinceUpdate()](#updateLastTimeSinceUpdate())
   77. [debugAgeAway(int)](#debugAgeAway(int))
   78. [updateStatsAway(int)](#updateStatsAway(int))
   79. [checkKilledByMetaPredator(int)](#checkKilledByMetaPredator(int))
   80. [isBaby()](#isBaby())
   81. [shearAnimal(IsoGameCharacter, InventoryItem)](#shearAnimal(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   82. [getMilkType()](#getMilkType())
   83. [addDebugBucketOfMilk(IsoGameCharacter)](#addDebugBucketOfMilk(zombie.characters.IsoGameCharacter))
   84. [milkAnimal(IsoGameCharacter, InventoryItem)](#milkAnimal(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   85. [setMaxSizeDebug()](#setMaxSizeDebug())
   86. [addEgg(boolean)](#addEgg(boolean))
   87. [createEgg()](#createEgg())
   88. [randomizeAge()](#randomizeAge())
   89. [isAnimalMoving()](#isAnimalMoving())
   90. [isGeriatric()](#isGeriatric())
   91. [getAgeText(boolean, int)](#getAgeText(boolean,int))
   92. [getHealthText(boolean, int)](#getHealthText(boolean,int))
   93. [getAppearanceText(boolean)](#getAppearanceText(boolean))
   94. [copyFrom(IsoAnimal)](#copyFrom(zombie.characters.animals.IsoAnimal))
   95. [fertilize(IsoAnimal, boolean)](#fertilize(zombie.characters.animals.IsoAnimal,boolean))
   96. [isAnimalEating()](#isAnimalEating())
   97. [isAnimalAttacking()](#isAnimalAttacking())
   98. [setAnimalAttackingOnClient(boolean)](#setAnimalAttackingOnClient(boolean))
   99. [isAnimalSitting()](#isAnimalSitting())
   100. [isInvincible()](#isInvincible())
   101. [isAnimalRunningToDeathPosition()](#isAnimalRunningToDeathPosition())
   102. [setIsInvincible(boolean)](#setIsInvincible(boolean))
   103. [getCustomName()](#getCustomName())
   104. [setCustomName(String)](#setCustomName(java.lang.String))
   105. [getHunger()](#getHunger())
   106. [getThirst()](#getThirst())
   107. [getBabyType()](#getBabyType())
   108. [hasUdder()](#hasUdder())
   109. [getBreed()](#getBreed())
   110. [canBeMilked()](#canBeMilked())
   111. [canBeSheared()](#canBeSheared())
   112. [getEggsPerDay()](#getEggsPerDay())
   113. [getHutch()](#getHutch())
   114. [getNestBoxIndex()](#getNestBoxIndex())
   115. [setData(AnimalData)](#setData(zombie.characters.animals.datas.AnimalData))
   116. [hasGeneticDisorder(String)](#hasGeneticDisorder(java.lang.String))
   117. [getFullName()](#getFullName())
   118. [getFullGenome()](#getFullGenome())
   119. [copyGenome(Collection)](#copyGenome(java.util.Collection))
   120. [getFullGenomeList()](#getFullGenomeList())
   121. [getUsedGene(String)](#getUsedGene(java.lang.String))
   122. [getAge()](#getAge())
   123. [canDoAction()](#canDoAction())
   124. [getMeatRatio()](#getMeatRatio())
   125. [getMate()](#getMate())
   126. [getAnimalZone()](#getAnimalZone())
   127. [setAnimalZone(AnimalZone)](#setAnimalZone(zombie.characters.animals.AnimalZone))
   128. [hasAnimalZone()](#hasAnimalZone())
   129. [isMoveForwardOnZone()](#isMoveForwardOnZone())
   130. [setMoveForwardOnZone(boolean)](#setMoveForwardOnZone(boolean))
   131. [isExistInTheWorld()](#isExistInTheWorld())
   132. [changeStress(float)](#changeStress(float))
   133. [getEggGeneMod()](#getEggGeneMod())
   134. [setDebugStress(float)](#setDebugStress(float))
   135. [setDebugAcceptance(IsoPlayer, float)](#setDebugAcceptance(zombie.characters.IsoPlayer,float))
   136. [getAllPossibleFoodFromInv(IsoGameCharacter)](#getAllPossibleFoodFromInv(zombie.characters.IsoGameCharacter))
   137. [getEatTypePossibleFromHand()](#getEatTypePossibleFromHand())
   138. [addAcceptance(IsoPlayer, float)](#addAcceptance(zombie.characters.IsoPlayer,float))
   139. [feedFromHand(IsoPlayer, InventoryItem)](#feedFromHand(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   140. [petTimerDone()](#petTimerDone())
   141. [petAnimal(IsoPlayer)](#petAnimal(zombie.characters.IsoPlayer))
   142. [getStress()](#getStress())
   143. [getStressTxt(boolean, int)](#getStressTxt(boolean,int))
   144. [fleeTo(IsoGridSquare)](#fleeTo(zombie.iso.IsoGridSquare))
   145. [getAcceptanceLevel(IsoPlayer)](#getAcceptanceLevel(zombie.characters.IsoPlayer))
   146. [canBeFeedByHand()](#canBeFeedByHand())
   147. [tryLure(IsoPlayer, InventoryItem)](#tryLure(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   148. [getPossibleLuringItems(IsoGameCharacter)](#getPossibleLuringItems(zombie.characters.IsoGameCharacter))
   149. [eatFromLured(IsoPlayer, InventoryItem)](#eatFromLured(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   150. [getAttachmentWorldPos(String, Position3D)](#getAttachmentWorldPos(java.lang.String,zombie.characters.Position3D))
   151. [getAttachmentWorldPos(String)](#getAttachmentWorldPos(java.lang.String))
   152. [carCrash(float, boolean)](#carCrash(float,boolean))
   153. [getMilkAnimPreset()](#getMilkAnimPreset())
   154. [pathToCharacter(IsoGameCharacter)](#pathToCharacter(zombie.characters.IsoGameCharacter))
   155. [pathToLocation(int, int, int)](#pathToLocation(int,int,int))
   156. [pathToTrough(IsoFeedingTrough)](#pathToTrough(zombie.iso.objects.IsoFeedingTrough))
   157. [shouldBreakObstaclesDuringPathfinding()](#shouldBreakObstaclesDuringPathfinding())
   158. [getFeelersize()](#getFeelersize())
   159. [animalShouldThump()](#animalShouldThump())
   160. [tryThump(IsoGridSquare)](#tryThump(zombie.iso.IsoGridSquare))
   161. [getAnimalTrailerSize()](#getAnimalTrailerSize())
   162. [canBePet()](#canBePet())
   163. [debugRandomIdleAnim()](#debugRandomIdleAnim())
   164. [debugRandomHappyAnim()](#debugRandomHappyAnim())
   165. [getDZone()](#getDZone())
   166. [setDZone(DesignationZoneAnimal)](#setDZone(zombie.iso.areas.DesignationZoneAnimal))
   167. [getConnectedDZone()](#getConnectedDZone())
   168. [haveMatingSeason()](#haveMatingSeason())
   169. [isInMatingSeason()](#isInMatingSeason())
   170. [getMinAgeForBaby()](#getMinAgeForBaby())
   171. [isHeld()](#isHeld())
   172. [pathFailed()](#pathFailed())
   173. [getAnimalSoundState(String)](#getAnimalSoundState(java.lang.String))
   174. [playDeadSound()](#playDeadSound())
   175. [updateVocalProperties()](#updateVocalProperties())
   176. [playNextFootstepSound()](#playNextFootstepSound())
   177. [onPlayBreedSoundEvent(String)](#onPlayBreedSoundEvent(java.lang.String))
   178. [playBreedSound(String)](#playBreedSound(java.lang.String))
   179. [chooseIdleSound()](#chooseIdleSound())
   180. [playStressedSound()](#playStressedSound())
   181. [updateLoopingSounds()](#updateLoopingSounds())
   182. [updateRunLoopingSound()](#updateRunLoopingSound())
   183. [updateWalkLoopingSound()](#updateWalkLoopingSound())
   184. [getMother()](#getMother())
   185. [setMother(IsoAnimal)](#setMother(zombie.characters.animals.IsoAnimal))
   186. [canBePicked(IsoGameCharacter)](#canBePicked(zombie.characters.IsoGameCharacter))
   187. [canBeKilledWithoutWeapon()](#canBeKilledWithoutWeapon())
   188. [getAnimalID()](#getAnimalID())
   189. [setAnimalID(int)](#setAnimalID(int))
   190. [setItemID(int)](#setItemID(int))
   191. [getItemID()](#getItemID())
   192. [getNextStageAnimalType()](#getNextStageAnimalType())
   193. [debugForceEgg()](#debugForceEgg())
   194. [isWild()](#isWild())
   195. [setWild(boolean)](#setWild(boolean))
   196. [alertOtherAnimals(IsoMovingObject, boolean)](#alertOtherAnimals(zombie.iso.IsoMovingObject,boolean))
   197. [debugForceSit()](#debugForceSit())
   198. [isAlerted()](#isAlerted())
   199. [setIsAlerted(boolean)](#setIsAlerted(boolean))
   200. [shouldFollowWall()](#shouldFollowWall())
   201. [setShouldFollowWall(boolean)](#setShouldFollowWall(boolean))
   202. [readyToBeMilked()](#readyToBeMilked())
   203. [readyToBeSheared()](#readyToBeSheared())
   204. [haveHappyAnim()](#haveHappyAnim())
   205. [canHaveEggs()](#canHaveEggs())
   206. [needHutch()](#needHutch())
   207. [canPoop()](#canPoop())
   208. [getMinClutchSize()](#getMinClutchSize())
   209. [getMaxClutchSize()](#getMaxClutchSize())
   210. [getCurrentClutchSize()](#getCurrentClutchSize())
   211. [attackOtherMales()](#attackOtherMales())
   212. [shouldAnimalStressAboveGround()](#shouldAnimalStressAboveGround())
   213. [canClimbStairs()](#canClimbStairs())
   214. [forceWanderNow()](#forceWanderNow())
   215. [canClimbFences()](#canClimbFences())
   216. [climbOverFence(IsoDirections)](#climbOverFence(zombie.iso.IsoDirections))
   217. [needMom()](#needMom())
   218. [getFertilizedTimeMax()](#getFertilizedTimeMax())
   219. [isLocalPlayer()](#isLocalPlayer())
   220. [getThirstBoost()](#getThirstBoost())
   221. [getHungerBoost()](#getHungerBoost())
   222. [removeBaby(IsoAnimal)](#removeBaby(zombie.characters.animals.IsoAnimal))
   223. [remove()](#remove())
   224. [delete()](#delete())
   225. [canEatFromTrough(IsoFeedingTrough)](#canEatFromTrough(zombie.iso.objects.IsoFeedingTrough))
   226. [getThumpDelay()](#getThumpDelay())
   227. [getBloodQuantity()](#getBloodQuantity())
   228. [getFeatherNumber()](#getFeatherNumber())
   229. [getFeatherItem()](#getFeatherItem())
   230. [isHappy()](#isHappy())
   231. [shouldBeSkeleton()](#shouldBeSkeleton())
   232. [setShouldBeSkeleton(boolean)](#setShouldBeSkeleton(boolean))
   233. [getGeneticDisorder()](#getGeneticDisorder())
   234. [copyGeneticDisorder(Collection)](#copyGeneticDisorder(java.util.Collection))
   235. [getBabies()](#getBabies())
   236. [canRagdoll()](#canRagdoll())
   237. [getZoneAcceptance()](#getZoneAcceptance())
   238. [getPlayerAcceptance(IsoPlayer)](#getPlayerAcceptance(zombie.characters.IsoPlayer))
   239. [addAnimalPart(AnimalPart, IsoPlayer, IsoDeadBody)](#addAnimalPart(zombie.characters.animals.AnimalPart,zombie.characters.IsoPlayer,zombie.iso.objects.IsoDeadBody))
   240. [modifyMeat(Food, float, float)](#modifyMeat(zombie.inventory.types.Food,float,float))
   241. [shouldStartFollowWall()](#shouldStartFollowWall())
   242. [getCorpseSize()](#getCorpseSize())
   243. [getCorpseLength()](#getCorpseLength())
   244. [setOnHook(boolean)](#setOnHook(boolean))
   245. [isOnHook()](#isOnHook())
   246. [getAdef()](#getAdef())
   247. [getHook()](#getHook())
   248. [setHook(IsoButcherHook)](#setHook(zombie.iso.IsoButcherHook))
   249. [reattachBackToHook()](#reattachBackToHook())
   250. [ensureCorrectSkin()](#ensureCorrectSkin())
   251. [getTypeAndBreed()](#getTypeAndBreed())
   252. [createAnimalFromCorpse(IsoDeadBody)](#createAnimalFromCorpse(zombie.iso.objects.IsoDeadBody))
   253. [updateLOS()](#updateLOS())
   254. [canBePutInHutch(IsoHutch)](#canBePutInHutch(zombie.iso.objects.IsoHutch))
   255. [shouldCreateZone()](#shouldCreateZone())
   256. [setIsRoadKill(boolean)](#setIsRoadKill(boolean))
   257. [isRoadKill()](#isRoadKill())
   258. [getLastCellSavedToX()](#getLastCellSavedToX())
   259. [getLastCellSavedToY()](#getLastCellSavedToY())
   260. [setLastCellSavedTo(int, int)](#setLastCellSavedTo(int,int))
   261. [getFeedByHandAnim()](#getFeedByHandAnim())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoAnimal
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso")

[zombie.characters.IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters")

zombie.characters.IsoLivingCharacter

[zombie.characters.IsoPlayer](../IsoPlayer.html "class in zombie.characters")

zombie.characters.animals.IsoAnimal

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.ai.IStateCharacter, zombie.characters.action.IActionStateChanged, zombie.characters.CharacterInputComponentEntity, zombie.characters.ecs.ECSEntity, zombie.characters.ILuaGameCharacter, ILuaGameCharacterAttachedItems, ILuaGameCharacterClothing, zombie.characters.ILuaGameCharacterDamage, zombie.characters.ILuaGameCharacterHealth, zombie.characters.ILuaVariableSource, zombie.characters.Talker, zombie.chat.ChatElementOwner, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventListener, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, IAnimationVariableRegistry, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.population.IClothingItemListener, IAnimalVisual, IHumanVisual, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, zombie.network.fields.IPositional`

---

public class IsoAnimal
extends [IsoPlayer](../IsoPlayer.html "class in zombie.characters")
implements [IAnimalVisual](../../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual")

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.characters.animals.IsoAnimal)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [IsoPlayer](../IsoPlayer.html#nested-class-summary "class in zombie.characters")

  `IsoPlayer.InputState, IsoPlayer.MoveVars`

  ### Nested classes/interfaces inherited from class [IsoGameCharacter](../IsoGameCharacter.html#nested-class-summary "class in zombie.characters")

  `IsoGameCharacter.BodyLocation, IsoGameCharacter.l_testDotSide, IsoGameCharacter.LightInfo, IsoGameCharacter.Location, IsoGameCharacter.PerkInfo, IsoGameCharacter.TorchInfo, IsoGameCharacter.XP, IsoGameCharacter.XPMultiplier`

  ### Nested classes/interfaces inherited from class [IsoObject](../../iso/IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `AnimalDefinitions`

  `adef`

  `boolean`

  `alerted`

  `IsoMovingObject`

  `alertedChr`

  `int`

  `animalId`

  `private final HashMap<String, zombie.characters.animals.AnimalSoundState>`

  `animalSoundState`

  `private final AnimalVisual`

  `animalVisual`

  `private AnimalZone`

  `animalZone`

  `IsoGameCharacter`

  `atkTarget`

  `int`

  `attachBackToHookX`

  `int`

  `attachBackToHookY`

  `int`

  `attachBackToHookZ`

  `int`

  `attachBackToMother`

  `float`

  `attachBackToMotherTimer`

  `private int`

  `attachBackToTreeX`

  `private int`

  `attachBackToTreeY`

  `long`

  `attackedTimer`

  `private ArrayList<IsoAnimal>`

  `babies`

  `private BaseAnimalBehavior`

  `behavior`

  `private final ArrayList<DesignationZoneAnimal>`

  `connectedDZone`

  `private String`

  `customName`

  `private AnimalData`

  `data`

  `IsoGridSquare`

  `drinkFromPuddle`

  `IsoGridSquare`

  `drinkFromRiver`

  `IsoFeedingTrough`

  `drinkFromTrough`

  `private DesignationZoneAnimal`

  `dZone`

  `IsoWorldInventoryObject`

  `eatFromGround`

  `IsoFeedingTrough`

  `eatFromTrough`

  `int`

  `eggTimerInHutch`

  `IsoGameCharacter`

  `fightingOpponent`

  `private static final int`

  `FLEE_SOUND_DISTANCE_DEFAULT`

  `private static final int`

  `FLEE_SOUND_DISTANCE_WILD`

  `boolean`

  `followingWall`

  `private String`

  `forceNextIdleSound`

  `boolean`

  `fromMeta`

  `HashMap<String, AnimalGene>`

  `fullGenome`

  `ArrayList<String>`

  `geneticDisorder`

  `IsoPlayer`

  `heldBy`

  `private IsoButcherHook`

  `hook`

  `IsoHutch`

  `hutch`

  `ArrayList<IsoFeedingTrough>`

  `ignoredTrough`

  `static final int`

  `INVALID_SQUARE_XY`

  `private boolean`

  `invincible`

  `private boolean`

  `isAttackingOnClient`

  `int`

  `itemId`

  `private static final Position3D`

  `L_renderCustomName`

  `private static final float`

  `LAST_ALERTED_FLEE_SOUND_TIME`

  `private int`

  `lastCellSavedToX`

  `private int`

  `lastCellSavedToY`

  `private WorldSoundManager.WorldSound`

  `lastSoundRespondedTo`

  `IsoPlayer`

  `luredBy`

  `private float`

  `luredStartTimer`

  `String`

  `migrationGroup`

  `private int`

  `milkRemoved`

  `private static final float`

  `MIN_PLAYER_ACCEPTANCE_FOR_SOUND`

  `IsoAnimal`

  `mother`

  `int`

  `motherId`

  `private boolean`

  `moveForwardOnZone`

  `InventoryItem`

  `movingToFood`

  `float`

  `movingToFoodTimer`

  `int`

  `nestBox`

  `private String`

  `nextFootstepSound`

  `private boolean`

  `onHook`

  `private float`

  `petTimer`

  `HashMap<Short,Float>`

  `playerAcceptanceList`

  `private boolean`

  `roadKill`

  `int`

  `searchRadius`

  `private static final long`

  `serialVersionUID`

  `private boolean`

  `shouldBeSkeleton`

  `boolean`

  `shouldFollowWall`

  `boolean`

  `smallEnclosure`

  `private static final float`

  `SOUND_RADIUS_FLEE_TIME_FACTOR`

  `static final float`

  `SOUND_RADIUS_MULTIPLIER_WILD`

  `private static final float`

  `SOUND_RADIUS_STRESS_FACTOR`

  `IsoMovingObject`

  `spottedChr`

  `float`

  `stressLevel`

  `static final Vector2`

  `tempVector2`

  `private static final Vector3`

  `tempVector3`

  `private static final Vector3f`

  `tempVector3f`

  `private float`

  `thumpDelay`

  `IsoObject`

  `thumpTarget`

  `private float`

  `timeSinceFleeFromSound`

  `long`

  `timeSinceLastUpdate`

  `private String`

  `type`

  `double`

  `virtualId`

  `boolean`

  `walkToCharLuring`

  `boolean`

  `wild`

  `private float`

  `zoneAcceptance`

  `private float`

  `zoneCheckTimer`

  ### Fields inherited from class [IsoPlayer](../IsoPlayer.html#field-summary "class in zombie.characters")

  `accessLevel, aimingWeaponAnimation, asleepTime, assumedPlayer, autoDrink, bannedAttacking, baseVisual, bleedingLevel, changeCharacterDebounce, chargeTime, clearSpottedTimer, closestZombie, contextPanic, couldBeSeenThisFrame, currentSpeed, DEATH_MUSIC_NAME, deathFinished, dialogMood, dirtyRecalcGridStack, dirtyRecalcGridStackTime, dragCharacter, dragObject, factionPvp, followCamStack, followId, heartDelay, heartDelayMax, heartEventInstance, isCharging, isChargingLt, isLuringAnimals, isPlayerMoving, isSpeek, isTestAIMode, isVoiceMute, joypadIgnoreChargingRt, lastAngle, lastSpotted, lastTargeted, luredAnimals, MAX, maxWeightDelta, moodleCantSprint, mpTorchCone, mpTorchDist, mpTorchStrength, NETWORK_SPEED_MUL_MAX, NETWORK_SPEED_MUL_MIN, NETWORK_SPEED_SMOOTH_END, NETWORK_SPEED_SMOOTH_START, NoSound, numNearbyBuildingsRooms, numPlayers, onlineChunkGridWidth, onlineId, physicsDebugRenderer, ping, playerIndex, playerMoveDir, players, remote, remoteFitLvl, remotePlayerItemVisuals, remoteSneakLvl, remoteStrLvl, role, runningTime, saveFileName, seenThisFrame, serverPlayerIndex, showTag, soundListener, spottedByPlayer, spottedList, sqlId, tagPrefix, targetedByZombie, ticksSinceSeenZombie, timePressedContext, timeSinceCloseDoor, timeSinceLastStab, timeSinceOpenDoor, useChargeDelta, username, vehicle4testCollision, waiting`

  ### Fields inherited from class zombie.characters.IsoLivingCharacter

  `bareHands, collidedWithPushable, targetOnGround`

  ### Fields inherited from class [IsoGameCharacter](../IsoGameCharacter.html#field-summary "class in zombie.characters")

  `allowConversation, amputations, asleep, attachedItems, attackedBy, attackTargetSquare, attackVars, AwkwardGlovesStrengthDivisor, bagsWorn, beard, BeenMovingForDecrease, BeenMovingForIncrease, blockTurning, bodyDamage, bumpNbr, callOut, characterActions, characterTraits, chatElement, cheats, climbing, clothingWetness, clothingWetnessSync, damagedByVehicle, dead, delayToActuallySleep, descriptor, doDirtBloodEtc, emitter, enemyList, falling, fallTime, finder, forceNullOverride, forceWakeUp, forceWakeUpTime, forwardDirection, GlovesStrengthBonus, hair, handItemShouldSendToClients, health, HUMANOID_SCREEN_CHEST_HEIGHT, HUMANOID_WORLD_CHEST_HEIGHT, hurtSound, ignoreStaggerBack, inf, inventory, invRadioFreq, isOnGround, isoPlayer, isResting, isVisibleToPlayer, kill, knockbackAttackMod, lastAnimalPet, lastFallSpeed, leftHandItem, legsSprite, lightInfo, moodles, networkCharacter, numSurvivorsInVicinity, onFireLightSource, overridePrimaryHandModel, overrideSecondaryHandModel, pathing, persistentOutfitId, persistentOutfitInit, playingDeathSound, primaryHandModel, realState, realx, realy, realz, reanimatedCorpse, reanimatedCorpseId, remoteId, removedFromWorldMs, RENDER_OFFSET_X, RENDER_OFFSET_Y, rightHandItem, runSpeedModifier, s_maxPossibleTwist, savedInventoryItems, savedVehicleRunning, savedVehicleSeat, savedVehicleX, savedVehicleY, secondaryHandModel, slowFactor, slowTimer, SNEAK_LIMP_INJURY_THRESHOLD, SNEAK_LIMP_SPEED_SCALE_DEFAULT, speakColour, speaking, speedMod, stats, tempItemVisuals, tempo2, tempo3, timeOfSleep, turnDeltaNormal, turnDeltaRunning, turnDeltaSprinting, updateEquippedTextures, useHandWeapon, useParts, userName, usernameDisguised, vbdebugHitTarget, vehicle, vocalEvent, WALK_SPEED_DEFAULT, WALK_SPEED_SLOW, wasKnockedDown, wornItems, xp`

  ### Fields inherited from class [IsoMovingObject](../../iso/IsoMovingObject.html#field-summary "class in zombie.iso")

  `collidable, current, def, hitDir, id, last, MAX_ZOMBIES_EATING, movementLastFrame, movingSq, noDamage, reqMovement, shootable, solid, treeSoundMgr, weight, width`

  ### Fields inherited from class [IsoObject](../../iso/IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoAnimal(IsoCell cell)`

  `IsoAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String type,
  String breedName)`

  `IsoAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String type,
  String breedName,
  boolean skeleton)`

  `IsoAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String type,
  AnimalBreed breed)`

  `IsoAnimal(IsoCell cell,
  int x,
  int y,
  int z,
  String type,
  AnimalBreed breed,
  boolean skeleton)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAcceptance(IsoPlayer chr,
  float acceptance)`

  `static void`

  `addAnimalPart(zombie.characters.animals.AnimalPart part,
  IsoPlayer player,
  IsoDeadBody carcass)`

  Add an animal part in the player's inventory
  If the part is a food we gonna modify it

  `IsoAnimal`

  `addBaby()`

  `InventoryItem`

  `addDebugBucketOfMilk(IsoGameCharacter chr)`

  `boolean`

  `addEgg(boolean meta)`

  `void`

  `addToWorld()`

  `void`

  `alertOtherAnimals(IsoMovingObject chr,
  boolean alert)`

  TODO: Not working quite well
  Alert surrounding animals so they all look at the players at the same time
  If already alerted make other animals flee too

  `boolean`

  `allowsTwist()`

  `boolean`

  `animalShouldThump()`

  Animal should thump if they're hungry or fleeing someone or if they're too stressed

  `boolean`

  `attackOtherMales()`

  `float`

  `calcDamage()`

  `boolean`

  `canBeFeedByHand()`

  `boolean`

  `canBeKilledWithoutWeapon()`

  `boolean`

  `canBeMilked()`

  `boolean`

  `canBePet()`

  `boolean`

  `canBePicked(IsoGameCharacter chr)`

  `boolean`

  `canBePutInHutch(IsoHutch hutch)`

  `boolean`

  `canBeSheared()`

  `void`

  `cancelLuring()`

  `boolean`

  `canClimbFences()`

  `boolean`

  `canClimbStairs()`

  `boolean`

  `canDoAction()`

  `InventoryItem`

  `canEatFromTrough(IsoFeedingTrough trough)`

  Return a food this animal can eat from the trough

  `boolean`

  `canGoThere(IsoGridSquare sq)`

  Look to go on a square, but might be limited by rope

  `boolean`

  `canHaveEggs()`

  `boolean`

  `canPoop()`

  `boolean`

  `canRagdoll()`

  `boolean`

  `canUseCurrentPoseForCorpse()`

  `protected boolean`

  `CanUsePathfindState()`

  `void`

  `carCrash(float delta,
  boolean front)`

  Lower the health of an animal that is in a car after a crash

  `void`

  `changeStress(float inc)`

  Increase or decrease stress with the stress gene as modifier
  The stress gene kinda works backward, 0.2 means a lot of stress gain compared to 0.9 for ex.

  `void`

  `checkAlphaAndTargetAlpha(IsoPlayer other)`

  `boolean`

  `checkForChickenpocalypse()`

  Hardcoded hack to check if we don't try to spawn a new animal that already has this ID
  Need to test more/find more case of it happening for a proper fix

  `boolean`

  `checkForWater()`

  `boolean`

  `checkKilledByMetaPredator(int hour)`

  Simulate a fox killing chicken at night, only applies if the chicken is either outside or in a hutch with opened door (this is also called from IsoHutch)
  Called every hour

  `private void`

  `checkTreeExists()`

  `private void`

  `checkZone()`

  Check if the animal is in his correct designationzone

  `private void`

  `chooseIdleSound()`

  `void`

  `climbOverFence(IsoDirections dir)`

  `void`

  `copyFrom(IsoAnimal animal)`

  `void`

  `copyGeneticDisorder(Collection<String> disorders)`

  `void`

  `copyGenome(Collection<AnimalGene> genome)`

  `static IsoAnimal`

  `createAnimalFromCorpse(IsoDeadBody body)`

  `Food`

  `createEgg()`

  Create an egg, change its hunger value depending on the eggSize gene of the animal
  If no such gene exist, create a basic egg.

  `void`

  `debugAgeAway(int hour)`

  RJ TESTING: just something to force simulate you getting back X hours after being away

  `void`

  `debugForceEgg()`

  `void`

  `debugForceSit()`

  If animal is sitting, make him stand up, otherwise make him sit for some times

  `void`

  `debugRandomHappyAnim()`

  `void`

  `debugRandomIdleAnim()`

  `void`

  `delete()`

  `private void`

  `doDebugString()`

  `void`

  `drawDirectionLine(Vector2 dir,
  float length,
  float r,
  float g,
  float b)`

  `void`

  `drawRope(IsoGameCharacter chr)`

  `private void`

  `drawRope(IsoGridSquare sq)`

  Draw a line, more red the further you are from the provided sq

  `void`

  `eatFromLured(IsoPlayer chr,
  InventoryItem item)`

  After being lured to the player, animal will eat what the player used to lure (hay, grass...)

  `private void`

  `ensureCorrectSkin()`

  Im a bit lost why AnimalVisual wasn't taking the correct skin...

  `void`

  `feedFromHand(IsoPlayer chr,
  InventoryItem food)`

  `void`

  `fertilize(IsoAnimal male,
  boolean force)`

  `private boolean`

  `findMotherAndAttach(List<IsoAnimal> animals)`

  `void`

  `fleeTo(IsoGridSquare sq)`

  Make the animal run to the SQ

  `void`

  `forceWanderNow()`

  `float`

  `getAcceptanceLevel(IsoPlayer chr)`

  `AnimalDefinitions`

  `getAdef()`

  `int`

  `getAge()`

  `String`

  `getAgeText(boolean cheat,
  int skillLvl)`

  `ArrayList<InventoryItem>`

  `getAllPossibleFoodFromInv(IsoGameCharacter chr)`

  `int`

  `getAnimalID()`

  `float`

  `getAnimalOriginalSize()`

  `float`

  `getAnimalSize()`

  `zombie.characters.animals.AnimalSoundState`

  `getAnimalSoundState(String slot)`

  `float`

  `getAnimalTrailerSize()`

  `String`

  `getAnimalType()`

  `AnimalVisual`

  `getAnimalVisual()`

  `AnimalZone`

  `getAnimalZone()`

  `String`

  `GetAnimSetName()`

  `String`

  `getAppearanceText(boolean cheat)`

  `Position3D`

  `getAttachmentWorldPos(String attachmentName)`

  `Position3D`

  `getAttachmentWorldPos(String attachmentName,
  Position3D pos)`

  `ArrayList<IsoAnimal>`

  `getBabies()`

  `String`

  `getBabyType()`

  `BaseAnimalBehavior`

  `getBehavior()`

  `float`

  `getBloodQuantity()`

  Get the blood quantity in this animal (you can get it from a butchering hook)

  `AnimalBreed`

  `getBreed()`

  `private IsoObject`

  `getCanAttachAnimalObject(IsoGridSquare square)`

  `ArrayList<DesignationZoneAnimal>`

  `getConnectedDZone()`

  `float`

  `getCorpseLength()`

  `float`

  `getCorpseSize()`

  `int`

  `getCurrentClutchSize()`

  `String`

  `getCustomName()`

  `AnimalData`

  `getData()`

  `DesignationZoneAnimal`

  `getDZone()`

  `ArrayList<String>`

  `getEatTypePossibleFromHand()`

  `float`

  `getEggGeneMod()`

  `int`

  `getEggsPerDay()`

  `String`

  `getFeatherItem()`

  `int`

  `getFeatherNumber()`

  Get the number of feather you can harvest from this animal

  `String`

  `getFeedByHandAnim()`

  `float`

  `getFeelersize()`

  `int`

  `getFertilizedTimeMax()`

  `HashMap<String, AnimalGene>`

  `getFullGenome()`

  `ArrayList<AnimalGene>`

  `getFullGenomeList()`

  `String`

  `getFullName()`

  `ArrayList<String>`

  `getGeneticDisorder()`

  `String`

  `getHealthText(boolean cheat,
  int skillLvl)`

  `IsoButcherHook`

  `getHook()`

  `float`

  `getHunger()`

  `float`

  `getHungerBoost()`

  `IsoHutch`

  `getHutch()`

  `Texture`

  `getInventoryIconTexture()`

  `String`

  `getInventoryIconTextureName()`

  `int`

  `getItemID()`

  `int`

  `getLastCellSavedToX()`

  `int`

  `getLastCellSavedToY()`

  `WorldSoundManager.WorldSound`

  `getLastSoundRespondedTo()`

  `String`

  `getMate()`

  `int`

  `getMaxClutchSize()`

  `float`

  `getMeatRatio()`

  `String`

  `getMilkAnimPreset()`

  `String`

  `getMilkType()`

  `int`

  `getMinAgeForBaby()`

  `int`

  `getMinClutchSize()`

  `IsoAnimal`

  `getMother()`

  `int`

  `getNestBoxIndex()`

  `protected float`

  `getNetworkSpeedMul()`

  `String`

  `getNextStageAnimalType()`

  `String`

  `getObjectName()`

  `float`

  `getPetTimer()`

  `float`

  `getPlayerAcceptance(IsoPlayer chr)`

  `ArrayList<InventoryItem>`

  `getPossibleLuringItems(IsoGameCharacter chr)`

  `IsoGridSquare`

  `getRandomSquareInZone()`

  `float`

  `getStress()`

  `String`

  `getStressTxt(boolean cheat,
  int skillLvl)`

  `float`

  `getThirst()`

  `float`

  `getThirstBoost()`

  `float`

  `getThumpDelay()`

  `String`

  `getTypeAndBreed()`

  `AnimalAllele`

  `getUsedGene(String name)`

  `DesignationZone`

  `getZone()`

  `float`

  `getZoneAcceptance()`

  `boolean`

  `hasAnimalZone()`

  `boolean`

  `hasGeneticDisorder(String gd)`

  `boolean`

  `hasUdder()`

  `boolean`

  `haveEnoughMilkToFeedFrom()`

  `boolean`

  `haveHappyAnim()`

  `boolean`

  `haveMatingSeason()`

  `float`

  `Hit(BaseVehicle vehicle,
  float speed,
  boolean isHitFromBehind,
  float hitDirX,
  float hitDirY,
  boolean pushedBack,
  float collisionPosOnVehicleX,
  float collisionPosOnVehicleY)`

  `float`

  `Hit(BaseVehicle vehicle,
  float speed,
  boolean isHitFromBehind,
  Vector2 hitDir)`

  `void`

  `HitByAnimal(IsoAnimal animal,
  boolean bIgnoreDamage)`

  `void`

  `hitConsequences(HandWeapon weapon,
  IsoGameCharacter wielder,
  boolean bIgnoreDamage,
  float damage,
  boolean bRemote)`

  `void`

  `init(AnimalBreed breed)`

  `private void`

  `initAge()`

  `void`

  `initializeStates()`

  `private void`

  `initStress()`

  `private void`

  `initTexture()`

  `private void`

  `initType(AnimalBreed breed)`

  `boolean`

  `isAlerted()`

  `boolean`

  `isAnimalAttacking()`

  `boolean`

  `isAnimalEating()`

  `boolean`

  `isAnimalMoving()`

  `boolean`

  `isAnimalRunningToDeathPosition()`

  `boolean`

  `isAnimalSitting()`

  `boolean`

  `isBaby()`

  `boolean`

  `isExistInTheWorld()`

  `boolean`

  `isGeriatric()`

  `boolean`

  `isHappy()`

  `boolean`

  `isHeld()`

  `boolean`

  `isInMatingSeason()`

  `boolean`

  `isInvincible()`

  Currently only used for animals, use godMod for players

  `boolean`

  `isLocalPlayer()`

  `boolean`

  `isMoveForwardOnZone()`

  `boolean`

  `isOnHook()`

  `boolean`

  `isRoadKill()`

  `boolean`

  `isWild()`

  `void`

  `killed(IsoPlayer chr)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `InventoryItem`

  `milkAnimal(IsoGameCharacter chr,
  InventoryItem bucket)`

  Milk an animal
  For every 5L removed we add a bit more to the max milk an animal can have
  Bucket will be replaced by his milk variant if needed
  Milking an animal while having poor Husbandry skill will add stress to the animal

  `static void`

  `modifyMeat(Food item,
  float size,
  float meatRatio)`

  Modify the meat/food item given by the butchering by the meatRatio invalid input: '&' size of animal
  Adding a \*0.9-1.1 for flavor

  `boolean`

  `needHutch()`

  `boolean`

  `needMom()`

  This is only used to display or not "baby can't find their mom" in their animalUI.

  `protected void`

  `onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)`

  `void`

  `OnDeath()`

  `private void`

  `onDied(IsoGameCharacter sender,
  IsoDeadBody body)`

  `void`

  `onPlayBreedSoundEvent(String id)`

  `void`

  `pathFailed()`

  When our pathfinding failed we try to find what we were doing
  This is used to ignore trough that could be outside a fenced area etc.

  `void`

  `pathToCharacter(IsoGameCharacter target)`

  `void`

  `pathToLocation(int x,
  int y,
  int z)`

  `void`

  `pathToTrough(IsoFeedingTrough trough)`

  Check which side of the trough we should be in, depending if it's oriented north or not, then we check if in the 2 tiles there's one free closer than the other

  `void`

  `petAnimal(IsoPlayer chr)`

  `boolean`

  `petTimerDone()`

  `long`

  `playBreedSound(String id)`

  `void`

  `playDeadSound()`

  `void`

  `playNextFootstepSound()`

  `void`

  `playSoundDebug()`

  `void`

  `playStressedSound()`

  `void`

  `randomizeAge()`

  `boolean`

  `readyToBeMilked()`

  `boolean`

  `readyToBeSheared()`

  `void`

  `reattachBackToHook()`

  The animal attached on a hook needs a corpse that doesn't exist, so when we load the animal that was on a hook we gonna recreate this corpse and make sure our animal is in correct positions

  `private void`

  `reattachBackToMom()`

  `private void`

  `reattachToTree()`

  When we load an animal, the tree might not be loaded yet, so we store its X/Y and wait for it to be loaded to reattach

  `private void`

  `registerVariableCallbacks()`

  `void`

  `remove()`

  `void`

  `removeBaby(IsoAnimal baby)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `private void`

  `renderCustomName()`

  `void`

  `renderlast()`

  `void`

  `renderShadow(float x,
  float y,
  float z)`

  `void`

  `respondToSound()`

  Flee from gunshot

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave,
  boolean serialize)`

  `void`

  `sendExtraUpdateToClients()`

  `void`

  `setAgeDebug(int newAge)`

  `void`

  `setAnimalAttackingOnClient(boolean value)`

  `void`

  `setAnimalID(int id)`

  `void`

  `setAnimalZone(AnimalZone zone)`

  `void`

  `setCustomName(String customName)`

  `void`

  `setData(AnimalData newData)`

  `void`

  `setDebugAcceptance(IsoPlayer chr,
  float acceptance)`

  `void`

  `setDebugStress(float stress)`

  `void`

  `setDZone(DesignationZoneAnimal dZone)`

  `void`

  `setHealth(float health)`

  `void`

  `setHook(IsoButcherHook hook)`

  `void`

  `setIsAlerted(boolean b)`

  `void`

  `setIsInvincible(boolean b)`

  `void`

  `setIsRoadKill(boolean roadKill)`

  `void`

  `setItemID(int itemId)`

  `void`

  `setLastCellSavedTo(int x,
  int y)`

  `void`

  `setMaxSizeDebug()`

  `void`

  `setMother(IsoAnimal mom)`

  `void`

  `setMoveForwardOnZone(boolean b)`

  `void`

  `setOnHook(boolean onhook)`

  `void`

  `setShouldBeSkeleton(boolean shouldBeSkeleton)`

  `void`

  `setShouldFollowWall(boolean b)`

  `void`

  `setWild(boolean b)`

  Make an animal "wild" (doesn't need hunger/thirst, migration if on a path, etc.)
  Some animals can never become not wild (deer...)

  `boolean`

  `shearAnimal(IsoGameCharacter chr,
  InventoryItem shear)`

  `boolean`

  `shouldAnimalStressAboveGround()`

  If stressAboveGround is true in animal def and animal Z is > 0, high stress incoming!

  `boolean`

  `shouldBecomeZombieAfterDeath()`

  `boolean`

  `shouldBeSkeleton()`

  `boolean`

  `shouldBreakObstaclesDuringPathfinding()`

  `boolean`

  `shouldCreateZone()`

  `boolean`

  `shouldFollowWall()`

  `boolean`

  `shouldStartFollowWall()`

  An animal will start to follow wall only if fleeing, or attached to someone

  `void`

  `spotted(IsoMovingObject other,
  boolean bForced,
  float dist)`

  `void`

  `stopAllMovementNow()`

  `void`

  `test()`

  `boolean`

  `testCollideWithVehicles(BaseVehicle vehicle,
  BaseVehicle.HitVars hitVars)`

  `void`

  `tryLure(IsoPlayer chr,
  InventoryItem item)`

  Every X seconds we trigger this when the player is luring, method need bit more in depth (hunger, can he see..)
  Success depend on stress/acceptance lvl of the player

  `boolean`

  `tryThump(IsoGridSquare square)`

  `void`

  `unloaded()`

  `void`

  `update()`

  `private void`

  `updateInternal()`

  `void`

  `updateLastTimeSinceUpdate()`

  `void`

  `updateLoopingSounds()`

  `void`

  `updateLOS()`

  `private void`

  `updateLured()`

  `void`

  `updateRunLoopingSound()`

  `void`

  `updateStatsAway(int hours)`

  `void`

  `updateStress()`

  `void`

  `updateVocalProperties()`

  `void`

  `updateWalkLoopingSound()`

  `private void`

  `updateZoneAcceptance()`

  ### Methods inherited from class [IsoPlayer](../IsoPlayer.html#method-summary "class in zombie.characters")

  `addAttachedAnimal, addMechanicsItem, addSelectedZoneForHighlight, addWorldSoundUnlessInvisible, allowsInvisibleAnimationSkips, allPlayersAsleep, allPlayersDead, anyPlayer, applyDamageFromVehicleHit, AttemptAttack, calculateContext, calculateCritChance, calculateShowAdminTag, calculateStats, calculateWalkSpeed, canClimbOverWall, canHearAll, canPerformHandToHandCombat, canPlaceCorpseOnSquare, canSeeAll, canThrowCorpseOver, canThrowCorpseOver, checkActionGroup, checkAnimalAttachedToRope, checkCanSeeClient, checkCanSeeClient, checkWalkTo, checkZonesInterception, clearHandToHandAttack, climbOverWall, createPlayerStats, DoAttack, DoAttack, doContext, doContextClimbOverWall, DoFootstepSound, doTreeNoises, dressInClothingItem, dressInNamedOutfit, findClosestCorpseOnGroundToPickup, findPlayer, forEachPlayer, getAccessLevel, getActiveLightItem, getAimingMod, getAimingRangeMod, getAimVector, getAllFileNames, getAllSavedPlayers, getAlreadyReadBook, getAnticheatMask, getAsleepTime, getAttachedAnimals, getAttackType, getAutoDrink, getClearSpottedTimer, getClosestTo, getCombatSpeed, getContextDoorOrWindowOrWindowFrame, getCoopPVP, getDeferredMovement, getDescription, getDialogMood, getDisguisedDisplayName, getDisplayName, getDragCharacter, getDragObject, getExtraInfoFlags, getFitness, getFollowDeadCount, getFollowID, getGlobalMovementMod, getHeartDelay, getHeartDelayMax, getHoursSurvived, getHumanVisual, getIndex, getInputMoveVector, getInstance, getInvAimingMod, getInvAimingRangeMod, getItemVisuals, getItemVisuals, getLastAngle, getLastRemoteUpdate, getLastSeenZomboidTime, getLastSpotted, getLightDistance, getLocalPlayerByOnlineID, getLuredAnimals, getMaxWeightDelta, getMechanicsItem, getMinimumSimulationLevel, getMoodleLevel, getMoveSpeed, getMusicIntensityEvents, getMusicThreatStatuses, getNearVehicle, getNetworkCharacterAI, getNutrition, getOffSetXUI, getOffSetYUI, getOnlineID, getParameterCharacterMovementSpeed, getPathSpeed, getPing, getPlayer, getPlayerClothingInsulation, getPlayerClothingTemperature, getPlayerCraftHistory, getPlayerIndex, getPlayerIndex, getPlayerNum, getPlayers, getRelevantAndDistance, getReloadingMod, getRole, getScreenChestHeight, getSelectedZoneForHighlight, getSelectedZonesForHighlight, getSleepingPillsTaken, getSpottedList, getSteamID, getTagColor, getTagPrefix, getTicksSinceSeenZombie, getTimedActionTimeModifier, getTimedActionToRetrigger, getTimeSinceLastNetData, getTimeSinceLastStab, getTimeSurvived, getTorchDot, getTorchStrength, getTurnDelta, getUniqueFileName, getUnwantedModDataString, getUseableAnimal, getUseableVehicle, getUsername, getUsername, getUsername, getVisual, getVoicePitch, getVoiceType, getZombieRelevenceScore, handleLandingImpact, hasAttachedAnimals, hasInstance, hopFence, InitSpriteParts, invokeOnPlayerInstance, isAccessLevel, isAimControlActive, isAiming, isAllChatMuted, isAttackAnimThrowTimeOut, isAttackFromBehind, isAttacking, isAttackStarted, isAttackType, isAuthorizedHandToHand, isAuthorizedHandToHandAction, isAuthorizeMeleeAction, isAuthorizeShoveStomp, isBannedAttacking, isbChangeCharacterDebounce, isbCouldBeSeenThisFrame, isBehaviourMoving, isBlockMovement, isbSeenThisFrame, isCheatPlayerSeeEveryone, isClimbOverWallStruggle, isClimbOverWallSuccess, isDoingActionThatCanBeCancelled, isFactionPvp, isFarming, isFavouriteRecipe, isFavouriteRecipe, isForceOverrideAnim, isGettingUp, isGhostMode, isGrapplePressed, isIgnoreAutoVault, isIgnoreContextKey, isInitiateAttack, IsInMeleeAttack, isInTrees2, isInvPageDirty, isJustMoved, isLocalPlayer, isLocalPlayer, isLookingWhileInVehicle, isMaskClicked, isMeleePressed, isNearVehicle, isNoClip, isOnlyPlayerAsleep, isOutside, isPathfindRunning, isPerformingAnAction, isPlayerMoving, isPlayingAttackLoopSound, isPushableForSeparate, isPushedByForSeparate, isRemoteAndHasObstacleOnPath, IsRunning, isSafeToClimbOver, isSaveFileInUse, isSaveFileIPValid, isSeeDesignationZone, isSeeEveryone, isSeeNonPvpZone, isServerPlayerIDValid, isShowTag, isSkeleton, isSkipResolveCollision, isSolidForSeparate, isTargetedByZombie, isTimedActionInstant, isTorchCone, isUnwanted, IsUsingAimWeapon, isWaiting, isWalking, isWearingNightVisionGoggles, load, loadChange, lureAnimal, moveUnmodded, nullifyAiming, OnAnimEvent, onHitByVehicleApplyDamage, onKilled, onWornItemsChanged, petAnimal, playBloodSplatterSound, playerVoiceSound, playGainExperienceLevelSound, playPainVoicesFromFallDamage, playRangedWeaponShootSound, postHitByVehicleUpdateStance, postupdate, pressedAim, pressedAttack, pressedCancelAction, pressedMovement, preupdate, processWakingUp, registerECSComponents, removeAllAttachedAnimals, removeAttachedAnimal, removeSaveFile, render, Reset, resetDisplayName, resetSelectedZonesForHighlight, resetSleepingPillsTaken, save, save, setAddedToModelManager, setAllChatMuted, setAngleFromAim, setAsleepTime, setAttackAnimThrowTimer, setAttackFromBehind, setAttackStarted, setAttackType, setAttackVariationX, setAttackVariationY, setAuthorizedHandToHand, setAuthorizedHandToHandAction, setAuthorizeMeleeAction, setAuthorizeShoveStomp, setAutoDrink, setBannedAttacking, setbChangeCharacterDebounce, setbCouldBeSeenThisFrame, setBlockMovement, setbSeenThisFrame, setCanHearAll, setCanSeeAll, setClearSpottedTimer, setClimbOverWallStruggle, setClimbOverWallSuccess, setCombatSpeed, setCoopPVP, setDialogMood, setDisplayName, setDragCharacter, setDragObject, setExtraInfoFlags, setFactionPvp, setFishingStage, setFitnessSpeed, setFollowDeadCount, setFollowID, setForceOverrideAnim, setGhostMode, setGhostMode, setHasObstacleOnPath, setHeartDelay, setHeartDelayMax, setHoursSurvived, setIgnoreAutoVault, setIgnoreContextKey, setIgnoreMovement, setInitiateAttack, setInstance, setInvPageDirty, setIsFarming, setIsLuringAnimals, setJustMoved, setLastAngle, setLastAttackWasHandToHand, setLastCheatToggleMillis, setLastRemoteUpdate, setLastSpotted, setLocalPlayer, setMaxWeightDelta, setMeleeHitSurface, setMeleeHitSurface, setMoodleCantSprint, setMoveSpeed, setNoClip, setNoClip, setNpc, setOffSetXUI, setOffSetYUI, setOnlineID, setPathfindRunning, setPerformingAnAction, setPing, setPlayerStats, setRole, setRole, setSeeDesignationZone, setSeeNonPvpZone, setSelectedZoneForHighlight, setShowTag, setSleepingPillsTaken, setSteamID, setTagColor, setTagPrefix, setTicksSinceSeenZombie, setTimedActionToRetrigger, setTimeSinceLastNetData, setTimeSinceLastStab, setUnwanted, setUsername, setVehicle4TestCollision, setVehicleHitLocation, setVoicePitch, setVoiceType, setWaiting, setWearingNightVisionGoggles, shouldBeTurning, startAttackLoopSound, startReceivingBodyDamageUpdates, stopLuringAnimals, stopPlayerVoiceSound, stopReceivingBodyDamageUpdates, syncVisuals, TestAnimalSpotPlayer, TestZombieSpotPlayer, tooDarkToRead, transmitPlayerVoiceSound, triggerMusicIntensityEvent, updateEnduranceWhileInVehicle, updateEnduranceWhileSitting, updateMovementRates, updateRemotePlayer, updateRemotePlayerInVehicle, UpdateRemovedEmitters, updateStats_Sleeping, updateUsername, visitAllPlayers, visitAllPlayersWithComponent, wasLastAttackHandToHand`

  ### Methods inherited from class zombie.characters.IsoLivingCharacter

  `AttemptAttack, getAttackingWeapon, isCollidedWithPushableThisFrame, isDoHandToHandAttack, isDoShove, isDoStomp, isGrapplingWhileAiming, isPrimaryHandModelReady, isShoving, isShovingWhileAiming, isUnarmed, setDoShove`

  ### Methods inherited from class [IsoGameCharacter](../IsoGameCharacter.html#method-summary "class in zombie.characters")

  `actionStateChanged, addArmMuscleStrain, addBackMuscleStrain, addBasicPatch, addBlood, addBloodFromVehicleImpact, addBodyVisualFromItemType, addBothArmMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addCombatMuscleStrain, addDirt, addHole, addHole, addHoleFromZombieAttacks, addKnownMediaLine, addLeftArmMuscleStrain, addLineChatElement, addLineChatElement, addLineChatElement, addLineChatElement, addLotsOfDirt, addNeckMuscleStrain, addOnDiedListener, addReadLiterature, addReadLiterature, addReadMap, addReadPrintMedia, addRightLegMuscleStrain, addStiffness, addVisualDamage, aimAtFloorTargetDistance, applyCharacterTraitsRecipes, applyDamage, ApplyInBedOffset, applyProfessionRecipes, applyTraits, attackFromWindowsLunge, autoDrink, avoidDamage, becomeCorpseItem, BetaAntiDepress, BetaBlockers, bodyPartIsSpiked, bodyPartIsSpikedBehind, burnCorpse, CacheEquipped, calcCarForwardVector, calcCarPositionOffset, calcCarSpeedVector, calcCarSpeedVector, calcCarToPlayerVector, calcCarToPlayerVector, calcConeAngleMultiplier, calcConeAngleOffset, calcHitDir, calcHitDir, calcLengthMultiplier, calculateBaseSpeed, calculateCombatSpeed, calculateGrappleEffectivenessFromTraits, calculateIdleSpeed, calculateShadowParams, calculateShadowParams, calculateSneakLimpSpeedScale, calculateVisibilityData, Callout, Callout, canAccessContainer, CanAttack, canBeGrappled, canClimbDownSheetRope, canClimbDownSheetRopeInCurrentSquare, canClimbSheetRope, canDropCorpseInto, canGrabCorpseFrom, canReachTo, CanSee, CanSee, canSprint, canStandAt, canUseAsGenericCraftingSurface, canUseDebugContextMenu, canUseLootLog, canUseLootZed, carMovingBackward, causesDamageToVehicleWhenHit, changeState, checkCurrentAction, checkIsNearVehicle, checkIsNearWall, checkUpdateModelTextures, clear, clear, clearAIStateMap, clearAttachedItems, clearDiedBody, ClearEquippedCache, clearFallDamage, clearHitInfo, clearKnownMediaLines, clearVariable, ClearVariable, clearVariables, clearWornItems, climbDownSheetRope, climbSheetRope, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindow, climbThroughWindowFrame, closeWindow, clothingItemChanged, compareMovePriority, createFallingItem, createKeyRing, createKeyRing, damageWhileInTrees, dbgGetAnimTrack, dbgGetAnimTrackName, dbgGetAnimTrackTime, dbgGetAnimTrackWeight, die, dieNetwork, DirectionFromVector, DoDeath, DoDeath, doDeathSplatterAndSounds, doDeferredMovement, doDeferredMovementFromRagdoll, DoFloorSplat, DoFootstepSound, DoLand, doNetworkHitByVehicle, doSleepSpeech, DoSneezeText, DoSwingCollisionBoneCheck, drawDebugTextBelow, drawDirectionLine, drawLine, DrawSneezeText, dressInPersistentOutfit, dressInPersistentOutfitID, dressInRandomNonSillyOutfit, dressInRandomOutfit, Dressup, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, DrinkFluid, dropHandItems, dropHeavyItems, dropHeldItems, Eat, Eat, Eat, EatOnClient, endPlaybackGameVariables, ensureExistsBallisticsTarget, ensureNotInVehicle, enterVehicle, exert, faceDirection, faceLocation, faceLocationF, facePosition, faceThisObject, faceThisObjectAlt, fallenOnKnees, fallenOnKnees, fallFromRope, FireCheck, flagForHotSave, forceAwake, forgetRecipes, get, get, getAbsoluteExcessTwist, getActionContext, getActionStateName, getActiveLightItems, getAdvancedAnimator, getAimAtFloorAmount, getAimingDelay, getAimingMode, getAimOriginPosX, getAimOriginPosY, getAimOriginPosZ, getAlphaUpdateRateMul, getAlreadyReadPages, getAnimAngle, getAnimAngleRadians, getAnimAngleStepDelta, getAnimAngleTwistDelta, getAnimatable, getAnimationDebug, getAnimationPlayer, getAnimationStateName, getAnimationTimeDelta, getAnimEventBroadcaster, getAnimForwardDirection, getAnimVector, getAppetiteMultiplier, getAttachedItem, getAttachedItems, getAttachedLocationGroup, getAttackedBy, getAttackTargetSquare, getAttackVars, getAutoWalkDirection, getBallisticsController, getBallisticsTarget, getBarricadeStrengthMod, getBarricadeTimeMod, getBed, getBedType, getBeenMovingFor, getBeenSprintingFor, getBetaDelta, getBetaEffect, getBloodImpactX, getBloodImpactY, getBloodImpactZ, getBloodSplat, getBlurFactor, getBodyDamage, getBodyDamageRemote, getBodyLocationGroup, getBodyPartClothingDefense, getBumpedChr, getBumpFallType, getBumpType, getCardinalDirection, getCardinalDirectionTo, getCharacterActions, getCharacterGender, getCharacterTraits, getChatElement, getCheats, getChestHeight, getChopTreeSpeed, getClickSound, getClimbData, getClimbingFailChanceFloat, getClimbingFailChanceInt, getClimbRopeSpeed, getClimbRopeTime, getClothingDiscomfortModifier, getClothingItem_Back, getClothingItem_Feet, getClothingItem_Hands, getClothingItem_Head, getClothingItem_Legs, getClothingItem_Torso, getClothingWetness, getClothingWetnessSync, getContainers, getContainerToolTip, getContextWorldContainers, getContextWorldContainers, getContextWorldContainersInObjects, getContextWorldContainersWithHumanCorpse, getContextWorldSuitableContainersToDropCorpseInObjects, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessDefense, getCorpseSicknessRate, getCurrentActionContextStateName, getCurrentBuildingDef, getCurrentRoomDef, getCurrentState, getCurrentStateName, getCurrentVerticalAimAngle, getDangerLevels, getDebugMonitor, getDefaultState, getDeferredAngleDelta, getDeferredMovement, getDeferredMovementFromRagdoll, getDeferredRotationWeight, getDepressDelta, getDepressEffect, getDescriptor, getDetectionRange, getDieCount, getDirectionAngle, getDirectionAngleRadians, getDotWithForwardDirection, getDotWithForwardDirection, getEffectiveFatigue, getEmitter, getEnemyList, getEquipedRadio, getExcessTwist, getFallSpeedSeverity, getFallTime, getFamiliarBuildings, getFatigueMod, getFatiqueMultiplier, getFinder, getFireKillRate, getFireMode, getFireSpreadProbability, getFMODParameters, getFollowingTarget, getFootInjurySpeedModifier, getForceWakeUpTime, getForwardDirection, getForwardDirection, getForwardDirectionX, getForwardDirectionY, getForwardMovementIsoDirection, getFreeInventoryCapacity, getGameVariables, getGameVariablesInternal, getGrappleable, getHaloTimerCount, getHammerSoundMod, getHeadLookAngleMax, getHeadLookHorizontal, getHeadLookVertical, getHealth, getHearDistanceModifier, getHeightAboveFloor, getHitChancesMod, getHitDirEnum, getHitInfoList, getHitReaction, getHitReactionNetworkAI, getHittingMod, getHungerMultiplier, getHurtSound, getHyperthermiaMod, getIdleSquareTime, getIgnoreMovement, getImpactIsoSpeed, getInf, getInventory, getInventoryWeight, getKnownRecipes, getLastBump, getLastChatMessage, getLastFallSpeed, getLastHeardSound, getLastHitCharacter, getLastHitCount, getLastHourSleeped, getLastKnownLocation, getLastKnownLocationOf, getLastLocalEnemies, getLastSpokenLine, getLastZombieKills, getLeaveBodyTimedown, getLegsSprite, getLevelMaxForXp, getLevelUpLevels, getLevelUpLevels, getLevelUpMultiplier, getLightfootMod, getLightInfo2, getLlx, getLly, getLlz, getLocalEnemyList, getLocalGroupList, getLocalList, getLocalNeutralList, getLocalRelevantEnemyList, getLookAngleRadians, getLookDirectionX, getLookDirectionY, getLookVector, getLowDangerInVicinity, getMaintenanceMod, getMapKnowledge, getMass, getMaxChatLines, getMaxTwist, getMaxWeight, getMaxWeightBase, getMeleeCombatMod, getMeleeDelay, getMetalBarricadeStrengthMod, getModel, getModelInstance, getMomentumScalar, getMoodles, getMoveDelta, getMoveForwardVec, getMovementSpeed, getMusicIntensityEventModData, getNameCoords, getNextAnimationTranslationLength, getNextWander, getNimbleMod, getNumSurvivorsInVicinity, getNumTwistBones, getOrCreateSleepingEventData, getOutfitName, getOwner, getOwnerPlayer, getPacingMod, getPainDelta, getPainEffect, getPath2, getPathFindBehavior2, getPathIndex, getPathTargetX, getPathTargetY, getPathTargetZ, getPatience, getPatienceMax, getPatienceMin, getPerkInfo, getPerkLevel, getPerkList, getPerkToUnit, getPersistentOutfitID, getPreviousActionContextStateName, getPreviousStateName, GetPrimaryEquippedCache, getPrimaryHandItem, getPrimaryHandType, getRagdollController, getRandomDefaultOutfit, getReadLiterature, getReadPrintMedia, getReadyModelData, getReanimAnimDelay, getReanimAnimFrame, getReanimatedCorpse, getReanimateTimer, getRecoilDelay, getRecoilVarX, getRecoilVarY, getRecoveryMod, getReduceInfectionPower, getRemoteID, getRunSpeedModifier, getSafety, getSayLine, GetSecondaryEquippedCache, getSecondaryHandItem, getSecondaryHandType, getShoulderTwist, getShoulderTwistWeight, getShoutItemModel, getShoutType, getShovingMod, getSitOnFurnitureDirection, getSitOnFurnitureObject, getSleepingTabletDelta, getSleepingTabletEffect, getSlowFactor, getSlowTimer, getSneakLimpSpeedScale, getSneakSpotMod, getSpeakColour, getSpeakTime, getSpeedMod, getSprintMod, getSpriteDef, getStaggerTimeMod, getStateMachine, getStateMachineComponent, getStateMachineParams, getStatisticsDebug, getStats, getSubVariableSource, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpse, getSuitableContainersToDropCorpseInSquare, getSuitableContainersToDropCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSuitableContainersWithHumanCorpseInSquare, getSurroundingAttackingZombies, getSurroundingAttackingZombies, getSurvivorKills, getSurvivorMap, getTalkerType, getTargetGrapplePos, getTargetGrapplePos, getTargetGrappleRotation, getTargetTwist, getTargetVerticalAimAngle, getTempo, getTempo2, getTextureCreator, getThirstMultiplier, getThreatLevel, getTimeSinceLastSmoke, getTimeThumping, getTotalBlood, getTwist, getUsedItemsOn, getUseHandWeapon, getUserNameHeight, getVariable, GetVariable, getVehicle, getVehicleDiscomfortModifier, getVeryCloseEnemyList, getWaterSource, getWeaponLevel, getWeaponLevel, getWeatherHearingMultiplier, getWeightAsCorpse, getWeightMod, getWeldingSoundMod, getWornItem, getWornItems, getWornItemsHearingModifier, getWornItemsHearingMultiplier, getWornItemsVisionModifier, getWornItemsVisionMultiplier, getWrappedGrappleable, getXp, getXpForLevel, getZombieKills, hasActiveModel, hasAnimationPlayer, hasAwkwardHands, hasBloodyClothing, hasDirtyClothing, hasEquipped, hasEquippedTag, hasFootInjury, hasFullInventory, hasHitReaction, HasItem, hasItems, hasPath, hasReadMap, hasRecipeAtHand, hasTimedActions, hasTrait, hasTrait, hasWornTag, helmetFall, Hit, Hit, initAttachedItems, initLightInfo2, InitSpriteParts, initSpritePartsEmpty, initTextObjects, initWornItems, isAboveTopOfStairs, isActuallyAttackingWithMeleeWeapon, isAddedToModelManager, isAimAtFloor, isAimingFirearmEquipped, isAlive, isAllowConversation, isAlwaysDayCheat, isAnimal, isAnimalCheat, isAnimalExtraValuesCheat, isAnimatingBackwards, isAnimationUpdatingThisFrame, isAnimForecasted, isAsleep, isAttachedItem, IsAttackRange, isAutoWalk, isbDoDefer, isBehind, isBeingSteppedOn, isbFalling, isbOnBed, isBuildCheat, isBumpDone, isBumped, isBumpFall, isBumpStaggered, isbUseParts, isCanShout, isCanUseBrushTool, isCheatSet, isClimbing, isClimbingRope, isClimbingThroughWindow, isClosingWindow, isCriticalHit, isCurrentActionAllowedWhileDraggingCorpses, isCurrentActionPathfinding, isCurrentGameClientState, isCurrentlyBusy, isCurrentlyIdle, isCurrentState, isDead, isDeathDragDown, isDeferredMovementEnabled, isDisguised, isDoDeathSound, isDraggingCorpse, isDriving, isDuplicateBodyVisual, isEditingRagdoll, isEnduranceSufficientForAction, isEquipped, isEquippedClothing, isFacingLocation, isFacingObject, isFalling, isFallOnFront, isFarmingCheat, isFastMoveCheat, isFemale, isFishingCheat, isFullyRagdolling, isGodMod, isGrappleThrowIntoContainer, isGrappleThrowOutWindow, isGrappleThrowOverFence, isHandItem, isHandModelOverriddenByCurrentCharacterAction, isHeadLookAround, isHealthCheat, isHeavyItem, isHideEquippedHandL, isHideEquippedHandR, isHideWeaponModel, isHitFromBehind, isIgnoreMovementForDirection, isIgnoreStaggerBack, isImpactFromBehind, isImpactFromBehind, isImpactFromBehind, isInARoom, isInTrees, isInTreesNoBush, isInventive, isInvisible, isInvulnerable, isItemInBothHands, isKilledByFall, isKilledBySlicingWeapon, isKnockedDown, isKnowAllRecipes, isKnownMediaLine, isKnownPoison, isKnownPoison, isLastCollidedN, isLastCollidedW, isLiteratureRead, isLocal, isMechanicsCheat, isMeleeAttackRange, isMeleeWeaponEquipped, isMovablesCheat, isMoving, isNearSirenVehicle, isNetworkVehicleCollisionActive, isNpc, isObjectBehind, isOnBack, isOnBed, isOnDeathDone, isOnFire, isOnKillDone, isOverEncumbered, isPathing, isPerformingAttackAnimation, isPerformingGrappleAnimation, isPerformingHostileAnimation, isPerformingNoAimShortStrafe, isPerformingShoveAnimation, isPerformingStompAnimation, isPersistentOutfitInit, isPlayingDeathSound, isPrimaryEquipped, isPrimaryHandItem, isPrintMediaRead, isProtectedFromToxic, isProtectedFromToxic, isRagdoll, isRagdollFall, isRagdollSimulationActive, isRangedWeaponEmpty, isRangedWeaponEquipped, isReading, isReanim, isRecipeActuallyKnown, isRecipeActuallyKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRecipeKnown, isRemote, isResting, isRunning, isSeatedInVehicle, isSecondaryHandItem, isShoveStompAnim, isShowAdminTag, isSitOnFurnitureObject, isSitOnGround, isSitting, isSittingOnFurniture, isSneaking, isSpeaking, IsSpeaking, IsSpeakingNPC, isSprinting, isStaggerBack, isStrafing, isTimedActionInstantCheat, isTurning, isTurning90, isTurningAround, isTwisting, isUnderVehicle, isUnderVehicleRadius, isUnlimitedAmmo, isUnlimitedCarry, isUnlimitedEndurance, isUpdateAlphaDuringRender, isUpright, isUsingWornItems, isVehicleCollision, isVisibleToNPCs, isWeaponReady, isWearingAwkwardGloves, isWearingGlasses, isWearingGloves, isWearingTag, isWearingVisualAid, isZombie, isZombieAttacking, isZombieAttacking, isZombiesDontAttack, Kill, Kill, Kill, Kill, learnRecipe, learnRecipe, level0, LevelPerk, LevelPerk, loadKnownMediaLines, LoseLevel, modifyTraitXPBoost, modifyTraitXPBoost, MoveForward, nearbyZombieClimbPenalty, OnAnimEvent_IsAlmostUp, OnAnimEvent_KilledByAttacker, OnClothingUpdated, onDeath_ShouldDoSplatterAndSounds, OnEquipmentUpdated, onFireLightSourceCheck, onHitByVehicle, onHitByVehicleDriver, onMouseLeftClick, onRagdollSimulationStarted, onTrigger_setAnimStateToTriggerFile, onTrigger_setClothingToXmlTriggerFile, openWindow, PainMeds, pathToAux, pathToLocationF, pathToSound, pickUpCorpse, pickUpCorpseItem, PlayAnim, PlayAnimUnlooped, PlayAnimWithSpeed, playbackRecordCurrentStateSnapshot, playbackSetCurrentStateSnapshot, playDropItemSound, playEmote, playerIsSelf, playHurtSound, playSound, playSoundLocal, playWeaponHitArmourSound, postAnimationFinishing, postUpdateEquippedTextures, postUpdateModelTextures, processHitDamage, QueueAction, readInventory, ReadLiterature, ReduceHealthWhenBurning, registerAIState, releaseAnimationPlayer, releaseBallisticsController, releaseBallisticsTarget, releaseRagdollController, reloadOutfit, remove, removeAttachedItem, removeFromHands, removeKnownMediaLine, removeOnFireLightSource, removeWornItem, removeWornItem, renderObjectPicker, renderServerGUI, renderTextureInsteadOfModel, reportEvent, resetAimingDelay, resetBeardGrowingTime, resetBodyDamageRemote, resetEquippedHandsModels, resetHairGrowingTime, resetModel, resetModelNextFrame, saveChange, saveKnownMediaLines, Say, Say, SayDebug, SayDebug, SayRadio, SayShout, SayWhisper, Seen, set, setAge, setAimAtFloor, setAimAtFloor, setAimingDelay, setAllowConversation, setAlreadyReadPages, setAlwaysDayCheat, setAnimalCheat, setAnimalExtraValuesCheat, setAnimated, setAnimatingBackwards, setAnimForecasted, setAsleep, setAttachedItem, setAttachedItems, setAttackedBy, setAttackTargetSquare, setAutoWalk, setAutoWalkDirection, setAvoidDamage, setbClimbing, setbDoDefer, setBed, setBedType, setBeenMovingFor, setBeenSprintingFor, setBetaDelta, setBetaEffect, setbFalling, setBloodImpactX, setBloodImpactY, setBloodImpactZ, setBloodSplat, setbOnBed, setBuildCheat, setBumpDone, setBumpedChr, setBumpFall, setBumpFallType, setBumpStaggered, setBumpType, setbUseParts, setCanShout, setCanUseBrushTool, setCanUseDebugContextMenu, setCanUseLootLog, setCanUseLootZed, setCharacterGender, setClickSound, setClimbData, setClimbRopeTime, setClothingItem_Back, setClothingItem_Feet, setClothingItem_Hands, setClothingItem_Head, setClothingItem_Legs, setClothingItem_Torso, setCorpseSicknessRate, setCriticalHit, setCurrentVerticalAimAngle, setDangerLevels, setDeathDragDown, setDebugMonitor, setDefaultState, setDefaultState, setDeferredMovementEnabled, setDelayToSleep, setDepressDelta, setDepressEffect, setDescriptor, setDieCount, setDirectionAngle, setDoDeathSound, setEditingRagdoll, setEquipParent, setEquipParent, setFallOnFront, setFallTime, setFarmingCheat, setFastMoveCheat, setFemale, setFireKillRate, setFireMode, setFireSpreadProbability, setFishingCheat, setFollowingTarget, setForceWakeUpTime, setForwardDirection, setForwardDirection, setForwardDirectionFromAnimAngle, setForwardDirectionFromIsoDirection, setForwardIsoDirection, setGodMod, setGodMod, setGrappleThrowIntoContainer, setGrappleThrowOutWindow, setGrappleThrowOverFence, setHaloNote, setHaloNote, setHaloNote, setHeadLookAround, setHeadLookAroundDirection, setHealthCheat, setHideEquippedHandL, setHideEquippedHandR, setHideWeaponModel, setHitDir, setHitFromBehind, setHitReaction, setHurtSound, setIgnoreStaggerBack, setInventory, setInvincible, setInvisible, setInvisible, setInvulnerable, setIsAiming, setIsAnimal, setIsResting, setKilledByFall, setKnockedDown, setKnowAllRecipes, setLastBump, setLastChatMessage, setLastCollidedN, setLastCollidedW, setLastFallSpeed, setLastHeardSound, setLastHitCharacter, setLastHitCount, setLastHourSleeped, setLastLocalEnemies, setLastSpokenLine, setLastZombieKills, setLeaveBodyTimedown, setLegsSprite, setLevelUpMultiplier, setLlx, setLly, setLlz, setMaxTwist, setMaxWeight, setMaxWeightBase, setMechanicsCheat, setMeleeDelay, setMetabolicTarget, setMetabolicTarget, setMomentumScalar, setMovablesCheat, setMoveDelta, setMoveForwardVec, setMoving, setMusicIntensityEventModData, setNextWander, setNumSurvivorsInVicinity, setOnBed, setOnDeathDone, setOnFire, SetOnFire, setOnKillDone, setOwner, setOwnerPlayer, setPainDelta, setPainEffect, setPath2, setPathIndex, setPathing, setPathSpeed, setPatience, setPatienceMax, setPatienceMin, setPerformingAttackAnimation, setPerformingShoveAnimation, setPerformingStompAnimation, setPerkLevelDebug, setPersistentOutfitID, setPersistentOutfitID, setPlayingDeathSound, setPrimaryHandItem, setRagdollFall, setRangedWeaponEmpty, setReading, setReanim, setReanimAnimDelay, setReanimAnimFrame, setReanimateTimer, setRecoilDelay, setRecoilVarX, setRecoilVarY, setReduceInfectionPower, setRemoteID, setRunning, setSafety, setSayLine, setSceneCulled, setSecondaryHandItem, setShoveStompAnim, setShowAdminTag, setSitOnFurnitureDirection, setSitOnFurnitureObject, setSitOnGround, setSittingOnFurniture, setSleepingTabletDelta, setSleepingTabletEffect, setSlowFactor, setSlowTimer, setSneaking, setSneakLimpSpeedScale, setSpeakColour, setSpeakColourInfo, setSpeaking, setSpeakTime, setSpeedMod, setSprinting, setStaggerTimeMod, setStateMachineLocked, setSurvivorKills, setTargetAndCurrentDirection, setTargetGrapplePos, setTargetVerticalAimAngle, setTextureCreator, setTimedActionInstantCheat, setTimeOfSleep, setTimeSinceLastSmoke, setTimeThumping, setTurnDelta, setUnlimitedAmmo, setUnlimitedCarry, setUnlimitedEndurance, setUseHandWeapon, setUsePhysicHitReaction, setVariable, setVariable, setVariable, setVariable, setVariable, SetVariable, setVariableEnum, setVehicle, setVehicleCollision, setVisibleToNPCs, setWornItem, setWornItem, setWornItems, setXp, setZombieKills, setZombiesDontAttack, shouldBeFalling, shouldBePushedBackByVehicleHit, shouldBeTurning90, shouldBeTurningAround, shouldIgnoreCollisionWithSquare, shouldSnapZToCurrentSquare, shouldWaitToStartTimedAction, SleepingTablet, slideAwayFromWalls, smashCarWindow, smashWindow, spikePart, spikePartIndex, spinToZeroAllAnimNodes, splatBlood, splatBloodFloor, splatBloodFloorBig, SpreadFire, SpreadFireMP, StartAction, startEvent, startPlaybackGameVariables, StartTimedActionAnim, StartTimedActionAnim, StopAllActionQueue, StopAllActionQueueAiming, StopAllActionQueueRunning, StopAllActionQueueWalking, StopBurning, stopEvent, stopOrTriggerSound, StopTimedActionAnim, teleportTo, teleportTo, teleportTo, teleportTo, testDefense, testDotSide, testDotSideEnum, TestIfSeen, Throw, throwGrappledIntoInventory, throwGrappledOverFence, throwGrappledTargetOutWindow, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerContextualAction, triggerCough, tryGetAIState, updateAimingDelay, updateBallistics, updateBandages, updateDiscomfortModifiers, updateDisguisedState, updateEmitter, updateEquippedItemSounds, updateEquippedRadioFreq, updateEvent, updateForServerGui, updateHandEquips, updateHasTargetFlag, updateLightInfo, updateMovementMomentum, updateRecoilVar, updateSpeedModifiers, updateStats_Awake, updateStats_WakeState, updateTextObjects, updateUserName, updateVisionEffects, updateVisionEffectTargets, updateWornItemsHearingModifier, updateWornItemsVisionModifier, usePhysicHitReaction, useRagdollVehicleCollision, wasLocal, zeroForwardDirectionX, zeroForwardDirectionY`

  ### Methods inherited from class [IsoMovingObject](../../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDistanceSq, getEatingZombies, getFacingPosition, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isCrawling, isDestroyed, isEatingOther, isFirstUpdate, isOnFloor, isProne, isShootable, isSolid, isStanding, isWithinRange, moveUnmoddedInternal, onMouseRightClick, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, shouldSlideHeadAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, toString, updateAnimation`

  ### Methods inherited from class [IsoObject](../../iso/IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, softReset, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

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

  ### Methods inherited from interface [IAnimationVariableRegistry](../../core/skinnedmodel/advancedanimation/IAnimationVariableRegistry.html#method-summary "interface in zombie.core.skinnedmodel.advancedanimation")

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

  ### Methods inherited from interface [IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html#method-summary "interface in zombie.core.skinnedmodel.visual")

  `getHumanVisual, getItemVisuals, isFemale, isSkeleton, isZombie`

  ### Methods inherited from interface [ILuaIsoObject](../../iso/ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.network.fields.IPositional

  `getX, getY, getZ, isInRange`

  ### Methods inherited from interface zombie.ai.IStateCharacter

  `canBeHitByVehicle, canCurrentStateRagdoll, canSlowDownVehicleWhenHit, hasCurrentState, isCurrentStateAttacking, isCurrentStateMoving`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### INVALID\_SQUARE\_XY

    public static final int INVALID\_SQUARE\_XY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.INVALID_SQUARE_XY)
  + ### SOUND\_RADIUS\_MULTIPLIER\_WILD

    public static final float SOUND\_RADIUS\_MULTIPLIER\_WILD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.SOUND_RADIUS_MULTIPLIER_WILD)
  + ### MIN\_PLAYER\_ACCEPTANCE\_FOR\_SOUND

    private static final float MIN\_PLAYER\_ACCEPTANCE\_FOR\_SOUND

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.MIN_PLAYER_ACCEPTANCE_FOR_SOUND)
  + ### FLEE\_SOUND\_DISTANCE\_DEFAULT

    private static final int FLEE\_SOUND\_DISTANCE\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.FLEE_SOUND_DISTANCE_DEFAULT)
  + ### FLEE\_SOUND\_DISTANCE\_WILD

    private static final int FLEE\_SOUND\_DISTANCE\_WILD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.FLEE_SOUND_DISTANCE_WILD)
  + ### SOUND\_RADIUS\_STRESS\_FACTOR

    private static final float SOUND\_RADIUS\_STRESS\_FACTOR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.SOUND_RADIUS_STRESS_FACTOR)
  + ### SOUND\_RADIUS\_FLEE\_TIME\_FACTOR

    private static final float SOUND\_RADIUS\_FLEE\_TIME\_FACTOR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.SOUND_RADIUS_FLEE_TIME_FACTOR)
  + ### LAST\_ALERTED\_FLEE\_SOUND\_TIME

    private static final float LAST\_ALERTED\_FLEE\_SOUND\_TIME

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.LAST_ALERTED_FLEE_SOUND_TIME)
  + ### serialVersionUID

    private static final long serialVersionUID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.animals.IsoAnimal.serialVersionUID)
  + ### tempVector3f

    private static final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") tempVector3f
  + ### tempVector3

    private static final [Vector3](../../iso/Vector3.html "class in zombie.iso") tempVector3
  + ### tempVector2

    public static final [Vector2](../../iso/Vector2.html "class in zombie.iso") tempVector2
  + ### animalId

    public int animalId
  + ### itemId

    public int itemId
  + ### spottedChr

    public [IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso") spottedChr
  + ### type

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### behavior

    private [BaseAnimalBehavior](behavior/BaseAnimalBehavior.html "class in zombie.characters.animals.behavior") behavior
  + ### data

    private [AnimalData](datas/AnimalData.html "class in zombie.characters.animals.datas") data
  + ### attackedTimer

    public long attackedTimer
  + ### invincible

    private boolean invincible
  + ### attachBackToMother

    public int attachBackToMother
  + ### attachBackToTreeX

    private int attachBackToTreeX
  + ### attachBackToTreeY

    private int attachBackToTreeY
  + ### timeSinceLastUpdate

    public long timeSinceLastUpdate
  + ### customName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customName
  + ### smallEnclosure

    public boolean smallEnclosure
  + ### adef

    public [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") adef
  + ### mother

    public [IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") mother
  + ### motherId

    public int motherId
  + ### searchRadius

    public int searchRadius
  + ### milkRemoved

    private int milkRemoved
  + ### eatFromTrough

    public [IsoFeedingTrough](../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") eatFromTrough
  + ### eatFromGround

    public [IsoWorldInventoryObject](../../iso/objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") eatFromGround
  + ### drinkFromTrough

    public [IsoFeedingTrough](../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") drinkFromTrough
  + ### drinkFromRiver

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") drinkFromRiver
  + ### drinkFromPuddle

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") drinkFromPuddle
  + ### hutch

    public [IsoHutch](../../iso/objects/IsoHutch.html "class in zombie.iso.objects") hutch
  + ### fullGenome

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> fullGenome
  + ### atkTarget

    public [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") atkTarget
  + ### thumpTarget

    public [IsoObject](../../iso/IsoObject.html "class in zombie.iso") thumpTarget
  + ### fightingOpponent

    public [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") fightingOpponent
  + ### lastSoundRespondedTo

    private [WorldSoundManager.WorldSound](../../WorldSoundManager.WorldSound.html "class in zombie") lastSoundRespondedTo
  + ### timeSinceFleeFromSound

    private float timeSinceFleeFromSound
  + ### stressLevel

    public float stressLevel
  + ### animalVisual

    private final [AnimalVisual](../../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") animalVisual
  + ### animalZone

    private [AnimalZone](AnimalZone.html "class in zombie.characters.animals") animalZone
  + ### moveForwardOnZone

    private boolean moveForwardOnZone
  + ### eggTimerInHutch

    public int eggTimerInHutch
  + ### nestBox

    public int nestBox
  + ### playerAcceptanceList

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> playerAcceptanceList
  + ### heldBy

    public [IsoPlayer](../IsoPlayer.html "class in zombie.characters") heldBy
  + ### luredBy

    public [IsoPlayer](../IsoPlayer.html "class in zombie.characters") luredBy
  + ### luredStartTimer

    private float luredStartTimer
  + ### walkToCharLuring

    public boolean walkToCharLuring
  + ### geneticDisorder

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> geneticDisorder
  + ### petTimer

    private float petTimer
  + ### dZone

    private [DesignationZoneAnimal](../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas") dZone
  + ### connectedDZone

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas")> connectedDZone
  + ### zoneCheckTimer

    private float zoneCheckTimer
  + ### movingToFood

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") movingToFood
  + ### movingToFoodTimer

    public float movingToFoodTimer
  + ### animalSoundState

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.characters.animals.AnimalSoundState> animalSoundState
  + ### ignoredTrough

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> ignoredTrough
  + ### attachBackToMotherTimer

    public float attachBackToMotherTimer
  + ### virtualId

    public double virtualId
  + ### migrationGroup

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") migrationGroup
  + ### wild

    public boolean wild
  + ### alerted

    public boolean alerted
  + ### alertedChr

    public [IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso") alertedChr
  + ### fromMeta

    public boolean fromMeta
  + ### thumpDelay

    private float thumpDelay
  + ### shouldBeSkeleton

    private boolean shouldBeSkeleton
  + ### babies

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](IsoAnimal.html "class in zombie.characters.animals")> babies
  + ### zoneAcceptance

    private float zoneAcceptance
  + ### followingWall

    public boolean followingWall
  + ### shouldFollowWall

    public boolean shouldFollowWall
  + ### onHook

    private boolean onHook
  + ### hook

    private [IsoButcherHook](../../iso/IsoButcherHook.html "class in zombie.iso") hook
  + ### attachBackToHookX

    public int attachBackToHookX
  + ### attachBackToHookY

    public int attachBackToHookY
  + ### attachBackToHookZ

    public int attachBackToHookZ
  + ### roadKill

    private boolean roadKill
  + ### lastCellSavedToX

    private int lastCellSavedToX
  + ### lastCellSavedToY

    private int lastCellSavedToY
  + ### isAttackingOnClient

    private boolean isAttackingOnClient
  + ### L\_renderCustomName

    private static final [Position3D](../Position3D.html "class in zombie.characters") L\_renderCustomName
  + ### nextFootstepSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nextFootstepSound
  + ### forceNextIdleSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forceNextIdleSound
* Constructor Details
  -------------------

  + ### IsoAnimal

    public IsoAnimal([IsoCell](../../iso/IsoCell.html "class in zombie.iso") cell)
  + ### IsoAnimal

    public IsoAnimal([IsoCell](../../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breedName)
  + ### IsoAnimal

    public IsoAnimal([IsoCell](../../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breedName,
    boolean skeleton)
  + ### IsoAnimal

    public IsoAnimal([IsoCell](../../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### IsoAnimal

    public IsoAnimal([IsoCell](../../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed,
    boolean skeleton)
* Method Details
  --------------

  + ### checkForChickenpocalypse

    public boolean checkForChickenpocalypse()

    Hardcoded hack to check if we don't try to spawn a new animal that already has this ID
    Need to test more/find more case of it happening for a proper fix
  + ### checkForWater

    public boolean checkForWater()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoPlayer`
  + ### registerVariableCallbacks

    private void registerVariableCallbacks()
  + ### canUseCurrentPoseForCorpse

    public boolean canUseCurrentPoseForCorpse()

    Overrides:
    :   `canUseCurrentPoseForCorpse` in class `IsoGameCharacter`
  + ### getAnimalVisual

    public [AnimalVisual](../../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") getAnimalVisual()

    Specified by:
    :   `getAnimalVisual` in interface `IAnimalVisual`

    Overrides:
    :   `getAnimalVisual` in class `IsoPlayer`
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### GetAnimSetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetAnimSetName()

    Specified by:
    :   `GetAnimSetName` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimatable`

    Overrides:
    :   `GetAnimSetName` in class `IsoPlayer`
  + ### playSoundDebug

    public void playSoundDebug()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoPlayer`
  + ### updateZoneAcceptance

    private void updateZoneAcceptance()
  + ### test

    public void test()
  + ### updateInternal

    private void updateInternal()
  + ### testCollideWithVehicles

    public boolean testCollideWithVehicles([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [BaseVehicle.HitVars](../../vehicles/BaseVehicle.HitVars.html "class in zombie.vehicles") hitVars)

    Overrides:
    :   `testCollideWithVehicles` in class `IsoGameCharacter`
  + ### Hit

    public float Hit([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float speed,
    boolean isHitFromBehind,
    float hitDirX,
    float hitDirY,
    boolean pushedBack,
    float collisionPosOnVehicleX,
    float collisionPosOnVehicleY)

    Specified by:
    :   `Hit` in interface `zombie.characters.ILuaGameCharacterDamage`

    Overrides:
    :   `Hit` in class `IsoGameCharacter`
  + ### Hit

    public float Hit([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float speed,
    boolean isHitFromBehind,
    [Vector2](../../iso/Vector2.html "class in zombie.iso") hitDir)
  + ### onAnimPlayerCreated

    protected void onAnimPlayerCreated(zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer)

    Overrides:
    :   `onAnimPlayerCreated` in class `IsoPlayer`
  + ### allowsTwist

    public boolean allowsTwist()

    Specified by:
    :   `allowsTwist` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `allowsTwist` in class `IsoPlayer`
  + ### getPetTimer

    public float getPetTimer()
  + ### CanUsePathfindState

    protected boolean CanUsePathfindState()

    Overrides:
    :   `CanUsePathfindState` in class `IsoGameCharacter`
  + ### getNetworkSpeedMul

    protected float getNetworkSpeedMul()

    Overrides:
    :   `getNetworkSpeedMul` in class `IsoPlayer`
  + ### reattachBackToMom

    private void reattachBackToMom()
  + ### findMotherAndAttach

    private boolean findMotherAndAttach([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoAnimal](IsoAnimal.html "class in zombie.characters.animals")> animals)
  + ### checkZone

    private void checkZone()

    Check if the animal is in his correct designationzone
  + ### getRandomSquareInZone

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomSquareInZone()
  + ### getZone

    public [DesignationZone](../../iso/areas/DesignationZone.html "class in zombie.iso.areas") getZone()
  + ### stopAllMovementNow

    public void stopAllMovementNow()
  + ### cancelLuring

    public void cancelLuring()
  + ### updateLured

    private void updateLured()
  + ### updateStress

    public void updateStress()
  + ### getCanAttachAnimalObject

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getCanAttachAnimalObject([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### checkTreeExists

    private void checkTreeExists()
  + ### reattachToTree

    private void reattachToTree()

    When we load an animal, the tree might not be loaded yet, so we store its X/Y and wait for it to be loaded to reattach
  + ### getLastSoundRespondedTo

    public [WorldSoundManager.WorldSound](../../WorldSoundManager.WorldSound.html "class in zombie") getLastSoundRespondedTo()
  + ### respondToSound

    public void respondToSound()

    Flee from gunshot
  + ### calcDamage

    public float calcDamage()
  + ### HitByAnimal

    public void HitByAnimal([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") animal,
    boolean bIgnoreDamage)
  + ### initializeStates

    public void initializeStates()
  + ### spotted

    public void spotted([IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced,
    float dist)
  + ### drawRope

    public void drawRope([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### drawRope

    private void drawRope([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)

    Draw a line, more red the further you are from the provided sq

    Parameters:
    :   `sq` - sq
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `IsoPlayer`
  + ### renderCustomName

    private void renderCustomName()
  + ### doDebugString

    private void doDebugString()
  + ### drawDirectionLine

    public void drawDirectionLine([Vector2](../../iso/Vector2.html "class in zombie.iso") dir,
    float length,
    float r,
    float g,
    float b)

    Overrides:
    :   `drawDirectionLine` in class `IsoGameCharacter`
  + ### renderShadow

    public void renderShadow(float x,
    float y,
    float z)

    Overrides:
    :   `renderShadow` in class `IsoGameCharacter`
  + ### getBehavior

    public [BaseAnimalBehavior](behavior/BaseAnimalBehavior.html "class in zombie.characters.animals.behavior") getBehavior()
  + ### checkAlphaAndTargetAlpha

    public void checkAlphaAndTargetAlpha([IsoPlayer](../IsoPlayer.html "class in zombie.characters") other)
  + ### shouldBecomeZombieAfterDeath

    public boolean shouldBecomeZombieAfterDeath()

    Overrides:
    :   `shouldBecomeZombieAfterDeath` in class `IsoGameCharacter`
  + ### onDied

    private void onDied([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") sender,
    [IsoDeadBody](../../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### OnDeath

    public void OnDeath()

    Overrides:
    :   `OnDeath` in class `IsoPlayer`
  + ### hitConsequences

    public void hitConsequences([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") wielder,
    boolean bIgnoreDamage,
    float damage,
    boolean bRemote)

    Overrides:
    :   `hitConsequences` in class `IsoPlayer`
  + ### setHealth

    public void setHealth(float health)

    Specified by:
    :   `setHealth` in interface `zombie.characters.ILuaGameCharacterDamage`

    Overrides:
    :   `setHealth` in class `IsoGameCharacter`
  + ### sendExtraUpdateToClients

    public void sendExtraUpdateToClients()
  + ### killed

    public void killed([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr)
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoPlayer`
  + ### getData

    public [AnimalData](datas/AnimalData.html "class in zombie.characters.animals.datas") getData()
  + ### getInventoryIconTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInventoryIconTextureName()
  + ### getInventoryIconTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getInventoryIconTexture()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoPlayer`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave,
    boolean serialize)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoPlayer`

    Throws:
    :   `IOException`
  + ### init

    public void init([AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### initStress

    private void initStress()
  + ### initTexture

    private void initTexture()
  + ### initAge

    private void initAge()
  + ### canGoThere

    public boolean canGoThere([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)

    Look to go on a square, but might be limited by rope
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()

    Specified by:
    :   `getAnimalType` in interface `IAnimalVisual`

    Overrides:
    :   `getAnimalType` in class `IsoPlayer`
  + ### getAnimalSize

    public float getAnimalSize()

    Specified by:
    :   `getAnimalSize` in interface `IAnimalVisual`

    Overrides:
    :   `getAnimalSize` in class `IsoPlayer`
  + ### getAnimalOriginalSize

    public float getAnimalOriginalSize()
  + ### setAgeDebug

    public void setAgeDebug(int newAge)
  + ### haveEnoughMilkToFeedFrom

    public boolean haveEnoughMilkToFeedFrom()
  + ### addBaby

    public [IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") addBaby()
  + ### initType

    private void initType([AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### unloaded

    public void unloaded()
  + ### updateLastTimeSinceUpdate

    public void updateLastTimeSinceUpdate()
  + ### debugAgeAway

    public void debugAgeAway(int hour)

    RJ TESTING: just something to force simulate you getting back X hours after being away
  + ### updateStatsAway

    public void updateStatsAway(int hours)
  + ### checkKilledByMetaPredator

    public boolean checkKilledByMetaPredator(int hour)

    Simulate a fox killing chicken at night, only applies if the chicken is either outside or in a hutch with opened door (this is also called from IsoHutch)
    Called every hour

    Parameters:
    :   `hour` - what is the hour we're checking, because if we load the animal after being away for a while, we need to check every hour you've been away, to be see if you were away during night/hutch time..
  + ### isBaby

    public boolean isBaby()
  + ### shearAnimal

    public boolean shearAnimal([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") shear)
  + ### getMilkType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMilkType()
  + ### addDebugBucketOfMilk

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addDebugBucketOfMilk([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### milkAnimal

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") milkAnimal([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") bucket)

    Milk an animal
    For every 5L removed we add a bit more to the max milk an animal can have
    Bucket will be replaced by his milk variant if needed
    Milking an animal while having poor Husbandry skill will add stress to the animal
  + ### setMaxSizeDebug

    public void setMaxSizeDebug()
  + ### addEgg

    public boolean addEgg(boolean meta)
  + ### createEgg

    public [Food](../../inventory/types/Food.html "class in zombie.inventory.types") createEgg()

    Create an egg, change its hunger value depending on the eggSize gene of the animal
    If no such gene exist, create a basic egg.
  + ### randomizeAge

    public void randomizeAge()
  + ### isAnimalMoving

    public boolean isAnimalMoving()
  + ### isGeriatric

    public boolean isGeriatric()
  + ### getAgeText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAgeText(boolean cheat,
    int skillLvl)
  + ### getHealthText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHealthText(boolean cheat,
    int skillLvl)
  + ### getAppearanceText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAppearanceText(boolean cheat)
  + ### copyFrom

    public void copyFrom([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### fertilize

    public void fertilize([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") male,
    boolean force)
  + ### isAnimalEating

    public boolean isAnimalEating()
  + ### isAnimalAttacking

    public boolean isAnimalAttacking()
  + ### setAnimalAttackingOnClient

    public void setAnimalAttackingOnClient(boolean value)
  + ### isAnimalSitting

    public boolean isAnimalSitting()
  + ### isInvincible

    public boolean isInvincible()

    Description copied from class: `IsoGameCharacter`

    Currently only used for animals, use godMod for players

    Overrides:
    :   `isInvincible` in class `IsoGameCharacter`
  + ### isAnimalRunningToDeathPosition

    public boolean isAnimalRunningToDeathPosition()

    Overrides:
    :   `isAnimalRunningToDeathPosition` in class `IsoGameCharacter`
  + ### setIsInvincible

    public void setIsInvincible(boolean b)
  + ### getCustomName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomName()
  + ### setCustomName

    public void setCustomName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customName)
  + ### getHunger

    public float getHunger()
  + ### getThirst

    public float getThirst()
  + ### getBabyType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBabyType()
  + ### hasUdder

    public boolean hasUdder()
  + ### getBreed

    public [AnimalBreed](datas/AnimalBreed.html "class in zombie.characters.animals.datas") getBreed()
  + ### canBeMilked

    public boolean canBeMilked()
  + ### canBeSheared

    public boolean canBeSheared()
  + ### getEggsPerDay

    public int getEggsPerDay()
  + ### getHutch

    public [IsoHutch](../../iso/objects/IsoHutch.html "class in zombie.iso.objects") getHutch()
  + ### getNestBoxIndex

    public int getNestBoxIndex()
  + ### setData

    public void setData([AnimalData](datas/AnimalData.html "class in zombie.characters.animals.datas") newData)
  + ### hasGeneticDisorder

    public boolean hasGeneticDisorder([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gd)
  + ### getFullName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullName()

    Specified by:
    :   `getFullName` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `getFullName` in class `IsoGameCharacter`
  + ### getFullGenome

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> getFullGenome()
  + ### copyGenome

    public void copyGenome([Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<[AnimalGene](AnimalGene.html "class in zombie.characters.animals")> genome)
  + ### getFullGenomeList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalGene](AnimalGene.html "class in zombie.characters.animals")> getFullGenomeList()
  + ### getUsedGene

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") getUsedGene([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAge

    public int getAge()

    Overrides:
    :   `getAge` in class `IsoGameCharacter`
  + ### canDoAction

    public boolean canDoAction()
  + ### getMeatRatio

    public float getMeatRatio()
  + ### getMate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMate()
  + ### getAnimalZone

    public [AnimalZone](AnimalZone.html "class in zombie.characters.animals") getAnimalZone()
  + ### setAnimalZone

    public void setAnimalZone([AnimalZone](AnimalZone.html "class in zombie.characters.animals") zone)
  + ### hasAnimalZone

    public boolean hasAnimalZone()
  + ### isMoveForwardOnZone

    public boolean isMoveForwardOnZone()
  + ### setMoveForwardOnZone

    public void setMoveForwardOnZone(boolean b)
  + ### isExistInTheWorld

    public boolean isExistInTheWorld()

    Overrides:
    :   `isExistInTheWorld` in class `IsoMovingObject`
  + ### changeStress

    public void changeStress(float inc)

    Increase or decrease stress with the stress gene as modifier
    The stress gene kinda works backward, 0.2 means a lot of stress gain compared to 0.9 for ex.
  + ### getEggGeneMod

    public float getEggGeneMod()
  + ### setDebugStress

    public void setDebugStress(float stress)
  + ### setDebugAcceptance

    public void setDebugAcceptance([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr,
    float acceptance)
  + ### getAllPossibleFoodFromInv

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> getAllPossibleFoodFromInv([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getEatTypePossibleFromHand

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getEatTypePossibleFromHand()
  + ### addAcceptance

    public void addAcceptance([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr,
    float acceptance)
  + ### feedFromHand

    public void feedFromHand([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") food)
  + ### petTimerDone

    public boolean petTimerDone()
  + ### petAnimal

    public void petAnimal([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr)
  + ### getStress

    public float getStress()
  + ### getStressTxt

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStressTxt(boolean cheat,
    int skillLvl)
  + ### fleeTo

    public void fleeTo([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)

    Make the animal run to the SQ
  + ### getAcceptanceLevel

    public float getAcceptanceLevel([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr)
  + ### canBeFeedByHand

    public boolean canBeFeedByHand()
  + ### tryLure

    public void tryLure([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Every X seconds we trigger this when the player is luring, method need bit more in depth (hunger, can he see..)
    Success depend on stress/acceptance lvl of the player
  + ### getPossibleLuringItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> getPossibleLuringItems([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### eatFromLured

    public void eatFromLured([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    After being lured to the player, animal will eat what the player used to lure (hay, grass...)
  + ### getAttachmentWorldPos

    public [Position3D](../Position3D.html "class in zombie.characters") getAttachmentWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Position3D](../Position3D.html "class in zombie.characters") pos)
  + ### getAttachmentWorldPos

    public [Position3D](../Position3D.html "class in zombie.characters") getAttachmentWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName)
  + ### carCrash

    public void carCrash(float delta,
    boolean front)

    Lower the health of an animal that is in a car after a crash

    Parameters:
    :   `front` - if front is false (crash came from behind) we gonna lower more the health as most of the time animal will be in a trailer
  + ### getMilkAnimPreset

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMilkAnimPreset()
  + ### pathToCharacter

    public void pathToCharacter([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") target)

    Overrides:
    :   `pathToCharacter` in class `IsoGameCharacter`
  + ### pathToLocation

    public void pathToLocation(int x,
    int y,
    int z)

    Specified by:
    :   `pathToLocation` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `pathToLocation` in class `IsoGameCharacter`
  + ### pathToTrough

    public void pathToTrough([IsoFeedingTrough](../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)

    Check which side of the trough we should be in, depending if it's oriented north or not, then we check if in the 2 tiles there's one free closer than the other
  + ### shouldBreakObstaclesDuringPathfinding

    public boolean shouldBreakObstaclesDuringPathfinding()
  + ### getFeelersize

    public float getFeelersize()

    Overrides:
    :   `getFeelersize` in class `IsoMovingObject`
  + ### animalShouldThump

    public boolean animalShouldThump()

    Animal should thump if they're hungry or fleeing someone or if they're too stressed
  + ### tryThump

    public boolean tryThump([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getAnimalTrailerSize

    public float getAnimalTrailerSize()
  + ### canBePet

    public boolean canBePet()
  + ### debugRandomIdleAnim

    public void debugRandomIdleAnim()
  + ### debugRandomHappyAnim

    public void debugRandomHappyAnim()
  + ### getDZone

    public [DesignationZoneAnimal](../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas") getDZone()
  + ### setDZone

    public void setDZone([DesignationZoneAnimal](../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas") dZone)
  + ### getConnectedDZone

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas")> getConnectedDZone()
  + ### haveMatingSeason

    public boolean haveMatingSeason()
  + ### isInMatingSeason

    public boolean isInMatingSeason()
  + ### getMinAgeForBaby

    public int getMinAgeForBaby()
  + ### isHeld

    public boolean isHeld()
  + ### pathFailed

    public void pathFailed()

    When our pathfinding failed we try to find what we were doing
    This is used to ignore trough that could be outside a fenced area etc.
  + ### getAnimalSoundState

    public zombie.characters.animals.AnimalSoundState getAnimalSoundState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") slot)
  + ### playDeadSound

    public void playDeadSound()

    Overrides:
    :   `playDeadSound` in class `IsoGameCharacter`
  + ### updateVocalProperties

    public void updateVocalProperties()

    Overrides:
    :   `updateVocalProperties` in class `IsoPlayer`
  + ### playNextFootstepSound

    public void playNextFootstepSound()
  + ### onPlayBreedSoundEvent

    public void onPlayBreedSoundEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### playBreedSound

    public long playBreedSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### chooseIdleSound

    private void chooseIdleSound()
  + ### playStressedSound

    public void playStressedSound()
  + ### updateLoopingSounds

    public void updateLoopingSounds()
  + ### updateRunLoopingSound

    public void updateRunLoopingSound()
  + ### updateWalkLoopingSound

    public void updateWalkLoopingSound()
  + ### getMother

    public [IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") getMother()
  + ### setMother

    public void setMother([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") mom)
  + ### canBePicked

    public boolean canBePicked([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canBeKilledWithoutWeapon

    public boolean canBeKilledWithoutWeapon()
  + ### getAnimalID

    public int getAnimalID()
  + ### setAnimalID

    public void setAnimalID(int id)
  + ### setItemID

    public void setItemID(int itemId)
  + ### getItemID

    public int getItemID()
  + ### getNextStageAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNextStageAnimalType()
  + ### debugForceEgg

    public void debugForceEgg()
  + ### isWild

    public boolean isWild()
  + ### setWild

    public void setWild(boolean b)

    Make an animal "wild" (doesn't need hunger/thirst, migration if on a path, etc.)
    Some animals can never become not wild (deer...)
  + ### alertOtherAnimals

    public void alertOtherAnimals([IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso") chr,
    boolean alert)

    TODO: Not working quite well
    Alert surrounding animals so they all look at the players at the same time
    If already alerted make other animals flee too
  + ### debugForceSit

    public void debugForceSit()

    If animal is sitting, make him stand up, otherwise make him sit for some times
  + ### isAlerted

    public boolean isAlerted()
  + ### setIsAlerted

    public void setIsAlerted(boolean b)
  + ### shouldFollowWall

    public boolean shouldFollowWall()
  + ### setShouldFollowWall

    public void setShouldFollowWall(boolean b)
  + ### readyToBeMilked

    public boolean readyToBeMilked()
  + ### readyToBeSheared

    public boolean readyToBeSheared()
  + ### haveHappyAnim

    public boolean haveHappyAnim()
  + ### canHaveEggs

    public boolean canHaveEggs()
  + ### needHutch

    public boolean needHutch()
  + ### canPoop

    public boolean canPoop()
  + ### getMinClutchSize

    public int getMinClutchSize()
  + ### getMaxClutchSize

    public int getMaxClutchSize()
  + ### getCurrentClutchSize

    public int getCurrentClutchSize()
  + ### attackOtherMales

    public boolean attackOtherMales()
  + ### shouldAnimalStressAboveGround

    public boolean shouldAnimalStressAboveGround()

    If stressAboveGround is true in animal def and animal Z is > 0, high stress incoming!
  + ### canClimbStairs

    public boolean canClimbStairs()
  + ### forceWanderNow

    public void forceWanderNow()
  + ### canClimbFences

    public boolean canClimbFences()
  + ### climbOverFence

    public void climbOverFence([IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir)

    Specified by:
    :   `climbOverFence` in interface `zombie.characters.ILuaGameCharacter`

    Overrides:
    :   `climbOverFence` in class `IsoGameCharacter`
  + ### needMom

    public boolean needMom()

    This is only used to display or not "baby can't find their mom" in their animalUI.
  + ### getFertilizedTimeMax

    public int getFertilizedTimeMax()
  + ### isLocalPlayer

    public boolean isLocalPlayer()

    Overrides:
    :   `isLocalPlayer` in class `IsoPlayer`
  + ### getThirstBoost

    public float getThirstBoost()
  + ### getHungerBoost

    public float getHungerBoost()
  + ### removeBaby

    public void removeBaby([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") baby)
  + ### remove

    public void remove()
  + ### delete

    public void delete()
  + ### canEatFromTrough

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") canEatFromTrough([IsoFeedingTrough](../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)

    Return a food this animal can eat from the trough
  + ### getThumpDelay

    public float getThumpDelay()
  + ### getBloodQuantity

    public float getBloodQuantity()

    Get the blood quantity in this animal (you can get it from a butchering hook)
  + ### getFeatherNumber

    public int getFeatherNumber()

    Get the number of feather you can harvest from this animal
  + ### getFeatherItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFeatherItem()
  + ### isHappy

    public boolean isHappy()
  + ### shouldBeSkeleton

    public boolean shouldBeSkeleton()
  + ### setShouldBeSkeleton

    public void setShouldBeSkeleton(boolean shouldBeSkeleton)
  + ### getGeneticDisorder

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGeneticDisorder()
  + ### copyGeneticDisorder

    public void copyGeneticDisorder([Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> disorders)
  + ### getBabies

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](IsoAnimal.html "class in zombie.characters.animals")> getBabies()
  + ### canRagdoll

    public boolean canRagdoll()

    Overrides:
    :   `canRagdoll` in class `IsoGameCharacter`
  + ### getZoneAcceptance

    public float getZoneAcceptance()
  + ### getPlayerAcceptance

    public float getPlayerAcceptance([IsoPlayer](../IsoPlayer.html "class in zombie.characters") chr)
  + ### addAnimalPart

    public static void addAnimalPart(zombie.characters.animals.AnimalPart part,
    [IsoPlayer](../IsoPlayer.html "class in zombie.characters") player,
    [IsoDeadBody](../../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") carcass)

    Add an animal part in the player's inventory
    If the part is a food we gonna modify it
  + ### modifyMeat

    public static void modifyMeat([Food](../../inventory/types/Food.html "class in zombie.inventory.types") item,
    float size,
    float meatRatio)

    Modify the meat/food item given by the butchering by the meatRatio invalid input: '&' size of animal
    Adding a \*0.9-1.1 for flavor
  + ### shouldStartFollowWall

    public boolean shouldStartFollowWall()

    An animal will start to follow wall only if fleeing, or attached to someone
  + ### getCorpseSize

    public float getCorpseSize()
  + ### getCorpseLength

    public float getCorpseLength()
  + ### setOnHook

    public void setOnHook(boolean onhook)
  + ### isOnHook

    public boolean isOnHook()
  + ### getAdef

    public [AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals") getAdef()
  + ### getHook

    public [IsoButcherHook](../../iso/IsoButcherHook.html "class in zombie.iso") getHook()
  + ### setHook

    public void setHook([IsoButcherHook](../../iso/IsoButcherHook.html "class in zombie.iso") hook)
  + ### reattachBackToHook

    public void reattachBackToHook()

    The animal attached on a hook needs a corpse that doesn't exist, so when we load the animal that was on a hook we gonna recreate this corpse and make sure our animal is in correct positions
  + ### ensureCorrectSkin

    private void ensureCorrectSkin()

    Im a bit lost why AnimalVisual wasn't taking the correct skin...
  + ### getTypeAndBreed

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTypeAndBreed()
  + ### createAnimalFromCorpse

    public static [IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") createAnimalFromCorpse([IsoDeadBody](../../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### updateLOS

    public void updateLOS()

    Overrides:
    :   `updateLOS` in class `IsoPlayer`
  + ### canBePutInHutch

    public boolean canBePutInHutch([IsoHutch](../../iso/objects/IsoHutch.html "class in zombie.iso.objects") hutch)
  + ### shouldCreateZone

    public boolean shouldCreateZone()
  + ### setIsRoadKill

    public void setIsRoadKill(boolean roadKill)
  + ### isRoadKill

    public boolean isRoadKill()
  + ### getLastCellSavedToX

    public int getLastCellSavedToX()
  + ### getLastCellSavedToY

    public int getLastCellSavedToY()
  + ### setLastCellSavedTo

    public void setLastCellSavedTo(int x,
    int y)
  + ### getFeedByHandAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFeedByHandAnim()