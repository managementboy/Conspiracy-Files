[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MASK1\_FRONT](#MASK1_FRONT)
   2. [MASK1\_REAR](#MASK1_REAR)
   3. [MASK1\_DOOR\_RIGHT\_FRONT](#MASK1_DOOR_RIGHT_FRONT)
   4. [MASK1\_DOOR\_RIGHT\_REAR](#MASK1_DOOR_RIGHT_REAR)
   5. [MASK1\_DOOR\_LEFT\_FRONT](#MASK1_DOOR_LEFT_FRONT)
   6. [MASK1\_DOOR\_LEFT\_REAR](#MASK1_DOOR_LEFT_REAR)
   7. [MASK1\_WINDOW\_RIGHT\_FRONT](#MASK1_WINDOW_RIGHT_FRONT)
   8. [MASK1\_WINDOW\_RIGHT\_REAR](#MASK1_WINDOW_RIGHT_REAR)
   9. [MASK1\_WINDOW\_LEFT\_FRONT](#MASK1_WINDOW_LEFT_FRONT)
   10. [MASK1\_WINDOW\_LEFT\_REAR](#MASK1_WINDOW_LEFT_REAR)
   11. [MASK1\_WINDOW\_FRONT](#MASK1_WINDOW_FRONT)
   12. [MASK1\_WINDOW\_REAR](#MASK1_WINDOW_REAR)
   13. [MASK1\_GUARD\_RIGHT\_FRONT](#MASK1_GUARD_RIGHT_FRONT)
   14. [MASK1\_GUARD\_RIGHT\_REAR](#MASK1_GUARD_RIGHT_REAR)
   15. [MASK1\_GUARD\_LEFT\_FRONT](#MASK1_GUARD_LEFT_FRONT)
   16. [MASK1\_GUARD\_LEFT\_REAR](#MASK1_GUARD_LEFT_REAR)
   17. [MASK2\_ROOF](#MASK2_ROOF)
   18. [MASK2\_LIGHT\_RIGHT\_FRONT](#MASK2_LIGHT_RIGHT_FRONT)
   19. [MASK2\_LIGHT\_LEFT\_FRONT](#MASK2_LIGHT_LEFT_FRONT)
   20. [MASK2\_LIGHT\_RIGHT\_REAR](#MASK2_LIGHT_RIGHT_REAR)
   21. [MASK2\_LIGHT\_LEFT\_REAR](#MASK2_LIGHT_LEFT_REAR)
   22. [MASK2\_BRAKE\_RIGHT](#MASK2_BRAKE_RIGHT)
   23. [MASK2\_BRAKE\_LEFT](#MASK2_BRAKE_LEFT)
   24. [MASK2\_LIGHTBAR\_RIGHT](#MASK2_LIGHTBAR_RIGHT)
   25. [MASK2\_LIGHTBAR\_LEFT](#MASK2_LIGHTBAR_LEFT)
   26. [MASK2\_HOOD](#MASK2_HOOD)
   27. [MASK2\_BOOT](#MASK2_BOOT)
   28. [PHYSICS\_Z\_SCALE](#PHYSICS_Z_SCALE)
   29. [RADIUS](#RADIUS)
   30. [PLUS\_RADIUS](#PLUS_RADIUS)
   31. [FADE\_DISTANCE](#FADE_DISTANCE)
   32. [RANDOMIZE\_CONTAINER\_CHANCE](#RANDOMIZE_CONTAINER_CHANCE)
   33. [ENGINE\_SOUND\_RADIUS](#ENGINE_SOUND_RADIUS)
   34. [AMBIENT\_SOUND\_RADIUS](#AMBIENT_SOUND_RADIUS)
   35. [SIREN\_WORLDSOUND\_RADIUS](#SIREN_WORLDSOUND_RADIUS)
   36. [SIREN\_WORLDSOUND\_VOLUME](#SIREN_WORLDSOUND_VOLUME)
   37. [TRAILER\_LINEAR\_LOWER\_LIMIT\_X](#TRAILER_LINEAR_LOWER_LIMIT_X)
   38. [TRAILER\_LINEAR\_LOWER\_LIMIT\_Y](#TRAILER_LINEAR_LOWER_LIMIT_Y)
   39. [TRAILER\_LINEAR\_LOWER\_LIMIT\_Z](#TRAILER_LINEAR_LOWER_LIMIT_Z)
   40. [TRAILER\_LINEAR\_UPPER\_LIMIT\_X](#TRAILER_LINEAR_UPPER_LIMIT_X)
   41. [TRAILER\_LINEAR\_UPPER\_LIMIT\_Y](#TRAILER_LINEAR_UPPER_LIMIT_Y)
   42. [TRAILER\_LINEAR\_UPPER\_LIMIT\_Z](#TRAILER_LINEAR_UPPER_LIMIT_Z)
   43. [TRAILER\_ANGULAR\_LOWER\_LIMIT\_X](#TRAILER_ANGULAR_LOWER_LIMIT_X)
   44. [TRAILER\_ANGULAR\_LOWER\_LIMIT\_Y](#TRAILER_ANGULAR_LOWER_LIMIT_Y)
   45. [TRAILER\_ANGULAR\_LOWER\_LIMIT\_Z](#TRAILER_ANGULAR_LOWER_LIMIT_Z)
   46. [TRAILER\_ANGULAR\_UPPER\_LIMIT\_X](#TRAILER_ANGULAR_UPPER_LIMIT_X)
   47. [TRAILER\_ANGULAR\_UPPER\_LIMIT\_Y](#TRAILER_ANGULAR_UPPER_LIMIT_Y)
   48. [TRAILER\_ANGULAR\_UPPER\_LIMIT\_Z](#TRAILER_ANGULAR_UPPER_LIMIT_Z)
   49. [MINIMUM\_DOT\_UPRIGHT](#MINIMUM_DOT_UPRIGHT)
   50. [TRAILER\_MASS\_MULTIPLIER\_WHILE\_ATTACHING](#TRAILER_MASS_MULTIPLIER_WHILE_ATTACHING)
   51. [GENTLY\_ATTACH\_TRAILER\_MS](#GENTLY_ATTACH_TRAILER_MS)
   52. [CONSTRAINT\_ERP\_ATTACHING](#CONSTRAINT_ERP_ATTACHING)
   53. [DEFAULT\_CONSTRAINT\_ERP](#DEFAULT_CONSTRAINT_ERP)
   54. [noAuthorization](#noAuthorization)
   55. [IGNORE\_CHARACTER\_COLLISION\_SOUND\_INTERVAL](#IGNORE_CHARACTER_COLLISION_SOUND_INTERVAL)
   56. [POSITION\_HISTORY\_MAX\_ENTRIES](#POSITION_HISTORY_MAX_ENTRIES)
   57. [POSITION\_HISTORY\_INTERVAL\_MS](#POSITION_HISTORY_INTERVAL_MS)
   58. [HIT\_VEHICLE\_MAX\_DISTANCE\_TILES](#HIT_VEHICLE_MAX_DISTANCE_TILES)
   59. [MIN\_HIT\_SPEED\_TILES\_PER\_SECOND](#MIN_HIT_SPEED_TILES_PER_SECOND)
   60. [\_UNIT\_Y](#_UNIT_Y)
   61. [tempPoly](#tempPoly)
   62. [YURI\_FORCE\_FIELD](#YURI_FORCE_FIELD)
   63. [DOT\_PRODUCT\_ATTACH\_TRAILER\_FORWARD](#DOT_PRODUCT_ATTACH_TRAILER_FORWARD)
   64. [DOT\_PRODUCT\_ATTACH\_TRAILER\_UP](#DOT_PRODUCT_ATTACH_TRAILER_UP)
   65. [NAME\_TAG\_Y\_OFFSET](#NAME_TAG_Y_OFFSET)
   66. [NAME\_TWO\_COLUMN\_X\_OFFSET](#NAME_TWO_COLUMN_X_OFFSET)
   67. [renderToTexture](#renderToTexture)
   68. [centerOfMassMagic](#centerOfMassMagic)
   69. [wheelParams](#wheelParams)
   70. [physicsParams](#physicsParams)
   71. [forcedFriction](#forcedFriction)
   72. [vehicleShadow](#vehicleShadow)
   73. [inf](#inf)
   74. [lowRiderParam](#lowRiderParam)
   75. [impulseFromServer](#impulseFromServer)
   76. [impulsesFromSquishedBodies](#impulsesFromSquishedBodies)
   77. [impulsesFromHitObjects](#impulsesFromHitObjects)
   78. [netPlayerTimeoutMax](#netPlayerTimeoutMax)
   79. [models](#models)
   80. [chunk](#chunk)
   81. [polyDirty](#polyDirty)
   82. [polyGarageCheck](#polyGarageCheck)
   83. [radiusReductionInGarage](#radiusReductionInGarage)
   84. [vehicleId](#vehicleId)
   85. [sqlId](#sqlId)
   86. [serverRemovedFromWorld](#serverRemovedFromWorld)
   87. [interpolation](#interpolation)
   88. [waitFullUpdate](#waitFullUpdate)
   89. [throttle](#throttle)
   90. [transmissionNumber](#transmissionNumber)
   91. [transmissionChangeTime](#transmissionChangeTime)
   92. [hasExtendOffset](#hasExtendOffset)
   93. [hasExtendOffsetExiting](#hasExtendOffsetExiting)
   94. [savedPhysicsZ](#savedPhysicsZ)
   95. [savedRot](#savedRot)
   96. [jniTransform](#jniTransform)
   97. [jniSpeed](#jniSpeed)
   98. [jniIsCollide](#jniIsCollide)
   99. [jniLinearVelocity](#jniLinearVelocity)
   100. [lastLinearVelocity](#lastLinearVelocity)
   101. [netPlayerAuthorization](#netPlayerAuthorization)
   102. [netPlayerId](#netPlayerId)
   103. [netPlayerTimeout](#netPlayerTimeout)
   104. [authSimulationHash](#authSimulationHash)
   105. [authSimulationTime](#authSimulationTime)
   106. [frontEndDurability](#frontEndDurability)
   107. [rearEndDurability](#rearEndDurability)
   108. [rust](#rust)
   109. [colorHue](#colorHue)
   110. [colorSaturation](#colorSaturation)
   111. [colorValue](#colorValue)
   112. [currentFrontEndDurability](#currentFrontEndDurability)
   113. [currentRearEndDurability](#currentRearEndDurability)
   114. [collideX](#collideX)
   115. [collideY](#collideY)
   116. [shadowCoord](#shadowCoord)
   117. [missingEnginePart](#missingEnginePart)
   118. [MAX\_WHEELS](#MAX_WHEELS)
   119. [PHYSICS\_PARAM\_COUNT](#PHYSICS_PARAM_COUNT)
   120. [wheelInfo](#wheelInfo)
   121. [ramSound](#ramSound)
   122. [ramSoundTime](#ramSoundTime)
   123. [vehicleEngineRpm](#vehicleEngineRpm)
   124. [hitCharacterSounds](#hitCharacterSounds)
   125. [runOverBodySounds](#runOverBodySounds)
   126. [headlightsOn](#headlightsOn)
   127. [stoplightsOn](#stoplightsOn)
   128. [windowLightsOn](#windowLightsOn)
   129. [vehicleAlarm](#vehicleAlarm)
   130. [soundHornOn](#soundHornOn)
   131. [soundBackMoveOn](#soundBackMoveOn)
   132. [previouslyEntered](#previouslyEntered)
   133. [previouslyMoved](#previouslyMoved)
   134. [lightbarLightsMode](#lightbarLightsMode)
   135. [lightbarSirenMode](#lightbarSirenMode)
   136. [leftLight1](#leftLight1)
   137. [leftLight2](#leftLight2)
   138. [rightLight1](#rightLight1)
   139. [rightLight2](#rightLight2)
   140. [leftLightIndex](#leftLightIndex)
   141. [rightLightIndex](#rightLightIndex)
   142. [passengers](#passengers)
   143. [scriptName](#scriptName)
   144. [script](#script)
   145. [parts](#parts)
   146. [lights](#lights)
   147. [createdModel](#createdModel)
   148. [skinIndex](#skinIndex)
   149. [physics](#physics)
   150. [created](#created)
   151. [poly](#poly)
   152. [polyPlusRadius](#polyPlusRadius)
   153. [doDamageOverlay](#doDamageOverlay)
   154. [loaded](#loaded)
   155. [updateFlags](#updateFlags)
   156. [updateLockTimeout](#updateLockTimeout)
   157. [limitPhysicSend](#limitPhysicSend)
   158. [networkUpdated](#networkUpdated)
   159. [limitPhysicPositionSent](#limitPhysicPositionSent)
   160. [limitPhysicValid](#limitPhysicValid)
   161. [limitCrash](#limitCrash)
   162. [addedToWorld](#addedToWorld)
   163. [removedFromWorld](#removedFromWorld)
   164. [polyPlusRadiusMinX](#polyPlusRadiusMinX)
   165. [polyPlusRadiusMinY](#polyPlusRadiusMinY)
   166. [polyPlusRadiusMaxX](#polyPlusRadiusMaxX)
   167. [polyPlusRadiusMaxY](#polyPlusRadiusMaxY)
   168. [maxSpeed](#maxSpeed)
   169. [keyIsOnDoor](#keyIsOnDoor)
   170. [hotwired](#hotwired)
   171. [hotwiredBroken](#hotwiredBroken)
   172. [keysInIgnition](#keysInIgnition)
   173. [ignitionSwitch](#ignitionSwitch)
   174. [keysContainerId](#keysContainerId)
   175. [vehicleSounds](#vehicleSounds)
   176. [worldSoundUpdateLimit](#worldSoundUpdateLimit)
   177. [soundScrapePastPlant](#soundScrapePastPlant)
   178. [hittingPlant](#hittingPlant)
   179. [handBrakeActive](#handBrakeActive)
   180. [handBrakeSound](#handBrakeSound)
   181. [choosenParts](#choosenParts)
   182. [type](#type)
   183. [respawnZone](#respawnZone)
   184. [mass](#mass)
   185. [initialMass](#initialMass)
   186. [brakingForce](#brakingForce)
   187. [baseQuality](#baseQuality)
   188. [currentSteering](#currentSteering)
   189. [isBraking](#isBraking)
   190. [mechanicalId](#mechanicalId)
   191. [needPartsUpdate](#needPartsUpdate)
   192. [alarmed](#alarmed)
   193. [alarmAccumulator](#alarmAccumulator)
   194. [sirenStartTime](#sirenStartTime)
   195. [mechanicUiOpen](#mechanicUiOpen)
   196. [isGoodCar](#isGoodCar)
   197. [currentKey](#currentKey)
   198. [doColor](#doColor)
   199. [breakingSlowFactor](#breakingSlowFactor)
   200. [breakingObjectsList](#breakingObjectsList)
   201. [limitUpdate](#limitUpdate)
   202. [keySpawned](#keySpawned)
   203. [vehicleTransform](#vehicleTransform)
   204. [renderTransform](#renderTransform)
   205. [emitter](#emitter)
   206. [brakeBetweenUpdatesSpeed](#brakeBetweenUpdatesSpeed)
   207. [physicActiveCheck](#physicActiveCheck)
   208. [constraintChangedTime](#constraintChangedTime)
   209. [animPlayer](#animPlayer)
   210. [specificDistributionId](#specificDistributionId)
   211. [addThumpWorldSound](#addThumpWorldSound)
   212. [surroundVehicle](#surroundVehicle)
   213. [regulator](#regulator)
   214. [regulatorSpeed](#regulatorSpeed)
   215. [s\_PartToMaskMap](#s_PartToMaskMap)
   216. [BYTE\_ZERO](#BYTE_ZERO)
   217. [bloodIntensity](#bloodIntensity)
   218. [optionBloodDecals](#optionBloodDecals)
   219. [vehicleTowing](#vehicleTowing)
   220. [vehicleTowedBy](#vehicleTowedBy)
   221. [constraintTowing](#constraintTowing)
   222. [beginAttachTrailerMS](#beginAttachTrailerMS)
   223. [vehicleTowingId](#vehicleTowingId)
   224. [vehicleTowedById](#vehicleTowedById)
   225. [towAttachmentSelf](#towAttachmentSelf)
   226. [towAttachmentOther](#towAttachmentOther)
   227. [rowConstraintZOffset](#rowConstraintZOffset)
   228. [parameterVehicleBrake](#parameterVehicleBrake)
   229. [parameterVehicleEngineCondition](#parameterVehicleEngineCondition)
   230. [parameterVehicleGear](#parameterVehicleGear)
   231. [parameterVehicleLoad](#parameterVehicleLoad)
   232. [parameterVehicleRoadMaterial](#parameterVehicleRoadMaterial)
   233. [parameterVehicleRpm](#parameterVehicleRpm)
   234. [parameterVehicleSkid](#parameterVehicleSkid)
   235. [parameterVehicleSpeed](#parameterVehicleSpeed)
   236. [parameterVehicleSteer](#parameterVehicleSteer)
   237. [parameterVehicleTireMissing](#parameterVehicleTireMissing)
   238. [fmodParameters](#fmodParameters)
   239. [isActive](#isActive)
   240. [isStatic](#isStatic)
   241. [physicReliableLimit](#physicReliableLimit)
   242. [isReliable](#isReliable)
   243. [animals](#animals)
   244. [totalAnimalSize](#totalAnimalSize)
   245. [keySpawnChancedD100](#keySpawnChancedD100)
   246. [timeSinceLastAuth](#timeSinceLastAuth)
   247. [updateAnimal](#updateAnimal)
   248. [hitVars](#hitVars)
   249. [zombieHitTimestamp](#zombieHitTimestamp)
   250. [createPhysicsRecursion](#createPhysicsRecursion)
   251. [TL\_transform\_pool](#TL_transform_pool)
   252. [TL\_vector3\_pool](#TL_vector3_pool)
   253. [TL\_vector2f\_pool](#TL_vector2f_pool)
   254. [TL\_vector3f\_pool](#TL_vector3f_pool)
   255. [TL\_vector4f\_pool](#TL_vector4f_pool)
   256. [TL\_matrix4f\_pool](#TL_matrix4f_pool)
   257. [TL\_quaternionf\_pool](#TL_quaternionf_pool)
   258. [lastDrivenBy](#lastDrivenBy)
   259. [lastDamagedBy](#lastDamagedBy)
   260. [pedestrianContacts](#pedestrianContacts)
   261. [disableSimulationDueToLackOfSurroundingChunks](#disableSimulationDueToLackOfSurroundingChunks)
   262. [desirePhysicsActive](#desirePhysicsActive)
   263. [positionHistory](#positionHistory)
   264. [positionHistoryIndex](#positionHistoryIndex)
   265. [positionHistoryUpdateLimit](#positionHistoryUpdateLimit)
   266. [nameCoordFrame](#nameCoordFrame)
   267. [nameCoordPlayerIndex](#nameCoordPlayerIndex)
7. [Constructor Details](#constructor-detail)
   1. [BaseVehicle(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
8. [Method Details](#method-detail)
   1. [getSqlId()](#getSqlId())
   2. [allocMatrix4f()](#allocMatrix4f())
   3. [releaseMatrix4f(Matrix4f)](#releaseMatrix4f(org.joml.Matrix4f))
   4. [allocQuaternionf()](#allocQuaternionf())
   5. [releaseQuaternionf(Quaternionf)](#releaseQuaternionf(org.joml.Quaternionf))
   6. [allocTransform()](#allocTransform())
   7. [releaseTransform(Transform)](#releaseTransform(zombie.core.physics.Transform))
   8. [allocVector2()](#allocVector2())
   9. [releaseVector2(Vector2)](#releaseVector2(zombie.iso.Vector2))
   10. [allocVector3()](#allocVector3())
   11. [releaseVector3(Vector3)](#releaseVector3(zombie.iso.Vector3))
   12. [allocVector2f()](#allocVector2f())
   13. [releaseVector2f(Vector2f)](#releaseVector2f(org.joml.Vector2f))
   14. [allocVector3f()](#allocVector3f())
   15. [releaseVector4f(Vector4f)](#releaseVector4f(org.joml.Vector4f))
   16. [allocVector4f()](#allocVector4f())
   17. [releaseVector3f(Vector3f)](#releaseVector3f(org.joml.Vector3f))
   18. [LoadAllVehicleTextures()](#LoadAllVehicleTextures())
   19. [LoadVehicleTextures(VehicleScript)](#LoadVehicleTextures(zombie.scripting.objects.VehicleScript))
   20. [LoadVehicleTextures(VehicleScript.Skin)](#LoadVehicleTextures(zombie.scripting.objects.VehicleScript.Skin))
   21. [LoadVehicleTexture(String)](#LoadVehicleTexture(java.lang.String))
   22. [LoadVehicleTexture(String, int)](#LoadVehicleTexture(java.lang.String,int))
   23. [setNetPlayerAuthorization(BaseVehicle.Authorization, int)](#setNetPlayerAuthorization(zombie.vehicles.BaseVehicle.Authorization,int))
   24. [isNetPlayerAuthorization(BaseVehicle.Authorization)](#isNetPlayerAuthorization(zombie.vehicles.BaseVehicle.Authorization))
   25. [isNetPlayerId(short)](#isNetPlayerId(short))
   26. [getNetPlayerId()](#getNetPlayerId())
   27. [getAuthorizationDescription()](#getAuthorizationDescription())
   28. [getFakeSpeedModifier()](#getFakeSpeedModifier())
   29. [isLocalPhysicSim()](#isLocalPhysicSim())
   30. [addImpulse(Vector3f, Vector3f)](#addImpulse(org.joml.Vector3f,org.joml.Vector3f))
   31. [setEngineSpeed(double)](#setEngineSpeed(double))
   32. [addEngineSpeed(double)](#addEngineSpeed(double))
   33. [getEngineSpeed()](#getEngineSpeed())
   34. [getTransmissionNumberLetter()](#getTransmissionNumberLetter())
   35. [getTransmissionNumber()](#getTransmissionNumber())
   36. [getTransmissionNumberEnum()](#getTransmissionNumberEnum())
   37. [setClientForce(float)](#setClientForce(float))
   38. [getClientForce()](#getClientForce())
   39. [getForce()](#getForce())
   40. [doVehicleColor()](#doVehicleColor())
   41. [shouldAnimRecorderBeActive()](#shouldAnimRecorderBeActive())
   42. [getObjectName()](#getObjectName())
   43. [createPhysics()](#createPhysics())
   44. [createPhysics(boolean)](#createPhysics(boolean))
   45. [isPreviouslyEntered()](#isPreviouslyEntered())
   46. [setPreviouslyEntered(boolean)](#setPreviouslyEntered(boolean))
   47. [isPreviouslyMoved()](#isPreviouslyMoved())
   48. [setPreviouslyMoved(boolean)](#setPreviouslyMoved(boolean))
   49. [getKeySpawned()](#getKeySpawned())
   50. [tryCreateKeyRing()](#tryCreateKeyRing())
   51. [tryCreateBuildingKey(BuildingDef)](#tryCreateBuildingKey(zombie.iso.BuildingDef))
   52. [randomlyAddNearestBuildingKeyToContainer(ItemContainer)](#randomlyAddNearestBuildingKeyToContainer(zombie.inventory.ItemContainer))
   53. [putKeyToZombie(IsoZombie)](#putKeyToZombie(zombie.characters.IsoZombie))
   54. [putKeyToContainer(ItemContainer, IsoGridSquare, IsoObject)](#putKeyToContainer(zombie.inventory.ItemContainer,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   55. [putKeyToContainerServer(InventoryItem, IsoGridSquare, IsoObject)](#putKeyToContainerServer(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   56. [putKeyToWorld(IsoGridSquare)](#putKeyToWorld(zombie.iso.IsoGridSquare))
   57. [addKeyToWorld()](#addKeyToWorld())
   58. [addKeyToWorld(boolean)](#addKeyToWorld(boolean))
   59. [addKeyToGloveBox()](#addKeyToGloveBox())
   60. [addBuildingKeyToGloveBox(IsoGridSquare)](#addBuildingKeyToGloveBox(zombie.iso.IsoGridSquare))
   61. [createVehicleKey()](#createVehicleKey())
   62. [addKeyToSquare(IsoGridSquare)](#addKeyToSquare(zombie.iso.IsoGridSquare))
   63. [addKeyToSquare(IsoGridSquare, boolean)](#addKeyToSquare(zombie.iso.IsoGridSquare,boolean))
   64. [addKeyToSquare2(IsoGridSquare, int)](#addKeyToSquare2(zombie.iso.IsoGridSquare,int))
   65. [addKeyToSquare2(IsoGridSquare, int, boolean)](#addKeyToSquare2(zombie.iso.IsoGridSquare,int,boolean))
   66. [toggleLockedDoor(VehiclePart, IsoGameCharacter, boolean)](#toggleLockedDoor(zombie.vehicles.VehiclePart,zombie.characters.IsoGameCharacter,boolean))
   67. [canLockDoor(VehiclePart, IsoGameCharacter)](#canLockDoor(zombie.vehicles.VehiclePart,zombie.characters.IsoGameCharacter))
   68. [canUnlockDoor(VehiclePart, IsoGameCharacter)](#canUnlockDoor(zombie.vehicles.VehiclePart,zombie.characters.IsoGameCharacter))
   69. [canOpenDoor(VehiclePart, IsoGameCharacter)](#canOpenDoor(zombie.vehicles.VehiclePart,zombie.characters.IsoGameCharacter))
   70. [initParts()](#initParts())
   71. [setGeneralPartCondition(float, float)](#setGeneralPartCondition(float,float))
   72. [createParts()](#createParts())
   73. [getController()](#getController())
   74. [getSurroundVehicle()](#getSurroundVehicle())
   75. [getSkinCount()](#getSkinCount())
   76. [getSkinIndex()](#getSkinIndex())
   77. [setSkinIndex(int)](#setSkinIndex(int))
   78. [updateSkin()](#updateSkin())
   79. [getShadowTexture()](#getShadowTexture())
   80. [getScript()](#getScript())
   81. [getEngineCondition()](#getEngineCondition())
   82. [getVehicleEngine()](#getVehicleEngine())
   83. [getEngineState()](#getEngineState())
   84. [isEngineSounding()](#isEngineSounding())
   85. [isAlarmSounding()](#isAlarmSounding())
   86. [isBrakePedalPressed()](#isBrakePedalPressed())
   87. [isGasPedalPressed()](#isGasPedalPressed())
   88. [getRoadMaterial()](#getRoadMaterial())
   89. [getChosenAlarmSound()](#getChosenAlarmSound())
   90. [isBackupBeeperSounding()](#isBackupBeeperSounding())
   91. [isDoorAlarmSounding()](#isDoorAlarmSounding())
   92. [isHornSounding()](#isHornSounding())
   93. [getVehicleSoundEmitter()](#getVehicleSoundEmitter())
   94. [setScript(String)](#setScript(java.lang.String))
   95. [chooseRandomScript()](#chooseRandomScript())
   96. [isListenerInRange(float)](#isListenerInRange(float))
   97. [getScriptName()](#getScriptName())
   98. [setScriptName(String)](#setScriptName(java.lang.String))
   99. [setScript()](#setScript())
   100. [scriptReloaded()](#scriptReloaded())
   101. [scriptReloaded(boolean)](#scriptReloaded(boolean))
   102. [getSkin()](#getSkin())
   103. [setModelVisible(VehiclePart, VehicleScript.Model, boolean)](#setModelVisible(zombie.vehicles.VehiclePart,zombie.scripting.objects.VehicleScript.Model,boolean))
   104. [getModelScriptNameForPart(VehiclePart, VehicleScript.Model)](#getModelScriptNameForPart(zombie.vehicles.VehiclePart,zombie.scripting.objects.VehicleScript.Model))
   105. [getModelInfoForPart(VehiclePart)](#getModelInfoForPart(zombie.vehicles.VehiclePart))
   106. [getScriptPassenger(int)](#getScriptPassenger(int))
   107. [getMaxPassengers()](#getMaxPassengers())
   108. [setPassenger(int, IsoGameCharacter, Vector3f)](#setPassenger(int,zombie.characters.IsoGameCharacter,org.joml.Vector3f))
   109. [updateLastKnwnDriver()](#updateLastKnwnDriver())
   110. [clearPassenger(int)](#clearPassenger(int))
   111. [hasPassenger()](#hasPassenger())
   112. [getPassenger(int)](#getPassenger(int))
   113. [getCharacter(int)](#getCharacter(int))
   114. [getSeat(IsoGameCharacter)](#getSeat(zombie.characters.IsoGameCharacter))
   115. [isDriver(IsoGameCharacter)](#isDriver(zombie.characters.IsoGameCharacter))
   116. [getWorldPos(Vector3f, Vector3f, VehicleScript)](#getWorldPos(org.joml.Vector3f,org.joml.Vector3f,zombie.scripting.objects.VehicleScript))
   117. [getWorldPos(float, float, float, Vector3f, VehicleScript)](#getWorldPos(float,float,float,org.joml.Vector3f,zombie.scripting.objects.VehicleScript))
   118. [getWorldPos(Vector3f, Vector3f)](#getWorldPos(org.joml.Vector3f,org.joml.Vector3f))
   119. [getWorldPos(float, float, float, Vector3f)](#getWorldPos(float,float,float,org.joml.Vector3f))
   120. [getLocalPos(Vector3f, Vector3f)](#getLocalPos(org.joml.Vector3f,org.joml.Vector3f))
   121. [getLocalPos(float, float, float, Vector3f)](#getLocalPos(float,float,float,org.joml.Vector3f))
   122. [getPassengerLocalPos(int, Vector3f)](#getPassengerLocalPos(int,org.joml.Vector3f))
   123. [getPassengerWorldPos(int, Vector3f)](#getPassengerWorldPos(int,org.joml.Vector3f))
   124. [getPassengerPositionWorldPos(VehicleScript.Position, Vector3f)](#getPassengerPositionWorldPos(zombie.scripting.objects.VehicleScript.Position,org.joml.Vector3f))
   125. [getPassengerPositionWorldPos(float, float, float, Vector3f)](#getPassengerPositionWorldPos(float,float,float,org.joml.Vector3f))
   126. [getPassengerAnim(int, String)](#getPassengerAnim(int,java.lang.String))
   127. [getPassengerPosition(int, String)](#getPassengerPosition(int,java.lang.String))
   128. [getPassengerDoor(int)](#getPassengerDoor(int))
   129. [getPassengerDoor2(int)](#getPassengerDoor2(int))
   130. [isPositionOnLeftOrRight(float, float)](#isPositionOnLeftOrRight(float,float))
   131. [haveOneDoorUnlocked()](#haveOneDoorUnlocked())
   132. [getPassengerArea(int)](#getPassengerArea(int))
   133. [playPassengerAnim(int, String)](#playPassengerAnim(int,java.lang.String))
   134. [playPassengerAnim(int, String, IsoGameCharacter)](#playPassengerAnim(int,java.lang.String,zombie.characters.IsoGameCharacter))
   135. [playPassengerSound(int, String)](#playPassengerSound(int,java.lang.String))
   136. [playPartAnim(VehiclePart, String)](#playPartAnim(zombie.vehicles.VehiclePart,java.lang.String))
   137. [playActorAnim(VehiclePart, String, IsoGameCharacter)](#playActorAnim(zombie.vehicles.VehiclePart,java.lang.String,zombie.characters.IsoGameCharacter))
   138. [playCharacterAnim(IsoGameCharacter, VehicleScript.Anim, boolean)](#playCharacterAnim(zombie.characters.IsoGameCharacter,zombie.scripting.objects.VehicleScript.Anim,boolean))
   139. [playPartSound(VehiclePart, IsoPlayer, String)](#playPartSound(zombie.vehicles.VehiclePart,zombie.characters.IsoPlayer,java.lang.String))
   140. [setCharacterPosition(IsoGameCharacter, int, String)](#setCharacterPosition(zombie.characters.IsoGameCharacter,int,java.lang.String))
   141. [transmitCharacterPosition(int, String)](#transmitCharacterPosition(int,java.lang.String))
   142. [setCharacterPositionToAnim(IsoGameCharacter, int, String)](#setCharacterPositionToAnim(zombie.characters.IsoGameCharacter,int,java.lang.String))
   143. [getPassengerSwitchSeatCount(int)](#getPassengerSwitchSeatCount(int))
   144. [getPassengerSwitchSeat(int, int)](#getPassengerSwitchSeat(int,int))
   145. [getSwitchSeat(int, int)](#getSwitchSeat(int,int))
   146. [getSwitchSeatAnimName(int, int)](#getSwitchSeatAnimName(int,int))
   147. [getSwitchSeatAnimRate(int, int)](#getSwitchSeatAnimRate(int,int))
   148. [getSwitchSeatSound(int, int)](#getSwitchSeatSound(int,int))
   149. [canSwitchSeat(int, int)](#canSwitchSeat(int,int))
   150. [switchSeat(IsoGameCharacter, int)](#switchSeat(zombie.characters.IsoGameCharacter,int))
   151. [playSwitchSeatAnim(int, int)](#playSwitchSeatAnim(int,int))
   152. [isSeatOccupied(int)](#isSeatOccupied(int))
   153. [isSeatInstalled(int)](#isSeatInstalled(int))
   154. [isSeatHoldingItems(int)](#isSeatHoldingItems(int))
   155. [isSeatHoldingItems(VehiclePart)](#isSeatHoldingItems(zombie.vehicles.VehiclePart))
   156. [getAllSeatParts()](#getAllSeatParts())
   157. [getAllSeatParts(ArrayList)](#getAllSeatParts(java.util.ArrayList))
   158. [isPointLeftOfCenter(float, float)](#isPointLeftOfCenter(float,float))
   159. [getBestSeat(IsoGameCharacter)](#getBestSeat(zombie.characters.IsoGameCharacter))
   160. [getEnterSeatDistance(int, float, float)](#getEnterSeatDistance(int,float,float))
   161. [updateHasExtendOffsetForExit(IsoGameCharacter)](#updateHasExtendOffsetForExit(zombie.characters.IsoGameCharacter))
   162. [updateHasExtendOffsetForExitEnd(IsoGameCharacter)](#updateHasExtendOffsetForExitEnd(zombie.characters.IsoGameCharacter))
   163. [updateHasExtendOffset(IsoGameCharacter)](#updateHasExtendOffset(zombie.characters.IsoGameCharacter))
   164. [getUseablePart(IsoGameCharacter)](#getUseablePart(zombie.characters.IsoGameCharacter))
   165. [getUseablePart(IsoGameCharacter, boolean)](#getUseablePart(zombie.characters.IsoGameCharacter,boolean))
   166. [distanceToManhatten(float, float)](#distanceToManhatten(float,float))
   167. [getClosestWindow(IsoGameCharacter)](#getClosestWindow(zombie.characters.IsoGameCharacter))
   168. [getClosestWindow(float, float, float, float, float)](#getClosestWindow(float,float,float,float,float))
   169. [getFacingPosition(IsoGameCharacter, Vector2)](#getFacingPosition(zombie.characters.IsoGameCharacter,zombie.iso.Vector2))
   170. [getFacingPosition(float, float, float, Vector2)](#getFacingPosition(float,float,float,zombie.iso.Vector2))
   171. [enter(int, IsoGameCharacter, Vector3f)](#enter(int,zombie.characters.IsoGameCharacter,org.joml.Vector3f))
   172. [enter(int, IsoGameCharacter)](#enter(int,zombie.characters.IsoGameCharacter))
   173. [enterRSync(int, IsoGameCharacter, BaseVehicle)](#enterRSync(int,zombie.characters.IsoGameCharacter,zombie.vehicles.BaseVehicle))
   174. [exit(IsoGameCharacter)](#exit(zombie.characters.IsoGameCharacter))
   175. [exitRSync(IsoGameCharacter)](#exitRSync(zombie.characters.IsoGameCharacter))
   176. [hasRoof(int)](#hasRoof(int))
   177. [showPassenger(int)](#showPassenger(int))
   178. [showPassenger(IsoGameCharacter)](#showPassenger(zombie.characters.IsoGameCharacter))
   179. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   180. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   181. [softReset()](#softReset())
   182. [trySpawnKey()](#trySpawnKey())
   183. [trySpawnKey(boolean)](#trySpawnKey(boolean))
   184. [shouldCollideWithCharacters()](#shouldCollideWithCharacters())
   185. [shouldCollideWithObjects()](#shouldCollideWithObjects())
   186. [breakingObjects()](#breakingObjects())
   187. [updateVelocityMultiplier()](#updateVelocityMultiplier())
   188. [playScrapePastPlantSound(IsoGridSquare)](#playScrapePastPlantSound(zombie.iso.IsoGridSquare))
   189. [checkCollisionWithPlant(IsoGridSquare, IsoObject, Vector2)](#checkCollisionWithPlant(zombie.iso.IsoGridSquare,zombie.iso.IsoObject,zombie.iso.Vector2))
   190. [updateScrapPastPlantSound()](#updateScrapPastPlantSound())
   191. [damageObjects(float)](#damageObjects(float))
   192. [update()](#update())
   193. [shouldUpdateInMeta()](#shouldUpdateInMeta())
   194. [updateImportantAreas()](#updateImportantAreas())
   195. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())
   196. [applyAccumulatedImpulsesFromHitObjectsToPhysics()](#applyAccumulatedImpulsesFromHitObjectsToPhysics())
   197. [applyAllImpulsesFromProneCharacters()](#applyAllImpulsesFromProneCharacters())
   198. [getFudgedMass()](#getFudgedMass())
   199. [isNullChunk(int, int)](#isNullChunk(int,int))
   200. [isInvalidChunkAround()](#isInvalidChunkAround())
   201. [isInvalidChunkAhead()](#isInvalidChunkAhead())
   202. [isInvalidChunkBehind()](#isInvalidChunkBehind())
   203. [isInvalidChunkAround(boolean, boolean, boolean, boolean)](#isInvalidChunkAround(boolean,boolean,boolean,boolean))
   204. [postupdate()](#postupdate())
   205. [shouldSnapZToCurrentSquare()](#shouldSnapZToCurrentSquare())
   206. [applyDamageFromHitCharacters(VehiclePedestrianContactTracking)](#applyDamageFromHitCharacters(zombie.vehicles.VehiclePedestrianContactTracking))
   207. [damageFromHitChr(int, int)](#damageFromHitChr(int,int))
   208. [updateAnimationPlayer(AnimationPlayer, VehiclePart)](#updateAnimationPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer,zombie.vehicles.VehiclePart))
   209. [authorizationClientCollide(IsoPlayer)](#authorizationClientCollide(zombie.characters.IsoPlayer))
   210. [authorizationServerCollide(short, boolean)](#authorizationServerCollide(short,boolean))
   211. [authorizationServerOnSeat(IsoPlayer, boolean)](#authorizationServerOnSeat(zombie.characters.IsoPlayer,boolean))
   212. [hasAuthorization(UdpConnection)](#hasAuthorization(zombie.core.raknet.UdpConnection))
   213. [netPlayerFromServerUpdate(BaseVehicle.Authorization, short)](#netPlayerFromServerUpdate(zombie.vehicles.BaseVehicle.Authorization,short))
   214. [getWorldTransform(Transform)](#getWorldTransform(zombie.core.physics.Transform))
   215. [setWorldTransform(Transform)](#setWorldTransform(zombie.core.physics.Transform))
   216. [flipUpright()](#flipUpright())
   217. [setAngles(float, float, float)](#setAngles(float,float,float))
   218. [getAngleX()](#getAngleX())
   219. [getAngleY()](#getAngleY())
   220. [getAngleZ()](#getAngleZ())
   221. [setDebugZ(float)](#setDebugZ(float))
   222. [setPhysicsActive(boolean)](#setPhysicsActive(boolean))
   223. [setPhysicsActive(boolean, boolean)](#setPhysicsActive(boolean,boolean))
   224. [isPhysicsActive()](#isPhysicsActive())
   225. [getDebugZ()](#getDebugZ())
   226. [getPoly()](#getPoly())
   227. [getPolyPlusRadius()](#getPolyPlusRadius())
   228. [initShadowPoly()](#initShadowPoly())
   229. [initPolyPlusRadiusBounds()](#initPolyPlusRadiusBounds())
   230. [getForwardVector(Vector3f)](#getForwardVector(org.joml.Vector3f))
   231. [getUpVector(Vector3f)](#getUpVector(org.joml.Vector3f))
   232. [getUpVectorDot()](#getUpVectorDot())
   233. [isStopped()](#isStopped())
   234. [setSpeedKmHour(float)](#setSpeedKmHour(float))
   235. [getCurrentSpeedKmHour()](#getCurrentSpeedKmHour())
   236. [getCurrentAbsoluteSpeedKmHour()](#getCurrentAbsoluteSpeedKmHour())
   237. [getLinearVelocity(Vector3f)](#getLinearVelocity(org.joml.Vector3f))
   238. [getSpeed2D()](#getSpeed2D())
   239. [isAtRest()](#isAtRest())
   240. [updateTransform()](#updateTransform())
   241. [initTransform(ModelInstance, ModelScript, ModelScript, String, String, Matrix4f)](#initTransform(zombie.core.skinnedmodel.model.ModelInstance,zombie.scripting.objects.ModelScript,zombie.scripting.objects.ModelScript,java.lang.String,java.lang.String,org.joml.Matrix4f))
   242. [updatePhysics()](#updatePhysics())
   243. [checkSurroundingChunks()](#checkSurroundingChunks())
   244. [hasChunksAllAround()](#hasChunksAllAround())
   245. [updatePhysicsNetwork()](#updatePhysicsNetwork())
   246. [checkPhysicsValidWithServer()](#checkPhysicsValidWithServer())
   247. [updateControls()](#updateControls())
   248. [isKeyboardControlled()](#isKeyboardControlled())
   249. [getJoypad()](#getJoypad())
   250. [Damage(float)](#Damage(float))
   251. [HitByVehicle(BaseVehicle, float)](#HitByVehicle(zombie.vehicles.BaseVehicle,float))
   252. [crash(float, boolean)](#crash(float,boolean))
   253. [getCrashSound(float)](#getCrashSound(float))
   254. [addDamageFrontHitAChr(int)](#addDamageFrontHitAChr(int))
   255. [addDamageRearHitAChr(int)](#addDamageRearHitAChr(int))
   256. [addDamageFront(int)](#addDamageFront(int))
   257. [addDamageRear(int)](#addDamageRear(int))
   258. [damageHeadlight(String, int)](#damageHeadlight(java.lang.String,int))
   259. [clamp(float, float, float)](#clamp(float,float,float))
   260. [getClosestPointOnEdge(float, float, float, float, float, float, double, Vector2f)](#getClosestPointOnEdge(float,float,float,float,float,float,double,org.joml.Vector2f))
   261. [getClosestPointOnExtents(float, float, Vector2f)](#getClosestPointOnExtents(float,float,org.joml.Vector2f))
   262. [getClosestPointOnPoly(float, float, Vector2f)](#getClosestPointOnPoly(float,float,org.joml.Vector2f))
   263. [getClosestPointOnPoly(BaseVehicle, Vector2f, Vector2f)](#getClosestPointOnPoly(zombie.vehicles.BaseVehicle,org.joml.Vector2f,org.joml.Vector2f))
   264. [intersectLineWithExtents(float, float, float, float, float, Vector2f)](#intersectLineWithExtents(float,float,float,float,float,org.joml.Vector2f))
   265. [intersectLineWithPoly(float, float, float, float, Vector2f)](#intersectLineWithPoly(float,float,float,float,org.joml.Vector2f))
   266. [isCharacterAdjacentTo(IsoGameCharacter)](#isCharacterAdjacentTo(zombie.characters.IsoGameCharacter))
   267. [testCollisionWithCharacter(IsoGameCharacter, float, Vector2)](#testCollisionWithCharacter(zombie.characters.IsoGameCharacter,float,zombie.iso.Vector2))
   268. [testCollisionWithProneCharacter(IsoGameCharacter, boolean, Vector2)](#testCollisionWithProneCharacter(zombie.characters.IsoGameCharacter,boolean,zombie.iso.Vector2))
   269. [testCollisionWithCorpse(IsoDeadBody, boolean)](#testCollisionWithCorpse(zombie.iso.objects.IsoDeadBody,boolean))
   270. [testCollisionWithProneCharacter(IsoMovingObject, float, float, boolean, Vector2)](#testCollisionWithProneCharacter(zombie.iso.IsoMovingObject,float,float,boolean,zombie.iso.Vector2))
   271. [testCollisionWithObject(IsoObject, float, Vector2)](#testCollisionWithObject(zombie.iso.IsoObject,float,zombie.iso.Vector2))
   272. [testCollisionWithVehicle(BaseVehicle)](#testCollisionWithVehicle(zombie.vehicles.BaseVehicle))
   273. [getObjectX(IsoObject)](#getObjectX(zombie.iso.IsoObject))
   274. [getObjectY(IsoObject)](#getObjectY(zombie.iso.IsoObject))
   275. [applyImpulseFromHitObject(IsoObject, float)](#applyImpulseFromHitObject(zombie.iso.IsoObject,float))
   276. [applyImpulseFromHitPedestrian(IsoGameCharacter)](#applyImpulseFromHitPedestrian(zombie.characters.IsoGameCharacter))
   277. [applyImpulseFromHitPlant(IsoObject, float)](#applyImpulseFromHitPlant(zombie.iso.IsoObject,float))
   278. [applyImpulseGeneric(float, float, float, float, float, float, float)](#applyImpulseGeneric(float,float,float,float,float,float,float))
   279. [hitCharacter(IsoGameCharacter, Vector2)](#hitCharacter(zombie.characters.IsoGameCharacter,zombie.iso.Vector2))
   280. [triggerMusicIntensityEventVehicleHitCharacter()](#triggerMusicIntensityEventVehicleHitCharacter())
   281. [playSoundVehicleHitCharacter(IsoGameCharacter)](#playSoundVehicleHitCharacter(zombie.characters.IsoGameCharacter))
   282. [onHitCharacterAddContact(IsoGameCharacter)](#onHitCharacterAddContact(zombie.characters.IsoGameCharacter))
   283. [isPersistentContact(IsoGameCharacter)](#isPersistentContact(zombie.characters.IsoGameCharacter))
   284. [isCharacterInFront(IsoGameCharacter)](#isCharacterInFront(zombie.characters.IsoGameCharacter))
   285. [hitAnimal(IsoAnimal)](#hitAnimal(zombie.characters.animals.IsoAnimal))
   286. [calculateDamageWithCharacter(IsoGameCharacter)](#calculateDamageWithCharacter(zombie.characters.IsoGameCharacter))
   287. [blocked(int, int, int)](#blocked(int,int,int))
   288. [isIntersectingSquare(int, int, int)](#isIntersectingSquare(int,int,int))
   289. [isIntersectingSquare(IsoGridSquare)](#isIntersectingSquare(zombie.iso.IsoGridSquare))
   290. [isIntersectingSquareWithShadow(int, int, int)](#isIntersectingSquareWithShadow(int,int,int))
   291. [circleIntersects(float, float, float, float)](#circleIntersects(float,float,float,float))
   292. [updateLights()](#updateLights())
   293. [updateWorldLights()](#updateWorldLights())
   294. [fixLightbarModelLighting(IsoLightSource, Vector3f)](#fixLightbarModelLighting(zombie.iso.IsoLightSource,org.joml.Vector3f))
   295. [removeWorldLights()](#removeWorldLights())
   296. [updateDamageOverlayLater()](#updateDamageOverlayLater())
   297. [doDamageOverlay()](#doDamageOverlay())
   298. [checkDamage(VehiclePart, int, boolean)](#checkDamage(zombie.vehicles.VehiclePart,int,boolean))
   299. [checkDamage2(VehiclePart, int, boolean)](#checkDamage2(zombie.vehicles.VehiclePart,int,boolean))
   300. [checkUninstall2(VehiclePart, int)](#checkUninstall2(zombie.vehicles.VehiclePart,int))
   301. [doOtherBodyWorkDamage()](#doOtherBodyWorkDamage())
   302. [doWindowDamage()](#doWindowDamage())
   303. [doDoorDamage()](#doDoorDamage())
   304. [getBloodIntensity(String)](#getBloodIntensity(java.lang.String))
   305. [setBloodIntensity(String, float)](#setBloodIntensity(java.lang.String,float))
   306. [transmitBlood()](#transmitBlood())
   307. [doBloodOverlay()](#doBloodOverlay())
   308. [doBloodOverlayAux(float[], float[], float)](#doBloodOverlayAux(float%5B%5D,float%5B%5D,float))
   309. [doBloodOverlayFront(float[], float[], float)](#doBloodOverlayFront(float%5B%5D,float%5B%5D,float))
   310. [doBloodOverlayRear(float[], float[], float)](#doBloodOverlayRear(float%5B%5D,float%5B%5D,float))
   311. [doBloodOverlayLeft(float[], float[], float)](#doBloodOverlayLeft(float%5B%5D,float%5B%5D,float))
   312. [doBloodOverlayRight(float[], float[], float)](#doBloodOverlayRight(float%5B%5D,float%5B%5D,float))
   313. [isOnScreen()](#isOnScreen())
   314. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   315. [renderlast()](#renderlast())
   316. [renderShadow()](#renderShadow())
   317. [isEnterBlocked(IsoGameCharacter, int)](#isEnterBlocked(zombie.characters.IsoGameCharacter,int))
   318. [isExitBlocked(int)](#isExitBlocked(int))
   319. [isExitBlocked(IsoGameCharacter, int)](#isExitBlocked(zombie.characters.IsoGameCharacter,int))
   320. [isPassengerUseDoor2(IsoGameCharacter, int)](#isPassengerUseDoor2(zombie.characters.IsoGameCharacter,int))
   321. [isEnterBlocked2(IsoGameCharacter, int)](#isEnterBlocked2(zombie.characters.IsoGameCharacter,int))
   322. [isExitBlocked2(int)](#isExitBlocked2(int))
   323. [renderExits()](#renderExits())
   324. [areaPositionLocal(VehicleScript.Area)](#areaPositionLocal(zombie.scripting.objects.VehicleScript.Area))
   325. [areaPositionLocal(VehicleScript.Area, Vector2)](#areaPositionLocal(zombie.scripting.objects.VehicleScript.Area,zombie.iso.Vector2))
   326. [areaPositionWorld(VehicleScript.Area)](#areaPositionWorld(zombie.scripting.objects.VehicleScript.Area))
   327. [areaPositionWorld(VehicleScript.Area, Vector2)](#areaPositionWorld(zombie.scripting.objects.VehicleScript.Area,zombie.iso.Vector2))
   328. [areaPositionWorld4PlayerInteract(VehicleScript.Area)](#areaPositionWorld4PlayerInteract(zombie.scripting.objects.VehicleScript.Area))
   329. [areaPositionWorld4PlayerInteract(VehicleScript.Area, Vector2)](#areaPositionWorld4PlayerInteract(zombie.scripting.objects.VehicleScript.Area,zombie.iso.Vector2))
   330. [renderAreas()](#renderAreas())
   331. [renderInterpolateBuffer()](#renderInterpolateBuffer())
   332. [renderInterpolateBuffer\_drawTextHL(long, String, Color, float, float, float, float, long, long)](#renderInterpolateBuffer_drawTextHL(long,java.lang.String,zombie.core.Color,float,float,float,float,long,long))
   333. [renderInterpolateBuffer\_drawVertLine(long, Color, float, float, float, float, long, long, boolean)](#renderInterpolateBuffer_drawVertLine(long,zombie.core.Color,float,float,float,float,long,long,boolean))
   334. [renderInterpolateBuffer\_drawLine(long, float, long, float, Color, float, float, float, float, long, long, float, float)](#renderInterpolateBuffer_drawLine(long,float,long,float,zombie.core.Color,float,float,float,float,long,long,float,float))
   335. [renderInterpolateBuffer\_drawPoint(long, float, Color, int, float, float, float, float, long, long, float, float)](#renderInterpolateBuffer_drawPoint(long,float,zombie.core.Color,int,float,float,float,float,long,long,float,float))
   336. [renderAuthorizations()](#renderAuthorizations())
   337. [renderUsableArea()](#renderUsableArea())
   338. [couldSeeIntersectedSquare(int)](#couldSeeIntersectedSquare(int))
   339. [renderIntersectedSquares()](#renderIntersectedSquares())
   340. [renderTrailerPositions()](#renderTrailerPositions())
   341. [renderVelocity()](#renderVelocity())
   342. [getWheelForwardVector(int, Vector3f)](#getWheelForwardVector(int,org.joml.Vector3f))
   343. [onEngineStateChanged(BaseVehicle.engineStateTypes, BaseVehicle.engineStateTypes, VehicleEngineStateChangeReason)](#onEngineStateChanged(zombie.vehicles.BaseVehicle.engineStateTypes,zombie.vehicles.BaseVehicle.engineStateTypes,zombie.vehicles.VehicleEngineStateChangeReason))
   344. [tryStartEngine(boolean)](#tryStartEngine(boolean))
   345. [tryStartEngine()](#tryStartEngine())
   346. [engineDoIdle()](#engineDoIdle())
   347. [engineDoStarting()](#engineDoStarting())
   348. [isStarting()](#isStarting())
   349. [engineDoRetryingStarting()](#engineDoRetryingStarting())
   350. [engineDoStartingSuccess()](#engineDoStartingSuccess())
   351. [engineDoStartingFailed()](#engineDoStartingFailed())
   352. [engineDoStartingFailed(String)](#engineDoStartingFailed(java.lang.String))
   353. [engineDoStartingFailed(VehicleEngineStateChangeReason)](#engineDoStartingFailed(zombie.vehicles.VehicleEngineStateChangeReason))
   354. [engineDoStartingFailedNoPower()](#engineDoStartingFailedNoPower())
   355. [engineDoRunning()](#engineDoRunning())
   356. [engineDoStalling()](#engineDoStalling())
   357. [engineDoShuttingDown()](#engineDoShuttingDown())
   358. [engineDoShuttingDown(String)](#engineDoShuttingDown(java.lang.String))
   359. [engineDoShuttingDown(VehicleEngineStateChangeReason)](#engineDoShuttingDown(zombie.vehicles.VehicleEngineStateChangeReason))
   360. [shutOff()](#shutOff())
   361. [shutOff(String)](#shutOff(java.lang.String))
   362. [resumeRunningAfterLoad()](#resumeRunningAfterLoad())
   363. [isEngineStarted()](#isEngineStarted())
   364. [isEngineRunning()](#isEngineRunning())
   365. [isEngineWorking()](#isEngineWorking())
   366. [isOperational()](#isOperational())
   367. [isDriveable()](#isDriveable())
   368. [getEmitter()](#getEmitter())
   369. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   370. [stopSound(long)](#stopSound(long))
   371. [playSound(String)](#playSound(java.lang.String))
   372. [checkVehicleSoundsExists()](#checkVehicleSoundsExists())
   373. [updateSounds()](#updateSounds())
   374. [updateWorldSounds()](#updateWorldSounds())
   375. [updateHandBrakeSound()](#updateHandBrakeSound())
   376. [updateParts()](#updateParts())
   377. [drainBatteryUpdateHack()](#drainBatteryUpdateHack())
   378. [getHeadlightsOn()](#getHeadlightsOn())
   379. [setHeadlightsOn(boolean)](#setHeadlightsOn(boolean))
   380. [getWindowLightsOn()](#getWindowLightsOn())
   381. [setWindowLightsOn(boolean)](#setWindowLightsOn(boolean))
   382. [getHeadlightCanEmmitLight()](#getHeadlightCanEmmitLight())
   383. [getStoplightsOn()](#getStoplightsOn())
   384. [setStoplightsOn(boolean)](#setStoplightsOn(boolean))
   385. [hasHeadlights()](#hasHeadlights())
   386. [addToWorld()](#addToWorld())
   387. [addToWorld(boolean)](#addToWorld(boolean))
   388. [removeFromWorld()](#removeFromWorld())
   389. [removeVehicleSounds()](#removeVehicleSounds())
   390. [permanentlyRemove()](#permanentlyRemove())
   391. [setEngineFeature(int, int, int)](#setEngineFeature(int,int,int))
   392. [getEngineQuality()](#getEngineQuality())
   393. [getEngineLoudness()](#getEngineLoudness())
   394. [getEnginePower()](#getEnginePower())
   395. [getParts()](#getParts())
   396. [adoptParts(VehicleParts)](#adoptParts(zombie.vehicles.VehicleParts))
   397. [getPartForSeatContainer(int)](#getPartForSeatContainer(int))
   398. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   399. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   400. [transmitPartCondition(VehiclePart)](#transmitPartCondition(zombie.vehicles.VehiclePart))
   401. [transmitPartItem(VehiclePart)](#transmitPartItem(zombie.vehicles.VehiclePart))
   402. [transmitPartLight(VehiclePart)](#transmitPartLight(zombie.vehicles.VehiclePart))
   403. [transmitPartModData(VehiclePart)](#transmitPartModData(zombie.vehicles.VehiclePart))
   404. [transmitPartUsedDelta(VehiclePart)](#transmitPartUsedDelta(zombie.vehicles.VehiclePart))
   405. [transmitPartDoor(VehiclePart)](#transmitPartDoor(zombie.vehicles.VehiclePart))
   406. [transmitPartWindow(VehiclePart)](#transmitPartWindow(zombie.vehicles.VehiclePart))
   407. [getLightCount()](#getLightCount())
   408. [getLightByIndex(int)](#getLightByIndex(int))
   409. [getZone()](#getZone())
   410. [setZone(String)](#setZone(java.lang.String))
   411. [isInArea(String, IsoGameCharacter)](#isInArea(java.lang.String,zombie.characters.IsoGameCharacter))
   412. [isInArea(String, float, float)](#isInArea(java.lang.String,float,float))
   413. [getAreaDist(String, float, float, float)](#getAreaDist(java.lang.String,float,float,float))
   414. [getAreaDist(String, IsoGameCharacter)](#getAreaDist(java.lang.String,zombie.characters.IsoGameCharacter))
   415. [getAreaCenter(String)](#getAreaCenter(java.lang.String))
   416. [getAreaCenter(String, Vector2)](#getAreaCenter(java.lang.String,zombie.iso.Vector2))
   417. [getAreaFacingPosition(String, Vector2)](#getAreaFacingPosition(java.lang.String,zombie.iso.Vector2))
   418. [isInBounds(float, float)](#isInBounds(float,float))
   419. [canAccessContainer(int, IsoGameCharacter)](#canAccessContainer(int,zombie.characters.IsoGameCharacter))
   420. [canInstallPart(IsoGameCharacter, VehiclePart)](#canInstallPart(zombie.characters.IsoGameCharacter,zombie.vehicles.VehiclePart))
   421. [canUninstallPart(IsoGameCharacter, VehiclePart)](#canUninstallPart(zombie.characters.IsoGameCharacter,zombie.vehicles.VehiclePart))
   422. [callLuaVoid(String, Object, Object)](#callLuaVoid(java.lang.String,java.lang.Object,java.lang.Object))
   423. [callLuaVoid(String, Object)](#callLuaVoid(java.lang.String,java.lang.Object))
   424. [callLuaVoid(String, Object, Object, Object)](#callLuaVoid(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   425. [callLuaBoolean(String, Object, Object)](#callLuaBoolean(java.lang.String,java.lang.Object,java.lang.Object))
   426. [callLuaBoolean(String, Object, Object, Object)](#callLuaBoolean(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   427. [getId()](#getId())
   428. [setTireInflation(int, float)](#setTireInflation(int,float))
   429. [setTireRemoved(int, boolean)](#setTireRemoved(int,boolean))
   430. [chooseBestAttackPosition(IsoGameCharacter, IsoGameCharacter, Vector3f)](#chooseBestAttackPosition(zombie.characters.IsoGameCharacter,zombie.characters.IsoGameCharacter,org.joml.Vector3f))
   431. [getMinMaxPosition()](#getMinMaxPosition())
   432. [getVehicleType()](#getVehicleType())
   433. [setVehicleType(String)](#setVehicleType(java.lang.String))
   434. [getMaxSpeed()](#getMaxSpeed())
   435. [setMaxSpeed(float)](#setMaxSpeed(float))
   436. [lockServerUpdate(long)](#lockServerUpdate(long))
   437. [changeTransmission(TransmissionNumber)](#changeTransmission(zombie.vehicles.TransmissionNumber))
   438. [tryHotwire(int)](#tryHotwire(int))
   439. [cheatHotwire(boolean, boolean)](#cheatHotwire(boolean,boolean))
   440. [isKeyIsOnDoor()](#isKeyIsOnDoor())
   441. [setKeyIsOnDoor(boolean)](#setKeyIsOnDoor(boolean))
   442. [isHotwired()](#isHotwired())
   443. [setHotwired(boolean)](#setHotwired(boolean))
   444. [isHotwiredBroken()](#isHotwiredBroken())
   445. [setHotwiredBroken(boolean)](#setHotwiredBroken(boolean))
   446. [getDriver()](#getDriver())
   447. [getDriverRegardlessOfTow()](#getDriverRegardlessOfTow())
   448. [getPVPPlayerDriver()](#getPVPPlayerDriver())
   449. [isKeysInIgnition()](#isKeysInIgnition())
   450. [setKeysInIgnition(boolean)](#setKeysInIgnition(boolean))
   451. [putKeyInIgnition(InventoryItem, int)](#putKeyInIgnition(zombie.inventory.InventoryItem,int))
   452. [removeKeyFromIgnition()](#removeKeyFromIgnition())
   453. [putKeyOnDoor(InventoryItem)](#putKeyOnDoor(zombie.inventory.InventoryItem))
   454. [removeKeyFromDoor()](#removeKeyFromDoor())
   455. [syncKeyInIgnition(boolean, boolean, InventoryItem)](#syncKeyInIgnition(boolean,boolean,zombie.inventory.InventoryItem))
   456. [randomizeContainers()](#randomizeContainers())
   457. [randomizeContainers(ItemPickerJava.ItemPickerRoom)](#randomizeContainers(zombie.inventory.ItemPickerJava.ItemPickerRoom))
   458. [randomizeContainer(VehiclePart, ItemPickerJava.ItemPickerRoom)](#randomizeContainer(zombie.vehicles.VehiclePart,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   459. [setChosenAlarmSound(String)](#setChosenAlarmSound(java.lang.String))
   460. [chooseAlarmSound()](#chooseAlarmSound())
   461. [onVehicleAlarmEvent(VehicleAlarmEvent)](#onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent))
   462. [onAlarmStart()](#onAlarmStart())
   463. [onAlarmStop()](#onAlarmStop())
   464. [onHornStart()](#onHornStart())
   465. [onHornStop()](#onHornStop())
   466. [hasBackSignal()](#hasBackSignal())
   467. [isBackSignalEmitting()](#isBackSignalEmitting())
   468. [onBackMoveSignalStart()](#onBackMoveSignalStart())
   469. [onBackMoveSignalStop()](#onBackMoveSignalStop())
   470. [getLightbarLightsModeObject()](#getLightbarLightsModeObject())
   471. [setLightbarLightsMode(int)](#setLightbarLightsMode(int))
   472. [setLightbarSirenMode(int)](#setLightbarSirenMode(int))
   473. [getChoosenParts()](#getChoosenParts())
   474. [getMass()](#getMass())
   475. [setMass(float)](#setMass(float))
   476. [getInitialMass()](#getInitialMass())
   477. [setInitialMass(float)](#setInitialMass(float))
   478. [updateTotalMass()](#updateTotalMass())
   479. [getBrakingForce()](#getBrakingForce())
   480. [setBrakingForce(float)](#setBrakingForce(float))
   481. [getBaseQuality()](#getBaseQuality())
   482. [setBaseQuality(float)](#setBaseQuality(float))
   483. [getCurrentSteering()](#getCurrentSteering())
   484. [setCurrentSteering(float)](#setCurrentSteering(float))
   485. [isDoingOffroad()](#isDoingOffroad())
   486. [isBraking()](#isBraking())
   487. [setBraking(boolean)](#setBraking(boolean))
   488. [updatePartStats()](#updatePartStats())
   489. [transmitEngine()](#transmitEngine())
   490. [setRust(float)](#setRust(float))
   491. [getRust()](#getRust())
   492. [transmitRust()](#transmitRust())
   493. [transmitAlarmed()](#transmitAlarmed())
   494. [transmitColorHSV()](#transmitColorHSV())
   495. [transmitSkinIndex()](#transmitSkinIndex())
   496. [updateBulletStats()](#updateBulletStats())
   497. [updateBulletStatsWheel(int, float[], Vector3f, float, int, double, double)](#updateBulletStatsWheel(int,float%5B%5D,org.joml.Vector3f,float,int,double,double))
   498. [setActiveInBullet(boolean)](#setActiveInBullet(boolean))
   499. [areAllDoorsLocked()](#areAllDoorsLocked())
   500. [isAnyDoorLocked()](#isAnyDoorLocked())
   501. [getRemainingFuelPercentage()](#getRemainingFuelPercentage())
   502. [getMechanicalID()](#getMechanicalID())
   503. [setMechanicalID(int)](#setMechanicalID(int))
   504. [needPartsUpdate()](#needPartsUpdate())
   505. [setNeedPartsUpdate(boolean)](#setNeedPartsUpdate(boolean))
   506. [isAlarmed()](#isAlarmed())
   507. [setAlarmed(boolean)](#setAlarmed(boolean))
   508. [setVehicleAlarm(VehicleAlarm)](#setVehicleAlarm(zombie.vehicles.VehicleAlarm))
   509. [getVehicleAlarmObject()](#getVehicleAlarmObject())
   510. [isAlarmActive()](#isAlarmActive())
   511. [isAlarmSoundOn()](#isAlarmSoundOn())
   512. [triggerAlarm()](#triggerAlarm())
   513. [doAlarm()](#doAlarm())
   514. [checkMusicIntensityEvent\_AlarmNearby()](#checkMusicIntensityEvent_AlarmNearby())
   515. [isMechanicUIOpen()](#isMechanicUIOpen())
   516. [setMechanicUIOpen(boolean)](#setMechanicUIOpen(boolean))
   517. [damagePlayers(float)](#damagePlayers(float))
   518. [addRandomDamageFromCrash(IsoGameCharacter, float)](#addRandomDamageFromCrash(zombie.characters.IsoGameCharacter,float))
   519. [isTrunkLocked()](#isTrunkLocked())
   520. [setTrunkLocked(boolean)](#setTrunkLocked(boolean))
   521. [getNearestBodyworkPart(IsoGameCharacter)](#getNearestBodyworkPart(zombie.characters.IsoGameCharacter))
   522. [getSirenStartTime()](#getSirenStartTime())
   523. [setSirenStartTime(double)](#setSirenStartTime(double))
   524. [repair()](#repair())
   525. [isAnyListenerInside()](#isAnyListenerInside())
   526. [isSirenActive()](#isSirenActive())
   527. [isSirenSounding()](#isSirenSounding())
   528. [getLightbarSirenModeObject()](#getLightbarSirenModeObject())
   529. [getMaxWheelSteering()](#getMaxWheelSteering())
   530. [getMinWheelSkid()](#getMinWheelSkid())
   531. [isAnyTireMissing()](#isAnyTireMissing())
   532. [couldCrawlerAttackPassenger(IsoGameCharacter)](#couldCrawlerAttackPassenger(zombie.characters.IsoGameCharacter))
   533. [isGoodCar()](#isGoodCar())
   534. [setGoodCar(boolean)](#setGoodCar(boolean))
   535. [getCurrentKey()](#getCurrentKey())
   536. [setCurrentKey(InventoryItem)](#setCurrentKey(zombie.inventory.InventoryItem))
   537. [isInForest()](#isInForest())
   538. [shouldNotHaveLoot()](#shouldNotHaveLoot())
   539. [isInTrafficJam()](#isInTrafficJam())
   540. [getOffroadEfficiency()](#getOffroadEfficiency())
   541. [applyImpulseFromHitCorpse(IsoDeadBody)](#applyImpulseFromHitCorpse(zombie.iso.objects.IsoDeadBody))
   542. [isDoColor()](#isDoColor())
   543. [setDoColor(boolean)](#setDoColor(boolean))
   544. [getBrakeSpeedBetweenUpdate()](#getBrakeSpeedBetweenUpdate())
   545. [getSquare()](#getSquare())
   546. [setColor(float, float, float)](#setColor(float,float,float))
   547. [setColorHSV(float, float, float)](#setColorHSV(float,float,float))
   548. [getColorHue()](#getColorHue())
   549. [getColorSaturation()](#getColorSaturation())
   550. [getColorValue()](#getColorValue())
   551. [isRemovedFromWorld()](#isRemovedFromWorld())
   552. [getInsideTemperature()](#getInsideTemperature())
   553. [getAnimationPlayer()](#getAnimationPlayer())
   554. [releaseAnimationPlayers()](#releaseAnimationPlayers())
   555. [setAddThumpWorldSound(boolean)](#setAddThumpWorldSound(boolean))
   556. [createImpulse(Vector3f)](#createImpulse(org.joml.Vector3f))
   557. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   558. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   559. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   560. [getThumpCondition()](#getThumpCondition())
   561. [isRegulator()](#isRegulator())
   562. [setRegulator(boolean)](#setRegulator(boolean))
   563. [getRegulatorSpeed()](#getRegulatorSpeed())
   564. [setRegulatorSpeed(float)](#setRegulatorSpeed(float))
   565. [getCurrentSpeedForRegulator()](#getCurrentSpeedForRegulator())
   566. [setVehicleTowing(BaseVehicle, String, String)](#setVehicleTowing(zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String))
   567. [setVehicleTowedBy(BaseVehicle, String, String)](#setVehicleTowedBy(zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String))
   568. [getVehicleTowing()](#getVehicleTowing())
   569. [getVehicleTowedBy()](#getVehicleTowedBy())
   570. [getTowingPartner()](#getTowingPartner())
   571. [attachmentExist(String)](#attachmentExist(java.lang.String))
   572. [getAttachmentLocalPos(String, Vector3f)](#getAttachmentLocalPos(java.lang.String,org.joml.Vector3f))
   573. [getAttachmentWorldPos(String, Vector3f)](#getAttachmentWorldPos(java.lang.String,org.joml.Vector3f))
   574. [setForceBrake()](#setForceBrake())
   575. [getTowingLocalPos(String, Vector3f)](#getTowingLocalPos(java.lang.String,org.joml.Vector3f))
   576. [getTowedByLocalPos(String, Vector3f)](#getTowedByLocalPos(java.lang.String,org.joml.Vector3f))
   577. [getTowingWorldPos(String, Vector3f)](#getTowingWorldPos(java.lang.String,org.joml.Vector3f))
   578. [getTowedByWorldPos(String, Vector3f)](#getTowedByWorldPos(java.lang.String,org.joml.Vector3f))
   579. [getPlayerTrailerLocalPos(String, boolean, Vector3f)](#getPlayerTrailerLocalPos(java.lang.String,boolean,org.joml.Vector3f))
   580. [getPlayerTrailerWorldPos(String, boolean, Vector3f)](#getPlayerTrailerWorldPos(java.lang.String,boolean,org.joml.Vector3f))
   581. [drawTowingRope()](#drawTowingRope())
   582. [drawDirectionLine(Vector2, float, float, float, float)](#drawDirectionLine(zombie.iso.Vector2,float,float,float,float))
   583. [addPointConstraint(IsoPlayer, BaseVehicle, String, String)](#addPointConstraint(zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String))
   584. [addPointConstraint(IsoPlayer, BaseVehicle, String, String, Boolean)](#addPointConstraint(zombie.characters.IsoPlayer,zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String,java.lang.Boolean))
   585. [authorizationChanged(IsoGameCharacter)](#authorizationChanged(zombie.characters.IsoGameCharacter))
   586. [constraintChanged()](#constraintChanged())
   587. [breakConstraint(boolean, boolean)](#breakConstraint(boolean,boolean))
   588. [breakConstraintOnServer()](#breakConstraintOnServer())
   589. [beginAttachingTrailer()](#beginAttachingTrailer())
   590. [stopAttachingTrailer()](#stopAttachingTrailer())
   591. [checkTrailerVerticalAlignment()](#checkTrailerVerticalAlignment())
   592. [checkTrailerAttachTime()](#checkTrailerAttachTime())
   593. [isAttachingTrailer()](#isAttachingTrailer())
   594. [canAttachTrailer(BaseVehicle, String, String)](#canAttachTrailer(zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String))
   595. [canAttachTrailer(BaseVehicle, String, String, boolean)](#canAttachTrailer(zombie.vehicles.BaseVehicle,java.lang.String,java.lang.String,boolean))
   596. [tryReconnectToTowedVehicle()](#tryReconnectToTowedVehicle())
   597. [positionTrailer(BaseVehicle)](#positionTrailer(zombie.vehicles.BaseVehicle))
   598. [getTowAttachmentSelf()](#getTowAttachmentSelf())
   599. [getTowAttachmentOther()](#getTowAttachmentOther())
   600. [getVehicleEngineRPM()](#getVehicleEngineRPM())
   601. [isBeingTowedBackwards()](#isBeingTowedBackwards())
   602. [getFMODParameters()](#getFMODParameters())
   603. [startEvent(long, GameSoundClip, boolean, BitSet)](#startEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   604. [updateEvent(long, GameSoundClip)](#updateEvent(long,zombie.audio.GameSoundClip))
   605. [stopEvent(long, GameSoundClip, boolean, BitSet)](#stopEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   606. [getVehicleSounds()](#getVehicleSounds())
   607. [setVehicleSounds(VehicleSounds)](#setVehicleSounds(zombie.vehicleSound.VehicleSounds))
   608. [setSmashed(String)](#setSmashed(java.lang.String))
   609. [setSmashed(String, boolean)](#setSmashed(java.lang.String,boolean))
   610. [isCollided(IsoGameCharacter)](#isCollided(zombie.characters.IsoGameCharacter))
   611. [checkNetworkCollision(IsoGameCharacter)](#checkNetworkCollision(zombie.characters.IsoGameCharacter))
   612. [onHitLandmine(IsoGridSquare)](#onHitLandmine(zombie.iso.IsoGridSquare))
   613. [onJump()](#onJump())
   614. [updateNetworkHitByVehicle(IsoGameCharacter)](#updateNetworkHitByVehicle(zombie.characters.IsoGameCharacter))
   615. [getAnimalTrailerSize()](#getAnimalTrailerSize())
   616. [getAnimals()](#getAnimals())
   617. [addAnimalFromHandsInTrailer(IsoAnimal, IsoPlayer)](#addAnimalFromHandsInTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.IsoPlayer))
   618. [addAnimalFromHandsInTrailer(IsoDeadBody, IsoPlayer)](#addAnimalFromHandsInTrailer(zombie.iso.objects.IsoDeadBody,zombie.characters.IsoPlayer))
   619. [addAnimalInTrailer(IsoDeadBody)](#addAnimalInTrailer(zombie.iso.objects.IsoDeadBody))
   620. [addAnimalInTrailer(IsoAnimal)](#addAnimalInTrailer(zombie.characters.animals.IsoAnimal))
   621. [recalcAnimalSize()](#recalcAnimalSize())
   622. [removeAnimalFromTrailer(IsoAnimal)](#removeAnimalFromTrailer(zombie.characters.animals.IsoAnimal))
   623. [replaceGrownAnimalInTrailer(IsoAnimal, IsoAnimal)](#replaceGrownAnimalInTrailer(zombie.characters.animals.IsoAnimal,zombie.characters.animals.IsoAnimal))
   624. [getCurrentTotalAnimalSize()](#getCurrentTotalAnimalSize())
   625. [setCurrentTotalAnimalSize(float)](#setCurrentTotalAnimalSize(float))
   626. [keyNamerVehicle(InventoryItem)](#keyNamerVehicle(zombie.inventory.InventoryItem))
   627. [keyNamerVehicle(InventoryItem, BaseVehicle)](#keyNamerVehicle(zombie.inventory.InventoryItem,zombie.vehicles.BaseVehicle))
   628. [checkZombieKeyForVehicle(IsoZombie)](#checkZombieKeyForVehicle(zombie.characters.IsoZombie))
   629. [checkZombieKeyForVehicle(IsoZombie, String)](#checkZombieKeyForVehicle(zombie.characters.IsoZombie,java.lang.String))
   630. [checkForSpecialMatchOne(String, String, String)](#checkForSpecialMatchOne(java.lang.String,java.lang.String,java.lang.String))
   631. [checkForSpecialMatchTwo(String, String, String)](#checkForSpecialMatchTwo(java.lang.String,java.lang.String,java.lang.String))
   632. [checkIfGoodVehicleForKey()](#checkIfGoodVehicleForKey())
   633. [trySpawnVehicleKeyOnZombie(IsoZombie)](#trySpawnVehicleKeyOnZombie(zombie.characters.IsoZombie))
   634. [trySpawnVehicleKeyInObject(IsoObject)](#trySpawnVehicleKeyInObject(zombie.iso.IsoObject))
   635. [checkSquareForVehicleKeySpot(IsoGridSquare)](#checkSquareForVehicleKeySpot(zombie.iso.IsoGridSquare))
   636. [checkSquareForVehicleKeySpot(IsoGridSquare, boolean)](#checkSquareForVehicleKeySpot(zombie.iso.IsoGridSquare,boolean))
   637. [checkSquareForVehicleKeySpotContainer(IsoGridSquare)](#checkSquareForVehicleKeySpotContainer(zombie.iso.IsoGridSquare))
   638. [checkSquareForVehicleKeySpotZombie(IsoGridSquare)](#checkSquareForVehicleKeySpotZombie(zombie.iso.IsoGridSquare))
   639. [doKeySandboxSettings(int)](#doKeySandboxSettings(int))
   640. [forceVehicleDistribution(String)](#forceVehicleDistribution(java.lang.String))
   641. [canLightSmoke(IsoGameCharacter)](#canLightSmoke(zombie.characters.IsoGameCharacter))
   642. [checkVehicleFailsToStartWithZombiesTargeting()](#checkVehicleFailsToStartWithZombiesTargeting())
   643. [checkVehicleStartsWithZombiesTargeting()](#checkVehicleStartsWithZombiesTargeting())
   644. [getZombieType()](#getZombieType())
   645. [getRandomZombieType()](#getRandomZombieType())
   646. [hasZombieType(String)](#hasZombieType(java.lang.String))
   647. [getFirstZombieType()](#getFirstZombieType())
   648. [notKillCrops()](#notKillCrops())
   649. [hasLighter()](#hasLighter())
   650. [leftSideFuel()](#leftSideFuel())
   651. [rightSideFuel()](#rightSideFuel())
   652. [isCreated()](#isCreated())
   653. [getTotalContainerItemWeight()](#getTotalContainerItemWeight())
   654. [isSirening()](#isSirening())
   655. [isDriverGodMode()](#isDriverGodMode())
   656. [getIntersectPoint(Vector3f, Vector3f, Vector3f)](#getIntersectPoint(org.joml.Vector3f,org.joml.Vector3f,org.joml.Vector3f))
   657. [getIntersectPoint(Vector3f, Vector3f, Vector3f, Vector3f)](#getIntersectPoint(org.joml.Vector3f,org.joml.Vector3f,org.joml.Vector3f,org.joml.Vector3f))
   658. [getNearestVehiclePart(float, float, float, boolean)](#getNearestVehiclePart(float,float,float,boolean))
   659. [isInArea(String, Vector3f)](#isInArea(java.lang.String,org.joml.Vector3f))
   660. [processRangeHit(IsoGameCharacter, HandWeapon, float)](#processRangeHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,float))
   661. [processMeleeHit(IsoGameCharacter, HandWeapon, float)](#processMeleeHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,float))
   662. [applyDamageToPart(IsoGameCharacter, HandWeapon, VehiclePart, float)](#applyDamageToPart(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,zombie.vehicles.VehiclePart,float))
   663. [processHit(IsoGameCharacter, HandWeapon, float)](#processHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon,float))
   664. [getPartByDirection(float, float, float)](#getPartByDirection(float,float,float))
   665. [buildVehiclePartList(String, float, ArrayList)](#buildVehiclePartList(java.lang.String,float,java.util.ArrayList))
   666. [getAnyRandomPart()](#getAnyRandomPart())
   667. [isGasTakeSide(String)](#isGasTakeSide(java.lang.String))
   668. [getWeightedRandomSidePart(String)](#getWeightedRandomSidePart(java.lang.String))
   669. [getWeightedRandomFrontPart()](#getWeightedRandomFrontPart())
   670. [getWeightedRandomRearPart()](#getWeightedRandomRearPart())
   671. [getWeightedRandomPart(ArrayList)](#getWeightedRandomPart(java.util.ArrayList))
   672. [canAddAnimalInTrailer(IsoAnimal)](#canAddAnimalInTrailer(zombie.characters.animals.IsoAnimal))
   673. [canAddAnimalInTrailer(IsoDeadBody)](#canAddAnimalInTrailer(zombie.iso.objects.IsoDeadBody))
   674. [isBurnt()](#isBurnt())
   675. [isSmashed()](#isSmashed())
   676. [isBurntOrSmashed()](#isBurntOrSmashed())
   677. [getSpecialKeyRingChance()](#getSpecialKeyRingChance())
   678. [hasLiveBattery()](#hasLiveBattery())
   679. [setDebugPhysicsRender(boolean)](#setDebugPhysicsRender(boolean))
   680. [testTouchingVehicle(IsoGameCharacter, RagdollController)](#testTouchingVehicle(zombie.characters.IsoGameCharacter,zombie.core.physics.RagdollController))
   681. [getCurrentOrLastKnownDriver()](#getCurrentOrLastKnownDriver())
   682. [getSquareForArea(String)](#getSquareForArea(java.lang.String))
   683. [partsClear()](#partsClear())
   684. [getThrottle()](#getThrottle())
   685. [validateHitVehicleDistance(float, float)](#validateHitVehicleDistance(float,float))
   686. [setLocked(boolean)](#setLocked(boolean))
   687. [setDoorLocked(VehiclePart, boolean)](#setDoorLocked(zombie.vehicles.VehiclePart,boolean))
   688. [shouldRebuildNameCoordCache()](#shouldRebuildNameCoordCache())
   689. [markNameCoordCacheValid()](#markNameCoordCacheValid())
   690. [layoutPassengerNameCoords(Vector2)](#layoutPassengerNameCoords(zombie.iso.Vector2))
   691. [centerPassengerNameCoords(int)](#centerPassengerNameCoords(int))
   692. [rebuildNameCoordCache(float)](#rebuildNameCoordCache(float))
   693. [findPassenger(IsoGameCharacter)](#findPassenger(zombie.characters.IsoGameCharacter))
   694. [getNameCoordForPlayer(IsoGameCharacter, float, Vector2)](#getNameCoordForPlayer(zombie.characters.IsoGameCharacter,float,zombie.iso.Vector2))
   695. [getNameAlignmentForPlayer(IsoGameCharacter)](#getNameAlignmentForPlayer(zombie.characters.IsoGameCharacter))
   696. [getNamePrefixForPlayer(IsoGameCharacter)](#getNamePrefixForPlayer(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../iso/IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")

zombie.vehicles.BaseVehicle

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Serializable, zombie.ai.astar.Mover, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, zombie.network.fields.IPositional, zombie.vehicles.IVehicleAlarmListener, zombie.vehicles.IVehicleEngineListener, zombie.vehicles.VehiclePartOwner, zombie.vehicleSound.VehicleSoundOwner`

---

public final class BaseVehicle
extends [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso")
implements zombie.iso.objects.interfaces.Thumpable, fmod.fmod.IFMODParameterUpdater, zombie.network.fields.IPositional, zombie.vehicles.IVehicleAlarmListener, zombie.vehicles.IVehicleEngineListener, zombie.vehicles.VehiclePartOwner, zombie.vehicleSound.VehicleSoundOwner

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.vehicles.BaseVehicle)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `BaseVehicle.Authorization`

  `static enum`

  `BaseVehicle.engineStateTypes`

  `static class`

  `BaseVehicle.HitVars`

  `private static final class`

  `BaseVehicle.L_testCollisionWithVehicle`

  `static final class`

  `BaseVehicle.Matrix4fObjectPool`

  `static final class`

  `BaseVehicle.MinMaxPosition`

  `static final class`

  `BaseVehicle.ModelInfo`

  `static final class`

  `BaseVehicle.Passenger`

  `static class`

  `BaseVehicle.PositionHistoryEntry`

  `static final class`

  `BaseVehicle.QuaternionfObjectPool`

  `static final class`

  `BaseVehicle.ServerVehicleState`

  `static final class`

  `BaseVehicle.TransformPool`

  `static class`

  `BaseVehicle.UpdateFlags`

  `static final class`

  `BaseVehicle.Vector2fObjectPool`

  `static final class`

  `BaseVehicle.Vector3fObjectPool`

  `static final class`

  `BaseVehicle.Vector3ObjectPool`

  `static final class`

  `BaseVehicle.Vector4fObjectPool`

  `private static final class`

  `BaseVehicle.VehicleImpulse`

  `private static final class`

  `BaseVehicle.WeightedVehiclePart`

  `static final class`

  `BaseVehicle.WheelInfo`

  ### Nested classes/interfaces inherited from class [IsoObject](../iso/IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Vector3f`

  `_UNIT_Y`

  `boolean`

  `addedToWorld`

  `private boolean`

  `addThumpWorldSound`

  `private float`

  `alarmAccumulator`

  `private boolean`

  `alarmed`

  `static final int`

  `AMBIENT_SOUND_RADIUS`

  `ArrayList<IsoAnimal>`

  `animals`

  `private zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animPlayer`

  `int`

  `authSimulationHash`

  `long`

  `authSimulationTime`

  `private float`

  `baseQuality`

  `private long`

  `beginAttachTrailerMS`

  `private final HashMap<String,Byte>`

  `bloodIntensity`

  `private float`

  `brakeBetweenUpdatesSpeed`

  `private float`

  `brakingForce`

  `private final ArrayList<IsoObject>`

  `breakingObjectsList`

  `private float`

  `breakingSlowFactor`

  `private static final Byte`

  `BYTE_ZERO`

  `static float`

  `centerOfMassMagic`

  `private final HashMap<String,String>`

  `choosenParts`

  `IsoChunk`

  `chunk`

  `float`

  `collideX`

  `float`

  `collideY`

  `float`

  `colorHue`

  `float`

  `colorSaturation`

  `float`

  `colorValue`

  `private static final float`

  `CONSTRAINT_ERP_ATTACHING`

  `long`

  `constraintChangedTime`

  `int`

  `constraintTowing`

  `private boolean`

  `created`

  `private boolean`

  `createdModel`

  `private int`

  `createPhysicsRecursion`

  `int`

  `currentFrontEndDurability`

  `private InventoryItem`

  `currentKey`

  `int`

  `currentRearEndDurability`

  `private float`

  `currentSteering`

  `private static final float`

  `DEFAULT_CONSTRAINT_ERP`

  `private boolean`

  `desirePhysicsActive`

  `private boolean`

  `disableSimulationDueToLackOfSurroundingChunks`

  `private boolean`

  `doColor`

  `private boolean`

  `doDamageOverlay`

  `static final float`

  `DOT_PRODUCT_ATTACH_TRAILER_FORWARD`

  `static final float`

  `DOT_PRODUCT_ATTACH_TRAILER_UP`

  `private BaseSoundEmitter`

  `emitter`

  `static final int`

  `ENGINE_SOUND_RADIUS`

  `static final int`

  `FADE_DISTANCE`

  `private final zombie.audio.FMODParameterList`

  `fmodParameters`

  `private final float`

  `forcedFriction`

  `int`

  `frontEndDurability`

  `private static final long`

  `GENTLY_ATTACH_TRAILER_MS`

  `private boolean`

  `handBrakeActive`

  `private long`

  `handBrakeSound`

  `boolean`

  `hasExtendOffset`

  `boolean`

  `hasExtendOffsetExiting`

  `boolean`

  `headlightsOn`

  `static final double`

  `HIT_VEHICLE_MAX_DISTANCE_TILES`

  `private final zombie.vehicles.VehicleHitCharacterSounds`

  `hitCharacterSounds`

  `private boolean`

  `hittingPlant`

  `private final BaseVehicle.HitVars`

  `hitVars`

  `private boolean`

  `hotwired`

  `private boolean`

  `hotwiredBroken`

  `ItemContainer`

  `ignitionSwitch`

  `private static final long`

  `IGNORE_CHARACTER_COLLISION_SOUND_INTERVAL`

  `private final BaseVehicle.VehicleImpulse`

  `impulseFromServer`

  `private final ArrayList<BaseVehicle.VehicleImpulse>`

  `impulsesFromHitObjects`

  `private final BaseVehicle.VehicleImpulse[]`

  `impulsesFromSquishedBodies`

  `private static final ColorInfo`

  `inf`

  `private float`

  `initialMass`

  `zombie.vehicles.VehicleInterpolation`

  `interpolation`

  `boolean`

  `isActive`

  `private boolean`

  `isBraking`

  `private boolean`

  `isGoodCar`

  `boolean`

  `isReliable`

  `boolean`

  `isStatic`

  `boolean`

  `jniIsCollide`

  `final Vector3f`

  `jniLinearVelocity`

  `private float`

  `jniSpeed`

  `final Transform`

  `jniTransform`

  `private boolean`

  `keyIsOnDoor`

  `int`

  `keysContainerId`

  `private boolean`

  `keysInIgnition`

  `private final float`

  `keySpawnChancedD100`

  `byte`

  `keySpawned`

  `private IsoGameCharacter`

  `lastDamagedBy`

  `private IsoGameCharacter`

  `lastDrivenBy`

  `private final Vector3f`

  `lastLinearVelocity`

  `private final IsoLightSource`

  `leftLight1`

  `private final IsoLightSource`

  `leftLight2`

  `private int`

  `leftLightIndex`

  `final zombie.vehicles.LightbarLightsMode`

  `lightbarLightsMode`

  `final zombie.vehicles.LightbarSirenMode`

  `lightbarSirenMode`

  `private final ArrayList<VehiclePart>`

  `lights`

  `private final zombie.core.utils.UpdateLimit`

  `limitCrash`

  `private Vector2`

  `limitPhysicPositionSent`

  `private final zombie.core.utils.UpdateLimit`

  `limitPhysicSend`

  `protected final zombie.core.utils.UpdateLimit`

  `limitPhysicValid`

  `private final zombie.core.utils.UpdateLimit`

  `limitUpdate`

  `private boolean`

  `loaded`

  `private static final float[]`

  `lowRiderParam`

  `static final int`

  `MASK1_DOOR_LEFT_FRONT`

  `static final int`

  `MASK1_DOOR_LEFT_REAR`

  `static final int`

  `MASK1_DOOR_RIGHT_FRONT`

  `static final int`

  `MASK1_DOOR_RIGHT_REAR`

  `static final int`

  `MASK1_FRONT`

  `static final int`

  `MASK1_GUARD_LEFT_FRONT`

  `static final int`

  `MASK1_GUARD_LEFT_REAR`

  `static final int`

  `MASK1_GUARD_RIGHT_FRONT`

  `static final int`

  `MASK1_GUARD_RIGHT_REAR`

  `static final int`

  `MASK1_REAR`

  `static final int`

  `MASK1_WINDOW_FRONT`

  `static final int`

  `MASK1_WINDOW_LEFT_FRONT`

  `static final int`

  `MASK1_WINDOW_LEFT_REAR`

  `static final int`

  `MASK1_WINDOW_REAR`

  `static final int`

  `MASK1_WINDOW_RIGHT_FRONT`

  `static final int`

  `MASK1_WINDOW_RIGHT_REAR`

  `static final int`

  `MASK2_BOOT`

  `static final int`

  `MASK2_BRAKE_LEFT`

  `static final int`

  `MASK2_BRAKE_RIGHT`

  `static final int`

  `MASK2_HOOD`

  `static final int`

  `MASK2_LIGHT_LEFT_FRONT`

  `static final int`

  `MASK2_LIGHT_LEFT_REAR`

  `static final int`

  `MASK2_LIGHT_RIGHT_FRONT`

  `static final int`

  `MASK2_LIGHT_RIGHT_REAR`

  `static final int`

  `MASK2_LIGHTBAR_LEFT`

  `static final int`

  `MASK2_LIGHTBAR_RIGHT`

  `static final int`

  `MASK2_ROOF`

  `private float`

  `mass`

  `static final int`

  `MAX_WHEELS`

  `private float`

  `maxSpeed`

  `private int`

  `mechanicalId`

  `private boolean`

  `mechanicUiOpen`

  `static final float`

  `MIN_HIT_SPEED_TILES_PER_SECOND`

  `static final float`

  `MINIMUM_DOT_UPRIGHT`

  `private VehiclePart`

  `missingEnginePart`

  `final ArrayList<BaseVehicle.ModelInfo>`

  `models`

  `private static final int`

  `NAME_TAG_Y_OFFSET`

  `private static final float`

  `NAME_TWO_COLUMN_X_OFFSET`

  `private int`

  `nameCoordFrame`

  `private int`

  `nameCoordPlayerIndex`

  `private boolean`

  `needPartsUpdate`

  `BaseVehicle.Authorization`

  `netPlayerAuthorization`

  `short`

  `netPlayerId`

  `int`

  `netPlayerTimeout`

  `private final int`

  `netPlayerTimeoutMax`

  `private boolean`

  `networkUpdated`

  `static final byte`

  `noAuthorization`

  `private boolean`

  `optionBloodDecals`

  `private final zombie.audio.parameters.ParameterVehicleBrake`

  `parameterVehicleBrake`

  `private final zombie.audio.parameters.ParameterVehicleEngineCondition`

  `parameterVehicleEngineCondition`

  `private final zombie.audio.parameters.ParameterVehicleGear`

  `parameterVehicleGear`

  `private final zombie.audio.parameters.ParameterVehicleLoad`

  `parameterVehicleLoad`

  `private final zombie.audio.parameters.ParameterVehicleRoadMaterial`

  `parameterVehicleRoadMaterial`

  `private final zombie.audio.parameters.ParameterVehicleRPM`

  `parameterVehicleRpm`

  `private final zombie.audio.parameters.ParameterVehicleSkid`

  `parameterVehicleSkid`

  `private final zombie.audio.parameters.ParameterVehicleSpeed`

  `parameterVehicleSpeed`

  `private final zombie.audio.parameters.ParameterVehicleSteer`

  `parameterVehicleSteer`

  `private final zombie.audio.parameters.ParameterVehicleTireMissing`

  `parameterVehicleTireMissing`

  `protected VehicleParts`

  `parts`

  `private BaseVehicle.Passenger[]`

  `passengers`

  `private final zombie.vehicles.VehiclePedestrianContactTracking`

  `pedestrianContacts`

  `long`

  `physicActiveCheck`

  `private final zombie.core.utils.UpdateLimit`

  `physicReliableLimit`

  `protected zombie.core.physics.CarController`

  `physics`

  `static final int`

  `PHYSICS_PARAM_COUNT`

  `static final float`

  `PHYSICS_Z_SCALE`

  `private static final float[]`

  `physicsParams`

  `static final float`

  `PLUS_RADIUS`

  `private final zombie.pathfind.VehiclePoly`

  `poly`

  `boolean`

  `polyDirty`

  `private boolean`

  `polyGarageCheck`

  `private final zombie.pathfind.VehiclePoly`

  `polyPlusRadius`

  `private float`

  `polyPlusRadiusMaxX`

  `private float`

  `polyPlusRadiusMaxY`

  `private float`

  `polyPlusRadiusMinX`

  `private float`

  `polyPlusRadiusMinY`

  `static final long`

  `POSITION_HISTORY_INTERVAL_MS`

  `static final int`

  `POSITION_HISTORY_MAX_ENTRIES`

  `private BaseVehicle.PositionHistoryEntry[]`

  `positionHistory`

  `private int`

  `positionHistoryIndex`

  `private final zombie.core.utils.UpdateLimit`

  `positionHistoryUpdateLimit`

  `boolean`

  `previouslyEntered`

  `boolean`

  `previouslyMoved`

  `static final float`

  `RADIUS`

  `private float`

  `radiusReductionInGarage`

  `long`

  `ramSound`

  `long`

  `ramSoundTime`

  `static final int`

  `RANDOMIZE_CONTAINER_CHANCE`

  `int`

  `rearEndDurability`

  `private boolean`

  `regulator`

  `private float`

  `regulatorSpeed`

  `private boolean`

  `removedFromWorld`

  `static boolean`

  `renderToTexture`

  `final org.joml.Matrix4f`

  `renderTransform`

  `private String`

  `respawnZone`

  `private final IsoLightSource`

  `rightLight1`

  `private final IsoLightSource`

  `rightLight2`

  `private int`

  `rightLightIndex`

  `private float`

  `rowConstraintZOffset`

  `private final zombie.vehicles.VehicleRunOverBodySounds`

  `runOverBodySounds`

  `float`

  `rust`

  `private static final HashMap<String,Integer>`

  `s_PartToMaskMap`

  `float`

  `savedPhysicsZ`

  `final org.joml.Quaternionf`

  `savedRot`

  `protected VehicleScript`

  `script`

  `private String`

  `scriptName`

  `boolean`

  `serverRemovedFromWorld`

  `final zombie.pathfind.VehiclePoly`

  `shadowCoord`

  `static final int`

  `SIREN_WORLDSOUND_RADIUS`

  `static final int`

  `SIREN_WORLDSOUND_VOLUME`

  `private double`

  `sirenStartTime`

  `private int`

  `skinIndex`

  `boolean`

  `soundBackMoveOn`

  `boolean`

  `soundHornOn`

  `private long`

  `soundScrapePastPlant`

  `String`

  `specificDistributionId`

  `int`

  `sqlId`

  `boolean`

  `stoplightsOn`

  `private final zombie.vehicles.SurroundVehicle`

  `surroundVehicle`

  `private static final zombie.pathfind.VehiclePoly`

  `tempPoly`

  `float`

  `throttle`

  `float`

  `timeSinceLastAuth`

  `static final ThreadLocal<BaseVehicle.Matrix4fObjectPool>`

  `TL_matrix4f_pool`

  `static final ThreadLocal<BaseVehicle.QuaternionfObjectPool>`

  `TL_quaternionf_pool`

  `static final ThreadLocal<BaseVehicle.TransformPool>`

  `TL_transform_pool`

  `static final ThreadLocal<BaseVehicle.Vector2fObjectPool>`

  `TL_vector2f_pool`

  `static final ThreadLocal<BaseVehicle.Vector3ObjectPool>`

  `TL_vector3_pool`

  `static final ThreadLocal<BaseVehicle.Vector3fObjectPool>`

  `TL_vector3f_pool`

  `static final ThreadLocal<BaseVehicle.Vector4fObjectPool>`

  `TL_vector4f_pool`

  `private float`

  `totalAnimalSize`

  `private String`

  `towAttachmentOther`

  `private String`

  `towAttachmentSelf`

  `static final float`

  `TRAILER_ANGULAR_LOWER_LIMIT_X`

  `static final float`

  `TRAILER_ANGULAR_LOWER_LIMIT_Y`

  `static final float`

  `TRAILER_ANGULAR_LOWER_LIMIT_Z`

  `static final float`

  `TRAILER_ANGULAR_UPPER_LIMIT_X`

  `static final float`

  `TRAILER_ANGULAR_UPPER_LIMIT_Y`

  `static final float`

  `TRAILER_ANGULAR_UPPER_LIMIT_Z`

  `static final float`

  `TRAILER_LINEAR_LOWER_LIMIT_X`

  `static final float`

  `TRAILER_LINEAR_LOWER_LIMIT_Y`

  `static final float`

  `TRAILER_LINEAR_LOWER_LIMIT_Z`

  `static final float`

  `TRAILER_LINEAR_UPPER_LIMIT_X`

  `static final float`

  `TRAILER_LINEAR_UPPER_LIMIT_Y`

  `static final float`

  `TRAILER_LINEAR_UPPER_LIMIT_Z`

  `private static final float`

  `TRAILER_MASS_MULTIPLIER_WHILE_ATTACHING`

  `final zombie.core.utils.UpdateLimit`

  `transmissionChangeTime`

  `zombie.vehicles.TransmissionNumber`

  `transmissionNumber`

  `private String`

  `type`

  `private final zombie.core.utils.UpdateLimit`

  `updateAnimal`

  `short`

  `updateFlags`

  `private long`

  `updateLockTimeout`

  `private zombie.vehicles.VehicleAlarm`

  `vehicleAlarm`

  `private VehicleEngineRPM`

  `vehicleEngineRpm`

  `short`

  `vehicleId`

  `static Texture`

  `vehicleShadow`

  `private zombie.vehicleSound.VehicleSounds`

  `vehicleSounds`

  `private BaseVehicle`

  `vehicleTowedBy`

  `private int`

  `vehicleTowedById`

  `private BaseVehicle`

  `vehicleTowing`

  `private int`

  `vehicleTowingId`

  `final org.joml.Matrix4f`

  `vehicleTransform`

  `boolean`

  `waitFullUpdate`

  `final BaseVehicle.WheelInfo[]`

  `wheelInfo`

  `private static final float[]`

  `wheelParams`

  `boolean`

  `windowLightsOn`

  `private final zombie.core.utils.UpdateLimit`

  `worldSoundUpdateLimit`

  `static final boolean`

  `YURI_FORCE_FIELD`

  `private long`

  `zombieHitTimestamp`

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

  `BaseVehicle(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAnimalFromHandsInTrailer(IsoAnimal animal,
  IsoPlayer player)`

  `void`

  `addAnimalFromHandsInTrailer(IsoDeadBody body,
  IsoPlayer player)`

  `void`

  `addAnimalInTrailer(IsoAnimal animal)`

  `void`

  `addAnimalInTrailer(IsoDeadBody body)`

  `void`

  `addBuildingKeyToGloveBox(IsoGridSquare square)`

  `private void`

  `addDamageFront(int dmg)`

  `void`

  `addDamageFrontHitAChr(int dmg)`

  `private void`

  `addDamageRear(int dmg)`

  `void`

  `addDamageRearHitAChr(int dmg)`

  `void`

  `addEngineSpeed(double speed)`

  `void`

  `addImpulse(Vector3f impulse,
  Vector3f relPos)`

  `void`

  `addKeyToGloveBox()`

  `boolean`

  `addKeyToSquare(IsoGridSquare sq)`

  `boolean`

  `addKeyToSquare(IsoGridSquare sq,
  boolean crashed)`

  `boolean`

  `addKeyToSquare2(IsoGridSquare sq,
  int x2)`

  `boolean`

  `addKeyToSquare2(IsoGridSquare sq,
  int x2,
  boolean crashed)`

  `void`

  `addKeyToWorld()`

  `void`

  `addKeyToWorld(boolean crashed)`

  `void`

  `addPointConstraint(IsoPlayer player,
  BaseVehicle vehicleB,
  String attachmentA,
  String attachmentB)`

  `void`

  `addPointConstraint(IsoPlayer player,
  BaseVehicle vehicleB,
  String attachmentA,
  String attachmentB,
  Boolean remote)`

  `void`

  `addRandomDamageFromCrash(IsoGameCharacter chr,
  float damage)`

  `void`

  `addToWorld()`

  `void`

  `addToWorld(boolean crashed)`

  `void`

  `adoptParts(VehicleParts partsNew)`

  `static org.joml.Matrix4f`

  `allocMatrix4f()`

  `static org.joml.Quaternionf`

  `allocQuaternionf()`

  `static Transform`

  `allocTransform()`

  `static Vector2`

  `allocVector2()`

  `static Vector2f`

  `allocVector2f()`

  `static Vector3`

  `allocVector3()`

  `static Vector3f`

  `allocVector3f()`

  `static org.joml.Vector4f`

  `allocVector4f()`

  `void`

  `applyAccumulatedImpulsesFromHitObjectsToPhysics()`

  `void`

  `applyAllImpulsesFromProneCharacters()`

  `private void`

  `applyDamageFromHitCharacters(zombie.vehicles.VehiclePedestrianContactTracking pedestrianContacts)`

  Apply all damage from impacted, damage-causing characters, for this frame.

  `private void`

  `applyDamageToPart(IsoGameCharacter isoGameCharacter,
  HandWeapon weapon,
  VehiclePart vehiclePart,
  float damage)`

  `void`

  `applyImpulseFromHitCorpse(IsoDeadBody chr)`

  `void`

  `applyImpulseFromHitObject(IsoObject obj,
  float mul)`

  `void`

  `applyImpulseFromHitPedestrian(IsoGameCharacter chr)`

  `void`

  `applyImpulseFromHitPlant(IsoObject obj,
  float mul)`

  `void`

  `applyImpulseGeneric(float fromX,
  float fromY,
  float fromZ,
  float impulseDirX,
  float impulseDirY,
  float impulseDirZ,
  float impulseStrength)`

  `boolean`

  `areAllDoorsLocked()`

  `private Vector2`

  `areaPositionLocal(VehicleScript.Area area)`

  `private Vector2`

  `areaPositionLocal(VehicleScript.Area area,
  Vector2 out)`

  `Vector2`

  `areaPositionWorld(VehicleScript.Area area)`

  `Vector2`

  `areaPositionWorld(VehicleScript.Area area,
  Vector2 out)`

  `Vector2`

  `areaPositionWorld4PlayerInteract(VehicleScript.Area area)`

  `Vector2`

  `areaPositionWorld4PlayerInteract(VehicleScript.Area area,
  Vector2 out)`

  `boolean`

  `attachmentExist(String attachmentName)`

  `void`

  `authorizationChanged(IsoGameCharacter character)`

  `void`

  `authorizationClientCollide(IsoPlayer driver)`

  `void`

  `authorizationServerCollide(short playerId,
  boolean isCollide)`

  `void`

  `authorizationServerOnSeat(IsoPlayer player,
  boolean enter)`

  `void`

  `beginAttachingTrailer()`

  `boolean`

  `blocked(int x,
  int y,
  int z)`

  `void`

  `breakConstraint(boolean forgetID,
  boolean remote)`

  `boolean`

  `breakConstraintOnServer()`

  `void`

  `breakingObjects()`

  `private void`

  `buildVehiclePartList(String partId,
  float weight,
  ArrayList<BaseVehicle.WeightedVehiclePart> weightedVehiclePartArrayList)`

  `int`

  `calculateDamageWithCharacter(IsoGameCharacter chr)`

  `private Boolean`

  `callLuaBoolean(String functionName,
  Object arg,
  Object arg2)`

  `private Boolean`

  `callLuaBoolean(String functionName,
  Object arg,
  Object arg2,
  Object arg3)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1,
  Object arg2)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1,
  Object arg2,
  Object arg3)`

  `boolean`

  `canAccessContainer(int partIndex,
  IsoGameCharacter chr)`

  `boolean`

  `canAddAnimalInTrailer(IsoAnimal animal)`

  `boolean`

  `canAddAnimalInTrailer(IsoDeadBody animal)`

  `boolean`

  `canAttachTrailer(BaseVehicle vehicleB,
  String attachmentA,
  String attachmentB)`

  `boolean`

  `canAttachTrailer(BaseVehicle vehicleB,
  String attachmentA,
  String attachmentB,
  boolean reconnect)`

  `boolean`

  `canInstallPart(IsoGameCharacter chr,
  VehiclePart part)`

  `boolean`

  `canLightSmoke(IsoGameCharacter chr)`

  `boolean`

  `canLockDoor(VehiclePart part,
  IsoGameCharacter chr)`

  `boolean`

  `canOpenDoor(VehiclePart part,
  IsoGameCharacter chr)`

  `boolean`

  `canSwitchSeat(int seatFrom,
  int seatTo)`

  `boolean`

  `canUninstallPart(IsoGameCharacter chr,
  VehiclePart part)`

  `boolean`

  `canUnlockDoor(VehiclePart part,
  IsoGameCharacter chr)`

  `private void`

  `centerPassengerNameCoords(int height)`

  `void`

  `changeTransmission(zombie.vehicles.TransmissionNumber newTransmission)`

  `void`

  `cheatHotwire(boolean hotwired,
  boolean broken)`

  `private void`

  `checkCollisionWithPlant(IsoGridSquare sq,
  IsoObject object,
  Vector2 vector2)`

  `private void`

  `checkDamage(VehiclePart part,
  int matrixName,
  boolean doBlack)`

  `private void`

  `checkDamage2(VehiclePart part,
  int matrixName,
  boolean doBlack)`

  `boolean`

  `checkForSpecialMatchOne(String one,
  String two,
  String three)`

  `boolean`

  `checkForSpecialMatchTwo(String one,
  String two,
  String three)`

  `boolean`

  `checkIfGoodVehicleForKey()`

  `private void`

  `checkMusicIntensityEvent_AlarmNearby()`

  `BaseVehicle.HitVars`

  `checkNetworkCollision(IsoGameCharacter target)`

  `void`

  `checkPhysicsValidWithServer()`

  `boolean`

  `checkSquareForVehicleKeySpot(IsoGridSquare square)`

  `boolean`

  `checkSquareForVehicleKeySpot(IsoGridSquare square,
  boolean crashed)`

  `boolean`

  `checkSquareForVehicleKeySpotContainer(IsoGridSquare square)`

  `boolean`

  `checkSquareForVehicleKeySpotZombie(IsoGridSquare square)`

  `void`

  `checkSurroundingChunks()`

  `private void`

  `checkTrailerAttachTime()`

  `private void`

  `checkTrailerVerticalAlignment()`

  `private void`

  `checkUninstall2(VehiclePart part,
  int matrixName)`

  `private void`

  `checkVehicleFailsToStartWithZombiesTargeting()`

  `void`

  `checkVehicleSoundsExists()`

  `private void`

  `checkVehicleStartsWithZombiesTargeting()`

  `boolean`

  `checkZombieKeyForVehicle(IsoZombie zombie)`

  `boolean`

  `checkZombieKeyForVehicle(IsoZombie zombie,
  String vehicleType)`

  `void`

  `chooseAlarmSound()`

  `Vector3f`

  `chooseBestAttackPosition(IsoGameCharacter target,
  IsoGameCharacter attacker,
  Vector3f worldPos)`

  `private void`

  `chooseRandomScript()`

  `boolean`

  `circleIntersects(float x,
  float y,
  float z,
  float radius)`

  `private float`

  `clamp(float f1,
  float min,
  float max)`

  `boolean`

  `clearPassenger(int seat)`

  `void`

  `constraintChanged()`

  `boolean`

  `couldCrawlerAttackPassenger(IsoGameCharacter chr)`

  `private boolean`

  `couldSeeIntersectedSquare(int playerIndex)`

  `void`

  `crash(float delta,
  boolean front)`

  `void`

  `createImpulse(Vector3f vec)`

  `private void`

  `createParts()`

  `void`

  `createPhysics()`

  `void`

  `createPhysics(boolean spawnSwap)`

  `InventoryItem`

  `createVehicleKey()`

  `void`

  `Damage(float amount)`

  `void`

  `damageFromHitChr(int dmgFront,
  int dmgBack)`

  `private void`

  `damageHeadlight(String partId,
  int dmg)`

  `void`

  `damageObjects(float damage)`

  `void`

  `damagePlayers(float damage)`

  `float`

  `distanceToManhatten(float x,
  float y)`

  `private void`

  `doAlarm()`

  `void`

  `doBloodOverlay()`

  `private void`

  `doBloodOverlayAux(float[] matrix1,
  float[] matrix2,
  float intensity)`

  `private void`

  `doBloodOverlayFront(float[] matrix1,
  float[] matrix2,
  float intensity)`

  `private void`

  `doBloodOverlayLeft(float[] matrix1,
  float[] matrix2,
  float intensity)`

  `private void`

  `doBloodOverlayRear(float[] matrix1,
  float[] matrix2,
  float intensity)`

  `private void`

  `doBloodOverlayRight(float[] matrix1,
  float[] matrix2,
  float intensity)`

  `void`

  `doDamageOverlay()`

  `private void`

  `doDoorDamage()`

  `private static float`

  `doKeySandboxSettings(int value)`

  `private void`

  `doOtherBodyWorkDamage()`

  `private void`

  `doVehicleColor()`

  Gonna decide which color is our car, basically:
  15% of being red, 10% of blue, 30% being extra bright (white/light grey), 20% chance of having low saturation
  (grey/black), other will be random color

  `private void`

  `doWindowDamage()`

  `void`

  `drainBatteryUpdateHack()`

  `void`

  `drawDirectionLine(Vector2 dir,
  float length,
  float r,
  float g,
  float b)`

  `private void`

  `drawTowingRope()`

  `void`

  `engineDoIdle()`

  `void`

  `engineDoRetryingStarting()`

  `void`

  `engineDoRunning()`

  `void`

  `engineDoShuttingDown()`

  `void`

  `engineDoShuttingDown(String sound)`

  `void`

  `engineDoShuttingDown(zombie.vehicles.VehicleEngineStateChangeReason reason)`

  `void`

  `engineDoStalling()`

  `void`

  `engineDoStarting()`

  `void`

  `engineDoStartingFailed()`

  `void`

  `engineDoStartingFailed(String sound)`

  `void`

  `engineDoStartingFailed(zombie.vehicles.VehicleEngineStateChangeReason reason)`

  `void`

  `engineDoStartingFailedNoPower()`

  `void`

  `engineDoStartingSuccess()`

  `boolean`

  `enter(int seat,
  IsoGameCharacter chr)`

  `boolean`

  `enter(int seat,
  IsoGameCharacter chr,
  Vector3f offset)`

  `boolean`

  `enterRSync(int seat,
  IsoGameCharacter chr,
  BaseVehicle v)`

  `boolean`

  `exit(IsoGameCharacter chr)`

  `boolean`

  `exitRSync(IsoGameCharacter chr)`

  `private BaseVehicle.Passenger`

  `findPassenger(IsoGameCharacter player)`

  `void`

  `fixLightbarModelLighting(IsoLightSource ls,
  Vector3f lightPos)`

  `void`

  `flipUpright()`

  `void`

  `forceVehicleDistribution(String distribution)`

  `ArrayList<VehiclePart>`

  `getAllSeatParts()`

  `ArrayList<VehiclePart>`

  `getAllSeatParts(ArrayList<VehiclePart> results)`

  `float`

  `getAngleX()`

  `float`

  `getAngleY()`

  `float`

  `getAngleZ()`

  `ArrayList<IsoAnimal>`

  `getAnimals()`

  `float`

  `getAnimalTrailerSize()`

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `getAnimationPlayer()`

  `private VehiclePart`

  `getAnyRandomPart()`

  `Vector2`

  `getAreaCenter(String areaId)`

  `Vector2`

  `getAreaCenter(String areaId,
  Vector2 out)`

  `float`

  `getAreaDist(String areaId,
  float x,
  float y,
  float z)`

  `float`

  `getAreaDist(String areaId,
  IsoGameCharacter chr)`

  `Vector2`

  `getAreaFacingPosition(String areaId,
  Vector2 out)`

  getAreaFacingPosition
  The point-of-entry to the part represented by this area in the vehicle.

  `Vector3f`

  `getAttachmentLocalPos(String attachmentName,
  Vector3f v)`

  `Vector3f`

  `getAttachmentWorldPos(String attachmentName,
  Vector3f v)`

  `String`

  `getAuthorizationDescription()`

  `float`

  `getBaseQuality()`

  `int`

  `getBestSeat(IsoGameCharacter chr)`

  `float`

  `getBloodIntensity(String id)`

  `float`

  `getBrakeSpeedBetweenUpdate()`

  `float`

  `getBrakingForce()`

  `IsoGameCharacter`

  `getCharacter(int seat)`

  `HashMap<String,String>`

  `getChoosenParts()`

  `String`

  `getChosenAlarmSound()`

  `float`

  `getClientForce()`

  `private double`

  `getClosestPointOnEdge(float px,
  float py,
  float x1,
  float y1,
  float x2,
  float y2,
  double closestDistSq,
  Vector2f out)`

  `float`

  `getClosestPointOnExtents(float x,
  float y,
  Vector2f closest)`

  `float`

  `getClosestPointOnPoly(float x,
  float y,
  Vector2f closest)`

  `float`

  `getClosestPointOnPoly(BaseVehicle other,
  Vector2f pointSelf,
  Vector2f pointOther)`

  `private @Nullable VehiclePart`

  `getClosestWindow(float chrX,
  float chrY,
  float chrZ,
  float forwardDirectionX,
  float forwardDirectionY)`

  `VehiclePart`

  `getClosestWindow(IsoGameCharacter chr)`

  `float`

  `getColorHue()`

  `float`

  `getColorSaturation()`

  `float`

  `getColorValue()`

  `zombie.core.physics.CarController`

  `getController()`

  `private String`

  `getCrashSound(float dmg)`

  `float`

  `getCurrentAbsoluteSpeedKmHour()`

  `InventoryItem`

  `getCurrentKey()`

  `IsoGameCharacter`

  `getCurrentOrLastKnownDriver()`

  `float`

  `getCurrentSpeedForRegulator()`

  `float`

  `getCurrentSpeedKmHour()`

  `float`

  `getCurrentSteering()`

  `float`

  `getCurrentTotalAnimalSize()`

  `float`

  `getDebugZ()`

  `IsoGameCharacter`

  `getDriver()`

  `IsoGameCharacter`

  `getDriverRegardlessOfTow()`

  `BaseSoundEmitter`

  `getEmitter()`

  `int`

  `getEngineCondition()`

  `int`

  `getEngineLoudness()`

  `int`

  `getEnginePower()`

  `int`

  `getEngineQuality()`

  `double`

  `getEngineSpeed()`

  `BaseVehicle.engineStateTypes`

  `getEngineState()`

  `float`

  `getEnterSeatDistance(int seat,
  float x,
  float y)`

  `private Vector2`

  `getFacingPosition(float worldX,
  float worldY,
  float worldZ,
  Vector2 worldFacingPos)`

  `Vector2`

  `getFacingPosition(IsoGameCharacter chr,
  Vector2 out)`

  `static float`

  `getFakeSpeedModifier()`

  `String`

  `getFirstZombieType()`

  `zombie.audio.FMODParameterList`

  `getFMODParameters()`

  `float`

  `getForce()`

  `Vector3f`

  `getForwardVector(Vector3f out)`

  `float`

  `getFudgedMass()`

  `boolean`

  `getHeadlightCanEmmitLight()`

  `boolean`

  `getHeadlightsOn()`

  `short`

  `getId()`

  `float`

  `getInitialMass()`

  `float`

  `getInsideTemperature()`

  `Vector3f`

  `getIntersectPoint(Vector3f start,
  Vector3f end,
  Vector3f result)`

  `private Vector3f`

  `getIntersectPoint(Vector3f start,
  Vector3f end,
  Vector3f extents,
  Vector3f result)`

  `int`

  `getJoypad()`

  `boolean`

  `getKeySpawned()`

  `zombie.vehicles.LightbarLightsMode`

  `getLightbarLightsModeObject()`

  `zombie.vehicles.LightbarSirenMode`

  `getLightbarSirenModeObject()`

  `VehiclePart`

  `getLightByIndex(int index)`

  `int`

  `getLightCount()`

  `Vector3f`

  `getLinearVelocity(Vector3f out)`

  `Vector3f`

  `getLocalPos(float worldX,
  float worldY,
  float worldZ,
  Vector3f localPos)`

  `Vector3f`

  `getLocalPos(Vector3f worldPos,
  Vector3f localPos)`

  `float`

  `getMass()`

  `int`

  `getMaxPassengers()`

  `float`

  `getMaxSpeed()`

  `float`

  `getMaxWheelSteering()`

  `int`

  `getMechanicalID()`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `BaseVehicle.MinMaxPosition`

  `getMinMaxPosition()`

  `float`

  `getMinWheelSkid()`

  `private BaseVehicle.ModelInfo`

  `getModelInfoForPart(VehiclePart part)`

  `private String`

  `getModelScriptNameForPart(VehiclePart part,
  VehicleScript.Model scriptModel)`

  `zombie.ui.TextDrawHorizontal`

  `getNameAlignmentForPlayer(IsoGameCharacter player)`

  `boolean`

  `getNameCoordForPlayer(IsoGameCharacter player,
  float zoom,
  Vector2 coord)`

  `String`

  `getNamePrefixForPlayer(IsoGameCharacter player)`

  `VehiclePart`

  `getNearestBodyworkPart(IsoGameCharacter chr)`

  `VehiclePart`

  `getNearestVehiclePart(float x,
  float y,
  float z,
  boolean useDestroyed)`

  `short`

  `getNetPlayerId()`

  `String`

  `getObjectName()`

  `private float`

  `getObjectX(IsoObject obj)`

  `private float`

  `getObjectY(IsoObject obj)`

  `float`

  `getOffroadEfficiency()`

  `private VehiclePart`

  `getPartByDirection(float x,
  float y,
  float z)`

  `VehiclePart`

  `getPartForSeatContainer(int seat)`

  `VehicleParts`

  `getParts()`

  `BaseVehicle.Passenger`

  `getPassenger(int seat)`

  `VehicleScript.Anim`

  `getPassengerAnim(int seat,
  String id)`

  `String`

  `getPassengerArea(int seat)`

  `VehiclePart`

  `getPassengerDoor(int seat)`

  `VehiclePart`

  `getPassengerDoor2(int seat)`

  `Vector3f`

  `getPassengerLocalPos(int seat,
  Vector3f v)`

  `VehicleScript.Position`

  `getPassengerPosition(int seat,
  String id)`

  `Vector3f`

  `getPassengerPositionWorldPos(float x,
  float y,
  float z,
  Vector3f out)`

  `Vector3f`

  `getPassengerPositionWorldPos(VehicleScript.Position posn,
  Vector3f out)`

  `VehicleScript.Passenger.SwitchSeat`

  `getPassengerSwitchSeat(int seat,
  int index)`

  `int`

  `getPassengerSwitchSeatCount(int seat)`

  `Vector3f`

  `getPassengerWorldPos(int seat,
  Vector3f out)`

  `Vector3f`

  `getPlayerTrailerLocalPos(String attachmentName,
  boolean left,
  Vector3f v)`

  `Vector3f`

  `getPlayerTrailerWorldPos(String attachmentName,
  boolean left,
  Vector3f v)`

  `zombie.pathfind.VehiclePoly`

  `getPoly()`

  `zombie.pathfind.VehiclePoly`

  `getPolyPlusRadius()`

  `IsoPlayer`

  `getPVPPlayerDriver()`

  `String`

  `getRandomZombieType()`

  `float`

  `getRegulatorSpeed()`

  `float`

  `getRemainingFuelPercentage()`

  `zombie.audio.parameters.ParameterVehicleRoadMaterial.Material`

  `getRoadMaterial()`

  `float`

  `getRust()`

  `VehicleScript`

  `getScript()`

  `String`

  `getScriptName()`

  `private VehicleScript.Passenger`

  `getScriptPassenger(int seat)`

  `int`

  `getSeat(IsoGameCharacter chr)`

  `Texture`

  `getShadowTexture()`

  `double`

  `getSirenStartTime()`

  `String`

  `getSkin()`

  `int`

  `getSkinCount()`

  `int`

  `getSkinIndex()`

  `float`

  `getSpecialKeyRingChance()`

  `float`

  `getSpeed2D()`

  `int`

  `getSqlId()`

  `IsoGridSquare`

  `getSquare()`

  `IsoGridSquare`

  `getSquareForArea(String areaId)`

  `boolean`

  `getStoplightsOn()`

  `zombie.vehicles.SurroundVehicle`

  `getSurroundVehicle()`

  `private VehicleScript.Passenger.SwitchSeat`

  `getSwitchSeat(int seatFrom,
  int seatTo)`

  `String`

  `getSwitchSeatAnimName(int seatFrom,
  int seatTo)`

  `float`

  `getSwitchSeatAnimRate(int seatFrom,
  int seatTo)`

  `String`

  `getSwitchSeatSound(int seatFrom,
  int seatTo)`

  `float`

  `getThrottle()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `float`

  `getThumpCondition()`

  `float`

  `getTotalContainerItemWeight()`

  `String`

  `getTowAttachmentOther()`

  `String`

  `getTowAttachmentSelf()`

  `Vector3f`

  `getTowedByLocalPos(String attachmentName,
  Vector3f v)`

  `Vector3f`

  `getTowedByWorldPos(String attachmentName,
  Vector3f v)`

  `Vector3f`

  `getTowingLocalPos(String attachmentName,
  Vector3f v)`

  `BaseVehicle`

  `getTowingPartner()`

  `Vector3f`

  `getTowingWorldPos(String attachmentName,
  Vector3f v)`

  `int`

  `getTransmissionNumber()`

  `zombie.vehicles.TransmissionNumber`

  `getTransmissionNumberEnum()`

  `String`

  `getTransmissionNumberLetter()`

  `Vector3f`

  `getUpVector(Vector3f out)`

  `float`

  `getUpVectorDot()`

  `VehiclePart`

  `getUseablePart(IsoGameCharacter chr)`

  `VehiclePart`

  `getUseablePart(IsoGameCharacter chr,
  boolean checkDir)`

  `zombie.vehicles.VehicleAlarm`

  `getVehicleAlarmObject()`

  `private zombie.vehicles.VehicleEngine`

  `getVehicleEngine()`

  `VehicleEngineRPM`

  `getVehicleEngineRPM()`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate)`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `BaseSoundEmitter`

  `getVehicleSoundEmitter()`

  `zombie.vehicleSound.VehicleSounds`

  `getVehicleSounds()`

  `BaseVehicle`

  `getVehicleTowedBy()`

  `BaseVehicle`

  `getVehicleTowing()`

  `String`

  `getVehicleType()`

  `private VehiclePart`

  `getWeightedRandomFrontPart()`

  `private VehiclePart`

  `getWeightedRandomPart(ArrayList<BaseVehicle.WeightedVehiclePart> weightedVehiclePartList)`

  `private VehiclePart`

  `getWeightedRandomRearPart()`

  `private VehiclePart`

  `getWeightedRandomSidePart(String side)`

  `void`

  `getWheelForwardVector(int wheelIndex,
  Vector3f out)`

  `boolean`

  `getWindowLightsOn()`

  `Vector3f`

  `getWorldPos(float localX,
  float localY,
  float localZ,
  Vector3f worldPos)`

  `Vector3f`

  `getWorldPos(float localX,
  float localY,
  float localZ,
  Vector3f worldPos,
  VehicleScript script)`

  `Vector3f`

  `getWorldPos(Vector3f localPos,
  Vector3f worldPos)`

  `Vector3f`

  `getWorldPos(Vector3f localPos,
  Vector3f worldPos,
  VehicleScript script)`

  `Transform`

  `getWorldTransform(Transform out)`

  `ArrayList<String>`

  `getZombieType()`

  `String`

  `getZone()`

  `boolean`

  `hasAuthorization(zombie.core.raknet.UdpConnection connection)`

  `boolean`

  `hasBackSignal()`

  `private boolean`

  `hasChunksAllAround()`

  `boolean`

  `hasHeadlights()`

  `boolean`

  `hasLighter()`

  `boolean`

  `hasLiveBattery()`

  `boolean`

  `hasPassenger()`

  `boolean`

  `hasRoof(int seat)`

  `boolean`

  `hasZombieType(String outfit)`

  `boolean`

  `haveOneDoorUnlocked()`

  `void`

  `hitAnimal(IsoAnimal chr)`

  `void`

  `HitByVehicle(BaseVehicle vehicle,
  float amount)`

  `float`

  `hitCharacter(IsoGameCharacter chr,
  Vector2 impactPosOnVehicle)`

  `private void`

  `initParts()`

  `private void`

  `initPolyPlusRadiusBounds()`

  `private void`

  `initShadowPoly()`

  `private void`

  `initTransform(zombie.core.skinnedmodel.model.ModelInstance parentModelInstance,
  ModelScript parentModelScript,
  ModelScript modelScript,
  String attachmentNameParent,
  String attachmentNameSelf,
  org.joml.Matrix4f transform)`

  `boolean`

  `intersectLineWithExtents(float x1,
  float y1,
  float x2,
  float y2,
  float adjust,
  Vector2f intersection)`

  `boolean`

  `intersectLineWithPoly(float x1,
  float y1,
  float x2,
  float y2,
  Vector2f intersection)`

  `boolean`

  `isAlarmActive()`

  `boolean`

  `isAlarmed()`

  `boolean`

  `isAlarmSounding()`

  `boolean`

  `isAlarmSoundOn()`

  `boolean`

  `isAnyDoorLocked()`

  `boolean`

  `isAnyListenerInside()`

  `boolean`

  `isAnyTireMissing()`

  `boolean`

  `isAtRest()`

  `boolean`

  `isAttachingTrailer()`

  `boolean`

  `isBackSignalEmitting()`

  `boolean`

  `isBackupBeeperSounding()`

  `boolean`

  `isBeingTowedBackwards()`

  `boolean`

  `isBrakePedalPressed()`

  `boolean`

  `isBraking()`

  `boolean`

  `isBurnt()`

  `boolean`

  `isBurntOrSmashed()`

  `boolean`

  `isCharacterAdjacentTo(IsoGameCharacter chr)`

  `private boolean`

  `isCharacterInFront(IsoGameCharacter chr)`

  `boolean`

  `isCollided(IsoGameCharacter character)`

  `boolean`

  `isCreated()`

  `boolean`

  `isDoColor()`

  `boolean`

  `isDoingOffroad()`

  `boolean`

  `isDoorAlarmSounding()`

  `boolean`

  `isDriveable()`

  `boolean`

  `isDriver(IsoGameCharacter chr)`

  `private boolean`

  `isDriverGodMode()`

  `boolean`

  `isEngineRunning()`

  `boolean`

  `isEngineSounding()`

  `boolean`

  `isEngineStarted()`

  `boolean`

  `isEngineWorking()`

  `boolean`

  `isEnterBlocked(IsoGameCharacter chr,
  int seat)`

  `boolean`

  `isEnterBlocked2(IsoGameCharacter chr,
  int seat)`

  `boolean`

  `isExitBlocked(int seat)`

  `boolean`

  `isExitBlocked(IsoGameCharacter chr,
  int seat)`

  `boolean`

  `isExitBlocked2(int seat)`

  `boolean`

  `isGasPedalPressed()`

  `private boolean`

  `isGasTakeSide(String side)`

  `boolean`

  `isGoodCar()`

  `boolean`

  `isHornSounding()`

  `boolean`

  `isHotwired()`

  `boolean`

  `isHotwiredBroken()`

  `private boolean`

  `isInArea(String areaId,
  float chrX,
  float chrY)`

  `boolean`

  `isInArea(String areaId,
  Vector3f chr)`

  `boolean`

  `isInArea(String areaId,
  IsoGameCharacter chr)`

  `boolean`

  `isInBounds(float worldX,
  float worldY)`

  `boolean`

  `isInForest()`

  `boolean`

  `isIntersectingSquare(int x,
  int y,
  int z)`

  `boolean`

  `isIntersectingSquare(IsoGridSquare sq)`

  `boolean`

  `isIntersectingSquareWithShadow(int x,
  int y,
  int z)`

  `boolean`

  `isInTrafficJam()`

  `boolean`

  `isInvalidChunkAhead()`

  `boolean`

  `isInvalidChunkAround()`

  `boolean`

  `isInvalidChunkAround(boolean moveW,
  boolean moveE,
  boolean moveN,
  boolean moveS)`

  `boolean`

  `isInvalidChunkBehind()`

  `boolean`

  `isKeyboardControlled()`

  `boolean`

  `isKeyIsOnDoor()`

  `boolean`

  `isKeysInIgnition()`

  `boolean`

  `isListenerInRange(float range)`

  `boolean`

  `isLocalPhysicSim()`

  `boolean`

  `isMechanicUIOpen()`

  `boolean`

  `isNetPlayerAuthorization(BaseVehicle.Authorization netPlayerAuthorization)`

  `boolean`

  `isNetPlayerId(short netPlayerId)`

  `private boolean`

  `isNullChunk(int wx,
  int wy)`

  `boolean`

  `isOnScreen()`

  `boolean`

  `isOperational()`

  `boolean`

  `isPassengerUseDoor2(IsoGameCharacter chr,
  int seat)`

  `boolean`

  `isPersistentContact(IsoGameCharacter chr)`

  `boolean`

  `isPhysicsActive()`

  `boolean`

  `isPointLeftOfCenter(float x,
  float y)`

  `boolean`

  `isPositionOnLeftOrRight(float x,
  float y)`

  `boolean`

  `isPreviouslyEntered()`

  `boolean`

  `isPreviouslyMoved()`

  `boolean`

  `isRegulator()`

  `boolean`

  `isRemovedFromWorld()`

  `boolean`

  `isSeatHoldingItems(int seat)`

  `boolean`

  `isSeatHoldingItems(VehiclePart seat)`

  `boolean`

  `isSeatInstalled(int seat)`

  `boolean`

  `isSeatOccupied(int seat)`

  `boolean`

  `isSirenActive()`

  `boolean`

  `isSirening()`

  `boolean`

  `isSirenSounding()`

  `boolean`

  `isSmashed()`

  `boolean`

  `isStarting()`

  `boolean`

  `isStopped()`

  `boolean`

  `isTrunkLocked()`

  `void`

  `keyNamerVehicle(InventoryItem item)`

  `static void`

  `keyNamerVehicle(InventoryItem item,
  BaseVehicle vehicle)`

  `private int`

  `layoutPassengerNameCoords(Vector2 anchor)`

  `boolean`

  `leftSideFuel()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `static void`

  `LoadAllVehicleTextures()`

  `static Texture`

  `LoadVehicleTexture(String name)`

  `static Texture`

  `LoadVehicleTexture(String name,
  int flags)`

  `static void`

  `LoadVehicleTextures(VehicleScript script)`

  `private static void`

  `LoadVehicleTextures(VehicleScript.Skin skin)`

  `void`

  `lockServerUpdate(long lockTimeMs)`

  `private void`

  `markNameCoordCacheValid()`

  `boolean`

  `needPartsUpdate()`

  `void`

  `netPlayerFromServerUpdate(BaseVehicle.Authorization authorization,
  short authorizationPlayer)`

  `boolean`

  `notKillCrops()`

  `void`

  `onAlarmStart()`

  `void`

  `onAlarmStop()`

  `void`

  `onBackMoveSignalStart()`

  `void`

  `onBackMoveSignalStop()`

  `void`

  `onEngineStateChanged(BaseVehicle.engineStateTypes oldState,
  BaseVehicle.engineStateTypes newState,
  zombie.vehicles.VehicleEngineStateChangeReason reason)`

  `private void`

  `onHitCharacterAddContact(IsoGameCharacter chr)`

  `void`

  `onHitLandmine(IsoGridSquare square)`

  `void`

  `onHornStart()`

  `void`

  `onHornStop()`

  `void`

  `onJump()`

  `void`

  `onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent event)`

  `void`

  `partsClear()`

  `void`

  `permanentlyRemove()`

  `void`

  `playActorAnim(VehiclePart part,
  String animId,
  IsoGameCharacter chr)`

  `private void`

  `playCharacterAnim(IsoGameCharacter chr,
  VehicleScript.Anim anim,
  boolean snapDirection)`

  `void`

  `playPartAnim(VehiclePart part,
  String animId)`

  `void`

  `playPartSound(VehiclePart part,
  IsoPlayer player,
  String animId)`

  `void`

  `playPassengerAnim(int seat,
  String animId)`

  `void`

  `playPassengerAnim(int seat,
  String animId,
  IsoGameCharacter chr)`

  `void`

  `playPassengerSound(int seat,
  String animId)`

  `private void`

  `playScrapePastPlantSound(IsoGridSquare sq)`

  `void`

  `playSound(String sound)`

  `long`

  `playSoundImpl(String file,
  IsoObject parent)`

  `private void`

  `playSoundVehicleHitCharacter(IsoGameCharacter chr)`

  `void`

  `playSwitchSeatAnim(int seatFrom,
  int seatTo)`

  `void`

  `positionTrailer(BaseVehicle trailer)`

  `void`

  `postupdate()`

  `boolean`

  `processHit(IsoGameCharacter isoGameCharacter,
  HandWeapon weapon,
  float damage)`

  `private boolean`

  `processMeleeHit(IsoGameCharacter isoGameCharacter,
  HandWeapon weapon,
  float damage)`

  `private boolean`

  `processRangeHit(IsoGameCharacter isoGameCharacter,
  HandWeapon weapon,
  float damage)`

  `void`

  `putKeyInIgnition(InventoryItem key,
  int containerID)`

  `void`

  `putKeyOnDoor(InventoryItem key)`

  `void`

  `putKeyToContainer(ItemContainer container,
  IsoGridSquare sq,
  IsoObject obj)`

  `void`

  `putKeyToContainerServer(InventoryItem item,
  IsoGridSquare sq,
  IsoObject obj)`

  `void`

  `putKeyToWorld(IsoGridSquare sq)`

  `void`

  `putKeyToZombie(IsoZombie zombie)`

  `private void`

  `randomizeContainer(VehiclePart part,
  ItemPickerJava.ItemPickerRoom contDistrib)`

  `private void`

  `randomizeContainers()`

  `private void`

  `randomizeContainers(ItemPickerJava.ItemPickerRoom contDistrib)`

  `private InventoryItem`

  `randomlyAddNearestBuildingKeyToContainer(ItemContainer container)`

  `private void`

  `rebuildNameCoordCache(float zoom)`

  `private void`

  `recalcAnimalSize()`

  `void`

  `releaseAnimationPlayers()`

  `static void`

  `releaseMatrix4f(org.joml.Matrix4f v)`

  `static void`

  `releaseQuaternionf(org.joml.Quaternionf q)`

  `static void`

  `releaseTransform(Transform t)`

  `static void`

  `releaseVector2(Vector2 v)`

  `static void`

  `releaseVector2f(Vector2f vector2f)`

  `static void`

  `releaseVector3(Vector3 v)`

  `static void`

  `releaseVector3f(Vector3f vector3f)`

  `static void`

  `releaseVector4f(org.joml.Vector4f vector4f)`

  `IsoObject`

  `removeAnimalFromTrailer(IsoAnimal animal)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `removeKeyFromDoor()`

  `void`

  `removeKeyFromIgnition()`

  `private void`

  `removeVehicleSounds()`

  `private void`

  `removeWorldLights()`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `private void`

  `renderAreas()`

  `private void`

  `renderAuthorizations()`

  `private void`

  `renderExits()`

  `private void`

  `renderInterpolateBuffer()`

  `private void`

  `renderInterpolateBuffer_drawLine(long x1,
  float y1,
  long x2,
  float y2,
  Color col,
  float x,
  float y,
  float w,
  float h,
  long start,
  long end,
  float starty,
  float endy)`

  `private void`

  `renderInterpolateBuffer_drawPoint(long x1,
  float y1,
  Color col,
  int radius,
  float x,
  float y,
  float w,
  float h,
  long start,
  long end,
  float starty,
  float endy)`

  `private void`

  `renderInterpolateBuffer_drawTextHL(long x1,
  String text,
  Color col,
  float x,
  float y,
  float w,
  float h,
  long start,
  long end)`

  `private void`

  `renderInterpolateBuffer_drawVertLine(long x1,
  Color col,
  float x,
  float y,
  float w,
  float h,
  long start,
  long end,
  boolean drawParity)`

  `private void`

  `renderIntersectedSquares()`

  `void`

  `renderlast()`

  `void`

  `renderShadow()`

  `private void`

  `renderTrailerPositions()`

  `private void`

  `renderUsableArea()`

  `private void`

  `renderVelocity()`

  `void`

  `repair()`

  `void`

  `replaceGrownAnimalInTrailer(IsoAnimal current,
  IsoAnimal grown)`

  `void`

  `resumeRunningAfterLoad()`

  `boolean`

  `rightSideFuel()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `scriptReloaded()`

  `void`

  `scriptReloaded(boolean spawnSwap)`

  `void`

  `setActiveInBullet(boolean active)`

  `void`

  `setAddThumpWorldSound(boolean add)`

  `void`

  `setAlarmed(boolean alarmed)`

  `void`

  `setAngles(float degreesX,
  float degreesY,
  float degreesZ)`

  `void`

  `setBaseQuality(float baseQuality)`

  `void`

  `setBloodIntensity(String id,
  float intensity)`

  `void`

  `setBraking(boolean isBraking)`

  `void`

  `setBrakingForce(float brakingForce)`

  `void`

  `setCharacterPosition(IsoGameCharacter chr,
  int seat,
  String positionId)`

  `void`

  `setCharacterPositionToAnim(IsoGameCharacter chr,
  int seat,
  String animId)`

  `void`

  `setChosenAlarmSound(String soundName)`

  `void`

  `setClientForce(float force)`

  `void`

  `setColor(float value,
  float saturation,
  float hue)`

  `void`

  `setColorHSV(float hue,
  float saturation,
  float value)`

  `void`

  `setCurrentKey(InventoryItem currentKey)`

  `void`

  `setCurrentSteering(float currentSteering)`

  `void`

  `setCurrentTotalAnimalSize(float totalAnimalSize)`

  `void`

  `setDebugPhysicsRender(boolean addedToWorld)`

  `void`

  `setDebugZ(float z)`

  `void`

  `setDoColor(boolean doColor)`

  `private void`

  `setDoorLocked(VehiclePart part,
  boolean locked)`

  `void`

  `setEngineFeature(int quality,
  int loudness,
  int engineForce)`

  `void`

  `setEngineSpeed(double speed)`

  `void`

  `setForceBrake()`

  `void`

  `setGeneralPartCondition(float baseQuality,
  float chanceToSpawnDamaged)`

  `void`

  `setGoodCar(boolean isGoodCar)`

  `void`

  `setHeadlightsOn(boolean on)`

  `void`

  `setHotwired(boolean hotwired)`

  `void`

  `setHotwiredBroken(boolean hotwiredBroken)`

  `void`

  `setInitialMass(float initialMass)`

  `void`

  `setKeyIsOnDoor(boolean keyIsOnDoor)`

  `void`

  `setKeysInIgnition(boolean keysOnContact)`

  `void`

  `setLightbarLightsMode(int mode)`

  `void`

  `setLightbarSirenMode(int mode)`

  `void`

  `setLocked(boolean locked)`

  `void`

  `setMass(float mass)`

  `void`

  `setMaxSpeed(float maxSpeed)`

  `void`

  `setMechanicalID(int mechanicalId)`

  `void`

  `setMechanicUIOpen(boolean mechanicUiOpen)`

  `BaseVehicle.ModelInfo`

  `setModelVisible(VehiclePart part,
  VehicleScript.Model scriptModel,
  boolean visible)`

  `void`

  `setNeedPartsUpdate(boolean needPartsUpdate)`

  `void`

  `setNetPlayerAuthorization(BaseVehicle.Authorization netPlayerAuthorization,
  int netPlayerId)`

  `boolean`

  `setPassenger(int seat,
  IsoGameCharacter chr,
  Vector3f offset)`

  `void`

  `setPhysicsActive(boolean active)`

  `void`

  `setPhysicsActive(boolean active,
  boolean setStatic)`

  `void`

  `setPreviouslyEntered(boolean bool)`

  `void`

  `setPreviouslyMoved(boolean bool)`

  `void`

  `setRegulator(boolean regulator)`

  `void`

  `setRegulatorSpeed(float regulatorSpeed)`

  `void`

  `setRust(float rust)`

  `void`

  `setScript()`

  `void`

  `setScript(String name)`

  `void`

  `setScriptName(String name)`

  `void`

  `setSirenStartTime(double worldAgeHours)`

  `void`

  `setSkinIndex(int index)`

  `BaseVehicle`

  `setSmashed(String location)`

  `BaseVehicle`

  `setSmashed(String location,
  boolean flipped)`

  `void`

  `setSpeedKmHour(float speedKmHour)`

  `void`

  `setStoplightsOn(boolean on)`

  `void`

  `setTireInflation(int wheelIndex,
  float inflation)`

  `void`

  `setTireRemoved(int wheelIndex,
  boolean removed)`

  `void`

  `setTrunkLocked(boolean locked)`

  `void`

  `setVehicleAlarm(zombie.vehicles.VehicleAlarm vehicleAlarm1)`

  `void`

  `setVehicleSounds(zombie.vehicleSound.VehicleSounds vehicleSounds1)`

  `void`

  `setVehicleTowedBy(BaseVehicle vehicleA,
  String attachmentA,
  String attachmentB)`

  `void`

  `setVehicleTowing(BaseVehicle vehicleB,
  String attachmentA,
  String attachmentB)`

  `void`

  `setVehicleType(String type)`

  `void`

  `setWindowLightsOn(boolean on)`

  `void`

  `setWorldTransform(Transform in)`

  `void`

  `setZone(String name)`

  `boolean`

  `shouldAnimRecorderBeActive()`

  `boolean`

  `shouldCollideWithCharacters()`

  `boolean`

  `shouldCollideWithObjects()`

  `boolean`

  `shouldNotHaveLoot()`

  `private boolean`

  `shouldRebuildNameCoordCache()`

  `boolean`

  `shouldSnapZToCurrentSquare()`

  `boolean`

  `shouldUpdateInMeta()`

  `boolean`

  `showPassenger(int seat)`

  `boolean`

  `showPassenger(IsoGameCharacter chr)`

  `void`

  `shutOff()`

  `void`

  `shutOff(String sound)`

  `void`

  `softReset()`

  `void`

  `startEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `void`

  `stopAttachingTrailer()`

  `void`

  `stopEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `int`

  `stopSound(long channel)`

  `void`

  `switchSeat(IsoGameCharacter chr,
  int seatTo)`

  `void`

  `syncKeyInIgnition(boolean inIgnition,
  boolean onDoor,
  InventoryItem key)`

  `Vector2`

  `testCollisionWithCharacter(IsoGameCharacter chr,
  float circleRadius,
  Vector2 outCollisionPos)`

  `int`

  `testCollisionWithCorpse(IsoDeadBody body,
  boolean doSound)`

  `Vector2`

  `testCollisionWithObject(IsoObject obj,
  float circleRadius,
  Vector2 out)`

  `int`

  `testCollisionWithProneCharacter(IsoGameCharacter chr,
  boolean doSound,
  Vector2 outImpactPosOnVehicle)`

  `int`

  `testCollisionWithProneCharacter(IsoMovingObject chr,
  float angleX,
  float angleY,
  boolean doSound,
  Vector2 outImpactPosOnVehicle)`

  `boolean`

  `testCollisionWithVehicle(BaseVehicle obj)`

  `boolean`

  `testTouchingVehicle(IsoGameCharacter isoGameCharacter,
  zombie.core.physics.RagdollController ragdollController)`

  `void`

  `Thump(IsoMovingObject thumper,
  int thumpEventCount)`

  `void`

  `toggleLockedDoor(VehiclePart part,
  IsoGameCharacter chr,
  boolean locked)`

  `void`

  `transmitAlarmed()`

  `void`

  `transmitBlood()`

  `void`

  `transmitCharacterPosition(int seat,
  String positionId)`

  `void`

  `transmitColorHSV()`

  `void`

  `transmitEngine()`

  `void`

  `transmitPartCondition(VehiclePart part)`

  `void`

  `transmitPartDoor(VehiclePart part)`

  `void`

  `transmitPartItem(VehiclePart part)`

  `void`

  `transmitPartLight(VehiclePart part)`

  `void`

  `transmitPartModData(VehiclePart part)`

  `void`

  `transmitPartUsedDelta(VehiclePart part)`

  `void`

  `transmitPartWindow(VehiclePart part)`

  `void`

  `transmitRust()`

  `void`

  `transmitSkinIndex()`

  `void`

  `triggerAlarm()`

  `private void`

  `triggerMusicIntensityEventVehicleHitCharacter()`

  `private InventoryItem`

  `tryCreateBuildingKey(BuildingDef buildingDef)`

  `private InventoryContainer`

  `tryCreateKeyRing()`

  `void`

  `tryHotwire(int electricityLevel)`

  `private void`

  `tryReconnectToTowedVehicle()`

  `void`

  `trySpawnKey()`

  `void`

  `trySpawnKey(boolean crashed)`

  `boolean`

  `trySpawnVehicleKeyInObject(IsoObject obj)`

  `boolean`

  `trySpawnVehicleKeyOnZombie(IsoZombie zombie)`

  `void`

  `tryStartEngine()`

  `void`

  `tryStartEngine(boolean haveKey)`

  `void`

  `update()`

  `private void`

  `updateAnimationPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
  VehiclePart part)`

  `void`

  `updateBulletStats()`

  `private void`

  `updateBulletStatsWheel(int wheelIndex,
  float[] data,
  Vector3f worldPos,
  float frictionMul,
  int chanceofbump,
  double period,
  double susp)`

  `void`

  `updateControls()`

  `void`

  `updateDamageOverlayLater()`

  `void`

  `updateEvent(long eventInstance,
  GameSoundClip clip)`

  `private void`

  `updateHandBrakeSound()`

  `void`

  `updateHasExtendOffset(IsoGameCharacter chr)`

  `void`

  `updateHasExtendOffsetForExit(IsoGameCharacter chr)`

  `void`

  `updateHasExtendOffsetForExitEnd(IsoGameCharacter chr)`

  `private void`

  `updateImportantAreas()`

  `private void`

  `updateLastKnwnDriver()`

  `void`

  `updateLights()`

  `boolean`

  `updateNetworkHitByVehicle(IsoGameCharacter target)`

  `void`

  `updateParts()`

  `void`

  `updatePartStats()`

  `void`

  `updatePhysics()`

  `void`

  `updatePhysicsNetwork()`

  `private void`

  `updateScrapPastPlantSound()`

  `void`

  `updateSkin()`

  `void`

  `updateSounds()`

  `void`

  `updateTotalMass()`

  `protected void`

  `updateTransform()`

  `private void`

  `updateVelocityMultiplier()`

  `private void`

  `updateWorldLights()`

  `private void`

  `updateWorldSounds()`

  `boolean`

  `validateHitVehicleDistance(float playerX,
  float playerY)`

  `void`

  `WeaponHit(IsoGameCharacter chr,
  HandWeapon weapon)`

  ### Methods inherited from class [IsoMovingObject](../iso/IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, doTreeNoises, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDescription, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWeight, getWidth, getX, getY, getZ, Hit, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isCrawling, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isGettingUp, isOnFloor, isProne, isPushableForSeparate, isPushedByForSeparate, isShootable, isSolid, isSolidForSeparate, isStanding, isWithinRange, moveUnmodded, moveUnmoddedInternal, onMouseRightClick, preupdate, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitDir, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldIgnoreCollisionWithSquare, shouldSlideHeadAwayFromWalls, slideAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, toString, updateAnimation`

  ### Methods inherited from class [IsoObject](../iso/IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, Collision, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderSquare, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, isZombie, load, loadChange, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderObjectPicker, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveChange, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setContainer, setCustomColor, setCustomColor, setDamage, setDir, setDoRender, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](../iso/ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.network.fields.IPositional

  `getX, getY, getZ, isInRange`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `getThumpableFor, isDestroyed, Thump`

  ### Methods inherited from interface zombie.vehicles.VehiclePartOwner

  `getBattery, getBatteryCharge, getEngine, getGasRemaining, getGasTank, getHeater, getLightbarLightsMode, getNumberOfPartsWithContainers, getPartById, getPartByIndex, getPartByPartId, getPartCount, getPartIndex, getTrailerTrunkPart, getTrunkDoorPart, getTrunkPart, getX, getXi, getY, getYi, getZ, getZi, windowsOpen`

  ### Methods inherited from interface zombie.vehicleSound.VehicleSoundOwner

  `getLightbarSirenMode, getX, getXi, getY, getYi, getZ, getZi, hasAlarm, hasHorn, hasLightbar, hasSiren, sirenShutoffTimeExpired`

* Field Details
  -------------

  + ### MASK1\_FRONT

    public static final int MASK1\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_FRONT)
  + ### MASK1\_REAR

    public static final int MASK1\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_REAR)
  + ### MASK1\_DOOR\_RIGHT\_FRONT

    public static final int MASK1\_DOOR\_RIGHT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_DOOR_RIGHT_FRONT)
  + ### MASK1\_DOOR\_RIGHT\_REAR

    public static final int MASK1\_DOOR\_RIGHT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_DOOR_RIGHT_REAR)
  + ### MASK1\_DOOR\_LEFT\_FRONT

    public static final int MASK1\_DOOR\_LEFT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_DOOR_LEFT_FRONT)
  + ### MASK1\_DOOR\_LEFT\_REAR

    public static final int MASK1\_DOOR\_LEFT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_DOOR_LEFT_REAR)
  + ### MASK1\_WINDOW\_RIGHT\_FRONT

    public static final int MASK1\_WINDOW\_RIGHT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_RIGHT_FRONT)
  + ### MASK1\_WINDOW\_RIGHT\_REAR

    public static final int MASK1\_WINDOW\_RIGHT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_RIGHT_REAR)
  + ### MASK1\_WINDOW\_LEFT\_FRONT

    public static final int MASK1\_WINDOW\_LEFT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_LEFT_FRONT)
  + ### MASK1\_WINDOW\_LEFT\_REAR

    public static final int MASK1\_WINDOW\_LEFT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_LEFT_REAR)
  + ### MASK1\_WINDOW\_FRONT

    public static final int MASK1\_WINDOW\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_FRONT)
  + ### MASK1\_WINDOW\_REAR

    public static final int MASK1\_WINDOW\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_WINDOW_REAR)
  + ### MASK1\_GUARD\_RIGHT\_FRONT

    public static final int MASK1\_GUARD\_RIGHT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_GUARD_RIGHT_FRONT)
  + ### MASK1\_GUARD\_RIGHT\_REAR

    public static final int MASK1\_GUARD\_RIGHT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_GUARD_RIGHT_REAR)
  + ### MASK1\_GUARD\_LEFT\_FRONT

    public static final int MASK1\_GUARD\_LEFT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_GUARD_LEFT_FRONT)
  + ### MASK1\_GUARD\_LEFT\_REAR

    public static final int MASK1\_GUARD\_LEFT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK1_GUARD_LEFT_REAR)
  + ### MASK2\_ROOF

    public static final int MASK2\_ROOF

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_ROOF)
  + ### MASK2\_LIGHT\_RIGHT\_FRONT

    public static final int MASK2\_LIGHT\_RIGHT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHT_RIGHT_FRONT)
  + ### MASK2\_LIGHT\_LEFT\_FRONT

    public static final int MASK2\_LIGHT\_LEFT\_FRONT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHT_LEFT_FRONT)
  + ### MASK2\_LIGHT\_RIGHT\_REAR

    public static final int MASK2\_LIGHT\_RIGHT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHT_RIGHT_REAR)
  + ### MASK2\_LIGHT\_LEFT\_REAR

    public static final int MASK2\_LIGHT\_LEFT\_REAR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHT_LEFT_REAR)
  + ### MASK2\_BRAKE\_RIGHT

    public static final int MASK2\_BRAKE\_RIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_BRAKE_RIGHT)
  + ### MASK2\_BRAKE\_LEFT

    public static final int MASK2\_BRAKE\_LEFT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_BRAKE_LEFT)
  + ### MASK2\_LIGHTBAR\_RIGHT

    public static final int MASK2\_LIGHTBAR\_RIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHTBAR_RIGHT)
  + ### MASK2\_LIGHTBAR\_LEFT

    public static final int MASK2\_LIGHTBAR\_LEFT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_LIGHTBAR_LEFT)
  + ### MASK2\_HOOD

    public static final int MASK2\_HOOD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_HOOD)
  + ### MASK2\_BOOT

    public static final int MASK2\_BOOT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MASK2_BOOT)
  + ### PHYSICS\_Z\_SCALE

    public static final float PHYSICS\_Z\_SCALE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.PHYSICS_Z_SCALE)
  + ### RADIUS

    public static final float RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.RADIUS)
  + ### PLUS\_RADIUS

    public static final float PLUS\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.PLUS_RADIUS)
  + ### FADE\_DISTANCE

    public static final int FADE\_DISTANCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.FADE_DISTANCE)
  + ### RANDOMIZE\_CONTAINER\_CHANCE

    public static final int RANDOMIZE\_CONTAINER\_CHANCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.RANDOMIZE_CONTAINER_CHANCE)
  + ### ENGINE\_SOUND\_RADIUS

    public static final int ENGINE\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.ENGINE_SOUND_RADIUS)
  + ### AMBIENT\_SOUND\_RADIUS

    public static final int AMBIENT\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.AMBIENT_SOUND_RADIUS)
  + ### SIREN\_WORLDSOUND\_RADIUS

    public static final int SIREN\_WORLDSOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.SIREN_WORLDSOUND_RADIUS)
  + ### SIREN\_WORLDSOUND\_VOLUME

    public static final int SIREN\_WORLDSOUND\_VOLUME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.SIREN_WORLDSOUND_VOLUME)
  + ### TRAILER\_LINEAR\_LOWER\_LIMIT\_X

    public static final float TRAILER\_LINEAR\_LOWER\_LIMIT\_X

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_LOWER_LIMIT_X)
  + ### TRAILER\_LINEAR\_LOWER\_LIMIT\_Y

    public static final float TRAILER\_LINEAR\_LOWER\_LIMIT\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_LOWER_LIMIT_Y)
  + ### TRAILER\_LINEAR\_LOWER\_LIMIT\_Z

    public static final float TRAILER\_LINEAR\_LOWER\_LIMIT\_Z

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_LOWER_LIMIT_Z)
  + ### TRAILER\_LINEAR\_UPPER\_LIMIT\_X

    public static final float TRAILER\_LINEAR\_UPPER\_LIMIT\_X

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_UPPER_LIMIT_X)
  + ### TRAILER\_LINEAR\_UPPER\_LIMIT\_Y

    public static final float TRAILER\_LINEAR\_UPPER\_LIMIT\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_UPPER_LIMIT_Y)
  + ### TRAILER\_LINEAR\_UPPER\_LIMIT\_Z

    public static final float TRAILER\_LINEAR\_UPPER\_LIMIT\_Z

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_LINEAR_UPPER_LIMIT_Z)
  + ### TRAILER\_ANGULAR\_LOWER\_LIMIT\_X

    public static final float TRAILER\_ANGULAR\_LOWER\_LIMIT\_X

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_LOWER_LIMIT_X)
  + ### TRAILER\_ANGULAR\_LOWER\_LIMIT\_Y

    public static final float TRAILER\_ANGULAR\_LOWER\_LIMIT\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_LOWER_LIMIT_Y)
  + ### TRAILER\_ANGULAR\_LOWER\_LIMIT\_Z

    public static final float TRAILER\_ANGULAR\_LOWER\_LIMIT\_Z

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_LOWER_LIMIT_Z)
  + ### TRAILER\_ANGULAR\_UPPER\_LIMIT\_X

    public static final float TRAILER\_ANGULAR\_UPPER\_LIMIT\_X

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_UPPER_LIMIT_X)
  + ### TRAILER\_ANGULAR\_UPPER\_LIMIT\_Y

    public static final float TRAILER\_ANGULAR\_UPPER\_LIMIT\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_UPPER_LIMIT_Y)
  + ### TRAILER\_ANGULAR\_UPPER\_LIMIT\_Z

    public static final float TRAILER\_ANGULAR\_UPPER\_LIMIT\_Z

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_ANGULAR_UPPER_LIMIT_Z)
  + ### MINIMUM\_DOT\_UPRIGHT

    public static final float MINIMUM\_DOT\_UPRIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MINIMUM_DOT_UPRIGHT)
  + ### TRAILER\_MASS\_MULTIPLIER\_WHILE\_ATTACHING

    private static final float TRAILER\_MASS\_MULTIPLIER\_WHILE\_ATTACHING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.TRAILER_MASS_MULTIPLIER_WHILE_ATTACHING)
  + ### GENTLY\_ATTACH\_TRAILER\_MS

    private static final long GENTLY\_ATTACH\_TRAILER\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.GENTLY_ATTACH_TRAILER_MS)
  + ### CONSTRAINT\_ERP\_ATTACHING

    private static final float CONSTRAINT\_ERP\_ATTACHING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.CONSTRAINT_ERP_ATTACHING)
  + ### DEFAULT\_CONSTRAINT\_ERP

    private static final float DEFAULT\_CONSTRAINT\_ERP

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.DEFAULT_CONSTRAINT_ERP)
  + ### noAuthorization

    public static final byte noAuthorization

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.noAuthorization)
  + ### IGNORE\_CHARACTER\_COLLISION\_SOUND\_INTERVAL

    private static final long IGNORE\_CHARACTER\_COLLISION\_SOUND\_INTERVAL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.IGNORE_CHARACTER_COLLISION_SOUND_INTERVAL)
  + ### POSITION\_HISTORY\_MAX\_ENTRIES

    public static final int POSITION\_HISTORY\_MAX\_ENTRIES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.POSITION_HISTORY_MAX_ENTRIES)
  + ### POSITION\_HISTORY\_INTERVAL\_MS

    public static final long POSITION\_HISTORY\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.POSITION_HISTORY_INTERVAL_MS)
  + ### HIT\_VEHICLE\_MAX\_DISTANCE\_TILES

    public static final double HIT\_VEHICLE\_MAX\_DISTANCE\_TILES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.HIT_VEHICLE_MAX_DISTANCE_TILES)
  + ### MIN\_HIT\_SPEED\_TILES\_PER\_SECOND

    public static final float MIN\_HIT\_SPEED\_TILES\_PER\_SECOND

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MIN_HIT_SPEED_TILES_PER_SECOND)
  + ### \_UNIT\_Y

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") \_UNIT\_Y
  + ### tempPoly

    private static final zombie.pathfind.VehiclePoly tempPoly
  + ### YURI\_FORCE\_FIELD

    public static final boolean YURI\_FORCE\_FIELD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.YURI_FORCE_FIELD)
  + ### DOT\_PRODUCT\_ATTACH\_TRAILER\_FORWARD

    public static final float DOT\_PRODUCT\_ATTACH\_TRAILER\_FORWARD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.DOT_PRODUCT_ATTACH_TRAILER_FORWARD)
  + ### DOT\_PRODUCT\_ATTACH\_TRAILER\_UP

    public static final float DOT\_PRODUCT\_ATTACH\_TRAILER\_UP

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.DOT_PRODUCT_ATTACH_TRAILER_UP)
  + ### NAME\_TAG\_Y\_OFFSET

    private static final int NAME\_TAG\_Y\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.NAME_TAG_Y_OFFSET)
  + ### NAME\_TWO\_COLUMN\_X\_OFFSET

    private static final float NAME\_TWO\_COLUMN\_X\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.NAME_TWO_COLUMN_X_OFFSET)
  + ### renderToTexture

    public static boolean renderToTexture
  + ### centerOfMassMagic

    public static float centerOfMassMagic
  + ### wheelParams

    private static final float[] wheelParams
  + ### physicsParams

    private static final float[] physicsParams
  + ### forcedFriction

    private final float forcedFriction

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.forcedFriction)
  + ### vehicleShadow

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") vehicleShadow
  + ### inf

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") inf
  + ### lowRiderParam

    private static final float[] lowRiderParam
  + ### impulseFromServer

    private final [BaseVehicle.VehicleImpulse](BaseVehicle.VehicleImpulse.html "class in zombie.vehicles") impulseFromServer
  + ### impulsesFromSquishedBodies

    private final [BaseVehicle.VehicleImpulse](BaseVehicle.VehicleImpulse.html "class in zombie.vehicles")[] impulsesFromSquishedBodies
  + ### impulsesFromHitObjects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle.VehicleImpulse](BaseVehicle.VehicleImpulse.html "class in zombie.vehicles")> impulsesFromHitObjects
  + ### netPlayerTimeoutMax

    private final int netPlayerTimeoutMax

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.netPlayerTimeoutMax)
  + ### models

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle.ModelInfo](BaseVehicle.ModelInfo.html "class in zombie.vehicles")> models
  + ### chunk

    public [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk
  + ### polyDirty

    public boolean polyDirty
  + ### polyGarageCheck

    private boolean polyGarageCheck
  + ### radiusReductionInGarage

    private float radiusReductionInGarage
  + ### vehicleId

    public short vehicleId
  + ### sqlId

    public int sqlId
  + ### serverRemovedFromWorld

    public boolean serverRemovedFromWorld
  + ### interpolation

    public zombie.vehicles.VehicleInterpolation interpolation
  + ### waitFullUpdate

    public boolean waitFullUpdate
  + ### throttle

    public float throttle
  + ### transmissionNumber

    public zombie.vehicles.TransmissionNumber transmissionNumber
  + ### transmissionChangeTime

    public final zombie.core.utils.UpdateLimit transmissionChangeTime
  + ### hasExtendOffset

    public boolean hasExtendOffset
  + ### hasExtendOffsetExiting

    public boolean hasExtendOffsetExiting
  + ### savedPhysicsZ

    public float savedPhysicsZ
  + ### savedRot

    public final org.joml.Quaternionf savedRot
  + ### jniTransform

    public final [Transform](../core/physics/Transform.html "class in zombie.core.physics") jniTransform
  + ### jniSpeed

    private float jniSpeed
  + ### jniIsCollide

    public boolean jniIsCollide
  + ### jniLinearVelocity

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") jniLinearVelocity
  + ### lastLinearVelocity

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") lastLinearVelocity
  + ### netPlayerAuthorization

    public [BaseVehicle.Authorization](BaseVehicle.Authorization.html "enum class in zombie.vehicles") netPlayerAuthorization
  + ### netPlayerId

    public short netPlayerId
  + ### netPlayerTimeout

    public int netPlayerTimeout
  + ### authSimulationHash

    public int authSimulationHash
  + ### authSimulationTime

    public long authSimulationTime
  + ### frontEndDurability

    public int frontEndDurability
  + ### rearEndDurability

    public int rearEndDurability
  + ### rust

    public float rust
  + ### colorHue

    public float colorHue
  + ### colorSaturation

    public float colorSaturation
  + ### colorValue

    public float colorValue
  + ### currentFrontEndDurability

    public int currentFrontEndDurability
  + ### currentRearEndDurability

    public int currentRearEndDurability
  + ### collideX

    public float collideX
  + ### collideY

    public float collideY
  + ### shadowCoord

    public final zombie.pathfind.VehiclePoly shadowCoord
  + ### missingEnginePart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") missingEnginePart
  + ### MAX\_WHEELS

    public static final int MAX\_WHEELS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.MAX_WHEELS)
  + ### PHYSICS\_PARAM\_COUNT

    public static final int PHYSICS\_PARAM\_COUNT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.PHYSICS_PARAM_COUNT)
  + ### wheelInfo

    public final [BaseVehicle.WheelInfo](BaseVehicle.WheelInfo.html "class in zombie.vehicles")[] wheelInfo
  + ### ramSound

    public long ramSound
  + ### ramSoundTime

    public long ramSoundTime
  + ### vehicleEngineRpm

    private [VehicleEngineRPM](VehicleEngineRPM.html "class in zombie.vehicles") vehicleEngineRpm
  + ### hitCharacterSounds

    private final zombie.vehicles.VehicleHitCharacterSounds hitCharacterSounds
  + ### runOverBodySounds

    private final zombie.vehicles.VehicleRunOverBodySounds runOverBodySounds
  + ### headlightsOn

    public boolean headlightsOn
  + ### stoplightsOn

    public boolean stoplightsOn
  + ### windowLightsOn

    public boolean windowLightsOn
  + ### vehicleAlarm

    private zombie.vehicles.VehicleAlarm vehicleAlarm
  + ### soundHornOn

    public boolean soundHornOn
  + ### soundBackMoveOn

    public boolean soundBackMoveOn
  + ### previouslyEntered

    public boolean previouslyEntered
  + ### previouslyMoved

    public boolean previouslyMoved
  + ### lightbarLightsMode

    public final zombie.vehicles.LightbarLightsMode lightbarLightsMode
  + ### lightbarSirenMode

    public final zombie.vehicles.LightbarSirenMode lightbarSirenMode
  + ### leftLight1

    private final [IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") leftLight1
  + ### leftLight2

    private final [IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") leftLight2
  + ### rightLight1

    private final [IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") rightLight1
  + ### rightLight2

    private final [IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") rightLight2
  + ### leftLightIndex

    private int leftLightIndex
  + ### rightLightIndex

    private int rightLightIndex
  + ### passengers

    private [BaseVehicle.Passenger](BaseVehicle.Passenger.html "class in zombie.vehicles")[] passengers
  + ### scriptName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName
  + ### script

    protected [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script
  + ### parts

    protected [VehicleParts](VehicleParts.html "class in zombie.vehicles") parts
  + ### lights

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> lights
  + ### createdModel

    private boolean createdModel
  + ### skinIndex

    private int skinIndex
  + ### physics

    protected zombie.core.physics.CarController physics
  + ### created

    private boolean created
  + ### poly

    private final zombie.pathfind.VehiclePoly poly
  + ### polyPlusRadius

    private final zombie.pathfind.VehiclePoly polyPlusRadius
  + ### doDamageOverlay

    private boolean doDamageOverlay
  + ### loaded

    private boolean loaded
  + ### updateFlags

    public short updateFlags
  + ### updateLockTimeout

    private long updateLockTimeout
  + ### limitPhysicSend

    private final zombie.core.utils.UpdateLimit limitPhysicSend
  + ### networkUpdated

    private boolean networkUpdated
  + ### limitPhysicPositionSent

    private [Vector2](../iso/Vector2.html "class in zombie.iso") limitPhysicPositionSent
  + ### limitPhysicValid

    protected final zombie.core.utils.UpdateLimit limitPhysicValid
  + ### limitCrash

    private final zombie.core.utils.UpdateLimit limitCrash
  + ### addedToWorld

    public boolean addedToWorld
  + ### removedFromWorld

    private boolean removedFromWorld
  + ### polyPlusRadiusMinX

    private float polyPlusRadiusMinX
  + ### polyPlusRadiusMinY

    private float polyPlusRadiusMinY
  + ### polyPlusRadiusMaxX

    private float polyPlusRadiusMaxX
  + ### polyPlusRadiusMaxY

    private float polyPlusRadiusMaxY
  + ### maxSpeed

    private float maxSpeed
  + ### keyIsOnDoor

    private boolean keyIsOnDoor
  + ### hotwired

    private boolean hotwired
  + ### hotwiredBroken

    private boolean hotwiredBroken
  + ### keysInIgnition

    private boolean keysInIgnition
  + ### ignitionSwitch

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") ignitionSwitch
  + ### keysContainerId

    public int keysContainerId
  + ### vehicleSounds

    private zombie.vehicleSound.VehicleSounds vehicleSounds
  + ### worldSoundUpdateLimit

    private final zombie.core.utils.UpdateLimit worldSoundUpdateLimit
  + ### soundScrapePastPlant

    private long soundScrapePastPlant
  + ### hittingPlant

    private boolean hittingPlant
  + ### handBrakeActive

    private boolean handBrakeActive
  + ### handBrakeSound

    private long handBrakeSound
  + ### choosenParts

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> choosenParts
  + ### type

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### respawnZone

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") respawnZone
  + ### mass

    private float mass
  + ### initialMass

    private float initialMass
  + ### brakingForce

    private float brakingForce
  + ### baseQuality

    private float baseQuality
  + ### currentSteering

    private float currentSteering
  + ### isBraking

    private boolean isBraking
  + ### mechanicalId

    private int mechanicalId
  + ### needPartsUpdate

    private boolean needPartsUpdate
  + ### alarmed

    private boolean alarmed
  + ### alarmAccumulator

    private float alarmAccumulator
  + ### sirenStartTime

    private double sirenStartTime
  + ### mechanicUiOpen

    private boolean mechanicUiOpen
  + ### isGoodCar

    private boolean isGoodCar
  + ### currentKey

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") currentKey
  + ### doColor

    private boolean doColor
  + ### breakingSlowFactor

    private float breakingSlowFactor
  + ### breakingObjectsList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")> breakingObjectsList
  + ### limitUpdate

    private final zombie.core.utils.UpdateLimit limitUpdate
  + ### keySpawned

    public byte keySpawned
  + ### vehicleTransform

    public final org.joml.Matrix4f vehicleTransform
  + ### renderTransform

    public final org.joml.Matrix4f renderTransform
  + ### emitter

    private [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### brakeBetweenUpdatesSpeed

    private float brakeBetweenUpdatesSpeed
  + ### physicActiveCheck

    public long physicActiveCheck
  + ### constraintChangedTime

    public long constraintChangedTime
  + ### animPlayer

    private zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer
  + ### specificDistributionId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificDistributionId
  + ### addThumpWorldSound

    private boolean addThumpWorldSound
  + ### surroundVehicle

    private final zombie.vehicles.SurroundVehicle surroundVehicle
  + ### regulator

    private boolean regulator
  + ### regulatorSpeed

    private float regulatorSpeed
  + ### s\_PartToMaskMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> s\_PartToMaskMap
  + ### BYTE\_ZERO

    private static final [Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang") BYTE\_ZERO
  + ### bloodIntensity

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang")> bloodIntensity
  + ### optionBloodDecals

    private boolean optionBloodDecals
  + ### vehicleTowing

    private [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleTowing
  + ### vehicleTowedBy

    private [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleTowedBy
  + ### constraintTowing

    public int constraintTowing
  + ### beginAttachTrailerMS

    private long beginAttachTrailerMS
  + ### vehicleTowingId

    private int vehicleTowingId
  + ### vehicleTowedById

    private int vehicleTowedById
  + ### towAttachmentSelf

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") towAttachmentSelf
  + ### towAttachmentOther

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") towAttachmentOther
  + ### rowConstraintZOffset

    private float rowConstraintZOffset
  + ### parameterVehicleBrake

    private final zombie.audio.parameters.ParameterVehicleBrake parameterVehicleBrake
  + ### parameterVehicleEngineCondition

    private final zombie.audio.parameters.ParameterVehicleEngineCondition parameterVehicleEngineCondition
  + ### parameterVehicleGear

    private final zombie.audio.parameters.ParameterVehicleGear parameterVehicleGear
  + ### parameterVehicleLoad

    private final zombie.audio.parameters.ParameterVehicleLoad parameterVehicleLoad
  + ### parameterVehicleRoadMaterial

    private final zombie.audio.parameters.ParameterVehicleRoadMaterial parameterVehicleRoadMaterial
  + ### parameterVehicleRpm

    private final zombie.audio.parameters.ParameterVehicleRPM parameterVehicleRpm
  + ### parameterVehicleSkid

    private final zombie.audio.parameters.ParameterVehicleSkid parameterVehicleSkid
  + ### parameterVehicleSpeed

    private final zombie.audio.parameters.ParameterVehicleSpeed parameterVehicleSpeed
  + ### parameterVehicleSteer

    private final zombie.audio.parameters.ParameterVehicleSteer parameterVehicleSteer
  + ### parameterVehicleTireMissing

    private final zombie.audio.parameters.ParameterVehicleTireMissing parameterVehicleTireMissing
  + ### fmodParameters

    private final zombie.audio.FMODParameterList fmodParameters
  + ### isActive

    public boolean isActive
  + ### isStatic

    public boolean isStatic
  + ### physicReliableLimit

    private final zombie.core.utils.UpdateLimit physicReliableLimit
  + ### isReliable

    public boolean isReliable
  + ### animals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animals
  + ### totalAnimalSize

    private float totalAnimalSize
  + ### keySpawnChancedD100

    private final float keySpawnChancedD100
  + ### timeSinceLastAuth

    public float timeSinceLastAuth
  + ### updateAnimal

    private final zombie.core.utils.UpdateLimit updateAnimal
  + ### hitVars

    private final [BaseVehicle.HitVars](BaseVehicle.HitVars.html "class in zombie.vehicles") hitVars
  + ### zombieHitTimestamp

    private long zombieHitTimestamp
  + ### createPhysicsRecursion

    private int createPhysicsRecursion
  + ### TL\_transform\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.TransformPool](BaseVehicle.TransformPool.html "class in zombie.vehicles")> TL\_transform\_pool
  + ### TL\_vector3\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.Vector3ObjectPool](BaseVehicle.Vector3ObjectPool.html "class in zombie.vehicles")> TL\_vector3\_pool
  + ### TL\_vector2f\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.Vector2fObjectPool](BaseVehicle.Vector2fObjectPool.html "class in zombie.vehicles")> TL\_vector2f\_pool
  + ### TL\_vector3f\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.Vector3fObjectPool](BaseVehicle.Vector3fObjectPool.html "class in zombie.vehicles")> TL\_vector3f\_pool
  + ### TL\_vector4f\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.Vector4fObjectPool](BaseVehicle.Vector4fObjectPool.html "class in zombie.vehicles")> TL\_vector4f\_pool
  + ### TL\_matrix4f\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.Matrix4fObjectPool](BaseVehicle.Matrix4fObjectPool.html "class in zombie.vehicles")> TL\_matrix4f\_pool
  + ### TL\_quaternionf\_pool

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[BaseVehicle.QuaternionfObjectPool](BaseVehicle.QuaternionfObjectPool.html "class in zombie.vehicles")> TL\_quaternionf\_pool
  + ### lastDrivenBy

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") lastDrivenBy
  + ### lastDamagedBy

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") lastDamagedBy
  + ### pedestrianContacts

    private final zombie.vehicles.VehiclePedestrianContactTracking pedestrianContacts
  + ### disableSimulationDueToLackOfSurroundingChunks

    private boolean disableSimulationDueToLackOfSurroundingChunks
  + ### desirePhysicsActive

    private boolean desirePhysicsActive
  + ### positionHistory

    private [BaseVehicle.PositionHistoryEntry](BaseVehicle.PositionHistoryEntry.html "class in zombie.vehicles")[] positionHistory
  + ### positionHistoryIndex

    private int positionHistoryIndex
  + ### positionHistoryUpdateLimit

    private final zombie.core.utils.UpdateLimit positionHistoryUpdateLimit
  + ### nameCoordFrame

    private int nameCoordFrame
  + ### nameCoordPlayerIndex

    private int nameCoordPlayerIndex
* Constructor Details
  -------------------

  + ### BaseVehicle

    public BaseVehicle([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### getSqlId

    public int getSqlId()
  + ### allocMatrix4f

    public static org.joml.Matrix4f allocMatrix4f()
  + ### releaseMatrix4f

    public static void releaseMatrix4f(org.joml.Matrix4f v)
  + ### allocQuaternionf

    public static org.joml.Quaternionf allocQuaternionf()
  + ### releaseQuaternionf

    public static void releaseQuaternionf(org.joml.Quaternionf q)
  + ### allocTransform

    public static [Transform](../core/physics/Transform.html "class in zombie.core.physics") allocTransform()
  + ### releaseTransform

    public static void releaseTransform([Transform](../core/physics/Transform.html "class in zombie.core.physics") t)
  + ### allocVector2

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") allocVector2()
  + ### releaseVector2

    public static void releaseVector2([Vector2](../iso/Vector2.html "class in zombie.iso") v)
  + ### allocVector3

    public static [Vector3](../iso/Vector3.html "class in zombie.iso") allocVector3()
  + ### releaseVector3

    public static void releaseVector3([Vector3](../iso/Vector3.html "class in zombie.iso") v)
  + ### allocVector2f

    public static [Vector2f](../../org/joml/Vector2f.html "class in org.joml") allocVector2f()
  + ### releaseVector2f

    public static void releaseVector2f([Vector2f](../../org/joml/Vector2f.html "class in org.joml") vector2f)
  + ### allocVector3f

    public static [Vector3f](../../org/joml/Vector3f.html "class in org.joml") allocVector3f()
  + ### releaseVector4f

    public static void releaseVector4f(org.joml.Vector4f vector4f)
  + ### allocVector4f

    public static org.joml.Vector4f allocVector4f()
  + ### releaseVector3f

    public static void releaseVector3f([Vector3f](../../org/joml/Vector3f.html "class in org.joml") vector3f)
  + ### LoadAllVehicleTextures

    public static void LoadAllVehicleTextures()
  + ### LoadVehicleTextures

    public static void LoadVehicleTextures([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script)
  + ### LoadVehicleTextures

    private static void LoadVehicleTextures([VehicleScript.Skin](../scripting/objects/VehicleScript.Skin.html "class in zombie.scripting.objects") skin)
  + ### LoadVehicleTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") LoadVehicleTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### LoadVehicleTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") LoadVehicleTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int flags)
  + ### setNetPlayerAuthorization

    public void setNetPlayerAuthorization([BaseVehicle.Authorization](BaseVehicle.Authorization.html "enum class in zombie.vehicles") netPlayerAuthorization,
    int netPlayerId)
  + ### isNetPlayerAuthorization

    public boolean isNetPlayerAuthorization([BaseVehicle.Authorization](BaseVehicle.Authorization.html "enum class in zombie.vehicles") netPlayerAuthorization)
  + ### isNetPlayerId

    public boolean isNetPlayerId(short netPlayerId)
  + ### getNetPlayerId

    public short getNetPlayerId()
  + ### getAuthorizationDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthorizationDescription()
  + ### getFakeSpeedModifier

    public static float getFakeSpeedModifier()
  + ### isLocalPhysicSim

    public boolean isLocalPhysicSim()
  + ### addImpulse

    public void addImpulse([Vector3f](../../org/joml/Vector3f.html "class in org.joml") impulse,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") relPos)
  + ### setEngineSpeed

    public void setEngineSpeed(double speed)
  + ### addEngineSpeed

    public void addEngineSpeed(double speed)
  + ### getEngineSpeed

    public double getEngineSpeed()

    Specified by:
    :   `getEngineSpeed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getTransmissionNumberLetter

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTransmissionNumberLetter()
  + ### getTransmissionNumber

    public int getTransmissionNumber()

    Specified by:
    :   `getTransmissionNumber` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getTransmissionNumberEnum

    public zombie.vehicles.TransmissionNumber getTransmissionNumberEnum()
  + ### setClientForce

    public void setClientForce(float force)
  + ### getClientForce

    public float getClientForce()
  + ### getForce

    public float getForce()
  + ### doVehicleColor

    private void doVehicleColor()

    Gonna decide which color is our car, basically:
    15% of being red, 10% of blue, 30% being extra bright (white/light grey), 20% chance of having low saturation
    (grey/black), other will be random color
  + ### shouldAnimRecorderBeActive

    public boolean shouldAnimRecorderBeActive()

    Overrides:
    :   `shouldAnimRecorderBeActive` in class `IsoMovingObject`
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoMovingObject`
  + ### createPhysics

    public void createPhysics()
  + ### createPhysics

    public void createPhysics(boolean spawnSwap)
  + ### isPreviouslyEntered

    public boolean isPreviouslyEntered()
  + ### setPreviouslyEntered

    public void setPreviouslyEntered(boolean bool)
  + ### isPreviouslyMoved

    public boolean isPreviouslyMoved()
  + ### setPreviouslyMoved

    public void setPreviouslyMoved(boolean bool)
  + ### getKeySpawned

    public boolean getKeySpawned()
  + ### tryCreateKeyRing

    private [InventoryContainer](../inventory/types/InventoryContainer.html "class in zombie.inventory.types") tryCreateKeyRing()
  + ### tryCreateBuildingKey

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") tryCreateBuildingKey([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") buildingDef)
  + ### randomlyAddNearestBuildingKeyToContainer

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") randomlyAddNearestBuildingKeyToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### putKeyToZombie

    public void putKeyToZombie([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### putKeyToContainer

    public void putKeyToContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### putKeyToContainerServer

    public void putKeyToContainerServer([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### putKeyToWorld

    public void putKeyToWorld([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addKeyToWorld

    public void addKeyToWorld()
  + ### addKeyToWorld

    public void addKeyToWorld(boolean crashed)
  + ### addKeyToGloveBox

    public void addKeyToGloveBox()
  + ### addBuildingKeyToGloveBox

    public void addBuildingKeyToGloveBox([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### createVehicleKey

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") createVehicleKey()
  + ### addKeyToSquare

    public boolean addKeyToSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addKeyToSquare

    public boolean addKeyToSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    boolean crashed)
  + ### addKeyToSquare2

    public boolean addKeyToSquare2([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int x2)
  + ### addKeyToSquare2

    public boolean addKeyToSquare2([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int x2,
    boolean crashed)
  + ### toggleLockedDoor

    public void toggleLockedDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean locked)
  + ### canLockDoor

    public boolean canLockDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canUnlockDoor

    public boolean canUnlockDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canOpenDoor

    public boolean canOpenDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### initParts

    private void initParts()
  + ### setGeneralPartCondition

    public void setGeneralPartCondition(float baseQuality,
    float chanceToSpawnDamaged)
  + ### createParts

    private void createParts()
  + ### getController

    public zombie.core.physics.CarController getController()
  + ### getSurroundVehicle

    public zombie.vehicles.SurroundVehicle getSurroundVehicle()
  + ### getSkinCount

    public int getSkinCount()
  + ### getSkinIndex

    public int getSkinIndex()
  + ### setSkinIndex

    public void setSkinIndex(int index)
  + ### updateSkin

    public void updateSkin()
  + ### getShadowTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getShadowTexture()
  + ### getScript

    public [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") getScript()

    Specified by:
    :   `getScript` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getScript` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getEngineCondition

    public int getEngineCondition()

    Specified by:
    :   `getEngineCondition` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getVehicleEngine

    private zombie.vehicles.VehicleEngine getVehicleEngine()
  + ### getEngineState

    public [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") getEngineState()

    Specified by:
    :   `getEngineState` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isEngineSounding

    public boolean isEngineSounding()

    Specified by:
    :   `isEngineSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isAlarmSounding

    public boolean isAlarmSounding()

    Specified by:
    :   `isAlarmSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isBrakePedalPressed

    public boolean isBrakePedalPressed()

    Specified by:
    :   `isBrakePedalPressed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isGasPedalPressed

    public boolean isGasPedalPressed()

    Specified by:
    :   `isGasPedalPressed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getRoadMaterial

    public zombie.audio.parameters.ParameterVehicleRoadMaterial.Material getRoadMaterial()

    Specified by:
    :   `getRoadMaterial` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getChosenAlarmSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChosenAlarmSound()

    Specified by:
    :   `getChosenAlarmSound` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isBackupBeeperSounding

    public boolean isBackupBeeperSounding()

    Specified by:
    :   `isBackupBeeperSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isDoorAlarmSounding

    public boolean isDoorAlarmSounding()

    Specified by:
    :   `isDoorAlarmSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isHornSounding

    public boolean isHornSounding()

    Specified by:
    :   `isHornSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getVehicleSoundEmitter

    public [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") getVehicleSoundEmitter()

    Specified by:
    :   `getVehicleSoundEmitter` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### setScript

    public void setScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### chooseRandomScript

    private void chooseRandomScript()
  + ### isListenerInRange

    public boolean isListenerInRange(float range)

    Specified by:
    :   `isListenerInRange` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptName()

    Specified by:
    :   `getScriptName` in interface `zombie.vehicleSound.VehicleSoundOwner`

    Overrides:
    :   `getScriptName` in class `IsoObject`
  + ### setScriptName

    public void setScriptName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setScript

    public void setScript()
  + ### scriptReloaded

    public void scriptReloaded()
  + ### scriptReloaded

    public void scriptReloaded(boolean spawnSwap)
  + ### getSkin

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSkin()
  + ### setModelVisible

    public [BaseVehicle.ModelInfo](BaseVehicle.ModelInfo.html "class in zombie.vehicles") setModelVisible([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel,
    boolean visible)

    Specified by:
    :   `setModelVisible` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getModelScriptNameForPart

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelScriptNameForPart([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel)
  + ### getModelInfoForPart

    private [BaseVehicle.ModelInfo](BaseVehicle.ModelInfo.html "class in zombie.vehicles") getModelInfoForPart([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### getScriptPassenger

    private [VehicleScript.Passenger](../scripting/objects/VehicleScript.Passenger.html "class in zombie.scripting.objects") getScriptPassenger(int seat)
  + ### getMaxPassengers

    public int getMaxPassengers()
  + ### setPassenger

    public boolean setPassenger(int seat,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") offset)
  + ### updateLastKnwnDriver

    private void updateLastKnwnDriver()
  + ### clearPassenger

    public boolean clearPassenger(int seat)
  + ### hasPassenger

    public boolean hasPassenger()
  + ### getPassenger

    public [BaseVehicle.Passenger](BaseVehicle.Passenger.html "class in zombie.vehicles") getPassenger(int seat)
  + ### getCharacter

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter(int seat)
  + ### getSeat

    public int getSeat([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isDriver

    public boolean isDriver([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getWorldPos([Vector3f](../../org/joml/Vector3f.html "class in org.joml") localPos,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script)
  + ### getWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getWorldPos(float localX,
    float localY,
    float localZ,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script)
  + ### getWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getWorldPos([Vector3f](../../org/joml/Vector3f.html "class in org.joml") localPos,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos)
  + ### getWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getWorldPos(float localX,
    float localY,
    float localZ,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos)
  + ### getLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getLocalPos([Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") localPos)
  + ### getLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getLocalPos(float worldX,
    float worldY,
    float worldZ,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") localPos)
  + ### getPassengerLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPassengerLocalPos(int seat,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getPassengerWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPassengerWorldPos(int seat,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getPassengerPositionWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPassengerPositionWorldPos([VehicleScript.Position](../scripting/objects/VehicleScript.Position.html "class in zombie.scripting.objects") posn,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getPassengerPositionWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPassengerPositionWorldPos(float x,
    float y,
    float z,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getPassengerAnim

    public [VehicleScript.Anim](../scripting/objects/VehicleScript.Anim.html "class in zombie.scripting.objects") getPassengerAnim(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPassengerPosition

    public [VehicleScript.Position](../scripting/objects/VehicleScript.Position.html "class in zombie.scripting.objects") getPassengerPosition(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPassengerDoor

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPassengerDoor(int seat)
  + ### getPassengerDoor2

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPassengerDoor2(int seat)
  + ### isPositionOnLeftOrRight

    public boolean isPositionOnLeftOrRight(float x,
    float y)
  + ### haveOneDoorUnlocked

    public boolean haveOneDoorUnlocked()
  + ### getPassengerArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPassengerArea(int seat)
  + ### playPassengerAnim

    public void playPassengerAnim(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### playPassengerAnim

    public void playPassengerAnim(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### playPassengerSound

    public void playPassengerSound(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### playPartAnim

    public void playPartAnim([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### playActorAnim

    public void playActorAnim([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### playCharacterAnim

    private void playCharacterAnim([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [VehicleScript.Anim](../scripting/objects/VehicleScript.Anim.html "class in zombie.scripting.objects") anim,
    boolean snapDirection)
  + ### playPartSound

    public void playPartSound([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### setCharacterPosition

    public void setCharacterPosition([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionId)
  + ### transmitCharacterPosition

    public void transmitCharacterPosition(int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionId)
  + ### setCharacterPositionToAnim

    public void setCharacterPositionToAnim([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animId)
  + ### getPassengerSwitchSeatCount

    public int getPassengerSwitchSeatCount(int seat)
  + ### getPassengerSwitchSeat

    public [VehicleScript.Passenger.SwitchSeat](../scripting/objects/VehicleScript.Passenger.SwitchSeat.html "class in zombie.scripting.objects") getPassengerSwitchSeat(int seat,
    int index)
  + ### getSwitchSeat

    private [VehicleScript.Passenger.SwitchSeat](../scripting/objects/VehicleScript.Passenger.SwitchSeat.html "class in zombie.scripting.objects") getSwitchSeat(int seatFrom,
    int seatTo)
  + ### getSwitchSeatAnimName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSwitchSeatAnimName(int seatFrom,
    int seatTo)
  + ### getSwitchSeatAnimRate

    public float getSwitchSeatAnimRate(int seatFrom,
    int seatTo)
  + ### getSwitchSeatSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSwitchSeatSound(int seatFrom,
    int seatTo)
  + ### canSwitchSeat

    public boolean canSwitchSeat(int seatFrom,
    int seatTo)
  + ### switchSeat

    public void switchSeat([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seatTo)
  + ### playSwitchSeatAnim

    public void playSwitchSeatAnim(int seatFrom,
    int seatTo)
  + ### isSeatOccupied

    public boolean isSeatOccupied(int seat)
  + ### isSeatInstalled

    public boolean isSeatInstalled(int seat)
  + ### isSeatHoldingItems

    public boolean isSeatHoldingItems(int seat)
  + ### isSeatHoldingItems

    public boolean isSeatHoldingItems([VehiclePart](VehiclePart.html "class in zombie.vehicles") seat)
  + ### getAllSeatParts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> getAllSeatParts()
  + ### getAllSeatParts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> getAllSeatParts([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> results)
  + ### isPointLeftOfCenter

    public boolean isPointLeftOfCenter(float x,
    float y)
  + ### getBestSeat

    public int getBestSeat([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getEnterSeatDistance

    public float getEnterSeatDistance(int seat,
    float x,
    float y)
  + ### updateHasExtendOffsetForExit

    public void updateHasExtendOffsetForExit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### updateHasExtendOffsetForExitEnd

    public void updateHasExtendOffsetForExitEnd([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### updateHasExtendOffset

    public void updateHasExtendOffset([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getUseablePart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getUseablePart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getUseablePart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getUseablePart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean checkDir)
  + ### distanceToManhatten

    public float distanceToManhatten(float x,
    float y)
  + ### getClosestWindow

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getClosestWindow([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getClosestWindow

    private @Nullable [VehiclePart](VehiclePart.html "class in zombie.vehicles") getClosestWindow(float chrX,
    float chrY,
    float chrZ,
    float forwardDirectionX,
    float forwardDirectionY)
  + ### getFacingPosition

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getFacingPosition([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### getFacingPosition

    private [Vector2](../iso/Vector2.html "class in zombie.iso") getFacingPosition(float worldX,
    float worldY,
    float worldZ,
    [Vector2](../iso/Vector2.html "class in zombie.iso") worldFacingPos)
  + ### enter

    public boolean enter(int seat,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") offset)
  + ### enter

    public boolean enter(int seat,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### enterRSync

    public boolean enterRSync(int seat,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") v)
  + ### exit

    public boolean exit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### exitRSync

    public boolean exitRSync([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hasRoof

    public boolean hasRoof(int seat)
  + ### showPassenger

    public boolean showPassenger(int seat)
  + ### showPassenger

    public boolean showPassenger([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### softReset

    public void softReset()

    Overrides:
    :   `softReset` in class `IsoObject`
  + ### trySpawnKey

    public void trySpawnKey()
  + ### trySpawnKey

    public void trySpawnKey(boolean crashed)
  + ### shouldCollideWithCharacters

    public boolean shouldCollideWithCharacters()
  + ### shouldCollideWithObjects

    public boolean shouldCollideWithObjects()
  + ### breakingObjects

    public void breakingObjects()
  + ### updateVelocityMultiplier

    private void updateVelocityMultiplier()
  + ### playScrapePastPlantSound

    private void playScrapePastPlantSound([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### checkCollisionWithPlant

    private void checkCollisionWithPlant([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object,
    [Vector2](../iso/Vector2.html "class in zombie.iso") vector2)
  + ### updateScrapPastPlantSound

    private void updateScrapPastPlantSound()
  + ### damageObjects

    public void damageObjects(float damage)
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoMovingObject`
  + ### shouldUpdateInMeta

    public boolean shouldUpdateInMeta()
  + ### updateImportantAreas

    private void updateImportantAreas()
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()

    Overrides:
    :   `getMinimumSimulationLevel` in class `IsoMovingObject`
  + ### applyAccumulatedImpulsesFromHitObjectsToPhysics

    public void applyAccumulatedImpulsesFromHitObjectsToPhysics()
  + ### applyAllImpulsesFromProneCharacters

    public void applyAllImpulsesFromProneCharacters()
  + ### getFudgedMass

    public float getFudgedMass()
  + ### isNullChunk

    private boolean isNullChunk(int wx,
    int wy)
  + ### isInvalidChunkAround

    public boolean isInvalidChunkAround()
  + ### isInvalidChunkAhead

    public boolean isInvalidChunkAhead()
  + ### isInvalidChunkBehind

    public boolean isInvalidChunkBehind()
  + ### isInvalidChunkAround

    public boolean isInvalidChunkAround(boolean moveW,
    boolean moveE,
    boolean moveN,
    boolean moveS)
  + ### postupdate

    public void postupdate()

    Overrides:
    :   `postupdate` in class `IsoMovingObject`
  + ### shouldSnapZToCurrentSquare

    public boolean shouldSnapZToCurrentSquare()

    Overrides:
    :   `shouldSnapZToCurrentSquare` in class `IsoMovingObject`
  + ### applyDamageFromHitCharacters

    private void applyDamageFromHitCharacters(zombie.vehicles.VehiclePedestrianContactTracking pedestrianContacts)

    Apply all damage from impacted, damage-causing characters, for this frame.
  + ### damageFromHitChr

    public void damageFromHitChr(int dmgFront,
    int dmgBack)
  + ### updateAnimationPlayer

    private void updateAnimationPlayer(zombie.core.skinnedmodel.animation.AnimationPlayer animPlayer,
    [VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### authorizationClientCollide

    public void authorizationClientCollide([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") driver)
  + ### authorizationServerCollide

    public void authorizationServerCollide(short playerId,
    boolean isCollide)
  + ### authorizationServerOnSeat

    public void authorizationServerOnSeat([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean enter)
  + ### hasAuthorization

    public boolean hasAuthorization(zombie.core.raknet.UdpConnection connection)
  + ### netPlayerFromServerUpdate

    public void netPlayerFromServerUpdate([BaseVehicle.Authorization](BaseVehicle.Authorization.html "enum class in zombie.vehicles") authorization,
    short authorizationPlayer)
  + ### getWorldTransform

    public [Transform](../core/physics/Transform.html "class in zombie.core.physics") getWorldTransform([Transform](../core/physics/Transform.html "class in zombie.core.physics") out)
  + ### setWorldTransform

    public void setWorldTransform([Transform](../core/physics/Transform.html "class in zombie.core.physics") in)
  + ### flipUpright

    public void flipUpright()
  + ### setAngles

    public void setAngles(float degreesX,
    float degreesY,
    float degreesZ)
  + ### getAngleX

    public float getAngleX()
  + ### getAngleY

    public float getAngleY()
  + ### getAngleZ

    public float getAngleZ()
  + ### setDebugZ

    public void setDebugZ(float z)
  + ### setPhysicsActive

    public void setPhysicsActive(boolean active)
  + ### setPhysicsActive

    public void setPhysicsActive(boolean active,
    boolean setStatic)
  + ### isPhysicsActive

    public boolean isPhysicsActive()
  + ### getDebugZ

    public float getDebugZ()
  + ### getPoly

    public zombie.pathfind.VehiclePoly getPoly()
  + ### getPolyPlusRadius

    public zombie.pathfind.VehiclePoly getPolyPlusRadius()
  + ### initShadowPoly

    private void initShadowPoly()
  + ### initPolyPlusRadiusBounds

    private void initPolyPlusRadiusBounds()
  + ### getForwardVector

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getForwardVector([Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getUpVector

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getUpVector([Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getUpVectorDot

    public float getUpVectorDot()
  + ### isStopped

    public boolean isStopped()
  + ### setSpeedKmHour

    public void setSpeedKmHour(float speedKmHour)
  + ### getCurrentSpeedKmHour

    public float getCurrentSpeedKmHour()

    Specified by:
    :   `getCurrentSpeedKmHour` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getCurrentAbsoluteSpeedKmHour

    public float getCurrentAbsoluteSpeedKmHour()
  + ### getLinearVelocity

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getLinearVelocity([Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### getSpeed2D

    public float getSpeed2D()
  + ### isAtRest

    public boolean isAtRest()
  + ### updateTransform

    protected void updateTransform()
  + ### initTransform

    private void initTransform(zombie.core.skinnedmodel.model.ModelInstance parentModelInstance,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") parentModelScript,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameParent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameSelf,
    org.joml.Matrix4f transform)
  + ### updatePhysics

    public void updatePhysics()
  + ### checkSurroundingChunks

    public void checkSurroundingChunks()
  + ### hasChunksAllAround

    private boolean hasChunksAllAround()
  + ### updatePhysicsNetwork

    public void updatePhysicsNetwork()
  + ### checkPhysicsValidWithServer

    public void checkPhysicsValidWithServer()
  + ### updateControls

    public void updateControls()
  + ### isKeyboardControlled

    public boolean isKeyboardControlled()
  + ### getJoypad

    public int getJoypad()
  + ### Damage

    public void Damage(float amount)

    Overrides:
    :   `Damage` in class `IsoObject`
  + ### HitByVehicle

    public void HitByVehicle([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle,
    float amount)

    Overrides:
    :   `HitByVehicle` in class `IsoObject`
  + ### crash

    public void crash(float delta,
    boolean front)
  + ### getCrashSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCrashSound(float dmg)
  + ### addDamageFrontHitAChr

    public void addDamageFrontHitAChr(int dmg)
  + ### addDamageRearHitAChr

    public void addDamageRearHitAChr(int dmg)
  + ### addDamageFront

    private void addDamageFront(int dmg)
  + ### addDamageRear

    private void addDamageRear(int dmg)
  + ### damageHeadlight

    private void damageHeadlight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId,
    int dmg)
  + ### clamp

    private float clamp(float f1,
    float min,
    float max)
  + ### getClosestPointOnEdge

    private double getClosestPointOnEdge(float px,
    float py,
    float x1,
    float y1,
    float x2,
    float y2,
    double closestDistSq,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") out)
  + ### getClosestPointOnExtents

    public float getClosestPointOnExtents(float x,
    float y,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closest)
  + ### getClosestPointOnPoly

    public float getClosestPointOnPoly(float x,
    float y,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closest)
  + ### getClosestPointOnPoly

    public float getClosestPointOnPoly([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") other,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") pointSelf,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") pointOther)
  + ### intersectLineWithExtents

    public boolean intersectLineWithExtents(float x1,
    float y1,
    float x2,
    float y2,
    float adjust,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") intersection)
  + ### intersectLineWithPoly

    public boolean intersectLineWithPoly(float x1,
    float y1,
    float x2,
    float y2,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") intersection)
  + ### isCharacterAdjacentTo

    public boolean isCharacterAdjacentTo([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### testCollisionWithCharacter

    public [Vector2](../iso/Vector2.html "class in zombie.iso") testCollisionWithCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float circleRadius,
    [Vector2](../iso/Vector2.html "class in zombie.iso") outCollisionPos)
  + ### testCollisionWithProneCharacter

    public int testCollisionWithProneCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean doSound,
    [Vector2](../iso/Vector2.html "class in zombie.iso") outImpactPosOnVehicle)
  + ### testCollisionWithCorpse

    public int testCollisionWithCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    boolean doSound)
  + ### testCollisionWithProneCharacter

    public int testCollisionWithProneCharacter([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") chr,
    float angleX,
    float angleY,
    boolean doSound,
    [Vector2](../iso/Vector2.html "class in zombie.iso") outImpactPosOnVehicle)
  + ### testCollisionWithObject

    public [Vector2](../iso/Vector2.html "class in zombie.iso") testCollisionWithObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    float circleRadius,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### testCollisionWithVehicle

    public boolean testCollisionWithVehicle([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") obj)
  + ### getObjectX

    private float getObjectX([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getObjectY

    private float getObjectY([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### applyImpulseFromHitObject

    public void applyImpulseFromHitObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    float mul)
  + ### applyImpulseFromHitPedestrian

    public void applyImpulseFromHitPedestrian([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### applyImpulseFromHitPlant

    public void applyImpulseFromHitPlant([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    float mul)
  + ### applyImpulseGeneric

    public void applyImpulseGeneric(float fromX,
    float fromY,
    float fromZ,
    float impulseDirX,
    float impulseDirY,
    float impulseDirZ,
    float impulseStrength)
  + ### hitCharacter

    public float hitCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Vector2](../iso/Vector2.html "class in zombie.iso") impactPosOnVehicle)
  + ### triggerMusicIntensityEventVehicleHitCharacter

    private void triggerMusicIntensityEventVehicleHitCharacter()
  + ### playSoundVehicleHitCharacter

    private void playSoundVehicleHitCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### onHitCharacterAddContact

    private void onHitCharacterAddContact([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isPersistentContact

    public boolean isPersistentContact([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isCharacterInFront

    private boolean isCharacterInFront([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hitAnimal

    public void hitAnimal([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") chr)
  + ### calculateDamageWithCharacter

    public int calculateDamageWithCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### blocked

    public boolean blocked(int x,
    int y,
    int z)
  + ### isIntersectingSquare

    public boolean isIntersectingSquare(int x,
    int y,
    int z)
  + ### isIntersectingSquare

    public boolean isIntersectingSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### isIntersectingSquareWithShadow

    public boolean isIntersectingSquareWithShadow(int x,
    int y,
    int z)
  + ### circleIntersects

    public boolean circleIntersects(float x,
    float y,
    float z,
    float radius)
  + ### updateLights

    public void updateLights()
  + ### updateWorldLights

    private void updateWorldLights()
  + ### fixLightbarModelLighting

    public void fixLightbarModelLighting([IsoLightSource](../iso/IsoLightSource.html "class in zombie.iso") ls,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") lightPos)
  + ### removeWorldLights

    private void removeWorldLights()
  + ### updateDamageOverlayLater

    public void updateDamageOverlayLater()

    Specified by:
    :   `updateDamageOverlayLater` in interface `zombie.vehicles.VehiclePartOwner`
  + ### doDamageOverlay

    public void doDamageOverlay()
  + ### checkDamage

    private void checkDamage([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    int matrixName,
    boolean doBlack)
  + ### checkDamage2

    private void checkDamage2([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    int matrixName,
    boolean doBlack)
  + ### checkUninstall2

    private void checkUninstall2([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    int matrixName)
  + ### doOtherBodyWorkDamage

    private void doOtherBodyWorkDamage()
  + ### doWindowDamage

    private void doWindowDamage()
  + ### doDoorDamage

    private void doDoorDamage()
  + ### getBloodIntensity

    public float getBloodIntensity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### setBloodIntensity

    public void setBloodIntensity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float intensity)
  + ### transmitBlood

    public void transmitBlood()
  + ### doBloodOverlay

    public void doBloodOverlay()
  + ### doBloodOverlayAux

    private void doBloodOverlayAux(float[] matrix1,
    float[] matrix2,
    float intensity)
  + ### doBloodOverlayFront

    private void doBloodOverlayFront(float[] matrix1,
    float[] matrix2,
    float intensity)
  + ### doBloodOverlayRear

    private void doBloodOverlayRear(float[] matrix1,
    float[] matrix2,
    float intensity)
  + ### doBloodOverlayLeft

    private void doBloodOverlayLeft(float[] matrix1,
    float[] matrix2,
    float intensity)
  + ### doBloodOverlayRight

    private void doBloodOverlayRight(float[] matrix1,
    float[] matrix2,
    float intensity)
  + ### isOnScreen

    public boolean isOnScreen()

    Overrides:
    :   `isOnScreen` in class `IsoObject`
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
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
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `IsoMovingObject`
  + ### renderShadow

    public void renderShadow()
  + ### isEnterBlocked

    public boolean isEnterBlocked([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat)
  + ### isExitBlocked

    public boolean isExitBlocked(int seat)
  + ### isExitBlocked

    public boolean isExitBlocked([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat)
  + ### isPassengerUseDoor2

    public boolean isPassengerUseDoor2([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat)
  + ### isEnterBlocked2

    public boolean isEnterBlocked2([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    int seat)
  + ### isExitBlocked2

    public boolean isExitBlocked2(int seat)
  + ### renderExits

    private void renderExits()
  + ### areaPositionLocal

    private [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionLocal([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area)
  + ### areaPositionLocal

    private [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionLocal([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### areaPositionWorld

    public [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionWorld([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area)
  + ### areaPositionWorld

    public [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionWorld([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### areaPositionWorld4PlayerInteract

    public [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionWorld4PlayerInteract([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area)
  + ### areaPositionWorld4PlayerInteract

    public [Vector2](../iso/Vector2.html "class in zombie.iso") areaPositionWorld4PlayerInteract([VehicleScript.Area](../scripting/objects/VehicleScript.Area.html "class in zombie.scripting.objects") area,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### renderAreas

    private void renderAreas()
  + ### renderInterpolateBuffer

    private void renderInterpolateBuffer()
  + ### renderInterpolateBuffer\_drawTextHL

    private void renderInterpolateBuffer\_drawTextHL(long x1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [Color](../core/Color.html "class in zombie.core") col,
    float x,
    float y,
    float w,
    float h,
    long start,
    long end)
  + ### renderInterpolateBuffer\_drawVertLine

    private void renderInterpolateBuffer\_drawVertLine(long x1,
    [Color](../core/Color.html "class in zombie.core") col,
    float x,
    float y,
    float w,
    float h,
    long start,
    long end,
    boolean drawParity)
  + ### renderInterpolateBuffer\_drawLine

    private void renderInterpolateBuffer\_drawLine(long x1,
    float y1,
    long x2,
    float y2,
    [Color](../core/Color.html "class in zombie.core") col,
    float x,
    float y,
    float w,
    float h,
    long start,
    long end,
    float starty,
    float endy)
  + ### renderInterpolateBuffer\_drawPoint

    private void renderInterpolateBuffer\_drawPoint(long x1,
    float y1,
    [Color](../core/Color.html "class in zombie.core") col,
    int radius,
    float x,
    float y,
    float w,
    float h,
    long start,
    long end,
    float starty,
    float endy)
  + ### renderAuthorizations

    private void renderAuthorizations()
  + ### renderUsableArea

    private void renderUsableArea()
  + ### couldSeeIntersectedSquare

    private boolean couldSeeIntersectedSquare(int playerIndex)
  + ### renderIntersectedSquares

    private void renderIntersectedSquares()
  + ### renderTrailerPositions

    private void renderTrailerPositions()
  + ### renderVelocity

    private void renderVelocity()
  + ### getWheelForwardVector

    public void getWheelForwardVector(int wheelIndex,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### onEngineStateChanged

    public void onEngineStateChanged([BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") oldState,
    [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") newState,
    zombie.vehicles.VehicleEngineStateChangeReason reason)

    Specified by:
    :   `onEngineStateChanged` in interface `zombie.vehicles.IVehicleEngineListener`
  + ### tryStartEngine

    public void tryStartEngine(boolean haveKey)
  + ### tryStartEngine

    public void tryStartEngine()
  + ### engineDoIdle

    public void engineDoIdle()
  + ### engineDoStarting

    public void engineDoStarting()
  + ### isStarting

    public boolean isStarting()
  + ### engineDoRetryingStarting

    public void engineDoRetryingStarting()
  + ### engineDoStartingSuccess

    public void engineDoStartingSuccess()
  + ### engineDoStartingFailed

    public void engineDoStartingFailed()
  + ### engineDoStartingFailed

    public void engineDoStartingFailed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### engineDoStartingFailed

    public void engineDoStartingFailed(zombie.vehicles.VehicleEngineStateChangeReason reason)
  + ### engineDoStartingFailedNoPower

    public void engineDoStartingFailedNoPower()
  + ### engineDoRunning

    public void engineDoRunning()
  + ### engineDoStalling

    public void engineDoStalling()
  + ### engineDoShuttingDown

    public void engineDoShuttingDown()
  + ### engineDoShuttingDown

    public void engineDoShuttingDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### engineDoShuttingDown

    public void engineDoShuttingDown(zombie.vehicles.VehicleEngineStateChangeReason reason)
  + ### shutOff

    public void shutOff()
  + ### shutOff

    public void shutOff([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### resumeRunningAfterLoad

    public void resumeRunningAfterLoad()
  + ### isEngineStarted

    public boolean isEngineStarted()
  + ### isEngineRunning

    public boolean isEngineRunning()

    Specified by:
    :   `isEngineRunning` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isEngineWorking

    public boolean isEngineWorking()

    Specified by:
    :   `isEngineWorking` in interface `zombie.vehicles.VehiclePartOwner`
  + ### isOperational

    public boolean isOperational()
  + ### isDriveable

    public boolean isDriveable()
  + ### getEmitter

    public [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") getEmitter()
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### stopSound

    public int stopSound(long channel)
  + ### playSound

    public void playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
  + ### checkVehicleSoundsExists

    public void checkVehicleSoundsExists()
  + ### updateSounds

    public void updateSounds()
  + ### updateWorldSounds

    private void updateWorldSounds()
  + ### updateHandBrakeSound

    private void updateHandBrakeSound()
  + ### updateParts

    public void updateParts()
  + ### drainBatteryUpdateHack

    public void drainBatteryUpdateHack()
  + ### getHeadlightsOn

    public boolean getHeadlightsOn()

    Specified by:
    :   `getHeadlightsOn` in interface `zombie.vehicles.VehiclePartOwner`
  + ### setHeadlightsOn

    public void setHeadlightsOn(boolean on)
  + ### getWindowLightsOn

    public boolean getWindowLightsOn()
  + ### setWindowLightsOn

    public void setWindowLightsOn(boolean on)
  + ### getHeadlightCanEmmitLight

    public boolean getHeadlightCanEmmitLight()
  + ### getStoplightsOn

    public boolean getStoplightsOn()
  + ### setStoplightsOn

    public void setStoplightsOn(boolean on)
  + ### hasHeadlights

    public boolean hasHeadlights()
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### addToWorld

    public void addToWorld(boolean crashed)
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoMovingObject`
  + ### removeVehicleSounds

    private void removeVehicleSounds()
  + ### permanentlyRemove

    public void permanentlyRemove()
  + ### setEngineFeature

    public void setEngineFeature(int quality,
    int loudness,
    int engineForce)

    Specified by:
    :   `setEngineFeature` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getEngineQuality

    public int getEngineQuality()

    Specified by:
    :   `getEngineQuality` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getEngineLoudness

    public int getEngineLoudness()
  + ### getEnginePower

    public int getEnginePower()
  + ### getParts

    public [VehicleParts](VehicleParts.html "class in zombie.vehicles") getParts()

    Specified by:
    :   `getParts` in interface `zombie.vehicles.VehiclePartOwner`
  + ### adoptParts

    public void adoptParts([VehicleParts](VehicleParts.html "class in zombie.vehicles") partsNew)
  + ### getPartForSeatContainer

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartForSeatContainer(int seat)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### transmitPartCondition

    public void transmitPartCondition([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartCondition` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartItem

    public void transmitPartItem([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartItem` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartLight

    public void transmitPartLight([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartLight` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartModData

    public void transmitPartModData([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartModData` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartUsedDelta

    public void transmitPartUsedDelta([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartUsedDelta` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartDoor

    public void transmitPartDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartDoor` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartWindow

    public void transmitPartWindow([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartWindow` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getLightCount

    public int getLightCount()
  + ### getLightByIndex

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getLightByIndex(int index)
  + ### getZone

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getZone()
  + ### setZone

    public void setZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isInArea

    public boolean isInArea([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isInArea

    private boolean isInArea([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    float chrX,
    float chrY)
  + ### getAreaDist

    public float getAreaDist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    float x,
    float y,
    float z)
  + ### getAreaDist

    public float getAreaDist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getAreaCenter

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAreaCenter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId)
  + ### getAreaCenter

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAreaCenter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)
  + ### getAreaFacingPosition

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getAreaFacingPosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    [Vector2](../iso/Vector2.html "class in zombie.iso") out)

    getAreaFacingPosition
    The point-of-entry to the part represented by this area in the vehicle.
    The position to face when wanting to interact with this Vehicle's area.
    Used when addressing containers inside a vehicle, such as a Seat or TruckBed.
  + ### isInBounds

    public boolean isInBounds(float worldX,
    float worldY)
  + ### canAccessContainer

    public boolean canAccessContainer(int partIndex,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canInstallPart

    public boolean canInstallPart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### canUninstallPart

    public boolean canUninstallPart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3)
  + ### callLuaBoolean

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") callLuaBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### callLuaBoolean

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") callLuaBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3)
  + ### getId

    public short getId()
  + ### setTireInflation

    public void setTireInflation(int wheelIndex,
    float inflation)
  + ### setTireRemoved

    public void setTireRemoved(int wheelIndex,
    boolean removed)
  + ### chooseBestAttackPosition

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") chooseBestAttackPosition([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") attacker,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos)
  + ### getMinMaxPosition

    public [BaseVehicle.MinMaxPosition](BaseVehicle.MinMaxPosition.html "class in zombie.vehicles") getMinMaxPosition()
  + ### getVehicleType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVehicleType()
  + ### setVehicleType

    public void setVehicleType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getMaxSpeed

    public float getMaxSpeed()

    Specified by:
    :   `getMaxSpeed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### setMaxSpeed

    public void setMaxSpeed(float maxSpeed)
  + ### lockServerUpdate

    public void lockServerUpdate(long lockTimeMs)
  + ### changeTransmission

    public void changeTransmission(zombie.vehicles.TransmissionNumber newTransmission)
  + ### tryHotwire

    public void tryHotwire(int electricityLevel)
  + ### cheatHotwire

    public void cheatHotwire(boolean hotwired,
    boolean broken)
  + ### isKeyIsOnDoor

    public boolean isKeyIsOnDoor()
  + ### setKeyIsOnDoor

    public void setKeyIsOnDoor(boolean keyIsOnDoor)
  + ### isHotwired

    public boolean isHotwired()
  + ### setHotwired

    public void setHotwired(boolean hotwired)
  + ### isHotwiredBroken

    public boolean isHotwiredBroken()
  + ### setHotwiredBroken

    public void setHotwiredBroken(boolean hotwiredBroken)
  + ### getDriver

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getDriver()

    Specified by:
    :   `getDriver` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getDriverRegardlessOfTow

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getDriverRegardlessOfTow()

    Specified by:
    :   `getDriverRegardlessOfTow` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getPVPPlayerDriver

    public [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getPVPPlayerDriver()
  + ### isKeysInIgnition

    public boolean isKeysInIgnition()
  + ### setKeysInIgnition

    public void setKeysInIgnition(boolean keysOnContact)
  + ### putKeyInIgnition

    public void putKeyInIgnition([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") key,
    int containerID)
  + ### removeKeyFromIgnition

    public void removeKeyFromIgnition()
  + ### putKeyOnDoor

    public void putKeyOnDoor([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") key)
  + ### removeKeyFromDoor

    public void removeKeyFromDoor()
  + ### syncKeyInIgnition

    public void syncKeyInIgnition(boolean inIgnition,
    boolean onDoor,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") key)
  + ### randomizeContainers

    private void randomizeContainers()
  + ### randomizeContainers

    private void randomizeContainers([ItemPickerJava.ItemPickerRoom](../inventory/ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") contDistrib)
  + ### randomizeContainer

    private void randomizeContainer([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [ItemPickerJava.ItemPickerRoom](../inventory/ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") contDistrib)
  + ### setChosenAlarmSound

    public void setChosenAlarmSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### chooseAlarmSound

    public void chooseAlarmSound()
  + ### onVehicleAlarmEvent

    public void onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent event)

    Specified by:
    :   `onVehicleAlarmEvent` in interface `zombie.vehicles.IVehicleAlarmListener`
  + ### onAlarmStart

    public void onAlarmStart()
  + ### onAlarmStop

    public void onAlarmStop()
  + ### onHornStart

    public void onHornStart()
  + ### onHornStop

    public void onHornStop()
  + ### hasBackSignal

    public boolean hasBackSignal()
  + ### isBackSignalEmitting

    public boolean isBackSignalEmitting()
  + ### onBackMoveSignalStart

    public void onBackMoveSignalStart()
  + ### onBackMoveSignalStop

    public void onBackMoveSignalStop()
  + ### getLightbarLightsModeObject

    public zombie.vehicles.LightbarLightsMode getLightbarLightsModeObject()

    Specified by:
    :   `getLightbarLightsModeObject` in interface `zombie.vehicles.VehiclePartOwner`
  + ### setLightbarLightsMode

    public void setLightbarLightsMode(int mode)

    Specified by:
    :   `setLightbarLightsMode` in interface `zombie.vehicles.VehiclePartOwner`
  + ### setLightbarSirenMode

    public void setLightbarSirenMode(int mode)

    Specified by:
    :   `setLightbarSirenMode` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `setLightbarSirenMode` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getChoosenParts

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getChoosenParts()
  + ### getMass

    public float getMass()
  + ### setMass

    public void setMass(float mass)
  + ### getInitialMass

    public float getInitialMass()
  + ### setInitialMass

    public void setInitialMass(float initialMass)
  + ### updateTotalMass

    public void updateTotalMass()

    Specified by:
    :   `updateTotalMass` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getBrakingForce

    public float getBrakingForce()
  + ### setBrakingForce

    public void setBrakingForce(float brakingForce)
  + ### getBaseQuality

    public float getBaseQuality()
  + ### setBaseQuality

    public void setBaseQuality(float baseQuality)
  + ### getCurrentSteering

    public float getCurrentSteering()
  + ### setCurrentSteering

    public void setCurrentSteering(float currentSteering)
  + ### isDoingOffroad

    public boolean isDoingOffroad()
  + ### isBraking

    public boolean isBraking()
  + ### setBraking

    public void setBraking(boolean isBraking)
  + ### updatePartStats

    public void updatePartStats()

    Specified by:
    :   `updatePartStats` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitEngine

    public void transmitEngine()

    Specified by:
    :   `transmitEngine` in interface `zombie.vehicles.VehiclePartOwner`
  + ### setRust

    public void setRust(float rust)
  + ### getRust

    public float getRust()
  + ### transmitRust

    public void transmitRust()
  + ### transmitAlarmed

    public void transmitAlarmed()
  + ### transmitColorHSV

    public void transmitColorHSV()
  + ### transmitSkinIndex

    public void transmitSkinIndex()
  + ### updateBulletStats

    public void updateBulletStats()

    Specified by:
    :   `updateBulletStats` in interface `zombie.vehicles.VehiclePartOwner`
  + ### updateBulletStatsWheel

    private void updateBulletStatsWheel(int wheelIndex,
    float[] data,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") worldPos,
    float frictionMul,
    int chanceofbump,
    double period,
    double susp)
  + ### setActiveInBullet

    public void setActiveInBullet(boolean active)
  + ### areAllDoorsLocked

    public boolean areAllDoorsLocked()
  + ### isAnyDoorLocked

    public boolean isAnyDoorLocked()
  + ### getRemainingFuelPercentage

    public float getRemainingFuelPercentage()
  + ### getMechanicalID

    public int getMechanicalID()
  + ### setMechanicalID

    public void setMechanicalID(int mechanicalId)
  + ### needPartsUpdate

    public boolean needPartsUpdate()
  + ### setNeedPartsUpdate

    public void setNeedPartsUpdate(boolean needPartsUpdate)
  + ### isAlarmed

    public boolean isAlarmed()
  + ### setAlarmed

    public void setAlarmed(boolean alarmed)
  + ### setVehicleAlarm

    public void setVehicleAlarm(zombie.vehicles.VehicleAlarm vehicleAlarm1)
  + ### getVehicleAlarmObject

    public zombie.vehicles.VehicleAlarm getVehicleAlarmObject()
  + ### isAlarmActive

    public boolean isAlarmActive()

    Specified by:
    :   `isAlarmActive` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isAlarmSoundOn

    public boolean isAlarmSoundOn()

    Specified by:
    :   `isAlarmSoundOn` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### triggerAlarm

    public void triggerAlarm()
  + ### doAlarm

    private void doAlarm()
  + ### checkMusicIntensityEvent\_AlarmNearby

    private void checkMusicIntensityEvent\_AlarmNearby()
  + ### isMechanicUIOpen

    public boolean isMechanicUIOpen()
  + ### setMechanicUIOpen

    public void setMechanicUIOpen(boolean mechanicUiOpen)
  + ### damagePlayers

    public void damagePlayers(float damage)
  + ### addRandomDamageFromCrash

    public void addRandomDamageFromCrash([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float damage)
  + ### isTrunkLocked

    public boolean isTrunkLocked()
  + ### setTrunkLocked

    public void setTrunkLocked(boolean locked)
  + ### getNearestBodyworkPart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getNearestBodyworkPart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getSirenStartTime

    public double getSirenStartTime()

    Specified by:
    :   `getSirenStartTime` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### setSirenStartTime

    public void setSirenStartTime(double worldAgeHours)

    Specified by:
    :   `setSirenStartTime` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### repair

    public void repair()
  + ### isAnyListenerInside

    public boolean isAnyListenerInside()

    Specified by:
    :   `isAnyListenerInside` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isSirenActive

    public boolean isSirenActive()

    Specified by:
    :   `isSirenActive` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isSirenSounding

    public boolean isSirenSounding()

    Specified by:
    :   `isSirenSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getLightbarSirenModeObject

    public zombie.vehicles.LightbarSirenMode getLightbarSirenModeObject()

    Specified by:
    :   `getLightbarSirenModeObject` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getLightbarSirenModeObject` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getMaxWheelSteering

    public float getMaxWheelSteering()

    Specified by:
    :   `getMaxWheelSteering` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getMinWheelSkid

    public float getMinWheelSkid()

    Specified by:
    :   `getMinWheelSkid` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isAnyTireMissing

    public boolean isAnyTireMissing()

    Specified by:
    :   `isAnyTireMissing` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### couldCrawlerAttackPassenger

    public boolean couldCrawlerAttackPassenger([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isGoodCar

    public boolean isGoodCar()
  + ### setGoodCar

    public void setGoodCar(boolean isGoodCar)
  + ### getCurrentKey

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getCurrentKey()
  + ### setCurrentKey

    public void setCurrentKey([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") currentKey)
  + ### isInForest

    public boolean isInForest()
  + ### shouldNotHaveLoot

    public boolean shouldNotHaveLoot()
  + ### isInTrafficJam

    public boolean isInTrafficJam()
  + ### getOffroadEfficiency

    public float getOffroadEfficiency()
  + ### applyImpulseFromHitCorpse

    public void applyImpulseFromHitCorpse([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") chr)
  + ### isDoColor

    public boolean isDoColor()
  + ### setDoColor

    public void setDoColor(boolean doColor)
  + ### getBrakeSpeedBetweenUpdate

    public float getBrakeSpeedBetweenUpdate()

    Specified by:
    :   `getBrakeSpeedBetweenUpdate` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in interface `zombie.vehicles.VehiclePartOwner`

    Overrides:
    :   `getSquare` in class `IsoMovingObject`
  + ### setColor

    public void setColor(float value,
    float saturation,
    float hue)
  + ### setColorHSV

    public void setColorHSV(float hue,
    float saturation,
    float value)
  + ### getColorHue

    public float getColorHue()
  + ### getColorSaturation

    public float getColorSaturation()
  + ### getColorValue

    public float getColorValue()
  + ### isRemovedFromWorld

    public boolean isRemovedFromWorld()
  + ### getInsideTemperature

    public float getInsideTemperature()
  + ### getAnimationPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer getAnimationPlayer()
  + ### releaseAnimationPlayers

    public void releaseAnimationPlayers()
  + ### setAddThumpWorldSound

    public void setAddThumpWorldSound(boolean add)
  + ### createImpulse

    public void createImpulse([Vector3f](../../org/joml/Vector3f.html "class in org.joml") vec)
  + ### Thump

    public void Thump([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") thumper,
    int thumpEventCount)

    Specified by:
    :   `Thump` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `Thump` in class `IsoObject`
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `WeaponHit` in class `IsoObject`
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpableFor` in class `IsoObject`
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`

    Overrides:
    :   `getThumpCondition` in class `IsoObject`
  + ### isRegulator

    public boolean isRegulator()
  + ### setRegulator

    public void setRegulator(boolean regulator)
  + ### getRegulatorSpeed

    public float getRegulatorSpeed()
  + ### setRegulatorSpeed

    public void setRegulatorSpeed(float regulatorSpeed)
  + ### getCurrentSpeedForRegulator

    public float getCurrentSpeedForRegulator()
  + ### setVehicleTowing

    public void setVehicleTowing([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleB,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB)
  + ### setVehicleTowedBy

    public void setVehicleTowedBy([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB)
  + ### getVehicleTowing

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") getVehicleTowing()
  + ### getVehicleTowedBy

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") getVehicleTowedBy()
  + ### getTowingPartner

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") getTowingPartner()
  + ### attachmentExist

    public boolean attachmentExist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName)
  + ### getAttachmentLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getAttachmentLocalPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getAttachmentWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getAttachmentWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### setForceBrake

    public void setForceBrake()
  + ### getTowingLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTowingLocalPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getTowedByLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTowedByLocalPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getTowingWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTowingWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getTowedByWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTowedByWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getPlayerTrailerLocalPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPlayerTrailerLocalPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    boolean left,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getPlayerTrailerWorldPos

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getPlayerTrailerWorldPos([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName,
    boolean left,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### drawTowingRope

    private void drawTowingRope()
  + ### drawDirectionLine

    public void drawDirectionLine([Vector2](../iso/Vector2.html "class in zombie.iso") dir,
    float length,
    float r,
    float g,
    float b)
  + ### addPointConstraint

    public void addPointConstraint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleB,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB)
  + ### addPointConstraint

    public void addPointConstraint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleB,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") remote)
  + ### authorizationChanged

    public void authorizationChanged([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### constraintChanged

    public void constraintChanged()
  + ### breakConstraint

    public void breakConstraint(boolean forgetID,
    boolean remote)
  + ### breakConstraintOnServer

    public boolean breakConstraintOnServer()
  + ### beginAttachingTrailer

    public void beginAttachingTrailer()
  + ### stopAttachingTrailer

    public void stopAttachingTrailer()
  + ### checkTrailerVerticalAlignment

    private void checkTrailerVerticalAlignment()
  + ### checkTrailerAttachTime

    private void checkTrailerAttachTime()
  + ### isAttachingTrailer

    public boolean isAttachingTrailer()
  + ### canAttachTrailer

    public boolean canAttachTrailer([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleB,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB)
  + ### canAttachTrailer

    public boolean canAttachTrailer([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicleB,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentA,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentB,
    boolean reconnect)
  + ### tryReconnectToTowedVehicle

    private void tryReconnectToTowedVehicle()
  + ### positionTrailer

    public void positionTrailer([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") trailer)
  + ### getTowAttachmentSelf

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTowAttachmentSelf()
  + ### getTowAttachmentOther

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTowAttachmentOther()
  + ### getVehicleEngineRPM

    public [VehicleEngineRPM](VehicleEngineRPM.html "class in zombie.vehicles") getVehicleEngineRPM()
  + ### isBeingTowedBackwards

    public boolean isBeingTowedBackwards()
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
  + ### getVehicleSounds

    public zombie.vehicleSound.VehicleSounds getVehicleSounds()
  + ### setVehicleSounds

    public void setVehicleSounds(zombie.vehicleSound.VehicleSounds vehicleSounds1)
  + ### setSmashed

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") setSmashed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### setSmashed

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") setSmashed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    boolean flipped)
  + ### isCollided

    public boolean isCollided([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### checkNetworkCollision

    public [BaseVehicle.HitVars](BaseVehicle.HitVars.html "class in zombie.vehicles") checkNetworkCollision([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target)
  + ### onHitLandmine

    public void onHitLandmine([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### onJump

    public void onJump()
  + ### updateNetworkHitByVehicle

    public boolean updateNetworkHitByVehicle([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target)
  + ### getAnimalTrailerSize

    public float getAnimalTrailerSize()
  + ### getAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimals()
  + ### addAnimalFromHandsInTrailer

    public void addAnimalFromHandsInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### addAnimalFromHandsInTrailer

    public void addAnimalFromHandsInTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### addAnimalInTrailer

    public void addAnimalInTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### addAnimalInTrailer

    public void addAnimalInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### recalcAnimalSize

    private void recalcAnimalSize()
  + ### removeAnimalFromTrailer

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") removeAnimalFromTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### replaceGrownAnimalInTrailer

    public void replaceGrownAnimalInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") current,
    [IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") grown)
  + ### getCurrentTotalAnimalSize

    public float getCurrentTotalAnimalSize()
  + ### setCurrentTotalAnimalSize

    public void setCurrentTotalAnimalSize(float totalAnimalSize)
  + ### keyNamerVehicle

    public void keyNamerVehicle([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### keyNamerVehicle

    public static void keyNamerVehicle([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### checkZombieKeyForVehicle

    public boolean checkZombieKeyForVehicle([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### checkZombieKeyForVehicle

    public boolean checkZombieKeyForVehicle([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleType)
  + ### checkForSpecialMatchOne

    public boolean checkForSpecialMatchOne([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") one,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") two,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") three)
  + ### checkForSpecialMatchTwo

    public boolean checkForSpecialMatchTwo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") one,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") two,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") three)
  + ### checkIfGoodVehicleForKey

    public boolean checkIfGoodVehicleForKey()
  + ### trySpawnVehicleKeyOnZombie

    public boolean trySpawnVehicleKeyOnZombie([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### trySpawnVehicleKeyInObject

    public boolean trySpawnVehicleKeyInObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### checkSquareForVehicleKeySpot

    public boolean checkSquareForVehicleKeySpot([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### checkSquareForVehicleKeySpot

    public boolean checkSquareForVehicleKeySpot([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    boolean crashed)
  + ### checkSquareForVehicleKeySpotContainer

    public boolean checkSquareForVehicleKeySpotContainer([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### checkSquareForVehicleKeySpotZombie

    public boolean checkSquareForVehicleKeySpotZombie([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### doKeySandboxSettings

    private static float doKeySandboxSettings(int value)
  + ### forceVehicleDistribution

    public void forceVehicleDistribution([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") distribution)
  + ### canLightSmoke

    public boolean canLightSmoke([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkVehicleFailsToStartWithZombiesTargeting

    private void checkVehicleFailsToStartWithZombiesTargeting()
  + ### checkVehicleStartsWithZombiesTargeting

    private void checkVehicleStartsWithZombiesTargeting()
  + ### getZombieType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getZombieType()
  + ### getRandomZombieType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomZombieType()
  + ### hasZombieType

    public boolean hasZombieType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit)
  + ### getFirstZombieType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFirstZombieType()
  + ### notKillCrops

    public boolean notKillCrops()
  + ### hasLighter

    public boolean hasLighter()
  + ### leftSideFuel

    public boolean leftSideFuel()
  + ### rightSideFuel

    public boolean rightSideFuel()
  + ### isCreated

    public boolean isCreated()
  + ### getTotalContainerItemWeight

    public float getTotalContainerItemWeight()
  + ### isSirening

    public boolean isSirening()
  + ### isDriverGodMode

    private boolean isDriverGodMode()
  + ### getIntersectPoint

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getIntersectPoint([Vector3f](../../org/joml/Vector3f.html "class in org.joml") start,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") end,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") result)
  + ### getIntersectPoint

    private [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getIntersectPoint([Vector3f](../../org/joml/Vector3f.html "class in org.joml") start,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") end,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") extents,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") result)
  + ### getNearestVehiclePart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getNearestVehiclePart(float x,
    float y,
    float z,
    boolean useDestroyed)
  + ### isInArea

    public boolean isInArea([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") chr)
  + ### processRangeHit

    private boolean processRangeHit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    float damage)
  + ### processMeleeHit

    private boolean processMeleeHit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    float damage)
  + ### applyDamageToPart

    private void applyDamageToPart([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [VehiclePart](VehiclePart.html "class in zombie.vehicles") vehiclePart,
    float damage)
  + ### processHit

    public boolean processHit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    float damage)
  + ### getPartByDirection

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartByDirection(float x,
    float y,
    float z)
  + ### buildVehiclePartList

    private void buildVehiclePartList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId,
    float weight,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle.WeightedVehiclePart](BaseVehicle.WeightedVehiclePart.html "class in zombie.vehicles")> weightedVehiclePartArrayList)
  + ### getAnyRandomPart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getAnyRandomPart()
  + ### isGasTakeSide

    private boolean isGasTakeSide([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") side)
  + ### getWeightedRandomSidePart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getWeightedRandomSidePart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") side)
  + ### getWeightedRandomFrontPart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getWeightedRandomFrontPart()
  + ### getWeightedRandomRearPart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getWeightedRandomRearPart()
  + ### getWeightedRandomPart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") getWeightedRandomPart([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseVehicle.WeightedVehiclePart](BaseVehicle.WeightedVehiclePart.html "class in zombie.vehicles")> weightedVehiclePartList)
  + ### canAddAnimalInTrailer

    public boolean canAddAnimalInTrailer([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### canAddAnimalInTrailer

    public boolean canAddAnimalInTrailer([IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") animal)
  + ### isBurnt

    public boolean isBurnt()
  + ### isSmashed

    public boolean isSmashed()
  + ### isBurntOrSmashed

    public boolean isBurntOrSmashed()
  + ### getSpecialKeyRingChance

    public float getSpecialKeyRingChance()
  + ### hasLiveBattery

    public boolean hasLiveBattery()
  + ### setDebugPhysicsRender

    public void setDebugPhysicsRender(boolean addedToWorld)
  + ### testTouchingVehicle

    public boolean testTouchingVehicle([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter,
    zombie.core.physics.RagdollController ragdollController)
  + ### getCurrentOrLastKnownDriver

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCurrentOrLastKnownDriver()
  + ### getSquareForArea

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquareForArea([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") areaId)
  + ### partsClear

    public void partsClear()
  + ### getThrottle

    public float getThrottle()
  + ### validateHitVehicleDistance

    public boolean validateHitVehicleDistance(float playerX,
    float playerY)
  + ### setLocked

    public void setLocked(boolean locked)
  + ### setDoorLocked

    private void setDoorLocked([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    boolean locked)
  + ### shouldRebuildNameCoordCache

    private boolean shouldRebuildNameCoordCache()
  + ### markNameCoordCacheValid

    private void markNameCoordCacheValid()
  + ### layoutPassengerNameCoords

    private int layoutPassengerNameCoords([Vector2](../iso/Vector2.html "class in zombie.iso") anchor)
  + ### centerPassengerNameCoords

    private void centerPassengerNameCoords(int height)
  + ### rebuildNameCoordCache

    private void rebuildNameCoordCache(float zoom)
  + ### findPassenger

    private [BaseVehicle.Passenger](BaseVehicle.Passenger.html "class in zombie.vehicles") findPassenger([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") player)
  + ### getNameCoordForPlayer

    public boolean getNameCoordForPlayer([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") player,
    float zoom,
    [Vector2](../iso/Vector2.html "class in zombie.iso") coord)
  + ### getNameAlignmentForPlayer

    public zombie.ui.TextDrawHorizontal getNameAlignmentForPlayer([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") player)
  + ### getNamePrefixForPlayer

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNamePrefixForPlayer([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") player)