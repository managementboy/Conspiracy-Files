[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameTime](GameTime.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [NANOSECONDS\_PER\_SECOND](#NANOSECONDS_PER_SECOND)
   2. [MILLISECONDS\_PER\_SECOND](#MILLISECONDS_PER_SECOND)
   3. [MinutesPerHour](#MinutesPerHour)
   4. [SecondsPerHour](#SecondsPerHour)
   5. [SECONDS\_PER\_MINUTE](#SECONDS_PER_MINUTE)
   6. [MULTIPLIER](#MULTIPLIER)
   7. [THIRTY\_FPS\_SCALE](#THIRTY_FPS_SCALE)
   8. [instance](#instance)
   9. [serverTimeShift](#serverTimeShift)
   10. [serverTimeShiftIsSet](#serverTimeShiftIsSet)
   11. [isUTest](#isUTest)
   12. [minutesPerDayStart](#minutesPerDayStart)
   13. [rainingToday](#rainingToday)
   14. [gunFireTimes](#gunFireTimes)
   15. [timeOfDay](#timeOfDay)
   16. [nightsSurvived](#nightsSurvived)
   17. [calender](#calender)
   18. [fpsMultiplier](#fpsMultiplier)
   19. [moon](#moon)
   20. [serverTimeOfDay](#serverTimeOfDay)
   21. [serverLastTimeOfDay](#serverLastTimeOfDay)
   22. [serverNewDays](#serverNewDays)
   23. [lightSourceUpdate](#lightSourceUpdate)
   24. [multiplierBias](#multiplierBias)
   25. [lastLastTimeOfDay](#lastLastTimeOfDay)
   26. [perObjectMultiplier](#perObjectMultiplier)
   27. [helicopterTime1Start](#helicopterTime1Start)
   28. [helicopterTime1End](#helicopterTime1End)
   29. [helicopterDay1](#helicopterDay1)
   30. [ambient](#ambient)
   31. [ambientMax](#ambientMax)
   32. [ambientMin](#ambientMin)
   33. [day](#day)
   34. [startDay](#startDay)
   35. [maxZombieCountStart](#maxZombieCountStart)
   36. [minZombieCountStart](#minZombieCountStart)
   37. [maxZombieCount](#maxZombieCount)
   38. [minZombieCount](#minZombieCount)
   39. [month](#month)
   40. [startMonth](#startMonth)
   41. [startTimeOfDay](#startTimeOfDay)
   42. [viewDistMax](#viewDistMax)
   43. [viewDistMin](#viewDistMin)
   44. [year](#year)
   45. [startYear](#startYear)
   46. [hoursSurvived](#hoursSurvived)
   47. [minutesPerDay](#minutesPerDay)
   48. [lastTimeOfDay](#lastTimeOfDay)
   49. [targetZombies](#targetZombies)
   50. [gunFireEventToday](#gunFireEventToday)
   51. [numGunFireEvents](#numGunFireEvents)
   52. [lastClockSync](#lastClockSync)
   53. [table](#table)
   54. [minutesMod](#minutesMod)
   55. [thunderDay](#thunderDay)
   56. [randomAmbientToday](#randomAmbientToday)
   57. [multiplier](#multiplier)
   58. [dusk](#dusk)
   59. [dawn](#dawn)
   60. [nightMin](#nightMin)
   61. [nightMax](#nightMax)
   62. [minutesStamp](#minutesStamp)
   63. [previousMinuteStamp](#previousMinuteStamp)
   64. [lastSkyLight](#lastSkyLight)
7. [Constructor Details](#constructor-detail)
   1. [GameTime()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [setInstance(GameTime)](#setInstance(zombie.GameTime))
   3. [syncServerTime(long, long, long)](#syncServerTime(long,long,long))
   4. [getServerTime()](#getServerTime())
   5. [getServerTimeMills()](#getServerTimeMills())
   6. [getServerTimeShiftIsSet()](#getServerTimeShiftIsSet())
   7. [setServerTimeShift(long)](#setServerTimeShift(long))
   8. [isGamePaused()](#isGamePaused())
   9. [getRealworldSecondsSinceLastUpdate()](#getRealworldSecondsSinceLastUpdate())
   10. [getMultipliedSecondsSinceLastUpdate()](#getMultipliedSecondsSinceLastUpdate())
   11. [getPhysicsSecondsSinceLastUpdate()](#getPhysicsSecondsSinceLastUpdate())
   12. [getSlomoMultiplier()](#getSlomoMultiplier())
   13. [getGameWorldSecondsSinceLastUpdate()](#getGameWorldSecondsSinceLastUpdate())
   14. [daysInMonth(int, int)](#daysInMonth(int,int))
   15. [getDeathString(IsoPlayer)](#getDeathString(zombie.characters.IsoPlayer))
   16. [getDaysSurvived()](#getDaysSurvived())
   17. [getTimeSurvived(IsoPlayer)](#getTimeSurvived(zombie.characters.IsoPlayer))
   18. [getZombieKilledText(IsoPlayer)](#getZombieKilledText(zombie.characters.IsoPlayer))
   19. [getGameModeText()](#getGameModeText())
   20. [init()](#init())
   21. [Lerp(float, float, float)](#Lerp(float,float,float))
   22. [RemoveZombiesIndiscriminate(int)](#RemoveZombiesIndiscriminate(int))
   23. [TimeLerp(float, float, float, float)](#TimeLerp(float,float,float,float))
   24. [getDeltaMinutesPerDay()](#getDeltaMinutesPerDay())
   25. [getNightMin()](#getNightMin())
   26. [setNightMin(float)](#setNightMin(float))
   27. [getNightMax()](#getNightMax())
   28. [setNightMax(float)](#setNightMax(float))
   29. [getMinutes()](#getMinutes())
   30. [setMoon(float)](#setMoon(float))
   31. [update(boolean)](#update(boolean))
   32. [updateRoomLight()](#updateRoomLight())
   33. [setMinutesStamp()](#setMinutesStamp())
   34. [getMinutesStamp()](#getMinutesStamp())
   35. [getThunderStorm()](#getThunderStorm())
   36. [doMetaEvents()](#doMetaEvents())
   37. [getAmbient()](#getAmbient())
   38. [getSkyLightLevel()](#getSkyLightLevel())
   39. [setAmbient(float)](#setAmbient(float))
   40. [getAmbientMax()](#getAmbientMax())
   41. [setAmbientMax(float)](#setAmbientMax(float))
   42. [getAmbientMin()](#getAmbientMin())
   43. [setAmbientMin(float)](#setAmbientMin(float))
   44. [getDay()](#getDay())
   45. [setDay(int)](#setDay(int))
   46. [getDayPlusOne()](#getDayPlusOne())
   47. [getStartDay()](#getStartDay())
   48. [setStartDay(int)](#setStartDay(int))
   49. [getMaxZombieCountStart()](#getMaxZombieCountStart())
   50. [setMaxZombieCountStart(float)](#setMaxZombieCountStart(float))
   51. [getMinZombieCountStart()](#getMinZombieCountStart())
   52. [setMinZombieCountStart(float)](#setMinZombieCountStart(float))
   53. [getMaxZombieCount()](#getMaxZombieCount())
   54. [setMaxZombieCount(float)](#setMaxZombieCount(float))
   55. [getMinZombieCount()](#getMinZombieCount())
   56. [setMinZombieCount(float)](#setMinZombieCount(float))
   57. [getMonth()](#getMonth())
   58. [setMonth(int)](#setMonth(int))
   59. [getStartMonth()](#getStartMonth())
   60. [setStartMonth(int)](#setStartMonth(int))
   61. [getNightTint()](#getNightTint())
   62. [setNightTint(float)](#setNightTint(float))
   63. [getNight()](#getNight())
   64. [setNight(float)](#setNight(float))
   65. [getTimeOfDay()](#getTimeOfDay())
   66. [setTimeOfDay(float)](#setTimeOfDay(float))
   67. [getStartTimeOfDay()](#getStartTimeOfDay())
   68. [setStartTimeOfDay(float)](#setStartTimeOfDay(float))
   69. [getViewDist()](#getViewDist())
   70. [getViewDistMax()](#getViewDistMax())
   71. [setViewDistMax(float)](#setViewDistMax(float))
   72. [getViewDistMin()](#getViewDistMin())
   73. [setViewDistMin(float)](#setViewDistMin(float))
   74. [getYear()](#getYear())
   75. [setYear(int)](#setYear(int))
   76. [getStartYear()](#getStartYear())
   77. [setStartYear(int)](#setStartYear(int))
   78. [getNightsSurvived()](#getNightsSurvived())
   79. [setNightsSurvived(int)](#setNightsSurvived(int))
   80. [getWorldAgeDaysSinceBegin()](#getWorldAgeDaysSinceBegin())
   81. [getWorldAgeHours()](#getWorldAgeHours())
   82. [getHoursSurvived()](#getHoursSurvived())
   83. [setHoursSurvived(double)](#setHoursSurvived(double))
   84. [getHour()](#getHour())
   85. [getCalender()](#getCalender())
   86. [setCalender(PZCalendar)](#setCalender(zombie.util.PZCalendar))
   87. [updateCalendar(int, int, int, int, int)](#updateCalendar(int,int,int,int,int))
   88. [getMinutesPerDay()](#getMinutesPerDay())
   89. [setMinutesPerDay(float)](#setMinutesPerDay(float))
   90. [getLastTimeOfDay()](#getLastTimeOfDay())
   91. [setLastTimeOfDay(float)](#setLastTimeOfDay(float))
   92. [setTargetZombies(int)](#setTargetZombies(int))
   93. [isRainingToday()](#isRainingToday())
   94. [getMultiplier()](#getMultiplier())
   95. [setMultiplier(float)](#setMultiplier(float))
   96. [getTimeDelta()](#getTimeDelta())
   97. [getTimeDeltaFromMultiplier(float)](#getTimeDeltaFromMultiplier(float))
   98. [getMultiplierFromTimeDelta(float)](#getMultiplierFromTimeDelta(float))
   99. [getServerMultiplier()](#getServerMultiplier())
   100. [getUnmoddedMultiplier()](#getUnmoddedMultiplier())
   101. [getInvMultiplier()](#getInvMultiplier())
   102. [getTrueMultiplier()](#getTrueMultiplier())
   103. [getThirtyFPSMultiplier()](#getThirtyFPSMultiplier())
   104. [getMultiplierInMenu()](#getMultiplierInMenu())
   105. [getThirtyFPSMultiplierInMenu()](#getThirtyFPSMultiplierInMenu())
   106. [getTimeDeltaInMenu()](#getTimeDeltaInMenu())
   107. [saveToBufferMap(SaveBufferMap)](#saveToBufferMap(zombie.iso.SaveBufferMap))
   108. [save()](#save())
   109. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   110. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   111. [load(DataInputStream)](#load(java.io.DataInputStream))
   112. [load(ByteBufferReader)](#load(zombie.core.network.ByteBufferReader))
   113. [load()](#load())
   114. [getDawn()](#getDawn())
   115. [setDawn(int)](#setDawn(int))
   116. [getDusk()](#getDusk())
   117. [setDusk(int)](#setDusk(int))
   118. [getModData()](#getModData())
   119. [isThunderDay()](#isThunderDay())
   120. [setThunderDay(boolean)](#setThunderDay(boolean))
   121. [saveToPacket(ByteBufferWriter)](#saveToPacket(zombie.core.network.ByteBufferWriter))
   122. [getHelicopterDay1()](#getHelicopterDay1())
   123. [getHelicopterDay()](#getHelicopterDay())
   124. [setHelicopterDay(int)](#setHelicopterDay(int))
   125. [getHelicopterStartHour()](#getHelicopterStartHour())
   126. [setHelicopterStartHour(int)](#setHelicopterStartHour(int))
   127. [getHelicopterEndHour()](#getHelicopterEndHour())
   128. [setHelicopterEndHour(int)](#setHelicopterEndHour(int))
   129. [isEndlessDay()](#isEndlessDay())
   130. [isEndlessNight()](#isEndlessNight())
   131. [isDay()](#isDay())
   132. [isNight()](#isNight())
   133. [isZombieActivityPhase()](#isZombieActivityPhase())
   134. [isZombieInactivityPhase()](#isZombieInactivityPhase())
   135. [minHours(double)](#minHours(double))
   136. [minHours(double, double)](#minHours(double,double))
   137. [minHours(float)](#minHours(float))
   138. [minHours(float, float)](#minHours(float,float))
   139. [clampHours(double)](#clampHours(double))
   140. [clampHours(float)](#clampHours(float))
   141. [clampHours(double, double)](#clampHours(double,double))
   142. [clampHours(float, float)](#clampHours(float,float))
   143. [checkHours(double, double)](#checkHours(double,double))
   144. [checkHours(float, float)](#checkHours(float,float))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameTime
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameTime

---

public final class GameTime
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `GameTime.AnimTimer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `ambient`

  `private float`

  `ambientMax`

  `private float`

  `ambientMin`

  `PZCalendar`

  `calender`

  `private int`

  `dawn`

  `private int`

  `day`

  `private int`

  `dusk`

  `float`

  `fpsMultiplier`

  `private boolean`

  `gunFireEventToday`

  `private final float[]`

  `gunFireTimes`

  `private int`

  `helicopterDay1`

  `private int`

  `helicopterTime1End`

  `private int`

  `helicopterTime1Start`

  `private double`

  `hoursSurvived`

  `static GameTime`

  `instance`

  `private static boolean`

  `isUTest`

  `private long`

  `lastClockSync`

  `float`

  `lastLastTimeOfDay`

  `(package private) int`

  `lastSkyLight`

  `private float`

  `lastTimeOfDay`

  `float`

  `lightSourceUpdate`

  `private float`

  `maxZombieCount`

  `private float`

  `maxZombieCountStart`

  `static final int`

  `MILLISECONDS_PER_SECOND`

  `private int`

  `minutesMod`

  `private float`

  `minutesPerDay`

  `private final float`

  `minutesPerDayStart`

  `static final float`

  `MinutesPerHour`

  `private long`

  `minutesStamp`

  `private float`

  `minZombieCount`

  `private float`

  `minZombieCountStart`

  `private int`

  `month`

  `float`

  `moon`

  `private float`

  `multiplier`

  `static final float`

  `MULTIPLIER`

  `float`

  `multiplierBias`

  `static final int`

  `NANOSECONDS_PER_SECOND`

  `private float`

  `nightMax`

  `private float`

  `nightMin`

  `int`

  `nightsSurvived`

  `private int`

  `numGunFireEvents`

  `float`

  `perObjectMultiplier`

  `private long`

  `previousMinuteStamp`

  `private final boolean`

  `rainingToday`

  `private boolean`

  `randomAmbientToday`

  `static final int`

  `SECONDS_PER_MINUTE`

  `static final float`

  `SecondsPerHour`

  `float`

  `serverLastTimeOfDay`

  `int`

  `serverNewDays`

  `float`

  `serverTimeOfDay`

  `private static long`

  `serverTimeShift`

  `private static boolean`

  `serverTimeShiftIsSet`

  `private int`

  `startDay`

  `private int`

  `startMonth`

  `private float`

  `startTimeOfDay`

  `private int`

  `startYear`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private int`

  `targetZombies`

  `static final float`

  `THIRTY_FPS_SCALE`

  `private boolean`

  `thunderDay`

  `float`

  `timeOfDay`

  `private float`

  `viewDistMax`

  `private float`

  `viewDistMin`

  `private int`

  `year`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameTime()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `static double`

  `checkHours(double hours,
  double worldAgeHours)`

  `static float`

  `checkHours(float hours,
  float worldAgeHours)`

  `double`

  `clampHours(double hours)`

  `static double`

  `clampHours(double hours,
  double worldAgeHours)`

  `float`

  `clampHours(float hours)`

  `static float`

  `clampHours(float hours,
  float worldAgeHours)`

  `int`

  `daysInMonth(int year,
  int month)`

  `private void`

  `doMetaEvents()`

  `float`

  `getAmbient()`

  Deprecated.

  `float`

  `getAmbientMax()`

  `float`

  `getAmbientMin()`

  `PZCalendar`

  `getCalender()`

  `int`

  `getDawn()`

  `int`

  `getDay()`

  `int`

  `getDayPlusOne()`

  `int`

  `getDaysSurvived()`

  `String`

  `getDeathString(IsoPlayer playerObj)`

  `float`

  `getDeltaMinutesPerDay()`

  `int`

  `getDusk()`

  `String`

  `getGameModeText()`

  `float`

  `getGameWorldSecondsSinceLastUpdate()`

  `int`

  `getHelicopterDay()`

  `int`

  `getHelicopterDay1()`

  `int`

  `getHelicopterEndHour()`

  `int`

  `getHelicopterStartHour()`

  `int`

  `getHour()`

  `double`

  `getHoursSurvived()`

  `static GameTime`

  `getInstance()`

  `float`

  `getInvMultiplier()`

  `float`

  `getLastTimeOfDay()`

  `float`

  `getMaxZombieCount()`

  `float`

  `getMaxZombieCountStart()`

  `int`

  `getMinutes()`

  `float`

  `getMinutesPerDay()`

  `long`

  `getMinutesStamp()`

  `float`

  `getMinZombieCount()`

  `float`

  `getMinZombieCountStart()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `int`

  `getMonth()`

  `float`

  `getMultipliedSecondsSinceLastUpdate()`

  `float`

  `getMultiplier()`

  `float`

  `getMultiplierFromTimeDelta(float timeDelta)`

  `float`

  `getMultiplierInMenu()`

  `float`

  `getNight()`

  `float`

  `getNightMax()`

  `float`

  `getNightMin()`

  `int`

  `getNightsSurvived()`

  `float`

  `getNightTint()`

  `float`

  `getPhysicsSecondsSinceLastUpdate()`

  `float`

  `getRealworldSecondsSinceLastUpdate()`

  `float`

  `getServerMultiplier()`

  `static long`

  `getServerTime()`

  `static long`

  `getServerTimeMills()`

  `static boolean`

  `getServerTimeShiftIsSet()`

  `int`

  `getSkyLightLevel()`

  `static float`

  `getSlomoMultiplier()`

  `int`

  `getStartDay()`

  `int`

  `getStartMonth()`

  `float`

  `getStartTimeOfDay()`

  `int`

  `getStartYear()`

  `float`

  `getThirtyFPSMultiplier()`

  `float`

  `getThirtyFPSMultiplierInMenu()`

  `boolean`

  `getThunderStorm()`

  `float`

  `getTimeDelta()`

  `float`

  `getTimeDeltaFromMultiplier(float multiplier)`

  `float`

  `getTimeDeltaInMenu()`

  `float`

  `getTimeOfDay()`

  `String`

  `getTimeSurvived(IsoPlayer playerObj)`

  `float`

  `getTrueMultiplier()`

  `float`

  `getUnmoddedMultiplier()`

  `float`

  `getViewDist()`

  `float`

  `getViewDistMax()`

  `float`

  `getViewDistMin()`

  `double`

  `getWorldAgeDaysSinceBegin()`

  This return true world age hours, including time since apo

  `double`

  `getWorldAgeHours()`

  `int`

  `getYear()`

  `String`

  `getZombieKilledText(IsoPlayer playerObj)`

  `void`

  `init()`

  `boolean`

  `isDay()`

  `boolean`

  `isEndlessDay()`

  `boolean`

  `isEndlessNight()`

  `static boolean`

  `isGamePaused()`

  `boolean`

  `isNight()`

  `boolean`

  `isRainingToday()`

  `boolean`

  `isThunderDay()`

  `boolean`

  `isZombieActivityPhase()`

  `boolean`

  `isZombieInactivityPhase()`

  `float`

  `Lerp(float start,
  float end,
  float delta)`

  `void`

  `load()`

  `void`

  `load(DataInputStream input)`

  `void`

  `load(zombie.core.network.ByteBufferReader input)`

  `double`

  `minHours(double hours)`

  `static double`

  `minHours(double hours,
  double worldAgeHours)`

  `float`

  `minHours(float hours)`

  `static float`

  `minHours(float hours,
  float worldAgeHours)`

  `void`

  `RemoveZombiesIndiscriminate(int i)`

  `void`

  `save()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveToBufferMap(zombie.iso.SaveBufferMap bufferMap)`

  `void`

  `saveToPacket(zombie.core.network.ByteBufferWriter bb)`

  `void`

  `setAmbient(float ambient)`

  `void`

  `setAmbientMax(float ambientMax)`

  `void`

  `setAmbientMin(float ambientMin)`

  `void`

  `setCalender(PZCalendar calendar)`

  `void`

  `setDawn(int dawn)`

  `void`

  `setDay(int day)`

  `void`

  `setDusk(int dusk)`

  `void`

  `setHelicopterDay(int day)`

  `void`

  `setHelicopterEndHour(int hour)`

  `void`

  `setHelicopterStartHour(int hour)`

  `void`

  `setHoursSurvived(double hoursSurvived)`

  `static void`

  `setInstance(GameTime aInstance)`

  `void`

  `setLastTimeOfDay(float lastTimeOfDay)`

  `void`

  `setMaxZombieCount(float maxZombieCount)`

  `void`

  `setMaxZombieCountStart(float maxZombieCountStart)`

  `void`

  `setMinutesPerDay(float minutesPerDay)`

  `private void`

  `setMinutesStamp()`

  `void`

  `setMinZombieCount(float minZombieCount)`

  `void`

  `setMinZombieCountStart(float minZombieCountStart)`

  `void`

  `setMonth(int month)`

  `void`

  `setMoon(float moon)`

  `void`

  `setMultiplier(float multiplier)`

  `private void`

  `setNight(float nightTint)`

  `void`

  `setNightMax(float max)`

  `void`

  `setNightMin(float min)`

  `void`

  `setNightsSurvived(int nightsSurvived)`

  `private void`

  `setNightTint(float nightTint)`

  `static void`

  `setServerTimeShift(long tshift)`

  `void`

  `setStartDay(int startDay)`

  `void`

  `setStartMonth(int startMonth)`

  `void`

  `setStartTimeOfDay(float startTimeOfDay)`

  `void`

  `setStartYear(int startYear)`

  `void`

  `setTargetZombies(int targetZombies)`

  `void`

  `setThunderDay(boolean thunderDay)`

  `void`

  `setTimeOfDay(float timeOfDay)`

  `void`

  `setViewDistMax(float viewDistMax)`

  `void`

  `setViewDistMin(float viewDistMin)`

  `void`

  `setYear(int year)`

  `static void`

  `syncServerTime(long timeClientSend,
  long timeServer,
  long timeClientReceive)`

  `float`

  `TimeLerp(float startVal,
  float endVal,
  float startTime,
  float endTime)`

  `void`

  `update(boolean bSleeping)`

  `void`

  `updateCalendar(int year,
  int month,
  int dayOfMonth,
  int hourOfDay,
  int minute)`

  `private void`

  `updateRoomLight()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### NANOSECONDS\_PER\_SECOND

    public static final int NANOSECONDS\_PER\_SECOND

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.NANOSECONDS_PER_SECOND)
  + ### MILLISECONDS\_PER\_SECOND

    public static final int MILLISECONDS\_PER\_SECOND

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.MILLISECONDS_PER_SECOND)
  + ### MinutesPerHour

    public static final float MinutesPerHour

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.MinutesPerHour)
  + ### SecondsPerHour

    public static final float SecondsPerHour

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.SecondsPerHour)
  + ### SECONDS\_PER\_MINUTE

    public static final int SECONDS\_PER\_MINUTE

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.SECONDS_PER_MINUTE)
  + ### MULTIPLIER

    public static final float MULTIPLIER

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.MULTIPLIER)
  + ### THIRTY\_FPS\_SCALE

    public static final float THIRTY\_FPS\_SCALE

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.THIRTY_FPS_SCALE)
  + ### instance

    public static [GameTime](GameTime.html "class in zombie") instance
  + ### serverTimeShift

    private static long serverTimeShift
  + ### serverTimeShiftIsSet

    private static boolean serverTimeShiftIsSet
  + ### isUTest

    private static boolean isUTest
  + ### minutesPerDayStart

    private final float minutesPerDayStart

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.minutesPerDayStart)
  + ### rainingToday

    private final boolean rainingToday

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameTime.rainingToday)
  + ### gunFireTimes

    private final float[] gunFireTimes
  + ### timeOfDay

    public float timeOfDay
  + ### nightsSurvived

    public int nightsSurvived
  + ### calender

    public [PZCalendar](util/PZCalendar.html "class in zombie.util") calender
  + ### fpsMultiplier

    public float fpsMultiplier
  + ### moon

    public float moon
  + ### serverTimeOfDay

    public float serverTimeOfDay
  + ### serverLastTimeOfDay

    public float serverLastTimeOfDay
  + ### serverNewDays

    public int serverNewDays
  + ### lightSourceUpdate

    public float lightSourceUpdate
  + ### multiplierBias

    public float multiplierBias
  + ### lastLastTimeOfDay

    public float lastLastTimeOfDay
  + ### perObjectMultiplier

    public float perObjectMultiplier
  + ### helicopterTime1Start

    private int helicopterTime1Start
  + ### helicopterTime1End

    private int helicopterTime1End
  + ### helicopterDay1

    private int helicopterDay1
  + ### ambient

    private float ambient
  + ### ambientMax

    private float ambientMax
  + ### ambientMin

    private float ambientMin
  + ### day

    private int day
  + ### startDay

    private int startDay
  + ### maxZombieCountStart

    private float maxZombieCountStart
  + ### minZombieCountStart

    private float minZombieCountStart
  + ### maxZombieCount

    private float maxZombieCount
  + ### minZombieCount

    private float minZombieCount
  + ### month

    private int month
  + ### startMonth

    private int startMonth
  + ### startTimeOfDay

    private float startTimeOfDay
  + ### viewDistMax

    private float viewDistMax
  + ### viewDistMin

    private float viewDistMin
  + ### year

    private int year
  + ### startYear

    private int startYear
  + ### hoursSurvived

    private double hoursSurvived
  + ### minutesPerDay

    private float minutesPerDay
  + ### lastTimeOfDay

    private float lastTimeOfDay
  + ### targetZombies

    private int targetZombies
  + ### gunFireEventToday

    private boolean gunFireEventToday
  + ### numGunFireEvents

    private int numGunFireEvents
  + ### lastClockSync

    private long lastClockSync
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### minutesMod

    private int minutesMod
  + ### thunderDay

    private boolean thunderDay
  + ### randomAmbientToday

    private boolean randomAmbientToday
  + ### multiplier

    private float multiplier
  + ### dusk

    private int dusk
  + ### dawn

    private int dawn
  + ### nightMin

    private float nightMin
  + ### nightMax

    private float nightMax
  + ### minutesStamp

    private long minutesStamp
  + ### previousMinuteStamp

    private long previousMinuteStamp
  + ### lastSkyLight

    int lastSkyLight
* Constructor Details
  -------------------

  + ### GameTime

    public GameTime()
* Method Details
  --------------

  + ### getInstance

    public static [GameTime](GameTime.html "class in zombie") getInstance()
  + ### setInstance

    public static void setInstance([GameTime](GameTime.html "class in zombie") aInstance)
  + ### syncServerTime

    public static void syncServerTime(long timeClientSend,
    long timeServer,
    long timeClientReceive)
  + ### getServerTime

    public static long getServerTime()
  + ### getServerTimeMills

    public static long getServerTimeMills()
  + ### getServerTimeShiftIsSet

    public static boolean getServerTimeShiftIsSet()
  + ### setServerTimeShift

    public static void setServerTimeShift(long tshift)
  + ### isGamePaused

    public static boolean isGamePaused()
  + ### getRealworldSecondsSinceLastUpdate

    public float getRealworldSecondsSinceLastUpdate()
  + ### getMultipliedSecondsSinceLastUpdate

    public float getMultipliedSecondsSinceLastUpdate()
  + ### getPhysicsSecondsSinceLastUpdate

    public float getPhysicsSecondsSinceLastUpdate()
  + ### getSlomoMultiplier

    public static float getSlomoMultiplier()
  + ### getGameWorldSecondsSinceLastUpdate

    public float getGameWorldSecondsSinceLastUpdate()
  + ### daysInMonth

    public int daysInMonth(int year,
    int month)
  + ### getDeathString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDeathString([IsoPlayer](characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getDaysSurvived

    public int getDaysSurvived()
  + ### getTimeSurvived

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTimeSurvived([IsoPlayer](characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getZombieKilledText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getZombieKilledText([IsoPlayer](characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getGameModeText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGameModeText()
  + ### init

    public void init()
  + ### Lerp

    public float Lerp(float start,
    float end,
    float delta)
  + ### RemoveZombiesIndiscriminate

    public void RemoveZombiesIndiscriminate(int i)
  + ### TimeLerp

    public float TimeLerp(float startVal,
    float endVal,
    float startTime,
    float endTime)
  + ### getDeltaMinutesPerDay

    public float getDeltaMinutesPerDay()
  + ### getNightMin

    public float getNightMin()
  + ### setNightMin

    public void setNightMin(float min)
  + ### getNightMax

    public float getNightMax()
  + ### setNightMax

    public void setNightMax(float max)
  + ### getMinutes

    public int getMinutes()
  + ### setMoon

    public void setMoon(float moon)
  + ### update

    public void update(boolean bSleeping)
  + ### updateRoomLight

    private void updateRoomLight()
  + ### setMinutesStamp

    private void setMinutesStamp()
  + ### getMinutesStamp

    public long getMinutesStamp()
  + ### getThunderStorm

    public boolean getThunderStorm()
  + ### doMetaEvents

    private void doMetaEvents()
  + ### getAmbient

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public float getAmbient()

    Deprecated.
  + ### getSkyLightLevel

    public int getSkyLightLevel()
  + ### setAmbient

    public void setAmbient(float ambient)
  + ### getAmbientMax

    public float getAmbientMax()
  + ### setAmbientMax

    public void setAmbientMax(float ambientMax)
  + ### getAmbientMin

    public float getAmbientMin()
  + ### setAmbientMin

    public void setAmbientMin(float ambientMin)
  + ### getDay

    public int getDay()
  + ### setDay

    public void setDay(int day)
  + ### getDayPlusOne

    public int getDayPlusOne()
  + ### getStartDay

    public int getStartDay()
  + ### setStartDay

    public void setStartDay(int startDay)
  + ### getMaxZombieCountStart

    public float getMaxZombieCountStart()
  + ### setMaxZombieCountStart

    public void setMaxZombieCountStart(float maxZombieCountStart)
  + ### getMinZombieCountStart

    public float getMinZombieCountStart()
  + ### setMinZombieCountStart

    public void setMinZombieCountStart(float minZombieCountStart)
  + ### getMaxZombieCount

    public float getMaxZombieCount()
  + ### setMaxZombieCount

    public void setMaxZombieCount(float maxZombieCount)
  + ### getMinZombieCount

    public float getMinZombieCount()
  + ### setMinZombieCount

    public void setMinZombieCount(float minZombieCount)
  + ### getMonth

    public int getMonth()
  + ### setMonth

    public void setMonth(int month)
  + ### getStartMonth

    public int getStartMonth()
  + ### setStartMonth

    public void setStartMonth(int startMonth)
  + ### getNightTint

    public float getNightTint()
  + ### setNightTint

    private void setNightTint(float nightTint)
  + ### getNight

    public float getNight()
  + ### setNight

    private void setNight(float nightTint)
  + ### getTimeOfDay

    public float getTimeOfDay()
  + ### setTimeOfDay

    public void setTimeOfDay(float timeOfDay)
  + ### getStartTimeOfDay

    public float getStartTimeOfDay()
  + ### setStartTimeOfDay

    public void setStartTimeOfDay(float startTimeOfDay)
  + ### getViewDist

    public float getViewDist()
  + ### getViewDistMax

    public float getViewDistMax()
  + ### setViewDistMax

    public void setViewDistMax(float viewDistMax)
  + ### getViewDistMin

    public float getViewDistMin()
  + ### setViewDistMin

    public void setViewDistMin(float viewDistMin)
  + ### getYear

    public int getYear()
  + ### setYear

    public void setYear(int year)
  + ### getStartYear

    public int getStartYear()
  + ### setStartYear

    public void setStartYear(int startYear)
  + ### getNightsSurvived

    public int getNightsSurvived()
  + ### setNightsSurvived

    public void setNightsSurvived(int nightsSurvived)
  + ### getWorldAgeDaysSinceBegin

    public double getWorldAgeDaysSinceBegin()

    This return true world age hours, including time since apo
  + ### getWorldAgeHours

    public double getWorldAgeHours()
  + ### getHoursSurvived

    public double getHoursSurvived()
  + ### setHoursSurvived

    public void setHoursSurvived(double hoursSurvived)
  + ### getHour

    public int getHour()
  + ### getCalender

    public [PZCalendar](util/PZCalendar.html "class in zombie.util") getCalender()
  + ### setCalender

    public void setCalender([PZCalendar](util/PZCalendar.html "class in zombie.util") calendar)
  + ### updateCalendar

    public void updateCalendar(int year,
    int month,
    int dayOfMonth,
    int hourOfDay,
    int minute)
  + ### getMinutesPerDay

    public float getMinutesPerDay()
  + ### setMinutesPerDay

    public void setMinutesPerDay(float minutesPerDay)
  + ### getLastTimeOfDay

    public float getLastTimeOfDay()
  + ### setLastTimeOfDay

    public void setLastTimeOfDay(float lastTimeOfDay)
  + ### setTargetZombies

    public void setTargetZombies(int targetZombies)
  + ### isRainingToday

    public boolean isRainingToday()
  + ### getMultiplier

    public float getMultiplier()
  + ### setMultiplier

    public void setMultiplier(float multiplier)
  + ### getTimeDelta

    public float getTimeDelta()
  + ### getTimeDeltaFromMultiplier

    public float getTimeDeltaFromMultiplier(float multiplier)
  + ### getMultiplierFromTimeDelta

    public float getMultiplierFromTimeDelta(float timeDelta)
  + ### getServerMultiplier

    public float getServerMultiplier()
  + ### getUnmoddedMultiplier

    public float getUnmoddedMultiplier()
  + ### getInvMultiplier

    public float getInvMultiplier()
  + ### getTrueMultiplier

    public float getTrueMultiplier()
  + ### getThirtyFPSMultiplier

    public float getThirtyFPSMultiplier()
  + ### getMultiplierInMenu

    public float getMultiplierInMenu()
  + ### getThirtyFPSMultiplierInMenu

    public float getThirtyFPSMultiplierInMenu()
  + ### getTimeDeltaInMenu

    public float getTimeDeltaInMenu()
  + ### saveToBufferMap

    public void saveToBufferMap(zombie.iso.SaveBufferMap bufferMap)
  + ### save

    public void save()
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load(zombie.core.network.ByteBufferReader input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load()
  + ### getDawn

    public int getDawn()
  + ### setDawn

    public void setDawn(int dawn)
  + ### getDusk

    public int getDusk()
  + ### setDusk

    public void setDusk(int dusk)
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### isThunderDay

    public boolean isThunderDay()
  + ### setThunderDay

    public void setThunderDay(boolean thunderDay)
  + ### saveToPacket

    public void saveToPacket(zombie.core.network.ByteBufferWriter bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getHelicopterDay1

    public int getHelicopterDay1()
  + ### getHelicopterDay

    public int getHelicopterDay()
  + ### setHelicopterDay

    public void setHelicopterDay(int day)
  + ### getHelicopterStartHour

    public int getHelicopterStartHour()
  + ### setHelicopterStartHour

    public void setHelicopterStartHour(int hour)
  + ### getHelicopterEndHour

    public int getHelicopterEndHour()
  + ### setHelicopterEndHour

    public void setHelicopterEndHour(int hour)
  + ### isEndlessDay

    public boolean isEndlessDay()
  + ### isEndlessNight

    public boolean isEndlessNight()
  + ### isDay

    public boolean isDay()
  + ### isNight

    public boolean isNight()
  + ### isZombieActivityPhase

    public boolean isZombieActivityPhase()
  + ### isZombieInactivityPhase

    public boolean isZombieInactivityPhase()
  + ### minHours

    public double minHours(double hours)
  + ### minHours

    public static double minHours(double hours,
    double worldAgeHours)
  + ### minHours

    public float minHours(float hours)
  + ### minHours

    public static float minHours(float hours,
    float worldAgeHours)
  + ### clampHours

    public double clampHours(double hours)
  + ### clampHours

    public float clampHours(float hours)
  + ### clampHours

    public static double clampHours(double hours,
    double worldAgeHours)
  + ### clampHours

    public static float clampHours(float hours,
    float worldAgeHours)
  + ### checkHours

    public static double checkHours(double hours,
    double worldAgeHours)
  + ### checkHours

    public static float checkHours(float hours,
    float worldAgeHours)