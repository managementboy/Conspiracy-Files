[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [disableSimulation](#disableSimulation)
   2. [disableFxUpdate](#disableFxUpdate)
   3. [disableWeatherGeneration](#disableWeatherGeneration)
   4. [PUDDLES\_BROADCAST\_INTERVAL\_MS](#PUDDLES_BROADCAST_INTERVAL_MS)
   5. [FRONT\_COLD](#FRONT_COLD)
   6. [FRONT\_STATIONARY](#FRONT_STATIONARY)
   7. [FRONT\_WARM](#FRONT_WARM)
   8. [MAX\_WINDSPEED\_KPH](#MAX_WINDSPEED_KPH)
   9. [MAX\_WINDSPEED\_MPH](#MAX_WINDSPEED_MPH)
   10. [season](#season)
   11. [lastMinuteStamp](#lastMinuteStamp)
   12. [modDataTable](#modDataTable)
   13. [airMass](#airMass)
   14. [airMassDaily](#airMassDaily)
   15. [airMassTemperature](#airMassTemperature)
   16. [baseTemperature](#baseTemperature)
   17. [snowFall](#snowFall)
   18. [snowStrength](#snowStrength)
   19. [snowMeltStrength](#snowMeltStrength)
   20. [snowFracNow](#snowFracNow)
   21. [canDoWinterSprites](#canDoWinterSprites)
   22. [wasForceSnow](#wasForceSnow)
   23. [windPower](#windPower)
   24. [weatherPeriod](#weatherPeriod)
   25. [thunderStorm](#thunderStorm)
   26. [simplexOffsetA](#simplexOffsetA)
   27. [simplexOffsetB](#simplexOffsetB)
   28. [simplexOffsetC](#simplexOffsetC)
   29. [simplexOffsetD](#simplexOffsetD)
   30. [dayDoFog](#dayDoFog)
   31. [dayFogStrength](#dayFogStrength)
   32. [gt](#gt)
   33. [worldAgeHours](#worldAgeHours)
   34. [tickIsClimateTick](#tickIsClimateTick)
   35. [tickIsDayChange](#tickIsDayChange)
   36. [lastHourStamp](#lastHourStamp)
   37. [tickIsHourChange](#tickIsHourChange)
   38. [tickIsTenMins](#tickIsTenMins)
   39. [currentFront](#currentFront)
   40. [colDay](#colDay)
   41. [colDusk](#colDusk)
   42. [colDawn](#colDawn)
   43. [colNight](#colNight)
   44. [colNightNoMoon](#colNightNoMoon)
   45. [colNightMoon](#colNightMoon)
   46. [colTemp](#colTemp)
   47. [colFog](#colFog)
   48. [colFogLegacy](#colFogLegacy)
   49. [colFogNew](#colFogNew)
   50. [fogTintStorm](#fogTintStorm)
   51. [fogTintTropical](#fogTintTropical)
   52. [instance](#instance)
   53. [winterIsComing](#winterIsComing)
   54. [theDescendingFog](#theDescendingFog)
   55. [aStormIsComing](#aStormIsComing)
   56. [climateValues](#climateValues)
   57. [climateForecaster](#climateForecaster)
   58. [climateHistory](#climateHistory)
   59. [dayLightLagged](#dayLightLagged)
   60. [nightLagged](#nightLagged)
   61. [desaturation](#desaturation)
   62. [globalLightIntensity](#globalLightIntensity)
   63. [nightStrength](#nightStrength)
   64. [precipitationIntensity](#precipitationIntensity)
   65. [temperature](#temperature)
   66. [fogIntensity](#fogIntensity)
   67. [windIntensity](#windIntensity)
   68. [windAngleIntensity](#windAngleIntensity)
   69. [cloudIntensity](#cloudIntensity)
   70. [ambient](#ambient)
   71. [viewDistance](#viewDistance)
   72. [dayLightStrength](#dayLightStrength)
   73. [humidity](#humidity)
   74. [globalLight](#globalLight)
   75. [colorNewFog](#colorNewFog)
   76. [precipitationIsSnow](#precipitationIsSnow)
   77. [FLOAT\_DESATURATION](#FLOAT_DESATURATION)
   78. [FLOAT\_GLOBAL\_LIGHT\_INTENSITY](#FLOAT_GLOBAL_LIGHT_INTENSITY)
   79. [FLOAT\_NIGHT\_STRENGTH](#FLOAT_NIGHT_STRENGTH)
   80. [FLOAT\_PRECIPITATION\_INTENSITY](#FLOAT_PRECIPITATION_INTENSITY)
   81. [FLOAT\_TEMPERATURE](#FLOAT_TEMPERATURE)
   82. [FLOAT\_FOG\_INTENSITY](#FLOAT_FOG_INTENSITY)
   83. [FLOAT\_WIND\_INTENSITY](#FLOAT_WIND_INTENSITY)
   84. [FLOAT\_WIND\_ANGLE\_INTENSITY](#FLOAT_WIND_ANGLE_INTENSITY)
   85. [FLOAT\_CLOUD\_INTENSITY](#FLOAT_CLOUD_INTENSITY)
   86. [FLOAT\_AMBIENT](#FLOAT_AMBIENT)
   87. [FLOAT\_VIEW\_DISTANCE](#FLOAT_VIEW_DISTANCE)
   88. [FLOAT\_DAYLIGHT\_STRENGTH](#FLOAT_DAYLIGHT_STRENGTH)
   89. [FLOAT\_HUMIDITY](#FLOAT_HUMIDITY)
   90. [FLOAT\_MAX](#FLOAT_MAX)
   91. [climateFloats](#climateFloats)
   92. [COLOR\_GLOBAL\_LIGHT](#COLOR_GLOBAL_LIGHT)
   93. [COLOR\_NEW\_FOG](#COLOR_NEW_FOG)
   94. [COLOR\_MAX](#COLOR_MAX)
   95. [climateColors](#climateColors)
   96. [BOOL\_IS\_SNOW](#BOOL_IS_SNOW)
   97. [BOOL\_MAX](#BOOL_MAX)
   98. [climateBooleans](#climateBooleans)
   99. [AVG\_FAV\_AIR\_TEMPERATURE](#AVG_FAV_AIR_TEMPERATURE)
   100. [weatherOverride](#weatherOverride)
   101. [fogOverride](#fogOverride)
   102. [windNoiseOffset](#windNoiseOffset)
   103. [windNoiseBase](#windNoiseBase)
   104. [windNoiseFinal](#windNoiseFinal)
   105. [windTickFinal](#windTickFinal)
   106. [colFlare](#colFlare)
   107. [flareLaunched](#flareLaunched)
   108. [flareIntensity](#flareIntensity)
   109. [flareIntens](#flareIntens)
   110. [flareMaxLifeTime](#flareMaxLifeTime)
   111. [flareLifeTime](#flareLifeTime)
   112. [nextRandomTargetIntens](#nextRandomTargetIntens)
   113. [fogLerpValue](#fogLerpValue)
   114. [seasonColorDawn](#seasonColorDawn)
   115. [seasonColorDay](#seasonColorDay)
   116. [seasonColorDusk](#seasonColorDusk)
   117. [previousDay](#previousDay)
   118. [currentDay](#currentDay)
   119. [nextDay](#nextDay)
   120. [PacketUpdateClimateVars](#PacketUpdateClimateVars)
   121. [PacketWeatherUpdate](#PacketWeatherUpdate)
   122. [PacketThunderEvent](#PacketThunderEvent)
   123. [PacketFlare](#PacketFlare)
   124. [PacketAdminVarsUpdate](#PacketAdminVarsUpdate)
   125. [PacketRequestAdminVars](#PacketRequestAdminVars)
   126. [PacketClientChangedAdminVars](#PacketClientChangedAdminVars)
   127. [PacketClientChangedWeather](#PacketClientChangedWeather)
   128. [networkLerp](#networkLerp)
   129. [networkUpdateStamp](#networkUpdateStamp)
   130. [networkLerpTime](#networkLerpTime)
   131. [networkLerpTimeBase](#networkLerpTimeBase)
   132. [networkAdjustVal](#networkAdjustVal)
   133. [networkPrint](#networkPrint)
   134. [puddlesSyncLimit](#puddlesSyncLimit)
   135. [netInfo](#netInfo)
   136. [climateValuesFronts](#climateValuesFronts)
   137. [windAngles](#windAngles)
   138. [windAngleStr](#windAngleStr)
7. [Constructor Details](#constructor-detail)
   1. [ClimateManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getMaxWindspeedKph()](#getMaxWindspeedKph())
   2. [getMaxWindspeedMph()](#getMaxWindspeedMph())
   3. [ToKph(float)](#ToKph(float))
   4. [ToMph(float)](#ToMph(float))
   5. [getInstance()](#getInstance())
   6. [setInstance(ClimateManager)](#setInstance(zombie.iso.weather.ClimateManager))
   7. [getColNight()](#getColNight())
   8. [getColNightNoMoon()](#getColNightNoMoon())
   9. [getColNightMoon()](#getColNightMoon())
   10. [getColFog()](#getColFog())
   11. [getColFogLegacy()](#getColFogLegacy())
   12. [getColFogNew()](#getColFogNew())
   13. [getFogTintStorm()](#getFogTintStorm())
   14. [getFogTintTropical()](#getFogTintTropical())
   15. [setup()](#setup())
   16. [getFloatMax()](#getFloatMax())
   17. [initClimateFloat(int, String)](#initClimateFloat(int,java.lang.String))
   18. [getClimateFloat(int)](#getClimateFloat(int))
   19. [getColorMax()](#getColorMax())
   20. [initClimateColor(int, String)](#initClimateColor(int,java.lang.String))
   21. [getClimateColor(int)](#getClimateColor(int))
   22. [getBoolMax()](#getBoolMax())
   23. [initClimateBool(int, String)](#initClimateBool(int,java.lang.String))
   24. [getClimateBool(int)](#getClimateBool(int))
   25. [setEnabledSimulation(boolean)](#setEnabledSimulation(boolean))
   26. [getEnabledSimulation()](#getEnabledSimulation())
   27. [getEnabledFxUpdate()](#getEnabledFxUpdate())
   28. [setEnabledFxUpdate(boolean)](#setEnabledFxUpdate(boolean))
   29. [getEnabledWeatherGeneration()](#getEnabledWeatherGeneration())
   30. [setEnabledWeatherGeneration(boolean)](#setEnabledWeatherGeneration(boolean))
   31. [getGlobalLightInternal()](#getGlobalLightInternal())
   32. [getGlobalLight()](#getGlobalLight())
   33. [getGlobalLightIntensity()](#getGlobalLightIntensity())
   34. [getColorNewFog()](#getColorNewFog())
   35. [setNightStrength(float)](#setNightStrength(float))
   36. [getDesaturation()](#getDesaturation())
   37. [setDesaturation(float)](#setDesaturation(float))
   38. [getAirMass()](#getAirMass())
   39. [getAirMassDaily()](#getAirMassDaily())
   40. [getAirMassTemperature()](#getAirMassTemperature())
   41. [getDayLightStrength()](#getDayLightStrength())
   42. [getNightStrength()](#getNightStrength())
   43. [getDayMeanTemperature()](#getDayMeanTemperature())
   44. [getTemperature()](#getTemperature())
   45. [getBaseTemperature()](#getBaseTemperature())
   46. [getSnowStrength()](#getSnowStrength())
   47. [getPrecipitationIsSnow()](#getPrecipitationIsSnow())
   48. [getPrecipitationIntensity()](#getPrecipitationIntensity())
   49. [getFogIntensity()](#getFogIntensity())
   50. [getWindIntensity()](#getWindIntensity())
   51. [getWindAngleIntensity()](#getWindAngleIntensity())
   52. [getCorrectedWindAngleIntensity()](#getCorrectedWindAngleIntensity())
   53. [getWindPower()](#getWindPower())
   54. [getWindspeedKph()](#getWindspeedKph())
   55. [getCloudIntensity()](#getCloudIntensity())
   56. [getAmbient()](#getAmbient())
   57. [getViewDistance()](#getViewDistance())
   58. [getHumidity()](#getHumidity())
   59. [getWindAngleDegrees()](#getWindAngleDegrees())
   60. [getWindAngleRadians()](#getWindAngleRadians())
   61. [getWindSpeedMovement()](#getWindSpeedMovement())
   62. [getWindForceMovement(IsoGameCharacter, float)](#getWindForceMovement(zombie.characters.IsoGameCharacter,float))
   63. [isRaining()](#isRaining())
   64. [getRainIntensity()](#getRainIntensity())
   65. [isSnowing()](#isSnowing())
   66. [getSnowIntensity()](#getSnowIntensity())
   67. [setAmbient(float)](#setAmbient(float))
   68. [setViewDistance(float)](#setViewDistance(float))
   69. [setDayLightStrength(float)](#setDayLightStrength(float))
   70. [setPrecipitationIsSnow(boolean)](#setPrecipitationIsSnow(boolean))
   71. [getCurrentDay()](#getCurrentDay())
   72. [getPreviousDay()](#getPreviousDay())
   73. [getNextDay()](#getNextDay())
   74. [getSeason()](#getSeason())
   75. [getFrontStrength()](#getFrontStrength())
   76. [stopWeatherAndThunder()](#stopWeatherAndThunder())
   77. [getThunderStorm()](#getThunderStorm())
   78. [getWeatherPeriod()](#getWeatherPeriod())
   79. [getIsThunderStorming()](#getIsThunderStorming())
   80. [getWeatherInterference()](#getWeatherInterference())
   81. [getModData()](#getModData())
   82. [getAirTemperatureForCharacter(IsoGameCharacter)](#getAirTemperatureForCharacter(zombie.characters.IsoGameCharacter))
   83. [getAirTemperatureForCharacter(IsoGameCharacter, boolean)](#getAirTemperatureForCharacter(zombie.characters.IsoGameCharacter,boolean))
   84. [getAirTemperatureForSquare(IsoGridSquare)](#getAirTemperatureForSquare(zombie.iso.IsoGridSquare))
   85. [getAirTemperatureForSquare(IsoGridSquare, BaseVehicle)](#getAirTemperatureForSquare(zombie.iso.IsoGridSquare,zombie.vehicles.BaseVehicle))
   86. [getAirTemperatureForSquare(IsoGridSquare, BaseVehicle, boolean)](#getAirTemperatureForSquare(zombie.iso.IsoGridSquare,zombie.vehicles.BaseVehicle,boolean))
   87. [getSeasonName()](#getSeasonName())
   88. [getSeasonNameTranslated()](#getSeasonNameTranslated())
   89. [getSeasonId()](#getSeasonId())
   90. [getSeasonProgression()](#getSeasonProgression())
   91. [getSeasonStrength()](#getSeasonStrength())
   92. [init(IsoMetaGrid)](#init(zombie.iso.IsoMetaGrid))
   93. [updateEveryTenMins()](#updateEveryTenMins())
   94. [update()](#update())
   95. [updateSandboxOverrides()](#updateSandboxOverrides())
   96. [getWindNoiseBase()](#getWindNoiseBase())
   97. [getWindNoiseFinal()](#getWindNoiseFinal())
   98. [getWindTickFinal()](#getWindTickFinal())
   99. [updateWindTick()](#updateWindTick())
   100. [updateOLD()](#updateOLD())
   101. [updateFx()](#updateFx())
   102. [updateSnow()](#updateSnow())
   103. [updateSnowOLD()](#updateSnowOLD())
   104. [getSnowFracNow()](#getSnowFracNow())
   105. [resetOverrides()](#resetOverrides())
   106. [resetModded()](#resetModded())
   107. [resetAdmin()](#resetAdmin())
   108. [triggerWinterIsComingStorm()](#triggerWinterIsComingStorm())
   109. [triggerCustomWeather(float, boolean)](#triggerCustomWeather(float,boolean))
   110. [triggerCustomWeatherStage(int, float)](#triggerCustomWeatherStage(int,float))
   111. [updateOnTick()](#updateOnTick())
   112. [updateTestFlare()](#updateTestFlare())
   113. [launchFlare()](#launchFlare())
   114. [getAirMassNoiseFrequencyMod(int)](#getAirMassNoiseFrequencyMod(int))
   115. [getRainTimeMultiplierMod(int)](#getRainTimeMultiplierMod(int))
   116. [updateValues()](#updateValues())
   117. [updateViewDistance()](#updateViewDistance())
   118. [setSeasonColorDawn(int, int, float, float, float, float, boolean)](#setSeasonColorDawn(int,int,float,float,float,float,boolean))
   119. [setSeasonColorDay(int, int, float, float, float, float, boolean)](#setSeasonColorDay(int,int,float,float,float,float,boolean))
   120. [setSeasonColorDusk(int, int, float, float, float, float, boolean)](#setSeasonColorDusk(int,int,float,float,float,float,boolean))
   121. [getSeasonColor(int, int, int)](#getSeasonColor(int,int,int))
   122. [initSeasonColors()](#initSeasonColors())
   123. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   124. [load(DataInputStream, int)](#load(java.io.DataInputStream,int))
   125. [postCellLoadSetSnow()](#postCellLoadSetSnow())
   126. [forceDayInfoUpdate()](#forceDayInfoUpdate())
   127. [updateDayInfo(int, int, int)](#updateDayInfo(int,int,int))
   128. [setDayInfo(ClimateManager.DayInfo, int, int, int, int)](#setDayInfo(zombie.iso.weather.ClimateManager.DayInfo,int,int,int,int))
   129. [transmitClimatePacket(ClimateManager.ClimateNetAuth, byte, UdpConnection)](#transmitClimatePacket(zombie.iso.weather.ClimateManager.ClimateNetAuth,byte,zombie.core.raknet.UdpConnection))
   130. [writePacketContents(IConnection, byte)](#writePacketContents(zombie.network.IConnection,byte))
   131. [receiveClimatePacket(ByteBufferReader, UdpConnection)](#receiveClimatePacket(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   132. [readPacketContents(ByteBufferReader, byte, UdpConnection)](#readPacketContents(zombie.core.network.ByteBufferReader,byte,zombie.core.raknet.UdpConnection))
   133. [serverReceiveClientChangeAdminVars()](#serverReceiveClientChangeAdminVars())
   134. [serverReceiveClientChangeWeather()](#serverReceiveClientChangeWeather())
   135. [transmitServerStopWeather()](#transmitServerStopWeather())
   136. [transmitServerTriggerStorm(float)](#transmitServerTriggerStorm(float))
   137. [transmitServerTriggerLightning(int, int, boolean, boolean, boolean)](#transmitServerTriggerLightning(int,int,boolean,boolean,boolean))
   138. [transmitServerStartRain(float)](#transmitServerStartRain(float))
   139. [transmitServerStopRain()](#transmitServerStopRain())
   140. [transmitRequestAdminVars()](#transmitRequestAdminVars())
   141. [transmitClientChangeAdminVars()](#transmitClientChangeAdminVars())
   142. [transmitStopWeather()](#transmitStopWeather())
   143. [transmitTriggerStorm(float)](#transmitTriggerStorm(float))
   144. [transmitTriggerTropical(float)](#transmitTriggerTropical(float))
   145. [transmitTriggerBlizzard(float)](#transmitTriggerBlizzard(float))
   146. [transmitGenerateWeather(float, int)](#transmitGenerateWeather(float,int))
   147. [getTimeLerpHours(float, float, float)](#getTimeLerpHours(float,float,float))
   148. [getTimeLerpHours(float, float, float, boolean)](#getTimeLerpHours(float,float,float,boolean))
   149. [getTimeLerp(float, float, float)](#getTimeLerp(float,float,float))
   150. [getTimeLerp(float, float, float, boolean)](#getTimeLerp(float,float,float,boolean))
   151. [clamp01(float)](#clamp01(float))
   152. [clamp(float, float, float)](#clamp(float,float,float))
   153. [clamp(int, int, int)](#clamp(int,int,int))
   154. [lerp(float, float, float)](#lerp(float,float,float))
   155. [clerp(float, float, float)](#clerp(float,float,float))
   156. [normalizeRange(float, float)](#normalizeRange(float,float))
   157. [posToPosNegRange(float)](#posToPosNegRange(float))
   158. [execute\_Simulation()](#execute_Simulation())
   159. [execute\_Simulation(int)](#execute_Simulation(int))
   160. [triggerKateBobIntroStorm(int, int, double, float, float, float, float)](#triggerKateBobIntroStorm(int,int,double,float,float,float,float))
   161. [triggerKateBobIntroStorm(int, int, double, float, float, float, float, ClimateColorInfo)](#triggerKateBobIntroStorm(int,int,double,float,float,float,float,zombie.iso.weather.ClimateColorInfo))
   162. [getSimplexOffsetA()](#getSimplexOffsetA())
   163. [getSimplexOffsetB()](#getSimplexOffsetB())
   164. [getSimplexOffsetC()](#getSimplexOffsetC())
   165. [getSimplexOffsetD()](#getSimplexOffsetD())
   166. [getWorldAgeHours()](#getWorldAgeHours())
   167. [getClimateValuesCopy()](#getClimateValuesCopy())
   168. [CopyClimateValues(ClimateValues)](#CopyClimateValues(zombie.iso.weather.ClimateValues))
   169. [getClimateForecaster()](#getClimateForecaster())
   170. [getClimateHistory()](#getClimateHistory())
   171. [CalculateWeatherFrontStrength(int, int, int, ClimateManager.AirFront)](#CalculateWeatherFrontStrength(int,int,int,zombie.iso.weather.ClimateManager.AirFront))
   172. [getWindAngleString(float)](#getWindAngleString(float))
   173. [sendInitialState(IConnection)](#sendInitialState(zombie.network.IConnection))
   174. [isUpdated()](#isUpdated())
   175. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager

---

public class ClimateManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ClimateManager.AirFront`

  `static class`

  `ClimateManager.ClimateBool`

  `static class`

  `ClimateManager.ClimateColor`

  `static class`

  `ClimateManager.ClimateFloat`

  `static enum`

  `ClimateManager.ClimateNetAuth`

  `private static class`

  `ClimateManager.ClimateNetInfo`

  `static class`

  `ClimateManager.DayInfo`

  `protected static class`

  `ClimateManager.SeasonColor`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `airMass`

  `private float`

  `airMassDaily`

  `private float`

  `airMassTemperature`

  `protected ClimateManager.ClimateFloat`

  `ambient`

  `static boolean`

  `aStormIsComing`

  `static final float`

  `AVG_FAV_AIR_TEMPERATURE`

  `private float`

  `baseTemperature`

  `static final int`

  `BOOL_IS_SNOW`

  `static final int`

  `BOOL_MAX`

  `(package private) boolean`

  `canDoWinterSprites`

  `private final ClimateManager.ClimateBool[]`

  `climateBooleans`

  `private final ClimateManager.ClimateColor[]`

  `climateColors`

  `private final ClimateManager.ClimateFloat[]`

  `climateFloats`

  `private final ClimateForecaster`

  `climateForecaster`

  `private final ClimateHistory`

  `climateHistory`

  `private ClimateValues`

  `climateValues`

  `private ClimateValues`

  `climateValuesFronts`

  `protected ClimateManager.ClimateFloat`

  `cloudIntensity`

  `private ClimateColorInfo`

  `colDawn`

  `private ClimateColorInfo`

  `colDay`

  `private ClimateColorInfo`

  `colDusk`

  `private final ClimateColorInfo`

  `colFlare`

  `private ClimateColorInfo`

  `colFog`

  `private final ClimateColorInfo`

  `colFogLegacy`

  `private final ClimateColorInfo`

  `colFogNew`

  `private ClimateColorInfo`

  `colNight`

  `private ClimateColorInfo`

  `colNightMoon`

  `private final ClimateColorInfo`

  `colNightNoMoon`

  `static final int`

  `COLOR_GLOBAL_LIGHT`

  `static final int`

  `COLOR_MAX`

  `static final int`

  `COLOR_NEW_FOG`

  `protected ClimateManager.ClimateColor`

  `colorNewFog`

  `private ClimateColorInfo`

  `colTemp`

  `private ClimateManager.DayInfo`

  `currentDay`

  `private final ClimateManager.AirFront`

  `currentFront`

  `private boolean`

  `dayDoFog`

  `private float`

  `dayFogStrength`

  `(package private) float`

  `dayLightLagged`

  `protected ClimateManager.ClimateFloat`

  `dayLightStrength`

  `protected ClimateManager.ClimateFloat`

  `desaturation`

  `private boolean`

  `disableFxUpdate`

  `private boolean`

  `disableSimulation`

  `private boolean`

  `disableWeatherGeneration`

  `private float`

  `flareIntens`

  `private final zombie.iso.weather.fx.SteppedUpdateFloat`

  `flareIntensity`

  `private boolean`

  `flareLaunched`

  `private float`

  `flareLifeTime`

  `private float`

  `flareMaxLifeTime`

  `static final int`

  `FLOAT_AMBIENT`

  `static final int`

  `FLOAT_CLOUD_INTENSITY`

  `static final int`

  `FLOAT_DAYLIGHT_STRENGTH`

  `static final int`

  `FLOAT_DESATURATION`

  `static final int`

  `FLOAT_FOG_INTENSITY`

  `static final int`

  `FLOAT_GLOBAL_LIGHT_INTENSITY`

  `static final int`

  `FLOAT_HUMIDITY`

  `static final int`

  `FLOAT_MAX`

  `static final int`

  `FLOAT_NIGHT_STRENGTH`

  `static final int`

  `FLOAT_PRECIPITATION_INTENSITY`

  `static final int`

  `FLOAT_TEMPERATURE`

  `static final int`

  `FLOAT_VIEW_DISTANCE`

  `static final int`

  `FLOAT_WIND_ANGLE_INTENSITY`

  `static final int`

  `FLOAT_WIND_INTENSITY`

  `protected ClimateManager.ClimateFloat`

  `fogIntensity`

  `(package private) float`

  `fogLerpValue`

  `private int`

  `fogOverride`

  `private final ClimateColorInfo`

  `fogTintStorm`

  `private final ClimateColorInfo`

  `fogTintTropical`

  `static final int`

  `FRONT_COLD`

  `static final int`

  `FRONT_STATIONARY`

  `static final int`

  `FRONT_WARM`

  `protected ClimateManager.ClimateColor`

  `globalLight`

  `protected ClimateManager.ClimateFloat`

  `globalLightIntensity`

  `private GameTime`

  `gt`

  `protected ClimateManager.ClimateFloat`

  `humidity`

  `private static ClimateManager`

  `instance`

  `private int`

  `lastHourStamp`

  `private long`

  `lastMinuteStamp`

  `static final float`

  `MAX_WINDSPEED_KPH`

  `static final float`

  `MAX_WINDSPEED_MPH`

  `private se.krka.kahlua.vm.KahluaTable`

  `modDataTable`

  `private final ClimateManager.ClimateNetInfo`

  `netInfo`

  `private float`

  `networkAdjustVal`

  `private float`

  `networkLerp`

  `private float`

  `networkLerpTime`

  `private final float`

  `networkLerpTimeBase`

  `private final boolean`

  `networkPrint`

  `private long`

  `networkUpdateStamp`

  `private ClimateManager.DayInfo`

  `nextDay`

  `private int`

  `nextRandomTargetIntens`

  `(package private) float`

  `nightLagged`

  `protected ClimateManager.ClimateFloat`

  `nightStrength`

  `static final byte`

  `PacketAdminVarsUpdate`

  `static final byte`

  `PacketClientChangedAdminVars`

  `static final byte`

  `PacketClientChangedWeather`

  `static final byte`

  `PacketFlare`

  `static final byte`

  `PacketRequestAdminVars`

  `static final byte`

  `PacketThunderEvent`

  `static final byte`

  `PacketUpdateClimateVars`

  `static final byte`

  `PacketWeatherUpdate`

  `protected ClimateManager.ClimateFloat`

  `precipitationIntensity`

  `protected ClimateManager.ClimateBool`

  `precipitationIsSnow`

  `private ClimateManager.DayInfo`

  `previousDay`

  `static final long`

  `PUDDLES_BROADCAST_INTERVAL_MS`

  `private final zombie.core.utils.UpdateLimit`

  `puddlesSyncLimit`

  `private ErosionSeason`

  `season`

  `private ClimateManager.SeasonColor`

  `seasonColorDawn`

  `private ClimateManager.SeasonColor`

  `seasonColorDay`

  `private ClimateManager.SeasonColor`

  `seasonColorDusk`

  `private double`

  `simplexOffsetA`

  `private double`

  `simplexOffsetB`

  `private double`

  `simplexOffsetC`

  `private double`

  `simplexOffsetD`

  `private float`

  `snowFall`

  `private float`

  `snowFracNow`

  `private float`

  `snowMeltStrength`

  `private float`

  `snowStrength`

  `protected ClimateManager.ClimateFloat`

  `temperature`

  `static boolean`

  `theDescendingFog`

  `private final ThunderStorm`

  `thunderStorm`

  `private boolean`

  `tickIsClimateTick`

  `private boolean`

  `tickIsDayChange`

  `private boolean`

  `tickIsHourChange`

  `private boolean`

  `tickIsTenMins`

  `protected ClimateManager.ClimateFloat`

  `viewDistance`

  `(package private) boolean`

  `wasForceSnow`

  `private int`

  `weatherOverride`

  `private final WeatherPeriod`

  `weatherPeriod`

  `protected ClimateManager.ClimateFloat`

  `windAngleIntensity`

  `private static final float[]`

  `windAngles`

  `private static final String[]`

  `windAngleStr`

  `protected ClimateManager.ClimateFloat`

  `windIntensity`

  `private static double`

  `windNoiseBase`

  `private static double`

  `windNoiseFinal`

  `private static double`

  `windNoiseOffset`

  `private float`

  `windPower`

  `private static double`

  `windTickFinal`

  `static boolean`

  `winterIsComing`

  `private double`

  `worldAgeHours`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `CalculateWeatherFrontStrength(int year,
  int month,
  int day,
  ClimateManager.AirFront front)`

  `static float`

  `clamp(float min,
  float max,
  float val)`

  `static int`

  `clamp(int min,
  int max,
  int val)`

  `static float`

  `clamp01(float val)`

  `static float`

  `clerp(float t,
  float a,
  float b)`

  `void`

  `CopyClimateValues(ClimateValues copy)`

  `void`

  `execute_Simulation()`

  `void`

  `execute_Simulation(int rainModOverride)`

  `void`

  `forceDayInfoUpdate()`

  `float`

  `getAirMass()`

  `float`

  `getAirMassDaily()`

  `protected double`

  `getAirMassNoiseFrequencyMod(int sandboxRain)`

  `float`

  `getAirMassTemperature()`

  `float`

  `getAirTemperatureForCharacter(IsoGameCharacter plr)`

  `float`

  `getAirTemperatureForCharacter(IsoGameCharacter plr,
  boolean doWindChill)`

  `float`

  `getAirTemperatureForSquare(IsoGridSquare square)`

  `float`

  `getAirTemperatureForSquare(IsoGridSquare square,
  BaseVehicle vehicle)`

  `float`

  `getAirTemperatureForSquare(IsoGridSquare square,
  BaseVehicle vehicle,
  boolean doWindChill)`

  `float`

  `getAmbient()`

  `float`

  `getBaseTemperature()`

  `int`

  `getBoolMax()`

  `ClimateManager.ClimateBool`

  `getClimateBool(int id)`

  `ClimateManager.ClimateColor`

  `getClimateColor(int id)`

  `ClimateManager.ClimateFloat`

  `getClimateFloat(int id)`

  `ClimateForecaster`

  `getClimateForecaster()`

  `ClimateHistory`

  `getClimateHistory()`

  `ClimateValues`

  `getClimateValuesCopy()`

  `float`

  `getCloudIntensity()`

  `ClimateColorInfo`

  `getColFog()`

  `ClimateColorInfo`

  `getColFogLegacy()`

  `ClimateColorInfo`

  `getColFogNew()`

  `ClimateColorInfo`

  `getColNight()`

  `ClimateColorInfo`

  `getColNightMoon()`

  `ClimateColorInfo`

  `getColNightNoMoon()`

  `int`

  `getColorMax()`

  `ClimateColorInfo`

  `getColorNewFog()`

  `float`

  `getCorrectedWindAngleIntensity()`

  `ClimateManager.DayInfo`

  `getCurrentDay()`

  `float`

  `getDayLightStrength()`

  `float`

  `getDayMeanTemperature()`

  `float`

  `getDesaturation()`

  `boolean`

  `getEnabledFxUpdate()`

  `boolean`

  `getEnabledSimulation()`

  `boolean`

  `getEnabledWeatherGeneration()`

  `int`

  `getFloatMax()`

  `float`

  `getFogIntensity()`

  `ClimateColorInfo`

  `getFogTintStorm()`

  `ClimateColorInfo`

  `getFogTintTropical()`

  `float`

  `getFrontStrength()`

  `ClimateColorInfo`

  `getGlobalLight()`

  `float`

  `getGlobalLightIntensity()`

  `Color`

  `getGlobalLightInternal()`

  `float`

  `getHumidity()`

  `static ClimateManager`

  `getInstance()`

  `boolean`

  `getIsThunderStorming()`

  `float`

  `getMaxWindspeedKph()`

  `float`

  `getMaxWindspeedMph()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `ClimateManager.DayInfo`

  `getNextDay()`

  `float`

  `getNightStrength()`

  `float`

  `getPrecipitationIntensity()`

  `boolean`

  `getPrecipitationIsSnow()`

  `ClimateManager.DayInfo`

  `getPreviousDay()`

  `float`

  `getRainIntensity()`

  `protected float`

  `getRainTimeMultiplierMod(int sandboxRain)`

  `ErosionSeason`

  `getSeason()`

  `ClimateColorInfo`

  `getSeasonColor(int segment,
  int temperature,
  int season)`

  `byte`

  `getSeasonId()`

  `String`

  `getSeasonName()`

  `String`

  `getSeasonNameTranslated()`

  `float`

  `getSeasonProgression()`

  `float`

  `getSeasonStrength()`

  `double`

  `getSimplexOffsetA()`

  `double`

  `getSimplexOffsetB()`

  `double`

  `getSimplexOffsetC()`

  `double`

  `getSimplexOffsetD()`

  `float`

  `getSnowFracNow()`

  `float`

  `getSnowIntensity()`

  `float`

  `getSnowStrength()`

  `float`

  `getTemperature()`

  `ThunderStorm`

  `getThunderStorm()`

  `protected float`

  `getTimeLerp(float cur,
  float min,
  float max)`

  `protected float`

  `getTimeLerp(float cur,
  float min,
  float max,
  boolean doClerp)`

  `protected float`

  `getTimeLerpHours(float cur,
  float min,
  float max)`

  `protected float`

  `getTimeLerpHours(float cur,
  float min,
  float max,
  boolean doClerp)`

  `float`

  `getViewDistance()`

  `float`

  `getWeatherInterference()`

  `WeatherPeriod`

  `getWeatherPeriod()`

  `float`

  `getWindAngleDegrees()`

  `float`

  `getWindAngleIntensity()`

  `float`

  `getWindAngleRadians()`

  `static String`

  `getWindAngleString(float angle)`

  `float`

  `getWindForceMovement(IsoGameCharacter character,
  float angle)`

  `float`

  `getWindIntensity()`

  `static double`

  `getWindNoiseBase()`

  `static double`

  `getWindNoiseFinal()`

  `float`

  `getWindPower()`

  `float`

  `getWindspeedKph()`

  `float`

  `getWindSpeedMovement()`

  `static double`

  `getWindTickFinal()`

  `double`

  `getWorldAgeHours()`

  `void`

  `init(IsoMetaGrid metaGrid)`

  `private ClimateManager.ClimateBool`

  `initClimateBool(int id,
  String name)`

  `private ClimateManager.ClimateColor`

  `initClimateColor(int id,
  String name)`

  `private ClimateManager.ClimateFloat`

  `initClimateFloat(int id,
  String name)`

  `private void`

  `initSeasonColors()`

  `boolean`

  `isRaining()`

  `boolean`

  `isSnowing()`

  `boolean`

  `isUpdated()`

  `void`

  `launchFlare()`

  `static float`

  `lerp(float t,
  float a,
  float b)`

  `void`

  `load(DataInputStream input,
  int worldVersion)`

  `static float`

  `normalizeRange(float v,
  float n)`

  `void`

  `postCellLoadSetSnow()`

  `static float`

  `posToPosNegRange(float v)`

  `private boolean`

  `readPacketContents(zombie.core.network.ByteBufferReader input,
  byte type,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `final void`

  `receiveClimatePacket(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `void`

  `Reset()`

  `void`

  `resetAdmin()`

  `void`

  `resetModded()`

  `void`

  `resetOverrides()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `sendInitialState(zombie.network.IConnection connection)`

  `private void`

  `serverReceiveClientChangeAdminVars()`

  `private void`

  `serverReceiveClientChangeWeather()`

  `void`

  `setAmbient(float f)`

  `protected void`

  `setDayInfo(ClimateManager.DayInfo dayInfo,
  int day,
  int month,
  int year,
  int dayOffset)`

  `void`

  `setDayLightStrength(float f)`

  `void`

  `setDesaturation(float desaturation)`

  `void`

  `setEnabledFxUpdate(boolean b)`

  `void`

  `setEnabledSimulation(boolean b)`

  `void`

  `setEnabledWeatherGeneration(boolean b)`

  `static void`

  `setInstance(ClimateManager inst)`

  `void`

  `setNightStrength(float b)`

  `void`

  `setPrecipitationIsSnow(boolean b)`

  `void`

  `setSeasonColorDawn(int temperature,
  int season,
  float r,
  float g,
  float b,
  float a,
  boolean exterior)`

  `void`

  `setSeasonColorDay(int temperature,
  int season,
  float r,
  float g,
  float b,
  float a,
  boolean exterior)`

  `void`

  `setSeasonColorDusk(int temperature,
  int season,
  float r,
  float g,
  float b,
  float a,
  boolean exterior)`

  `private void`

  `setup()`

  `void`

  `setViewDistance(float f)`

  `void`

  `stopWeatherAndThunder()`

  `static float`

  `ToKph(float val)`

  `static float`

  `ToMph(float val)`

  `void`

  `transmitClientChangeAdminVars()`

  `protected final void`

  `transmitClimatePacket(ClimateManager.ClimateNetAuth auth,
  byte type,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `void`

  `transmitGenerateWeather(float strength,
  int front)`

  `void`

  `transmitRequestAdminVars()`

  `void`

  `transmitServerStartRain(float intensity)`

  `void`

  `transmitServerStopRain()`

  `void`

  `transmitServerStopWeather()`

  `void`

  `transmitServerTriggerLightning(int x,
  int y,
  boolean doStrike,
  boolean doLightning,
  boolean doRumble)`

  `void`

  `transmitServerTriggerStorm(float duration)`

  `void`

  `transmitStopWeather()`

  `void`

  `transmitTriggerBlizzard(float duration)`

  `void`

  `transmitTriggerStorm(float duration)`

  `void`

  `transmitTriggerTropical(float duration)`

  `boolean`

  `triggerCustomWeather(float strength,
  boolean warmFront)`

  `boolean`

  `triggerCustomWeatherStage(int stage,
  float duration)`

  `void`

  `triggerKateBobIntroStorm(int centerX,
  int centerY,
  double duration,
  float strength,
  float initialProgress,
  float angle,
  float initialPuddles)`

  `void`

  `triggerKateBobIntroStorm(int centerX,
  int centerY,
  double duration,
  float strength,
  float initialProgress,
  float angle,
  float initialPuddles,
  ClimateColorInfo cloudcolor)`

  `void`

  `triggerWinterIsComingStorm()`

  `void`

  `update()`

  `private void`

  `updateDayInfo(int day,
  int month,
  int year)`

  `void`

  `updateEveryTenMins()`

  `private void`

  `updateFx()`

  `void`

  `updateOLD()`

  `private void`

  `updateOnTick()`

  `private void`

  `updateSandboxOverrides()`

  `private void`

  `updateSnow()`

  `private void`

  `updateSnowOLD()`

  `private void`

  `updateTestFlare()`

  `private void`

  `updateValues()`

  `private void`

  `updateViewDistance()`

  `private void`

  `updateWindTick()`

  `private boolean`

  `writePacketContents(zombie.network.IConnection connection,
  byte type)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### disableSimulation

    private boolean disableSimulation
  + ### disableFxUpdate

    private boolean disableFxUpdate
  + ### disableWeatherGeneration

    private boolean disableWeatherGeneration
  + ### PUDDLES\_BROADCAST\_INTERVAL\_MS

    public static final long PUDDLES\_BROADCAST\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PUDDLES_BROADCAST_INTERVAL_MS)
  + ### FRONT\_COLD

    public static final int FRONT\_COLD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FRONT_COLD)
  + ### FRONT\_STATIONARY

    public static final int FRONT\_STATIONARY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FRONT_STATIONARY)
  + ### FRONT\_WARM

    public static final int FRONT\_WARM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FRONT_WARM)
  + ### MAX\_WINDSPEED\_KPH

    public static final float MAX\_WINDSPEED\_KPH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.MAX_WINDSPEED_KPH)
  + ### MAX\_WINDSPEED\_MPH

    public static final float MAX\_WINDSPEED\_MPH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.MAX_WINDSPEED_MPH)
  + ### season

    private [ErosionSeason](../../erosion/season/ErosionSeason.html "class in zombie.erosion.season") season
  + ### lastMinuteStamp

    private long lastMinuteStamp
  + ### modDataTable

    private se.krka.kahlua.vm.KahluaTable modDataTable
  + ### airMass

    private float airMass
  + ### airMassDaily

    private float airMassDaily
  + ### airMassTemperature

    private float airMassTemperature
  + ### baseTemperature

    private float baseTemperature
  + ### snowFall

    private float snowFall
  + ### snowStrength

    private float snowStrength
  + ### snowMeltStrength

    private float snowMeltStrength
  + ### snowFracNow

    private float snowFracNow
  + ### canDoWinterSprites

    boolean canDoWinterSprites
  + ### wasForceSnow

    boolean wasForceSnow
  + ### windPower

    private float windPower
  + ### weatherPeriod

    private final [WeatherPeriod](WeatherPeriod.html "class in zombie.iso.weather") weatherPeriod
  + ### thunderStorm

    private final [ThunderStorm](ThunderStorm.html "class in zombie.iso.weather") thunderStorm
  + ### simplexOffsetA

    private double simplexOffsetA
  + ### simplexOffsetB

    private double simplexOffsetB
  + ### simplexOffsetC

    private double simplexOffsetC
  + ### simplexOffsetD

    private double simplexOffsetD
  + ### dayDoFog

    private boolean dayDoFog
  + ### dayFogStrength

    private float dayFogStrength
  + ### gt

    private [GameTime](../../GameTime.html "class in zombie") gt
  + ### worldAgeHours

    private double worldAgeHours
  + ### tickIsClimateTick

    private boolean tickIsClimateTick
  + ### tickIsDayChange

    private boolean tickIsDayChange
  + ### lastHourStamp

    private int lastHourStamp
  + ### tickIsHourChange

    private boolean tickIsHourChange
  + ### tickIsTenMins

    private boolean tickIsTenMins
  + ### currentFront

    private final [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") currentFront
  + ### colDay

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colDay
  + ### colDusk

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colDusk
  + ### colDawn

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colDawn
  + ### colNight

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colNight
  + ### colNightNoMoon

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colNightNoMoon
  + ### colNightMoon

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colNightMoon
  + ### colTemp

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colTemp
  + ### colFog

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colFog
  + ### colFogLegacy

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colFogLegacy
  + ### colFogNew

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colFogNew
  + ### fogTintStorm

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") fogTintStorm
  + ### fogTintTropical

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") fogTintTropical
  + ### instance

    private static [ClimateManager](ClimateManager.html "class in zombie.iso.weather") instance
  + ### winterIsComing

    public static boolean winterIsComing
  + ### theDescendingFog

    public static boolean theDescendingFog
  + ### aStormIsComing

    public static boolean aStormIsComing
  + ### climateValues

    private [ClimateValues](ClimateValues.html "class in zombie.iso.weather") climateValues
  + ### climateForecaster

    private final [ClimateForecaster](ClimateForecaster.html "class in zombie.iso.weather") climateForecaster
  + ### climateHistory

    private final [ClimateHistory](ClimateHistory.html "class in zombie.iso.weather") climateHistory
  + ### dayLightLagged

    float dayLightLagged
  + ### nightLagged

    float nightLagged
  + ### desaturation

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") desaturation
  + ### globalLightIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") globalLightIntensity
  + ### nightStrength

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") nightStrength
  + ### precipitationIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") precipitationIntensity
  + ### temperature

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") temperature
  + ### fogIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") fogIntensity
  + ### windIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") windIntensity
  + ### windAngleIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") windAngleIntensity
  + ### cloudIntensity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") cloudIntensity
  + ### ambient

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") ambient
  + ### viewDistance

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") viewDistance
  + ### dayLightStrength

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") dayLightStrength
  + ### humidity

    protected [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") humidity
  + ### globalLight

    protected [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather") globalLight
  + ### colorNewFog

    protected [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather") colorNewFog
  + ### precipitationIsSnow

    protected [ClimateManager.ClimateBool](ClimateManager.ClimateBool.html "class in zombie.iso.weather") precipitationIsSnow
  + ### FLOAT\_DESATURATION

    public static final int FLOAT\_DESATURATION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_DESATURATION)
  + ### FLOAT\_GLOBAL\_LIGHT\_INTENSITY

    public static final int FLOAT\_GLOBAL\_LIGHT\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_GLOBAL_LIGHT_INTENSITY)
  + ### FLOAT\_NIGHT\_STRENGTH

    public static final int FLOAT\_NIGHT\_STRENGTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_NIGHT_STRENGTH)
  + ### FLOAT\_PRECIPITATION\_INTENSITY

    public static final int FLOAT\_PRECIPITATION\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_PRECIPITATION_INTENSITY)
  + ### FLOAT\_TEMPERATURE

    public static final int FLOAT\_TEMPERATURE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_TEMPERATURE)
  + ### FLOAT\_FOG\_INTENSITY

    public static final int FLOAT\_FOG\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_FOG_INTENSITY)
  + ### FLOAT\_WIND\_INTENSITY

    public static final int FLOAT\_WIND\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_WIND_INTENSITY)
  + ### FLOAT\_WIND\_ANGLE\_INTENSITY

    public static final int FLOAT\_WIND\_ANGLE\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_WIND_ANGLE_INTENSITY)
  + ### FLOAT\_CLOUD\_INTENSITY

    public static final int FLOAT\_CLOUD\_INTENSITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_CLOUD_INTENSITY)
  + ### FLOAT\_AMBIENT

    public static final int FLOAT\_AMBIENT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_AMBIENT)
  + ### FLOAT\_VIEW\_DISTANCE

    public static final int FLOAT\_VIEW\_DISTANCE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_VIEW_DISTANCE)
  + ### FLOAT\_DAYLIGHT\_STRENGTH

    public static final int FLOAT\_DAYLIGHT\_STRENGTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_DAYLIGHT_STRENGTH)
  + ### FLOAT\_HUMIDITY

    public static final int FLOAT\_HUMIDITY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_HUMIDITY)
  + ### FLOAT\_MAX

    public static final int FLOAT\_MAX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.FLOAT_MAX)
  + ### climateFloats

    private final [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather")[] climateFloats
  + ### COLOR\_GLOBAL\_LIGHT

    public static final int COLOR\_GLOBAL\_LIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.COLOR_GLOBAL_LIGHT)
  + ### COLOR\_NEW\_FOG

    public static final int COLOR\_NEW\_FOG

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.COLOR_NEW_FOG)
  + ### COLOR\_MAX

    public static final int COLOR\_MAX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.COLOR_MAX)
  + ### climateColors

    private final [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather")[] climateColors
  + ### BOOL\_IS\_SNOW

    public static final int BOOL\_IS\_SNOW

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.BOOL_IS_SNOW)
  + ### BOOL\_MAX

    public static final int BOOL\_MAX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.BOOL_MAX)
  + ### climateBooleans

    private final [ClimateManager.ClimateBool](ClimateManager.ClimateBool.html "class in zombie.iso.weather")[] climateBooleans
  + ### AVG\_FAV\_AIR\_TEMPERATURE

    public static final float AVG\_FAV\_AIR\_TEMPERATURE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.AVG_FAV_AIR_TEMPERATURE)
  + ### weatherOverride

    private int weatherOverride
  + ### fogOverride

    private int fogOverride
  + ### windNoiseOffset

    private static double windNoiseOffset
  + ### windNoiseBase

    private static double windNoiseBase
  + ### windNoiseFinal

    private static double windNoiseFinal
  + ### windTickFinal

    private static double windTickFinal
  + ### colFlare

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") colFlare
  + ### flareLaunched

    private boolean flareLaunched
  + ### flareIntensity

    private final zombie.iso.weather.fx.SteppedUpdateFloat flareIntensity
  + ### flareIntens

    private float flareIntens
  + ### flareMaxLifeTime

    private float flareMaxLifeTime
  + ### flareLifeTime

    private float flareLifeTime
  + ### nextRandomTargetIntens

    private int nextRandomTargetIntens
  + ### fogLerpValue

    float fogLerpValue
  + ### seasonColorDawn

    private [ClimateManager.SeasonColor](ClimateManager.SeasonColor.html "class in zombie.iso.weather") seasonColorDawn
  + ### seasonColorDay

    private [ClimateManager.SeasonColor](ClimateManager.SeasonColor.html "class in zombie.iso.weather") seasonColorDay
  + ### seasonColorDusk

    private [ClimateManager.SeasonColor](ClimateManager.SeasonColor.html "class in zombie.iso.weather") seasonColorDusk
  + ### previousDay

    private [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") previousDay
  + ### currentDay

    private [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") currentDay
  + ### nextDay

    private [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") nextDay
  + ### PacketUpdateClimateVars

    public static final byte PacketUpdateClimateVars

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketUpdateClimateVars)
  + ### PacketWeatherUpdate

    public static final byte PacketWeatherUpdate

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketWeatherUpdate)
  + ### PacketThunderEvent

    public static final byte PacketThunderEvent

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketThunderEvent)
  + ### PacketFlare

    public static final byte PacketFlare

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketFlare)
  + ### PacketAdminVarsUpdate

    public static final byte PacketAdminVarsUpdate

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketAdminVarsUpdate)
  + ### PacketRequestAdminVars

    public static final byte PacketRequestAdminVars

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketRequestAdminVars)
  + ### PacketClientChangedAdminVars

    public static final byte PacketClientChangedAdminVars

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketClientChangedAdminVars)
  + ### PacketClientChangedWeather

    public static final byte PacketClientChangedWeather

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.PacketClientChangedWeather)
  + ### networkLerp

    private float networkLerp
  + ### networkUpdateStamp

    private long networkUpdateStamp
  + ### networkLerpTime

    private float networkLerpTime
  + ### networkLerpTimeBase

    private final float networkLerpTimeBase

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.networkLerpTimeBase)
  + ### networkAdjustVal

    private float networkAdjustVal
  + ### networkPrint

    private final boolean networkPrint

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.networkPrint)
  + ### puddlesSyncLimit

    private final zombie.core.utils.UpdateLimit puddlesSyncLimit
  + ### netInfo

    private final [ClimateManager.ClimateNetInfo](ClimateManager.ClimateNetInfo.html "class in zombie.iso.weather") netInfo
  + ### climateValuesFronts

    private [ClimateValues](ClimateValues.html "class in zombie.iso.weather") climateValuesFronts
  + ### windAngles

    private static final float[] windAngles
  + ### windAngleStr

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] windAngleStr
* Constructor Details
  -------------------

  + ### ClimateManager

    public ClimateManager()
* Method Details
  --------------

  + ### getMaxWindspeedKph

    public float getMaxWindspeedKph()
  + ### getMaxWindspeedMph

    public float getMaxWindspeedMph()
  + ### ToKph

    public static float ToKph(float val)
  + ### ToMph

    public static float ToMph(float val)
  + ### getInstance

    public static [ClimateManager](ClimateManager.html "class in zombie.iso.weather") getInstance()
  + ### setInstance

    public static void setInstance([ClimateManager](ClimateManager.html "class in zombie.iso.weather") inst)
  + ### getColNight

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColNight()
  + ### getColNightNoMoon

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColNightNoMoon()
  + ### getColNightMoon

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColNightMoon()
  + ### getColFog

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColFog()
  + ### getColFogLegacy

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColFogLegacy()
  + ### getColFogNew

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColFogNew()
  + ### getFogTintStorm

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getFogTintStorm()
  + ### getFogTintTropical

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getFogTintTropical()
  + ### setup

    private void setup()
  + ### getFloatMax

    public int getFloatMax()
  + ### initClimateFloat

    private [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") initClimateFloat(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getClimateFloat

    public [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") getClimateFloat(int id)
  + ### getColorMax

    public int getColorMax()
  + ### initClimateColor

    private [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather") initClimateColor(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getClimateColor

    public [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather") getClimateColor(int id)
  + ### getBoolMax

    public int getBoolMax()
  + ### initClimateBool

    private [ClimateManager.ClimateBool](ClimateManager.ClimateBool.html "class in zombie.iso.weather") initClimateBool(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getClimateBool

    public [ClimateManager.ClimateBool](ClimateManager.ClimateBool.html "class in zombie.iso.weather") getClimateBool(int id)
  + ### setEnabledSimulation

    public void setEnabledSimulation(boolean b)
  + ### getEnabledSimulation

    public boolean getEnabledSimulation()
  + ### getEnabledFxUpdate

    public boolean getEnabledFxUpdate()
  + ### setEnabledFxUpdate

    public void setEnabledFxUpdate(boolean b)
  + ### getEnabledWeatherGeneration

    public boolean getEnabledWeatherGeneration()
  + ### setEnabledWeatherGeneration

    public void setEnabledWeatherGeneration(boolean b)
  + ### getGlobalLightInternal

    public [Color](../../core/Color.html "class in zombie.core") getGlobalLightInternal()
  + ### getGlobalLight

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getGlobalLight()
  + ### getGlobalLightIntensity

    public float getGlobalLightIntensity()
  + ### getColorNewFog

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColorNewFog()
  + ### setNightStrength

    public void setNightStrength(float b)
  + ### getDesaturation

    public float getDesaturation()
  + ### setDesaturation

    public void setDesaturation(float desaturation)
  + ### getAirMass

    public float getAirMass()
  + ### getAirMassDaily

    public float getAirMassDaily()
  + ### getAirMassTemperature

    public float getAirMassTemperature()
  + ### getDayLightStrength

    public float getDayLightStrength()
  + ### getNightStrength

    public float getNightStrength()
  + ### getDayMeanTemperature

    public float getDayMeanTemperature()
  + ### getTemperature

    public float getTemperature()
  + ### getBaseTemperature

    public float getBaseTemperature()
  + ### getSnowStrength

    public float getSnowStrength()
  + ### getPrecipitationIsSnow

    public boolean getPrecipitationIsSnow()
  + ### getPrecipitationIntensity

    public float getPrecipitationIntensity()
  + ### getFogIntensity

    public float getFogIntensity()
  + ### getWindIntensity

    public float getWindIntensity()
  + ### getWindAngleIntensity

    public float getWindAngleIntensity()
  + ### getCorrectedWindAngleIntensity

    public float getCorrectedWindAngleIntensity()
  + ### getWindPower

    public float getWindPower()
  + ### getWindspeedKph

    public float getWindspeedKph()
  + ### getCloudIntensity

    public float getCloudIntensity()
  + ### getAmbient

    public float getAmbient()
  + ### getViewDistance

    public float getViewDistance()
  + ### getHumidity

    public float getHumidity()
  + ### getWindAngleDegrees

    public float getWindAngleDegrees()
  + ### getWindAngleRadians

    public float getWindAngleRadians()
  + ### getWindSpeedMovement

    public float getWindSpeedMovement()
  + ### getWindForceMovement

    public float getWindForceMovement([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    float angle)
  + ### isRaining

    public boolean isRaining()
  + ### getRainIntensity

    public float getRainIntensity()
  + ### isSnowing

    public boolean isSnowing()
  + ### getSnowIntensity

    public float getSnowIntensity()
  + ### setAmbient

    public void setAmbient(float f)
  + ### setViewDistance

    public void setViewDistance(float f)
  + ### setDayLightStrength

    public void setDayLightStrength(float f)
  + ### setPrecipitationIsSnow

    public void setPrecipitationIsSnow(boolean b)
  + ### getCurrentDay

    public [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") getCurrentDay()
  + ### getPreviousDay

    public [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") getPreviousDay()
  + ### getNextDay

    public [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") getNextDay()
  + ### getSeason

    public [ErosionSeason](../../erosion/season/ErosionSeason.html "class in zombie.erosion.season") getSeason()
  + ### getFrontStrength

    public float getFrontStrength()
  + ### stopWeatherAndThunder

    public void stopWeatherAndThunder()
  + ### getThunderStorm

    public [ThunderStorm](ThunderStorm.html "class in zombie.iso.weather") getThunderStorm()
  + ### getWeatherPeriod

    public [WeatherPeriod](WeatherPeriod.html "class in zombie.iso.weather") getWeatherPeriod()
  + ### getIsThunderStorming

    public boolean getIsThunderStorming()
  + ### getWeatherInterference

    public float getWeatherInterference()
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### getAirTemperatureForCharacter

    public float getAirTemperatureForCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") plr)
  + ### getAirTemperatureForCharacter

    public float getAirTemperatureForCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") plr,
    boolean doWindChill)
  + ### getAirTemperatureForSquare

    public float getAirTemperatureForSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square)
  + ### getAirTemperatureForSquare

    public float getAirTemperatureForSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### getAirTemperatureForSquare

    public float getAirTemperatureForSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") square,
    [BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    boolean doWindChill)
  + ### getSeasonName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeasonName()
  + ### getSeasonNameTranslated

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeasonNameTranslated()
  + ### getSeasonId

    public byte getSeasonId()
  + ### getSeasonProgression

    public float getSeasonProgression()
  + ### getSeasonStrength

    public float getSeasonStrength()
  + ### init

    public void init([IsoMetaGrid](../IsoMetaGrid.html "class in zombie.iso") metaGrid)
  + ### updateEveryTenMins

    public void updateEveryTenMins()
  + ### update

    public void update()
  + ### updateSandboxOverrides

    private void updateSandboxOverrides()
  + ### getWindNoiseBase

    public static double getWindNoiseBase()
  + ### getWindNoiseFinal

    public static double getWindNoiseFinal()
  + ### getWindTickFinal

    public static double getWindTickFinal()
  + ### updateWindTick

    private void updateWindTick()
  + ### updateOLD

    public void updateOLD()
  + ### updateFx

    private void updateFx()
  + ### updateSnow

    private void updateSnow()
  + ### updateSnowOLD

    private void updateSnowOLD()
  + ### getSnowFracNow

    public float getSnowFracNow()
  + ### resetOverrides

    public void resetOverrides()
  + ### resetModded

    public void resetModded()
  + ### resetAdmin

    public void resetAdmin()
  + ### triggerWinterIsComingStorm

    public void triggerWinterIsComingStorm()
  + ### triggerCustomWeather

    public boolean triggerCustomWeather(float strength,
    boolean warmFront)
  + ### triggerCustomWeatherStage

    public boolean triggerCustomWeatherStage(int stage,
    float duration)
  + ### updateOnTick

    private void updateOnTick()
  + ### updateTestFlare

    private void updateTestFlare()
  + ### launchFlare

    public void launchFlare()
  + ### getAirMassNoiseFrequencyMod

    protected double getAirMassNoiseFrequencyMod(int sandboxRain)
  + ### getRainTimeMultiplierMod

    protected float getRainTimeMultiplierMod(int sandboxRain)
  + ### updateValues

    private void updateValues()
  + ### updateViewDistance

    private void updateViewDistance()
  + ### setSeasonColorDawn

    public void setSeasonColorDawn(int temperature,
    int season,
    float r,
    float g,
    float b,
    float a,
    boolean exterior)
  + ### setSeasonColorDay

    public void setSeasonColorDay(int temperature,
    int season,
    float r,
    float g,
    float b,
    float a,
    boolean exterior)
  + ### setSeasonColorDusk

    public void setSeasonColorDusk(int temperature,
    int season,
    float r,
    float g,
    float b,
    float a,
    boolean exterior)
  + ### getSeasonColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getSeasonColor(int segment,
    int temperature,
    int season)
  + ### initSeasonColors

    private void initSeasonColors()
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### postCellLoadSetSnow

    public void postCellLoadSetSnow()
  + ### forceDayInfoUpdate

    public void forceDayInfoUpdate()
  + ### updateDayInfo

    private void updateDayInfo(int day,
    int month,
    int year)
  + ### setDayInfo

    protected void setDayInfo([ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") dayInfo,
    int day,
    int month,
    int year,
    int dayOffset)
  + ### transmitClimatePacket

    protected final void transmitClimatePacket([ClimateManager.ClimateNetAuth](ClimateManager.ClimateNetAuth.html "enum class in zombie.iso.weather") auth,
    byte type,
    zombie.core.raknet.UdpConnection ignoreConnection)
  + ### writePacketContents

    private boolean writePacketContents(zombie.network.IConnection connection,
    byte type)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### receiveClimatePacket

    public final void receiveClimatePacket(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection ignoreConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readPacketContents

    private boolean readPacketContents(zombie.core.network.ByteBufferReader input,
    byte type,
    zombie.core.raknet.UdpConnection ignoreConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### serverReceiveClientChangeAdminVars

    private void serverReceiveClientChangeAdminVars()
  + ### serverReceiveClientChangeWeather

    private void serverReceiveClientChangeWeather()
  + ### transmitServerStopWeather

    public void transmitServerStopWeather()
  + ### transmitServerTriggerStorm

    public void transmitServerTriggerStorm(float duration)
  + ### transmitServerTriggerLightning

    public void transmitServerTriggerLightning(int x,
    int y,
    boolean doStrike,
    boolean doLightning,
    boolean doRumble)
  + ### transmitServerStartRain

    public void transmitServerStartRain(float intensity)
  + ### transmitServerStopRain

    public void transmitServerStopRain()
  + ### transmitRequestAdminVars

    public void transmitRequestAdminVars()
  + ### transmitClientChangeAdminVars

    public void transmitClientChangeAdminVars()
  + ### transmitStopWeather

    public void transmitStopWeather()
  + ### transmitTriggerStorm

    public void transmitTriggerStorm(float duration)
  + ### transmitTriggerTropical

    public void transmitTriggerTropical(float duration)
  + ### transmitTriggerBlizzard

    public void transmitTriggerBlizzard(float duration)
  + ### transmitGenerateWeather

    public void transmitGenerateWeather(float strength,
    int front)
  + ### getTimeLerpHours

    protected float getTimeLerpHours(float cur,
    float min,
    float max)
  + ### getTimeLerpHours

    protected float getTimeLerpHours(float cur,
    float min,
    float max,
    boolean doClerp)
  + ### getTimeLerp

    protected float getTimeLerp(float cur,
    float min,
    float max)
  + ### getTimeLerp

    protected float getTimeLerp(float cur,
    float min,
    float max,
    boolean doClerp)
  + ### clamp01

    public static float clamp01(float val)
  + ### clamp

    public static float clamp(float min,
    float max,
    float val)
  + ### clamp

    public static int clamp(int min,
    int max,
    int val)
  + ### lerp

    public static float lerp(float t,
    float a,
    float b)
  + ### clerp

    public static float clerp(float t,
    float a,
    float b)
  + ### normalizeRange

    public static float normalizeRange(float v,
    float n)
  + ### posToPosNegRange

    public static float posToPosNegRange(float v)
  + ### execute\_Simulation

    public void execute\_Simulation()
  + ### execute\_Simulation

    public void execute\_Simulation(int rainModOverride)
  + ### triggerKateBobIntroStorm

    public void triggerKateBobIntroStorm(int centerX,
    int centerY,
    double duration,
    float strength,
    float initialProgress,
    float angle,
    float initialPuddles)
  + ### triggerKateBobIntroStorm

    public void triggerKateBobIntroStorm(int centerX,
    int centerY,
    double duration,
    float strength,
    float initialProgress,
    float angle,
    float initialPuddles,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudcolor)
  + ### getSimplexOffsetA

    public double getSimplexOffsetA()
  + ### getSimplexOffsetB

    public double getSimplexOffsetB()
  + ### getSimplexOffsetC

    public double getSimplexOffsetC()
  + ### getSimplexOffsetD

    public double getSimplexOffsetD()
  + ### getWorldAgeHours

    public double getWorldAgeHours()
  + ### getClimateValuesCopy

    public [ClimateValues](ClimateValues.html "class in zombie.iso.weather") getClimateValuesCopy()
  + ### CopyClimateValues

    public void CopyClimateValues([ClimateValues](ClimateValues.html "class in zombie.iso.weather") copy)
  + ### getClimateForecaster

    public [ClimateForecaster](ClimateForecaster.html "class in zombie.iso.weather") getClimateForecaster()
  + ### getClimateHistory

    public [ClimateHistory](ClimateHistory.html "class in zombie.iso.weather") getClimateHistory()
  + ### CalculateWeatherFrontStrength

    public void CalculateWeatherFrontStrength(int year,
    int month,
    int day,
    [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front)
  + ### getWindAngleString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWindAngleString(float angle)
  + ### sendInitialState

    public void sendInitialState(zombie.network.IConnection connection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isUpdated

    public boolean isUpdated()
  + ### Reset

    public void Reset()