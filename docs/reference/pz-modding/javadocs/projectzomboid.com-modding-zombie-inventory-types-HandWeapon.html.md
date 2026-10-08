[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [HandWeapon](HandWeapon.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MAX\_ATTACHMENT\_COUNT](#MAX_ATTACHMENT_COUNT)
   2. [weaponLength](#weaponLength)
   3. [splatSize](#splatSize)
   4. [ammoPerShoot](#ammoPerShoot)
   5. [magazineType](#magazineType)
   6. [angleFalloff](#angleFalloff)
   7. [canBarricade](#canBarricade)
   8. [doSwingBeforeImpact](#doSwingBeforeImpact)
   9. [impactSound](#impactSound)
   10. [knockBackOnNoDeath](#knockBackOnNoDeath)
   11. [maxAngle](#maxAngle)
   12. [maxDamage](#maxDamage)
   13. [maxHitCount](#maxHitCount)
   14. [maxRange](#maxRange)
   15. [ranged](#ranged)
   16. [minAngle](#minAngle)
   17. [minDamage](#minDamage)
   18. [minimumSwingTime](#minimumSwingTime)
   19. [minRange](#minRange)
   20. [noiseFactor](#noiseFactor)
   21. [otherHandRequire](#otherHandRequire)
   22. [otherHandUse](#otherHandUse)
   23. [physicsObject](#physicsObject)
   24. [pushBackMod](#pushBackMod)
   25. [rangeFalloff](#rangeFalloff)
   26. [soundRadius](#soundRadius)
   27. [soundVolume](#soundVolume)
   28. [splatBloodOnNoDeath](#splatBloodOnNoDeath)
   29. [splatNumber](#splatNumber)
   30. [swingSound](#swingSound)
   31. [swingTime](#swingTime)
   32. [toHitModifier](#toHitModifier)
   33. [useEndurance](#useEndurance)
   34. [useSelf](#useSelf)
   35. [weaponSprite](#weaponSprite)
   36. [originalWeaponSprite](#originalWeaponSprite)
   37. [otherBoost](#otherBoost)
   38. [doorDamage](#doorDamage)
   39. [doorHitSound](#doorHitSound)
   40. [conditionLowerChance](#conditionLowerChance)
   41. [multipleHitConditionAffected](#multipleHitConditionAffected)
   42. [shareEndurance](#shareEndurance)
   43. [alwaysKnockdown](#alwaysKnockdown)
   44. [enduranceMod](#enduranceMod)
   45. [knockdownMod](#knockdownMod)
   46. [cantAttackWithLowestEndurance](#cantAttackWithLowestEndurance)
   47. [isAimedFirearm](#isAimedFirearm)
   48. [isAimedHandWeapon](#isAimedHandWeapon)
   49. [runAnim](#runAnim)
   50. [idleAnim](#idleAnim)
   51. [hitAngleMod](#hitAngleMod)
   52. [subCategory](#subCategory)
   53. [weaponCategories](#weaponCategories)
   54. [aimingPerkCritModifier](#aimingPerkCritModifier)
   55. [aimingPerkRangeModifier](#aimingPerkRangeModifier)
   56. [aimingPerkHitChanceModifier](#aimingPerkHitChanceModifier)
   57. [hitChance](#hitChance)
   58. [aimingPerkMinAngleModifier](#aimingPerkMinAngleModifier)
   59. [recoilDelay](#recoilDelay)
   60. [piercingBullets](#piercingBullets)
   61. [soundGain](#soundGain)
   62. [attachments](#attachments)
   63. [attachmentList](#attachmentList)
   64. [activeSight](#activeSight)
   65. [activeLight](#activeLight)
   66. [clipSize](#clipSize)
   67. [reloadTime](#reloadTime)
   68. [aimingTime](#aimingTime)
   69. [minRangeRanged](#minRangeRanged)
   70. [minSightRange](#minSightRange)
   71. [maxSightRange](#maxSightRange)
   72. [treeDamage](#treeDamage)
   73. [bulletOutSound](#bulletOutSound)
   74. [shellFallSound](#shellFallSound)
   75. [triggerExplosionTimer](#triggerExplosionTimer)
   76. [canBePlaced](#canBePlaced)
   77. [explosionRange](#explosionRange)
   78. [explosionPower](#explosionPower)
   79. [fireRange](#fireRange)
   80. [fireStartingEnergy](#fireStartingEnergy)
   81. [fireStartingChance](#fireStartingChance)
   82. [smokeRange](#smokeRange)
   83. [noiseRange](#noiseRange)
   84. [extraDamage](#extraDamage)
   85. [explosionTimer](#explosionTimer)
   86. [explosionDuration](#explosionDuration)
   87. [placedSprite](#placedSprite)
   88. [canBeReused](#canBeReused)
   89. [sensorRange](#sensorRange)
   90. [criticalDamageMultiplier](#criticalDamageMultiplier)
   91. [baseSpeed](#baseSpeed)
   92. [bloodLevel](#bloodLevel)
   93. [ammoBox](#ammoBox)
   94. [rackSound](#rackSound)
   95. [clickSound](#clickSound)
   96. [containsClip](#containsClip)
   97. [weaponReloadType](#weaponReloadType)
   98. [rackAfterShoot](#rackAfterShoot)
   99. [roundChambered](#roundChambered)
   100. [spentRoundChambered](#spentRoundChambered)
   101. [spentRoundCount](#spentRoundCount)
   102. [jamGunChance](#jamGunChance)
   103. [projectileCount](#projectileCount)
   104. [projectileSpread](#projectileSpread)
   105. [projectileWeightCenter](#projectileWeightCenter)
   106. [aimingMod](#aimingMod)
   107. [criticalChance](#criticalChance)
   108. [hitSound](#hitSound)
   109. [isJammed](#isJammed)
   110. [modelWeaponPart](#modelWeaponPart)
   111. [haveChamber](#haveChamber)
   112. [bulletName](#bulletName)
   113. [damageCategory](#damageCategory)
   114. [damageMakeHole](#damageMakeHole)
   115. [hitFloorSound](#hitFloorSound)
   116. [insertAllBulletsReload](#insertAllBulletsReload)
   117. [fireMode](#fireMode)
   118. [cyclicRateMultiplier](#cyclicRateMultiplier)
   119. [fireModePossibilities](#fireModePossibilities)
   120. [weaponSpritesByIndex](#weaponSpritesByIndex)
   121. [attackTargetSquare](#attackTargetSquare)
   122. [isMelee](#isMelee)
   123. [isExplosive](#isExplosive)
   124. [magazineComparator](#magazineComparator)
   125. [muzzleFlashModelKey](#muzzleFlashModelKey)
6. [Constructor Details](#constructor-detail)
   1. [HandWeapon(String, String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   2. [HandWeapon(String, String, String, Item)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,zombie.scripting.objects.Item))
7. [Method Details](#method-detail)
   1. [getCategory()](#getCategory())
   2. [IsWeapon()](#IsWeapon())
   3. [getSplatSize()](#getSplatSize())
   4. [getScore(SurvivorDesc)](#getScore(zombie.characters.SurvivorDesc))
   5. [getActualWeight()](#getActualWeight())
   6. [getWeight()](#getWeight())
   7. [getEffectiveWeight()](#getEffectiveWeight())
   8. [getContentsWeight()](#getContentsWeight())
   9. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   10. [getDamageMod(IsoGameCharacter)](#getDamageMod(zombie.characters.IsoGameCharacter))
   11. [getRangeMod(IsoGameCharacter)](#getRangeMod(zombie.characters.IsoGameCharacter))
   12. [getFatigueMod(IsoGameCharacter)](#getFatigueMod(zombie.characters.IsoGameCharacter))
   13. [getKnockbackMod(IsoGameCharacter)](#getKnockbackMod(zombie.characters.IsoGameCharacter))
   14. [getSpeedMod(IsoGameCharacter)](#getSpeedMod(zombie.characters.IsoGameCharacter))
   15. [getToHitMod(IsoGameCharacter)](#getToHitMod(zombie.characters.IsoGameCharacter))
   16. [getPerk()](#getPerk())
   17. [muscleStrainMod(IsoGameCharacter)](#muscleStrainMod(zombie.characters.IsoGameCharacter))
   18. [getWeaponSkill(IsoGameCharacter)](#getWeaponSkill(zombie.characters.IsoGameCharacter))
   19. [isAngleFalloff()](#isAngleFalloff())
   20. [setAngleFalloff(boolean)](#setAngleFalloff(boolean))
   21. [isCanBarracade()](#isCanBarracade())
   22. [setCanBarracade(boolean)](#setCanBarracade(boolean))
   23. [getDoSwingBeforeImpact()](#getDoSwingBeforeImpact())
   24. [setDoSwingBeforeImpact(float)](#setDoSwingBeforeImpact(float))
   25. [getImpactSound()](#getImpactSound())
   26. [setImpactSound(String)](#setImpactSound(java.lang.String))
   27. [isKnockBackOnNoDeath()](#isKnockBackOnNoDeath())
   28. [setKnockBackOnNoDeath(boolean)](#setKnockBackOnNoDeath(boolean))
   29. [getMaxAngle()](#getMaxAngle())
   30. [setMaxAngle(float)](#setMaxAngle(float))
   31. [getMaxDamage()](#getMaxDamage())
   32. [setMaxDamage(float)](#setMaxDamage(float))
   33. [getMaxHitCount()](#getMaxHitCount())
   34. [setMaxHitCount(int)](#setMaxHitCount(int))
   35. [getMaxRange()](#getMaxRange())
   36. [getMaxRange(IsoGameCharacter)](#getMaxRange(zombie.characters.IsoGameCharacter))
   37. [setMaxRange(float)](#setMaxRange(float))
   38. [isRanged()](#isRanged())
   39. [setRanged(boolean)](#setRanged(boolean))
   40. [getMinAngle()](#getMinAngle())
   41. [setMinAngle(float)](#setMinAngle(float))
   42. [getMinDamage()](#getMinDamage())
   43. [setMinDamage(float)](#setMinDamage(float))
   44. [getMinimumSwingTime()](#getMinimumSwingTime())
   45. [setMinimumSwingTime(float)](#setMinimumSwingTime(float))
   46. [getMinRange()](#getMinRange())
   47. [setMinRange(float)](#setMinRange(float))
   48. [getNoiseFactor()](#getNoiseFactor())
   49. [setNoiseFactor(float)](#setNoiseFactor(float))
   50. [getOtherHandRequire()](#getOtherHandRequire())
   51. [setOtherHandRequire(ItemTag)](#setOtherHandRequire(zombie.scripting.objects.ItemTag))
   52. [isOtherHandUse()](#isOtherHandUse())
   53. [setOtherHandUse(boolean)](#setOtherHandUse(boolean))
   54. [getPhysicsObject()](#getPhysicsObject())
   55. [setPhysicsObject(String)](#setPhysicsObject(java.lang.String))
   56. [getPushBackMod()](#getPushBackMod())
   57. [setPushBackMod(float)](#setPushBackMod(float))
   58. [isRangeFalloff()](#isRangeFalloff())
   59. [setRangeFalloff(boolean)](#setRangeFalloff(boolean))
   60. [getSoundRadius()](#getSoundRadius())
   61. [setSoundRadius(int)](#setSoundRadius(int))
   62. [getSoundVolume()](#getSoundVolume())
   63. [setSoundVolume(int)](#setSoundVolume(int))
   64. [isSplatBloodOnNoDeath()](#isSplatBloodOnNoDeath())
   65. [setSplatBloodOnNoDeath(boolean)](#setSplatBloodOnNoDeath(boolean))
   66. [getSplatNumber()](#getSplatNumber())
   67. [setSplatNumber(int)](#setSplatNumber(int))
   68. [getSwingSound()](#getSwingSound())
   69. [setSwingSound(String)](#setSwingSound(java.lang.String))
   70. [getSwingTime()](#getSwingTime())
   71. [setSwingTime(float)](#setSwingTime(float))
   72. [getToHitModifier()](#getToHitModifier())
   73. [setToHitModifier(float)](#setToHitModifier(float))
   74. [isUseEndurance()](#isUseEndurance())
   75. [setUseEndurance(boolean)](#setUseEndurance(boolean))
   76. [isUseSelf()](#isUseSelf())
   77. [setUseSelf(boolean)](#setUseSelf(boolean))
   78. [getWeaponSprite()](#getWeaponSprite())
   79. [setWeaponSprite(String)](#setWeaponSprite(java.lang.String))
   80. [getOtherBoost()](#getOtherBoost())
   81. [setOtherBoost(float)](#setOtherBoost(float))
   82. [getDoorDamage()](#getDoorDamage())
   83. [setDoorDamage(int)](#setDoorDamage(int))
   84. [getDoorHitSound()](#getDoorHitSound())
   85. [setDoorHitSound(String)](#setDoorHitSound(java.lang.String))
   86. [getConditionLowerChance()](#getConditionLowerChance())
   87. [setConditionLowerChance(int)](#setConditionLowerChance(int))
   88. [isMultipleHitConditionAffected()](#isMultipleHitConditionAffected())
   89. [setMultipleHitConditionAffected(boolean)](#setMultipleHitConditionAffected(boolean))
   90. [isShareEndurance()](#isShareEndurance())
   91. [setShareEndurance(boolean)](#setShareEndurance(boolean))
   92. [isAlwaysKnockdown()](#isAlwaysKnockdown())
   93. [setAlwaysKnockdown(boolean)](#setAlwaysKnockdown(boolean))
   94. [getEnduranceMod()](#getEnduranceMod())
   95. [setEnduranceMod(float)](#setEnduranceMod(float))
   96. [getKnockdownMod()](#getKnockdownMod())
   97. [setKnockdownMod(float)](#setKnockdownMod(float))
   98. [isCantAttackWithLowestEndurance()](#isCantAttackWithLowestEndurance())
   99. [setCantAttackWithLowestEndurance(boolean)](#setCantAttackWithLowestEndurance(boolean))
   100. [isAimedFirearm()](#isAimedFirearm())
   101. [isAimedFirearm(HandWeapon)](#isAimedFirearm(zombie.inventory.types.HandWeapon))
   102. [isAimedHandWeapon()](#isAimedHandWeapon())
   103. [getProjectileCount()](#getProjectileCount())
   104. [setProjectileCount(int)](#setProjectileCount(int))
   105. [getProjectileSpread()](#getProjectileSpread())
   106. [setProjectileSpread(float)](#setProjectileSpread(float))
   107. [getProjectileWeightCenter()](#getProjectileWeightCenter())
   108. [setProjectileWeightCenter(float)](#setProjectileWeightCenter(float))
   109. [setMuzzleFlashModelKey(ModelKey)](#setMuzzleFlashModelKey(zombie.scripting.objects.ModelKey))
   110. [getMuzzleFlashModelKey()](#getMuzzleFlashModelKey())
   111. [getAimingMod()](#getAimingMod())
   112. [isAimed()](#isAimed())
   113. [setCriticalChance(float)](#setCriticalChance(float))
   114. [getCriticalChance()](#getCriticalChance())
   115. [setSubCategory(String)](#setSubCategory(java.lang.String))
   116. [getSubCategory()](#getSubCategory())
   117. [setZombieHitSound(String)](#setZombieHitSound(java.lang.String))
   118. [getZombieHitSound()](#getZombieHitSound())
   119. [isOfWeaponCategory(WeaponCategory)](#isOfWeaponCategory(zombie.scripting.objects.WeaponCategory))
   120. [setWeaponCategories(Set)](#setWeaponCategories(java.util.Set))
   121. [getAimingPerkCritModifier()](#getAimingPerkCritModifier())
   122. [setAimingPerkCritModifier(int)](#setAimingPerkCritModifier(int))
   123. [getAimingPerkRangeModifier()](#getAimingPerkRangeModifier())
   124. [setAimingPerkRangeModifier(float)](#setAimingPerkRangeModifier(float))
   125. [getHitChance()](#getHitChance())
   126. [setHitChance(int)](#setHitChance(int))
   127. [getAimingPerkHitChanceModifier()](#getAimingPerkHitChanceModifier())
   128. [setAimingPerkHitChanceModifier(float)](#setAimingPerkHitChanceModifier(float))
   129. [getAimingPerkMinAngleModifier()](#getAimingPerkMinAngleModifier())
   130. [setAimingPerkMinAngleModifier(float)](#setAimingPerkMinAngleModifier(float))
   131. [getRecoilDelay()](#getRecoilDelay())
   132. [getRecoilDelay(IsoGameCharacter)](#getRecoilDelay(zombie.characters.IsoGameCharacter))
   133. [setRecoilDelay(int)](#setRecoilDelay(int))
   134. [isPiercingBullets()](#isPiercingBullets())
   135. [setPiercingBullets(boolean)](#setPiercingBullets(boolean))
   136. [getSoundGain()](#getSoundGain())
   137. [setSoundGain(float)](#setSoundGain(float))
   138. [getClipSize()](#getClipSize())
   139. [setClipSize(int)](#setClipSize(int))
   140. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   141. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   142. [getActiveLight()](#getActiveLight())
   143. [setActiveLight(WeaponPart)](#setActiveLight(zombie.inventory.types.WeaponPart))
   144. [getActiveSight()](#getActiveSight())
   145. [setActiveSight(WeaponPart)](#setActiveSight(zombie.inventory.types.WeaponPart))
   146. [setMinSightRange(float)](#setMinSightRange(float))
   147. [getMinSightRange()](#getMinSightRange())
   148. [getMinSightRange(IsoGameCharacter)](#getMinSightRange(zombie.characters.IsoGameCharacter))
   149. [setMaxSightRange(float)](#setMaxSightRange(float))
   150. [getMaxSightRange()](#getMaxSightRange())
   151. [getMaxSightRange(IsoGameCharacter)](#getMaxSightRange(zombie.characters.IsoGameCharacter))
   152. [getLowLightBonus()](#getLowLightBonus())
   153. [getMinRangeRanged()](#getMinRangeRanged())
   154. [setMinRangeRanged(float)](#setMinRangeRanged(float))
   155. [getReloadTime()](#getReloadTime())
   156. [setReloadTime(int)](#setReloadTime(int))
   157. [getAimingTime()](#getAimingTime())
   158. [setAimingTime(int)](#setAimingTime(int))
   159. [getTreeDamage()](#getTreeDamage())
   160. [setTreeDamage(int)](#setTreeDamage(int))
   161. [getBulletOutSound()](#getBulletOutSound())
   162. [setBulletOutSound(String)](#setBulletOutSound(java.lang.String))
   163. [getShellFallSound()](#getShellFallSound())
   164. [setShellFallSound(String)](#setShellFallSound(java.lang.String))
   165. [addPartToList(String, ArrayList)](#addPartToList(java.lang.String,java.util.ArrayList))
   166. [getAllWeaponParts()](#getAllWeaponParts())
   167. [getAllWeaponParts(List)](#getAllWeaponParts(java.util.List))
   168. [getDetachableWeaponParts(IsoGameCharacter)](#getDetachableWeaponParts(zombie.characters.IsoGameCharacter))
   169. [clearAllWeaponParts()](#clearAllWeaponParts())
   170. [clearWeaponPart(WeaponPart)](#clearWeaponPart(zombie.inventory.types.WeaponPart))
   171. [clearWeaponPart(String)](#clearWeaponPart(java.lang.String))
   172. [setWeaponPart(WeaponPart)](#setWeaponPart(zombie.inventory.types.WeaponPart))
   173. [setWeaponPart(String, WeaponPart)](#setWeaponPart(java.lang.String,zombie.inventory.types.WeaponPart))
   174. [getWeaponPart(WeaponPart)](#getWeaponPart(zombie.inventory.types.WeaponPart))
   175. [getWeaponPart(String)](#getWeaponPart(java.lang.String))
   176. [getWeaponPartWeightModifier(String)](#getWeaponPartWeightModifier(java.lang.String))
   177. [getWeaponPartWeightModifier(WeaponPart)](#getWeaponPartWeightModifier(zombie.inventory.types.WeaponPart))
   178. [attachWeaponPart(WeaponPart)](#attachWeaponPart(zombie.inventory.types.WeaponPart))
   179. [attachWeaponPart(WeaponPart, boolean)](#attachWeaponPart(zombie.inventory.types.WeaponPart,boolean))
   180. [attachWeaponPart(IsoGameCharacter, WeaponPart)](#attachWeaponPart(zombie.characters.IsoGameCharacter,zombie.inventory.types.WeaponPart))
   181. [attachWeaponPart(IsoGameCharacter, WeaponPart, boolean)](#attachWeaponPart(zombie.characters.IsoGameCharacter,zombie.inventory.types.WeaponPart,boolean))
   182. [detachAllWeaponParts()](#detachAllWeaponParts())
   183. [detachWeaponPart(WeaponPart)](#detachWeaponPart(zombie.inventory.types.WeaponPart))
   184. [detachWeaponPart(String)](#detachWeaponPart(java.lang.String))
   185. [detachWeaponPart(IsoGameCharacter, WeaponPart)](#detachWeaponPart(zombie.characters.IsoGameCharacter,zombie.inventory.types.WeaponPart))
   186. [detachWeaponPart(IsoGameCharacter, WeaponPart, boolean)](#detachWeaponPart(zombie.characters.IsoGameCharacter,zombie.inventory.types.WeaponPart,boolean))
   187. [getTriggerExplosionTimer()](#getTriggerExplosionTimer())
   188. [setTriggerExplosionTimer(int)](#setTriggerExplosionTimer(int))
   189. [canBePlaced()](#canBePlaced())
   190. [setCanBePlaced(boolean)](#setCanBePlaced(boolean))
   191. [getExplosionRange()](#getExplosionRange())
   192. [setExplosionRange(int)](#setExplosionRange(int))
   193. [getExplosionPower()](#getExplosionPower())
   194. [setExplosionPower(int)](#setExplosionPower(int))
   195. [getFireRange()](#getFireRange())
   196. [setFireRange(int)](#setFireRange(int))
   197. [getSmokeRange()](#getSmokeRange())
   198. [setSmokeRange(int)](#setSmokeRange(int))
   199. [getFireStartingEnergy()](#getFireStartingEnergy())
   200. [setFireStartingEnergy(int)](#setFireStartingEnergy(int))
   201. [getFireStartingChance()](#getFireStartingChance())
   202. [setFireStartingChance(int)](#setFireStartingChance(int))
   203. [getNoiseRange()](#getNoiseRange())
   204. [setNoiseRange(int)](#setNoiseRange(int))
   205. [getNoiseDuration()](#getNoiseDuration())
   206. [getExtraDamage()](#getExtraDamage())
   207. [setExtraDamage(float)](#setExtraDamage(float))
   208. [getExplosionTimer()](#getExplosionTimer())
   209. [setExplosionTimer(int)](#setExplosionTimer(int))
   210. [getExplosionDuration()](#getExplosionDuration())
   211. [setExplosionDuration(int)](#setExplosionDuration(int))
   212. [getPlacedSprite()](#getPlacedSprite())
   213. [setPlacedSprite(String)](#setPlacedSprite(java.lang.String))
   214. [canBeReused()](#canBeReused())
   215. [setCanBeReused(boolean)](#setCanBeReused(boolean))
   216. [getSensorRange()](#getSensorRange())
   217. [setSensorRange(int)](#setSensorRange(int))
   218. [getRunAnim()](#getRunAnim())
   219. [getCriticalDamageMultiplier()](#getCriticalDamageMultiplier())
   220. [setCriticalDamageMultiplier(float)](#setCriticalDamageMultiplier(float))
   221. [getStaticModel()](#getStaticModel())
   222. [getStaticModelException()](#getStaticModelException())
   223. [getBaseSpeed()](#getBaseSpeed())
   224. [setBaseSpeed(float)](#setBaseSpeed(float))
   225. [getBloodLevel()](#getBloodLevel())
   226. [setBloodLevel(float)](#setBloodLevel(float))
   227. [setWeaponLength(float)](#setWeaponLength(float))
   228. [getAmmoBox()](#getAmmoBox())
   229. [setAmmoBox(String)](#setAmmoBox(java.lang.String))
   230. [getMagazineType()](#getMagazineType())
   231. [setMagazineType(String)](#setMagazineType(java.lang.String))
   232. [getEjectAmmoStartSound()](#getEjectAmmoStartSound())
   233. [getEjectAmmoSound()](#getEjectAmmoSound())
   234. [getEjectAmmoStopSound()](#getEjectAmmoStopSound())
   235. [getInsertAmmoStartSound()](#getInsertAmmoStartSound())
   236. [getInsertAmmoSound()](#getInsertAmmoSound())
   237. [getInsertAmmoStopSound()](#getInsertAmmoStopSound())
   238. [getRackSound()](#getRackSound())
   239. [setRackSound(String)](#setRackSound(java.lang.String))
   240. [isReloadable(IsoGameCharacter)](#isReloadable(zombie.characters.IsoGameCharacter))
   241. [isContainsClip()](#isContainsClip())
   242. [setContainsClip(boolean)](#setContainsClip(boolean))
   243. [getBestMagazine(IsoGameCharacter)](#getBestMagazine(zombie.characters.IsoGameCharacter))
   244. [getWeaponReloadType()](#getWeaponReloadType())
   245. [setWeaponReloadType(WeaponReloadType)](#setWeaponReloadType(zombie.scripting.objects.WeaponReloadType))
   246. [isRackAfterShoot()](#isRackAfterShoot())
   247. [setRackAfterShoot(boolean)](#setRackAfterShoot(boolean))
   248. [isRoundChambered()](#isRoundChambered())
   249. [setRoundChambered(boolean)](#setRoundChambered(boolean))
   250. [isSpentRoundChambered()](#isSpentRoundChambered())
   251. [setSpentRoundChambered(boolean)](#setSpentRoundChambered(boolean))
   252. [getSpentRoundCount()](#getSpentRoundCount())
   253. [setSpentRoundCount(int)](#setSpentRoundCount(int))
   254. [isManuallyRemoveSpentRounds()](#isManuallyRemoveSpentRounds())
   255. [getAmmoPerShoot()](#getAmmoPerShoot())
   256. [setAmmoPerShoot(int)](#setAmmoPerShoot(int))
   257. [getJamGunChance()](#getJamGunChance())
   258. [setJamGunChance(float)](#setJamGunChance(float))
   259. [isJammed()](#isJammed())
   260. [setJammed(boolean)](#setJammed(boolean))
   261. [checkJam(IsoPlayer, boolean)](#checkJam(zombie.characters.IsoPlayer,boolean))
   262. [checkUnJam(IsoPlayer)](#checkUnJam(zombie.characters.IsoPlayer))
   263. [getClickSound()](#getClickSound())
   264. [setClickSound(String)](#setClickSound(java.lang.String))
   265. [getModelWeaponPart()](#getModelWeaponPart())
   266. [setModelWeaponPart(ArrayList)](#setModelWeaponPart(java.util.ArrayList))
   267. [getOriginalWeaponSprite()](#getOriginalWeaponSprite())
   268. [setOriginalWeaponSprite(String)](#setOriginalWeaponSprite(java.lang.String))
   269. [haveChamber()](#haveChamber())
   270. [setHaveChamber(boolean)](#setHaveChamber(boolean))
   271. [getDamageCategory()](#getDamageCategory())
   272. [setDamageCategory(String)](#setDamageCategory(java.lang.String))
   273. [isDamageMakeHole()](#isDamageMakeHole())
   274. [setDamageMakeHole(boolean)](#setDamageMakeHole(boolean))
   275. [getHitFloorSound()](#getHitFloorSound())
   276. [setHitFloorSound(String)](#setHitFloorSound(java.lang.String))
   277. [isInsertAllBulletsReload()](#isInsertAllBulletsReload())
   278. [setInsertAllBulletsReload(boolean)](#setInsertAllBulletsReload(boolean))
   279. [getFireMode()](#getFireMode())
   280. [setFireMode(String)](#setFireMode(java.lang.String))
   281. [isSelectFire()](#isSelectFire())
   282. [cycleFireMode()](#cycleFireMode())
   283. [getFireModePossibilities()](#getFireModePossibilities())
   284. [setFireModePossibilities(ArrayList)](#setFireModePossibilities(java.util.ArrayList))
   285. [getCyclicRateMultiplier()](#getCyclicRateMultiplier())
   286. [setCyclicRateMultiplier(float)](#setCyclicRateMultiplier(float))
   287. [randomizeBullets()](#randomizeBullets())
   288. [canEmitLight()](#canEmitLight())
   289. [getLightStrength()](#getLightStrength())
   290. [isTorchCone()](#isTorchCone())
   291. [getTorchDot()](#getTorchDot())
   292. [getLightDistance()](#getLightDistance())
   293. [canBeActivated()](#canBeActivated())
   294. [getStopPower()](#getStopPower())
   295. [isInstantExplosion()](#isInstantExplosion())
   296. [setWeaponSpritesByIndex(ArrayList)](#setWeaponSpritesByIndex(java.util.ArrayList))
   297. [getWeaponSpritesByIndex()](#getWeaponSpritesByIndex())
   298. [usesExternalMagazine()](#usesExternalMagazine())
   299. [inheritAmmunition(HandWeapon)](#inheritAmmunition(zombie.inventory.types.HandWeapon))
   300. [isBareHands()](#isBareHands())
   301. [render()](#render())
   302. [setActivated(boolean)](#setActivated(boolean))
   303. [playActivateSound()](#playActivateSound())
   304. [playDeactivateSound()](#playDeactivateSound())
   305. [update()](#update())
   306. [canAttackPierceTransparentWall(IsoGameCharacter, HandWeapon)](#canAttackPierceTransparentWall(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   307. [randomizeFirearmAsLoot()](#randomizeFirearmAsLoot())
   308. [setAttackTargetSquare(IsoGridSquare)](#setAttackTargetSquare(zombie.iso.IsoGridSquare))
   309. [getAttackTargetSquare(Vector3)](#getAttackTargetSquare(zombie.iso.Vector3))
   310. [isMelee()](#isMelee())
   311. [isExplosive()](#isExplosive())
   312. [getStaggerBackTimeMod(IsoGameCharacter, IsoGameCharacter)](#getStaggerBackTimeMod(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter))
   313. [setScriptItem(Item)](#setScriptItem(zombie.scripting.objects.Item))
   314. [needToBeClosedOnceReload()](#needToBeClosedOnceReload())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class HandWeapon
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.inventory.InventoryItem](../InventoryItem.html "class in zombie.inventory")

zombie.inventory.types.HandWeapon

All Implemented Interfaces:
:   `zombie.interfaces.IUpdater`

---

public final class HandWeapon
extends [InventoryItem](../InventoryItem.html "class in zombie.inventory")
implements zombie.interfaces.IUpdater

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private WeaponPart`

  `activeLight`

  `WeaponPart`

  `activeSight`

  `private final float`

  `aimingMod`

  `private int`

  `aimingPerkCritModifier`

  `private float`

  `aimingPerkHitChanceModifier`

  `private float`

  `aimingPerkMinAngleModifier`

  `private float`

  `aimingPerkRangeModifier`

  `private int`

  `aimingTime`

  `private boolean`

  `alwaysKnockdown`

  `private String`

  `ammoBox`

  `private int`

  `ammoPerShoot`

  `private boolean`

  `angleFalloff`

  `private final List<WeaponPart>`

  `attachmentList`

  `private final HashMap<String, WeaponPart>`

  `attachments`

  `private IsoGridSquare`

  `attackTargetSquare`

  `private float`

  `baseSpeed`

  `private float`

  `bloodLevel`

  `private String`

  `bulletName`

  `private String`

  `bulletOutSound`

  `private boolean`

  `canBarricade`

  `private boolean`

  `canBePlaced`

  `private boolean`

  `canBeReused`

  `private boolean`

  `cantAttackWithLowestEndurance`

  `private String`

  `clickSound`

  `private int`

  `clipSize`

  `private int`

  `conditionLowerChance`

  `private boolean`

  `containsClip`

  `private float`

  `criticalChance`

  `private float`

  `criticalDamageMultiplier`

  `private float`

  `cyclicRateMultiplier`

  `private String`

  `damageCategory`

  `private boolean`

  `damageMakeHole`

  `private int`

  `doorDamage`

  `private String`

  `doorHitSound`

  `private float`

  `doSwingBeforeImpact`

  `private float`

  `enduranceMod`

  `private int`

  `explosionDuration`

  `private int`

  `explosionPower`

  `private int`

  `explosionRange`

  `private int`

  `explosionTimer`

  `private float`

  `extraDamage`

  `private String`

  `fireMode`

  `private ArrayList<String>`

  `fireModePossibilities`

  `private int`

  `fireRange`

  `private int`

  `fireStartingChance`

  `private int`

  `fireStartingEnergy`

  `private boolean`

  `haveChamber`

  `float`

  `hitAngleMod`

  `private int`

  `hitChance`

  `private String`

  `hitFloorSound`

  `private String`

  `hitSound`

  `String`

  `idleAnim`

  `private String`

  `impactSound`

  `private boolean`

  `insertAllBulletsReload`

  `boolean`

  `isAimedFirearm`

  `boolean`

  `isAimedHandWeapon`

  `private boolean`

  `isExplosive`

  `private boolean`

  `isJammed`

  `private boolean`

  `isMelee`

  `private float`

  `jamGunChance`

  `private boolean`

  `knockBackOnNoDeath`

  `private float`

  `knockdownMod`

  `private static final Comparator<InventoryItem>`

  `magazineComparator`

  `private String`

  `magazineType`

  `static final int`

  `MAX_ATTACHMENT_COUNT`

  `private float`

  `maxAngle`

  `private float`

  `maxDamage`

  `private int`

  `maxHitCount`

  `private float`

  `maxRange`

  `private float`

  `maxSightRange`

  `private float`

  `minAngle`

  `private float`

  `minDamage`

  `private float`

  `minimumSwingTime`

  `private float`

  `minRange`

  `private float`

  `minRangeRanged`

  `private float`

  `minSightRange`

  `private ArrayList<ModelWeaponPart>`

  `modelWeaponPart`

  `private boolean`

  `multipleHitConditionAffected`

  `private ModelKey`

  `muzzleFlashModelKey`

  `private float`

  `noiseFactor`

  `private int`

  `noiseRange`

  `private String`

  `originalWeaponSprite`

  `private float`

  `otherBoost`

  `private ItemTag`

  `otherHandRequire`

  `private boolean`

  `otherHandUse`

  `private String`

  `physicsObject`

  `private boolean`

  `piercingBullets`

  `private String`

  `placedSprite`

  `private int`

  `projectileCount`

  `private float`

  `projectileSpread`

  `private float`

  `projectileWeightCenter`

  `private float`

  `pushBackMod`

  `private boolean`

  `rackAfterShoot`

  `private String`

  `rackSound`

  `private boolean`

  `ranged`

  `private boolean`

  `rangeFalloff`

  `private int`

  `recoilDelay`

  `private int`

  `reloadTime`

  `private boolean`

  `roundChambered`

  `String`

  `runAnim`

  `private int`

  `sensorRange`

  `private boolean`

  `shareEndurance`

  `private String`

  `shellFallSound`

  `private int`

  `smokeRange`

  `private float`

  `soundGain`

  `private int`

  `soundRadius`

  `private int`

  `soundVolume`

  `private boolean`

  `spentRoundChambered`

  `private int`

  `spentRoundCount`

  `private boolean`

  `splatBloodOnNoDeath`

  `private int`

  `splatNumber`

  `float`

  `splatSize`

  `private String`

  `subCategory`

  `private String`

  `swingSound`

  `private float`

  `swingTime`

  `private float`

  `toHitModifier`

  `private int`

  `treeDamage`

  `private int`

  `triggerExplosionTimer`

  `private boolean`

  `useEndurance`

  `private boolean`

  `useSelf`

  `private Set<WeaponCategory>`

  `weaponCategories`

  `float`

  `weaponLength`

  `private WeaponReloadType`

  `weaponReloadType`

  `private String`

  `weaponSprite`

  `private ArrayList<String>`

  `weaponSpritesByIndex`

  ### Fields inherited from class [InventoryItem](../InventoryItem.html#field-summary "class in zombie.inventory")

  `actualWeight, age, alcoholic, atlasTexture, boredomChange, burnt, burntString, byteData, canStack, closeKillMove, col, condition, conditionMax, container, containerX, containerY, cooked, cookedString, cookingTime, deadBodyObject, DEFAULT_USES, description, emptyString, extraItems, fatigueChange, foodSicknessChange, freshString, frozenString, fullType, grilledString, id, inverseCoughProbability, inverseCoughProbabilitySmoker, isCookable, itemType, jobDelta, jobType, lastAged, mainCategory, minutesToBurn, minutesToCook, module, name, offAge, offAgeMax, offString, previousOwner, replaceOnUse, replaceOnUseFullType, replaceOnUseOn, requireInHandOrInventory, requiresEquippedBothHands, rightClickContainer, scriptItem, staleString, staticModel, stressChange, taken, texture, textureBurnt, textureColorMask, textureCooked, textureFluidMask, texturerotten, timeMultiplier, toastedString, type, unCookedString, unhappyChange, uses, visual, weight, worldAlpha, worldItem, worldScale, worldTexture, worldXRotation, worldYRotation, worldZRotation`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HandWeapon(String module,
  String name,
  String itemType,
  String texName)`

  `HandWeapon(String module,
  String name,
  String itemType,
  Item item)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addPartToList(String type,
  ArrayList<WeaponPart> list)`

  `void`

  `attachWeaponPart(IsoGameCharacter character,
  WeaponPart part)`

  `void`

  `attachWeaponPart(IsoGameCharacter character,
  WeaponPart part,
  boolean doChange)`

  `void`

  `attachWeaponPart(WeaponPart part)`

  `void`

  `attachWeaponPart(WeaponPart part,
  boolean doChange)`

  `boolean`

  `canAttackPierceTransparentWall(IsoGameCharacter isoGameCharacter,
  HandWeapon handWeapon)`

  `boolean`

  `canBeActivated()`

  `boolean`

  `canBePlaced()`

  `boolean`

  `canBeReused()`

  `boolean`

  `canEmitLight()`

  `boolean`

  `checkJam(IsoPlayer player,
  boolean racking)`

  `boolean`

  `checkUnJam(IsoPlayer player)`

  `void`

  `clearAllWeaponParts()`

  `void`

  `clearWeaponPart(String partType)`

  `void`

  `clearWeaponPart(WeaponPart part)`

  `String`

  `cycleFireMode()`

  `void`

  `detachAllWeaponParts()`

  `void`

  `detachWeaponPart(String location)`

  `void`

  `detachWeaponPart(IsoGameCharacter character,
  WeaponPart part)`

  `void`

  `detachWeaponPart(IsoGameCharacter character,
  WeaponPart part,
  boolean doChange)`

  `void`

  `detachWeaponPart(WeaponPart part)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `WeaponPart`

  `getActiveLight()`

  `WeaponPart`

  `getActiveSight()`

  `float`

  `getActualWeight()`

  `float`

  `getAimingMod()`

  `int`

  `getAimingPerkCritModifier()`

  `float`

  `getAimingPerkHitChanceModifier()`

  `float`

  `getAimingPerkMinAngleModifier()`

  `float`

  `getAimingPerkRangeModifier()`

  `int`

  `getAimingTime()`

  `List<WeaponPart>`

  `getAllWeaponParts()`

  `List<WeaponPart>`

  `getAllWeaponParts(List<WeaponPart> result)`

  `String`

  `getAmmoBox()`

  `int`

  `getAmmoPerShoot()`

  `IsoGridSquare`

  `getAttackTargetSquare(Vector3 attackPosition)`

  `float`

  `getBaseSpeed()`

  `InventoryItem`

  `getBestMagazine(IsoGameCharacter owner)`

  `float`

  `getBloodLevel()`

  `String`

  `getBulletOutSound()`

  `String`

  `getCategory()`

  `String`

  `getClickSound()`

  `int`

  `getClipSize()`

  `int`

  `getConditionLowerChance()`

  `float`

  `getContentsWeight()`

  `float`

  `getCriticalChance()`

  `float`

  `getCriticalDamageMultiplier()`

  `float`

  `getCyclicRateMultiplier()`

  `String`

  `getDamageCategory()`

  `float`

  `getDamageMod(IsoGameCharacter chr)`

  `List<WeaponPart>`

  `getDetachableWeaponParts(IsoGameCharacter character)`

  `int`

  `getDoorDamage()`

  `String`

  `getDoorHitSound()`

  `float`

  `getDoSwingBeforeImpact()`

  `float`

  `getEffectiveWeight()`

  `String`

  `getEjectAmmoSound()`

  `String`

  `getEjectAmmoStartSound()`

  `String`

  `getEjectAmmoStopSound()`

  `float`

  `getEnduranceMod()`

  `int`

  `getExplosionDuration()`

  `int`

  `getExplosionPower()`

  `int`

  `getExplosionRange()`

  `int`

  `getExplosionTimer()`

  `float`

  `getExtraDamage()`

  `float`

  `getFatigueMod(IsoGameCharacter chr)`

  `String`

  `getFireMode()`

  `ArrayList<String>`

  `getFireModePossibilities()`

  `int`

  `getFireRange()`

  `int`

  `getFireStartingChance()`

  `int`

  `getFireStartingEnergy()`

  `int`

  `getHitChance()`

  `String`

  `getHitFloorSound()`

  `String`

  `getImpactSound()`

  `String`

  `getInsertAmmoSound()`

  `String`

  `getInsertAmmoStartSound()`

  `String`

  `getInsertAmmoStopSound()`

  `float`

  `getJamGunChance()`

  `float`

  `getKnockbackMod(IsoGameCharacter chr)`

  `float`

  `getKnockdownMod()`

  `int`

  `getLightDistance()`

  `float`

  `getLightStrength()`

  `float`

  `getLowLightBonus()`

  `String`

  `getMagazineType()`

  `float`

  `getMaxAngle()`

  `float`

  `getMaxDamage()`

  `int`

  `getMaxHitCount()`

  `float`

  `getMaxRange()`

  `float`

  `getMaxRange(IsoGameCharacter owner)`

  `float`

  `getMaxSightRange()`

  `float`

  `getMaxSightRange(IsoGameCharacter character)`

  `float`

  `getMinAngle()`

  `float`

  `getMinDamage()`

  `float`

  `getMinimumSwingTime()`

  `float`

  `getMinRange()`

  `float`

  `getMinRangeRanged()`

  `float`

  `getMinSightRange()`

  `float`

  `getMinSightRange(IsoGameCharacter character)`

  `ArrayList<ModelWeaponPart>`

  `getModelWeaponPart()`

  `ModelKey`

  `getMuzzleFlashModelKey()`

  `int`

  `getNoiseDuration()`

  `float`

  `getNoiseFactor()`

  `int`

  `getNoiseRange()`

  `String`

  `getOriginalWeaponSprite()`

  `float`

  `getOtherBoost()`

  `ItemTag`

  `getOtherHandRequire()`

  `PerkFactory.Perk`

  `getPerk()`

  `String`

  `getPhysicsObject()`

  `String`

  `getPlacedSprite()`

  `int`

  `getProjectileCount()`

  `float`

  `getProjectileSpread()`

  `float`

  `getProjectileWeightCenter()`

  `float`

  `getPushBackMod()`

  `String`

  `getRackSound()`

  `float`

  `getRangeMod(IsoGameCharacter chr)`

  `int`

  `getRecoilDelay()`

  `int`

  `getRecoilDelay(IsoGameCharacter owner)`

  `int`

  `getReloadTime()`

  `String`

  `getRunAnim()`

  `float`

  `getScore(SurvivorDesc desc)`

  `int`

  `getSensorRange()`

  `String`

  `getShellFallSound()`

  `int`

  `getSmokeRange()`

  `float`

  `getSoundGain()`

  `int`

  `getSoundRadius()`

  `int`

  `getSoundVolume()`

  `float`

  `getSpeedMod(IsoGameCharacter chr)`

  `int`

  `getSpentRoundCount()`

  `int`

  `getSplatNumber()`

  `float`

  `getSplatSize()`

  `float`

  `getStaggerBackTimeMod(IsoGameCharacter wielder,
  IsoGameCharacter target)`

  `String`

  `getStaticModel()`

  `String`

  `getStaticModelException()`

  `float`

  `getStopPower()`

  `String`

  `getSubCategory()`

  `String`

  `getSwingSound()`

  `float`

  `getSwingTime()`

  `float`

  `getToHitMod(IsoGameCharacter chr)`

  `float`

  `getToHitModifier()`

  `float`

  `getTorchDot()`

  `int`

  `getTreeDamage()`

  `int`

  `getTriggerExplosionTimer()`

  `WeaponPart`

  `getWeaponPart(String location)`

  `WeaponPart`

  `getWeaponPart(WeaponPart part)`

  `float`

  `getWeaponPartWeightModifier(String type)`

  `float`

  `getWeaponPartWeightModifier(WeaponPart part)`

  `WeaponReloadType`

  `getWeaponReloadType()`

  `int`

  `getWeaponSkill(IsoGameCharacter chr)`

  `String`

  `getWeaponSprite()`

  `ArrayList<String>`

  `getWeaponSpritesByIndex()`

  `float`

  `getWeight()`

  `String`

  `getZombieHitSound()`

  `boolean`

  `haveChamber()`

  `void`

  `inheritAmmunition(HandWeapon other)`

  `boolean`

  `isAimed()`

  `boolean`

  `isAimedFirearm()`

  `static boolean`

  `isAimedFirearm(HandWeapon handWeapon)`

  `boolean`

  `isAimedHandWeapon()`

  `boolean`

  `isAlwaysKnockdown()`

  `boolean`

  `isAngleFalloff()`

  `boolean`

  `isBareHands()`

  `boolean`

  `isCanBarracade()`

  `boolean`

  `isCantAttackWithLowestEndurance()`

  `boolean`

  `isContainsClip()`

  `boolean`

  `isDamageMakeHole()`

  `boolean`

  `isExplosive()`

  `boolean`

  `isInsertAllBulletsReload()`

  `boolean`

  `isInstantExplosion()`

  `boolean`

  `isJammed()`

  `boolean`

  `isKnockBackOnNoDeath()`

  `boolean`

  `isManuallyRemoveSpentRounds()`

  `boolean`

  `isMelee()`

  `boolean`

  `isMultipleHitConditionAffected()`

  `boolean`

  `isOfWeaponCategory(WeaponCategory weaponCategory)`

  `boolean`

  `isOtherHandUse()`

  `boolean`

  `isPiercingBullets()`

  `boolean`

  `isRackAfterShoot()`

  `boolean`

  `isRanged()`

  `boolean`

  `isRangeFalloff()`

  `boolean`

  `isReloadable(IsoGameCharacter owner)`

  `boolean`

  `isRoundChambered()`

  `boolean`

  `isSelectFire()`

  `boolean`

  `isShareEndurance()`

  `boolean`

  `isSpentRoundChambered()`

  `boolean`

  `isSplatBloodOnNoDeath()`

  `boolean`

  `isTorchCone()`

  `boolean`

  `isUseEndurance()`

  `boolean`

  `isUseSelf()`

  `boolean`

  `IsWeapon()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `float`

  `muscleStrainMod(IsoGameCharacter chr)`

  `boolean`

  `needToBeClosedOnceReload()`

  `void`

  `playActivateSound()`

  `void`

  `playDeactivateSound()`

  `int`

  `randomizeBullets()`

  `void`

  `randomizeFirearmAsLoot()`

  `void`

  `render()`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setActivated(boolean activated)`

  `void`

  `setActiveLight(WeaponPart part)`

  `void`

  `setActiveSight(WeaponPart part)`

  `void`

  `setAimingPerkCritModifier(int aimingPerkCritModifier)`

  `void`

  `setAimingPerkHitChanceModifier(float aimingPerkHitChanceModifier)`

  `void`

  `setAimingPerkMinAngleModifier(float aimingPerkMinAngleModifier)`

  `void`

  `setAimingPerkRangeModifier(float aimingPerkRangeModifier)`

  `void`

  `setAimingTime(int aimingTime)`

  `void`

  `setAlwaysKnockdown(boolean alwaysKnockdown)`

  `void`

  `setAmmoBox(String ammoBox)`

  `void`

  `setAmmoPerShoot(int ammoPerShoot)`

  `void`

  `setAngleFalloff(boolean angleFalloff)`

  `void`

  `setAttackTargetSquare(IsoGridSquare isoGridSquare)`

  `void`

  `setBaseSpeed(float baseSpeed)`

  `void`

  `setBloodLevel(float level)`

  `void`

  `setBulletOutSound(String bulletOutSound)`

  `void`

  `setCanBarracade(boolean bCanBarracade)`

  `void`

  `setCanBePlaced(boolean canBePlaced)`

  `void`

  `setCanBeReused(boolean canBeReused)`

  `void`

  `setCantAttackWithLowestEndurance(boolean cantAttackWithLowestEndurance)`

  `void`

  `setClickSound(String clickSound)`

  `void`

  `setClipSize(int capacity)`

  `void`

  `setConditionLowerChance(int conditionLowerChance)`

  `void`

  `setContainsClip(boolean containsClip)`

  `void`

  `setCriticalChance(float criticalChance)`

  `void`

  `setCriticalDamageMultiplier(float criticalDamageMultiplier)`

  `void`

  `setCyclicRateMultiplier(float value)`

  `void`

  `setDamageCategory(String damageCategory)`

  `void`

  `setDamageMakeHole(boolean damageMakeHole)`

  `void`

  `setDoorDamage(int doorDamage)`

  `void`

  `setDoorHitSound(String doorHitSound)`

  `void`

  `setDoSwingBeforeImpact(float doSwingBeforeImpact)`

  `void`

  `setEnduranceMod(float enduranceMod)`

  `void`

  `setExplosionDuration(int seconds)`

  `void`

  `setExplosionPower(int explosionPower)`

  `void`

  `setExplosionRange(int explosionRange)`

  `void`

  `setExplosionTimer(int explosionTimer)`

  `void`

  `setExtraDamage(float extraDamage)`

  `void`

  `setFireMode(String fireMode)`

  `void`

  `setFireModePossibilities(ArrayList<String> fireModePossibilities)`

  `void`

  `setFireRange(int fireRange)`

  `void`

  `setFireStartingChance(int fireStartingChance)`

  `void`

  `setFireStartingEnergy(int fireStartingEnergy)`

  `void`

  `setHaveChamber(boolean haveChamber)`

  `void`

  `setHitChance(int hitChance)`

  `void`

  `setHitFloorSound(String hitFloorSound)`

  `void`

  `setImpactSound(String impactSound)`

  `void`

  `setInsertAllBulletsReload(boolean insertAllBulletsReload)`

  `void`

  `setJamGunChance(float jamGunChance)`

  `void`

  `setJammed(boolean isJammed)`

  `void`

  `setKnockBackOnNoDeath(boolean knockBackOnNoDeath)`

  `void`

  `setKnockdownMod(float knockdownMod)`

  `void`

  `setMagazineType(String magazineType)`

  `void`

  `setMaxAngle(float maxAngle)`

  `void`

  `setMaxDamage(float maxDamage)`

  `void`

  `setMaxHitCount(int maxHitCount)`

  `void`

  `setMaxRange(float maxRange)`

  `void`

  `setMaxSightRange(float value)`

  `void`

  `setMinAngle(float minAngle)`

  `void`

  `setMinDamage(float minDamage)`

  `void`

  `setMinimumSwingTime(float minimumSwingTime)`

  `void`

  `setMinRange(float minRange)`

  `void`

  `setMinRangeRanged(float minRangeRanged)`

  `void`

  `setMinSightRange(float value)`

  `void`

  `setModelWeaponPart(ArrayList<ModelWeaponPart> modelWeaponPart)`

  `void`

  `setMultipleHitConditionAffected(boolean multipleHitConditionAffected)`

  `void`

  `setMuzzleFlashModelKey(ModelKey muzzleFlashModelKey)`

  `void`

  `setNoiseFactor(float noiseFactor)`

  `void`

  `setNoiseRange(int noiseRange)`

  `void`

  `setOriginalWeaponSprite(String originalWeaponSprite)`

  `void`

  `setOtherBoost(float otherBoost)`

  `void`

  `setOtherHandRequire(ItemTag otherHandRequire)`

  `void`

  `setOtherHandUse(boolean otherHandUse)`

  `void`

  `setPhysicsObject(String physicsObject)`

  `void`

  `setPiercingBullets(boolean piercingBullets)`

  `void`

  `setPlacedSprite(String placedSprite)`

  `void`

  `setProjectileCount(int count)`

  `void`

  `setProjectileSpread(float projectileSpread)`

  `void`

  `setProjectileWeightCenter(float projectileWeightCenter)`

  `void`

  `setPushBackMod(float pushBackMod)`

  `void`

  `setRackAfterShoot(boolean rackAfterShoot)`

  `void`

  `setRackSound(String rackSound)`

  `void`

  `setRanged(boolean ranged)`

  `void`

  `setRangeFalloff(boolean rangeFalloff)`

  `void`

  `setRecoilDelay(int recoilDelay)`

  `void`

  `setReloadTime(int reloadTime)`

  `void`

  `setRoundChambered(boolean roundChambered)`

  `void`

  `setScriptItem(Item scriptItem)`

  `void`

  `setSensorRange(int sensorRange)`

  `void`

  `setShareEndurance(boolean shareEndurance)`

  `void`

  `setShellFallSound(String shellFallSound)`

  `void`

  `setSmokeRange(int smokeRange)`

  `void`

  `setSoundGain(float soundGain)`

  `void`

  `setSoundRadius(int soundRadius)`

  `void`

  `setSoundVolume(int soundVolume)`

  `void`

  `setSpentRoundChambered(boolean roundChambered)`

  `void`

  `setSpentRoundCount(int count)`

  `void`

  `setSplatBloodOnNoDeath(boolean splatBloodOnNoDeath)`

  `void`

  `setSplatNumber(int splatNumber)`

  `void`

  `setSubCategory(String subcategory)`

  `void`

  `setSwingSound(String swingSound)`

  `void`

  `setSwingTime(float swingTime)`

  `void`

  `setToHitModifier(float toHitModifier)`

  `void`

  `setTreeDamage(int treeDamage)`

  `void`

  `setTriggerExplosionTimer(int triggerExplosionTimer)`

  `void`

  `setUseEndurance(boolean useEndurance)`

  `void`

  `setUseSelf(boolean useSelf)`

  `void`

  `setWeaponCategories(Set<WeaponCategory> weaponCategories)`

  `void`

  `setWeaponLength(float weaponLength)`

  `void`

  `setWeaponPart(String partType,
  WeaponPart part)`

  `void`

  `setWeaponPart(WeaponPart part)`

  `void`

  `setWeaponReloadType(WeaponReloadType weaponReloadType)`

  `void`

  `setWeaponSprite(String weaponSprite)`

  `void`

  `setWeaponSpritesByIndex(ArrayList<String> weaponSpritesByIndex)`

  `void`

  `setZombieHitSound(String hitSound)`

  `void`

  `update()`

  `boolean`

  `usesExternalMagazine()`

  ### Methods inherited from class [InventoryItem](../InventoryItem.html#method-summary "class in zombie.inventory")

  `addExtraItem, addExtraItem, allowRandomTint, applyMaxSharpness, calculateTimeMultiplier, canBeEquipped, canBeRemote, canHaveOrigin, CanStack, canStoreWater, checkSyncItemFields, copyBloodLevelFrom, copyClothing, copyConditionModData, copyConditionStatesFrom, copyModData, CopyModData, copyTimesHeadRepairedFrom, copyTimesHeadRepairedTo, copyTimesRepairedFrom, copyTimesRepairedTo, createAndStoreDefaultDeadBody, createCloneItem, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, damageCheck, doBreakSound, doBuildingStash, doDamagedSound, DoTooltip, DoTooltipEmbedded, emptyLiquid, finishupdate, getA, getActualWeightUnmodded, getAge, getAimReleaseSound, getAlcoholPower, getAlternateModelName, getAmmoType, getAnimalFeedType, getAnimalTracks, getAttachedSlot, getAttachedSlotType, getAttachedToModel, getAttachmentReplacement, getAttachmentsProvided, getAttachmentType, getB, getBandagePower, getBlood, getBloodClothingType, getBloodLevelAdjustedHigh, getBloodLevelAdjustedLow, getBodyLocation, getBookSubjects, getBoredomChange, getBrakeForce, getBreakSound, getBringToBearSound, getBulletHitArmourSound, getBurntString, getByteData, getChanceToSpawnDamaged, getCleanString, getClothingItem, getClothingItemExtra, getClothingItemExtraOption, getClothingItemName, getColor, getColorBlue, getColorGreen, getColorInfo, getColorRed, getCondition, getConditionLowerNormal, getConditionLowerOffroad, getConditionMax, getConsolidateOption, getContainer, getContainerX, getContainerY, getCookedString, getCookingTime, getCount, getCountDownSound, getCoverType, getCurrentAmmoCount, getCurrentCondition, getCurrentUses, getCurrentUsesFloat, getCustomMenuOption, getDamagedSound, getDeadBodyObject, getDescription, getDigType, getDirt, getDiscomfortModifier, getDisplayCategory, getDisplayName, getDoubleClickRecipe, getDropSound, getDurability, getEatTime, getEatType, getEngineLoudness, getEntityNetID, getEquipParent, getEquippedWeight, getEquipSound, getEvolvedRecipeName, getExplosionSound, getExtinguishedItem, getExtraItems, getExtraItemsWeight, getFabricType, getFatigueChange, getFileName, getFillFromDispenserSound, getFillFromLakeSound, getFillFromTapSound, getFillFromToiletSound, getFireFuelRatio, getFluidContainerFromSelfOrWorldItem, getFoodSicknessChange, getFullType, getG, getGameEntityType, getGunType, getGunTypeString, getHaveBeenRepaired, getHeadCondition, getHeadConditionLowerChance, getHeadConditionLowerChanceMultiplier, getHeadConditionMax, getHearingModifier, getHotbarEquippedWeight, getIcon, getIconsForTexture, getID, getInverseCoughProbability, getInverseCoughProbabilitySmoker, getInvHeat, getIsCraftingConsumed, getItemAfterCleaning, getItemCapacity, getItemHeat, getItemReplacementPrimaryHand, getItemReplacementSecondHand, getItemWhenDry, getJobDelta, getJobType, getKeyId, getLastAged, getLootType, getLuaCreate, getMagazineSubjects, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMaintenanceMod, getMakeUpType, getMaxAmmo, getMaxCapacity, getMaxMilk, getMaxSharpness, getMaxUses, getMechanicType, getMediaData, getMediaType, getMeltingTime, getMetalValue, getMilkReplaceItem, getMinutesToBurn, getMinutesToCook, getModData, getModelIndex, getModID, getModName, getModule, getName, getName, getNoRecipesModDataString, getOffAge, getOffAgeMax, getOffString, getOnBreak, getOpeningRecipe, getOriginX, getOriginY, getOriginZ, getOutermostContainer, getOwner, getOwnerPlayer, getPlaceMultipleSound, getPlaceOneSound, getPlayer, getPourLiquidOnGroundSound, getPourType, getPreviousOwner, getQuality, getR, getRecordedMediaIndex, getReduceInfectionPower, getRegistry_id, getRemoteControlID, getRemoteRange, getReplaceOnExtinguish, getReplaceOnUse, getReplaceOnUseFullType, getReplaceOnUseOn, getReplaceOnUseOnString, getReplaceType, getReplaceTypes, getReplaceTypesMap, getRequireInHandOrInventory, getResearchableRecipes, getResearchableRecipes, getRightClickContainer, getScriptItem, getSharpness, getSharpnessIncrement, getSharpnessMultiplier, getShoutMultiplier, getShoutType, getSoundByID, getSoundLimiterGroupID, getSoundParameter, getSquare, getStashChance, getStashMap, getStaticModelsByIndex, getStrainModifier, getStressChange, getStringItemType, getSuspensionCompression, getSuspensionDamping, getSwingAnim, getTags, getTaken, getTex, getTexture, getTextureBurnt, getTextureColorMask, getTextureCooked, getTextureFluidMask, getTexturerotten, getTimesHeadRepaired, getTimesRepaired, getTooltip, getType, getUnCookedString, getUnequippedWeight, getUnequipSound, getUnhappyChange, getUseDelta, getUser, getUses, getVisionModifier, getVisual, getWeaponHitArmourSound, getWeaponLevel, getWetCooldown, getWetness, getWheelFriction, getWithDrainable, getWithoutDrainable, getWorker, getWorldAlpha, getWorldItem, getWorldObjectSprite, getWorldStaticItem, getWorldStaticModel, getWorldStaticModelsByIndex, getWorldTexture, getWorldXRotation, getWorldYRotation, getWorldZRotation, getX, getY, getZ, hasBeenHeard, hasBeenSeen, hasBlood, hasDirt, hasHeadCondition, hasMetal, hasModData, hasOrigin, hasQuality, hasReplaceType, hasResearchableRecipes, hasSharpness, hasTag, hasTag, hasTimesHeadRepaired, hasWorldItem, haveExtraItems, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, headConditionCheck, HowRotten, incrementCondition, inheritFoodAgeFrom, inheritOlderFoodAge, initialiseItem, is, isActivated, isAlcoholic, isAlwaysWelcomeGift, isAnimalCorpse, isAnimalFeed, isBeingFilled, isBloody, isBodyLocation, isBroken, isBurnt, isCanBandage, IsClothing, isConditionAffectsCapacity, isCookable, isCooked, isCustomColor, isCustomName, isCustomWeight, isDamaged, isDisappearOnUse, isDoingExtendedPlacement, IsDrainable, isDull, isEmittingLight, isEmptyOfFluid, isEntityValid, isEquipped, isEquippedNoSprint, isFakeEquipped, isFakeEquipped, isFavorite, isFavouriteRecipeInput, isFishingLure, isFluidContainer, isFood, IsFood, isForceDropHeavyItem, isFullOfFluid, isHidden, isHumanCorpse, isInfected, isInitialised, isInLocalPlayerInventory, isInPlayerInventory, isInsideBagOnSquare, IsInventoryContainer, isIsCookable, isItemType, isKeepOnDeplete, isKeyRing, IsLiterature, IsMap, isMemento, isNoRecipes, isOnGroundOnSquare, isOnGroundOrInsideBagOnSquare, isProtectFromRainWhileEquipped, isPureWater, isRecordedMedia, isRemoteController, isRequiresEquippedBothHands, IsRotten, isSealed, isSharpenable, isSpice, isTrap, isTwoHandWeapon, isUnwanted, isUseWorldItem, isVanilla, isVisualAid, isWaterOnlySource, isWaterSource, isWet, isWorn, loadCorpseFromByteData, loadItem, loadItem, loadItem, ModDataMatches, monogramAfterDescriptor, nameAfterDescriptor, OnAddedToContainer, OnBeforeRemoveFromContainer, onBreak, playActivateDeactivateSound, playSoundOnPlayer, playSoundOnPlayer, randomizeCondition, randomizeGeneralCondition, randomizeHeadCondition, randomizeSharpness, randomizeWorldZRotation, reduceCondition, reduceHeadCondition, registerWithSoundLimiter, Remove, RemoveFromContainer, researchRecipes, saveWithSize, setActivatedRemote, setActualWeight, setAge, setAlcoholic, setAlcoholPower, setAmmoType, setAnimalTracks, setAttachedSlot, setAttachedSlotType, setAttachedToModel, setAttachmentReplacement, setAttachmentsProvided, setAttachmentType, setAutoAge, setBandagePower, setBeingFilled, setBlood, setBloodClothingType, setBoredomChange, setBrakeForce, setBreakSound, setBroken, setBurnt, setBurntString, setCanBeActivated, setCanBeRemote, setChanceToSpawnDamaged, setColor, setColorBlue, setColorGreen, setColorRed, setCondition, setCondition, setConditionFrom, setConditionFromHeadCondition, setConditionFromModData, setConditionLowerNormal, setConditionLowerOffroad, setConditionMax, setConditionNoSound, setConditionTo, setConditionWhileLoading, setContainer, SetContainerPosition, setContainerX, setContainerY, setCooked, setCookedString, setCookingTime, setCount, setCountDownSound, setCurrentAmmoCount, setCurrentUses, setCurrentUsesFloat, setCurrentUsesFrom, setCustomColor, setCustomMenuOption, setCustomName, setCustomWeight, setDescription, setDirt, setDisplayCategory, setDoingExtendedPlacement, setDurability, setEngineLoudness, setEquipParent, setEquipParent, setEvolvedRecipeName, setExplosionSound, setFatigueChange, setFavorite, setFavorite, setFoodSicknessChange, setGunType, setHaveBeenRepaired, setHeadCondition, setHeadConditionFromCondition, setIcon, setIconsForTexture, setID, setInfected, setInitialised, setInverseCoughProbability, setInverseCoughProbabilitySmoker, setIsCookable, setIsCraftingConsumed, setItemCapacity, setItemHeat, setItemType, setItemWhenDry, setJobDelta, setJobType, setKeyId, setLastAged, setLightDistance, setLightStrength, setMaxAmmo, setMaxCapacity, setMediaType, setMeltingTime, setMetalValue, setMinutesToBurn, setMinutesToCook, setModelIndex, setModule, setName, setNoRecipes, setOffAge, setOffAgeMax, setOffString, setOrigin, setOrigin, setOrigin, setOriginX, setOriginY, setOriginZ, setPreviousOwner, setQuality, setRecordedMediaData, setRecordedMediaIndex, setRecordedMediaIndexInteger, setReduceInfectionPower, setRegistry_id, setRemoteControlID, setRemoteController, setRemoteRange, setReplaceOnUse, setReplaceOnUseOn, setRequireInHandOrInventory, setRightClickContainer, setSharpness, setSharpnessFrom, setStashChance, setStashMap, setStaticModel, setStaticModel, setStaticModelsByIndex, setStressChange, setSuspensionCompression, setSuspensionDamping, setTaken, setTexture, setTextureBurnt, setTextureColorMask, setTextureCooked, setTextureFluidMask, setTexturerotten, setTimesHeadRepaired, setTimesRepaired, setTooltip, setTorchCone, setType, setUnCookedString, setUnhappyChange, setUnwanted, setUseDelta, setUses, setUsesFrom, setWeight, setWet, setWetCooldown, setWheelFriction, setWorker, setWorldAlpha, setWorldItem, setWorldScale, setWorldStaticItem, setWorldStaticModel, setWorldStaticModel, setWorldStaticModelsByIndex, setWorldTexture, setWorldXRotation, setWorldYRotation, setWorldZRotation, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, sharpnessCheck, shouldUpdateInWorld, stopEquippedAndActivatedSound, stopSoundOnPlayer, storeInByteData, SynchSpawn, synchWithVisual, syncItemFields, toString, tryGetWorldStaticModelByIndex, unsealIfNotFull, updateAge, updateEquippedAndActivatedSound, updateEquippedAndActivatedSound, updateSound, updateSound, Use, Use, Use, UseAndSync, UseForCrafting, UseItem`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.interfaces.IUpdater

  `renderlast`

* Field Details
  -------------

  + ### MAX\_ATTACHMENT\_COUNT

    public static final int MAX\_ATTACHMENT\_COUNT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.HandWeapon.MAX_ATTACHMENT_COUNT)
  + ### weaponLength

    public float weaponLength
  + ### splatSize

    public float splatSize
  + ### ammoPerShoot

    private int ammoPerShoot
  + ### magazineType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") magazineType
  + ### angleFalloff

    private boolean angleFalloff
  + ### canBarricade

    private boolean canBarricade
  + ### doSwingBeforeImpact

    private float doSwingBeforeImpact
  + ### impactSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") impactSound
  + ### knockBackOnNoDeath

    private boolean knockBackOnNoDeath
  + ### maxAngle

    private float maxAngle
  + ### maxDamage

    private float maxDamage
  + ### maxHitCount

    private int maxHitCount
  + ### maxRange

    private float maxRange
  + ### ranged

    private boolean ranged
  + ### minAngle

    private float minAngle
  + ### minDamage

    private float minDamage
  + ### minimumSwingTime

    private float minimumSwingTime
  + ### minRange

    private float minRange
  + ### noiseFactor

    private float noiseFactor
  + ### otherHandRequire

    private [ItemTag](../../scripting/objects/ItemTag.html "class in zombie.scripting.objects") otherHandRequire
  + ### otherHandUse

    private boolean otherHandUse
  + ### physicsObject

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") physicsObject
  + ### pushBackMod

    private float pushBackMod
  + ### rangeFalloff

    private boolean rangeFalloff
  + ### soundRadius

    private int soundRadius
  + ### soundVolume

    private int soundVolume
  + ### splatBloodOnNoDeath

    private boolean splatBloodOnNoDeath
  + ### splatNumber

    private int splatNumber
  + ### swingSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") swingSound
  + ### swingTime

    private float swingTime
  + ### toHitModifier

    private float toHitModifier
  + ### useEndurance

    private boolean useEndurance
  + ### useSelf

    private boolean useSelf
  + ### weaponSprite

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weaponSprite
  + ### originalWeaponSprite

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalWeaponSprite
  + ### otherBoost

    private float otherBoost
  + ### doorDamage

    private int doorDamage
  + ### doorHitSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") doorHitSound
  + ### conditionLowerChance

    private int conditionLowerChance
  + ### multipleHitConditionAffected

    private boolean multipleHitConditionAffected
  + ### shareEndurance

    private boolean shareEndurance
  + ### alwaysKnockdown

    private boolean alwaysKnockdown
  + ### enduranceMod

    private float enduranceMod
  + ### knockdownMod

    private float knockdownMod
  + ### cantAttackWithLowestEndurance

    private boolean cantAttackWithLowestEndurance
  + ### isAimedFirearm

    public boolean isAimedFirearm
  + ### isAimedHandWeapon

    public boolean isAimedHandWeapon
  + ### runAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runAnim
  + ### idleAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") idleAnim
  + ### hitAngleMod

    public float hitAngleMod
  + ### subCategory

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory
  + ### weaponCategories

    private [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[WeaponCategory](../../scripting/objects/WeaponCategory.html "class in zombie.scripting.objects")> weaponCategories
  + ### aimingPerkCritModifier

    private int aimingPerkCritModifier
  + ### aimingPerkRangeModifier

    private float aimingPerkRangeModifier
  + ### aimingPerkHitChanceModifier

    private float aimingPerkHitChanceModifier
  + ### hitChance

    private int hitChance
  + ### aimingPerkMinAngleModifier

    private float aimingPerkMinAngleModifier
  + ### recoilDelay

    private int recoilDelay
  + ### piercingBullets

    private boolean piercingBullets
  + ### soundGain

    private float soundGain
  + ### attachments

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [WeaponPart](WeaponPart.html "class in zombie.inventory.types")> attachments
  + ### attachmentList

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> attachmentList
  + ### activeSight

    public [WeaponPart](WeaponPart.html "class in zombie.inventory.types") activeSight
  + ### activeLight

    private [WeaponPart](WeaponPart.html "class in zombie.inventory.types") activeLight
  + ### clipSize

    private int clipSize
  + ### reloadTime

    private int reloadTime
  + ### aimingTime

    private int aimingTime
  + ### minRangeRanged

    private float minRangeRanged
  + ### minSightRange

    private float minSightRange
  + ### maxSightRange

    private float maxSightRange
  + ### treeDamage

    private int treeDamage
  + ### bulletOutSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bulletOutSound
  + ### shellFallSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shellFallSound
  + ### triggerExplosionTimer

    private int triggerExplosionTimer
  + ### canBePlaced

    private boolean canBePlaced
  + ### explosionRange

    private int explosionRange
  + ### explosionPower

    private int explosionPower
  + ### fireRange

    private int fireRange
  + ### fireStartingEnergy

    private int fireStartingEnergy
  + ### fireStartingChance

    private int fireStartingChance
  + ### smokeRange

    private int smokeRange
  + ### noiseRange

    private int noiseRange
  + ### extraDamage

    private float extraDamage
  + ### explosionTimer

    private int explosionTimer
  + ### explosionDuration

    private int explosionDuration
  + ### placedSprite

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") placedSprite
  + ### canBeReused

    private boolean canBeReused
  + ### sensorRange

    private int sensorRange
  + ### criticalDamageMultiplier

    private float criticalDamageMultiplier
  + ### baseSpeed

    private float baseSpeed
  + ### bloodLevel

    private float bloodLevel
  + ### ammoBox

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ammoBox
  + ### rackSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rackSound
  + ### clickSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound
  + ### containsClip

    private boolean containsClip
  + ### weaponReloadType

    private [WeaponReloadType](../../scripting/objects/WeaponReloadType.html "enum class in zombie.scripting.objects") weaponReloadType
  + ### rackAfterShoot

    private boolean rackAfterShoot
  + ### roundChambered

    private boolean roundChambered
  + ### spentRoundChambered

    private boolean spentRoundChambered
  + ### spentRoundCount

    private int spentRoundCount
  + ### jamGunChance

    private float jamGunChance
  + ### projectileCount

    private int projectileCount
  + ### projectileSpread

    private float projectileSpread
  + ### projectileWeightCenter

    private float projectileWeightCenter
  + ### aimingMod

    private final float aimingMod

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.types.HandWeapon.aimingMod)
  + ### criticalChance

    private float criticalChance
  + ### hitSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitSound
  + ### isJammed

    private boolean isJammed
  + ### modelWeaponPart

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelWeaponPart](../../scripting/objects/ModelWeaponPart.html "class in zombie.scripting.objects")> modelWeaponPart
  + ### haveChamber

    private boolean haveChamber
  + ### bulletName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bulletName
  + ### damageCategory

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") damageCategory
  + ### damageMakeHole

    private boolean damageMakeHole
  + ### hitFloorSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitFloorSound
  + ### insertAllBulletsReload

    private boolean insertAllBulletsReload
  + ### fireMode

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fireMode
  + ### cyclicRateMultiplier

    private float cyclicRateMultiplier
  + ### fireModePossibilities

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fireModePossibilities
  + ### weaponSpritesByIndex

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> weaponSpritesByIndex
  + ### attackTargetSquare

    private [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") attackTargetSquare
  + ### isMelee

    private boolean isMelee
  + ### isExplosive

    private boolean isExplosive
  + ### magazineComparator

    private static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> magazineComparator
  + ### muzzleFlashModelKey

    private [ModelKey](../../scripting/objects/ModelKey.html "class in zombie.scripting.objects") muzzleFlashModelKey
* Constructor Details
  -------------------

  + ### HandWeapon

    public HandWeapon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texName)
  + ### HandWeapon

    public HandWeapon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
* Method Details
  --------------

  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()

    Overrides:
    :   `getCategory` in class `InventoryItem`
  + ### IsWeapon

    public boolean IsWeapon()

    Overrides:
    :   `IsWeapon` in class `InventoryItem`
  + ### getSplatSize

    public float getSplatSize()
  + ### getScore

    public float getScore([SurvivorDesc](../../characters/SurvivorDesc.html "class in zombie.characters") desc)

    Overrides:
    :   `getScore` in class `InventoryItem`
  + ### getActualWeight

    public float getActualWeight()

    Overrides:
    :   `getActualWeight` in class `InventoryItem`
  + ### getWeight

    public float getWeight()

    Overrides:
    :   `getWeight` in class `InventoryItem`
  + ### getEffectiveWeight

    public float getEffectiveWeight()
  + ### getContentsWeight

    public float getContentsWeight()

    Overrides:
    :   `getContentsWeight` in class `InventoryItem`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `InventoryItem`
  + ### getDamageMod

    public float getDamageMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getRangeMod

    public float getRangeMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getFatigueMod

    public float getFatigueMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getKnockbackMod

    public float getKnockbackMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getSpeedMod

    public float getSpeedMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getToHitMod

    public float getToHitMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getPerk

    public [PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getPerk()
  + ### muscleStrainMod

    public float muscleStrainMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getWeaponSkill

    public int getWeaponSkill([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isAngleFalloff

    public boolean isAngleFalloff()
  + ### setAngleFalloff

    public void setAngleFalloff(boolean angleFalloff)
  + ### isCanBarracade

    public boolean isCanBarracade()
  + ### setCanBarracade

    public void setCanBarracade(boolean bCanBarracade)
  + ### getDoSwingBeforeImpact

    public float getDoSwingBeforeImpact()
  + ### setDoSwingBeforeImpact

    public void setDoSwingBeforeImpact(float doSwingBeforeImpact)
  + ### getImpactSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getImpactSound()
  + ### setImpactSound

    public void setImpactSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") impactSound)
  + ### isKnockBackOnNoDeath

    public boolean isKnockBackOnNoDeath()
  + ### setKnockBackOnNoDeath

    public void setKnockBackOnNoDeath(boolean knockBackOnNoDeath)
  + ### getMaxAngle

    public float getMaxAngle()
  + ### setMaxAngle

    public void setMaxAngle(float maxAngle)
  + ### getMaxDamage

    public float getMaxDamage()
  + ### setMaxDamage

    public void setMaxDamage(float maxDamage)
  + ### getMaxHitCount

    public int getMaxHitCount()
  + ### setMaxHitCount

    public void setMaxHitCount(int maxHitCount)
  + ### getMaxRange

    public float getMaxRange()
  + ### getMaxRange

    public float getMaxRange([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### setMaxRange

    public void setMaxRange(float maxRange)
  + ### isRanged

    public boolean isRanged()
  + ### setRanged

    public void setRanged(boolean ranged)
  + ### getMinAngle

    public float getMinAngle()
  + ### setMinAngle

    public void setMinAngle(float minAngle)
  + ### getMinDamage

    public float getMinDamage()
  + ### setMinDamage

    public void setMinDamage(float minDamage)
  + ### getMinimumSwingTime

    public float getMinimumSwingTime()
  + ### setMinimumSwingTime

    public void setMinimumSwingTime(float minimumSwingTime)
  + ### getMinRange

    public float getMinRange()
  + ### setMinRange

    public void setMinRange(float minRange)
  + ### getNoiseFactor

    public float getNoiseFactor()
  + ### setNoiseFactor

    public void setNoiseFactor(float noiseFactor)
  + ### getOtherHandRequire

    public [ItemTag](../../scripting/objects/ItemTag.html "class in zombie.scripting.objects") getOtherHandRequire()
  + ### setOtherHandRequire

    public void setOtherHandRequire([ItemTag](../../scripting/objects/ItemTag.html "class in zombie.scripting.objects") otherHandRequire)
  + ### isOtherHandUse

    public boolean isOtherHandUse()
  + ### setOtherHandUse

    public void setOtherHandUse(boolean otherHandUse)
  + ### getPhysicsObject

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPhysicsObject()
  + ### setPhysicsObject

    public void setPhysicsObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") physicsObject)
  + ### getPushBackMod

    public float getPushBackMod()
  + ### setPushBackMod

    public void setPushBackMod(float pushBackMod)
  + ### isRangeFalloff

    public boolean isRangeFalloff()
  + ### setRangeFalloff

    public void setRangeFalloff(boolean rangeFalloff)
  + ### getSoundRadius

    public int getSoundRadius()
  + ### setSoundRadius

    public void setSoundRadius(int soundRadius)
  + ### getSoundVolume

    public int getSoundVolume()
  + ### setSoundVolume

    public void setSoundVolume(int soundVolume)
  + ### isSplatBloodOnNoDeath

    public boolean isSplatBloodOnNoDeath()
  + ### setSplatBloodOnNoDeath

    public void setSplatBloodOnNoDeath(boolean splatBloodOnNoDeath)
  + ### getSplatNumber

    public int getSplatNumber()
  + ### setSplatNumber

    public void setSplatNumber(int splatNumber)
  + ### getSwingSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSwingSound()
  + ### setSwingSound

    public void setSwingSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") swingSound)
  + ### getSwingTime

    public float getSwingTime()
  + ### setSwingTime

    public void setSwingTime(float swingTime)
  + ### getToHitModifier

    public float getToHitModifier()
  + ### setToHitModifier

    public void setToHitModifier(float toHitModifier)
  + ### isUseEndurance

    public boolean isUseEndurance()
  + ### setUseEndurance

    public void setUseEndurance(boolean useEndurance)
  + ### isUseSelf

    public boolean isUseSelf()
  + ### setUseSelf

    public void setUseSelf(boolean useSelf)
  + ### getWeaponSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWeaponSprite()
  + ### setWeaponSprite

    public void setWeaponSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weaponSprite)
  + ### getOtherBoost

    public float getOtherBoost()
  + ### setOtherBoost

    public void setOtherBoost(float otherBoost)
  + ### getDoorDamage

    public int getDoorDamage()
  + ### setDoorDamage

    public void setDoorDamage(int doorDamage)
  + ### getDoorHitSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDoorHitSound()
  + ### setDoorHitSound

    public void setDoorHitSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") doorHitSound)
  + ### getConditionLowerChance

    public int getConditionLowerChance()

    Overrides:
    :   `getConditionLowerChance` in class `InventoryItem`
  + ### setConditionLowerChance

    public void setConditionLowerChance(int conditionLowerChance)
  + ### isMultipleHitConditionAffected

    public boolean isMultipleHitConditionAffected()
  + ### setMultipleHitConditionAffected

    public void setMultipleHitConditionAffected(boolean multipleHitConditionAffected)
  + ### isShareEndurance

    public boolean isShareEndurance()
  + ### setShareEndurance

    public void setShareEndurance(boolean shareEndurance)
  + ### isAlwaysKnockdown

    public boolean isAlwaysKnockdown()
  + ### setAlwaysKnockdown

    public void setAlwaysKnockdown(boolean alwaysKnockdown)
  + ### getEnduranceMod

    public float getEnduranceMod()
  + ### setEnduranceMod

    public void setEnduranceMod(float enduranceMod)
  + ### getKnockdownMod

    public float getKnockdownMod()
  + ### setKnockdownMod

    public void setKnockdownMod(float knockdownMod)
  + ### isCantAttackWithLowestEndurance

    public boolean isCantAttackWithLowestEndurance()
  + ### setCantAttackWithLowestEndurance

    public void setCantAttackWithLowestEndurance(boolean cantAttackWithLowestEndurance)
  + ### isAimedFirearm

    public boolean isAimedFirearm()
  + ### isAimedFirearm

    public static boolean isAimedFirearm([HandWeapon](HandWeapon.html "class in zombie.inventory.types") handWeapon)
  + ### isAimedHandWeapon

    public boolean isAimedHandWeapon()
  + ### getProjectileCount

    public int getProjectileCount()
  + ### setProjectileCount

    public void setProjectileCount(int count)
  + ### getProjectileSpread

    public float getProjectileSpread()
  + ### setProjectileSpread

    public void setProjectileSpread(float projectileSpread)
  + ### getProjectileWeightCenter

    public float getProjectileWeightCenter()
  + ### setProjectileWeightCenter

    public void setProjectileWeightCenter(float projectileWeightCenter)
  + ### setMuzzleFlashModelKey

    public void setMuzzleFlashModelKey([ModelKey](../../scripting/objects/ModelKey.html "class in zombie.scripting.objects") muzzleFlashModelKey)
  + ### getMuzzleFlashModelKey

    public [ModelKey](../../scripting/objects/ModelKey.html "class in zombie.scripting.objects") getMuzzleFlashModelKey()
  + ### getAimingMod

    public float getAimingMod()
  + ### isAimed

    public boolean isAimed()
  + ### setCriticalChance

    public void setCriticalChance(float criticalChance)
  + ### getCriticalChance

    public float getCriticalChance()
  + ### setSubCategory

    public void setSubCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subcategory)
  + ### getSubCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSubCategory()
  + ### setZombieHitSound

    public void setZombieHitSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitSound)
  + ### getZombieHitSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getZombieHitSound()
  + ### isOfWeaponCategory

    public boolean isOfWeaponCategory([WeaponCategory](../../scripting/objects/WeaponCategory.html "class in zombie.scripting.objects") weaponCategory)
  + ### setWeaponCategories

    public void setWeaponCategories([Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[WeaponCategory](../../scripting/objects/WeaponCategory.html "class in zombie.scripting.objects")> weaponCategories)
  + ### getAimingPerkCritModifier

    public int getAimingPerkCritModifier()
  + ### setAimingPerkCritModifier

    public void setAimingPerkCritModifier(int aimingPerkCritModifier)
  + ### getAimingPerkRangeModifier

    public float getAimingPerkRangeModifier()
  + ### setAimingPerkRangeModifier

    public void setAimingPerkRangeModifier(float aimingPerkRangeModifier)
  + ### getHitChance

    public int getHitChance()
  + ### setHitChance

    public void setHitChance(int hitChance)
  + ### getAimingPerkHitChanceModifier

    public float getAimingPerkHitChanceModifier()
  + ### setAimingPerkHitChanceModifier

    public void setAimingPerkHitChanceModifier(float aimingPerkHitChanceModifier)
  + ### getAimingPerkMinAngleModifier

    public float getAimingPerkMinAngleModifier()
  + ### setAimingPerkMinAngleModifier

    public void setAimingPerkMinAngleModifier(float aimingPerkMinAngleModifier)
  + ### getRecoilDelay

    public int getRecoilDelay()
  + ### getRecoilDelay

    public int getRecoilDelay([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### setRecoilDelay

    public void setRecoilDelay(int recoilDelay)
  + ### isPiercingBullets

    public boolean isPiercingBullets()
  + ### setPiercingBullets

    public void setPiercingBullets(boolean piercingBullets)
  + ### getSoundGain

    public float getSoundGain()
  + ### setSoundGain

    public void setSoundGain(float soundGain)
  + ### getClipSize

    public int getClipSize()
  + ### setClipSize

    public void setClipSize(int capacity)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `InventoryItem`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `InventoryItem`

    Throws:
    :   `IOException`
  + ### getActiveLight

    public [WeaponPart](WeaponPart.html "class in zombie.inventory.types") getActiveLight()
  + ### setActiveLight

    public void setActiveLight([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### getActiveSight

    public [WeaponPart](WeaponPart.html "class in zombie.inventory.types") getActiveSight()
  + ### setActiveSight

    public void setActiveSight([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### setMinSightRange

    public void setMinSightRange(float value)
  + ### getMinSightRange

    public float getMinSightRange()
  + ### getMinSightRange

    public float getMinSightRange([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### setMaxSightRange

    public void setMaxSightRange(float value)
  + ### getMaxSightRange

    public float getMaxSightRange()
  + ### getMaxSightRange

    public float getMaxSightRange([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getLowLightBonus

    public float getLowLightBonus()
  + ### getMinRangeRanged

    public float getMinRangeRanged()
  + ### setMinRangeRanged

    public void setMinRangeRanged(float minRangeRanged)
  + ### getReloadTime

    public int getReloadTime()
  + ### setReloadTime

    public void setReloadTime(int reloadTime)
  + ### getAimingTime

    public int getAimingTime()
  + ### setAimingTime

    public void setAimingTime(int aimingTime)
  + ### getTreeDamage

    public int getTreeDamage()
  + ### setTreeDamage

    public void setTreeDamage(int treeDamage)
  + ### getBulletOutSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBulletOutSound()
  + ### setBulletOutSound

    public void setBulletOutSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bulletOutSound)
  + ### getShellFallSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShellFallSound()
  + ### setShellFallSound

    public void setShellFallSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shellFallSound)
  + ### addPartToList

    private void addPartToList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> list)
  + ### getAllWeaponParts

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> getAllWeaponParts()
  + ### getAllWeaponParts

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> getAllWeaponParts([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> result)
  + ### getDetachableWeaponParts

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WeaponPart](WeaponPart.html "class in zombie.inventory.types")> getDetachableWeaponParts([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### clearAllWeaponParts

    public void clearAllWeaponParts()
  + ### clearWeaponPart

    public void clearWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### clearWeaponPart

    public void clearWeaponPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partType)
  + ### setWeaponPart

    public void setWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### setWeaponPart

    public void setWeaponPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partType,
    [WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### getWeaponPart

    public [WeaponPart](WeaponPart.html "class in zombie.inventory.types") getWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### getWeaponPart

    public [WeaponPart](WeaponPart.html "class in zombie.inventory.types") getWeaponPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### getWeaponPartWeightModifier

    public float getWeaponPartWeightModifier([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getWeaponPartWeightModifier

    public float getWeaponPartWeightModifier([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### attachWeaponPart

    public void attachWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### attachWeaponPart

    public void attachWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part,
    boolean doChange)
  + ### attachWeaponPart

    public void attachWeaponPart([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### attachWeaponPart

    public void attachWeaponPart([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [WeaponPart](WeaponPart.html "class in zombie.inventory.types") part,
    boolean doChange)
  + ### detachAllWeaponParts

    public void detachAllWeaponParts()
  + ### detachWeaponPart

    public void detachWeaponPart([WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### detachWeaponPart

    public void detachWeaponPart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### detachWeaponPart

    public void detachWeaponPart([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [WeaponPart](WeaponPart.html "class in zombie.inventory.types") part)
  + ### detachWeaponPart

    public void detachWeaponPart([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [WeaponPart](WeaponPart.html "class in zombie.inventory.types") part,
    boolean doChange)
  + ### getTriggerExplosionTimer

    public int getTriggerExplosionTimer()
  + ### setTriggerExplosionTimer

    public void setTriggerExplosionTimer(int triggerExplosionTimer)
  + ### canBePlaced

    public boolean canBePlaced()
  + ### setCanBePlaced

    public void setCanBePlaced(boolean canBePlaced)
  + ### getExplosionRange

    public int getExplosionRange()
  + ### setExplosionRange

    public void setExplosionRange(int explosionRange)
  + ### getExplosionPower

    public int getExplosionPower()
  + ### setExplosionPower

    public void setExplosionPower(int explosionPower)
  + ### getFireRange

    public int getFireRange()
  + ### setFireRange

    public void setFireRange(int fireRange)
  + ### getSmokeRange

    public int getSmokeRange()
  + ### setSmokeRange

    public void setSmokeRange(int smokeRange)
  + ### getFireStartingEnergy

    public int getFireStartingEnergy()
  + ### setFireStartingEnergy

    public void setFireStartingEnergy(int fireStartingEnergy)
  + ### getFireStartingChance

    public int getFireStartingChance()
  + ### setFireStartingChance

    public void setFireStartingChance(int fireStartingChance)
  + ### getNoiseRange

    public int getNoiseRange()
  + ### setNoiseRange

    public void setNoiseRange(int noiseRange)
  + ### getNoiseDuration

    public int getNoiseDuration()
  + ### getExtraDamage

    public float getExtraDamage()
  + ### setExtraDamage

    public void setExtraDamage(float extraDamage)
  + ### getExplosionTimer

    public int getExplosionTimer()
  + ### setExplosionTimer

    public void setExplosionTimer(int explosionTimer)
  + ### getExplosionDuration

    public int getExplosionDuration()
  + ### setExplosionDuration

    public void setExplosionDuration(int seconds)
  + ### getPlacedSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlacedSprite()
  + ### setPlacedSprite

    public void setPlacedSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") placedSprite)
  + ### canBeReused

    public boolean canBeReused()
  + ### setCanBeReused

    public void setCanBeReused(boolean canBeReused)
  + ### getSensorRange

    public int getSensorRange()
  + ### setSensorRange

    public void setSensorRange(int sensorRange)
  + ### getRunAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRunAnim()
  + ### getCriticalDamageMultiplier

    public float getCriticalDamageMultiplier()
  + ### setCriticalDamageMultiplier

    public void setCriticalDamageMultiplier(float criticalDamageMultiplier)
  + ### getStaticModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStaticModel()

    Overrides:
    :   `getStaticModel` in class `InventoryItem`
  + ### getStaticModelException

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStaticModelException()

    Overrides:
    :   `getStaticModelException` in class `InventoryItem`
  + ### getBaseSpeed

    public float getBaseSpeed()
  + ### setBaseSpeed

    public void setBaseSpeed(float baseSpeed)
  + ### getBloodLevel

    public float getBloodLevel()

    Overrides:
    :   `getBloodLevel` in class `InventoryItem`
  + ### setBloodLevel

    public void setBloodLevel(float level)

    Overrides:
    :   `setBloodLevel` in class `InventoryItem`
  + ### setWeaponLength

    public void setWeaponLength(float weaponLength)
  + ### getAmmoBox

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmmoBox()
  + ### setAmmoBox

    public void setAmmoBox([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ammoBox)
  + ### getMagazineType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMagazineType()
  + ### setMagazineType

    public void setMagazineType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") magazineType)
  + ### getEjectAmmoStartSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEjectAmmoStartSound()
  + ### getEjectAmmoSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEjectAmmoSound()
  + ### getEjectAmmoStopSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEjectAmmoStopSound()
  + ### getInsertAmmoStartSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInsertAmmoStartSound()
  + ### getInsertAmmoSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInsertAmmoSound()
  + ### getInsertAmmoStopSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInsertAmmoStopSound()
  + ### getRackSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRackSound()
  + ### setRackSound

    public void setRackSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rackSound)
  + ### isReloadable

    public boolean isReloadable([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### isContainsClip

    public boolean isContainsClip()
  + ### setContainsClip

    public void setContainsClip(boolean containsClip)
  + ### getBestMagazine

    public [InventoryItem](../InventoryItem.html "class in zombie.inventory") getBestMagazine([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### getWeaponReloadType

    public [WeaponReloadType](../../scripting/objects/WeaponReloadType.html "enum class in zombie.scripting.objects") getWeaponReloadType()
  + ### setWeaponReloadType

    public void setWeaponReloadType([WeaponReloadType](../../scripting/objects/WeaponReloadType.html "enum class in zombie.scripting.objects") weaponReloadType)
  + ### isRackAfterShoot

    public boolean isRackAfterShoot()
  + ### setRackAfterShoot

    public void setRackAfterShoot(boolean rackAfterShoot)
  + ### isRoundChambered

    public boolean isRoundChambered()
  + ### setRoundChambered

    public void setRoundChambered(boolean roundChambered)
  + ### isSpentRoundChambered

    public boolean isSpentRoundChambered()
  + ### setSpentRoundChambered

    public void setSpentRoundChambered(boolean roundChambered)
  + ### getSpentRoundCount

    public int getSpentRoundCount()
  + ### setSpentRoundCount

    public void setSpentRoundCount(int count)
  + ### isManuallyRemoveSpentRounds

    public boolean isManuallyRemoveSpentRounds()
  + ### getAmmoPerShoot

    public int getAmmoPerShoot()
  + ### setAmmoPerShoot

    public void setAmmoPerShoot(int ammoPerShoot)
  + ### getJamGunChance

    public float getJamGunChance()
  + ### setJamGunChance

    public void setJamGunChance(float jamGunChance)
  + ### isJammed

    public boolean isJammed()
  + ### setJammed

    public void setJammed(boolean isJammed)
  + ### checkJam

    public boolean checkJam([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean racking)
  + ### checkUnJam

    public boolean checkUnJam([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getClickSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClickSound()
  + ### setClickSound

    public void setClickSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickSound)
  + ### getModelWeaponPart

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelWeaponPart](../../scripting/objects/ModelWeaponPart.html "class in zombie.scripting.objects")> getModelWeaponPart()
  + ### setModelWeaponPart

    public void setModelWeaponPart([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelWeaponPart](../../scripting/objects/ModelWeaponPart.html "class in zombie.scripting.objects")> modelWeaponPart)
  + ### getOriginalWeaponSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalWeaponSprite()
  + ### setOriginalWeaponSprite

    public void setOriginalWeaponSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalWeaponSprite)
  + ### haveChamber

    public boolean haveChamber()
  + ### setHaveChamber

    public void setHaveChamber(boolean haveChamber)
  + ### getDamageCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDamageCategory()
  + ### setDamageCategory

    public void setDamageCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") damageCategory)
  + ### isDamageMakeHole

    public boolean isDamageMakeHole()
  + ### setDamageMakeHole

    public void setDamageMakeHole(boolean damageMakeHole)
  + ### getHitFloorSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHitFloorSound()
  + ### setHitFloorSound

    public void setHitFloorSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hitFloorSound)
  + ### isInsertAllBulletsReload

    public boolean isInsertAllBulletsReload()
  + ### setInsertAllBulletsReload

    public void setInsertAllBulletsReload(boolean insertAllBulletsReload)
  + ### getFireMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFireMode()
  + ### setFireMode

    public void setFireMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fireMode)
  + ### isSelectFire

    public boolean isSelectFire()
  + ### cycleFireMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cycleFireMode()
  + ### getFireModePossibilities

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFireModePossibilities()
  + ### setFireModePossibilities

    public void setFireModePossibilities([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fireModePossibilities)
  + ### getCyclicRateMultiplier

    public float getCyclicRateMultiplier()
  + ### setCyclicRateMultiplier

    public void setCyclicRateMultiplier(float value)
  + ### randomizeBullets

    public int randomizeBullets()
  + ### canEmitLight

    public boolean canEmitLight()

    Overrides:
    :   `canEmitLight` in class `InventoryItem`
  + ### getLightStrength

    public float getLightStrength()

    Overrides:
    :   `getLightStrength` in class `InventoryItem`
  + ### isTorchCone

    public boolean isTorchCone()

    Overrides:
    :   `isTorchCone` in class `InventoryItem`
  + ### getTorchDot

    public float getTorchDot()

    Overrides:
    :   `getTorchDot` in class `InventoryItem`
  + ### getLightDistance

    public int getLightDistance()

    Overrides:
    :   `getLightDistance` in class `InventoryItem`
  + ### canBeActivated

    public boolean canBeActivated()

    Overrides:
    :   `canBeActivated` in class `InventoryItem`
  + ### getStopPower

    public float getStopPower()
  + ### isInstantExplosion

    public boolean isInstantExplosion()
  + ### setWeaponSpritesByIndex

    public void setWeaponSpritesByIndex([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> weaponSpritesByIndex)
  + ### getWeaponSpritesByIndex

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getWeaponSpritesByIndex()
  + ### usesExternalMagazine

    public boolean usesExternalMagazine()
  + ### inheritAmmunition

    public void inheritAmmunition([HandWeapon](HandWeapon.html "class in zombie.inventory.types") other)
  + ### isBareHands

    public boolean isBareHands()
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.interfaces.IUpdater`
  + ### setActivated

    public void setActivated(boolean activated)

    Overrides:
    :   `setActivated` in class `InventoryItem`
  + ### playActivateSound

    public void playActivateSound()

    Overrides:
    :   `playActivateSound` in class `InventoryItem`
  + ### playDeactivateSound

    public void playDeactivateSound()

    Overrides:
    :   `playDeactivateSound` in class `InventoryItem`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.interfaces.IUpdater`

    Overrides:
    :   `update` in class `InventoryItem`
  + ### canAttackPierceTransparentWall

    public boolean canAttackPierceTransparentWall([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](HandWeapon.html "class in zombie.inventory.types") handWeapon)
  + ### randomizeFirearmAsLoot

    public void randomizeFirearmAsLoot()
  + ### setAttackTargetSquare

    public void setAttackTargetSquare([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare)
  + ### getAttackTargetSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getAttackTargetSquare([Vector3](../../iso/Vector3.html "class in zombie.iso") attackPosition)
  + ### isMelee

    public boolean isMelee()
  + ### isExplosive

    public boolean isExplosive()
  + ### getStaggerBackTimeMod

    public float getStaggerBackTimeMod([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") wielder,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") target)
  + ### setScriptItem

    public void setScriptItem([Item](../../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem)

    Overrides:
    :   `setScriptItem` in class `InventoryItem`
  + ### needToBeClosedOnceReload

    public boolean needToBeClosedOnceReload()