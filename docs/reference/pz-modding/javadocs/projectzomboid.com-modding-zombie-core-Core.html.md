[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Core](Core.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [IS\_DEV](#IS_DEV)
   2. [PZWorldToBulletZScale](#PZWorldToBulletZScale)
   3. [characterHeight](#characterHeight)
   4. [characterRangedAimPointHeight](#characterRangedAimPointHeight)
   5. [characterMeleeAimPointHeight](#characterMeleeAimPointHeight)
   6. [bDemo](#bDemo)
   7. [tutorial](#tutorial)
   8. [dirtyGlobalLightsCount](#dirtyGlobalLightsCount)
   9. [fakefullscreen](#fakefullscreen)
   10. [gameVersion](#gameVersion)
   11. [buildVersion](#buildVersion)
   12. [gitRevisionString](#gitRevisionString)
   13. [steamServerVersion](#steamServerVersion)
   14. [altMoveMethod](#altMoveMethod)
   15. [consoleDotTxtSizeKb](#consoleDotTxtSizeKb)
   16. [objectHighlitedColor](#objectHighlitedColor)
   17. [worldItemHighlightColor](#worldItemHighlightColor)
   18. [workstationHighlitedColor](#workstationHighlitedColor)
   19. [goodHighlitedColor](#goodHighlitedColor)
   20. [badHighlitedColor](#badHighlitedColor)
   21. [flashIsoCursor](#flashIsoCursor)
   22. [targetColor](#targetColor)
   23. [noTargetColor](#noTargetColor)
   24. [accountUsed](#accountUsed)
   25. [options](#options)
   26. [optionByName](#optionByName)
   27. [fakeOptions](#fakeOptions)
   28. [fakeOptionByName](#fakeOptionByName)
   29. [selectedMap](#selectedMap)
   30. [gitSha](#gitSha)
   31. [VERSION\_BUILD\_42](#VERSION_BUILD_42)
   32. [optionReticleMode](#optionReticleMode)
   33. [optionShowAimTexture](#optionShowAimTexture)
   34. [optionShowReticleTexture](#optionShowReticleTexture)
   35. [optionShowValidTargetReticleTexture](#optionShowValidTargetReticleTexture)
   36. [optionAimTextureIndex](#optionAimTextureIndex)
   37. [optionReticleTextureIndex](#optionReticleTextureIndex)
   38. [optionValidTargetReticleTextureIndex](#optionValidTargetReticleTextureIndex)
   39. [optionCrosshairTextureIndex](#optionCrosshairTextureIndex)
   40. [optionMaxCrosshairOffset](#optionMaxCrosshairOffset)
   41. [optionReticleCameraZoom](#optionReticleCameraZoom)
   42. [optionTargetColor](#optionTargetColor)
   43. [optionNoTargetColor](#optionNoTargetColor)
   44. [optionObjectHighlightColor](#optionObjectHighlightColor)
   45. [optionWorldItemHighlightColor](#optionWorldItemHighlightColor)
   46. [optionWorkstationHighlightColor](#optionWorkstationHighlightColor)
   47. [optionGoodHighlightColor](#optionGoodHighlightColor)
   48. [optionBadHighlightColor](#optionBadHighlightColor)
   49. [isoCursorVisibility](#isoCursorVisibility)
   50. [optionShowCursorWhileAiming](#optionShowCursorWhileAiming)
   51. [collideZombies](#collideZombies)
   52. [offscreenBuffer](#offscreenBuffer)
   53. [saveFolder](#saveFolder)
   54. [optionZoom](#optionZoom)
   55. [optionModsEnabled](#optionModsEnabled)
   56. [optionFontSize](#optionFontSize)
   57. [optionMoodleSize](#optionMoodleSize)
   58. [optionSidebarSize](#optionSidebarSize)
   59. [optionActionProgressBarSize](#optionActionProgressBarSize)
   60. [optionContextMenuFont](#optionContextMenuFont)
   61. [optionCodeFontSize](#optionCodeFontSize)
   62. [optionInventoryFont](#optionInventoryFont)
   63. [optionInventoryContainerSize](#optionInventoryContainerSize)
   64. [optionTooltipFont](#optionTooltipFont)
   65. [optionColorblindPatterns](#optionColorblindPatterns)
   66. [optionEnableDyslexicFont](#optionEnableDyslexicFont)
   67. [optionDisableLightningDuringStorms](#optionDisableLightningDuringStorms)
   68. [optionMeasurementFormat](#optionMeasurementFormat)
   69. [optionClockFormat](#optionClockFormat)
   70. [optionClockSize](#optionClockSize)
   71. [optionClock24Hour](#optionClock24Hour)
   72. [optionVsync](#optionVsync)
   73. [optionSoundVolume](#optionSoundVolume)
   74. [optionMusicVolume](#optionMusicVolume)
   75. [optionAmbientVolume](#optionAmbientVolume)
   76. [optionJumpScareVolume](#optionJumpScareVolume)
   77. [optionMusicActionStyle](#optionMusicActionStyle)
   78. [optionMusicLibrary](#optionMusicLibrary)
   79. [optionVoiceEnable](#optionVoiceEnable)
   80. [optionVoiceMode](#optionVoiceMode)
   81. [optionVoiceVadMode](#optionVoiceVadMode)
   82. [optionVoiceAgcMode](#optionVoiceAgcMode)
   83. [optionVoiceRecordDeviceName](#optionVoiceRecordDeviceName)
   84. [optionVoiceVolumeMic](#optionVoiceVolumeMic)
   85. [optionVoiceVolumePlayers](#optionVoiceVolumePlayers)
   86. [optionVehicleEngineVolume](#optionVehicleEngineVolume)
   87. [optionStreamerMode](#optionStreamerMode)
   88. [optionReloadDifficulty](#optionReloadDifficulty)
   89. [optionRackProgress](#optionRackProgress)
   90. [optionBloodDecals](#optionBloodDecals)
   91. [optionFocusloss](#optionFocusloss)
   92. [optionMapViewPause](#optionMapViewPause)
   93. [optionBorderlessWindow](#optionBorderlessWindow)
   94. [optionLockCursorToWindow](#optionLockCursorToWindow)
   95. [optionTextureCompression](#optionTextureCompression)
   96. [optionModelTextureMipmaps](#optionModelTextureMipmaps)
   97. [optionTexture2x](#optionTexture2x)
   98. [optionHighResPlacedItems](#optionHighResPlacedItems)
   99. [optionMaxTextureSize](#optionMaxTextureSize)
   100. [optionMaxVehicleTextureSize](#optionMaxVehicleTextureSize)
   101. [optionScreenFilter](#optionScreenFilter)
   102. [optionZoomLevels1x](#optionZoomLevels1x)
   103. [optionZoomLevels2x](#optionZoomLevels2x)
   104. [optionEnableContentTranslations](#optionEnableContentTranslations)
   105. [optionUiFbo](#optionUiFbo)
   106. [optionUiRenderFps](#optionUiRenderFps)
   107. [optionRadialMenuKeyToggle](#optionRadialMenuKeyToggle)
   108. [optionReloadRadialInstant](#optionReloadRadialInstant)
   109. [optionPanCameraWhileAiming](#optionPanCameraWhileAiming)
   110. [optionPanCameraWhileDriving](#optionPanCameraWhileDriving)
   111. [optionShowChatTimestamp](#optionShowChatTimestamp)
   112. [optionShowChatTitle](#optionShowChatTitle)
   113. [optionChatFontSize](#optionChatFontSize)
   114. [optionMinChatOpaque](#optionMinChatOpaque)
   115. [optionMaxChatOpaque](#optionMaxChatOpaque)
   116. [optionChatFadeTime](#optionChatFadeTime)
   117. [optionChatOpaqueOnFocus](#optionChatOpaqueOnFocus)
   118. [optionTemperatureDisplayCelsius](#optionTemperatureDisplayCelsius)
   119. [optionDoVideoEffects](#optionDoVideoEffects)
   120. [optionDoWindSpriteEffects](#optionDoWindSpriteEffects)
   121. [optionDoDoorSpriteEffects](#optionDoDoorSpriteEffects)
   122. [optionDoContainerOutline](#optionDoContainerOutline)
   123. [optionRenderPrecipIndoors](#optionRenderPrecipIndoors)
   124. [optionPrecipitationSpeedMultiplier](#optionPrecipitationSpeedMultiplier)
   125. [optionAutoProneAtk](#optionAutoProneAtk)
   126. [option3dGroundItem](#option3dGroundItem)
   127. [optionRenderPrecipitation](#optionRenderPrecipitation)
   128. [optionDblTapJogToSprint](#optionDblTapJogToSprint)
   129. [optionMeleeOutline](#optionMeleeOutline)
   130. [optionCycleContainerKey](#optionCycleContainerKey)
   131. [optionDropItemsOnSquareCenter](#optionDropItemsOnSquareCenter)
   132. [optionTimedActionGameSpeedReset](#optionTimedActionGameSpeedReset)
   133. [optionShoulderButtonContainerSwitch](#optionShoulderButtonContainerSwitch)
   134. [optionControllerButtonStyle](#optionControllerButtonStyle)
   135. [optionGamepadBindingPreset](#optionGamepadBindingPreset)
   136. [optionProgressBar](#optionProgressBar)
   137. [optionLanguageName](#optionLanguageName)
   138. [optionSingleContextMenu](#optionSingleContextMenu)
   139. [optionCorpseShadows](#optionCorpseShadows)
   140. [optionSimpleClothingTextures](#optionSimpleClothingTextures)
   141. [optionSimpleWeaponTextures](#optionSimpleWeaponTextures)
   142. [optionAutoDrink](#optionAutoDrink)
   143. [optionAutoRevealPrintMediaMapLocations](#optionAutoRevealPrintMediaMapLocations)
   144. [optionLeaveKeyInIgnition](#optionLeaveKeyInIgnition)
   145. [optionAutoWalkContainer](#optionAutoWalkContainer)
   146. [optionSearchModeOverlayEffect](#optionSearchModeOverlayEffect)
   147. [optionIgnoreProneZombieRange](#optionIgnoreProneZombieRange)
   148. [optionShowItemModInfo](#optionShowItemModInfo)
   149. [optionShowCraftingXp](#optionShowCraftingXp)
   150. [optionShowSurvivalGuide](#optionShowSurvivalGuide)
   151. [optionShowFirstAnimalZoneInfo](#optionShowFirstAnimalZoneInfo)
   152. [optionEnableLeftJoystickRadialMenu](#optionEnableLeftJoystickRadialMenu)
   153. [optionMacosIgnoreMouseWheelAcceleration](#optionMacosIgnoreMouseWheelAcceleration)
   154. [optionMacosMapHorizontalMouseWheelToVertical](#optionMacosMapHorizontalMouseWheelToVertical)
   155. [optionUsePhysicsHitReaction](#optionUsePhysicsHitReaction)
   156. [optionMaxActiveRagdolls](#optionMaxActiveRagdolls)
   157. [optionWorldMapBrightness](#optionWorldMapBrightness)
   158. [optionShowWelcomeMessage](#optionShowWelcomeMessage)
   159. [showPing](#showPing)
   160. [forceSnow](#forceSnow)
   161. [zombieGroupSound](#zombieGroupSound)
   162. [blinkingMoodle](#blinkingMoodle)
   163. [poisonousBerry](#poisonousBerry)
   164. [poisonousMushroom](#poisonousMushroom)
   165. [difficulty](#difficulty)
   166. [tileScale](#tileScale)
   167. [isSelectingAll](#isSelectingAll)
   168. [showYourUsername](#showYourUsername)
   169. [populateServerListOnStart](#populateServerListOnStart)
   170. [mpTextColor](#mpTextColor)
   171. [optionMpTextColor](#optionMpTextColor)
   172. [isAzerty](#isAzerty)
   173. [seenUpdateText](#seenUpdateText)
   174. [toggleToAim](#toggleToAim)
   175. [toggleToRun](#toggleToRun)
   176. [toggleToSprint](#toggleToSprint)
   177. [celsius](#celsius)
   178. [noSave](#noSave)
   179. [showFirstTimeVehicleTutorial](#showFirstTimeVehicleTutorial)
   180. [showFirstTimeWeatherTutorial](#showFirstTimeWeatherTutorial)
   181. [animPopupDone](#animPopupDone)
   182. [modsPopupDone](#modsPopupDone)
   183. [blinkAlpha](#blinkAlpha)
   184. [blinkAlphaIncrease](#blinkAlphaIncrease)
   185. [loadedOptions](#loadedOptions)
   186. [optionsOnStartup](#optionsOnStartup)
   187. [animalCheat](#animalCheat)
   188. [displayPlayerModel](#displayPlayerModel)
   189. [displayCursor](#displayCursor)
   190. [projectionMatrixStack](#projectionMatrixStack)
   191. [modelViewMatrixStack](#modelViewMatrixStack)
   192. [screenFilter](#screenFilter)
   193. [UnitVector3f](#UnitVector3f)
   194. [\_UNIT\_Z](#_UNIT_Z)
   195. [challenge](#challenge)
   196. [width](#width)
   197. [height](#height)
   198. [initialWidth](#initialWidth)
   199. [initialHeight](#initialHeight)
   200. [maxJukeBoxesActive](#maxJukeBoxesActive)
   201. [numJukeBoxesActive](#numJukeBoxesActive)
   202. [gameMode](#gameMode)
   203. [addZombieOnCellLoad](#addZombieOnCellLoad)
   204. [preset](#preset)
   205. [glVersion](#glVersion)
   206. [glMajorVersion](#glMajorVersion)
   207. [core](#core)
   208. [debug](#debug)
   209. [antiCheats](#antiCheats)
   210. [useViewports](#useViewports)
   211. [useGameViewport](#useGameViewport)
   212. [imGui](#imGui)
   213. [currentTextEntryBox](#currentTextEntryBox)
   214. [KEYBINDING\_EMPTY](#KEYBINDING_EMPTY)
   215. [keyMaps](#keyMaps)
   216. [keyBindingByKeyValue](#keyBindingByKeyValue)
   217. [useShaders](#useShaders)
   218. [iPerfSkybox](#iPerfSkybox)
   219. [perfSkyboxNew](#perfSkyboxNew)
   220. [iPerfSkybox\_High](#iPerfSkybox_High)
   221. [iPerfSkybox\_Medium](#iPerfSkybox_Medium)
   222. [iPerfSkybox\_Static](#iPerfSkybox_Static)
   223. [iPerfPuddles](#iPerfPuddles)
   224. [perfPuddlesNew](#perfPuddlesNew)
   225. [iPerfPuddles\_None](#iPerfPuddles_None)
   226. [iPerfPuddles\_GroundOnly](#iPerfPuddles_GroundOnly)
   227. [iPerfPuddles\_GroundWithRuts](#iPerfPuddles_GroundWithRuts)
   228. [iPerfPuddles\_All](#iPerfPuddles_All)
   229. [perfReflections](#perfReflections)
   230. [perfReflectionsNew](#perfReflectionsNew)
   231. [vidMem](#vidMem)
   232. [supportsFbo](#supportsFbo)
   233. [uiRenderAccumulator](#uiRenderAccumulator)
   234. [uiRenderThisFrame](#uiRenderThisFrame)
   235. [version](#version)
   236. [fileversion](#fileversion)
   237. [optionActiveControllerGuids](#optionActiveControllerGuids)
   238. [optionDoneNewSaveFolder](#optionDoneNewSaveFolder)
   239. [optionFogQuality](#optionFogQuality)
   240. [optionViewConeOpacity](#optionViewConeOpacity)
   241. [optionGotNewBelt](#optionGotNewBelt)
   242. [optionLightingFps](#optionLightingFps)
   243. [optionLockFps](#optionLockFps)
   244. [optionPuddlesQuality](#optionPuddlesQuality)
   245. [optionRiversideDone](#optionRiversideDone)
   246. [optionRosewoodSpawnDone](#optionRosewoodSpawnDone)
   247. [optionScreenHeight](#optionScreenHeight)
   248. [optionScreenWidth](#optionScreenWidth)
   249. [optionShowFirstTimeSearchTutorial](#optionShowFirstTimeSearchTutorial)
   250. [optionShowFirstTimeSneakTutorial](#optionShowFirstTimeSneakTutorial)
   251. [optionShownWelcomeMessageVersion](#optionShownWelcomeMessageVersion)
   252. [optionTermsOfServiceVersion](#optionTermsOfServiceVersion)
   253. [optionTieredZombieUpdates](#optionTieredZombieUpdates)
   254. [optionTutorialDone](#optionTutorialDone)
   255. [optionUpdateSneakButton](#optionUpdateSneakButton)
   256. [optionUncappedFps](#optionUncappedFps)
   257. [optionVehiclesWarningShow](#optionVehiclesWarningShow)
   258. [optionWaterQuality](#optionWaterQuality)
   259. [fullScreen](#fullScreen)
   260. [autoZoom](#autoZoom)
   261. [gameMap](#gameMap)
   262. [gameSaveWorld](#gameSaveWorld)
   263. [safeMode](#safeMode)
   264. [safeModeForced](#safeModeForced)
   265. [soundDisabled](#soundDisabled)
   266. [frameStage](#frameStage)
   267. [stack](#stack)
   268. [xx](#xx)
   269. [yy](#yy)
   270. [zz](#zz)
   271. [floatParamMap](#floatParamMap)
   272. [tempMatrix4f](#tempMatrix4f)
   273. [isoAngle](#isoAngle)
   274. [ModelScale](#ModelScale)
   275. [scale](#scale)
   276. [lastStand](#lastStand)
   277. [challengeId](#challengeId)
   278. [exiting](#exiting)
   279. [delayResetLuaActiveMods](#delayResetLuaActiveMods)
   280. [delayResetLuaReason](#delayResetLuaReason)
   281. [rn](#rn)
7. [Constructor Details](#constructor-detail)
   1. [Core()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [newOption(String, ConfigOption, String, String)](#newOption(java.lang.String,zombie.config.ConfigOption,java.lang.String,java.lang.String))
   2. [newOption(String, boolean)](#newOption(java.lang.String,boolean))
   3. [newOption(String, double, double, double)](#newOption(java.lang.String,double,double,double))
   4. [newOption(String, int, int, int)](#newOption(java.lang.String,int,int,int))
   5. [newOption(String, int, int, int, ConfigOption.ConfigOptionOnChangeCallback)](#newOption(java.lang.String,int,int,int,zombie.config.ConfigOption.ConfigOptionOnChangeCallback))
   6. [newOption(String, String, String[])](#newOption(java.lang.String,java.lang.String,java.lang.String%5B%5D))
   7. [newOption(String, String, int)](#newOption(java.lang.String,java.lang.String,int))
   8. [newOption(String, String, ConfigOption.ConfigOptionOnChangeCallback)](#newOption(java.lang.String,java.lang.String,zombie.config.ConfigOption.ConfigOptionOnChangeCallback))
   9. [newFakeOption(String, ConfigOption, String, String)](#newFakeOption(java.lang.String,zombie.config.ConfigOption,java.lang.String,java.lang.String))
   10. [newFakeOption(String, boolean)](#newFakeOption(java.lang.String,boolean))
   11. [newFakeOption(String, double, double, double)](#newFakeOption(java.lang.String,double,double,double))
   12. [newFakeOption(String, int, int, int)](#newFakeOption(java.lang.String,int,int,int))
   13. [newFakeOption(String, String, String[])](#newFakeOption(java.lang.String,java.lang.String,java.lang.String%5B%5D))
   14. [newFakeOption(String, String, int)](#newFakeOption(java.lang.String,java.lang.String,int))
   15. [getOptionCount()](#getOptionCount())
   16. [getOptionByIndex(int)](#getOptionByIndex(int))
   17. [isMultiThread()](#isMultiThread())
   18. [setChallenge(boolean)](#setChallenge(boolean))
   19. [isChallenge()](#isChallenge())
   20. [getChallengeID()](#getChallengeID())
   21. [getOptionTieredZombieUpdates()](#getOptionTieredZombieUpdates())
   22. [setOptionTieredZombieUpdates(boolean)](#setOptionTieredZombieUpdates(boolean))
   23. [setFramerate(int)](#setFramerate(int))
   24. [setMultiThread(boolean)](#setMultiThread(boolean))
   25. [isUseGameViewport()](#isUseGameViewport())
   26. [isImGui()](#isImGui())
   27. [isUseViewports()](#isUseViewports())
   28. [loadedShader()](#loadedShader())
   29. [getGLMajorVersion()](#getGLMajorVersion())
   30. [getUseShaders()](#getUseShaders())
   31. [getPerfSkybox()](#getPerfSkybox())
   32. [getPerfSkyboxOnLoad()](#getPerfSkyboxOnLoad())
   33. [setPerfSkybox(int)](#setPerfSkybox(int))
   34. [getPerfReflections()](#getPerfReflections())
   35. [getPerfReflectionsOnLoad()](#getPerfReflectionsOnLoad())
   36. [getUseOpenGL21()](#getUseOpenGL21())
   37. [setPerfReflections(boolean)](#setPerfReflections(boolean))
   38. [getPerfPuddles()](#getPerfPuddles())
   39. [getPerfPuddlesOnLoad()](#getPerfPuddlesOnLoad())
   40. [setPerfPuddles(int)](#setPerfPuddles(int))
   41. [getVidMem()](#getVidMem())
   42. [setVidMem(int)](#setVidMem(int))
   43. [setUseShaders(boolean)](#setUseShaders(boolean))
   44. [shadersOptionChanged()](#shadersOptionChanged())
   45. [initGlobalShader()](#initGlobalShader())
   46. [initShaders()](#initShaders())
   47. [getGLVersion()](#getGLVersion())
   48. [getGameMode()](#getGameMode())
   49. [setGameMode(String)](#setGameMode(java.lang.String))
   50. [getInstance()](#getInstance())
   51. [getOpenGLVersions()](#getOpenGLVersions())
   52. [getDebug()](#getDebug())
   53. [setFullScreen(boolean)](#setFullScreen(boolean))
   54. [flipPixels(int[], int, int)](#flipPixels(int%5B%5D,int,int))
   55. [TakeScreenshot()](#TakeScreenshot())
   56. [TakeScreenshot(int, int, int)](#TakeScreenshot(int,int,int))
   57. [TakeScreenshot(int, int, int, int, int)](#TakeScreenshot(int,int,int,int,int))
   58. [TakeFullScreenshot(String)](#TakeFullScreenshot(java.lang.String))
   59. [supportNPTTexture()](#supportNPTTexture())
   60. [supportsFBO()](#supportsFBO())
   61. [sharedInit()](#sharedInit())
   62. [MoveMethodToggle()](#MoveMethodToggle())
   63. [EndFrameText(int)](#EndFrameText(int))
   64. [EndFrame(int)](#EndFrame(int))
   65. [EndFrame()](#EndFrame())
   66. [EndFrameUI()](#EndFrameUI())
   67. [UnfocusActiveTextEntryBox()](#UnfocusActiveTextEntryBox())
   68. [getOffscreenWidth(int)](#getOffscreenWidth(int))
   69. [getOffscreenHeight(int)](#getOffscreenHeight(int))
   70. [getOffscreenTrueWidth()](#getOffscreenTrueWidth())
   71. [getOffscreenTrueHeight()](#getOffscreenTrueHeight())
   72. [getScreenHeight()](#getScreenHeight())
   73. [getScreenWidth()](#getScreenWidth())
   74. [setResolutionAndFullScreen(int, int, boolean)](#setResolutionAndFullScreen(int,int,boolean))
   75. [setResolution(String)](#setResolution(java.lang.String))
   76. [loadOptions\_OLD()](#loadOptions_OLD())
   77. [loadOptions()](#loadOptions())
   78. [upgradeOptionName(String, int)](#upgradeOptionName(java.lang.String,int))
   79. [upgradeOptionValue(String, String, int)](#upgradeOptionValue(java.lang.String,java.lang.String,int))
   80. [initOptionsINI()](#initOptionsINI())
   81. [handleNewSaveFolderFormat()](#handleNewSaveFolderFormat())
   82. [isDefaultOptions()](#isDefaultOptions())
   83. [isDedicated()](#isDedicated())
   84. [copyPasteFolders(String)](#copyPasteFolders(java.lang.String))
   85. [searchFolders(File, String)](#searchFolders(java.io.File,java.lang.String))
   86. [copyPasteFile(File, String)](#copyPasteFile(java.io.File,java.lang.String))
   87. [getMyDocumentFolder()](#getMyDocumentFolder())
   88. [saveOptions\_OLD()](#saveOptions_OLD())
   89. [saveOptions()](#saveOptions())
   90. [addFakeOptionsForWriting(ArrayList)](#addFakeOptionsForWriting(java.util.ArrayList))
   91. [setWindowed(boolean)](#setWindowed(boolean))
   92. [isFullScreen()](#isFullScreen())
   93. [getScreenModes()](#getScreenModes())
   94. [setDisplayMode(int, int, boolean)](#setDisplayMode(int,int,boolean))
   95. [setDisplayModeInternal(int, int, boolean)](#setDisplayModeInternal(int,int,boolean))
   96. [isFunctionKey(int)](#isFunctionKey(int))
   97. [isDoingTextEntry()](#isDoingTextEntry())
   98. [updateKeyboardAux(UITextEntryInterface, int)](#updateKeyboardAux(zombie.ui.UITextEntryInterface,int))
   99. [updateKeyboard()](#updateKeyboard())
   100. [quit()](#quit())
   101. [exitToMenu()](#exitToMenu())
   102. [quitToDesktop()](#quitToDesktop())
   103. [supportRes(int, int)](#supportRes(int,int))
   104. [init(int, int)](#init(int,int))
   105. [setupMultiFBO()](#setupMultiFBO())
   106. [setInitialSize()](#setInitialSize())
   107. [setScreenSize(int, int)](#setScreenSize(int,int))
   108. [supportCompressedTextures()](#supportCompressedTextures())
   109. [StartFrame()](#StartFrame())
   110. [StartFrame(int, boolean)](#StartFrame(int,boolean))
   111. [getOffscreenBuffer()](#getOffscreenBuffer())
   112. [getOffscreenBuffer(int)](#getOffscreenBuffer(int))
   113. [setLastRenderedFBO(TextureFBO)](#setLastRenderedFBO(zombie.core.textures.TextureFBO))
   114. [DoStartFrameStuff(int, int, float, int)](#DoStartFrameStuff(int,int,float,int))
   115. [DoStartFrameStuff(int, int, float, int, boolean)](#DoStartFrameStuff(int,int,float,int,boolean))
   116. [DoEndFrameStuffFx(int, int, int)](#DoEndFrameStuffFx(int,int,int))
   117. [DoStartFrameStuffSmartTextureFx(int, int, int)](#DoStartFrameStuffSmartTextureFx(int,int,int))
   118. [DoStartFrameStuffInternal(int, int, float, int, boolean, boolean, boolean)](#DoStartFrameStuffInternal(int,int,float,int,boolean,boolean,boolean))
   119. [ChangeWorldViewport(int, int, int)](#ChangeWorldViewport(int,int,int))
   120. [StartFrameFlipY(int, int, float, int)](#StartFrameFlipY(int,int,float,int))
   121. [DoStartFrameFlipY(int, int, float, int, boolean, boolean, boolean)](#DoStartFrameFlipY(int,int,float,int,boolean,boolean,boolean))
   122. [DoStartFrameNoZoom(int, int, float, int, boolean, boolean, boolean)](#DoStartFrameNoZoom(int,int,float,int,boolean,boolean,boolean))
   123. [DoPushIsoStuff(float, float, float, float, boolean)](#DoPushIsoStuff(float,float,float,float,boolean))
   124. [DoPushIsoStuff2D(float, float, float, float, boolean)](#DoPushIsoStuff2D(float,float,float,float,boolean))
   125. [DoPushIsoParticleStuff(float, float, float)](#DoPushIsoParticleStuff(float,float,float))
   126. [DoPopIsoStuff()](#DoPopIsoStuff())
   127. [DoEndFrameStuff(int, int)](#DoEndFrameStuff(int,int))
   128. [RenderOffScreenBuffer()](#RenderOffScreenBuffer())
   129. [StartFrameText(int)](#StartFrameText(int))
   130. [StartFrameUI()](#StartFrameUI())
   131. [reinitKeyMaps()](#reinitKeyMaps())
   132. [invalidBindingShiftCtrl(Core.KeyBinding)](#invalidBindingShiftCtrl(zombie.core.Core.KeyBinding))
   133. [isKey(String, Integer)](#isKey(java.lang.String,java.lang.Integer))
   134. [getKey(String)](#getKey(java.lang.String))
   135. [getKeyBinding(String)](#getKeyBinding(java.lang.String))
   136. [getKeyBinding(int)](#getKeyBinding(int))
   137. [addKeyBinding(String, int, int, boolean, boolean, boolean)](#addKeyBinding(java.lang.String,int,int,boolean,boolean,boolean))
   138. [getAltKey(String)](#getAltKey(java.lang.String))
   139. [isLastStand()](#isLastStand())
   140. [getVersion()](#getVersion())
   141. [getBulletVersion()](#getBulletVersion())
   142. [getGitSha()](#getGitSha())
   143. [getGitRevision()](#getGitRevision())
   144. [getGitRevisionString()](#getGitRevisionString())
   145. [getGameVersion()](#getGameVersion())
   146. [getBreakModGameVersion()](#getBreakModGameVersion())
   147. [getSteamServerVersion()](#getSteamServerVersion())
   148. [DoFrameReady()](#DoFrameReady())
   149. [getCurrentPlayerZoom()](#getCurrentPlayerZoom())
   150. [getZoom(int)](#getZoom(int))
   151. [getNextZoom(int, int)](#getNextZoom(int,int))
   152. [getMinZoom()](#getMinZoom())
   153. [getMaxZoom()](#getMaxZoom())
   154. [doZoomScroll(int, int)](#doZoomScroll(int,int))
   155. [getSaveFolder()](#getSaveFolder())
   156. [getOptionZoom()](#getOptionZoom())
   157. [setOptionZoom(boolean)](#setOptionZoom(boolean))
   158. [zoomOptionChanged(boolean)](#zoomOptionChanged(boolean))
   159. [zoomLevelsChanged()](#zoomLevelsChanged())
   160. [isZoomEnabled()](#isZoomEnabled())
   161. [setZoomEnalbed(boolean)](#setZoomEnalbed(boolean))
   162. [initFBOs()](#initFBOs())
   163. [getAutoZoom(int)](#getAutoZoom(int))
   164. [setAutoZoom(int, boolean)](#setAutoZoom(int,boolean))
   165. [getOptionVSync()](#getOptionVSync())
   166. [setOptionVSync(boolean)](#setOptionVSync(boolean))
   167. [getOptionSoundVolume()](#getOptionSoundVolume())
   168. [getRealOptionSoundVolume()](#getRealOptionSoundVolume())
   169. [setOptionSoundVolume(int)](#setOptionSoundVolume(int))
   170. [getOptionMusicVolume()](#getOptionMusicVolume())
   171. [setOptionMusicVolume(int)](#setOptionMusicVolume(int))
   172. [getOptionAmbientVolume()](#getOptionAmbientVolume())
   173. [setOptionAmbientVolume(int)](#setOptionAmbientVolume(int))
   174. [getOptionJumpScareVolume()](#getOptionJumpScareVolume())
   175. [setOptionJumpScareVolume(int)](#setOptionJumpScareVolume(int))
   176. [getOptionMusicActionStyle()](#getOptionMusicActionStyle())
   177. [setOptionMusicActionStyle(int)](#setOptionMusicActionStyle(int))
   178. [getOptionMusicLibrary()](#getOptionMusicLibrary())
   179. [setOptionMusicLibrary(int)](#setOptionMusicLibrary(int))
   180. [getOptionVehicleEngineVolume()](#getOptionVehicleEngineVolume())
   181. [setOptionVehicleEngineVolume(int)](#setOptionVehicleEngineVolume(int))
   182. [getOptionStreamerMode()](#getOptionStreamerMode())
   183. [setOptionStreamerMode(boolean)](#setOptionStreamerMode(boolean))
   184. [getOptionVoiceEnable()](#getOptionVoiceEnable())
   185. [setOptionVoiceEnable(boolean)](#setOptionVoiceEnable(boolean))
   186. [setOptionVoiceEnable(boolean, boolean)](#setOptionVoiceEnable(boolean,boolean))
   187. [getOptionVoiceMode()](#getOptionVoiceMode())
   188. [setOptionVoiceMode(int)](#setOptionVoiceMode(int))
   189. [getOptionVoiceVADMode()](#getOptionVoiceVADMode())
   190. [setOptionVoiceVADMode(int)](#setOptionVoiceVADMode(int))
   191. [getOptionVoiceAGCMode()](#getOptionVoiceAGCMode())
   192. [setOptionVoiceAGCMode(int)](#setOptionVoiceAGCMode(int))
   193. [getOptionVoiceVolumeMic()](#getOptionVoiceVolumeMic())
   194. [setOptionVoiceVolumeMic(int)](#setOptionVoiceVolumeMic(int))
   195. [getOptionVoiceVolumePlayers()](#getOptionVoiceVolumePlayers())
   196. [setOptionVoiceVolumePlayers(int)](#setOptionVoiceVolumePlayers(int))
   197. [getOptionVoiceRecordDeviceName()](#getOptionVoiceRecordDeviceName())
   198. [setOptionVoiceRecordDeviceName(String)](#setOptionVoiceRecordDeviceName(java.lang.String))
   199. [getOptionVoiceRecordDevice()](#getOptionVoiceRecordDevice())
   200. [setOptionVoiceRecordDevice(int)](#setOptionVoiceRecordDevice(int))
   201. [getMicVolumeIndicator()](#getMicVolumeIndicator())
   202. [getMicVolumeError()](#getMicVolumeError())
   203. [getServerVOIPEnable()](#getServerVOIPEnable())
   204. [setTestingMicrophone(boolean)](#setTestingMicrophone(boolean))
   205. [getOptionReloadDifficulty()](#getOptionReloadDifficulty())
   206. [setOptionReloadDifficulty(int)](#setOptionReloadDifficulty(int))
   207. [getOptionRackProgress()](#getOptionRackProgress())
   208. [setOptionRackProgress(boolean)](#setOptionRackProgress(boolean))
   209. [getOptionFontSize()](#getOptionFontSize())
   210. [setOptionFontSize(int)](#setOptionFontSize(int))
   211. [getOptionFontSizeReal()](#getOptionFontSizeReal())
   212. [getOptionMoodleSize()](#getOptionMoodleSize())
   213. [setOptionMoodleSize(int)](#setOptionMoodleSize(int))
   214. [getOptionSidebarSize()](#getOptionSidebarSize())
   215. [setOptionSidebarSize(int)](#setOptionSidebarSize(int))
   216. [getOptionActionProgressBarSize()](#getOptionActionProgressBarSize())
   217. [setOptionActionProgressBarSize(int)](#setOptionActionProgressBarSize(int))
   218. [getOptionContextMenuFont()](#getOptionContextMenuFont())
   219. [setOptionContextMenuFont(String)](#setOptionContextMenuFont(java.lang.String))
   220. [getOptionCodeFontSize()](#getOptionCodeFontSize())
   221. [setOptionCodeFontSize(String)](#setOptionCodeFontSize(java.lang.String))
   222. [getOptionInventoryFont()](#getOptionInventoryFont())
   223. [setOptionInventoryFont(String)](#setOptionInventoryFont(java.lang.String))
   224. [getOptionInventoryContainerSize()](#getOptionInventoryContainerSize())
   225. [setOptionInventoryContainerSize(int)](#setOptionInventoryContainerSize(int))
   226. [getOptionTooltipFont()](#getOptionTooltipFont())
   227. [setOptionTooltipFont(String)](#setOptionTooltipFont(java.lang.String))
   228. [getOptionMeasurementFormat()](#getOptionMeasurementFormat())
   229. [setOptionMeasurementFormat(String)](#setOptionMeasurementFormat(java.lang.String))
   230. [getOptionClockFormat()](#getOptionClockFormat())
   231. [getOptionClockSize()](#getOptionClockSize())
   232. [setOptionClockFormat(int)](#setOptionClockFormat(int))
   233. [setOptionClockSize(int)](#setOptionClockSize(int))
   234. [getOptionClock24Hour()](#getOptionClock24Hour())
   235. [setOptionClock24Hour(boolean)](#setOptionClock24Hour(boolean))
   236. [getOptionModsEnabled()](#getOptionModsEnabled())
   237. [setOptionModsEnabled(boolean)](#setOptionModsEnabled(boolean))
   238. [getOptionBloodDecals()](#getOptionBloodDecals())
   239. [setOptionBloodDecals(int)](#setOptionBloodDecals(int))
   240. [getOptionFocusloss()](#getOptionFocusloss())
   241. [setOptionFocusloss(boolean)](#setOptionFocusloss(boolean))
   242. [getOptionMapViewPause()](#getOptionMapViewPause())
   243. [setOptionMapViewPause(boolean)](#setOptionMapViewPause(boolean))
   244. [getOptionBorderlessWindow()](#getOptionBorderlessWindow())
   245. [setOptionBorderlessWindow(boolean)](#setOptionBorderlessWindow(boolean))
   246. [getOptionLockCursorToWindow()](#getOptionLockCursorToWindow())
   247. [setOptionLockCursorToWindow(boolean)](#setOptionLockCursorToWindow(boolean))
   248. [allowOptionTextureCompression()](#allowOptionTextureCompression())
   249. [getOptionTextureCompression()](#getOptionTextureCompression())
   250. [setOptionTextureCompression(boolean)](#setOptionTextureCompression(boolean))
   251. [getOptionTexture2x()](#getOptionTexture2x())
   252. [setOptionTexture2x(boolean)](#setOptionTexture2x(boolean))
   253. [getOptionHighResPlacedItems()](#getOptionHighResPlacedItems())
   254. [setOptionHighResPlacedItems(boolean)](#setOptionHighResPlacedItems(boolean))
   255. [getOptionMaxTextureSize()](#getOptionMaxTextureSize())
   256. [setOptionMaxTextureSize(int)](#setOptionMaxTextureSize(int))
   257. [getOptionMaxVehicleTextureSize()](#getOptionMaxVehicleTextureSize())
   258. [setOptionMaxVehicleTextureSize(int)](#setOptionMaxVehicleTextureSize(int))
   259. [getMaxTextureSizeFromFlags(int)](#getMaxTextureSizeFromFlags(int))
   260. [getMaxTextureSizeFromOption(int)](#getMaxTextureSizeFromOption(int))
   261. [getMaxTextureSize()](#getMaxTextureSize())
   262. [getMaxVehicleTextureSize()](#getMaxVehicleTextureSize())
   263. [getOptionModelTextureMipmaps()](#getOptionModelTextureMipmaps())
   264. [setOptionModelTextureMipmaps(boolean)](#setOptionModelTextureMipmaps(boolean))
   265. [getOptionZoomLevels1x()](#getOptionZoomLevels1x())
   266. [setOptionZoomLevels1x(String)](#setOptionZoomLevels1x(java.lang.String))
   267. [getOptionZoomLevels2x()](#getOptionZoomLevels2x())
   268. [setOptionZoomLevels2x(String)](#setOptionZoomLevels2x(java.lang.String))
   269. [getDefaultZoomLevels()](#getDefaultZoomLevels())
   270. [getOptionScreenFilter()](#getOptionScreenFilter())
   271. [setOptionScreenFilter(String)](#setOptionScreenFilter(java.lang.String))
   272. [getScreenFilter()](#getScreenFilter())
   273. [setOptionActiveController(int, boolean)](#setOptionActiveController(int,boolean))
   274. [getOptionActiveController(String)](#getOptionActiveController(java.lang.String))
   275. [isOptionShowChatTimestamp()](#isOptionShowChatTimestamp())
   276. [setOptionShowChatTimestamp(boolean)](#setOptionShowChatTimestamp(boolean))
   277. [isOptionShowChatTitle()](#isOptionShowChatTitle())
   278. [getOptionChatFontSize()](#getOptionChatFontSize())
   279. [setOptionChatFontSize(String)](#setOptionChatFontSize(java.lang.String))
   280. [setOptionShowChatTitle(boolean)](#setOptionShowChatTitle(boolean))
   281. [getOptionMinChatOpaque()](#getOptionMinChatOpaque())
   282. [setOptionMinChatOpaque(float)](#setOptionMinChatOpaque(float))
   283. [getOptionMaxChatOpaque()](#getOptionMaxChatOpaque())
   284. [setOptionMaxChatOpaque(float)](#setOptionMaxChatOpaque(float))
   285. [getOptionChatFadeTime()](#getOptionChatFadeTime())
   286. [setOptionChatFadeTime(float)](#setOptionChatFadeTime(float))
   287. [getOptionChatOpaqueOnFocus()](#getOptionChatOpaqueOnFocus())
   288. [setOptionChatOpaqueOnFocus(boolean)](#setOptionChatOpaqueOnFocus(boolean))
   289. [getOptionTemperatureDisplayCelsius()](#getOptionTemperatureDisplayCelsius())
   290. [getOptionUIFBO()](#getOptionUIFBO())
   291. [setOptionUIFBO(boolean)](#setOptionUIFBO(boolean))
   292. [getOptionMeleeOutline()](#getOptionMeleeOutline())
   293. [setOptionMeleeOutline(boolean)](#setOptionMeleeOutline(boolean))
   294. [getOptionUIRenderFPS()](#getOptionUIRenderFPS())
   295. [setOptionUIRenderFPS(int)](#setOptionUIRenderFPS(int))
   296. [setOptionRadialMenuKeyToggle(boolean)](#setOptionRadialMenuKeyToggle(boolean))
   297. [getOptionRadialMenuKeyToggle()](#getOptionRadialMenuKeyToggle())
   298. [setOptionReloadRadialInstant(boolean)](#setOptionReloadRadialInstant(boolean))
   299. [getOptionReloadRadialInstant()](#getOptionReloadRadialInstant())
   300. [setOptionPanCameraWhileAiming(boolean)](#setOptionPanCameraWhileAiming(boolean))
   301. [getOptionPanCameraWhileAiming()](#getOptionPanCameraWhileAiming())
   302. [setOptionPanCameraWhileDriving(boolean)](#setOptionPanCameraWhileDriving(boolean))
   303. [getOptionPanCameraWhileDriving()](#getOptionPanCameraWhileDriving())
   304. [getOptionCycleContainerKey()](#getOptionCycleContainerKey())
   305. [setOptionCycleContainerKey(String)](#setOptionCycleContainerKey(java.lang.String))
   306. [getOptionDropItemsOnSquareCenter()](#getOptionDropItemsOnSquareCenter())
   307. [setOptionDropItemsOnSquareCenter(boolean)](#setOptionDropItemsOnSquareCenter(boolean))
   308. [getOptionTimedActionGameSpeedReset()](#getOptionTimedActionGameSpeedReset())
   309. [setOptionTimedActionGameSpeedReset(boolean)](#setOptionTimedActionGameSpeedReset(boolean))
   310. [getOptionShoulderButtonContainerSwitch()](#getOptionShoulderButtonContainerSwitch())
   311. [setOptionShoulderButtonContainerSwitch(int)](#setOptionShoulderButtonContainerSwitch(int))
   312. [getOptionControllerButtonStyle()](#getOptionControllerButtonStyle())
   313. [setOptionControllerButtonStyle(int)](#setOptionControllerButtonStyle(int))
   314. [onOptionControllerButtonStyleChanged(ConfigOption)](#onOptionControllerButtonStyleChanged(zombie.config.ConfigOption))
   315. [getOptionControllerButtonStyleString()](#getOptionControllerButtonStyleString())
   316. [setOptionGamepadBindingPreset(String)](#setOptionGamepadBindingPreset(java.lang.String))
   317. [onOptionGamepadBindingPresetChanged(ConfigOption)](#onOptionGamepadBindingPresetChanged(zombie.config.ConfigOption))
   318. [getOptionGamepadBindingPreset()](#getOptionGamepadBindingPreset())
   319. [getOptionSingleContextMenu(int)](#getOptionSingleContextMenu(int))
   320. [setOptionSingleContextMenu(int, boolean)](#setOptionSingleContextMenu(int,boolean))
   321. [getOptionAutoDrink()](#getOptionAutoDrink())
   322. [setOptionAutoDrink(boolean)](#setOptionAutoDrink(boolean))
   323. [getOptionAutoRevealPrintMediaMapLocations()](#getOptionAutoRevealPrintMediaMapLocations())
   324. [setOptionAutoRevealPrintMediaMapLocations(boolean)](#setOptionAutoRevealPrintMediaMapLocations(boolean))
   325. [getOptionAutoWalkContainer()](#getOptionAutoWalkContainer())
   326. [setOptionAutoWalkContainer(boolean)](#setOptionAutoWalkContainer(boolean))
   327. [getOptionCorpseShadows()](#getOptionCorpseShadows())
   328. [setOptionCorpseShadows(boolean)](#setOptionCorpseShadows(boolean))
   329. [getOptionLeaveKeyInIgnition()](#getOptionLeaveKeyInIgnition())
   330. [setOptionLeaveKeyInIgnition(boolean)](#setOptionLeaveKeyInIgnition(boolean))
   331. [getOptionSearchModeOverlayEffect()](#getOptionSearchModeOverlayEffect())
   332. [setOptionSearchModeOverlayEffect(int)](#setOptionSearchModeOverlayEffect(int))
   333. [getOptionSimpleClothingTextures()](#getOptionSimpleClothingTextures())
   334. [setOptionSimpleClothingTextures(int)](#setOptionSimpleClothingTextures(int))
   335. [isOptionSimpleClothingTextures(boolean)](#isOptionSimpleClothingTextures(boolean))
   336. [getOptionSimpleWeaponTextures()](#getOptionSimpleWeaponTextures())
   337. [setOptionSimpleWeaponTextures(boolean)](#setOptionSimpleWeaponTextures(boolean))
   338. [getOptionIgnoreProneZombieRange()](#getOptionIgnoreProneZombieRange())
   339. [setOptionIgnoreProneZombieRange(int)](#setOptionIgnoreProneZombieRange(int))
   340. [getIgnoreProneZombieRange()](#getIgnoreProneZombieRange())
   341. [readPerPlayerBoolean(String, boolean[])](#readPerPlayerBoolean(java.lang.String,boolean%5B%5D))
   342. [getPerPlayerBooleanString(boolean[])](#getPerPlayerBooleanString(boolean%5B%5D))
   343. [ResetLua(boolean, String)](#ResetLua(boolean,java.lang.String))
   344. [ResetLua(String, String)](#ResetLua(java.lang.String,java.lang.String))
   345. [DelayResetLua(String, String)](#DelayResetLua(java.lang.String,java.lang.String))
   346. [CheckDelayResetLua()](#CheckDelayResetLua())
   347. [isShowPing()](#isShowPing())
   348. [setShowPing(boolean)](#setShowPing(boolean))
   349. [isForceSnow()](#isForceSnow())
   350. [setForceSnow(boolean)](#setForceSnow(boolean))
   351. [isZombieGroupSound()](#isZombieGroupSound())
   352. [setZombieGroupSound(boolean)](#setZombieGroupSound(boolean))
   353. [getBlinkingMoodle()](#getBlinkingMoodle())
   354. [setBlinkingMoodle(String)](#setBlinkingMoodle(java.lang.String))
   355. [isTutorialDone()](#isTutorialDone())
   356. [setTutorialDone(boolean)](#setTutorialDone(boolean))
   357. [isVehiclesWarningShow()](#isVehiclesWarningShow())
   358. [setVehiclesWarningShow(boolean)](#setVehiclesWarningShow(boolean))
   359. [initPoisonousBerry()](#initPoisonousBerry())
   360. [initPoisonousMushroom()](#initPoisonousMushroom())
   361. [getPoisonousBerry()](#getPoisonousBerry())
   362. [setPoisonousBerry(String)](#setPoisonousBerry(java.lang.String))
   363. [getPoisonousMushroom()](#getPoisonousMushroom())
   364. [setPoisonousMushroom(String)](#setPoisonousMushroom(java.lang.String))
   365. [isDoneNewSaveFolder()](#isDoneNewSaveFolder())
   366. [setDoneNewSaveFolder(boolean)](#setDoneNewSaveFolder(boolean))
   367. [getTileScale()](#getTileScale())
   368. [isSelectingAll()](#isSelectingAll())
   369. [setIsSelectingAll(boolean)](#setIsSelectingAll(boolean))
   370. [getContentTranslationsEnabled()](#getContentTranslationsEnabled())
   371. [setContentTranslationsEnabled(boolean)](#setContentTranslationsEnabled(boolean))
   372. [isShowYourUsername()](#isShowYourUsername())
   373. [setShowYourUsername(boolean)](#setShowYourUsername(boolean))
   374. [isPopulateServerListOnStart()](#isPopulateServerListOnStart())
   375. [setPopulateServerListOnStart(boolean)](#setPopulateServerListOnStart(boolean))
   376. [getMpTextColor()](#getMpTextColor())
   377. [setMpTextColor(ColorInfo)](#setMpTextColor(zombie.core.textures.ColorInfo))
   378. [isAzerty()](#isAzerty())
   379. [setAzerty(boolean)](#setAzerty(boolean))
   380. [getObjectHighlitedColor()](#getObjectHighlitedColor())
   381. [setObjectHighlitedColor(ColorInfo)](#setObjectHighlitedColor(zombie.core.textures.ColorInfo))
   382. [getWorldItemHighlightColor()](#getWorldItemHighlightColor())
   383. [setWorldItemHighlightColor(ColorInfo)](#setWorldItemHighlightColor(zombie.core.textures.ColorInfo))
   384. [getGoodHighlitedColor()](#getGoodHighlitedColor())
   385. [setGoodHighlitedColor(ColorInfo)](#setGoodHighlitedColor(zombie.core.textures.ColorInfo))
   386. [getBadHighlitedColor()](#getBadHighlitedColor())
   387. [setBadHighlitedColor(ColorInfo)](#setBadHighlitedColor(zombie.core.textures.ColorInfo))
   388. [getOptionColorblindPatterns()](#getOptionColorblindPatterns())
   389. [setOptionColorblindPatterns(boolean)](#setOptionColorblindPatterns(boolean))
   390. [getOptionEnableDyslexicFont()](#getOptionEnableDyslexicFont())
   391. [setOptionEnableDyslexicFont(boolean)](#setOptionEnableDyslexicFont(boolean))
   392. [getOptionDisableLightningDuringStorms()](#getOptionDisableLightningDuringStorms())
   393. [setOptionDisableLightningDuringStorms(boolean)](#setOptionDisableLightningDuringStorms(boolean))
   394. [getSeenUpdateText()](#getSeenUpdateText())
   395. [setSeenUpdateText(String)](#setSeenUpdateText(java.lang.String))
   396. [isToggleToAim()](#isToggleToAim())
   397. [setToggleToAim(boolean)](#setToggleToAim(boolean))
   398. [isToggleToRun()](#isToggleToRun())
   399. [setToggleToRun(boolean)](#setToggleToRun(boolean))
   400. [getXAngle(int, float)](#getXAngle(int,float))
   401. [getYAngle(int, float)](#getYAngle(int,float))
   402. [isCelsius()](#isCelsius())
   403. [setCelsius(boolean)](#setCelsius(boolean))
   404. [isInDebug()](#isInDebug())
   405. [isRiversideDone()](#isRiversideDone())
   406. [setRiversideDone(boolean)](#setRiversideDone(boolean))
   407. [isNoSave()](#isNoSave())
   408. [setNoSave(boolean)](#setNoSave(boolean))
   409. [isShowFirstTimeVehicleTutorial()](#isShowFirstTimeVehicleTutorial())
   410. [setShowFirstTimeVehicleTutorial(boolean)](#setShowFirstTimeVehicleTutorial(boolean))
   411. [getOptionDisplayAsCelsius()](#getOptionDisplayAsCelsius())
   412. [setOptionDisplayAsCelsius(boolean)](#setOptionDisplayAsCelsius(boolean))
   413. [isShowFirstTimeWeatherTutorial()](#isShowFirstTimeWeatherTutorial())
   414. [setShowFirstTimeWeatherTutorial(boolean)](#setShowFirstTimeWeatherTutorial(boolean))
   415. [getOptionDoVideoEffects()](#getOptionDoVideoEffects())
   416. [setOptionDoVideoEffects(boolean)](#setOptionDoVideoEffects(boolean))
   417. [getOptionDoWindSpriteEffects()](#getOptionDoWindSpriteEffects())
   418. [setOptionDoWindSpriteEffects(boolean)](#setOptionDoWindSpriteEffects(boolean))
   419. [getOptionDoDoorSpriteEffects()](#getOptionDoDoorSpriteEffects())
   420. [setOptionDoDoorSpriteEffects(boolean)](#setOptionDoDoorSpriteEffects(boolean))
   421. [getOptionDoContainerOutline()](#getOptionDoContainerOutline())
   422. [setOptionDoContainerOutline(boolean)](#setOptionDoContainerOutline(boolean))
   423. [setOptionUpdateSneakButton(boolean)](#setOptionUpdateSneakButton(boolean))
   424. [getOptionUpdateSneakButton()](#getOptionUpdateSneakButton())
   425. [isShowFirstTimeSneakTutorial()](#isShowFirstTimeSneakTutorial())
   426. [setShowFirstTimeSneakTutorial(boolean)](#setShowFirstTimeSneakTutorial(boolean))
   427. [getShownWelcomeMessageVersion()](#getShownWelcomeMessageVersion())
   428. [setShownWelcomeMessageVersion(double)](#setShownWelcomeMessageVersion(double))
   429. [isShowFirstTimeSearchTutorial()](#isShowFirstTimeSearchTutorial())
   430. [setShowFirstTimeSearchTutorial(boolean)](#setShowFirstTimeSearchTutorial(boolean))
   431. [getTermsOfServiceVersion()](#getTermsOfServiceVersion())
   432. [setTermsOfServiceVersion(int)](#setTermsOfServiceVersion(int))
   433. [setOptiondblTapJogToSprint(boolean)](#setOptiondblTapJogToSprint(boolean))
   434. [isOptiondblTapJogToSprint()](#isOptiondblTapJogToSprint())
   435. [isToggleToSprint()](#isToggleToSprint())
   436. [setToggleToSprint(boolean)](#setToggleToSprint(boolean))
   437. [getIsoCursorVisibility()](#getIsoCursorVisibility())
   438. [setIsoCursorVisibility(int)](#setIsoCursorVisibility(int))
   439. [getOptionShowCursorWhileAiming()](#getOptionShowCursorWhileAiming())
   440. [setOptionShowCursorWhileAiming(boolean)](#setOptionShowCursorWhileAiming(boolean))
   441. [gotNewBelt()](#gotNewBelt())
   442. [setGotNewBelt(boolean)](#setGotNewBelt(boolean))
   443. [setAnimPopupDone(boolean)](#setAnimPopupDone(boolean))
   444. [isAnimPopupDone()](#isAnimPopupDone())
   445. [setModsPopupDone(boolean)](#setModsPopupDone(boolean))
   446. [isModsPopupDone()](#isModsPopupDone())
   447. [isRenderPrecipIndoors()](#isRenderPrecipIndoors())
   448. [setRenderPrecipIndoors(boolean)](#setRenderPrecipIndoors(boolean))
   449. [getOptionPrecipitationSpeedMultiplier()](#getOptionPrecipitationSpeedMultiplier())
   450. [setOptionPrecipitationSpeedMultiplier(float)](#setOptionPrecipitationSpeedMultiplier(float))
   451. [isCollideZombies()](#isCollideZombies())
   452. [setCollideZombies(boolean)](#setCollideZombies(boolean))
   453. [isFlashIsoCursor()](#isFlashIsoCursor())
   454. [setFlashIsoCursor(boolean)](#setFlashIsoCursor(boolean))
   455. [isOptionProgressBar()](#isOptionProgressBar())
   456. [setOptionProgressBar(boolean)](#setOptionProgressBar(boolean))
   457. [setOptionLanguageName(String)](#setOptionLanguageName(java.lang.String))
   458. [getOptionLanguageName()](#getOptionLanguageName())
   459. [getOptionRenderPrecipitation()](#getOptionRenderPrecipitation())
   460. [setOptionRenderPrecipitation(int)](#setOptionRenderPrecipitation(int))
   461. [setOptionAutoProneAtk(boolean)](#setOptionAutoProneAtk(boolean))
   462. [isOptionAutoProneAtk()](#isOptionAutoProneAtk())
   463. [setOption3DGroundItem(boolean)](#setOption3DGroundItem(boolean))
   464. [isOption3DGroundItem()](#isOption3DGroundItem())
   465. [getOptionOnStartup(String)](#getOptionOnStartup(java.lang.String))
   466. [setOptionOnStartup(String, Object)](#setOptionOnStartup(java.lang.String,java.lang.Object))
   467. [countMissing3DItems()](#countMissing3DItems())
   468. [getOptionShowItemModInfo()](#getOptionShowItemModInfo())
   469. [setOptionShowItemModInfo(boolean)](#setOptionShowItemModInfo(boolean))
   470. [getOptionShowCraftingXP()](#getOptionShowCraftingXP())
   471. [setOptionShowCraftingXP(boolean)](#setOptionShowCraftingXP(boolean))
   472. [getOptionShowSurvivalGuide()](#getOptionShowSurvivalGuide())
   473. [setOptionShowSurvivalGuide(boolean)](#setOptionShowSurvivalGuide(boolean))
   474. [getOptionShowFirstAnimalZoneInfo()](#getOptionShowFirstAnimalZoneInfo())
   475. [setOptionShowFirstAnimalZoneInfo(boolean)](#setOptionShowFirstAnimalZoneInfo(boolean))
   476. [getOptionEnableLeftJoystickRadialMenu()](#getOptionEnableLeftJoystickRadialMenu())
   477. [setOptionEnableLeftJoystickRadialMenu(boolean)](#setOptionEnableLeftJoystickRadialMenu(boolean))
   478. [getOptionMacOSIgnoreMouseWheelAcceleration()](#getOptionMacOSIgnoreMouseWheelAcceleration())
   479. [setOptionMacOSIgnoreMouseWheelAcceleration(boolean)](#setOptionMacOSIgnoreMouseWheelAcceleration(boolean))
   480. [getOptionMacOSMapHorizontalMouseWheelToVertical()](#getOptionMacOSMapHorizontalMouseWheelToVertical())
   481. [setOptionMacOSMapHorizontalMouseWheelToVertical(boolean)](#setOptionMacOSMapHorizontalMouseWheelToVertical(boolean))
   482. [getVersionNumber()](#getVersionNumber())
   483. [setAnimalCheat(boolean)](#setAnimalCheat(boolean))
   484. [setDisplayPlayerModel(boolean)](#setDisplayPlayerModel(boolean))
   485. [isDisplayPlayerModel()](#isDisplayPlayerModel())
   486. [setDisplayCursor(boolean)](#setDisplayCursor(boolean))
   487. [isDisplayCursor()](#isDisplayCursor())
   488. [getOptionShowAimTexture()](#getOptionShowAimTexture())
   489. [setOptionShowAimTexture(boolean)](#setOptionShowAimTexture(boolean))
   490. [getOptionShowReticleTexture()](#getOptionShowReticleTexture())
   491. [setOptionShowReticleTexture(boolean)](#setOptionShowReticleTexture(boolean))
   492. [getOptionShowValidTargetReticleTexture()](#getOptionShowValidTargetReticleTexture())
   493. [setOptionShowValidTargetReticleTexture(boolean)](#setOptionShowValidTargetReticleTexture(boolean))
   494. [getOptionReticleMode()](#getOptionReticleMode())
   495. [setOptionReticleMode(int)](#setOptionReticleMode(int))
   496. [setOptionAimTextureIndex(int)](#setOptionAimTextureIndex(int))
   497. [getOptionAimTextureIndex()](#getOptionAimTextureIndex())
   498. [setOptionReticleTextureIndex(int)](#setOptionReticleTextureIndex(int))
   499. [getOptionReticleTextureIndex()](#getOptionReticleTextureIndex())
   500. [setOptionValidTargetReticleTextureIndex(int)](#setOptionValidTargetReticleTextureIndex(int))
   501. [getOptionValidTargetReticleTextureIndex()](#getOptionValidTargetReticleTextureIndex())
   502. [setOptionCrosshairTextureIndex(int)](#setOptionCrosshairTextureIndex(int))
   503. [getOptionCrosshairTextureIndex()](#getOptionCrosshairTextureIndex())
   504. [getTargetColor()](#getTargetColor())
   505. [setTargetColor(ColorInfo)](#setTargetColor(zombie.core.textures.ColorInfo))
   506. [getNoTargetColor()](#getNoTargetColor())
   507. [setNoTargetColor(ColorInfo)](#setNoTargetColor(zombie.core.textures.ColorInfo))
   508. [getOptionMaxCrosshairOffset()](#getOptionMaxCrosshairOffset())
   509. [setOptionMaxCrosshairOffset(int)](#setOptionMaxCrosshairOffset(int))
   510. [getOptionReticleCameraZoom()](#getOptionReticleCameraZoom())
   511. [setOptionReticleCameraZoom(boolean)](#setOptionReticleCameraZoom(boolean))
   512. [getIsoCursorAlpha()](#getIsoCursorAlpha())
   513. [debugOutputMissingItemSpawn()](#debugOutputMissingItemSpawn())
   514. [debugOutputMissingCLothingSpawn()](#debugOutputMissingCLothingSpawn())
   515. [debugOutputMissingSpawn(String, String)](#debugOutputMissingSpawn(java.lang.String,java.lang.String))
   516. [getClothingSpawnString(File)](#getClothingSpawnString(java.io.File))
   517. [getClothingStrings(File)](#getClothingStrings(java.io.File))
   518. [getSelectedMap()](#getSelectedMap())
   519. [setSelectedMap(String)](#setSelectedMap(java.lang.String))
   520. [getConsoleDotTxtSizeKB()](#getConsoleDotTxtSizeKB())
   521. [setConsoleDotTxtSizeKB(int)](#setConsoleDotTxtSizeKB(int))
   522. [setConsoleDotTxtSizeKB(String)](#setConsoleDotTxtSizeKB(java.lang.String))
   523. [getOptionUsePhysicsHitReaction()](#getOptionUsePhysicsHitReaction())
   524. [setOptionUsePhysicsHitReaction(boolean)](#setOptionUsePhysicsHitReaction(boolean))
   525. [getMaxActiveRagdolls()](#getMaxActiveRagdolls())
   526. [setMaxActiveRagdolls(int)](#setMaxActiveRagdolls(int))
   527. [getOptionWorldMapBrightness()](#getOptionWorldMapBrightness())
   528. [setOptionWorldMapBrightness(double)](#setOptionWorldMapBrightness(double))
   529. [getOptionShowWelcomeMessage()](#getOptionShowWelcomeMessage())
   530. [setOptionShowWelcomeMessage(boolean)](#setOptionShowWelcomeMessage(boolean))
   531. [getAccountUsed()](#getAccountUsed())
   532. [setAccountUsed(Account)](#setAccountUsed(zombie.network.Account))
   533. [isDevMode()](#isDevMode())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Core
==========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.Core

---

public final class Core
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final record`

  `Core.KeyBinding`

  `static final class`

  `Core.KeyBindingList`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final org.lwjgl.util.vector.Vector3f`

  `_UNIT_Z`

  `private Account`

  `accountUsed`

  `static boolean`

  `addZombieOnCellLoad`

  `static boolean`

  `altMoveMethod`

  `boolean`

  `animalCheat`

  `private boolean`

  `animPopupDone`

  `static boolean`

  `antiCheats`

  `private final ArrayConfigOption`

  `autoZoom`

  `private final ColorInfo`

  `badHighlitedColor`

  `static final boolean`

  `bDemo`

  `static float`

  `blinkAlpha`

  `static boolean`

  `blinkAlphaIncrease`

  `private String`

  `blinkingMoodle`

  `private static final int`

  `buildVersion`

  `private final BooleanConfigOption`

  `celsius`

  `private boolean`

  `challenge`

  `static String`

  `challengeId`

  `static final float`

  `characterHeight`

  `static final float`

  `characterMeleeAimPointHeight`

  `static final float`

  `characterRangedAimPointHeight`

  `private boolean`

  `collideZombies`

  `private int`

  `consoleDotTxtSizeKb`

  `private static final Core`

  `core`

  `static zombie.ui.UITextEntryInterface`

  `currentTextEntryBox`

  `static boolean`

  `debug`

  `private String`

  `delayResetLuaActiveMods`

  `private String`

  `delayResetLuaReason`

  `private static String`

  `difficulty`

  `static int`

  `dirtyGlobalLightsCount`

  `boolean`

  `displayCursor`

  `boolean`

  `displayPlayerModel`

  `static boolean`

  `exiting`

  `private static final boolean`

  `fakefullscreen`

  `private final HashMap<String, ConfigOption>`

  `fakeOptionByName`

  `private final ArrayList<ConfigOption>`

  `fakeOptions`

  `int`

  `fileversion`

  `private boolean`

  `flashIsoCursor`

  `final HashMap<Integer,Float>`

  `floatParamMap`

  `private boolean`

  `forceSnow`

  `int`

  `frameStage`

  `private final BooleanConfigOption`

  `fullScreen`

  `static String`

  `gameMap`

  `static String`

  `gameMode`

  `static String`

  `gameSaveWorld`

  `private static final GameVersion`

  `gameVersion`

  `private String`

  `gitRevisionString`

  `private String`

  `gitSha`

  `private static int`

  `glMajorVersion`

  `private static String`

  `glVersion`

  `private final ColorInfo`

  `goodHighlitedColor`

  `static int`

  `height`

  `static boolean`

  `imGui`

  `static float`

  `initialHeight`

  `static float`

  `initialWidth`

  `private int`

  `iPerfPuddles`

  `static final int`

  `iPerfPuddles_All`

  `static final int`

  `iPerfPuddles_GroundOnly`

  `static final int`

  `iPerfPuddles_GroundWithRuts`

  `static final int`

  `iPerfPuddles_None`

  `private int`

  `iPerfSkybox`

  `static final int`

  `iPerfSkybox_High`

  `static final int`

  `iPerfSkybox_Medium`

  `static final int`

  `iPerfSkybox_Static`

  `static boolean`

  `IS_DEV`

  `private boolean`

  `isAzerty`

  `private static final float`

  `isoAngle`

  `private final IntegerConfigOption`

  `isoCursorVisibility`

  `private boolean`

  `isSelectingAll`

  `static final Core.KeyBinding`

  `KEYBINDING_EMPTY`

  `private final gnu.trove.map.hash.TIntObjectHashMap<Core.KeyBindingList>`

  `keyBindingByKeyValue`

  `private Map<String, Core.KeyBinding>`

  `keyMaps`

  `static boolean`

  `lastStand`

  `private boolean`

  `loadedOptions`

  `static int`

  `maxJukeBoxesActive`

  `static final float`

  `ModelScale`

  `final zombie.core.opengl.MatrixStack`

  `modelViewMatrixStack`

  `private boolean`

  `modsPopupDone`

  `private ColorInfo`

  `mpTextColor`

  `private boolean`

  `noSave`

  `private final ColorInfo`

  `noTargetColor`

  `static int`

  `numJukeBoxesActive`

  `private final ColorInfo`

  `objectHighlitedColor`

  `final zombie.core.textures.MultiTextureFBO2`

  `offscreenBuffer`

  `private final BooleanConfigOption`

  `option3dGroundItem`

  `private final IntegerConfigOption`

  `optionActionProgressBarSize`

  `private final ArrayConfigOption`

  `optionActiveControllerGuids`

  `private final IntegerConfigOption`

  `optionAimTextureIndex`

  `private final IntegerConfigOption`

  `optionAmbientVolume`

  `private final BooleanConfigOption`

  `optionAutoDrink`

  `private final BooleanConfigOption`

  `optionAutoProneAtk`

  `private final BooleanConfigOption`

  `optionAutoRevealPrintMediaMapLocations`

  `private final BooleanConfigOption`

  `optionAutoWalkContainer`

  `private final ArrayConfigOption`

  `optionBadHighlightColor`

  `private final IntegerConfigOption`

  `optionBloodDecals`

  `private final BooleanConfigOption`

  `optionBorderlessWindow`

  `private final HashMap<String, ConfigOption>`

  `optionByName`

  `private final DoubleConfigOption`

  `optionChatFadeTime`

  `private final StringConfigOption`

  `optionChatFontSize`

  `private final BooleanConfigOption`

  `optionChatOpaqueOnFocus`

  `private final BooleanConfigOption`

  `optionClock24Hour`

  `private final IntegerConfigOption`

  `optionClockFormat`

  `private final IntegerConfigOption`

  `optionClockSize`

  `private final StringConfigOption`

  `optionCodeFontSize`

  `private final BooleanConfigOption`

  `optionColorblindPatterns`

  `private final StringConfigOption`

  `optionContextMenuFont`

  `private final IntegerConfigOption`

  `optionControllerButtonStyle`

  `private final BooleanConfigOption`

  `optionCorpseShadows`

  `private final IntegerConfigOption`

  `optionCrosshairTextureIndex`

  `private final StringConfigOption`

  `optionCycleContainerKey`

  `private final BooleanConfigOption`

  `optionDblTapJogToSprint`

  `private final BooleanConfigOption`

  `optionDisableLightningDuringStorms`

  `private final BooleanConfigOption`

  `optionDoContainerOutline`

  `private final BooleanConfigOption`

  `optionDoDoorSpriteEffects`

  `private final BooleanConfigOption`

  `optionDoneNewSaveFolder`

  `private final BooleanConfigOption`

  `optionDoVideoEffects`

  `private final BooleanConfigOption`

  `optionDoWindSpriteEffects`

  `private final BooleanConfigOption`

  `optionDropItemsOnSquareCenter`

  `private final BooleanConfigOption`

  `optionEnableContentTranslations`

  `private final BooleanConfigOption`

  `optionEnableDyslexicFont`

  `private final BooleanConfigOption`

  `optionEnableLeftJoystickRadialMenu`

  `private final BooleanConfigOption`

  `optionFocusloss`

  `private final IntegerConfigOption`

  `optionFogQuality`

  `private final IntegerConfigOption`

  `optionFontSize`

  `private final StringConfigOption`

  `optionGamepadBindingPreset`

  `private final ArrayConfigOption`

  `optionGoodHighlightColor`

  `private final BooleanConfigOption`

  `optionGotNewBelt`

  `private final BooleanConfigOption`

  `optionHighResPlacedItems`

  `private final IntegerConfigOption`

  `optionIgnoreProneZombieRange`

  `private final IntegerConfigOption`

  `optionInventoryContainerSize`

  `private final StringConfigOption`

  `optionInventoryFont`

  `private final IntegerConfigOption`

  `optionJumpScareVolume`

  `private final StringConfigOption`

  `optionLanguageName`

  `private final BooleanConfigOption`

  `optionLeaveKeyInIgnition`

  `private final IntegerConfigOption`

  `optionLightingFps`

  `private final BooleanConfigOption`

  `optionLockCursorToWindow`

  `private final IntegerConfigOption`

  `optionLockFps`

  `private final BooleanConfigOption`

  `optionMacosIgnoreMouseWheelAcceleration`

  `private final BooleanConfigOption`

  `optionMacosMapHorizontalMouseWheelToVertical`

  `private final BooleanConfigOption`

  `optionMapViewPause`

  `private final IntegerConfigOption`

  `optionMaxActiveRagdolls`

  `private final DoubleConfigOption`

  `optionMaxChatOpaque`

  `private final IntegerConfigOption`

  `optionMaxCrosshairOffset`

  `private final IntegerConfigOption`

  `optionMaxTextureSize`

  `private final IntegerConfigOption`

  `optionMaxVehicleTextureSize`

  `private final StringConfigOption`

  `optionMeasurementFormat`

  `private final BooleanConfigOption`

  `optionMeleeOutline`

  `private final DoubleConfigOption`

  `optionMinChatOpaque`

  `private final BooleanConfigOption`

  `optionModelTextureMipmaps`

  `static boolean`

  `optionModsEnabled`

  `private final IntegerConfigOption`

  `optionMoodleSize`

  `private final ArrayConfigOption`

  `optionMpTextColor`

  `private final IntegerConfigOption`

  `optionMusicActionStyle`

  `private final IntegerConfigOption`

  `optionMusicLibrary`

  `private final IntegerConfigOption`

  `optionMusicVolume`

  `private final ArrayConfigOption`

  `optionNoTargetColor`

  `private final ArrayConfigOption`

  `optionObjectHighlightColor`

  `private final BooleanConfigOption`

  `optionPanCameraWhileAiming`

  `private final BooleanConfigOption`

  `optionPanCameraWhileDriving`

  `private final DoubleConfigOption`

  `optionPrecipitationSpeedMultiplier`

  `private final BooleanConfigOption`

  `optionProgressBar`

  `private final IntegerConfigOption`

  `optionPuddlesQuality`

  `private final BooleanConfigOption`

  `optionRackProgress`

  `private final BooleanConfigOption`

  `optionRadialMenuKeyToggle`

  `private final IntegerConfigOption`

  `optionReloadDifficulty`

  `private final BooleanConfigOption`

  `optionReloadRadialInstant`

  `private final BooleanConfigOption`

  `optionRenderPrecipIndoors`

  `private final IntegerConfigOption`

  `optionRenderPrecipitation`

  `private final BooleanConfigOption`

  `optionReticleCameraZoom`

  `private final IntegerConfigOption`

  `optionReticleMode`

  `private final IntegerConfigOption`

  `optionReticleTextureIndex`

  `private final BooleanConfigOption`

  `optionRiversideDone`

  `private final BooleanConfigOption`

  `optionRosewoodSpawnDone`

  `private final ArrayList<ConfigOption>`

  `options`

  `private final StringConfigOption`

  `optionScreenFilter`

  `private final IntegerConfigOption`

  `optionScreenHeight`

  `private final IntegerConfigOption`

  `optionScreenWidth`

  `private final IntegerConfigOption`

  `optionSearchModeOverlayEffect`

  `private final IntegerConfigOption`

  `optionShoulderButtonContainerSwitch`

  `private final BooleanConfigOption`

  `optionShowAimTexture`

  `private final BooleanConfigOption`

  `optionShowChatTimestamp`

  `private final BooleanConfigOption`

  `optionShowChatTitle`

  `private final BooleanConfigOption`

  `optionShowCraftingXp`

  `private final BooleanConfigOption`

  `optionShowCursorWhileAiming`

  `private final BooleanConfigOption`

  `optionShowFirstAnimalZoneInfo`

  `private final BooleanConfigOption`

  `optionShowFirstTimeSearchTutorial`

  `private final BooleanConfigOption`

  `optionShowFirstTimeSneakTutorial`

  `private final BooleanConfigOption`

  `optionShowItemModInfo`

  `private final DoubleConfigOption`

  `optionShownWelcomeMessageVersion`

  `private final BooleanConfigOption`

  `optionShowReticleTexture`

  `private final BooleanConfigOption`

  `optionShowSurvivalGuide`

  `private final BooleanConfigOption`

  `optionShowValidTargetReticleTexture`

  `private final BooleanConfigOption`

  `optionShowWelcomeMessage`

  `private final IntegerConfigOption`

  `optionSidebarSize`

  `private final IntegerConfigOption`

  `optionSimpleClothingTextures`

  `private final BooleanConfigOption`

  `optionSimpleWeaponTextures`

  `private final ArrayConfigOption`

  `optionSingleContextMenu`

  `private static final HashMap<String,Object>`

  `optionsOnStartup`

  `private final IntegerConfigOption`

  `optionSoundVolume`

  `private final BooleanConfigOption`

  `optionStreamerMode`

  `private final ArrayConfigOption`

  `optionTargetColor`

  `private final BooleanConfigOption`

  `optionTemperatureDisplayCelsius`

  `private final IntegerConfigOption`

  `optionTermsOfServiceVersion`

  `private final BooleanConfigOption`

  `optionTexture2x`

  `private final BooleanConfigOption`

  `optionTextureCompression`

  `private final BooleanConfigOption`

  `optionTieredZombieUpdates`

  `private final BooleanConfigOption`

  `optionTimedActionGameSpeedReset`

  `private final StringConfigOption`

  `optionTooltipFont`

  `private final BooleanConfigOption`

  `optionTutorialDone`

  `private final BooleanConfigOption`

  `optionUiFbo`

  `private final IntegerConfigOption`

  `optionUiRenderFps`

  `private final BooleanConfigOption`

  `optionUncappedFps`

  `private final BooleanConfigOption`

  `optionUpdateSneakButton`

  `private final BooleanConfigOption`

  `optionUsePhysicsHitReaction`

  `private final IntegerConfigOption`

  `optionValidTargetReticleTextureIndex`

  `private final IntegerConfigOption`

  `optionVehicleEngineVolume`

  `private final BooleanConfigOption`

  `optionVehiclesWarningShow`

  `private final IntegerConfigOption`

  `optionViewConeOpacity`

  `private final IntegerConfigOption`

  `optionVoiceAgcMode`

  `private final BooleanConfigOption`

  `optionVoiceEnable`

  `private final IntegerConfigOption`

  `optionVoiceMode`

  `private final StringConfigOption`

  `optionVoiceRecordDeviceName`

  `private final IntegerConfigOption`

  `optionVoiceVadMode`

  `private final IntegerConfigOption`

  `optionVoiceVolumeMic`

  `private final IntegerConfigOption`

  `optionVoiceVolumePlayers`

  `private final BooleanConfigOption`

  `optionVsync`

  `private final IntegerConfigOption`

  `optionWaterQuality`

  `private final ArrayConfigOption`

  `optionWorkstationHighlightColor`

  `private final ArrayConfigOption`

  `optionWorldItemHighlightColor`

  `private final DoubleConfigOption`

  `optionWorldMapBrightness`

  `private final BooleanConfigOption`

  `optionZoom`

  `private final ArrayConfigOption`

  `optionZoomLevels1x`

  `private final ArrayConfigOption`

  `optionZoomLevels2x`

  `private final IntegerConfigOption`

  `perfPuddlesNew`

  `private boolean`

  `perfReflections`

  `private final BooleanConfigOption`

  `perfReflectionsNew`

  `private final IntegerConfigOption`

  `perfSkyboxNew`

  `private String`

  `poisonousBerry`

  `private String`

  `poisonousMushroom`

  `private final BooleanConfigOption`

  `populateServerListOnStart`

  `static String`

  `preset`

  `final zombie.core.opengl.MatrixStack`

  `projectionMatrixStack`

  `static final float`

  `PZWorldToBulletZScale`

  `private final String`

  `rn`

  `static boolean`

  `safeMode`

  `static boolean`

  `safeModeForced`

  `private String`

  `saveFolder`

  `static final float`

  `scale`

  `private int`

  `screenFilter`

  `private final StringConfigOption`

  `seenUpdateText`

  `private String`

  `selectedMap`

  `private boolean`

  `showFirstTimeVehicleTutorial`

  `private boolean`

  `showFirstTimeWeatherTutorial`

  `private boolean`

  `showPing`

  `private final BooleanConfigOption`

  `showYourUsername`

  `static boolean`

  `soundDisabled`

  `private int`

  `stack`

  `String`

  `steamServerVersion`

  `private boolean`

  `supportsFbo`

  `private final ColorInfo`

  `targetColor`

  `private final org.joml.Matrix4f`

  `tempMatrix4f`

  `static int`

  `tileScale`

  `private final BooleanConfigOption`

  `toggleToAim`

  `private final BooleanConfigOption`

  `toggleToRun`

  `private final BooleanConfigOption`

  `toggleToSprint`

  `static boolean`

  `tutorial`

  `float`

  `uiRenderAccumulator`

  `boolean`

  `uiRenderThisFrame`

  `static final org.lwjgl.util.vector.Vector3f`

  `UnitVector3f`

  `static boolean`

  `useGameViewport`

  `final boolean`

  `useShaders`

  `static boolean`

  `useViewports`

  `int`

  `version`

  `private final int`

  `VERSION_BUILD_42`

  `int`

  `vidMem`

  `static int`

  `width`

  `private final ColorInfo`

  `workstationHighlitedColor`

  `private final ColorInfo`

  `worldItemHighlightColor`

  `static int`

  `xx`

  `static int`

  `yy`

  `private boolean`

  `zombieGroupSound`

  `static int`

  `zz`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Core()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addFakeOptionsForWriting(ArrayList<ConfigOption> options)`

  `void`

  `addKeyBinding(String keyName,
  int key,
  int altKey,
  boolean shift,
  boolean ctrl,
  boolean alt)`

  `boolean`

  `allowOptionTextureCompression()`

  `void`

  `ChangeWorldViewport(int w,
  int h,
  int player)`

  `void`

  `CheckDelayResetLua()`

  `private void`

  `copyPasteFile(File file,
  String relative)`

  `private void`

  `copyPasteFolders(String dir)`

  `void`

  `countMissing3DItems()`

  `String`

  `debugOutputMissingCLothingSpawn()`

  `String`

  `debugOutputMissingItemSpawn()`

  `String`

  `debugOutputMissingSpawn(String directory,
  String category)`

  `void`

  `DelayResetLua(String activeMods,
  String reason)`

  `void`

  `DoEndFrameStuff(int w,
  int h)`

  `void`

  `DoEndFrameStuffFx(int w,
  int h,
  int player)`

  `void`

  `DoFrameReady()`

  `void`

  `DoPopIsoStuff()`

  `void`

  `DoPushIsoParticleStuff(float ox,
  float oy,
  float oz)`

  `void`

  `DoPushIsoStuff(float ox,
  float oy,
  float oz,
  float useangle,
  boolean vehicle)`

  `void`

  `DoPushIsoStuff2D(float ox,
  float oy,
  float oz,
  float useangle,
  boolean vehicle)`

  `private void`

  `DoStartFrameFlipY(int w,
  int h,
  float zoom,
  int player,
  boolean isTextFrame,
  boolean isFx,
  boolean isSmartTexture)`

  `void`

  `DoStartFrameNoZoom(int w,
  int h,
  float zoom,
  int player,
  boolean isTextFrame,
  boolean isFx,
  boolean isSmartTexture)`

  `void`

  `DoStartFrameStuff(int w,
  int h,
  float zoom,
  int player)`

  `void`

  `DoStartFrameStuff(int w,
  int h,
  float zoom,
  int player,
  boolean isTextFrame)`

  `private void`

  `DoStartFrameStuffInternal(int w,
  int h,
  float zoom,
  int player,
  boolean isTextFrame,
  boolean isFx,
  boolean isSmartTexture)`

  `void`

  `DoStartFrameStuffSmartTextureFx(int w,
  int h,
  int player)`

  `void`

  `doZoomScroll(int playerIndex,
  int del)`

  `void`

  `EndFrame()`

  `void`

  `EndFrame(int nPlayer)`

  `void`

  `EndFrameText(int nPlayer)`

  `void`

  `EndFrameUI()`

  `void`

  `exitToMenu()`

  `static int[]`

  `flipPixels(int[] imgPixels,
  int imgw,
  int imgh)`

  `Account`

  `getAccountUsed()`

  `int`

  `getAltKey(String keyName)`

  `boolean`

  `getAutoZoom(int playerIndex)`

  `ColorInfo`

  `getBadHighlitedColor()`

  `String`

  `getBlinkingMoodle()`

  `GameVersion`

  `getBreakModGameVersion()`

  `String`

  `getBulletVersion()`

  `String`

  `getChallengeID()`

  `private static ArrayList<String>`

  `getClothingSpawnString(File scriptFolder)`

  `private static ArrayList<String>`

  `getClothingStrings(File scriptFolder)`

  `int`

  `getConsoleDotTxtSizeKB()`

  `boolean`

  `getContentTranslationsEnabled()`

  `float`

  `getCurrentPlayerZoom()`

  `boolean`

  `getDebug()`

  `ArrayList<Integer>`

  `getDefaultZoomLevels()`

  `String`

  `getGameMode()`

  `GameVersion`

  `getGameVersion()`

  `String`

  `getGitRevision()`

  `static String`

  `getGitRevisionString()`

  `String`

  `getGitSha()`

  `static int`

  `getGLMajorVersion()`

  `static String`

  `getGLVersion()`

  `ColorInfo`

  `getGoodHighlitedColor()`

  `float`

  `getIgnoreProneZombieRange()`

  `static Core`

  `getInstance()`

  `float`

  `getIsoCursorAlpha()`

  `int`

  `getIsoCursorVisibility()`

  `int`

  `getKey(String keyName)`

  `Core.KeyBinding`

  `getKeyBinding(int keyId)`

  `Core.KeyBinding`

  `getKeyBinding(String keyName)`

  `int`

  `getMaxActiveRagdolls()`

  `int`

  `getMaxTextureSize()`

  `int`

  `getMaxTextureSizeFromFlags(int flags)`

  `int`

  `getMaxTextureSizeFromOption(int option)`

  `int`

  `getMaxVehicleTextureSize()`

  `float`

  `getMaxZoom()`

  `boolean`

  `getMicVolumeError()`

  `int`

  `getMicVolumeIndicator()`

  `float`

  `getMinZoom()`

  `ColorInfo`

  `getMpTextColor()`

  `static String`

  `getMyDocumentFolder()`

  `float`

  `getNextZoom(int playerIndex,
  int del)`

  `ColorInfo`

  `getNoTargetColor()`

  `ColorInfo`

  `getObjectHighlitedColor()`

  `zombie.core.textures.TextureFBO`

  `getOffscreenBuffer()`

  `zombie.core.textures.TextureFBO`

  `getOffscreenBuffer(int nPlayer)`

  `int`

  `getOffscreenHeight(int playerIndex)`

  `int`

  `getOffscreenTrueHeight()`

  `int`

  `getOffscreenTrueWidth()`

  `int`

  `getOffscreenWidth(int playerIndex)`

  `static void`

  `getOpenGLVersions()`

  `int`

  `getOptionActionProgressBarSize()`

  `boolean`

  `getOptionActiveController(String guid)`

  `int`

  `getOptionAimTextureIndex()`

  `int`

  `getOptionAmbientVolume()`

  `boolean`

  `getOptionAutoDrink()`

  `boolean`

  `getOptionAutoRevealPrintMediaMapLocations()`

  `boolean`

  `getOptionAutoWalkContainer()`

  `int`

  `getOptionBloodDecals()`

  `boolean`

  `getOptionBorderlessWindow()`

  `ConfigOption`

  `getOptionByIndex(int index)`

  `float`

  `getOptionChatFadeTime()`

  `String`

  `getOptionChatFontSize()`

  `boolean`

  `getOptionChatOpaqueOnFocus()`

  `boolean`

  `getOptionClock24Hour()`

  `int`

  `getOptionClockFormat()`

  `int`

  `getOptionClockSize()`

  `String`

  `getOptionCodeFontSize()`

  `boolean`

  `getOptionColorblindPatterns()`

  `String`

  `getOptionContextMenuFont()`

  `int`

  `getOptionControllerButtonStyle()`

  `String`

  `getOptionControllerButtonStyleString()`

  `boolean`

  `getOptionCorpseShadows()`

  `int`

  `getOptionCount()`

  `int`

  `getOptionCrosshairTextureIndex()`

  `String`

  `getOptionCycleContainerKey()`

  `boolean`

  `getOptionDisableLightningDuringStorms()`

  `boolean`

  `getOptionDisplayAsCelsius()`

  `boolean`

  `getOptionDoContainerOutline()`

  `boolean`

  `getOptionDoDoorSpriteEffects()`

  `boolean`

  `getOptionDoVideoEffects()`

  `boolean`

  `getOptionDoWindSpriteEffects()`

  `boolean`

  `getOptionDropItemsOnSquareCenter()`

  `boolean`

  `getOptionEnableDyslexicFont()`

  `boolean`

  `getOptionEnableLeftJoystickRadialMenu()`

  `boolean`

  `getOptionFocusloss()`

  `int`

  `getOptionFontSize()`

  `int`

  `getOptionFontSizeReal()`

  `String`

  `getOptionGamepadBindingPreset()`

  `boolean`

  `getOptionHighResPlacedItems()`

  `int`

  `getOptionIgnoreProneZombieRange()`

  `int`

  `getOptionInventoryContainerSize()`

  `String`

  `getOptionInventoryFont()`

  `int`

  `getOptionJumpScareVolume()`

  `String`

  `getOptionLanguageName()`

  `boolean`

  `getOptionLeaveKeyInIgnition()`

  `boolean`

  `getOptionLockCursorToWindow()`

  `boolean`

  `getOptionMacOSIgnoreMouseWheelAcceleration()`

  `boolean`

  `getOptionMacOSMapHorizontalMouseWheelToVertical()`

  `boolean`

  `getOptionMapViewPause()`

  `float`

  `getOptionMaxChatOpaque()`

  `int`

  `getOptionMaxCrosshairOffset()`

  `int`

  `getOptionMaxTextureSize()`

  `int`

  `getOptionMaxVehicleTextureSize()`

  `String`

  `getOptionMeasurementFormat()`

  `boolean`

  `getOptionMeleeOutline()`

  `float`

  `getOptionMinChatOpaque()`

  `boolean`

  `getOptionModelTextureMipmaps()`

  `boolean`

  `getOptionModsEnabled()`

  `int`

  `getOptionMoodleSize()`

  `int`

  `getOptionMusicActionStyle()`

  `int`

  `getOptionMusicLibrary()`

  `int`

  `getOptionMusicVolume()`

  `Object`

  `getOptionOnStartup(String name)`

  `boolean`

  `getOptionPanCameraWhileAiming()`

  `boolean`

  `getOptionPanCameraWhileDriving()`

  `float`

  `getOptionPrecipitationSpeedMultiplier()`

  `boolean`

  `getOptionRackProgress()`

  `boolean`

  `getOptionRadialMenuKeyToggle()`

  `int`

  `getOptionReloadDifficulty()`

  `boolean`

  `getOptionReloadRadialInstant()`

  `int`

  `getOptionRenderPrecipitation()`

  `boolean`

  `getOptionReticleCameraZoom()`

  `int`

  `getOptionReticleMode()`

  `int`

  `getOptionReticleTextureIndex()`

  `String`

  `getOptionScreenFilter()`

  `int`

  `getOptionSearchModeOverlayEffect()`

  `int`

  `getOptionShoulderButtonContainerSwitch()`

  `boolean`

  `getOptionShowAimTexture()`

  `boolean`

  `getOptionShowCraftingXP()`

  `boolean`

  `getOptionShowCursorWhileAiming()`

  `boolean`

  `getOptionShowFirstAnimalZoneInfo()`

  `boolean`

  `getOptionShowItemModInfo()`

  `boolean`

  `getOptionShowReticleTexture()`

  `boolean`

  `getOptionShowSurvivalGuide()`

  `boolean`

  `getOptionShowValidTargetReticleTexture()`

  `boolean`

  `getOptionShowWelcomeMessage()`

  `int`

  `getOptionSidebarSize()`

  `int`

  `getOptionSimpleClothingTextures()`

  `boolean`

  `getOptionSimpleWeaponTextures()`

  `boolean`

  `getOptionSingleContextMenu(int playerIndex)`

  `int`

  `getOptionSoundVolume()`

  `boolean`

  `getOptionStreamerMode()`

  `boolean`

  `getOptionTemperatureDisplayCelsius()`

  `boolean`

  `getOptionTexture2x()`

  `boolean`

  `getOptionTextureCompression()`

  `boolean`

  `getOptionTieredZombieUpdates()`

  `boolean`

  `getOptionTimedActionGameSpeedReset()`

  `String`

  `getOptionTooltipFont()`

  `boolean`

  `getOptionUIFBO()`

  `int`

  `getOptionUIRenderFPS()`

  `boolean`

  `getOptionUpdateSneakButton()`

  `boolean`

  `getOptionUsePhysicsHitReaction()`

  `int`

  `getOptionValidTargetReticleTextureIndex()`

  `int`

  `getOptionVehicleEngineVolume()`

  `int`

  `getOptionVoiceAGCMode()`

  `boolean`

  `getOptionVoiceEnable()`

  `int`

  `getOptionVoiceMode()`

  `int`

  `getOptionVoiceRecordDevice()`

  `String`

  `getOptionVoiceRecordDeviceName()`

  `int`

  `getOptionVoiceVADMode()`

  `int`

  `getOptionVoiceVolumeMic()`

  `int`

  `getOptionVoiceVolumePlayers()`

  `boolean`

  `getOptionVSync()`

  `double`

  `getOptionWorldMapBrightness()`

  `boolean`

  `getOptionZoom()`

  `String`

  `getOptionZoomLevels1x()`

  `String`

  `getOptionZoomLevels2x()`

  `int`

  `getPerfPuddles()`

  `int`

  `getPerfPuddlesOnLoad()`

  `boolean`

  `getPerfReflections()`

  `boolean`

  `getPerfReflectionsOnLoad()`

  `int`

  `getPerfSkybox()`

  `int`

  `getPerfSkyboxOnLoad()`

  `private String`

  `getPerPlayerBooleanString(boolean[] flags)`

  `String`

  `getPoisonousBerry()`

  `String`

  `getPoisonousMushroom()`

  `float`

  `getRealOptionSoundVolume()`

  `String`

  `getSaveFolder()`

  `int`

  `getScreenFilter()`

  `int`

  `getScreenHeight()`

  `se.krka.kahlua.vm.KahluaTable`

  `getScreenModes()`

  `int`

  `getScreenWidth()`

  `String`

  `getSeenUpdateText()`

  `String`

  `getSelectedMap()`

  `boolean`

  `getServerVOIPEnable()`

  `double`

  `getShownWelcomeMessageVersion()`

  `String`

  `getSteamServerVersion()`

  `ColorInfo`

  `getTargetColor()`

  `int`

  `getTermsOfServiceVersion()`

  `static int`

  `getTileScale()`

  `boolean`

  `getUseOpenGL21()`

  `boolean`

  `getUseShaders()`

  `String`

  `getVersion()`

  `String`

  `getVersionNumber()`

  `int`

  `getVidMem()`

  `ColorInfo`

  `getWorldItemHighlightColor()`

  `int`

  `getXAngle(int width,
  float angle)`

  `int`

  `getYAngle(int width,
  float angle)`

  `float`

  `getZoom(int playerIndex)`

  `boolean`

  `gotNewBelt()`

  `private void`

  `handleNewSaveFolderFormat()`

  `void`

  `init(int width,
  int height)`

  `void`

  `initFBOs()`

  `void`

  `initGlobalShader()`

  `private void`

  `initOptionsINI()`

  `void`

  `initPoisonousBerry()`

  `void`

  `initPoisonousMushroom()`

  `void`

  `initShaders()`

  `boolean`

  `invalidBindingShiftCtrl(Core.KeyBinding keyB)`

  `boolean`

  `isAnimPopupDone()`

  `boolean`

  `isAzerty()`

  `boolean`

  `isCelsius()`

  `boolean`

  `isChallenge()`

  `boolean`

  `isCollideZombies()`

  `boolean`

  `isDedicated()`

  `boolean`

  `isDefaultOptions()`

  `static boolean`

  `isDevMode()`

  `boolean`

  `isDisplayCursor()`

  `boolean`

  `isDisplayPlayerModel()`

  `boolean`

  `isDoingTextEntry()`

  `boolean`

  `isDoneNewSaveFolder()`

  `boolean`

  `isFlashIsoCursor()`

  `boolean`

  `isForceSnow()`

  `boolean`

  `isFullScreen()`

  `private boolean`

  `isFunctionKey(int key)`

  `static boolean`

  `isImGui()`

  `boolean`

  `isInDebug()`

  `boolean`

  `isKey(String keyName,
  Integer key)`

  `static boolean`

  `isLastStand()`

  `boolean`

  `isModsPopupDone()`

  `boolean`

  `isMultiThread()`

  `boolean`

  `isNoSave()`

  `boolean`

  `isOption3DGroundItem()`

  `boolean`

  `isOptionAutoProneAtk()`

  `boolean`

  `isOptiondblTapJogToSprint()`

  `boolean`

  `isOptionProgressBar()`

  `boolean`

  `isOptionShowChatTimestamp()`

  `boolean`

  `isOptionShowChatTitle()`

  `boolean`

  `isOptionSimpleClothingTextures(boolean bZombie)`

  `boolean`

  `isPopulateServerListOnStart()`

  `boolean`

  `isRenderPrecipIndoors()`

  `boolean`

  `isRiversideDone()`

  `boolean`

  `isSelectingAll()`

  `boolean`

  `isShowFirstTimeSearchTutorial()`

  `boolean`

  `isShowFirstTimeSneakTutorial()`

  `boolean`

  `isShowFirstTimeVehicleTutorial()`

  `boolean`

  `isShowFirstTimeWeatherTutorial()`

  `boolean`

  `isShowPing()`

  `boolean`

  `isShowYourUsername()`

  `boolean`

  `isToggleToAim()`

  `boolean`

  `isToggleToRun()`

  `boolean`

  `isToggleToSprint()`

  `boolean`

  `isTutorialDone()`

  `static boolean`

  `isUseGameViewport()`

  `static boolean`

  `isUseViewports()`

  `boolean`

  `isVehiclesWarningShow()`

  `boolean`

  `isZombieGroupSound()`

  `boolean`

  `isZoomEnabled()`

  `boolean`

  `loadedShader()`

  `boolean`

  `loadOptions()`

  `boolean`

  `loadOptions_OLD()`

  `void`

  `MoveMethodToggle()`

  `private BooleanConfigOption`

  `newFakeOption(String name,
  boolean defaultValue)`

  `private DoubleConfigOption`

  `newFakeOption(String name,
  double minValue,
  double maxValue,
  double defaultValue)`

  `private IntegerConfigOption`

  `newFakeOption(String name,
  int minValue,
  int maxValue,
  int defaultValue)`

  `private StringConfigOption`

  `newFakeOption(String name,
  String defaultValue,
  int maxLength)`

  `private StringConfigOption`

  `newFakeOption(String name,
  String defaultValue,
  String[] values)`

  `private ArrayConfigOption`

  `newFakeOption(String name,
  ConfigOption elementHandler,
  String separator,
  String defaultValue)`

  `private BooleanConfigOption`

  `newOption(String name,
  boolean defaultValue)`

  `private DoubleConfigOption`

  `newOption(String name,
  double minValue,
  double maxValue,
  double defaultValue)`

  `private IntegerConfigOption`

  `newOption(String name,
  int minValue,
  int maxValue,
  int defaultValue)`

  `private IntegerConfigOption`

  `newOption(String name,
  int minValue,
  int maxValue,
  int defaultValue,
  ConfigOption.ConfigOptionOnChangeCallback onChange)`

  `private StringConfigOption`

  `newOption(String name,
  String defaultValue,
  int maxLength)`

  `private StringConfigOption`

  `newOption(String name,
  String defaultValue,
  String[] values)`

  `private StringConfigOption`

  `newOption(String name,
  String defaultValue,
  ConfigOption.ConfigOptionOnChangeCallback onChange)`

  `private ArrayConfigOption`

  `newOption(String name,
  ConfigOption elementHandler,
  String separator,
  String defaultValue)`

  `void`

  `onOptionControllerButtonStyleChanged(ConfigOption sender)`

  `void`

  `onOptionGamepadBindingPresetChanged(ConfigOption sender)`

  `void`

  `quit()`

  `void`

  `quitToDesktop()`

  `private void`

  `readPerPlayerBoolean(String str,
  boolean[] flags)`

  `void`

  `reinitKeyMaps()`

  `void`

  `RenderOffScreenBuffer()`

  `void`

  `ResetLua(boolean sp,
  String reason)`

  Deprecated.

  `void`

  `ResetLua(String activeMods,
  String reason)`

  `void`

  `saveOptions()`

  `void`

  `saveOptions_OLD()`

  `private void`

  `searchFolders(File file,
  String relative)`

  `void`

  `setAccountUsed(Account accountUsed)`

  `void`

  `setAnimalCheat(boolean cheat)`

  `void`

  `setAnimPopupDone(boolean done)`

  `void`

  `setAutoZoom(int playerIndex,
  boolean auto)`

  `void`

  `setAzerty(boolean isAzerty)`

  `void`

  `setBadHighlitedColor(ColorInfo badHighlitedColor)`

  `void`

  `setBlinkingMoodle(String blinkingMoodle)`

  `void`

  `setCelsius(boolean celsius)`

  `void`

  `setChallenge(boolean bChallenge)`

  `void`

  `setCollideZombies(boolean collideZombies)`

  `void`

  `setConsoleDotTxtSizeKB(int kilobytes)`

  `void`

  `setConsoleDotTxtSizeKB(String kilobytesString)`

  `void`

  `setContentTranslationsEnabled(boolean b)`

  `void`

  `setDisplayCursor(boolean display)`

  `static void`

  `setDisplayMode(int width,
  int height,
  boolean fullscreen)`

  `private static void`

  `setDisplayModeInternal(int width,
  int height,
  boolean fullscreen)`

  `void`

  `setDisplayPlayerModel(boolean display)`

  `void`

  `setDoneNewSaveFolder(boolean doneNewSaveFolder)`

  `void`

  `setFlashIsoCursor(boolean flashIsoCursor)`

  `void`

  `setForceSnow(boolean forceSnow)`

  `void`

  `setFramerate(int index)`

  `static void`

  `setFullScreen(boolean bool)`

  `void`

  `setGameMode(String gameMode)`

  `void`

  `setGoodHighlitedColor(ColorInfo goodHighlitedColor)`

  `void`

  `setGotNewBelt(boolean gotit)`

  `static void`

  `setInitialSize()`

  `void`

  `setIsoCursorVisibility(int isoCursorVisibility)`

  `void`

  `setIsSelectingAll(boolean isSelectingAll)`

  `void`

  `setLastRenderedFBO(zombie.core.textures.TextureFBO fbo)`

  `void`

  `setMaxActiveRagdolls(int maxActiveRagdolls)`

  `void`

  `setModsPopupDone(boolean done)`

  `void`

  `setMpTextColor(ColorInfo mpTextColor)`

  `void`

  `setMultiThread(boolean val)`

  `void`

  `setNoSave(boolean noSave)`

  `void`

  `setNoTargetColor(ColorInfo colorInfo)`

  `void`

  `setObjectHighlitedColor(ColorInfo objectHighlitedColor)`

  `void`

  `setOption3DGroundItem(boolean option3Dgrounditem)`

  `void`

  `setOptionActionProgressBarSize(int size)`

  `void`

  `setOptionActiveController(int controllerIndex,
  boolean active)`

  `void`

  `setOptionAimTextureIndex(int index)`

  `void`

  `setOptionAmbientVolume(int volume)`

  `void`

  `setOptionAutoDrink(boolean enable)`

  `void`

  `setOptionAutoProneAtk(boolean optionAutoProneAtk)`

  `void`

  `setOptionAutoRevealPrintMediaMapLocations(boolean enable)`

  `void`

  `setOptionAutoWalkContainer(boolean enable)`

  `void`

  `setOptionBloodDecals(int n)`

  `void`

  `setOptionBorderlessWindow(boolean b)`

  `void`

  `setOptionChatFadeTime(float optionChatFadeTime)`

  `void`

  `setOptionChatFontSize(String optionChatFontSize)`

  `void`

  `setOptionChatOpaqueOnFocus(boolean optionChatOpaqueOnFocus)`

  `void`

  `setOptionClock24Hour(boolean b24Hour)`

  `void`

  `setOptionClockFormat(int fmt)`

  `void`

  `setOptionClockSize(int size)`

  `void`

  `setOptionCodeFontSize(String font)`

  `void`

  `setOptionColorblindPatterns(boolean enable)`

  `void`

  `setOptionContextMenuFont(String font)`

  `void`

  `setOptionControllerButtonStyle(int v)`

  `void`

  `setOptionCorpseShadows(boolean enable)`

  `void`

  `setOptionCrosshairTextureIndex(int index)`

  `void`

  `setOptionCycleContainerKey(String s)`

  `void`

  `setOptiondblTapJogToSprint(boolean dbltap)`

  `void`

  `setOptionDisableLightningDuringStorms(boolean enable)`

  `void`

  `setOptionDisplayAsCelsius(boolean b)`

  `void`

  `setOptionDoContainerOutline(boolean b)`

  `void`

  `setOptionDoDoorSpriteEffects(boolean b)`

  `void`

  `setOptionDoVideoEffects(boolean b)`

  `void`

  `setOptionDoWindSpriteEffects(boolean b)`

  `void`

  `setOptionDropItemsOnSquareCenter(boolean b)`

  `void`

  `setOptionEnableDyslexicFont(boolean enable)`

  `void`

  `setOptionEnableLeftJoystickRadialMenu(boolean b)`

  `void`

  `setOptionFocusloss(boolean pause)`

  `void`

  `setOptionFontSize(int size)`

  `void`

  `setOptionGamepadBindingPreset(String newValue)`

  `void`

  `setOptionHighResPlacedItems(boolean b)`

  `void`

  `setOptionIgnoreProneZombieRange(int i)`

  `void`

  `setOptionInventoryContainerSize(int size)`

  `void`

  `setOptionInventoryFont(String font)`

  `void`

  `setOptionJumpScareVolume(int volume)`

  `void`

  `setOptionLanguageName(String name)`

  `void`

  `setOptionLeaveKeyInIgnition(boolean enable)`

  `void`

  `setOptionLockCursorToWindow(boolean b)`

  `void`

  `setOptionMacOSIgnoreMouseWheelAcceleration(boolean b)`

  `void`

  `setOptionMacOSMapHorizontalMouseWheelToVertical(boolean b)`

  `void`

  `setOptionMapViewPause(boolean pause)`

  `void`

  `setOptionMaxChatOpaque(float optionMaxChatOpaque)`

  `void`

  `setOptionMaxCrosshairOffset(int maxCrosshairOffset)`

  `void`

  `setOptionMaxTextureSize(int v)`

  `void`

  `setOptionMaxVehicleTextureSize(int v)`

  `void`

  `setOptionMeasurementFormat(String format)`

  `void`

  `setOptionMeleeOutline(boolean toggle)`

  `void`

  `setOptionMinChatOpaque(float optionMinChatOpaque)`

  `void`

  `setOptionModelTextureMipmaps(boolean b)`

  `void`

  `setOptionModsEnabled(boolean enabled)`

  `void`

  `setOptionMoodleSize(int size)`

  `void`

  `setOptionMusicActionStyle(int v)`

  `void`

  `setOptionMusicLibrary(int m)`

  `void`

  `setOptionMusicVolume(int volume)`

  `void`

  `setOptionOnStartup(String name,
  Object value)`

  `void`

  `setOptionPanCameraWhileAiming(boolean enable)`

  `void`

  `setOptionPanCameraWhileDriving(boolean enable)`

  `void`

  `setOptionPrecipitationSpeedMultiplier(float f)`

  `void`

  `setOptionProgressBar(boolean optionProgressBar)`

  `void`

  `setOptionRackProgress(boolean b)`

  `void`

  `setOptionRadialMenuKeyToggle(boolean toggle)`

  `void`

  `setOptionReloadDifficulty(int d)`

  `void`

  `setOptionReloadRadialInstant(boolean enable)`

  `void`

  `setOptionRenderPrecipitation(int optionRenderPrecipitation)`

  `void`

  `setOptionReticleCameraZoom(boolean optionReticleCameraZoom)`

  `void`

  `setOptionReticleMode(int mode)`

  `void`

  `setOptionReticleTextureIndex(int index)`

  `void`

  `setOptionScreenFilter(String value)`

  `void`

  `setOptionSearchModeOverlayEffect(int v)`

  `void`

  `setOptionShoulderButtonContainerSwitch(int v)`

  `void`

  `setOptionShowAimTexture(boolean show)`

  `void`

  `setOptionShowChatTimestamp(boolean optionShowChatTimestamp)`

  `void`

  `setOptionShowChatTitle(boolean optionShowChatTitle)`

  `void`

  `setOptionShowCraftingXP(boolean b)`

  `void`

  `setOptionShowCursorWhileAiming(boolean show)`

  `void`

  `setOptionShowFirstAnimalZoneInfo(boolean b)`

  `void`

  `setOptionShowItemModInfo(boolean b)`

  `void`

  `setOptionShowReticleTexture(boolean show)`

  `void`

  `setOptionShowSurvivalGuide(boolean b)`

  `void`

  `setOptionShowValidTargetReticleTexture(boolean show)`

  `void`

  `setOptionShowWelcomeMessage(boolean showWelcomeMessage)`

  `void`

  `setOptionSidebarSize(int size)`

  `void`

  `setOptionSimpleClothingTextures(int v)`

  `void`

  `setOptionSimpleWeaponTextures(boolean enable)`

  `void`

  `setOptionSingleContextMenu(int playerIndex,
  boolean b)`

  `void`

  `setOptionSoundVolume(int volume)`

  `void`

  `setOptionStreamerMode(boolean b)`

  `void`

  `setOptionTexture2x(boolean b)`

  `void`

  `setOptionTextureCompression(boolean b)`

  `void`

  `setOptionTieredZombieUpdates(boolean val)`

  `void`

  `setOptionTimedActionGameSpeedReset(boolean b)`

  `void`

  `setOptionTooltipFont(String font)`

  `void`

  `setOptionUIFBO(boolean use)`

  `void`

  `setOptionUIRenderFPS(int fps)`

  `void`

  `setOptionUpdateSneakButton(boolean b)`

  `void`

  `setOptionUsePhysicsHitReaction(boolean usePhysicsHitReaction)`

  `void`

  `setOptionValidTargetReticleTextureIndex(int index)`

  `void`

  `setOptionVehicleEngineVolume(int volume)`

  `void`

  `setOptionVoiceAGCMode(int option)`

  `void`

  `setOptionVoiceEnable(boolean option)`

  `void`

  `setOptionVoiceEnable(boolean option,
  boolean bRestartClient)`

  `void`

  `setOptionVoiceMode(int option)`

  `void`

  `setOptionVoiceRecordDevice(int option)`

  `void`

  `setOptionVoiceRecordDeviceName(String option)`

  `void`

  `setOptionVoiceVADMode(int option)`

  `void`

  `setOptionVoiceVolumeMic(int option)`

  `void`

  `setOptionVoiceVolumePlayers(int option)`

  `void`

  `setOptionVSync(boolean sync)`

  `void`

  `setOptionWorldMapBrightness(double d)`

  `void`

  `setOptionZoom(boolean zoom)`

  `void`

  `setOptionZoomLevels1x(String levels)`

  `void`

  `setOptionZoomLevels2x(String levels)`

  `void`

  `setPerfPuddles(int val)`

  `void`

  `setPerfReflections(boolean val)`

  `void`

  `setPerfSkybox(int val)`

  `void`

  `setPoisonousBerry(String poisonousBerry)`

  `void`

  `setPoisonousMushroom(String poisonousMushroom)`

  `void`

  `setPopulateServerListOnStart(boolean populateServerListOnStart)`

  `void`

  `setRenderPrecipIndoors(boolean optionRenderPrecipIndoors)`

  `void`

  `setResolution(String res)`

  `void`

  `setResolutionAndFullScreen(int w,
  int h,
  boolean fullScreen)`

  `void`

  `setRiversideDone(boolean riversideDone)`

  `void`

  `setScreenSize(int width,
  int height)`

  `void`

  `setSeenUpdateText(String seenUpdateText)`

  `void`

  `setSelectedMap(String selectedMap)`

  `void`

  `setShowFirstTimeSearchTutorial(boolean showFirstTimeSearchTutorial)`

  `void`

  `setShowFirstTimeSneakTutorial(boolean showFirstTimeSneakTutorial)`

  `void`

  `setShowFirstTimeVehicleTutorial(boolean showFirstTimeVehicleTutorial)`

  `void`

  `setShowFirstTimeWeatherTutorial(boolean showFirstTimeWeatherTutorial)`

  `void`

  `setShownWelcomeMessageVersion(double value)`

  `void`

  `setShowPing(boolean showPing)`

  `void`

  `setShowYourUsername(boolean showYourUsername)`

  `void`

  `setTargetColor(ColorInfo colorInfo)`

  `void`

  `setTermsOfServiceVersion(int v)`

  `void`

  `setTestingMicrophone(boolean testing)`

  `void`

  `setToggleToAim(boolean enable)`

  `void`

  `setToggleToRun(boolean toggleToRun)`

  `void`

  `setToggleToSprint(boolean toggleToSprint)`

  `void`

  `setTutorialDone(boolean done)`

  `private boolean`

  `setupMultiFBO()`

  `void`

  `setUseShaders(boolean bUse)`

  `void`

  `setVehiclesWarningShow(boolean done)`

  `void`

  `setVidMem(int mem)`

  `void`

  `setWindowed(boolean b)`

  `void`

  `setWorldItemHighlightColor(ColorInfo colorInfo)`

  `void`

  `setZombieGroupSound(boolean zombieGroupSound)`

  `void`

  `setZoomEnalbed(boolean val)`

  `void`

  `shadersOptionChanged()`

  `private void`

  `sharedInit()`

  `void`

  `StartFrame()`

  `void`

  `StartFrame(int nPlayer,
  boolean clear)`

  `void`

  `StartFrameFlipY(int w,
  int h,
  float zoom,
  int player)`

  `void`

  `StartFrameText(int nPlayer)`

  `boolean`

  `StartFrameUI()`

  `static boolean`

  `supportCompressedTextures()`

  `static boolean`

  `supportNPTTexture()`

  `boolean`

  `supportRes(int width,
  int height)`

  `boolean`

  `supportsFBO()`

  `void`

  `TakeFullScreenshot(String filename)`

  `void`

  `TakeScreenshot()`

  `void`

  `TakeScreenshot(int width,
  int height,
  int readBuffer)`

  `void`

  `TakeScreenshot(int x,
  int y,
  int width,
  int height,
  int readBuffer)`

  `static void`

  `UnfocusActiveTextEntryBox()`

  `void`

  `updateKeyboard()`

  `private void`

  `updateKeyboardAux(zombie.ui.UITextEntryInterface entry,
  int eventKey)`

  `private String`

  `upgradeOptionName(String optionName,
  int version)`

  `private String`

  `upgradeOptionValue(String optionName,
  String optionValue,
  int version)`

  `void`

  `zoomLevelsChanged()`

  `void`

  `zoomOptionChanged(boolean inGame)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### IS\_DEV

    public static boolean IS\_DEV
  + ### PZWorldToBulletZScale

    public static final float PZWorldToBulletZScale

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.PZWorldToBulletZScale)
  + ### characterHeight

    public static final float characterHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.characterHeight)
  + ### characterRangedAimPointHeight

    public static final float characterRangedAimPointHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.characterRangedAimPointHeight)
  + ### characterMeleeAimPointHeight

    public static final float characterMeleeAimPointHeight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.characterMeleeAimPointHeight)
  + ### bDemo

    public static final boolean bDemo

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.bDemo)
  + ### tutorial

    public static boolean tutorial
  + ### dirtyGlobalLightsCount

    public static int dirtyGlobalLightsCount
  + ### fakefullscreen

    private static final boolean fakefullscreen

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.fakefullscreen)
  + ### gameVersion

    private static final [GameVersion](GameVersion.html "class in zombie.core") gameVersion
  + ### buildVersion

    private static final int buildVersion

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.buildVersion)
  + ### gitRevisionString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gitRevisionString
  + ### steamServerVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamServerVersion
  + ### altMoveMethod

    public static boolean altMoveMethod
  + ### consoleDotTxtSizeKb

    private int consoleDotTxtSizeKb
  + ### objectHighlitedColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") objectHighlitedColor
  + ### worldItemHighlightColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") worldItemHighlightColor
  + ### workstationHighlitedColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") workstationHighlitedColor
  + ### goodHighlitedColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") goodHighlitedColor
  + ### badHighlitedColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") badHighlitedColor
  + ### flashIsoCursor

    private boolean flashIsoCursor
  + ### targetColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") targetColor
  + ### noTargetColor

    private final [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") noTargetColor
  + ### accountUsed

    private [Account](../network/Account.html "class in zombie.network") accountUsed
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options
  + ### optionByName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ConfigOption](../config/ConfigOption.html "class in zombie.config")> optionByName
  + ### fakeOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> fakeOptions
  + ### fakeOptionByName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ConfigOption](../config/ConfigOption.html "class in zombie.config")> fakeOptionByName
  + ### selectedMap

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") selectedMap
  + ### gitSha

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gitSha
  + ### VERSION\_BUILD\_42

    private final int VERSION\_BUILD\_42

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.VERSION_BUILD_42)
  + ### optionReticleMode

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionReticleMode
  + ### optionShowAimTexture

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowAimTexture
  + ### optionShowReticleTexture

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowReticleTexture
  + ### optionShowValidTargetReticleTexture

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowValidTargetReticleTexture
  + ### optionAimTextureIndex

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionAimTextureIndex
  + ### optionReticleTextureIndex

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionReticleTextureIndex
  + ### optionValidTargetReticleTextureIndex

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionValidTargetReticleTextureIndex
  + ### optionCrosshairTextureIndex

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionCrosshairTextureIndex
  + ### optionMaxCrosshairOffset

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMaxCrosshairOffset
  + ### optionReticleCameraZoom

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionReticleCameraZoom
  + ### optionTargetColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionTargetColor
  + ### optionNoTargetColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionNoTargetColor
  + ### optionObjectHighlightColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionObjectHighlightColor
  + ### optionWorldItemHighlightColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionWorldItemHighlightColor
  + ### optionWorkstationHighlightColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionWorkstationHighlightColor
  + ### optionGoodHighlightColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionGoodHighlightColor
  + ### optionBadHighlightColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionBadHighlightColor
  + ### isoCursorVisibility

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") isoCursorVisibility
  + ### optionShowCursorWhileAiming

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowCursorWhileAiming
  + ### collideZombies

    private boolean collideZombies
  + ### offscreenBuffer

    public final zombie.core.textures.MultiTextureFBO2 offscreenBuffer
  + ### saveFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveFolder
  + ### optionZoom

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionZoom
  + ### optionModsEnabled

    public static boolean optionModsEnabled
  + ### optionFontSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionFontSize
  + ### optionMoodleSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMoodleSize
  + ### optionSidebarSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionSidebarSize
  + ### optionActionProgressBarSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionActionProgressBarSize
  + ### optionContextMenuFont

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionContextMenuFont
  + ### optionCodeFontSize

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionCodeFontSize
  + ### optionInventoryFont

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionInventoryFont
  + ### optionInventoryContainerSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionInventoryContainerSize
  + ### optionTooltipFont

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionTooltipFont
  + ### optionColorblindPatterns

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionColorblindPatterns
  + ### optionEnableDyslexicFont

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionEnableDyslexicFont
  + ### optionDisableLightningDuringStorms

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDisableLightningDuringStorms
  + ### optionMeasurementFormat

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionMeasurementFormat
  + ### optionClockFormat

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionClockFormat
  + ### optionClockSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionClockSize
  + ### optionClock24Hour

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionClock24Hour
  + ### optionVsync

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionVsync
  + ### optionSoundVolume

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionSoundVolume
  + ### optionMusicVolume

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMusicVolume
  + ### optionAmbientVolume

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionAmbientVolume
  + ### optionJumpScareVolume

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionJumpScareVolume
  + ### optionMusicActionStyle

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMusicActionStyle
  + ### optionMusicLibrary

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMusicLibrary
  + ### optionVoiceEnable

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionVoiceEnable
  + ### optionVoiceMode

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVoiceMode
  + ### optionVoiceVadMode

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVoiceVadMode
  + ### optionVoiceAgcMode

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVoiceAgcMode
  + ### optionVoiceRecordDeviceName

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionVoiceRecordDeviceName
  + ### optionVoiceVolumeMic

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVoiceVolumeMic
  + ### optionVoiceVolumePlayers

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVoiceVolumePlayers
  + ### optionVehicleEngineVolume

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionVehicleEngineVolume
  + ### optionStreamerMode

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionStreamerMode
  + ### optionReloadDifficulty

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionReloadDifficulty
  + ### optionRackProgress

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionRackProgress
  + ### optionBloodDecals

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionBloodDecals
  + ### optionFocusloss

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionFocusloss
  + ### optionMapViewPause

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionMapViewPause
  + ### optionBorderlessWindow

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionBorderlessWindow
  + ### optionLockCursorToWindow

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionLockCursorToWindow
  + ### optionTextureCompression

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTextureCompression
  + ### optionModelTextureMipmaps

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionModelTextureMipmaps
  + ### optionTexture2x

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTexture2x
  + ### optionHighResPlacedItems

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionHighResPlacedItems
  + ### optionMaxTextureSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMaxTextureSize
  + ### optionMaxVehicleTextureSize

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMaxVehicleTextureSize
  + ### optionScreenFilter

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionScreenFilter
  + ### optionZoomLevels1x

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionZoomLevels1x
  + ### optionZoomLevels2x

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionZoomLevels2x
  + ### optionEnableContentTranslations

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionEnableContentTranslations
  + ### optionUiFbo

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionUiFbo
  + ### optionUiRenderFps

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionUiRenderFps
  + ### optionRadialMenuKeyToggle

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionRadialMenuKeyToggle
  + ### optionReloadRadialInstant

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionReloadRadialInstant
  + ### optionPanCameraWhileAiming

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionPanCameraWhileAiming
  + ### optionPanCameraWhileDriving

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionPanCameraWhileDriving
  + ### optionShowChatTimestamp

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowChatTimestamp
  + ### optionShowChatTitle

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowChatTitle
  + ### optionChatFontSize

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionChatFontSize
  + ### optionMinChatOpaque

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionMinChatOpaque
  + ### optionMaxChatOpaque

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionMaxChatOpaque
  + ### optionChatFadeTime

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionChatFadeTime
  + ### optionChatOpaqueOnFocus

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionChatOpaqueOnFocus
  + ### optionTemperatureDisplayCelsius

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTemperatureDisplayCelsius
  + ### optionDoVideoEffects

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDoVideoEffects
  + ### optionDoWindSpriteEffects

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDoWindSpriteEffects
  + ### optionDoDoorSpriteEffects

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDoDoorSpriteEffects
  + ### optionDoContainerOutline

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDoContainerOutline
  + ### optionRenderPrecipIndoors

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionRenderPrecipIndoors
  + ### optionPrecipitationSpeedMultiplier

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionPrecipitationSpeedMultiplier
  + ### optionAutoProneAtk

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionAutoProneAtk
  + ### option3dGroundItem

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") option3dGroundItem
  + ### optionRenderPrecipitation

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionRenderPrecipitation
  + ### optionDblTapJogToSprint

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDblTapJogToSprint
  + ### optionMeleeOutline

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionMeleeOutline
  + ### optionCycleContainerKey

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionCycleContainerKey
  + ### optionDropItemsOnSquareCenter

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDropItemsOnSquareCenter
  + ### optionTimedActionGameSpeedReset

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTimedActionGameSpeedReset
  + ### optionShoulderButtonContainerSwitch

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionShoulderButtonContainerSwitch
  + ### optionControllerButtonStyle

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionControllerButtonStyle
  + ### optionGamepadBindingPreset

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionGamepadBindingPreset
  + ### optionProgressBar

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionProgressBar
  + ### optionLanguageName

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") optionLanguageName
  + ### optionSingleContextMenu

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionSingleContextMenu
  + ### optionCorpseShadows

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionCorpseShadows
  + ### optionSimpleClothingTextures

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionSimpleClothingTextures
  + ### optionSimpleWeaponTextures

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionSimpleWeaponTextures
  + ### optionAutoDrink

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionAutoDrink
  + ### optionAutoRevealPrintMediaMapLocations

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionAutoRevealPrintMediaMapLocations
  + ### optionLeaveKeyInIgnition

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionLeaveKeyInIgnition
  + ### optionAutoWalkContainer

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionAutoWalkContainer
  + ### optionSearchModeOverlayEffect

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionSearchModeOverlayEffect
  + ### optionIgnoreProneZombieRange

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionIgnoreProneZombieRange
  + ### optionShowItemModInfo

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowItemModInfo
  + ### optionShowCraftingXp

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowCraftingXp
  + ### optionShowSurvivalGuide

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowSurvivalGuide
  + ### optionShowFirstAnimalZoneInfo

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowFirstAnimalZoneInfo
  + ### optionEnableLeftJoystickRadialMenu

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionEnableLeftJoystickRadialMenu
  + ### optionMacosIgnoreMouseWheelAcceleration

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionMacosIgnoreMouseWheelAcceleration
  + ### optionMacosMapHorizontalMouseWheelToVertical

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionMacosMapHorizontalMouseWheelToVertical
  + ### optionUsePhysicsHitReaction

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionUsePhysicsHitReaction
  + ### optionMaxActiveRagdolls

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionMaxActiveRagdolls
  + ### optionWorldMapBrightness

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionWorldMapBrightness
  + ### optionShowWelcomeMessage

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowWelcomeMessage
  + ### showPing

    private boolean showPing
  + ### forceSnow

    private boolean forceSnow
  + ### zombieGroupSound

    private boolean zombieGroupSound
  + ### blinkingMoodle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") blinkingMoodle
  + ### poisonousBerry

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousBerry
  + ### poisonousMushroom

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousMushroom
  + ### difficulty

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") difficulty
  + ### tileScale

    public static int tileScale
  + ### isSelectingAll

    private boolean isSelectingAll
  + ### showYourUsername

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") showYourUsername
  + ### populateServerListOnStart

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") populateServerListOnStart
  + ### mpTextColor

    private [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") mpTextColor
  + ### optionMpTextColor

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionMpTextColor
  + ### isAzerty

    private boolean isAzerty
  + ### seenUpdateText

    private final [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") seenUpdateText
  + ### toggleToAim

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") toggleToAim
  + ### toggleToRun

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") toggleToRun
  + ### toggleToSprint

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") toggleToSprint
  + ### celsius

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") celsius
  + ### noSave

    private boolean noSave
  + ### showFirstTimeVehicleTutorial

    private boolean showFirstTimeVehicleTutorial
  + ### showFirstTimeWeatherTutorial

    private boolean showFirstTimeWeatherTutorial
  + ### animPopupDone

    private boolean animPopupDone
  + ### modsPopupDone

    private boolean modsPopupDone
  + ### blinkAlpha

    public static float blinkAlpha
  + ### blinkAlphaIncrease

    public static boolean blinkAlphaIncrease
  + ### loadedOptions

    private boolean loadedOptions
  + ### optionsOnStartup

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> optionsOnStartup
  + ### animalCheat

    public boolean animalCheat
  + ### displayPlayerModel

    public boolean displayPlayerModel
  + ### displayCursor

    public boolean displayCursor
  + ### projectionMatrixStack

    public final zombie.core.opengl.MatrixStack projectionMatrixStack
  + ### modelViewMatrixStack

    public final zombie.core.opengl.MatrixStack modelViewMatrixStack
  + ### screenFilter

    private int screenFilter
  + ### UnitVector3f

    public static final org.lwjgl.util.vector.Vector3f UnitVector3f
  + ### \_UNIT\_Z

    public static final org.lwjgl.util.vector.Vector3f \_UNIT\_Z
  + ### challenge

    private boolean challenge
  + ### width

    public static int width
  + ### height

    public static int height
  + ### initialWidth

    public static float initialWidth
  + ### initialHeight

    public static float initialHeight
  + ### maxJukeBoxesActive

    public static int maxJukeBoxesActive
  + ### numJukeBoxesActive

    public static int numJukeBoxesActive
  + ### gameMode

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMode
  + ### addZombieOnCellLoad

    public static boolean addZombieOnCellLoad
  + ### preset

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") preset
  + ### glVersion

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") glVersion
  + ### glMajorVersion

    private static int glMajorVersion
  + ### core

    private static final [Core](Core.html "class in zombie.core") core
  + ### debug

    public static boolean debug
  + ### antiCheats

    public static boolean antiCheats
  + ### useViewports

    public static boolean useViewports
  + ### useGameViewport

    public static boolean useGameViewport
  + ### imGui

    public static boolean imGui
  + ### currentTextEntryBox

    public static zombie.ui.UITextEntryInterface currentTextEntryBox
  + ### KEYBINDING\_EMPTY

    public static final [Core.KeyBinding](Core.KeyBinding.html "class in zombie.core") KEYBINDING\_EMPTY
  + ### keyMaps

    private [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [Core.KeyBinding](Core.KeyBinding.html "class in zombie.core")> keyMaps
  + ### keyBindingByKeyValue

    private final gnu.trove.map.hash.TIntObjectHashMap<[Core.KeyBindingList](Core.KeyBindingList.html "class in zombie.core")> keyBindingByKeyValue
  + ### useShaders

    public final boolean useShaders

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.useShaders)
  + ### iPerfSkybox

    private int iPerfSkybox
  + ### perfSkyboxNew

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") perfSkyboxNew
  + ### iPerfSkybox\_High

    public static final int iPerfSkybox\_High

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfSkybox_High)
  + ### iPerfSkybox\_Medium

    public static final int iPerfSkybox\_Medium

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfSkybox_Medium)
  + ### iPerfSkybox\_Static

    public static final int iPerfSkybox\_Static

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfSkybox_Static)
  + ### iPerfPuddles

    private int iPerfPuddles
  + ### perfPuddlesNew

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") perfPuddlesNew
  + ### iPerfPuddles\_None

    public static final int iPerfPuddles\_None

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfPuddles_None)
  + ### iPerfPuddles\_GroundOnly

    public static final int iPerfPuddles\_GroundOnly

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfPuddles_GroundOnly)
  + ### iPerfPuddles\_GroundWithRuts

    public static final int iPerfPuddles\_GroundWithRuts

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfPuddles_GroundWithRuts)
  + ### iPerfPuddles\_All

    public static final int iPerfPuddles\_All

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.iPerfPuddles_All)
  + ### perfReflections

    private boolean perfReflections
  + ### perfReflectionsNew

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") perfReflectionsNew
  + ### vidMem

    public int vidMem
  + ### supportsFbo

    private boolean supportsFbo
  + ### uiRenderAccumulator

    public float uiRenderAccumulator
  + ### uiRenderThisFrame

    public boolean uiRenderThisFrame
  + ### version

    public int version
  + ### fileversion

    public int fileversion
  + ### optionActiveControllerGuids

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") optionActiveControllerGuids
  + ### optionDoneNewSaveFolder

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionDoneNewSaveFolder
  + ### optionFogQuality

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionFogQuality
  + ### optionViewConeOpacity

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionViewConeOpacity
  + ### optionGotNewBelt

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionGotNewBelt
  + ### optionLightingFps

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionLightingFps
  + ### optionLockFps

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionLockFps
  + ### optionPuddlesQuality

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionPuddlesQuality
  + ### optionRiversideDone

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionRiversideDone
  + ### optionRosewoodSpawnDone

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionRosewoodSpawnDone
  + ### optionScreenHeight

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionScreenHeight
  + ### optionScreenWidth

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionScreenWidth
  + ### optionShowFirstTimeSearchTutorial

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowFirstTimeSearchTutorial
  + ### optionShowFirstTimeSneakTutorial

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionShowFirstTimeSneakTutorial
  + ### optionShownWelcomeMessageVersion

    private final [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") optionShownWelcomeMessageVersion
  + ### optionTermsOfServiceVersion

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionTermsOfServiceVersion
  + ### optionTieredZombieUpdates

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTieredZombieUpdates
  + ### optionTutorialDone

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionTutorialDone
  + ### optionUpdateSneakButton

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionUpdateSneakButton
  + ### optionUncappedFps

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionUncappedFps
  + ### optionVehiclesWarningShow

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") optionVehiclesWarningShow
  + ### optionWaterQuality

    private final [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") optionWaterQuality
  + ### fullScreen

    private final [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") fullScreen
  + ### autoZoom

    private final [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") autoZoom
  + ### gameMap

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMap
  + ### gameSaveWorld

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameSaveWorld
  + ### safeMode

    public static boolean safeMode
  + ### safeModeForced

    public static boolean safeModeForced
  + ### soundDisabled

    public static boolean soundDisabled
  + ### frameStage

    public int frameStage
  + ### stack

    private int stack
  + ### xx

    public static int xx
  + ### yy

    public static int yy
  + ### zz

    public static int zz
  + ### floatParamMap

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> floatParamMap
  + ### tempMatrix4f

    private final org.joml.Matrix4f tempMatrix4f
  + ### isoAngle

    private static final float isoAngle

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.isoAngle)
  + ### ModelScale

    public static final float ModelScale

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.ModelScale)
  + ### scale

    public static final float scale
  + ### lastStand

    public static boolean lastStand
  + ### challengeId

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") challengeId
  + ### exiting

    public static boolean exiting
  + ### delayResetLuaActiveMods

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") delayResetLuaActiveMods
  + ### delayResetLuaReason

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") delayResetLuaReason
  + ### rn

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rn

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Core.rn)
* Constructor Details
  -------------------

  + ### Core

    public Core()
* Method Details
  --------------

  + ### newOption

    private [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [ConfigOption](../config/ConfigOption.html "class in zombie.config") elementHandler,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue)
  + ### newOption

    private [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
  + ### newOption

    private [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double minValue,
    double maxValue,
    double defaultValue)
  + ### newOption

    private [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int minValue,
    int maxValue,
    int defaultValue)
  + ### newOption

    private [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int minValue,
    int maxValue,
    int defaultValue,
    [ConfigOption.ConfigOptionOnChangeCallback](../config/ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChange)
  + ### newOption

    private [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] values)
  + ### newOption

    private [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    int maxLength)
  + ### newOption

    private [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") newOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    [ConfigOption.ConfigOptionOnChangeCallback](../config/ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChange)
  + ### newFakeOption

    private [ArrayConfigOption](../config/ArrayConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [ConfigOption](../config/ConfigOption.html "class in zombie.config") elementHandler,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue)
  + ### newFakeOption

    private [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
  + ### newFakeOption

    private [DoubleConfigOption](../config/DoubleConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double minValue,
    double maxValue,
    double defaultValue)
  + ### newFakeOption

    private [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int minValue,
    int maxValue,
    int defaultValue)
  + ### newFakeOption

    private [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] values)
  + ### newFakeOption

    private [StringConfigOption](../config/StringConfigOption.html "class in zombie.config") newFakeOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    int maxLength)
  + ### getOptionCount

    public int getOptionCount()
  + ### getOptionByIndex

    public [ConfigOption](../config/ConfigOption.html "class in zombie.config") getOptionByIndex(int index)
  + ### isMultiThread

    public boolean isMultiThread()
  + ### setChallenge

    public void setChallenge(boolean bChallenge)
  + ### isChallenge

    public boolean isChallenge()
  + ### getChallengeID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChallengeID()
  + ### getOptionTieredZombieUpdates

    public boolean getOptionTieredZombieUpdates()
  + ### setOptionTieredZombieUpdates

    public void setOptionTieredZombieUpdates(boolean val)
  + ### setFramerate

    public void setFramerate(int index)
  + ### setMultiThread

    public void setMultiThread(boolean val)
  + ### isUseGameViewport

    public static boolean isUseGameViewport()
  + ### isImGui

    public static boolean isImGui()
  + ### isUseViewports

    public static boolean isUseViewports()
  + ### loadedShader

    public boolean loadedShader()
  + ### getGLMajorVersion

    public static int getGLMajorVersion()
  + ### getUseShaders

    public boolean getUseShaders()
  + ### getPerfSkybox

    public int getPerfSkybox()
  + ### getPerfSkyboxOnLoad

    public int getPerfSkyboxOnLoad()
  + ### setPerfSkybox

    public void setPerfSkybox(int val)
  + ### getPerfReflections

    public boolean getPerfReflections()
  + ### getPerfReflectionsOnLoad

    public boolean getPerfReflectionsOnLoad()
  + ### getUseOpenGL21

    public boolean getUseOpenGL21()
  + ### setPerfReflections

    public void setPerfReflections(boolean val)
  + ### getPerfPuddles

    public int getPerfPuddles()
  + ### getPerfPuddlesOnLoad

    public int getPerfPuddlesOnLoad()
  + ### setPerfPuddles

    public void setPerfPuddles(int val)
  + ### getVidMem

    public int getVidMem()
  + ### setVidMem

    public void setVidMem(int mem)
  + ### setUseShaders

    public void setUseShaders(boolean bUse)
  + ### shadersOptionChanged

    public void shadersOptionChanged()
  + ### initGlobalShader

    public void initGlobalShader()
  + ### initShaders

    public void initShaders()
  + ### getGLVersion

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGLVersion()
  + ### getGameMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGameMode()
  + ### setGameMode

    public void setGameMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameMode)
  + ### getInstance

    public static [Core](Core.html "class in zombie.core") getInstance()
  + ### getOpenGLVersions

    public static void getOpenGLVersions()
  + ### getDebug

    public boolean getDebug()
  + ### setFullScreen

    public static void setFullScreen(boolean bool)
  + ### flipPixels

    public static int[] flipPixels(int[] imgPixels,
    int imgw,
    int imgh)
  + ### TakeScreenshot

    public void TakeScreenshot()
  + ### TakeScreenshot

    public void TakeScreenshot(int width,
    int height,
    int readBuffer)
  + ### TakeScreenshot

    public void TakeScreenshot(int x,
    int y,
    int width,
    int height,
    int readBuffer)
  + ### TakeFullScreenshot

    public void TakeFullScreenshot([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### supportNPTTexture

    public static boolean supportNPTTexture()
  + ### supportsFBO

    public boolean supportsFBO()
  + ### sharedInit

    private void sharedInit()
  + ### MoveMethodToggle

    public void MoveMethodToggle()
  + ### EndFrameText

    public void EndFrameText(int nPlayer)
  + ### EndFrame

    public void EndFrame(int nPlayer)
  + ### EndFrame

    public void EndFrame()
  + ### EndFrameUI

    public void EndFrameUI()
  + ### UnfocusActiveTextEntryBox

    public static void UnfocusActiveTextEntryBox()
  + ### getOffscreenWidth

    public int getOffscreenWidth(int playerIndex)
  + ### getOffscreenHeight

    public int getOffscreenHeight(int playerIndex)
  + ### getOffscreenTrueWidth

    public int getOffscreenTrueWidth()
  + ### getOffscreenTrueHeight

    public int getOffscreenTrueHeight()
  + ### getScreenHeight

    public int getScreenHeight()
  + ### getScreenWidth

    public int getScreenWidth()
  + ### setResolutionAndFullScreen

    public void setResolutionAndFullScreen(int w,
    int h,
    boolean fullScreen)
  + ### setResolution

    public void setResolution([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") res)
  + ### loadOptions\_OLD

    public boolean loadOptions\_OLD()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadOptions

    public boolean loadOptions()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### upgradeOptionName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") upgradeOptionName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionName,
    int version)
  + ### upgradeOptionValue

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") upgradeOptionValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionValue,
    int version)
  + ### initOptionsINI

    private void initOptionsINI()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### handleNewSaveFolderFormat

    private void handleNewSaveFolderFormat()
  + ### isDefaultOptions

    public boolean isDefaultOptions()
  + ### isDedicated

    public boolean isDedicated()
  + ### copyPasteFolders

    private void copyPasteFolders([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir)
  + ### searchFolders

    private void searchFolders([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") relative)
  + ### copyPasteFile

    private void copyPasteFile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") relative)
  + ### getMyDocumentFolder

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMyDocumentFolder()
  + ### saveOptions\_OLD

    public void saveOptions\_OLD()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveOptions

    public void saveOptions()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### addFakeOptionsForWriting

    private void addFakeOptionsForWriting([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options)
  + ### setWindowed

    public void setWindowed(boolean b)
  + ### isFullScreen

    public boolean isFullScreen()
  + ### getScreenModes

    public se.krka.kahlua.vm.KahluaTable getScreenModes()
  + ### setDisplayMode

    public static void setDisplayMode(int width,
    int height,
    boolean fullscreen)
  + ### setDisplayModeInternal

    private static void setDisplayModeInternal(int width,
    int height,
    boolean fullscreen)
  + ### isFunctionKey

    private boolean isFunctionKey(int key)
  + ### isDoingTextEntry

    public boolean isDoingTextEntry()
  + ### updateKeyboardAux

    private void updateKeyboardAux(zombie.ui.UITextEntryInterface entry,
    int eventKey)
  + ### updateKeyboard

    public void updateKeyboard()
  + ### quit

    public void quit()
  + ### exitToMenu

    public void exitToMenu()
  + ### quitToDesktop

    public void quitToDesktop()
  + ### supportRes

    public boolean supportRes(int width,
    int height)
    throws org.lwjglx.LWJGLException

    Throws:
    :   `org.lwjglx.LWJGLException`
  + ### init

    public void init(int width,
    int height)
    throws org.lwjglx.LWJGLException

    Throws:
    :   `org.lwjglx.LWJGLException`
  + ### setupMultiFBO

    private boolean setupMultiFBO()
  + ### setInitialSize

    public static void setInitialSize()
  + ### setScreenSize

    public void setScreenSize(int width,
    int height)
  + ### supportCompressedTextures

    public static boolean supportCompressedTextures()
  + ### StartFrame

    public void StartFrame()
  + ### StartFrame

    public void StartFrame(int nPlayer,
    boolean clear)
  + ### getOffscreenBuffer

    public zombie.core.textures.TextureFBO getOffscreenBuffer()
  + ### getOffscreenBuffer

    public zombie.core.textures.TextureFBO getOffscreenBuffer(int nPlayer)
  + ### setLastRenderedFBO

    public void setLastRenderedFBO(zombie.core.textures.TextureFBO fbo)
  + ### DoStartFrameStuff

    public void DoStartFrameStuff(int w,
    int h,
    float zoom,
    int player)
  + ### DoStartFrameStuff

    public void DoStartFrameStuff(int w,
    int h,
    float zoom,
    int player,
    boolean isTextFrame)
  + ### DoEndFrameStuffFx

    public void DoEndFrameStuffFx(int w,
    int h,
    int player)
  + ### DoStartFrameStuffSmartTextureFx

    public void DoStartFrameStuffSmartTextureFx(int w,
    int h,
    int player)
  + ### DoStartFrameStuffInternal

    private void DoStartFrameStuffInternal(int w,
    int h,
    float zoom,
    int player,
    boolean isTextFrame,
    boolean isFx,
    boolean isSmartTexture)
  + ### ChangeWorldViewport

    public void ChangeWorldViewport(int w,
    int h,
    int player)
  + ### StartFrameFlipY

    public void StartFrameFlipY(int w,
    int h,
    float zoom,
    int player)
  + ### DoStartFrameFlipY

    private void DoStartFrameFlipY(int w,
    int h,
    float zoom,
    int player,
    boolean isTextFrame,
    boolean isFx,
    boolean isSmartTexture)
  + ### DoStartFrameNoZoom

    public void DoStartFrameNoZoom(int w,
    int h,
    float zoom,
    int player,
    boolean isTextFrame,
    boolean isFx,
    boolean isSmartTexture)
  + ### DoPushIsoStuff

    public void DoPushIsoStuff(float ox,
    float oy,
    float oz,
    float useangle,
    boolean vehicle)
  + ### DoPushIsoStuff2D

    public void DoPushIsoStuff2D(float ox,
    float oy,
    float oz,
    float useangle,
    boolean vehicle)
  + ### DoPushIsoParticleStuff

    public void DoPushIsoParticleStuff(float ox,
    float oy,
    float oz)
  + ### DoPopIsoStuff

    public void DoPopIsoStuff()
  + ### DoEndFrameStuff

    public void DoEndFrameStuff(int w,
    int h)
  + ### RenderOffScreenBuffer

    public void RenderOffScreenBuffer()
  + ### StartFrameText

    public void StartFrameText(int nPlayer)
  + ### StartFrameUI

    public boolean StartFrameUI()
  + ### reinitKeyMaps

    public void reinitKeyMaps()
  + ### invalidBindingShiftCtrl

    public boolean invalidBindingShiftCtrl([Core.KeyBinding](Core.KeyBinding.html "class in zombie.core") keyB)
  + ### isKey

    public boolean isKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") key)
  + ### getKey

    public int getKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### getKeyBinding

    public [Core.KeyBinding](Core.KeyBinding.html "class in zombie.core") getKeyBinding([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### getKeyBinding

    public [Core.KeyBinding](Core.KeyBinding.html "class in zombie.core") getKeyBinding(int keyId)
  + ### addKeyBinding

    public void addKeyBinding([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName,
    int key,
    int altKey,
    boolean shift,
    boolean ctrl,
    boolean alt)
  + ### getAltKey

    public int getAltKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### isLastStand

    public static boolean isLastStand()
  + ### getVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVersion()
  + ### getBulletVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBulletVersion()
  + ### getGitSha

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGitSha()
  + ### getGitRevision

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGitRevision()
  + ### getGitRevisionString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGitRevisionString()
  + ### getGameVersion

    public [GameVersion](GameVersion.html "class in zombie.core") getGameVersion()
  + ### getBreakModGameVersion

    public [GameVersion](GameVersion.html "class in zombie.core") getBreakModGameVersion()
  + ### getSteamServerVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamServerVersion()
  + ### DoFrameReady

    public void DoFrameReady()
  + ### getCurrentPlayerZoom

    public float getCurrentPlayerZoom()
  + ### getZoom

    public float getZoom(int playerIndex)
  + ### getNextZoom

    public float getNextZoom(int playerIndex,
    int del)
  + ### getMinZoom

    public float getMinZoom()
  + ### getMaxZoom

    public float getMaxZoom()
  + ### doZoomScroll

    public void doZoomScroll(int playerIndex,
    int del)
  + ### getSaveFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSaveFolder()
  + ### getOptionZoom

    public boolean getOptionZoom()
  + ### setOptionZoom

    public void setOptionZoom(boolean zoom)
  + ### zoomOptionChanged

    public void zoomOptionChanged(boolean inGame)
  + ### zoomLevelsChanged

    public void zoomLevelsChanged()
  + ### isZoomEnabled

    public boolean isZoomEnabled()
  + ### setZoomEnalbed

    public void setZoomEnalbed(boolean val)
  + ### initFBOs

    public void initFBOs()
  + ### getAutoZoom

    public boolean getAutoZoom(int playerIndex)
  + ### setAutoZoom

    public void setAutoZoom(int playerIndex,
    boolean auto)
  + ### getOptionVSync

    public boolean getOptionVSync()
  + ### setOptionVSync

    public void setOptionVSync(boolean sync)
  + ### getOptionSoundVolume

    public int getOptionSoundVolume()
  + ### getRealOptionSoundVolume

    public float getRealOptionSoundVolume()
  + ### setOptionSoundVolume

    public void setOptionSoundVolume(int volume)
  + ### getOptionMusicVolume

    public int getOptionMusicVolume()
  + ### setOptionMusicVolume

    public void setOptionMusicVolume(int volume)
  + ### getOptionAmbientVolume

    public int getOptionAmbientVolume()
  + ### setOptionAmbientVolume

    public void setOptionAmbientVolume(int volume)
  + ### getOptionJumpScareVolume

    public int getOptionJumpScareVolume()
  + ### setOptionJumpScareVolume

    public void setOptionJumpScareVolume(int volume)
  + ### getOptionMusicActionStyle

    public int getOptionMusicActionStyle()
  + ### setOptionMusicActionStyle

    public void setOptionMusicActionStyle(int v)
  + ### getOptionMusicLibrary

    public int getOptionMusicLibrary()
  + ### setOptionMusicLibrary

    public void setOptionMusicLibrary(int m)
  + ### getOptionVehicleEngineVolume

    public int getOptionVehicleEngineVolume()
  + ### setOptionVehicleEngineVolume

    public void setOptionVehicleEngineVolume(int volume)
  + ### getOptionStreamerMode

    public boolean getOptionStreamerMode()
  + ### setOptionStreamerMode

    public void setOptionStreamerMode(boolean b)
  + ### getOptionVoiceEnable

    public boolean getOptionVoiceEnable()
  + ### setOptionVoiceEnable

    public void setOptionVoiceEnable(boolean option)
  + ### setOptionVoiceEnable

    public void setOptionVoiceEnable(boolean option,
    boolean bRestartClient)
  + ### getOptionVoiceMode

    public int getOptionVoiceMode()
  + ### setOptionVoiceMode

    public void setOptionVoiceMode(int option)
  + ### getOptionVoiceVADMode

    public int getOptionVoiceVADMode()
  + ### setOptionVoiceVADMode

    public void setOptionVoiceVADMode(int option)
  + ### getOptionVoiceAGCMode

    public int getOptionVoiceAGCMode()
  + ### setOptionVoiceAGCMode

    public void setOptionVoiceAGCMode(int option)
  + ### getOptionVoiceVolumeMic

    public int getOptionVoiceVolumeMic()
  + ### setOptionVoiceVolumeMic

    public void setOptionVoiceVolumeMic(int option)
  + ### getOptionVoiceVolumePlayers

    public int getOptionVoiceVolumePlayers()
  + ### setOptionVoiceVolumePlayers

    public void setOptionVoiceVolumePlayers(int option)
  + ### getOptionVoiceRecordDeviceName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionVoiceRecordDeviceName()
  + ### setOptionVoiceRecordDeviceName

    public void setOptionVoiceRecordDeviceName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") option)
  + ### getOptionVoiceRecordDevice

    public int getOptionVoiceRecordDevice()
  + ### setOptionVoiceRecordDevice

    public void setOptionVoiceRecordDevice(int option)
  + ### getMicVolumeIndicator

    public int getMicVolumeIndicator()
  + ### getMicVolumeError

    public boolean getMicVolumeError()
  + ### getServerVOIPEnable

    public boolean getServerVOIPEnable()
  + ### setTestingMicrophone

    public void setTestingMicrophone(boolean testing)
  + ### getOptionReloadDifficulty

    public int getOptionReloadDifficulty()
  + ### setOptionReloadDifficulty

    public void setOptionReloadDifficulty(int d)
  + ### getOptionRackProgress

    public boolean getOptionRackProgress()
  + ### setOptionRackProgress

    public void setOptionRackProgress(boolean b)
  + ### getOptionFontSize

    public int getOptionFontSize()
  + ### setOptionFontSize

    public void setOptionFontSize(int size)
  + ### getOptionFontSizeReal

    public int getOptionFontSizeReal()
  + ### getOptionMoodleSize

    public int getOptionMoodleSize()
  + ### setOptionMoodleSize

    public void setOptionMoodleSize(int size)
  + ### getOptionSidebarSize

    public int getOptionSidebarSize()
  + ### setOptionSidebarSize

    public void setOptionSidebarSize(int size)
  + ### getOptionActionProgressBarSize

    public int getOptionActionProgressBarSize()
  + ### setOptionActionProgressBarSize

    public void setOptionActionProgressBarSize(int size)
  + ### getOptionContextMenuFont

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionContextMenuFont()
  + ### setOptionContextMenuFont

    public void setOptionContextMenuFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") font)
  + ### getOptionCodeFontSize

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionCodeFontSize()
  + ### setOptionCodeFontSize

    public void setOptionCodeFontSize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") font)
  + ### getOptionInventoryFont

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionInventoryFont()
  + ### setOptionInventoryFont

    public void setOptionInventoryFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") font)
  + ### getOptionInventoryContainerSize

    public int getOptionInventoryContainerSize()
  + ### setOptionInventoryContainerSize

    public void setOptionInventoryContainerSize(int size)
  + ### getOptionTooltipFont

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionTooltipFont()
  + ### setOptionTooltipFont

    public void setOptionTooltipFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") font)
  + ### getOptionMeasurementFormat

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionMeasurementFormat()
  + ### setOptionMeasurementFormat

    public void setOptionMeasurementFormat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format)
  + ### getOptionClockFormat

    public int getOptionClockFormat()
  + ### getOptionClockSize

    public int getOptionClockSize()
  + ### setOptionClockFormat

    public void setOptionClockFormat(int fmt)
  + ### setOptionClockSize

    public void setOptionClockSize(int size)
  + ### getOptionClock24Hour

    public boolean getOptionClock24Hour()
  + ### setOptionClock24Hour

    public void setOptionClock24Hour(boolean b24Hour)
  + ### getOptionModsEnabled

    public boolean getOptionModsEnabled()
  + ### setOptionModsEnabled

    public void setOptionModsEnabled(boolean enabled)
  + ### getOptionBloodDecals

    public int getOptionBloodDecals()
  + ### setOptionBloodDecals

    public void setOptionBloodDecals(int n)
  + ### getOptionFocusloss

    public boolean getOptionFocusloss()
  + ### setOptionFocusloss

    public void setOptionFocusloss(boolean pause)
  + ### getOptionMapViewPause

    public boolean getOptionMapViewPause()
  + ### setOptionMapViewPause

    public void setOptionMapViewPause(boolean pause)
  + ### getOptionBorderlessWindow

    public boolean getOptionBorderlessWindow()
  + ### setOptionBorderlessWindow

    public void setOptionBorderlessWindow(boolean b)
  + ### getOptionLockCursorToWindow

    public boolean getOptionLockCursorToWindow()
  + ### setOptionLockCursorToWindow

    public void setOptionLockCursorToWindow(boolean b)
  + ### allowOptionTextureCompression

    public boolean allowOptionTextureCompression()
  + ### getOptionTextureCompression

    public boolean getOptionTextureCompression()
  + ### setOptionTextureCompression

    public void setOptionTextureCompression(boolean b)
  + ### getOptionTexture2x

    public boolean getOptionTexture2x()
  + ### setOptionTexture2x

    public void setOptionTexture2x(boolean b)
  + ### getOptionHighResPlacedItems

    public boolean getOptionHighResPlacedItems()
  + ### setOptionHighResPlacedItems

    public void setOptionHighResPlacedItems(boolean b)
  + ### getOptionMaxTextureSize

    public int getOptionMaxTextureSize()
  + ### setOptionMaxTextureSize

    public void setOptionMaxTextureSize(int v)
  + ### getOptionMaxVehicleTextureSize

    public int getOptionMaxVehicleTextureSize()
  + ### setOptionMaxVehicleTextureSize

    public void setOptionMaxVehicleTextureSize(int v)
  + ### getMaxTextureSizeFromFlags

    public int getMaxTextureSizeFromFlags(int flags)
  + ### getMaxTextureSizeFromOption

    public int getMaxTextureSizeFromOption(int option)
  + ### getMaxTextureSize

    public int getMaxTextureSize()
  + ### getMaxVehicleTextureSize

    public int getMaxVehicleTextureSize()
  + ### getOptionModelTextureMipmaps

    public boolean getOptionModelTextureMipmaps()
  + ### setOptionModelTextureMipmaps

    public void setOptionModelTextureMipmaps(boolean b)
  + ### getOptionZoomLevels1x

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionZoomLevels1x()
  + ### setOptionZoomLevels1x

    public void setOptionZoomLevels1x([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") levels)
  + ### getOptionZoomLevels2x

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionZoomLevels2x()
  + ### setOptionZoomLevels2x

    public void setOptionZoomLevels2x([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") levels)
  + ### getDefaultZoomLevels

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getDefaultZoomLevels()
  + ### getOptionScreenFilter

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionScreenFilter()
  + ### setOptionScreenFilter

    public void setOptionScreenFilter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### getScreenFilter

    public int getScreenFilter()
  + ### setOptionActiveController

    public void setOptionActiveController(int controllerIndex,
    boolean active)
  + ### getOptionActiveController

    public boolean getOptionActiveController([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
  + ### isOptionShowChatTimestamp

    public boolean isOptionShowChatTimestamp()
  + ### setOptionShowChatTimestamp

    public void setOptionShowChatTimestamp(boolean optionShowChatTimestamp)
  + ### isOptionShowChatTitle

    public boolean isOptionShowChatTitle()
  + ### getOptionChatFontSize

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionChatFontSize()
  + ### setOptionChatFontSize

    public void setOptionChatFontSize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionChatFontSize)
  + ### setOptionShowChatTitle

    public void setOptionShowChatTitle(boolean optionShowChatTitle)
  + ### getOptionMinChatOpaque

    public float getOptionMinChatOpaque()
  + ### setOptionMinChatOpaque

    public void setOptionMinChatOpaque(float optionMinChatOpaque)
  + ### getOptionMaxChatOpaque

    public float getOptionMaxChatOpaque()
  + ### setOptionMaxChatOpaque

    public void setOptionMaxChatOpaque(float optionMaxChatOpaque)
  + ### getOptionChatFadeTime

    public float getOptionChatFadeTime()
  + ### setOptionChatFadeTime

    public void setOptionChatFadeTime(float optionChatFadeTime)
  + ### getOptionChatOpaqueOnFocus

    public boolean getOptionChatOpaqueOnFocus()
  + ### setOptionChatOpaqueOnFocus

    public void setOptionChatOpaqueOnFocus(boolean optionChatOpaqueOnFocus)
  + ### getOptionTemperatureDisplayCelsius

    public boolean getOptionTemperatureDisplayCelsius()
  + ### getOptionUIFBO

    public boolean getOptionUIFBO()
  + ### setOptionUIFBO

    public void setOptionUIFBO(boolean use)
  + ### getOptionMeleeOutline

    public boolean getOptionMeleeOutline()
  + ### setOptionMeleeOutline

    public void setOptionMeleeOutline(boolean toggle)
  + ### getOptionUIRenderFPS

    public int getOptionUIRenderFPS()
  + ### setOptionUIRenderFPS

    public void setOptionUIRenderFPS(int fps)
  + ### setOptionRadialMenuKeyToggle

    public void setOptionRadialMenuKeyToggle(boolean toggle)
  + ### getOptionRadialMenuKeyToggle

    public boolean getOptionRadialMenuKeyToggle()
  + ### setOptionReloadRadialInstant

    public void setOptionReloadRadialInstant(boolean enable)
  + ### getOptionReloadRadialInstant

    public boolean getOptionReloadRadialInstant()
  + ### setOptionPanCameraWhileAiming

    public void setOptionPanCameraWhileAiming(boolean enable)
  + ### getOptionPanCameraWhileAiming

    public boolean getOptionPanCameraWhileAiming()
  + ### setOptionPanCameraWhileDriving

    public void setOptionPanCameraWhileDriving(boolean enable)
  + ### getOptionPanCameraWhileDriving

    public boolean getOptionPanCameraWhileDriving()
  + ### getOptionCycleContainerKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionCycleContainerKey()
  + ### setOptionCycleContainerKey

    public void setOptionCycleContainerKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getOptionDropItemsOnSquareCenter

    public boolean getOptionDropItemsOnSquareCenter()
  + ### setOptionDropItemsOnSquareCenter

    public void setOptionDropItemsOnSquareCenter(boolean b)
  + ### getOptionTimedActionGameSpeedReset

    public boolean getOptionTimedActionGameSpeedReset()
  + ### setOptionTimedActionGameSpeedReset

    public void setOptionTimedActionGameSpeedReset(boolean b)
  + ### getOptionShoulderButtonContainerSwitch

    public int getOptionShoulderButtonContainerSwitch()
  + ### setOptionShoulderButtonContainerSwitch

    public void setOptionShoulderButtonContainerSwitch(int v)
  + ### getOptionControllerButtonStyle

    public int getOptionControllerButtonStyle()
  + ### setOptionControllerButtonStyle

    public void setOptionControllerButtonStyle(int v)
  + ### onOptionControllerButtonStyleChanged

    public void onOptionControllerButtonStyleChanged([ConfigOption](../config/ConfigOption.html "class in zombie.config") sender)
  + ### getOptionControllerButtonStyleString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionControllerButtonStyleString()
  + ### setOptionGamepadBindingPreset

    public void setOptionGamepadBindingPreset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newValue)
  + ### onOptionGamepadBindingPresetChanged

    public void onOptionGamepadBindingPresetChanged([ConfigOption](../config/ConfigOption.html "class in zombie.config") sender)
  + ### getOptionGamepadBindingPreset

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionGamepadBindingPreset()
  + ### getOptionSingleContextMenu

    public boolean getOptionSingleContextMenu(int playerIndex)
  + ### setOptionSingleContextMenu

    public void setOptionSingleContextMenu(int playerIndex,
    boolean b)
  + ### getOptionAutoDrink

    public boolean getOptionAutoDrink()
  + ### setOptionAutoDrink

    public void setOptionAutoDrink(boolean enable)
  + ### getOptionAutoRevealPrintMediaMapLocations

    public boolean getOptionAutoRevealPrintMediaMapLocations()
  + ### setOptionAutoRevealPrintMediaMapLocations

    public void setOptionAutoRevealPrintMediaMapLocations(boolean enable)
  + ### getOptionAutoWalkContainer

    public boolean getOptionAutoWalkContainer()
  + ### setOptionAutoWalkContainer

    public void setOptionAutoWalkContainer(boolean enable)
  + ### getOptionCorpseShadows

    public boolean getOptionCorpseShadows()
  + ### setOptionCorpseShadows

    public void setOptionCorpseShadows(boolean enable)
  + ### getOptionLeaveKeyInIgnition

    public boolean getOptionLeaveKeyInIgnition()
  + ### setOptionLeaveKeyInIgnition

    public void setOptionLeaveKeyInIgnition(boolean enable)
  + ### getOptionSearchModeOverlayEffect

    public int getOptionSearchModeOverlayEffect()
  + ### setOptionSearchModeOverlayEffect

    public void setOptionSearchModeOverlayEffect(int v)
  + ### getOptionSimpleClothingTextures

    public int getOptionSimpleClothingTextures()
  + ### setOptionSimpleClothingTextures

    public void setOptionSimpleClothingTextures(int v)
  + ### isOptionSimpleClothingTextures

    public boolean isOptionSimpleClothingTextures(boolean bZombie)
  + ### getOptionSimpleWeaponTextures

    public boolean getOptionSimpleWeaponTextures()
  + ### setOptionSimpleWeaponTextures

    public void setOptionSimpleWeaponTextures(boolean enable)
  + ### getOptionIgnoreProneZombieRange

    public int getOptionIgnoreProneZombieRange()
  + ### setOptionIgnoreProneZombieRange

    public void setOptionIgnoreProneZombieRange(int i)
  + ### getIgnoreProneZombieRange

    public float getIgnoreProneZombieRange()
  + ### readPerPlayerBoolean

    private void readPerPlayerBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    boolean[] flags)
  + ### getPerPlayerBooleanString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPerPlayerBooleanString(boolean[] flags)
  + ### ResetLua

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void ResetLua(boolean sp,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reason)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Deprecated.

    Throws:
    :   `IOException`
  + ### ResetLua

    public void ResetLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") activeMods,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reason)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### DelayResetLua

    public void DelayResetLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") activeMods,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reason)
  + ### CheckDelayResetLua

    public void CheckDelayResetLua()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isShowPing

    public boolean isShowPing()
  + ### setShowPing

    public void setShowPing(boolean showPing)
  + ### isForceSnow

    public boolean isForceSnow()
  + ### setForceSnow

    public void setForceSnow(boolean forceSnow)
  + ### isZombieGroupSound

    public boolean isZombieGroupSound()
  + ### setZombieGroupSound

    public void setZombieGroupSound(boolean zombieGroupSound)
  + ### getBlinkingMoodle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBlinkingMoodle()
  + ### setBlinkingMoodle

    public void setBlinkingMoodle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") blinkingMoodle)
  + ### isTutorialDone

    public boolean isTutorialDone()
  + ### setTutorialDone

    public void setTutorialDone(boolean done)
  + ### isVehiclesWarningShow

    public boolean isVehiclesWarningShow()
  + ### setVehiclesWarningShow

    public void setVehiclesWarningShow(boolean done)
  + ### initPoisonousBerry

    public void initPoisonousBerry()
  + ### initPoisonousMushroom

    public void initPoisonousMushroom()
  + ### getPoisonousBerry

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPoisonousBerry()
  + ### setPoisonousBerry

    public void setPoisonousBerry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousBerry)
  + ### getPoisonousMushroom

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPoisonousMushroom()
  + ### setPoisonousMushroom

    public void setPoisonousMushroom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") poisonousMushroom)
  + ### isDoneNewSaveFolder

    public boolean isDoneNewSaveFolder()
  + ### setDoneNewSaveFolder

    public void setDoneNewSaveFolder(boolean doneNewSaveFolder)
  + ### getTileScale

    public static int getTileScale()
  + ### isSelectingAll

    public boolean isSelectingAll()
  + ### setIsSelectingAll

    public void setIsSelectingAll(boolean isSelectingAll)
  + ### getContentTranslationsEnabled

    public boolean getContentTranslationsEnabled()
  + ### setContentTranslationsEnabled

    public void setContentTranslationsEnabled(boolean b)
  + ### isShowYourUsername

    public boolean isShowYourUsername()
  + ### setShowYourUsername

    public void setShowYourUsername(boolean showYourUsername)
  + ### isPopulateServerListOnStart

    public boolean isPopulateServerListOnStart()
  + ### setPopulateServerListOnStart

    public void setPopulateServerListOnStart(boolean populateServerListOnStart)
  + ### getMpTextColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getMpTextColor()
  + ### setMpTextColor

    public void setMpTextColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") mpTextColor)
  + ### isAzerty

    public boolean isAzerty()
  + ### setAzerty

    public void setAzerty(boolean isAzerty)
  + ### getObjectHighlitedColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getObjectHighlitedColor()
  + ### setObjectHighlitedColor

    public void setObjectHighlitedColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") objectHighlitedColor)
  + ### getWorldItemHighlightColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getWorldItemHighlightColor()
  + ### setWorldItemHighlightColor

    public void setWorldItemHighlightColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") colorInfo)
  + ### getGoodHighlitedColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getGoodHighlitedColor()
  + ### setGoodHighlitedColor

    public void setGoodHighlitedColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") goodHighlitedColor)
  + ### getBadHighlitedColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getBadHighlitedColor()
  + ### setBadHighlitedColor

    public void setBadHighlitedColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") badHighlitedColor)
  + ### getOptionColorblindPatterns

    public boolean getOptionColorblindPatterns()
  + ### setOptionColorblindPatterns

    public void setOptionColorblindPatterns(boolean enable)
  + ### getOptionEnableDyslexicFont

    public boolean getOptionEnableDyslexicFont()
  + ### setOptionEnableDyslexicFont

    public void setOptionEnableDyslexicFont(boolean enable)
  + ### getOptionDisableLightningDuringStorms

    public boolean getOptionDisableLightningDuringStorms()
  + ### setOptionDisableLightningDuringStorms

    public void setOptionDisableLightningDuringStorms(boolean enable)
  + ### getSeenUpdateText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeenUpdateText()
  + ### setSeenUpdateText

    public void setSeenUpdateText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seenUpdateText)
  + ### isToggleToAim

    public boolean isToggleToAim()
  + ### setToggleToAim

    public void setToggleToAim(boolean enable)
  + ### isToggleToRun

    public boolean isToggleToRun()
  + ### setToggleToRun

    public void setToggleToRun(boolean toggleToRun)
  + ### getXAngle

    public int getXAngle(int width,
    float angle)
  + ### getYAngle

    public int getYAngle(int width,
    float angle)
  + ### isCelsius

    public boolean isCelsius()
  + ### setCelsius

    public void setCelsius(boolean celsius)
  + ### isInDebug

    public boolean isInDebug()
  + ### isRiversideDone

    public boolean isRiversideDone()
  + ### setRiversideDone

    public void setRiversideDone(boolean riversideDone)
  + ### isNoSave

    public boolean isNoSave()
  + ### setNoSave

    public void setNoSave(boolean noSave)
  + ### isShowFirstTimeVehicleTutorial

    public boolean isShowFirstTimeVehicleTutorial()
  + ### setShowFirstTimeVehicleTutorial

    public void setShowFirstTimeVehicleTutorial(boolean showFirstTimeVehicleTutorial)
  + ### getOptionDisplayAsCelsius

    public boolean getOptionDisplayAsCelsius()
  + ### setOptionDisplayAsCelsius

    public void setOptionDisplayAsCelsius(boolean b)
  + ### isShowFirstTimeWeatherTutorial

    public boolean isShowFirstTimeWeatherTutorial()
  + ### setShowFirstTimeWeatherTutorial

    public void setShowFirstTimeWeatherTutorial(boolean showFirstTimeWeatherTutorial)
  + ### getOptionDoVideoEffects

    public boolean getOptionDoVideoEffects()
  + ### setOptionDoVideoEffects

    public void setOptionDoVideoEffects(boolean b)
  + ### getOptionDoWindSpriteEffects

    public boolean getOptionDoWindSpriteEffects()
  + ### setOptionDoWindSpriteEffects

    public void setOptionDoWindSpriteEffects(boolean b)
  + ### getOptionDoDoorSpriteEffects

    public boolean getOptionDoDoorSpriteEffects()
  + ### setOptionDoDoorSpriteEffects

    public void setOptionDoDoorSpriteEffects(boolean b)
  + ### getOptionDoContainerOutline

    public boolean getOptionDoContainerOutline()
  + ### setOptionDoContainerOutline

    public void setOptionDoContainerOutline(boolean b)
  + ### setOptionUpdateSneakButton

    public void setOptionUpdateSneakButton(boolean b)
  + ### getOptionUpdateSneakButton

    public boolean getOptionUpdateSneakButton()
  + ### isShowFirstTimeSneakTutorial

    public boolean isShowFirstTimeSneakTutorial()
  + ### setShowFirstTimeSneakTutorial

    public void setShowFirstTimeSneakTutorial(boolean showFirstTimeSneakTutorial)
  + ### getShownWelcomeMessageVersion

    public double getShownWelcomeMessageVersion()
  + ### setShownWelcomeMessageVersion

    public void setShownWelcomeMessageVersion(double value)
  + ### isShowFirstTimeSearchTutorial

    public boolean isShowFirstTimeSearchTutorial()
  + ### setShowFirstTimeSearchTutorial

    public void setShowFirstTimeSearchTutorial(boolean showFirstTimeSearchTutorial)
  + ### getTermsOfServiceVersion

    public int getTermsOfServiceVersion()
  + ### setTermsOfServiceVersion

    public void setTermsOfServiceVersion(int v)
  + ### setOptiondblTapJogToSprint

    public void setOptiondblTapJogToSprint(boolean dbltap)
  + ### isOptiondblTapJogToSprint

    public boolean isOptiondblTapJogToSprint()
  + ### isToggleToSprint

    public boolean isToggleToSprint()
  + ### setToggleToSprint

    public void setToggleToSprint(boolean toggleToSprint)
  + ### getIsoCursorVisibility

    public int getIsoCursorVisibility()
  + ### setIsoCursorVisibility

    public void setIsoCursorVisibility(int isoCursorVisibility)
  + ### getOptionShowCursorWhileAiming

    public boolean getOptionShowCursorWhileAiming()
  + ### setOptionShowCursorWhileAiming

    public void setOptionShowCursorWhileAiming(boolean show)
  + ### gotNewBelt

    public boolean gotNewBelt()
  + ### setGotNewBelt

    public void setGotNewBelt(boolean gotit)
  + ### setAnimPopupDone

    public void setAnimPopupDone(boolean done)
  + ### isAnimPopupDone

    public boolean isAnimPopupDone()
  + ### setModsPopupDone

    public void setModsPopupDone(boolean done)
  + ### isModsPopupDone

    public boolean isModsPopupDone()
  + ### isRenderPrecipIndoors

    public boolean isRenderPrecipIndoors()
  + ### setRenderPrecipIndoors

    public void setRenderPrecipIndoors(boolean optionRenderPrecipIndoors)
  + ### getOptionPrecipitationSpeedMultiplier

    public float getOptionPrecipitationSpeedMultiplier()
  + ### setOptionPrecipitationSpeedMultiplier

    public void setOptionPrecipitationSpeedMultiplier(float f)
  + ### isCollideZombies

    public boolean isCollideZombies()
  + ### setCollideZombies

    public void setCollideZombies(boolean collideZombies)
  + ### isFlashIsoCursor

    public boolean isFlashIsoCursor()
  + ### setFlashIsoCursor

    public void setFlashIsoCursor(boolean flashIsoCursor)
  + ### isOptionProgressBar

    public boolean isOptionProgressBar()
  + ### setOptionProgressBar

    public void setOptionProgressBar(boolean optionProgressBar)
  + ### setOptionLanguageName

    public void setOptionLanguageName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOptionLanguageName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionLanguageName()
  + ### getOptionRenderPrecipitation

    public int getOptionRenderPrecipitation()
  + ### setOptionRenderPrecipitation

    public void setOptionRenderPrecipitation(int optionRenderPrecipitation)
  + ### setOptionAutoProneAtk

    public void setOptionAutoProneAtk(boolean optionAutoProneAtk)
  + ### isOptionAutoProneAtk

    public boolean isOptionAutoProneAtk()
  + ### setOption3DGroundItem

    public void setOption3DGroundItem(boolean option3Dgrounditem)
  + ### isOption3DGroundItem

    public boolean isOption3DGroundItem()
  + ### getOptionOnStartup

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getOptionOnStartup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setOptionOnStartup

    public void setOptionOnStartup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)
  + ### countMissing3DItems

    public void countMissing3DItems()
  + ### getOptionShowItemModInfo

    public boolean getOptionShowItemModInfo()
  + ### setOptionShowItemModInfo

    public void setOptionShowItemModInfo(boolean b)
  + ### getOptionShowCraftingXP

    public boolean getOptionShowCraftingXP()
  + ### setOptionShowCraftingXP

    public void setOptionShowCraftingXP(boolean b)
  + ### getOptionShowSurvivalGuide

    public boolean getOptionShowSurvivalGuide()
  + ### setOptionShowSurvivalGuide

    public void setOptionShowSurvivalGuide(boolean b)
  + ### getOptionShowFirstAnimalZoneInfo

    public boolean getOptionShowFirstAnimalZoneInfo()
  + ### setOptionShowFirstAnimalZoneInfo

    public void setOptionShowFirstAnimalZoneInfo(boolean b)
  + ### getOptionEnableLeftJoystickRadialMenu

    public boolean getOptionEnableLeftJoystickRadialMenu()
  + ### setOptionEnableLeftJoystickRadialMenu

    public void setOptionEnableLeftJoystickRadialMenu(boolean b)
  + ### getOptionMacOSIgnoreMouseWheelAcceleration

    public boolean getOptionMacOSIgnoreMouseWheelAcceleration()
  + ### setOptionMacOSIgnoreMouseWheelAcceleration

    public void setOptionMacOSIgnoreMouseWheelAcceleration(boolean b)
  + ### getOptionMacOSMapHorizontalMouseWheelToVertical

    public boolean getOptionMacOSMapHorizontalMouseWheelToVertical()
  + ### setOptionMacOSMapHorizontalMouseWheelToVertical

    public void setOptionMacOSMapHorizontalMouseWheelToVertical(boolean b)
  + ### getVersionNumber

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVersionNumber()
  + ### setAnimalCheat

    public void setAnimalCheat(boolean cheat)
  + ### setDisplayPlayerModel

    public void setDisplayPlayerModel(boolean display)
  + ### isDisplayPlayerModel

    public boolean isDisplayPlayerModel()
  + ### setDisplayCursor

    public void setDisplayCursor(boolean display)
  + ### isDisplayCursor

    public boolean isDisplayCursor()
  + ### getOptionShowAimTexture

    public boolean getOptionShowAimTexture()
  + ### setOptionShowAimTexture

    public void setOptionShowAimTexture(boolean show)
  + ### getOptionShowReticleTexture

    public boolean getOptionShowReticleTexture()
  + ### setOptionShowReticleTexture

    public void setOptionShowReticleTexture(boolean show)
  + ### getOptionShowValidTargetReticleTexture

    public boolean getOptionShowValidTargetReticleTexture()
  + ### setOptionShowValidTargetReticleTexture

    public void setOptionShowValidTargetReticleTexture(boolean show)
  + ### getOptionReticleMode

    public int getOptionReticleMode()
  + ### setOptionReticleMode

    public void setOptionReticleMode(int mode)
  + ### setOptionAimTextureIndex

    public void setOptionAimTextureIndex(int index)
  + ### getOptionAimTextureIndex

    public int getOptionAimTextureIndex()
  + ### setOptionReticleTextureIndex

    public void setOptionReticleTextureIndex(int index)
  + ### getOptionReticleTextureIndex

    public int getOptionReticleTextureIndex()
  + ### setOptionValidTargetReticleTextureIndex

    public void setOptionValidTargetReticleTextureIndex(int index)
  + ### getOptionValidTargetReticleTextureIndex

    public int getOptionValidTargetReticleTextureIndex()
  + ### setOptionCrosshairTextureIndex

    public void setOptionCrosshairTextureIndex(int index)
  + ### getOptionCrosshairTextureIndex

    public int getOptionCrosshairTextureIndex()
  + ### getTargetColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getTargetColor()
  + ### setTargetColor

    public void setTargetColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") colorInfo)
  + ### getNoTargetColor

    public [ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") getNoTargetColor()
  + ### setNoTargetColor

    public void setNoTargetColor([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") colorInfo)
  + ### getOptionMaxCrosshairOffset

    public int getOptionMaxCrosshairOffset()
  + ### setOptionMaxCrosshairOffset

    public void setOptionMaxCrosshairOffset(int maxCrosshairOffset)
  + ### getOptionReticleCameraZoom

    public boolean getOptionReticleCameraZoom()
  + ### setOptionReticleCameraZoom

    public void setOptionReticleCameraZoom(boolean optionReticleCameraZoom)
  + ### getIsoCursorAlpha

    public float getIsoCursorAlpha()
  + ### debugOutputMissingItemSpawn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugOutputMissingItemSpawn()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### debugOutputMissingCLothingSpawn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugOutputMissingCLothingSpawn()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### debugOutputMissingSpawn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugOutputMissingSpawn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directory,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getClothingSpawnString

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClothingSpawnString([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") scriptFolder)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getClothingStrings

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClothingStrings([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") scriptFolder)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getSelectedMap

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedMap()
  + ### setSelectedMap

    public void setSelectedMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") selectedMap)
  + ### getConsoleDotTxtSizeKB

    public int getConsoleDotTxtSizeKB()
  + ### setConsoleDotTxtSizeKB

    public void setConsoleDotTxtSizeKB(int kilobytes)
  + ### setConsoleDotTxtSizeKB

    public void setConsoleDotTxtSizeKB([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") kilobytesString)
  + ### getOptionUsePhysicsHitReaction

    public boolean getOptionUsePhysicsHitReaction()
  + ### setOptionUsePhysicsHitReaction

    public void setOptionUsePhysicsHitReaction(boolean usePhysicsHitReaction)
  + ### getMaxActiveRagdolls

    public int getMaxActiveRagdolls()
  + ### setMaxActiveRagdolls

    public void setMaxActiveRagdolls(int maxActiveRagdolls)
  + ### getOptionWorldMapBrightness

    public double getOptionWorldMapBrightness()
  + ### setOptionWorldMapBrightness

    public void setOptionWorldMapBrightness(double d)
  + ### getOptionShowWelcomeMessage

    public boolean getOptionShowWelcomeMessage()
  + ### setOptionShowWelcomeMessage

    public void setOptionShowWelcomeMessage(boolean showWelcomeMessage)
  + ### getAccountUsed

    public [Account](../network/Account.html "class in zombie.network") getAccountUsed()
  + ### setAccountUsed

    public void setAccountUsed([Account](../network/Account.html "class in zombie.network") accountUsed)
  + ### isDevMode

    public static boolean isDevMode()