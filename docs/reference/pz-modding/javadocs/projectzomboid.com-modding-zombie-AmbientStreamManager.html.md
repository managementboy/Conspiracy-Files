[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [AmbientStreamManager](AmbientStreamManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [oneInAmbienceChance](#oneInAmbienceChance)
   2. [maxAmbientCount](#maxAmbientCount)
   3. [maxRange](#maxRange)
   4. [alarmList](#alarmList)
   5. [instance](#instance)
   6. [ambient](#ambient)
   7. [worldEmitters](#worldEmitters)
   8. [freeEmitters](#freeEmitters)
   9. [worldAmbienceEmitter](#worldAmbienceEmitter)
   10. [worldAmbianceInstance](#worldAmbianceInstance)
   11. [allAmbient](#allAmbient)
   12. [nightAmbient](#nightAmbient)
   13. [dayAmbient](#dayAmbient)
   14. [rainAmbient](#rainAmbient)
   15. [indoorAmbient](#indoorAmbient)
   16. [outdoorAmbient](#outdoorAmbient)
   17. [windAmbient](#windAmbient)
   18. [initialized](#initialized)
   19. [electricityShutOffEmitter](#electricityShutOffEmitter)
   20. [electricityShutOffEvent](#electricityShutOffEvent)
   21. [electricityShutOffState](#electricityShutOffState)
   22. [parameterFogIntensity](#parameterFogIntensity)
   23. [parameterRainIntensity](#parameterRainIntensity)
   24. [parameterSeason](#parameterSeason)
   25. [parameterSnowIntensity](#parameterSnowIntensity)
   26. [parameterStorm](#parameterStorm)
   27. [parameterTimeOfDay](#parameterTimeOfDay)
   28. [parameterTemperature](#parameterTemperature)
   29. [parameterWeatherEvent](#parameterWeatherEvent)
   30. [parameterWindIntensity](#parameterWindIntensity)
   31. [parameterStreamerMode](#parameterStreamerMode)
   32. [parameterZoneDeepForest](#parameterZoneDeepForest)
   33. [parameterZoneFarm](#parameterZoneFarm)
   34. [parameterZoneForest](#parameterZoneForest)
   35. [parameterZoneNav](#parameterZoneNav)
   36. [parameterZoneTown](#parameterZoneTown)
   37. [parameterZoneTrailerPark](#parameterZoneTrailerPark)
   38. [parameterZoneVegetation](#parameterZoneVegetation)
   39. [parameterZoneWaterSide](#parameterZoneWaterSide)
   40. [parameterCameraZoom](#parameterCameraZoom)
   41. [parameterCharacterElevation](#parameterCharacterElevation)
   42. [parameterClosestWallDistance](#parameterClosestWallDistance)
   43. [parameterClosestExteriorWallDistance](#parameterClosestExteriorWallDistance)
   44. [parameterHardOfHearing](#parameterHardOfHearing)
   45. [parameterInside](#parameterInside)
   46. [parameterMoodlePanic](#parameterMoodlePanic)
   47. [parameterPowerSupply](#parameterPowerSupply)
   48. [parameterRoomSize](#parameterRoomSize)
   49. [parameterRoomType](#parameterRoomType)
   50. [parameterRoomTypeEx](#parameterRoomTypeEx)
   51. [parameterWaterSupply](#parameterWaterSupply)
   52. [tempo](#tempo)
   53. [electricityShutOffEventCallback](#electricityShutOffEventCallback)
7. [Constructor Details](#constructor-detail)
   1. [AmbientStreamManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [update()](#update())
   3. [doOneShotAmbients()](#doOneShotAmbients())
   4. [addRandomAmbient()](#addRandomAmbient())
   5. [addRandomAmbient(boolean)](#addRandomAmbient(boolean))
   6. [addBlend(String, float, boolean, boolean, boolean, boolean)](#addBlend(java.lang.String,float,boolean,boolean,boolean,boolean))
   7. [init()](#init())
   8. [doGunEvent()](#doGunEvent())
   9. [doAlarm(RoomDef)](#doAlarm(zombie.iso.RoomDef))
   10. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   11. [handleThunderEvent(int, int)](#handleThunderEvent(int,int))
   12. [stop()](#stop())
   13. [addAmbient(String, int, int, int, float)](#addAmbient(java.lang.String,int,int,int,float))
   14. [addAmbientEmitter(float, float, int, String)](#addAmbientEmitter(float,float,int,java.lang.String))
   15. [addDaytimeAmbientEmitter(float, float, int, String)](#addDaytimeAmbientEmitter(float,float,int,java.lang.String))
   16. [updatePowerSupply()](#updatePowerSupply())
   17. [checkHaveElectricity()](#checkHaveElectricity())
   18. [isParameterInsideTrue()](#isParameterInsideTrue())
   19. [getNearestBuilding(float, float)](#getNearestBuilding(float,float))
   20. [getListenerPos(Vector2f)](#getListenerPos(org.joml.Vector2f))
   21. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   22. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   23. [updateWorldAmbiance()](#updateWorldAmbiance())
   24. [stopWorldAmbiance()](#stopWorldAmbiance())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class AmbientStreamManager
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

zombie.AmbientStreamManager

---

public final class AmbientStreamManager
extends [BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `AmbientStreamManager.Ambient`

  `static final class`

  `AmbientStreamManager.AmbientLoop`

  `static final class`

  `AmbientStreamManager.WorldSoundEmitter`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<zombie.iso.Alarm>`

  `alarmList`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `allAmbient`

  `final ArrayList<AmbientStreamManager.Ambient>`

  `ambient`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `dayAmbient`

  `private FMODSoundEmitter`

  `electricityShutOffEmitter`

  `private long`

  `electricityShutOffEvent`

  `private final fmod.fmod.FMOD_STUDIO_EVENT_CALLBACK`

  `electricityShutOffEventCallback`

  `private int`

  `electricityShutOffState`

  `final ArrayDeque<AmbientStreamManager.WorldSoundEmitter>`

  `freeEmitters`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `indoorAmbient`

  `boolean`

  `initialized`

  `static BaseAmbientStreamManager`

  `instance`

  `static int`

  `maxAmbientCount`

  `static float`

  `maxRange`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `nightAmbient`

  `static int`

  `oneInAmbienceChance`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `outdoorAmbient`

  `private final zombie.audio.parameters.ParameterCameraZoom`

  `parameterCameraZoom`

  `private final zombie.audio.parameters.ParameterCharacterElevation`

  `parameterCharacterElevation`

  `private final zombie.audio.parameters.ParameterClosestExteriorWallDistance`

  `parameterClosestExteriorWallDistance`

  `private final zombie.audio.parameters.ParameterClosestWallDistance`

  `parameterClosestWallDistance`

  `private final zombie.audio.parameters.ParameterFogIntensity`

  `parameterFogIntensity`

  `private final zombie.audio.parameters.ParameterHardOfHearing`

  `parameterHardOfHearing`

  `private final zombie.audio.parameters.ParameterInside`

  `parameterInside`

  `private final zombie.audio.parameters.ParameterMoodlePanic`

  `parameterMoodlePanic`

  `private final zombie.audio.parameters.ParameterPowerSupply`

  `parameterPowerSupply`

  `private final zombie.audio.parameters.ParameterRainIntensity`

  `parameterRainIntensity`

  `private final zombie.audio.parameters.ParameterRoomSize`

  `parameterRoomSize`

  `private final zombie.audio.parameters.ParameterRoomType`

  `parameterRoomType`

  `private final zombie.audio.parameters.ParameterRoomTypeEx`

  `parameterRoomTypeEx`

  `private final zombie.audio.parameters.ParameterSeason`

  `parameterSeason`

  `private final zombie.audio.parameters.ParameterSnowIntensity`

  `parameterSnowIntensity`

  `private final zombie.audio.parameters.ParameterStorm`

  `parameterStorm`

  `private final zombie.audio.parameters.ParameterStreamerMode`

  `parameterStreamerMode`

  `private final ParameterTemperature`

  `parameterTemperature`

  `private final zombie.audio.parameters.ParameterTimeOfDay`

  `parameterTimeOfDay`

  `private final zombie.audio.parameters.ParameterWaterSupply`

  `parameterWaterSupply`

  `private final zombie.audio.parameters.ParameterWeatherEvent`

  `parameterWeatherEvent`

  `private final zombie.audio.parameters.ParameterWindIntensity`

  `parameterWindIntensity`

  `private final ParameterZone`

  `parameterZoneDeepForest`

  `private final ParameterZone`

  `parameterZoneFarm`

  `private final ParameterZone`

  `parameterZoneForest`

  `private final ParameterZone`

  `parameterZoneNav`

  `private final ParameterZone`

  `parameterZoneTown`

  `private final ParameterZone`

  `parameterZoneTrailerPark`

  `private final ParameterZone`

  `parameterZoneVegetation`

  `private final zombie.audio.parameters.ParameterZoneWaterSide`

  `parameterZoneWaterSide`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `rainAmbient`

  `private final Vector2`

  `tempo`

  `final ArrayList<AmbientStreamManager.AmbientLoop>`

  `windAmbient`

  `private long`

  `worldAmbianceInstance`

  `private BaseSoundEmitter`

  `worldAmbienceEmitter`

  `final ArrayList<AmbientStreamManager.WorldSoundEmitter>`

  `worldEmitters`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AmbientStreamManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAmbient(String name,
  int x,
  int y,
  int radius,
  float volume)`

  `void`

  `addAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `void`

  `addBlend(String name,
  float vol,
  boolean bIndoors,
  boolean bRain,
  boolean bNight,
  boolean bDay)`

  `void`

  `addDaytimeAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `void`

  `addRandomAmbient()`

  `void`

  `addRandomAmbient(boolean force)`

  `void`

  `checkHaveElectricity()`

  `void`

  `doAlarm(RoomDef room)`

  `void`

  `doGunEvent()`

  `void`

  `doOneShotAmbients()`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `static BaseAmbientStreamManager`

  `getInstance()`

  `private void`

  `getListenerPos(Vector2f pos)`

  `static BuildingDef`

  `getNearestBuilding(float px,
  float py)`

  `void`

  `handleThunderEvent(int x,
  int y)`

  `void`

  `init()`

  `boolean`

  `isParameterInsideTrue()`

  `void`

  `load(ByteBuffer bb,
  int worldVersion)`

  `void`

  `save(ByteBuffer bb)`

  `void`

  `stop()`

  `private void`

  `stopWorldAmbiance()`

  `void`

  `update()`

  `private void`

  `updatePowerSupply()`

  `private void`

  `updateWorldAmbiance()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### oneInAmbienceChance

    public static int oneInAmbienceChance
  + ### maxAmbientCount

    public static int maxAmbientCount
  + ### maxRange

    public static float maxRange
  + ### alarmList

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.Alarm> alarmList
  + ### instance

    public static [BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie") instance
  + ### ambient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.Ambient](AmbientStreamManager.Ambient.html "class in zombie")> ambient
  + ### worldEmitters

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.WorldSoundEmitter](AmbientStreamManager.WorldSoundEmitter.html "class in zombie")> worldEmitters
  + ### freeEmitters

    public final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[AmbientStreamManager.WorldSoundEmitter](AmbientStreamManager.WorldSoundEmitter.html "class in zombie")> freeEmitters
  + ### worldAmbienceEmitter

    private [BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio") worldAmbienceEmitter
  + ### worldAmbianceInstance

    private long worldAmbianceInstance
  + ### allAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> allAmbient
  + ### nightAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> nightAmbient
  + ### dayAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> dayAmbient
  + ### rainAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> rainAmbient
  + ### indoorAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> indoorAmbient
  + ### outdoorAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> outdoorAmbient
  + ### windAmbient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")> windAmbient
  + ### initialized

    public boolean initialized
  + ### electricityShutOffEmitter

    private [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") electricityShutOffEmitter
  + ### electricityShutOffEvent

    private long electricityShutOffEvent
  + ### electricityShutOffState

    private int electricityShutOffState
  + ### parameterFogIntensity

    private final zombie.audio.parameters.ParameterFogIntensity parameterFogIntensity
  + ### parameterRainIntensity

    private final zombie.audio.parameters.ParameterRainIntensity parameterRainIntensity
  + ### parameterSeason

    private final zombie.audio.parameters.ParameterSeason parameterSeason
  + ### parameterSnowIntensity

    private final zombie.audio.parameters.ParameterSnowIntensity parameterSnowIntensity
  + ### parameterStorm

    private final zombie.audio.parameters.ParameterStorm parameterStorm
  + ### parameterTimeOfDay

    private final zombie.audio.parameters.ParameterTimeOfDay parameterTimeOfDay
  + ### parameterTemperature

    private final [ParameterTemperature](audio/parameters/ParameterTemperature.html "class in zombie.audio.parameters") parameterTemperature
  + ### parameterWeatherEvent

    private final zombie.audio.parameters.ParameterWeatherEvent parameterWeatherEvent
  + ### parameterWindIntensity

    private final zombie.audio.parameters.ParameterWindIntensity parameterWindIntensity
  + ### parameterStreamerMode

    private final zombie.audio.parameters.ParameterStreamerMode parameterStreamerMode
  + ### parameterZoneDeepForest

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneDeepForest
  + ### parameterZoneFarm

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneFarm
  + ### parameterZoneForest

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneForest
  + ### parameterZoneNav

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneNav
  + ### parameterZoneTown

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneTown
  + ### parameterZoneTrailerPark

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneTrailerPark
  + ### parameterZoneVegetation

    private final [ParameterZone](audio/parameters/ParameterZone.html "class in zombie.audio.parameters") parameterZoneVegetation
  + ### parameterZoneWaterSide

    private final zombie.audio.parameters.ParameterZoneWaterSide parameterZoneWaterSide
  + ### parameterCameraZoom

    private final zombie.audio.parameters.ParameterCameraZoom parameterCameraZoom
  + ### parameterCharacterElevation

    private final zombie.audio.parameters.ParameterCharacterElevation parameterCharacterElevation
  + ### parameterClosestWallDistance

    private final zombie.audio.parameters.ParameterClosestWallDistance parameterClosestWallDistance
  + ### parameterClosestExteriorWallDistance

    private final zombie.audio.parameters.ParameterClosestExteriorWallDistance parameterClosestExteriorWallDistance
  + ### parameterHardOfHearing

    private final zombie.audio.parameters.ParameterHardOfHearing parameterHardOfHearing
  + ### parameterInside

    private final zombie.audio.parameters.ParameterInside parameterInside
  + ### parameterMoodlePanic

    private final zombie.audio.parameters.ParameterMoodlePanic parameterMoodlePanic
  + ### parameterPowerSupply

    private final zombie.audio.parameters.ParameterPowerSupply parameterPowerSupply
  + ### parameterRoomSize

    private final zombie.audio.parameters.ParameterRoomSize parameterRoomSize
  + ### parameterRoomType

    private final zombie.audio.parameters.ParameterRoomType parameterRoomType
  + ### parameterRoomTypeEx

    private final zombie.audio.parameters.ParameterRoomTypeEx parameterRoomTypeEx
  + ### parameterWaterSupply

    private final zombie.audio.parameters.ParameterWaterSupply parameterWaterSupply
  + ### tempo

    private final [Vector2](iso/Vector2.html "class in zombie.iso") tempo
  + ### electricityShutOffEventCallback

    private final fmod.fmod.FMOD\_STUDIO\_EVENT\_CALLBACK electricityShutOffEventCallback
* Constructor Details
  -------------------

  + ### AmbientStreamManager

    public AmbientStreamManager()
* Method Details
  --------------

  + ### getInstance

    public static [BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie") getInstance()
  + ### update

    public void update()

    Specified by:
    :   `update` in class `BaseAmbientStreamManager`
  + ### doOneShotAmbients

    public void doOneShotAmbients()

    Specified by:
    :   `doOneShotAmbients` in class `BaseAmbientStreamManager`
  + ### addRandomAmbient

    public void addRandomAmbient()

    Specified by:
    :   `addRandomAmbient` in class `BaseAmbientStreamManager`
  + ### addRandomAmbient

    public void addRandomAmbient(boolean force)
  + ### addBlend

    public void addBlend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float vol,
    boolean bIndoors,
    boolean bRain,
    boolean bNight,
    boolean bDay)

    Specified by:
    :   `addBlend` in class `BaseAmbientStreamManager`
  + ### init

    public void init()

    Specified by:
    :   `init` in class `BaseAmbientStreamManager`
  + ### doGunEvent

    public void doGunEvent()

    Specified by:
    :   `doGunEvent` in class `BaseAmbientStreamManager`
  + ### doAlarm

    public void doAlarm([RoomDef](iso/RoomDef.html "class in zombie.iso") room)

    Specified by:
    :   `doAlarm` in class `BaseAmbientStreamManager`
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### handleThunderEvent

    public void handleThunderEvent(int x,
    int y)

    Specified by:
    :   `handleThunderEvent` in class `BaseAmbientStreamManager`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in class `BaseAmbientStreamManager`
  + ### addAmbient

    public void addAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int radius,
    float volume)

    Specified by:
    :   `addAmbient` in class `BaseAmbientStreamManager`
  + ### addAmbientEmitter

    public void addAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `addAmbientEmitter` in class `BaseAmbientStreamManager`
  + ### addDaytimeAmbientEmitter

    public void addDaytimeAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `addDaytimeAmbientEmitter` in class `BaseAmbientStreamManager`
  + ### updatePowerSupply

    private void updatePowerSupply()
  + ### checkHaveElectricity

    public void checkHaveElectricity()

    Specified by:
    :   `checkHaveElectricity` in class `BaseAmbientStreamManager`
  + ### isParameterInsideTrue

    public boolean isParameterInsideTrue()

    Specified by:
    :   `isParameterInsideTrue` in class `BaseAmbientStreamManager`
  + ### getNearestBuilding

    public static [BuildingDef](iso/BuildingDef.html "class in zombie.iso") getNearestBuilding(float px,
    float py)
  + ### getListenerPos

    private void getListenerPos([Vector2f](../org/joml/Vector2f.html "class in org.joml") pos)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)

    Specified by:
    :   `save` in class `BaseAmbientStreamManager`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)

    Specified by:
    :   `load` in class `BaseAmbientStreamManager`
  + ### updateWorldAmbiance

    private void updateWorldAmbiance()
  + ### stopWorldAmbiance

    private void stopWorldAmbiance()