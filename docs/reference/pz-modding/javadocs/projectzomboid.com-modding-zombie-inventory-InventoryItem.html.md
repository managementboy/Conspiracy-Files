[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [InventoryItem](InventoryItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempBuffer](#tempBuffer)
   2. [DEFAULT\_USES](#DEFAULT_USES)
   3. [SERVER\_MAX\_UPDATE\_DELTA\_MS](#SERVER_MAX_UPDATE_DELTA_MS)
   4. [COMPASS\_TOOLTIP](#COMPASS_TOOLTIP)
   5. [previousOwner](#previousOwner)
   6. [scriptItem](#scriptItem)
   7. [itemType](#itemType)
   8. [container](#container)
   9. [containerX](#containerX)
   10. [containerY](#containerY)
   11. [name](#name)
   12. [replaceOnUse](#replaceOnUse)
   13. [replaceOnUseFullType](#replaceOnUseFullType)
   14. [conditionMax](#conditionMax)
   15. [rightClickContainer](#rightClickContainer)
   16. [texture](#texture)
   17. [texturerotten](#texturerotten)
   18. [textureCooked](#textureCooked)
   19. [textureBurnt](#textureBurnt)
   20. [type](#type)
   21. [fullType](#fullType)
   22. [uses](#uses)
   23. [age](#age)
   24. [lastAged](#lastAged)
   25. [isCookable](#isCookable)
   26. [cookingTime](#cookingTime)
   27. [minutesToCook](#minutesToCook)
   28. [minutesToBurn](#minutesToBurn)
   29. [cooked](#cooked)
   30. [burnt](#burnt)
   31. [offAge](#offAge)
   32. [offAgeMax](#offAgeMax)
   33. [weight](#weight)
   34. [actualWeight](#actualWeight)
   35. [worldTexture](#worldTexture)
   36. [description](#description)
   37. [condition](#condition)
   38. [offString](#offString)
   39. [freshString](#freshString)
   40. [staleString](#staleString)
   41. [cookedString](#cookedString)
   42. [toastedString](#toastedString)
   43. [grilledString](#grilledString)
   44. [unCookedString](#unCookedString)
   45. [frozenString](#frozenString)
   46. [burntString](#burntString)
   47. [emptyString](#emptyString)
   48. [module](#module)
   49. [boredomChange](#boredomChange)
   50. [unhappyChange](#unhappyChange)
   51. [stressChange](#stressChange)
   52. [foodSicknessChange](#foodSicknessChange)
   53. [inverseCoughProbability](#inverseCoughProbability)
   54. [inverseCoughProbabilitySmoker](#inverseCoughProbabilitySmoker)
   55. [taken](#taken)
   56. [table](#table)
   57. [replaceOnUseOn](#replaceOnUseOn)
   58. [col](#col)
   59. [canStack](#canStack)
   60. [activated](#activated)
   61. [isTorchCone](#isTorchCone)
   62. [lightDistance](#lightDistance)
   63. [count](#count)
   64. [fatigueChange](#fatigueChange)
   65. [worldItem](#worldItem)
   66. [deadBodyObject](#deadBodyObject)
   67. [customMenuOption](#customMenuOption)
   68. [tooltip](#tooltip)
   69. [displayCategory](#displayCategory)
   70. [haveBeenRepaired](#haveBeenRepaired)
   71. [broken](#broken)
   72. [originalName](#originalName)
   73. [id](#id)
   74. [requiresEquippedBothHands](#requiresEquippedBothHands)
   75. [byteData](#byteData)
   76. [extraItems](#extraItems)
   77. [customName](#customName)
   78. [breakSound](#breakSound)
   79. [alcoholic](#alcoholic)
   80. [alcoholPower](#alcoholPower)
   81. [bandagePower](#bandagePower)
   82. [reduceInfectionPower](#reduceInfectionPower)
   83. [customWeight](#customWeight)
   84. [customColor](#customColor)
   85. [keyId](#keyId)
   86. [remoteController](#remoteController)
   87. [canBeRemote](#canBeRemote)
   88. [remoteControlId](#remoteControlId)
   89. [remoteRange](#remoteRange)
   90. [colorRed](#colorRed)
   91. [colorGreen](#colorGreen)
   92. [colorBlue](#colorBlue)
   93. [countDownSound](#countDownSound)
   94. [explosionSound](#explosionSound)
   95. [equipParent](#equipParent)
   96. [evolvedRecipeName](#evolvedRecipeName)
   97. [metalValue](#metalValue)
   98. [itemHeat](#itemHeat)
   99. [meltingTime](#meltingTime)
   100. [worker](#worker)
   101. [isWet](#isWet)
   102. [wetCooldown](#wetCooldown)
   103. [itemWhenDry](#itemWhenDry)
   104. [favorite](#favorite)
   105. [requireInHandOrInventory](#requireInHandOrInventory)
   106. [stashMap](#stashMap)
   107. [zombieInfected](#zombieInfected)
   108. [itemCapacity](#itemCapacity)
   109. [maxCapacity](#maxCapacity)
   110. [brakeForce](#brakeForce)
   111. [durability](#durability)
   112. [chanceToSpawnDamaged](#chanceToSpawnDamaged)
   113. [conditionLowerNormal](#conditionLowerNormal)
   114. [conditionLowerOffroad](#conditionLowerOffroad)
   115. [wheelFriction](#wheelFriction)
   116. [suspensionDamping](#suspensionDamping)
   117. [suspensionCompression](#suspensionCompression)
   118. [engineLoudness](#engineLoudness)
   119. [visual](#visual)
   120. [staticModel](#staticModel)
   121. [iconsForTexture](#iconsForTexture)
   122. [bloodClothingType](#bloodClothingType)
   123. [stashChance](#stashChance)
   124. [ammoType](#ammoType)
   125. [maxAmmo](#maxAmmo)
   126. [currentAmmoCount](#currentAmmoCount)
   127. [gunType](#gunType)
   128. [gunTypeDisplayName](#gunTypeDisplayName)
   129. [attachmentType](#attachmentType)
   130. [attachmentsProvided](#attachmentsProvided)
   131. [attachedSlot](#attachedSlot)
   132. [attachedSlotType](#attachedSlotType)
   133. [attachmentReplacement](#attachmentReplacement)
   134. [attachedToModel](#attachedToModel)
   135. [alternateModelName](#alternateModelName)
   136. [registryId](#registryId)
   137. [worldScale](#worldScale)
   138. [worldXRotation](#worldXRotation)
   139. [worldYRotation](#worldYRotation)
   140. [worldZRotation](#worldZRotation)
   141. [worldAlpha](#worldAlpha)
   142. [recordedMediaIndex](#recordedMediaIndex)
   143. [mediaType](#mediaType)
   144. [isInitialised](#isInitialised)
   145. [atlasTexture](#atlasTexture)
   146. [textureColorMask](#textureColorMask)
   147. [textureFluidMask](#textureFluidMask)
   148. [animalTracks](#animalTracks)
   149. [staticModelsByIndex](#staticModelsByIndex)
   150. [worldStaticModelsByIndex](#worldStaticModelsByIndex)
   151. [doingExtendedPlacement](#doingExtendedPlacement)
   152. [modelIndex](#modelIndex)
   153. [maxTextLength](#maxTextLength)
   154. [equippedAndActivatedPlayer](#equippedAndActivatedPlayer)
   155. [equippedAndActivatedSound](#equippedAndActivatedSound)
   156. [isCraftingConsumed](#isCraftingConsumed)
   157. [jobDelta](#jobDelta)
   158. [jobType](#jobType)
   159. [mainCategory](#mainCategory)
   160. [canBeActivated](#canBeActivated)
   161. [lightStrength](#lightStrength)
   162. [closeKillMove](#closeKillMove)
   163. [useDelta](#useDelta)
   164. [lastUpdateMs](#lastUpdateMs)
   165. [timeMultiplier](#timeMultiplier)
   166. [beingFilled](#beingFilled)
6. [Constructor Details](#constructor-detail)
   1. [InventoryItem(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [InventoryItem(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [getCoverType()](#getCoverType())
   2. [getBookSubjects()](#getBookSubjects())
   3. [getMagazineSubjects()](#getMagazineSubjects())
   4. [getWorldItem()](#getWorldItem())
   5. [hasWorldItem()](#hasWorldItem())
   6. [isOnGroundOnSquare(IsoGridSquare)](#isOnGroundOnSquare(zombie.iso.IsoGridSquare))
   7. [isInsideBagOnSquare(IsoGridSquare)](#isInsideBagOnSquare(zombie.iso.IsoGridSquare))
   8. [isOnGroundOrInsideBagOnSquare(IsoGridSquare)](#isOnGroundOrInsideBagOnSquare(zombie.iso.IsoGridSquare))
   9. [setEquipParent(IsoGameCharacter)](#setEquipParent(zombie.characters.IsoGameCharacter))
   10. [setEquipParent(IsoGameCharacter, boolean)](#setEquipParent(zombie.characters.IsoGameCharacter,boolean))
   11. [getEquipParent()](#getEquipParent())
   12. [getBringToBearSound()](#getBringToBearSound())
   13. [getAimReleaseSound()](#getAimReleaseSound())
   14. [getEquipSound()](#getEquipSound())
   15. [getUnequipSound()](#getUnequipSound())
   16. [getDropSound()](#getDropSound())
   17. [setWorldItem(IsoWorldInventoryObject)](#setWorldItem(zombie.iso.objects.IsoWorldInventoryObject))
   18. [setJobDelta(float)](#setJobDelta(float))
   19. [getJobDelta()](#getJobDelta())
   20. [setJobType(String)](#setJobType(java.lang.String))
   21. [getJobType()](#getJobType())
   22. [hasModData()](#hasModData())
   23. [getModData()](#getModData())
   24. [storeInByteData(IsoObject)](#storeInByteData(zombie.iso.IsoObject))
   25. [getByteData()](#getByteData())
   26. [loadCorpseFromByteData(IsoGridSquare)](#loadCorpseFromByteData(zombie.iso.IsoGridSquare))
   27. [tryLoadCorpseFromByteData(IsoGridSquare)](#tryLoadCorpseFromByteData(zombie.iso.IsoGridSquare))
   28. [isForceDropHeavyItem()](#isForceDropHeavyItem())
   29. [isHumanCorpse()](#isHumanCorpse())
   30. [isAnimalCorpse()](#isAnimalCorpse())
   31. [createDefaultDeadBody(IsoGridSquare)](#createDefaultDeadBody(zombie.iso.IsoGridSquare))
   32. [createAndStoreDefaultDeadBody(IsoGridSquare)](#createAndStoreDefaultDeadBody(zombie.iso.IsoGridSquare))
   33. [isRequiresEquippedBothHands()](#isRequiresEquippedBothHands())
   34. [getA()](#getA())
   35. [getR()](#getR())
   36. [getG()](#getG())
   37. [getB()](#getB())
   38. [getType()](#getType())
   39. [getTex()](#getTex())
   40. [getCategory()](#getCategory())
   41. [UseForCrafting(int)](#UseForCrafting(int))
   42. [IsRotten()](#IsRotten())
   43. [HowRotten()](#HowRotten())
   44. [CanStack(InventoryItem)](#CanStack(zombie.inventory.InventoryItem))
   45. [ModDataMatches(InventoryItem)](#ModDataMatches(zombie.inventory.InventoryItem))
   46. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   47. [DoTooltipEmbedded(ObjectTooltip, ObjectTooltip.Layout, int)](#DoTooltipEmbedded(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout,int))
   48. [drawTooltipItemTexture(ObjectTooltip, Texture, float, float, float, float, float, float, float, float)](#drawTooltipItemTexture(zombie.ui.ObjectTooltip,zombie.core.textures.Texture,float,float,float,float,float,float,float,float))
   49. [getCleanString(float)](#getCleanString(float))
   50. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   51. [SetContainerPosition(int, int)](#SetContainerPosition(int,int))
   52. [Use()](#Use())
   53. [UseAndSync()](#UseAndSync())
   54. [UseItem()](#UseItem())
   55. [Use(boolean)](#Use(boolean))
   56. [Use(boolean, boolean, boolean)](#Use(boolean,boolean,boolean))
   57. [shouldUpdateInRain()](#shouldUpdateInRain())
   58. [shouldUpdateInWorld()](#shouldUpdateInWorld())
   59. [handleRainTaint(Food)](#handleRainTaint(zombie.inventory.types.Food))
   60. [soakTowel()](#soakTowel())
   61. [handleWorldItemInRain()](#handleWorldItemInRain())
   62. [calculateTimeMultiplier()](#calculateTimeMultiplier())
   63. [update()](#update())
   64. [finishupdate()](#finishupdate())
   65. [getSoundLimiterGroupID()](#getSoundLimiterGroupID())
   66. [registerWithSoundLimiter(SoundInstanceLimiter)](#registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter))
   67. [updateSound(BaseSoundEmitter)](#updateSound(zombie.audio.BaseSoundEmitter))
   68. [updateSound(BaseSoundEmitter, SoundLimiterParams)](#updateSound(zombie.audio.BaseSoundEmitter,zombie.audio.SoundLimiterParams))
   69. [stopSoundOnPlayer()](#stopSoundOnPlayer())
   70. [updateEquippedAndActivatedSound(BaseSoundEmitter)](#updateEquippedAndActivatedSound(zombie.audio.BaseSoundEmitter))
   71. [updateEquippedAndActivatedSound()](#updateEquippedAndActivatedSound())
   72. [stopEquippedAndActivatedSound()](#stopEquippedAndActivatedSound())
   73. [playActivateSound()](#playActivateSound())
   74. [playDeactivateSound()](#playDeactivateSound())
   75. [playActivateDeactivateSound()](#playActivateDeactivateSound())
   76. [playSoundOnPlayer(SoundKey)](#playSoundOnPlayer(zombie.scripting.objects.SoundKey))
   77. [playSoundOnPlayer(String)](#playSoundOnPlayer(java.lang.String))
   78. [getOwnerPlayer(ItemContainer)](#getOwnerPlayer(zombie.inventory.ItemContainer))
   79. [is(ItemKey...)](#is(zombie.scripting.objects.ItemKey...))
   80. [getFullType()](#getFullType())
   81. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   82. [loadItem(ByteBuffer, int)](#loadItem(java.nio.ByteBuffer,int))
   83. [loadItem(ByteBuffer, int, boolean)](#loadItem(java.nio.ByteBuffer,int,boolean))
   84. [loadItem(ByteBuffer, int, boolean, InventoryItem)](#loadItem(java.nio.ByteBuffer,int,boolean,zombie.inventory.InventoryItem))
   85. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   86. [createCloneItem()](#createCloneItem())
   87. [IsFood()](#IsFood())
   88. [IsWeapon()](#IsWeapon())
   89. [IsDrainable()](#IsDrainable())
   90. [IsLiterature()](#IsLiterature())
   91. [IsClothing()](#IsClothing())
   92. [IsInventoryContainer()](#IsInventoryContainer())
   93. [IsMap()](#IsMap())
   94. [LoadFromFile(DataInputStream)](#LoadFromFile(java.io.DataInputStream))
   95. [getOutermostContainer()](#getOutermostContainer())
   96. [isInLocalPlayerInventory()](#isInLocalPlayerInventory())
   97. [isInPlayerInventory()](#isInPlayerInventory())
   98. [getItemReplacementPrimaryHand()](#getItemReplacementPrimaryHand())
   99. [getItemReplacementSecondHand()](#getItemReplacementSecondHand())
   100. [getClothingItem()](#getClothingItem())
   101. [getAlternateModelName()](#getAlternateModelName())
   102. [getVisual()](#getVisual())
   103. [allowRandomTint()](#allowRandomTint())
   104. [synchWithVisual()](#synchWithVisual())
   105. [getContainerX()](#getContainerX())
   106. [setContainerX(int)](#setContainerX(int))
   107. [getContainerY()](#getContainerY())
   108. [setContainerY(int)](#setContainerY(int))
   109. [isDisappearOnUse()](#isDisappearOnUse())
   110. [isKeepOnDeplete()](#isKeepOnDeplete())
   111. [getName()](#getName())
   112. [getName(IsoPlayer)](#getName(zombie.characters.IsoPlayer))
   113. [setName(String)](#setName(java.lang.String))
   114. [getReplaceOnUse()](#getReplaceOnUse())
   115. [setReplaceOnUse(String)](#setReplaceOnUse(java.lang.String))
   116. [getReplaceOnUseFullType()](#getReplaceOnUseFullType())
   117. [getConditionMax()](#getConditionMax())
   118. [setConditionMax(int)](#setConditionMax(int))
   119. [getRightClickContainer()](#getRightClickContainer())
   120. [setRightClickContainer(ItemContainer)](#setRightClickContainer(zombie.inventory.ItemContainer))
   121. [getSwingAnim()](#getSwingAnim())
   122. [getTexture()](#getTexture())
   123. [getIcon()](#getIcon())
   124. [setTexture(Texture)](#setTexture(zombie.core.textures.Texture))
   125. [setIcon(Texture)](#setIcon(zombie.core.textures.Texture))
   126. [getTexturerotten()](#getTexturerotten())
   127. [setTexturerotten(Texture)](#setTexturerotten(zombie.core.textures.Texture))
   128. [getTextureCooked()](#getTextureCooked())
   129. [setTextureCooked(Texture)](#setTextureCooked(zombie.core.textures.Texture))
   130. [getTextureBurnt()](#getTextureBurnt())
   131. [setTextureBurnt(Texture)](#setTextureBurnt(zombie.core.textures.Texture))
   132. [setType(String)](#setType(java.lang.String))
   133. [setCurrentUses(int)](#setCurrentUses(int))
   134. [getCurrentUses()](#getCurrentUses())
   135. [setCurrentUsesFrom(InventoryItem)](#setCurrentUsesFrom(zombie.inventory.InventoryItem))
   136. [getMaxUses()](#getMaxUses())
   137. [getCurrentUsesFloat()](#getCurrentUsesFloat())
   138. [setCurrentUsesFloat(float)](#setCurrentUsesFloat(float))
   139. [getUseDelta()](#getUseDelta())
   140. [setUseDelta(float)](#setUseDelta(float))
   141. [getUses()](#getUses())
   142. [setUses(int)](#setUses(int))
   143. [setUsesFrom(InventoryItem)](#setUsesFrom(zombie.inventory.InventoryItem))
   144. [getAge()](#getAge())
   145. [setAge(float)](#setAge(float))
   146. [getLastAged()](#getLastAged())
   147. [setLastAged(float)](#setLastAged(float))
   148. [updateAge()](#updateAge())
   149. [setAutoAge()](#setAutoAge())
   150. [isIsCookable()](#isIsCookable())
   151. [isCookable()](#isCookable())
   152. [setIsCookable(boolean)](#setIsCookable(boolean))
   153. [getCookingTime()](#getCookingTime())
   154. [setCookingTime(float)](#setCookingTime(float))
   155. [getMinutesToCook()](#getMinutesToCook())
   156. [setMinutesToCook(float)](#setMinutesToCook(float))
   157. [getMinutesToBurn()](#getMinutesToBurn())
   158. [setMinutesToBurn(float)](#setMinutesToBurn(float))
   159. [isCooked()](#isCooked())
   160. [setCooked(boolean)](#setCooked(boolean))
   161. [isBurnt()](#isBurnt())
   162. [setBurnt(boolean)](#setBurnt(boolean))
   163. [getOffAge()](#getOffAge())
   164. [setOffAge(int)](#setOffAge(int))
   165. [getOffAgeMax()](#getOffAgeMax())
   166. [setOffAgeMax(int)](#setOffAgeMax(int))
   167. [getWeight()](#getWeight())
   168. [setWeight(float)](#setWeight(float))
   169. [getActualWeight()](#getActualWeight())
   170. [getActualWeightUnmodded()](#getActualWeightUnmodded())
   171. [setActualWeight(float)](#setActualWeight(float))
   172. [getWorldTexture()](#getWorldTexture())
   173. [setWorldTexture(String)](#setWorldTexture(java.lang.String))
   174. [getDescription()](#getDescription())
   175. [setDescription(String)](#setDescription(java.lang.String))
   176. [incrementCondition(int)](#incrementCondition(int))
   177. [getCondition()](#getCondition())
   178. [setCondition(int, boolean)](#setCondition(int,boolean))
   179. [doBreakSound()](#doBreakSound())
   180. [doDamagedSound()](#doDamagedSound())
   181. [setCondition(int)](#setCondition(int))
   182. [setConditionNoSound(int)](#setConditionNoSound(int))
   183. [setConditionWhileLoading(int)](#setConditionWhileLoading(int))
   184. [getOffString()](#getOffString())
   185. [setOffString(String)](#setOffString(java.lang.String))
   186. [getCookedString()](#getCookedString())
   187. [setCookedString(String)](#setCookedString(java.lang.String))
   188. [getUnCookedString()](#getUnCookedString())
   189. [setUnCookedString(String)](#setUnCookedString(java.lang.String))
   190. [getBurntString()](#getBurntString())
   191. [setBurntString(String)](#setBurntString(java.lang.String))
   192. [getModule()](#getModule())
   193. [setModule(String)](#setModule(java.lang.String))
   194. [isAlwaysWelcomeGift()](#isAlwaysWelcomeGift())
   195. [isCanBandage()](#isCanBandage())
   196. [getBoredomChange()](#getBoredomChange())
   197. [setBoredomChange(float)](#setBoredomChange(float))
   198. [getUnhappyChange()](#getUnhappyChange())
   199. [setUnhappyChange(float)](#setUnhappyChange(float))
   200. [getStressChange()](#getStressChange())
   201. [setStressChange(float)](#setStressChange(float))
   202. [getFoodSicknessChange()](#getFoodSicknessChange())
   203. [setFoodSicknessChange(int)](#setFoodSicknessChange(int))
   204. [getInverseCoughProbability()](#getInverseCoughProbability())
   205. [setInverseCoughProbability(int)](#setInverseCoughProbability(int))
   206. [getInverseCoughProbabilitySmoker()](#getInverseCoughProbabilitySmoker())
   207. [setInverseCoughProbabilitySmoker(int)](#setInverseCoughProbabilitySmoker(int))
   208. [getTags()](#getTags())
   209. [hasTag(ItemTag...)](#hasTag(zombie.scripting.objects.ItemTag...))
   210. [hasTag(ItemTag)](#hasTag(zombie.scripting.objects.ItemTag))
   211. [getTaken()](#getTaken())
   212. [setTaken(ArrayList)](#setTaken(java.util.ArrayList))
   213. [setReplaceOnUseOn(String)](#setReplaceOnUseOn(java.lang.String))
   214. [getReplaceOnUseOn()](#getReplaceOnUseOn())
   215. [getReplaceOnUseOnString()](#getReplaceOnUseOnString())
   216. [getReplaceTypes()](#getReplaceTypes())
   217. [getReplaceTypesMap()](#getReplaceTypesMap())
   218. [getReplaceType(String)](#getReplaceType(java.lang.String))
   219. [hasReplaceType(String)](#hasReplaceType(java.lang.String))
   220. [isWaterSource()](#isWaterSource())
   221. [isWaterOnlySource()](#isWaterOnlySource())
   222. [CanStackNoTemp(InventoryItem)](#CanStackNoTemp(zombie.inventory.InventoryItem))
   223. [CopyModData(KahluaTable)](#CopyModData(se.krka.kahlua.vm.KahluaTable))
   224. [copyModData(KahluaTable)](#copyModData(se.krka.kahlua.vm.KahluaTable))
   225. [getCount()](#getCount())
   226. [setCount(int)](#setCount(int))
   227. [isActivated()](#isActivated())
   228. [setActivated(boolean)](#setActivated(boolean))
   229. [setActivatedRemote(boolean)](#setActivatedRemote(boolean))
   230. [setCanBeActivated(boolean)](#setCanBeActivated(boolean))
   231. [canBeActivated()](#canBeActivated())
   232. [setLightStrength(float)](#setLightStrength(float))
   233. [getLightStrength()](#getLightStrength())
   234. [isTorchCone()](#isTorchCone())
   235. [setTorchCone(boolean)](#setTorchCone(boolean))
   236. [getTorchDot()](#getTorchDot())
   237. [getLightDistance()](#getLightDistance())
   238. [setLightDistance(int)](#setLightDistance(int))
   239. [canEmitLight()](#canEmitLight())
   240. [isEmittingLight()](#isEmittingLight())
   241. [canStoreWater()](#canStoreWater())
   242. [getFatigueChange()](#getFatigueChange())
   243. [setFatigueChange(float)](#setFatigueChange(float))
   244. [getCurrentCondition()](#getCurrentCondition())
   245. [setColor(Color)](#setColor(zombie.core.Color))
   246. [getColor()](#getColor())
   247. [getColorInfo()](#getColorInfo())
   248. [isTwoHandWeapon()](#isTwoHandWeapon())
   249. [getCustomMenuOption()](#getCustomMenuOption())
   250. [setCustomMenuOption(String)](#setCustomMenuOption(java.lang.String))
   251. [setTooltip(String)](#setTooltip(java.lang.String))
   252. [getTooltip()](#getTooltip())
   253. [getDisplayCategory()](#getDisplayCategory())
   254. [setDisplayCategory(String)](#setDisplayCategory(java.lang.String))
   255. [getHaveBeenRepaired()](#getHaveBeenRepaired())
   256. [setHaveBeenRepaired(int)](#setHaveBeenRepaired(int))
   257. [getTimesRepaired()](#getTimesRepaired())
   258. [setTimesRepaired(int)](#setTimesRepaired(int))
   259. [copyTimesRepairedFrom(InventoryItem)](#copyTimesRepairedFrom(zombie.inventory.InventoryItem))
   260. [copyTimesRepairedTo(InventoryItem)](#copyTimesRepairedTo(zombie.inventory.InventoryItem))
   261. [getTimesHeadRepaired()](#getTimesHeadRepaired())
   262. [setTimesHeadRepaired(int)](#setTimesHeadRepaired(int))
   263. [hasTimesHeadRepaired()](#hasTimesHeadRepaired())
   264. [copyTimesHeadRepairedFrom(InventoryItem)](#copyTimesHeadRepairedFrom(zombie.inventory.InventoryItem))
   265. [copyTimesHeadRepairedTo(InventoryItem)](#copyTimesHeadRepairedTo(zombie.inventory.InventoryItem))
   266. [isBroken()](#isBroken())
   267. [setBroken(boolean)](#setBroken(boolean))
   268. [getDisplayName()](#getDisplayName())
   269. [isTrap()](#isTrap())
   270. [addExtraItem(ItemKey)](#addExtraItem(zombie.scripting.objects.ItemKey))
   271. [addExtraItem(String)](#addExtraItem(java.lang.String))
   272. [haveExtraItems()](#haveExtraItems())
   273. [getExtraItems()](#getExtraItems())
   274. [getExtraItemsWeight()](#getExtraItemsWeight())
   275. [isCustomName()](#isCustomName())
   276. [setCustomName(boolean)](#setCustomName(boolean))
   277. [isFishingLure()](#isFishingLure())
   278. [copyConditionModData(InventoryItem)](#copyConditionModData(zombie.inventory.InventoryItem))
   279. [setConditionFromModData(InventoryItem)](#setConditionFromModData(zombie.inventory.InventoryItem))
   280. [getBreakSound()](#getBreakSound())
   281. [setBreakSound(String)](#setBreakSound(java.lang.String))
   282. [getPlaceOneSound()](#getPlaceOneSound())
   283. [getPlaceMultipleSound()](#getPlaceMultipleSound())
   284. [getSoundByID(String)](#getSoundByID(java.lang.String))
   285. [setBeingFilled(boolean)](#setBeingFilled(boolean))
   286. [isBeingFilled()](#isBeingFilled())
   287. [getFillFromDispenserSound()](#getFillFromDispenserSound())
   288. [getFillFromLakeSound()](#getFillFromLakeSound())
   289. [getFillFromTapSound()](#getFillFromTapSound())
   290. [getFillFromToiletSound()](#getFillFromToiletSound())
   291. [getPourLiquidOnGroundSound()](#getPourLiquidOnGroundSound())
   292. [isAlcoholic()](#isAlcoholic())
   293. [setAlcoholic(boolean)](#setAlcoholic(boolean))
   294. [getAlcoholPower()](#getAlcoholPower())
   295. [setAlcoholPower(float)](#setAlcoholPower(float))
   296. [getBandagePower()](#getBandagePower())
   297. [setBandagePower(float)](#setBandagePower(float))
   298. [getReduceInfectionPower()](#getReduceInfectionPower())
   299. [setReduceInfectionPower(float)](#setReduceInfectionPower(float))
   300. [saveWithSize(ByteBuffer, boolean)](#saveWithSize(java.nio.ByteBuffer,boolean))
   301. [isCustomWeight()](#isCustomWeight())
   302. [setCustomWeight(boolean)](#setCustomWeight(boolean))
   303. [getContentsWeight()](#getContentsWeight())
   304. [getHotbarEquippedWeight()](#getHotbarEquippedWeight())
   305. [getEquippedWeight()](#getEquippedWeight())
   306. [getUnequippedWeight()](#getUnequippedWeight())
   307. [isEquipped()](#isEquipped())
   308. [getUser()](#getUser())
   309. [getOwner()](#getOwner())
   310. [getKeyId()](#getKeyId())
   311. [setKeyId(int)](#setKeyId(int))
   312. [isRemoteController()](#isRemoteController())
   313. [setRemoteController(boolean)](#setRemoteController(boolean))
   314. [canBeRemote()](#canBeRemote())
   315. [setCanBeRemote(boolean)](#setCanBeRemote(boolean))
   316. [getRemoteControlID()](#getRemoteControlID())
   317. [setRemoteControlID(int)](#setRemoteControlID(int))
   318. [getRemoteRange()](#getRemoteRange())
   319. [setRemoteRange(int)](#setRemoteRange(int))
   320. [getExplosionSound()](#getExplosionSound())
   321. [setExplosionSound(String)](#setExplosionSound(java.lang.String))
   322. [getCountDownSound()](#getCountDownSound())
   323. [setCountDownSound(String)](#setCountDownSound(java.lang.String))
   324. [getColorRed()](#getColorRed())
   325. [setColorRed(float)](#setColorRed(float))
   326. [getColorGreen()](#getColorGreen())
   327. [setColorGreen(float)](#setColorGreen(float))
   328. [getColorBlue()](#getColorBlue())
   329. [setColorBlue(float)](#setColorBlue(float))
   330. [getEvolvedRecipeName()](#getEvolvedRecipeName())
   331. [setEvolvedRecipeName(String)](#setEvolvedRecipeName(java.lang.String))
   332. [getMetalValue()](#getMetalValue())
   333. [setMetalValue(float)](#setMetalValue(float))
   334. [getItemHeat()](#getItemHeat())
   335. [setItemHeat(float)](#setItemHeat(float))
   336. [getInvHeat()](#getInvHeat())
   337. [getMeltingTime()](#getMeltingTime())
   338. [setMeltingTime(float)](#setMeltingTime(float))
   339. [getWorker()](#getWorker())
   340. [setWorker(String)](#setWorker(java.lang.String))
   341. [getID()](#getID())
   342. [setID(int)](#setID(int))
   343. [isWet()](#isWet())
   344. [setWet(boolean)](#setWet(boolean))
   345. [getWetCooldown()](#getWetCooldown())
   346. [setWetCooldown(float)](#setWetCooldown(float))
   347. [getItemWhenDry()](#getItemWhenDry())
   348. [setItemWhenDry(String)](#setItemWhenDry(java.lang.String))
   349. [isFavorite()](#isFavorite())
   350. [setFavorite(boolean)](#setFavorite(boolean))
   351. [setFavorite(boolean, boolean)](#setFavorite(boolean,boolean))
   352. [getRequireInHandOrInventory()](#getRequireInHandOrInventory())
   353. [setRequireInHandOrInventory(ArrayList)](#setRequireInHandOrInventory(java.util.ArrayList))
   354. [isCustomColor()](#isCustomColor())
   355. [setCustomColor(boolean)](#setCustomColor(boolean))
   356. [doBuildingStash()](#doBuildingStash())
   357. [setStashMap(String)](#setStashMap(java.lang.String))
   358. [getStashMap()](#getStashMap())
   359. [getMechanicType()](#getMechanicType())
   360. [getItemCapacity()](#getItemCapacity())
   361. [setItemCapacity(float)](#setItemCapacity(float))
   362. [getMaxCapacity()](#getMaxCapacity())
   363. [setMaxCapacity(int)](#setMaxCapacity(int))
   364. [isConditionAffectsCapacity()](#isConditionAffectsCapacity())
   365. [getBrakeForce()](#getBrakeForce())
   366. [setBrakeForce(float)](#setBrakeForce(float))
   367. [getDurability()](#getDurability())
   368. [setDurability(float)](#setDurability(float))
   369. [getChanceToSpawnDamaged()](#getChanceToSpawnDamaged())
   370. [setChanceToSpawnDamaged(int)](#setChanceToSpawnDamaged(int))
   371. [getConditionLowerNormal()](#getConditionLowerNormal())
   372. [setConditionLowerNormal(float)](#setConditionLowerNormal(float))
   373. [getConditionLowerOffroad()](#getConditionLowerOffroad())
   374. [setConditionLowerOffroad(float)](#setConditionLowerOffroad(float))
   375. [getWheelFriction()](#getWheelFriction())
   376. [setWheelFriction(float)](#setWheelFriction(float))
   377. [getSuspensionDamping()](#getSuspensionDamping())
   378. [setSuspensionDamping(float)](#setSuspensionDamping(float))
   379. [getSuspensionCompression()](#getSuspensionCompression())
   380. [setSuspensionCompression(float)](#setSuspensionCompression(float))
   381. [setInfected(boolean)](#setInfected(boolean))
   382. [isInfected()](#isInfected())
   383. [getEngineLoudness()](#getEngineLoudness())
   384. [setEngineLoudness(float)](#setEngineLoudness(float))
   385. [getStaticModel()](#getStaticModel())
   386. [setStaticModel(String)](#setStaticModel(java.lang.String))
   387. [setStaticModel(ModelKey)](#setStaticModel(zombie.scripting.objects.ModelKey))
   388. [getStaticModelException()](#getStaticModelException())
   389. [getIconsForTexture()](#getIconsForTexture())
   390. [setIconsForTexture(ArrayList)](#setIconsForTexture(java.util.ArrayList))
   391. [getScore(SurvivorDesc)](#getScore(zombie.characters.SurvivorDesc))
   392. [getPreviousOwner()](#getPreviousOwner())
   393. [setPreviousOwner(IsoGameCharacter)](#setPreviousOwner(zombie.characters.IsoGameCharacter))
   394. [getScriptItem()](#getScriptItem())
   395. [setScriptItem(Item)](#setScriptItem(zombie.scripting.objects.Item))
   396. [getItemType()](#getItemType())
   397. [setItemType(ItemType)](#setItemType(zombie.scripting.objects.ItemType))
   398. [isItemType(ItemType)](#isItemType(zombie.scripting.objects.ItemType))
   399. [getContainer()](#getContainer())
   400. [setContainer(ItemContainer)](#setContainer(zombie.inventory.ItemContainer))
   401. [getBloodClothingType()](#getBloodClothingType())
   402. [setBloodClothingType(ArrayList)](#setBloodClothingType(java.util.ArrayList))
   403. [setBlood(BloodBodyPartType, float)](#setBlood(zombie.characterTextures.BloodBodyPartType,float))
   404. [getBlood(BloodBodyPartType)](#getBlood(zombie.characterTextures.BloodBodyPartType))
   405. [setDirt(BloodBodyPartType, float)](#setDirt(zombie.characterTextures.BloodBodyPartType,float))
   406. [getDirt(BloodBodyPartType)](#getDirt(zombie.characterTextures.BloodBodyPartType))
   407. [getClothingItemName()](#getClothingItemName())
   408. [getStashChance()](#getStashChance())
   409. [setStashChance(int)](#setStashChance(int))
   410. [getEatType()](#getEatType())
   411. [getPourType()](#getPourType())
   412. [isUseWorldItem()](#isUseWorldItem())
   413. [getAmmoType()](#getAmmoType())
   414. [setAmmoType(AmmoType)](#setAmmoType(zombie.scripting.objects.AmmoType))
   415. [getMaxAmmo()](#getMaxAmmo())
   416. [setMaxAmmo(int)](#setMaxAmmo(int))
   417. [getCurrentAmmoCount()](#getCurrentAmmoCount())
   418. [setCurrentAmmoCount(int)](#setCurrentAmmoCount(int))
   419. [getGunType()](#getGunType())
   420. [setGunType(ArrayList)](#setGunType(java.util.ArrayList))
   421. [hasBlood()](#hasBlood())
   422. [hasDirt()](#hasDirt())
   423. [getAttachmentType()](#getAttachmentType())
   424. [setAttachmentType(String)](#setAttachmentType(java.lang.String))
   425. [getAttachedSlot()](#getAttachedSlot())
   426. [setAttachedSlot(int)](#setAttachedSlot(int))
   427. [getAttachmentsProvided()](#getAttachmentsProvided())
   428. [setAttachmentsProvided(ArrayList)](#setAttachmentsProvided(java.util.ArrayList))
   429. [getAttachedSlotType()](#getAttachedSlotType())
   430. [setAttachedSlotType(String)](#setAttachedSlotType(java.lang.String))
   431. [getAttachmentReplacement()](#getAttachmentReplacement())
   432. [setAttachmentReplacement(String)](#setAttachmentReplacement(java.lang.String))
   433. [getAttachedToModel()](#getAttachedToModel())
   434. [setAttachedToModel(String)](#setAttachedToModel(java.lang.String))
   435. [getFabricType()](#getFabricType())
   436. [getStringItemType()](#getStringItemType())
   437. [isProtectFromRainWhileEquipped()](#isProtectFromRainWhileEquipped())
   438. [isEquippedNoSprint()](#isEquippedNoSprint())
   439. [getBodyLocation()](#getBodyLocation())
   440. [isBodyLocation(ItemBodyLocation)](#isBodyLocation(zombie.scripting.objects.ItemBodyLocation))
   441. [getMakeUpType()](#getMakeUpType())
   442. [isHidden()](#isHidden())
   443. [getConsolidateOption()](#getConsolidateOption())
   444. [getClothingItemExtra()](#getClothingItemExtra())
   445. [getClothingItemExtraOption()](#getClothingItemExtraOption())
   446. [getWorldStaticItem()](#getWorldStaticItem())
   447. [getWorldStaticModel()](#getWorldStaticModel())
   448. [setWorldStaticItem(String)](#setWorldStaticItem(java.lang.String))
   449. [setWorldStaticModel(String)](#setWorldStaticModel(java.lang.String))
   450. [setWorldStaticModel(ModelKey)](#setWorldStaticModel(zombie.scripting.objects.ModelKey))
   451. [setRegistry\_id(Item)](#setRegistry_id(zombie.scripting.objects.Item))
   452. [getRegistry\_id()](#getRegistry_id())
   453. [getModID()](#getModID())
   454. [getModName()](#getModName())
   455. [isVanilla()](#isVanilla())
   456. [getRecordedMediaIndex()](#getRecordedMediaIndex())
   457. [setRecordedMediaIndex(short)](#setRecordedMediaIndex(short))
   458. [setRecordedMediaIndexInteger(int)](#setRecordedMediaIndexInteger(int))
   459. [isRecordedMedia()](#isRecordedMedia())
   460. [getMediaData()](#getMediaData())
   461. [getMediaType()](#getMediaType())
   462. [setMediaType(byte)](#setMediaType(byte))
   463. [setRecordedMediaData(MediaData)](#setRecordedMediaData(zombie.radio.media.MediaData))
   464. [setWorldZRotation(float)](#setWorldZRotation(float))
   465. [getWorldZRotation()](#getWorldZRotation())
   466. [setWorldYRotation(float)](#setWorldYRotation(float))
   467. [getWorldYRotation()](#getWorldYRotation())
   468. [setWorldXRotation(float)](#setWorldXRotation(float))
   469. [getWorldXRotation()](#getWorldXRotation())
   470. [randomizeWorldZRotation()](#randomizeWorldZRotation())
   471. [setWorldScale(float)](#setWorldScale(float))
   472. [getLuaCreate()](#getLuaCreate())
   473. [isInitialised()](#isInitialised())
   474. [setInitialised(boolean)](#setInitialised(boolean))
   475. [initialiseItem()](#initialiseItem())
   476. [getMilkReplaceItem()](#getMilkReplaceItem())
   477. [getMaxMilk()](#getMaxMilk())
   478. [isAnimalFeed()](#isAnimalFeed())
   479. [getAnimalFeedType()](#getAnimalFeedType())
   480. [getDigType()](#getDigType())
   481. [getSoundParameter(String)](#getSoundParameter(java.lang.String))
   482. [isWorn()](#isWorn())
   483. [toString()](#toString())
   484. [getTextureColorMask()](#getTextureColorMask())
   485. [getTextureFluidMask()](#getTextureFluidMask())
   486. [setTextureColorMask(String)](#setTextureColorMask(java.lang.String))
   487. [setTextureFluidMask(String)](#setTextureFluidMask(java.lang.String))
   488. [getSquare()](#getSquare())
   489. [getGameEntityType()](#getGameEntityType())
   490. [getEntityNetID()](#getEntityNetID())
   491. [getX()](#getX())
   492. [getY()](#getY())
   493. [getZ()](#getZ())
   494. [isEntityValid()](#isEntityValid())
   495. [RemoveFromContainer(InventoryItem)](#RemoveFromContainer(zombie.inventory.InventoryItem))
   496. [getAnimalTracks()](#getAnimalTracks())
   497. [setAnimalTracks(AnimalTracks)](#setAnimalTracks(zombie.characters.animals.AnimalTracks))
   498. [syncItemFields()](#syncItemFields())
   499. [checkSyncItemFields(boolean)](#checkSyncItemFields(boolean))
   500. [getWithDrainable()](#getWithDrainable())
   501. [getWithoutDrainable()](#getWithoutDrainable())
   502. [getStaticModelsByIndex()](#getStaticModelsByIndex())
   503. [setStaticModelsByIndex(ArrayList)](#setStaticModelsByIndex(java.util.ArrayList))
   504. [getWorldStaticModelsByIndex()](#getWorldStaticModelsByIndex())
   505. [setWorldStaticModelsByIndex(ArrayList)](#setWorldStaticModelsByIndex(java.util.ArrayList))
   506. [tryGetWorldStaticModelByIndex(int)](#tryGetWorldStaticModelByIndex(int))
   507. [getModelIndex()](#getModelIndex())
   508. [setModelIndex(int)](#setModelIndex(int))
   509. [getVisionModifier()](#getVisionModifier())
   510. [getHearingModifier()](#getHearingModifier())
   511. [getWorldObjectSprite()](#getWorldObjectSprite())
   512. [getStrainModifier()](#getStrainModifier())
   513. [getConditionLowerChance()](#getConditionLowerChance())
   514. [setConditionFrom(InventoryItem)](#setConditionFrom(zombie.inventory.InventoryItem))
   515. [setConditionTo(InventoryItem)](#setConditionTo(zombie.inventory.InventoryItem))
   516. [reduceCondition()](#reduceCondition())
   517. [damageCheck()](#damageCheck())
   518. [damageCheck(int)](#damageCheck(int))
   519. [damageCheck(int, float)](#damageCheck(int,float))
   520. [damageCheck(int, float, boolean)](#damageCheck(int,float,boolean))
   521. [damageCheck(int, float, boolean, boolean)](#damageCheck(int,float,boolean,boolean))
   522. [damageCheck(int, float, boolean, boolean, IsoGameCharacter)](#damageCheck(int,float,boolean,boolean,zombie.characters.IsoGameCharacter))
   523. [sharpnessCheck()](#sharpnessCheck())
   524. [sharpnessCheck(int)](#sharpnessCheck(int))
   525. [sharpnessCheck(int, float)](#sharpnessCheck(int,float))
   526. [sharpnessCheck(int, float, boolean)](#sharpnessCheck(int,float,boolean))
   527. [sharpnessCheck(int, float, boolean, boolean)](#sharpnessCheck(int,float,boolean,boolean))
   528. [sharpnessCheck(int, float, boolean, boolean, IsoGameCharacter)](#sharpnessCheck(int,float,boolean,boolean,zombie.characters.IsoGameCharacter))
   529. [reduceSharpness()](#reduceSharpness())
   530. [hasSharpness()](#hasSharpness())
   531. [getSharpness()](#getSharpness())
   532. [getMaxSharpness()](#getMaxSharpness())
   533. [applyMaxSharpness()](#applyMaxSharpness())
   534. [getSharpnessMultiplier()](#getSharpnessMultiplier())
   535. [setSharpness(float)](#setSharpness(float))
   536. [setSharpnessFrom(InventoryItem)](#setSharpnessFrom(zombie.inventory.InventoryItem))
   537. [getSharpnessIncrement()](#getSharpnessIncrement())
   538. [isDamaged()](#isDamaged())
   539. [isDull()](#isDull())
   540. [getMaintenanceMod()](#getMaintenanceMod())
   541. [getMaintenanceMod(boolean)](#getMaintenanceMod(boolean))
   542. [getMaintenanceMod(IsoGameCharacter)](#getMaintenanceMod(zombie.characters.IsoGameCharacter))
   543. [getMaintenanceMod(boolean, IsoGameCharacter)](#getMaintenanceMod(boolean,zombie.characters.IsoGameCharacter))
   544. [getWeaponLevel()](#getWeaponLevel())
   545. [headConditionCheck()](#headConditionCheck())
   546. [headConditionCheck(int)](#headConditionCheck(int))
   547. [headConditionCheck(int, float)](#headConditionCheck(int,float))
   548. [headConditionCheck(int, float, boolean)](#headConditionCheck(int,float,boolean))
   549. [headConditionCheck(int, float, boolean, boolean)](#headConditionCheck(int,float,boolean,boolean))
   550. [headConditionCheck(int, float, boolean, boolean, IsoGameCharacter)](#headConditionCheck(int,float,boolean,boolean,zombie.characters.IsoGameCharacter))
   551. [getHeadConditionLowerChance()](#getHeadConditionLowerChance())
   552. [getHeadConditionLowerChanceMultiplier()](#getHeadConditionLowerChanceMultiplier())
   553. [reduceHeadCondition()](#reduceHeadCondition())
   554. [hasHeadCondition()](#hasHeadCondition())
   555. [getHeadCondition()](#getHeadCondition())
   556. [getHeadConditionMax()](#getHeadConditionMax())
   557. [setHeadCondition(int)](#setHeadCondition(int))
   558. [setHeadConditionFromCondition(InventoryItem)](#setHeadConditionFromCondition(zombie.inventory.InventoryItem))
   559. [setConditionFromHeadCondition(InventoryItem)](#setConditionFromHeadCondition(zombie.inventory.InventoryItem))
   560. [hasQuality()](#hasQuality())
   561. [getQuality()](#getQuality())
   562. [setQuality(int)](#setQuality(int))
   563. [getOnBreak()](#getOnBreak())
   564. [onBreak()](#onBreak())
   565. [getBloodLevelAdjustedLow()](#getBloodLevelAdjustedLow())
   566. [getBloodLevelAdjustedHigh()](#getBloodLevelAdjustedHigh())
   567. [getBloodLevel()](#getBloodLevel())
   568. [setBloodLevel(float)](#setBloodLevel(float))
   569. [copyBloodLevelFrom(InventoryItem)](#copyBloodLevelFrom(zombie.inventory.InventoryItem))
   570. [isBloody()](#isBloody())
   571. [getDamagedSound()](#getDamagedSound())
   572. [getBulletHitArmourSound()](#getBulletHitArmourSound())
   573. [getWeaponHitArmourSound()](#getWeaponHitArmourSound())
   574. [getShoutType()](#getShoutType())
   575. [getShoutMultiplier()](#getShoutMultiplier())
   576. [getEatTime()](#getEatTime())
   577. [isVisualAid()](#isVisualAid())
   578. [getDiscomfortModifier()](#getDiscomfortModifier())
   579. [hasMetal()](#hasMetal())
   580. [getFireFuelRatio()](#getFireFuelRatio())
   581. [getWetness()](#getWetness())
   582. [isMemento()](#isMemento())
   583. [nameAfterDescriptor(SurvivorDesc)](#nameAfterDescriptor(zombie.characters.SurvivorDesc))
   584. [monogramAfterDescriptor(SurvivorDesc)](#monogramAfterDescriptor(zombie.characters.SurvivorDesc))
   585. [getLootType()](#getLootType())
   586. [getIsCraftingConsumed()](#getIsCraftingConsumed())
   587. [setIsCraftingConsumed(boolean)](#setIsCraftingConsumed(boolean))
   588. [OnAddedToContainer(ItemContainer)](#OnAddedToContainer(zombie.inventory.ItemContainer))
   589. [OnBeforeRemoveFromContainer(ItemContainer)](#OnBeforeRemoveFromContainer(zombie.inventory.ItemContainer))
   590. [getDeadBodyObject()](#getDeadBodyObject())
   591. [isPureWater(boolean)](#isPureWater(boolean))
   592. [copyClothing(InventoryItem)](#copyClothing(zombie.inventory.InventoryItem))
   593. [inheritFoodAgeFrom(InventoryItem)](#inheritFoodAgeFrom(zombie.inventory.InventoryItem))
   594. [inheritOlderFoodAge(InventoryItem)](#inheritOlderFoodAge(zombie.inventory.InventoryItem))
   595. [isFood()](#isFood())
   596. [unsealIfNotFull()](#unsealIfNotFull())
   597. [randomizeCondition()](#randomizeCondition())
   598. [randomizeGeneralCondition()](#randomizeGeneralCondition())
   599. [randomizeHeadCondition()](#randomizeHeadCondition())
   600. [randomizeSharpness()](#randomizeSharpness())
   601. [getFluidContainerFromSelfOrWorldItem()](#getFluidContainerFromSelfOrWorldItem())
   602. [isEmptyOfFluid()](#isEmptyOfFluid())
   603. [isFullOfFluid()](#isFullOfFluid())
   604. [isFluidContainer()](#isFluidContainer())
   605. [isSpice()](#isSpice())
   606. [isKeyRing()](#isKeyRing())
   607. [isFakeEquipped(IsoGameCharacter)](#isFakeEquipped(zombie.characters.IsoGameCharacter))
   608. [isFakeEquipped()](#isFakeEquipped())
   609. [getItemAfterCleaning()](#getItemAfterCleaning())
   610. [getResearchableRecipes()](#getResearchableRecipes())
   611. [getResearchableRecipes(IsoGameCharacter)](#getResearchableRecipes(zombie.characters.IsoGameCharacter))
   612. [hasResearchableRecipes()](#hasResearchableRecipes())
   613. [researchRecipes(IsoGameCharacter)](#researchRecipes(zombie.characters.IsoGameCharacter))
   614. [hasOrigin()](#hasOrigin())
   615. [canHaveOrigin()](#canHaveOrigin())
   616. [setOrigin(IsoGridSquare)](#setOrigin(zombie.iso.IsoGridSquare))
   617. [setOrigin(int, int)](#setOrigin(int,int))
   618. [setOrigin(int, int, int)](#setOrigin(int,int,int))
   619. [setOriginX(int)](#setOriginX(int))
   620. [setOriginY(int)](#setOriginY(int))
   621. [setOriginZ(int)](#setOriginZ(int))
   622. [getOriginX()](#getOriginX())
   623. [getOriginY()](#getOriginY())
   624. [getOriginZ()](#getOriginZ())
   625. [canBeEquipped()](#canBeEquipped())
   626. [getPlayer()](#getPlayer())
   627. [getWorldAlpha()](#getWorldAlpha())
   628. [setWorldAlpha(float)](#setWorldAlpha(float))
   629. [Remove()](#Remove())
   630. [SynchSpawn()](#SynchSpawn())
   631. [isFavouriteRecipeInput(IsoPlayer)](#isFavouriteRecipeInput(zombie.characters.IsoPlayer))
   632. [copyConditionStatesFrom(InventoryItem)](#copyConditionStatesFrom(zombie.inventory.InventoryItem))
   633. [getFileName()](#getFileName())
   634. [setDoingExtendedPlacement(boolean)](#setDoingExtendedPlacement(boolean))
   635. [isDoingExtendedPlacement()](#isDoingExtendedPlacement())
   636. [isNoRecipes(IsoPlayer)](#isNoRecipes(zombie.characters.IsoPlayer))
   637. [setNoRecipes(IsoPlayer, Boolean)](#setNoRecipes(zombie.characters.IsoPlayer,java.lang.Boolean))
   638. [getNoRecipesModDataString()](#getNoRecipesModDataString())
   639. [isUnwanted(IsoPlayer)](#isUnwanted(zombie.characters.IsoPlayer))
   640. [setUnwanted(IsoPlayer, boolean)](#setUnwanted(zombie.characters.IsoPlayer,boolean))
   641. [emptyLiquid()](#emptyLiquid())
   642. [getOpeningRecipe()](#getOpeningRecipe())
   643. [getDoubleClickRecipe()](#getDoubleClickRecipe())
   644. [isSealed()](#isSealed())
   645. [hasBeenSeen(IsoPlayer)](#hasBeenSeen(zombie.characters.IsoPlayer))
   646. [hasBeenHeard(IsoPlayer)](#hasBeenHeard(zombie.characters.IsoPlayer))
   647. [getReplaceOnExtinguish()](#getReplaceOnExtinguish())
   648. [getExtinguishedItem()](#getExtinguishedItem())
   649. [isSharpenable()](#isSharpenable())
   650. [getGunTypeString()](#getGunTypeString())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class InventoryItem
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

zombie.inventory.InventoryItem

Direct Known Subclasses:
:   `AlarmClock, AnimalInventoryItem, Clothing, ComboItem, DrainableComboItem, Food, HandWeapon, InventoryContainer, Key, KeyRing, Literature, MapItem, Moveable, WeaponPart`

---

public class InventoryItem
extends [GameEntity](../entity/GameEntity.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `activated`

  `protected float`

  `actualWeight`

  `protected float`

  `age`

  `protected boolean`

  `alcoholic`

  `private float`

  `alcoholPower`

  `private final String`

  `alternateModelName`

  `private AmmoType`

  `ammoType`

  `private AnimalTracks`

  `animalTracks`

  `zombie.core.skinnedmodel.model.WorldItemAtlas.ItemTexture`

  `atlasTexture`

  `private int`

  `attachedSlot`

  `private String`

  `attachedSlotType`

  `private String`

  `attachedToModel`

  `private String`

  `attachmentReplacement`

  `private ArrayList<String>`

  `attachmentsProvided`

  `private String`

  `attachmentType`

  `private float`

  `bandagePower`

  `private boolean`

  `beingFilled`

  `private ArrayList<BloodClothingType>`

  `bloodClothingType`

  `protected float`

  `boredomChange`

  `private float`

  `brakeForce`

  `private String`

  `breakSound`

  `private boolean`

  `broken`

  `protected boolean`

  `burnt`

  `protected String`

  `burntString`

  `ByteBuffer`

  `byteData`

  `private boolean`

  `canBeActivated`

  `private boolean`

  `canBeRemote`

  `boolean`

  `canStack`

  `private int`

  `chanceToSpawnDamaged`

  `String`

  `closeKillMove`

  `Color`

  `col`

  `private float`

  `colorBlue`

  `private float`

  `colorGreen`

  `private float`

  `colorRed`

  `private static final EnumMap<IsoDirections, String>`

  `COMPASS_TOOLTIP`

  `protected int`

  `condition`

  `private float`

  `conditionLowerNormal`

  `private float`

  `conditionLowerOffroad`

  `protected int`

  `conditionMax`

  `protected ItemContainer`

  `container`

  `protected int`

  `containerX`

  `protected int`

  `containerY`

  `boolean`

  `cooked`

  `protected String`

  `cookedString`

  `protected float`

  `cookingTime`

  `private int`

  `count`

  `private String`

  `countDownSound`

  `private int`

  `currentAmmoCount`

  `private boolean`

  `customColor`

  `private String`

  `customMenuOption`

  `private boolean`

  `customName`

  `private boolean`

  `customWeight`

  `IsoDeadBody`

  `deadBodyObject`

  `protected static final int`

  `DEFAULT_USES`

  `protected String`

  `description`

  `private String`

  `displayCategory`

  `private boolean`

  `doingExtendedPlacement`

  `private float`

  `durability`

  `protected String`

  `emptyString`

  `private float`

  `engineLoudness`

  `private IsoGameCharacter`

  `equipParent`

  `private IsoPlayer`

  `equippedAndActivatedPlayer`

  `private long`

  `equippedAndActivatedSound`

  `private String`

  `evolvedRecipeName`

  `private String`

  `explosionSound`

  `ArrayList<String>`

  `extraItems`

  `float`

  `fatigueChange`

  `private boolean`

  `favorite`

  `protected int`

  `foodSicknessChange`

  `protected String`

  `freshString`

  `protected String`

  `frozenString`

  `protected String`

  `fullType`

  `protected String`

  `grilledString`

  `private ArrayList<String>`

  `gunType`

  `private final List<String>`

  `gunTypeDisplayName`

  `private int`

  `haveBeenRepaired`

  `private ArrayList<String>`

  `iconsForTexture`

  `int`

  `id`

  `protected int`

  `inverseCoughProbability`

  `protected int`

  `inverseCoughProbabilitySmoker`

  `protected boolean`

  `isCookable`

  `private boolean`

  `isCraftingConsumed`

  `private boolean`

  `isInitialised`

  `private boolean`

  `isTorchCone`

  `private boolean`

  `isWet`

  `private float`

  `itemCapacity`

  `private float`

  `itemHeat`

  `protected ItemType`

  `itemType`

  `private String`

  `itemWhenDry`

  `float`

  `jobDelta`

  `String`

  `jobType`

  `private int`

  `keyId`

  `protected float`

  `lastAged`

  `private long`

  `lastUpdateMs`

  `private int`

  `lightDistance`

  `private float`

  `lightStrength`

  `String`

  `mainCategory`

  `private int`

  `maxAmmo`

  `private int`

  `maxCapacity`

  `private final int`

  `maxTextLength`

  `private byte`

  `mediaType`

  `private float`

  `meltingTime`

  `private float`

  `metalValue`

  `protected float`

  `minutesToBurn`

  `protected float`

  `minutesToCook`

  `private int`

  `modelIndex`

  `protected String`

  `module`

  `protected String`

  `name`

  `protected int`

  `offAge`

  `protected int`

  `offAgeMax`

  `protected String`

  `offString`

  `private final String`

  `originalName`

  `protected IsoGameCharacter`

  `previousOwner`

  `private short`

  `recordedMediaIndex`

  `private float`

  `reduceInfectionPower`

  `private short`

  `registryId`

  `private int`

  `remoteControlId`

  `private boolean`

  `remoteController`

  `private int`

  `remoteRange`

  `protected String`

  `replaceOnUse`

  `protected String`

  `replaceOnUseFullType`

  `String`

  `replaceOnUseOn`

  `protected ArrayList<String>`

  `requireInHandOrInventory`

  `boolean`

  `requiresEquippedBothHands`

  `protected ItemContainer`

  `rightClickContainer`

  `protected Item`

  `scriptItem`

  `private static final long`

  `SERVER_MAX_UPDATE_DELTA_MS`

  `protected String`

  `staleString`

  `private int`

  `stashChance`

  `private String`

  `stashMap`

  `protected String`

  `staticModel`

  `private ArrayList<String>`

  `staticModelsByIndex`

  `protected float`

  `stressChange`

  `private float`

  `suspensionCompression`

  `private float`

  `suspensionDamping`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `protected ArrayList<IsoObject>`

  `taken`

  `private static final ByteBuffer`

  `tempBuffer`

  `protected Texture`

  `texture`

  `protected Texture`

  `textureBurnt`

  `protected Texture`

  `textureColorMask`

  `protected Texture`

  `textureCooked`

  `protected Texture`

  `textureFluidMask`

  `protected Texture`

  `texturerotten`

  `protected float`

  `timeMultiplier`

  `protected String`

  `toastedString`

  `private String`

  `tooltip`

  `protected String`

  `type`

  `protected String`

  `unCookedString`

  `protected float`

  `unhappyChange`

  `private float`

  `useDelta`

  `protected int`

  `uses`

  `protected ItemVisual`

  `visual`

  `protected float`

  `weight`

  `private float`

  `wetCooldown`

  `private float`

  `wheelFriction`

  `private String`

  `worker`

  `float`

  `worldAlpha`

  `IsoWorldInventoryObject`

  `worldItem`

  `float`

  `worldScale`

  `private ArrayList<String>`

  `worldStaticModelsByIndex`

  `protected String`

  `worldTexture`

  `float`

  `worldXRotation`

  `float`

  `worldYRotation`

  `float`

  `worldZRotation`

  `private boolean`

  `zombieInfected`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `InventoryItem(String module,
  String name,
  String type,
  String tex)`

  `InventoryItem(String module,
  String name,
  String type,
  Item item)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addExtraItem(String type)`

  `void`

  `addExtraItem(ItemKey key)`

  `boolean`

  `allowRandomTint()`

  `void`

  `applyMaxSharpness()`

  `protected void`

  `calculateTimeMultiplier()`

  `boolean`

  `canBeActivated()`

  `ItemBodyLocation`

  `canBeEquipped()`

  `boolean`

  `canBeRemote()`

  `boolean`

  `canEmitLight()`

  `boolean`

  `canHaveOrigin()`

  `boolean`

  `CanStack(InventoryItem item)`

  `(package private) boolean`

  `CanStackNoTemp(InventoryItem item)`

  `boolean`

  `canStoreWater()`

  `void`

  `checkSyncItemFields(boolean b)`

  `void`

  `copyBloodLevelFrom(InventoryItem item)`

  `void`

  `copyClothing(InventoryItem otherItem)`

  `void`

  `copyConditionModData(InventoryItem other)`

  `void`

  `copyConditionStatesFrom(InventoryItem otherItem)`

  `void`

  `copyModData(se.krka.kahlua.vm.KahluaTable modData)`

  `void`

  `CopyModData(se.krka.kahlua.vm.KahluaTable defaultModData)`

  `void`

  `copyTimesHeadRepairedFrom(InventoryItem item)`

  `void`

  `copyTimesHeadRepairedTo(InventoryItem item)`

  `void`

  `copyTimesRepairedFrom(InventoryItem item)`

  `void`

  `copyTimesRepairedTo(InventoryItem item)`

  `IsoDeadBody`

  `createAndStoreDefaultDeadBody(IsoGridSquare square)`

  `InventoryItem`

  `createCloneItem()`

  `private IsoDeadBody`

  `createDefaultDeadBody(IsoGridSquare square)`

  `boolean`

  `damageCheck()`

  `boolean`

  `damageCheck(int skill)`

  `boolean`

  `damageCheck(int skill,
  float multiplier)`

  `boolean`

  `damageCheck(int skill,
  float multiplier,
  boolean maintenance)`

  `boolean`

  `damageCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped)`

  `boolean`

  `damageCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped,
  IsoGameCharacter character)`

  `void`

  `doBreakSound()`

  `void`

  `doBuildingStash()`

  `void`

  `doDamagedSound()`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `DoTooltipEmbedded(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layoutOverride,
  int offsetY)`

  `private float`

  `drawTooltipItemTexture(ObjectTooltip tooltipUI,
  Texture tex,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a)`

  `InventoryItem`

  `emptyLiquid()`

  `boolean`

  `finishupdate()`

  `float`

  `getA()`

  `float`

  `getActualWeight()`

  `float`

  `getActualWeightUnmodded()`

  `float`

  `getAge()`

  `String`

  `getAimReleaseSound()`

  `float`

  `getAlcoholPower()`

  `String`

  `getAlternateModelName()`

  `AmmoType`

  `getAmmoType()`

  `String`

  `getAnimalFeedType()`

  `AnimalTracks`

  `getAnimalTracks()`

  `int`

  `getAttachedSlot()`

  `String`

  `getAttachedSlotType()`

  `String`

  `getAttachedToModel()`

  `String`

  `getAttachmentReplacement()`

  `ArrayList<String>`

  `getAttachmentsProvided()`

  `String`

  `getAttachmentType()`

  `float`

  `getB()`

  `float`

  `getBandagePower()`

  `float`

  `getBlood(BloodBodyPartType bodyPartType)`

  `ArrayList<BloodClothingType>`

  `getBloodClothingType()`

  `float`

  `getBloodLevel()`

  `float`

  `getBloodLevelAdjustedHigh()`

  `float`

  `getBloodLevelAdjustedLow()`

  `ItemBodyLocation`

  `getBodyLocation()`

  `List<zombie.scripting.objects.BookSubject>`

  `getBookSubjects()`

  `float`

  `getBoredomChange()`

  `float`

  `getBrakeForce()`

  `String`

  `getBreakSound()`

  `String`

  `getBringToBearSound()`

  `String`

  `getBulletHitArmourSound()`

  `String`

  `getBurntString()`

  `ByteBuffer`

  `getByteData()`

  `String`

  `getCategory()`

  `int`

  `getChanceToSpawnDamaged()`

  `String`

  `getCleanString(float weight)`

  `ClothingItem`

  `getClothingItem()`

  `ArrayList<String>`

  `getClothingItemExtra()`

  `ArrayList<String>`

  `getClothingItemExtraOption()`

  `String`

  `getClothingItemName()`

  `Color`

  `getColor()`

  `float`

  `getColorBlue()`

  `float`

  `getColorGreen()`

  `ColorInfo`

  `getColorInfo()`

  `float`

  `getColorRed()`

  `int`

  `getCondition()`

  `int`

  `getConditionLowerChance()`

  `float`

  `getConditionLowerNormal()`

  `float`

  `getConditionLowerOffroad()`

  `int`

  `getConditionMax()`

  `String`

  `getConsolidateOption()`

  `ItemContainer`

  `getContainer()`

  `int`

  `getContainerX()`

  `int`

  `getContainerY()`

  `float`

  `getContentsWeight()`

  `String`

  `getCookedString()`

  `float`

  `getCookingTime()`

  `int`

  `getCount()`

  `String`

  `getCountDownSound()`

  `zombie.scripting.objects.CoverType`

  `getCoverType()`

  `int`

  `getCurrentAmmoCount()`

  `float`

  `getCurrentCondition()`

  `int`

  `getCurrentUses()`

  `float`

  `getCurrentUsesFloat()`

  `String`

  `getCustomMenuOption()`

  `String`

  `getDamagedSound()`

  `IsoDeadBody`

  `getDeadBodyObject()`

  `String`

  `getDescription()`

  `String`

  `getDigType()`

  `float`

  `getDirt(BloodBodyPartType bodyPartType)`

  `float`

  `getDiscomfortModifier()`

  `String`

  `getDisplayCategory()`

  `String`

  `getDisplayName()`

  `String`

  `getDoubleClickRecipe()`

  `String`

  `getDropSound()`

  `float`

  `getDurability()`

  `int`

  `getEatTime()`

  `String`

  `getEatType()`

  `float`

  `getEngineLoudness()`

  `long`

  `getEntityNetID()`

  `IsoGameCharacter`

  `getEquipParent()`

  `float`

  `getEquippedWeight()`

  `String`

  `getEquipSound()`

  `String`

  `getEvolvedRecipeName()`

  `String`

  `getExplosionSound()`

  `InventoryItem`

  `getExtinguishedItem()`

  `ArrayList<String>`

  `getExtraItems()`

  `float`

  `getExtraItemsWeight()`

  `String`

  `getFabricType()`

  `float`

  `getFatigueChange()`

  `String`

  `getFileName()`

  `String`

  `getFillFromDispenserSound()`

  `String`

  `getFillFromLakeSound()`

  `String`

  `getFillFromTapSound()`

  `String`

  `getFillFromToiletSound()`

  `float`

  `getFireFuelRatio()`

  `FluidContainer`

  `getFluidContainerFromSelfOrWorldItem()`

  `int`

  `getFoodSicknessChange()`

  `String`

  `getFullType()`

  `float`

  `getG()`

  `GameEntityType`

  `getGameEntityType()`

  `ArrayList<String>`

  `getGunType()`

  `String`

  `getGunTypeString()`

  `int`

  `getHaveBeenRepaired()`

  `int`

  `getHeadCondition()`

  `int`

  `getHeadConditionLowerChance()`

  `float`

  `getHeadConditionLowerChanceMultiplier()`

  `int`

  `getHeadConditionMax()`

  `float`

  `getHearingModifier()`

  `float`

  `getHotbarEquippedWeight()`

  `Texture`

  `getIcon()`

  `ArrayList<String>`

  `getIconsForTexture()`

  `int`

  `getID()`

  `int`

  `getInverseCoughProbability()`

  `int`

  `getInverseCoughProbabilitySmoker()`

  `float`

  `getInvHeat()`

  `boolean`

  `getIsCraftingConsumed()`

  `String`

  `getItemAfterCleaning()`

  `float`

  `getItemCapacity()`

  `float`

  `getItemHeat()`

  `zombie.scripting.objects.ItemReplacement`

  `getItemReplacementPrimaryHand()`

  `zombie.scripting.objects.ItemReplacement`

  `getItemReplacementSecondHand()`

  `private ItemType`

  `getItemType()`

  `String`

  `getItemWhenDry()`

  `float`

  `getJobDelta()`

  `String`

  `getJobType()`

  `int`

  `getKeyId()`

  `float`

  `getLastAged()`

  `int`

  `getLightDistance()`

  `float`

  `getLightStrength()`

  `String`

  `getLootType()`

  `String`

  `getLuaCreate()`

  `List<zombie.scripting.objects.MagazineSubject>`

  `getMagazineSubjects()`

  `int`

  `getMaintenanceMod()`

  `int`

  `getMaintenanceMod(boolean isEquipped)`

  `int`

  `getMaintenanceMod(boolean isEquipped,
  IsoGameCharacter character)`

  `int`

  `getMaintenanceMod(IsoGameCharacter character)`

  `String`

  `getMakeUpType()`

  `int`

  `getMaxAmmo()`

  `int`

  `getMaxCapacity()`

  `int`

  `getMaxMilk()`

  `float`

  `getMaxSharpness()`

  `int`

  `getMaxUses()`

  `int`

  `getMechanicType()`

  `MediaData`

  `getMediaData()`

  `byte`

  `getMediaType()`

  `float`

  `getMeltingTime()`

  `float`

  `getMetalValue()`

  `String`

  `getMilkReplaceItem()`

  `float`

  `getMinutesToBurn()`

  `float`

  `getMinutesToCook()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `int`

  `getModelIndex()`

  `String`

  `getModID()`

  `String`

  `getModName()`

  `String`

  `getModule()`

  `String`

  `getName()`

  `String`

  `getName(IsoPlayer player)`

  `static String`

  `getNoRecipesModDataString()`

  `int`

  `getOffAge()`

  `int`

  `getOffAgeMax()`

  `String`

  `getOffString()`

  `String`

  `getOnBreak()`

  `String`

  `getOpeningRecipe()`

  `int`

  `getOriginX()`

  `int`

  `getOriginY()`

  `int`

  `getOriginZ()`

  `ItemContainer`

  `getOutermostContainer()`

  `IsoGameCharacter`

  `getOwner()`

  `protected IsoPlayer`

  `getOwnerPlayer(ItemContainer container)`

  `String`

  `getPlaceMultipleSound()`

  `String`

  `getPlaceOneSound()`

  `IsoPlayer`

  `getPlayer()`

  `String`

  `getPourLiquidOnGroundSound()`

  `String`

  `getPourType()`

  `IsoGameCharacter`

  `getPreviousOwner()`

  `int`

  `getQuality()`

  `float`

  `getR()`

  `short`

  `getRecordedMediaIndex()`

  `float`

  `getReduceInfectionPower()`

  `short`

  `getRegistry_id()`

  `int`

  `getRemoteControlID()`

  `int`

  `getRemoteRange()`

  `String`

  `getReplaceOnExtinguish()`

  `String`

  `getReplaceOnUse()`

  `String`

  `getReplaceOnUseFullType()`

  `String`

  `getReplaceOnUseOn()`

  `String`

  `getReplaceOnUseOnString()`

  `String`

  `getReplaceType(String key)`

  `String`

  `getReplaceTypes()`

  `HashMap<String,String>`

  `getReplaceTypesMap()`

  `ArrayList<String>`

  `getRequireInHandOrInventory()`

  `ArrayList<String>`

  `getResearchableRecipes()`

  `ArrayList<String>`

  `getResearchableRecipes(IsoGameCharacter chr)`

  `ItemContainer`

  `getRightClickContainer()`

  `float`

  `getScore(SurvivorDesc desc)`

  `Item`

  `getScriptItem()`

  `float`

  `getSharpness()`

  `float`

  `getSharpnessIncrement()`

  `float`

  `getSharpnessMultiplier()`

  `float`

  `getShoutMultiplier()`

  `String`

  `getShoutType()`

  `String`

  `getSoundByID(String id)`

  `String`

  `getSoundLimiterGroupID()`

  `String`

  `getSoundParameter(String parameterName)`

  `IsoGridSquare`

  `getSquare()`

  `int`

  `getStashChance()`

  `String`

  `getStashMap()`

  `String`

  `getStaticModel()`

  `String`

  `getStaticModelException()`

  `ArrayList<String>`

  `getStaticModelsByIndex()`

  `float`

  `getStrainModifier()`

  `float`

  `getStressChange()`

  `String`

  `getStringItemType()`

  `float`

  `getSuspensionCompression()`

  `float`

  `getSuspensionDamping()`

  `String`

  `getSwingAnim()`

  `Set<ItemTag>`

  `getTags()`

  `ArrayList<IsoObject>`

  `getTaken()`

  `Texture`

  `getTex()`

  `Texture`

  `getTexture()`

  `Texture`

  `getTextureBurnt()`

  `Texture`

  `getTextureColorMask()`

  `Texture`

  `getTextureCooked()`

  `Texture`

  `getTextureFluidMask()`

  `Texture`

  `getTexturerotten()`

  `int`

  `getTimesHeadRepaired()`

  `int`

  `getTimesRepaired()`

  `String`

  `getTooltip()`

  `float`

  `getTorchDot()`

  `String`

  `getType()`

  `String`

  `getUnCookedString()`

  `float`

  `getUnequippedWeight()`

  `String`

  `getUnequipSound()`

  `float`

  `getUnhappyChange()`

  `float`

  `getUseDelta()`

  `IsoGameCharacter`

  `getUser()`

  `int`

  `getUses()`

  Deprecated.

  `float`

  `getVisionModifier()`

  `ItemVisual`

  `getVisual()`

  `String`

  `getWeaponHitArmourSound()`

  `int`

  `getWeaponLevel()`

  `float`

  `getWeight()`

  `float`

  `getWetCooldown()`

  `float`

  `getWetness()`

  `float`

  `getWheelFriction()`

  `String`

  `getWithDrainable()`

  `String`

  `getWithoutDrainable()`

  `String`

  `getWorker()`

  `float`

  `getWorldAlpha()`

  `IsoWorldInventoryObject`

  `getWorldItem()`

  `String`

  `getWorldObjectSprite()`

  `String`

  `getWorldStaticItem()`

  `String`

  `getWorldStaticModel()`

  `ArrayList<String>`

  `getWorldStaticModelsByIndex()`

  `String`

  `getWorldTexture()`

  `float`

  `getWorldXRotation()`

  `float`

  `getWorldYRotation()`

  `float`

  `getWorldZRotation()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `private void`

  `handleRainTaint(Food food)`

  `private void`

  `handleWorldItemInRain()`

  `boolean`

  `hasBeenHeard(IsoPlayer player)`

  `boolean`

  `hasBeenSeen(IsoPlayer player)`

  `boolean`

  `hasBlood()`

  `boolean`

  `hasDirt()`

  `boolean`

  `hasHeadCondition()`

  `boolean`

  `hasMetal()`

  `boolean`

  `hasModData()`

  `boolean`

  `hasOrigin()`

  `boolean`

  `hasQuality()`

  `boolean`

  `hasReplaceType(String key)`

  `boolean`

  `hasResearchableRecipes()`

  `boolean`

  `hasSharpness()`

  `boolean`

  `hasTag(ItemTag itemTag)`

  `boolean`

  `hasTag(ItemTag... tags)`

  `boolean`

  `hasTimesHeadRepaired()`

  `boolean`

  `hasWorldItem()`

  `boolean`

  `haveExtraItems()`

  `boolean`

  `headConditionCheck()`

  `boolean`

  `headConditionCheck(int skill)`

  `boolean`

  `headConditionCheck(int skill,
  float multiplier)`

  `boolean`

  `headConditionCheck(int skill,
  float multiplier,
  boolean maintenance)`

  `boolean`

  `headConditionCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped)`

  `private boolean`

  `headConditionCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped,
  IsoGameCharacter character)`

  `float`

  `HowRotten()`

  `void`

  `incrementCondition(int increment)`

  `void`

  `inheritFoodAgeFrom(InventoryItem otherFood)`

  `void`

  `inheritOlderFoodAge(InventoryItem otherFood)`

  `void`

  `initialiseItem()`

  `boolean`

  `is(ItemKey... item)`

  `boolean`

  `isActivated()`

  `boolean`

  `isAlcoholic()`

  `boolean`

  `isAlwaysWelcomeGift()`

  `boolean`

  `isAnimalCorpse()`

  `boolean`

  `isAnimalFeed()`

  `boolean`

  `isBeingFilled()`

  `boolean`

  `isBloody()`

  `boolean`

  `isBodyLocation(ItemBodyLocation itemBodyLocation)`

  `boolean`

  `isBroken()`

  `boolean`

  `isBurnt()`

  `boolean`

  `isCanBandage()`

  `boolean`

  `IsClothing()`

  `boolean`

  `isConditionAffectsCapacity()`

  `boolean`

  `isCookable()`

  `boolean`

  `isCooked()`

  `boolean`

  `isCustomColor()`

  `boolean`

  `isCustomName()`

  `boolean`

  `isCustomWeight()`

  `boolean`

  `isDamaged()`

  `boolean`

  `isDisappearOnUse()`

  `boolean`

  `isDoingExtendedPlacement()`

  `boolean`

  `IsDrainable()`

  `boolean`

  `isDull()`

  `boolean`

  `isEmittingLight()`

  `boolean`

  `isEmptyOfFluid()`

  `boolean`

  `isEntityValid()`

  `boolean`

  `isEquipped()`

  `boolean`

  `isEquippedNoSprint()`

  `boolean`

  `isFakeEquipped()`

  `boolean`

  `isFakeEquipped(IsoGameCharacter character)`

  `boolean`

  `isFavorite()`

  `boolean`

  `isFavouriteRecipeInput(IsoPlayer player)`

  `boolean`

  `isFishingLure()`

  `boolean`

  `isFluidContainer()`

  `boolean`

  `isFood()`

  `boolean`

  `IsFood()`

  `boolean`

  `isForceDropHeavyItem()`

  Returns TRUE if this classified is a heavy item.

  `boolean`

  `isFullOfFluid()`

  `boolean`

  `isHidden()`

  `boolean`

  `isHumanCorpse()`

  `boolean`

  `isInfected()`

  `boolean`

  `isInitialised()`

  `boolean`

  `isInLocalPlayerInventory()`

  `boolean`

  `isInPlayerInventory()`

  `boolean`

  `isInsideBagOnSquare(IsoGridSquare square)`

  `boolean`

  `IsInventoryContainer()`

  `boolean`

  `isIsCookable()`

  `boolean`

  `isItemType(ItemType itemType)`

  `boolean`

  `isKeepOnDeplete()`

  `boolean`

  `isKeyRing()`

  `boolean`

  `IsLiterature()`

  `boolean`

  `IsMap()`

  `boolean`

  `isMemento()`

  `boolean`

  `isNoRecipes(IsoPlayer player)`

  `boolean`

  `isOnGroundOnSquare(IsoGridSquare square)`

  `boolean`

  `isOnGroundOrInsideBagOnSquare(IsoGridSquare square)`

  `boolean`

  `isProtectFromRainWhileEquipped()`

  `boolean`

  `isPureWater(boolean includeTainted)`

  `boolean`

  `isRecordedMedia()`

  `boolean`

  `isRemoteController()`

  `boolean`

  `isRequiresEquippedBothHands()`

  `boolean`

  `IsRotten()`

  `boolean`

  `isSealed()`

  `boolean`

  `isSharpenable()`

  `boolean`

  `isSpice()`

  `boolean`

  `isTorchCone()`

  `boolean`

  `isTrap()`

  `boolean`

  `isTwoHandWeapon()`

  `boolean`

  `isUnwanted(IsoPlayer player)`

  `boolean`

  `isUseWorldItem()`

  `boolean`

  `isVanilla()`

  `boolean`

  `isVisualAid()`

  `boolean`

  `isWaterOnlySource()`

  `boolean`

  `isWaterSource()`

  `boolean`

  `IsWeapon()`

  `boolean`

  `isWet()`

  `boolean`

  `isWorn()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `IsoDeadBody`

  `loadCorpseFromByteData(IsoGridSquare square)`

  `(package private) static InventoryItem`

  `LoadFromFile(DataInputStream input)`

  `static InventoryItem`

  `loadItem(ByteBuffer input,
  int worldVersion)`

  `static InventoryItem`

  `loadItem(ByteBuffer input,
  int worldVersion,
  boolean doSaveTypeCheck)`

  `static InventoryItem`

  `loadItem(ByteBuffer input,
  int worldVersion,
  boolean doSaveTypeCheck,
  InventoryItem i)`

  `boolean`

  `ModDataMatches(InventoryItem item)`

  `void`

  `monogramAfterDescriptor(SurvivorDesc desc)`

  `void`

  `nameAfterDescriptor(SurvivorDesc desc)`

  `void`

  `OnAddedToContainer(ItemContainer container)`

  `void`

  `OnBeforeRemoveFromContainer(ItemContainer container)`

  `void`

  `onBreak()`

  `void`

  `playActivateDeactivateSound()`

  `void`

  `playActivateSound()`

  `void`

  `playDeactivateSound()`

  `protected void`

  `playSoundOnPlayer(String soundName)`

  `protected void`

  `playSoundOnPlayer(SoundKey soundKey)`

  `void`

  `randomizeCondition()`

  `void`

  `randomizeGeneralCondition()`

  `void`

  `randomizeHeadCondition()`

  `void`

  `randomizeSharpness()`

  `void`

  `randomizeWorldZRotation()`

  `void`

  `reduceCondition()`

  `void`

  `reduceHeadCondition()`

  `private void`

  `reduceSharpness()`

  `void`

  `registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter limiter)`

  `void`

  `Remove()`

  `static boolean`

  `RemoveFromContainer(InventoryItem item)`

  `void`

  `researchRecipes(IsoGameCharacter character)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `final void`

  `saveWithSize(ByteBuffer output,
  boolean net)`

  `void`

  `setActivated(boolean activated)`

  `void`

  `setActivatedRemote(boolean activated)`

  `void`

  `setActualWeight(float actualWeight)`

  `void`

  `setAge(float age)`

  `void`

  `setAlcoholic(boolean alcoholic)`

  `void`

  `setAlcoholPower(float alcoholPower)`

  `void`

  `setAmmoType(AmmoType ammoType)`

  `void`

  `setAnimalTracks(AnimalTracks animalTracks)`

  `void`

  `setAttachedSlot(int attachedSlot)`

  `void`

  `setAttachedSlotType(String attachedSlotType)`

  `void`

  `setAttachedToModel(String attachedToModel)`

  `void`

  `setAttachmentReplacement(String attachementReplacement)`

  `void`

  `setAttachmentsProvided(ArrayList<String> attachmentsProvided)`

  `void`

  `setAttachmentType(String attachmentType)`

  `void`

  `setAutoAge()`

  `void`

  `setBandagePower(float bandagePower)`

  `void`

  `setBeingFilled(boolean v)`

  `void`

  `setBlood(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setBloodClothingType(ArrayList<BloodClothingType> bloodClothingType)`

  `void`

  `setBloodLevel(float level)`

  `void`

  `setBoredomChange(float boredomChange)`

  `void`

  `setBrakeForce(float brakeForce)`

  `void`

  `setBreakSound(String breakSound)`

  `void`

  `setBroken(boolean broken)`

  `void`

  `setBurnt(boolean burnt)`

  `void`

  `setBurntString(String burntString)`

  `void`

  `setCanBeActivated(boolean activatedItem)`

  `void`

  `setCanBeRemote(boolean canBeRemote)`

  `void`

  `setChanceToSpawnDamaged(int chanceToSpawnDamaged)`

  `void`

  `setColor(Color color)`

  `void`

  `setColorBlue(float colorBlue)`

  `void`

  `setColorGreen(float colorGreen)`

  `void`

  `setColorRed(float colorRed)`

  `void`

  `setCondition(int condition)`

  `void`

  `setCondition(int condition,
  boolean doSound)`

  `void`

  `setConditionFrom(InventoryItem item)`

  `void`

  `setConditionFromHeadCondition(InventoryItem item)`

  `void`

  `setConditionFromModData(InventoryItem other)`

  `void`

  `setConditionLowerNormal(float conditionLowerNormal)`

  `void`

  `setConditionLowerOffroad(float conditionLowerOffroad)`

  `void`

  `setConditionMax(int conditionMax)`

  `void`

  `setConditionNoSound(int condition)`

  `void`

  `setConditionTo(InventoryItem item)`

  `void`

  `setConditionWhileLoading(int condition)`

  `void`

  `setContainer(ItemContainer container)`

  `void`

  `SetContainerPosition(int x,
  int y)`

  `void`

  `setContainerX(int containerX)`

  `void`

  `setContainerY(int containerY)`

  `void`

  `setCooked(boolean cooked)`

  `void`

  `setCookedString(String cookedString)`

  `void`

  `setCookingTime(float cookingTime)`

  `void`

  `setCount(int count)`

  `void`

  `setCountDownSound(String sound)`

  `void`

  `setCurrentAmmoCount(int ammo)`

  `void`

  `setCurrentUses(int newuses)`

  `void`

  `setCurrentUsesFloat(float newUses)`

  `void`

  `setCurrentUsesFrom(InventoryItem other)`

  `void`

  `setCustomColor(boolean customColor)`

  `void`

  `setCustomMenuOption(String customMenuOption)`

  `void`

  `setCustomName(boolean customName)`

  `void`

  `setCustomWeight(boolean custom)`

  `void`

  `setDescription(String description)`

  `void`

  `setDirt(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setDisplayCategory(String displayCategory)`

  `void`

  `setDoingExtendedPlacement(boolean enable)`

  `void`

  `setDurability(float durability)`

  `void`

  `setEngineLoudness(float engineLoudness)`

  `void`

  `setEquipParent(IsoGameCharacter parent)`

  `void`

  `setEquipParent(IsoGameCharacter parent,
  boolean register)`

  `void`

  `setEvolvedRecipeName(String evolvedRecipeName)`

  `void`

  `setExplosionSound(String explosionSound)`

  `void`

  `setFatigueChange(float fatigueChange)`

  `void`

  `setFavorite(boolean favorite)`

  `void`

  `setFavorite(boolean favorite,
  boolean isSyncNeeded)`

  `void`

  `setFoodSicknessChange(int foodSicknessChange)`

  `void`

  `setGunType(ArrayList<String> gunType)`

  `void`

  `setHaveBeenRepaired(int haveBeenRepaired)`

  `void`

  `setHeadCondition(int value)`

  `void`

  `setHeadConditionFromCondition(InventoryItem item)`

  `void`

  `setIcon(Texture texture)`

  `void`

  `setIconsForTexture(ArrayList<String> iconsForTexture)`

  `void`

  `setID(int itemId)`

  `void`

  `setInfected(boolean infected)`

  `void`

  `setInitialised(boolean initialised)`

  `void`

  `setInverseCoughProbability(int inverseCoughProbability)`

  `void`

  `setInverseCoughProbabilitySmoker(int inverseCoughProbabilitySmoker)`

  `void`

  `setIsCookable(boolean isCookable)`

  `void`

  `setIsCraftingConsumed(boolean craftingConsumed)`

  `void`

  `setItemCapacity(float capacity)`

  `void`

  `setItemHeat(float itemHeat)`

  `void`

  `setItemType(ItemType itemType)`

  `void`

  `setItemWhenDry(String itemWhenDry)`

  `void`

  `setJobDelta(float delta)`

  `void`

  `setJobType(String type)`

  `void`

  `setKeyId(int keyId)`

  `void`

  `setLastAged(float time)`

  `void`

  `setLightDistance(int lightDistance)`

  `void`

  `setLightStrength(float lightStrength)`

  `void`

  `setMaxAmmo(int maxAmmoCount)`

  `void`

  `setMaxCapacity(int maxCapacity)`

  `void`

  `setMediaType(byte b)`

  `void`

  `setMeltingTime(float meltingTime)`

  `void`

  `setMetalValue(float metalValue)`

  `void`

  `setMinutesToBurn(float minutesToBurn)`

  `void`

  `setMinutesToCook(float minutesToCook)`

  `void`

  `setModelIndex(int index)`

  `void`

  `setModule(String module)`

  `void`

  `setName(String name)`

  `void`

  `setNoRecipes(IsoPlayer player,
  Boolean noCrafting)`

  `void`

  `setOffAge(int offAge)`

  `void`

  `setOffAgeMax(int offAgeMax)`

  `void`

  `setOffString(String offString)`

  `boolean`

  `setOrigin(int x,
  int y)`

  `boolean`

  `setOrigin(int x,
  int y,
  int z)`

  `boolean`

  `setOrigin(IsoGridSquare sq)`

  `void`

  `setOriginX(int value)`

  `void`

  `setOriginY(int value)`

  `void`

  `setOriginZ(int value)`

  `void`

  `setPreviousOwner(IsoGameCharacter previousOwner)`

  `void`

  `setQuality(int value)`

  `void`

  `setRecordedMediaData(MediaData data)`

  `void`

  `setRecordedMediaIndex(short id)`

  `void`

  `setRecordedMediaIndexInteger(int id)`

  `void`

  `setReduceInfectionPower(float reduceInfectionPower)`

  `void`

  `setRegistry_id(Item itemscript)`

  `void`

  `setRemoteControlID(int remoteControlId)`

  `void`

  `setRemoteController(boolean remoteController)`

  `void`

  `setRemoteRange(int remoteRange)`

  `void`

  `setReplaceOnUse(String replaceOnUse)`

  `void`

  `setReplaceOnUseOn(String replaceOnUseOn)`

  `void`

  `setRequireInHandOrInventory(ArrayList<String> requireInHandOrInventory)`

  `void`

  `setRightClickContainer(ItemContainer rightClickContainer)`

  `void`

  `setScriptItem(Item scriptItem)`

  `void`

  `setSharpness(float value)`

  `void`

  `setSharpnessFrom(InventoryItem item)`

  `void`

  `setStashChance(int stashChance)`

  `void`

  `setStashMap(String stashMap)`

  `void`

  `setStaticModel(String model)`

  `void`

  `setStaticModel(ModelKey model)`

  `void`

  `setStaticModelsByIndex(ArrayList<String> staticModelsByIndex)`

  `void`

  `setStressChange(float stressChange)`

  `void`

  `setSuspensionCompression(float suspensionCompression)`

  `void`

  `setSuspensionDamping(float suspensionDamping)`

  `void`

  `setTaken(ArrayList<IsoObject> taken)`

  `void`

  `setTexture(Texture texture)`

  `void`

  `setTextureBurnt(Texture textureBurnt)`

  `void`

  `setTextureColorMask(String tex)`

  `void`

  `setTextureCooked(Texture textureCooked)`

  `void`

  `setTextureFluidMask(String tex)`

  `void`

  `setTexturerotten(Texture texturerotten)`

  `void`

  `setTimesHeadRepaired(int haveBeenRepaired)`

  `void`

  `setTimesRepaired(int haveBeenRepaired)`

  `void`

  `setTooltip(String tooltip)`

  `void`

  `setTorchCone(boolean isTorchCone)`

  `void`

  `setType(String type)`

  `void`

  `setUnCookedString(String unCookedString)`

  `void`

  `setUnhappyChange(float unhappyChange)`

  `void`

  `setUnwanted(IsoPlayer player,
  boolean unwanted)`

  `void`

  `setUseDelta(float useDelta)`

  `void`

  `setUses(int newuses)`

  Deprecated.

  `void`

  `setUsesFrom(InventoryItem other)`

  `void`

  `setWeight(float weight)`

  `void`

  `setWet(boolean isWet)`

  `void`

  `setWetCooldown(float wetCooldown)`

  `void`

  `setWheelFriction(float wheelFriction)`

  `void`

  `setWorker(String worker)`

  `void`

  `setWorldAlpha(float worldAlpha)`

  `void`

  `setWorldItem(IsoWorldInventoryObject w)`

  `void`

  `setWorldScale(float scale)`

  `void`

  `setWorldStaticItem(String model)`

  `void`

  `setWorldStaticModel(String model)`

  `void`

  `setWorldStaticModel(ModelKey model)`

  `void`

  `setWorldStaticModelsByIndex(ArrayList<String> staticModelsByIndex)`

  `void`

  `setWorldTexture(String worldTexture)`

  `void`

  `setWorldXRotation(float rot)`

  `void`

  `setWorldYRotation(float rot)`

  `void`

  `setWorldZRotation(float rot)`

  `boolean`

  `sharpnessCheck()`

  `boolean`

  `sharpnessCheck(int skill)`

  `boolean`

  `sharpnessCheck(int skill,
  float multiplier)`

  `boolean`

  `sharpnessCheck(int skill,
  float multiplier,
  boolean maintenance)`

  `boolean`

  `sharpnessCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped)`

  `private boolean`

  `sharpnessCheck(int skill,
  float multiplier,
  boolean maintenance,
  boolean isEquipped,
  IsoGameCharacter character)`

  `private boolean`

  `shouldUpdateInRain()`

  `boolean`

  `shouldUpdateInWorld()`

  `private void`

  `soakTowel()`

  `protected void`

  `stopEquippedAndActivatedSound()`

  `void`

  `stopSoundOnPlayer()`

  `void`

  `storeInByteData(IsoObject o)`

  `void`

  `SynchSpawn()`

  `void`

  `synchWithVisual()`

  `void`

  `syncItemFields()`

  `String`

  `toString()`

  `String`

  `tryGetWorldStaticModelByIndex(int index)`

  `private IsoDeadBody`

  `tryLoadCorpseFromByteData(IsoGridSquare square)`

  `void`

  `unsealIfNotFull()`

  `void`

  `update()`

  `void`

  `updateAge()`

  `void`

  `updateEquippedAndActivatedSound()`

  `void`

  `updateEquippedAndActivatedSound(BaseSoundEmitter emitter)`

  `void`

  `updateSound(BaseSoundEmitter emitter)`

  `void`

  `updateSound(BaseSoundEmitter emitter,
  zombie.audio.SoundLimiterParams params)`

  `void`

  `Use()`

  `void`

  `Use(boolean bCrafting)`

  `void`

  `Use(boolean bCrafting,
  boolean bInContainer,
  boolean bNeedSync)`

  `void`

  `UseAndSync()`

  `boolean`

  `UseForCrafting(int uses)`

  `void`

  `UseItem()`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### tempBuffer

    private static final [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") tempBuffer
  + ### DEFAULT\_USES

    protected static final int DEFAULT\_USES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.InventoryItem.DEFAULT_USES)
  + ### SERVER\_MAX\_UPDATE\_DELTA\_MS

    private static final long SERVER\_MAX\_UPDATE\_DELTA\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.InventoryItem.SERVER_MAX_UPDATE_DELTA_MS)
  + ### COMPASS\_TOOLTIP

    private static final [EnumMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumMap.html "class or interface in java.util")<[IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso"), [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> COMPASS\_TOOLTIP
  + ### previousOwner

    protected [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") previousOwner
  + ### scriptItem

    protected [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem
  + ### itemType

    protected [ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType
  + ### container

    protected [ItemContainer](ItemContainer.html "class in zombie.inventory") container
  + ### containerX

    protected int containerX
  + ### containerY

    protected int containerY
  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### replaceOnUse

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnUse
  + ### replaceOnUseFullType

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnUseFullType
  + ### conditionMax

    protected int conditionMax
  + ### rightClickContainer

    protected [ItemContainer](ItemContainer.html "class in zombie.inventory") rightClickContainer
  + ### texture

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### texturerotten

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") texturerotten
  + ### textureCooked

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") textureCooked
  + ### textureBurnt

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") textureBurnt
  + ### type

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### fullType

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType
  + ### uses

    protected int uses
  + ### age

    protected float age
  + ### lastAged

    protected float lastAged
  + ### isCookable

    protected boolean isCookable
  + ### cookingTime

    protected float cookingTime
  + ### minutesToCook

    protected float minutesToCook
  + ### minutesToBurn

    protected float minutesToBurn
  + ### cooked

    public boolean cooked
  + ### burnt

    protected boolean burnt
  + ### offAge

    protected int offAge
  + ### offAgeMax

    protected int offAgeMax
  + ### weight

    protected float weight
  + ### actualWeight

    protected float actualWeight
  + ### worldTexture

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldTexture
  + ### description

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### condition

    protected int condition
  + ### offString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") offString
  + ### freshString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") freshString
  + ### staleString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") staleString
  + ### cookedString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cookedString
  + ### toastedString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toastedString
  + ### grilledString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grilledString
  + ### unCookedString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") unCookedString
  + ### frozenString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") frozenString
  + ### burntString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") burntString
  + ### emptyString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") emptyString
  + ### module

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module
  + ### boredomChange

    protected float boredomChange
  + ### unhappyChange

    protected float unhappyChange
  + ### stressChange

    protected float stressChange
  + ### foodSicknessChange

    protected int foodSicknessChange
  + ### inverseCoughProbability

    protected int inverseCoughProbability
  + ### inverseCoughProbabilitySmoker

    protected int inverseCoughProbabilitySmoker
  + ### taken

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")> taken
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### replaceOnUseOn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnUseOn
  + ### col

    public [Color](../core/Color.html "class in zombie.core") col
  + ### canStack

    public boolean canStack
  + ### activated

    private boolean activated
  + ### isTorchCone

    private boolean isTorchCone
  + ### lightDistance

    private int lightDistance
  + ### count

    private int count
  + ### fatigueChange

    public float fatigueChange
  + ### worldItem

    public [IsoWorldInventoryObject](../iso/objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") worldItem
  + ### deadBodyObject

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") deadBodyObject
  + ### customMenuOption

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customMenuOption
  + ### tooltip

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip
  + ### displayCategory

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayCategory
  + ### haveBeenRepaired

    private int haveBeenRepaired
  + ### broken

    private boolean broken
  + ### originalName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalName
  + ### id

    public int id
  + ### requiresEquippedBothHands

    public boolean requiresEquippedBothHands
  + ### byteData

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") byteData
  + ### extraItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> extraItems
  + ### customName

    private boolean customName
  + ### breakSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breakSound
  + ### alcoholic

    protected boolean alcoholic
  + ### alcoholPower

    private float alcoholPower
  + ### bandagePower

    private float bandagePower
  + ### reduceInfectionPower

    private float reduceInfectionPower
  + ### customWeight

    private boolean customWeight
  + ### customColor

    private boolean customColor
  + ### keyId

    private int keyId
  + ### remoteController

    private boolean remoteController
  + ### canBeRemote

    private boolean canBeRemote
  + ### remoteControlId

    private int remoteControlId
  + ### remoteRange

    private int remoteRange
  + ### colorRed

    private float colorRed
  + ### colorGreen

    private float colorGreen
  + ### colorBlue

    private float colorBlue
  + ### countDownSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") countDownSound
  + ### explosionSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") explosionSound
  + ### equipParent

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") equipParent
  + ### evolvedRecipeName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") evolvedRecipeName
  + ### metalValue

    private float metalValue
  + ### itemHeat

    private float itemHeat
  + ### meltingTime

    private float meltingTime
  + ### worker

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worker
  + ### isWet

    private boolean isWet
  + ### wetCooldown

    private float wetCooldown
  + ### itemWhenDry

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemWhenDry
  + ### favorite

    private boolean favorite
  + ### requireInHandOrInventory

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> requireInHandOrInventory
  + ### stashMap

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stashMap
  + ### zombieInfected

    private boolean zombieInfected
  + ### itemCapacity

    private float itemCapacity
  + ### maxCapacity

    private int maxCapacity
  + ### brakeForce

    private float brakeForce
  + ### durability

    private float durability
  + ### chanceToSpawnDamaged

    private int chanceToSpawnDamaged
  + ### conditionLowerNormal

    private float conditionLowerNormal
  + ### conditionLowerOffroad

    private float conditionLowerOffroad
  + ### wheelFriction

    private float wheelFriction
  + ### suspensionDamping

    private float suspensionDamping
  + ### suspensionCompression

    private float suspensionCompression
  + ### engineLoudness

    private float engineLoudness
  + ### visual

    protected [ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual") visual
  + ### staticModel

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") staticModel
  + ### iconsForTexture

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> iconsForTexture
  + ### bloodClothingType

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](../characterTextures/BloodClothingType.html "enum class in zombie.characterTextures")> bloodClothingType
  + ### stashChance

    private int stashChance
  + ### ammoType

    private [AmmoType](../scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType
  + ### maxAmmo

    private int maxAmmo
  + ### currentAmmoCount

    private int currentAmmoCount
  + ### gunType

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> gunType
  + ### gunTypeDisplayName

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> gunTypeDisplayName
  + ### attachmentType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentType
  + ### attachmentsProvided

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> attachmentsProvided
  + ### attachedSlot

    private int attachedSlot
  + ### attachedSlotType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachedSlotType
  + ### attachmentReplacement

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentReplacement
  + ### attachedToModel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachedToModel
  + ### alternateModelName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alternateModelName
  + ### registryId

    private short registryId
  + ### worldScale

    public float worldScale
  + ### worldXRotation

    public float worldXRotation
  + ### worldYRotation

    public float worldYRotation
  + ### worldZRotation

    public float worldZRotation
  + ### worldAlpha

    public float worldAlpha
  + ### recordedMediaIndex

    private short recordedMediaIndex
  + ### mediaType

    private byte mediaType
  + ### isInitialised

    private boolean isInitialised
  + ### atlasTexture

    public zombie.core.skinnedmodel.model.WorldItemAtlas.ItemTexture atlasTexture
  + ### textureColorMask

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") textureColorMask
  + ### textureFluidMask

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") textureFluidMask
  + ### animalTracks

    private [AnimalTracks](../characters/animals/AnimalTracks.html "class in zombie.characters.animals") animalTracks
  + ### staticModelsByIndex

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> staticModelsByIndex
  + ### worldStaticModelsByIndex

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> worldStaticModelsByIndex
  + ### doingExtendedPlacement

    private boolean doingExtendedPlacement
  + ### modelIndex

    private int modelIndex
  + ### maxTextLength

    private final int maxTextLength

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.InventoryItem.maxTextLength)
  + ### equippedAndActivatedPlayer

    private [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") equippedAndActivatedPlayer
  + ### equippedAndActivatedSound

    private long equippedAndActivatedSound
  + ### isCraftingConsumed

    private boolean isCraftingConsumed
  + ### jobDelta

    public float jobDelta
  + ### jobType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") jobType
  + ### mainCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mainCategory
  + ### canBeActivated

    private boolean canBeActivated
  + ### lightStrength

    private float lightStrength
  + ### closeKillMove

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") closeKillMove
  + ### useDelta

    private float useDelta
  + ### lastUpdateMs

    private long lastUpdateMs
  + ### timeMultiplier

    protected float timeMultiplier
  + ### beingFilled

    private boolean beingFilled
* Constructor Details
  -------------------

  + ### InventoryItem

    public InventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### InventoryItem

    public InventoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### getCoverType

    public zombie.scripting.objects.CoverType getCoverType()
  + ### getBookSubjects

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.scripting.objects.BookSubject> getBookSubjects()
  + ### getMagazineSubjects

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.scripting.objects.MagazineSubject> getMagazineSubjects()
  + ### getWorldItem

    public [IsoWorldInventoryObject](../iso/objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") getWorldItem()
  + ### hasWorldItem

    public boolean hasWorldItem()
  + ### isOnGroundOnSquare

    public boolean isOnGroundOnSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isInsideBagOnSquare

    public boolean isInsideBagOnSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isOnGroundOrInsideBagOnSquare

    public boolean isOnGroundOrInsideBagOnSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### setEquipParent

    public void setEquipParent([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") parent)
  + ### setEquipParent

    public void setEquipParent([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") parent,
    boolean register)
  + ### getEquipParent

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getEquipParent()
  + ### getBringToBearSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBringToBearSound()
  + ### getAimReleaseSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAimReleaseSound()
  + ### getEquipSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEquipSound()
  + ### getUnequipSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUnequipSound()
  + ### getDropSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDropSound()
  + ### setWorldItem

    public void setWorldItem([IsoWorldInventoryObject](../iso/objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") w)
  + ### setJobDelta

    public void setJobDelta(float delta)
  + ### getJobDelta

    public float getJobDelta()
  + ### setJobType

    public void setJobType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getJobType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getJobType()
  + ### hasModData

    public boolean hasModData()
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### storeInByteData

    public void storeInByteData([IsoObject](../iso/IsoObject.html "class in zombie.iso") o)
  + ### getByteData

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") getByteData()
  + ### loadCorpseFromByteData

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") loadCorpseFromByteData([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### tryLoadCorpseFromByteData

    private [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") tryLoadCorpseFromByteData([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isForceDropHeavyItem

    public boolean isForceDropHeavyItem()

    Returns TRUE if this classified is a heavy item.
    - A Generator, or an item that has the HeavyItem tag.
    - A Human Corpse
    - A living animal.
    Heavy items are dropped during Force Drop Heavy Items actions.
    When grabbing from an inventory, Heavy items can only be picked up one at a time.
  + ### isHumanCorpse

    public boolean isHumanCorpse()
  + ### isAnimalCorpse

    public boolean isAnimalCorpse()
  + ### createDefaultDeadBody

    private [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createDefaultDeadBody([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
    throws [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang")

    Throws:
    :   `Throwable`
  + ### createAndStoreDefaultDeadBody

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createAndStoreDefaultDeadBody([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isRequiresEquippedBothHands

    public boolean isRequiresEquippedBothHands()
  + ### getA

    public float getA()
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### getTex

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTex()
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### UseForCrafting

    public boolean UseForCrafting(int uses)
  + ### IsRotten

    public boolean IsRotten()
  + ### HowRotten

    public float HowRotten()
  + ### CanStack

    public boolean CanStack([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### ModDataMatches

    public boolean ModDataMatches([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### DoTooltipEmbedded

    public void DoTooltipEmbedded([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../ui/ObjectTooltip.Layout.html "class in zombie.ui") layoutOverride,
    int offsetY)
  + ### drawTooltipItemTexture

    private float drawTooltipItemTexture([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a)
  + ### getCleanString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCleanString(float weight)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### SetContainerPosition

    public void SetContainerPosition(int x,
    int y)
  + ### Use

    public void Use()
  + ### UseAndSync

    public void UseAndSync()
  + ### UseItem

    public void UseItem()
  + ### Use

    public void Use(boolean bCrafting)
  + ### Use

    public void Use(boolean bCrafting,
    boolean bInContainer,
    boolean bNeedSync)
  + ### shouldUpdateInRain

    private boolean shouldUpdateInRain()
  + ### shouldUpdateInWorld

    public boolean shouldUpdateInWorld()
  + ### handleRainTaint

    private void handleRainTaint([Food](types/Food.html "class in zombie.inventory.types") food)
  + ### soakTowel

    private void soakTowel()
  + ### handleWorldItemInRain

    private void handleWorldItemInRain()
  + ### calculateTimeMultiplier

    protected void calculateTimeMultiplier()
  + ### update

    public void update()
  + ### finishupdate

    public boolean finishupdate()
  + ### getSoundLimiterGroupID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundLimiterGroupID()
  + ### registerWithSoundLimiter

    public void registerWithSoundLimiter(zombie.audio.SoundInstanceLimiter limiter)
  + ### updateSound

    public void updateSound([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### updateSound

    public void updateSound([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter,
    zombie.audio.SoundLimiterParams params)
  + ### stopSoundOnPlayer

    public void stopSoundOnPlayer()
  + ### updateEquippedAndActivatedSound

    public void updateEquippedAndActivatedSound([BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### updateEquippedAndActivatedSound

    public void updateEquippedAndActivatedSound()
  + ### stopEquippedAndActivatedSound

    protected void stopEquippedAndActivatedSound()
  + ### playActivateSound

    public void playActivateSound()
  + ### playDeactivateSound

    public void playDeactivateSound()
  + ### playActivateDeactivateSound

    public void playActivateDeactivateSound()
  + ### playSoundOnPlayer

    protected void playSoundOnPlayer([SoundKey](../scripting/objects/SoundKey.html "class in zombie.scripting.objects") soundKey)
  + ### playSoundOnPlayer

    protected void playSoundOnPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### getOwnerPlayer

    protected [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getOwnerPlayer([ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### is

    public boolean is([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects")... item)
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") loadItem([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") loadItem([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean doSaveTypeCheck)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") loadItem([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean doSaveTypeCheck,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") i)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### createCloneItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") createCloneItem()
  + ### IsFood

    public boolean IsFood()
  + ### IsWeapon

    public boolean IsWeapon()
  + ### IsDrainable

    public boolean IsDrainable()
  + ### IsLiterature

    public boolean IsLiterature()
  + ### IsClothing

    public boolean IsClothing()
  + ### IsInventoryContainer

    public boolean IsInventoryContainer()
  + ### IsMap

    public boolean IsMap()
  + ### LoadFromFile

    static [InventoryItem](InventoryItem.html "class in zombie.inventory") LoadFromFile([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getOutermostContainer

    public [ItemContainer](ItemContainer.html "class in zombie.inventory") getOutermostContainer()
  + ### isInLocalPlayerInventory

    public boolean isInLocalPlayerInventory()
  + ### isInPlayerInventory

    public boolean isInPlayerInventory()
  + ### getItemReplacementPrimaryHand

    public zombie.scripting.objects.ItemReplacement getItemReplacementPrimaryHand()
  + ### getItemReplacementSecondHand

    public zombie.scripting.objects.ItemReplacement getItemReplacementSecondHand()
  + ### getClothingItem

    public [ClothingItem](../core/skinnedmodel/population/ClothingItem.html "class in zombie.core.skinnedmodel.population") getClothingItem()
  + ### getAlternateModelName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAlternateModelName()
  + ### getVisual

    public [ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual") getVisual()
  + ### allowRandomTint

    public boolean allowRandomTint()
  + ### synchWithVisual

    public void synchWithVisual()
  + ### getContainerX

    public int getContainerX()
  + ### setContainerX

    public void setContainerX(int containerX)
  + ### getContainerY

    public int getContainerY()
  + ### setContainerY

    public void setContainerY(int containerY)
  + ### isDisappearOnUse

    public boolean isDisappearOnUse()
  + ### isKeepOnDeplete

    public boolean isKeepOnDeplete()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getReplaceOnUse

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnUse()
  + ### setReplaceOnUse

    public void setReplaceOnUse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnUse)
  + ### getReplaceOnUseFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnUseFullType()
  + ### getConditionMax

    public int getConditionMax()
  + ### setConditionMax

    public void setConditionMax(int conditionMax)
  + ### getRightClickContainer

    public [ItemContainer](ItemContainer.html "class in zombie.inventory") getRightClickContainer()
  + ### setRightClickContainer

    public void setRightClickContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") rightClickContainer)
  + ### getSwingAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSwingAnim()
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### getIcon

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getIcon()
  + ### setTexture

    public void setTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") texture)
  + ### setIcon

    public void setIcon([Texture](../core/textures/Texture.html "class in zombie.core.textures") texture)
  + ### getTexturerotten

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexturerotten()
  + ### setTexturerotten

    public void setTexturerotten([Texture](../core/textures/Texture.html "class in zombie.core.textures") texturerotten)
  + ### getTextureCooked

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTextureCooked()
  + ### setTextureCooked

    public void setTextureCooked([Texture](../core/textures/Texture.html "class in zombie.core.textures") textureCooked)
  + ### getTextureBurnt

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTextureBurnt()
  + ### setTextureBurnt

    public void setTextureBurnt([Texture](../core/textures/Texture.html "class in zombie.core.textures") textureBurnt)
  + ### setType

    public void setType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### setCurrentUses

    public void setCurrentUses(int newuses)
  + ### getCurrentUses

    public int getCurrentUses()
  + ### setCurrentUsesFrom

    public void setCurrentUsesFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") other)
  + ### getMaxUses

    public int getMaxUses()
  + ### getCurrentUsesFloat

    public float getCurrentUsesFloat()
  + ### setCurrentUsesFloat

    public void setCurrentUsesFloat(float newUses)
  + ### getUseDelta

    public float getUseDelta()
  + ### setUseDelta

    public void setUseDelta(float useDelta)
  + ### getUses

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getUses()

    Deprecated.
  + ### setUses

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setUses(int newuses)

    Deprecated.
  + ### setUsesFrom

    public void setUsesFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") other)
  + ### getAge

    public float getAge()
  + ### setAge

    public void setAge(float age)
  + ### getLastAged

    public float getLastAged()
  + ### setLastAged

    public void setLastAged(float time)
  + ### updateAge

    public void updateAge()
  + ### setAutoAge

    public void setAutoAge()
  + ### isIsCookable

    public boolean isIsCookable()
  + ### isCookable

    public boolean isCookable()
  + ### setIsCookable

    public void setIsCookable(boolean isCookable)
  + ### getCookingTime

    public float getCookingTime()
  + ### setCookingTime

    public void setCookingTime(float cookingTime)
  + ### getMinutesToCook

    public float getMinutesToCook()
  + ### setMinutesToCook

    public void setMinutesToCook(float minutesToCook)
  + ### getMinutesToBurn

    public float getMinutesToBurn()
  + ### setMinutesToBurn

    public void setMinutesToBurn(float minutesToBurn)
  + ### isCooked

    public boolean isCooked()
  + ### setCooked

    public void setCooked(boolean cooked)
  + ### isBurnt

    public boolean isBurnt()
  + ### setBurnt

    public void setBurnt(boolean burnt)
  + ### getOffAge

    public int getOffAge()
  + ### setOffAge

    public void setOffAge(int offAge)
  + ### getOffAgeMax

    public int getOffAgeMax()
  + ### setOffAgeMax

    public void setOffAgeMax(int offAgeMax)
  + ### getWeight

    public float getWeight()
  + ### setWeight

    public void setWeight(float weight)
  + ### getActualWeight

    public float getActualWeight()
  + ### getActualWeightUnmodded

    public float getActualWeightUnmodded()
  + ### setActualWeight

    public void setActualWeight(float actualWeight)
  + ### getWorldTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldTexture()
  + ### setWorldTexture

    public void setWorldTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldTexture)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### incrementCondition

    public void incrementCondition(int increment)
  + ### getCondition

    public int getCondition()
  + ### setCondition

    public void setCondition(int condition,
    boolean doSound)
  + ### doBreakSound

    public void doBreakSound()
  + ### doDamagedSound

    public void doDamagedSound()
  + ### setCondition

    public void setCondition(int condition)
  + ### setConditionNoSound

    public void setConditionNoSound(int condition)
  + ### setConditionWhileLoading

    public void setConditionWhileLoading(int condition)
  + ### getOffString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOffString()
  + ### setOffString

    public void setOffString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") offString)
  + ### getCookedString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCookedString()
  + ### setCookedString

    public void setCookedString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cookedString)
  + ### getUnCookedString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUnCookedString()
  + ### setUnCookedString

    public void setUnCookedString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") unCookedString)
  + ### getBurntString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBurntString()
  + ### setBurntString

    public void setBurntString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") burntString)
  + ### getModule

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModule()
  + ### setModule

    public void setModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module)
  + ### isAlwaysWelcomeGift

    public boolean isAlwaysWelcomeGift()
  + ### isCanBandage

    public boolean isCanBandage()
  + ### getBoredomChange

    public float getBoredomChange()
  + ### setBoredomChange

    public void setBoredomChange(float boredomChange)
  + ### getUnhappyChange

    public float getUnhappyChange()
  + ### setUnhappyChange

    public void setUnhappyChange(float unhappyChange)
  + ### getStressChange

    public float getStressChange()
  + ### setStressChange

    public void setStressChange(float stressChange)
  + ### getFoodSicknessChange

    public int getFoodSicknessChange()
  + ### setFoodSicknessChange

    public void setFoodSicknessChange(int foodSicknessChange)
  + ### getInverseCoughProbability

    public int getInverseCoughProbability()
  + ### setInverseCoughProbability

    public void setInverseCoughProbability(int inverseCoughProbability)
  + ### getInverseCoughProbabilitySmoker

    public int getInverseCoughProbabilitySmoker()
  + ### setInverseCoughProbabilitySmoker

    public void setInverseCoughProbabilitySmoker(int inverseCoughProbabilitySmoker)
  + ### getTags

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects")> getTags()
  + ### hasTag

    public boolean hasTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects")... tags)
  + ### hasTag

    public boolean hasTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getTaken

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")> getTaken()
  + ### setTaken

    public void setTaken([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")> taken)
  + ### setReplaceOnUseOn

    public void setReplaceOnUseOn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") replaceOnUseOn)
  + ### getReplaceOnUseOn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnUseOn()
  + ### getReplaceOnUseOnString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnUseOnString()
  + ### getReplaceTypes

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceTypes()
  + ### getReplaceTypesMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getReplaceTypesMap()
  + ### getReplaceType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### hasReplaceType

    public boolean hasReplaceType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### isWaterSource

    public boolean isWaterSource()
  + ### isWaterOnlySource

    public boolean isWaterOnlySource()
  + ### CanStackNoTemp

    boolean CanStackNoTemp([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### CopyModData

    public void CopyModData(se.krka.kahlua.vm.KahluaTable defaultModData)
  + ### copyModData

    public void copyModData(se.krka.kahlua.vm.KahluaTable modData)
  + ### getCount

    public int getCount()
  + ### setCount

    public void setCount(int count)
  + ### isActivated

    public boolean isActivated()
  + ### setActivated

    public void setActivated(boolean activated)
  + ### setActivatedRemote

    public void setActivatedRemote(boolean activated)
  + ### setCanBeActivated

    public void setCanBeActivated(boolean activatedItem)
  + ### canBeActivated

    public boolean canBeActivated()
  + ### setLightStrength

    public void setLightStrength(float lightStrength)
  + ### getLightStrength

    public float getLightStrength()
  + ### isTorchCone

    public boolean isTorchCone()
  + ### setTorchCone

    public void setTorchCone(boolean isTorchCone)
  + ### getTorchDot

    public float getTorchDot()
  + ### getLightDistance

    public int getLightDistance()
  + ### setLightDistance

    public void setLightDistance(int lightDistance)
  + ### canEmitLight

    public boolean canEmitLight()
  + ### isEmittingLight

    public boolean isEmittingLight()
  + ### canStoreWater

    public boolean canStoreWater()
  + ### getFatigueChange

    public float getFatigueChange()
  + ### setFatigueChange

    public void setFatigueChange(float fatigueChange)
  + ### getCurrentCondition

    public float getCurrentCondition()
  + ### setColor

    public void setColor([Color](../core/Color.html "class in zombie.core") color)
  + ### getColor

    public [Color](../core/Color.html "class in zombie.core") getColor()
  + ### getColorInfo

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getColorInfo()
  + ### isTwoHandWeapon

    public boolean isTwoHandWeapon()
  + ### getCustomMenuOption

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomMenuOption()
  + ### setCustomMenuOption

    public void setCustomMenuOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customMenuOption)
  + ### setTooltip

    public void setTooltip([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip)
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()
  + ### getDisplayCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayCategory()
  + ### setDisplayCategory

    public void setDisplayCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayCategory)
  + ### getHaveBeenRepaired

    public int getHaveBeenRepaired()
  + ### setHaveBeenRepaired

    public void setHaveBeenRepaired(int haveBeenRepaired)
  + ### getTimesRepaired

    public int getTimesRepaired()
  + ### setTimesRepaired

    public void setTimesRepaired(int haveBeenRepaired)
  + ### copyTimesRepairedFrom

    public void copyTimesRepairedFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### copyTimesRepairedTo

    public void copyTimesRepairedTo([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getTimesHeadRepaired

    public int getTimesHeadRepaired()
  + ### setTimesHeadRepaired

    public void setTimesHeadRepaired(int haveBeenRepaired)
  + ### hasTimesHeadRepaired

    public boolean hasTimesHeadRepaired()
  + ### copyTimesHeadRepairedFrom

    public void copyTimesHeadRepairedFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### copyTimesHeadRepairedTo

    public void copyTimesHeadRepairedTo([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### isBroken

    public boolean isBroken()
  + ### setBroken

    public void setBroken(boolean broken)
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### isTrap

    public boolean isTrap()
  + ### addExtraItem

    public void addExtraItem([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") key)
  + ### addExtraItem

    public void addExtraItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### haveExtraItems

    public boolean haveExtraItems()
  + ### getExtraItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getExtraItems()
  + ### getExtraItemsWeight

    public float getExtraItemsWeight()
  + ### isCustomName

    public boolean isCustomName()
  + ### setCustomName

    public void setCustomName(boolean customName)
  + ### isFishingLure

    public boolean isFishingLure()
  + ### copyConditionModData

    public void copyConditionModData([InventoryItem](InventoryItem.html "class in zombie.inventory") other)
  + ### setConditionFromModData

    public void setConditionFromModData([InventoryItem](InventoryItem.html "class in zombie.inventory") other)
  + ### getBreakSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBreakSound()
  + ### setBreakSound

    public void setBreakSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breakSound)
  + ### getPlaceOneSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlaceOneSound()
  + ### getPlaceMultipleSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlaceMultipleSound()
  + ### getSoundByID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundByID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### setBeingFilled

    public void setBeingFilled(boolean v)
  + ### isBeingFilled

    public boolean isBeingFilled()
  + ### getFillFromDispenserSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFillFromDispenserSound()
  + ### getFillFromLakeSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFillFromLakeSound()
  + ### getFillFromTapSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFillFromTapSound()
  + ### getFillFromToiletSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFillFromToiletSound()
  + ### getPourLiquidOnGroundSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPourLiquidOnGroundSound()
  + ### isAlcoholic

    public boolean isAlcoholic()
  + ### setAlcoholic

    public void setAlcoholic(boolean alcoholic)
  + ### getAlcoholPower

    public float getAlcoholPower()
  + ### setAlcoholPower

    public void setAlcoholPower(float alcoholPower)
  + ### getBandagePower

    public float getBandagePower()
  + ### setBandagePower

    public void setBandagePower(float bandagePower)
  + ### getReduceInfectionPower

    public float getReduceInfectionPower()
  + ### setReduceInfectionPower

    public void setReduceInfectionPower(float reduceInfectionPower)
  + ### saveWithSize

    public final void saveWithSize([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isCustomWeight

    public boolean isCustomWeight()
  + ### setCustomWeight

    public void setCustomWeight(boolean custom)
  + ### getContentsWeight

    public float getContentsWeight()
  + ### getHotbarEquippedWeight

    public float getHotbarEquippedWeight()
  + ### getEquippedWeight

    public float getEquippedWeight()
  + ### getUnequippedWeight

    public float getUnequippedWeight()
  + ### isEquipped

    public boolean isEquipped()
  + ### getUser

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getUser()
  + ### getOwner

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getOwner()
  + ### getKeyId

    public int getKeyId()
  + ### setKeyId

    public void setKeyId(int keyId)
  + ### isRemoteController

    public boolean isRemoteController()
  + ### setRemoteController

    public void setRemoteController(boolean remoteController)
  + ### canBeRemote

    public boolean canBeRemote()
  + ### setCanBeRemote

    public void setCanBeRemote(boolean canBeRemote)
  + ### getRemoteControlID

    public int getRemoteControlID()
  + ### setRemoteControlID

    public void setRemoteControlID(int remoteControlId)
  + ### getRemoteRange

    public int getRemoteRange()
  + ### setRemoteRange

    public void setRemoteRange(int remoteRange)
  + ### getExplosionSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getExplosionSound()
  + ### setExplosionSound

    public void setExplosionSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") explosionSound)
  + ### getCountDownSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCountDownSound()
  + ### setCountDownSound

    public void setCountDownSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### getColorRed

    public float getColorRed()
  + ### setColorRed

    public void setColorRed(float colorRed)
  + ### getColorGreen

    public float getColorGreen()
  + ### setColorGreen

    public void setColorGreen(float colorGreen)
  + ### getColorBlue

    public float getColorBlue()
  + ### setColorBlue

    public void setColorBlue(float colorBlue)
  + ### getEvolvedRecipeName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEvolvedRecipeName()
  + ### setEvolvedRecipeName

    public void setEvolvedRecipeName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") evolvedRecipeName)
  + ### getMetalValue

    public float getMetalValue()
  + ### setMetalValue

    public void setMetalValue(float metalValue)
  + ### getItemHeat

    public float getItemHeat()
  + ### setItemHeat

    public void setItemHeat(float itemHeat)
  + ### getInvHeat

    public float getInvHeat()
  + ### getMeltingTime

    public float getMeltingTime()
  + ### setMeltingTime

    public void setMeltingTime(float meltingTime)
  + ### getWorker

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorker()
  + ### setWorker

    public void setWorker([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worker)
  + ### getID

    public int getID()
  + ### setID

    public void setID(int itemId)
  + ### isWet

    public boolean isWet()
  + ### setWet

    public void setWet(boolean isWet)
  + ### getWetCooldown

    public float getWetCooldown()
  + ### setWetCooldown

    public void setWetCooldown(float wetCooldown)
  + ### getItemWhenDry

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemWhenDry()
  + ### setItemWhenDry

    public void setItemWhenDry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemWhenDry)
  + ### isFavorite

    public boolean isFavorite()
  + ### setFavorite

    public void setFavorite(boolean favorite)
  + ### setFavorite

    public void setFavorite(boolean favorite,
    boolean isSyncNeeded)
  + ### getRequireInHandOrInventory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRequireInHandOrInventory()
  + ### setRequireInHandOrInventory

    public void setRequireInHandOrInventory([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> requireInHandOrInventory)
  + ### isCustomColor

    public boolean isCustomColor()
  + ### setCustomColor

    public void setCustomColor(boolean customColor)
  + ### doBuildingStash

    public void doBuildingStash()
  + ### setStashMap

    public void setStashMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stashMap)
  + ### getStashMap

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStashMap()
  + ### getMechanicType

    public int getMechanicType()
  + ### getItemCapacity

    public float getItemCapacity()
  + ### setItemCapacity

    public void setItemCapacity(float capacity)
  + ### getMaxCapacity

    public int getMaxCapacity()
  + ### setMaxCapacity

    public void setMaxCapacity(int maxCapacity)
  + ### isConditionAffectsCapacity

    public boolean isConditionAffectsCapacity()
  + ### getBrakeForce

    public float getBrakeForce()
  + ### setBrakeForce

    public void setBrakeForce(float brakeForce)
  + ### getDurability

    public float getDurability()
  + ### setDurability

    public void setDurability(float durability)
  + ### getChanceToSpawnDamaged

    public int getChanceToSpawnDamaged()
  + ### setChanceToSpawnDamaged

    public void setChanceToSpawnDamaged(int chanceToSpawnDamaged)
  + ### getConditionLowerNormal

    public float getConditionLowerNormal()
  + ### setConditionLowerNormal

    public void setConditionLowerNormal(float conditionLowerNormal)
  + ### getConditionLowerOffroad

    public float getConditionLowerOffroad()
  + ### setConditionLowerOffroad

    public void setConditionLowerOffroad(float conditionLowerOffroad)
  + ### getWheelFriction

    public float getWheelFriction()
  + ### setWheelFriction

    public void setWheelFriction(float wheelFriction)
  + ### getSuspensionDamping

    public float getSuspensionDamping()
  + ### setSuspensionDamping

    public void setSuspensionDamping(float suspensionDamping)
  + ### getSuspensionCompression

    public float getSuspensionCompression()
  + ### setSuspensionCompression

    public void setSuspensionCompression(float suspensionCompression)
  + ### setInfected

    public void setInfected(boolean infected)
  + ### isInfected

    public boolean isInfected()
  + ### getEngineLoudness

    public float getEngineLoudness()
  + ### setEngineLoudness

    public void setEngineLoudness(float engineLoudness)
  + ### getStaticModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStaticModel()
  + ### setStaticModel

    public void setStaticModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### setStaticModel

    public void setStaticModel([ModelKey](../scripting/objects/ModelKey.html "class in zombie.scripting.objects") model)
  + ### getStaticModelException

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStaticModelException()
  + ### getIconsForTexture

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getIconsForTexture()
  + ### setIconsForTexture

    public void setIconsForTexture([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> iconsForTexture)
  + ### getScore

    public float getScore([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### getPreviousOwner

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getPreviousOwner()
  + ### setPreviousOwner

    public void setPreviousOwner([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") previousOwner)
  + ### getScriptItem

    public [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") getScriptItem()
  + ### setScriptItem

    public void setScriptItem([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem)
  + ### getItemType

    private [ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") getItemType()
  + ### setItemType

    public void setItemType([ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### isItemType

    public boolean isItemType([ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### getContainer

    public [ItemContainer](ItemContainer.html "class in zombie.inventory") getContainer()
  + ### setContainer

    public void setContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### getBloodClothingType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](../characterTextures/BloodClothingType.html "enum class in zombie.characterTextures")> getBloodClothingType()
  + ### setBloodClothingType

    public void setBloodClothingType([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](../characterTextures/BloodClothingType.html "enum class in zombie.characterTextures")> bloodClothingType)
  + ### setBlood

    public void setBlood([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### getBlood

    public float getBlood([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setDirt

    public void setDirt([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### getDirt

    public float getDirt([BloodBodyPartType](../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getClothingItemName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClothingItemName()
  + ### getStashChance

    public int getStashChance()
  + ### setStashChance

    public void setStashChance(int stashChance)
  + ### getEatType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEatType()
  + ### getPourType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPourType()
  + ### isUseWorldItem

    public boolean isUseWorldItem()
  + ### getAmmoType

    public [AmmoType](../scripting/objects/AmmoType.html "class in zombie.scripting.objects") getAmmoType()
  + ### setAmmoType

    public void setAmmoType([AmmoType](../scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType)
  + ### getMaxAmmo

    public int getMaxAmmo()
  + ### setMaxAmmo

    public void setMaxAmmo(int maxAmmoCount)
  + ### getCurrentAmmoCount

    public int getCurrentAmmoCount()
  + ### setCurrentAmmoCount

    public void setCurrentAmmoCount(int ammo)
  + ### getGunType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGunType()
  + ### setGunType

    public void setGunType([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> gunType)
  + ### hasBlood

    public boolean hasBlood()
  + ### hasDirt

    public boolean hasDirt()
  + ### getAttachmentType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachmentType()
  + ### setAttachmentType

    public void setAttachmentType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentType)
  + ### getAttachedSlot

    public int getAttachedSlot()
  + ### setAttachedSlot

    public void setAttachedSlot(int attachedSlot)
  + ### getAttachmentsProvided

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAttachmentsProvided()
  + ### setAttachmentsProvided

    public void setAttachmentsProvided([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> attachmentsProvided)
  + ### getAttachedSlotType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachedSlotType()
  + ### setAttachedSlotType

    public void setAttachedSlotType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachedSlotType)
  + ### getAttachmentReplacement

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachmentReplacement()
  + ### setAttachmentReplacement

    public void setAttachmentReplacement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachementReplacement)
  + ### getAttachedToModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachedToModel()
  + ### setAttachedToModel

    public void setAttachedToModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachedToModel)
  + ### getFabricType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFabricType()
  + ### getStringItemType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStringItemType()
  + ### isProtectFromRainWhileEquipped

    public boolean isProtectFromRainWhileEquipped()
  + ### isEquippedNoSprint

    public boolean isEquippedNoSprint()
  + ### getBodyLocation

    public [ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") getBodyLocation()
  + ### isBodyLocation

    public boolean isBodyLocation([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### getMakeUpType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMakeUpType()
  + ### isHidden

    public boolean isHidden()
  + ### getConsolidateOption

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getConsolidateOption()
  + ### getClothingItemExtra

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClothingItemExtra()
  + ### getClothingItemExtraOption

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClothingItemExtraOption()
  + ### getWorldStaticItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldStaticItem()
  + ### getWorldStaticModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldStaticModel()
  + ### setWorldStaticItem

    public void setWorldStaticItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### setWorldStaticModel

    public void setWorldStaticModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### setWorldStaticModel

    public void setWorldStaticModel([ModelKey](../scripting/objects/ModelKey.html "class in zombie.scripting.objects") model)
  + ### setRegistry\_id

    public void setRegistry\_id([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") itemscript)
  + ### getRegistry\_id

    public short getRegistry\_id()
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getModName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModName()
  + ### isVanilla

    public boolean isVanilla()
  + ### getRecordedMediaIndex

    public short getRecordedMediaIndex()
  + ### setRecordedMediaIndex

    public void setRecordedMediaIndex(short id)
  + ### setRecordedMediaIndexInteger

    public void setRecordedMediaIndexInteger(int id)
  + ### isRecordedMedia

    public boolean isRecordedMedia()
  + ### getMediaData

    public [MediaData](../radio/media/MediaData.html "class in zombie.radio.media") getMediaData()
  + ### getMediaType

    public byte getMediaType()
  + ### setMediaType

    public void setMediaType(byte b)
  + ### setRecordedMediaData

    public void setRecordedMediaData([MediaData](../radio/media/MediaData.html "class in zombie.radio.media") data)
  + ### setWorldZRotation

    public void setWorldZRotation(float rot)
  + ### getWorldZRotation

    public float getWorldZRotation()
  + ### setWorldYRotation

    public void setWorldYRotation(float rot)
  + ### getWorldYRotation

    public float getWorldYRotation()
  + ### setWorldXRotation

    public void setWorldXRotation(float rot)
  + ### getWorldXRotation

    public float getWorldXRotation()
  + ### randomizeWorldZRotation

    public void randomizeWorldZRotation()
  + ### setWorldScale

    public void setWorldScale(float scale)
  + ### getLuaCreate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaCreate()
  + ### isInitialised

    public boolean isInitialised()
  + ### setInitialised

    public void setInitialised(boolean initialised)
  + ### initialiseItem

    public void initialiseItem()
  + ### getMilkReplaceItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMilkReplaceItem()
  + ### getMaxMilk

    public int getMaxMilk()
  + ### isAnimalFeed

    public boolean isAnimalFeed()
  + ### getAnimalFeedType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalFeedType()
  + ### getDigType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDigType()
  + ### getSoundParameter

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSoundParameter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName)
  + ### isWorn

    public boolean isWorn()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getTextureColorMask

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTextureColorMask()
  + ### getTextureFluidMask

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTextureFluidMask()
  + ### setTextureColorMask

    public void setTextureColorMask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### setTextureFluidMask

    public void setTextureFluidMask([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in class `GameEntity`
  + ### getGameEntityType

    public [GameEntityType](../entity/GameEntityType.html "enum class in zombie.entity") getGameEntityType()

    Specified by:
    :   `getGameEntityType` in class `GameEntity`
  + ### getEntityNetID

    public long getEntityNetID()

    Specified by:
    :   `getEntityNetID` in class `GameEntity`
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in class `GameEntity`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in class `GameEntity`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in class `GameEntity`
  + ### isEntityValid

    public boolean isEntityValid()

    Specified by:
    :   `isEntityValid` in class `GameEntity`
  + ### RemoveFromContainer

    public static boolean RemoveFromContainer([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getAnimalTracks

    public [AnimalTracks](../characters/animals/AnimalTracks.html "class in zombie.characters.animals") getAnimalTracks()
  + ### setAnimalTracks

    public void setAnimalTracks([AnimalTracks](../characters/animals/AnimalTracks.html "class in zombie.characters.animals") animalTracks)
  + ### syncItemFields

    public void syncItemFields()
  + ### checkSyncItemFields

    public void checkSyncItemFields(boolean b)
  + ### getWithDrainable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWithDrainable()
  + ### getWithoutDrainable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWithoutDrainable()
  + ### getStaticModelsByIndex

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getStaticModelsByIndex()
  + ### setStaticModelsByIndex

    public void setStaticModelsByIndex([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> staticModelsByIndex)
  + ### getWorldStaticModelsByIndex

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getWorldStaticModelsByIndex()
  + ### setWorldStaticModelsByIndex

    public void setWorldStaticModelsByIndex([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> staticModelsByIndex)
  + ### tryGetWorldStaticModelByIndex

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tryGetWorldStaticModelByIndex(int index)
  + ### getModelIndex

    public int getModelIndex()
  + ### setModelIndex

    public void setModelIndex(int index)
  + ### getVisionModifier

    public float getVisionModifier()
  + ### getHearingModifier

    public float getHearingModifier()
  + ### getWorldObjectSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldObjectSprite()
  + ### getStrainModifier

    public float getStrainModifier()
  + ### getConditionLowerChance

    public int getConditionLowerChance()
  + ### setConditionFrom

    public void setConditionFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### setConditionTo

    public void setConditionTo([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### reduceCondition

    public void reduceCondition()
  + ### damageCheck

    public boolean damageCheck()
  + ### damageCheck

    public boolean damageCheck(int skill)
  + ### damageCheck

    public boolean damageCheck(int skill,
    float multiplier)
  + ### damageCheck

    public boolean damageCheck(int skill,
    float multiplier,
    boolean maintenance)
  + ### damageCheck

    public boolean damageCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped)
  + ### damageCheck

    public boolean damageCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### sharpnessCheck

    public boolean sharpnessCheck()
  + ### sharpnessCheck

    public boolean sharpnessCheck(int skill)
  + ### sharpnessCheck

    public boolean sharpnessCheck(int skill,
    float multiplier)
  + ### sharpnessCheck

    public boolean sharpnessCheck(int skill,
    float multiplier,
    boolean maintenance)
  + ### sharpnessCheck

    public boolean sharpnessCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped)
  + ### sharpnessCheck

    private boolean sharpnessCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### reduceSharpness

    private void reduceSharpness()
  + ### hasSharpness

    public boolean hasSharpness()
  + ### getSharpness

    public float getSharpness()
  + ### getMaxSharpness

    public float getMaxSharpness()
  + ### applyMaxSharpness

    public void applyMaxSharpness()
  + ### getSharpnessMultiplier

    public float getSharpnessMultiplier()
  + ### setSharpness

    public void setSharpness(float value)
  + ### setSharpnessFrom

    public void setSharpnessFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getSharpnessIncrement

    public float getSharpnessIncrement()
  + ### isDamaged

    public boolean isDamaged()
  + ### isDull

    public boolean isDull()
  + ### getMaintenanceMod

    public int getMaintenanceMod()
  + ### getMaintenanceMod

    public int getMaintenanceMod(boolean isEquipped)
  + ### getMaintenanceMod

    public int getMaintenanceMod([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getMaintenanceMod

    public int getMaintenanceMod(boolean isEquipped,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getWeaponLevel

    public int getWeaponLevel()
  + ### headConditionCheck

    public boolean headConditionCheck()
  + ### headConditionCheck

    public boolean headConditionCheck(int skill)
  + ### headConditionCheck

    public boolean headConditionCheck(int skill,
    float multiplier)
  + ### headConditionCheck

    public boolean headConditionCheck(int skill,
    float multiplier,
    boolean maintenance)
  + ### headConditionCheck

    public boolean headConditionCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped)
  + ### headConditionCheck

    private boolean headConditionCheck(int skill,
    float multiplier,
    boolean maintenance,
    boolean isEquipped,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getHeadConditionLowerChance

    public int getHeadConditionLowerChance()
  + ### getHeadConditionLowerChanceMultiplier

    public float getHeadConditionLowerChanceMultiplier()
  + ### reduceHeadCondition

    public void reduceHeadCondition()
  + ### hasHeadCondition

    public boolean hasHeadCondition()
  + ### getHeadCondition

    public int getHeadCondition()
  + ### getHeadConditionMax

    public int getHeadConditionMax()
  + ### setHeadCondition

    public void setHeadCondition(int value)
  + ### setHeadConditionFromCondition

    public void setHeadConditionFromCondition([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### setConditionFromHeadCondition

    public void setConditionFromHeadCondition([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### hasQuality

    public boolean hasQuality()
  + ### getQuality

    public int getQuality()
  + ### setQuality

    public void setQuality(int value)
  + ### getOnBreak

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnBreak()
  + ### onBreak

    public void onBreak()
  + ### getBloodLevelAdjustedLow

    public float getBloodLevelAdjustedLow()
  + ### getBloodLevelAdjustedHigh

    public float getBloodLevelAdjustedHigh()
  + ### getBloodLevel

    public float getBloodLevel()
  + ### setBloodLevel

    public void setBloodLevel(float level)
  + ### copyBloodLevelFrom

    public void copyBloodLevelFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### isBloody

    public boolean isBloody()
  + ### getDamagedSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDamagedSound()
  + ### getBulletHitArmourSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBulletHitArmourSound()
  + ### getWeaponHitArmourSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWeaponHitArmourSound()
  + ### getShoutType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShoutType()
  + ### getShoutMultiplier

    public float getShoutMultiplier()
  + ### getEatTime

    public int getEatTime()
  + ### isVisualAid

    public boolean isVisualAid()
  + ### getDiscomfortModifier

    public float getDiscomfortModifier()
  + ### hasMetal

    public boolean hasMetal()
  + ### getFireFuelRatio

    public float getFireFuelRatio()
  + ### getWetness

    public float getWetness()
  + ### isMemento

    public boolean isMemento()
  + ### nameAfterDescriptor

    public void nameAfterDescriptor([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### monogramAfterDescriptor

    public void monogramAfterDescriptor([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### getLootType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLootType()
  + ### getIsCraftingConsumed

    public boolean getIsCraftingConsumed()
  + ### setIsCraftingConsumed

    public void setIsCraftingConsumed(boolean craftingConsumed)
  + ### OnAddedToContainer

    public void OnAddedToContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### OnBeforeRemoveFromContainer

    public void OnBeforeRemoveFromContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### getDeadBodyObject

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") getDeadBodyObject()
  + ### isPureWater

    public boolean isPureWater(boolean includeTainted)
  + ### copyClothing

    public void copyClothing([InventoryItem](InventoryItem.html "class in zombie.inventory") otherItem)
  + ### inheritFoodAgeFrom

    public void inheritFoodAgeFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") otherFood)
  + ### inheritOlderFoodAge

    public void inheritOlderFoodAge([InventoryItem](InventoryItem.html "class in zombie.inventory") otherFood)
  + ### isFood

    public boolean isFood()
  + ### unsealIfNotFull

    public void unsealIfNotFull()
  + ### randomizeCondition

    public void randomizeCondition()
  + ### randomizeGeneralCondition

    public void randomizeGeneralCondition()
  + ### randomizeHeadCondition

    public void randomizeHeadCondition()
  + ### randomizeSharpness

    public void randomizeSharpness()
  + ### getFluidContainerFromSelfOrWorldItem

    public [FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") getFluidContainerFromSelfOrWorldItem()
  + ### isEmptyOfFluid

    public boolean isEmptyOfFluid()
  + ### isFullOfFluid

    public boolean isFullOfFluid()
  + ### isFluidContainer

    public boolean isFluidContainer()
  + ### isSpice

    public boolean isSpice()
  + ### isKeyRing

    public boolean isKeyRing()
  + ### isFakeEquipped

    public boolean isFakeEquipped([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### isFakeEquipped

    public boolean isFakeEquipped()
  + ### getItemAfterCleaning

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemAfterCleaning()
  + ### getResearchableRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getResearchableRecipes()
  + ### getResearchableRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getResearchableRecipes([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hasResearchableRecipes

    public boolean hasResearchableRecipes()
  + ### researchRecipes

    public void researchRecipes([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### hasOrigin

    public boolean hasOrigin()
  + ### canHaveOrigin

    public boolean canHaveOrigin()
  + ### setOrigin

    public boolean setOrigin([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### setOrigin

    public boolean setOrigin(int x,
    int y)
  + ### setOrigin

    public boolean setOrigin(int x,
    int y,
    int z)
  + ### setOriginX

    public void setOriginX(int value)
  + ### setOriginY

    public void setOriginY(int value)
  + ### setOriginZ

    public void setOriginZ(int value)
  + ### getOriginX

    public int getOriginX()
  + ### getOriginY

    public int getOriginY()
  + ### getOriginZ

    public int getOriginZ()
  + ### canBeEquipped

    public [ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") canBeEquipped()
  + ### getPlayer

    public [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPlayer()
  + ### getWorldAlpha

    public float getWorldAlpha()
  + ### setWorldAlpha

    public void setWorldAlpha(float worldAlpha)
  + ### Remove

    public void Remove()
  + ### SynchSpawn

    public void SynchSpawn()
  + ### isFavouriteRecipeInput

    public boolean isFavouriteRecipeInput([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### copyConditionStatesFrom

    public void copyConditionStatesFrom([InventoryItem](InventoryItem.html "class in zombie.inventory") otherItem)
  + ### getFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileName()
  + ### setDoingExtendedPlacement

    public void setDoingExtendedPlacement(boolean enable)
  + ### isDoingExtendedPlacement

    public boolean isDoingExtendedPlacement()
  + ### isNoRecipes

    public boolean isNoRecipes([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### setNoRecipes

    public void setNoRecipes([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") noCrafting)
  + ### getNoRecipesModDataString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNoRecipesModDataString()
  + ### isUnwanted

    public boolean isUnwanted([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### setUnwanted

    public void setUnwanted([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean unwanted)
  + ### emptyLiquid

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") emptyLiquid()
  + ### getOpeningRecipe

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOpeningRecipe()
  + ### getDoubleClickRecipe

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDoubleClickRecipe()
  + ### isSealed

    public boolean isSealed()
  + ### hasBeenSeen

    public boolean hasBeenSeen([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### hasBeenHeard

    public boolean hasBeenHeard([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getReplaceOnExtinguish

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getReplaceOnExtinguish()
  + ### getExtinguishedItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getExtinguishedItem()
  + ### isSharpenable

    public boolean isSharpenable()
  + ### getGunTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGunTypeString()